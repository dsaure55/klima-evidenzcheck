#!/usr/bin/env python3
"""
Unabhaengige Validierung - Schnellcheck "sommer-2026-normal"
Rolle: validator (unabhaengiger Agent), 11.09.2026

Neu geschrieben ausschliesslich auf Basis von SAP v1.0 final und der Rohdatei,
OHNE Einsicht in Code/Output/Bericht des Analysten.
Software: Python 3, numpy, scipy, pandas (R/statsmodels nicht verfuegbar).
"""
import json
import math
from pathlib import Path

import numpy as np
import pandas as pd
from scipy import stats, optimize

HIER = Path(__file__).resolve().parent
DATEI = HIER.parent / "rohdaten" / "dwd_sommer_deutschland.csv"
SEED = 20260911
SCHWELLE = 19.6          # laut SAP 5.2 fester Wert 19,6 °C
ALPHA = 0.05

df = pd.read_csv(DATEI)
df.columns = ["jahr", "t"]
y_all = dict(zip(df.jahr.astype(int), df.t.astype(float)))
T26 = y_all[2026]

out = {}

# ---------------------------------------------------------------- SAP 3 Integritaet
jahre = df.jahr.values
integ = {
    "n_zeilen": int(len(df)),
    "jahr_min": int(jahre.min()), "jahr_max": int(jahre.max()),
    "lueckenlos": bool(np.all(np.diff(jahre) == 1)),
    "fehlwerte": int(df.t.isna().sum()),
    "wert_2026": T26, "wert_2026_gerundet": float(np.round(T26, 1)),
    "wert_2003": y_all[2003], "wert_2003_gerundet": float(np.round(y_all[2003], 1)),
}
m6190 = np.mean([y_all[j] for j in range(1961, 1991)])
m9120 = np.mean([y_all[j] for j in range(1991, 2021)])
integ["mittel_1961_1990"] = m6190
integ["mittel_1991_2020"] = m9120
integ["abw_2026_vs_6190"] = T26 - m6190
integ["abw_2026_vs_9120"] = T26 - m9120
integ["a_ok"] = bool(round(T26, 1) == 19.6 and round(y_all[2003], 1) == 19.7)
integ["b_ok"] = bool(abs(integ["abw_2026_vs_6190"] - 3.3) <= 0.1 + 1e-9
                     and abs(integ["abw_2026_vs_9120"] - 2.0) <= 0.1 + 1e-9)
# Rang 2026 in der Gesamtreihe
reihe = df.t.values
integ["rang_2026_gesamt"] = int(1 + np.sum(reihe > T26))
out["integritaet"] = integ


def einstufung(z):
    a = abs(z)
    if a <= 1:
        return "im Normalbereich"
    if a <= 2:
        return "ungewöhnlich warm"
    if a <= 3:
        return "außergewöhnlich warm"
    return "extrem außergewöhnlich"


def wiederkehr(z):
    return 1.0 / stats.norm.sf(z)


# ---------------------------------------------------------------- OLS-Hilfen
def ols(j0, j1, mit2026=False):
    xs = np.arange(j0, j1 + 1)
    ys = np.array([y_all[j] for j in xs])
    n = len(xs)
    xbar = xs.mean()
    u = xs - xbar
    Sxx = np.sum(u ** 2)
    b1 = np.sum(u * (ys - ys.mean())) / Sxx
    a = ys.mean()                      # Achsenabschnitt in zentrierter Form
    b0 = a - b1 * xbar
    fit = a + b1 * u
    res = ys - fit
    dfree = n - 2
    s2 = np.sum(res ** 2) / dfree
    s = math.sqrt(s2)
    se_b1 = math.sqrt(s2 / Sxx)
    return dict(xs=xs, ys=ys, n=n, xbar=xbar, Sxx=Sxx, b0=b0, b1=b1, a=a,
                fit=fit, res=res, df=dfree, s=s, s2=s2, se_b1=se_b1)


def prognose(m, x0, level=0.95):
    h = 1.0 / m["n"] + (x0 - m["xbar"]) ** 2 / m["Sxx"]
    yhat = m["a"] + m["b1"] * (x0 - m["xbar"])
    se_pred = m["s"] * math.sqrt(1 + h)
    tq = stats.t.ppf(1 - (1 - level) / 2, m["df"])
    return dict(yhat=yhat, h=h, se_pred=se_pred,
                pi_lo=yhat - tq * se_pred, pi_hi=yhat + tq * se_pred)


