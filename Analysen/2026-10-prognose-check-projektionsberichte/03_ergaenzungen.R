# =============================================================================
# Prognose-Check #1 - 03_ergaenzungen.R
# POST-HOC / NACH VALIDIERUNG (Validierungsbericht 11.11.2026, Auflagen B3, B4, B6, B7, R2)
# -----------------------------------------------------------------------------
# SAP:    v1.2 final (inkl. Amendment 1 und 2). Skript 02_auswertung.R bleibt
#         unveraendert. Dieses Skript liest nur Ausgaben von 02 (output/*.csv)
#         und ergaenzt:
#   (A) SAP 5.4 / Auflage B4: Ist-Wert 2020 im Band der Sensitivitaetsrechnungen
#       der Berichte 2015, 2017, 2019 (E1). Werte von Hand aus den PDF-Tabellen
#       uebertragen (Fundstellen unten); Kontrolle: MMS-Referenzzeile der
#       Sensitivitaetstabelle == P(b,MMS,2020,gesamt) aus der Extraktionstabelle.
#   (B) Auflage B3: Beschreibung der Faktoren Abfallwirtschaft/Sonstiges.
#   (C) Auflage B7: Leave-one-report-out fuer E3.
#   (D) Auflage B6 / SAP 6 (S6): Dokumentation der Pruefung J_b und P(b,s,J_b)
#       fuer die UBA-Projektionsdaten 2024/2025 (Befund: S6 nicht berechenbar).
#   (E) Auflage R2: Grafik 1 neu gezeichnet (Legende verschoben).
# Kennzeichnung: alles "Post-hoc / nach Validierung" (siehe Abweichungsprotokoll
# Abschnitt E). Kein Netzzugriff. Keine Zufallskomponente.
# =============================================================================
options(stringsAsFactors = FALSE, width = 200)
args_all <- commandArgs(trailingOnly = FALSE)
file_arg <- sub("^--file=", "", args_all[grepl("^--file=", args_all)])
BASE <- if (length(file_arg)) dirname(normalizePath(file_arg)) else getwd()
OUT <- file.path(BASE, "output"); of <- function(...) file.path(OUT, ...)
wcsv <- function(d, f) write.csv(d, of(f), row.names = FALSE, na = "", fileEncoding = "UTF-8")
con_log <- file(of("03_ergaenzungen_konsole.txt"), open = "wt", encoding = "UTF-8"); sink(con_log, split = TRUE)
cat("03_ergaenzungen.R - Post-hoc / nach Validierung;", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n", R.version.string, "\n\n")

ser  <- read.csv(of("reihen_P_verwendet.csv"), encoding = "UTF-8")
Aref <- read.csv(of("referenzinventar_A_verwendet.csv"), encoding = "UTF-8", check.names = FALSE)
pairs <- read.csv(of("paare_alle_voll.csv"), encoding = "UTF-8")
fak  <- read.csv(of("umskalierungsfaktoren.csv"), encoding = "UTF-8")
A2020 <- Aref[Aref$jahr == 2020, "gesamt"]
JB <- c("2015" = 2012, "2017" = 2014, "2019" = 2016, "2021" = 2018, "2023" = 2019)

# ---------------------------------------------------------------------------
# (A) SAP 5.4: Sensitivitaetsband der Berichte fuer das Zieljahr 2020 (Gesamt, MMS)
# ---------------------------------------------------------------------------
cat("== (A) SAP 5.4: Ist-Wert 2020 im Band der berichtseigenen Sensitivitaetsrechnungen ==\n")
sens <- rbind(
  # Bericht 2015, Tab. 3-77 (PDF-S. 196), Zeile 'Gesamtemissionen (ohne int. Verkehr)', Spalte 2020
  data.frame(bericht = 2015, variante = c("MMS (Referenz)", "Sens. gesamtwirtschaftliche Entwicklung (niedrigeres Wachstum)", "Sens. demographische Entwicklung (hoeheres Bev.wachstum)",
                                         "Sens. Brennstoffpreise", "Sens. Stromexport (geringerer Exportsaldo)"),
             wert = c(840.5, 826.5, 842.2, 848.8, 825.1), fundstelle = "PB2015 Tab. 3-77, PDF-S. 196"),
  # Bericht 2017, Tab. 3-133 (PDF-S. 273/274), Zeile 'Gesamtemissionen (ohne int. Verkehr & LULUCF)', Spalte 2020
  data.frame(bericht = 2017, variante = c("MMS (Referenz)", "Staerkeres Wirtschaftswachstum", "Hoehere Bevoelkerung", "Niedrigere CO2- und Brennstoffpreise",
                                         "Weniger Stromexport (fuer MMS aus MWMS uebernommen, Fussnote 3 Tab. 1-4)"),
             wert = c(816.4, 829.1, 826.9, 816.9, 780.6), fundstelle = "PB2017 Tab. 3-133, PDF-S. 274"),
  # Bericht 2019, Tab. 106 (PDF-S. 216), Zeile 'Gesamtemissionen (ohne int. Verkehr & LULUCF)', Spalte 2020
  data.frame(bericht = 2019, variante = c("MMS (Referenz)", "Schwaecheres Wirtschaftswachstum", "Niedrigere Bevoelkerungsentwicklung", "Mittelfristig niedrigere CO2- und Brennstoffpreise"),
             wert = c(835.6, 822.8, 833.7, 830.4), fundstelle = "PB2019 Tab. 106, PDF-S. 216"))
# Kontrolle gegen Extraktionstabelle (P(b,MMS,2020,gesamt))
for (b in c(2015, 2017, 2019)) {
  p <- ser$wert[ser$bericht == b & ser$szenario == "MMS" & ser$sektor == "gesamt" & ser$jahr == 2020]
  stopifnot(abs(p - sens$wert[sens$bericht == b & grepl("^MMS", sens$variante)]) < 0.05)
}
cat("Kontrolle: MMS-Referenzzeilen der Sensitivitaetstabellen == Extraktionswerte 2020 (0,05 Mt)\n")
fk <- sapply(c(2015, 2017, 2019), function(b) fak$faktor[fak$bericht == b & fak$szenario == "MMS" & fak$sektor == "gesamt"]); names(fk) <- c(2015, 2017, 2019)
band <- do.call(rbind, lapply(c(2015, 2017, 2019), function(b) {
  d <- sens[sens$bericht == b & !grepl("^MMS", sens$variante), ]
  data.frame(bericht = b, anzahl_sensitivitaeten = nrow(d), band_unb_min = min(d$wert), band_unb_max = max(d$wert),
             faktor = fk[[as.character(b)]], band_star_min = min(d$wert) * fk[[as.character(b)]], band_star_max = max(d$wert) * fk[[as.character(b)]],
             A_2020 = A2020,
             ist_im_band_unb = A2020 >= min(d$wert) & A2020 <= max(d$wert),
             ist_im_band_star = A2020 >= min(d$wert) * fk[[as.character(b)]] & A2020 <= max(d$wert) * fk[[as.character(b)]],
             abstand_Ist_zu_Bandminimum_star_Mt = A2020 - min(d$wert) * fk[[as.character(b)]],
             abstand_Ist_zu_Bandminimum_unb_Mt = A2020 - min(d$wert))
}))
# Zusaetzlich Bericht 2015: kombinierter Korridor (Text PDF-S. 22): -31,9 % ... -35,0 % ggue. 1990.
# 1990-Basis aus der MMS-Angabe (-32,7 % = 840,5 Mt, Tab. 3-77) rueckgerechnet -> NAEHERUNG (Rundung der Prozentangabe).
b90 <- 840.5 / (1 - 0.327)
corr <- data.frame(bericht = 2015, korridor_pct = c(-31.9, -35.0), naeherung_Mt = b90 * (1 + c(-31.9, -35.0) / 100))
corr$naeherung_Mt_star <- corr$naeherung_Mt * fk[["2015"]]
cat("PB2015 kombinierter Korridor (Naeherung aus Prozentangaben): ", paste(round(corr$naeherung_Mt, 1), collapse = " bis "), " Mt (unb.), ", paste(round(corr$naeherung_Mt_star, 1), collapse = " bis "), " Mt (bereinigt)\n", sep = "")
band_out <- band; band_out[, c("band_unb_min", "band_unb_max", "band_star_min", "band_star_max", "A_2020", "abstand_Ist_zu_Bandminimum_star_Mt", "abstand_Ist_zu_Bandminimum_unb_Mt")] <-
  round(band_out[, c("band_unb_min", "band_unb_max", "band_star_min", "band_star_max", "A_2020", "abstand_Ist_zu_Bandminimum_star_Mt", "abstand_Ist_zu_Bandminimum_unb_Mt")], 1)
band_out$faktor <- round(band_out$faktor, 3)
band_out$hinweis <- "POST-HOC / nach Validierung (Auflage B4). Band = Spannweite der berichtseigenen Einzel-Sensitivitaeten (Gesamt, 2020). Nur fuer E1-Berichte 2015/2017/2019; PB2021/PB2023 ohne 2020-Paar."
wcsv(band_out, "e1_ist_im_sensitivitaetsband.csv"); wcsv(cbind(sens, hinweis = "Handuebertragung aus PDF-Tabellen; Kontrolle gegen Extraktionstabelle fuer MMS-Referenz"), "e1_sensitivitaetswerte_berichte_2020.csv")
wcsv(cbind(corr, hinweis = "Naeherung: 1990-Basis aus MMS-Prozentangabe rueckgerechnet; PB2015 S. 22 nennt Korridor nur in Prozent ggue. 1990"), "e1_pb2015_korridor_naeherung.csv")
print(band_out, row.names = FALSE)
cat("-> In allen drei Berichten lag der Ist-Wert 2020 unterhalb des gesamten Bereichs der ausgewiesenen Sensitivitaetswerte (bereinigt und unbereinigt).\n")

# ---------------------------------------------------------------------------
# (B) Auflage B3: Abfallwirtschaft und Sonstiges - Faktoren beschreibend
# ---------------------------------------------------------------------------
cat("\n== (B) Faktoren Sektor Abfallwirtschaft und Sonstiges (beschreibend) ==\n")
ab <- fak[fak$sektor == "Abfallwirtschaft und Sonstiges" & fak$szenario == "MMS", c("bericht", "J_b", "P_Jb", "A_Jb", "faktor")]
ab$A_Jb_nach_Inventar_Sub2026 <- ab$A_Jb; ab$differenz_Mt <- ab$P_Jb - ab$A_Jb; ab$Bericht_ueber_Inventar_pct <- 100 * (ab$P_Jb / ab$A_Jb - 1)
ab$hinweis <- "Ursache NICHT belegt. Hypothesen: (1) abweichende Sektor-/Quellgruppenabgrenzung oder -zuordnung zwischen Bericht und KSG-Sektor 6; (2) methodische Neuberechnung im Inventar seit dem Berichtsstand (nicht geprueft). Ein GWP-Wechsel allein (CH4 SAR 21 / AR4 25 / AR5 28) wuerde einen HOEHEREN Inventarwert erwarten lassen, nicht den beobachteten niedrigeren."
ab[, c("P_Jb", "A_Jb", "A_Jb_nach_Inventar_Sub2026", "differenz_Mt", "Bericht_ueber_Inventar_pct")] <- round(ab[, c("P_Jb", "A_Jb", "A_Jb_nach_Inventar_Sub2026", "differenz_Mt", "Bericht_ueber_Inventar_pct")], 1)
ab$faktor <- round(ab$faktor, 3)
wcsv(ab, "abfall_faktoren_beschreibung.csv"); print(ab[, 1:8], row.names = FALSE)
# Vergleich: Faktorbereich je Sektor (PB2017-PB2023)
fs <- do.call(rbind, lapply(unique(fak$sektor), function(s) { d <- fak[fak$sektor == s & fak$szenario == "MMS", ]; data.frame(sektor = s, n = nrow(d), faktor_min = round(min(d$faktor), 3), faktor_max = round(max(d$faktor), 3)) }))
wcsv(fs, "faktorbereich_je_sektor.csv"); print(fs, row.names = FALSE)

# ---------------------------------------------------------------------------
# (C) Auflage B7: Leave-one-report-out fuer E3
# ---------------------------------------------------------------------------
cat("\n== (C) E3 Leave-one-report-out ==\n")
e3 <- read.csv(of("e3_einzelwerte.csv"), encoding = "UTF-8")
loo3 <- rbind(data.frame(ohne_Bericht = NA, n = nrow(e3), median_D = median(e3$D), n_D_neg = sum(e3$D < 0)),
              do.call(rbind, lapply(sort(unique(e3$Bericht)), function(b) { d <- e3[e3$Bericht != b, ]; data.frame(ohne_Bericht = b, n = nrow(d), median_D = median(d$D), n_D_neg = sum(d$D < 0)) })))
loo3$median_D <- round(loo3$median_D, 1)
loo3$hinweis <- ifelse(loo3$n < 3, "n < 3: nur Einzelwerte, Median nicht als Kennzahl", ""); loo3$hinweis[1] <- "alle Paare (Primaer)"
wcsv(loo3, "diag_e3_leave_one_report_out.csv"); print(loo3, row.names = FALSE)

# ---------------------------------------------------------------------------
# (D) Auflage B6: S6 - J_b und Verfuegbarkeit P(b,s,J_b) der UBA-Projektionsdaten 2024/2025
# ---------------------------------------------------------------------------
cat("\n== (D) S6: Pruefung ==\n")
s6 <- data.frame(
  projektionsdaten = c("UBA-Projektionsdaten 2024", "UBA-Projektionsdaten 2024", "UBA-Projektionsdaten 2024", "UBA-Projektionsdaten 2025", "UBA-Projektionsdaten 2025", "UBA-Projektionsdaten 2025"),
  punkt = c("J_b", "J_b", "P(b,s,J_b) in beschafften Dateien", "J_b", "Zieljahre im Fenster 2015-2024", "Ergebnis"),
  befund = c("Daten basieren auf dem Inventar 2024 'einschliesslich der Zeitreihe bis 2022'; die Vorjahresschaetzung 2023 'floss nicht in die Modellierung ein' (Ergebnisse kompakt 2024, PDF-S. 11; S. 8). J_b = 2022 (letztes Inventarjahr), ausdruecklich NICHT 2023.",
             "Hinweis: Das ist dieselbe Konstellation wie bei Bericht 2021 (Amendment 1: letztes Inventarjahr). Fuer die Berichte 2024/2025 gibt es keine Festlegung im SAP; die Lesart 'letztes Inventarjahr' ist hier nicht von Daniel entschieden.",
             "Das Kernindikatoren-xlsx (Blatt '1 THG-Emissionen') beginnt bei 2024 (Projektion). Die 'Ergebnisse kompakt' zeigen historische Werte nur in Abbildungen, nicht als Tabelle mit Zahl fuer 2022. Der Hauptbericht 2024 wurde nicht beschafft. Damit liegt in den beschafften Primaerdateien kein P(b,s,2022,k) vor (Regel 2.1 Nr. 3: kein Ersatzwert, EEA-Datenbank ist nur Kreuzpruefquelle).",
             "Basisjahr der Modellierung 2023 (Projektionsbericht 2025, PDF-S. 54, 174: 'Daten fuer die Jahre 1990 bis 2023', 'Basisjahr der Modellierung auf 2023 vorgezogen'); 2024 ist Vorjahresschaetzung (PDF-S. 230, 238), nicht Projektion.",
             "Die Projektionsdaten 2025 (xlsx) beginnen mit 2025; es gibt keinen Projektionswert fuer t <= 2024. Kein Auswertungspaar im Fenster 2015-2024 (SAP 4.2: Zieljahr 2025 nur in S7).",
             "S6 nicht berechenbar: PB2025 ohne Paar im Fenster; PB2024 hat hoechstens ein Zieljahr im Fenster (2024, h = 2) und kein tabellarisches P(b,s,2022). Nicht durchgefuehrt, Grund belegt."))
wcsv(s6, "s6_pruefung.csv")
# Post-hoc-Info (NICHT S6, nicht in Kennzahlen): unbereinigter Vergleich 2024-Wert der Projektionsdaten 2024 mit Ist
library(readxl)
x24 <- as.data.frame(suppressMessages(read_excel(file.path(BASE, "rohdaten/uba_projektionsdaten_S6/projektionen-2024_kernindikatoren_20240624_uba_v2.xlsx"),
        sheet = "1 THG-Emissionen", col_names = FALSE, .name_repair = "minimal")))
hdr <- suppressWarnings(as.numeric(unlist(x24[3, ]))); c24 <- which(hdr == 2024)
mms24 <- as.numeric(x24[6, c24]); mwms24 <- as.numeric(x24[9, c24]); stopifnot(grepl("MMS gesamt", x24[6, 1]), grepl("MWMS gesamt", x24[9, 1]))
A24 <- Aref[Aref$jahr == 2024, "gesamt"]
info <- data.frame(kennzeichnung = "POST-HOC / nach Validierung, nur zur Information, NICHT S6, in keiner Kennzahl",
                   szenario = c("MMS", "MWMS"), P_2024_Mt = c(mms24, mwms24), A_2024_Mt = A24, RE_unb_pct = 100 * (c(mms24, mwms24) - A24) / A24)
info[, 3:5] <- lapply(info[, 3:5], round, 1); wcsv(info, "posthoc_pb2024_wert_2024_info.csv"); print(info, row.names = FALSE)

# ---------------------------------------------------------------------------
# (E) Auflage R2: Grafik 1 mit verschobener Legende (ueberschreibt Datei aus 02)
# ---------------------------------------------------------------------------
COL <- c(`2015` = "#1b9e77", `2017` = "#d95f02", `2019` = "#7570b3", `2021` = "#e7298a", `2023` = "#66a61e")
BER <- c(2015, 2017, 2019, 2021, 2023)
Ag <- setNames(Aref$gesamt, Aref$jahr)
png(of("grafik1_kerngrafik_bereinigt.png"), width = 1500, height = 950, res = 150); par(mar = c(4.5, 4.8, 4, 1) + 0.1)
plot(2005:2024, Ag[as.character(2005:2024)], type = "n", xlim = c(2005, 2026), ylim = c(450, 1010), xlab = "Jahr", ylab = "Treibhausgasemissionen ohne LULUCF (Mt CO2e)", las = 1)
grid(col = "grey88"); abline(v = 2020, lty = 2, col = "grey40"); text(2020, 1005, "Zieljahr 2020", pos = 4, cex = 0.8, col = "grey30")
lines(2005:2024, Ag[as.character(2005:2024)], lwd = 3.5); points(2025, Ag[["2025"]], pch = 1, cex = 1.1)
off <- c(`2015` = 10, `2017` = 10, `2019` = 14, `2021` = -14, `2023` = -14)
for (b in BER) {
  s <- ser[ser$bericht == b & ser$szenario == "MMS" & ser$sektor == "gesamt", ]; jb <- JB[[as.character(b)]]
  pr <- s[s$typ == "proj" & s$jahr > jb & s$jahr <= 2030, ]; pjb <- s$wert[s$jahr == jb]; f <- Ag[[as.character(jb)]] / pjb
  xx <- c(jb, pr$jahr); yy <- c(Ag[[as.character(jb)]], pr$wert * f)
  lines(xx, yy, col = COL[[as.character(b)]], lwd = 2); points(xx[xx <= 2024], yy[xx <= 2024], pch = 16, col = COL[[as.character(b)]]); points(xx[xx > 2024], yy[xx > 2024], pch = 1, col = COL[[as.character(b)]])
  text(xx[1], yy[1] + off[[as.character(b)]], labels = b, cex = 0.7, col = COL[[as.character(b)]])
}
legend("bottomleft", legend = c("Ist (Inventar Submission 2026)", "Vorjahresschaetzung 2025 (nur S7)", paste0("Projektionsbericht ", BER, " (MMS)"), "ausgefuellt: Fenster 2015-2024; offen: ausserhalb"),
       col = c("black", "black", unlist(COL[as.character(BER)]), "grey40"), lwd = c(3.5, NA, rep(2, 5), NA), pch = c(NA, 1, rep(16, 5), 1), cex = 0.7, bg = "white")
title(main = "Grafik 1: Projizierter Verlauf (MMS) gegen Ist, basisjahrbereinigt", cex.main = 1.05, line = 2.2)
mtext("Jeder Pfad beginnt in seinem Ausgangsjahr J_b auf dem heutigen Inventarwert; nur explizit ausgewiesene Punkte; Skala beschreibt Verlauf, nicht Niveau", side = 3, line = 0.6, cex = 0.7)
dev.off()
writeLines(capture.output(sessionInfo()), of("sessionInfo_03_ergaenzungen.txt"))
cat("\nFertig:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n"); sink(); close(con_log)
