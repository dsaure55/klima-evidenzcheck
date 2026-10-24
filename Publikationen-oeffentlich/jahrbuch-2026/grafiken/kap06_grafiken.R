# Jahrbuch 2026, Kapitel 6: drei Grafiken
# Nur Darstellung vorhandener Zahlen aus den zitierten Quellen, keine neue Rechnung.
# Aufruf: Rscript kap06_grafiken.R   (Arbeitsverzeichnis: Repo-Wurzel)

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
# Zahlen: Copernicus (Sept. 2026: 1,63), WMO (2024: 1,55 +-0,13; 2025: 1,43 +-0,13; langfristig 2024: 1,34-1,41), Ziel 1,5
png(file.path(out, "kap06_grafik1_erwaermung.png"), width = 2000, height = 1000, res = 200)
theme_start(mar = c(8.5, 17, 4.6, 3))
y <- c(4, 3, 2, 1)
plot(NA, xlim = c(1.0, 1.85), ylim = c(0.4, 4.6), xaxt = "n", yaxt = "n", xlab = "", ylab = "")
abline(v = seq(1.0, 1.8, 0.2), col = grid)
axis(1, at = seq(1.0, 1.8, 0.2), labels = format(seq(1.0, 1.8, 0.2), decimal.mark = ","), tick = FALSE)
axis(2, at = y, tick = FALSE, cex.axis = 0.9,
     labels = c("Monat: September 2026", "Kalenderjahr 2024", "Kalenderjahr 2025", "Langfristige Erwärmung (für 2024)"))
mtext("Grad über dem vorindustriellen Niveau (1850–1900)", side = 1, line = 2.6, cex = 0.9, col = ink)
abline(v = 1.5, col = orange, lwd = 2.5, lty = 2)
text(1.505, 4.45, "1,5-Grad-Marke", adj = 0, col = orange, cex = 0.85, font = 2)
# Monat
points(1.63, 4, pch = 21, bg = blau, col = "white", cex = 2.2, lwd = 1.5)
text(1.65, 4, "1,63", adj = 0, col = ink, cex = 0.95, font = 2)
# Jahre mit Unsicherheit
segments(1.55 - 0.13, 3, 1.55 + 0.13, 3, col = grau, lwd = 2.5)
points(1.55, 3, pch = 21, bg = blau, col = "white", cex = 2.2, lwd = 1.5)
text(1.69, 3, "1,55 (±0,13)", adj = 0, col = ink, cex = 0.95, font = 2)
segments(1.43 - 0.13, 2, 1.43 + 0.13, 2, col = grau, lwd = 2.5)
points(1.43, 2, pch = 21, bg = blau, col = "white", cex = 2.2, lwd = 1.5)
text(1.57, 2, "1,43 (±0,13)", adj = 0, col = ink, cex = 0.95, font = 2)
# langfristig
segments(1.34, 1, 1.41, 1, col = blau, lwd = 10, lend = 1)
text(1.33, 1, "1,34 bis 1,41", adj = 1, col = ink, cex = 0.95, font = 2)
titel("Ein Monat über 1,5 Grad heißt nicht, dass das Ziel verfehlt ist",
      "Globale Erwärmung gegenüber 1850–1900: Monat, Kalenderjahre und langfristiger Wert")
quelle("Quellen: Copernicus Climate Change Service (12.10.2026), WMO (Jahre 2024 und 2025, jeweils ±0,13 Grad; langfristige Erwärmung für 2024: 1,34–1,41 Grad). Monats-, Jahres- und Langfristwerte stammen aus verschiedenen Datensätzen und Methoden und sind nicht direkt vergleichbar. Für das Pariser Ziel zählt das 20-Jahres-Mittel (IPCC). Zusammenstellung: Klima Kompass.")
dev.off()

