# -*- coding: utf-8 -*-
"""
Schnellcheck "Sommer 2026 - ganz normal?" - Implementierung SAP v1.0 final (11.09.2026)
Software: Python 3.11 / numpy / scipy (Post-hoc-Abweichung: SAP Abschnitt 10 sieht R vor;
R und statsmodels in der Cloud-Umgebung nicht installierbar - siehe Abweichungsprotokoll).
Alle Verfahren manuell implementiert, Formeln im Code kommentiert.
"""
import json, math, sys, platform
import numpy as np, pandas as pd
from scipy import stats, optimize

OUT = "output"
SEED = 20260911
T_SCHWELLE = 19.6          # SAP E2: 19,6 °C (vorab festgelegt)
ALPHA = 0.05
log = []
def L(*a):
    s = " ".join(str(x) for x in a); print(s); log.append(s)

L("Python", sys.version.split()[0], "numpy", np.__version__, "scipy", __import__("scipy").__version__, "pandas", pd.__version__)
L("Plattform:", platform.platform())
L("Datenquelle: DWD CDC regional_averages_tm_summer.txt, Kopfzeile 'erstellt am: 20260902', Zugriff 11.09.2026 (Browser), Deutschland-Spalte")
L("Revision 1 (11.09.2026): Umsetzung Validierungsauflagen - DW zweiseitig, empirische Häufigkeit R3, Wiederkehrzeit-Klassen, KI-Grenzen im Multiplizitäts-Check, S5-Zeile Tabelle 2")

d = pd.read_csv("rohdaten/dwd_sommer_deutschland.csv")
assert list(d.jahr) == list(range(1881, 2027)), "Jahresreihe unvollständig"
Y = dict(zip(d.jahr, d.tm_sommer_de))
T2026 = Y[2026]

# ---------------- Datenintegritäts-Check (SAP 3) ----------------
m6190 = np.mean([Y[j] for j in range(1961, 1991)])
m9120 = np.mean([Y[j] for j in range(1991, 2021)])
integ = {
    "wert_2026_datei": T2026, "wert_2026_pm": 19.6, "ok_2026": round(T2026, 1) == 19.6,
    "wert_2003_datei": Y[2003], "wert_2003_pm": 19.7, "ok_2003": round(Y[2003], 1) == 19.7,
    "mittel_1961_1990": m6190, "abw_vs_6190": T2026 - m6190, "ok_abw_6190": abs((T2026 - m6190) - 3.3) <= 0.1,
    "mittel_1991_2020": m9120, "abw_vs_9120": T2026 - m9120, "ok_abw_9120": abs((T2026 - m9120) - 2.0) <= 0.1,
    "rang_2026_seit_1881": int((d.tm_sommer_de > T2026).sum() + 1),
}
L("Integritätscheck:", json.dumps(integ, default=float))
if not all(v for k, v in integ.items() if k.startswith("ok_")):
    L("INTEGRITAETSCHECK FEHLGESCHLAGEN - Analyse gestoppt (SAP 3)"); 
    open(f"{OUT}/run_log.txt", "w").write("\n".join(log)); sys.exit(1)

# ---------------- Hilfsfunktionen ----------------
X0 = 2000.0  # Zentrierung der Jahre (numerische Stabilität); Ergebnisse in Kalenderjahren

def ols(years, ys, design="linear", psi=None):
    x = np.asarray(years, float) - X0
    y = np.asarray(ys, float)
    if design == "linear":
        X = np.column_stack([np.ones_like(x), x])
    elif design == "quadratic":
        X = np.column_stack([np.ones_like(x), x, x**2])
    elif design == "segmented":
        X = np.column_stack([np.ones_like(x), x, np.clip(x - (psi - X0), 0, None)])
    n, k = X.shape
    XtXi = np.linalg.inv(X.T @ X)
    b = XtXi @ X.T @ y
    fit = X @ b
    e = y - fit
    rss = float(e @ e)
    return dict(X=X, y=y, x=x, b=b, e=e, fit=fit, n=n, k=k, rss=rss, XtXi=XtXi)

