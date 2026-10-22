# =============================================================================
# Prognose-Check #1 – Projektionsberichte der Bundesregierung 2015–2023
# Skript 01: Datenextraktion und Integritäts-Checks (SAP Abschnitt 3.5)
# -----------------------------------------------------------------------------
# SAP:        Analysen/2026-10-prognose-check-projektionsberichte/
#             SAP_prognose-check-projektionsberichte.md, Version 1.0 (final,
#             eingefroren 22.10.2026, freigegeben durch Daniel Saure)
# Autor:      analyst-Subagent (Claude), 22.10.2026
# R-Version:  wird zur Laufzeit in output/sessionInfo_01_integritaet.txt
#             geschrieben (erstellt mit R 4.6.1)
# Pakete:     pdftools, readxl, dplyr, readr, digest
#
# UMFANG DIESES SKRIPTS (Auftrag der Top-Level-Session vom 22.10.2026):
#   NUR SAP 3.5 Punkte 1–6 (Extraktion, Summenprüfung, GWP-Metrik,
#   UBA-vs-OWID-Plausibilisierung, Bestimmung von J_b, Verfügbarkeit
#   P(b,s,J_b,k)). Es werden KEINE Fehlermaße (E, RE, ARE, MRE, ...), KEINE
#   Estimands E1–E5, KEINE Umskalierung P -> P* und KEINE Sensitivitäten
#   berechnet. Projektionen und Ist-Werte werden NICHT miteinander verglichen.
#   Das Hauptskript `prognose-check-projektionsberichte.R` (SAP 10) wird erst
#   nach Klärung der Rückfragen geschrieben.
#
# Kein Netzzugriff. Eingelesen werden ausschließlich die unverändert
# abgelegten Rohdateien unter rohdaten/ (SAP 10). Keine Zufallskomponente.
#
# -----------------------------------------------------------------------------
# ABWEICHUNGEN VOM SAP / POST-HOC-KENNZEICHNUNGEN
# -----------------------------------------------------------------------------
# (P1) Post-hoc (Beschaffungsweg): SAP 3.4 sieht Download durch Daniel vor.
#      Auf Daniels Auftrag vom 22.10.2026 hat der analyst die Dateien selbst
#      per curl von den Originalservern geladen. Quellen unverändert gegenüber
#      SAP 3.1–3.3. Dokumentiert in run_log.txt.
# (P2) Post-hoc (Methode der Erst-Extraktion): Die Erst-Übertragung der
#      PDF-Tabellen erfolgt nicht von Hand, sondern reproduzierbar über die
#      Wort-Koordinaten der PDF-Textebene (pdftools::pdf_data). Jede Zeile
#      der Extraktionstabelle trägt Datei, PDF-Seite und Tabellennummer.
# (P3) Post-hoc (zweite Übertragung): SAP 3.5.1 verlangt den Abgleich gegen
#      die EEA-Datenbank oder eine zweite unabhängige Übertragung. Für die
#      Gesamtemissionen liegt der EEA-Abgleich vor. Für Sektorwerte, die die
#      EEA nicht in derselben Abgrenzung führt (KSG-/KSP-Sektoren,
#      Quellbereiche), wurden zusätzlich (a) berichtsinterne Doppelangaben
#      (gleiche Größe in zwei Tabellen bzw. PDF vs. amtlicher Datenanhang)
#      abgeglichen und (b) jede Tabelle vom analyst visuell gegen das
#      gerenderte Seitenbild geprüft. (b) ist KEINE vom analyst unabhängige
#      Übertragung; eine echte zweite Übertragung durch eine andere Person ist
#      für diese Sektorwerte noch offen (Rückfrage an Daniel, siehe
#      Zwischenbericht).
#
# -----------------------------------------------------------------------------
# ABWEICHUNG VOM SAP – RÜCKFRAGE AN MENSCH (Stand nach diesem Lauf)
# -----------------------------------------------------------------------------
# (R1) SAP 3.5.5: J_b ist für die Berichte 2021 und 2023 NICHT eindeutig
#      (2021: Basisjahr 2018 laut Inventar vs. 2020 als historische
#      Vorjahresschätzung in Tab. 126; 2023: Basisjahr 2019 in allen Tabellen
#      vs. 2020 als letztes verwendetes Inventarjahr). Laut SAP: Stopp und
#      Rückfrage vor der Auswertung. Dieses Skript bestimmt J_b deshalb nur
#      als Kandidatenliste mit Fundstellen und rechnet nichts, was von J_b
#      abhängt.
# (R2) SAP 3.1: Für 2015 existieren zwei amtliche Fassungen (April 2015, nur
#      MMS; September 2016 „ergänzt durch MWMS“) sowie zwei GWP-Fassungen
#      (Haupttabellen IPCC SAR, Anhang A6/A-5-12 IPCC AR4). Welche Fassung als
#      P(2015, s, t, k) gilt, regelt der SAP nicht eindeutig.
# (R3) SAP 3.1 „Datenanhang hat Vorrang“: Ob die von Deutschland an die EU
#      gemeldeten MMR-Templates (Reportnet/CDR) als „amtlicher Datenanhang“
#      zählen oder als EEA/Reportnet-Kreuzprüfquelle, ist offen.
# Details und weitere Punkte: output/zwischenbericht_daten_integritaet.md
# =============================================================================

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(readxl)
  library(pdftools)
  library(digest)
})

# --- Pfade -------------------------------------------------------------------
args_all <- commandArgs(trailingOnly = FALSE)
file_arg <- sub("^--file=", "", args_all[grepl("^--file=", args_all)])
BASE <- if (length(file_arg)) dirname(normalizePath(file_arg)) else getwd()
RAW  <- file.path(BASE, "rohdaten")
OUT  <- file.path(BASE, "output")
dir.create(OUT, showWarnings = FALSE)

cat("Prognose-Check #1 – 01_integritaet.R\n")
cat("Basisordner:", BASE, "\n")
cat("Laufzeit:", format(Sys.time(), "%Y-%m-%d %H:%M:%S %Z"), "\n\n")

rf <- function(...) file.path(RAW, ...)

# =============================================================================
# SAP 3.4 / 10: Integrität der Rohdateien (SHA-256 gegen run_log.txt)
# =============================================================================
cat("== SAP 3.4/10: Prüfsummen der Rohdateien gegen run_log.txt ==\n")
rl <- readLines(file.path(BASE, "run_log.txt"), encoding = "UTF-8")
tab_start <- grep("^DATEITABELLE_BEGINN", rl)
tab_end   <- grep("^DATEITABELLE_ENDE", rl)
logtab <- read.delim(text = rl[(tab_start + 1):(tab_end - 1)], sep = "\t",
                     header = TRUE, stringsAsFactors = FALSE, quote = "")
files_now <- list.files(RAW, recursive = TRUE, all.files = FALSE)
files_now <- files_now[!grepl("download_offen\\.md$", files_now)]
hash_now <- vapply(files_now, function(f) digest(file = rf(f), algo = "sha256"), "")
hc <- data.frame(datei = files_now, sha256_jetzt = unname(hash_now),
                 stringsAsFactors = FALSE) %>%
  full_join(logtab %>% select(datei, sha256_log = sha256), by = "datei") %>%
  mutate(status = case_when(is.na(sha256_log) ~ "nicht im run_log",
                            is.na(sha256_jetzt) ~ "fehlt im Ordner",
                            sha256_log == sha256_jetzt ~ "ok",
                            TRUE ~ "ABWEICHUNG"))
write_csv(hc, file.path(OUT, "rohdaten_pruefsummen.csv"))
print(table(hc$status))
if (any(hc$status != "ok")) cat("ACHTUNG: Prüfsummen-Auffälligkeiten, siehe rohdaten_pruefsummen.csv\n")
cat("\n")

# =============================================================================
# SAP 3.5.1: Extraktion der Projektionswerte aus den PDF-Tabellen
# =============================================================================
# Hilfsfunktionen: Wort-Koordinaten lesen, Tabellen positionsgenau zerlegen.
pdf_cache <- new.env()
words_of <- function(file, page) {
  key <- file
  if (is.null(pdf_cache[[key]])) pdf_cache[[key]] <- suppressMessages(pdf_data(file))
  pdf_cache[[key]][[page]]
}