## ---------------------------------------------------------------- Grafik 2
# UNEP EGR 2026 (Executive Summary): noetige Minderung ggue. 2025: 18 % (2030), 45 % (2035), 69 % (2040);
# NDC-Umsetzung: 5-8 %, 11-15 %, 20-27 %.
png(file.path(out, "kap06_grafik2_unep_minderung.png"), width = 2000, height = 1100, res = 200)
theme_start()
jahre <- c("2030", "2035", "2040")
noetig <- c(18, 45, 69)
ndc_lo <- c(5, 11, 20); ndc_hi <- c(8, 15, 27)
plot(NA, xlim = c(0.5, 3.6), ylim = c(0, 96), xaxt = "n", yaxt = "n", xlab = "", ylab = "Minderung der Treibhausgasemissionen gegenüber 2025 (%)")
abline(h = seq(0, 80, 20), col = grid)
axis(2, at = seq(0, 80, 20), tick = FALSE)
axis(1, at = 1:3, labels = jahre, tick = FALSE, cex.axis = 1.1, line = -0.2)
w <- 0.28
rect(1:3 - 0.30, 0, 1:3 - 0.02, noetig, col = blau, border = NA)
rect(1:3 + 0.02, ndc_lo, 1:3 + 0.30, ndc_hi, col = orange, border = NA)
text(1:3 - 0.16, noetig + 3.5, paste0("−", noetig, " %"), cex = 1, font = 2, col = ink)
text(1:3 + 0.16, ndc_hi + 3.5, paste0("−", ndc_lo, " bis −", ndc_hi, " %"), cex = 0.85, font = 2, col = ink)
legend("topleft", bty = "n", cex = 0.95, text.col = ink, fill = c(blau, orange), border = NA,
       legend = c("Nötig für den Weg zurück auf 1,5 Grad (UNEP-Szenario „kleinstmögliches Überschießen“)",
                  "Bei voller Umsetzung der Klimazusagen (NDCs), Spanne"))
titel("Die neuen Klimazusagen liegen weit unter dem UNEP-Weg zurück",
      "Emissionsminderung bis 2030, 2035 und 2040 gegenüber 2025: UNEP-Szenario gegen neue Klimazusagen (NDCs)")
quelle("Quelle: UNEP, Emissions Gap Report 2026: The Point of Return, Executive Summary und Pressemitteilung (21.10.2026). Szenario- und Zusagenwerte, keine Messungen. Ein UNEP-Szenario ist keine Vorhersage. Weitere Spannen im Text (z. B. 2030: 15–36 %).")
dev.off()

## ---------------------------------------------------------------- Grafik 3
# State of CDR, 3. Ausgabe (Juni 2026): Luecke Zusagen vs. Paris-Szenarien: 0,3 (2030), 1,2 (2035), 5,2 (2050) Mrd. t CO2/Jahr
png(file.path(out, "kap06_grafik3_cdr_luecke.png"), width = 2000, height = 1100, res = 200)
theme_start()
luecke <- c(0.3, 1.2, 5.2)
bp <- barplot(luecke, names.arg = c("2030", "2035", "2050"), col = blau, border = NA, ylim = c(0, 6.4), yaxt = "n", space = 0.6,
              ylab = "Lücke in Milliarden Tonnen CO2 pro Jahr", cex.names = 1.1)
abline(h = 0:6, col = grid)
barplot(luecke, col = blau, border = NA, add = TRUE, yaxt = "n", space = 0.6, names.arg = rep("", 3))
axis(2, at = 0:6, labels = format(0:6, decimal.mark = ","), tick = FALSE)
text(bp, luecke + 0.28, format(luecke, decimal.mark = ","), cex = 1.1, font = 2, col = ink)
text(mean(bp[1:2]), 5.7, "Zum Vergleich heute: rund 2,2 Mrd. t pro Jahr entnommen,\ndavon neuartige Verfahren nur rund 2 Mio. t", adj = 0.5, col = ink, cex = 0.9)
titel("Die Lücke bei der CO2-Entnahme wächst mit der Zeit",
      "Lücke zwischen den Zusagen der Staaten und Paris-kompatiblen Szenarien, Milliarden Tonnen CO2 pro Jahr")
quelle("Quelle: The State of Carbon Dioxide Removal, 3. Ausgabe (Juni 2026), Executive Summary. Zusagen 2030: 2,5 Mrd. t pro Jahr; Median der ehrgeizigsten Paris-kompatiblen Szenarien 2030: 2,9 Mrd. t. Schätzungen mit teils großen Unsicherheiten, keine eigene Analyse.")
dev.off()
cat("Grafiken geschrieben nach", out, "\n")