def classic_vcov(m, df):
    s2 = m["rss"] / df
    return s2 * m["XtXi"], s2

def newey_west_vcov(m, lag):
    # Bartlett-Kern, feste Lag-Zahl, Finite-Sample-Faktor n/(n-k) (vgl. sandwich adjust=TRUE)
    X, e, n, k = m["X"], m["e"], m["n"], m["k"]
    u = X * e[:, None]
    S = u.T @ u
    for l in range(1, lag + 1):
        w = 1 - l / (lag + 1)
        G = u[l:].T @ u[:-l]
        S += w * (G + G.T)
    V = m["XtXi"] @ S @ m["XtXi"]
    return V * n / (n - k)

def pred_interval(m, year, df, extra=None):
    V, s2 = classic_vcov(m, df)
    x0 = year - X0
    if extra is None:
        v = np.array([1.0, x0])
    else:
        v = extra(x0)
    yhat = float(v @ m["b"])
    h = float(v @ m["XtXi"] @ v)
    se_pred = math.sqrt(s2 * (1 + h))
    tc = stats.t.ppf(1 - ALPHA / 2, df)
    return dict(yhat=yhat, se_pred=se_pred, lo=yhat - tc * se_pred, hi=yhat + tc * se_pred, sigma=math.sqrt(s2), df=df)

def fieller(g0, g1, V, c, df):
    """KI für t mit g0 + g1*(t-X0) = c.
    Menge {t: (g0 + g1 x - c)^2 <= q * Var(g0 + g1 x)}, q = t_krit^2, x = t - X0."""
    q = stats.t.ppf(1 - ALPHA / 2, df) ** 2
    a = g1**2 - q * V[1, 1]
    bq = 2 * ((g0 - c) * g1 - q * V[0, 1])
    cc = (g0 - c)**2 - q * V[0, 0]
    point = (c - g0) / g1 + X0
    disc = bq**2 - 4 * a * cc
    if a > 0 and disc > 0:
        r = sorted([(-bq - math.sqrt(disc)) / (2 * a), (-bq + math.sqrt(disc)) / (2 * a)])
        return dict(punkt=point, lo=r[0] + X0, hi=r[1] + X0, beschraenkt=True)
    return dict(punkt=point, lo=None, hi=None, beschraenkt=False,
                hinweis="Fieller-Intervall unbeschränkt (Steigung nicht sicher von 0 verschieden)")

def einstufung(z):
    a = abs(z)
    return "im Normalbereich" if a <= 1 else "ungewöhnlich warm" if a <= 2 else "außergewöhnlich warm" if a <= 3 else "extrem außergewöhnlich"

def grenznah(z):
    return any(abs(abs(z) - g) <= 0.1 for g in (1, 2, 3))

def wiederkehr(z):
    p = 1 - stats.norm.cdf(z)
    return 1 / p if p > 0 else float("inf")

def years(a, b): return list(range(a, b + 1))

# ---------------- E1: R1 / R2 ----------------
res = {"integritaet": integ}
E1 = []
for name, a, b in [("R1 1961-1990", 1961, 1990), ("R2 1991-2020", 1991, 2020)]:
    ref = np.array([Y[j] for j in years(a, b)])
    mu, sd = ref.mean(), ref.std(ddof=1)
    z = (T2026 - mu) / sd
    rang = int((ref > T2026).sum() + 1)
    p10, p90 = np.percentile(ref, [10, 90])
    E1.append(dict(rahmen=name, referenz=float(mu), sd=float(sd), abweichung_K=float(T2026 - mu), z=float(z),
                   rang_unter_31=rang, wiederkehr_jahre=wiederkehr(z), einstufung=einstufung(z), grenznah=grenznah(z),
                   S5_p10=float(p10), S5_p90=float(p90), S5_ausserhalb_zentrale_80=bool(T2026 > p90 or T2026 < p10),
                   S5_anteil_ref_kuehler=float((ref < T2026).mean())))

