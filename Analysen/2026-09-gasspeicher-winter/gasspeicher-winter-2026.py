"""Klima Evidenzcheck - Schnellcheck Gasspeicher Winter 2026/27
Analyse gemaess SAP v1.0 (eingefroren 14.09.2026).
Abweichung zu SAP Abschnitt 10: Python statt R (R in der Cloud-Session nicht
verfuegbar, statsmodels nicht installierbar). OLS, Konfidenz- und
Prognoseintervalle mit numpy/scipy von Hand; Clopper-Pearson ueber scipy.stats.beta.
"""
import csv, calendar, collections
import numpy as np
from scipy import stats

TWH_PER_TJ = 1 / 3600.0
CLAIM_STOCK = 136.0          # TWh, Aussage Bundesnetzagentur 12./13.09.2026
CLAIM_LAST_WINTER = 134.0    # TWh, "knapp 134" Entnahme Winter 2025/26

# ---------------------------------------------------------------- Daten laden
def load_temp(path):
    d = {}
    for line in open(path, encoding='utf-8'):
        if line.startswith('#') or line.startswith('jahr') or not line.strip():
            continue
        j, m, t = line.strip().split(';')
        d[(int(j), int(m))] = float(t)
    return d

def load_gas(path):
    """Laedt TJ_GCV-Werte als TWh.

    Korrektur nach Validierung 14.09.2026: Nullwerte in TI_EHG_MAP sind
    Meldeluecken, keine echten Nullen (43 Monate). Sie werden als fehlend
    behandelt, sonst entstehen kuenstlich niedrige Wintersummen.
    """
    D = collections.defaultdict(dict)
    for r in csv.DictReader(open(path, encoding='utf-8-sig')):
        if r['unit'] != 'TJ_GCV':
            continue
        v = r['OBS_VALUE'].strip()
        if v in ('', ':'):
            continue
        val = float(v) * TWH_PER_TJ
        if r['nrg_bal'] == 'TI_EHG_MAP' and val == 0.0:
            continue
        y, m = r['TIME_PERIOD'].split('-')
        D[r['nrg_bal']][(int(y), int(m))] = val
    return D

TEMP = load_temp('rohdaten/dwd/dwd_gebietsmittel_deutschland_wintermonate.csv')
GAS = load_gas('rohdaten/estat_nrg_cb_gasm_DE.csv')

WINTER_MONTHS = [(0, 10), (0, 11), (0, 12), (1, 1), (1, 2), (1, 3)]
WINTER_MONTHS_S1 = [(0, 11), (0, 12), (1, 1), (1, 2), (1, 3)]   # S1: Nov-Maerz

def winter_keys(y, months=WINTER_MONTHS):
    return [(y + off, m) for off, m in months]

def winter_temp(y, months=WINTER_MONTHS):
    ks = winter_keys(y, months)
    if any(k not in TEMP for k in ks):
        return None
    num = den = 0.0
    for (yy, mm) in ks:
        d = calendar.monthrange(yy, mm)[1]
        num += TEMP[(yy, mm)] * d
        den += d
    return num / den

def winter_sum(series, y, months=WINTER_MONTHS, only_negative=False):
    ks = winter_keys(y, months)
    if any(k not in series for k in ks):
        return None
    vals = [series[k] for k in ks]
    if only_negative:
        vals = [v for v in vals if v < 0]
    return sum(vals)

def build(months=WINTER_MONTHS, only_negative=False):
    """Liefert Liste (winterlabel, startjahr, entnahme, temp, verbrauch, stromgas)."""
    out = []
    for y in range(2008, 2026):
        stk = winter_sum(GAS['STK_CHG_MG'], y, months)
        if stk is None:
            continue
        if only_negative:
            stk = winter_sum(GAS['STK_CHG_MG'], y, months, only_negative=True)
        entnahme = -stk
        out.append(dict(label=f"{y}/{str(y+1)[2:]}", y=y, entnahme=entnahme,
                        temp=winter_temp(y, months),
                        verbrauch=winter_sum(GAS['IC_CAL_MG'], y, months),
                        verbrauch_obs=winter_sum(GAS['IC_OBS'], y, months),
                        stromgas=winter_sum(GAS['TI_EHG_MAP'], y, months)))
    return out

