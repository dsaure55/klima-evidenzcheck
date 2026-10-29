# =============================================================================
# Ausbaupfad Wind an Land und Solar - Fortschreibung des MaStR-Bestands
# Umsetzung des eingefrorenen SAP
#   SAP-Datei   : SAP_ausbaupfad-wind-solar.md
#   SAP-Version : 1.0 (eingefroren; Inhalt entspricht v0.3 + Freigabevermerk)
#   SAP-Status  : final (eingefroren am 29.10.2026)
#   Freigabe    : Daniel Saure, 29.10.2026 (SAP Kopf, Zeile "Freigabe")
#   Datenstand  : MaStR Gesamtdatenexport 20261029_26.2 (Stand 29.10.2026 00:00)
#   Skript      : analyst-Subagent, Lauf vom 29.10.2026
#   R-Version   : siehe run_log.txt (sessionInfo)
#
# Abweichungen vom SAP / Rueckfragen an Mensch: siehe
#   Abweichungsprotokoll_ausbaupfad-wind-solar.md (jede Abweichung, auch kleine,
#   ist dort und hier an der betreffenden Stelle mit "POST-HOC" gekennzeichnet).
#
# Aufbau (Abschnittsnummern = SAP-Abschnitte):
#   SAP 3.1   Pruefsummen-Abgleich der XML-Dateien
#   SAP 3.6   Einlesen (Streaming, UTF-16) von Wind, Solar, Geloeschte/Deaktivierte
#   SAP 3.5/9 Katalog-Aufloesung und Zuordnungstabelle der Codes
#   SAP 3.5   Bereinigungsregeln, Datenfluss (Tabelle 1)
#   SAP 3.4   Bestand C(tau,m), Zubau Z, Stilllegung S, Rechenprobe
#   SAP 3.3/3.5 Nr.2/Nr.12 Stopp-Regeln (Groessenordnung, 1 %, 0,5 %)
#   SAP 2.3 ff. E1-E5, 5.1-5.3 Regression, Diagnostik, Robustheit, 6 Sensitivitaeten, 11 Tabellen/Grafiken
#   (nur wenn keine Stopp-Regel ausgeloest wurde; sonst Ende nach "Ergebnis der Vorpruefungen")
#
# Aufruf: Rscript ausbaupfad-wind-solar.R   (kein Netzzugriff)
# Umgebungsvariablen (optional): AUSBAU_CACHE = Ordner fuer die schlanken
#   Einheiten-Extrakte (ausserhalb von Git), AUSBAU_WORKERS = Anzahl Prozesse.
# =============================================================================

options(stringsAsFactors = FALSE, warn = 1, scipen = 999)
suppressWarnings(Sys.setlocale("LC_COLLATE", "C"))

# ---- Pfade ---------------------------------------------------------------
args_all <- commandArgs(FALSE)
f_arg <- sub("^--file=", "", args_all[grepl("^--file=", args_all)])
BASE <- if (length(f_arg)) dirname(normalizePath(f_arg[1], winslash = "/")) else
  "C:/Users/dsaur/klima-evidenzcheck/Analysen/2026-10-ausbaupfad-wind-solar"
RAW  <- file.path(BASE, "rohdaten")
OUT  <- file.path(BASE, "output")
ZW   <- file.path(OUT, "zwischen")
LST  <- file.path(OUT, "listen")
CACHE <- Sys.getenv("AUSBAU_CACHE", file.path(ZW, "cache_extrakt"))
NWORK <- as.integer(Sys.getenv("AUSBAU_WORKERS", "4"))
for (d in c(OUT, ZW, LST, CACHE)) dir.create(d, showWarnings = FALSE, recursive = TRUE)
LOGF <- file.path(BASE, "run_log.txt")

LOGMODE <- Sys.getenv("AUSBAU_LOGAPPEND", "0")
if (LOGMODE != "1") writeLines(character(0), LOGF)
logm <- function(...) {
  s <- paste0(format(Sys.time(), "%H:%M:%S"), "  ", paste0(..., collapse = ""))
  cat(s, "\n", sep = ""); cat(s, "\n", sep = "", file = LOGF, append = TRUE)
}
logsec <- function(t) logm("\n==== ", t, " ====")
write_csv <- function(x, name, dir = OUT) {
  write.csv(x, file.path(dir, name), row.names = FALSE, na = "", fileEncoding = "UTF-8")
}
STOPS <- character(0)
stopp <- function(sap, msg) {
  STOPS <<- c(STOPS, paste0("[SAP ", sap, "] ", msg))
  logm("STOPP-REGEL AUSGELOEST [SAP ", sap, "]: ", msg)
}

logm("Ausbaupfad Wind/Solar - Lauf gestartet")
logm("SAP v1.0, Status final (eingefroren 29.10.2026), Freigabe Daniel Saure 29.10.2026")
logm("Skript: ", file.path(BASE, "ausbaupfad-wind-solar.R"))
logm("Cache-Ordner (schlanke Extrakte, nicht in Git): ", CACHE)
logm("\n-- sessionInfo() --")
si <- capture.output(print(sessionInfo()))
for (l in si) logm(l)
writeLines(si, file.path(OUT, "sessionInfo.txt"))
for (p in c("xml2", "lmtest", "sandwich", "ggplot2", "digest"))
  logm("Paket ", p, " ", as.character(packageVersion(p)))
logm("Nicht installiert (SAP 10 'voraussichtlich'): data.table, lubridate -> Base R/xml2 statt dessen (Wahl dokumentiert, keine Abweichung der Methodik).")

# ---- Konstanten aus dem SAP (2.1, 2.2) ------------------------------------
mi <- function(y, m) y * 12L + (m - 1L)               # Monatsindex
mi_year  <- function(i) i %/% 12L
mi_month <- function(i) i %% 12L + 1L
mi_lab   <- function(i) sprintf("%04d-%02d", mi_year(i), mi_month(i))
mi_end_day <- function(i) as.integer(as.Date(sprintf("%04d-%02d-01", mi_year(i + 1L), mi_month(i + 1L)))) - 1L

EXPORT_DATE  <- as.Date("2026-10-29")                 # SAP 2.1
EXPORT_M     <- mi(2026L, 10L)
T_M          <- EXPORT_M - 3L                         # SAP 2.1: drei Kalendermonate vor Exportmonat
T_S1         <- EXPORT_M - 1L                         # SAP 2.1: letzter vollstaendiger Monat vor Exportdatum
stopifnot(mi_lab(T_M) == "2026-07", mi_lab(T_S1) == "2026-09")
logm("Exportdatum ", EXPORT_DATE, "; T = ", mi_lab(T_M), "; T_S1 = ", mi_lab(T_S1))
XD <- as.integer(EXPORT_DATE)                         # Exportdatum als Tageszahl

ZIELE <- data.frame(
  Jahr = c(2024, 2026, 2028, 2030, 2035, 2040),
  Wind = c(69, 84, 99, 115, 157, 160),                # SAP 2.2, GW
  Solar = c(88, 128, 172, 215, 309, 400))
SEE_ZIELE <- data.frame(Jahr = c(2030, 2035, 2045), See = c(30, 40, 70))   # SAP 2.2 (WindSeeG)
Y <- function(tech, jahr) {
  if (tech == "See") return(SEE_ZIELE$See[SEE_ZIELE$Jahr == jahr])
  ZIELE[[tech]][ZIELE$Jahr == jahr]
}
FENSTER <- c(12L, 24L, 60L)

# ===========================================================================
# SAP 3.1: Pruefsummen-Abgleich (SHA-256 je XML-Datei)
# ===========================================================================
logsec("SAP 3.1 Eingabedateien und Pruefsummen")
ps <- readLines(file.path(RAW, "PRUEFSUMMEN_xml_2026-10-29.txt"), warn = FALSE)
ps_nichtzeilen <- ps[nzchar(trimws(ps)) & !grepl("^[0-9a-fA-F]{64} [*]", ps)]
for (z in ps_nichtzeilen) logm("Zeile in PRUEFSUMMEN ohne SHA-256 (ignoriert): ", z)
ps <- ps[grepl("^[0-9a-fA-F]{64} [*]", ps)]
ps <- data.frame(sha_soll = tolower(sub(" .*$", "", ps)),
                 datei = sub("^[0-9a-fA-F]+ \\*?", "", ps))
logm("PRUEFSUMMEN_xml_2026-10-29.txt: ", nrow(ps), " Eintraege, ", length(unique(ps$datei)), " verschiedene Dateien")
dups <- ps$datei[duplicated(ps$datei)]
for (d in dups) {
  logm("Datei mit mehrfachem Eintrag: ", d, "; identische Summen: ",
       length(unique(ps$sha_soll[ps$datei == d])) == 1L)
}
ps_u <- ps[!duplicated(ps$datei), ]
ps_u$pfad <- file.path(RAW, ps_u$datei)
ps_u$vorhanden <- file.exists(ps_u$pfad)
ps_u$groesse_byte <- ifelse(ps_u$vorhanden, file.size(ps_u$pfad), NA)
xml_im_ordner <- list.files(RAW, pattern = "\\.xml$")
logm("XML-Dateien im Ordner rohdaten/: ", length(xml_im_ordner),
     "; davon nicht in Pruefsummenliste: ", paste(setdiff(xml_im_ordner, ps_u$datei), collapse = ", "))
logm("In Pruefsummenliste, aber nicht im Ordner: ", paste(ps_u$datei[!ps_u$vorhanden], collapse = ", "))

PS_RES <- file.path(ZW, "pruefsummen_ergebnis.csv")
if (Sys.getenv("AUSBAU_PS_NEU", "0") != "1" && file.exists(PS_RES) &&
    nrow(read.csv(PS_RES)) == nrow(ps_u)) {
  logm("Pruefsummen-Ergebnis aus frueherem Lauf dieser Session uebernommen (", PS_RES, ")")
  psr <- read.csv(PS_RES, colClasses = "character")
} else {
  logm("Berechne SHA-256 (Streaming durch digest) fuer ", nrow(ps_u), " Dateien, ",
       sprintf("%.1f", sum(ps_u$groesse_byte, na.rm = TRUE) / 1e9), " GB ...")
  library(parallel)
  cl <- makeCluster(NWORK)
  sha <- parSapply(cl, ps_u$pfad, function(p) if (file.exists(p)) digest::digest(p, algo = "sha256", file = TRUE) else NA_character_, USE.NAMES = FALSE)
  stopCluster(cl)
  psr <- data.frame(datei = ps_u$datei, groesse_byte = ps_u$groesse_byte,
                    sha_soll = ps_u$sha_soll, sha_ist = tolower(sha),
                    stringsAsFactors = FALSE)
  psr$uebereinstimmung <- ifelse(is.na(psr$sha_ist), "FEHLT", ifelse(psr$sha_ist == psr$sha_soll, "ja", "NEIN"))
  write.csv(psr, PS_RES, row.names = FALSE)
}
psr$groesse_byte <- as.numeric(psr$groesse_byte)
write_csv(psr, "pruefsummen_abgleich.csv")
logm("Pruefsummen: ", sum(psr$uebereinstimmung == "ja"), " von ", nrow(psr), " Dateien stimmen ueberein; Abweichungen/fehlend: ",
     sum(psr$uebereinstimmung != "ja"))
if (any(psr$uebereinstimmung != "ja")) {
  logm("ABWEICHENDE PRUEFSUMMEN: ", paste(psr$datei[psr$uebereinstimmung != "ja"], collapse = ", "))
  stopp("3.1", "SHA-256 weicht ab oder Datei fehlt (Rohdaten nicht unversehrt) - Rueckfrage an Daniel Saure.")
}
logm("Eingabedateien (Name, Groesse in Byte):")
for (i in seq_len(nrow(psr))) logm(sprintf("   %-48s %14.0f  SHA-256 %s", psr$datei[i], psr$groesse_byte[i], psr$uebereinstimmung[i]))
logm("Summe Groesse (verschiedene Dateien der Pruefsummenliste): ", sprintf("%.2f GB", sum(psr$groesse_byte) / 1e9))
if (length(STOPS)) {
  logm("ABBRUCH wegen Pruefsummen."); quit(save = "no", status = 3)
}

# ===========================================================================
# SAP 3.5 Nr.9 / 3.6: Kataloge (Katalogwerte, Katalogkategorien, Einheitentypen)
# ===========================================================================
logsec("SAP 3.5 Nr.9 Kataloge")
library(xml2)
read_flat <- function(file, node) {
  d <- read_xml(file.path(RAW, file)); n <- xml_find_all(d, paste0("//", node))
  cols <- unique(unlist(lapply(xml_children(n[[1]]), xml_name)))
  as.data.frame(sapply(cols, function(cn) xml_text(xml_find_first(n, cn))), stringsAsFactors = FALSE)
}
KW <- read_flat("Katalogwerte.xml", "Katalogwert")
KK <- read_flat("Katalogkategorien.xml", "Katalogkategorie")
ET <- read_flat("Einheitentypen.xml", "Einheitentyp")
logm("Katalogwerte: ", nrow(KW), " Zeilen; Katalogkategorien: ", nrow(KK), "; Einheitentypen: ", nrow(ET))
logm("Ids in Katalogwerte eindeutig: ", !anyDuplicated(KW$Id))
KW$KatName <- KK$Name[match(KW$KatalogKategorieId, KK$Id)]
lab_of <- function(code) KW$Wert[match(as.character(code), KW$Id)]
cat_of <- function(code) KW$KatName[match(as.character(code), KW$Id)]
logm("Hinweis Doku vs. Export: Die Dokumentation nennt die Katalogkategorien 'Anlagenbetriebsstatus' und 'AnlagenSystemStatus'; ",
     "im Export heissen sie '", KK$Name[KK$Id == 4], "' (Id 4) und '", KK$Name[KK$Id == 19], "' (Id 19); die Lage heisst '",
     KK$Name[KK$Id == 87], "' (Id 87). Das ist ein Befund der Aufloesung nach 3.5 Nr.9, kein Stopp.")