# ---------------- Primärmodell 1971-2025 ----------------
def trendmodell(a, b):
    yrs = years(a, b)
    m = ols(yrs, [Y[j] for j in yrs])
    return m

def e1_r3(m, label, pi_year=2026):
    pi = pred_interval(m, pi_year, m["n"] - 2)
    z = (T2026 - pi["yhat"]) / pi["se_pred"]
    return dict(rahmen=label, referenz=pi["yhat"], sd=pi["se_pred"], abweichung_K=T2026 - pi["yhat"], z=z,
                pi95_lo=pi["lo"], pi95_hi=pi["hi"], in_pi95=bool(pi["lo"] <= T2026 <= pi["hi"]),
                wiederkehr_jahre=wiederkehr(z), einstufung=einstufung(z), grenznah=grenznah(z), sigma_res=pi["sigma"])

def e2(m, label, vcov="classic", hac_lag=None, c=T_SCHWELLE, sigma_override=None, q90=None):
    df = m["n"] - 2
    V, s2 = classic_vcov(m, df)
    if vcov == "hac":
        V = newey_west_vcov(m, hac_lag)
    sig = math.sqrt(s2) if sigma_override is None else sigma_override
    b0, b1 = m["b"]
    out = dict(modell=label, vcov=vcov, steigung_K_pro_Jahrzehnt=10 * b1,
               steigung_ki_lo=10 * (b1 - stats.t.ppf(0.975, df) * math.sqrt(V[1, 1])),
               steigung_ki_hi=10 * (b1 + stats.t.ppf(0.975, df) * math.sqrt(V[1, 1])),
               sigma_res=math.sqrt(s2))
    out["E2a"] = fieller(b0, b1, V, c, df)
    out["E2b"] = fieller(b0, b1, V, c - sig, df)
    if q90 is not None:
        out["S5_E2b_p90"] = fieller(b0, b1, V, c - q90, df)
    return out

prim = trendmodell(1971, 2025)
df_p = prim["n"] - 2
e = prim["e"]; n = prim["n"]
L(f"Primärmodell 1971-2025: n={n}, b0(2000)={prim['b'][0]:.4f}, b1={prim['b'][1]:.5f} K/Jahr")

# ---- Diagnostik (SAP 5.3) ----
H = prim["X"] @ prim["XtXi"] @ prim["X"].T
hdiag = np.diag(H)
dw = float(np.sum(np.diff(e)**2) / np.sum(e**2))
rng = np.random.default_rng(SEED)
M = np.eye(n) - H
sims = rng.standard_normal((100000, n)) @ M.T
dw_sim = np.sum(np.diff(sims, axis=1)**2, axis=1) / np.sum(sims**2, axis=1)
dw_p_pos = float(np.mean(dw_sim <= dw))  # einseitig, positive Autokorrelation (lmtest-Default)
dw_p = float(min(1.0, 2 * min(dw_p_pos, float(np.mean(dw_sim >= dw)))))  # zweiseitig laut SAP 5.5
sw = stats.shapiro(e)
def acf(x, nl):
    x = x - x.mean(); c0 = x @ x
    return np.array([1.0] + [float(x[l:] @ x[:-l] / c0) for l in range(1, nl + 1)])
def pacf_dl(r, nl):
    ph = np.zeros((nl + 1, nl + 1)); out = [1.0]
    ph[1, 1] = r[1]; out.append(r[1])
    for k in range(2, nl + 1):
        num = r[k] - sum(ph[k-1, j] * r[k-j] for j in range(1, k))
        den = 1 - sum(ph[k-1, j] * r[j] for j in range(1, k))
        ph[k, k] = num / den
        for j in range(1, k): ph[k, j] = ph[k-1, j] - ph[k, k] * ph[k-1, k-j]
        out.append(ph[k, k])
    return np.array(out)
ac = acf(e, 10); pac = pacf_dl(ac, 10)
s2p = prim["rss"] / df_p
cook = (e**2 / (prim["k"] * s2p)) * hdiag / (1 - hdiag)**2
def aic_r(m):  # wie stats::AIC für lm (inkl. Varianzparameter)
    nn, kk = m["n"], m["k"]
    return nn * math.log(2 * math.pi) + nn * math.log(m["rss"] / nn) + nn + 2 * (kk + 1)