is_num_tok <- function(t) grepl("^[-−–]?[0-9][0-9.]*(,[0-9]*)?$", t)
is_year_tok <- function(t) grepl("^(19|20)[0-9]{2}$", t)

parse_num <- function(t) {
  t <- gsub("[−–]", "-", t)
  hinweis <- rep("", length(t))
  val <- rep(NA_real_, length(t))
  abgeschnitten <- grepl(",$", t)
  punkt_dezimal <- grepl("^-?[0-9]{1,3}\\.[0-9]$", t)       # z. B. "116.6"
  normal <- !abgeschnitten & !punkt_dezimal
  val[normal] <- suppressWarnings(as.numeric(sub(",", ".", gsub("\\.", "", t[normal]))))
  val[punkt_dezimal] <- as.numeric(t[punkt_dezimal])
  hinweis[punkt_dezimal] <- "Original mit Punkt als Dezimaltrenner gedruckt"
  hinweis[abgeschnitten] <- "Zahl in PDF-Textebene abgeschnitten -> nicht übernommen"
  list(val = val, hinweis = hinweis)
}

clean_label <- function(x) {
  x <- gsub("\\s+", " ", trimws(x))
  x <- gsub("- (?!und |oder )", "", x, perl = TRUE)   # Silbentrennung über Zeilen
  x <- gsub("\\*", "", x)
  x <- sub("( [0-9]| [a-z])+$", "", x)        # Fußnotenzeichen am Ende
  x <- sub("([a-zäöü])[0-9]$", "\\1", x)      # z. B. "Verkehr2"
  trimws(x)
}

extract_pdf_table <- function(spec) {
  file <- rf(spec$datei)
  res <- list()
  hx <- NULL; years <- NULL
  for (k in seq_along(spec$seiten)) {
    p <- spec$seiten[k]
    d <- words_of(file, p)
    y_lo <- if (k == 1) spec$y_von else 0
    # Untergrenze: letzte Seite = y_bis; frühere Seiten = y_bis_s1 (Fußnoten)
    # bzw. Standard 772 pt (Seitenzahl/Fußzeile ausschließen)
    y_hi <- if (k == length(spec$seiten)) spec$y_bis else
      if (!is.null(spec$y_bis_s1)) spec$y_bis_s1 else 772
    d <- d[d$y >= y_lo & d$y < y_hi, ]
    if (!nrow(d)) next
    d <- d[order(d$y, d$x), ]
    d$row <- cumsum(c(1, diff(d$y) > 4))
    d$xr <- d$x + d$width
    rows <- split(d, d$row)
    # Kopfzeile mit Jahreszahlen suchen (je Seite; Folgeseiten wiederholen sie)
    hdr_i <- which(vapply(rows, function(r) sum(is_year_tok(r$text)) >= 4, TRUE))
    start_i <- 1
    if (length(hdr_i)) {
      h <- rows[[hdr_i[1]]]; h <- h[is_year_tok(h$text), ]
      years <- as.integer(h$text); hx <- h$xr
      start_i <- hdr_i[1] + 1
    }
    if (is.null(hx)) stop("Keine Kopfzeile gefunden: ", spec$id)
    gap <- median(diff(hx))
    x_min_num <- min(hx) - 0.6 * gap
    cur <- NULL
    flush <- function() { if (!is.null(cur)) res[[length(res) + 1]] <<- cur; cur <<- NULL }
    if (start_i > length(rows)) next
    for (i in start_i:length(rows)) {
      r <- rows[[i]]; r <- r[order(r$x), ]
      txt <- r$text
      has_pct <- any(grepl("%", txt))
      numpos <- is_num_tok(txt) & r$xr > x_min_num
      parenth <- grepl("^\\(", txt) | grepl("\\)$", txt)
      lab_tok <- txt[!numpos & !parenth & r$xr <= x_min_num]
      if (any(numpos) && !has_pct) {
        if (!length(lab_tok) && !is.null(cur) && (r$y[1] - cur$y) <= 8) {
          # Zahlen derselben Tabellenzeile leicht versetzt gedruckt -> anhängen
          pn <- parse_num(txt[numpos])
          j <- vapply(r$xr[numpos], function(x) which.min(abs(hx - x)), 1L)
          cur$werte <- rbind(cur$werte, data.frame(jahr = years[j], wert = pn$val,
                                                   hinweis = pn$hinweis, stringsAsFactors = FALSE))
          next
        }
        flush()
        if (!length(lab_tok)) {
          # Zahlenzeile ohne jede Beschriftung (z. B. zweite Kopfzeile) -> verwerfen
          verworfen[[length(verworfen) + 1]] <<- data.frame(tabelle_id = spec$id, seite = p, y = r$y[1],
            text = paste(txt, collapse = " "), stringsAsFactors = FALSE)
          next
        }
        pn <- parse_num(txt[numpos])
        j <- vapply(r$xr[numpos], function(x) which.min(abs(hx - x)), 1L)
        cur <- list(label = paste(lab_tok, collapse = " "), seite = p, y = r$y[1],
                    werte = data.frame(jahr = years[j], wert = pn$val, hinweis = pn$hinweis,
                                       stringsAsFactors = FALSE))
      } else if (has_pct) {
        flush()
      } else if (!is.null(cur) && length(lab_tok)) {
        # reine Beschriftungszeile -> Fortsetzung der Zeilenbeschriftung
        if (grepl("^(Anmerkung|Quelle|Nachrichtlich|nachrichtlich)", lab_tok[1])) { flush(); next }
        cur$label <- paste(cur$label, paste(lab_tok, collapse = " "))
      }
    }
    flush()
  }
  if (!length(res)) stop("Keine Datenzeilen: ", spec$id)
  out <- bind_rows(lapply(res, function(z) {
    data.frame(label_roh = z$label, seite = z$seite, z$werte, stringsAsFactors = FALSE)
  }))
  out$label_roh <- clean_label(out$label_roh)
  # Prozent-/Minderungszeilen ohne %-Zeichen (Einheitenspalte "Prozent") verwerfen
  out <- out[!grepl("Minderung|Prozent|Anteil|Abweichung|Kumulierte", out$label_roh), ]
  # Szenario/Sektor bestimmen
  if (identical(spec$szenario, "aus_label")) {
    sc <- ifelse(grepl("(^| )MWMS( |$)", out$label_roh), "MWMS",
                 ifelse(grepl("(^| )MMS( |$)", out$label_roh), "MMS", NA))
    lab <- sub(" ?Mio\\. t.*$", "", out$label_roh)
    lab <- trimws(gsub("(^| )(MWMS|MMS)( |$)", " ", lab))
    lab[lab == ""] <- NA
    # Sektorbeschriftung nach unten fortschreiben (Zeile "MWMS" ohne Sektor)
    for (i in seq_along(lab)) if (is.na(lab[i]) && i > 1) lab[i] <- lab[i - 1]
    if (!is.null(spec$sektor_fest)) lab <- rep(spec$sektor_fest, length(lab))
    out$szenario <- sc; out$sektor_bericht <- lab
  } else {
    out$szenario <- spec$szenario
    out$sektor_bericht <- sub(" Mio\\. t.*$", "", out$label_roh)
  }
  # Zeilenrolle: Sektor / Gesamt / Teilsumme / nachrichtlich / verworfen
  lr <- out$sektor_bericht
  out$rolle <- case_when(
    grepl("^Teilsumme", lr) ~ "Teilsumme",
    grepl("LULUC|Internat|nachricht|^richtlich|Paket|Sensitiv|Jahre.?semis|inklusive|incl", lr, ignore.case = TRUE) ~ "nachrichtlich",
    grepl("^Gesamt( \\(ohne LULUCF\\))?$", lr) ~ "Gesamt",
    TRUE ~ "Sektor")
  out %>%
    mutate(tabelle_id = spec$id, bericht = spec$bericht, fassung = spec$fassung,
           datei = spec$datei, tabelle = spec$tabelle, sektorsystem = spec$sektorsystem,
           gwp = spec$gwp, quelle_typ = "PDF-Tabelle",
           extraktion = "pdftools::pdf_data, Wortkoordinaten") %>%
    select(tabelle_id, bericht, fassung, szenario, sektorsystem, sektor_bericht, rolle,
           jahr, wert, gwp, datei, seite, tabelle, quelle_typ, extraktion, hinweis, label_roh)
}

