# Jahrbuch 2026, Kapitel 2: zwei Grafiken
# Nur Darstellung vorhandener Ergebnisse und Quellenzahlen, keine neue Rechnung.
# Aufruf: Rscript kap02_grafiken.R   (Arbeitsverzeichnis: Repo-Wurzel)

repo <- getwd()
out  <- file.path(repo, "Publikationen-oeffentlich/jahrbuch-2026/grafiken")
dir.create(out, showWarnings = FALSE, recursive = TRUE)

ink <- "#2b2b2b"; muted <- "#6b6b6b"; grid <- "#e3e3e3"
blau <- "#1f6f9f"; orange <- "#c4501b"; grau <- "#9a9a9a"

theme_start <- function(mar = c(7, 7.2, 4.6, 2)) {
  par(mar = mar, mgp = c(5, 0.8, 0), family = "sans", col.axis = muted, col.lab = ink,
      fg = muted, bty = "n", las = 1, cex.axis = 0.95)
}
titel <- function(haupt, unter) {
  mtext(haupt, side = 3, line = 2.6, adj = 0, font = 2, cex = 1.35, col = ink)
  mtext(unter, side = 3, line = 0.9, adj = 0, cex = 0.95, col = muted)
}
quelle <- function(txt) {
  z <- strwrap(txt, width = 135)
  for (i in seq_along(z)) mtext(z[i], side = 1, line = 3.6 + 0.9 * i, adj = 0, cex = 0.72, col = muted)
}
raster <- function(ys) abline(h = ys, col = grid, lwd = 1)

## ---------------------------------------------------------------- Grafik 1
# Quelle: Eurostat nrg_cb_gasm (Netto-Entnahme Oktober-März), Evidenzcheck 14.09.2026
d1 <- read.csv(file.path(repo, "Analysen/2026-09-gasspeicher-winter/output/tabelle1_winter.csv"), sep = ";")
d1 <- d1[d1$winter >= "2016/17", c("winter", "netto_entnahme_twh")]
stopifnot(nrow(d1) == 10)
png(file.path(out, "kap02_grafik1_gas_entnahme.png"), width = 2000, height = 1100, res = 200)
theme_start()
farben <- ifelse(d1$winter == "2025/26", blau, grau)
bp <- barplot(d1$netto_entnahme_twh, names.arg = d1$winter, col = farben, border = NA, ylim = c(0, 215),
              yaxt = "n", ylab = "Netto-Entnahme aus den Speichern (TWh)", cex.names = 0.9, space = 0.35)
raster(seq(0, 200, 50))
barplot(d1$netto_entnahme_twh, col = farben, border = NA, add = TRUE, yaxt = "n", space = 0.35)
axis(2, at = seq(0, 200, 50), tick = FALSE)
abline(h = 122, col = ink, lwd = 1.6, lty = 2)
abline(h = 136, col = orange, lwd = 2)
text(bp[1] - 0.6, 199, "Gestrichelt: Median der zehn Winter, 122 TWh", adj = 0, col = ink, cex = 0.85)
text(bp[1] - 0.6, 209, "Orange: 136 TWh, Speicherstand Mitte September 2026 (laut Medienberichten)", adj = 0, col = orange, cex = 0.85, font = 2)
text(bp, d1$netto_entnahme_twh + 6, labels = format(d1$netto_entnahme_twh, decimal.mark = ",", nsmall = 1, trim = TRUE),
     cex = 0.8, col = ink)
titel("Die Winter-Entnahme schwankt stark",
      "Netto-Entnahme aus den deutschen Gasspeichern pro Winterhalbjahr (Oktober bis März), 2016/17 bis 2025/26")
quelle("Quelle: Eurostat (nrg_cb_gasm), Auswertung: Klima Kompass, Evidenzcheck vom 14.09.2026. Blau: Winter 2025/26 (133,7 TWh). Die 136 TWh sind ein Speicherstand, keine Entnahme.")
dev.off()

## ---------------------------------------------------------------- Grafik 2
# Quelle: SMARD (Bundesnetzagentur), Marktstammdatenregister; Evidenzcheck 31.08.2026
d2 <- read.csv(file.path(repo, "Analysen/2026-08-batteriespeicher-dunkelflaute/output/tabelle1_episodenliste.csv"))
stopifnot(nrow(d2) == 50)
png(file.path(out, "kap02_grafik2_dunkelflaute_batterie.png"), width = 2000, height = 1150, res = 200)
theme_start(mar = c(8.5, 7.2, 4.6, 2))
x <- d2$Episode
plot(NA, xlim = c(0, 52), ylim = c(0, 16000), xaxt = "n", yaxt = "n", xlab = "",
     ylab = "Fehlende Energie in der Episode (GWh)")
raster(seq(0, 15000, 5000))
axis(2, at = seq(0, 15000, 5000), labels = format(seq(0, 15000, 5000), big.mark = ".", trim = TRUE), tick = FALSE)
jahre <- as.integer(substr(d2$Start, 1, 4))
erste <- tapply(x, jahre, min)
axis(1, at = erste, labels = names(erste), tick = FALSE, line = -0.5, cex.axis = 0.8)
mtext("Jahr der Dunkelflaute (Beginn der Episode)", side = 1, line = 2.6, cex = 0.9, col = ink)
rect(x - 0.38, 0, x + 0.38, d2$Energiedefizit_GWh, col = grau, border = NA)
abline(h = 4301, col = ink, lwd = 1.6, lty = 2)
text(51.5, 15500, "Gestrichelt: Median der Episoden, 4.301 GWh", adj = 1, col = ink, cex = 0.85)
abline(h = 31.5, col = blau, lwd = 3)
text(51.5, 14400, "Blau: installierte Batteriekapazität (bereinigt), 31,5 GWh", adj = 1, col = blau, cex = 0.9, font = 2)
titel("Gegen die Dunkelflauten wirkt die heutige Batteriekapazität klein",
      "50 Dunkelflaute-Episoden 2015–2026: fehlende Energie je Episode und installierte Batteriekapazität")
quelle("Quelle: SMARD (Bundesnetzagentur), Marktstammdatenregister (Stand 31.08.2026, nachträglich bereinigt); Auswertung: Klima Kompass, Evidenzcheck vom 31.08.2026. Kapazität nicht eins zu eins nutzbar, Importe nicht berücksichtigt.")
dev.off()
cat("Grafiken geschrieben nach", out, "\n")