def fieller(m, c, V=None, tq=None):
    """Loese (a + b1*u - c)^2 = t^2 * (Vaa + 2u Vab + u^2 Vbb), u = x - xbar.
    V ist die Kovarianzmatrix von (a, b1) in zentrierter Parametrisierung."""
    if V is None:
        V = np.array([[m["s2"] / m["n"], 0.0], [0.0, m["s2"] / m["Sxx"]]])
    if tq is None:
        tq = stats.t.ppf(1 - ALPHA / 2, m["df"])
    a, b1 = m["a"], m["b1"]
    d = a - c
    A = b1 ** 2 - tq ** 2 * V[1, 1]
    B = 2 * (b1 * d - tq ** 2 * V[0, 1])
    C = d ** 2 - tq ** 2 * V[0, 0]
    punkt = m["xbar"] + (c - a) / b1
    disc = B ** 2 - 4 * A * C
    if A <= 0:
        return dict(punkt=punkt, lo=None, hi=None, beschraenkt=False)
    r1 = (-B - math.sqrt(disc)) / (2 * A)
    r2 = (-B + math.sqrt(disc)) / (2 * A)
    lo, hi = sorted([r1, r2])
    return dict(punkt=punkt, lo=m["xbar"] + lo, hi=m["xbar"] + hi, beschraenkt=True)


def e2(m):
    ea = fieller(m, SCHWELLE)
    eb = fieller(m, SCHWELLE - m["s"])
    return dict(b1_pro_dekade=10 * m["b1"], sigma=m["s"], n=m["n"],
                t_stern=ea, t_2stern=eb)


# ---------------------------------------------------------------- E1 R1/R2
def ref_rahmen(j0, j1):
    vals = np.array([y_all[j] for j in range(j0, j1 + 1)])
    mw = vals.mean()
    sd = vals.std(ddof=1)
    z = (T26 - mw) / sd
    alle = np.append(vals, T26)
    rang = int(1 + np.sum(alle > T26))      # 1 = waermster von 31
    p10, p90 = np.percentile(vals, [10, 90])  # numpy linear = R type 7
    return dict(mittel=mw, sd=sd, abweichung=T26 - mw, z=z, rang=rang, von=len(alle),
                wiederkehr=wiederkehr(z), einstufung=einstufung(z),
                max_referenz=vals.max(),
                s5_p10=p10, s5_p90=p90, s5_innerhalb_80=bool(p10 <= T26 <= p90))


out["E1_R1"] = ref_rahmen(1961, 1990)
out["E1_R2"] = ref_rahmen(1991, 2020)

# ---------------------------------------------------------------- Primaermodell
P = ols(1971, 2025)
pg = prognose(P, 2026)
zR3 = (T26 - pg["yhat"]) / pg["se_pred"]
tq53 = stats.t.ppf(0.975, P["df"])
out["primaermodell"] = dict(n=P["n"], df=P["df"], b0=P["b0"], b1=P["b1"],
                            b1_pro_dekade=10 * P["b1"], se_b1=P["se_b1"],
                            b1_ki=[P["b1"] - tq53 * P["se_b1"], P["b1"] + tq53 * P["se_b1"]],
                            p_b1=2 * stats.t.sf(abs(P["b1"] / P["se_b1"]), P["df"]),
                            sigma=P["s"], t_quantil=tq53)
# R3: Rang von 2026 innerhalb der Residuen (informativ, SAP verlangt Rang nur fuer R1/R2)
res_2026 = T26 - pg["yhat"]
p10r, p90r = np.percentile(P["res"], [10, 90])
out["E1_R3"] = dict(yhat=pg["yhat"], abweichung=res_2026, h2026=pg["h"],
                    se_pred=pg["se_pred"], pi95=[pg["pi_lo"], pg["pi_hi"]],
                    in_pi=bool(pg["pi_lo"] <= T26 <= pg["pi_hi"]),
                    z=zR3, wiederkehr=wiederkehr(zR3), einstufung=einstufung(zR3),
                    z_nahe_grenze=bool(min(abs(abs(zR3) - g) for g in (1, 2, 3)) <= 0.1),
                    s5_res_p10=p10r, s5_res_p90=p90r,
                    s5_innerhalb_80=bool(p10r <= res_2026 <= p90r),
                    rang_residuum_2026_unter_56=int(1 + np.sum(P["res"] > res_2026)))