quad = ols(years(1971, 2025), [Y[j] for j in years(1971, 2025)], design="quadratic")
diag = dict(durbin_watson=dw, dw_p_zweiseitig_mc=dw_p, dw_p_einseitig_pos_mc=dw_p_pos, dw_signifikant=dw_p < ALPHA,
            shapiro_W=float(sw.statistic), shapiro_p=float(sw.pvalue),
            acf_lag1_10=[float(v) for v in ac[1:]], pacf_lag1_10=[float(v) for v in pac[1:]], acf_grenze=1.96 / math.sqrt(n),
            aic_linear=aic_r(prim), aic_quadratisch=aic_r(quad), quad_koeff=float(quad["b"][2]),
            cook_auffaellig=[dict(jahr=int(1971 + i), D=float(cook[i])) for i in np.where(cook > 4 / n)[0]])
L("Diagnostik:", json.dumps(diag, default=float))
res["diagnostik"] = diag
hac_lag = int(math.floor(4 * (n / 100) ** (2 / 9)))

# ---- E1 R3 ----
E1.append(e1_r3(prim, "R3 Trend 1971-2025"))
q10, q90 = np.percentile(e, [10, 90])
E1[-1].update(S5_resid_p10=float(q10), S5_resid_p90=float(q90),
              S5_ausserhalb_zentrale_80=bool((T2026 - E1[-1]["referenz"]) > q90),
              S5_abstand_zu_p90_K=float(q90 - (T2026 - E1[-1]["referenz"])),
              empirisch_jahre_mind_so_weit_ueber_trend=int((e >= T2026 - E1[-1]["referenz"]).sum()), empirisch_n=int(n),
              residuen_schiefe=float(stats.skew(e, bias=False)))
res["E1"] = E1

# ---- E2 primär ----
E2 = [e2(prim, "Primär: OLS 1971-2025, Fieller", q90=float(q90))]
if diag["dw_signifikant"]:
    E2.append(e2(prim, f"Primär mit HAC (Newey-West, Lag {hac_lag}) - SAP 5.4", vcov="hac", hac_lag=hac_lag))

# ---- S1 Fenster ----
S1 = []
for a in (1961, 1991):
    m = trendmodell(a, 2025)
    S1.append(dict(E1=e1_r3(m, f"S1 Trend {a}-2025"), E2=e2(m, f"S1: OLS {a}-2025, Fieller")))
    E2.append(S1[-1]["E2"])

# ---- S2: 2026 im Fit ----
m26 = trendmodell(1971, 2026)
S2_e1 = e1_r3(m26, "S2 Trend 1971-2026 (2026 im Fit, in-sample)")
E2.append(e2(m26, "S2: OLS 1971-2026, Fieller"))

# ---- S3: segmentierte Regression 1881-2025 ----
yrs_all = years(1881, 2025); y_all = [Y[j] for j in yrs_all]
grid = np.round(np.arange(1891.0, 2015.0001, 0.1), 1)
rss_grid = [ols(yrs_all, y_all, "segmented", psi=g)["rss"] for g in grid]
psi = float(grid[int(np.argmin(rss_grid))])
seg = ols(yrs_all, y_all, "segmented", psi=psi)
df_s = seg["n"] - 4  # Bruchpunkt als geschätzter Parameter gezählt
Vs, s2s = classic_vcov(seg, df_s)
A = np.array([[1, 0, -(psi - X0)], [0, 1, 1]])   # letztes Segment: g0 + g1*x
g = A @ seg["b"]; Vg = A @ Vs @ A.T
pi_s = pred_interval(seg, 2026, df_s, extra=lambda x0: np.array([1.0, x0, max(x0 - (psi - X0), 0)]))
z_s = (T2026 - pi_s["yhat"]) / pi_s["se_pred"]
S3 = dict(bruchpunkt=psi, steigung_vorher_K_pro_Jahrzehnt=10 * seg["b"][1], steigung_nachher_K_pro_Jahrzehnt=10 * g[1],
          E1=dict(rahmen="S3 segmentiert 1881-2025", referenz=pi_s["yhat"], sd=pi_s["se_pred"], abweichung_K=T2026 - pi_s["yhat"],
                  z=z_s, pi95_lo=pi_s["lo"], pi95_hi=pi_s["hi"], in_pi95=bool(pi_s["lo"] <= T2026 <= pi_s["hi"]),
                  wiederkehr_jahre=wiederkehr(z_s), einstufung=einstufung(z_s), grenznah=grenznah(z_s)),
          hinweis="Intervalle bedingt auf geschätzten Bruchpunkt (Bruchpunkt-Unsicherheit nicht enthalten)")
