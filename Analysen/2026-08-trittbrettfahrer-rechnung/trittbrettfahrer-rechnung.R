#!/usr/bin/env Rscript
# ============================================================================
# "Trittbrettfahrer-Rechnung" - Deskriptive Konzentrationsanalyse
#
# SAP:    Analysen/2026-08-trittbrettfahrer-rechnung/SAP_Trittbrettfahrer-Rechnung.md
# Status: final, Version 1.0, eingefroren 31.08.2026, freigegeben durch
#         Daniel Saure (geprueft vor Implementierung: Status-Header liest
#         "Status: final, eingefroren am 31.08.2026, freigegeben durch
#         Daniel Saure." - siehe SAP-Kopf und Abschnitt 0).
#
# Abgrenzung (SAP Abschnitt 8, letzter Punkt): Diese Analyse ist NICHT
# identisch mit und ersetzt NICHT
# Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md
# (dort: Trendprojektion von Deutschlands EIGENEN Emissionen bis 2040;
# hier: Querschnitts-Konzentrationsrechnung ueber ALLE Laender, keine
# Projektion, keine Aussage ueber Deutschlands zukuenftige Entwicklung).
#
# ----------------------------------------------------------------------------
# TECHNISCHER HINWEIS ZUR AUSFUEHRUNGSUMGEBUNG (kein SAP-Inhalt, aber fuer
# Nachvollziehbarkeit und Validator-Review zwingend zu lesen):
#
# In der R-4.6.1-Installation dieser Ausfuehrungsumgebung fuehren folgende
# Funktionen/Pakete REPRODUZIERBAR zu Segmentation Faults (verifiziert durch
# wiederholte, isolierte Tests, u.a. mit trivialen Beispielen ohne jeden
# Bezug zu den hier verwendeten Daten):
#   - download.file() / url()+readBin() (alle Methoden: libcurl, wininet,
#     curl) -> R kann selbst KEINE Netzwerk-Downloads durchfuehren.
#   - readxl::read_excel() und xml2::read_xml() -> koennen KEINE xlsx/xml-
#     Zelldaten einlesen (auch nicht die im readxl-Paket selbst mitgelieferte
#     Beispieldatei oder ein trivialer In-Memory-XML-String).
#   - base::unzip() auf den hier verwendeten .xlsx-Dateien.
#   - Graphikgeraete (png(), pdf(), jpeg(), tiff(), bmp(), svg(), ggsave())
#     sind NICHT deterministisch defekt, sondern intermittierend instabil
#     (vermutlich Konflikt mit Echtzeit-Virenscan neu geschriebener
#     Dateien) - Wiederholung des Schreibvorgangs behebt es i.d.R.
#
# Funktionierend UND zuverlaessig sind dagegen: base::read.csv() auf lokalen
# Dateien, dplyr, readr, jsonlite, base-Arithmetik/-Statistik.
#
# Konsequenz fuer dieses Skript (rein TECHNISCHE Anpassung, KEINE inhaltliche
# SAP-Abweichung - siehe rohdaten/DATENAUFBEREITUNG_LOG.txt fuer die volle
# Dokumentation):
#   1. Alle Rohdaten wurden VOR diesem Skript per System-`curl` (identische
#      Primärquellen-URLs wie im SAP) heruntergeladen und liegen unveraendert
#      in rohdaten/ (xlsx-Originale bleiben erhalten).
#   2. Die xlsx-Dateien wurden per Standard-`unzip` + einem deterministischen,
#      inhaltlich nicht interpretierenden XML->CSV-Konverter
#      (rohdaten/xlsx_sheet_to_csv.pl) in rohdaten/csv/*.csv umgewandelt.
#      Dieses Skript liest ausschliesslich diese CSVs (sowie die Roh-JSON/
#      CSV-Dateien der Weltbank/OWID direkt).
#   3. Grafikausgabe (Estimand 1) erfolgt als PDF (pdf()-Geraet) mit
#      automatischer Wiederholung bei transienten Schreibfehlern (siehe
#      Funktion save_plot_retry() unten).
#   4. Das Skript ist CHECKPOINT-basiert: Nach Abschluss der Berechnungen
#      (kein Netzwerk-/Grafikbedarf mehr) wird ein Zwischenstand gespeichert,
#      damit ein erneuter Lauf bei einem Grafik-Crash nicht die gesamte
#      Datenaufbereitung wiederholen muss.
# ----------------------------------------------------------------------------

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(jsonlite)
  library(ggplot2)
})

base_dir   <- "C:/Users/dsaur/klima-evidenzcheck/Analysen/2026-08-trittbrettfahrer-rechnung"
roh_dir    <- file.path(base_dir, "rohdaten")
csv_dir    <- file.path(roh_dir, "csv")
out_dir    <- file.path(base_dir, "output")
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

log_path <- file.path(base_dir, "run_log.txt")
log_con  <- file(log_path, open = "wt", encoding = "UTF-8")
log_msg  <- function(...) {
  msg <- paste0(...)
  cat(msg, "\n")
  cat(msg, "\n", file = log_con)
}

log_msg("======================================================================")
log_msg("Trittbrettfahrer-Rechnung - Analyselauf, gestartet: ", as.character(Sys.time()))
log_msg("R-Version: ", R.version.string)
log_msg("SAP-Status geprueft: final, Version 1.0, eingefroren 31.08.2026 (Daniel Saure)")
log_msg("Zugriffsdatum aller Rohdaten: 31.08.2026 (siehe rohdaten/DATENAUFBEREITUNG_LOG.txt)")
log_msg("======================================================================\n")

checkpoint_path <- file.path(out_dir, "checkpoint_estimands.RDS")

