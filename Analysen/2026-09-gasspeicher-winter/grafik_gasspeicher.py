"""Grafik 1 zum Schnellcheck Gasspeicher (SAP Abschnitt 11)."""
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from scipy import stats

exec(open('gasspeicher-winter-2026.py').read().split('# ------------------------------------------------- Integritaetscheck')[0])

SURFACE, INK, INK2 = '#fcfcfb', '#0b0b0b', '#52514e'
ACCENT, HILITE, GRID = '#2a78d6', '#eb6834', '#dedcd6'

W = build()
P = [w for w in W if 2016 <= w['y'] <= 2025]
x = np.array([w['temp'] for w in P]); y = np.array([w['entnahme'] for w in P])
n = len(x); X = np.column_stack([np.ones(n), x])
beta, *_ = np.linalg.lstsq(X, y, rcond=None)
resid = y - X @ beta; dof = n - 2
s = np.sqrt(resid @ resid / dof); XtXinv = np.linalg.inv(X.T @ X)
t = stats.t.ppf(0.975, dof)
gx = np.linspace(x.min() - 0.15, x.max() + 0.15, 200)
G = np.column_stack([np.ones(len(gx)), gx])
fit = G @ beta
pi = t * np.sqrt(np.array([g @ XtXinv @ g for g in G]) * s**2 + s**2)

fig, ax = plt.subplots(figsize=(9.2, 6.0), dpi=200)
fig.patch.set_facecolor(SURFACE); ax.set_facecolor(SURFACE)

ax.fill_between(gx, fit - pi, fit + pi, color=ACCENT, alpha=0.10, lw=0)
ax.plot(gx, fit, color=ACCENT, lw=2, zorder=3)
ax.axhline(136, color=INK, lw=1.6, ls=(0, (5, 3)), zorder=2)
ax.text(x.max() + 0.12, 136 + 6, '136 TWh – heutiger Speicherinhalt',
        ha='right', va='bottom', fontsize=10.5, color=INK, weight='bold')

for w, xi, yi in zip(P, x, y):
    is_last = w['y'] == 2025
    ax.scatter(xi, yi, s=150 if is_last else 95, zorder=5,
               color=HILITE if is_last else ACCENT,
               edgecolor=SURFACE, linewidth=2)
labels = {'2016/17': (-58, 4), '2017/18': (10, 6), '2018/19': (10, -4), '2020/21': (10, 2),
          '2023/24': (-6, -18), '2024/25': (10, 2), '2025/26': (12, -6), '2022/23': (10, -4),
          '2019/20': (8, -14), '2021/22': (10, 4)}
for w, xi, yi in zip(P, x, y):
    dx, dy = labels.get(w['label'], (8, 6))
    ax.annotate(w['label'], (xi, yi), textcoords='offset points', xytext=(dx, dy),
                fontsize=10, color=HILITE if w['y'] == 2025 else INK2,
                weight='bold' if w['y'] == 2025 else 'normal')

ax.set_xlabel('Mittlere Temperatur im Winterhalbjahr (Oktober–März), °C', fontsize=11, color=INK2)
ax.set_ylabel('Netto-Entnahme aus den Gasspeichern, TWh', fontsize=11, color=INK2)
fig.text(0.055, 0.965, 'In vier von zehn Wintern lag die Entnahme über dem heutigen Speicherinhalt',
         fontsize=13.5, color=INK, weight='bold', va='top')
fig.text(0.055, 0.917, 'Deutschland, Winterhalbjahre 2016/17 bis 2025/26 · Linie: Regression, Fläche: 95-%-Prognoseintervall',
         fontsize=10, color=INK2, va='top')
ax.grid(True, color=GRID, lw=0.8)
ax.set_axisbelow(True)
for sp in ('top', 'right'):
    ax.spines[sp].set_visible(False)
for sp in ('left', 'bottom'):
    ax.spines[sp].set_color(GRID)
ax.tick_params(colors=INK2, labelsize=10)
ax.set_ylim(-60, 290)
ax.axhline(0, color=GRID, lw=1)
fig.text(0.055, 0.022,
         'Daten: Eurostat nrg_cb_gasm (Bestandsveränderungen Okt.–März) · DWD Climate Data Center · Klima Evidenzcheck, 14.09.2026',
         fontsize=8.5, color=INK2)
fig.subplots_adjust(left=0.085, right=0.985, top=0.875, bottom=0.115)
fig.savefig('gasspeicher-winter-2026.png', facecolor=SURFACE)
print('geschrieben: gasspeicher-winter-2026.png')
print('Fit-Bereich x:', round(x.min(), 2), 'bis', round(x.max(), 2))