E2.append(dict(modell=f"S3: segmentiert 1881-2025 (Bruch {psi:.1f}), letztes Segment, Fieller", vcov="classic",
               steigung_K_pro_Jahrzehnt=10 * g[1], sigma_res=math.sqrt(s2s),
               E2a=fieller(g[0], g[1], Vg, T_SCHWELLE, df_s), E2b=fieller(g[0], g[1], Vg, T_SCHWELLE - math.sqrt(s2s), df_s)))

# ---- S4: ARIMA mit Drift (auto.arima-Nachbau, CSS-Schätzung) ----
def kpss_level(x):
    x = np.asarray(x, float); nn = len(x)
    u = x - x.mean(); S = np.cumsum(u)
    lag = int(math.trunc(4 * (nn / 100) ** 0.25))
    s2 = u @ u / nn
    for l in range(1, lag + 1):
        s2 += 2 * (1 - l / (lag + 1)) * (u[l:] @ u[:-l]) / nn
    return float((S @ S) / (nn**2 * s2)), lag

def arma_css_resid(w, phi, theta, mean):
    u = w - mean; p, q = len(phi), len(theta)
    ee = np.zeros_like(u)
    for t in range(len(u)):
        ar = sum(phi[i] * u[t-1-i] for i in range(p) if t-1-i >= 0)
        ma = sum(theta[j] * ee[t-1-j] for j in range(q) if t-1-j >= 0)
        ee[t] = u[t] - ar - ma
    return ee[p:]

def stationaer(coefs):
    if len(coefs) == 0: return True
    r = np.roots(np.r_[1, -np.asarray(coefs)][::-1])  # 1 - c1 z - ... -> Wurzeln außerhalb Einheitskreis
    return bool(np.all(np.abs(r) > 1.0001))

def fit_arima(y, p, dd, q):
    y = np.asarray(y, float)
    if dd == 1:
        w = np.diff(y); tt = None
    else:
        w = y; tt = np.arange(len(y), dtype=float)
    def obj(par):
        phi = par[:p]; theta = par[p:p+q]
        if not stationaer(phi) or not stationaer(-np.asarray(theta)): return 1e10
        if dd == 1: mean = par[p+q]
        else: mean = par[p+q] + par[p+q+1] * tt
        r = arma_css_resid(w, phi, theta, mean)
        return float(r @ r)
    if dd == 1: start = np.r_[np.zeros(p+q), w.mean()]
    else:
        bb = np.polyfit(tt, w, 1); start = np.r_[np.zeros(p+q), bb[1], bb[0]]
    best = None
    for s in range(5):
        st = start if s == 0 else start + np.r_[np.random.default_rng(SEED+s).uniform(-0.5, 0.5, p+q), np.zeros(len(start)-p-q)]
        o = optimize.minimize(obj, st, method="Nelder-Mead", options=dict(maxiter=20000, xatol=1e-8, fatol=1e-10))
        if best is None or o.fun < best.fun: best = o
    par = best.x; phi = par[:p]; theta = par[p:p+q]
    mm = len(w) - p
    s2 = best.fun / mm
    kpar = p + q + (1 if dd == 1 else 2) + 1
    ll = -0.5 * mm * (math.log(2 * math.pi * s2) + 1)
    aicc = -2 * ll + 2 * kpar + 2 * kpar * (kpar + 1) / max(mm - kpar - 1, 1)
    return dict(p=p, d=dd, q=q, par=par, phi=phi, theta=theta, s2=s2, aicc=aicc, w=w)