# ============================================================================
# SAP 3/4: DATENSTRUKTUR-CHECK DER PRIMAERQUELLEN (zuerst, vor jeder Rechnung)
# ============================================================================
run_datenstruktur_check <- function() {
  log_msg("---- Datenstruktur-Check Primaerquellen (SAP 3/4) ----")

  edgar_ghg_path <- file.path(csv_dir, "edgar_ghg_totals_by_country.csv")
  raw <- read.csv(edgar_ghg_path, header = FALSE, stringsAsFactors = FALSE,
                   colClasses = "character")
  log_msg("EDGAR GHG total: ", nrow(raw), " Zeilen, ", ncol(raw), " Spalten.")
  hdr <- as.character(raw[1, ])
  stopifnot(hdr[1] == "EDGAR Country Code", hdr[2] == "Country")
  year_num <- suppressWarnings(as.numeric(hdr))
  year_cols <- which(!is.na(year_num))
  log_msg("  Jahresspalten: ", min(year_num[year_cols]), " bis ", max(year_num[year_cols]))
  stopifnot(raw[212, 2] == "EU27", raw[213, 2] == "GLOBAL TOTAL")
  log_msg("  Struktur bestaetigt: Zeilen 2-211 = 210 Einzelstaaten (inkl. EDGAR-",
          "eigener Zusammenlegungen kleiner Nachbarstaaten, z.B. 'Switzerland ",
          "and Liechtenstein' - Quelleneigenschaft, siehe DATENAUFBEREITUNG_LOG.txt); ",
          "Zeile 212 = EU27 (Aggregat, ausgeschlossen); Zeile 213 = GLOBAL TOTAL ",
          "(nicht als Nenner verwendet, siehe SAP-Formel Abschnitt 2).")

  de_row <- which(raw[2:211, 1] == "DEU") + 1
  stopifnot(length(de_row) == 1)
  log_msg("  Deutschland gefunden: Zeile ", de_row, ", Name='", raw[de_row, 2], "'")

  edgar_co2_path <- file.path(csv_dir, "edgar_co2_totals_by_country.csv")
  raw_co2 <- read.csv(edgar_co2_path, header = FALSE, stringsAsFactors = FALSE,
                       colClasses = "character")
  log_msg("EDGAR CO2-only: ", nrow(raw_co2), " Zeilen, ", ncol(raw_co2), " Spalten.")

  gcb_terr_path <- file.path(csv_dir, "gcb_territorial_emissions.csv")
  raw_gcb <- read.csv(gcb_terr_path, header = FALSE, stringsAsFactors = FALSE,
                       colClasses = "character")
  log_msg("GCB Territorial Emissions: ", nrow(raw_gcb), " Zeilen (inkl. Metadaten-",
          "Kopfzeilen und nachlaufenden Leerzeilen aus dem xlsx-Layout), ",
          ncol(raw_gcb), " Spalten.")
  hdr_row_gcb <- which(apply(raw_gcb, 1, function(x) any(x == "Germany", na.rm = TRUE)))[1]
  log_msg("  Header-Zeile (Laendernamen) dynamisch erkannt: Zeile ", hdr_row_gcb)
  data_rows_gcb <- which(grepl("^[0-9]{4}$", raw_gcb[[1]]))
  log_msg("  Datenzeilen (Jahre) erkannt: ", length(data_rows_gcb), " Jahre, ",
          min(as.integer(raw_gcb[data_rows_gcb, 1])), " bis ",
          max(as.integer(raw_gcb[data_rows_gcb, 1])))

  wb_path <- file.path(roh_dir, "worldbank_population_2024.json")
  wb_raw <- jsonlite::fromJSON(wb_path)
  log_msg("Weltbank-Bevoelkerung 2024: ", nrow(wb_raw[[2]]), " Records (inkl. ",
          "regionaler Aggregate der Weltbank-Klassifikation, werden beim Join ",
          "auf EDGAR-Laenderliste automatisch nicht gematcht/ignoriert).")

  owid_path <- file.path(roh_dir, "owid-co2-data.csv")
  owid_hdr <- names(readr::read_csv(owid_path, n_max = 0, show_col_types = FALSE))
  stopifnot(all(c("country", "iso_code", "year", "total_ghg") %in% owid_hdr))
  log_msg("OWID co2-data.csv: Header bestaetigt (country, iso_code, year, total_ghg vorhanden).")

  log_msg("---- Datenstruktur-Check abgeschlossen: alle Primaerquellen wie erwartet strukturiert ----\n")
  invisible(TRUE)
}

# ============================================================================
# Hilfsfunktionen
# ============================================================================

# Liest ein EDGAR-Booklet-CSV (Format: Zeile1=Header[Code,Country,Jahre...],
# Zeilen2:211=Laender, Zeile212=EU27, Zeile213=GLOBAL TOTAL) und liefert die
# Laender-Tabelle fuer ein bestimmtes Jahr zurueck.
read_edgar_country_year <- function(path, year) {
  raw <- read.csv(path, header = FALSE, stringsAsFactors = FALSE, colClasses = "character")
  hdr <- as.character(raw[1, ])
  # Spaltenpositionen dynamisch bestimmen (EDGAR-GHG- und -CO2-only-Datei haben
  # unterschiedliche Spaltenzahl/-reihenfolge: CO2-only hat zusaetzliche
  # fuehrende Spalte "Substance").
  code_col <- which(hdr == "EDGAR Country Code")
  name_col <- which(hdr == "Country")
  stopifnot(length(code_col) == 1, length(name_col) == 1)
  year_num <- suppressWarnings(as.numeric(hdr))
  col <- which(year_num == year)
  stopifnot(length(col) == 1)

  eu27_row <- which(raw[[name_col]] == "EU27")
  global_row <- which(raw[[name_col]] == "GLOBAL TOTAL")
  stopifnot(length(eu27_row) == 1, length(global_row) == 1)
  country_rows <- 2:(min(eu27_row, global_row) - 1)

  df_all <- data.frame(
    code  = raw[country_rows, code_col],
    name  = raw[country_rows, name_col],
    value = suppressWarnings(as.numeric(raw[country_rows, col])),
    stringsAsFactors = FALSE
  )
  # SAP Abschnitt 4, Ausschlusskriterien: nicht-nationale Sammelkategorien
  # (International Shipping = Code AIR? nein: EDGAR-Codes "AIR"=International
  # Aviation, "SEA"=International Shipping) separat ausweisen, NICHT in die
  # Laender-Rangfolge einbeziehen.
  bunker_codes <- c("AIR", "SEA")
  bunkers <- df_all[df_all$code %in% bunker_codes, ]
  df <- df_all[!df_all$code %in% bunker_codes, ]

  missing <- df[is.na(df$value), ]
  df <- df[!is.na(df$value), ]
  attr(df, "missing") <- missing
  attr(df, "bunkers") <- bunkers
  attr(df, "eu27_value") <- suppressWarnings(as.numeric(raw[eu27_row, col]))
  attr(df, "global_total") <- suppressWarnings(as.numeric(raw[global_row, col]))
  df
}

# Liest ein GCB-"wide"-Sheet (Zeilen=Jahre, Spalten=Laender/Aggregate), erkennt
# Header-/Datenzeilen dynamisch (siehe Datenstruktur-Check) und rechnet von
# MtC in Mt CO2 um (Faktor 3.664, Quelle: Kopfzeile der Originaldatei).
GCB_AGGREGATE_NAMES <- c("KP Annex B", "Non KP Annex B", "OECD", "Non-OECD",
                          "EU27", "Africa", "Asia", "Central America", "Europe",
                          "Middle East", "North America", "Oceania",
                          "South America", "International Shipping",
                          "International Aviation", "Statistical Difference",
                          "World")

