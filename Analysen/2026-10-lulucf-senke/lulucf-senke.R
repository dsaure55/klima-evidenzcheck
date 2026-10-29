# =============================================================================
# lulucf-senke.R  -  Evidenzcheck LULUCF-Senke (Klima Kompass)
# Umsetzung von SAP_lulucf-senke.md v1.0 (final, 29.10.2026) einschliesslich
# Amendment_1_lulucf-senke.md (final, 29.10.2026).
# Analyst-Subagent, Lauf am 29.10.2026. Seed 20261029 (SAP 5.7).
#
# ABWEICHUNGEN / HINWEISE (Details: Abweichungsprotokoll_lulucf-senke.md)
#  - Primaerquelle ist nach Amendment 1 (2.1/2.4 Fall 1) die Trendtabelle (Quelle 1),
#    nicht die UBA-PDF-Tabelle. Das ist KEINE Post-hoc-Abweichung, sondern Amendment.
#  - S4 (fruehere Submissions): nicht durchgefuehrt (nicht ohne Download beschaffbar).
#  - Kontrolle gegen UBA Data Cube: nicht durchgefuehrt (keine Zustimmung).
#  - Interpretation ohne SAP-Wortlaut: Divisor von r_req in S3a/S3b = Zieljahr - Fensterende
#    (7 bzw. 8), analog zu "6" in E3 und "5" in S7. Als Interpretationsnotiz protokolliert.
#  - Kein Netzzugriff aus dem Skript. Rohdateien werden nicht veraendert.
# Benoetigte Pakete (vorhanden, nichts installiert): readxl, pdftools, lmtest, sandwich, forecast
# =============================================================================

options(width = 200, stringsAsFactors = FALSE, warn = 1)
base   <- "C:/Users/dsaur/klima-evidenzcheck/Analysen/2026-10-lulucf-senke"
rd     <- file.path(base, "rohdaten")
outdir <- file.path(base, "output")
dir.create(outdir, showWarnings = FALSE)
logf <- file.path(base, "run_log.txt")
sink(logf, split = TRUE)
on.exit(sink(), add = TRUE)

suppressPackageStartupMessages({
  library(readxl); library(pdftools); library(lmtest); library(sandwich); library(forecast)
})

wcsv <- function(x, name) write.csv(x, file.path(outdir, name), row.names = FALSE, na = "")
hr   <- function(t) cat("\n", strrep("=", 78), "\n", t, "\n", strrep("=", 78), "\n", sep = "")

hr("RUN-LOG lulucf-senke.R")
cat("Datum/Zeit:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n")
cat("R-Version :", R.version.string, "\n")
cat("Seed      :", 20261029, "(SAP 5.7)\n")
cat("SAP       : v1.0 final 29.10.2026; Amendment 1 final 29.10.2026\n")

Z30 <- -25; Z40 <- -35; Z45 <- -40   # SAP 2.1
Y   <- 2024

# -----------------------------------------------------------------------------
# SAP 3.5 Nr. 1 / Amendment 2.2 Nr. 1: Integritaet der Eingaben
# -----------------------------------------------------------------------------
hr("SAP 3.5 Nr.1 / Amendment 2.2 Nr.1: Integritaet der Eingaben (SHA-256, Groesse)")
files <- c(q1  = "2026_EM_Entwicklung_in_D_Trendtabelle_THG.xlsx",
           q2  = "Emissionsuebersichten_KSG-Sektoren_1990-2025.xlsx",
           pdf = "2_Tab_Emi-Senken-LULUCF_2026-07-02.pdf")
pruef <- paste(readLines(file.path(rd, "PRUEFSUMMEN.txt"), warn = FALSE), collapse = "\n")
prov  <- paste(readLines(file.path(rd, "PROVENIENZ.txt"), warn = FALSE), collapse = "\n")
cat("--- PRUEFSUMMEN.txt ---\n", pruef, "\n--- Ende ---\n")
integ <- data.frame(datei = files, sha256 = NA, bytes = NA, in_pruefsummen = NA, in_provenienz = NA)
for (i in seq_along(files)) {
  p <- file.path(rd, files[i])
  h <- unname(tools::sha256sum(p))
  integ$sha256[i] <- h; integ$bytes[i] <- file.size(p)
  integ$in_pruefsummen[i] <- grepl(h, pruef, fixed = TRUE) || grepl(h, prov, fixed = TRUE)
  integ$in_provenienz[i]  <- grepl(h, prov, fixed = TRUE)
}
print(integ)
if (!all(integ$in_pruefsummen)) stop("SHA-256-Abweichung: STOPP, Rueckfrage")
cat("Erstes Oeffnen der beiden xlsx-Dateien durch den Analysten: ", format(Sys.time(), "%Y-%m-%d %H:%M:%S"),
    " (Prueffolge: Integritaet -> Fassung -> Vollstaendigkeit -> Kategorien -> Einheit/Vorzeichen)\n", sep = "")
cat("Eingabe-Inventarbericht 2026 (50.870.104 Bytes) wird in diesem Skript NICHT gelesen.\n")
wcsv(integ, "tab_integritaet_eingaben.csv")