def arima_forecast(fitm, y, H):
    y = np.asarray(y, float); p, q, dd = fitm["p"], fitm["q"], fitm["d"]
    phi, theta, par = fitm["phi"], fitm["theta"], fitm["par"]
    w = fitm["w"]; nn = len(y)
    if dd == 1: mean_f = lambda t: par[p+q]
    else: mean_f = lambda t: par[p+q] + par[p+q+1] * t
    tt_w = np.arange(len(w)) if dd == 0 else None
    mean_hist = np.array([mean_f(t) for t in range(len(w))])
    u = list(w - mean_hist)
    ee = list(np.r_[np.zeros(p), arma_css_resid(w, phi, theta, mean_hist)])
    uf = []
    for h in range(1, H + 1):
        idx = len(u)
        ar = sum(phi[i] * u[idx-1-i] for i in range(p))
        ma = sum(theta[j] * ee[idx-1-j] for j in range(q) if idx-1-j < len(ee) and idx-1-j >= 0)
        u.append(ar + ma); ee.append(0.0); uf.append(ar + ma)
    wf = np.array([uf[h-1] + mean_f(len(w) - 1 + h) for h in range(1, H + 1)])
    # psi-Gewichte
    psi_w = [1.0]
    for j in range(1, H):
        v = (theta[j-1] if j-1 < q else 0.0) + sum(phi[i] * psi_w[j-1-i] for i in range(p) if j-1-i >= 0)
        psi_w.append(v)
    psi_w = np.array(psi_w)
    if dd == 1:
        yf = y[-1] + np.cumsum(wf)
        cum = np.cumsum(psi_w)
        var = fitm["s2"] * np.cumsum(cum**2)
    else:
        yf = wf
        var = fitm["s2"] * np.cumsum(psi_w**2)
    return yf, np.sqrt(var)

y_prim = np.array([Y[j] for j in years(1971, 2025)])
kstat, klag = kpss_level(y_prim)
d_sel = 1 if kstat > 0.463 else 0
cands = []
for p in range(0, 3):
    for q in range(0, 3):
        try: cands.append(fit_arima(y_prim, p, d_sel, q))
        except Exception as ex: L("ARIMA-Fit fehlgeschlagen", p, d_sel, q, ex)
best = min(cands, key=lambda c: c["aicc"])
H = 2150 - 2025
yf, sef = arima_forecast(best, y_prim, H)
fyears = np.arange(2026, 2026 + H)
zq = stats.norm.ppf(0.975)
reach = [int(fyears[i]) for i in range(H) if yf[i] >= T_SCHWELLE]
S4 = dict(kpss_level_stat=kstat, kpss_lag=klag, kpss_krit_5pct=0.463, d=d_sel,
          modell=f"ARIMA({best['p']},{best['d']},{best['q']}) mit {'Drift' if d_sel==1 else 'Trend'} (CSS, AICc-Auswahl p,q<=2)",
          aicc_tabelle=[dict(p=c["p"], q=c["q"], aicc=c["aicc"]) for c in cands],
          prognose_2026=float(yf[0]), pi95_2026=[float(yf[0] - zq*sef[0]), float(yf[0] + zq*sef[0])],
          in_pi95=bool(yf[0] - zq*sef[0] <= T2026 <= yf[0] + zq*sef[0]),
          z_2026=float((T2026 - yf[0]) / sef[0]),
          jahr_prognose_erreicht_19_6=reach[0] if reach else None,
          drift_K_pro_Jahrzehnt=float(10 * best["par"][best["p"]+best["q"]]) if d_sel == 1 else float(10 * best["par"][best["p"]+best["q"]+1]))
