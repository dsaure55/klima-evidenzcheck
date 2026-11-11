# =============================================================================
# Prognose-Check #1 - Projektionsberichte der Bundesregierung 2015-2023
# Skript 02: Auswertung (SAP Abschnitte 2, 3.5 Punkt 6, 4, 5, 6, 7, 11)
# -----------------------------------------------------------------------------
# SAP:        Analysen/2026-10-prognose-check-projektionsberichte/
#             SAP_prognose-check-projektionsberichte.md
#             Version 1.2, Status FINAL (eingefroren 22.10.2026 als v1.0;
#             Amendment 1 vom 22.10.2026: J_b Bericht 2021 = 2018,
#             Bericht 2023 = 2019; Amendment 2 vom 09.11.2026: der 2020-Wert
#             in Tab. 126 des Berichts 2021 zaehlt NICHT als Auswertungspaar,
#             nur als gekennzeichnete Post-hoc-Information).
# Datum:      09.11.2026
# Autor:      analyst-Subagent (Claude); nicht committet
# R-Version:  4.6.1 (Details: output/sessionInfo_02_auswertung.txt)
# Pakete:     Base R (stats, graphics, grDevices) + readxl, digest, pdftools
#             (nur Einlesen/Pruefsummen; keine Modellierung)
#
# Eingabe:    NUR unveraenderte Rohdateien unter rohdaten/ und die in
#             Skript 01 erzeugte Extraktionstabelle (output/). Kein Netzzugriff.
#             Keine Zufallskomponente (kein Seed noetig).
#
# ANALYSEUMFANG (rein deskriptiv, SAP 5.1.1/5.5: kein Test, kein p-Wert,
# kein Konfidenzintervall, kein alpha):
#   SAP 3.4/10  Pruefsummen der Rohdateien
#   SAP 3.2     Referenzinventar (Submission 2026)
#   SAP 3.5.6   Verfuegbarkeit P(b,s,J_b,k) (vor jedem Fehlermass)
#   SAP 2.1     Umskalierung P -> P*
#   SAP 2.2     Fehlermasse
#   SAP 2.3     Estimands E1-E5
#   SAP 5.2     Diagnostik (kein DW/Shapiro-Wilk: SAP 5.2 schliesst sie aus)
#   SAP 6       Sensitivitaeten S1-S9 (S2 und S6 nicht durchfuehrbar, s. u.)
#   SAP 11      Tabellen 1-4, Grafiken 1, 1b, 2, 3
#
# -----------------------------------------------------------------------------
# ABWEICHUNGEN VOM SAP / POST-HOC-FESTLEGUNGEN (Details und Entscheidungs-
# spalte "Daniel Saure": Abweichungsprotokoll_prognose-check-projektionsberichte.md)
# -----------------------------------------------------------------------------
# Rueckfrage an Mensch (SAP laesst Punkt offen; hier vorlaeufig festgelegt,
# Entscheidung offen):
#  (H1) PB2015 Fassung (R2a/b): MMS aus Fassung April 2015 (Gesamt/Industrie/
#       Uebrige sind in beiden Fassungen identisch); MWMS aus der ergaenzten
#       Fassung Sept. 2016 (einzige amtliche Quelle fuer MWMS 2015).
#  (H2) PB2015 GWP (R2c): als P gilt die Haupttabelle (IPCC SAR) "wie im
#       Bericht ausgewiesen" (SAP 2.1); die AR4-Umrechnung (Anhang A6) wird als
#       Post-hoc-Vergleich gerechnet, nicht als Primaerwert.
#  (H3) EU-Templates (R3): NICHT als "amtlicher Datenanhang" verwendet; nur
#       explizit im Bericht/Datenanhang ausgewiesene Jahre (SAP 4.2).
#  (H4) Sektor-Zuordnungstabelle (SAP 4.4, R4): siehe output/zuordnungstabelle_
#       sektoren.csv. PB2015: nur Industrie und Abfallwirtschaft/Sonstiges
#       eindeutig zuordenbar; Energiewirtschaft, Gebaeude, Verkehr,
#       Landwirtschaft entfallen fuer PB2015 (1.A.4.c steckt im Bericht in GHD,
#       1.A.3.e im Verkehr; KSG ordnet anders zu).
#  (H5) S2 (R5): NICHT durchgefuehrt - fruehere Inventarsubmissionen nicht
#       beschafft (Unterlassung; Definition "erste Submission mit t" offen).
#  (H6) R6: zweite unabhaengige Uebertragung der Sektorwerte ohne EEA-
#       Gegenstueck bleibt offen; hier nicht behebbar.
#  (H7) S5: Stuetzjahre = nur explizit ausgewiesene PROJEKTIONSjahre
#       (kein historischer J_b-Wert als Stuetzstelle).
#  (H8) S8: Horizontklasse "<= 0" ergaenzt (t - Berichtsjahr kann 0 sein).
#  (H9) S9: "Gesamt mit LULUCF" = Gesamt + Zeile LULUCF des Berichts (ohne
#       internationalen Verkehr); Referenz: Zeile "mit LULUCF" der KSG-Uebersicht.
#  (H10) Amendment 2: 2020-Wert Tab. 126 Bericht 2021 getrennt als Post-hoc-
#       Information, in keiner Kennzahl.
#  (H11) Mindestzellgroesse 3 auch fuer k/n, Min/Max und Median von D.
#  (H12) Keine DW/Ljung-Box/Shapiro-Wilk (SAP 5.2 schliesst sie aus).
#  (H13) SAP 5.4: Band-Pruefung in 02 nur als Textsuche; nachgeholt in
#       03_ergaenzungen.R (H18).
#  (H14) OWID 5,7-6,6 % unter UBA: Hypothese nicht verifiziert.
#  (H15) Gesamt aus Trendtabelle, Sektoren aus KSG-Uebersicht (identisch).
#  (H16) PB2023: J_b-Wert 2019 aus PDF-Tab. 17 (gerundet), Zieljahre aus Datenanhang.
#  (H17) Extraktion ueber Wortkoordinaten (Skript 01, P2).
#  (H18-H25) Ergaenzungen NACH Validierung: Abweichungsprotokoll Abschnitt E,
#       Skript 03_ergaenzungen.R. S6: J_b PB2024 = 2022, kein P(b,s,J_b) in den
#       beschafften Dateien -> nicht berechenbar (belegt in 03).
#  Massgebliche Nummerierung: Abweichungsprotokoll (H1-H25). Diese Zeilen sind
#  Kommentar; Rechnung und Ausgaben von 02 wurden dadurch nicht veraendert.
# =============================================================================

suppressPackageStartupMessages({
  library(readxl)
  library(digest)
  library(pdftools)
})
options(stringsAsFactors = FALSE, width = 200, warn = 1)

# --- Pfade -------------------------------------------------------------------
args_all <- commandArgs(trailingOnly = FALSE)
file_arg <- sub("^--file=", "", args_all[grepl("^--file=", args_all)])
BASE <- if (length(file_arg)) dirname(normalizePath(file_arg)) else getwd()
RAW  <- file.path(BASE, "rohdaten")
OUT  <- file.path(BASE, "output")
dir.create(OUT, showWarnings = FALSE)
rf <- function(...) file.path(RAW, ...)
of <- function(...) file.path(OUT, ...)
wcsv <- function(d, f) write.csv(d, of(f), row.names = FALSE, na = "", fileEncoding = "UTF-8")