for k in ("E1_R1", "E1_R2"):
    z = out[k]["z"]
    out[k]["z_nahe_grenze"] = bool(min(abs(abs(z) - g) for g in (1, 2, 3)) <= 0.1)

# E2 Primaer
out["E2_primaer"] = e2(P)
# Sensitivitaet: Schwelle = exakter Dateiwert 19,55 statt 19,6
out["E2_primaer_schwelle_1955"] = dict(
    t_stern=fieller(P, T26), t_2stern=fieller(P, T26 - P["s"]))

# ---------------------------------------------------------------- Diagnostik
res = P["res"]
dw = np.sum(np.diff(res) ** 2) / np.sum(res ** 2)
# exakte DW-Verteilung unter H0 per Monte Carlo (haengt nur von X ab)
rng = np.random.default_rng(SEED)
X = np.column_stack([np.ones(P["n"]), P["xs"] - P["xbar"]])
M = np.eye(P["n"]) - X @ np.linalg.solve(X.T @ X, X.T)
E = rng.standard_normal((200000, P["n"])) @ M.T
dw_sim = np.sum(np.diff(E, axis=1) ** 2, axis=1) / np.sum(E ** 2, axis=1)
p_dw_greater = float(np.mean(dw_sim <= dw))      # H1: positive Autokorrelation (lmtest-Default)
p_dw_zweiseitig = float(2 * min(p_dw_greater, 1 - p_dw_greater))
sw = stats.shapiro(res)
# Lag-1-Autokorrelation und ACF
def acf(x, k):
    x = x - x.mean()
    return float(np.sum(x[k:] * x[:-k]) / np.sum(x ** 2))
acfs = {k: acf(res, k) for k in range(1, 6)}
# AIC linear vs quadratisch (Gauss-Loglik wie R: logLik mit sigma_ML, k = Parameter + 1)
def aic_poly(deg):
    xs = P["xs"] - P["xbar"]
    Xp = np.column_stack([xs ** d for d in range(deg + 1)])
    beta, *_ = np.linalg.lstsq(Xp, P["ys"], rcond=None)
    r = P["ys"] - Xp @ beta
    n = P["n"]
    ll = -n / 2 * (math.log(2 * math.pi) + math.log(np.sum(r ** 2) / n) + 1)
    return -2 * ll + 2 * (deg + 2)
# Cook's Distance
hii = 1 / P["n"] + (P["xs"] - P["xbar"]) ** 2 / P["Sxx"]
cook = res ** 2 / (2 * P["s2"]) * hii / (1 - hii) ** 2
cook_auff = [(int(j), float(c)) for j, c in zip(P["xs"], cook) if c > 4 / P["n"]]
out["diagnostik"] = dict(dw=dw, p_dw_einseitig_positiv=p_dw_greater,
                         p_dw_zweiseitig=p_dw_zweiseitig,
                         dw_bounds_n55_k1_5pct="dL~1.53, dU~1.60 (Tabelle Savin-White, einseitig)",
                         shapiro_W=float(sw.statistic), shapiro_p=float(sw.pvalue),
                         acf=acfs, aic_linear=aic_poly(1), aic_quadratisch=aic_poly(2),
                         cook_4_durch_n=cook_auff,
                         schiefe=float(stats.skew(res)), kurtosis_exzess=float(stats.kurtosis(res)))

# ---------------------------------------------------------------- Newey-West (nur falls DW signifikant)
def newey_west_V(m, lag):
    Xc = np.column_stack([np.ones(m["n"]), m["xs"] - m["xbar"]])
    e = m["res"]
    g = Xc * e[:, None]
    S = g.T @ g
    for L in range(1, lag + 1):
        w = 1 - L / (lag + 1)
        G = g[L:].T @ g[:-L]
        S += w * (G + G.T)
    XtXi = np.linalg.inv(Xc.T @ Xc)
    return XtXi @ S @ XtXi
