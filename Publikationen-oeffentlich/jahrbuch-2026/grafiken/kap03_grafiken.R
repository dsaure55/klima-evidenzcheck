# Jahrbuch 2026, Kapitel 3: zwei Grafiken
# Nur Darstellung vorhandener Zahlen aus den zitierten Quellen, keine neue Rechnung.
# Aufruf: Rscript kap03_grafiken.R   (Arbeitsverzeichnis: Repo-Wurzel)

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

## ---------------------------------------------------------------- Grafik 1
# Zahlen aus "65 Euro rein, 59 Euro raus" (Fassung nach Korrektur vom 17.10.2026):
# CO2-Preis bei 65 EUR/t (mit MwSt): Benzin 17,6-18,3 ct/l, Diesel rund 20 ct/l; Tankrabatt Mai/Juni 16,7 ct/l (mit MwSt).
png(file.path(out, "kap03_grafik1_co2_preis_tankrabatt.png"), width = 2000, height = 1000, res = 200)
theme_start(mar = c(9, 9, 4.6, 2))
plot(NA, xlim = c(0, 33), ylim = c(0.4, 2.6), xaxt = "n", yaxt = "n", xlab = "", ylab = "")
mtext("Cent je Liter (mit Mehrwertsteuer)", side = 1, line = 2.6, cex = 0.95, col = ink)
abline(v = seq(0, 20, 5), col = grid)
axis(1, at = seq(0, 20, 5), tick = FALSE)
axis(2, at = c(1, 2), labels = c("Diesel", "Benzin"), tick = FALSE, cex.axis = 1.1)
# Benzin (y = 2)
segments(17.6, 2, 18.3, 2, col = orange, lwd = 14, lend = 1)
points(16.7, 2, pch = 21, bg = blau, col = "white", cex = 2.6, lwd = 1.5)
text(18.9, 2, "CO2-Preis bei 65 €/t: 17,6–18,3 ct", adj = 0, col = orange, cex = 0.9, font = 2)
text(16.7, 2.27, "Tankrabatt: 16,7 ct", adj = 1, col = blau, cex = 0.9, font = 2)
# Diesel (y = 1)
points(20, 1, pch = 21, bg = orange, col = "white", cex = 2.6, lwd = 1.5)
points(16.7, 1, pch = 21, bg = blau, col = "white", cex = 2.6, lwd = 1.5)
text(20.5, 1, "CO2-Preis: rund 20 ct", adj = 0, col = orange, cex = 0.9, font = 2)
text(16.7, 1.27, "Tankrabatt: 16,7 ct", adj = 1, col = blau, cex = 0.9, font = 2)
titel("Der Tankrabatt glich den CO2-Preis fast aus",
      "Aufschlag durch den CO2-Preis bei 65 Euro pro Tonne und Tankrabatt Mai/Juni 2026, in Cent je Liter")
quelle("Quelle: Klima Kompass, Rechenkommentar „65 Euro rein, 59 Euro raus“ (18.09.2026, Fassung nach Korrektur vom 17.10.2026). Bei Diesel kamen laut ifo-Institut rund 72 Prozent des Rabatts an. Kein Evidenzcheck, keine präregistrierte Analyse.")
dev.off()

## ---------------------------------------------------------------- Grafik 2
# Zahlen aus KfW Research, Fokus Volkswirtschaft Nr. 561 (12.10.2026), Mrd. EUR pro Jahr, Preise 2024:
# brutto: bisher (2018-2023) 110, noetig (2025-2045) 290; Mehrkosten ("Nettoinvestitionen"): bisher 80, noetig 145.
bisher <- c(110, 80); noetig <- c(290, 145)
png(file.path(out, "kap03_grafik2_kfw_investitionen.png"), width = 2000, height = 1100, res = 200)
theme_start(mar = c(9, 7.2, 4.6, 2))
m <- rbind(bisher, noetig)
bp <- barplot(m, beside = TRUE, col = c(grau, blau), border = NA, ylim = c(0, 340), yaxt = "n",
              names.arg = c("Bruttoinvestitionen\n(voller Preis der Anlage)", "Mehrkosten\n(Aufpreis gegenüber fossiler Technik)"),
              cex.names = 0.95, space = c(0.15, 1.2), ylab = "Milliarden Euro pro Jahr (Preise 2024)")
abline(h = seq(0, 300, 100), col = grid)
barplot(m, beside = TRUE, col = c(grau, blau), border = NA, add = TRUE, yaxt = "n", space = c(0.15, 1.2), names.arg = rep("", 2))
axis(2, at = seq(0, 300, 100), tick = FALSE)
text(bp, m + 14, labels = m, cex = 1.1, font = 2, col = ink)
legend("topright", bty = "n", cex = 0.95, text.col = ink, fill = c(grau, blau), border = NA,
       legend = c("Durchschnitt 2018–2023 (bisher)", "nötiger Durchschnitt 2025–2045"))
text(mean(bp[, 2]), 195, "Zusätzlich nötig: rund 65 Mrd. € pro Jahr\n(etwa 1,5 % des BIP 2024)", col = ink, cex = 0.95, font = 2)
titel("6 Billionen sind Investitionen, die Mehrkosten sind kleiner",
      "Klimaschutzinvestitionen in Deutschland pro Jahr, bisher und nötig, brutto und als Mehrkosten")
quelle("Quelle: KfW Research, Fokus Volkswirtschaft Nr. 561 (12.10.2026), Berechnungen: Prognos. Modellrechnung auf Basis von Szenarien (Mittel der vier Szenarien), keine eigene Analyse. 6 Billionen Euro = Summe der Bruttoinvestitionen 2025–2045 (je nach Szenario 5,7 bis 6,4).")
dev.off()
cat("Grafiken geschrieben nach", out, "\n")
