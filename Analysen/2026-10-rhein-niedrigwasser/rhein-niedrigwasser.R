## ============================================================================
## Rhein-Niedrigwasser: Kaub NM7Q, historischer Teil (Referenzreihe bis 2025)
##
## SAP: Analysen/2026-10-rhein-niedrigwasser/SAP_rhein-niedrigwasser.md
##      Version 1.0, Status: final, freigegeben durch Daniel Saure, 19.10.2026
##      (Commit 30ee4d7). Status vor Beginn geprueft: "final".
##
## Auftragsumfang (Daniel Saure, 19.10.2026, ueber die Top-Level-Session):
##   "Datenbeschaffung BfG/DGJ/GRDC, Struktur-Check, Referenzreihe bis 2025.
##    2026 erst nach dem zweiten Abruf."
##   -> Dieses Skript rechnet NUR Teile, die ausschliesslich die historische
##      Referenzreihe H (Abflussjahre bis einschliesslich 2025) nutzen.
##   -> Die verblindete Sicherung rohdaten/pegelonline_blind/ wird von diesem
##      Skript weder geoeffnet noch gelistet noch geprueft (auch nicht ihre
##      Pruefsummen). Es werden keine PEGELONLINE-Daten abgerufen.
##
## Aufruf (aus beliebigem Verzeichnis):
##   Rscript rhein-niedrigwasser.R 2>&1 | tee run_log.txt
##
## Datenabrufe: Die Abrufe wurden am 19.10.2026 (UTC-Zeiten im Protokoll) per
##   curl durchgefuehrt und in rohdaten/abruf_log.tsv protokolliert (Zeit UTC,
##   Quelle, URL, HTTP-Status, Last-Modified, Datei, Bytes, SHA-256). Dieses
##   Skript verifiziert alle protokollierten Dateien gegen das Protokoll
##   (SAP 3.3 S1) und schreibt rohdaten/SHA256SUMS.txt.
##
## ---------------------------------------------------------------------------
## ABWEICHUNGEN VOM SAP / RUECKFRAGEN AN MENSCH (Details jeweils inline)
##
## (R1) Abweichung vom SAP - Rueckfrage an Mensch [SAP 3.1, 3.2 Plan A, 2.1 H]:
##      Die vollstaendige Q-Tagesreihe Kaub (laut DGJ-Pegelverzeichnis Q
##      vorhanden seit 01.11.1930, also H = Abflussjahre 1931-2025) ist NICHT
##      frei abrufbar. Rang 1 (DGJ, dgj-daten.bafg.de) liefert frei nur die
##      Tageswerte der Abflussjahre 2008-2025 (Jahrbuchseiten im Stammblatt-
##      PDF); auf dgj.de liegen fuer "Rheingebiet Teil III" keine
##      historischen Jahrbuch-PDFs (AJAX-Index leer, siehe Log). Rang 2 (GRDC)
##      verlangt ein Formular mit Name/E-Mail und Zustimmung zu den
##      Nutzungsbedingungen; der Download-Link kommt per E-Mail. Laut Auftrag
##      wurde dieser Pfad abgebrochen (keine Konten, keine Zugangsdaten).
##      Folge: H ist unvollstaendig. Plan A bleibt aktiv (Frist F laeuft bis
##      30.11.2026); Plan B ist NICHT ausgeloest. E1-PI, E2, Diagnostik und alle
##      H-basierten Sensitivitaeten werden erst gerechnet, wenn H vollstaendig
##      vorliegt (Gate in Abschnitt "SAP 4: Vollstaendigkeit von H").
##      Gleiches gilt fuer Koeln (S1b: Q vorhanden seit 01.11.1816 laut DGJ;
##      frei nur 2008-2025).
##
## (R2) Abweichung vom SAP - Rueckfrage an Mensch [SAP 2.1 Q(t), S1a]:
##      Rijkswaterstaat (DDL-API 2.0, CC0) liefert fuer Lobith bis 1988 KEINE
##      Tagesmittel, sondern je Tag einen Einzelwert um 08:00 MEZ ("Debiet uit
##      afvoerkromme", Steekbemonstering). Tagesmittel ("Etmaalgemiddelde",
##      GEM24H) gibt es erst ab 1989 und nur bis 01.01.2025. Fuer Jan-Okt 2025
##      liegen nur 10-Minuten-Werte vor. Der SAP definiert Q(t) als
##      Tagesmittel; Regel 3.1b (Tagesmittelbildung) gilt laut SAP nur fuer
##      PEGELONLINE. Die Lobith-Reihe wird aufbereitet und die Jahreskennwerte
##      werden tabelliert (Spalte "Tageswert_Art"), S1a wird aber NICHT
##      inferenzstatistisch gerechnet, bis Daniel entscheidet:
##        (a) 08:00-Einzelwerte vor 1989 als Tageswerte akzeptieren?
##        (b) 2025 aus 10-Minuten-Werten analog 3.1b mitteln (144 erwartete
##            Werte/Tag, gueltig ab 130)?
##      Zusatzbefund (Kontrolle Dez. 2024, output/Lobith_GEM24H_tagesdefinition_
##      kontrolle_2024-12.csv): Die RWS-"Etmaalgemiddelde" mit Etikett 00:00 ist
##      NICHT das Kalendertagsmittel [00:00, 24:00) MEZ; sie entspricht exakt dem
##      10-min-Wert um 00:00 und am ehesten einem um Mitternacht zentrierten
##      24-h-Mittel. Eine Mittelung 2025 nach 3.1b waere also mit 1989-2024 nicht
##      deckungsgleich. Die Tagesdefinition sollte bei RWS erfragt werden.
##      Parameter: ENTSCHEIDUNG_LOBITH_VOR1989, ENTSCHEIDUNG_LOBITH_2025.
##
## (R3) Rueckfrage an Mensch [SAP 6 S3c, Struktur-Check S3]: Das Stammblatt
##      Kaub dokumentiert rueckwirkend eingefuehrte neue Abflusstafeln
##      ("2015 ... rueckwirkend bis 2011", "2021 ... rueckwirkend ab/bis 2013",
##      auf einer Seite "bis 2011") sowie die PNP-Systemaenderung auf DHHN2016
##      am 01.11.2019 (betrifft nur W). Ob eine Abflusstafel-Fortschreibung als
##      "Bruch der Abflussermittlung" im Sinne von S3c gilt, ist eine fachliche
##      Wertung. Ein Bruch ab 2011/2013 laesst ohnehin n < 30; nach S3c-Regel
##      ("spaetester mit n >= 30") braeuchte es einen dokumentierten Bruch bis
##      spaetestens 1996, und die Pegelgeschichte vor 2008 ist im frei
##      verfuegbaren Stammblatt NICHT dokumentiert. Parameter
##      ENTSCHEIDUNG_S3C_BRUCHJAHR (NA = S3c nicht aktiviert).
##
## (R4) Abweichung vom SAP - Rueckfrage an Mensch [SAP 6 S10d, SAP 10]:
##      Das Paket modifiedmk (Version 1.6) enthaelt KEINE Korrektur fuer
##      Langzeitpersistenz nach Hamed (2008). Eine eigene Implementierung ist
##      noetig; die Konstanten des Signifikanztests fuer den Hurst-Koeffizienten
##      und eine moegliche Bias-Korrektur muessen gegen die Originalarbeit
##      geprueft werden, bevor S10d gerechnet wird. Hier ist S10d nur als
##      deaktivierter Platzhalter angelegt (S10D_FREIGEGEBEN <- FALSE).
##
## (R5) Hinweis an Validator [SAP 5.1 E2]: modifiedmk::mmkh prueft die
##      Signifikanz der Rang-Autokorrelationen mit dem Band +-1,96/sqrt(n).
##      In Hamed & Rao (1998) wird nach meinem Kenntnisstand das lag-abhaengige
##      Band (-1 +- 1,96*sqrt(n-k-1))/(n-k) verwendet. Bitte pruefen, ob das als
##      "Originalverfahren" gilt. Ausserdem setzt mmkh gleichabstaendige Jahre
##      voraus (relevant, falls ungueltige Jahre aus H fallen).
##
## (R6) Auslegung [SAP 4 "Fruehester Analysezeitpunkt"]: Der Satz "Vorher
##      werden keine Kennwerte berechnet, auch keine vorlaeufigen oder
##      unterjaehrigen" wird auf Kennwerte des Abflussjahres 2026 bezogen (Satz
##      steht unter "Zu bewertende Beobachtung: Abflussjahr 2026"). Historische
##      Jahreskennwerte (bis AJ 2025) werden laut Auftrag von Daniel Saure jetzt
##      berechnet. Falls der Satz woertlich fuer alle Kennwerte gemeint war:
##      Rueckfrage.
##
## (R7) Auslegung [SAP 5.2 Randpruefung]: "NM7Q-Fenster liegt in den ersten
##      oder letzten 7 Tagen" wird als Ueberlappung verstanden: Fensterbeginn
##      <= 7. Tag oder Fensterende >= 7.-letzter Tag des Abflussjahres.
##
## (R8) Auslegung [SAP 5.4/S10c]: Blockbootstrap fuer die Sen-Steigung als
##      Moving-Block-Bootstrap (Blocklaenge 5) der Sen-trendbereinigten
##      Residuen, Trend wieder addiert, Perzentil-KI 2,5/97,5 %. Der
##      Blockbootstrap-MK-Test selbst ueber modifiedmk::bbsmk (nsim = 10000,
##      bl.len = 5).
##
## Platzhalter (2026, ausserhalb dieses Auftrags): E1-Klassifikation, T2026,
## p_pred, D1, S2a, S2b, S5 (Einordnung 2026), S7, S8, Struktur-Check S5,
## D0 (a) und (c), Grafiken 1, 2, 4.
## ============================================================================