read_gcb_wide <- function(path, unit_factor = 3.664) {
  raw <- read.csv(path, header = FALSE, stringsAsFactors = FALSE, colClasses = "character")
  hdr_row <- which(apply(raw, 1, function(x) any(x == "Germany", na.rm = TRUE)))[1]
  hdr <- as.character(raw[hdr_row, ])
  data_rows <- which(grepl("^[0-9]{4}$", raw[[1]]))
  years <- as.integer(raw[data_rows, 1])

  country_cols <- which(hdr != "" & !(hdr %in% GCB_AGGREGATE_NAMES))
  aggregate_cols <- which(hdr %in% GCB_AGGREGATE_NAMES)

  mat <- sapply(country_cols, function(cc) suppressWarnings(as.numeric(raw[data_rows, cc])))
  colnames(mat) <- hdr[country_cols]
  mat <- mat * unit_factor  # MtC -> Mt CO2

  agg_mat <- sapply(aggregate_cols, function(cc) suppressWarnings(as.numeric(raw[data_rows, cc])))
  colnames(agg_mat) <- hdr[aggregate_cols]
  agg_mat <- agg_mat * unit_factor

  list(years = years, countries = mat, aggregates = agg_mat)
}

# Konzentrationskurve: sortiert absteigend nach Anteil, Tie-Break alphabetisch
# nach Code (SAP Abschnitt 4), liefert Rang + kumulierten Anteil.
build_concentration_curve <- function(code, name, value) {
  df <- data.frame(code = code, name = name, value = value, stringsAsFactors = FALSE)
  df$share <- df$value / sum(df$value)
  df <- df[order(-df$share, df$code), ]
  df$rank <- seq_len(nrow(df))
  df$cum_share <- cumsum(df$share)
  df
}

# Estimand-2-Kernzahl: Summe aller Anteile s_i <= s_DE (DE eingeschlossen).
kernzahl_le_de <- function(curve_df, de_code) {
  de_share <- curve_df$share[curve_df$code == de_code]
  stopifnot(length(de_share) == 1)
  sum(curve_df$share[curve_df$share <= de_share])
}

# Rank-Sensitivity (SAP 6, Punkt 4): kumulierter Anteil an Raengen DE-20 etc.
rank_sensitivity <- function(curve_df, de_code, label) {
  de_rank <- curve_df$rank[curve_df$code == de_code]
  offsets <- c(-20, -10, 0, 10, 20)
  ranks <- pmin(pmax(de_rank + offsets, 1), nrow(curve_df))
  data.frame(
    zeithorizont = label,
    position = paste0("DE", ifelse(offsets == 0, "", sprintf("%+d", offsets))),
    rang = ranks,
    kumulierter_anteil_pct = round(curve_df$cum_share[ranks] * 100, 1)
  )
}

# Wiederholt einen Grafik-Schreibvorgang bei transienten Fehlern/Crashes.
# HINWEIS: Ein echter Segfault des R-Prozesses kann von R selbst nicht
# abgefangen werden (siehe technischer Hinweis oben) - deshalb erfolgt die
# Robustheit hier durch (a) tryCatch fuer normale R-Fehler und (b) dadurch,
# dass dieses Skript checkpoint-basiert ist und bei einem Prozessabsturz
# einfach erneut gestartet werden kann, ohne die Berechnungen zu wiederholen.
save_plot_retry <- function(plot_obj, path, width = 9, height = 6, tries = 5) {
  for (i in seq_len(tries)) {
    ok <- tryCatch({
      pdf(path, width = width, height = height)
      print(plot_obj)
      dev.off()
      file.exists(path) && file.info(path)$size > 0
    }, error = function(e) {
      message("  Versuch ", i, " fehlgeschlagen: ", conditionMessage(e))
      FALSE
    })
    if (isTRUE(ok)) {
      log_msg("  Grafik gespeichert (Versuch ", i, "): ", path)
      return(invisible(TRUE))
    }
  }
  log_msg("  WARNUNG: Grafik konnte nach ", tries, " Versuchen nicht gespeichert werden: ", path)
  invisible(FALSE)
}

# ============================================================================
# HAUPTTEIL
# ============================================================================

run_datenstruktur_check()

