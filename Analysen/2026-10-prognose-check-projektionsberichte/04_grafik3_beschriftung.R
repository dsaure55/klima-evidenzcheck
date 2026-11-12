# =============================================================================
# Prognose-Check #1 - 04_grafik3_beschriftung.R
# POST-HOC / nach Validierung und Faktencheck des Artikelentwurfs (12.11.2026).
# Nur Beschriftung: Grafik 3 neu gezeichnet. Die Legende nannte "Inventarrevision/GWP"
# als Ursache des Startpunkts; das ist nicht belegt (Analysebericht Abschnitt 3,
# Abweichungsprotokoll H19). Neu: "Startpunktabweichung (Abstand im Ausgangsjahr)".
# Datenbasis: output/e5_zerlegung.csv (auf ganze Mt gerundet, so wie im Analysebericht
# berichtet); Balken daher um bis zu 0,5 Mt von der Originalgrafik verschieden.
# Keine Rechnung, keine Zufallskomponente. Skripte 02 und 03 unveraendert.
# =============================================================================
args_all <- commandArgs(trailingOnly = FALSE)
file_arg <- sub("^--file=", "", args_all[grepl("^--file=", args_all)])
BASE <- if (length(file_arg)) dirname(normalizePath(file_arg)) else getwd()
OUT <- file.path(BASE, "output")
e5 <- read.csv(file.path(OUT, "e5_zerlegung.csv"), encoding = "UTF-8")
d3 <- e5[e5$Szenario == "MMS" & e5$Zieljahr_t == 2020, ]
d3 <- d3[order(d3$Bericht), ]
stopifnot(nrow(d3) == 3)
png(file.path(OUT, "grafik3_E5_zerlegung_2020.png"), width = 1300, height = 900, res = 150)
par(mar = c(4.5, 4.8, 4, 1) + 0.1)
ylim3 <- range(c(0, d3$Startpunkt_Mt, d3$Verlauf_Mt, d3$E_unb_Mt)) * 1.25
plot(NA, xlim = c(0.4, nrow(d3) + 0.6), ylim = ylim3, xaxt = "n", xlab = "",
     ylab = "Abweichung unbereinigt, E_unb = Startpunkt + Verlauf (Mt CO2e)", las = 1)
abline(h = 0, col = "grey40"); grid(col = "grey88")
for (i in seq_len(nrow(d3))) {
  pos <- 0; neg <- 0
  for (comp in c("Startpunkt_Mt", "Verlauf_Mt")) {
    v <- d3[[comp]][i]; colr <- if (comp == "Startpunkt_Mt") "#4575b4" else "#fdae61"
    if (v >= 0) { rect(i - 0.3, pos, i + 0.3, pos + v, col = colr, border = "grey30"); pos <- pos + v }
    else { rect(i - 0.3, neg + v, i + 0.3, neg, col = colr, border = "grey30"); neg <- neg + v }
  }
  points(i, d3$E_unb_Mt[i], pch = 18, cex = 2, col = "black")
  text(i, d3$E_unb_Mt[i], labels = sprintf("E_unb = %.0f", d3$E_unb_Mt[i]), pos = 4, cex = 0.7)
}
axis(1, at = seq_len(nrow(d3)), labels = paste0("Bericht ", d3$Bericht, "\nFaktor ", sprintf("%.3f", d3$Faktor)))
legend("topright", legend = c("Startpunktabweichung (Abstand im Ausgangsjahr)", "additive Verlaufsabweichung", "E_unb gesamt"),
       fill = c("#4575b4", "#fdae61", NA), pch = c(NA, NA, 18), border = c("grey30", "grey30", NA), cex = 0.75, bg = "white")
title(main = "Grafik 3: Zerlegung der unbereinigten Abweichung fuer Zieljahr 2020 (gesamt, MMS)", line = 2.2, cex.main = 1.0)
mtext("Ohne Bereinigung um spaetere Inventarrevisionen; Zerlegung ist keine Ursachenanalyse", side = 3, line = 0.6, cex = 0.7)
dev.off()
cat("Grafik 3 neu beschriftet:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n")