suppressPackageStartupMessages({
  library(zoo); library(trend); library(modifiedmk); library(lmom)
  library(boot); library(ggplot2); library(jsonlite); library(digest)
  library(pdftools)
})

## --------------------------------------------------------------------------
## Pfade, Seeds, Entscheidungsparameter
## --------------------------------------------------------------------------
skript_pfad <- sub("^--file=", "", grep("^--file=", commandArgs(FALSE), value = TRUE))
BASIS <- if (length(skript_pfad) == 1) normalizePath(dirname(skript_pfad), winslash = "/") else getwd()
ROH   <- file.path(BASIS, "rohdaten")
OUT   <- file.path(BASIS, "output")
dir.create(OUT, showWarnings = FALSE)

SEED <- 20261019              # SAP 10: fester Seed fuer alle Bootstrap-Verfahren
B_BOOT <- 10000               # SAP 5.4: B = 10 000
ALPHA <- 0.05                 # SAP 5.5
DELTA_VORGABE <- 0.05         # SAP 2.3 / Entscheidung 5
LETZTES_AJ_H <- 2025          # SAP 2.1: H bis einschliesslich AJ 2025

ENTSCHEIDUNG_LOBITH_VOR1989 <- NA   # (R2a) TRUE/FALSE nach Entscheidung Daniel
ENTSCHEIDUNG_LOBITH_2025    <- NA   # (R2b) TRUE/FALSE nach Entscheidung Daniel
ENTSCHEIDUNG_S3C_BRUCHJAHR  <- NA   # (R3)  erstes AJ nach dokumentiertem Bruch
S10D_FREIGEGEBEN            <- FALSE # (R4)

abschnitt <- function(txt) cat("\n", strrep("=", 76), "\n", txt, "\n", strrep("=", 76), "\n", sep = "")
fmt_p <- function(p) ifelse(is.na(p), "NA", ifelse(p < 0.01, "p < 0,01", formatC(p, format = "f", digits = 2, decimal.mark = ",")))
schreibe <- function(df, name) {
  write.csv(df, file.path(OUT, name), row.names = FALSE, fileEncoding = "UTF-8")
  cat("  -> output/", name, "\n", sep = "")
}

cat("Lauf gestartet:", format(Sys.time(), tz = "UTC", usetz = TRUE), "\n")
cat("R-Version:", R.version.string, "\n")
cat("Basisverzeichnis:", BASIS, "\n")

## ==========================================================================
## SAP 3.3 S1: Datenplan, Quellen, Pruefsummen
## ==========================================================================
abschnitt("SAP 3.3 S1: Quellen und Pruefsummenverifikation")

log_df <- read.delim(file.path(ROH, "abruf_log.tsv"), sep = "\t", quote = "",
                     colClasses = "character", encoding = "UTF-8")
# Sicherheitsnetz: Die verblindete Sicherung darf nicht im Protokoll stehen
stopifnot(!any(grepl("pegelonline_blind", log_df$datei)))

mit_datei <- log_df$http_status == "200"
log_df$vorhanden <- NA; log_df$sha256_ist <- NA; log_df$pruefung <- "kein Inhalt (HTTP 204), keine Datei"
for (i in which(mit_datei)) {
  f <- file.path(BASIS, log_df$datei[i])
  log_df$vorhanden[i] <- file.exists(f)
  if (log_df$vorhanden[i]) {
    log_df$sha256_ist[i] <- digest(f, algo = "sha256", file = TRUE)
    log_df$pruefung[i] <- ifelse(log_df$sha256_ist[i] == log_df$sha256[i], "OK", "ABWEICHUNG")
  } else log_df$pruefung[i] <- "DATEI FEHLT"
}
print(table(log_df$pruefung))
if (any(log_df$pruefung %in% c("ABWEICHUNG", "DATEI FEHLT")))
  stop("Pruefsummenverifikation fehlgeschlagen - Abbruch und Eskalation an Daniel Saure (SAP 3.1a analog).")
# Unprotokollierte Dateien in den Rohdatenordnern dieses Auftrags?
eigene_ordner <- c("dgj", "rws_lobith", "belege", "grdc_zugang", "grdc")
alle <- unlist(lapply(file.path(ROH, eigene_ordner), list.files, recursive = TRUE, full.names = TRUE))
alle_rel <- sub(paste0("^", BASIS, "/"), "", normalizePath(alle, winslash = "/"))
unprotokolliert <- setdiff(alle_rel, log_df$datei)
cat("Dateien ohne Protokolleintrag:", if (length(unprotokolliert)) paste(unprotokolliert, collapse = ", ") else "keine", "\n")
writeLines(paste0(log_df$sha256[mit_datei], "  ", log_df$datei[mit_datei]), file.path(ROH, "SHA256SUMS.txt"))
cat("  -> rohdaten/SHA256SUMS.txt (", sum(mit_datei), " Dateien)\n", sep = "")
schreibe(log_df[, c("zeit_utc", "quelle", "url", "http_status", "last_modified", "datei", "bytes", "sha256", "pruefung")],
         "S1_quellen_abrufe_pruefsummen.csv")

