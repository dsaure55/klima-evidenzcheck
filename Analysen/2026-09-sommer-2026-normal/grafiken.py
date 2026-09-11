# -*- coding: utf-8 -*-
import json, math
import numpy as np, pandas as pd
import matplotlib; matplotlib.use("Agg")
import matplotlib.pyplot as plt
from scipy import stats

SURF, INK, INK2, MUTED, GRID = "#fcfcfb", "#0b0b0b", "#52514e", "#898781", "#e1e0d9"
BLUE, ORANGE = "#2a78d6", "#eb6834"
plt.rcParams.update({"font.family": "DejaVu Sans", "font.size": 10, "axes.edgecolor": GRID, "axes.labelcolor": INK2,
                     "xtick.color": MUTED, "ytick.color": MUTED, "figure.facecolor": SURF, "axes.facecolor": SURF})
d = pd.read_csv("rohdaten/dwd_sommer_deutschland.csv"); r = json.load(open("output/ergebnisse.json"))
Y = dict(zip(d.jahr, d.tm_sommer_de))
prim = r["E2"][0]

# Neuberechnung Trend + PI-Band (identisch zu Primärmodell)
yrs = np.arange(1971, 2026); y = np.array([Y[j] for j in yrs]); x = yrs - 2000.0
X = np.column_stack([np.ones_like(x), x]); XtXi = np.linalg.inv(X.T @ X); b = XtXi @ X.T @ y
e = y - X @ b; s2 = e @ e / (len(y) - 2); tc = stats.t.ppf(0.975, len(y) - 2)
xf = np.arange(1971, 2081); Xf = np.column_stack([np.ones(len(xf)), xf - 2000.0])
yh = Xf @ b; se = np.sqrt(s2 * (1 + np.einsum("ij,jk,ik->i", Xf, XtXi, Xf)))
assert abs(10 * b[1] - prim["steigung_K_pro_Jahrzehnt"]) < 1e-9

fig, ax = plt.subplots(figsize=(10, 5.6), dpi=160)
for s in ("top", "right"): ax.spines[s].set_visible(False)
ax.grid(axis="y", color=GRID, lw=0.8); ax.set_axisbelow(True)
# Referenzbänder R1/R2 (Mittel ± 1 SD)
for (a, bb, lab), row in zip([(1961, 1990, "Mittel ± 1 SD 1961–1990"), (1991, 2020, "Mittel ± 1 SD 1991–2020")], r["E1"][:2]):
    ax.fill_between([a, bb], row["referenz"] - row["sd"], row["referenz"] + row["sd"], color=MUTED, alpha=0.18, lw=0)
    ax.hlines(row["referenz"], a, bb, color=MUTED, lw=1.2)
    ax.text(a - 1 if a == 1961 else a + 1, 14.05, lab + " " + ("→" if a == 1961 else "↑"), ha="right" if a == 1961 else "left", va="bottom", fontsize=8, color=INK2)
# Trend + 95%-PI
ax.fill_between(xf, yh - tc * se, yh + tc * se, color=BLUE, alpha=0.12, lw=0, label="95 %-Prognoseband (Trend 1971–2025 fortgeschrieben)")
ax.plot(xf[xf <= 2025], yh[xf <= 2025], color=BLUE, lw=2, label="Linearer Trend 1971–2025")
ax.plot(xf[xf >= 2025], yh[xf >= 2025], color=BLUE, lw=2, ls=(0, (4, 3)))
# Messwerte
yy = d[d.jahr <= 2025]
ax.plot(yy.jahr, yy.tm_sommer_de, "o", ms=3.2, color=INK2, mec=SURF, mew=0.5, label="Sommermittel je Jahr (DWD)")
ax.plot([2026], [Y[2026]], "o", ms=9, color=ORANGE, mec=SURF, mew=2, zorder=5, label="Sommer 2026")
ax.annotate(f"2026: {Y[2026]:.1f} °C".replace(".", ","), (2026, Y[2026]), xytext=(2008, 20.55), fontsize=9, color=INK,
            arrowprops=dict(arrowstyle="-", color=MUTED, lw=0.8))