con_log <- file(of("02_auswertung_konsole.txt"), open = "wt", encoding = "UTF-8")
sink(con_log, split = TRUE)
cat("Prognose-Check #1 - 02_auswertung.R\n")
cat("SAP v1.2 final (inkl. Amendment 1 und 2)\n")
cat("Basisordner:", BASE, "\n")
cat("Laufzeit:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
cat(R.version.string, "\n\n")

# =============================================================================
# SAP 3.4/10: Pruefsummen der Rohdateien erneut gegen run_log.txt pruefen
# =============================================================================
cat("== SAP 3.4/10: Pruefsummen der Rohdateien (erneut) ==\n")
rl <- readLines(file.path(BASE, "run_log.txt"), encoding = "UTF-8")
ts <- grep("^DATEITABELLE_BEGINN", rl); te <- grep("^DATEITABELLE_ENDE", rl)
logtab <- read.delim(text = rl[(ts + 1):(te - 1)], sep = "\t", header = TRUE,
                     stringsAsFactors = FALSE, quote = "")
files_now <- list.files(RAW, recursive = TRUE)
files_now <- files_now[!grepl("download_offen[.]md$", files_now)]
hash_now <- vapply(files_now, function(f) digest(file = rf(f), algo = "sha256"), "")
hc <- data.frame(datei = files_now, sha256_jetzt = unname(hash_now))
hc <- merge(hc, data.frame(datei = logtab$datei, sha256_log = logtab$sha256), by = "datei", all = TRUE)
hc$status <- ifelse(is.na(hc$sha256_log), "nicht im run_log",
              ifelse(is.na(hc$sha256_jetzt), "fehlt im Ordner",
              ifelse(hc$sha256_log == hc$sha256_jetzt, "ok", "ABWEICHUNG")))
wcsv(hc, "02_pruefsummen_vor_auswertung.csv")
print(table(hc$status))
cat("Anzahl Rohdateien:", nrow(hc), "\n")
if (any(hc$status != "ok") || nrow(hc) != 68) {
  sink(); stop("STOPP: Rohdaten-Pruefsummen weichen ab oder Dateizahl != 68. Keine Auswertung.")
}
cat("-> 68/68 Pruefsummen identisch mit run_log.txt\n\n")

# =============================================================================
# SAP 3.2: Referenzinventar Submission 2026 einlesen (A(t,k))
# =============================================================================
cat("== SAP 3.2: Referenzinventar ==\n")
YRS <- 1990:2025
# Gesamt ohne LULUCF aus der Trendtabelle (UBA 15.01.2026), Jahre 1990-2024
tr <- as.data.frame(suppressMessages(read_excel(rf("uba_inventar/2026_EM_Entwicklung_in_D_Trendtabelle_THG.xlsx"),
        sheet = "GHG_CO2eq", col_names = FALSE, .name_repair = "minimal")))
tr_row <- which(grepl("^Total Emissions [(]?without LULUCF|^Total Emissions [(]without LULUCF", tr[[1]]))[1]
if (is.na(tr_row)) tr_row <- 4
hdr_tr <- suppressWarnings(as.numeric(unlist(tr[3, ])))
yc_tr <- which(!is.na(hdr_tr)); stopifnot(length(yc_tr) == 35)
yr_tr <- as.integer(format(as.Date(hdr_tr[yc_tr], origin = "1899-12-30"), "%Y")); stopifnot(identical(yr_tr, 1990:2024))
A_trend <- setNames(as.numeric(unlist(tr[tr_row, yc_tr])) / 1000, 1990:2024)   # Mt CO2e

# KSG-Sektoren aus der KSG-Uebersicht (UBA 15.03.2026), Jahre 1990-2025 (2025 = Vorjahresschaetzung)
ks <- as.data.frame(suppressMessages(read_excel(rf("uba_inventar/Emissionsuebersichten_KSG-Sektoren_1990-2025.xlsx"),
        sheet = "THG", col_names = FALSE, .name_repair = "minimal")))
hdr_ks <- suppressWarnings(as.numeric(unlist(ks[2, ])))
yc_ks <- which(!is.na(hdr_ks)); stopifnot(length(yc_ks) == 36)
yr_ks <- as.integer(format(as.Date(hdr_ks[yc_ks], origin = "1899-12-30"), "%Y")); stopifnot(identical(yr_ks, 1990:2025))
rowvals <- function(i) setNames(as.numeric(unlist(ks[i, yc_ks])) / 1000, YRS)
r_ohne <- which(ks[[1]] == "ohne LULUCF")[1]; r_mit <- which(ks[[1]] == "mit LULUCF")[1]
KSG_SEK <- c("Energiewirtschaft", "Industrie", "Gebäude", "Verkehr", "Landwirtschaft", "Abfallwirtschaft und Sonstiges")
ksg_prefix <- c("^1 - Energiewirtschaft", "^2 - Industrie", "^3 - Gebäude", "^4 - Verkehr", "^5 - Landwirtschaft",
                "^6 - Abfallwirtschaft und Sonstiges")
Aref <- matrix(NA_real_, nrow = 9, ncol = length(YRS),
               dimnames = list(c("gesamt", "gesamt_mit_LULUCF", KSG_SEK, "LULUCF"), YRS))
Aref["gesamt", ]             <- rowvals(r_ohne)       # fuer 1990-2024 mit Trendtabelle ueberschrieben (siehe unten)
Aref["gesamt_mit_LULUCF", ]  <- rowvals(r_mit)
for (j in seq_along(KSG_SEK)) {
  ri <- which(grepl(ksg_prefix[j], ks[[1]]))[1]; stopifnot(!is.na(ri))
  Aref[KSG_SEK[j], ] <- rowvals(ri)
}
ri <- which(grepl("^7 - Landnutzung", ks[[1]]))[1]; Aref["LULUCF", ] <- rowvals(ri)
A_ksg_gesamt <- Aref["gesamt", ]
# Konsistenz: Trendtabelle (Primaer fuer Gesamt, wie in Skript 01 festgelegt) vs KSG-Uebersicht
cat(sprintf("Max. Differenz Gesamt Trendtabelle vs KSG-Uebersicht 1990-2024: %.5f Mt\n",
            max(abs(A_trend - A_ksg_gesamt[as.character(1990:2024)]))))
Aref["gesamt", as.character(1990:2024)] <- A_trend
# Summe der sechs KSG-Sektoren gegen Gesamt
sumsek <- colSums(Aref[KSG_SEK, ])
cat(sprintf("Max. Abweichung Summe KSG-Sektoren vs Gesamt (1990-2025): %.5f Mt\n", max(abs(sumsek - A_ksg_gesamt))))
cat(sprintf("A(2020, gesamt) = %.3f Mt; A(2024, gesamt) = %.3f Mt; 2025 (Vorjahresschaetzung, nur S7) = %.3f Mt\n",
            Aref["gesamt", "2020"], Aref["gesamt", "2024"], Aref["gesamt", "2025"]))
Aref_out <- data.frame(jahr = YRS, t(Aref)); wcsv(Aref_out, "referenzinventar_A_verwendet.csv")
# Hinweis: Spalte 2025 (Vorjahresschaetzung) wird ausschliesslich in S7 verwendet.
Aget <- function(sek, jahr) {
  out <- rep(NA_real_, length(jahr)); ok <- jahr %in% YRS
  out[ok] <- Aref[cbind(rep(sek, length.out = length(jahr))[ok], as.character(jahr[ok]))]
  out
}

# S7-Plausibilisierung: Wert 2025 im UBA-Hintergrundpapier?
hp <- paste(pdf_text(rf("uba_vorjahresschaetzung_S7/UBA_Emissionsdaten_2025_Projektionsdaten_2026_Hintergrundpapier_0.pdf")), collapse = "\n")
hp <- gsub("\\s+", " ", hp)
cands <- unique(regmatches(hp, gregexpr("6[0-9]{2}[,.][0-9]+ ?Mio", hp))[[1]])
cat("Hintergrundpapier: Treffer fuer 6xx Mio. t im Text (Plausibilisierung 2025):", paste(head(cands, 10), collapse = " | "), "\n")
wcsv(data.frame(A_2025_KSG_Uebersicht_Mt = Aref["gesamt", "2025"], hintergrundpapier_treffer = paste(head(cands, 10), collapse = " | ")),
     "plausi_vorjahresschaetzung_2025.csv")

# =============================================================================
# SAP 3.5.1/4.2/3.1: Projektionsreihen aus der Extraktionstabelle zusammenstellen
# =============================================================================
cat("\n== Projektionsreihen P(b,s,t,k) aus Extraktionstabelle ==\n")
x <- read.csv(of("extraktionstabelle_projektionen.csv"), stringsAsFactors = FALSE, encoding = "UTF-8")
x$typ <- ifelse(grepl("^Projektion", x$kennzeichnung_bericht), "proj", "hist")
JB <- c("2015" = 2012, "2017" = 2014, "2019" = 2016, "2021" = 2018, "2023" = 2019)   # SAP 3.5.5 + Amendment 1
BER <- as.integer(names(JB))

# Quelle je Bericht/Szenario/Sektor: Tabelle + Zeilenlabel in der Tabelle
# prio 1 = massgeblich; Datenanhang (PB2023) hat Vorrang vor PDF (SAP 3.1)
src <- NULL
add <- function(b, s, sek, tid, lab, prio = 1) src <<- rbind(src, data.frame(bericht = b, szenario = s, sektor = sek, tabelle_id = tid, label = lab, prio = prio))
# Gesamt
add(2015, "MMS",  "gesamt", "PB2015o_T1-2", "Gesamt")
add(2015, "MWMS", "gesamt", "PB2015s_T1-3", "Gesamt")
add(2017, "MMS",  "gesamt", "PB2017_T1-2",  "Gesamt")
add(2017, "MWMS", "gesamt", "PB2017_T1-3",  "Gesamt")
add(2019, "MMS",  "gesamt", "PB2019_TZ-2",  "Gesamt")
add(2021, "MMS",  "gesamt", "PB2021_T126",  "Gesamt")
for (s in c("MMS", "MWMS")) { add(2023, s, "gesamt", "PB2023x_Blatt1", "Gesamt", 1); add(2023, s, "gesamt", "PB2023_T17", "Gesamt", 2) }
# Sektoren (Zuordnung siehe zuordnungstabelle_sektoren.csv, SAP 4.4)
add(2015, "MMS",  "Industrie", "PB2015o_A-5",    "Industrie")
add(2015, "MWMS", "Industrie", "PB2015s_A-5-10", "Industrie")
add(2015, "MMS",  "Abfallwirtschaft und Sonstiges", "PB2015o_A-5",    "Übrige")
add(2015, "MWMS", "Abfallwirtschaft und Sonstiges", "PB2015s_A-5-10", "Übrige")
ksp_lab <- c(Energiewirtschaft = "Energiewirtschaft", Industrie = "Industrie", `Gebäude` = "Gebäude", Verkehr = "Verkehr",
             Landwirtschaft = "Landwirtschaft", `Abfallwirtschaft und Sonstiges` = "Sonstige")
for (sek in KSG_SEK) {
  add(2017, "MMS",  sek, "PB2017_A-5-3", ksp_lab[[sek]]); add(2017, "MWMS", sek, "PB2017_A-5-4", ksp_lab[[sek]])
  add(2019, "MMS",  sek, "PB2019k_T4",   ksp_lab[[sek]])
  add(2021, "MMS",  sek, "PB2021_T126",  sek)
  for (s in c("MMS", "MWMS")) { add(2023, s, sek, "PB2023x_Blatt1", sek, 1); add(2023, s, sek, "PB2023_T17", sek, 2) }
}
getrows <- function(b, s, tid, lab) {
  d <- x[x$tabelle_id == tid & x$szenario == s & x$sektor_bericht == lab & x$rolle %in% c("Gesamt", "Sektor"), ]
  d[order(d$jahr), c("jahr", "wert", "typ", "tabelle_id", "pdf_seite", "tabelle", "datei")]
}
ser_list <- list()
for (g in unique(src[, c("bericht", "szenario", "sektor")]) |> split(f = seq_len(nrow(unique(src[, c("bericht", "szenario", "sektor")]))))) {
  sg <- src[src$bericht == g$bericht & src$szenario == g$szenario & src$sektor == g$sektor, ]
  sg <- sg[order(sg$prio), ]
  acc <- NULL
  for (i in seq_len(nrow(sg))) {
    d <- getrows(sg$bericht[i], sg$szenario[i], sg$tabelle_id[i], sg$label[i])
    if (nrow(d) == 0) stop("Keine Zeilen fuer ", paste(unlist(sg[i, ]), collapse = "/"))
    d <- d[!is.na(d$wert), ]
    if (!is.null(acc)) d <- d[!(d$jahr %in% acc$jahr), ]     # niedrigere Prioritaet nur fuer fehlende Jahre
    acc <- rbind(acc, d)
  }
  acc$bericht <- g$bericht; acc$szenario <- g$szenario; acc$sektor <- g$sektor
  ser_list[[length(ser_list) + 1]] <- acc
}
ser <- do.call(rbind, ser_list); rownames(ser) <- NULL
ser <- ser[, c("bericht", "szenario", "sektor", "jahr", "wert", "typ", "tabelle_id", "pdf_seite", "tabelle")]
wcsv(ser, "reihen_P_verwendet.csv")
cat("Reihen:", nrow(unique(ser[, c("bericht", "szenario", "sektor")])), " Zeilen:", nrow(ser), "\n")

# LULUCF-Reihen (nur fuer S9): Zeile LULUCF des Berichts
lulu_src <- data.frame(bericht = c(2017, 2017, 2019, 2021, 2023, 2023),
                       szenario = c("MMS", "MWMS", "MMS", "MMS", "MMS", "MWMS"),
                       tid = c("PB2017_T1-2", "PB2017_T1-3", "PB2019_TZ-2", "PB2021_T126", "PB2023_T17", "PB2023_T17"),
                       lab = c("LULUCF", "LULUCF", "LULUCF", "LULUC F", "LULUCF", "LULUCF"))
lulu <- NULL
for (i in seq_len(nrow(lulu_src))) {
  d <- x[x$tabelle_id == lulu_src$tid[i] & x$szenario == lulu_src$szenario[i] & x$sektor_bericht == lulu_src$lab[i], c("jahr", "wert")]
  if (nrow(d)) lulu <- rbind(lulu, data.frame(bericht = lulu_src$bericht[i], szenario = lulu_src$szenario[i], d))
}

# =============================================================================
# SAP 3.5.5 + Amendment 1: J_b;  SAP 3.5.6: Verfuegbarkeit P(b,s,J_b,k)
# (nur auf Projektionswerten und Referenz-Verfuegbarkeit, KEIN Fehlermass)
# =============================================================================
cat("\n== SAP 3.5.6: Verfuegbarkeit P(b,s,J_b,k) ==\n")
grp <- unique(ser[, c("bericht", "szenario", "sektor")])
verf <- NULL
for (i in seq_len(nrow(grp))) {
  g <- grp[i, ]; s <- ser[ser$bericht == g$bericht & ser$szenario == g$szenario & ser$sektor == g$sektor, ]
  jb <- unname(JB[as.character(g$bericht)])
  r <- s[s$jahr == jb, ]
  pj <- if (nrow(r) == 1) r$wert else NA_real_
  verf <- rbind(verf, data.frame(bericht = g$bericht, szenario = g$szenario, sektor = g$sektor, J_b = jb,
        P_Jb_vorhanden = !is.na(pj), P_Jb = pj,
        typ_Jb = if (nrow(r) == 1) r$typ else NA, fundstelle = if (nrow(r) == 1) paste0(r$tabelle_id, ", PDF-S. ", r$pdf_seite) else NA,
        A_Jb_vorhanden = !is.na(Aget(g$sektor, jb)),
        in_Primaerpopulation = !is.na(pj) && !is.na(Aget(g$sektor, jb)),
        grund = if (!is.na(pj)) "" else "kein historischer Wert fuer J_b im Bericht -> ausserhalb Primaerpopulation (SAP 2.1 Nr. 3), nur S1"))
}
wcsv(verf, "verfuegbarkeit_PJb_final.csv")
print(verf[verf$sektor == "gesamt", c("bericht", "szenario", "J_b", "P_Jb_vorhanden", "P_Jb", "in_Primaerpopulation")], row.names = FALSE)
cat("Sektor-Reihen mit P(J_b):", sum(verf$P_Jb_vorhanden), "von", nrow(verf), "\n")
# Stopp-Pruefung: gesamt-Verfuegbarkeit fuer alle Berichte/Szenarien vorhanden?
if (!all(verf$P_Jb_vorhanden[verf$sektor == "gesamt"])) cat("HINWEIS: Berichte ohne P(J_b) gesamt -> siehe Tabelle, fallen aus Primaerpopulation (Regel 2.1 Nr. 3)\n")

# Amendment-2-Pruefung: 2020-Wert PB2021 ist als 'hist' (Vorjahresschaetzung) gekennzeichnet und kein Auswertungspaar
chk21 <- ser[ser$bericht == 2021 & ser$sektor == "gesamt" & ser$jahr == 2020, ]
stopifnot(nrow(chk21) == 1, chk21$typ == "hist")
cat("Amendment 2: PB2021 2020-Wert (", chk21$wert, "Mt) ist als 'hist' (Vorjahresschaetzung) gefuehrt -> kein Paar.\n", sep = "")

# =============================================================================
# SAP 2.1/2.2: Paarbildung, Umskalierung P -> P*, Fehlermasse
# =============================================================================
hk <- function(h) as.character(cut(h, breaks = c(-Inf, 0, 3, 6, Inf), labels = c("<=0", "1-3", "4-6", ">=7")))
HK <- c("1-3", "4-6", ">=7")

make_pairs <- function(ser, tmin = 2015, tmax = 2024, interp = FALSE, sektoren = NULL, szenarien = c("MMS", "MWMS"),
                       Afun = Aget, Pjb_override = NULL) {
  out <- NULL
  grp <- unique(ser[, c("bericht", "szenario", "sektor")])
  for (i in seq_len(nrow(grp))) {
    g <- grp[i, ]
    if (!is.null(sektoren) && !(g$sektor %in% sektoren)) next
    if (!(g$szenario %in% szenarien)) next
    s <- ser[ser$bericht == g$bericht & ser$szenario == g$szenario & ser$sektor == g$sektor, ]
    jb <- unname(JB[as.character(g$bericht)])
    pjb <- if (any(s$jahr == jb)) s$wert[s$jahr == jb][1] else NA_real_
    pr <- s[s$typ == "proj" & s$jahr > jb, ]
    cand <- data.frame(t = pr$jahr, P = pr$wert, interpoliert = FALSE)
    if (interp && nrow(pr) >= 2) {
      for (k in seq_len(nrow(pr) - 1)) {
        y1 <- pr$jahr[k]; y2 <- pr$jahr[k + 1]
        if (y2 - y1 > 1) {
          yy <- (y1 + 1):(y2 - 1)
          cand <- rbind(cand, data.frame(t = yy, P = pr$wert[k] + (pr$wert[k + 1] - pr$wert[k]) * (yy - y1) / (y2 - y1), interpoliert = TRUE))
        }
      }
    }
    cand <- cand[cand$t >= tmin & cand$t <= tmax, ]
    if (nrow(cand) == 0) next
    A  <- Afun(g$sektor, cand$t); Ajb <- Afun(g$sektor, jb)
    d <- data.frame(bericht = g$bericht, szenario = g$szenario, sektor = g$sektor, t = cand$t, J_b = jb,
                    h = cand$t - jb, h_alt = cand$t - g$bericht, interpoliert = cand$interpoliert,
                    P = cand$P, P_Jb = pjb, A = A, A_Jb = Ajb)
    d$faktor <- d$A_Jb / d$P_Jb
    d$P_star <- d$P * d$faktor
    d$E_star <- d$P_star - d$A;  d$RE_star <- 100 * d$E_star / d$A;  d$ARE_star <- abs(d$RE_star)
    d$E_unb  <- d$P - d$A;       d$RE_unb  <- 100 * d$E_unb / d$A;   d$ARE_unb  <- abs(d$RE_unb)
    d$E5_start <- d$P_Jb - d$A_Jb                       # Startpunktabweichung
    d$E5_verlauf <- (d$P - d$P_Jb) - (d$A - d$A_Jb)     # additive Verlaufsabweichung
    out <- rbind(out, d)
  }
  rownames(out) <- NULL
  out
}
pairs_all <- make_pairs(ser)                         # Primaer-Fenster 2015..2024, explizite Jahre
stopifnot(all(abs(pairs_all$E_unb - (pairs_all$E5_start + pairs_all$E5_verlauf)) < 1e-9, na.rm = TRUE))   # E5-Identitaet
prim <- pairs_all[!is.na(pairs_all$RE_star), ]       # Primaerpopulation (P* berechenbar)
cat("Paare insgesamt (alle Sektoren/Szenarien):", nrow(pairs_all), "; mit P* berechenbar:", nrow(prim), "\n")
pg  <- prim[prim$sektor == "gesamt" & prim$szenario == "MMS", ]
pgw <- prim[prim$sektor == "gesamt" & prim$szenario == "MWMS", ]
cat("Primaerpopulation gesamt/MMS: n =", nrow(pg), "; gesamt/MWMS: n =", nrow(pgw), "\n")
print(pg[, c("bericht", "t", "h", "P", "P_star", "A", "RE_star", "RE_unb")], row.names = FALSE, digits = 4)

# Voll-/Rundungsausgabe
rnd_pairs <- function(d) {
  data.frame(Bericht = d$bericht, Szenario = d$szenario, Sektor = d$sektor, Zieljahr_t = d$t, J_b = d$J_b, h = d$h,
             P_Mt = round(d$P), P_star_Mt = round(d$P_star), A_Mt = round(d$A),
             E_star_Mt = round(d$E_star), RE_star_pct = round(d$RE_star, 1), ARE_star_pct = round(d$ARE_star, 1),
             E_unb_Mt = round(d$E_unb), RE_unb_pct = round(d$RE_unb, 1), ARE_unb_pct = round(d$ARE_unb, 1),
             Faktor = round(d$faktor, 3))
}
wcsv(pairs_all, "paare_alle_voll.csv")
wcsv(rnd_pairs(prim[prim$sektor == "gesamt", ]), "tabelle2_paare_gesamt.csv")

# =============================================================================
# SAP 5.2 Nr. 5 / 5.1.6: Umskalierungsfaktoren (je Bericht/Szenario/Sektor)
# =============================================================================
fak <- verf[verf$P_Jb_vorhanden, c("bericht", "szenario", "sektor", "J_b", "P_Jb")]
fak$A_Jb <- mapply(Aget, fak$sektor, fak$J_b)
fak$faktor <- fak$A_Jb / fak$P_Jb
fak$ausserhalb_0.90_1.10 <- fak$faktor < 0.90 | fak$faktor > 1.10
wcsv(data.frame(fak[, 1:4], P_Jb = round(fak$P_Jb, 2), A_Jb = round(fak$A_Jb, 2), faktor = round(fak$faktor, 3),
                ausserhalb_0.90_1.10 = fak$ausserhalb_0.90_1.10), "umskalierungsfaktoren.csv")
cat("\n== Umskalierungsfaktoren (gesamt) ==\n")
print(data.frame(fak[fak$sektor == "gesamt", c("bericht", "szenario", "J_b", "P_Jb", "A_Jb")], faktor = round(fak$faktor[fak$sektor == "gesamt"], 3)), row.names = FALSE)
cat("Faktoren ausserhalb 0,90-1,10:", sum(fak$ausserhalb_0.90_1.10), "von", nrow(fak), "\n")
print(fak[fak$ausserhalb_0.90_1.10, c("bericht", "szenario", "sektor", "faktor")], row.names = FALSE, digits = 3)
# Abweichungen zwischen den Szenarien im Faktor (SAP 2.1 Nr. 2)
fk_w <- reshape(fak[, c("bericht", "szenario", "sektor", "faktor")], idvar = c("bericht", "sektor"), timevar = "szenario", direction = "wide")
fk_w <- fk_w[!is.na(fk_w$faktor.MMS) & !is.na(fk_w$faktor.MWMS), ]
cat("Max. Faktor-Differenz MMS vs MWMS:", max(abs(fk_w$faktor.MMS - fk_w$faktor.MWMS)), "\n")

# =============================================================================
# SAP 2.2/4.3: Kennzahlen-Funktion (Mindestzellgroesse 3)
# =============================================================================
summ <- function(re, mincell = 3) {
  re <- re[!is.na(re)]; n <- length(re)
  if (n < mincell) return(data.frame(n = n, k = NA, MRE = NA, MdRE = NA, MAPE = NA, min = NA, max = NA, hinweis = sprintf("n=%d < %d: nur Einzelwerte", n, mincell)))
  data.frame(n = n, k = sum(re > 0), MRE = mean(re), MdRE = median(re), MAPE = mean(abs(re)), min = min(re), max = max(re), hinweis = "")
}
fmt_s <- function(s) { s$MRE <- round(s$MRE, 1); s$MdRE <- round(s$MdRE, 1); s$MAPE <- round(s$MAPE, 1); s$min <- round(s$min, 1); s$max <- round(s$max, 1); s }

# =============================================================================
# SAP 2.3/5.1.2: E1 (Zieljahr 2020, gesamt, MMS, basisjahrbereinigt)
# =============================================================================
cat("\n== E1: RE* fuer Zieljahr 2020, gesamt, MMS ==\n")
e1_ber <- data.frame(bericht = BER, J_b = JB)
e1 <- merge(e1_ber, pg[pg$t == 2020, c("bericht", "P", "P_star", "A", "E_star", "RE_star", "ARE_star", "RE_unb", "h")], by = "bericht", all.x = TRUE)
e1$hinweis <- ifelse(is.na(e1$RE_star), "kein Auswertungspaar fuer 2020", "")
e1$hinweis[e1$bericht == 2021] <- "kein Auswertungspaar: 2020-Wert in Tab. 126 ist Vorjahresschaetzung, zaehlt laut Amendment 2 nicht"
e1$hinweis[e1$bericht == 2023] <- "kein Auswertungspaar: Bericht 2023 weist keinen Projektionswert fuer 2020 aus (J_b = 2019; Datenanhang ab 2023)"
print(e1, row.names = FALSE, digits = 4)
wcsv(data.frame(Bericht = e1$bericht, J_b = e1$J_b, h = e1$h, P_Mt = round(e1$P), P_star_Mt = round(e1$P_star), A_2020_Mt = round(e1$A),
                E_star_Mt = round(e1$E_star), RE_star_pct = round(e1$RE_star, 1), ARE_star_pct = round(e1$ARE_star, 1), hinweis = e1$hinweis), "e1_ergebnisse.csv")
e1v <- e1$RE_star[!is.na(e1$RE_star)]
cat(sprintf("E1: n=%d; k/n (RE*>0) = %d/%d; Spannweite %.1f bis %.1f %%\n", length(e1v), sum(e1v > 0), length(e1v), min(e1v), max(e1v)))

# =============================================================================
# SAP 2.3/5.1.2/5.1.3: E2 (alle Paare gesamt MMS) + Horizont
# =============================================================================
cat("\n== E2: Kennzahlen gesamt, MMS, basisjahrbereinigt ==\n")
e2_all <- cbind(zelle = "alle Paare", summ(pg$RE_star))
e2_h <- do.call(rbind, lapply(HK, function(k) cbind(zelle = paste0("h ", k), summ(pg$RE_star[hk(pg$h) == k]))))
e2 <- rbind(e2_all, e2_h); e2 <- fmt_s(e2)
print(e2, row.names = FALSE)
wcsv(e2, "e2_kennzahlen.csv")
# E2 Einzelwerte nach Horizont (fuer Zellen n<3)
e2_ew <- pg[order(pg$h, pg$bericht, pg$t), c("bericht", "t", "h", "RE_star", "ARE_star")]; e2_ew$Horizontklasse <- hk(e2_ew$h)
e2_ew$RE_star <- round(e2_ew$RE_star, 1); e2_ew$ARE_star <- round(e2_ew$ARE_star, 1)
wcsv(e2_ew, "e2_einzelwerte_horizont.csv")

# =============================================================================
# SAP 2.3/5.1.4: E3 (MMS vs MWMS, gepaart)
# =============================================================================
e3_fun <- function(pr, scale = "star") {
  m <- pr[pr$sektor == "gesamt" & pr$szenario == "MMS", ]; w <- pr[pr$sektor == "gesamt" & pr$szenario == "MWMS", ]
  re <- if (scale == "star") "RE_star" else "RE_unb"; are <- if (scale == "star") "ARE_star" else "ARE_unb"
  j <- merge(m[, c("bericht", "t", "h", re, are)], w[, c("bericht", "t", re, are)], by = c("bericht", "t"), suffixes = c("_MMS", "_MWMS"))
  j$D <- j[[paste0(are, "_MWMS")]] - j[[paste0(are, "_MMS")]]
  j$dRE <- j[[paste0(re, "_MWMS")]] - j[[paste0(re, "_MMS")]]
  j[order(j$bericht, j$t), ]
}
e3_sum <- function(j, mincell = 3) {
  n <- nrow(j)
  if (n < mincell) return(data.frame(n = n, median_D = NA, n_D_neg = NA, hinweis = sprintf("n=%d < %d: nur Einzelwerte", n, mincell)))
  data.frame(n = n, median_D = median(j$D), n_D_neg = sum(j$D < 0), hinweis = "")
}
cat("\n== E3: MMS vs MWMS (gesamt, basisjahrbereinigt) ==\n")
e3 <- e3_fun(prim)
print(round(e3, 2), row.names = FALSE)
e3s <- e3_sum(e3); print(e3s, row.names = FALSE)
wcsv(data.frame(Bericht = e3$bericht, Zieljahr_t = e3$t, h = e3$h, RE_star_MMS = round(e3$RE_star_MMS, 1), RE_star_MWMS = round(e3$RE_star_MWMS, 1),
                ARE_star_MMS = round(e3$ARE_star_MMS, 1), ARE_star_MWMS = round(e3$ARE_star_MWMS, 1), D = round(e3$D, 1), dRE = round(e3$dRE, 1)), "e3_einzelwerte.csv")
wcsv(e3s, "e3_kennzahlen.csv")
cat("Berichte ohne MWMS (fallen aus E3): ", paste(setdiff(BER, unique(pgw$bericht)), collapse = ", "), "\n")

# =============================================================================
# SAP 2.3/5.1.5/4.4/8.0: E4 (Sektoren, MMS; MWMS nur Anhang)
# =============================================================================
cat("\n== E4: Sektoren (MMS) ==\n")
SEKS <- KSG_SEK
e4_pairs <- prim[prim$sektor %in% SEKS, ]
e4_pairs <- e4_pairs[order(match(e4_pairs$sektor, SEKS), e4_pairs$szenario, e4_pairs$bericht, e4_pairs$t), ]
e4_m <- e4_pairs[e4_pairs$szenario == "MMS", ]
wcsv(data.frame(Sektor = e4_m$sektor, Bericht = e4_m$bericht, Zieljahr_t = e4_m$t, h = e4_m$h, P_Mt = round(e4_m$P), P_star_Mt = round(e4_m$P_star),
                A_Mt = round(e4_m$A), E_star_Mt = round(e4_m$E_star), RE_star_pct = round(e4_m$RE_star, 1), Faktor = round(e4_m$faktor, 3)), "tabelle4_sektoren_paare_MMS.csv")
e4_w <- e4_pairs[e4_pairs$szenario == "MWMS", ]
wcsv(data.frame(Sektor = e4_w$sektor, Bericht = e4_w$bericht, Zieljahr_t = e4_w$t, h = e4_w$h, P_Mt = round(e4_w$P), P_star_Mt = round(e4_w$P_star),
                A_Mt = round(e4_w$A), E_star_Mt = round(e4_w$E_star), RE_star_pct = round(e4_w$RE_star, 1), Faktor = round(e4_w$faktor, 3)), "tabelle4_anhang_sektoren_paare_MWMS.csv")
e4_kenn <- function(d, sek_set = SEKS) do.call(rbind, lapply(sek_set, function(s) {
  dd <- d[d$sektor == s, ]
  rbind(cbind(sektor = s, zelle = "alle Paare", summ(dd$RE_star)),
        do.call(rbind, lapply(HK, function(k) cbind(sektor = s, zelle = paste0("h ", k), summ(dd$RE_star[hk(dd$h) == k])))))
}))
e4k <- fmt_s(e4_kenn(e4_m)); wcsv(e4k, "e4_sektoren_kennzahlen_MMS.csv")
e4kw <- fmt_s(e4_kenn(e4_w)); wcsv(e4kw, "e4_sektoren_kennzahlen_MWMS_anhang.csv")
# E1 je Sektor (2020)
e4_e1 <- e4_m[e4_m$t == 2020, c("sektor", "bericht", "h", "P_star", "A", "E_star", "RE_star")]
e4_e1 <- e4_e1[order(match(e4_e1$sektor, SEKS), e4_e1$bericht), ]
wcsv(data.frame(Sektor = e4_e1$sektor, Bericht = e4_e1$bericht, h = e4_e1$h, P_star_Mt = round(e4_e1$P_star), A_2020_Mt = round(e4_e1$A),
                E_star_Mt = round(e4_e1$E_star), RE_star_pct = round(e4_e1$RE_star, 1)), "e4_e1_sektoren_2020.csv")
print(e4k[e4k$zelle == "alle Paare", ], row.names = FALSE)
print(data.frame(e4_e1[, c("sektor", "bericht")], E_star = round(e4_e1$E_star, 1), RE_star = round(e4_e1$RE_star, 1)), row.names = FALSE)

# Summe der bereinigten Sektoren vs bereinigter Gesamtwert (SAP 2.1 Nr. 1, Anhang)
sg <- NULL
for (b in c(2017, 2019, 2021, 2023)) for (s in c("MMS", "MWMS")) {
  d <- prim[prim$bericht == b & prim$szenario == s, ]
  if (!nrow(d)) next
  for (tt in sort(unique(d$t))) {
    dd <- d[d$t == tt, ]; sk <- dd[dd$sektor %in% SEKS, ]
    if (nrow(sk) != 6 || !any(dd$sektor == "gesamt")) next
    gg <- dd[dd$sektor == "gesamt", ]
    sg <- rbind(sg, data.frame(bericht = b, szenario = s, t = tt, sum_P_star_sektoren = sum(sk$P_star), P_star_gesamt = gg$P_star,
                               diff_Mt = sum(sk$P_star) - gg$P_star, diff_pct = 100 * (sum(sk$P_star) - gg$P_star) / gg$P_star,
                               sum_P_sektoren = sum(sk$P), P_gesamt = gg$P))
  }
}
wcsv(data.frame(sg[, 1:3], lapply(sg[, -(1:3)], round, 2)), "summe_bereinigte_sektoren_vs_gesamt.csv")
cat("\nSumme bereinigter Sektoren vs bereinigter Gesamtwert: max |Abweichung| = ", round(max(abs(sg$diff_Mt)), 2), " Mt (", round(max(abs(sg$diff_pct)), 2), " %)\n", sep = "")

# =============================================================================
# SAP 2.3/5.1.6: E5 (Zerlegung, unbereinigt)
# =============================================================================
cat("\n== E5: Zerlegung (unbereinigt) ==\n")
e5 <- prim[prim$sektor == "gesamt", ]
e5$anteil_start_pct <- 100 * e5$E5_start / abs(e5$E_unb); e5$anteil_verlauf_pct <- 100 * e5$E5_verlauf / abs(e5$E_unb)
e5 <- e5[order(e5$szenario, e5$bericht, e5$t), ]
wcsv(data.frame(Bericht = e5$bericht, Szenario = e5$szenario, Zieljahr_t = e5$t, h = e5$h, E_unb_Mt = round(e5$E_unb),
                Startpunkt_Mt = round(e5$E5_start), Verlauf_Mt = round(e5$E5_verlauf), Anteil_Start_pct = round(e5$anteil_start_pct),
                Anteil_Verlauf_pct = round(e5$anteil_verlauf_pct), E_star_Mt = round(e5$E_star), Faktor = round(e5$faktor, 3)), "e5_zerlegung.csv")
e5_20 <- e5[e5$szenario == "MMS" & e5$t == 2020, ]
print(data.frame(bericht = e5_20$bericht, E_unb = round(e5_20$E_unb, 1), start = round(e5_20$E5_start, 1), verlauf = round(e5_20$E5_verlauf, 1),
                 E_star = round(e5_20$E_star, 1), faktor = round(e5_20$faktor, 3)), row.names = FALSE)

# =============================================================================
# SAP 5.2: Diagnostik (kein DW/Shapiro-Wilk: SAP 5.2 schliesst formale Tests aus)
# =============================================================================
cat("\n== SAP 5.2: Diagnostik ==\n")
# Nr. 1 Abhaengigkeitsstruktur
dep <- as.data.frame(table(bericht = pg$bericht, t = pg$t)); dep <- dep[dep$Freq > 0, ]
dep$berichte_mit_gleichem_Zieljahr <- vapply(dep$t, function(tt) paste(sort(unique(pg$bericht[pg$t == tt])), collapse = ", "), "")
dep$paare_im_selben_Bericht <- vapply(dep$bericht, function(b) sum(pg$bericht == b), 1L)
wcsv(dep, "diag_abhaengigkeitsstruktur.csv"); print(dep, row.names = FALSE)
# Nr. 3 Leave-one-report-out
full <- summ(pg$RE_star)
loo <- do.call(rbind, lapply(sort(unique(pg$bericht)), function(b) {
  s <- summ(pg$RE_star[pg$bericht != b])
  data.frame(ohne_Bericht = b, n = s$n, k = s$k, MRE = s$MRE, MdRE = s$MdRE, MAPE = s$MAPE,
             vorzeichen_MRE_umgekehrt = sign(s$MRE) != sign(full$MRE),
             vorzeichen_MdRE_umgekehrt = sign(s$MdRE) != sign(full$MdRE),
             MAPE_rel_aenderung_pct = 100 * (s$MAPE - full$MAPE) / full$MAPE,
             MAPE_aenderung_ueber_25pct = abs(100 * (s$MAPE - full$MAPE) / full$MAPE) > 25)
}))
loo$meldepflichtig <- loo$vorzeichen_MRE_umgekehrt | loo$vorzeichen_MdRE_umgekehrt | loo$MAPE_aenderung_ueber_25pct
loo_out <- rbind(data.frame(ohne_Bericht = NA, n = full$n, k = full$k, MRE = full$MRE, MdRE = full$MdRE, MAPE = full$MAPE,
                            vorzeichen_MRE_umgekehrt = NA, vorzeichen_MdRE_umgekehrt = NA, MAPE_rel_aenderung_pct = NA,
                            MAPE_aenderung_ueber_25pct = NA, meldepflichtig = NA), loo)
loo_out[, c("MRE", "MdRE", "MAPE", "MAPE_rel_aenderung_pct")] <- round(loo_out[, c("MRE", "MdRE", "MAPE", "MAPE_rel_aenderung_pct")], 1)
wcsv(loo_out, "diag_leave_one_report_out.csv"); print(loo_out, row.names = FALSE)
# Nr. 5: Faktoren siehe oben (umskalierungsfaktoren.csv)

# =============================================================================
# SAP 6: Sensitivitaeten
# =============================================================================
cat("\n== SAP 6: Sensitivitaeten ==\n")
g_mms <- function(d) d[d$sektor == "gesamt" & d$szenario == "MMS", ]
sens_row <- function(name, betrifft, d, col = "RE_star", hcol = "h", note = "") {
  s <- summ(d[[col]]); cbind(spez = name, betrifft = betrifft, s, anmerkung = note)
}
sens_rows <- list()
sens_rows[["primaer"]] <- sens_row("Primaer (P*, 2015-2024, explizit)", "E2", pg)
# S1 unbereinigt (alle Paare, auch ohne P(J_b); hier keine)
pairs_s1 <- pairs_all
s1 <- g_mms(pairs_s1)
sens_rows[["S1"]] <- sens_row("S1 unbereinigt (RE_unb)", "E2", s1, "RE_unb")
sens_rows[["S1S3a"]] <- sens_row("S1 + S3a (unbereinigt, ohne 2020)", "E2", s1[s1$t != 2020, ], "RE_unb")
sens_rows[["S2"]] <- data.frame(spez = "S2 Inventarrevision (Erstveroeffentlichung)", betrifft = "E1, E2", n = NA, k = NA, MRE = NA, MdRE = NA, MAPE = NA, min = NA, max = NA,
                           hinweis = "nicht durchgefuehrt", anmerkung = "Grund: fruehere Inventarsubmissionen nicht beschafft (SAP 13.4); Definition 'erste Submission mit t' offen (R5)")
sens_rows[["S3a"]] <- sens_row("S3a ohne Zieljahr 2020", "E2", pg[pg$t != 2020, ])
sens_rows[["S3b"]] <- sens_row("S3b ohne 2020 und 2021", "E2", pg[!(pg$t %in% c(2020, 2021)), ])
sens_rows[["S4"]]  <- sens_row("S4 ohne 2022", "E2", pg[pg$t != 2022, ])
pairs_s5 <- make_pairs(ser, interp = TRUE); pairs_s5 <- pairs_s5[!is.na(pairs_s5$RE_star), ]
sens_rows[["S5"]] <- sens_row("S5 mit linearer Interpolation", "E2", g_mms(pairs_s5), note = sprintf("davon interpoliert: %d", sum(g_mms(pairs_s5)$interpoliert)))
sens_rows[["S6"]] <- data.frame(spez = "S6 erweiterte Berichtsmenge (UBA 2024/2025)", betrifft = "E2, E3", n = NA, k = NA, MRE = NA, MdRE = NA, MAPE = NA, min = NA, max = NA,
                           hinweis = "nicht durchgefuehrt", anmerkung = "Grund: Projektionsdaten 2024/2025 enthalten keinen historischen Wert fuer J_b (Zeitreihen beginnen 2024 bzw. 2025); J_b nicht bestimmt; Regel 2.1 Nr. 3")
# S7: Zieljahr 2025 zusaetzlich (A(2025) = Vorjahresschaetzung, nur gesamt)
pairs_s7 <- make_pairs(ser, tmax = 2025, sektoren = "gesamt"); pairs_s7 <- pairs_s7[!is.na(pairs_s7$RE_star), ]
sens_rows[["S7"]] <- sens_row("S7 mit Zieljahr 2025 (Vorjahresschaetzung)", "E2", g_mms(pairs_s7), note = sprintf("zusaetzliche Paare t=2025: %d", sum(g_mms(pairs_s7)$t == 2025)))
# S8 siehe separate Horizonttabelle
sens_rows[["S8"]] <- sens_row("S8 alt. Horizont h' = t - Berichtsjahr (alle Paare)", "E2 (Horizont)", pg, note = "Gesamtkennzahl identisch mit Primaer; Aufschluesselung nach h' s. s8_horizont.csv")
# S9: Gesamt mit LULUCF (Bericht+Inventar), nur wo LULUCF-Zeile fuer J_b und t im Bericht steht
ser_l <- NULL
for (i in seq_len(nrow(lulu_src))) {
  b <- lulu_src$bericht[i]; s <- lulu_src$szenario[i]
  sg0 <- ser[ser$bericht == b & ser$szenario == s & ser$sektor == "gesamt", ]; lu <- lulu[lulu$bericht == b & lulu$szenario == s, ]
  yy <- intersect(sg0$jahr, lu$jahr)
  if (!length(yy)) next
  m <- merge(sg0[sg0$jahr %in% yy, c("jahr", "wert", "typ")], lu[, c("jahr", "wert")], by = "jahr", suffixes = c("_g", "_l"))
  ser_l <- rbind(ser_l, data.frame(bericht = b, szenario = s, sektor = "gesamt_mit_LULUCF", jahr = m$jahr, wert = m$wert_g + m$wert_l, typ = m$typ,
                                   tabelle_id = "Gesamt+LULUCF", pdf_seite = NA, tabelle = ""))
}
pairs_s9 <- make_pairs(ser_l); pairs_s9 <- pairs_s9[!is.na(pairs_s9$RE_star), ]
pairs_s9 <- pairs_s9[pairs_s9$szenario == "MMS", ]
sens_rows[["S9"]] <- sens_row("S9 Gesamt mit LULUCF", "E1, E2", pairs_s9, note = "Berichte mit LULUCF in J_b und t: 2017, 2019 (je t=2020); PB2015: keine LULUCF-Zeile; PB2021/2023: LULUCF nur fuer J_b und >=2025")
tab3 <- do.call(rbind, sens_rows); rownames(tab3) <- NULL
tab3 <- fmt_s(tab3)
wcsv(tab3, "tabelle3_sensitivitaeten_E2.csv"); print(tab3[, c("spez", "n", "k", "MRE", "MdRE", "MAPE", "min", "max", "hinweis")], row.names = FALSE)

# E1 unter Sensitivitaeten (S1, S9; S3a/S3b/S4 betreffen E1 nicht)
e1s1 <- pg[pg$t == 2020, c("bericht", "RE_unb")]
e1s9 <- pairs_s9[pairs_s9$t == 2020, c("bericht", "RE_star")]
e1_tab <- merge(data.frame(bericht = BER), e1[, c("bericht", "RE_star")], by = "bericht", all.x = TRUE)
e1_tab <- merge(e1_tab, setNames(e1s1, c("bericht", "S1_RE_unb")), by = "bericht", all.x = TRUE)
e1_tab <- merge(e1_tab, setNames(e1s9, c("bericht", "S9_RE_star_mit_LULUCF")), by = "bericht", all.x = TRUE)
e1_tab$S2 <- "nicht durchgefuehrt"
e1_tab[, 2:4] <- lapply(e1_tab[, 2:4], round, 1)
wcsv(e1_tab, "tabelle3_sensitivitaeten_E1.csv"); print(e1_tab, row.names = FALSE)

# S8 Horizontaufschluesselung (h' = t - Berichtsjahr)
pg8 <- pg; pg8$h <- pg8$h_alt
s8 <- do.call(rbind, lapply(c("<=0", HK), function(k) cbind(zelle = paste0("h' ", k), summ(pg8$RE_star[hk(pg8$h) == k]))))
s8 <- fmt_s(s8); wcsv(s8, "s8_horizont.csv"); print(s8, row.names = FALSE)

# E3 unter Sensitivitaeten
e3_specs <- list()
add_e3 <- function(nm, pr, scale = "star", filt = function(j) j) {
  j <- filt(e3_fun(pr, scale)); s <- e3_sum(j); e3_specs[[nm]] <<- cbind(spez = nm, s)
}
add_e3("Primaer", prim)
add_e3("S1 unbereinigt", pairs_all, "unb")
add_e3("S3a ohne 2020", prim, "star", function(j) j[j$t != 2020, ])
add_e3("S3b ohne 2020, 2021", prim, "star", function(j) j[!(j$t %in% c(2020, 2021)), ])
add_e3("S4 ohne 2022", prim, "star", function(j) j[j$t != 2022, ])
add_e3("S5 Interpolation", pairs_s5)
add_e3("S7 mit 2025", pairs_s7)
e3_specs[["S2"]] <- data.frame(spez = "S2", n = NA, median_D = NA, n_D_neg = NA, hinweis = "nicht durchgefuehrt (E3 nicht von S2 betroffen laut SAP-Tabelle)")
e3_specs[["S6"]] <- data.frame(spez = "S6", n = NA, median_D = NA, n_D_neg = NA, hinweis = "nicht durchgefuehrt, Grund s. E2/S6")
e3_tab <- do.call(rbind, e3_specs); rownames(e3_tab) <- NULL; e3_tab$median_D <- round(e3_tab$median_D, 1)
wcsv(e3_tab, "tabelle3b_sensitivitaeten_E3.csv"); print(e3_tab, row.names = FALSE)

# E4 unter Sensitivitaeten (S1, S3a, S3b, S4): Kennzahlen je Sektor (MMS), nur Gesamtzelle
e4_sens <- function(nm, d, col) do.call(rbind, lapply(SEKS, function(s) cbind(spez = nm, sektor = s, summ(d[d$sektor == s & d$szenario == "MMS", col]))))
e4_s <- rbind(e4_sens("Primaer", prim, "RE_star"),
              e4_sens("S1 unbereinigt", pairs_all, "RE_unb"),
              e4_sens("S3a ohne 2020", prim[prim$t != 2020, ], "RE_star"),
              e4_sens("S3b ohne 2020, 2021", prim[!(prim$t %in% c(2020, 2021)), ], "RE_star"),
              e4_sens("S4 ohne 2022", prim[prim$t != 2022, ], "RE_star"))
e4_s <- fmt_s(e4_s); wcsv(e4_s, "tabelle4b_sektoren_sensitivitaeten.csv")

# =============================================================================
# POST-HOC-Zusatzrechnungen (gekennzeichnet; ohne Einfluss auf Haupt-/Entscheidungsergebnisse)
# =============================================================================
cat("\n== POST-HOC (nur zur Information) ==\n")
# (H10, Amendment 2) 2020-Wert Tab. 126 Bericht 2021
s21 <- ser[ser$bericht == 2021 & ser$szenario == "MMS" & ser$sektor == "gesamt", ]
p20 <- s21$wert[s21$jahr == 2020]; pjb21 <- s21$wert[s21$jahr == 2018]; fa <- Aget("gesamt", 2018) / pjb21
ph21 <- data.frame(kennzeichnung = "POST-HOC, nur zur Information (Amendment 2); NICHT in E1/E2/E3/E4/E5 oder Tabelle 3 enthalten",
                   bericht = 2021, zieljahr = 2020, P_Tab126_Mt = p20, quelle_laut_Bericht = "Vorjahresschaetzung (kein Inventarwert, keine Projektion)",
                   A_2020_Mt = Aget("gesamt", 2020), faktor_Jb2018 = fa, P_star_Mt = p20 * fa,
                   RE_unb_pct = 100 * (p20 - Aget("gesamt", 2020)) / Aget("gesamt", 2020),
                   RE_star_pct = 100 * (p20 * fa - Aget("gesamt", 2020)) / Aget("gesamt", 2020))
ph21[, c(4, 6:10)] <- lapply(ph21[, c(4, 6:10)], round, 3)
wcsv(ph21, "posthoc_pb2021_2020_wert_info.csv"); print(t(ph21))
# (H2) PB2015 AR4-Umrechnung statt SAR-Haupttabelle
ser_ar4 <- NULL
for (s in c("MMS", "MWMS")) {
  tid <- if (s == "MMS") "PB2015o_A-7" else "PB2015s_A-5-14"
  d <- x[x$tabelle_id == tid & x$szenario == s & x$sektor_bericht == "Gesamt" & x$rolle == "Gesamt" & !is.na(x$wert), ]
  ser_ar4 <- rbind(ser_ar4, data.frame(bericht = 2015, szenario = s, sektor = "gesamt", jahr = d$jahr, wert = d$wert, typ = d$typ, tabelle_id = tid, pdf_seite = d$pdf_seite, tabelle = d$tabelle))
}
pairs_ar4 <- make_pairs(ser_ar4); pairs_ar4 <- pairs_ar4[!is.na(pairs_ar4$RE_star), ]
cmp <- merge(pairs_all[pairs_all$bericht == 2015 & pairs_all$sektor == "gesamt", c("szenario", "t", "RE_star", "RE_unb", "faktor")],
             pairs_ar4[, c("szenario", "t", "RE_star", "RE_unb", "faktor")], by = c("szenario", "t"), suffixes = c("_SAR_Haupttabelle", "_AR4_Anhang"))
cmp[, -(1:2)] <- lapply(cmp[, -(1:2)], round, 3)
cmp$kennzeichnung <- "POST-HOC (H2): Vergleich SAR-Haupttabelle (primaer) vs AR4-Umrechnung Anhang A6, nur Information"
wcsv(cmp, "posthoc_pb2015_gwp_sar_vs_ar4.csv"); print(cmp, row.names = FALSE)

# =============================================================================
# SAP 5.4: Unsicherheitsbaender in den Berichten? (Textsuche, deskriptiv)
# =============================================================================
cat("\n== SAP 5.4: Textsuche nach Unsicherheits-/Bandbreitenangaben (Fundstellen) ==\n")
pdfs <- c(`2015` = "eea_reportnet_cdr/2015_envvqlq8w_projektionsbericht/150422_Projektionsbericht_2015_final.pdf",
          `2017` = "uba_projektionen/projektionsbericht_2017_uba_website.pdf", `2019` = "uba_projektionen/projektionsbericht-2019_uba_website.pdf",
          `2021` = "uba_projektionen/projektionsbericht_2021_uba_website.pdf", `2023` = "uba_projektionen/39_2023_cc_projektionsbericht_12_23.pdf")
band <- NULL
for (b in names(pdfs)) {
  tx <- suppressMessages(pdf_text(rf(pdfs[[b]])))
  for (pat in c("Unsicherheitsband|Unsicherheitsbereich|Bandbreite der Projektion|Konfidenz|Unsicherheitsspanne", "Sensitivit")) {
    hits <- which(grepl(pat, tx))
    band <- rbind(band, data.frame(bericht = b, muster = pat, n_seiten = length(hits), seiten = paste(head(hits, 40), collapse = ",")))
  }
}
wcsv(band, "unsicherheitsband_textsuche.csv"); print(band, row.names = FALSE)
cat("Hinweis: Treffer sind NICHT inhaltlich ausgewertet; in den extrahierten Gesamt-Ergebnistabellen (Zieljahr 2020) ist kein Band ausgewiesen.\n")

# =============================================================================
# SAP 11: Tabelle 1 (Berichte) und Liste ausgefallener Berichte/Sektoren
# =============================================================================
gwp_map <- c(`2015` = "IPCC SAR (Haupttabellen); AR4-Umrechnung Anhang A6", `2017` = "IPCC AR4", `2019` = "IPCC AR4 (Ableitung, im Bericht nicht woertlich)",
             `2021` = "IPCC AR4", `2023` = "IPCC AR5")
t1 <- do.call(rbind, lapply(BER, function(b) {
  v <- verf[verf$bericht == b & verf$sektor == "gesamt", ]
  zj <- sort(unique(pairs_all$t[pairs_all$bericht == b & pairs_all$sektor == "gesamt"]))
  fs <- unique(ser[ser$bericht == b & ser$sektor == "gesamt" & ser$szenario == "MMS", c("tabelle_id", "pdf_seite")])
  data.frame(Bericht = b, J_b = JB[[as.character(b)]],
             P_Jb_gesamt_vorhanden = paste(paste0(v$szenario, ":", ifelse(v$P_Jb_vorhanden, "ja", "nein")), collapse = "; "),
             Faktor_gesamt = paste(paste0(v$szenario, " ", sprintf("%.3f", fak$faktor[fak$bericht == b & fak$sektor == "gesamt" & fak$szenario %in% v$szenario][match(v$szenario, fak$szenario[fak$bericht == b & fak$sektor == "gesamt"])])), collapse = "; "),
             Zieljahre_2015_2024_explizit = paste(zj, collapse = ", "),
             Szenarien = paste(sort(unique(v$szenario)), collapse = ", "),
             GWP = gwp_map[[as.character(b)]],
             Fundstelle = paste(paste0(fs$tabelle_id, " (PDF-S. ", fs$pdf_seite, ")"), collapse = "; "))
}))
wcsv(t1, "tabelle1_berichte.csv"); print(t1, row.names = FALSE)
ausgef <- data.frame(
  objekt = c("Bericht 2013", "PB2015 Sektoren Energiewirtschaft, Gebaeude, Verkehr, Landwirtschaft", "PB2019, PB2021 Szenario MWMS",
             "PB2021 Wert fuer 2020 (Tab. 126)", "PB2021, PB2023 Zieljahr 2020", "UBA-Projektionsdaten 2024/2025 (S6)",
             "S2 Inventarrevision", "Zieljahre 2016-2019 (PB2015, 2017, 2019)", "Zieljahre ab 2025 in Primaerpopulation",
             "Sektorwerte S9 (LULUCF) PB2015/2021/2023"),
  grund = c("SAP 3.1: ausdruecklich ausgeschlossen (Entscheidung 22.10.2026)",
            "SAP 4.4: keine eindeutige Zuordnung zu KSG-Sektoren (1.A.4.c im Bericht in GHD, 1.A.3.e im Verkehr), entfallen",
            "Bericht weist kein MWMS aus (PB2019 S. 20: Verzicht), faellt aus E3 (SAP 4.2)",
            "Amendment 2: Vorjahresschaetzung, kein Auswertungspaar; nur Post-hoc-Information",
            "kein expliziter Projektionswert fuer 2020 im Bericht (SAP 4.2: keine Interpolation in der Primaeranalyse)",
            "kein historischer Wert fuer J_b in den Daten (Regel 2.1 Nr. 3); Hauptbericht 2024 nicht beschafft",
            "fruehere Inventarsubmissionen nicht beschafft", "im nationalen Bericht nicht explizit ausgewiesen (nur EEA/EU-Templates); SAP 4.2: keine Interpolation; nur S5",
            "SAP 4.2: Zieljahr 2025 nur S7", "LULUCF-Zeile fuer das Zieljahr/J_b im Bericht nicht vorhanden"))
wcsv(ausgef, "tabelle1b_ausgefallen.csv")

# =============================================================================
# SAP 4.4: Sektor-Zuordnungstabelle (Dokumentation)
# =============================================================================
zt <- data.frame(
  bericht = c(rep(2015, 7), rep(2017, 6), rep(2019, 6), rep(2021, 6), rep(2023, 6)),
  sektor_im_bericht = c("Industrie (BMUB-Zuschnitt)", "Uebrige (BMUB-Zuschnitt)", "Energiewirtschaft (BMUB)", "GHD + Haushalte (BMUB)", "Verkehr (BMUB)", "Landwirtschaft (BMUB)", "(Gesamt)",
                        ksp_lab, ksp_lab, KSG_SEK, KSG_SEK),
  ksg_sektor = c("Industrie", "Abfallwirtschaft und Sonstiges", "Energiewirtschaft", "Gebäude", "Verkehr", "Landwirtschaft", "gesamt",
                 KSG_SEK, KSG_SEK, KSG_SEK, KSG_SEK),
  status = c("zugeordnet", "zugeordnet", rep("ENTFAELLT", 4), "Gesamt", rep("zugeordnet", 6), rep("zugeordnet", 6), rep("zugeordnet", 12)),
  begruendung = c(
    "BMUB-Zuschnitt: Industrie = 1.A.2 + prozessbedingte Emissionen + Produktverwendung (PB2015 Sept. 2016 PDF-S. 298); entspricht KSG 2 (1.A.2, 2.A-H); in beiden Fassungen identisch",
    "Werte identisch mit Quellbereich Abfallwirtschaft (CRF 5) in allen Jahren; entspricht KSG 6; Restunschaerfe 5.C nicht pruefbar",
    "Erdgasverdichter (1.A.3.e) im Bericht im Verkehr, in KSG in Energiewirtschaft; nicht separat ausgewiesen -> nicht eindeutig",
    "1.A.4.c (Land-/Forstwirtschaft, Fischerei) steckt im Bericht in GHD (PB2015 April PDF-S. 215 Fn. 85; Sept. PDF-S. 298 Fn. 125), in KSG in Landwirtschaft -> nicht eindeutig",
    "1.A.3.e-Zuordnung s. Energiewirtschaft -> nicht eindeutig",
    "1.A.4.c im Bericht in GHD -> nicht eindeutig; BMUB-Fassungen April/Sept. unterscheiden sich",
    "",
    "KSP-2050-Sektoren laut PB2017 Tab. A-5-2 (PDF-S. 291/292, gelesen): 1.A.1, 1.A.3.e (Erdgasverdichter), 1.B -> Energiewirtschaft; CC 33/2019 Tab. 1 stuetzt dieselbe Zuordnung",
    "KSP Gebaeude = 1.A.4.a, 1.A.4.b, 1.A.5 = KSG Gebaeude", "KSP Industrie = 1.A.2 + 2 = KSG Industrie", "KSP Verkehr = 1.A.3.a-d = KSG Verkehr",
    "KSP Landwirtschaft = 3 + 1.A.4.c = KSG Landwirtschaft", "KSP Sonstige = CRF 5 (Abfall/Abwasser; Abfallverbrennung in Energie/Industrie) = KSG 6",
    "KSP-2050-Sektoren laut CC 33/2019 Tab. 1 (PDF-S. 13/14): 1.A.1, 1.A.3.e, 1.B -> Energiewirtschaft", "wie 2017", "wie 2017", "wie 2017", "wie 2017", "wie 2017",
    rep("Bericht gliedert nach KSG-Sektoren (Tab. 1/126, PB2021 Tab. 2); Namensgleichheit, Definition nicht erneut gegen KSG-Anlage 1 geprueft", 6),
    rep("Bericht gliedert nach KSG-Sektoren (Tab. 15/17, Datenanhang); Namensgleichheit, Definition nicht erneut gegen KSG-Anlage 1 geprueft", 6)))
wcsv(zt, "zuordnungstabelle_sektoren.csv")
cat("Hinweis: KSG-Referenz-Zuordnung (CRF -> KSG-Sektor) steht im Blatt 'THG' der KSG-Uebersicht (Referenzinventar).\n")

# =============================================================================
# SAP 11: Grafiken (Base R)
# =============================================================================
cat("\n== SAP 11: Grafiken ==\n")
COL <- c(`2015` = "#1b9e77", `2017` = "#d95f02", `2019` = "#7570b3", `2021` = "#e7298a", `2023` = "#66a61e")
PCH <- c(MMS = 16, MWMS = 17)
png_open <- function(f, w = 1500, h = 950) png(of(f), width = w, height = h, res = 150)

path_plot <- function(fname, bereinigt, titel, untertitel) {
  png_open(fname)
  par(mar = c(4.5, 4.8, 4, 1) + 0.1)
  ya <- Aref["gesamt", as.character(2005:2024)]
  plot(2005:2024, ya, type = "n", xlim = c(2005, 2026), ylim = c(450, 1010), xlab = "Jahr", ylab = "Treibhausgasemissionen ohne LULUCF (Mt CO2e)", las = 1)
  grid(col = "grey88")
  abline(v = 2020, lty = 2, col = "grey40")
  text(2020, 1005, "Zieljahr 2020", pos = 4, cex = 0.8, col = "grey30")
  lines(2005:2024, ya, lwd = 3.5, col = "black")
  points(2025, Aref["gesamt", "2025"], pch = 1, cex = 1.1)
  for (b in BER) {
    s <- ser[ser$bericht == b & ser$szenario == "MMS" & ser$sektor == "gesamt", ]
    jb <- JB[[as.character(b)]]
    pr <- s[s$typ == "proj" & s$jahr > jb & s$jahr <= 2030, ]
    pjb <- s$wert[s$jahr == jb]
    if (bereinigt) { f <- Aget("gesamt", jb) / pjb; yy <- c(Aget("gesamt", jb), pr$wert * f) } else yy <- c(pjb, pr$wert)
    xx <- c(jb, pr$jahr)
    lines(xx, yy, col = COL[[as.character(b)]], lwd = 2)
    in_w <- xx <= 2024
    points(xx[in_w], yy[in_w], pch = 16, col = COL[[as.character(b)]], cex = 1.0)
    points(xx[!in_w], yy[!in_w], pch = 1, col = COL[[as.character(b)]], cex = 1.0)
    text(xx[1], yy[1], labels = b, pos = 3, cex = 0.7, col = COL[[as.character(b)]])
  }
  legend("topright", legend = c("Ist (Inventar Submission 2026)", "Vorjahresschaetzung 2025 (nur S7)", paste0("Projektionsbericht ", BER, " (MMS)"),
                                "ausgefuellt: Fenster 2015-2024; offen: ausserhalb"),
         col = c("black", "black", unlist(COL[as.character(BER)]), "grey40"), lwd = c(3.5, NA, rep(2, 5), NA), pch = c(NA, 1, rep(16, 5), 1), cex = 0.7, bg = "white")
  title(main = titel, cex.main = 1.05, line = 2.2); mtext(untertitel, side = 3, line = 0.6, cex = 0.7)
  dev.off()
}
path_plot("grafik1_kerngrafik_bereinigt.png", TRUE,
          "Grafik 1: Projizierter Verlauf (MMS) gegen Ist, basisjahrbereinigt",
          "Jeder Pfad beginnt in seinem Ausgangsjahr J_b auf dem heutigen Inventarwert; nur explizit ausgewiesene Punkte; Skala beschreibt Verlauf, nicht Niveau")
path_plot("grafik1b_unbereinigt.png", FALSE,
          "Grafik 1b (ergaenzend): Projektionspfade ohne Bereinigung um spaetere Inventarrevisionen (S1)",
          "Pfade wie im jeweiligen Bericht ausgewiesen (verschiedene GWP-Saetze und Inventarstaende)")

# Grafik 2: RE* gegen h
png_open("grafik2_RE_gegen_horizont.png")
par(mar = c(4.5, 4.8, 4, 1) + 0.1)
plot(prim$h[prim$sektor == "gesamt"], prim$RE_star[prim$sektor == "gesamt"], type = "n", xlab = "Prognosehorizont h = t - J_b (Jahre)",
     ylab = "RE* (%), positiv = Emissionen ueberschaetzt", las = 1, xlim = c(0, 9), ylim = range(c(0, prim$RE_star[prim$sektor == "gesamt"])) * 1.15)
abline(h = 0, col = "grey40"); grid(col = "grey88"); abline(v = c(3.5, 6.5), lty = 3, col = "grey60")
pp <- prim[prim$sektor == "gesamt", ]
pp$hj <- pp$h + ifelse(pp$szenario == "MWMS", 0.12, -0.0)
points(pp$hj, pp$RE_star, pch = PCH[pp$szenario], col = COL[as.character(pp$bericht)], cex = 1.5)
text(pp$hj, pp$RE_star, labels = pp$t, pos = 3, cex = 0.6, col = "grey25")
legend("topleft", legend = c(paste0("Bericht ", BER), "MMS", "MWMS"), col = c(unlist(COL[as.character(BER)]), "black", "black"),
       pch = c(rep(15, 5), 16, 17), cex = 0.75, bg = "white")
title(main = "Grafik 2: RE* gegen Prognosehorizont (gesamt; Zahl = Zieljahr)", line = 2.2, cex.main = 1.05)
mtext("Paare sind nicht unabhaengig (gemeinsame Zieljahre, Pfadverkettung); gepunktet: Horizontklassen 1-3 / 4-6 / >=7", side = 3, line = 0.6, cex = 0.7)
dev.off()

# Grafik 3: E5-Zerlegung 2020
png_open("grafik3_E5_zerlegung_2020.png", 1300, 900)
par(mar = c(4.5, 4.8, 4, 1) + 0.1)
d3 <- e5_20[order(e5_20$bericht), ]
ylim3 <- range(c(0, d3$E5_start, d3$E5_verlauf, d3$E_unb, d3$E5_start + 0, d3$E5_verlauf)) * 1.25
plot(NA, xlim = c(0.4, nrow(d3) + 0.6), ylim = ylim3, xaxt = "n", xlab = "", ylab = "Abweichung unbereinigt, E_unb = Startpunkt + Verlauf (Mt CO2e)", las = 1)
abline(h = 0, col = "grey40"); grid(col = "grey88")
for (i in seq_len(nrow(d3))) {
  pos <- 0; neg <- 0
  for (comp in c("E5_start", "E5_verlauf")) {
    v <- d3[[comp]][i]; colr <- if (comp == "E5_start") "#4575b4" else "#fdae61"
    if (v >= 0) { rect(i - 0.3, pos, i + 0.3, pos + v, col = colr, border = "grey30"); pos <- pos + v }
    else { rect(i - 0.3, neg + v, i + 0.3, neg, col = colr, border = "grey30"); neg <- neg + v }
  }
  points(i, d3$E_unb[i], pch = 18, cex = 2, col = "black")
  text(i, d3$E_unb[i], labels = sprintf("E_unb = %.0f", d3$E_unb[i]), pos = 4, cex = 0.7)
}
axis(1, at = seq_len(nrow(d3)), labels = paste0("Bericht ", d3$bericht, "\nFaktor ", sprintf("%.3f", d3$faktor)))
legend("topright", legend = c("Startpunktabweichung (Inventarrevision/GWP des Ausgangsjahres)", "additive Verlaufsabweichung", "E_unb gesamt"),
       fill = c("#4575b4", "#fdae61", NA), pch = c(NA, NA, 18), border = c("grey30", "grey30", NA), cex = 0.75, bg = "white")
title(main = "Grafik 3: Zerlegung der unbereinigten Abweichung fuer Zieljahr 2020 (gesamt, MMS)", line = 2.2, cex.main = 1.0)
mtext("Ohne Bereinigung um spaetere Inventarrevisionen; Zerlegung ist keine Ursachenanalyse", side = 3, line = 0.6, cex = 0.7)
dev.off()

# Diagnostik-Grafiken (SAP 5.2 Nr. 2 und 4)
png_open("diag_punktdiagramm_RE_star.png", 1300, 900)
par(mar = c(4.5, 4.8, 4, 1) + 0.1)
xs <- match(pp$bericht, BER)
plot(xs + ifelse(pp$szenario == "MWMS", 0.15, -0.15), pp$RE_star, pch = PCH[pp$szenario], col = COL[as.character(pp$bericht)], cex = 1.6, xaxt = "n",
     xlab = "Projektionsbericht", ylab = "RE* (%)", las = 1, xlim = c(0.5, 5.5), ylim = range(c(0, pp$RE_star)) * 1.15)
abline(h = 0, col = "grey40"); axis(1, at = 1:5, labels = BER); grid(col = "grey88")
text(xs + ifelse(pp$szenario == "MWMS", 0.15, -0.15), pp$RE_star, labels = pp$t, pos = 3, cex = 0.6, col = "grey25")
legend("topleft", legend = c("MMS", "MWMS"), pch = c(16, 17), cex = 0.8)
title(main = "Diagnostik: alle RE*-Werte (gesamt), Punktdiagramm statt Histogramm", line = 2.2, cex.main = 1.0)
mtext("Zahl = Zieljahr", side = 3, line = 0.6, cex = 0.7)
dev.off()

png_open("diag_RE_star_ueber_zieljahr.png", 1300, 900)
par(mar = c(4.5, 4.8, 4, 1) + 0.1)
plot(NA, xlim = c(2014.5, 2025.5), ylim = range(c(0, pg$RE_star)) * 1.15, xlab = "Zieljahr t", ylab = "RE* (%), gesamt, MMS", las = 1)
abline(h = 0, col = "grey40"); grid(col = "grey88")
for (b in BER) { d <- pg[pg$bericht == b, ]; d <- d[order(d$t), ]; if (nrow(d)) { lines(d$t, d$RE_star, col = COL[[as.character(b)]], lwd = 1.5, type = "b", pch = 16, cex = 1.2) } }
legend("topleft", legend = paste0("Bericht ", BER), col = unlist(COL[as.character(BER)]), pch = 16, lwd = 1.5, cex = 0.8, bg = "white")
title(main = "Diagnostik: Verlauf von RE* je Bericht ueber das Zieljahr (gesamt, MMS)", line = 2.2, cex.main = 1.0)
mtext("Gemeinsamer Ausschlag mehrerer Berichte im selben Zieljahr = Zieljahr-Effekt (SAP 5.2 Nr. 4), nicht Berichtsqualitaet", side = 3, line = 0.6, cex = 0.7)
dev.off()
cat("Grafiken geschrieben.\n")

# =============================================================================
# Abschluss: Sitzungsinfo
# =============================================================================
writeLines(capture.output(sessionInfo()), of("sessionInfo_02_auswertung.txt"))
cat("\n== Fertig:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), " ==\n")
sink(); close(con_log)