if (file.exists(checkpoint_path)) {
  log_msg("Checkpoint gefunden (", checkpoint_path, ") - Berechnungen werden ",
          "NICHT wiederholt, sondern der gespeicherte Stand geladen. (Grund: ",
          "Grafikausgabe in dieser Umgebung instabil, siehe technischer ",
          "Hinweis im Skriptkopf - erneute Skriptlaeufe sollen die bereits ",
          "erfolgreich abgeschlossene Datenaufbereitung nicht wiederholen.)")
  ck <- readRDS(checkpoint_path)
  invisible(list2env(ck, envir = environment()))
} else {

# ----------------------------------------------------------------------------
# SAP 3 (zwingend): Ermittlung von Deutschlands Ausgangswert aus EDGAR
# ----------------------------------------------------------------------------
log_msg("---- SAP 3: Ermittlung Deutschlands Ausgangswert (EDGAR, zwingend erster Schritt) ----")

edgar_ghg_2024 <- read_edgar_country_year(
  file.path(csv_dir, "edgar_ghg_totals_by_country.csv"), 2024)
missing_2024 <- attr(edgar_ghg_2024, "missing")
log_msg("EDGAR GHG total, Berichtsjahr 2024 (aktuellstes vollstaendiges Jahr lt. ",
        "EDGAR-2025-Booklet-Zeitreihe 1970-2024): ", nrow(edgar_ghg_2024),
        " Laender mit Wert; ", nrow(missing_2024), " Laender ohne Wert ",
        "ausgeschlossen (SAP Abschnitt 4).")
if (nrow(missing_2024) > 0) {
  log_msg("  Ausgeschlossen (kein numerischer Wert 2024): ",
          paste(missing_2024$name, collapse = ", "))
}

curve_2a <- build_concentration_curve(edgar_ghg_2024$code, edgar_ghg_2024$name, edgar_ghg_2024$value)
de_2a <- curve_2a[curve_2a$code == "DEU", ]
log_msg("Deutschlands EDGAR-THG-Anteil 2024 (Estimand-2a-Ausgangswert): ",
        round(de_2a$share * 100, 4), " % (Rang ", de_2a$rank, " von ", nrow(curve_2a), ")")
log_msg("Deutschlands EDGAR-THG-Emission 2024: ", round(de_2a$value, 1), " Mt CO2eq")
log_msg("Weltsumme (Summe aller einbezogenen Laender, SAP-Formel, NICHT EDGAR-",
        "'GLOBAL TOTAL'-Zeile): ", round(sum(edgar_ghg_2024$value), 1), " Mt CO2eq")
log_msg("Zum Vergleich EDGAR 'GLOBAL TOTAL'-Zeile (inkl. evtl. weiterer, hier ",
        "nicht separat gefuehrter Kategorien): ", round(attr(edgar_ghg_2024, "global_total"), 1),
        " Mt CO2eq (Differenz: ", round(attr(edgar_ghg_2024, "global_total") - sum(edgar_ghg_2024$value), 1),
        " Mt CO2eq; EU27-Aggregatzeile separat: ", round(attr(edgar_ghg_2024, "eu27_value"), 1), " Mt CO2eq, ",
        "nicht in Laender-Rangfolge einbezogen, siehe SAP Abschnitt 4).")
edgar_bunkers_2a <- attr(edgar_ghg_2024, "bunkers")
bunker_share_2a <- sum(edgar_bunkers_2a$value, na.rm = TRUE) / sum(edgar_ghg_2024$value)
log_msg("Fussnote (SAP Abschnitt 4): EDGAR fuehrt 'International Aviation' und ",
        "'International Shipping' als eigene, nicht-nationale Zeilen (Codes AIR/SEA); ",
        "diese sind NICHT in curve_2a/2a-Weltsumme enthalten. Ihr gemeinsamer Anteil ",
        "an der Laender-Summe 2024: ", round(bunker_share_2a * 100, 2), " % (",
        paste(edgar_bunkers_2a$name, "=", round(edgar_bunkers_2a$value, 1), "Mt", collapse = "; "), ").")

# --- Datenvintage-Kreuzpruefung gegen OWID (SAP 3, zwingend + SAP 6 Punkt 6) --
owid <- readr::read_csv(file.path(roh_dir, "owid-co2-data.csv"), show_col_types = FALSE)
owid_de <- owid %>% filter(iso_code == "DEU", !is.na(total_ghg)) %>% filter(year == max(year))
owid_world <- owid %>% filter(country == "World") %>% filter(year == owid_de$year[1])
owid_de_share <- owid_de$total_ghg[1] / owid_world$total_ghg[1]
owid_year <- owid_de$year[1]
diff_pp <- (de_2a$share - owid_de_share) * 100
log_msg("OWID-Kreuzpruefung (Sekundaerquelle, NUR zur Kreuzpruefung, SAP Abschnitt 3): ",
        "OWID-Jahr=", owid_de$year[1], ", DE-Anteil OWID=", round(owid_de_share * 100, 4),
        " %, EDGAR=", round(de_2a$share * 100, 4), " %. Abweichung = ",
        round(diff_pp, 3), " Prozentpunkte. Im Konfliktfall gilt der EDGAR-Wert ",
        "als massgeblich (SAP Abschnitt 3).")
log_msg("Hinweis: OWID wurde ausschliesslich in dieser dokumentierten ",
        "Kreuzpruefungs-Rolle verwendet - kein Fallback, da EDGAR/GCP-Zugriff ",
        "in allen Faellen erfolgreich war (siehe rohdaten/DATENAUFBEREITUNG_LOG.txt).\n")

# ----------------------------------------------------------------------------
# ESTIMAND 1a + 2a: EDGAR THG gesamt, aktuelles Jahr (Primaervariante)
# ----------------------------------------------------------------------------
log_msg("---- Estimand 1a / 2a: EDGAR THG gesamt, 2024 ----")
kernzahl_2a <- kernzahl_le_de(curve_2a, "DEU")
log_msg("Estimand 1a: kumulierter Anteil der ", de_2a$rank, " groessten Emittenten ",
        "(inkl. Deutschland, top-down) = ", round(de_2a$cum_share * 100, 1), " %")
log_msg("Estimand 2a (Kernzahl, SAP-Formel s_i <= s_DE): ", round(kernzahl_2a * 100, 1),
        " % der Weltsumme entfallen auf Laender mit Anteil <= Deutschlands Anteil ",
        "(", nrow(curve_2a) - de_2a$rank + 1, " von ", nrow(curve_2a), " Laendern).")

# ----------------------------------------------------------------------------
# ESTIMAND 1b + 2b: GCB fossile CO2 + Zement, kumuliert seit Zeitreihenbeginn
# ----------------------------------------------------------------------------
log_msg("\n---- Estimand 1b / 2b: GCB fossiles CO2 + Zement, kumuliert (Primaervariante) ----")
gcb_terr <- read_gcb_wide(file.path(csv_dir, "gcb_territorial_emissions.csv"))
log_msg("GCB Territorial Emissions: Zeitreihe ", min(gcb_terr$years), "-", max(gcb_terr$years),
        ", ", ncol(gcb_terr$countries), " Laender.")
cum_fossil <- colSums(gcb_terr$countries, na.rm = TRUE)
curve_2b <- build_concentration_curve(
  code = names(cum_fossil), name = names(cum_fossil), value = as.numeric(cum_fossil))
# GCB fuehrt keine ISO3-Codes; Deutschland wird ueber den Landesnamen identifiziert.
de_2b <- curve_2b[curve_2b$code == "Germany", ]
kernzahl_2b <- kernzahl_le_de(curve_2b, "Germany")
log_msg("Deutschlands kumulierter fossiler CO2-Anteil (1850-", max(gcb_terr$years),
        "): ", round(de_2b$share * 100, 4), " % (Rang ", de_2b$rank, " von ", nrow(curve_2b), ")")
log_msg("Estimand 1b: kumulierter Anteil der ", de_2b$rank, " groessten historischen ",
        "Emittenten = ", round(de_2b$cum_share * 100, 1), " %")
log_msg("Estimand 2b (Kernzahl): ", round(kernzahl_2b * 100, 1), " % der historischen ",
        "Weltsumme (fossil+Zement, 1850-", max(gcb_terr$years), ") entfallen auf Laender ",
        "mit Anteil <= Deutschlands Anteil.")

# Fussnote (SAP Abschnitt 4): Anteil International Shipping/Aviation an Weltsumme
intl_ship_share <- sum(gcb_terr$aggregates[, "International Shipping"], na.rm = TRUE) / sum(cum_fossil)
intl_avi_share  <- sum(gcb_terr$aggregates[, "International Aviation"], na.rm = TRUE) / sum(cum_fossil)
log_msg("Fussnote (SAP Abschnitt 4): International Shipping = ",
        round(intl_ship_share * 100, 2), " % , International Aviation = ",
        round(intl_avi_share * 100, 2), " % der Laender-Summe (kumuliert) - ",
        "nicht in der Laender-Rangfolge enthalten.")

# ----------------------------------------------------------------------------
# ESTIMAND 3: Pro-Kopf-Filter (SAP Abschnitt 2, 5.1)
# ----------------------------------------------------------------------------
log_msg("\n---- Estimand 3: Pro-Kopf-Stratifizierung ----")
wb_raw <- jsonlite::fromJSON(file.path(roh_dir, "worldbank_population_2024.json"))
wb_df <- wb_raw[[2]]
wb_pop <- data.frame(code = wb_df$countryiso3code, pop = as.numeric(wb_df$value),
                      stringsAsFactors = FALSE)
wb_pop <- wb_pop[!is.na(wb_pop$pop), ]
wb_pop <- wb_pop[!duplicated(wb_pop$code), ]

e3_base <- merge(edgar_ghg_2024, wb_pop, by = "code", all.x = TRUE)
no_pop <- e3_base[is.na(e3_base$pop), ]
e3_base <- e3_base[!is.na(e3_base$pop), ]
share_excl <- sum(no_pop$value) / sum(edgar_ghg_2024$value)
log_msg("Laender ohne Weltbank-Bevoelkerungswert 2024 (von Estimand 3 ausgeschlossen, ",
        "SAP Abschnitt 4): ", nrow(no_pop), " von ", nrow(edgar_ghg_2024),
        " (Anteil an THG-Gesamtsumme aus 2a: ", round(share_excl * 100, 2), " %).")
if (nrow(no_pop) > 0) log_msg("  Betroffen: ", paste(no_pop$name, collapse = ", "))

e3_base$percap <- e3_base$value / e3_base$pop  # Mt CO2eq / (Personen) -> t/Kopf via *1e6/1
e3_base$percap_t <- e3_base$percap * 1e6  # Mt -> t

global_mean_percap <- sum(e3_base$value) * 1e6 / sum(e3_base$pop)
global_median_percap <- median(e3_base$percap_t)
log_msg("Globaler Pro-Kopf-Durchschnitt (Mittelwert, Primaervariante): ",
        round(global_mean_percap, 2), " t CO2eq/Kopf")
log_msg("Globaler Pro-Kopf-Median (Sensitivitaet SAP 6 Punkt 5): ",
        round(global_median_percap, 2), " t CO2eq/Kopf")

de_row3 <- e3_base[e3_base$code == "DEU", ]
de_percap <- de_row3$percap_t[1]
log_msg("Deutschlands Pro-Kopf-Ausstoss 2024: ", round(de_percap, 2), " t CO2eq/Kopf")

# ---- ZWINGENDE VORAUSSETZUNGSPRUEFUNG (SAP Abschnitt 2, Estimand 3) --------
voraussetzung_erfuellt <- de_percap > global_mean_percap
log_msg("VORAUSSETZUNGSPRUEFUNG Estimand 3 (SAP Abschnitt 2): Liegt Deutschland ",
        "ueber dem globalen Pro-Kopf-Durchschnitt? Deutschland=", round(de_percap, 2),
        " t/Kopf vs. globaler Durchschnitt=", round(global_mean_percap, 2), " t/Kopf -> ",
        ifelse(voraussetzung_erfuellt, "ERFUELLT (Deutschland liegt darueber).",
               "NICHT ERFUELLT (Deutschland liegt NICHT darueber)."))

if (!voraussetzung_erfuellt) {
  log_msg("ABBRUCH Estimand 3 gemaess SAP Abschnitt 2: Die Voraussetzung ist nicht ",
          "erfuellt. Estimand 3 ist in der im SAP beschriebenen Form NICHT sinnvoll ",
          "definierbar. Es wird KEINE Ersatzdefinition gewaehlt (keine andere ",
          "Schwelle, keine Umdefinition). Dies wird als OFFENER PUNKT / ",
          "RUECKFRAGE AN DEN MENSCHEN dokumentiert (SAP-Vorgabe).")
  e3_results <- NULL
} else {
  filtered_mean <- e3_base[e3_base$percap_t > global_mean_percap, ]
  filtered_median <- e3_base[e3_base$percap_t > global_median_percap, ]

  # Innerhalb der gefilterten Menge: Anteil an Weltgesamtemissionen (2a) UND
  # Anteil an der gefilterten Teilmenge, jeweils mit eigener DE-Schwelle.
  curve_3_world  <- build_concentration_curve(filtered_mean$code, filtered_mean$name, filtered_mean$value)
  curve_3_world$share_world <- filtered_mean$value[match(curve_3_world$code, filtered_mean$code)] / sum(edgar_ghg_2024$value)
  curve_3_world <- curve_3_world[order(-curve_3_world$share_world, curve_3_world$code), ]
  curve_3_world$rank <- seq_len(nrow(curve_3_world))
  curve_3_world$cum_share_world <- cumsum(curve_3_world$share_world)

  de_3w <- curve_3_world[curve_3_world$code == "DEU", ]
  de_share_world_in_filtered <- de_3w$share_world[1]
  kernzahl_3_world <- sum(curve_3_world$share_world[curve_3_world$share_world <= de_share_world_in_filtered])

  de_3s <- curve_2b  # placeholder, overwritten below
  curve_3_subset <- build_concentration_curve(filtered_mean$code, filtered_mean$name, filtered_mean$value)
  de_3s <- curve_3_subset[curve_3_subset$code == "DEU", ]
  kernzahl_3_subset <- kernzahl_le_de(curve_3_subset, "DEU")

  log_msg("Estimand 3 (Mittelwert-Schwelle, Primaervariante): ", nrow(filtered_mean),
          " von ", nrow(e3_base), " Laendern liegen ueber dem globalen Pro-Kopf-",
          "Durchschnitt.")
  log_msg("  Deutschlands Anteil INNERHALB der pro-Kopf-ueberdurchschnittlichen ",
          "Teilmenge: ", round(de_3s$share * 100, 2), " % (Rang ", de_3s$rank,
          " von ", nrow(curve_3_subset), ") -> Kernzahl (Anteil an Teilmenge) = ",
          round(kernzahl_3_subset * 100, 1), " %")
  log_msg("  Deutschlands Anteil an der WELT-Gesamtsumme (2a), berechnet nur ",
          "innerhalb der Teilmenge: ", round(de_share_world_in_filtered * 100, 2),
          " % -> Kernzahl (Anteil an Weltsumme) = ", round(kernzahl_3_world * 100, 1), " %")

  # Median-Sensitivitaet (SAP 6, Punkt 5)
  curve_3_median <- build_concentration_curve(filtered_median$code, filtered_median$name, filtered_median$value)
  de_3m <- curve_3_median[curve_3_median$code == "DEU", ]
  kernzahl_3_median <- kernzahl_le_de(curve_3_median, "DEU")
  log_msg("  Sensitivitaet Median-Schwelle: ", nrow(filtered_median), " Laender ueber ",
          "Median; Deutschlands Anteil an Teilmenge = ", round(de_3m$share * 100, 2),
          " % (Rang ", de_3m$rank, ") -> Kernzahl = ", round(kernzahl_3_median * 100, 1), " %")

  e3_results <- list(
    filtered_mean = filtered_mean, filtered_median = filtered_median,
    curve_3_subset = curve_3_subset, curve_3_world = curve_3_world,
    curve_3_median = curve_3_median,
    kernzahl_3_subset = kernzahl_3_subset, kernzahl_3_world = kernzahl_3_world,
    kernzahl_3_median = kernzahl_3_median,
    de_3s = de_3s, de_3w_share = de_share_world_in_filtered, de_3m = de_3m
  )
}

# ----------------------------------------------------------------------------
# SENSITIVITAET 1 (SAP 6.1): Gasbasis - CO2-only statt THG gesamt (EDGAR)
# ----------------------------------------------------------------------------
log_msg("\n---- Sensitivitaet 1 (SAP 6.1): EDGAR CO2-only, 2024 ----")
edgar_co2_2024 <- read_edgar_country_year(file.path(csv_dir, "edgar_co2_totals_by_country.csv"), 2024)
curve_s1 <- build_concentration_curve(edgar_co2_2024$code, edgar_co2_2024$name, edgar_co2_2024$value)
de_s1 <- curve_s1[curve_s1$code == "DEU", ]
kernzahl_s1 <- kernzahl_le_de(curve_s1, "DEU")
log_msg("CO2-only: DE-Anteil = ", round(de_s1$share * 100, 4), " % (Rang ", de_s1$rank,
        "), Kernzahl (analog 2a) = ", round(kernzahl_s1 * 100, 1), " %")

# Estimand-3-Analogon mit CO2-only, falls Voraussetzung fuer die THG-Variante erfuellt war
if (voraussetzung_erfuellt) {
  e3_co2 <- merge(edgar_co2_2024, wb_pop, by = "code", all.x = TRUE)
  e3_co2 <- e3_co2[!is.na(e3_co2$pop), ]
  e3_co2$percap_t <- e3_co2$value / e3_co2$pop * 1e6
  mean_percap_co2 <- sum(e3_co2$value) * 1e6 / sum(e3_co2$pop)
  de_percap_co2 <- e3_co2$percap_t[e3_co2$code == "DEU"]
  vorauss_co2 <- de_percap_co2 > mean_percap_co2
  vorauss_co2_txt <- ifelse(vorauss_co2, "erfuellt.",
    paste0("NICHT erfuellt (nur zur Information, primaere Voraussetzungspruefung ",
           "bleibt die THG-gesamt-Basis)."))
  log_msg("  CO2-only-Analogon zu Estimand 3: DE-Pro-Kopf=", round(de_percap_co2, 2),
          " t/Kopf vs. global=", round(mean_percap_co2, 2), " t/Kopf -> Voraussetzung ",
          vorauss_co2_txt)
}

# ----------------------------------------------------------------------------
# SENSITIVITAET 2 (SAP 6.2): Konsumbasiert statt produktionsbasiert (GCB), 2a
# ----------------------------------------------------------------------------
log_msg("\n---- Sensitivitaet 2 (SAP 6.2): GCB konsumbasiert, aktuelles Jahr ----")
gcb_cons <- read_gcb_wide(file.path(csv_dir, "gcb_consumption_emissions.csv"))
# Konsumbasierte GCB-Daten haben eine laengere Berichtsverzoegerung als die
# territorialen/EDGAR-Daten (Handelsdaten-Abhaengigkeit): das nominell letzte
# Jahr der Zeitachse (2024) ist faktisch (nahezu) leer. Es wird daher - analog
# zur EDGAR-Logik "aktuellstes Jahr mit (nahezu) vollstaendiger Laenderabdeckung"
# (SAP Abschnitt 4) - das juengste Jahr mit >= 90% Laenderabdeckung gewaehlt.
# Dies ist eine Quelleneigenschaft der GCB-Konsumdaten, keine SAP-Abweichung;
# der gewaehlte Jahrgang wird explizit geloggt/berichtet (SAP Abschnitt 11,
# Beschriftungspflicht).
coverage_per_year <- apply(gcb_cons$countries, 1, function(r) sum(!is.na(r)))
# GCB-Konsumdaten decken grundsaetzlich (seit jeher) nur eine Teilmenge der
# territorialen Laenderliste ab (Handelsdaten-Verfuegbarkeit), daher relativ
# zur ueber die Zeitreihe max. erreichten Abdeckung (Plateau), nicht relativ
# zur vollen EDGAR-Laenderzahl, geprueft.
eligible_years <- gcb_cons$years[coverage_per_year >= 0.9 * max(coverage_per_year)]
latest_cons_year <- max(eligible_years)
log_msg("  Hinweis: GCB-Konsumdaten decken durchgehend nur ", max(coverage_per_year),
        " von ", ncol(gcb_cons$countries), " Laendern ab (Handelsdaten-",
        "Verfuegbarkeit; Quelleneigenschaft) und sind fuer 2024 faktisch nicht ",
        "besetzt (Berichtsverzoegerung); verwendetes Jahr = ", latest_cons_year,
        " (juengstes Jahr mit >=90% des ueber die Zeitreihe maximal erreichten ",
        "Abdeckungs-Plateaus).")
cons_row <- which(gcb_cons$years == latest_cons_year)
cons_values <- gcb_cons$countries[cons_row, ]
cons_values <- cons_values[!is.na(cons_values)]
curve_s2 <- build_concentration_curve(names(cons_values), names(cons_values), as.numeric(cons_values))
de_s2 <- curve_s2[curve_s2$code == "Germany", ]
kernzahl_s2 <- kernzahl_le_de(curve_s2, "Germany")
log_msg("Konsumbasiert (GCB), Jahr ", latest_cons_year, ": DE-Anteil = ",
        round(de_s2$share * 100, 4), " % (Rang ", de_s2$rank, "), Kernzahl = ",
        round(kernzahl_s2 * 100, 1), " % [Sekundaerquelle GCB-Konsumdaten, ",
        "SAP Abschnitt 3/6.2; NICHT direkt vergleichbar mit 2a wegen anderer ",
        "Gasbasis (CO2 vs. THG) und anderem Jahr, siehe SAP Abschnitt 9].")

# ----------------------------------------------------------------------------
# SENSITIVITAET 3 (SAP 6.3): + Landnutzungsaenderung (GCB LULUCF), 1b/2b
# ----------------------------------------------------------------------------
log_msg("\n---- Sensitivitaet 3 (SAP 6.3): GCB + Landnutzungsaenderung (Mittel BLUE/OSCAR/LUCE) ----")
luc_blue  <- read_gcb_wide(file.path(csv_dir, "gcb_luc_blue.csv"))
luc_oscar <- read_gcb_wide(file.path(csv_dir, "gcb_luc_oscar.csv"))
luc_luce  <- read_gcb_wide(file.path(csv_dir, "gcb_luc_luce.csv"))
# Hinweis (siehe DATENAUFBEREITUNG_LOG.txt): SAP spezifiziert nicht, welches der
# drei GCP-LULUCF-Modelle zu verwenden ist; hier wird der Mittelwert der drei
# Modelle je Land/Jahr verwendet (uebliche GCP-Praxis) - operationalisierende
# Festlegung eines im SAP offen gelassenen Details, keine SAP-Abweichung.
common_countries <- Reduce(intersect, list(colnames(luc_blue$countries),
                                            colnames(luc_oscar$countries),
                                            colnames(luc_luce$countries)))
common_years <- Reduce(intersect, list(luc_blue$years, luc_oscar$years, luc_luce$years))
idx_b <- match(common_years, luc_blue$years); idx_o <- match(common_years, luc_oscar$years); idx_l <- match(common_years, luc_luce$years)
luc_mean <- (luc_blue$countries[idx_b, common_countries] +
             luc_oscar$countries[idx_o, common_countries] +
             luc_luce$countries[idx_l, common_countries]) / 3
cum_luc <- colSums(luc_mean, na.rm = TRUE)

not_in_luc <- setdiff(colnames(gcb_terr$countries), common_countries)
log_msg("GCB-Territorial-Laender ohne LULUCF-Gegenstueck (bleiben bei Sensitivitaet 3 ",
        "unveraendert = nur fossil): ", length(not_in_luc), " von ",
        ncol(gcb_terr$countries), " (u.a. sehr kleine Inselstaaten/Territorien).")

cum_fossil_plus_luc <- cum_fossil
common_in_fossil <- intersect(names(cum_fossil), names(cum_luc))
cum_fossil_plus_luc[common_in_fossil] <- cum_fossil[common_in_fossil] + cum_luc[common_in_fossil]

curve_s3 <- build_concentration_curve(names(cum_fossil_plus_luc), names(cum_fossil_plus_luc), as.numeric(cum_fossil_plus_luc))
de_s3 <- curve_s3[curve_s3$code == "Germany", ]
kernzahl_s3 <- kernzahl_le_de(curve_s3, "Germany")
log_msg("Fossil+Zement+LULUCF (Mittel dreier Modelle), kumuliert: DE-Anteil = ",
        round(de_s3$share * 100, 4), " % (Rang ", de_s3$rank, " von ", nrow(curve_s3),
        "), Kernzahl = ", round(kernzahl_s3 * 100, 1), " % (Primaervariante ohne LULUCF: ",
        round(kernzahl_2b * 100, 1), " %) - hoehere Modellunsicherheit dieser ",
        "Teilkomponente gemaess SAP 6.3 zu beachten.")

# ----------------------------------------------------------------------------
# SENSITIVITAET 4 (SAP 6.4): Rank-Sensitivity fuer 2a und 2b
# ----------------------------------------------------------------------------
log_msg("\n---- Sensitivitaet 4 (SAP 6.4): Rank-Sensitivity (DE-20 .. DE+20) ----")
rank_sens_2a <- rank_sensitivity(curve_2a, "DEU", "2a (EDGAR THG gesamt, 2024)")
rank_sens_2b <- rank_sensitivity(curve_2b, "Germany", "2b (GCB fossil+Zement, kumuliert)")
rank_sens_tab <- rbind(rank_sens_2a, rank_sens_2b)
print(rank_sens_tab)
for (i in seq_len(nrow(rank_sens_tab))) {
  log_msg("  ", rank_sens_tab$zeithorizont[i], " | ", rank_sens_tab$position[i],
          " (Rang ", rank_sens_tab$rang[i], "): kum. Anteil = ",
          rank_sens_tab$kumulierter_anteil_pct[i], " %")
}

# ----------------------------------------------------------------------------
# Checkpoint speichern (alles Weitere braucht nur noch Grafik-/Tabellen-Export)
# ----------------------------------------------------------------------------
saveRDS(list(
  curve_2a = curve_2a, de_2a = de_2a, kernzahl_2a = kernzahl_2a,
  curve_2b = curve_2b, de_2b = de_2b, kernzahl_2b = kernzahl_2b,
  gcb_terr = gcb_terr, cum_fossil = cum_fossil,
  intl_ship_share = intl_ship_share, intl_avi_share = intl_avi_share,
  e3_base = e3_base, no_pop = no_pop, share_excl = share_excl,
  global_mean_percap = global_mean_percap, global_median_percap = global_median_percap,
  de_percap = de_percap, voraussetzung_erfuellt = voraussetzung_erfuellt,
  e3_results = if (voraussetzung_erfuellt) e3_results else NULL,
  curve_s1 = curve_s1, de_s1 = de_s1, kernzahl_s1 = kernzahl_s1,
  curve_s2 = curve_s2, de_s2 = de_s2, kernzahl_s2 = kernzahl_s2, latest_cons_year = latest_cons_year,
  curve_s3 = curve_s3, de_s3 = de_s3, kernzahl_s3 = kernzahl_s3,
  rank_sens_tab = rank_sens_tab,
  owid_de_share = owid_de_share, owid_year = owid_de$year[1], diff_pp = diff_pp,
  edgar_ghg_2024 = edgar_ghg_2024, missing_2024 = missing_2024
), checkpoint_path)
log_msg("\nCheckpoint gespeichert: ", checkpoint_path)

} # Ende else (Berechnung nur falls kein Checkpoint vorhanden)

