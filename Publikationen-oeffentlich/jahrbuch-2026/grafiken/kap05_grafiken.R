# Jahrbuch 2026, Kapitel 5: zwei Grafiken
# Nur Darstellung vorhandener Ergebnisse (Evidenzcheck 31.08.2026), keine neue Rechnung.
# Aufruf: Rscript kap05_grafiken.R   (Arbeitsverzeichnis: Repo-Wurzel)

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
d1 <- read.csv(file.path(repo, "Analysen/2026-08-trittbrettfahrer-rechnung/output/estimand1a_konzentrationskurve_edgar_2024.csv"))
stopifnot(nrow(d1) == 208, d1$code[12] == "DEU")
cum11 <- d1$cum_share[11] * 100
png(file.path(out, "kap05_grafik1_konzentrationskurve.png"), width = 2000, height = 1100, res = 200)
theme_start()
plot(NA, xlim = c(0, 212), ylim = c(0, 100), xaxt = "n", yaxt = "n", xlab = "", ylab = "Kumulierter Anteil an den weltweiten Emissionen (%)")
abline(h = seq(0, 100, 25), col = grid)
axis(1, at = c(1, 12, 50, 100, 150, 208), tick = FALSE)
axis(2, at = seq(0, 100, 25), tick = FALSE)
mtext("Rang des Landes (1 = größter Emittent)", side = 1, line = 2.6, cex = 0.95, col = ink)
lines(d1$rank, d1$cum_share * 100, col = grau, lwd = 3)
segments(11, cum11, 208, cum11, col = orange, lwd = 2, lty = 2)
segments(12, 0, 12, d1$cum_share[12] * 100, col = blau, lwd = 2, lty = 3)
points(12, d1$cum_share[12] * 100, pch = 21, bg = blau, col = "white", cex = 1.9, lwd = 1.5)
text(16, d1$cum_share[12] * 100 - 9, "Deutschland: Rang 12, Anteil 1,3 %", adj = 0, col = blau, cex = 0.9, font = 2)
text(208, cum11 + 9, "Die 11 größten Länder: 68,3 %. Deutschland und alle kleineren zusammen: 31,7 %", adj = 1, col = orange, cex = 0.85, font = 2)
titel("Länder so klein wie Deutschland oder kleiner: fast ein Drittel",
      "Treibhausgasemissionen 2024: 208 Länder nach Anteil sortiert, kumuliert")
quelle("Quelle: EDGAR (EU JRC), alle Treibhausgase in CO2-Äquivalenten, 2024; Auswertung: Klima Kompass, Evidenzcheck „Die Trittbrettfahrer-Rechnung“ vom 31.08.2026. Produktionsbasiert (Emissionen dort gezählt, wo sie entstehen). Gedankenexperiment, keine Schuldfrage.")
dev.off()

## ---------------------------------------------------------------- Grafik 2
# Zahlen aus dem Evidenzcheck vom 31.08.2026: Summe der Anteile aller Laender mit Anteil <= Deutschland
labs <- c("Heute, Treibhausgase 2024 (Hauptvariante)",
          "Heute, nur CO2 2024",
          "Heute, konsumbasiert, nur CO2 2023",
          "Heute, nur Länder mit überdurchschnittlichem Pro-Kopf-Ausstoß",
          "Historisch seit 1850, fossiles CO2 + Zement (Hauptvariante)",
          "Historisch seit 1850, mit Landnutzung")
werte <- c(31.7, 30.1, 40.5, 14.2, 53.1, 54.0)
farben <- c(blau, grau, grau, grau, orange, grau)
png(file.path(out, "kap05_grafik2_varianten.png"), width = 2000, height = 1100, res = 200)
theme_start(mar = c(8.5, 24, 4.6, 3))
y <- rev(seq_along(werte))
plot(NA, xlim = c(0, 65), ylim = c(0.4, 6.6), xaxt = "n", yaxt = "n", xlab = "", ylab = "")
abline(v = seq(0, 60, 20), col = grid)
axis(1, at = seq(0, 60, 20), labels = paste0(seq(0, 60, 20), " %"), tick = FALSE)
axis(2, at = y, labels = labs, tick = FALSE, cex.axis = 0.85, las = 1)
rect(0, y - 0.32, werte, y + 0.32, col = farben, border = NA)
text(werte + 1, y, paste0(format(werte, decimal.mark = ",", nsmall = 1), " %"), adj = 0, cex = 0.95, col = ink, font = 2)
mtext("Prozent der weltweiten Emissionen", side = 1, line = 2.8, cex = 0.9, col = ink)
titel("Je nach Maßstab zwischen 14 und 54 Prozent",
      "Summe der Emissionsanteile aller Länder mit höchstens deutschem Anteil, sechs Varianten")
quelle("Quelle: Klima Kompass, Evidenzcheck „Die Trittbrettfahrer-Rechnung“ vom 31.08.2026. Die Varianten sind nicht direkt vergleichbar (verschiedene Gase, Jahre, Zeiträume, Bezugsgruppen). Konsumbasiert: nach OWID. Historisch mit Landnutzung: Mittel dreier Modelle, höhere Unsicherheit.")
dev.off()
cat("Grafiken geschrieben nach", out, "\n")