ET_wind <- ET$Id[grepl("^Windeinheit$", ET$Wert)]; ET_solar <- ET$Id[grepl("^Solareinheit$", ET$Wert)]
logm("Einheitentyp-Id Windeinheit = ", ET_wind, "; Solareinheit = ", ET_solar)

# ===========================================================================
# SAP 3.6 / 10: Streaming-Einlesen der XML-Dateien (UTF-16LE mit BOM)
# ===========================================================================
logsec("SAP 3.6 Einlesen der Einheitendateien (Streaming)")

# Chunk-weises Lesen: Rohbytes -> UTF-8 -> Aufspaltung an </Satz> -> Felder per Regex
read_units <- function(path, rec_tag, fields, chunk_bytes = 48e6) {
  con <- file(path, "rb"); on.exit(close(con))
  bom <- readBin(con, "raw", 2); stopifnot(identical(bom, as.raw(c(0xff, 0xfe))))
  close_tag <- paste0("</", rec_tag, ">"); open_tag <- paste0("<", rec_tag, ">")
  carry_raw <- raw(0); carry_txt <- ""; res <- list(); n_rec <- 0; n_open <- 0
  getf <- function(recs, f) {
    m <- regexpr(paste0("<", f, ">[^<]*</", f, ">"), recs, perl = TRUE)
    out <- rep(NA_character_, length(recs)); hit <- m != -1L
    if (any(hit)) { x <- regmatches(recs, m); out[hit] <- substr(x, nchar(f) + 3L, nchar(x) - nchar(f) - 3L) }
    out
  }
  repeat {
    r <- readBin(con, "raw", chunk_bytes); eof <- length(r) < chunk_bytes
    r <- c(carry_raw, r); carry_raw <- raw(0)
    if (!eof && length(r) >= 2 && as.integer(r[length(r)]) >= 0xD8 && as.integer(r[length(r)]) <= 0xDB) {
      carry_raw <- r[(length(r) - 1):length(r)]; r <- r[seq_len(length(r) - 2)]   # Surrogat nicht trennen
    }
    txt <- iconv(list(r), "UTF-16LE", "UTF-8"); rm(r)
    if (is.na(txt)) stop("iconv-Fehler (ungueltige UTF-16-Sequenz) in ", path)
    txt <- paste0(carry_txt, txt)
    parts <- strsplit(txt, close_tag, fixed = TRUE)[[1]]; ends <- endsWith(txt, close_tag); rm(txt)
    if (!ends) { carry_txt <- parts[length(parts)]; parts <- parts[-length(parts)] } else carry_txt <- ""
    # Zaehlprobe: jedes Element muss genau ein Oeffnungs-Tag enthalten
    has_open <- grepl(open_tag, parts, fixed = TRUE)
    if (eof) { if (any(!has_open) && !(sum(!has_open) == 1L && grepl("^</[A-Za-z]+>\\s*$", parts[!has_open]))) stop("Unerwartete Struktur am Dateiende: ", path) }
    else if (any(!has_open)) stop("Datensatz ohne Oeffnungs-Tag: ", path)
    parts <- parts[has_open]
    two_open <- lengths(gregexpr(open_tag, parts, fixed = TRUE)) != 1L
    if (any(two_open)) stop("Datensatz mit mehreren Oeffnungs-Tags (fehlendes Schluss-Tag): ", path)
    n_rec <- n_rec + length(parts)
    if (length(parts)) res[[length(res) + 1L]] <- as.data.frame(
      setNames(lapply(fields, function(f) getf(parts, f)), fields), stringsAsFactors = FALSE)
    rm(parts)
    if (eof) break
  }
  if (nzchar(carry_txt) && grepl(open_tag, carry_txt, fixed = TRUE)) stop("Unvollstaendiger letzter Datensatz: ", path)
  out <- do.call(rbind, res); attr(out, "n_records") <- n_rec; out
}

num_id <- function(x, pre) {
  ok <- grepl(paste0("^", pre, "[0-9]{12}$"), x); r <- rep(NA_real_, length(x))
  r[ok] <- as.numeric(substr(x[ok], 4, 15)); r
}
dt_int <- function(x) {
  ok <- grepl("^[0-9]{4}-[0-9]{2}-[0-9]{2}", x); r <- rep(NA_integer_, length(x))
  r[ok] <- as.integer(as.Date(substr(x[ok], 1, 10), format = "%Y-%m-%d"))
  r
}
ts_num <- function(x) as.numeric(gsub("[^0-9]", "", substr(x, 1, 19)))

FIELDS_E <- c("EinheitMastrNummer", "DatumLetzteAktualisierung", "LokationMaStRNummer",
              "Inbetriebnahmedatum", "DatumEndgueltigeStilllegung",
              "EinheitSystemstatus", "EinheitBetriebsstatus", "Bruttoleistung", "Nettonennleistung")
FIELDS_WIND <- c(FIELDS_E, "WindAnLandOderAufSee", "Seelage")
FIELDS_SOLAR <- c(FIELDS_E, "ArtDerSolaranlage")
FIELDS_G <- c("EinheitMastrNummer", "DatumLetzteAktualisierung", "Einheittyp", "EinheitSystemstatus",
              "EinheitBetriebsstatus", "DatumDerLoeschung", "EinheitLoeschgrund")

extract_one <- function(job) {
  # job: list(file, rec_tag, fields, kind, cachefile)
  if (file.exists(job$cachefile)) return(readRDS(job$cachefile))
  raw <- read_units(job$file, job$rec_tag, job$fields)
  st <- list(datei = basename(job$file), n_records = attr(raw, "n_records"))
  if (job$kind == "G") {
    d <- data.frame(nr = num_id(raw$EinheitMastrNummer, "SEE"), upd = ts_num(raw$DatumLetzteAktualisierung),
                    typ = as.integer(raw$Einheittyp), sys = as.integer(raw$EinheitSystemstatus),
                    bs = as.integer(raw$EinheitBetriebsstatus), dloesch = dt_int(raw$DatumDerLoeschung),
                    grund = as.integer(raw$EinheitLoeschgrund))
    st$bad_nr <- sum(is.na(d$nr)); st$nr_nonSEE <- sum(is.na(d$nr) & !is.na(raw$EinheitMastrNummer))
    st$nr_ex <- paste(utils::head(raw$EinheitMastrNummer[is.na(d$nr)], 3), collapse = "|")
  } else {
    d <- data.frame(nr = num_id(raw$EinheitMastrNummer, "SEE"), lok = num_id(raw$LokationMaStRNummer, "SEL"),
                    upd = ts_num(raw$DatumLetzteAktualisierung),
                    ibn = dt_int(raw$Inbetriebnahmedatum), still = dt_int(raw$DatumEndgueltigeStilllegung),
                    sys = as.integer(raw$EinheitSystemstatus), bs = as.integer(raw$EinheitBetriebsstatus),
                    brutto = suppressWarnings(as.numeric(raw$Bruttoleistung)),
                    netto = suppressWarnings(as.numeric(raw$Nettonennleistung)))
    if (job$kind == "wind") { d$lage <- as.integer(raw$WindAnLandOderAufSee); d$seelage <- as.integer(raw$Seelage) }
    if (job$kind == "solar") d$art <- as.integer(raw$ArtDerSolaranlage)
    st$bad_nr <- sum(is.na(d$nr)); st$bad_lok <- sum(is.na(d$lok) & !is.na(raw$LokationMaStRNummer))
    st$ibn_text_ohne_datum <- sum(is.na(d$ibn) & !is.na(raw$Inbetriebnahmedatum))
    st$still_text_ohne_datum <- sum(is.na(d$still) & !is.na(raw$DatumEndgueltigeStilllegung))
    st$brutto_nicht_numerisch <- sum(is.na(d$brutto) & !is.na(raw$Bruttoleistung))
    st$netto_nicht_numerisch <- sum(is.na(d$netto) & !is.na(raw$Nettonennleistung))
    st$brutto_fehlt <- sum(is.na(raw$Bruttoleistung)); st$netto_fehlt <- sum(is.na(raw$Nettonennleistung))
  }
  res <- list(d = d, st = st)
  saveRDS(res, job$cachefile, compress = FALSE)
  res
}

mkjobs <- function(files, rec_tag, fields, kind) lapply(files, function(f)
  list(file = file.path(RAW, f), rec_tag = rec_tag, fields = fields, kind = kind,
       cachefile = file.path(CACHE, paste0(sub("\\.xml$", "", f), "_", kind, ".rds"))))
JOBS <- c(mkjobs("EinheitenWind.xml", "EinheitWind", FIELDS_WIND, "wind"),
          mkjobs(paste0("EinheitenSolar_", 1:67, ".xml"), "EinheitSolar", FIELDS_SOLAR, "solar"),
          mkjobs(paste0("GeloeschteUndDeaktivierteEinheiten_", 1:3, ".xml"), "GeloeschteUndDeaktivierteEinheit", FIELDS_G, "G"))
logm("Einzulesende Dateien: 1 Wind, 67 Solar, 3 Geloeschte/Deaktivierte (", length(JOBS), " Jobs)")
ncached <- sum(file.exists(vapply(JOBS, `[[`, "", "cachefile")))
logm("Davon bereits als schlanker Extrakt im Cache (frueherer Lauf): ", ncached)

library(parallel)
cl <- makeCluster(NWORK)
clusterExport(cl, c("read_units", "num_id", "dt_int", "ts_num", "extract_one"))
t0 <- Sys.time()
# Grosse Dateien zuerst (Lastverteilung); Ergebnisse in Originalreihenfolge
ord <- order(-vapply(JOBS, function(j) file.size(j$file), 0))
RES <- vector("list", length(JOBS))
RES[ord] <- parLapplyLB(cl, JOBS[ord], function(j) tryCatch(extract_one(j), error = function(e) list(error = conditionMessage(e), file = j$file)))
stopCluster(cl)
logm("Einlesen abgeschlossen in ", format(round(difftime(Sys.time(), t0, units = "mins"), 1)))
errs <- Filter(function(r) !is.null(r$error), RES)
if (length(errs)) {
  for (e in errs) logm("FEHLER beim Einlesen ", e$file, ": ", e$error)
  stopp("3.5 Nr.12 e / 3.6", "Mindestens eine Datei war nicht lesbar bzw. Struktur weicht ab - Rueckfrage.")
  quit(save = "no", status = 4)
}
kinds <- vapply(JOBS, `[[`, "", "kind")
ST <- dplyr::bind_rows(lapply(seq_along(RES), function(i) data.frame(kind = kinds[i], as.data.frame(RES[[i]]$st, stringsAsFactors = FALSE), stringsAsFactors = FALSE)))
ST <- as.data.frame(ST)
for (cn in names(ST)) if (is.numeric(ST[[cn]])) ST[[cn]][is.na(ST[[cn]])] <- 0
write_csv(ST, "einlese_statistik_je_datei.csv", ZW)
for (k in c("wind", "solar", "G")) {
  s <- ST[ST$kind == k, ]
  logm("Typ ", k, ": ", nrow(s), " Datei(en), ", sprintf("%.0f", sum(s$n_records)), " Datensaetze; ",
       "Nummern nicht im Muster: ", sum(s$bad_nr))
  if (k != "G") logm("   Datumstext ohne gueltiges Datum (Inbetriebnahme/Stilllegung): ", sum(s$ibn_text_ohne_datum), "/", sum(s$still_text_ohne_datum),
                     "; Brutto fehlt: ", sum(s$brutto_fehlt), "; Brutto nicht numerisch: ", sum(s$brutto_nicht_numerisch),
                     "; Netto fehlt: ", sum(s$netto_fehlt), "; Lokationsnummern nicht im Muster: ", sum(s$bad_lok))
}
WIND <- RES[[which(kinds == "wind")]]$d
SOLAR <- do.call(rbind, lapply(RES[kinds == "solar"], `[[`, "d"))
SOLAR$datei <- rep(seq_len(67), times = ST$n_records[ST$kind == "solar"])
WIND$datei <- 0L
G <- do.call(rbind, lapply(RES[kinds == "G"], `[[`, "d"))
G$datei <- rep(1:3, times = ST$n_records[ST$kind == "G"])
rm(RES); invisible(gc())
logm("Zeilen im Speicher: Wind ", nrow(WIND), "; Solar ", nrow(SOLAR), "; Geloeschte/Deaktivierte ", nrow(G))
if (nrow(WIND) != sum(ST$n_records[ST$kind == "wind"]) || nrow(SOLAR) != sum(ST$n_records[ST$kind == "solar"]))
  stopp("3.6", "Zeilenzahl im Speicher passt nicht zur Datensatzzaehlung.")