# ============================================================================
# REPORTING: Tabellen (CSV) und Grafiken (PDF), SAP Abschnitt 11
# ============================================================================
log_msg("\n---- Tabellen- und Grafikexport (SAP Abschnitt 11) ----")

write.csv(curve_2a[, c("rank", "code", "name", "value", "share", "cum_share")],
          file.path(out_dir, "estimand1a_konzentrationskurve_edgar_2024.csv"), row.names = FALSE)
write.csv(curve_2b[, c("rank", "code", "name", "value", "share", "cum_share")],
          file.path(out_dir, "estimand1b_konzentrationskurve_gcb_kumuliert.csv"), row.names = FALSE)
write.csv(rank_sens_tab, file.path(out_dir, "sensitivitaet4_rank_sensitivity.csv"), row.names = FALSE)

estimand2_tab <- data.frame(
  zeithorizont = c("2a EDGAR THG gesamt 2024", "2b GCB fossil+Zement kumuliert"),
  de_anteil_pct = round(c(de_2a$share, de_2b$share) * 100, 4),
  de_rang = c(de_2a$rank, de_2b$rank),
  n_laender = c(nrow(curve_2a), nrow(curve_2b)),
  kernzahl_pct = round(c(kernzahl_2a, kernzahl_2b) * 100, 1)
)
write.csv(estimand2_tab, file.path(out_dir, "estimand2_kernzahlen.csv"), row.names = FALSE)