# ------------------------------------------------- Integritaetscheck (SAP 3.5)
W = build()
last = [w for w in W if w['y'] == 2025][0]
print("=" * 78)
print("DATENINTEGRITAET (SAP 3.5)")
print(f"  Winter 2025/26 Netto-Entnahme berechnet : {last['entnahme']:.1f} TWh")
print(f"  kommuniziert ('knapp 134 TWh')          : {CLAIM_LAST_WINTER:.0f} TWh")
dev = abs(last['entnahme'] - CLAIM_LAST_WINTER) / CLAIM_LAST_WINTER * 100
print(f"  Abweichung                              : {dev:.1f} %  -> {'BESTANDEN' if dev <= 10 else 'FEHLGESCHLAGEN'} (Toleranz 10 %)")
jahresverbrauch = sum(v for (y, m), v in GAS['IC_CAL_MG'].items() if y == 2025)
print(f"  Gasverbrauch 2025 (Kalenderjahr)        : {jahresverbrauch:.0f} TWh -> Plausibilitaet 800-900 TWh")

# ----------------------------------------------------------------- E1 primaer
PRIMARY = [w for w in W if 2016 <= w['y'] <= 2025]

def clopper_pearson(k, n, alpha=0.05):
    lo = 0.0 if k == 0 else stats.beta.ppf(alpha / 2, k, n - k + 1)
    hi = 1.0 if k == n else stats.beta.ppf(1 - alpha / 2, k + 1, n - k)
    return lo, hi

def e1(ws, label):
    e = np.array([w['entnahme'] for w in ws])
    k = int((e > CLAIM_STOCK).sum()); n = len(e)
    lo, hi = clopper_pearson(k, n)
    z = (last['entnahme'] - e.mean()) / e.std(ddof=1)
    rang = int((e > last['entnahme']).sum()) + 1
    print(f"\n{label} (n={n})")
    print(f"  Median {np.median(e):.1f} TWh | Mittel {e.mean():.1f} | SD {e.std(ddof=1):.1f} | Spanne {e.min():.1f}-{e.max():.1f}")
    print(f"  Winter mit Entnahme > {CLAIM_STOCK:.0f} TWh: {k} von {n} = {k/n*100:.0f} %"
          f"  [95%-KI {lo*100:.0f}-{hi*100:.0f} %]")
    print(f"  Winter 2025/26: {last['entnahme']:.1f} TWh, Rang {rang} von {n}, z = {z:+.2f}")
    return k, n

print("\n" + "=" * 78)
print("E1 - VERTEILUNG DER WINTERLICHEN NETTO-ENTNAHMEN")
print(f"\n{'Winter':<9}{'Entnahme TWh':>14}{'Wintertemp C':>14}{'Verbrauch TWh':>15}{'davon Strom':>13}")
for w in W:
    t = f"{w['temp']:.2f}" if w['temp'] is not None else "-"
    v = f"{w['verbrauch']:.0f}" if w['verbrauch'] is not None else "-"
    s = f"{w['stromgas']:.0f}" if w['stromgas'] is not None else "-"
    mark = "  <- Vergleichswinter B1" if w['y'] == 2025 else ""
    print(f"{w['label']:<9}{w['entnahme']:>14.1f}{t:>14}{v:>15}{s:>13}{mark}")
e1(PRIMARY, "PRIMAERFENSTER 2016/17-2025/26")
S2 = [w for w in W if w['y'] >= 2014]          # SAP Abschnitt 4: ab Winter 2014/15
e1(S2, "S2 - alle Winter ab 2014/15 (SAP-konform)")
e1(W, "nachrichtlich: ab 2008/09 - VORSICHT, geringerer Meldeumfang vor 2015")
e1([w for w in PRIMARY if w['y'] != 2022], "S3 - Primaerfenster ohne Winter 2022/23")

# ----------------------------------------------------------------- E2 primaer
def ols(x, y):
    x = np.asarray(x, float); y = np.asarray(y, float)
    n = len(x); X = np.column_stack([np.ones(n), x])
    beta, *_ = np.linalg.lstsq(X, y, rcond=None)
    resid = y - X @ beta
    dof = n - 2
    s2 = resid @ resid / dof
    XtXinv = np.linalg.inv(X.T @ X)
    se = np.sqrt(np.diag(s2 * XtXinv))
    return beta, se, np.sqrt(s2), dof, XtXinv, X, y