nw = {}
for lag in (1, 3, 4):
    V = newey_west_V(P, lag)
    nw[f"lag{lag}"] = dict(se_b1=math.sqrt(V[1, 1]),
                           t_stern=fieller(P, SCHWELLE, V=V),
                           t_2stern=fieller(P, SCHWELLE - P["s"], V=V))
out["newey_west_info"] = nw

# ---------------------------------------------------------------- S1 / S2
out["S1_1961_2025"] = e2(ols(1961, 2025))
out["S1_1991_2025"] = e2(ols(1991, 2025))
S2 = ols(1971, 2026)
out["S2_1971_2026"] = e2(S2)
# R3 fuer Sensitivitaetsfenster
for key, (j0, j1) in {"S1_1961_2025": (1961, 2025), "S1_1991_2025": (1991, 2025)}.items():
    mm = ols(j0, j1)
    pp = prognose(mm, 2026)
    zz = (T26 - pp["yhat"]) / pp["se_pred"]
    out[key]["R3"] = dict(yhat=pp["yhat"], pi95=[pp["pi_lo"], pp["pi_hi"]], z=zz,
                          einstufung=einstufung(zz))
# S2: 2026 im Fit -> Residuum-z in-sample (nur informativ)
pp2 = prognose(S2, 2026)
out["S2_1971_2026"]["R3_insample"] = dict(yhat=pp2["yhat"], sigma=S2["s"],
                                          z_naiv=(T26 - pp2["yhat"]) / S2["s"])

# ---------------------------------------------------------------- S5 Perzentil fuer E2b
# "normal" = innerhalb 10.-90. Perzentil der Residuen um den Trend:
# Trend + P90(Residuen) >= 19,6  <=>  Trend >= 19,6 - P90
q90 = float(np.percentile(P["res"], 90))
q10 = float(np.percentile(P["res"], 10))
s5 = fieller(P, SCHWELLE - q90)
out["S5_E2b_perzentil"] = dict(p90_res=q90, p10_res=q10, sigma=P["s"], t_2stern=s5)

# ---------------------------------------------------------------- S6 Residuen-Bootstrap
B = 10000
rng = np.random.default_rng(SEED)
fit = P["fit"]
u = P["xs"] - P["xbar"]
ts, tss = np.empty(B), np.empty(B)
neg = 0
for b in range(B):
    ystar = fit + rng.choice(res, size=P["n"], replace=True)
    b1s = np.sum(u * (ystar - ystar.mean())) / P["Sxx"]
    a_s = ystar.mean()
    rs = ystar - (a_s + b1s * u)
    ss = math.sqrt(np.sum(rs ** 2) / P["df"])
    if b1s <= 0:
        neg += 1
    ts[b] = P["xbar"] + (SCHWELLE - a_s) / b1s
    tss[b] = P["xbar"] + (SCHWELLE - ss - a_s) / b1s
out["S6_bootstrap"] = dict(B=B, seed=SEED, b1_nichtpositiv=neg,
                           t_stern_ki=list(np.percentile(ts, [2.5, 97.5])),
                           t_stern_median=float(np.median(ts)),
                           t_2stern_ki=list(np.percentile(tss, [2.5, 97.5])),
                           t_2stern_median=float(np.median(tss)))

# ---------------------------------------------------------------- S3 Plausibilitaet (Gittersuche Bruchpunkt)
xs = np.arange(1881, 2026)
ys = np.array([y_all[j] for j in xs])
best = None
for psi in np.arange(1900, 2011, 0.25):
    Xs = np.column_stack([np.ones(len(xs)), xs - 1881, np.clip(xs - psi, 0, None)])
    beta, *_ = np.linalg.lstsq(Xs, ys, rcond=None)
    rss = np.sum((ys - Xs @ beta) ** 2)
    if best is None or rss < best[0]:
        best = (rss, psi, beta)
rss, psi, beta = best
slope2 = beta[1] + beta[2]
lvl = lambda x: beta[0] + beta[1] * (x - 1881) + beta[2] * max(x - psi, 0)
sig3 = math.sqrt(rss / (len(xs) - 4))
t3 = psi + (SCHWELLE - lvl(psi)) / slope2
t33 = psi + (SCHWELLE - sig3 - lvl(psi)) / slope2
out["S3_plausibilitaet"] = dict(bruchpunkt=float(psi), steigung_seg1_pro_dekade=10 * beta[1],
                                steigung_seg2_pro_dekade=10 * slope2, sigma=sig3,
                                yhat_2026=lvl(2026), t_stern=t3, t_2stern=t33)