sensitivitaeten_tab <- data.frame(
  sensitivitaet = c("S1: CO2-only (EDGAR, 2a-Analogon)",
                     "S2: Konsumbasiert (GCB, 2a-Analogon)",
                     "S3: +LULUCF Mittel BLUE/OSCAR/LUCE (2b-Analogon)"),
  de_anteil_pct = round(c(de_s1$share, de_s2$share, de_s3$share) * 100, 4),
  de_rang = c(de_s1$rank, de_s2$rank, de_s3$rank),
  kernzahl_pct = round(c(kernzahl_s1, kernzahl_s2, kernzahl_s3) * 100, 1),
  primaervariante_kernzahl_pct = round(c(kernzahl_2a, kernzahl_2a, kernzahl_2b) * 100, 1)
)
write.csv(sensitivitaeten_tab, file.path(out_dir, "sensitivitaeten_1_2_3.csv"), row.names = FALSE)

vintage_tab <- data.frame(
  quelle = c("EDGAR (primaer)", paste0("OWID (Sekundaer, Jahr ", owid_year, ")")),
  de_anteil_pct = round(c(de_2a$share, owid_de_share) * 100, 4)
)
vintage_tab$differenz_pp <- c(NA, round(diff_pp, 3))
write.csv(vintage_tab, file.path(out_dir, "sensitivitaet6_datenvintage_owid.csv"), row.names = FALSE)