# --- Tabellen-Spezifikationen (Fundstellen per Sichtprüfung festgelegt) -------
F15o <- "eea_reportnet_cdr/2015_envvqlq8w_projektionsbericht/150422_Projektionsbericht_2015_final.pdf"
F15s <- "eea_reportnet_cdr/2016_envv_vp1a_pb2015_mwms/160928_PB2015_MWMS.final.pdf"
F17  <- "uba_projektionen/projektionsbericht_2017_uba_website.pdf"
F19  <- "uba_projektionen/projektionsbericht-2019_uba_website.pdf"
F19k <- "uba_projektionen/2019-09-06_climate-change_33-2019_pb19-ksp2050_teilbericht-psz-ix.pdf"
F21  <- "uba_projektionen/projektionsbericht_2021_uba_website.pdf"
F23  <- "uba_projektionen/39_2023_cc_projektionsbericht_12_23.pdf"
F23x <- "uba_projektionen/deutscher_projektionsbericht2023_kernindikatoren_2.0_korrigiert_0.xlsx"

fs15o <- "PB2015, Fassung April 2015 (nur MMS)"
fs15s <- "PB2015, Fassung Sept. 2016 'ergänzt durch MWMS'"
verworfen <- list()   # verworfene Zahlenzeilen ohne Beschriftung (Protokoll)
specs <- list(
  list(id = "PB2015o_T1-2", bericht = 2015L, fassung = fs15o, datei = F15o, seiten = 20, y_von = 85, y_bis = 600,
       tabelle = "Tabelle 1-2", szenario = "MMS", sektorsystem = "Quellbereiche PB2015", gwp = "IPCC SAR"),
  list(id = "PB2015o_A-5", bericht = 2015L, fassung = fs15o, datei = F15o, seiten = 216, y_von = 74, y_bis = 512,
       tabelle = "Tabelle A-5", szenario = "MMS", sektorsystem = "Sektorzuschnitt BMUB", gwp = "IPCC SAR"),
  list(id = "PB2015o_A-7", bericht = 2015L, fassung = fs15o, datei = F15o, seiten = c(218, 219), y_von = 338, y_bis = 217,
       tabelle = "Tabelle A-7", szenario = "MMS", sektorsystem = "Quellbereiche PB2015", gwp = "IPCC AR4 (Umrechnung Anhang A6)"),
  list(id = "PB2015s_T1-2", bericht = 2015L, fassung = fs15s, datei = F15s, seiten = 23, y_von = 129, y_bis = 609,
       tabelle = "Tabelle 1-2", szenario = "MMS", sektorsystem = "Quellbereiche PB2015", gwp = "IPCC SAR"),
  list(id = "PB2015s_T1-3", bericht = 2015L, fassung = fs15s, datei = F15s, seiten = c(24, 25), y_von = 295, y_bis = 179,
       tabelle = "Tabelle 1-3", szenario = "MWMS", sektorsystem = "Quellbereiche PB2015", gwp = "IPCC SAR"),
  list(id = "PB2015s_A-5-9", bericht = 2015L, fassung = fs15s, datei = F15s, seiten = 298, y_von = 211, y_bis = 620,
       tabelle = "Tabelle A-5-9", szenario = "MMS", sektorsystem = "Sektorzuschnitt BMUB", gwp = "IPCC SAR"),
  list(id = "PB2015s_A-5-10", bericht = 2015L, fassung = fs15s, datei = F15s, seiten = 299, y_von = 75, y_bis = 531,
       tabelle = "Tabelle A-5-10", szenario = "MWMS", sektorsystem = "Sektorzuschnitt BMUB", gwp = "IPCC SAR"),
  list(id = "PB2015s_A-5-12", bericht = 2015L, fassung = fs15s, datei = F15s, seiten = c(301, 302), y_von = 328, y_bis = 204,
       tabelle = "Tabelle A-5-12", szenario = "MMS", sektorsystem = "Quellbereiche PB2015", gwp = "IPCC AR4 (Umrechnung Anhang A6)"),
  list(id = "PB2015s_A-5-14", bericht = 2015L, fassung = fs15s, datei = F15s, seiten = c(303, 304), y_von = 255, y_bis = 171,
       tabelle = "Tabelle A-5-14", szenario = "MWMS", sektorsystem = "Quellbereiche PB2015", gwp = "IPCC AR4 (Umrechnung Anhang A6)"),
  list(id = "PB2017_T1-2", bericht = 2017L, fassung = "PB2017", datei = F17, seiten = c(28, 29), y_von = 578, y_bis = 446,
       y_bis_s1 = 700,   # S. 28: Fußnote 2 (VGR-Revision) unterhalb der Tabelle ausschließen
       tabelle = "Tabelle 1-2", szenario = "MMS", sektorsystem = "Quellbereiche PB2017", gwp = "IPCC AR4"),
  list(id = "PB2017_T1-3", bericht = 2017L, fassung = "PB2017", datei = F17, seiten = c(30, 31), y_von = 546, y_bis = 324,
       tabelle = "Tabelle 1-3", szenario = "MWMS", sektorsystem = "Quellbereiche PB2017", gwp = "IPCC AR4"),
  list(id = "PB2017_A-5-3", bericht = 2017L, fassung = "PB2017", datei = F17, seiten = 293, y_von = 113, y_bis = 374,
       tabelle = "Tabelle A-5-3", szenario = "MMS", sektorsystem = "KSP-2050-Sektoren", gwp = "IPCC AR4"),
  list(id = "PB2017_A-5-4", bericht = 2017L, fassung = "PB2017", datei = F17, seiten = 294, y_von = 76, y_bis = 336,
       tabelle = "Tabelle A-5-4", szenario = "MWMS", sektorsystem = "KSP-2050-Sektoren", gwp = "IPCC AR4"),
  list(id = "PB2019_TZ-2", bericht = 2019L, fassung = "PB2019", datei = F19, seiten = c(22, 23), y_von = 386, y_bis = 161,
       tabelle = "Tabelle Z-2", szenario = "MMS", sektorsystem = "Quellbereiche PB2019", gwp = "IPCC AR4"),
  list(id = "PB2019k_T4", bericht = 2019L, fassung = "PB2019 (Teilbericht KSP-Struktur, Climate Change 33/2019)", datei = F19k,
       seiten = 17, y_von = 246, y_bis = 604,
       tabelle = "Tabelle 4", szenario = "MMS", sektorsystem = "KSP-2050-Sektoren", gwp = "IPCC AR4"),
  list(id = "PB2021_T1", bericht = 2021L, fassung = "PB2021", datei = F21, seiten = 26, y_von = 73, y_bis = 470,
       tabelle = "Tabelle 1", szenario = "MMS", sektorsystem = "KSG-Sektoren", gwp = "IPCC AR4"),
  list(id = "PB2021_T126", bericht = 2021L, fassung = "PB2021", datei = F21, seiten = c(325, 326), y_von = 485, y_bis = 589,
       tabelle = "Tabelle 126", szenario = "MMS", sektorsystem = "KSG-Sektoren", gwp = "IPCC AR4"),
  list(id = "PB2023_T1", bericht = 2023L, fassung = "PB2023", datei = F23, seiten = 24, y_von = 515, y_bis = 700,
       tabelle = "Tabelle 1", szenario = "aus_label", sektor_fest = "Gesamt", sektorsystem = "KSG-Sektoren", gwp = "IPCC AR5"),
  list(id = "PB2023_T17", bericht = 2023L, fassung = "PB2023", datei = F23, seiten = 74, y_von = 73, y_bis = 590,
       tabelle = "Tabelle 17", szenario = "aus_label", sektorsystem = "KSG-Sektoren", gwp = "IPCC AR5")
)