# ===========================================================================
# SAP 3.5 Nr.9: Zuordnungstabelle der Codes (Katalog-Aufloesung)
# ===========================================================================
logsec("SAP 3.5 Nr.9 Aufloesung der Statuswerte und Lage-Codes")
cnt <- function(x) { t <- table(x, useNA = "ifany"); setNames(as.integer(t), names(t)) }
code_tab <- function(feld, katname, xs) {
  codes <- sort(unique(unlist(lapply(xs, function(x) names(cnt(x))))))
  do.call(rbind, lapply(codes, function(cd) {
    data.frame(feld = feld, code = cd,
               bedeutung = if (cd == "NA") "(fehlt)" else lab_of(cd),
               katalogkategorie_im_export = if (cd == "NA") "" else cat_of(cd),
               erwartete_kategorie = katname,
               n_wind = sum(as.character(xs[[1]]) == cd | (cd == "NA" & is.na(xs[[1]])), na.rm = TRUE),
               n_solar = sum(as.character(xs[[2]]) == cd | (cd == "NA" & is.na(xs[[2]])), na.rm = TRUE),
               n_geloescht_deaktiviert = if (length(xs) > 2) sum(as.character(xs[[3]]) == cd | (cd == "NA" & is.na(xs[[3]])), na.rm = TRUE) else NA)
  }))
}
ZT <- rbind(
  code_tab("EinheitBetriebsstatus", "Betriebsstatus", list(WIND$bs, SOLAR$bs, G$bs)),
  code_tab("EinheitSystemstatus", "Systemstatus", list(WIND$sys, SOLAR$sys, G$sys)),
  code_tab("WindAnLandOderAufSee", "Wind an Land oder auf See", list(WIND$lage, rep(NA, 0), NULL)[1:2]),
  code_tab("Seelage", "Seelage", list(WIND$seelage, rep(NA, 0))))
G_typ <- code_tab("Einheittyp (G)", "Einheitentypen", list(rep(NA, 0), rep(NA, 0), G$typ))
G_typ$bedeutung <- ET$Wert[match(G_typ$code, ET$Id)]; G_typ$katalogkategorie_im_export <- "Einheitentypen.xml"
G_grd <- code_tab("EinheitLoeschgrund (G)", "Löschgründe Einheit", list(rep(NA, 0), rep(NA, 0), G$grund))
ZT <- rbind(ZT, G_typ, G_grd)
write_csv(ZT, "zuordnungstabelle_codes.csv")
print(ZT[, c("feld", "code", "bedeutung", "katalogkategorie_im_export", "n_wind", "n_solar", "n_geloescht_deaktiviert")], row.names = FALSE)
for (i in seq_len(nrow(ZT))) logm(sprintf("   %-26s %-6s %-48s [%s] Wind %s | Solar %s | G %s", ZT$feld[i], ZT$code[i],
                                         ZT$bedeutung[i], ZT$katalogkategorie_im_export[i], ZT$n_wind[i], ZT$n_solar[i], ZT$n_geloescht_deaktiviert[i]))

bs_cls <- function(code) {
  lab <- lab_of(code)
  ifelse(grepl("^In Planung$", lab), "planung",
  ifelse(grepl("^In Betrieb$", lab), "betrieb",
  ifelse(grepl("^Vor.bergehend stillgelegt$", lab), "vorueb",
  ifelse(grepl("^Endg.ltig stillgelegt$", lab), "endgueltig", NA_character_))))
}
BS_E <- sort(unique(c(WIND$bs, SOLAR$bs)))
cls_e <- bs_cls(BS_E)
if (any(is.na(BS_E)) || any(is.na(cls_e)) || any(cat_of(BS_E) != "Betriebsstatus"))
  stopp("3.5 Nr.9", paste0("Betriebsstatus-Code(s) in den Einheitendateien passen in keine der Kategorien (Planung/Betrieb/vorueb./endgueltig): ",
                           paste(BS_E[is.na(cls_e)], collapse = ",")))
logm("Betriebsstatus-Aufloesung (Einheitendateien): ", paste(BS_E, "=", lab_of(BS_E), "->", cls_e, collapse = "; "))
WIND$cls <- bs_cls(WIND$bs); SOLAR$cls <- bs_cls(SOLAR$bs)
SYS_E <- sort(unique(c(WIND$sys, SOLAR$sys)))
logm("Systemstatus-Werte in den Einheitendateien: ", paste(SYS_E, "=", lab_of(SYS_E), collapse = "; "))
if (any(is.na(SYS_E)) || !all(grepl("^Aktiviert$", lab_of(SYS_E)))) {
  stopp("3.5 Nr.9", paste0("EinheitSystemstatus in den Einheitendateien enthaelt andere Werte als 'Aktiviert' (Hinweis auf nicht aktive/nicht registrierte Einheiten): ",
        paste(paste0(SYS_E, "=", lab_of(SYS_E), " (Wind ", sapply(SYS_E, function(v) sum(WIND$sys == v, na.rm = TRUE)),
                     ", Solar ", sapply(SYS_E, function(v) sum(SOLAR$sys == v, na.rm = TRUE)), ")"), collapse = "; ")))
}
LG <- sort(unique(WIND$lage), na.last = TRUE)
if (any(is.na(LG)) || !all(lab_of(LG[!is.na(LG)]) %in% c("Windenergie an Land", "Windenergie auf See")) )
  logm("Hinweis: Lage-Codes ausserhalb {an Land, auf See} oder fehlend: ", paste(LG, collapse = ","), " (Behandlung nach 3.5 Nr.5)")
LAGE_LAND <- KW$Id[KW$KatName == "Wind an Land oder auf See" & KW$Wert == "Windenergie an Land"]
LAGE_SEE  <- KW$Id[KW$KatName == "Wind an Land oder auf See" & KW$Wert == "Windenergie auf See"]
logm("Lage-Codes: an Land = ", LAGE_LAND, "; auf See = ", LAGE_SEE)
LAGE_SONST <- setdiff(LG[!is.na(LG)], as.integer(c(LAGE_LAND, LAGE_SEE)))
if (length(LAGE_SONST)) stopp("3.5 Nr.9", paste0("Lage-Codes nicht aufloesbar als an Land/auf See: ", paste(LAGE_SONST, collapse = ",")))

# ===========================================================================
# SAP 3.5 Nr.3: Dubletten (Maßgeblich: MaStR-Nummer); gemeinsame Bereinigung
# ===========================================================================
logsec("SAP 3.5 Nr.3 Duplikat-Bereinigung")
WIND$tech_file <- "Wind"; SOLAR$tech_file <- "Solar"
WIND$art <- NA_integer_; SOLAR$lage <- NA_integer_; SOLAR$seelage <- NA_integer_
ALLC <- c("nr", "lok", "upd", "ibn", "still", "sys", "bs", "brutto", "netto", "lage", "seelage", "art", "datei", "tech_file", "cls")
U <- rbind(WIND[, ALLC], SOLAR[, ALLC])
U$datei <- ifelse(U$tech_file == "Wind", 0L, U$datei)
n_raw_wind <- nrow(WIND); n_raw_solar <- nrow(SOLAR)
RAW_FLOW <- data.frame(tech = c("Wind (alle Lagen)", "Solar"),
                       n_roh = c(n_raw_wind, n_raw_solar),
                       brutto_GW_roh = c(sum(WIND$brutto, na.rm = TRUE), sum(SOLAR$brutto, na.rm = TRUE)) / 1e6)
rm(WIND, SOLAR); invisible(gc())
if (anyNA(U$nr)) stopp("3.5 Nr.3", paste0(sum(is.na(U$nr)), " Datensaetze mit nicht musterkonformer MaStR-Nummer (keine Duplikatpruefung moeglich)."))
o <- order(U$nr, -U$upd, U$datei, seq_len(nrow(U)))
U <- U[o, ]; rm(o)
dup <- duplicated(U$nr)
n_dup <- sum(dup)
logm("Datensaetze gesamt (Wind+Solar): ", nrow(U), "; Nummern mehrfach vorkommend (ueberzaehlige Datensaetze): ", n_dup)
if (n_dup > 0) {
  dn <- unique(U$nr[dup])
  dd <- U[U$nr %in% dn, c("nr", "tech_file", "datei", "upd", "brutto", "ibn", "bs")]
  dd$nr <- sprintf("SEE%012.0f", dd$nr)
  gz <- gzfile(file.path(LST, "liste_dubletten_nummern.csv.gz"), "w"); write.csv(dd, gz, row.names = FALSE); close(gz)
  logm("   betroffene Nummern: ", length(dn), "; Liste: output/listen/liste_dubletten_nummern.csv.gz; ueber Technologien hinweg: ",
       sum(tapply(dd$tech_file, dd$nr, function(z) length(unique(z)) > 1)))
}
DUP_FLOW <- data.frame(tech = c("Wind (alle Lagen)", "Solar"),
                       n_dubletten_entfernt = c(sum(dup & U$tech_file == "Wind"), sum(dup & U$tech_file == "Solar")),
                       brutto_GW_dubletten = c(sum(U$brutto[dup & U$tech_file == "Wind"], na.rm = TRUE),
                                               sum(U$brutto[dup & U$tech_file == "Solar"], na.rm = TRUE)) / 1e6)
U_all_nr <- U$nr                       # alle Nummern der Einheitendateien (fuer Ueberlappung mit G)
U_all_brutto <- U$brutto; U_all_tech <- U$tech_file; U_all_bs <- U$cls
U <- U[!dup, ]; rm(dup)
logm("Nach Duplikat-Bereinigung: ", nrow(U), " Einheiten")

# Verschiedene Nummern mit identischen Standort-/Datums-/Leistungsangaben: zaehlen und listen (nicht entfernen)
# POST-HOC (Operationalisierung, siehe Abweichungsprotokoll A-03): "Standort" = LokationMaStRNummer
ok <- order(U$lok, U$ibn, U$brutto, U$tech_file)
Us <- U[ok, ]; same <- c(FALSE, Us$lok[-1] == Us$lok[-nrow(Us)] & Us$ibn[-1] == Us$ibn[-nrow(Us)] &
                           Us$brutto[-1] == Us$brutto[-nrow(Us)] & Us$tech_file[-1] == Us$tech_file[-nrow(Us)])
same[is.na(same)] <- FALSE
grp_start <- which(same); in_grp <- same | c(same[-1], FALSE)
logm("Identische (Lokation, Inbetriebnahmedatum, Bruttoleistung, Technologie) bei verschiedenen Nummern: ",
     sum(in_grp), " Einheiten in ", sum(!same[in_grp]), " Gruppen (Wind ", sum(in_grp & Us$tech_file == "Wind"),
     ", Solar ", sum(in_grp & Us$tech_file == "Solar"), "); nicht entfernt.")
PARALLEL_TAB <- data.frame(tech = c("Wind", "Solar"),
                           n_einheiten_in_gruppen = c(sum(in_grp & Us$tech_file == "Wind"), sum(in_grp & Us$tech_file == "Solar")),
                           n_gruppen = c(sum(in_grp & !same & Us$tech_file == "Wind"), sum(in_grp & !same & Us$tech_file == "Solar")),
                           brutto_GW = c(sum(Us$brutto[in_grp & Us$tech_file == "Wind"], na.rm = TRUE), sum(Us$brutto[in_grp & Us$tech_file == "Solar"], na.rm = TRUE)) / 1e6)
gl <- Us[in_grp, c("nr", "lok", "tech_file", "ibn", "brutto")]
gl$nr <- sprintf("SEE%012.0f", gl$nr); gl$lok <- sprintf("SEL%012.0f", gl$lok); gl$ibn <- as.Date(gl$ibn, origin = "1970-01-01")
gz <- gzfile(file.path(LST, "liste_identische_angaben_verschiedene_nummern.csv.gz"), "w"); write.csv(gl, gz, row.names = FALSE); close(gz)
write_csv(PARALLEL_TAB, "tabelle_parallel_einheiten_identische_angaben.csv", ZW)
rm(Us, ok, same, in_grp, gl, grp_start); invisible(gc())

# ===========================================================================
# SAP 3.5 Nr.4-6, 3.4: Populationen, harte/weiche Schwellen, Bestandslogik
# ===========================================================================
logsec("SAP 3.5 Nr.2, 4, 5, 6 / 3.4 Einschluss- und Ausschlussregeln")
U$pop <- ifelse(U$tech_file == "Solar", "Solar",
         ifelse(is.na(U$lage), "Wind_lage_fehlt",
         ifelse(U$lage == as.integer(LAGE_LAND), "Wind", "See")))
logm("Populationen nach Duplikat-Bereinigung: ", paste(names(table(U$pop)), table(U$pop), collapse = "; "))
THR_HARD <- c(Wind = 20000, Solar = 1e6, See = Inf)        # kW, SAP 3.5 Nr.4
THR_SOFT <- c(Wind = 10000, Solar = 300000, See = 20000)   # kW, SAP 3.5 Nr.4
U$ex_lage  <- U$pop == "Wind_lage_fehlt"
U$ex_hard  <- !U$ex_lage & (is.na(U$brutto) | U$brutto <= 0 | U$brutto > THR_HARD[ifelse(U$pop %in% names(THR_HARD), U$pop, "Wind")])
U$ex_hard[U$ex_lage] <- FALSE
U$ex_nodate <- !U$ex_lage & !U$ex_hard & is.na(U$ibn)
U$ex_future <- !U$ex_lage & !U$ex_hard & !U$ex_nodate & U$ibn > XD
U$ex_plan   <- !U$ex_lage & !U$ex_hard & !U$ex_nodate & !U$ex_future & U$cls == "planung"
U$incl <- !(U$ex_lage | U$ex_hard | U$ex_nodate | U$ex_future | U$ex_plan)
U$soft_hi  <- U$incl & U$brutto > THR_SOFT[ifelse(U$pop %in% names(THR_SOFT), U$pop, "Wind")]
U$soft_net <- U$incl & !is.na(U$netto) & U$netto > U$brutto
# Stilllegung (SAP 3.4 / 3.5 Nr.2)
U$s_valid  <- U$incl & U$cls == "endgueltig" & !is.na(U$still) & U$still >= U$ibn
U$s_nodate <- U$incl & U$cls == "endgueltig" & is.na(U$still)
U$s_before <- U$incl & U$cls == "endgueltig" & !is.na(U$still) & U$still < U$ibn
U$s_notbs  <- U$incl & U$cls != "endgueltig" & !is.na(U$still)
U$s_future <- U$s_valid & U$still > XD