S4["einstufung_2026"] = einstufung(S4["z_2026"])
E2.append(dict(modell="S4: " + S4["modell"], E2a=dict(punkt=S4["jahr_prognose_erreicht_19_6"], lo=None, hi=None, beschraenkt=None,
                                                  hinweis="Punktprognose erreicht 19,6 °C (kein KI im SAP vorgesehen)")))

# ---- S6: Residuen-Bootstrap ----
rng = np.random.default_rng(SEED)
B = 10000
fitv, ee0 = prim["fit"], prim["e"]
ts, tss, nonpos = [], [], 0
Xp, XtXi_p = prim["X"], prim["XtXi"]
for _ in range(B):
    ystar = fitv + rng.choice(ee0, size=n, replace=True)
    bs = XtXi_p @ Xp.T @ ystar
    rs = ystar - Xp @ bs
    sig = math.sqrt(rs @ rs / df_p)
    if bs[1] <= 0: nonpos += 1; continue
    ts.append((T_SCHWELLE - bs[0]) / bs[1] + X0)
    tss.append((T_SCHWELLE - sig - bs[0]) / bs[1] + X0)
S6 = dict(B=B, seed=SEED, anteil_steigung_nicht_positiv=nonpos / B,
          E2a_ki=[float(np.percentile(ts, 2.5)), float(np.percentile(ts, 97.5))], E2a_median=float(np.median(ts)),
          E2b_ki=[float(np.percentile(tss, 2.5)), float(np.percentile(tss, 97.5))], E2b_median=float(np.median(tss)))
E2.append(dict(modell="S6: Residuen-Bootstrap (B=10.000) um Primärmodell",
               E2a=dict(punkt=S6["E2a_median"], lo=S6["E2a_ki"][0], hi=S6["E2a_ki"][1], beschraenkt=True, hinweis="Median + Perzentil-KI"),
               E2b=dict(punkt=S6["E2b_median"], lo=S6["E2b_ki"][0], hi=S6["E2b_ki"][1], beschraenkt=True, hinweis="Median + Perzentil-KI, inkl. Unsicherheit sigma")))

# ---- Post-hoc-Zusatz (nicht im SAP): Schwelle = Dateiwert 19,55 ----
posthoc = e2(prim, "POST-HOC (nicht präregistriert): Schwelle 19,55 °C statt 19,6 °C", c=T2026)

# ---- Multiplizitäts-Check (SAP 7): Abweichung > 10 Jahre vom Primärergebnis ----
flags, flags_ki = [], []
for r in E2[1:]:
    for key in ("E2a", "E2b"):
        if key not in r: continue
        ref = E2[0][key]
        if r[key].get("punkt") is not None and abs(r[key]["punkt"] - ref["punkt"]) > 10:
            flags.append(dict(modell=r["modell"], estimand=key, punkt=r[key]["punkt"], primaer=ref["punkt"], differenz=r[key]["punkt"] - ref["punkt"]))
        for bnd in ("lo", "hi"):
            if r[key].get(bnd) is not None and abs(r[key][bnd] - ref[bnd]) > 10:
                flags_ki.append(dict(modell=r["modell"], estimand=key, grenze=bnd, wert=r[key][bnd], primaer=ref[bnd], differenz=r[key][bnd] - ref[bnd]))
bezug_2056 = dict(E2a_2056_im_KI=bool(E2[0]["E2a"]["beschraenkt"] and E2[0]["E2a"]["lo"] <= 2056 <= E2[0]["E2a"]["hi"]),
                  E2b_2056_im_KI=bool(E2[0]["E2b"]["beschraenkt"] and E2[0]["E2b"]["lo"] <= 2056 <= E2[0]["E2b"]["hi"]))

res.update(E2=E2, S1=S1, S2_E1=S2_e1, S3=S3, S4=S4, S6=S6, posthoc_schwelle_1955=posthoc,
           multiplizitaet_abweichung_gt_10J=flags, multiplizitaet_ki_grenzen_gt_10J=flags_ki, abgleich_in_30_jahren_2056=bezug_2056, hac_lag=hac_lag)