cat("== SAP 3.5.1: Extraktion PDF-Tabellen ==\n")
ext_pdf <- bind_rows(lapply(specs, function(s) {
  x <- extract_pdf_table(s)
  cat(sprintf("  %-16s %-14s S.%-8s %3d Werte, Zeilen: %s\n", s$id, s$tabelle,
              paste(s$seiten, collapse = "+"), sum(!is.na(x$wert)),
              paste(unique(x$sektor_bericht), collapse = " | ")))
  x
}))

verw <- bind_rows(verworfen)
write_csv(verw, file.path(OUT, "extraktion_verworfene_zeilen.csv"))
cat(sprintf("  Verworfene Zahlenzeilen ohne Beschriftung: %d (siehe extraktion_verworfene_zeilen.csv)\n", nrow(verw)))
if (nrow(verw)) print(as.data.frame(verw), row.names = FALSE)

# Kanonische Sektornamen (nur Vereinheitlichung der Schreibweise je Bericht,
# KEINE Zuordnung zu KSG-Sektoren – die folgt erst in der Zuordnungstabelle 4.4)
ext_pdf <- ext_pdf %>% mutate(sektor_bericht = case_when(
  grepl("^Nationaler Verkehr", sektor_bericht) ~ "Verkehr",
  grepl("^Flüchtige Emission", sektor_bericht) ~ "Flüchtige Emissionen aus Energiesektoren",
  grepl("^Diffuse Emissionen", sektor_bericht) ~ "Diffuse Emissionen aus Brennstoffen",
  grepl("^Produktverwen", sektor_bericht) ~ "Produktverwendung",
  grepl("^Abfallwirtschaft (&|und) Sonstige", sektor_bericht) ~ "Abfallwirtschaft und Sonstiges",
  grepl("^Gesamt \\(ohne LULUCF\\)$", sektor_bericht) ~ "Gesamt",
  TRUE ~ sektor_bericht))

# --- Amtlicher Datenanhang PB2023 (SAP 3.1: Vorrang vor PDF-Text) ------------
cat("== SAP 3.5.1: Datenanhang PB2023 (Kernindikatoren v2.0 korrigiert) ==\n")
xa <- suppressMessages(read_excel(rf(F23x), sheet = "1 THG-Emissionen", col_names = FALSE,
                                  .name_repair = "minimal"))
xa <- as.data.frame(xa, stringsAsFactors = FALSE)
hdr_row <- which(xa[[1]] == "Sektor")[1]
yrs_a <- suppressWarnings(as.integer(unlist(xa[hdr_row, ])))
ycols <- which(!is.na(yrs_a) & yrs_a >= 2000)
blocks <- c("Gesamt", "Energiewirtschaft", "Industrie", "Gebäude", "Verkehr", "Landwirtschaft",
            "Abfallwirtschaft & Sonstiges")
cur_block <- NA_character_
anh <- list()
for (i in (hdr_row + 1):nrow(xa)) {
  lab <- as.character(xa[i, 1]); unit <- as.character(xa[i, 2])
  if (!is.na(lab) && lab %in% blocks) { cur_block <- lab; next }
  if (!is.na(lab) && grepl("^nachrichtlich", lab)) break
  if (is.na(cur_block) || is.na(unit) || !grepl("^Mio", unit)) next
  sc <- if (grepl("^MMS", lab)) "MMS" else if (grepl("^MWMS", lab)) "MWMS" else NA
  if (is.na(sc)) next
  v <- suppressWarnings(as.numeric(unlist(xa[i, ycols])))
  anh[[length(anh) + 1]] <- data.frame(
    tabelle_id = "PB2023x_Blatt1", bericht = 2023L, fassung = "PB2023 Datenanhang (Kernindikatoren 2.0 korrigiert)",
    szenario = sc, sektorsystem = "KSG-Sektoren",
    sektor_bericht = ifelse(cur_block == "Abfallwirtschaft & Sonstiges", "Abfallwirtschaft und Sonstiges", cur_block),
    rolle = ifelse(cur_block == "Gesamt", "Gesamt", "Sektor"),
    jahr = yrs_a[ycols], wert = v, gwp = "IPCC AR5", datei = F23x, seite = NA_integer_,
    tabelle = sprintf("Blatt '1 THG-Emissionen', Excel-Zeile %d", i), quelle_typ = "amtlicher Datenanhang (xlsx)",
    extraktion = "readxl, Zellwerte (volle Genauigkeit)", hinweis = "", label_roh = lab,
    stringsAsFactors = FALSE)
}
ext_anh <- bind_rows(anh) %>% filter(!is.na(wert))
cat(sprintf("  %d Werte (Jahre %d–%d), Blöcke: %s\n", nrow(ext_anh), min(ext_anh$jahr), max(ext_anh$jahr),
            paste(unique(ext_anh$sektor_bericht), collapse = ", ")))

ext <- bind_rows(ext_pdf, ext_anh) %>% filter(!is.na(wert) | hinweis != "")

# Kennzeichnung historisch/Projektion laut Bericht (nur Etikett aus dem Bericht,
# KEINE J_b-Festlegung – siehe SAP 3.5.5 weiter unten)
ext <- ext %>% mutate(kennzeichnung_bericht = case_when(
  bericht == 2015 & jahr <= 2012 ~ "historisch (Inventar Submission 2014)",
  bericht == 2017 & jahr <= 2014 ~ "historisch (Inventar Resubmission Nov. 2016)",
  bericht == 2019 & jahr <= 2016 ~ "historisch (Inventar Submission 2018)",
  bericht == 2021 & jahr <= 2018 ~ "historisch (Inventar Submission 2020, 'Basisjahr')",
  bericht == 2021 & jahr == 2020 ~ "historisch (UBA-Vorjahresschätzung 2020, kein Inventarwert)",
  bericht == 2023 & jahr <= 2019 ~ "historisch ('Basisjahr', Inventar Submission 2022)",
  TRUE ~ "Projektion"))