cat("\nPEGELONLINE (Rang 3, 2026): Pruefsummenverifikation der verblindeten Sicherung\n",
    "und des zweiten Abrufs -> PLATZHALTER. Erst nach dem zweiten Abruf (Top-Level-\n",
    "Session, spaetestens 14.11.2026). In diesem Lauf nicht beruehrt.\n", sep = "")

## ==========================================================================
## SAP 3.3 S2-S4: Struktur-Check DGJ (Jahresdefinition, Tagesgrenze,
## Pegelgeschichte, Messunsicherheit)
## ==========================================================================
abschnitt("SAP 3.3 S2-S4: Struktur-Check aus DGJ-Stammblatt und DGJ-Richtlinie")

pdf_kaub  <- file.path(ROH, "dgj", "Kaub_25700100_WQ.pdf")
pdf_koeln <- file.path(ROH, "dgj", "Koeln_2730010_WQ.pdf")
pdf_rili  <- file.path(ROH, "belege", "richtlinie_dgj.pdf")

zeilen_mit <- function(pdf, muster) {
  tx <- unlist(strsplit(pdf_text(pdf), "\n"))
  tx <- trimws(gsub("\\s+", " ", tx))
  unique(tx[grepl(muster, tx, ignore.case = TRUE)])
}
cat("S2 Jahresdefinition (Stammblatt Kaub):\n"); print(head(zeilen_mit(pdf_kaub, "Abflussjahr: 1\\.11"), 2))
cat("S2 Jahresdefinition (DGJ-Richtlinie):\n"); print(zeilen_mit(pdf_rili, "^Abflussjahr: Zeitspanne"))
cat("S2 Zeitbezug (DGJ-Richtlinie, Vorwort):\n"); print(zeilen_mit(pdf_rili, "auf MEZ zu beziehen"))
cat("S2 Tageswerte (DGJ-Richtlinie 5.1):\n"); print(zeilen_mit(pdf_rili, "^Tageswerte sind"))
cat("Befund S2: Abflussjahr 01.11.(j-1)-31.10.(j) bestaetigt; DGJ-Tageswerte sind\n",
    "Tagesmittel, Messdaten auf MEZ bezogen. Die Richtlinie praezisiert die Zuordnung\n",
    "des 00:00-Werts nicht; SAP 3.1b (halboffenes Intervall [00:00, 24:00) MEZ) steht\n",
    "nicht im Widerspruch. Keine Abweichung. Zusatzbefund: Abfluesse werden im DGJ auf\n",
    "drei gueltige Ziffern gerundet (Richtlinie, Anlage 'Genauigkeiten').\n", sep = "")

xml_txt <- readLines(file.path(ROH, "dgj", "bfg_pegel_info.xml"), encoding = "UTF-8", warn = FALSE)
pegel_meta <- function(nr) {
  i <- grep(paste0("<pgnr>", nr, "</pgnr>"), xml_txt)[1]
  blk <- xml_txt[i:(i + 25)]; blk <- blk[seq_len(grep("</pegel>", blk)[1])]
  get <- function(tag) sub(paste0(".*<", tag, ">(.*)</", tag, ">.*"), "\\1", grep(paste0("<", tag, ">"), blk, value = TRUE)[1])
  data.frame(pgnr = nr, name = get("pgname"), ezg_km2 = get("ezg"), q_vorhanden_seit = get("q_vh_seit"),
             q_veroeffentlicht_seit = get("q_vo_seit"), w_vorhanden_seit = get("w_vh_seit"))
}
meta <- rbind(pegel_meta("25700100"), pegel_meta("2730010"))
print(meta)
ERSTES_AJ <- c(Kaub = as.integer(substr(meta$q_vorhanden_seit[1], 7, 10)) + 1,
               Koeln = as.integer(substr(meta$q_vorhanden_seit[2], 7, 10)) + 1)
cat("Erstes vollstaendiges Abflussjahr der Q-Tagesreihe laut DGJ: Kaub", ERSTES_AJ["Kaub"],
    "| Koeln", ERSTES_AJ["Koeln"], "\n")

cat("\nS3 Pegelgeschichte Kaub (Hinweise im Stammblatt, AJ 2008-2025):\n")
s3 <- zeilen_mit(pdf_kaub, "Abflusstafel|neue AT|PNP-System|Jahresreihe 19|Extremwerte ab|PNP ?:")
print(s3)
cat("Befund S3: Q vorhanden ab 01.11.1930. Im Stammblatt dokumentiert: rueckwirkende\n",
    "Abflusstafel-Einfuehrungen (2015 bis 2011; 2021 bis/ab 2013, eine Seite nennt 2011),\n",
    "PNP-Systemaenderung auf DHHN2016 am 01.11.2019 (nur W). Pegelgeschichte vor 2008\n",
    "(Messmethodik, Standort) ist im frei verfuegbaren Stammblatt NICHT dokumentiert.\n",
    "-> S3c: Entscheidung Daniel (R3). Aktuell: ", ifelse(is.na(ENTSCHEIDUNG_S3C_BRUCHJAHR),
    "nicht aktiviert", ENTSCHEIDUNG_S3C_BRUCHJAHR), "\n", sep = "")
cat("Iffezheim (S3a): Kraftwerk, Schleuse und Wehr 1977 in Betrieb (Schleuse 14.03.1977;\n",
    "Beleg: Wikipedia 'Staustufe Iffezheim', Sekundaerquelle, rohdaten/belege/). Erstes\n",
    "Abflussjahr nach Inbetriebnahme = AJ 1978 (01.11.1977-31.10.1978). SAP-Wert bestaetigt.\n",
    "Primaerquellen-Beleg (WSV/WSA) steht noch aus.\n", sep = "")
cat("Bodensee (SAP 8.1): 'keinen Damm und keine Schleuse am Abfluss, daher ist eine\n",
    "kuenstliche Regulierung des Wasserstands nicht moeglich' (Wikipedia 'Bodensee',\n",
    "dort zitiert: Sieber et al., WasserWirtschaft). Nicht reguliert = Kenntnisstand des\n",
    "SAP bestaetigt (Sekundaerbeleg). Zufluss Alpenrhein durch Speicherbewirtschaftung\n",
    "beeinflusst (SAP 8.1, nicht weiter geprueft).\n", sep = "")

cat("\nS4 Messunsicherheit Q bei Niedrigwasser:\n")
s4 <- c(zeilen_mit(pdf_kaub, "unsicher|Genauigkeit|Fehler"), zeilen_mit(pdf_rili, "Unsicherheit"))
cat(if (length(s4)) paste(s4, collapse = "\n") else "(keine Angabe in Stammblatt oder Richtlinie gefunden)", "\n")
DELTA <- DELTA_VORGABE
cat("Befund S4: Keine dokumentierte Messunsicherheit -> delta = 5 % (Vorgabe SAP 2.3).\n")

## ==========================================================================
## SAP 3.1 Rang 1: DGJ-Tageswerte Q aus den Jahrbuchseiten (Stammblatt-PDF)
## ==========================================================================
abschnitt("SAP 3.1 Rang 1: DGJ-Tageswerte Q (Jahrbuchseiten AJ 2008-2025)")

MONATE <- c("Nov", "Dez", "Jan", "Feb", "Mrz", "Apr", "Mai", "Jun", "Jul", "Aug", "Sep", "Okt")