def clean(o):
    if isinstance(o, dict): return {k: clean(v) for k, v in o.items()}
    if isinstance(o, (list, tuple)): return [clean(v) for v in o]
    if isinstance(o, (np.floating,)): return float(o)
    if isinstance(o, (np.integer,)): return int(o)
    if isinstance(o, (np.bool_,)): return bool(o)
    if isinstance(o, float) and math.isinf(o): return "inf"
    return o
json.dump(clean(res), open(f"{OUT}/ergebnisse.json", "w"), ensure_ascii=False, indent=2)

# Tabellen (SAP 11, Rundung)
def r1(v): return None if v is None else round(float(v), 1)
def wk(v):
    # Nur grobe Klassen (SAP 5.4 bei Nicht-Normalität; SD aus n=30 unsicher)
    if v >= 1000: return "über 1000 Jahre (nicht belastbar)"
    if v >= 30: return "Größenordnung 100 Jahre (nicht belastbar)"
    return "Größenordnung 10 Jahre (nicht belastbar)"
t1 = []
for r in E1 + [S2_e1, S3["E1"], dict(rahmen="S4 " + S4["modell"], referenz=S4["prognose_2026"], abweichung_K=T2026 - S4["prognose_2026"], z=S4["z_2026"], einstufung=S4["einstufung_2026"])]:
    t1.append(dict(Rahmen=r["rahmen"], Referenzwert_C=r1(r["referenz"]), Abweichung_K=r1(r["abweichung_K"]), z=r1(r["z"]),
                   Rang=str(r["rang_unter_31"]) if "rang_unter_31" in r else "", PI95=f"{r1(r['pi95_lo'])}–{r1(r['pi95_hi'])}" if "pi95_lo" in r else "",
                   Wiederkehr_Normalannahme=wk(r["wiederkehr_jahre"]) if "wiederkehr_jahre" in r else "",
                   Empirisch=(f"{r['empirisch_jahre_mind_so_weit_ueber_trend']} von {r['empirisch_n']} Sommern mind. so weit über Trend" if "empirisch_n" in r else (f"Rang {r['rang_unter_31']} von 31" if "rang_unter_31" in r else "")),
                   Einstufung_z_Konvention=r["einstufung"], S5_ausserhalb_zentrale_80=r.get("S5_ausserhalb_zentrale_80", ""), Grenznah=r.get("grenznah", "")))
pd.DataFrame(t1).to_csv(f"{OUT}/tabelle1_E1.csv", index=False)
t2 = []
for r in E2:
    row = dict(Modell=r["modell"], Steigung_K_pro_Jahrzehnt=r1(r.get("steigung_K_pro_Jahrzehnt")))
    for key in ("E2a", "E2b"):
        if key in r:
            f = r[key]
            row[key] = "" if f.get("punkt") is None else str(int(round(f["punkt"])))
            row[key + "_KI95"] = f"{int(round(f['lo']))}–{int(round(f['hi']))}" if f.get("lo") is not None else ("unbeschränkt" if f.get("beschraenkt") is False else "")
    t2.append(row)
s5 = E2[0]["S5_E2b_p90"]
t2.append(dict(Modell="S5: Perzentil-Definition E2b (19,6 °C <= Trend + 90.-Perzentil der Residuen), Fieller", Steigung_K_pro_Jahrzehnt=r1(E2[0]["steigung_K_pro_Jahrzehnt"]),
               E2a="", E2a_KI95="", E2b=str(int(round(s5["punkt"]))), E2b_KI95=f"{int(round(s5['lo']))}–{int(round(s5['hi']))}"))
pd.DataFrame(t2).to_csv(f"{OUT}/tabelle2_E2.csv", index=False)
L("E1:", json.dumps(clean(E1), ensure_ascii=False))
L("E2 primär:", json.dumps(clean(E2[0]), ensure_ascii=False))
L("Abgleich 2056:", bezug_2056, "Flags >10J Punkt:", json.dumps(clean(flags), ensure_ascii=False), "Flags >10J KI-Grenzen:", json.dumps(clean(flags_ki), ensure_ascii=False))
open(f"{OUT}/run_log.txt", "w").write("\n".join(log))