# -----------------------------------------------------------------------------
# Amendment 2.2 Nr. 2: Fassung (Wortlaut dokumentieren)
# -----------------------------------------------------------------------------
hr("Amendment 2.2 Nr.2: Fassung / Dateikopf (Wortlaut)")
f1 <- file.path(rd, files["q1"]); f2 <- file.path(rd, files["q2"])
cover <- suppressMessages(read_excel(f1, sheet = "Deckblatt_Cover", col_names = FALSE, .name_repair = "minimal"))
cat("Quelle 1, Blatt Deckblatt_Cover (nicht leere Zeilen):\n")
cat(paste0("  ", na.omit(unlist(cover[[1]]))), sep = "\n")
rd_all <- function(f, s) as.data.frame(suppressMessages(read_excel(f, sheet = s, col_names = FALSE, .name_repair = "minimal")))
q1_names <- excel_sheets(f1); q2_names <- excel_sheets(f2)
cat("Quelle 1 Blaetter:", paste(q1_names, collapse = ", "), "\n")
cat("Quelle 2 Blaetter:", paste(q2_names, collapse = ", "), "\n")
txt_scan <- function(f, sheets, pat) {
  for (s in sheets) { d <- rd_all(f, s); v <- unlist(d); v <- v[!is.na(v)]; v <- v[is.character(v) | TRUE]
    hit <- unique(as.character(v)[grepl(pat, as.character(v), ignore.case = TRUE)])
    if (length(hit)) { cat("  [", basename(f), " / ", s, "]\n", sep = ""); cat(paste0("     ", substr(hit, 1, 250)), sep = "\n") } }
}
cat("Textstellen zu Submission/Stand/Fassung/GWP/AR5 in Quelle 1:\n")
txt_scan(f1, q1_names, "submission|stand|version|fassung|GWP|AR[ -]?[4-6]|assessment|NIR|inventor")
cat("Textstellen zu Submission/Stand/Fassung/GWP/AR5 in Quelle 2 (ohne Grafikblaetter):\n")
txt_scan(f2, q2_names[!grepl("^Grafik|UBA_CI", q2_names)], "submission|stand|version|fassung|GWP|AR[ -]?[4-6]|assessment|NIR|inventor|Vorjahressch")
cat("Titel Quelle 2, Blatt THG:", unlist(rd_all(f2, "THG")[1, 1]), "\n")
cat("PDF-Fussnote (Quellenzeile): ")
pdft <- pdf_text(file.path(rd, files["pdf"]))
fn <- unlist(strsplit(pdft, "
")); fn <- fn[grepl("Quelle: Umweltbundesamt", fn)]; cat(trimws(substring(fn, regexpr("Quelle: Umweltbundesamt", fn))), "
")
cat("BEFUND Fassung: Quelle 1 nennt im Deckblatt 'Nationale Trendtabellen ... 1990 - 2024', Dessau, 15.01.2026; die Bezeichnung\n",
    "  'Submission 2026' steht NICHT woertlich im Dateikopf (siehe Textsuche oben) -> Hinweis, kein Wechsel der Referenz.\n",
    "  GWP-Basis: Quelle 1 nennt nur 'GWP: Global Warming Potential' (siehe Textsuche); AR5 laut Inventarbericht (SAP 3.5 Nr.3).\n", sep = "")

# -----------------------------------------------------------------------------
# Amendment 2.2 Nr. 3-7: Import Quelle 1 (Primaerquelle), Vollstaendigkeit, Kategorien, Einheit
# -----------------------------------------------------------------------------
hr("Amendment 2.2 Nr.3-7 / SAP 3.5: Import Quelle 1 (Blatt GHG_CO2eq)")
g1 <- rd_all(f1, "GHG_CO2eq")
cat("Titelzeile:", g1[1, 1], "\n")
hdr1 <- suppressWarnings(as.numeric(unlist(g1[3, ])))
cat("Kopfzeile 3, Spalte 1-3:", unlist(g1[3, 1:3]), "\n")
yc1 <- which(!is.na(hdr1))                       # Datumsspalten (Excel-Seriennummern)
yrs1 <- as.integer(format(as.Date(hdr1[yc1], origin = "1899-12-30"), "%Y"))
cat("Jahresspalten Quelle 1: ", min(yrs1), "-", max(yrs1), "; n =", length(yrs1), "\n")
chk_years <- identical(as.integer(yrs1), 1990:2024)
cat("Jahresreihe 1990-2024 lueckenlos und eindeutig:", chk_years, "\n")
if (!chk_years) stop("Quelle 1: Jahresreihe nicht 1990-2024 lueckenlos -> Rueckfall/Stopp nach Amendment 2.4")
lab1 <- trimws(as.character(g1[, 1]))
getrow <- function(d, lab, cols) as.numeric(unlist(d[which(lab == lab)[1], cols]))
lab_tot <- "4. Land Use, Land Use Change and Forestry"
lab_cat <- c(Wald = "A. Forest Land", Acker = "B. Cropland", Gruen = "C. Grassland",
             Feucht = "D. Wetlands", Sied = "E. Settlements", HWP = "G. Harvested Wood Products")
cat("Gefundene Zeilen (Zeilennr. im Blatt GHG_CO2eq): ", lab_tot, "=", which(lab1 == lab_tot),
    "; ", paste(names(lab_cat), which(lab1 %in% lab_cat) , collapse = ", "), "\n")
stopifnot(all(lab_cat %in% lab1), lab_tot %in% lab1)
rowsel <- function(lab) as.numeric(unlist(g1[which(lab1 == lab)[1], yc1]))
Q1 <- data.frame(year = yrs1, total_kt = rowsel(lab_tot))
for (k in names(lab_cat)) Q1[[paste0(k, "_kt")]] <- rowsel(lab_cat[k])
cat("Fehlende Werte in Quelle 1 (Gesamt/Kategorien):", sum(is.na(Q1)), "\n")
if (anyNA(Q1)) stop("Luecken in Quelle 1 -> Stopp/Rueckfall nach Amendment 2.4")
cat("Einheit: kt CO2-Aequivalent (Titelzeile), Umrechnung /1000 nach Mt. Vorzeichen: positiv = Quelle (Total 1990 = +",
    round(Q1$total_kt[1] / 1000, 1), " Mt; Wald negativ = Senke) -> deckt sich mit SAP-Konvention, keine Umkehr.\n", sep = "")
cat("Gase: THG gesamt (CO2, CH4, N2O, Blatt 'GHG_CO2eq'; LULUCF hier CO2/CH4/N2O). Gesamt-Zeile LULUCF vorhanden: ja; HWP eigene Zeile: ja\n")
cat("Abgrenzung (SAP 3.5 Nr.7): Primaerreihe E(y) = Zeile '", lab_tot, "' (Quelle 1, Blatt GHG_CO2eq), Gesamtsektor inkl. HWP (Summenprobe unten).\n", sep = "")

# Summenpruefung SAP 3.5 Nr. 5, Toleranz 0,5 Mt absolut
catsum <- rowSums(Q1[, paste0(names(lab_cat), "_kt")])
Q1$sumdiff_Mt <- (catsum - Q1$total_kt) / 1000
cat("Summenpruefung Kategorien (inkl. HWP) vs. Gesamt: max |Differenz| =", signif(max(abs(Q1$sumdiff_Mt)), 3), "Mt; Toleranz 0.5 Mt ->",
    ifelse(max(abs(Q1$sumdiff_Mt)) <= 0.5, "ERFUELLT", "VERLETZT (dokumentiert, nicht korrigiert)"), "\n")
Q1$E_Mt   <- Q1$total_kt / 1000
Q1$HWP_Mt <- Q1$HWP_kt / 1000
Q1$modell <- ifelse(Q1$year >= 2023, "Modellfortschreibung (Inventarbericht, SAP 4.3)", "")
wcsv(Q1, "tab_reihe_quelle1_primaer.csv")
E   <- setNames(Q1$E_Mt, Q1$year)
HWP <- setNames(Q1$HWP_Mt, Q1$year)
cat("Primaerreihe n =", length(E), " (1990-2024). Primaerquelle nach Amendment 2.4 Fall 1: Quelle 1. Fenster A durchfuehrbar.\n")

# -----------------------------------------------------------------------------
# Amendment 2.3: Abgleich mit Quelle 2 (maschinell, alle Jahre) und PDF (Stichprobe)
# -----------------------------------------------------------------------------
hr("Amendment 2.3: Abgleich Quelle 2 (alle Jahre) und PDF-Tabelle (Stichprobe)")
g2 <- rd_all(f2, "THG")
hdr2 <- suppressWarnings(as.numeric(unlist(g2[2, ])))
yc2  <- which(!is.na(hdr2)); yrs2 <- as.integer(format(as.Date(hdr2[yc2], origin = "1899-12-30"), "%Y"))
cat("Quelle 2 Blatt THG: Jahre", min(yrs2), "-", max(yrs2), ", n =", length(yrs2), "; luckenlos:", identical(yrs2, 1990:2025), "\n")
lab2 <- trimws(as.character(g2[, 1]))
lab2_map <- c(total = "7 - Landnutzung, Landnutzungsänderung und Forstwirtschaft", Wald = "CRF 4.A - Wälder", Acker = "CRF 4.B - Ackerland",
              Gruen = "CRF 4.C - Grünland", Feucht = "CRF 4.D - Feuchtgebiete", Sied = "CRF 4.E - Siedlungen", HWP = "CRF 4.G - Holzprodukte")
r2 <- sapply(lab2_map, function(l) { i <- which(lab2 == l); if (!length(i)) i <- grep(substr(l, 1, 9), lab2)[1]; i })
print(r2)
Q2 <- data.frame(year = yrs2)
for (k in names(lab2_map)) Q2[[paste0(k, "_kt")]] <- as.numeric(unlist(g2[r2[k], yc2]))
wcsv(Q2, "tab_reihe_quelle2_kontrolle.csv")
cat("Quelle 2 Einheit: 'tausend Tonnen CO2-aequivalent' (Titelzeile) -> kt. HWP/Kategorien als eigene Zeilen vorhanden.\n")
cmp2 <- merge(Q1[, c("year", "total_kt", paste0(names(lab_cat), "_kt"))], Q2, by = "year", suffixes = c("_q1", "_q2"))
vars <- c("total", paste0(names(lab_cat)))
ab2 <- do.call(rbind, lapply(vars, function(v) data.frame(variable = v, year = cmp2$year,
        q1_Mt = cmp2[[paste0(v, "_kt_q1")]] / 1000, q2_Mt = cmp2[[paste0(v, "_kt_q2")]] / 1000)))
ab2$diff_Mt <- ab2$q2_Mt - ab2$q1_Mt; ab2$ueber_schwelle <- abs(ab2$diff_Mt) > 0.5
wcsv(ab2, "tab_abgleich_quelle1_vs_quelle2.csv")
cat("Abgleich Quelle 1 vs Quelle 2, ", nrow(cmp2), " gemeinsame Jahre (", min(cmp2$year), "-", max(cmp2$year), ") x ", length(vars),
    " Variablen. Max |Differenz| je Variable (Mt):\n", sep = "")
print(tapply(abs(ab2$diff_Mt), ab2$variable, max))
cat("Anzahl Jahr-Variablen-Paare ueber Schwelle 0,5 Mt:", sum(ab2$ueber_schwelle), "\n")
cat("Gesamtsektor: Jahre ueber Schwelle:", paste(ab2$year[ab2$variable == "total" & ab2$ueber_schwelle], collapse = ", "), "\n")

# --- PDF: doppelte Uebertragung fuer 1990, 2000, 2010, 2020, 2024 (+2025 zusaetzlich) ---
cat("\n--- PDF-Stichprobe (Amendment 2.3): Uebertragung 1 = Sichtablesung der Seite als Bild (hier hart kodiert, Tsd. t CO2-Aequiv.,\n",
    "    Block 'Treibhausgase gesamt'); Uebertragung 2 = unabhaengige maschinelle Positionsauslese (pdftools::pdf_data, Spaltenzuordnung per x-Koordinate) ---\n", sep = "")
cats <- c("Wald", "Acker", "Gruen", "Feucht", "Sied", "HWP", "total")
visual <- list(   # Reihenfolge: Waelder, Ackerland, Gruenland, Feuchtgebiete, Siedlungen, Holzprodukte, Gesamt
  `1990` = c(-26452.6, 26746.5, 25182.8, 8981.7, 3331.4, -1294.9, 36494.9),
  `2000` = c(-52798.3, 29917.3, 24805.2, 9394.8, 3706.5, -7295.5, 7729.9),
  `2010` = c(-39760.2, 19485.4, 22016.7, 8921.9, 4228.7, -3580.8, 11311.7),
  `2020` = c(-1994.1, 16514.1, 26308.5, 10030.5, 4842.2, -8055.0, 47646.2),
  `2024` = c(2140.5, 17515.5, 24178.4, 8952.7, 4644.2, 407.6, 57838.9),
  `2025` = c(-19286.1, 6788.5, 26687.3, 9964.7, 4440.8, -1740.1, 26855.1))
pd <- pdf_data(file.path(rd, files["pdf"]))[[1]]
hd <- pd[pd$text %in% as.character(c(1990:1995, 2000, 2005:2025)) & pd$y < 25, ]
hd <- hd[order(hd$x), ]; ctr <- hd$x + hd$width / 2; yrs_pdf <- as.integer(hd$text)
cat("PDF-Spaltenkoepfe Block 1:", paste(yrs_pdf, collapse = " "), "\n")
cat("-> in der PDF fehlen die Jahre 1996-1999 und 2001-2004 (Befund Stopp 1, bekannt).\n")
bnd <- c(-Inf, head(ctr, -1) + diff(ctr) / 2, Inf)
rowlab <- pd[pd$x < 40 & pd$y < 80, ]
rowdef <- list(Wald = "^W", Acker = "^Acker", Gruen = "^Gr", Feucht = "^Feucht", Sied = "^Siedl", HWP = "^Holz", total = "^Gesamt")
pdfx <- matrix(NA_real_, nrow = length(rowdef), ncol = length(yrs_pdf), dimnames = list(names(rowdef), yrs_pdf))
for (k in names(rowdef)) {
  ry <- rowlab$y[grepl(rowdef[[k]], rowlab$text)][1]
  tk <- pd[abs(pd$y - ry) <= 1 & pd$x >= 90, ]; tk <- tk[order(tk$x), ]
  tk$col <- findInterval(tk$x + tk$width / 2, bnd)
  for (cj in seq_along(yrs_pdf)) {
    s <- tk$text[tk$col == cj]; if (!length(s)) next
    s <- paste(s, collapse = ""); neg <- grepl("-", s); s <- gsub("[-. ]", "", s); s <- sub(",", ".", s)
    v <- suppressWarnings(as.numeric(s)); pdfx[k, cj] <- ifelse(neg, -v, v)
  }
}
pdf_long <- data.frame(year = rep(yrs_pdf, each = nrow(pdfx)), variable = rep(rownames(pdfx), times = length(yrs_pdf)), pdf_auto_kt = as.vector(pdfx))
dt <- do.call(rbind, lapply(names(visual), function(yy) data.frame(year = as.integer(yy), variable = cats,
        pdf_sicht_kt = visual[[yy]])))
dt <- merge(dt, pdf_long, by = c("year", "variable"))
dt$diff_uebertragung_kt <- dt$pdf_sicht_kt - dt$pdf_auto_kt
cat("Doppelte Uebertragung: Differenzen Sichtablesung vs. maschinelle Auslese (Tsd. t); Anzahl Zellen:", nrow(dt),
    "; Zellen mit Differenz > 0.05:", sum(abs(dt$diff_uebertragung_kt) > 0.05, na.rm = TRUE), "; NA:", sum(is.na(dt$pdf_auto_kt)), "\n")
if (any(abs(dt$diff_uebertragung_kt) > 0.05, na.rm = TRUE) || anyNA(dt$pdf_auto_kt)) { cat("Abweichende Zellen:\n"); print(dt[abs(dt$diff_uebertragung_kt) > 0.05 | is.na(dt$pdf_auto_kt), ]) }
# Vergleich PDF (Sichtablesung) gegen Primaerreihe Quelle 1
q1l <- do.call(rbind, lapply(cats, function(v) data.frame(year = Q1$year, variable = v, q1_kt = Q1[[paste0(v, "_kt")]])))
dt <- merge(dt, q1l, by = c("year", "variable"), all.x = TRUE)
q2l <- do.call(rbind, lapply(cats, function(v) data.frame(year = Q2$year, variable = v, q2_kt = Q2[[paste0(v, "_kt")]])))
dt <- merge(dt, q2l, by = c("year", "variable"), all.x = TRUE)
dt$diff_pdf_minus_q1_Mt <- (dt$pdf_sicht_kt - dt$q1_kt) / 1000
dt$diff_pdf_minus_q2_Mt <- (dt$pdf_sicht_kt - dt$q2_kt) / 1000
dt$ueber_schwelle_q1 <- abs(dt$diff_pdf_minus_q1_Mt) > 0.5
dt <- dt[order(dt$year, match(dt$variable, cats)), ]
wcsv(dt, "tab_abgleich_pdf_stichprobe.csv")
print(dt[, c("year", "variable", "pdf_sicht_kt", "pdf_auto_kt", "q1_kt", "q2_kt", "diff_pdf_minus_q1_Mt", "ueber_schwelle_q1")], digits = 8)
tot5 <- dt[dt$variable == "total" & dt$year %in% c(1990, 2000, 2010, 2020, 2024), ]
n_ab <- sum(tot5$ueber_schwelle_q1)
cat("PDF vs Quelle 1, Gesamtsektor, 5 Stichprobenjahre: Jahre ueber 0,5 Mt:", n_ab, "(Regel: >=3 -> 'vermutlich andere Fassung')\n")
cat("PDF vs Quelle 1, alle Kategorien x 5 Jahre ueber 0,5 Mt:", sum(dt$ueber_schwelle_q1[dt$year %in% c(1990, 2000, 2010, 2020, 2024)]), "von 35\n")
cat("FUSSNOTENFRAGE: ", ifelse(n_ab >= 3, "Kontrollquelle gehoert vermutlich zu einer anderen Fassung (vgl. Fussnote 'Stand 03/2024')",
    "Die PDF-Werte stimmen in der Stichprobe mit Quelle 1 ueberein; die Fussnote 'Stand 03/2024' erscheint nach diesem Abgleich veraltet (Hinweis, keine Aenderung)."), "\n", sep = "")
chk_pdf_total <- all(abs((as.numeric(pdfx["total", ]) - Q1$total_kt[match(yrs_pdf, Q1$year)]) / 1000) <= 0.5, na.rm = TRUE)
cat("Zusatz (maschinell, alle PDF-Jahre 1990-2024 ausser 2025): Gesamtsektor PDF vs Quelle 1 innerhalb 0,5 Mt:", chk_pdf_total, "\n")
cat("Vollstaendigkeit Fenster B in PDF (2010-2024, Kontrolle, nicht Primaerquelle):", all(2010:2024 %in% yrs_pdf), "\n")
cat("Regel: Primaerquelle gilt; Kontrollquellen aendern keinen Wert der Primaerreihe.\n")

# 2025-Schaetzwert fuer S7 aus Quelle 2 (Amendment 2.1); Abgleich PDF
v2025_q2  <- Q2$total_kt[Q2$year == 2025] / 1000
v2025_pdf <- visual[["2025"]][7] / 1000
cat("Schaetzwert 2025 (unsichere Vorjahresschaetzung, KEIN Inventarwert): Quelle 2 =", v2025_q2, "Mt; PDF =", v2025_pdf, "Mt; Differenz =", round(v2025_q2 - v2025_pdf, 4), "Mt\n")

# -----------------------------------------------------------------------------
# SAP 2.1 / 5.1: Messwert M(T), Kernzahlen E1, E4
# -----------------------------------------------------------------------------
hr("SAP 2.1/5.1: Messwert M(T) (4-Jahres-Mittel), E1, E4")
Mfun <- function(x, T) mean(x[as.character((T - 3):T)])
Mser <- sapply(1993:2024, function(T) Mfun(E, T)); names(Mser) <- 1993:2024
wcsv(data.frame(T = 1993:2024, M_Mt = Mser), "tab_M_reihe_4jahresmittel.csv")
M24 <- Mser["2024"]
cat("E(2021..2024) [Mt]:", paste(round(E[as.character(2021:2024)], 3), collapse = ", "), " (2023, 2024 = Modellfortschreibung)\n")
cat("M(2024) =", M24, " D30 =", M24 - Z30, " D40 =", M24 - Z40, " D45 =", M24 - Z45, "\n")
tab2 <- data.frame(groesse = c(paste0("E(", 2021:2024, ")"), "M(2024)", "Z30", "D30", "D40", "D45"),
  wert_Mt = c(E[as.character(2021:2024)], M24, Z30, M24 - Z30, M24 - Z40, M24 - Z45),
  hinweis = c("", "", "Modellfortschreibung", "Modellfortschreibung", "4-Jahres-Mittel 2021-2024", "Zielwert 4-Jahres-Mittel 2030",
              "M(2024)-Z30, >0 = ueber dem Zielwert", "M(2024)-Z40", "M(2024)-Z45"))
tab2 <- tab2[c(1:5, 7:9, 6), ]; tab2$hinweis[tab2$groesse == "Z30"] <- "Zielwert 4-Jahres-Mittel 2030 (Z40 = -35, Z45 = -40)"
wcsv(tab2, "tab2_kernergebnisse_E1_E4.csv")
cat("Kategorie F1: M(2024) liegt", ifelse(M24 - Z30 > 0, "UEBER (Ziel nicht erreicht im juengsten Messwert)", "im Zielbereich"), "\n")
cat("r_req = (Z30 - M(2024))/6 =", (Z30 - M24) / 6, "Mt/Jahr\n")

# -----------------------------------------------------------------------------
# Funktionen: OLS-Fenster, Prognoseintervall (SAP 2.2), Kategorie (5.6)
# -----------------------------------------------------------------------------
cat_of <- function(L, U, Z = Z30) ifelse(L > Z, "K-ueber", ifelse(U < Z, "K-unter", "K-im"))
ols_win <- function(x, a, end, Zyear = 2030, h_tgt = 2028.5, tag = "") {
  yy <- a:end; v <- x[as.character(yy)]; n <- length(yy)
  df <- data.frame(y = as.numeric(v), yr = yy); fit <- lm(y ~ yr, df)
  b <- coef(fit); s <- summary(fit)$sigma; ybar <- mean(yy); Sxx <- sum((yy - ybar)^2)
  mh <- unname(b[1] + b[2] * h_tgt)
  tq <- qt(0.975, n - 2)
  half <- if (n >= 5) tq * s * sqrt(1/4 + 1/n + (h_tgt - ybar)^2 / Sxx) else NA
  L <- mh - half; U <- mh + half
  se_b <- summary(fit)$coefficients[2, 2]; p_b <- summary(fit)$coefficients[2, 4]
  lag <- floor(4 * (n / 100)^(2/9))
  V <- tryCatch(NeweyWest(fit, lag = lag, prewhite = FALSE, adjust = FALSE), error = function(e) NULL)
  se_h <- if (!is.null(V)) sqrt(V[2, 2]) else NA
  list(tag = tag, a = a, end = end, n = n, fit = fit, df = df, beta = unname(b[2]), alpha = unname(b[1]), s = s, Sxx = Sxx, ybar = ybar,
       mhat = mh, L = L, U = U, kat = if (n >= 5) cat_of(L, U) else NA, dist = mh - Z30,
       beta_lo = unname(b[2] - tq * se_b), beta_hi = unname(b[2] + tq * se_b), se_b = se_b, p = p_b,
       nwlag = lag, se_h = se_h, beta_lo_h = unname(b[2] - tq * se_h), beta_hi_h = unname(b[2] + tq * se_h),
       p_h = 2 * pt(-abs(b[2] / se_h), n - 2), belast = ifelse(n < 10, "n<10, geringe Belastbarkeit", ""))
}
q_ratio <- function(rreq, robs) ifelse(rreq < 0 & robs < 0, rreq / robs, NA)
res_row <- function(w, Mend, divisor, rreq_ok = TRUE, M5 = NA, M10 = NA) {
  rreq <- (Z30 - Mend) / divisor
  data.frame(fenster = w$tag, von = w$a, bis = w$end, n = w$n, beta = w$beta, beta_lo = w$beta_lo, beta_hi = w$beta_hi,
    beta_lo_HAC = w$beta_lo_h, beta_hi_HAC = w$beta_hi_h, NW_lag = w$nwlag, p_klass = w$p, p_HAC = w$p_h,
    Mhat2030 = w$mhat, L = w$L, U = w$U, kategorie = w$kat, abstand_Mhat_minus_Z30 = w$dist,
    Mend = Mend, D30 = Mend - Z30, r_req = rreq, r_obs = w$beta,
    Q = ifelse(Mend - Z30 > 0, q_ratio(rreq, w$beta), NA),
    Q_beta_lo = ifelse(w$beta_hi < 0 & rreq < 0, rreq / w$beta_hi, NA),   # Grenzen nur, wenn ganzes KI < 0
    Q_beta_hi = ifelse(w$beta_hi < 0 & rreq < 0, rreq / w$beta_lo, NA),
    belastbarkeit = w$belast)
}

# -----------------------------------------------------------------------------
# SAP 4.2 / 5.1 / 2.2: Primaeranalyse Fenster A, B, C
# -----------------------------------------------------------------------------
hr("SAP 4.2/5.1/2.2: Primaeranalyse (OLS auf Jahreswerten, Prognoseintervall fuer Mittel 2027-2030)")
W <- list(B = ols_win(E, 2010, 2024, tag = "B (primaer)"), A = ols_win(E, 1990, 2024, tag = "A"), C = ols_win(E, 2018, 2024, tag = "C"))
cat("n je Fenster: A =", W$A$n, ", B =", W$B$n, ", C =", W$C$n, " (soll 35/15/7)\n")
prim <- do.call(rbind, lapply(W, res_row, Mend = M24, divisor = 6))
prim$p_holm_klass <- p.adjust(prim$p_klass, "holm"); prim$p_holm_HAC <- p.adjust(prim$p_HAC, "holm")
print(t(prim), quote = FALSE)
cat("\nGesamtaussage (SAP 5.6): Kategorien A/B/C =", paste(prim$kategorie, collapse = " / "), "->",
    ifelse(length(unique(prim$kategorie)) == 1, paste("uebereinstimmend:", unique(prim$kategorie)), "Die Fenster liefern unterschiedliche Kategorien"), "\n")
cat("Hinweis: drei 95-%-Intervalle sind nicht simultan 95 %-sicher (SAP 5.5).\n")

# E3: r_obs5, r_obs10
rr <- data.frame(r_req = (Z30 - M24) / 6, r_obs5 = (M24 - Mser["2019"]) / 5, r_obs10 = (M24 - Mser["2014"]) / 10)
rr$Q_obs5  <- q_ratio(rr$r_req, rr$r_obs5); rr$Q_obs10 <- q_ratio(rr$r_req, rr$r_obs10)
cat("\nE3: r_req =", rr$r_req, " r_obs5 =", rr$r_obs5, " r_obs10 =", rr$r_obs10, " Q5 =", rr$Q_obs5, " Q10 =", rr$Q_obs10, "\n")
cat("r_obs(A/B/C) =", paste(round(prim$r_obs, 3), collapse = " / "), " Q(A/B/C) =", paste(round(prim$Q, 2), collapse = " / "), "\n")
for (i in 1:3) if (is.na(prim$Q[i])) cat("  Fenster", prim$fenster[i], ": keine Verbesserung beobachtet (r_obs >= 0), Rate nicht vergleichbar, kein Quotient.\n")
if (is.na(rr$Q_obs5))  cat("  r_obs5: keine Verbesserung (>= 0), nicht vergleichbar.\n")
if (is.na(rr$Q_obs10)) cat("  r_obs10: keine Verbesserung (>= 0), nicht vergleichbar.\n")
wcsv(prim, "tab3_fenster_A_B_C.csv")
wcsv(cbind(prim[, c("fenster", "r_req", "r_obs", "beta_lo", "beta_hi", "beta_lo_HAC", "beta_hi_HAC", "Q", "Q_beta_lo", "Q_beta_hi")],
           r_obs5 = rr$r_obs5, r_obs10 = rr$r_obs10, Q_obs5 = rr$Q_obs5, Q_obs10 = rr$Q_obs10), "tab4_E3_raten.csv")

# -----------------------------------------------------------------------------
# SAP 5.2: Diagnostik (Fenster A, B, C)
# -----------------------------------------------------------------------------
hr("SAP 5.2: Diagnostik je Fenster (DW einseitig 'greater', ACF, Shapiro, Breusch-Pagan, Cook, Hebel)")
diag_rows <- list()
png(file.path(outdir, "anhang_diagnostik.png"), width = 2000, height = 1700, res = 150)
par(mfrow = c(4, 3), mar = c(4, 4, 3, 1))
for (nm in c("B", "A", "C")) {
  w <- W[[nm]]; f <- w$fit; r <- resid(f); n <- w$n
  dw <- dwtest(f, alternative = "greater"); bp <- bptest(f)
  sw <- if (n >= 8) shapiro.test(r) else NULL
  ck <- cooks.distance(f); hv <- hatvalues(f); flag <- names(ck)[ck > 4 / n]
  yrs <- w$df$yr; ac <- acf(r, lag.max = min(5, floor(n / 3)), plot = FALSE)
  cat("\n-- Fenster", nm, "(n =", n, ") --\n")
  cat("Durbin-Watson (positiv, einseitig): DW =", round(unname(dw$statistic), 3), ", p =", round(dw$p.value, 3),
      ifelse(nm == "C", "  [n=7: kaum trennscharf, nicht zur Entscheidung herangezogen]", ""), "\n")
  cat("Breusch-Pagan: BP =", round(unname(bp$statistic), 3), ", p =", round(bp$p.value, 3), " (deskriptiv)\n")
  cat("Shapiro-Wilk:", if (!is.null(sw)) paste0("W = ", round(unname(sw$statistic), 3), ", p = ", round(sw$p.value, 3)) else "n < 8: nur Q-Q-Plot", "\n")
  cat("ACF Residuen Lag 1..", length(ac$acf) - 1, ": ", paste(round(ac$acf[-1], 3), collapse = ", "), "\n", sep = "")
  cat("Cook-Distanz > 4/n =", round(4 / n, 3), ": ", ifelse(length(flag), paste(yrs[ck > 4 / n], collapse = ", "), "keine"), " (max Cook = ", round(max(ck), 3), " im Jahr ", yrs[which.max(ck)], ")\n", sep = "")
  cat("Hebelwerte 2023/2024:", paste(round(hv[as.character(which(yrs %in% 2023:2024))], 3), collapse = ", "), "; maximaler Hebel", round(max(hv), 3), "im Jahr", yrs[which.max(hv)], " (Schwelle 2p/n =", round(4 / n, 3), ")\n")
  cat("Residuen 2023/2024 [Mt]:", paste(round(r[yrs %in% 2023:2024], 2), collapse = ", "), "\n")
  diag_rows[[nm]] <- data.frame(fenster = nm, n = n, DW = unname(dw$statistic), DW_p = dw$p.value, BP = unname(bp$statistic), BP_p = bp$p.value,
     SW_W = if (!is.null(sw)) unname(sw$statistic) else NA, SW_p = if (!is.null(sw)) sw$p.value else NA,
     cook_markiert = ifelse(length(flag), paste(yrs[ck > 4 / n], collapse = ";"), "keine"), max_cook = max(ck),
     hebel_2023 = hv[as.character(which(yrs == 2023))], hebel_2024 = hv[as.character(which(yrs == 2024))],
     resid_2023 = r[yrs == 2023], resid_2024 = r[yrs == 2024])
  plot(fitted(f), r, main = paste("Fenster", nm, ": Residuen vs. Fitted"), xlab = "Fitted", ylab = "Residuum"); abline(h = 0, lty = 2)
  acf(r, lag.max = min(5, floor(n / 3)), main = paste("Fenster", nm, ": ACF Residuen"))
  qqnorm(r, main = paste("Fenster", nm, ": Q-Q")); qqline(r)
  plot(yrs, r, type = "b", main = paste("Fenster", nm, ": Residuen ueber Zeit"), xlab = "Jahr", ylab = "Residuum"); abline(h = 0, lty = 2)
}
# vierte Zeile: Cook-Distanz Fenster B
w <- W$B; plot(w$df$yr, cooks.distance(w$fit), type = "h", main = "Cook-Distanz Fenster B", xlab = "Jahr", ylab = "Cook"); abline(h = 4 / w$n, lty = 2)
w <- W$A; plot(w$df$yr, cooks.distance(w$fit), type = "h", main = "Cook-Distanz Fenster A", xlab = "Jahr", ylab = "Cook"); abline(h = 4 / w$n, lty = 2)
w <- W$C; plot(w$df$yr, cooks.distance(w$fit), type = "h", main = "Cook-Distanz Fenster C", xlab = "Jahr", ylab = "Cook"); abline(h = 4 / w$n, lty = 2)
dev.off()
diagtab <- do.call(rbind, diag_rows); wcsv(diagtab, "tab_diagnostik.csv")

# -----------------------------------------------------------------------------
# SAP 5.4 / 6 S1: ARIMA-Kontrolle (nur Fenster A, B)
# -----------------------------------------------------------------------------
hr("SAP 5.4/S1: ARIMA(p,0,q)-Fehler, p,q<=2, AICc, exhaustive Suche, 10000 Pfade, Seed 20261029 (nur A, B; C: n<10)")
s1_fun <- function(a, end = 2024, tag) {
  yy <- a:end; y <- as.numeric(E[as.character(yy)]); xr <- cbind(year = yy)
  fit <- auto.arima(y, xreg = xr, d = 0, D = 0, max.p = 2, max.q = 2, max.P = 0, max.Q = 0, seasonal = FALSE,
                    stepwise = FALSE, approximation = FALSE, ic = "aicc")
  fyrs <- (end + 1):2030; nx <- cbind(year = fyrs)
  fc <- forecast(fit, xreg = nx, h = length(fyrs))
  idx <- which(fyrs %in% 2027:2030)
  set.seed(20261029)
  sims <- replicate(10000, mean(as.numeric(simulate(fit, nsim = length(fyrs), future = TRUE, xreg = nx))[idx]))
  o <- fit$arma[c(1, 6, 2)]
  q <- quantile(sims, c(0.025, 0.975))
  cat("Fenster", tag, ": gewaehlte Ordnung (p,d,q) = (", o[1], ",", o[2], ",", o[3], "); AICc =", round(fit$aicc, 2), "; Koeffizienten:\n")
  print(round(coef(fit), 4))
  data.frame(fenster = tag, ordnung = paste0("(", o[1], ",0,", o[3], ")"), Mhat2030_arima = mean(as.numeric(fc$mean)[idx]),
             L_sim = q[1], U_sim = q[2], Median_sim = median(sims), kategorie_S1 = cat_of(q[1], q[2]))
}
S1 <- rbind(s1_fun(2010, tag = "B"), s1_fun(1990, tag = "A"))
S1 <- rbind(S1, data.frame(fenster = "C", ordnung = "nicht durchgefuehrt, Grund: n < 10", Mhat2030_arima = NA, L_sim = NA, U_sim = NA, Median_sim = NA, kategorie_S1 = NA))
rownames(S1) <- NULL; print(S1); wcsv(S1, "tab_S1_arima.csv")
cat("Hinweis: Simulation ohne Parameterunsicherheit (parametrische Simulation des angepassten Modells, SAP 5.4).\n")

# -----------------------------------------------------------------------------
# SAP 6 S2: Newey-West und DW (Ergebnisse bereits in prim/diagtab)
# -----------------------------------------------------------------------------
hr("SAP 6 S2: Newey-West-Konfidenzintervall fuer beta (Lag = floor(4*(n/100)^(2/9)), ohne Prewhitening), DW")
print(merge(prim[, c("fenster", "n", "NW_lag", "beta", "beta_lo", "beta_hi", "beta_lo_HAC", "beta_hi_HAC", "p_klass", "p_HAC", "p_holm_klass", "p_holm_HAC")],
            data.frame(fenster = c("B (primaer)", "A", "C"), DW = diagtab$DW, DW_p = diagtab$DW_p), by = "fenster", sort = FALSE))
cat("Q mit HAC-Intervall nur, wenn das gesamte Intervall < 0: ", paste(prim$fenster, ifelse(prim$beta_hi_HAC < 0, "ja", "nein"), collapse = "; "), "\n")
hq <- data.frame(fenster = prim$fenster, r_req = prim$r_req, Q_HAClo = ifelse(prim$beta_hi_HAC < 0 & prim$r_req < 0, prim$r_req / prim$beta_hi_HAC, NA),
                 Q_HAChi = ifelse(prim$beta_hi_HAC < 0 & prim$r_req < 0, prim$r_req / prim$beta_lo_HAC, NA)); wcsv(hq, "tab_S2_Q_HAC.csv")

# -----------------------------------------------------------------------------
# SAP 6 S3a / S3b: Fenster enden 2023 bzw. 2022
# -----------------------------------------------------------------------------
hr("SAP 6 S3a/S3b: ohne letztes Jahr (Ende 2023) bzw. ohne die letzten zwei Jahre (Ende 2022)")
sens <- list()
for (e in c(2023, 2022)) {
  tg <- paste0("S", ifelse(e == 2023, "3a", "3b"))
  Me <- Mfun(E, e); cat(tg, ": M(", e, ") = ", Me, "; D30 = ", Me - Z30, "\n", sep = "")
  for (a in c(2010, 1990, 2018)) {
    nm <- c(`2010` = "B", `1990` = "A", `2018` = "C")[as.character(a)]
    w <- ols_win(E, a, e, tag = paste(tg, nm)); rw <- res_row(w, Me, 2030 - e); rw$sens <- tg; sens[[length(sens) + 1]] <- rw
  }
}
# -----------------------------------------------------------------------------
# SAP 6 S5: ohne HWP
# -----------------------------------------------------------------------------
hr("SAP 6 S5: Primaerreihe abzueglich HWP (HWP liegt als eigene Jahreswerte vor); Zielwert unveraendert Z30 = -25")
Eoh <- E - HWP
Moh <- Mfun(Eoh, 2024); cat("M(2024) ohne HWP =", Moh, "; D30 =", Moh - Z30, "\n")
for (a in c(2010, 1990, 2018)) {
  nm <- c(`2010` = "B", `1990` = "A", `2018` = "C")[as.character(a)]
  w <- ols_win(Eoh, a, 2024, tag = paste("S5", nm)); rw <- res_row(w, Moh, 6); rw$sens <- "S5"; sens[[length(sens) + 1]] <- rw
}
# -----------------------------------------------------------------------------
# SAP 6 S6a-d: Bruchjahr-Kandidaten
# -----------------------------------------------------------------------------
hr("SAP 6 S6a-d: Bruchjahr-Kandidaten B* = 2017 und 2018")
w6a <- ols_win(E, 2017, 2024, tag = "S6a ab 2017"); rw <- res_row(w6a, M24, 6); rw$sens <- "S6a"; sens[[length(sens) + 1]] <- rw
cat("S6a: n = 8, n<10 geringe Belastbarkeit; Kategorie", w6a$kat, "\nS6b: identisch mit Fenster C (Kategorie", W$C$kat, "), keine eigene Rechnung.\n")
s6c <- list()
for (a in c(2010, 1990)) for (bs in c(2017, 2018)) {
  yy <- a:2024; d <- data.frame(y = as.numeric(E[as.character(yy)]), yr = yy, st = as.integer(yy >= bs)); f <- lm(y ~ yr + st, d)
  cf <- summary(f)$coefficients; tq <- qt(0.975, f$df.residual)
  s6c[[length(s6c) + 1]] <- data.frame(fenster = c(`2010` = "B", `1990` = "A")[as.character(a)], Bstar = bs, n = length(yy), gamma = cf["st", 1], se = cf["st", 2],
    ci_lo = cf["st", 1] - tq * cf["st", 2], ci_hi = cf["st", 1] + tq * cf["st", 2], p = cf["st", 4], beta_gemeinsam = cf["yr", 1])
}
s6c <- do.call(rbind, s6c); print(s6c); cat("S6c nur deskriptiv: keine Prognose, keine Kategorie.\n"); wcsv(s6c, "tab_S6c_niveausprung.csv")
s6d <- data.frame(jahr = 2022:2024, E_Mt = E[as.character(2022:2024)]); s6d <- rbind(s6d, data.frame(jahr = "Mittel 2022-2024", E_Mt = mean(s6d$E_Mt)))
cat("S6d (deskriptiv, n = 3, ohne Intervall/Kategorie):\n"); print(s6d); wcsv(s6d, "tab_S6d_fenster_D.csv")

# -----------------------------------------------------------------------------
# SAP 6 S7: Schaetzwert 2025 (Quelle 2)
# -----------------------------------------------------------------------------
hr("SAP 6 S7: Reihe um den Schaetzwert 2025 verlaengert (unsichere Schaetzung, KEIN Inventarwert; Wert aus Quelle 2)")
E25 <- c(E, `2025` = v2025_q2); M25 <- Mfun(E25, 2025)
cat("Schaetzwert 2025 =", v2025_q2, "Mt (Quelle 2; PDF identisch bis auf Rundung:", v2025_pdf, "); M(2025) = Mittel 2022-2025 =", M25, "; D30 =", M25 - Z30, "\n")
for (a in c(2010, 1990, 2018)) {
  nm <- c(`2010` = "B", `1990` = "A", `2018` = "C")[as.character(a)]
  w <- ols_win(E25, a, 2025, tag = paste("S7", nm)); rw <- res_row(w, M25, 5); rw$sens <- "S7"; sens[[length(sens) + 1]] <- rw
}
cat("Hinweis: In S7 liegen 2027-2030 weiterhin nach dem Fensterende; Formel unveraendert (alpha + beta*2028,5).\n")

# -----------------------------------------------------------------------------
# S4: nicht durchgefuehrt
# -----------------------------------------------------------------------------
hr("SAP 6 S4: Fruehere Submissions")
cat("S4 NICHT DURCHGEFUEHRT. Grund: Submissions 2025/2024/2023 nicht ohne Download beschaffbar (keine weiteren Downloads erlaubt);\n",
    "Data Cube: nicht durchgefuehrt (keine Zustimmung). Keine Teilmenge gerechnet. Revisionstabelle entfaellt.\n", sep = "")

sensdf <- do.call(rbind, sens)
sensdf <- sensdf[order(match(sensdf$sens, c("S3a", "S3b", "S5", "S6a", "S7")), -sensdf$n), ]
print(sensdf[, c("sens", "fenster", "von", "bis", "n", "beta", "Mhat2030", "L", "U", "kategorie", "Mend", "D30", "r_req", "Q", "belastbarkeit")], digits = 4)
wcsv(sensdf, "tab5_sensitivitaeten_S3_S5_S6a_S7.csv")
cat("\nKategorien-Robustheit (Primaer B =", W$B$kat, "):\n")
for (i in seq_len(nrow(sensdf))) if (!is.na(sensdf$kategorie[i])) {
  ref <- switch(sub(".* ", "", sensdf$fenster[i]), B = W$B$kat, A = W$A$kat, C = W$C$kat, ab = NA)
  cat(sprintf("  %-14s: %s %s\n", sensdf$fenster[i], sensdf$kategorie[i], ifelse(!is.na(ref) && ref != sensdf$kategorie[i], " <- andere Kategorie als Primaeranalyse desselben Fensters: Ergebnis nicht robust gegenueber dieser Sensitivitaet", "")))
}

# -----------------------------------------------------------------------------
# SAP 11: Grafiken
# -----------------------------------------------------------------------------
hr("SAP 11: Grafiken")
yrsall <- 1990:2024; xl <- c(1990, 2031)
png(file.path(outdir, "grafik1_zeitreihe_fenster_ziel.png"), width = 2000, height = 1300, res = 200)
par(mar = c(4.5, 4.8, 3.5, 1))
yr_rng <- range(c(E, -25, unlist(lapply(W, function(w) w$alpha + w$beta * 2030))), na.rm = TRUE)
plot(yrsall, E, type = "n", xlim = xl, ylim = yr_rng, xlab = "Jahr", ylab = "Netto-Emissionsbilanz LULUCF inkl. HWP (Mt CO2-Aequiv.; positiv = Quelle)",
     main = "LULUCF-Jahreswerte (UBA-Trendtabelle THG 1990-2024, Stand 15.01.2026) mit Trendgeraden A/B/C", cex.main = 1, cex.lab = 0.9)
abline(h = 0, col = "grey40"); abline(v = c(2017, 2018), col = "grey70", lwd = 0.7)
text(c(2017, 2018), yr_rng[2], c("2017", "2018"), cex = 0.6, col = "grey40", pos = c(2, 4), xpd = NA)
lines(yrsall, E, col = "black", lwd = 1)
points(yrsall, E, pch = ifelse(yrsall >= 2023, 17, 16), col = ifelse(yrsall >= 2023, "orange3", "black"), cex = 0.9)
cols <- c(A = "steelblue", B = "firebrick", C = "darkgreen")
for (nm in c("A", "B", "C")) { w <- W[[nm]]
  segments(w$a, w$alpha + w$beta * w$a, 2024, w$alpha + w$beta * 2024, col = cols[nm], lwd = ifelse(nm == "B", 3.2, 2))
  segments(2024, w$alpha + w$beta * 2024, 2030, w$alpha + w$beta * 2030, col = cols[nm], lwd = ifelse(nm == "B", 3.2, 2), lty = 2) }
points(2030, Z30, pch = 23, bg = "gold", cex = 1.8); text(2030, Z30, "Z30 = -25 (Zielwert gilt fuer das\n4-Jahres-Mittel 2027-2030, nicht fuer das Einzeljahr)", pos = 2, cex = 0.6, offset = 0.8)
points(2028.5, W$B$mhat, pch = 4, col = "firebrick", cex = 1.5)
legend("topleft", cex = 0.65, bty = "n", ncol = 1,
       legend = c("Jahreswert (Inventar)", "2023/2024: Modellfortschreibung", "Fenster B 2010-2024 (PRIMAER)", "Fenster A 1990-2024", "Fenster C 2018-2024",
                  "gestrichelt: Trend bis 2030 (keine Prognose)", "senkrecht: Bruchjahr-Kandidaten 2017/2018", "x: Modellwert bei 2028,5 (Fenster B)"),
       pch = c(16, 17, NA, NA, NA, NA, NA, 4), lty = c(NA, NA, 1, 1, 1, 2, 1, NA), lwd = c(NA, NA, 3.2, 2, 2, 1, 0.7, NA),
       col = c("black", "orange3", cols["B"], cols["A"], cols["C"], "grey30", "grey70", "firebrick"))
dev.off()

png(file.path(outdir, "grafik2_4jahresmittel_intervall.png"), width = 2000, height = 1300, res = 200)
par(mar = c(4.5, 4.8, 3.5, 1))
ylim2 <- range(c(Mser, Z30, Z40, Z45, prim$L, prim$U), na.rm = TRUE)
plot(1993:2024, Mser, type = "l", lwd = 2, xlim = c(1993, 2046), ylim = ylim2, xlab = "Zieljahr T",
     ylab = "Gesetzlicher Messwert M(T) = Mittel T-3..T (Mt CO2-Aequiv.)", main = "4-Jahres-Mittel M(T) und Trendfortschreibung 2030 (95-%-Prognoseintervall)", cex.main = 1, cex.lab = 0.9)
abline(h = 0, col = "grey40"); points(2024, M24, pch = 16, cex = 1.3)
points(c(2030, 2040, 2045), c(Z30, Z40, Z45), pch = 23, bg = "gold", cex = 1.6)
text(c(2030, 2040, 2045), c(Z30, Z40, Z45), c("Z30 -25", "Z40 -35", "Z45 -40"), pos = 3, cex = 0.7)
xo <- c(B = 2029.2, A = 2030.4, C = 2031.6); cc <- c(B = "firebrick", A = "steelblue", C = "darkgreen")
for (nm in c("B", "A", "C")) { w <- W[[nm]]
  arrows(xo[nm], w$L, xo[nm], w$U, code = 3, angle = 90, length = 0.05, col = cc[nm], lwd = 2); points(xo[nm], w$mhat, pch = 19, col = cc[nm]) }
legend("topleft", cex = 0.65, bty = "n", pch = c(NA, 16, 23, 19, 19, 19), lty = c(1, NA, NA, NA, NA, NA), lwd = 2,
       col = c("black", "black", "black", cc["B"], cc["A"], cc["C"]), pt.bg = c(NA, NA, "gold", NA, NA, NA),
       legend = c("M(T) 1993-2024 (2021-2024 mit Modelljahren 2023/24)", "M(2024)", "Zielwerte Z30/Z40/Z45 (keine Extrapolation auf 2040/2045)",
                  "M-Dach(2030), Fenster B (primaer) mit 95-%-PI", "Fenster A", "Fenster C (n = 7, geringe Belastbarkeit)"))
dev.off()
cat("Grafiken geschrieben: grafik1_zeitreihe_fenster_ziel.png, grafik2_4jahresmittel_intervall.png, anhang_diagnostik.png\n")
cat("Anhang-Grafik OWID/GCP-Vergleich: nicht erstellt (OWID-Daten nicht beschafft, keine Downloads; SAP 3.3/9: nur Plausibilisierung).\n")

# -----------------------------------------------------------------------------
# Tabelle 1 und Sitzungsinfo
# -----------------------------------------------------------------------------
tab1 <- data.frame(punkt = c("Primaerquelle", "Datei", "Fassung laut Dateikopf", "Jahre / n", "Primaerreihe", "Einheit/Vorzeichen", "GWP", "Zugriff Zeitreihe (erstes Oeffnen)",
  "Kontrolle Quelle 2", "Kontrolle PDF (Stichprobe 1990/2000/2010/2020/2024)", "Summenpruefung", "Data Cube"),
  wert = c("UBA Nationale Trendtabellen THG (Quelle 1)", files["q1"], "'Nationale Trendtabellen ... 1990 - 2024', Dessau 15.01.2026; Bezeichnung 'Submission 2026' nicht woertlich im Kopf",
           "1990-2024, n = 35, lueckenlos", "Zeile '4. Land Use, Land Use Change and Forestry' (Blatt GHG_CO2eq), inkl. HWP",
           "kt CO2-Aequiv. -> Mt; positiv = Quelle (keine Umkehr)", "AR5 laut Inventarbericht (SAP 3.5 Nr.3); in der Tabelle nicht ausgewiesen",
           "29.10.2026 (Analyst, siehe Run-Log)", paste0("alle ", nrow(cmp2), " gemeinsamen Jahre; Paare > 0,5 Mt: ", sum(ab2$ueber_schwelle)),
           paste0("Gesamt: ", sum(!tot5$ueber_schwelle_q1), " von 5 Jahren <= 0,5 Mt"), paste0("max |Diff| = ", signif(max(abs(Q1$sumdiff_Mt)), 3), " Mt"),
           "nicht durchgefuehrt (keine Zustimmung)"))
wcsv(tab1, "tab1_datenuebersicht.csv")
sink(file.path(outdir, "sessionInfo.txt")); print(sessionInfo()); sink()
hr("ENDE des Laufs (fehlerfrei bis hierher)")
cat("Zeit:", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n")