def predict(beta, s, dof, XtXinv, x0, interval='prediction'):
    x0v = np.array([1.0, x0])
    fit = x0v @ beta
    var = x0v @ XtXinv @ x0v * s**2
    if interval == 'prediction':
        var += s**2
    t = stats.t.ppf(0.975, dof)
    return fit, fit - t * np.sqrt(var), fit + t * np.sqrt(var)

def e2(ws, label, extra_trend=False):
    ws = [w for w in ws if w['temp'] is not None]
    x = [w['temp'] for w in ws]; y = [w['entnahme'] for w in ws]
    beta, se, s, dof, XtXinv, X, yv = ols(x, y)
    t = stats.t.ppf(0.975, dof)
    r2 = 1 - ((yv - X @ beta) ** 2).sum() / ((yv - yv.mean()) ** 2).sum()
    print(f"\n{label} (n={len(ws)})")
    print(f"  Steigung: {beta[1]:+.1f} TWh pro Grad C  [95%-KI {beta[1]-t*se[1]:+.1f} bis {beta[1]+t*se[1]:+.1f}]")
    print(f"  R^2 = {r2:.2f} | Residual-SD = {s:.1f} TWh")
    # Referenzverteilung der Wintertemperatur 1996/97-2025/26 (SAP 5.2)
    ref = np.array([winter_temp(yy) for yy in range(1996, 2026) if winter_temp(yy) is not None])
    xmin, xmax = min(x), max(x)
    for name, temp in (("durchschnittlicher Winter", ref.mean()),
                       ("kaeltester Winter im Fitbereich", xmin),
                       ("kalter Winter (10. Perzentil)", np.percentile(ref, 10))):
        fit, lo, hi = predict(beta, s, dof, XtXinv, temp)
        drin = "ja" if lo <= CLAIM_STOCK <= hi else "nein"
        warn = "  *** EXTRAPOLATION ausserhalb des Datenbereichs - nicht berichten" if temp < xmin else ""
        print(f"  {name} ({temp:.2f} C): erwartete Entnahme {fit:.0f} TWh"
              f"  [95%-Prognoseintervall {lo:.0f}-{hi:.0f}]  -> 136 TWh im Intervall: {drin}{warn}")
    # SAP 2/E2: Anteil der Temperaturverteilung, bei dem die erwartete Entnahme 136 TWh uebersteigt
    x_schwelle = (CLAIM_STOCK - beta[0]) / beta[1]
    anteil = (ref < x_schwelle).mean() * 100
    print(f"  Schwelle: erwartete Entnahme = {CLAIM_STOCK:.0f} TWh bei {x_schwelle:.2f} C"
          f"  ->  {anteil:.0f} % der 30 Referenzwinter waren kaelter (deskriptiv, ohne Unsicherheit)")
    return beta, se, s, dof, XtXinv, ref

def e2_trend(ws, label):
    """S4: E2 mit zusaetzlichem linearem Zeittrend."""
    ws = [w for w in ws if w['temp'] is not None]
    n = len(ws)
    X = np.column_stack([np.ones(n), [w['temp'] for w in ws], [w['y'] - 2016 for w in ws]])
    y = np.array([w['entnahme'] for w in ws])
    b, *_ = np.linalg.lstsq(X, y, rcond=None)
    r = y - X @ b
    dof = n - 3
    s = np.sqrt(r @ r / dof)
    se = np.sqrt(np.diag(s**2 * np.linalg.inv(X.T @ X)))
    t = stats.t.ppf(0.975, dof)
    print(f"\n{label} (n={n})")
    print(f"  Temperatur: {b[1]:+.1f} TWh/C [95%-KI {b[1]-t*se[1]:+.1f} bis {b[1]+t*se[1]:+.1f}]")
    print(f"  Zeittrend : {b[2]:+.1f} TWh/Jahr [95%-KI {b[2]-t*se[2]:+.1f} bis {b[2]+t*se[2]:+.1f}]")

print("\n" + "=" * 78)
print("E2 - ENTNAHME UND WINTERTEMPERATUR")
res_primary = e2(PRIMARY, "PRIMAER 2016/17-2025/26")
e2(S2, "S2 - alle Winter ab 2014/15 (SAP-konform)")
e2([w for w in PRIMARY if w['y'] != 2022], "S3 - ohne Winter 2022/23")
e2_trend(PRIMARY, "S4 - Primaerfenster mit zusaetzlichem Zeittrend")
for months, onlyneg, lab in ((WINTER_MONTHS_S1, False, "S1 - Winterdefinition November-Maerz"),
                             (WINTER_MONTHS, True, "S6 - Brutto-Entnahme")):
    e2([w for w in build(months, onlyneg) if 2016 <= w['y'] <= 2025], lab)