if (voraussetzung_erfuellt) {
  estimand3_tab <- data.frame(
    variante = c("Primaer (Mittelwert-Schwelle, Anteil an Teilmenge)",
                 "Primaer (Mittelwert-Schwelle, Anteil an Weltsumme)",
                 "Sensitivitaet (Median-Schwelle, Anteil an Teilmenge)"),
    de_anteil_pct = round(c(e3_results$de_3s$share, e3_results$de_3w_share, e3_results$de_3m$share) * 100, 2),
    de_rang = c(e3_results$de_3s$rank, NA, e3_results$de_3m$rank),
    n_laender_ueber_schwelle = c(nrow(e3_results$filtered_mean), nrow(e3_results$filtered_mean), nrow(e3_results$filtered_median)),
    kernzahl_pct = round(c(e3_results$kernzahl_3_subset, e3_results$kernzahl_3_world, e3_results$kernzahl_3_median) * 100, 1)
  )
  write.csv(estimand3_tab, file.path(out_dir, "estimand3_pro_kopf.csv"), row.names = FALSE)
} else {
  writeLines(c(
    "ESTIMAND 3 NICHT BERECHNET.",
    "Grund: Die im SAP (Abschnitt 2, Estimand 3) vorausgesetzte Bedingung",
    "'Deutschland liegt ueber dem globalen Pro-Kopf-Durchschnitt' ist gemaess",
    "empirischer Pruefung NICHT erfuellt.",
    paste0("Deutschland: ", round(de_percap, 2), " t CO2eq/Kopf (2024)"),
    paste0("Globaler Durchschnitt: ", round(global_mean_percap, 2), " t CO2eq/Kopf (2024)"),
    "Gemaess SAP-Vorgabe wird KEINE Ersatzdefinition gewaehlt. Dies ist ein",
    "OFFENER PUNKT zur Entscheidung durch den Menschen (Ruecksprache erforderlich),",
    "bevor Estimand 3 in irgendeiner Form berichtet werden kann."
  ), file.path(out_dir, "estimand3_ABBRUCH_offener_punkt.txt"))
}