# =============================================================================
# SAP 3.5.1: Abgleich gegen EEA-Datenbank (Kreuzprüfung, nicht additiv)
# =============================================================================
cat("\n== SAP 3.5.1: Abgleich gegen EEA-Projektionsdatenbank ==\n")
read_eea_csv <- function(path, subm_col) {
  x <- read.csv(rf(path), check.names = FALSE, stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")
  names(x)[1] <- sub("^﻿", "", names(x)[1])
  ms <- intersect(c("MS", "CountryCode"), names(x))[1]
  cc <- intersect(c("Category", "Category_code"), names(x))[1]
  data.frame(ms = x[[ms]], submission = x[[subm_col]], kategorie = x[[cc]], jahr = as.integer(x$Year),
             szenario_eea = x$Scenario, gas = x$Gas, reported = suppressWarnings(as.numeric(x[["Reported Value"]])),
             stringsAsFactors = FALSE)
}
eea_raw <- bind_rows(
  read_eea_csv("eea_projektionen/ds2016/GHG_proj.csv", "submission year") %>%
    mutate(datensatz = "EEA 2016 (GHG_proj.csv)"),
  read_eea_csv("eea_projektionen/ds2017/GHG_projections_2017_EEA.csv", "Submission year") %>%
    mutate(datensatz = "EEA 2017"),
  read_eea_csv("eea_projektionen/ds2019/GHG_projections_2019_EEA.csv", "SubmissionYear") %>%
    mutate(datensatz = "EEA 2019"),
  read_eea_csv("eea_projektionen/ds2021/GHG_projections_2021_EEA.csv", "SubmissionYear") %>%
    mutate(datensatz = "EEA 2021"),
  {
    x <- read_excel(rf("eea_projektionen/ds2023/GHG_projections_2023_EEA_incl_pivots.xlsx"),
                    sheet = "Totals")
    data.frame(ms = x$CountryCode, submission = x$SubmissionYear, kategorie = x$Category, jahr = as.integer(x$Year),
               szenario_eea = x$Scenario, gas = x$Gas, reported = as.numeric(x[["Reported Value"]]),
               datensatz = "EEA 2023 (xlsx, Blatt Totals)", stringsAsFactors = FALSE)
  }
) %>% filter(ms == "DE")

eea_tot <- eea_raw %>%
  filter(grepl("^Total (w\\.out|excluding) LULUCF$", kategorie), gas %in% c("Total GHGs (ktCO2e)", "Total GHG emissions (ktCO2e)", "Total")) %>%
  mutate(szenario = recode(szenario_eea, WEM = "MMS", WAM = "MWMS"), eea_mt = reported / 1000,
         bericht = as.integer(submission)) %>%
  select(bericht, datensatz, szenario, jahr, eea_mt)

abgl_eea <- ext %>% filter(rolle == "Gesamt") %>%
  left_join(eea_tot, by = c("bericht", "szenario", "jahr")) %>%
  mutate(diff_mt = round(wert - eea_mt, 3),
         status = case_when(
           is.na(eea_mt) ~ "kein EEA-Meldewert (nur Gapfilling oder Jahr nicht gemeldet)",
           abs(diff_mt) <= 0.051 ~ "übereinstimmend (Rundung <= 0,05 Mt)",
           TRUE ~ "DIFFERENZ")) %>%
  select(tabelle_id, bericht, fassung, szenario, jahr, gwp, wert, eea_mt, diff_mt, status, datensatz, seite, tabelle)
write_csv(abgl_eea, file.path(OUT, "abgleich_eea_gesamt.csv"))
print(as.data.frame(abgl_eea %>% count(tabelle_id, status)), row.names = FALSE)

# Sektor-Abgleich (Plausibilität; Abgrenzung Quellbereich vs. CRF nicht
# zwingend identisch -> Differenzen sind Hinweise, keine Fehler)
eea_sec <- eea_raw %>% filter(gas %in% c("Total GHGs (ktCO2e)", "Total GHG emissions (ktCO2e)", "Total")) %>%
  mutate(szenario = recode(szenario_eea, WEM = "MMS", WAM = "MWMS"), bericht = as.integer(submission),
         crf = sub("^([0-9]\\.?[A-C]?\\.?[0-9]?\\.?).*$", "\\1", kategorie)) %>%
  filter(!is.na(reported))
crf_key <- function(k) {
  k <- gsub("\\s.*$", "", k); k <- sub("\\.$", "", k); k
}
eea_sec$crf <- crf_key(eea_sec$kategorie)
paare <- tribble(
  ~sektor_bericht, ~crf_codes,
  "Energiewirtschaft", "1.A.1",
  "Industrie", "1.A.2",
  "Verkehr", "1.A.3",
  "Industrieprozesse", "2",
  "Industrieprozesse + Produktverwendung", "2",
  "Landwirtschaft", "3",
  "Abfallwirtschaft", "5",
  "Flüchtige Emissionen aus Energiesektoren", "1.B",
  "Diffuse Emissionen aus Brennstoffen", "1.B")
# PB2015 weist Produktverwendung getrennt aus; CRF 2 umfasst beides -> Summe bilden
ipp <- ext %>% filter(bericht == 2015, grepl("^Quellbereiche", sektorsystem),
                      sektor_bericht %in% c("Industrieprozesse", "Produktverwendung"), !is.na(wert)) %>%
  group_by(tabelle_id, bericht, fassung, szenario, sektorsystem, jahr, gwp, datei, seite, tabelle) %>%
  filter(n() == 2) %>% summarise(wert = sum(wert), .groups = "drop") %>%
  mutate(sektor_bericht = "Industrieprozesse + Produktverwendung", rolle = "Sektor")
abgl_sec <- bind_rows(ext, ipp) %>% filter(rolle == "Sektor", bericht %in% c(2015, 2017, 2019),
                           grepl("^Quellbereiche", sektorsystem),
                           !(bericht == 2015 & sektor_bericht == "Industrieprozesse")) %>%
  inner_join(paare, by = "sektor_bericht") %>%
  left_join(eea_sec %>% select(bericht, szenario, jahr, crf, reported, datensatz),
            by = c("bericht", "szenario", "jahr", "crf_codes" = "crf")) %>%
  mutate(eea_mt = reported / 1000, diff_mt = round(wert - eea_mt, 3),
         status = case_when(is.na(eea_mt) ~ "kein EEA-Meldewert",
                            abs(diff_mt) <= 0.051 ~ "übereinstimmend",
                            TRUE ~ "abweichend (Abgrenzung/GWP prüfen)")) %>%
  select(tabelle_id, bericht, szenario, sektor_bericht, crf_codes, jahr, gwp, wert, eea_mt, diff_mt, status, seite, tabelle)
write_csv(abgl_sec, file.path(OUT, "abgleich_eea_sektoren_quellbereiche.csv"))
print(as.data.frame(abgl_sec %>% count(tabelle_id, status)), row.names = FALSE)

# =============================================================================
# SAP 3.5.1: Berichtsinterne Doppelangaben (zweite Übertragung, soweit möglich)
# =============================================================================
cat("\n== SAP 3.5.1: Berichtsinterne Doppelangaben ==\n")
# Spalte 'nur': vergleichbare Zeilen (bei unterschiedlichem Sektorzuschnitt nur
# Gesamt und Abfallwirtschaft = "Sonstige" laut Tabellenaufbau).
dbl_pairs <- tribble(
  ~a, ~b, ~nur, ~bemerkung,
  "PB2015o_T1-2", "PB2015s_T1-2", "alle", "MMS April 2015 vs. MMS in ergänzter Fassung Sept. 2016",
  "PB2015o_A-7", "PB2015s_A-5-12", "alle", "AR4-Umrechnung April 2015 vs. Sept. 2016",
  "PB2015o_A-5", "PB2015s_A-5-9", "alle", "BMUB-Sektorzuschnitt April 2015 vs. Sept. 2016",
  "PB2015o_T1-2", "PB2015o_A-5", "Gesamt", "Quellbereiche vs. BMUB-Sektorzuschnitt (nur Gesamt vergleichbar)",
  "PB2015s_T1-3", "PB2015s_A-5-10", "Gesamt", "MWMS Quellbereiche vs. BMUB-Sektorzuschnitt (nur Gesamt vergleichbar)",
  "PB2017_T1-2", "PB2017_A-5-3", "Gesamt;Abfallwirtschaft", "Quellbereiche vs. KSP-Sektoren (nur Gesamt, Abfall = Sonstige)",
  "PB2017_T1-3", "PB2017_A-5-4", "Gesamt;Abfallwirtschaft", "Quellbereiche vs. KSP-Sektoren (nur Gesamt, Abfall = Sonstige)",
  "PB2019_TZ-2", "PB2019k_T4", "Gesamt;Abfallwirtschaft", "Hauptbericht vs. KSP-Teilbericht (nur Gesamt, Abfall = Sonstige)",
  "PB2021_T1", "PB2021_T126", "alle", "Tabelle 1 vs. Tabelle 126 (beide KSG)",
  "PB2023_T17", "PB2023_T1", "alle", "Tabelle 17 vs. Tabelle 1 (Gesamt)",
  "PB2023_T17", "PB2023x_Blatt1", "alle", "PDF Tabelle 17 vs. amtlicher Datenanhang")
norm_sec <- function(s) recode(s, "Sonstige" = "Abfallwirtschaft", "Übrige" = "Abfallwirtschaft",
                               "Abfallwirtschaft & Sonstige" = "Abfallwirtschaft und Sonstiges")
dbl <- bind_rows(lapply(seq_len(nrow(dbl_pairs)), function(i) {
  keep <- if (dbl_pairs$nur[i] == "alle") NULL else strsplit(dbl_pairs$nur[i], ";")[[1]]
  A <- ext %>% filter(tabelle_id == dbl_pairs$a[i], rolle %in% c("Sektor", "Gesamt")) %>%
    mutate(sek = norm_sec(sektor_bericht))
  B <- ext %>% filter(tabelle_id == dbl_pairs$b[i], rolle %in% c("Sektor", "Gesamt")) %>%
    mutate(sek = norm_sec(sektor_bericht))
  if (!is.null(keep)) { A <- A %>% filter(sek %in% keep); B <- B %>% filter(sek %in% keep) }
  inner_join(A %>% select(szenario, sek, jahr, wert_a = wert, seite_a = seite),
             B %>% select(szenario, sek, jahr, wert_b = wert, seite_b = seite),
             by = c("szenario", "sek", "jahr")) %>%
    mutate(tabelle_a = dbl_pairs$a[i], tabelle_b = dbl_pairs$b[i], bemerkung = dbl_pairs$bemerkung[i])
})) %>%
  filter(!is.na(wert_a), !is.na(wert_b)) %>%
  mutate(diff = round(wert_a - wert_b, 3),
         status = ifelse(abs(diff) <= 0.051, "übereinstimmend (<= 0,05)", "DIFFERENZ"))
write_csv(dbl, file.path(OUT, "abgleich_berichtsintern.csv"))
print(as.data.frame(dbl %>% count(tabelle_a, tabelle_b, status)), row.names = FALSE)
cat("Differenzen im Einzelnen:\n")
print(as.data.frame(dbl %>% filter(status != "übereinstimmend (<= 0,05)") %>%
                      select(tabelle_a, tabelle_b, szenario, sek, jahr, wert_a, wert_b, diff)), row.names = FALSE)

# Vom analyst am 22.10.2026 visuell geprüfte Seiten (Tabellen-ID + PDF-Seite).
# Die Seite wurde gerendert (pdftools::pdf_convert) und Zelle für Zelle mit der
# Extraktion verglichen; keine Abweichung gefunden. Für PB2017_T1-2 S. 28 sind
# nur die drei dort gedruckten Zeilen (Energiewirtschaft, Industrie, GHD) betroffen.
sicht_geprueft <- c("PB2015o_T1-2 20", "PB2015o_A-5 216", "PB2015s_T1-3 24", "PB2015s_A-5-9 298",
                    "PB2015s_A-5-10 299", "PB2015s_A-5-14 303", "PB2017_T1-2 28", "PB2017_T1-3 30",
                    "PB2017_A-5-3 293", "PB2017_A-5-4 294", "PB2019_TZ-2 22", "PB2019k_T4 17",
                    "PB2021_T126 325", "PB2021_T126 326", "PB2023_T17 74")

# Extraktionstabelle mit Abgleichstatus je Wert schreiben
ext_out <- ext %>%
  left_join(abgl_eea %>% select(tabelle_id, szenario, jahr, eea_status = status, eea_mt),
            by = c("tabelle_id", "szenario", "jahr")) %>%
  mutate(eea_status = ifelse(rolle == "Gesamt", eea_status, NA))
dbl_long <- bind_rows(
  dbl %>% transmute(tabelle_id = tabelle_a, szenario, sek, jahr, gegen = tabelle_b, st = status),
  dbl %>% transmute(tabelle_id = tabelle_b, szenario, sek, jahr, gegen = tabelle_a, st = status)) %>%
  group_by(tabelle_id, szenario, sek, jahr) %>%
  summarise(intern_abgleich = paste(unique(paste0(gegen, ": ", st)), collapse = "; "), .groups = "drop")
ext_out <- ext_out %>% mutate(sek = norm_sec(sektor_bericht)) %>%
  left_join(dbl_long, by = c("tabelle_id", "szenario", "sek", "jahr")) %>% select(-sek) %>%
  mutate(sichtpruefung = ifelse(paste(tabelle_id, seite) %in% sicht_geprueft,
                                "ja: Seitenbild vom analyst gegen Extraktion geprüft (keine unabhängige Zweitübertragung)",
                                ifelse(quelle_typ == "PDF-Tabelle", "nein (nur über EEA-/berichtsinternen Abgleich bzw. Summenprüfung abgesichert)",
                                       "entfällt (Zellwerte aus xlsx)"))) %>%
  arrange(bericht, tabelle_id, szenario, rolle, sektor_bericht, jahr)
write_csv(ext_out %>% rename(pdf_seite = seite), file.path(OUT, "extraktionstabelle_projektionen.csv"))
cat(sprintf("\nExtraktionstabelle: %d Zeilen -> output/extraktionstabelle_projektionen.csv\n", nrow(ext_out)))
if (any(ext_out$hinweis != "")) {
  cat("Hinweise aus der Extraktion:\n")
  print(as.data.frame(ext_out %>% filter(hinweis != "") %>% select(tabelle_id, szenario, sektor_bericht, jahr, wert, hinweis)),
        row.names = FALSE)
}

# =============================================================================
# SAP 3.5.2: Summenprüfung (Summe Sektoren = Gesamt ± 1 %, unbereinigt)
# =============================================================================
cat("\n== SAP 3.5.2: Summenprüfung je Tabelle, Szenario, Jahr ==\n")
summ <- ext %>% filter(rolle %in% c("Sektor", "Gesamt"), !is.na(wert)) %>%
  group_by(tabelle_id, bericht, fassung, szenario, sektorsystem, jahr) %>%
  summarise(n_sektoren = sum(rolle == "Sektor"),
            summe_sektoren = sum(wert[rolle == "Sektor"]),
            gesamt = if (any(rolle == "Gesamt")) wert[rolle == "Gesamt"][1] else NA_real_,
            .groups = "drop") %>%
  mutate(diff_mt = round(summe_sektoren - gesamt, 3),
         diff_prozent = round(100 * (summe_sektoren - gesamt) / gesamt, 3),
         status = case_when(n_sektoren == 0 ~ "nur Gesamtwert, keine Sektoren in dieser Tabelle (nicht prüfbar)",
                            is.na(gesamt) ~ "kein Gesamtwert in der Tabelle (bzw. Gesamtwert nicht lesbar)",
                            abs(diff_prozent) <= 1 ~ "bestanden (<= 1 %)",
                            TRUE ~ "AUFFÄLLIG (> 1 %)"))
write_csv(summ, file.path(OUT, "summenpruefung.csv"))
print(as.data.frame(summ %>% count(tabelle_id, status)), row.names = FALSE)
cat(sprintf("Max. |Abweichung| (prüfbare Zellen): %.3f %% \n",
            max(abs(summ$diff_prozent[summ$n_sektoren > 0]), na.rm = TRUE)))
if (any(summ$status == "AUFFÄLLIG (> 1 %)")) print(as.data.frame(summ %>% filter(status == "AUFFÄLLIG (> 1 %)")))

# =============================================================================
# SAP 3.5.3: Einheiten und Metrik (GWP je Bericht und Inventarsubmission)
# =============================================================================
cat("\n== SAP 3.5.3: GWP-Metrik je Bericht/Submission (Fundstelle automatisch gesucht) ==\n")
find_pages <- function(file, pattern) {
  txt <- pdf_text(rf(file))
  which(grepl(pattern, gsub("\\s+", " ", txt), perl = TRUE))
}
gwp_spec <- tribble(
  ~objekt, ~datei, ~muster, ~gwp, ~aussage,
  "PB2015 (April 2015), Haupttabellen", F15o, "Treibhausgaspotentiale des Zweiten Sachstandsbericht", "IPCC SAR",
  "Berechnungen auf Basis Inventar Berichtsjahr 2014 mit GWP des 2. Sachstandsberichts; angenäherte AR4-Umrechnung in Anhang A6",
  "PB2015 (April 2015), Anhang A6/Tab. A-7", F15o, "Emissionsentwicklung mit GWPs aus dem IPCC AR4", "IPCC AR4 (angenäherte Umrechnung)",
  "Anhang A6: Umrechnung der Kernergebnisse auf AR4",
  "PB2015 (Sept. 2016), Haupttabellen", F15s, "verwendet noch alte Treibhausgaspotentiale", "IPCC SAR",
  "Bericht verwendet noch alte Treibhausgaspotentiale; Konversion in Anhang A6",
  "PB2017", F17, "Treibhausgaspotentialen aus dem Vierten Sachstandsbericht", "IPCC AR4",
  "Inventar Berichtsjahr 2016 mit GWP des 4. Sachstandsberichts",
  "PB2019", F19, "Treibhausgaspotentialen gemäß den aktuellen Inventar", "IPCC AR4 (UNFCCC 2013 Richtlinien)",
  "GWP gemäß aktuellen Inventar-Berichterstattungsrichtlinien (UNFCCC 2013); dass dies AR4-GWP sind, ist Ableitung des analyst (UNFCCC-Richtlinien 2013), nicht wörtlich im Bericht",
  "PB2021", F23, "Im Projektionsbericht 2021 wurden die Treibhausgaspotenziale des 4\\. Sachstandsberichts", "IPCC AR4",
  "Aussage im PB2023 über PB2021 (PB2021 selbst: 'gemäß den aktuellen Inventar-Berichterstattungsrichtlinien')",
  "PB2023", F23, "verwendeten Treibhausgaspotenziale entsprechen denen des 5\\. Sachstandsberichts", "IPCC AR5",
  "GWP des 5. Sachstandsberichts",
  "Referenzinventar Submission 2026 (NIR 2026)", "uba_inventar/30_2026_CC.pdf", "kt CO2-Äq\\. nach IPCC AR5", "IPCC AR5",
  "Inventartabellen in CO2-Äq. nach IPCC AR5",
  "PB2021 (Selbstaussage)", F21, "Treibhausgaspotentialen gemäß den aktuellen Inventar", "IPCC AR4 (UNFCCC 2013 Richtlinien)",
  "Selbstaussage PB2021")
gwp_tab <- gwp_spec %>% rowwise() %>%
  mutate(pdf_seiten = paste(head(find_pages(datei, muster), 5), collapse = ", ")) %>% ungroup() %>%
  mutate(status = ifelse(pdf_seiten == "", "Fundstelle NICHT gefunden", "Fundstelle gefunden"))
gwp_tab <- bind_rows(gwp_tab, tibble(
  objekt = "OWID total_ghg_excluding_lucf (Jones et al. 2025)", datei = "owid/total-ghg-emissions-excluding-lufc.metadata.json",
  muster = "AR6", gwp = "IPCC AR6", aussage = "laut OWID-Metadaten (descriptionProcessing)",
  pdf_seiten = NA, status = ifelse(any(grepl("6th Assessment Report", readLines(rf("owid/total-ghg-emissions-excluding-lufc.metadata.json"), warn = FALSE))),
                                   "Fundstelle gefunden", "Fundstelle NICHT gefunden")))
write_csv(gwp_tab %>% select(objekt, gwp, aussage, datei, pdf_seiten, status), file.path(OUT, "gwp_metrik.csv"))
print(as.data.frame(gwp_tab %>% select(objekt, gwp, pdf_seiten, status)), row.names = FALSE)

# =============================================================================
# SAP 3.2 / 3.5.4: Referenzinventar einlesen und Ist-Reihe plausibilisieren
# =============================================================================
cat("\n== SAP 3.2: Referenzinventar Submission 2026 einlesen ==\n")
F_tr  <- "uba_inventar/2026_EM_Entwicklung_in_D_Trendtabelle_THG.xlsx"
F_ksg <- "uba_inventar/Emissionsuebersichten_KSG-Sektoren_1990-2025.xlsx"
tr <- as.data.frame(suppressMessages(read_excel(rf(F_tr), sheet = "GHG_CO2eq", col_names = FALSE, .name_repair = "minimal")))
tr_row <- which(grepl("^Total Emissions \\(without LULUCF\\)|^Total Emissions without LULUCF", tr[[1]]))[1]
if (is.na(tr_row)) tr_row <- 4   # Zeile 'Total Emissions (without LULUCF)' laut Sichtprüfung
hdr_tr <- suppressWarnings(as.numeric(unlist(tr[3, ])))
ycols_tr <- which(!is.na(hdr_tr))     # Excel-Datumsseriennummern, eine Spalte je Jahr
stopifnot(length(ycols_tr) == 35)     # 1990–2024
tr_tot <- data.frame(jahr = 1990:2024, uba_trend_kt = as.numeric(unlist(tr[tr_row, ycols_tr])))
cat(sprintf("  Trendtabelle (15.01.2026), Zeile '%s': %d Jahre, 2024 = %.1f kt\n",
            substr(tr[tr_row, 1], 1, 40), nrow(tr_tot), tr_tot$uba_trend_kt[tr_tot$jahr == 2024]))

ks <- as.data.frame(suppressMessages(read_excel(rf(F_ksg), sheet = "THG", col_names = FALSE, .name_repair = "minimal")))
hdr_ks <- suppressWarnings(as.numeric(unlist(ks[2, ])))
ycols_ks <- which(!is.na(hdr_ks))
stopifnot(length(ycols_ks) == 36)     # 1990–2025
ks_row <- which(ks[[1]] == "ohne LULUCF")[1]
ks_tot <- data.frame(jahr = 1990:2025, uba_ksg_kt = as.numeric(unlist(ks[ks_row, ycols_ks])))
konsist <- tr_tot %>% left_join(ks_tot, by = "jahr") %>%
  mutate(diff_kt = round(uba_ksg_kt - uba_trend_kt, 3),
         status = ifelse(abs(diff_kt) <= 0.5, "identisch (<= 0,5 kt)", "ABWEICHUNG"))
# NIR 2026 (Climate Change 30/2026): 'National Total (ohne LULUCF)' für 2024
nir_txt <- gsub("\\s+", " ", pdf_text(rf("uba_inventar/30_2026_CC.pdf")))
nir_hit <- which(grepl("National Total \\(ohne LULUCF\\) [0-9.]+", nir_txt))
nir_2024 <- if (length(nir_hit)) as.numeric(gsub("\\.", "", sub(".*National Total \\(ohne LULUCF\\) ([0-9.]+).*", "\\1", nir_txt[nir_hit[1]]))) else NA
konsist$nir2026_kt <- ifelse(konsist$jahr == 2024, nir_2024, NA)
write_csv(konsist, file.path(OUT, "referenzinventar_konsistenz.csv"))
cat(sprintf("  Trendtabelle vs. KSG-Übersicht (1990–2024): %s\n", paste(names(table(konsist$status)), table(konsist$status), collapse = "; ")))
cat(sprintf("  NIR 2026 (PDF-Seite %s): National Total (ohne LULUCF) 2024 = %s kt; Trendtabelle: %.1f kt\n",
            paste(nir_hit[1]), format(nir_2024, big.mark = "."), tr_tot$uba_trend_kt[tr_tot$jahr == 2024]))

cat("\n== SAP 3.5.4: UBA-Gesamtemissionen 2015–2024 vs. OWID ==\n")
ow <- read.csv(rf("owid/owid-co2-data.csv"), stringsAsFactors = FALSE)
ow <- ow[ow$iso_code == "DEU" & ow$year %in% 2015:2024, c("year", "total_ghg_excluding_lucf", "total_ghg")]
pl <- tr_tot %>% filter(jahr %in% 2015:2024) %>%
  left_join(ow %>% rename(jahr = year), by = "jahr") %>%
  mutate(uba_mt = uba_trend_kt / 1000, owid_mt = total_ghg_excluding_lucf,
         diff_mt = round(owid_mt - uba_mt, 2),
         diff_prozent = round(100 * (owid_mt - uba_mt) / uba_mt, 2),
         status = case_when(is.na(owid_mt) ~ "OWID-Wert fehlt",
                            abs(diff_prozent) > 5 ~ "> 5 % -> im Bericht erläutern",
                            TRUE ~ "<= 5 %")) %>%
  select(jahr, uba_mt, owid_mt, diff_mt, diff_prozent, status)
write_csv(pl, file.path(OUT, "plausibilisierung_uba_owid.csv"))
print(as.data.frame(pl), row.names = FALSE)
cat("Abgrenzung: UBA = nationale Gesamtemissionen ohne LULUCF, GWP AR5 (Submission 2026);\n",
    "OWID total_ghg_excluding_lucf = Jones et al. (2025), GWP AR6, eigene Abgrenzung.\n", sep = "")

# =============================================================================
# SAP 3.5.5: Bestimmung von J_b je Bericht (aus dem Bericht selbst)
# =============================================================================
cat("\n== SAP 3.5.5: J_b je Bericht ==\n")
jb_spec <- tribble(
  ~bericht, ~datei, ~muster, ~beleg,
  2015, F15o, "Ausgangsjahr der Modellierung ist das Jahr 2012", "Ausgangsjahr der Modellierung 2012 (Stromsektor)",
  2015, F15o, "Treibhausgasinventar ist aus dem Berichtsjahr 2014", "Inventar Berichtsjahr 2014 (enthält Jahre bis 2012)",
  2017, F17, "Ausgangsjahr der Modellierung ist das Jahr 2014", "Ausgangsjahr der Modellierung 2014",
  2017, F17, "1990, 2005, 2010 und 2014 beziehen sich auf die Inventar Resubmission", "historische Jahre 1990, 2005, 2010, 2014 aus Resubmission Nov. 2016",
  2019, F19, "Ausgangsjahr der Modellierung ist das Jahr 2016", "Ausgangsjahr der Modellierung 2016",
  2019, F19, "1990, 2005, 2010 und 2016 stammen aus der Submission 2018", "historische Jahre 1990, 2005, 2010, 2016 aus Submission 2018",
  2021, F21, "Ausgangsjahr der Modellierung ist 2018", "Ausgangsjahr der Modellierung 2018",
  2021, F21, "Basisjahr 2018 wurden dem deutschen Treibhausgasinventar", "Basisjahr 2018 aus Inventar Stand 18.03.2020",
  2021, F21, "Werte für das Jahr 2020 wurden der Vorjahresschätzung", "Tab. 126: Werte 2020 = UBA-Vorjahresschätzung (historisch, kein Inventar)",
  2023, F23, "Ausgangsjahr der Modellierung ist 2019", "Ausgangsjahr der Modellierung 2019",
  2023, F23, "Für das Basisjahr 2019 liegen", "Tabellen: 'Basisjahr 2019'",
  2023, F23, "Daten für die Jahre 1990 bis 2020 verwendet", "Inventar Berichtsjahr 2022: Daten 1990–2020 verwendet")
jb_belege <- jb_spec %>% rowwise() %>%
  mutate(pdf_seiten = paste(head(find_pages(datei, muster), 8), collapse = ", ")) %>% ungroup() %>%
  mutate(status = ifelse(pdf_seiten == "", "Fundstelle NICHT gefunden", "Fundstelle gefunden"))
write_csv(jb_belege, file.path(OUT, "jb_belege.csv"))
print(as.data.frame(jb_belege %>% select(bericht, beleg, pdf_seiten, status)), row.names = FALSE)

jb <- tribble(
  ~bericht, ~jb_kandidaten, ~jb_eindeutig, ~begruendung,
  2015, "2012", TRUE, "Letzter historischer Tabellenwert 2012 = letztes Inventarjahr der Submission 2014 = Ausgangsjahr der Modellierung.",
  2017, "2014", TRUE, "Letzter historischer Tabellenwert 2014 = letztes Jahr der Resubmission Nov. 2016 = Ausgangsjahr der Modellierung.",
  2019, "2016", TRUE, "Letzter historischer Tabellenwert 2016 = letztes Jahr der Submission 2018 = Ausgangsjahr der Modellierung.",
  2021, "2018 oder 2020", FALSE, "Inventar-Basisjahr 2018 (Submission 2020); Tab. 126 weist 2020 als historischen Wert aus, der aber eine Vorjahresschätzung (kein Inventarwert) ist. SAP 2.1 ('historische Inventarwerte') spricht für 2018, SAP 3.5.5 ('letzter als historisch gekennzeichneter Wert') für 2020.",
  2023, "2019 oder 2020", FALSE, "Alle Tabellen nennen 2019 als 'Basisjahr' und Ausgangsjahr der Modellierung; verwendet wurden Inventardaten 1990–2020 (Submission 2022). Ein Wert für 2020 ist in den Ergebnistabellen und im Datenanhang nicht ausgewiesen.")
write_csv(jb, file.path(OUT, "jb_bestimmung.csv"))
print(as.data.frame(jb %>% select(bericht, jb_kandidaten, jb_eindeutig)), row.names = FALSE)
if (any(!jb$jb_eindeutig)) {
  cat("\n*** STOPP nach SAP 3.5.5: J_b nicht eindeutig für Bericht(e)",
      paste(jb$bericht[!jb$jb_eindeutig], collapse = ", "),
      "-> Rückfrage an Daniel vor jeder Auswertung. ***\n")
}

# =============================================================================
# SAP 3.5.6: Verfügbarkeit von P(b,s,J_b,k) je Bericht, Szenario, Sektor
# =============================================================================
cat("\n== SAP 3.5.6: Verfügbarkeit P(b,s,J_b,k) (je J_b-Kandidat) ==\n")
jb_long <- bind_rows(
  tibble(bericht = 2015, jb = 2012), tibble(bericht = 2017, jb = 2014), tibble(bericht = 2019, jb = 2016),
  tibble(bericht = 2021, jb = c(2018, 2020)), tibble(bericht = 2023, jb = c(2019, 2020)))
cells <- ext %>% filter(rolle %in% c("Sektor", "Gesamt")) %>%
  distinct(bericht, tabelle_id, fassung, szenario, sektorsystem, sektor_bericht, gwp)
verf <- cells %>% inner_join(jb_long, by = "bericht", relationship = "many-to-many") %>%
  left_join(ext %>% filter(!is.na(wert)) %>% select(tabelle_id, szenario, sektor_bericht, jahr, wert),
            by = c("tabelle_id", "szenario", "sektor_bericht", "jb" = "jahr")) %>%
  mutate(P_Jb_vorhanden = !is.na(wert)) %>%
  rename(P_Jb_wert = wert) %>%
  left_join(jb %>% select(bericht, jb_eindeutig), by = "bericht") %>%
  arrange(bericht, jb, tabelle_id, szenario, sektor_bericht)
write_csv(verf, file.path(OUT, "verfuegbarkeit_P_Jb.csv"))
print(as.data.frame(verf %>% group_by(bericht, jb, tabelle_id, szenario) %>%
                      summarise(sektoren = n(), mit_P_Jb = sum(P_Jb_vorhanden), .groups = "drop")), row.names = FALSE)

# Szenario-Verfügbarkeit (für SAP 4.2 / E3 dokumentiert, keine Auswertung)
szen <- ext %>% filter(rolle == "Gesamt") %>% distinct(bericht, fassung, szenario) %>%
  group_by(bericht) %>% summarise(szenarien = paste(sort(unique(szenario)), collapse = ", "),
                                  fassungen = paste(unique(fassung), collapse = " | "), .groups = "drop")
write_csv(szen, file.path(OUT, "szenarien_je_bericht.csv"))
cat("\nSzenarien je Bericht:\n"); print(as.data.frame(szen), row.names = FALSE)

# Explizit ausgewiesene Jahre im Bereich 2015–2024 (rein deskriptiv, SAP 4.2/4.3)
jahre <- ext %>% filter(rolle == "Gesamt", jahr >= 2015, jahr <= 2024, kennzeichnung_bericht == "Projektion") %>%
  distinct(bericht, szenario, quelle_typ, jahr) %>% group_by(bericht, szenario, quelle_typ) %>%
  summarise(projizierte_jahre_2015_2024 = paste(sort(unique(jahr)), collapse = ", "), .groups = "drop")
write_csv(jahre, file.path(OUT, "explizite_zieljahre.csv"))
cat("\nExplizit ausgewiesene projizierte Jahre 2015–2024 (Gesamt):\n"); print(as.data.frame(jahre), row.names = FALSE)

# --- Sitzungsinformationen (SAP 10) ------------------------------------------
writeLines(capture.output(sessionInfo()), file.path(OUT, "sessionInfo_01_integritaet.txt"))
cat("\nFertig. Ausgaben in", OUT, "\n")
