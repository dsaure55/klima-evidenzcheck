# Erzeugt eine statische SVG-Verteilungsgrafik (Deckungsgrad je Dunkelflaute-
# Episode) fuer den Substack-Entwurf, direkt aus der validierten Episodenliste
# (output/tabelle1_episodenliste.csv) und der validierten BEREINIGT-Kapazitaet
# (31.472 GWh, SOC 80%, Entladewirkungsgrad sqrt(0.85) - Formel unabhaengig
# vom validator nachgerechnet und bestaetigt). Reine Text-Ausgabe, kein
# R-Grafikgeraet, daher nicht vom bekannten Segfault-Defekt betroffen.

de_fmt2 <- function(x) sub("\\.", ",", sprintf("%.2f", x))

d <- read.csv("../output/tabelle1_episodenliste.csv", stringsAsFactors = FALSE)
d$Start <- as.Date(d$Start)

kap_bereinigt_gwh <- 31.472
soc <- 0.80
eta_entladung <- sqrt(0.85)
entladbar_gwh <- kap_bereinigt_gwh * soc * eta_entladung

d$deckung_pct <- entladbar_gwh / d$Energiedefizit_GWh * 100
d$jahr_frac <- as.numeric(format(d$Start, "%Y")) +
  (as.numeric(d$Start - as.Date(paste0(format(d$Start, "%Y"), "-01-01")))) / 365.25

med <- median(d$deckung_pct)

W <- 800; H <- 460
ml <- 66; mr <- 24; mt <- 30; mb <- 50
pw <- W - ml - mr; ph <- H - mt - mb

x_min <- 2014.6; x_max <- 2026.1
y_max <- 1.0

x_of <- function(yr) ml + (yr - x_min) / (x_max - x_min) * pw
y_of <- function(pct) mt + (1 - pct / y_max) * ph

grid_y <- c(0, 0.25, 0.5, 0.75, 1.0)
gridlines <- paste(sprintf(
  '<line x1="%.1f" y1="%.1f" x2="%.1f" y2="%.1f" stroke="#e1e0d9" stroke-width="1"/>
   <text x="%.1f" y="%.1f" font-size="12" fill="#898781" text-anchor="end">%s%%</text>',
  ml, y_of(grid_y), W - mr, y_of(grid_y), ml - 10, y_of(grid_y) + 4, de_fmt2(grid_y)
), collapse = "\n")

x_ticks <- seq(2015, 2025, by = 2)
xticklabels <- paste(sprintf(
  '<text x="%.1f" y="%.1f" font-size="12" fill="#898781" text-anchor="middle">%d</text>',
  x_of(x_ticks), H - mb + 20, x_ticks
), collapse = "\n")

dots <- paste(sprintf(
  '<circle cx="%.2f" cy="%.2f" r="4.5" fill="#2a78d6" fill-opacity="0.75" stroke="#2a78d6" stroke-width="1"/>',
  x_of(d$jahr_frac), y_of(d$deckung_pct)
), collapse = "\n")

med_y <- y_of(med)

svg <- sprintf('<svg viewBox="0 0 %d %d" xmlns="http://www.w3.org/2000/svg" font-family="system-ui,-apple-system,\'Segoe UI\',sans-serif">
  <rect x="0" y="0" width="%d" height="%d" fill="#fcfcfb"/>
  <text x="%d" y="20" font-size="16" font-weight="600" fill="#0b0b0b">Deckungsgrad je historischer Dunkelflaute-Episode (2015-2025)</text>
  %s
  <line x1="%.1f" y1="%.2f" x2="%.1f" y2="%.2f" stroke="#eb6834" stroke-width="2" stroke-dasharray="5,4"/>
  <text x="%.1f" y="%.2f" font-size="13" font-weight="600" fill="#0b0b0b" text-anchor="start">Median: %s%%</text>
  %s
  %s
  <text x="%d" y="%d" font-size="12" fill="#898781" text-anchor="middle">Jahr (Episodenbeginn)</text>
  <text transform="rotate(-90)" x="%d" y="18" font-size="12" fill="#898781" text-anchor="middle">Deckungsgrad (%% des Episoden-Energiedefizits)</text>
  <text x="%d" y="%d" font-size="11" fill="#898781">Jeder Punkt = eine der 50 identifizierten Dunkelflaute-Episoden (BEREINIGT-Kapazitaet 31,5 GWh, Post-hoc, siehe Text)</text>
</svg>',
  W, H, W, H,
  ml, gridlines,
  ml, med_y, W - mr, med_y,
  ml + 6, med_y - 8, de_fmt2(med),
  dots,
  xticklabels,
  ml + pw / 2, H - 14,
  -(mt + ph / 2),
  ml, H - 2
)
writeLines(svg, "../../../Reports/2026-08-batteriespeicher-dunkelflaute/kanal-entwuerfe/assets/deckungsgrad_episoden.svg")
cat("Median Deckungsgrad:", de_fmt2(med), "% -", "geschrieben.\n")