pops <- c("Wind", "Solar", "See")
POPLAB <- c(Wind = "Wind an Land", Solar = "Solar", See = "Wind auf See")
flow_rows <- list()
add_flow <- function(schritt, tech, idx, kw = U$brutto) {
  flow_rows[[length(flow_rows) + 1L]] <<- data.frame(schritt = schritt, technologie = tech, anzahl = sum(idx),
                                                       brutto_GW = sum(kw[idx], na.rm = TRUE) / 1e6)
}
for (p in c("Wind (alle Lagen)", "Solar")) {
  r <- RAW_FLOW[RAW_FLOW$tech == p, ]; d <- DUP_FLOW[DUP_FLOW$tech == p, ]
  flow_rows[[length(flow_rows) + 1L]] <- data.frame(schritt = "1 Rohdatensaetze in den Einheitendateien", technologie = p, anzahl = r$n_roh, brutto_GW = r$brutto_GW_roh)
  flow_rows[[length(flow_rows) + 1L]] <- data.frame(schritt = "2 davon Dubletten (gleiche MaStR-Nummer), entfernt", technologie = p, anzahl = d$n_dubletten_entfernt, brutto_GW = d$brutto_GW_dubletten)
}
for (p in pops) {
  sel <- U$pop == p
  add_flow("3 nach Duplikat-Bereinigung (Population)", POPLAB[p], sel)
  add_flow("4 harte Ausschluesse (Brutto fehlt/<=0 oder ueber harter Schwelle)", POPLAB[p], sel & U$ex_hard)
  add_flow("5 ohne Inbetriebnahmedatum (nicht im Bestand)", POPLAB[p], sel & U$ex_nodate)
  add_flow("6 Inbetriebnahmedatum nach Exportdatum (ausgeschlossen)", POPLAB[p], sel & U$ex_future)
  add_flow("7 Betriebsstatus 'in Planung' mit Datum (nicht im Bestand)", POPLAB[p], sel & U$ex_plan)
  add_flow("8 Einheiten im Datensatz fuer Bestand/Zubau (Einschluss)", POPLAB[p], sel & U$incl)
  add_flow("8a davon mit gueltigem Datum endgueltiger Stilllegung (S)", POPLAB[p], sel & U$s_valid)
  add_flow("8b davon 'endgueltig stillgelegt' ohne Stilllegungsdatum (im Bestand belassen)", POPLAB[p], sel & U$s_nodate)
  add_flow("8c davon Stilllegungsdatum vor Inbetriebnahme (als nicht stillgelegt behandelt)", POPLAB[p], sel & U$s_before)
  add_flow("8d davon Stilllegungsdatum, aber Status nicht endgueltig (als nicht stillgelegt behandelt)", POPLAB[p], sel & U$s_notbs)
  add_flow("9 weiche Markierung: Brutto ueber weicher Schwelle (bleibt im Datensatz)", POPLAB[p], sel & U$soft_hi)
  add_flow("9 weiche Markierung: Nettonennleistung > Bruttoleistung (bleibt im Datensatz)", POPLAB[p], sel & U$soft_net)
}
add_flow("5/Nr.5 Windeinheit ohne Lage (ausgeschlossen)", "Wind (Lage fehlt)", U$ex_lage)
T1 <- do.call(rbind, flow_rows)
T1$brutto_GW <- round(T1$brutto_GW, 4)
write_csv(T1, "tabelle1_datenfluss.csv")
print(T1, row.names = FALSE)
for (i in seq_len(nrow(T1))) logm(sprintf("   T1 | %-86s | %-18s | n = %9d | %10.4f GW", T1$schritt[i], T1$technologie[i], T1$anzahl[i], T1$brutto_GW[i]))
logm("Nur Wind: Windeinheiten ohne Angabe der Lage: ", sum(U$ex_lage), "; Lage 'auf See' (E5-Population): ", sum(U$pop == "See"))

# Listen (SAP 3.5 Nr.2, 4, 5)
wl <- function(idx, name, extra = NULL) {
  d <- U[idx, c("nr", "tech_file", "pop", "ibn", "still", "bs", "sys", "brutto", "netto")]
  if (nrow(d)) { d$nr <- sprintf("SEE%012.0f", d$nr); d$ibn <- as.Date(d$ibn, origin = "1970-01-01"); d$still <- as.Date(d$still, origin = "1970-01-01") }
  gz <- gzfile(file.path(LST, paste0(name, ".csv.gz")), "w"); write.csv(d, gz, row.names = FALSE); close(gz)
  logm("   Liste ", name, ": ", nrow(d), " Zeilen")
}
wl(U$ex_hard, "liste_harte_ausschluesse"); wl(U$ex_lage, "liste_wind_ohne_lage")
wl(U$ex_future, "liste_inbetriebnahme_nach_exportdatum"); wl(U$soft_hi, "liste_weiche_markierung_leistung")
wl(U$soft_net, "liste_weiche_markierung_netto_groesser_brutto")
wl(U$s_nodate, "liste_endgueltig_ohne_stilllegungsdatum"); wl(U$s_before, "liste_stilllegung_vor_inbetriebnahme")
wl(U$s_notbs, "liste_stilllegungsdatum_status_nicht_endgueltig")
wl(U$ex_nodate, "liste_ohne_inbetriebnahmedatum"); wl(U$ex_plan, "liste_in_planung_mit_datum")

# Harte Ausschluesse - Grund und Beispiele (Nr.6: kW-vs-MW-Faelle werden nicht korrigiert)
hx <- U[U$ex_hard, ]
HX <- data.frame(pop = hx$pop, grund = ifelse(is.na(hx$brutto), "Brutto fehlt", ifelse(hx$brutto <= 0, "Brutto <= 0", "ueber harter Schwelle")))
logm("Harte Ausschluesse nach Grund: ", paste(capture.output(print(table(HX$pop, HX$grund))), collapse = " | "))
over <- hx[!is.na(hx$brutto) & hx$brutto > 0, ]
if (nrow(over)) logm("   ueber harter Schwelle: ", nrow(over), " Einheiten, groesste Bruttoleistungen (kW): ", paste(head(sort(over$brutto, decreasing = TRUE), 5), collapse = ", "))
rm(hx, over, HX)

# Auffaellige Inbetriebnahme-Jahre (SAP 3.5 Nr.10: unbekannte Eigenheiten sichtbar machen)
yy <- as.integer(format(as.Date(U$ibn[U$incl], origin = "1970-01-01"), "%Y"))
logm("Inbetriebnahmejahr der eingeschlossenen Einheiten: Minimum ", min(yy), ", Maximum ", max(yy), "; vor 1980: ", sum(yy < 1980), "; vor 1990: ", sum(yy < 1990))
rm(yy)
for (p in pops) {
  sel <- U$pop == p & U$incl; y0 <- as.integer(format(as.Date(U$ibn[sel], origin = "1970-01-01"), "%Y")); pw <- U$brutto[sel]
  logm(sprintf("   %s: Inbetriebnahmejahr <= 1990: %d Einheiten, %.4f GW; davon Jahr 1900: %d Einheiten, %.4f GW; Jahr < 1900 oder > 2026: %d",
               POPLAB[p], sum(y0 <= 1990), sum(pw[y0 <= 1990]) / 1e6, sum(y0 == 1900), sum(pw[y0 == 1900]) / 1e6, sum(y0 < 1900 | y0 > 2026)))
}

# ===========================================================================
# SAP 3.4: Monatsreihen Z, S, C (nach Population; Brutto primaer, Netto S6)
# ===========================================================================
logsec("SAP 3.4 Bestand, Zubau, Stilllegung (monatlich)")
tomi <- function(day) { d <- as.Date(day, origin = "1970-01-01"); mi(as.integer(format(d, "%Y")), as.integer(format(d, "%m"))) }
series_for <- function(d, power, m_from, m_to) {
  # d: Einheiten (incl) mit ibn, still, s_valid; power in kW; Monatsindex m_from..m_to
  M <- seq(m_from, m_to)
  ib <- d$ibn_m; st <- d$still_m
  Z <- numeric(length(M)); S <- numeric(length(M)); C0 <- 0
  pw <- ifelse(is.na(power), 0, power)
  early <- ib < m_from
  C0 <- sum(pw[early])
  agg <- function(idx, w) { i <- idx - m_from + 1L; ok <- i >= 1L & i <= length(M); if (!any(ok)) return(numeric(length(M)))
    r <- numeric(length(M)); s <- rowsum(w[ok], i[ok]); r[as.integer(rownames(s))] <- s[, 1]; r }
  Z <- agg(ib[!early], pw[!early]); sv <- d$s_valid
  S0 <- sum(pw[sv & st < m_from]); S <- agg(st[sv & st >= m_from], pw[sv & st >= m_from])
  C <- (C0 - S0) + cumsum(Z - S)
  data.frame(m = M, monat = mi_lab(M), Z_kW = Z, S_kW = S, C_kW = C)
}
direct_C <- function(d, power, ms) {   # unabhaengige Direktberechnung der Bestandsdefinition 3.4
  ib <- d$ibn_m; st <- d$still_m; pw <- ifelse(is.na(power), 0, power); sv <- d$s_valid
  sapply(ms, function(m) sum(pw[ib <= m]) - sum(pw[sv & st <= m]))
}
tomi_fast <- function(x) { u <- unique(x); m <- tomi(u); m[match(x, u)] }
U$ibn_m <- tomi_fast(U$ibn); U$still_m <- tomi_fast(U$still)
U$upd <- NULL; U$datei <- NULL; U$lok <- NULL; U$art <- NULL; invisible(gc())
M_FROM <- mi(2000L, 1L); M_TO <- EXPORT_M
SER <- list(); SERN <- list()
for (p in pops) {
  d <- U[U$pop == p & U$incl, ]
  SER[[p]] <- series_for(d, d$brutto, M_FROM, M_TO)
  SERN[[p]] <- series_for(d, d$netto, M_FROM, M_TO)
  # Rechenprobe (SAP 3.4): C(m) - C(m-1) = Z(m) - S(m) und Direktberechnung
  s <- SER[[p]]; dC <- diff(s$C_kW); zz <- (s$Z_kW - s$S_kW)[-1]
  ms <- seq(mi(2019L, 1L), T_S1)
  dir <- direct_C(d, d$brutto, ms)
  chk <- max(abs(s$C_kW[match(ms, s$m)] - dir))
  logm("Rechenprobe ", POPLAB[p], ": max |C(m)-C(m-1) - (Z-S)| = ", signif(max(abs(dC - zz)), 3), " kW; max |C_Reihe - C_direkt| (Jan 2019-",
       mi_lab(T_S1), ") = ", signif(chk, 3), " kW",
       if (max(abs(dC - zz)) > 1e-3 || chk > 1e-3) "  -> NICHT ERFUELLT" else "  -> erfuellt (Toleranz 1e-3 kW)")
  if (max(abs(dC - zz)) > 1e-3 || chk > 1e-3) stopp("3.4", paste0("Rechenprobe fuer ", POPLAB[p], " nicht erfuellt."))
  rm(d)
}
# SAP 6 / S7(b): Reihe ohne weich markierte Einheiten (Brutto ueber weicher Schwelle oder Netto > Brutto)
SER7 <- list()
for (p in pops) {
  d <- U[U$pop == p & U$incl & !(U$soft_hi | U$soft_net), ]
  SER7[[p]] <- series_for(d, d$brutto, M_FROM, M_TO); rm(d)
}
N_SOFT <- sapply(pops, function(p) sum(U$pop == p & (U$soft_hi | U$soft_net)))
logm("S7: weich markierte Einheiten (Ausschluss in Variante b): ", paste(POPLAB[pops], N_SOFT, collapse = "; "))
N_NETTO_LE0 <- sapply(pops, function(p) sum(U$pop == p & U$incl & U$netto <= 0, na.rm = TRUE))
logm("Einheiten im Einschluss mit Nettonennleistung <= 0 (S6, Leistung zaehlt als 0): ", paste(POPLAB[pops], N_NETTO_LE0, collapse = "; "))
Cget <- function(p, m, ser = SER) ser[[p]]$C_kW[ser[[p]]$m == m] / 1e6   # GW
for (p in pops) logm(sprintf("   C(%s): Dez 2024 = %.3f GW; %s (T) = %.3f GW; %s (T_S1) = %.3f GW", POPLAB[p],
                              Cget(p, mi(2024L, 12L)), mi_lab(T_M), Cget(p, T_M), mi_lab(T_S1), Cget(p, T_S1)))
# Monatsreihen als Zwischentabelle
MS <- do.call(rbind, lapply(pops, function(p) {
  s <- SER[[p]]; n <- SERN[[p]]; s <- s[s$m >= mi(2015L, 1L), ]
  data.frame(technologie = POPLAB[p], monat = s$monat, Z_GW_brutto = s$Z_kW / 1e6, S_GW_brutto = s$S_kW / 1e6, C_GW_brutto = s$C_kW / 1e6,
             C_GW_netto = n$C_kW[match(s$m, n$m)] / 1e6)
}))
write_csv(MS, "monatsreihen_bestand_zubau_stilllegung.csv", ZW)
logm("Monatsreihen (ab 2015-01) gespeichert: output/zwischen/monatsreihen_bestand_zubau_stilllegung.csv (", nrow(MS), " Zeilen)")

