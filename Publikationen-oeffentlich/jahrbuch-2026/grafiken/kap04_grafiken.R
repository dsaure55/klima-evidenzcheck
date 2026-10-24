# Jahrbuch 2026, Kapitel 4: zwei Grafiken
# Nur Darstellung vorhandener Zahlen aus den Analysen (Analysen/2026-08-emissionen, Analysen/2026-08-expertenrat-budgetabgleich), keine neue Rechnung.
# Aufruf: Rscript kap04_grafiken.R   (Arbeitsverzeichnis: Repo-Wurzel)

repo <- getwd()
out  <- file.path(repo, "Publikationen-oeffentlich/jahrbuch-2026/grafiken")
dir.create(out, showWarnings = FALSE, recursive = TRUE)

ink <- "#2b2b2b"; muted <- "#6b6b6b"; grid <- "#e3e3e3"
blau <- "#1f6f9f"; orange <- "#c4501b"; grau <- "#9a9a9a"

theme_start <- function(mar = c(8.5, 7.2, 4.6, 2)) {
  par(mar = mar, mgp = c(5, 0.8, 0), family = "sans", col.axis = muted, col.lab = ink,
      fg = muted, bty = "n", las = 1, cex.axis = 0.95)
}
titel <- function(haupt, unter) {
  mtext(haupt, side = 3, line = 2.6, adj = 0, at = grconvertX(0.1425, "ndc", "user"), font = 2, cex = 1.35, col = ink)
  mtext(unter, side = 3, line = 0.9, adj = 0, at = grconvertX(0.1425, "ndc", "user"), cex = 0.95, col = muted)
}
quelle <- function(txt) {
  z <- strwrap(txt, width = 135)
  for (i in seq_along(z)) mtext(z[i], side = 1, line = 3.9 + 0.9 * i, adj = 0, at = grconvertX(0.1425, "ndc", "user"), cex = 0.72, col = muted)
}


## ---------------------------------------------------------------- Grafik 1
# Analysen/2026-08-emissionen (Skriptlauf 24.10.2026): Projektion 2040 mit 95-%-Prognoseintervall.
# OLS (primaer laut SAP 5.4), ARIMA (Sensitivitaet). Zielwert 150,4 Mt.
png(file.path(out, "kap04_grafik1_trend2040.png"), width = 2000, height = 1100, res = 200)
theme_start(mar = c(8.5, 15, 4.6, 3))
zeilen <- c("Langfrist-Trend 1990–2025, OLS", "Langfrist-Trend 1990–2025, ARIMA",
            "10-Jahres-Trend 2015–2025, OLS", "10-Jahres-Trend 2015–2025, ARIMA")
pt <- c(486.0, 389.9, 207.0, 274.2); lo <- c(406.6, 181.5, 86.3, 16.4); hi <- c(565.5, 598.3, 327.8, 532.1)
y <- c(4, 3, 2, 1)
plot(NA, xlim = c(0, 650), ylim = c(0.4, 4.6), xaxt = "n", yaxt = "n", xlab = "", ylab = "")
abline(v = seq(0, 600, 100), col = grid)
axis(1, at = seq(0, 600, 100), tick = FALSE)
axis(2, at = y, labels = zeilen, tick = FALSE, cex.axis = 0.85)
mtext("Treibhausgasemissionen 2040 in Mio. Tonnen CO2-Äquivalent", side = 1, line = 2.6, cex = 0.9, col = ink)
abline(v = 150.4, col = orange, lwd = 2.5, lty = 2)
text(158, 4.5, "Gesetzliches Ziel: 150,4", adj = 0, col = orange, cex = 0.85, font = 2)
farbe <- c(blau, grau, blau, grau)
segments(lo, y, hi, y, col = farbe, lwd = 3)
points(pt, y, pch = 21, bg = farbe, col = "white", cex = 2.2, lwd = 1.5)
text(pt, y + 0.28, format(round(pt), decimal.mark = ","), col = ink, cex = 0.9, font = 2)
titel("Dieselben Daten, zwei Zeitfenster, zwei Antworten",
      "Fortschreibung der deutschen Emissionen bis 2040 mit 95-%-Prognoseintervall (Punkt = Projektion)")
quelle("Quelle: Umweltbundesamt via klimadashboard.de (CC BY 4.0), Auswertung Klima Kompass (Analysen/2026-08-emissionen). Blau: OLS-Intervall (Hauptverfahren laut Analyseplan), grau: ARIMA (Kontrollrechnung). Lineare Fortschreibung, keine Prognose und keine Annahme über künftige Politik.")
dev.off()

## ---------------------------------------------------------------- Grafik 2
# Analysen/2026-08-expertenrat-budgetabgleich, Analysebericht Fassung 4, Tabelle 2.2 (nur Fenster A und B).
# Ueberschreitung des Budgets 2021-2030 (6199 Mt): Punktwert und 95-%-Intervall.
png(file.path(out, "kap04_grafik2_budget_overshoot.png"), width = 2000, height = 1200, res = 200)
theme_start(mar = c(8.5, 15, 4.6, 3))
zeilen <- c("Langfrist (A), analytisch", "Langfrist (A), Bootstrap", "Langfrist (A), ARIMA",
            "10-Jahres (B), analytisch", "10-Jahres (B), Bootstrap", "10-Jahres (B), ARIMA")
pt <- c(584.2, 584.2, 266.3, 25.0, 25.0, 150.6)
lo <- c(38.9, 429, -132.7, -202.7, -159, -343.1)
hi <- c(1129.5, 737, 665.4, 252.8, 201, 644.3)
typ <- c("P", "P", "V", "P", "P", "V")
y <- 6:1
plot(NA, xlim = c(-400, 1200), ylim = c(0.4, 7.3), xaxt = "n", yaxt = "n", xlab = "", ylab = "")
rect(60, 0.3, 100, 6.7, col = "#f2d9c9", border = NA)
abline(v = seq(-400, 1200, 200), col = grid)
abline(v = 0, col = muted, lwd = 1.5)
axis(1, at = seq(-400, 1200, 200), labels = format(seq(-400, 1200, 200), decimal.mark = ",", big.mark = ""), tick = FALSE)
axis(2, at = y, labels = zeilen, tick = FALSE, cex.axis = 0.85)
mtext("Überschreitung des Budgets 2021–2030 in Mio. Tonnen CO2-Äquivalent (0 = Budget eingehalten)", side = 1, line = 2.6, cex = 0.85, col = ink)
text(80, 6.62, "Expertenrat:\n60–100", adj = 0.5, col = orange, cex = 0.8, font = 2)
farbe <- ifelse(typ == "P", blau, grau)
segments(lo, y, hi, y, col = farbe, lwd = 3)
points(pt, y, pch = 21, bg = farbe, col = "white", cex = 2.2, lwd = 1.5)
titel("Unsere Fortschreibung entscheidet die Frage nicht",
      "Budgetüberschreitung 2021–2030 nach Zeitfenster und Methode, Punktwert und 95-%-Intervall (vorläufig)")
quelle("Quelle: Klima Kompass, Analyse Expertenrat-Budgetabgleich (Analysebericht Fassung 4, vorläufig, nicht freigegeben); Expertenrat für Klimafragen, Prüfbericht 2026 (Korridor 60–100). Blau: Parameterintervall (Unsicherheit des Trends), grau: Prognoseintervall (ARIMA, auch Streuung künftiger Jahre). Die beiden Typen sind nicht direkt vergleichbar. Fenster A: Modellartefakt durch Niveausprung.")
dev.off()
cat("Grafiken geschrieben nach", out, "\n")