parse_dgj_q_seite <- function(p) {
  jahr <- as.integer(p$text[grepl("^(19|20)[0-9]{2}$", p$text) & p$y < 30][1])
  kopf <- p[p$text %in% MONATE & p$y > 95 & p$y < 120, ]
  kopf <- kopf[order(kopf$x), ]
  if (nrow(kopf) != 14) stop("Seite ", jahr, ": ", nrow(kopf), " Monatskoepfe statt 14")
  kx <- kopf$x + kopf$width / 2
  tage <- p[grepl("^([1-9]|[12][0-9]|3[01])\\.$", p$text) & (p$x + p$width) < kx[1] - 8 & p$y > 115 & p$y < 318, ]
  tage$tag <- as.integer(sub("\\.", "", tage$text))
  tage <- tage[order(tage$y), ]; tage <- tage[!duplicated(tage$tag), ]
  if (!all(1:31 %in% tage$tag)) stop("Seite ", jahr, ": Tageslabels unvollstaendig")
  y1 <- tage$y[tage$tag == 1]; y31 <- tage$y[tage$tag == 31]
  w <- p[grepl("^[0-9]+([.,][0-9]+)?$", p$text) & p$y >= y1 - 3 & p$y <= y31 + 3 & (p$x + p$width / 2) > kx[1] - 20, ]
  w$xc <- w$x + w$width / 2
  w$spalte <- sapply(w$xc, function(x) { d <- abs(kx - x); if (min(d) <= 16) which.min(d) else NA })
  w$tag <- sapply(w$y, function(y) { d <- abs(tage$y - y); if (min(d) <= 3.5) tage$tag[which.min(d)] else NA })
  if (any(is.na(w$spalte) | is.na(w$tag))) stop("Seite ", jahr, ": nicht zuordenbare Zahlen")
  if (any(duplicated(w[, c("spalte", "tag")]))) stop("Seite ", jahr, ": doppelte Zellen")
  mon <- c(11, 12, 1:10, 11, 12)[w$spalte]; jj <- c(jahr - 1, jahr - 1, rep(jahr, 12))[w$spalte]
  datum <- as.Date(sprintf("%04d-%02d-%02d", jj, mon, w$tag), optional = TRUE)
  if (any(is.na(datum))) stop("Seite ", jahr, ": ungueltige Datumsangaben")
  d <- data.frame(datum = datum, Q = as.numeric(sub(",", ".", w$text)), seite_jahr = jahr, spalte = w$spalte)
  d <- d[order(d$datum), ]
  # Validierung: Monats-NQ-Zeile unterhalb der Tageswerte (14 Werte)
  mins <- tapply(d$Q, d$spalte, min)
  unten <- p[grepl("^[0-9]+([.,][0-9]+)?$", p$text) & p$y > y31 + 5 & (p$x + p$width / 2) > kx[1] - 20, ]
  zeilen <- split(unten, round(unten$y / 2.5))
  treffer <- max(sapply(zeilen, function(z) {
    sp <- sapply(z$x + z$width / 2, function(x) { dd <- abs(kx - x); if (min(dd) <= 16) which.min(dd) else NA })
    v <- as.numeric(sub(",", ".", z$text)); ok <- !is.na(sp)
    sum(v[ok] == mins[as.character(sp[ok])], na.rm = TRUE)
  }))
  list(daten = d, jahr = jahr, nq_treffer = treffer, n_spalten = length(mins))
}

lies_dgj <- function(pdf, pegel) {
  pd <- pdf_data(pdf)
  ist_q <- sapply(pd, function(p) any(p$text == "Abflüsse" & p$y < 40))
  res <- lapply(pd[ist_q], parse_dgj_q_seite)
  val <- do.call(rbind, lapply(res, function(r) data.frame(pegel = pegel, seite_jahr = r$jahr,
                 n_werte = nrow(r$daten), monats_NQ_uebereinstimmung = paste0(r$nq_treffer, "/", r$n_spalten))))
  # Abflussjahr j = Spalten 1-12 der Seite j
  aj <- do.call(rbind, lapply(res, function(r) r$daten[r$daten$spalte <= 12, ]))
  # Konsistenz: Nov/Dez (Spalten 13-14) der Seite j gegen Spalten 1-2 der Seite j+1
  nd <- do.call(rbind, lapply(res, function(r) r$daten[r$daten$spalte >= 13, ]))
  m <- merge(nd, aj, by = "datum", suffixes = c("_seite_j", "_seite_j1"))
  cat(pegel, ": Nov/Dez-Doppelangaben verglichen:", nrow(m), "Tage, abweichend:",
      sum(m$Q_seite_j != m$Q_seite_j1), "(verwendet: Seite des Abflussjahres)\n")
  aj <- aj[order(aj$datum), c("datum", "Q", "seite_jahr")]
  if (any(duplicated(aj$datum))) stop(pegel, ": doppelte Tage")
  list(tage = aj, validierung = val, nd_vergleich = m)
}

dgj_kaub  <- lies_dgj(pdf_kaub, "Kaub")
dgj_koeln <- lies_dgj(pdf_koeln, "Koeln")
val <- rbind(dgj_kaub$validierung, dgj_koeln$validierung)
print(val, row.names = FALSE)
if (any(sub("/.*", "", val$monats_NQ_uebereinstimmung) != "14"))
  cat("WARNUNG: Monats-NQ-Abgleich nicht 14/14 - Parser pruefen!\n")
schreibe(val, "DGJ_parser_validierung_monats_NQ.csv")
schreibe(rbind(data.frame(pegel = "Kaub", dgj_kaub$nd_vergleich[, c("datum", "Q_seite_j", "Q_seite_j1")]),
               data.frame(pegel = "Koeln", dgj_koeln$nd_vergleich[, c("datum", "Q_seite_j", "Q_seite_j1")])),
         "DGJ_NovDez_doppelangaben_vergleich.csv")
schreibe(data.frame(pegel = "Kaub", dgj_kaub$tage, quelle = "DGJ (BfG), Stammblatt 25700100_WQ.pdf, Stand 27.07.2026"),
         "tageswerte_Q_Kaub_DGJ_AJ2008-2025.csv")
schreibe(data.frame(pegel = "Koeln", dgj_koeln$tage, quelle = "DGJ (BfG), Stammblatt 2730010_WQ.pdf, Stand lt. PDF"),
         "tageswerte_Q_Koeln_DGJ_AJ2008-2025.csv")

## ==========================================================================
## SAP 3.1 Rang 5: Rijkswaterstaat Waterinfo, Lobith (S1a)
## ==========================================================================
abschnitt("SAP 3.1 Rang 5: Rijkswaterstaat, Lobith (S1a) - Aufbereitung")