# ===========================================================================
# SAP 3.3 / 3.5 Nr.2: Stopp-Regeln Groessenordnung und 1-%-Schwelle
# ===========================================================================
logsec("SAP 3.3 Groessenordnungs-Sperre; SAP 3.5 Nr.2 Schwelle 1 %")
GATE <- list()
for (p in c("Wind", "Solar")) {
  c24 <- Cget(p, mi(2024L, 12L)); y24 <- Y(p, 2024)
  ratio <- c24 / y24
  logm(sprintf("Groessenordnungs-Sperre %s: C(Dez 2024) = %.3f GW; Y(2024) = %g GW; Verhaeltnis %.3f (zulaessig 0,5 bis 2)", POPLAB[p], c24, y24, ratio))
  if (ratio < 0.5 || ratio > 2) stopp("3.3", sprintf("%s: C(Dez 2024)=%.3f GW liegt ausserhalb [0,5; 2]-fach von Y(2024)=%g GW.", POPLAB[p], c24, y24))
  nd <- U[U$pop == p & U$s_nodate, ]
  sh <- sum(nd$brutto) / 1e6 / Cget(p, T_M)
  logm(sprintf("1-%%-Schwelle %s: 'endgueltig stillgelegt' ohne Stilllegungsdatum: %d Einheiten, %.4f GW = %.3f %% von C(T)=%.3f GW",
               POPLAB[p], nrow(nd), sum(nd$brutto) / 1e6, 100 * sh, Cget(p, T_M)))
  if (sh > 0.01) stopp("3.5 Nr.2", sprintf("%s: Leistung der Einheiten 'endgueltig stillgelegt' ohne Stilllegungsdatum = %.3f %% von C(T) > 1 %%.", POPLAB[p], 100 * sh))
  GATE[[p]] <- data.frame(technologie = POPLAB[p], C_dez2024_GW = c24, Y2024_GW = y24, verhaeltnis = ratio,
                          n_endgueltig_ohne_datum = nrow(nd), GW_endgueltig_ohne_datum = sum(nd$brutto) / 1e6, anteil_an_C_T_prozent = 100 * sh)
}

# ===========================================================================
# SAP 3.5 Nr.12: Geloeschte und deaktivierte Einheiten
# ===========================================================================
logsec("SAP 3.5 Nr.12 Geloeschte und deaktivierte Einheiten (G)")
logm("G: ", nrow(G), " Datensaetze aus 3 Dateien; eindeutige Nummern: ", length(unique(G$nr)), "; Nummern nicht im Muster: ", sum(is.na(G$nr)))
G$typ_lab <- ET$Wert[match(as.character(G$typ), ET$Id)]
G$grund_lab <- ifelse(is.na(G$grund), "(kein Loeschgrund)", lab_of(G$grund))
G$bs_lab <- lab_of(G$bs); G$sys_lab <- lab_of(G$sys)
if (any(is.na(G$typ_lab))) stopp("3.5 Nr.12 e", "Einheittyp-Codes in G nicht ueber Einheitentypen.xml aufloesbar.")
Gw <- G[G$typ_lab %in% c("Windeinheit", "Solareinheit"), ]
logm("G-Datensaetze Typ Windeinheit: ", sum(Gw$typ_lab == "Windeinheit"), "; Typ Solareinheit: ", sum(Gw$typ_lab == "Solareinheit"))
G_TAB <- as.data.frame(table(typ = Gw$typ_lab, loeschgrund = Gw$grund_lab, betriebsstatus = Gw$bs_lab, systemstatus = Gw$sys_lab), stringsAsFactors = FALSE)
G_TAB <- G_TAB[G_TAB$Freq > 0, ]
write_csv(G_TAB, "tabelle1_geloeschte_deaktivierte_je_typ_grund_status.csv")
for (i in seq_len(nrow(G_TAB))) logm(sprintf("   G | %-12s | %-48s | %-26s | %-12s | %8d", G_TAB$typ[i], G_TAB$loeschgrund[i], G_TAB$betriebsstatus[i], G_TAB$systemstatus[i], G_TAB$Freq[i]))
# (ii) Ueberlappung mit den Einheitendateien (alle Nummern der Einheitendateien vor Duplikatbereinigung)
# Maßgeblich fuer die Leistung: der (nach Nr.3 bereinigte) Datensatz der Einheitendatei
Gn <- unique(G$nr)
ov <- Gn %in% U_all_nr
ovU <- U$nr %in% Gn
logm("Ueberlappung: eindeutige G-Nummern: ", length(Gn), "; davon auch in Einheitendateien (Wind/Solar): ", sum(ov))
OV <- data.frame()
for (tp in c("Wind", "Solar")) {
  sel <- ovU & U$tech_file == tp
  tabG <- G[match(U$nr[sel], G$nr), ]
  OV <- rbind(OV, data.frame(technologie = tp, n_ueberlappung = sum(sel), brutto_GW_ueberlappung = sum(U$brutto[sel], na.rm = TRUE) / 1e6,
                             n_davon_im_bestand_schritt8 = sum(sel & U$incl), brutto_GW_davon_im_bestand = sum(U$brutto[sel & U$incl], na.rm = TRUE) / 1e6,
                             n_davon_wind_an_land_bzw_solar_incl_s_valid = sum(sel & U$s_valid),
                             G_typ_passt_zur_datei = sum(tabG$typ_lab == ifelse(tp == "Wind", "Windeinheit", "Solareinheit"), na.rm = TRUE)))
}
write_csv(OV, "tabelle1_ueberlappung_G_mit_einheitendateien.csv")
print(OV, row.names = FALSE)
for (i in seq_len(nrow(OV))) logm(sprintf("   Ueberlappung %s: %d Einheiten, %.4f GW Brutto; davon im Bestandsdatensatz %d (%.4f GW); G-Typ passt zur Datei: %d",
                                           OV$technologie[i], OV$n_ueberlappung[i], OV$brutto_GW_ueberlappung[i], OV$n_davon_im_bestand_schritt8[i],
                                           OV$brutto_GW_davon_im_bestand[i], OV$G_typ_passt_zur_datei[i]))
if (sum(ov) > 0) {
  gx <- U[ovU, c("nr", "tech_file", "pop", "ibn", "still", "bs", "sys", "brutto", "incl")]
  gx$G_loeschgrund <- G$grund_lab[match(gx$nr, G$nr)]; gx$G_betriebsstatus <- G$bs_lab[match(gx$nr, G$nr)]; gx$G_systemstatus <- G$sys_lab[match(gx$nr, G$nr)]
  gx$G_typ <- G$typ_lab[match(gx$nr, G$nr)]; gx$G_datum_loeschung <- as.Date(G$dloesch[match(gx$nr, G$nr)], origin = "1970-01-01")
  gx$nr <- sprintf("SEE%012.0f", gx$nr); gx$ibn <- as.Date(gx$ibn, origin = "1970-01-01"); gx$still <- as.Date(gx$still, origin = "1970-01-01")
  gz <- gzfile(file.path(LST, "liste_ueberlappung_G_einheitendateien.csv.gz"), "w"); write.csv(gx, gz, row.names = FALSE); close(gz)
  OVD <- as.data.frame(table(tech = gx$tech_file, G_typ = gx$G_typ, G_loeschgrund = gx$G_loeschgrund, G_systemstatus = gx$G_systemstatus,
                             Einheitendatei_systemstatus = lab_of(gx$sys), Einheitendatei_betriebsstatus = lab_of(U$bs[ovU]), im_bestand = gx$incl), stringsAsFactors = FALSE)
  OVD <- OVD[OVD$Freq > 0, ]; write_csv(OVD, "tabelle1_ueberlappung_G_details.csv")
  for (i in seq_len(min(nrow(OVD), 40))) logm("   Ueberlappung-Detail: ", paste(names(OVD), unlist(OVD[i, ]), sep = "=", collapse = " | "))
}
# (iii) G-Nummern ohne Datensatz in den Einheitendateien
G_ohne <- Gw[!(Gw$nr %in% U_all_nr), ]
G_ohne <- G_ohne[!duplicated(G_ohne$nr), ]
logm("G-Nummern (Typ Wind/Solar, eindeutig) ohne Datensatz in den Einheitendateien: Wind ", sum(G_ohne$typ_lab == "Windeinheit"), "; Solar ", sum(G_ohne$typ_lab == "Solareinheit"))
GO <- as.data.frame(table(typ = G_ohne$typ_lab, betriebsstatus = G_ohne$bs_lab), stringsAsFactors = FALSE)
write_csv(GO, "tabelle1_G_ohne_datensatz_je_typ_betriebsstatus.csv")
for (i in seq_len(nrow(GO))) logm("   G ohne Datensatz | ", GO$typ[i], " | ", GO$betriebsstatus[i], " | ", GO$Freq[i])
logm("Nr.12 c: G-Einheiten ohne Ueberlappung mit Betriebsstatus 'Endgueltig stillgelegt' (Hinweis auf nicht erfassten Stilllegungsanteil; kein Stopp): Wind ",
     sum(G_ohne$typ_lab == "Windeinheit" & grepl("^Endg", G_ohne$bs_lab)), "; Solar ", sum(G_ohne$typ_lab == "Solareinheit" & grepl("^Endg", G_ohne$bs_lab)))
# Stopp-Regel 0,5 % (Nr.12 d): Bruttoleistung der Ueberlappungseinheiten > 0,5 % von C(tau,T)
for (tp in c("Wind", "Solar")) {
  b <- OV$brutto_GW_ueberlappung[OV$technologie == tp]; cT <- Cget(tp, T_M)
  logm(sprintf("0,5-%%-Schwelle %s: Bruttoleistung Ueberlappung %.4f GW = %.3f %% von C(T) = %.3f GW", POPLAB[tp], b, 100 * b / cT, cT))
  if (b > 0.005 * cT) stopp("3.5 Nr.12 d", sprintf("%s: Bruttoleistung der Ueberlappungseinheiten (G und Einheitendatei) = %.4f GW = %.3f %% von C(T) > 0,5 %%.", POPLAB[tp], b, 100 * b / cT))
}
write_csv(do.call(rbind, GATE), "stopp_pruefungen_kennzahlen.csv")

# ===========================================================================
# Zwischenstand: Stopp-Auswertung
# ===========================================================================
logsec("Ergebnis der Vorpruefungen (Stopp-Regeln)")
if (length(STOPS)) {
  logm("MINDESTENS EINE STOPP-REGEL DES SAP WURDE AUSGELOEST (", length(STOPS), "). Die Analyse wird hier angehalten (keine Regression, keine Estimands, keine Sensitivitaeten).")
  for (s in STOPS) logm("   * ", s)
  writeLines(STOPS, file.path(OUT, "STOPP_befund.txt"))
  logm("Befund: output/STOPP_befund.txt; Rueckfrage an Daniel Saure erforderlich. Keine Entscheidung durch den Analysten.")
  logm("Lauf beendet (Stopp). ", format(Sys.time()))
  quit(save = "no", status = 10)
}
logm("Keine Stopp-Regel ausgeloest: Groessenordnung, 1-%-Schwelle, 0,5-%-Schwelle, Statusaufloesung und Rechenprobe bestanden.")


# ===========================================================================
# SAP 2.3 ff.: Estimands E1-E5, Regression (5.1), Diagnostik (5.2), Robustheit (5.3)
# ===========================================================================
logsec("SAP 2.1 / 2.3 / 5.1 Kernfunktionen")
suppressPackageStartupMessages({ library(lmtest); library(sandwich); library(ggplot2) })
XMAX <- function(Tm) mi(2060L, 12L) - Tm                    # Suchhorizont 31.12.2060 (SAP 2.3)
xdec <- function(j, Tm) mi(j, 12L) - Tm                     # x(j): Monate von T bis 31.12.j
logm("x(2026) = ", xdec(2026L, T_M), "; x(2030) = ", xdec(2030L, T_M), " (T = ", mi_lab(T_M), "); fuer T_S1: x(2026) = ",
     xdec(2026L, T_S1), "; x(2030) = ", xdec(2030L, T_S1), "; Suchhorizont x_max(T) = ", XMAX(T_M))
stopifnot(xdec(2026L, T_M) == 5L, xdec(2030L, T_M) == 53L)    # SAP 2.1 / Validierungsbogen

KAT_IN    <- "Das Ziel liegt im 95-%-Prognoseintervall der Fortschreibung."
KAT_OBEN  <- "Das Ziel liegt oberhalb des 95-%-Prognoseintervalls der Fortschreibung."
KAT_UNTEN <- "Das Ziel liegt unterhalb des 95-%-Prognoseintervalls der Fortschreibung."
KAT_NEG   <- "Zubau im Fenster nicht positiv; Ziel nicht erreicht"
kat12 <- function(Y, L, U, b) if (b <= 0) KAT_NEG else if (Y >= L && Y <= U) KAT_IN else if (Y > U) KAT_OBEN else KAT_UNTEN
lab_x <- function(x, Tm) if (is.na(x)) "nicht bis 2060 erreicht" else sprintf("%02d/%04d", mi_month(Tm + x), mi_year(Tm + x))

# Reihe in GW je Population: data.frame(m, C, Z, S)
gser <- function(s, col = "kW") data.frame(m = s$m, C = s$C_kW / 1e6, Z = s$Z_kW / 1e6, S = s$S_kW / 1e6)
SRC <- list(prim = lapply(SER, gser), netto = lapply(SERN, gser), weich = lapply(SER7, gser))