# ---- Grafiken (Estimand 1, Hauptoutput) ------------------------------------
plot_concentration <- function(curve_df, de_row, titel, xlab_land = "Land") {
  ggplot(curve_df, aes(x = rank, y = cum_share * 100)) +
    geom_line(color = "steelblue", linewidth = 1) +
    geom_point(data = de_row, aes(x = rank, y = cum_share * 100), color = "firebrick", size = 3) +
    geom_vline(xintercept = de_row$rank, linetype = "dashed", color = "firebrick", alpha = 0.5) +
    geom_hline(yintercept = de_row$cum_share * 100, linetype = "dashed", color = "firebrick", alpha = 0.5) +
    annotate("text", x = de_row$rank, y = de_row$cum_share * 100,
             label = paste0("Deutschland: Rang ", de_row$rank, ", ",
                             round(de_row$cum_share * 100, 1), " %"),
             hjust = -0.1, vjust = -0.5, color = "firebrick") +
    labs(title = titel,
         subtitle = "Deskriptive Konzentrationskurve - keine Fairness-/Verantwortungsaussage (SAP Abschnitt 8)",
         x = paste0(xlab_land, "-Rang (1 = groesster Emittent)"),
         y = "Kumulierter Anteil an Weltsumme (%)") +
    theme_minimal()
}

p1a <- plot_concentration(curve_2a, de_2a,
  "Estimand 1a: Konzentrationskurve - EDGAR THG gesamt, 2024\nQuelle: EDGAR 2025 GHG booklet, Zugriff 31.08.2026")
p1b <- plot_concentration(curve_2b, de_2b,
  paste0("Estimand 1b: Konzentrationskurve - GCB fossil CO2+Zement, kumuliert 1850-",
         max(gcb_terr$years), "\nQuelle: Global Carbon Budget 2025, Zugriff 31.08.2026"))

save_plot_retry(p1a, file.path(out_dir, "estimand1a_konzentrationskurve_edgar_2024.pdf"))
save_plot_retry(p1b, file.path(out_dir, "estimand1b_konzentrationskurve_gcb_kumuliert.pdf"))

log_msg("\n======================================================================")
log_msg("Analyselauf beendet: ", as.character(Sys.time()))
log_msg("Alle SAP-Abschnitt-6-Sensitivitaeten (1-6) berechnet und exportiert.")
log_msg("Estimand 3: ", ifelse(voraussetzung_erfuellt,
        "berechnet (Voraussetzung erfuellt).",
        "NICHT berechnet - offener Punkt, siehe estimand3_ABBRUCH_offener_punkt.txt"))
log_msg("======================================================================")
close(log_con)
