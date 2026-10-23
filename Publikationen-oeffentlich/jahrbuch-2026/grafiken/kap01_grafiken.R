# Jahrbuch 2026, Kapitel 1: drei Grafiken
# Nur Darstellung vorhandener Ergebnisse und Quellenzahlen, keine neue Rechnung.
# Aufruf: Rscript kap01_grafiken.R   (Arbeitsverzeichnis: Repo-Wurzel)

repo   <- getwd()
out    <- file.path(repo, "Publikationen-oeffentlich/jahrbuch-2026/grafiken")
dir.create(out, showWarnings = FALSE, recursive = TRUE)

ink    <- "#2b2b2b"; muted <- "#6b6b6b"; grid <- "#e3e3e3"
blau   <- "#1f6f9f"; orange <- "#c4501b"; grau <- "#9a9a9a"

theme_start <- function(mar = c(7, 7.2, 4.6, 2)) {
  par(mar = mar, mgp = c(5, 0.8, 0), family = "sans", col.axis = muted, col.lab = ink,
      fg = muted, bty = "n", las = 1, cex.axis = 0.95)
}
titel <- function(haupt, unter) {
  mtext(haupt, side = 3, line = 2.6, adj = 0, font = 2, cex = 1.35, col = ink)
  mtext(unter, side = 3, line = 0.9, adj = 0, cex = 0.95, col = muted)
}
quelle <- function(txt) { z <- strwrap(txt, width = 135); for (i in seq_along(z)) mtext(z[i], side = 1, line = 3.6 + 0.9 * i, adj = 0, cex = 0.72, col = muted) }
raster <- function(ys) abline(h = ys, col = grid, lwd = 1)

## ---------------------------------------------------------------- Grafik 1
# Quelle: DWD CDC Gebietsmittel Deutschland, Sommer (Juni-August), Stand 02.09.2026
# Normalwerte und Trendwert 2026 wie im Evidenzcheck vom 11.09.2026.
d1 <- read.csv(file.path(repo, "Analysen/2026-09-sommer-2026-normal/rohdaten/dwd_sommer_deutschland.csv"))
png(file.path(out, "kap01_grafik1_sommertemperatur.png"), width = 2000, height = 1100, res = 200)
theme_start()
plot(d1$jahr, d1$tm_sommer_de, type = "n", xlab = "", ylab = "Mitteltemperatur Juni bis August (°C)",
     ylim = c(12.9, 20.5), xlim = c(1880, 2078), xaxt = "n", yaxt = "n")
raster(seq(14, 20, 2))
axis(1, at = seq(1880, 2020, 20), tick = FALSE, line = -0.5)
axis(2, at = seq(14, 20, 2), tick = FALSE)
# Normalperioden als Mittelwert-Segmente
segments(1961, 16.3, 1990, 16.3, col = blau, lwd = 3, lend = 1)
segments(1991, 17.6, 2020, 17.6, col = orange, lwd = 3, lend = 1)
lines(d1$jahr, d1$tm_sommer_de, col = grau, lwd = 1.2)
points(d1$jahr, d1$tm_sommer_de, pch = 16, cex = 0.55, col = grau)
# Hervorhebungen
j26 <- d1$tm_sommer_de[d1$jahr == 2026]; j03 <- d1$tm_sommer_de[d1$jahr == 2003]
points(2026, j26, pch = 21, bg = ink, col = "white", cex = 1.7, lwd = 1.5)
points(2003, j03, pch = 21, bg = "white", col = ink, cex = 1.2, lwd = 1.5)
points(2026, 18.5, pch = 23, bg = "white", col = ink, cex = 1.3, lwd = 1.5)
text(2029, j26, "2026: 19,6 °C", adj = 0, cex = 0.9, col = ink, font = 2, xpd = NA)
text(2003, j03 + 0.55, "2003", adj = 0.5, cex = 0.85, col = ink)
text(2029, 18.5, "Trendwert 2026 (Trend 1971–2025):", adj = 0, cex = 0.8, col = muted, xpd = NA)
text(2029, 18.1, "18,5 °C (Raute)", adj = 0, cex = 0.8, col = muted, xpd = NA)
text(1882, 13.9, "Blauer Strich: Normal 1961–1990 = 16,3 °C", col = blau, cex = 0.85, adj = 0, font = 2)
text(1882, 13.3, "Oranger Strich: Normal 1991–2020 = 17,6 °C", col = orange, cex = 0.85, adj = 0, font = 2)
titel("Der Sommer 2026 war der zweitwärmste seit 1881",
      "Sommermittel Deutschland, 1881–2026, mit den Normalwerten 1961–1990 und 1991–2020")
quelle("Quelle: Deutscher Wetterdienst, Climate Data Center, Gebietsmittel Deutschland (Stand 02.09.2026; Werte 2025 und 2026 vorläufig). Auswertung: Klima Kompass, Evidenzcheck vom 11.09.2026.")
dev.off()