# OLS fuer ein Fenster (SAP 2.3 E2): C = a + b x + e, x = -W..0
ols_core <- function(y, W) {
  x <- -W:0; n <- W + 1L; stopifnot(length(y) == n, !anyNA(y))
  fit <- lm(y ~ x); cf <- unname(coef(fit)); res <- unname(resid(fit))
  s <- sqrt(sum(res^2) / (n - 2)); xbar <- mean(x); Sxx <- sum((x - xbar)^2)
  seb <- s / sqrt(Sxx); tq <- qt(0.975, n - 2)
  list(fit = fit, x = x, y = y, n = n, W = W, a = cf[1], b = cf[2], res = res, s = s, xbar = xbar, Sxx = Sxx, seb = seb, tq = tq,
       cib = c(cf[2] - tq * seb, cf[2] + tq * seb))
}
pi_at <- function(m, xn) {                                   # klassisches 95-%-Prognoseintervall (neue Beobachtung)
  mu <- m$a + m$b * xn; se <- m$s * sqrt(1 + 1 / m$n + (xn - m$xbar)^2 / m$Sxx)
  cbind(fit = mu, L = mu - m$tq * se, U = mu + m$tq * se)
}
first_x <- function(v) { w <- which(v); if (length(w)) w[1] - 1L else NA_integer_ }
# Erreichungszeitpunkt (SAP 2.3 E2 Nr.1-4); Rueckgabe: Status und x-Werte
reach <- function(m, Y, Tm, CT) {
  if (CT >= Y) return(list(status = "Ziel bereits erreicht", pt = NA, fr = NA, sp = NA))
  if (m$b <= 0) return(list(status = "mit dieser Fortschreibung nicht erreicht", pt = NA, fr = NA, sp = NA))
  xs <- 0:XMAX(Tm); P <- pi_at(m, xs)
  list(status = "fortgeschrieben", pt = first_x(P[, "fit"] >= Y), fr = first_x(P[, "U"] >= Y), sp = first_x(P[, "L"] >= Y))
}
reach_lab <- function(r, which_, Tm) if (r$status != "fortgeschrieben") r$status else lab_x(r[[which_]], Tm)

# Eine Spezifikation fuer Technologie/Fenster -> Zeile mit E2/E3/E4 (+E1b-Fortschreibung 2026)
analyse <- function(spec, tech, ser, Tm, W, mode = "ols", Y30 = Y(tech, 2030), Y26 = if (tech == "See") NA else Y(tech, 2026)) {
  ms <- (Tm - W):Tm; idx <- match(ms, ser$m); stopifnot(!anyNA(idx))
  C <- ser$C[idx]; Z <- ser$Z[idx][-1]; S <- ser$S[idx][-1]               # Inkremente x = -W+1..0
  CT <- C[length(C)]; C0 <- C[1]
  if (mode == "brutto") C <- C0 + c(0, cumsum(Z))                           # S2: Stilllegungen ignoriert
  CTm <- C[length(C)]                                                       # Bestand, auf den sich R bezieht
  x30 <- xdec(2030L, Tm); x26 <- xdec(2026L, Tm)
  m <- ols_core(C, W)
  p30 <- pi_at(m, x30); r30 <- reach(m, Y30, Tm, CTm)
  abar <- 12 * (CTm - C[1]) / W                                             # E3 (Kontrollgroesse)
  R <- (Y30 - CTm) / (x30 / 12)
  sW <- 12 * m$b; ciW <- 12 * m$cib
  zz <- 12 * sum(Z) / W; ss <- 12 * sum(S) / W
  row <- data.frame(
    spec = spec, technologie = tech, fenster = W, ende = mi_lab(Tm), n = m$n,
    C_T_GW = CTm, ziel2030_GW = Y30, a_GW = m$a, b_GW_monat = m$b, b_GW_jahr = sW, b_ci_low_jahr = ciW[1], b_ci_high_jahr = ciW[2],
    status_E2 = r30$status, punkt = reach_lab(r30, "pt", Tm), frueh = reach_lab(r30, "fr", Tm), spaet = reach_lab(r30, "sp", Tm),
    x_punkt = as.integer(r30$pt), x_frueh = as.integer(r30$fr), x_spaet = as.integer(r30$sp),
    wert2030 = p30[, "fit"], L2030 = p30[, "L"], U2030 = p30[, "U"], kat2030 = kat12(Y30, p30[, "L"], p30[, "U"], m$b),
    R_GW_jahr = R, abar_GW_jahr = abar, anteil_sW_an_R = if (R > 0) sW / R else NA, diff_R_minus_sW = if (R > 0) R - sW else NA,
    E3_hinweis = if (R <= 0) "Ziel erreicht" else "",
    Z_GW_jahr = zz, S_GW_jahr = ss, N_GW_jahr = zz - ss, Q_W_prozent = if (sum(Z) > 0) 100 * sum(S) / sum(Z) else NA,
    E4_hinweis = if (sum(Z) > 0) "" else "nicht definiert",
    stringsAsFactors = FALSE)
  if (!is.na(Y26)) {
    p26 <- pi_at(m, x26)
    row$ziel2026_GW <- Y26; row$wert2026 <- p26[, "fit"]; row$L2026 <- p26[, "L"]; row$U2026 <- p26[, "U"]
    row$kat2026 <- kat12(Y26, p26[, "L"], p26[, "U"], m$b)
  } else { row$ziel2026_GW <- NA; row$wert2026 <- NA; row$L2026 <- NA; row$U2026 <- NA; row$kat2026 <- "" }
  list(row = row, m = m, Tm = Tm, Y30 = Y30, Y26 = Y26, CT = CTm, x30 = x30, x26 = x26)
}

# Kontrollrechnung der OLS-Intervalle gegen predict() (zweiter Rechenweg)
chk <- analyse("pruefung", "Wind", SRC$prim$Wind, T_M, 24L)
pp <- predict(chk$m$fit, newdata = data.frame(x = chk$x30), interval = "prediction", level = 0.95)
logm(sprintf("Kontrolle PI Wind F24: manuell [%.6f, %.6f, %.6f] vs predict() [%.6f, %.6f, %.6f]", chk$row$L2030, chk$row$wert2030, chk$row$U2030, pp[, "lwr"], pp[, "fit"], pp[, "upr"]))
stopifnot(abs(chk$row$L2030 - pp[, "lwr"]) < 1e-9, abs(chk$row$U2030 - pp[, "upr"]) < 1e-9)
rm(chk, pp)

# ===========================================================================
# SAP 2.3 E1 (primaer): Abstand des Bestands zum Zwischenziel 2024
# ===========================================================================
logsec("SAP 2.3 E1: Abstand zum Zwischenziel 2024")
E1 <- do.call(rbind, lapply(c("Wind", "Solar"), function(p) {
  c24 <- SRC$prim[[p]]$C[SRC$prim[[p]]$m == mi(2024L, 12L)]; y24 <- Y(p, 2024)
  data.frame(technologie = unname(POPLAB[p]), bestand_dez2024_GW = c24, ziel2024_GW = y24, delta_GW = c24 - y24, delta_prozent_von_ziel = 100 * (c24 - y24) / y24,
             einordnung = if (c24 - y24 < 0) "Bestand unter dem Zwischenziel" else "Bestand auf oder ueber dem Zwischenziel")
}))
print(E1, row.names = FALSE)
for (i in seq_len(nrow(E1))) logm(sprintf("E1 %s: C(Dez 2024) = %.3f GW; Ziel %.1f GW; Delta = %.3f GW (%.2f %%): %s", E1$technologie[i],
                                          E1$bestand_dez2024_GW[i], E1$ziel2024_GW[i], E1$delta_GW[i], E1$delta_prozent_von_ziel[i], E1$einordnung[i]))
write_csv(E1, "voll_E1.csv", ZW)

# ===========================================================================
# SAP 2.3 E2-E4, E1b, 5.1: Primaeranalyse (Bruttoleistung, Netto-Bilanz, Fenster enden bei T)
# ===========================================================================
logsec("SAP 5.1 Primaeranalyse: OLS-Fortschreibung, Fenster 12/24/60, Ende T")
PRIM <- list()
for (p in c("Wind", "Solar")) for (W in FENSTER) PRIM[[paste(p, W)]] <- analyse("Primaer", p, SRC$prim[[p]], T_M, W)
PRIMROWS <- do.call(rbind, lapply(PRIM, `[[`, "row"))
for (i in seq_len(nrow(PRIMROWS))) { r <- PRIMROWS[i, ]
  logm(sprintf("Primaer %-5s F%-2d | n=%d | b=%.4f GW/Monat = %.2f GW/a [KI %.2f; %.2f] | Punkt %s, frueh %s, spaet %s | 31.12.2030: %.1f [%.1f; %.1f] vs Ziel %g | R=%.2f GW/a, s_W/R=%.2f | Q_W=%.2f %%",
               r$technologie, r$fenster, r$n, r$b_GW_monat, r$b_GW_jahr, r$b_ci_low_jahr, r$b_ci_high_jahr, r$punkt, r$frueh, r$spaet,
               r$wert2030, r$L2030, r$U2030, r$ziel2030_GW, r$R_GW_jahr, r$anteil_sW_an_R, r$Q_W_prozent)) }

# E5 (sekundaer): Wind auf See, Ziel 2030 = 30 GW (WindSeeG)
E5 <- list(); for (W in FENSTER) E5[[as.character(W)]] <- analyse("E5 Wind auf See", "See", SRC$prim$See, T_M, W, Y30 = Y("See", 2030))
E5ROWS <- do.call(rbind, lapply(E5, `[[`, "row"))
for (i in seq_len(nrow(E5ROWS))) { r <- E5ROWS[i, ]
  logm(sprintf("E5 See F%-2d | b=%.4f GW/Monat = %.2f GW/a | Punkt %s, frueh %s, spaet %s | 31.12.2030: %.1f [%.1f; %.1f] | R=%.2f, s_W/R=%.2f | Q_W=%s",
               r$fenster, r$b_GW_monat, r$b_GW_jahr, r$punkt, r$frueh, r$spaet, r$wert2030, r$L2030, r$U2030, r$R_GW_jahr, r$anteil_sW_an_R, format(r$Q_W_prozent))) }

# ===========================================================================
# SAP 2.3 E1b: Zwischenziel 2026 als Fortschreibung (kein Ist-Vergleich)
# ===========================================================================
logsec("SAP 2.3 E1b: Fortschreibung bis 31.12.2026")
E1B <- do.call(rbind, lapply(c("Wind", "Solar"), function(p) {
  y24 <- Y(p, 2024); y26 <- Y(p, 2026)
  yint <- y24 + (y26 - y24) * (T_M - mi(2024L, 12L)) / (mi(2026L, 12L) - mi(2024L, 12L))
  CT <- SRC$prim[[p]]$C[SRC$prim[[p]]$m == T_M]
  do.call(rbind, lapply(FENSTER, function(W) { r <- PRIM[[paste(p, W)]]$row
    data.frame(technologie = unname(POPLAB[p]), fenster = W, x2026 = xdec(2026L, T_M), ziel2026_GW = y26, wert_31122026_GW = r$wert2026, L = r$L2026, U = r$U2026,
               einordnung = r$kat2026, hilfsgroesse_ziel_interpoliert_T_GW = yint, C_T_GW = CT, abstand_C_T_zu_interpoliert_GW = CT - yint,
               abstand_prozent = 100 * (CT - yint) / yint) }))
}))
print(E1B[, 1:8], row.names = FALSE)
for (i in seq_len(nrow(E1B))) logm(sprintf("E1b %s F%d: Wert 31.12.2026 = %.1f [%.1f; %.1f] vs Ziel %g: %s | Hilfsgroesse (interpoliertes Ziel %s) %.1f GW, C(T)=%.1f GW, Abstand %.1f GW (%.1f %%)",
  E1B$technologie[i], E1B$fenster[i], E1B$wert_31122026_GW[i], E1B$L[i], E1B$U[i], E1B$ziel2026_GW[i], E1B$einordnung[i], mi_lab(T_M),
  E1B$hilfsgroesse_ziel_interpoliert_T_GW[i], E1B$C_T_GW[i], E1B$abstand_C_T_zu_interpoliert_GW[i], E1B$abstand_prozent[i]))
write_csv(E1B, "voll_E1b.csv", ZW)

# ===========================================================================
# SAP 5.2: Diagnostik (Linearitaet, Durbin-Watson, ACF, Shapiro-Wilk, QQ, Saisonalitaet, Cook)
# ===========================================================================
logsec("SAP 5.2 Diagnostik")
dir.create(file.path(OUT, "grafiken"), showWarnings = FALSE)
DIAG <- list(); COOK <- list()
diag_one <- function(tech, W, obj, label) {
  m <- obj$m; res <- m$res
  dw <- tryCatch(lmtest::dwtest(m$fit, alternative = "two.sided"), error = function(e) NULL)
  sw <- shapiro.test(res)
  ac <- acf(res, plot = FALSE, lag.max = min(10, m$n - 2))
  cd <- cooks.distance(m$fit); hv <- hatvalues(m$fit); thr <- 4 / m$n
  fl <- which(cd > thr)
  if (length(fl)) COOK[[paste(tech, W)]] <<- data.frame(technologie = label, fenster = W, monat = mi_lab(obj$Tm + m$x[fl]), x = m$x[fl], cook = cd[fl], schwelle_4_durch_n = thr, hebel = hv[fl])
  data.frame(technologie = label, fenster = W, n = m$n, durbin_watson = if (is.null(dw)) NA else unname(dw$statistic), dw_p_zweiseitig = if (is.null(dw)) NA else dw$p.value,
             acf_lag1 = ac$acf[2], shapiro_W = unname(sw$statistic), shapiro_p = sw$p.value, n_cook_ueber_4n = length(fl), max_cook = max(cd), max_hebel = max(hv),
             rest_se_GW = m$s)
}
for (p in c("Wind", "Solar")) for (W in FENSTER) DIAG[[paste(p, W)]] <- diag_one(p, W, PRIM[[paste(p, W)]], unname(POPLAB[p]))
for (W in FENSTER) DIAG[[paste("See", W)]] <- diag_one("See", W, E5[[as.character(W)]], "Wind auf See (E5)")
DIAGT <- do.call(rbind, DIAG); rownames(DIAGT) <- NULL
write_csv(DIAGT, "voll_diagnostik_je_fenster.csv", ZW)
COOKT <- if (length(COOK)) do.call(rbind, COOK) else data.frame()
write_csv(COOKT, "diagnostik_cook_markierungen.csv")
for (i in seq_len(nrow(DIAGT))) { d <- DIAGT[i, ]
  logm(sprintf("Diagnostik %-18s F%-2d | DW=%.3f (p=%.4f, zweiseitig) | ACF lag1=%.3f | Shapiro-Wilk W=%.4f (p=%.4f) | Cook>4/n: %d (max %.3f) | max Hebel %.3f",
               d$technologie, d$fenster, d$durbin_watson, d$dw_p_zweiseitig, d$acf_lag1, d$shapiro_W, d$shapiro_p, d$n_cook_ueber_4n, d$max_cook, d$max_hebel)) }