rws_reihen <- function(f) {
  x <- fromJSON(f, simplifyVector = FALSE)
  if (is.null(x$WaarnemingenLijst)) return(NULL)
  do.call(rbind, lapply(seq_along(x$WaarnemingenLijst), function(i) {
    w <- x$WaarnemingenLijst[[i]]; m <- w$MetingenLijst
    data.frame(datei = basename(f), reihe = i, reihe_n = length(m),
               zeit = sapply(m, `[[`, "Tijdstip"),
               Q = sapply(m, function(z) { v <- z$Meetwaarde$Waarde_Numeriek; if (is.null(v)) NA else v }),
               status = sapply(m, function(z) z$WaarnemingMetadata$Statuswaarde),
               bewerkung = w$AquoMetadata$WaardeBewerkingsMethode$Code,
               methode = w$AquoMetadata$WaardeBepalingsMethode$Code,
               stringsAsFactors = FALSE)
  }))
}
rws_dir <- file.path(ROH, "rws_lobith")
r_alt <- do.call(rbind, lapply(list.files(rws_dir, "^lobith_Q_alle_\\d{4}\\.json$", full.names = TRUE), rws_reihen))
r_gem <- do.call(rbind, lapply(list.files(rws_dir, "^lobith_Q_GEM24H_\\d{4}\\.json$", full.names = TRUE), rws_reihen))
r_10m <- do.call(rbind, lapply(list.files(file.path(rws_dir, "hochaufgeloest_2025"), "\\.json$", full.names = TRUE), rws_reihen))

# Zeitstempel: RWS liefert +01:00 (MEZ, ohne Sommerzeit) -> Datum = erste 10 Zeichen
stopifnot(all(substr(c(r_alt$zeit, r_gem$zeit, r_10m$zeit), 24, 29) == "+01:00"))
waehle <- function(d) {  # je Zeitstempel: "Gecontroleerd" vor "Ongecontroleerd"
  d <- d[!is.na(d$Q), ]
  d <- d[order(d$zeit, d$status != "Gecontroleerd"), ]
  konflikt <- aggregate(Q ~ zeit, d, function(v) length(unique(v)))
  list(d = d[!duplicated(d$zeit), ], n_konflikt = sum(konflikt$Q > 1))
}
a <- r_alt[r_alt$bewerkung == "NVT", ]
cat("Lobith bis 1988: Uhrzeiten der Einzelwerte:", paste(names(table(substr(a$zeit, 12, 16))), collapse = ", "), "\n")
# 10-min-Reihe: nur unbearbeitete Reihen (NVT) mit 10-Minuten-Raster (> 1000 Werte je Monatsdatei);
# die Monatsdateien enthalten ausserdem die GEM24H-Reihe und eine duennere Reihe.
r_10m_alle <- r_10m
r_10m <- r_10m[r_10m$bewerkung == "NVT" & r_10m$reihe_n > 1000, ]
a <- waehle(a); g <- waehle(r_gem[r_gem$bewerkung == "GEM24H", ]); h <- waehle(r_10m)
cat("Zeitstempel mit abweichenden Werten zwischen Reihen: bis 1988:", a$n_konflikt,
    "| GEM24H:", g$n_konflikt, "| 10-min 2024-12/2025:", h$n_konflikt, "\n")
tag_a <- data.frame(datum = as.Date(substr(a$d$zeit, 1, 10)), Q = a$d$Q, art = "08:00-Einzelwert (RWS, Q/H-Kurve)", status = a$d$status)
tag_a <- tag_a[tag_a$datum <= as.Date("1988-12-31"), ]
tag_g <- data.frame(datum = as.Date(substr(g$d$zeit, 1, 10)), Q = g$d$Q, art = paste0("Etmaalgemiddelde (RWS, ", g$d$methode, ")"), status = g$d$status)
tag_g <- tag_g[tag_g$datum >= as.Date("1989-01-01") & tag_g$datum <= as.Date("2024-12-31"), ]
# 2025: 10-Minuten-Werte -> Tagesmittel analog SAP 3.1b ([00:00, 24:00) MEZ; 144 erwartet, gueltig >= 130)
h$d$datum <- as.Date(substr(h$d$zeit, 1, 10))
tm <- aggregate(Q ~ datum, h$d, function(v) c(m = mean(v), n = length(v)))
tm <- data.frame(datum = tm$datum, Q = tm$Q[, "m"], n = tm$Q[, "n"])
# Kontrolle der Tagesdefinition der RWS-"Etmaalgemiddelde" (GEM24H) im Dezember 2024
# (einziger Monat mit GEM24H UND 10-min-Werten): Welches 24-h-Fenster bildet GEM24H ab?
zt <- function(z) as.POSIXct(substr(z, 1, 19), format = "%Y-%m-%dT%H:%M:%S", tz = "Etc/GMT-1")
gd <- r_10m_alle[r_10m_alle$bewerkung == "GEM24H" & grepl("2024-12", r_10m_alle$datei), ]
gd <- gd[!duplicated(gd$zeit), ]
hz <- zt(h$d$zeit)
fen <- function(t0, von, bis) mean(h$d$Q[hz >= t0 + von * 3600 & hz < t0 + bis * 3600])
ek <- data.frame(etikett = gd$zeit, Q_GEM24H = gd$Q,
                 Q_10min_punkt_etikett = h$d$Q[match(zt(gd$zeit), hz)],
                 mittel_0_bis_24h = sapply(zt(gd$zeit), fen, 0, 24),
                 mittel_m24_bis_0h = sapply(zt(gd$zeit), fen, -24, 0),
                 mittel_m12_bis_12h = sapply(zt(gd$zeit), fen, -12, 12))
mabw <- sapply(ek[, -(1:2)], function(v) round(100 * mean(abs(ek$Q_GEM24H / v - 1), na.rm = TRUE), 2))
cat("Kontrolle GEM24H-Tagesdefinition (Dez. 2024), mittlere |rel. Abweichung| in %:\n"); print(mabw)
cat("Befund: GEM24H ist NICHT das Kalendertagsmittel [00:00, 24:00) MEZ; der Wert entspricht\n",
    "dem 10-min-Wert zum Etikettzeitpunkt 00:00 und am ehesten einem um Mitternacht\n",
    "zentrierten 24-h-Mittel. -> Teil der Rueckfrage R2 (Tagesdefinition Lobith).\n", sep = "")
schreibe(ek, "Lobith_GEM24H_tagesdefinition_kontrolle_2024-12.csv")
tm <- tm[tm$datum >= as.Date("2025-01-01") & tm$datum <= as.Date("2025-10-31"), ]
cat("2025 (Jan-Okt), 10-min-Werte je Tag: min", min(tm$n), "max", max(tm$n), "| Tage < 130 Werte:", sum(tm$n < 130), "\n")
tag_h <- data.frame(datum = tm$datum, Q = ifelse(tm$n >= 130, tm$Q, NA),
                    art = "Tagesmittel aus 10-min-Werten (analog SAP 3.1b)", status = "gemischt")
lobith <- rbind(tag_a, tag_g, tag_h)
lobith <- lobith[order(lobith$datum), ]
stopifnot(!any(duplicated(lobith$datum)))
print(table(format(lobith$datum, "%Y") >= "1989", lobith$art))
schreibe(lobith, "tageswerte_Q_Lobith_RWS_1901-AJ2025.csv")

## ==========================================================================
## SAP 2.1 / 4 / 5.2: Jahreskennwerte NM7Q, NQ, NM30Q, Halbjahre,
## Gueltigkeit, Randjahr
## ==========================================================================
abschnitt("SAP 2.1 / 4: Jahreskennwerte je Abflussjahr")