## ---------------------------------------------------------------- Grafik 2
# Quelle: RKI, Epid. Bull. 19/2025 Anhang (1992-2025, Schaetzwert mit 95%-Intervall);
# 2026: RKI-Wochenbericht KW 37 (Stand 24.09.2026): 16.000 [14.400; 17.600], kumuliert KW 15-37.
# Referenzbereich: Obergrenze des 95%-Prognoseintervalls rund 8.700 (Evidenzcheck 29.08.2026).
d2 <- read.csv(file.path(repo, "Analysen/2026-08-hitzesommer-2026/rki_hitzebedingte_sterbefaelle_rohdaten.csv"))
d2 <- d2[d2$jahr >= 1992 & d2$jahr <= 2025, c("jahr", "punktschaetzer", "pi_unten", "pi_oben")]
png(file.path(out, "kap01_grafik2_todesfaelle_hitze.png"), width = 2000, height = 1100, res = 200)
theme_start()
plot(NA, xlim = c(1991, 2027), ylim = c(-1500, 18500), xlab = "", xaxt = "n", yaxt = "n",
     ylab = "Geschätzte Todesfälle durch Hitze pro Jahr")
raster(seq(0, 18000, 3000))
axis(1, at = seq(1995, 2025, 5), tick = FALSE, line = -0.5)
axis(2, at = seq(0, 18000, 3000), labels = format(seq(0, 18000, 3000), big.mark = ".", trim = TRUE), tick = FALSE)
abline(h = 8700, col = orange, lwd = 2, lty = 2)
text(1991.4, 9350, "Obergrenze eines „normalen“ Jahres: rund 8.700", adj = 0, col = orange, cex = 0.85, font = 2)
segments(d2$jahr, d2$pi_unten, d2$jahr, d2$pi_oben, col = grau, lwd = 1.3)
points(d2$jahr, d2$punktschaetzer, pch = 16, cex = 0.8, col = ink)
segments(2026, 14400, 2026, 17600, col = blau, lwd = 2)
points(2026, 16000, pch = 21, bg = blau, col = "white", cex = 1.7, lwd = 1.5)
text(2025.2, 17900, "2026: 16.000\n(Spanne 14.400–17.600)", adj = 1, col = blau, cex = 0.85, font = 2)
legend("topleft", bty = "n", inset = c(0.0, 0.0), cex = 0.8, text.col = muted,
       legend = c("Schätzwert pro Jahr (RKI)", "95-%-Unsicherheitsintervall"),
       pch = c(16, NA), lty = c(NA, 1), col = c(ink, grau), lwd = c(NA, 1.3))
titel("2026 liegt weit über der Bandbreite der Jahre davor",
      "Geschätzte Todesfälle durch Hitze in Deutschland, 1992–2026")
quelle("Quelle: Robert Koch-Institut (Epid. Bull. 19/2025; Wochenbericht KW 37/2026, Stand 24.09.2026, kumuliert KW 15–37). Referenzbereich: Klima Kompass, Evidenzcheck vom 29.08.2026. Schätzungen, keine Zählung.")
dev.off()

## ---------------------------------------------------------------- Grafik 3
# Quelle: KLIMA vor acht e.V., MedienKlimaBericht Nr. 1 (Juli 2026); Zahlen wie im Einordnungsstueck vom 17.10.2026.
x   <- 1:4
lab <- c("2023", "2024", "2025", "1. Halbjahr\n2026")
erste <- c(2.20, 1.49, 1.29, 0.95)
zdf   <- c(1.95, 1.43, 1.29, 0.82)
png(file.path(out, "kap01_grafik3_klima_minuten.png"), width = 2000, height = 1100, res = 200)
theme_start()
plot(NA, xlim = c(0.7, 4.9), ylim = c(0, 2.6), xaxt = "n", yaxt = "n", xlab = "",
     ylab = "Anteil der Sendeminuten mit „Klima“ (%)")
raster(seq(0, 2.5, 0.5))
axis(1, at = x, labels = lab, tick = FALSE, line = 0.2)
axis(2, at = seq(0, 2.5, 0.5), labels = format(seq(0, 2.5, 0.5), decimal.mark = ","), tick = FALSE)
lines(x, erste, col = blau, lwd = 2.2); points(x, erste, pch = 21, bg = blau, col = "white", cex = 1.6, lwd = 1.5)
lines(x, zdf, col = orange, lwd = 2.2);  points(x, zdf, pch = 21, bg = orange, col = "white", cex = 1.6, lwd = 1.5)
le <- c("2,2", "1,49", "1,29", "0,95"); lz <- c("1,95", "1,43", "1,29", "0,82")
text(x[1], erste[1] + 0.17, paste0(le[1], " %"), col = ink, cex = 0.85)
text(x[1], zdf[1] - 0.17, paste0(lz[1], " %"), col = ink, cex = 0.85)
text(x[4] + 0.12, erste[4] + 0.06, paste0("Das Erste ", le[4], " %"), adj = 0, col = blau, cex = 0.9, font = 2)
text(x[4] + 0.12, zdf[4] - 0.08, paste0("ZDF ", lz[4], " %"), adj = 0, col = orange, cex = 0.9, font = 2)
titel("Der Klima-Anteil im Programm sinkt",
      "Sendeminuten mit dem Wort „Klima“ bei Das Erste und ZDF, 2023 bis 1. Halbjahr 2026")
quelle("Quelle: KLIMA° vor acht e. V., MedienKlimaBericht Nr. 1 (Juli 2026). Zeichenfolgen-Zählung nach eigenen Angaben des Vereins (Präzision 94 %, Erfassung 89 %), also keine Qualitätsmessung.")
dev.off()
cat("Grafiken geschrieben nach", out, "\n")