logm("Hinweis (SAP 5.2): Bei n = 13 und n = 25 ist die Aussagekraft von Durbin-Watson begrenzt; bei n = 13 hat Shapiro-Wilk sehr geringe Trennschaerfe.")

# Diagnostik-Grafiken (Basisgrafik, je Technologie eine Datei mit 3 Fenstern x 4 Panels)
diag_plot <- function(tech, label, objs, file) {
  png(file.path(OUT, "grafiken", file), width = 1800, height = 2100, res = 150)
  par(mfrow = c(3, 4), mar = c(4, 4, 3, 1))
  for (W in FENSTER) { o <- objs[[as.character(W)]]; m <- o$m; fv <- fitted(m$fit)
    plot(m$x, m$res, type = "b", pch = 16, xlab = "x (Monate seit T)", ylab = "Residuum (GW)", main = paste0(label, " F", W, ": Residuen ~ Zeit")); abline(h = 0, lty = 2)
    plot(fv, m$res, pch = 16, xlab = "angepasster Wert (GW)", ylab = "Residuum (GW)", main = paste0("F", W, ": Residuen ~ Fitted")); abline(h = 0, lty = 2)
    acf(m$res, lag.max = min(10, m$n - 2), main = paste0("F", W, ": ACF der Residuen"))
    qqnorm(m$res, main = paste0("F", W, ": QQ-Plot Residuen"), pch = 16); qqline(m$res) }
  dev.off()
}
diag_plot("Wind", "Wind an Land", Filter(Negate(is.null), setNames(lapply(FENSTER, function(W) PRIM[[paste("Wind", W)]]), FENSTER)), "diagnostik_wind_an_land.png")
diag_plot("Solar", "Solar", setNames(lapply(FENSTER, function(W) PRIM[[paste("Solar", W)]]), FENSTER), "diagnostik_solar.png")
diag_plot("See", "Wind auf See (E5)", E5, "diagnostik_wind_auf_see_E5.png")
logm("Diagnostik-Grafiken gespeichert: output/grafiken/diagnostik_*.png")

# Saisonalitaet des Monats-Nettozubaus im 60-Monatsfenster (5.2 Nr.4; S8 deskriptiv), Monatsinkremente (Nr.5)
SEAS <- do.call(rbind, lapply(c("Wind", "Solar"), function(p) { s <- SRC$prim[[p]]; ms <- (T_M - 59L):T_M; ix <- match(ms, s$m)
  data.frame(technologie = unname(POPLAB[p]), monat = mi_lab(ms), jahr = mi_year(ms), kalendermonat = mi_month(ms), Z_GW = s$Z[ix], S_GW = s$S[ix], N_GW = s$Z[ix] - s$S[ix]) }))
write_csv(SEAS, "saisonalitaet_monatszubau_60m_lang.csv")
SEAS_W <- do.call(rbind, lapply(split(SEAS, SEAS$technologie), function(d) { km <- sort(unique(d$kalendermonat))
  data.frame(technologie = d$technologie[1], kalendermonat = km,
             mittel_N_GW = sapply(km, function(k) mean(d$N_GW[d$kalendermonat == k])), min_N_GW = sapply(km, function(k) min(d$N_GW[d$kalendermonat == k])),
             max_N_GW = sapply(km, function(k) max(d$N_GW[d$kalendermonat == k])), n_jahre = sapply(km, function(k) sum(d$kalendermonat == k))) }))
write_csv(SEAS_W, "saisonalitaet_monatszubau_60m_je_kalendermonat.csv")
print(SEAS_W, row.names = FALSE)
SEAS$zeit <- as.Date(sprintf("%04d-%02d-15", SEAS$jahr, SEAS$kalendermonat))
SEAS$block <- paste0("Fenstermonate ", ave(seq_along(SEAS$jahr), SEAS$technologie, FUN = function(i) ((seq_along(i) - 1) %/% 12) + 1))
g_s <- ggplot(SEAS, aes(kalendermonat, N_GW, colour = factor(jahr))) + geom_line() + geom_point() + facet_wrap(~technologie, scales = "free_y", ncol = 1) +
  scale_x_continuous(breaks = 1:12) + labs(x = "Kalendermonat", y = "Netto-Zubau im Monat (GW)", colour = "Jahr", title = "Monats-Nettozubau im 60-Monatsfenster nach Kalendermonat (MaStR, Brutto-Leistung)")
ggsave(file.path(OUT, "grafiken", "diagnostik_saisonalitaet.png"), g_s, width = 9, height = 8, dpi = 150)
g_i <- ggplot(SEAS, aes(zeit, N_GW)) + geom_col(width = 25) + facet_wrap(~technologie, scales = "free_y", ncol = 1) +
  labs(x = NULL, y = "Netto-Zubau im Monat (GW)", title = "Monatsinkremente der letzten 60 Monate bis T (Strukturbruch-Sicht, 5.2 Nr.5)")
ggsave(file.path(OUT, "grafiken", "diagnostik_monatsinkremente_60m.png"), g_i, width = 9, height = 8, dpi = 150)

# ===========================================================================
# SAP 5.3: Newey-West und Residuen-Block-Bootstrap (Sensitivitaet S5)
# ===========================================================================
logsec("SAP 5.3 / S5: Newey-West und Block-Bootstrap")
BOOT_B <- 10000L; BOOT_SEED <- 20261029L
robust_one <- function(obj, Y30) {
  m <- obj$m; n <- m$n; l <- floor(4 * (n / 100)^(2 / 9))
  V <- sandwich::NeweyWest(m$fit, lag = l, prewhite = FALSE, adjust = FALSE); se_nw <- sqrt(V[2, 2])
  ci_nw <- m$b + c(-1, 1) * m$tq * se_nw
  set.seed(BOOT_SEED)
  bl <- ceiling(n^(1 / 3)); nb <- ceiling(n / bl)
  starts <- matrix(sample.int(n - bl + 1L, BOOT_B * nb, replace = TRUE), BOOT_B, nb)
  E <- matrix(0, BOOT_B, nb * bl)
  for (k in seq_len(nb)) for (j in seq_len(bl)) E[, (k - 1L) * bl + j] <- m$res[starts[, k] + j - 1L]
  E <- E[, seq_len(n), drop = FALSE]
  bstar <- m$b + as.vector(E %*% (m$x - m$xbar)) / m$Sxx
  astar <- mean(m$y) + rowMeans(E) - bstar * m$xbar
  Tm <- obj$Tm; x30 <- obj$x30; xm <- XMAX(Tm)
  xr <- ifelse(astar >= Y30, 0, ifelse(bstar > 0, ceiling((Y30 - astar) / bstar), Inf)); xr[xr > xm] <- Inf
  enew <- sample(m$res, BOOT_B, replace = TRUE)
  v30 <- astar + bstar * x30 + enew
  qx <- quantile(xr, c(0.025, 0.975), type = 1, names = FALSE); qv <- quantile(v30, c(0.025, 0.975), names = FALSE)
  lab <- function(x) if (is.infinite(x)) "nicht bis 2060 erreicht (bzw. nicht erreicht)" else lab_x(x, Tm)
  list(lag = l, se_ols = m$seb, se_nw = se_nw, ci_nw_jahr = 12 * ci_nw, block = bl, B = BOOT_B,
       t_low = lab(qx[1]), t_high = lab(qx[2]), anteil_nicht_erreicht = mean(is.infinite(xr)), v_low = qv[1], v_high = qv[2], mean_b_boot = mean(bstar))
}
S5 <- list()
for (p in c("Wind", "Solar")) for (W in FENSTER) {
  ob <- PRIM[[paste(p, W)]]; ro <- robust_one(ob, ob$Y30); r <- ob$row
  S5[[paste(p, W)]] <- data.frame(spec = "S5", technologie = unname(POPLAB[p]), fenster = W, n = ob$m$n, nw_lag = ro$lag, se_b_ols_monat = ro$se_ols, se_b_nw_monat = ro$se_nw,
    s_W_GW_jahr = r$b_GW_jahr, ci_klassisch_low = r$b_ci_low_jahr, ci_klassisch_high = r$b_ci_high_jahr, ci_nw_low = ro$ci_nw_jahr[1], ci_nw_high = ro$ci_nw_jahr[2],
    R_GW_jahr = r$R_GW_jahr, boot_blocklaenge = ro$block, boot_B = ro$B, boot_seed = BOOT_SEED,
    boot_zeitpunkt_2_5 = ro$t_low, boot_zeitpunkt_97_5 = ro$t_high, boot_anteil_nicht_erreicht = ro$anteil_nicht_erreicht,
    boot_wert2030_low = ro$v_low, boot_wert2030_high = ro$v_high, klass_wert2030 = r$wert2030, klass_L = r$L2030, klass_U = r$U2030)
  logm(sprintf("S5 %-5s F%-2d | NW-Lag %d | SE(b) klassisch %.5f, NW %.5f GW/Monat | s_W-KI klassisch [%.2f; %.2f], NW [%.2f; %.2f] GW/a | Bootstrap (Block %d, B=%d): Zeitpunkt [%s; %s], Wert 2030 [%.1f; %.1f], Anteil nicht erreicht %.3f",
               p, W, ro$lag, ro$se_ols, ro$se_nw, r$b_ci_low_jahr, r$b_ci_high_jahr, ro$ci_nw_jahr[1], ro$ci_nw_jahr[2], ro$block, ro$B, ro$t_low, ro$t_high, ro$v_low, ro$v_high, ro$anteil_nicht_erreicht))
}
S5T <- do.call(rbind, S5); rownames(S5T) <- NULL
logm("NW-Lag-Pruefung nach SAP: n=13 -> ", floor(4 * (13 / 100)^(2 / 9)), "; n=25 -> ", floor(4 * (25 / 100)^(2 / 9)), "; n=61 -> ", floor(4 * (61 / 100)^(2 / 9)),
     " (SAP: 2, 2, 3); Blocklaenge ceiling(n^(1/3)): ", ceiling(13^(1/3)), ", ", ceiling(25^(1/3)), ", ", ceiling(61^(1/3)), " (SAP: 3, 3, 4)")
write_csv(S5T, "voll_S5_autokorrelationsrobust.csv", ZW)

# ===========================================================================
# SAP 6: Sensitivitaeten S1-S9 (jede einzeln, keine Kombinationen)
# ===========================================================================
logsec("SAP 6 Sensitivitaeten")
SENS <- list(); add_s <- function(r) SENS[[length(SENS) + 1L]] <<- r
# S1: mit allen Monaten (Fenster enden bei T_S1)
for (p in c("Wind", "Solar")) for (W in FENSTER) add_s(analyse("S1 mit allen Monaten (Ende T_S1)", p, SRC$prim[[p]], T_S1, W)$row)
# S2: Brutto-Zubau statt Netto-Bilanz (Stilllegungen ignoriert)
for (p in c("Wind", "Solar")) for (W in FENSTER) add_s(analyse("S2 Brutto-Zubau (Stilllegungen ignoriert)", p, SRC$prim[[p]], T_M, W, mode = "brutto")$row)
# S6: Nettonennleistung statt Bruttoleistung
for (p in c("Wind", "Solar")) for (W in FENSTER) add_s(analyse("S6 Nettonennleistung", p, SRC$netto[[p]], T_M, W)$row)
# S7: Plausibilitaetsfaelle: (b) weiche Faelle ebenfalls ausgeschlossen
for (p in c("Wind", "Solar")) for (W in FENSTER) add_s(analyse("S7b weiche Faelle ausgeschlossen", p, SRC$weich[[p]], T_M, W)$row)
SENST <- do.call(rbind, SENS); rownames(SENST) <- NULL
for (i in seq_len(nrow(SENST))) { r <- SENST[i, ]
  logm(sprintf("%-45s %-5s F%-2d | C(T)=%.2f | b=%.4f GW/Monat | Punkt %s, frueh %s, spaet %s | 31.12.2030 %.1f [%.1f; %.1f] | R=%.2f | s_W/R=%.2f | Q_W=%.2f %%",
               r$spec, r$technologie, r$fenster, r$C_T_GW, r$b_GW_monat, r$punkt, r$frueh, r$spaet, r$wert2030, r$L2030, r$U2030, r$R_GW_jahr, r$anteil_sW_an_R, r$Q_W_prozent)) }
# E1 unter S6 und S7 (Bestand Dez 2024)
S_E1 <- do.call(rbind, lapply(c("Wind", "Solar"), function(p) data.frame(technologie = unname(POPLAB[p]),
  C_dez2024_primaer_GW = SRC$prim[[p]]$C[SRC$prim[[p]]$m == mi(2024L, 12L)],
  C_dez2024_S6_netto_GW = SRC$netto[[p]]$C[SRC$netto[[p]]$m == mi(2024L, 12L)],
  C_dez2024_S7b_ohne_weiche_GW = SRC$weich[[p]]$C[SRC$weich[[p]]$m == mi(2024L, 12L)],
  ziel2024_GW = Y(p, 2024))))