periode <- function(datum, Q, start, ende) {
  tage <- seq(start, ende, by = "day")
  v <- Q[match(tage, datum)]
  fehlt <- is.na(v); r <- rle(fehlt)
  max_luecke <- if (any(r$values)) max(r$lengths[r$values]) else 0
  nm <- function(k) {
    if (length(v) < k) return(c(NA, NA))
    m <- as.numeric(stats::filter(v, rep(1 / k, k), sides = 1))   # NA, sobald ein Tag fehlt
    if (all(is.na(m))) return(c(NA, NA))
    i <- which.min(m); c(m[i], i)
  }
  n7 <- nm(7); n30 <- nm(30)
  list(n_tage = length(tage), n_fehl = sum(fehlt), max_luecke = max_luecke,
       gueltig = sum(fehlt) <= 0.05 * length(tage) && max_luecke <= 7,
       NM7Q = n7[1], NM7Q_von = if (is.na(n7[2])) NA else tage[n7[2] - 6], NM7Q_bis = if (is.na(n7[2])) NA else tage[n7[2]],
       NQ = if (all(fehlt)) NA else min(v, na.rm = TRUE), NM30Q = n30[1])
}

jahreskennwerte <- function(d, pegel, jahre) {
  do.call(rbind, lapply(jahre, function(j) {
    s <- as.Date(sprintf("%d-11-01", j - 1)); e <- as.Date(sprintf("%d-10-31", j))
    a <- periode(d$datum, d$Q, s, e)
    w <- periode(d$datum, d$Q, s, as.Date(sprintf("%d-04-30", j)))      # SAP S12 Winterhalbjahr
    so <- periode(d$datum, d$Q, as.Date(sprintf("%d-05-01", j)), e)    # SAP S12 Sommerhalbjahr
    rand <- if (is.na(a$NM7Q)) NA else (a$NM7Q_von <= s + 6) || (a$NM7Q_bis >= e - 6)   # (R7)
    data.frame(pegel = pegel, AJ = j, n_tage = a$n_tage, n_fehlend = a$n_fehl, max_luecke = a$max_luecke,
               gueltig = a$gueltig, NM7Q = a$NM7Q, NM7Q_fenster_von = as.Date(a$NM7Q_von, origin = "1970-01-01"),
               NM7Q_fenster_bis = as.Date(a$NM7Q_bis, origin = "1970-01-01"), randjahr = rand,
               NQ = a$NQ, NM30Q = a$NM30Q,
               NM7Q_winter = w$NM7Q, gueltig_winter = w$gueltig, NM7Q_sommer = so$NM7Q, gueltig_sommer = so$gueltig)
  }))
}

jk_kaub  <- jahreskennwerte(dgj_kaub$tage, "Kaub", 2008:LETZTES_AJ_H)
jk_koeln <- jahreskennwerte(dgj_koeln$tage, "Koeln", 2008:LETZTES_AJ_H)
jk_lob   <- jahreskennwerte(lobith, "Lobith", 1902:LETZTES_AJ_H)
art_j <- sapply(jk_lob$AJ, function(j) {
  x <- unique(lobith$art[lobith$datum >= as.Date(sprintf("%d-11-01", j - 1)) & lobith$datum <= as.Date(sprintf("%d-10-31", j))])
  paste(sub(" \\(.*", "", x), collapse = " + ")
})
jk_lob$Tageswert_Art <- art_j
cat("Kaub (DGJ): AJ", paste(range(jk_kaub$AJ), collapse = "-"), "| gueltig:", sum(jk_kaub$gueltig), "von", nrow(jk_kaub), "\n")
cat("Koeln (DGJ): AJ", paste(range(jk_koeln$AJ), collapse = "-"), "| gueltig:", sum(jk_koeln$gueltig), "von", nrow(jk_koeln), "\n")
cat("Lobith (RWS): AJ", paste(range(jk_lob$AJ), collapse = "-"), "| gueltig:", sum(jk_lob$gueltig), "von", nrow(jk_lob), "\n")
for (jk in list(jk_kaub, jk_koeln, jk_lob)) {
  ug <- jk$AJ[!jk$gueltig]
  cat("  ", jk$pegel[1], "ungueltige AJ:", if (length(ug)) paste(ug, collapse = ", ") else "keine", "\n")
}
schreibe(jk_kaub, "jahreskennwerte_Kaub_DGJ_AJ2008-2025.csv")
schreibe(jk_koeln, "jahreskennwerte_Koeln_DGJ_AJ2008-2025.csv")
schreibe(jk_lob, "jahreskennwerte_Lobith_RWS_AJ1902-2025.csv")

## ==========================================================================
## SAP 3.3 S6: Abgleich Rang 1 vs. Rang 2
## ==========================================================================
abschnitt("SAP 3.3 S6: Abgleich DGJ (Rang 1) vs. GRDC (Rang 2)")
cat("PLATZHALTER: GRDC-Daten liegen nicht vor (Formular/E-Mail noetig, siehe R1).\n",
    "Sobald GRDC-Tageswerte in rohdaten/grdc/ liegen (per .gitignore ausgeschlossen),\n",
    "werden NM7Q/NQ der ueberlappenden AJ 2008-2025 gegen die DGJ-Werte oben\n",
    "verglichen; Abweichungen > 1 % werden tabelliert (SAP 3.1 Vorrangregel).\n", sep = "")

## ==========================================================================
## SAP 3.3 S7 / 2.5: D0 (nur historischer Teil)
## ==========================================================================
abschnitt("SAP 3.3 S7 / 2.5: D0 Verifikation des Anlasses")
d0b <- zeilen_mit(pdf_kaub, "22\\.10\\.2018")
cat("D0 (b) Bisher niedrigster Wasserstand Kaub laut DGJ (Extremwerte ab 1880, Stand\n",
    "27.07.2026, bis AJ 2025): 25 cm am 22.10.2018 (Tagesmittel; im Binnenland sind die\n",
    "DGJ-Minima Tagesmittelwerte). Belegzeilen aus dem Stammblatt:\n", sep = "")
print(head(d0b, 4))
cat("Befund D0 (b): Medienangabe 'Vorrekord 24-25 cm, Oktober 2018' -> mit DGJ-Wert\n",
    "25 cm (22.10.2018) vereinbar. (Nur Wasserstand; keine Inferenz, SAP 2.5/8.2.)\n",
    "D0 (a) [-6 cm am 01.10.2026] und (c) [Copernicus-Bulletin 09/2026]: PLATZHALTER (2026).\n", sep = "")

## ==========================================================================
## SAP 5: Analysefunktionen (nur H-basierte Teile; 2026-Teile sind Platzhalter)
## ==========================================================================

# SAP 2.2 / 5.1 E1: Prognoseintervall auf Log-Skala (ohne 2026)
pi_log <- function(x, n_eff = NULL) {
  y <- log(x); n <- length(y); m <- if (is.null(n_eff)) n else n_eff
  hw <- qt(0.975, m - 1) * sd(y) * sqrt(1 + 1 / m)
  c(n = n, ybar = mean(y), s = sd(y), unten = exp(mean(y) - hw), oben = exp(mean(y) + hw))
}

# SAP 5.1 E2: Sen-Steigung mit KI nach Sen (1968), mit echten Jahresabstaenden
sen_ki <- function(t, x, conf = 0.95) {
  ij <- combn(length(x), 2)
  sl <- sort((x[ij[2, ]] - x[ij[1, ]]) / (t[ij[2, ]] - t[ij[1, ]]))
  n <- length(x); tie <- table(x)
  varS <- (n * (n - 1) * (2 * n + 5) - sum(tie * (tie - 1) * (2 * tie + 5))) / 18
  C <- qnorm(1 - (1 - conf) / 2) * sqrt(varS); N <- length(sl)
  M1 <- round((N - C) / 2); M2 <- round((N + C) / 2 + 1)
  c(sen = median(sl), unten = sl[max(1, M1)], oben = sl[min(N, M2)])
}