# ---------------------------------------------------------------- S4 Plausibilitaet
# (a) ARIMA(0,1,1) mit Drift per CSS; (b) Random Walk mit Drift
yy = np.array([y_all[j] for j in range(1971, 2026)])
dy = np.diff(yy)
def css(par):
    mu, th = par
    e = np.zeros(len(dy))
    for i in range(len(dy)):
        e[i] = dy[i] - mu - (th * e[i - 1] if i > 0 else 0)
    return np.sum(e ** 2)
opt = optimize.minimize(css, x0=[0.03, -0.8], bounds=[(-1, 1), (-0.999, 0.999)])
mu, th = opt.x
e = np.zeros(len(dy))
for i in range(len(dy)):
    e[i] = dy[i] - mu - (th * e[i - 1] if i > 0 else 0)
s_ma = math.sqrt(np.sum(e ** 2) / (len(dy) - 2))
f2026 = yy[-1] + mu + th * e[-1]
# Prognosefehler-SD h=1 = s; allgemeine h: s*sqrt(1 + (h-1)(1+th)^2)
jahr_196 = 2026 + (SCHWELLE - f2026) / mu
out["S4_plausibilitaet"] = dict(
    arima011_drift=dict(drift_pro_dekade=10 * mu, theta=th, sigma=s_ma,
                        prognose_2026=f2026,
                        pi95_2026=[f2026 - 1.96 * s_ma, f2026 + 1.96 * s_ma],
                        jahr_prognose_196=jahr_196),
    rw_drift=dict(drift_pro_dekade=10 * dy.mean(),
                  prognose_2026=yy[-1] + dy.mean(),
                  jahr_prognose_196=2025 + (SCHWELLE - yy[-1]) / dy.mean()),
    wn_trend_eq_ols=dict(jahr_prognose_196=out["E2_primaer"]["t_stern"]["punkt"]))


# ---------------------------------------------------------------- Ausgabe
def conv(o):
    if isinstance(o, dict):
        return {str(k): conv(v) for k, v in o.items()}
    if isinstance(o, (list, tuple)):
        return [conv(v) for v in o]
    if isinstance(o, (np.floating,)):
        return float(o)
    if isinstance(o, (np.integer,)):
        return int(o)
    if isinstance(o, np.bool_):
        return bool(o)
    return o

(HIER / "validierung_ergebnisse.json").write_text(
    json.dumps(conv(out), indent=2, ensure_ascii=False), encoding="utf-8")
print(json.dumps(conv(out), indent=2, ensure_ascii=False))


# ---------------------------------------------------------------- Nachtrag: S6 mit anderen Seeds / reskalierten Residuen
def boot(seed, rescale=False, B=10000):
    r = np.random.default_rng(seed)
    pool = res * math.sqrt(P["n"] / P["df"]) if rescale else res
    ta, tb = np.empty(B), np.empty(B)
    for i in range(B):
        ystar = fit + r.choice(pool, size=P["n"], replace=True)
        b1s = np.sum(u * (ystar - ystar.mean())) / P["Sxx"]
        a_s = ystar.mean()
        ss = math.sqrt(np.sum((ystar - a_s - b1s * u) ** 2) / P["df"])
        ta[i] = P["xbar"] + (SCHWELLE - a_s) / b1s
        tb[i] = P["xbar"] + (SCHWELLE - ss - a_s) / b1s
    return dict(seed=seed, reskaliert=rescale,
                t_stern_ki=[float(v) for v in np.percentile(ta, [2.5, 97.5])],
                t_2stern_ki=[float(v) for v in np.percentile(tb, [2.5, 97.5])])
nachtrag = [boot(1), boot(987654), boot(1, rescale=True)]
print(json.dumps(nachtrag, indent=1))
out["S6_nachtrag_andere_seeds"] = nachtrag
(HIER / "validierung_ergebnisse.json").write_text(
    json.dumps(conv(out), indent=2, ensure_ascii=False), encoding="utf-8")