print("\n  S5 (Gradtagzahlen nach VDI 3807): NICHT DURCHGEFUEHRT - Daten in dieser"
      "\n  Session nicht beschaffbar (SAP 3.2 sieht diesen Fall ausdruecklich vor).")

ref = res_primary[5]
print(f"\n  Referenzverteilung Wintertemperatur 1996/97-2025/26 (n={len(ref)}):"
      f" Mittel {ref.mean():.2f} C, SD {ref.std(ddof=1):.2f}, "
      f"10. Perzentil {np.percentile(ref,10):.2f} C, Minimum {ref.min():.2f} C")
t2526 = [w for w in W if w['y'] == 2025][0]['temp']
pct = (ref < t2526).mean() * 100
print(f"  Winter 2025/26 ({t2526:.2f} C) liegt am {pct:.0f}. Perzentil dieser 30 Winter")

# ------------------------------------------------------------------ S1 und S6
print("\n" + "=" * 78)
print("SENSITIVITAETEN S1 / S6 (E1-Kernzahl)")
for months, onlyneg, lab in ((WINTER_MONTHS_S1, False, "S1 - Winterdefinition November-Maerz"),
                             (WINTER_MONTHS, True, "S6 - Brutto-Entnahme (nur Entnahmemonate)")):
    ws = [w for w in build(months, onlyneg) if 2016 <= w['y'] <= 2025]
    e = np.array([w['entnahme'] for w in ws])
    k = int((e > CLAIM_STOCK).sum()); n = len(e)
    lo, hi = clopper_pearson(k, n)
    print(f"  {lab}: {k}/{n} Winter ueber {CLAIM_STOCK:.0f} TWh [95%-KI {lo*100:.0f}-{hi*100:.0f} %],"
          f" Median {np.median(e):.0f} TWh")

# ---------------------------------------------------------------- E3 und E4
print("\n" + "=" * 78)
print("E3 - GESAMTER WINTERVERBRAUCH / E4 - GASEINSATZ STROM+WAERME")
ws = [w for w in W if w['verbrauch'] is not None and w['temp'] is not None]
x = [w['temp'] for w in ws]; y = [w['verbrauch'] for w in ws]
beta, se, s, dof, XtXinv, X, yv = ols(x, y)
t = stats.t.ppf(0.975, dof)
print(f"  Verbrauch ~ Temperatur (n={len(ws)}): {beta[1]:+.1f} TWh pro Grad C"
      f" [95%-KI {beta[1]-t*se[1]:+.1f} bis {beta[1]+t*se[1]:+.1f}], Residual-SD {s:.0f} TWh")
# mit Zeittrend (SAP 5.3)
Xt = np.column_stack([np.ones(len(ws)), x, [w['y'] - 2008 for w in ws]])
bt, *_ = np.linalg.lstsq(Xt, np.array(y), rcond=None)
resid = np.array(y) - Xt @ bt
dof_t = len(ws) - 3
s_t = np.sqrt(resid @ resid / dof_t)
se_t = np.sqrt(np.diag(s_t**2 * np.linalg.inv(Xt.T @ Xt)))
tt = stats.t.ppf(0.975, dof_t)
print(f"  mit Zeittrend: Temperatur {bt[1]:+.1f} TWh/C, Trend {bt[2]:+.1f} TWh pro Jahr"
      f" [95%-KI {bt[2]-tt*se_t[2]:+.1f} bis {bt[2]+tt*se_t[2]:+.1f}]")
print(f"\n  {'Winter':<9}{'Verbrauch':>11}{'Strom+Waerme':>14}{'Anteil':>9}{'Entnahme/Verbrauch':>20}")
for w in W:
    if w['verbrauch'] is None or w['stromgas'] is None:
        continue
    print(f"  {w['label']:<9}{w['verbrauch']:>11.0f}{w['stromgas']:>14.0f}"
          f"{w['stromgas']/w['verbrauch']*100:>8.0f}%{w['entnahme']/w['verbrauch']*100:>19.0f}%")
print("=" * 78)