# SAP 5.4 / S10c (R8): Moving-Block-Bootstrap-KI der Sen-Steigung
block_sen_ki <- function(t, x, L = 5, B = B_BOOT) {
  set.seed(SEED)
  b <- sen_ki(t, x)["sen"]; res <- x - b * t; n <- length(x)
  starts <- 1:(n - L + 1)
  sl <- replicate(B, {
    idx <- unlist(lapply(sample(starts, ceiling(n / L), replace = TRUE), function(s) s:(s + L - 1)))[1:n]
    xs <- res[idx] + b * t
    sen_ki(t, xs)["sen"]
  })
  quantile(sl, c(0.025, 0.975))
}

# SAP 5.1 E2 + Sensitivitaeten S10a-c
e2 <- function(t, x) {
  hr <- mmkh(x, ci = 0.95)
  sk <- sen_ki(t, x)
  if (all(diff(t) == 1)) {   # Kreuzpruefung Sen-Steigung mit zweitem Paket (SAP 10)
    ss <- trend::sens.slope(x)
    if (abs(ss$estimates - sk["sen"]) > 1e-9) cat("WARNUNG: Sen-Steigung trend vs. eigene Funktion weicht ab\n")
    if (abs(hr[["Sen's slope"]] - sk["sen"]) > 1e-9) cat("WARNUNG: Sen-Steigung modifiedmk vs. eigene Funktion weicht ab\n")
  }
  data.frame(n = length(x), zeitraum = paste(range(t), collapse = "-"),
             sen_m3s_dekade = 10 * sk["sen"], ki_unten_dekade = 10 * sk["unten"], ki_oben_dekade = 10 * sk["oben"],
             sen_proz_median_dekade = 100 * 10 * sk["sen"] / median(x),
             tau = hr[["Tau"]], p_hamed_rao = hr[["new P-value"]], p_mk_klassisch_S10a = trend::mk.test(x)$p.value,
             p_tfpw_S10b = tfpwmk(x)[["P-value"]], row.names = NULL)
}

e2_bootstrap <- function(t, x) {   # S10c
  set.seed(SEED)
  bb <- bbsmk(x, ci = 0.95, nsim = B_BOOT, eta = 1, bl.len = 5)
  ki <- block_sen_ki(t, x)
  list(bbsmk = bb, sen_block_ki_dekade = 10 * ki)
}

e2_ltp_hamed2008 <- function(t, x) {  # S10d (R4): deaktiviert
  if (!S10D_FREIGEGEBEN) return("S10d nicht berechnet: Implementierung nach Hamed (2008) noch nicht gegen die Originalarbeit geprueft (R4).")
  stop("S10d-Implementierung fehlt (R4).")
}

# SAP 5.2 Diagnostik
diagnostik <- function(t, x) {
  y <- log(x); n <- length(y)
  ac <- acf(y, lag.max = 10, plot = FALSE)
  r1 <- ac$acf[2]; band <- qnorm(0.975) / sqrt(n)
  sen <- sen_ki(t, x)["sen"]; r1_detr <- acf(x - sen * t, lag.max = 1, plot = FALSE)$acf[2]
  pt <- trend::pettitt.test(x)
  loo <- sapply(seq_along(x), function(i) pi_log(x[-i])["unten"])
  list(shapiro_p = shapiro.test(y)$p.value, r1 = r1, r1_band = band, r1_ausserhalb = abs(r1) > band,
       ljung_box_p = Box.test(y, lag = 5, type = "Ljung-Box")$p.value, r1_trendbereinigt_E2 = r1_detr,
       pettitt_p = pt$p.value, pettitt_bruchjahr = t[pt$estimate[1]],
       loo_unten_min = min(loo), loo_unten_max = max(loo), loo_einflussreichstes_jahr = t[which.max(abs(loo - pi_log(x)["unten"]))],
       acf = ac)
}

# SAP 6 S4: GEV fuer Minima (L-Momente, -NM7Q), untere 2,5 %-Prognosegrenze per param. Bootstrap
s4_gev <- function(x) {
  set.seed(SEED)
  par <- pelgev(samlmu(-x)); n <- length(x)
  neu <- replicate(B_BOOT, {
    xs <- quagev(runif(n), par)
    pb <- tryCatch(pelgev(samlmu(xs)), error = function(e) NULL)
    if (is.null(pb)) NA else -quagev(runif(1), pb)
  })
  c(xi = par[["xi"]], alpha = par[["alpha"]], k = par[["k"]], unten_2.5_punkt = -quagev(0.975, par),
    unten_2.5_praediktiv_boot = unname(quantile(neu, 0.025, na.rm = TRUE)), boot_fehlgeschlagen = sum(is.na(neu)))
}

# SAP 6 S6a: trendbereinigtes PI fuer AJ 2026 (nur Grenzen, ohne 2026-Wert)
s6a <- function(t, x) {
  f <- lm(log(x) ~ t)
  exp(predict(f, data.frame(t = 2026), interval = "prediction", level = 0.95))
}

# SAP 6 S6b: n_eff
s6b <- function(x) {
  y <- log(x); n <- length(y); r1 <- acf(y, lag.max = 1, plot = FALSE)$acf[2]
  ne <- max(10, n * (1 - r1) / (1 + r1))
  c(n_eff = ne, pi_log(x, n_eff = ne)[c("unten", "oben")])
}

# Komplette H-basierte Auswertung fuer eine Reihe (ein Pegel, ein Kennwert)
auswertung_H <- function(jk, kennwert = "NM7Q", gueltig_spalte = "gueltig", label, nur_gueltig = TRUE, voll = TRUE) {
  d <- jk[!is.na(jk[[kennwert]]) & (if (nur_gueltig) jk[[gueltig_spalte]] else TRUE), ]
  t <- d$AJ; x <- d[[kennwert]]; n <- length(x)
  hinweis <- if (n >= 30) "" else if (n >= 10) "wenig belastbar (10 <= n < 30)" else "n < 10: PI und Trendtest entfallen, Eskalation"
  if (n < 10) return(list(label = label, n = n, hinweis = hinweis))
  out <- list(label = label, n = n, hinweis = hinweis, zeitraum = paste(range(t), collapse = "-"),
              Q_min_H = min(x), Q_min_H_AJ = t[which.min(x)],
              pi = pi_log(x), e2 = e2(t, x))
  if (voll) {
    out$diag <- diagnostik(t, x); out$s4 <- s4_gev(x); out$s6a <- s6a(t, x); out$s6b <- s6b(x)
    out$s10c <- e2_bootstrap(t, x); out$s10d <- e2_ltp_hamed2008(t, x)
  }
  out
}

## ==========================================================================
## SAP 4: Vollstaendigkeit von H (Gate)
## ==========================================================================
abschnitt("SAP 4: Vollstaendigkeit der historischen Referenzreihe H")
h_status <- data.frame(
  pegel = c("Kaub (primaer)", "Koeln (S1b)", "Lobith (S1a)"),
  H_soll = c(paste0(ERSTES_AJ["Kaub"], "-", LETZTES_AJ_H), paste0(ERSTES_AJ["Koeln"], "-", LETZTES_AJ_H), paste0("1902-", LETZTES_AJ_H)),
  n_soll = c(LETZTES_AJ_H - ERSTES_AJ["Kaub"] + 1, LETZTES_AJ_H - ERSTES_AJ["Koeln"] + 1, LETZTES_AJ_H - 1902 + 1),
  AJ_mit_Daten = c(paste(range(jk_kaub$AJ), collapse = "-"), paste(range(jk_koeln$AJ), collapse = "-"), paste(range(jk_lob$AJ), collapse = "-")),
  n_vorhanden = c(nrow(jk_kaub), nrow(jk_koeln), nrow(jk_lob)),
  n_gueltig = c(sum(jk_kaub$gueltig), sum(jk_koeln$gueltig), sum(jk_lob$gueltig)))