S_E1$delta_primaer <- S_E1$C_dez2024_primaer_GW - S_E1$ziel2024_GW; S_E1$delta_S6 <- S_E1$C_dez2024_S6_netto_GW - S_E1$ziel2024_GW
S_E1$delta_S7b <- S_E1$C_dez2024_S7b_ohne_weiche_GW - S_E1$ziel2024_GW
write_csv(S_E1, "voll_S6_S7_E1.csv", ZW); print(S_E1, row.names = FALSE)
for (i in seq_len(nrow(S_E1))) logm(sprintf("E1 unter S6/S7 %s: primaer %.3f GW, S6 (Netto) %.3f GW, S7b %.3f GW; Ziel %g", S_E1$technologie[i], S_E1$C_dez2024_primaer_GW[i], S_E1$C_dez2024_S6_netto_GW[i], S_E1$C_dez2024_S7b_ohne_weiche_GW[i], S_E1$ziel2024_GW[i]))
# S4: Flussmodell (Anker am letzten Bestand, ā_W), nur Punktschaetzung
S4 <- do.call(rbind, lapply(c("Wind", "Solar"), function(p) do.call(rbind, lapply(FENSTER, function(W) {
  s <- SRC$prim[[p]]; CT <- s$C[s$m == T_M]; C0 <- s$C[s$m == T_M - W]; ab <- 12 * (CT - C0) / W; Y30 <- Y(p, 2030)
  xx <- if (CT >= Y30) NA else if (ab <= 0) NA else ceiling(12 * (Y30 - CT) / ab)
  lab <- if (CT >= Y30) "Ziel bereits erreicht" else if (ab <= 0) "mit dieser Fortschreibung nicht erreicht" else if (xx > XMAX(T_M)) "nicht bis 2060 erreicht" else lab_x(xx, T_M)
  data.frame(spec = "S4 Flussmodell", technologie = unname(POPLAB[p]), fenster = W, C_T_GW = CT, abar_GW_jahr = ab, punkt = lab, wert_31122030_GW = CT + ab * xdec(2030L, T_M) / 12, ziel2030_GW = Y30)
}))))
for (i in seq_len(nrow(S4))) logm(sprintf("S4 %-12s F%-2d | C(T)=%.2f | a_bar=%.2f GW/a | Punkt %s | Wert 31.12.2030 %.1f", S4$technologie[i], S4$fenster[i], S4$C_T_GW[i], S4$abar_GW_jahr[i], S4$punkt[i], S4$wert_31122030_GW[i]))
write_csv(S4, "voll_S4_flussmodell.csv", ZW)
# S3, S8, S9
S3_TXT <- "S3: nicht durchgefuehrt, Grund: Zweitquelle nicht beschafft (kein Netzzugriff im Analyselauf; im Ordner rohdaten/ liegt keine Zweitquellen-Reihe; SAP 3.2 erlaubt Entfall ohne Amendment)."
S8_TXT <- "S8: deskriptiv durchgefuehrt (Tabelle saisonalitaet_monatszubau_60m_*.csv und Grafik diagnostik_saisonalitaet.png nach 5.2 Nr.4); als Modellvariante dient S4 (voll_S4_flussmodell.csv)."
n_ov <- sum(OV$n_ueberlappung)
S9_TXT <- if (n_ov == 0) "S9: nicht durchgefuehrt, Grund: keine Ueberlappung (0 Nummern aus GeloeschteUndDeaktivierteEinheiten_* kommen in EinheitenWind/EinheitenSolar_* vor; SAP 6, S9)." else "S9: Ueberlappung vorhanden - siehe Log"
logm(S3_TXT); logm(S8_TXT); logm(S9_TXT)
logm("Optional (SAP 3.5 Nr.7): Repowering-Abschaetzung nicht durchgefuehrt (Standortfelder wurden nicht fuer eine eindeutige Zuordnung ausgewertet; rein deskriptiv und optional laut SAP).")
logm("Zweitquellen-Plausibilisierung (SAP 3.2): nicht durchgefuehrt, Grund: Zweitquelle nicht beschafft/kein Netzzugriff; blockiert laut SAP nichts.")
writeLines(c(S3_TXT, S8_TXT, S9_TXT), file.path(OUT, "sensitivitaeten_nicht_durchgefuehrt_oder_deskriptiv.txt"))

# ===========================================================================
# SAP 11: Tabellen (gerundet nach SAP: GW 1 Nks, GW/Jahr 1 Nks, Prozent 1 Nks, Steigung/Monat 3 Nks)
# ===========================================================================
logsec("SAP 11 Tabellen und Grafiken")
rnd <- function(d) {
  int_c <- c("fenster", "n", "x_punkt", "x_frueh", "x_spaet", "nw_lag", "boot_blocklaenge", "boot_B", "boot_seed", "n_cook_ueber_4n", "x2026", "n_jahre")
  d3 <- c("a_GW", "b_GW_monat", "se_b_ols_monat", "se_b_nw_monat", "acf_lag1", "max_cook", "max_hebel", "rest_se_GW", "cook", "hebel", "schwelle_4_durch_n", "durbin_watson", "shapiro_W", "verhaeltnis")
  d4 <- c("dw_p_zweiseitig", "shapiro_p", "boot_anteil_nicht_erreicht")
  for (cn in names(d)) if (is.numeric(d[[cn]]) && !(cn %in% int_c)) d[[cn]] <- round(d[[cn]], if (cn %in% d4) 4 else if (cn %in% d3) 3 else 1)
  d
}
write_csv(rnd(data.frame(Exportdatum = as.character(EXPORT_DATE), T = mi_lab(T_M), T_S1 = mi_lab(T_S1), SAP = "v1.0 final")), "tabelle1_kopf.csv")
write_csv(psr, "tabelle1_eingabedateien_sha256.csv")
write_csv(rnd(E1), "tabelle2_E1_abstand_zwischenziel_2024.csv")
write_csv(rnd(E1B), "tabelle2_E1b_fortschreibung_2026.csv")
write_csv(PRIMROWS, "voll_tabelle3_primaer.csv", ZW); write_csv(E5ROWS, "voll_tabelle3_E5.csv", ZW)
T3 <- PRIMROWS[, c("technologie", "fenster", "ende", "C_T_GW", "Z_GW_jahr", "S_GW_jahr", "N_GW_jahr", "Q_W_prozent", "b_GW_monat", "b_GW_jahr", "b_ci_low_jahr", "b_ci_high_jahr",
                   "punkt", "frueh", "spaet", "wert2030", "L2030", "U2030", "ziel2030_GW", "kat2030", "R_GW_jahr", "anteil_sW_an_R", "diff_R_minus_sW", "abar_GW_jahr", "E3_hinweis", "E4_hinweis")]
T3$technologie <- unname(POPLAB[T3$technologie])
T3 <- merge(T3, DIAGT[, c("technologie", "fenster", "durbin_watson", "dw_p_zweiseitig", "shapiro_W", "shapiro_p")], by = c("technologie", "fenster"), sort = FALSE)
write_csv(rnd(T3), "tabelle3_E2_E3_E4_je_technologie_und_fenster.csv")
T3E5 <- E5ROWS[, c("technologie", "fenster", "ende", "C_T_GW", "Z_GW_jahr", "S_GW_jahr", "N_GW_jahr", "Q_W_prozent", "b_GW_monat", "b_GW_jahr", "b_ci_low_jahr", "b_ci_high_jahr",
                   "punkt", "frueh", "spaet", "wert2030", "L2030", "U2030", "ziel2030_GW", "kat2030", "R_GW_jahr", "anteil_sW_an_R", "diff_R_minus_sW", "abar_GW_jahr", "E3_hinweis", "E4_hinweis")]
T3E5$technologie <- "Wind auf See (E5)"
T3E5 <- merge(T3E5, DIAGT[, c("technologie", "fenster", "durbin_watson", "dw_p_zweiseitig", "shapiro_W", "shapiro_p")], by.x = c("technologie", "fenster"), by.y = c("technologie", "fenster"), sort = FALSE)
write_csv(rnd(T3E5), "tabelle3_E5_wind_auf_see.csv")
write_csv(rnd(DIAGT), "diagnostik_je_technologie_und_fenster.csv")
SENST_out <- SENST[, c("spec", "technologie", "fenster", "ende", "C_T_GW", "b_GW_monat", "b_GW_jahr", "punkt", "frueh", "spaet", "wert2030", "L2030", "U2030", "kat2030", "R_GW_jahr", "anteil_sW_an_R", "Z_GW_jahr", "S_GW_jahr", "N_GW_jahr", "Q_W_prozent", "wert2026", "L2026", "U2026", "kat2026")]
SENST_out$technologie <- unname(POPLAB[SENST_out$technologie])
write_csv(rnd(SENST_out), "tabelle4_sensitivitaeten_S1_S2_S6_S7.csv"); write_csv(SENST, "voll_tabelle4_sensitivitaeten.csv", ZW)
write_csv(rnd(S4), "tabelle4_S4_flussmodell.csv"); write_csv(rnd(S5T), "tabelle4_S5_autokorrelationsrobust.csv"); write_csv(rnd(S_E1), "tabelle4_S6_S7_E1_bestand_dez2024.csv")
write_csv(MS, "monatsreihen_bestand_zubau_stilllegung_ab2015.csv")
logm("Tabellen geschrieben (output/*.csv, Vollpraezisions-Dateien in output/zwischen/voll_*.csv)")

# ---- Grafiken 1-3 (SAP 11) --------------------------------------------------
eom <- function(m) as.Date(sprintf("%04d-%02d-01", mi_year(m + 1L), mi_month(m + 1L))) - 1
make_plot <- function(tech, title, file, y_ziele, jahre_ziel, ylab) {
  s <- SRC$prim[[tech]]; s <- s[s$m >= mi(2019L, 1L) & s$m <= T_S1, ]
  obs <- data.frame(datum = eom(s$m), C = s$C, phase = ifelse(s$m <= T_M, paste0("Bestand bis T (", mi_lab(T_M), ")"), paste0("Monate nach T bis T_S1 (nicht in Fortschreibung)")))
  zp <- data.frame(datum = as.Date(sprintf("%d-12-31", jahre_ziel)), Y = y_ziele)
  fl <- do.call(rbind, lapply(FENSTER, function(W) {
    o <- if (tech == "See") E5[[as.character(W)]] else PRIM[[paste(tech, W)]]; xs <- 0:o$x30; P <- pi_at(o$m, xs)
    data.frame(datum = eom(T_M + xs), fit = P[, "fit"], L = P[, "L"], U = P[, "U"], fenster = paste0("F", W, " (", W, " Monate)")) }))
  g <- ggplot() +
    geom_ribbon(data = fl, aes(datum, ymin = L, ymax = U, fill = fenster), alpha = 0.15) +
    geom_line(data = fl, aes(datum, fit, colour = fenster, linetype = fenster), linewidth = 0.9) +
    geom_line(data = zp, aes(datum, Y), colour = "grey30", linetype = "dashed") +
    geom_point(data = zp, aes(datum, Y), colour = "grey30", shape = 18, size = 3) +
    geom_point(data = zp[zp$datum == as.Date("2030-12-31"), ], aes(datum, Y), colour = "black", shape = 8, size = 4) +
    geom_point(data = obs, aes(datum, C, shape = phase), size = 1.2) +
    scale_linetype_manual(values = c("solid", "longdash", "dotdash"), name = "Fortschreibung") + scale_shape_manual(values = c(16, 1), name = NULL) + scale_colour_manual(values = c("#1b9e77", "#d95f02", "#7570b3"), name = "Fortschreibung") +
    scale_fill_manual(values = c("#1b9e77", "#d95f02", "#7570b3"), name = "95-%-Prognoseband") +
    labs(title = title, subtitle = paste0("Monatsende-Bestand laut MaStR (Export 29.10.2026), Bruttoleistung; Fortschreibung = Verlaengerung der OLS-Geraden je Fenster (keine Prognose). Zielpfad (gestrichelt, Linie nur zur Orientierung); Stern = Ziel 2030."),
         x = NULL, y = ylab, caption = "Fortschreibung bis 31.12.2030 dargestellt; punktweise 95-%-Prognoseintervalle der klassischen OLS.") +
    theme_minimal(base_size = 10) + theme(legend.position = "bottom", plot.subtitle = element_text(size = 7.5), legend.box = "vertical")
  ggsave(file.path(OUT, "grafiken", file), g, width = 11, height = 7, dpi = 150)
}
make_plot("Wind", "Grafik 1: Wind an Land - Bestand, Zielpfad (Paragraf 4 EEG) und Fortschreibung", "grafik1_wind_an_land.png", ZIELE$Wind, ZIELE$Jahr, "installierte Leistung (GW)")
make_plot("Solar", "Grafik 2: Solar - Bestand, Zielpfad (Paragraf 4 EEG) und Fortschreibung", "grafik2_solar.png", ZIELE$Solar, ZIELE$Jahr, "installierte Leistung (GW)")
make_plot("See", "Grafik 3 (E5): Wind auf See - Bestand, Zielpfad (WindSeeG) und Fortschreibung", "grafik3_wind_auf_see_E5.png", SEE_ZIELE$See, SEE_ZIELE$Jahr, "installierte Leistung (GW)")
logm("Grafiken gespeichert: output/grafiken/grafik1_wind_an_land.png, grafik2_solar.png, grafik3_wind_auf_see_E5.png")

logsec("Ende")
logm("Lauf beendet ohne Stopp. ", format(Sys.time()))
writeLines("Kein Stopp ausgeloest.", file.path(OUT, "STOPP_befund.txt"))