# 19,6-Linie + t*, t**
ax.axhline(19.6, color=MUTED, lw=1, ls=(0, (2, 2)))
ax.text(1958, 19.68, "19,6 °C", fontsize=8, color=INK2)
ea, eb = prim["E2a"], prim["E2b"]
ax.errorbar([ea["punkt"]], [19.6], xerr=[[ea["punkt"] - ea["lo"]], [ea["hi"] - ea["punkt"]]], fmt="D", ms=6, color=BLUE, ecolor=BLUE, elinewidth=1.5, capsize=3, zorder=6)
ax.text(ea["punkt"], 19.95, f"Trend erreicht 19,6 °C: {round(ea['punkt'])}\n(95 %-KI {round(ea['lo'])}–{round(ea['hi'])})", ha="center", fontsize=8, color=INK)
yb = 19.6 - prim["sigma_res"]
ax.errorbar([eb["punkt"]], [yb], xerr=[[eb["punkt"] - eb["lo"]], [eb["hi"] - eb["punkt"]]], fmt="s", ms=5, color=BLUE, ecolor=BLUE, elinewidth=1.2, capsize=3, zorder=6, mfc=SURF)
ax.text(eb["hi"] + 1.5, yb - 0.05, f"Trend + 1 SD erreicht 19,6 °C: {round(eb['punkt'])}\n(KI {round(eb['lo'])}–{round(eb['hi'])}; Marker auf Trendlinie)", fontsize=8, color=INK, va="center")
ax.set_xlim(1878, 2082); ax.set_ylim(13.9, 21.9)
ax.text(1882, 14.35, "", fontsize=8)
ax.set_ylabel("Mitteltemperatur Juni–August, °C")
ax.yaxis.set_major_formatter(matplotlib.ticker.FuncFormatter(lambda v, p: f"{v:.0f}"))
fig.suptitle("Sommer 2026: Wie ungewöhnlich – und ab wann normal?", x=0.065, ha="left", fontsize=12.5, fontweight="bold", color=INK, y=0.985)
ax.set_title("Quelle: Deutscher Wetterdienst (DWD), Climate Data Center, Deutschland-Gebietsmittel, Stand 02.09.2026 (2025/26 vorläufig).\nFortschreibung = linearer Messtrend, keine Klimaprojektion; Intervalle bilden Emissionsszenarien nicht ab. ±1 SD: Konvention dieses Checks.",
             loc="left", fontsize=8.5, color=INK2, pad=8)
leg = ax.legend(loc="upper left", fontsize=8, frameon=False, labelcolor=INK2, bbox_to_anchor=(0.0, 1.0))
fig.tight_layout()
for ext in ("png", "svg"): fig.savefig(f"output/grafik1_sommer_2026.{ext}", facecolor=SURF)
plt.close(fig)

# Diagnostik
fit = X @ b
fig, axs = plt.subplots(2, 2, figsize=(10, 7), dpi=130)
axs[0, 0].scatter(fit, e, s=14, color=INK2); axs[0, 0].axhline(0, color=MUTED, lw=1); axs[0, 0].set_title("Residuen vs. angepasste Werte"); axs[0, 0].set_xlabel("angepasst (°C)"); axs[0, 0].set_ylabel("Residuum (K)")
(osm, osr), (sl, ic, _) = stats.probplot(e, dist="norm")
axs[0, 1].scatter(osm, osr, s=14, color=INK2); axs[0, 1].plot(osm, sl * np.array(osm) + ic, color=BLUE, lw=1.5)
axs[0, 1].set_title(f"Q-Q-Plot (Shapiro-Wilk p = {r['diagnostik']['shapiro_p']:.3f})")
lim = r["diagnostik"]["acf_grenze"]
for axx, key, t in ((axs[1, 0], "acf_lag1_10", "ACF"), (axs[1, 1], "pacf_lag1_10", "PACF")):
    axx.vlines(range(1, 11), 0, r["diagnostik"][key], color=BLUE, lw=2); axx.axhline(0, color=MUTED, lw=1)
    axx.axhline(lim, color=MUTED, ls="--", lw=1); axx.axhline(-lim, color=MUTED, ls="--", lw=1); axx.set_title(f"{t} der Residuen (DW = {r['diagnostik']['durbin_watson']:.2f}, p zweiseitig = {r['diagnostik']['dw_p_zweiseitig_mc']:.2f})" if t == "ACF" else f"{t} der Residuen"); axx.set_xlabel("Lag (Jahre)")
fig.suptitle("Diagnostik Primärmodell: OLS Sommermittel ~ Jahr, 1971–2025 (n = 55)", fontweight="bold")
fig.tight_layout(); fig.savefig("output/diagnostik_primaermodell.png", facecolor=SURF); plt.close(fig)
print("ok")