h_status$H_vollstaendig <- h_status$n_vorhanden == h_status$n_soll
h_status$freigabe <- c(h_status$H_vollstaendig[1], h_status$H_vollstaendig[2],
                       h_status$H_vollstaendig[3] && isTRUE(ENTSCHEIDUNG_LOBITH_VOR1989) && isTRUE(ENTSCHEIDUNG_LOBITH_2025))
h_status$grund <- c(
  ifelse(h_status$H_vollstaendig[1], "", "AJ 1931-2007 fehlen (GRDC/BfG-Anfrage ausstehend, R1)"),
  ifelse(h_status$H_vollstaendig[2], "", "AJ 1817-2007 fehlen (GRDC/BfG-Anfrage ausstehend, R1)"),
  ifelse(h_status$freigabe[3], "", "Daten vollstaendig, aber Entscheidung zu R2 (a)/(b) ausstehend"))
print(h_status, row.names = FALSE)
schreibe(h_status, "referenzreihe_H_status.csv")

ergebnisse <- list()
if (h_status$freigabe[1]) {
  abschnitt("SAP 5.1 / 5.2 / 6: Auswertung Kaub (nur H, ohne 2026)")
  jk <- jk_kaub
  ergebnisse$primaer <- auswertung_H(jk, "NM7Q", label = "Primaer: Kaub, NM7Q, AJ, H vollstaendig")
  ergebnisse$S3a <- auswertung_H(jk[jk$AJ >= 1978, ], label = "S3a: ab AJ 1978", voll = FALSE)
  ergebnisse$S3b <- auswertung_H(jk[jk$AJ >= 1996, ], label = "S3b: AJ 1996-2025", voll = FALSE)
  if (!is.na(ENTSCHEIDUNG_S3C_BRUCHJAHR))
    ergebnisse$S3c <- auswertung_H(jk[jk$AJ >= ENTSCHEIDUNG_S3C_BRUCHJAHR, ], label = "S3c: Bruchfenster", voll = FALSE)
  ergebnisse$S9 <- auswertung_H(jk, nur_gueltig = FALSE, label = "S9: inkl. ungueltiger Jahre", voll = FALSE)
  ergebnisse$S11a <- auswertung_H(jk, "NQ", label = "S11a: NQ", voll = FALSE)
  ergebnisse$S11b <- auswertung_H(jk, "NM30Q", label = "S11b: NM30Q", voll = FALSE)
  ergebnisse$S12w <- auswertung_H(jk, "NM7Q_winter", "gueltig_winter", label = "S12: Winterhalbjahr", voll = FALSE)
  ergebnisse$S12s <- auswertung_H(jk, "NM7Q_sommer", "gueltig_sommer", label = "S12: Sommerhalbjahr", voll = FALSE)
} else {
  abschnitt("SAP 5 / 6: Auswertung Kaub NICHT gerechnet")
  cat("Grund: H unvollstaendig (", h_status$grund[1], ").\n",
      "Nicht berechnet: E1-Prognoseintervall (ohne 2026), E2 (Hamed-Rao-MK, Sen), Diagnostik\n",
      "(Shapiro-Wilk, ACF/r1, Ljung-Box, Pettitt, Randjahre in H, Leave-one-out), S3a, S3b,\n",
      "S3c, S4, S6a, S6b, S9, S10a-d, S11a, S11b, S12. Eine Auswertung auf AJ 2008-2025 allein\n",
      "waere ein im SAP nicht vorgesehenes Analysefenster und wird nicht gerechnet.\n", sep = "")
  rj <- jk_kaub$AJ[which(jk_kaub$randjahr)]
  cat("Deskriptiv dokumentiert (SAP 5.2 Randpruefung, nur AJ 2008-2025): Randjahre:",
      if (length(rj)) paste(rj, collapse = ", ") else "keine", "\n")
}
if (h_status$freigabe[2]) ergebnisse$S1b <- auswertung_H(jk_koeln, label = "S1b: Koeln", voll = FALSE)
if (h_status$freigabe[3]) ergebnisse$S1a <- auswertung_H(jk_lob, label = "S1a: Lobith", voll = FALSE)
if (length(ergebnisse)) saveRDS(ergebnisse, file.path(OUT, "ergebnisse_H.rds"))

## ==========================================================================
## Funktionstest mit simulierten Daten (KEIN Ergebnis, nur Code-Pruefung)
## ==========================================================================
abschnitt("Funktionstest der Analysefunktionen mit SIMULIERTEN Daten (kein Ergebnis)")
set.seed(1)
sim_tage <- seq(as.Date("1930-11-01"), as.Date("2025-10-31"), by = "day")
sim_q <- exp(7.3 + 0.3 * sin(2 * pi * as.numeric(format(sim_tage, "%j")) / 365) +
             as.numeric(arima.sim(list(ar = 0.98), length(sim_tage), sd = 0.03)))
sim_q[sample(length(sim_q), 40)] <- NA
sim_jk <- jahreskennwerte(data.frame(datum = sim_tage, Q = sim_q), "SIMULATION", 1931:2025)
ft <- tryCatch({
  r <- auswertung_H(sim_jk, label = "SIMULATION")
  r2 <- auswertung_H(sim_jk, "NM7Q_sommer", "gueltig_sommer", label = "SIMULATION S12", voll = FALSE)
  stopifnot(is.finite(r$pi["unten"]), is.finite(r$e2$p_hamed_rao), is.finite(r$s4["unten_2.5_praediktiv_boot"]),
            is.finite(r$diag$pettitt_p), length(r$s10c$sen_block_ki_dekade) == 2, is.finite(r2$e2$sen_m3s_dekade))
  "Funktionstest bestanden: alle H-basierten Funktionen liefen fehlerfrei auf simulierten Daten."
}, error = function(e) paste("Funktionstest FEHLGESCHLAGEN:", conditionMessage(e)))
cat(ft, "\n")
writeLines(c(ft, "Simulierte Daten (Seed 1), keine Klimadaten, keine Aussage ueber den Rhein."),
           file.path(OUT, "funktionstest_simuliert.txt"))

## ==========================================================================
## Platzhalter 2026 (ausserhalb dieses Auftrags)
## ==========================================================================
abschnitt("Platzhalter: Teile mit Abflussjahr 2026")
cat("SAP 3.3 S5 (Herkunft/Abdeckung 2026, Ueberlappungspruefung), SAP 3.1b Tagesmittel,\n",
    "E1-Klassifikation, T2026, p_pred, Jaehrlichkeit, D1, S2a, S2b, S5, S7, S8, Grafiken 1/2/4:\n",
    "erst nach dem zweiten PEGELONLINE-Abruf und vollstaendigem H.\n", sep = "")

abschnitt("Session-Info (SAP 10)")
print(sessionInfo())
cat("\nLauf beendet:", format(Sys.time(), tz = "UTC", usetz = TRUE), "\n")
