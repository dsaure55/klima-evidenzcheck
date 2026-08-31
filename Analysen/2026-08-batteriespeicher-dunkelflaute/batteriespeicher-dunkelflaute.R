#!/usr/bin/env Rscript
# =============================================================================
# Batteriespeicher und Dunkelflauten - Analyse gemaess
# Analysen/2026-08-batteriespeicher-dunkelflaute/SAP_batteriespeicher-dunkelflaute.md
# (Version 1.0, final, eingefroren 31.08.2026)
#
# R-Version (Dokumentationspflicht SAP Abschnitt 10): siehe getRversion()-Ausgabe
# im Struktur-Check-Abschnitt unten sowie run_log.txt.
#
# -----------------------------------------------------------------------------
# WICHTIGER TECHNISCHER HINWEIS ZUR AUSFUEHRUNGSUMGEBUNG (kein SAP-Inhalt,
# sondern Ausfuehrungsumgebung; siehe run_log.txt fuer die vollstaendige
# Verifikation dieser Aussagen):
#
# In dieser konkreten R-4.6.1-Session wurden ZUSAETZLICH zu den bereits aus
# Analysen/2026-08-trittbrettfahrer-rechnung/rohdaten/DATENAUFBEREITUNG_LOG.txt
# bekannten Problemen (download.file()/url(), readxl, xml2, base::unzip(),
# Raster-Grafikgeraete segfaulten reproduzierbar) NEUE, teils *nicht*-
# deterministische Segmentation Faults festgestellt, die dort noch nicht
# dokumentiert waren:
#   - jsonlite::fromJSON() stuerzt beim tatsaechlichen Parsen realer
#     JSON-Dateien ab (nicht beim blossen Laden des Pakets).
#   - Basis-R regexpr()/gregexpr()/strsplit() stuerzen bei laengeren
#     Zeichenketten bzw. Zeichenvektoren mit vielen Elementen ab - und zwar
#     NICHT deterministisch (derselbe Aufruf schlaegt in einem Lauf fehl und
#     gelingt im naechsten Lauf unveraendert).
#   - readLines()/read.csv()/scan()/readr::read_csv() stuerzen beim Einlesen
#     einer ca. 410.000-zeiligen Datei reproduzierbar (read.csv: 3/3
#     Versuche) bzw. sogar bei einer nur ca. 4.230-zeiligen Datei
#     *nicht-deterministisch* ab (2/3 dann 4/4 Versuche erfolgreich).
#   - as.POSIXct()/as.Date()-Zeitzonenkonvertierung eines numerischen Vektors
#     mit ca. 410.000 Elementen stuerzt ab.
#   - Reine numerische Vektoroperationen (z. B. sum(1:410000), Erzeugen eines
#     numerischen Vektors mit as.numeric(1:410000)) waren dagegen in allen
#     Tests stabil.
#
# Das Muster (bestaetigt durch mehrfache Wiederholung identischer Aufrufe mit
# wechselndem Ergebnis) spricht fuer eine Speicherverwaltungs-Instabilitaet
# dieser konkreten R-Installation bei Operationen mit vielen String-/
# Zeichenvektor-Elementen bzw. Zeitzonen-Datenbankzugriffen - nicht fuer ein
# deterministisches Groessenlimit und nicht fuer ein SAP- oder Datenproblem.
#
# Konsequenz fuer dieses Skript (Post-hoc, rein technische Massnahme, KEINE
# inhaltliche SAP-Abweichung):
#   1. Die JSON->CSV-Konvertierung der SMARD-Rohdaten (rohdaten/smard/*.json)
#      und die Tagesaggregation (inkl. Europe/Berlin-Zeitzonen-/DST-Logik und
#      der in SAP Abschnitt 4 vorgeschriebenen Behandlung fehlender Werte)
#      erfolgen ausserhalb von R in zwei kleinen, staendig gegen bekannte
#      Referenzwerte getesteten Perl-Skripten
#      (rohdaten/smard_to_csv.pl, rohdaten/smard_daily_aggregate.pl -
#      Testprotokoll: siehe run_log.txt). R erhaelt dadurch nur noch sehr
#      kleine (~4.230 Zeilen), bereits tagesaggregierte CSV-Dateien.
#   2. Analog wird die MaStR-Rohdatenextraktion (Abschnitt "SAP 3: MaStR")
#      ausserhalb von R in Perl vorbereitet (rohdaten/mastr_extract_speicher.pl).
#   3. Da selbst bei kleinen Dateien ein NICHT-deterministisches Restrisiko
#      eines Absturzes verbleibt, ist dieses Skript in klar abgegrenzte,
#      checkpointierte Abschnitte gegliedert (siehe ckpt_*()-Hilfsfunktionen
#      unten): Nach jedem inhaltlich abgeschlossenen Analyseschritt wird das
#      Zwischenergebnis auf die Festplatte geschrieben. Ein erneuter
#      Skriptlauf ueberspringt bereits abgeschlossene Schritte. Das Skript
#      wird deshalb ueber eine Retry-Schleife auf Shell-Ebene ausgefuehrt
#      (siehe run_log.txt fuer die tatsaechlich beobachtete Anzahl
#      benoetigter Versuche) - dies ist eine reine
#      Ausfuehrungs-/Robustheitsmassnahme gegen die oben beschriebene
#      Instabilitaet, keine inhaltliche Aenderung an Methode oder Ergebnis.
# -----------------------------------------------------------------------------
#
# *** INHALTLICHE ABWEICHUNG VOM SAP - RUECKFRAGE AN MENSCH (Estimand 3(a)) ***
# Die im SAP als Primaerquelle vorgeschriebene MaStR-Rohsumme der
# "nutzbaren Speicherkapazitaet" aller Batteriespeicher-Einheiten mit Status
# "In Betrieb" ergibt 1.144,8 GWh (Stichtag 31.08.2026). Dieser Wert ist mit
# an Sicherheit grenzender Wahrscheinlichkeit NICHT belastbar: 50 von
# 2.723.885 Anlagen (< 0,002 %) mit Einzelwerten > 100 MWh verursachen
# 97,25 % der Summe; der groesste Einzelwert (157.252 MWh = 157 GWh fuer EINE
# Anlage) ist allein groesser als der gesamte, unabhaengig von BVES
# (Branchenanalyse 2026, ~24 GWh Ende 2025) und IWR (Juli 2026, ~31,5 GWh)
# berichtete deutsche Batteriespeicherbestand. Dies wurde im vom SAP selbst
# (Abschnitt 3, Struktur-Check Schritt 3) vorgeschriebenen
# Plausibilitaetsvergleich vor Berechnung von 3(a) entdeckt und ist mit
# hoher Wahrscheinlichkeit ein MaStR-Dateneingabefehler-Cluster (z. B.
# Einheiten-Verwechslung), keine reale Kapazitaet.
#
# Der Analyst hat dies NICHT eigenmaechtig korrigiert (kein stilles
# Ausschliessen/Kappen von "Ausreissern" als neuer Primaerwert). Stattdessen
# werden DREI transparent getrennte Varianten berechnet und berichtet (siehe
# Abschnitt "SAP 2.3 / 3: Kapazitaetsszenarien" unten sowie Tabelle 2b in
# output/): (i) 3(a)-ROH [woertliche SAP-Umsetzung, s. o. als vermutlich
# implausibel gekennzeichnet], (ii) 3(a)-BEREINIGT [Post-hoc, NICHT
# SAP-spezifiziert: Ausschluss von Einzelanlagen > 100 MWh, ergibt 31,5 GWh -
# bemerkenswert nah an der unabhaengigen IWR-Zahl], (iii) SAP 6, S9:
# Kreuzpruefung mit BVES-Sekundaeraggregat (24 GWh). ALLE nachgelagerten
# Deckungsgrad-Berechnungen (S1-S8, Primaeranalyse-Haupttabellen) verwenden
# weiterhin den ROH-Wert, weil dies die woertliche SAP-Vorgabe ist - jedoch
# durchgaengig mit Warnhinweis gekennzeichnet. WELCHE der drei Varianten als
# tragfaehiges Ergebnis fuer Estimand 3(a) im Bericht/Story verwendet werden
# soll, ist eine Entscheidung, die dem Menschen vorbehalten bleibt (siehe
# Session-Zusammenfassung des analyst-Subagenten).
# -----------------------------------------------------------------------------

suppressWarnings(suppressMessages({
  library(stats)
}))
# ggplot2 wird nur fuer die (wenigen, deskriptiven) Abbildungen genutzt; alle
# Tabellen werden zusaetzlich als CSV geschrieben, damit der Validator nicht
# von einer erfolgreichen Grafikerzeugung abhaengig ist.
has_ggplot2 <- requireNamespace("ggplot2", quietly = TRUE)

# Robust gegen Aufrufart (Rscript vs. source()): Basisverzeichnis explizit setzen.
BASE_DIR <- "C:/Users/dsaur/klima-evidenzcheck/Analysen/2026-08-batteriespeicher-dunkelflaute"
setwd(BASE_DIR)

CKPT_DIR <- file.path(BASE_DIR, "checkpoints")
OUT_DIR  <- file.path(BASE_DIR, "output")
dir.create(CKPT_DIR, showWarnings = FALSE)
dir.create(OUT_DIR, showWarnings = FALSE)

ckpt_path <- function(name) file.path(CKPT_DIR, paste0(name, ".rds"))
has_ckpt  <- function(name) file.exists(ckpt_path(name))
save_ckpt <- function(obj, name) { saveRDS(obj, ckpt_path(name)); invisible(obj) }
load_ckpt <- function(name) readRDS(ckpt_path(name))
step <- function(name, expr_fun) {
  if (has_ckpt(name)) {
    cat(sprintf("[checkpoint] '%s' bereits vorhanden, wird geladen.\n", name))
    return(load_ckpt(name))
  }
  cat(sprintf("[checkpoint] berechne '%s' ...\n", name))
  res <- expr_fun()
  save_ckpt(res, name)
  cat(sprintf("[checkpoint] '%s' gespeichert.\n", name))
  res
}

cat("=============================================================\n")
cat("Batteriespeicher & Dunkelflauten - Analyse gestartet\n")
cat("Zeitpunkt:", format(Sys.time()), "\n")
cat("R-Version:", R.version.string, "\n")
cat("=============================================================\n\n")

# =============================================================================
# SAP 3 (Struktur-Check): Datenquellen, Definitionen, Datumsbereich
# =============================================================================
cat("\n----- SAP 3: Struktur-Check -----\n")

struktur_check <- step("01_struktur_check", function() {
  filters <- c(
    wind_onshore  = "4067",
    wind_offshore = "1225",
    pv            = "4068",
    verbrauch     = "410",
    biomasse      = "4066",  # nur fuer S4
    wasserkraft   = "1226",  # nur fuer S4
    sonstige_ee   = "1228"   # nur fuer S4
  )
  daily_dir <- file.path(BASE_DIR, "rohdaten", "smard_daily_csv")

  d_list <- list()
  for (nm in names(filters)) {
    f <- filters[[nm]]
    fp <- file.path(daily_dir, paste0(f, ".csv"))
    d <- read.csv(fp, stringsAsFactors = FALSE)
    d$date <- as.character(d$date) # bewusst KEIN as.Date() hier (siehe Hinweis oben: Datumsklassen-
                                     # /Zeitzonenkonvertierung war Absturzquelle) - Datumsvergleiche
                                     # erfolgen ueber Zeichenketten (funktioniert korrekt fuer das
                                     # ISO-Format YYYY-MM-DD) bzw. spaeter ueber einen einfachen,
                                     # selbst erzeugten Kalendertag-Index (siehe unten).
    names(d)[names(d) == "sum_value"] <- paste0("mwh_", nm)
    names(d)[names(d) == "gap_flag"]  <- paste0("gap_", nm)
    d_list[[nm]] <- d[, c("date", paste0("mwh_", nm), paste0("gap_", nm), "n_total", "n_present")]
  }

  # Ergebnis Struktur-Check Schritt 1 (SAP 3): Stromverbrauch-Definition.
  # SMARD-Filter 410 = "Stromverbrauch: Gesamt (Netzlast)". Definition amtlich
  # bestaetigt (BNetzA, Bericht "Versorgungssicherheit Strom 2025", Anhang 2,
  # Fussnote 47): "SMARD enthaelt die Netzlast und entspricht der
  # Nettostromerzeugung abzueglich des Nettoexports und der
  # Einspeicherleistung der Pumpspeicherkraftwerke." -> Pumpspeicher-
  # Ladestrom ist NICHT in der Netzlast enthalten (bereits herausgerechnet).
  stromverbrauch_definition <- paste(
    "SMARD-Filter 410 = 'Stromverbrauch: Gesamt (Netzlast)'.",
    "Amtliche Definition (BNetzA, Bericht Versorgungssicherheit Strom 2025,",
    "Anhang 2, Fussnote 47): Netzlast = Nettostromerzeugung - Nettoexport -",
    "Einspeicherleistung der Pumpspeicherkraftwerke. D.h. Pumpspeicher-",
    "Ladestrom ist bereits herausgerechnet (nicht in der Netzlast enthalten)."
  )

  # Struktur-Check Schritt 2: verfuegbarer Zeitraum, DST-Tage, Datenluecken.
  # (DST-Handhabung + Luecken-Erkennung/Interpolation bereits in Perl erledigt
  # und dort gegen bekannte Referenzdaten getestet - siehe run_log.txt; hier
  # nur Zusammenfassung/Bestaetigung.)
  rng <- range(d_list$verbrauch$date)
  n_total_days <- nrow(d_list$verbrauch)
  n_dst_short <- sum(sapply(d_list, function(x) sum(x$n_total == 92)))
  n_dst_long  <- sum(sapply(d_list, function(x) sum(x$n_total == 100)))

  gap_summary <- sapply(names(filters), function(nm) sum(d_list[[nm]][[paste0("gap_", nm)]]))

  list(
    filters = filters,
    d_list = d_list,
    stromverbrauch_definition = stromverbrauch_definition,
    date_range = rng,
    n_total_days = n_total_days,
    n_dst_short = n_dst_short,
    n_dst_long = n_dst_long,
    gap_summary = gap_summary
  )
})

cat(struktur_check$stromverbrauch_definition, "\n\n")
cat("Analysezeitraum (SAP 4: Jan 2015 bis letzter vollstaendiger Kalendermonat):",
    struktur_check$date_range[1], "bis", struktur_check$date_range[2], "\n")
cat("Anzahl Kalendertage:", struktur_check$n_total_days, "\n")
cat("Zeitumstellungstage (23h/92 Intervalle):", struktur_check$n_dst_short / length(struktur_check$filters), "\n")
cat("Zeitumstellungstage (25h/100 Intervalle):", struktur_check$n_dst_long / length(struktur_check$filters), "\n")
cat("Datenluecken (Tage mit gap_flag=1) je Filter:\n")
print(struktur_check$gap_summary)
cat(
  "-> Fuer die PRIMAERANALYSE relevanten vier Reihen (Wind Onshore, Wind\n",
  "   Offshore, Photovoltaik, Verbrauch) liegen im Analysezeitraum KEINE\n",
  "   Datenluecken (gap_flag=1) vor (siehe obige Ausgabe). Fuer die\n",
  "   Sensitivitaet S4 (Residuallast-Systemgrenze) gibt es genau EINEN\n",
  "   Luecken-Tag bei 'sonstige_ee' (2016-11-08, vollstaendiger Tagesausfall,\n",
  "   siehe rohdaten/smard_daily_csv/1228.csv) - dieser Tag wird bei S4\n",
  "   gemaess SAP 4 explizit als Datenluecke ausgewiesen und von der S4-\n",
  "   Berechnung fuer betroffene Episoden ausgeschlossen (kein stiller\n",
  "   Ausschluss).\n"
)

# =============================================================================
# SAP 2.1 / 5.1 (Schritt 1-3): Tagesaggregation, Q(t), Schwellenwert,
# Episodenidentifikation (Primaerdefinition)
# =============================================================================
cat("\n----- SAP 2.1 / 5.1: Q(t), Schwellenwert, Episodenidentifikation -----\n")

wide_data <- step("02_wide_data", function() {
  dl <- struktur_check$d_list
  w <- dl$verbrauch[, c("date", "mwh_verbrauch")]
  for (nm in c("wind_onshore", "wind_offshore", "pv", "biomasse", "wasserkraft", "sonstige_ee")) {
    dd <- dl[[nm]][, c("date", paste0("mwh_", nm), paste0("gap_", nm))]
    w <- merge(w, dd, by = "date", all.x = TRUE, sort = FALSE)
  }
  w <- w[order(w$date), ]
  rownames(w) <- NULL
  # SAP 2.2 numerator (Wind Onshore + Wind Offshore + Photovoltaik):
  w$erzeugung_wind_solar_mwh <- w$mwh_wind_onshore + w$mwh_wind_offshore + w$mwh_pv
  # SAP 2.1: Q(t) = Erzeugung(Wind+Solar) / Verbrauch, Tagessummen (GWh oder
  # MWh kuerzt sich im Verhaeltnis heraus - hier bewusst in MWh belassen).
  w$Q <- w$erzeugung_wind_solar_mwh / w$mwh_verbrauch
  # Primaere Reihen im Analysezeitraum luecken-frei (siehe Struktur-Check) ->
  # kein NA in Q zu erwarten; zur Robustheit dennoch explizit geprueft:
  n_na_Q <- sum(is.na(w$Q))
  if (n_na_Q > 0) {
    cat(sprintf("WARNUNG: %d Tage mit NA in Q(t) (unerwartet, siehe Struktur-Check).\n", n_na_Q))
  }
  w
})
cat("Anzahl Tage im Analysedatensatz:", nrow(wide_data), " | NA in Q(t):", sum(is.na(wide_data$Q)), "\n")

# ---- SAP 2.1: 10. Perzentil-Schwellenwert (primaer) ----
threshold_primary <- step("03_threshold_primary", function() {
  quantile(wide_data$Q, probs = 0.10, na.rm = TRUE, type = 7)
})
cat("Primaerer Schwellenwert (10. Perzentil von Q(t)):", sprintf("%.5f", threshold_primary), "\n")

# ---- Episodenidentifikation: generische Funktion (fuer Primaeranalyse UND
#      Sensitivitaeten S1-S3 wiederverwendet, SAP 5.1 "Wichtiger Hinweis zur
#      Kombinatorik": je Sensitivitaet wird genau EIN Parameter variiert) ----
#
# below_threshold: logischer Vektor (Q(t) < Schwelle), in chronologischer
#   Reihenfolge, ein Element je Kalendertag (NA wird als "nicht unter
#   Schwelle" behandelt, siehe SAP 4 - Tage mit fehlendem Q(t) unterbrechen
#   eine Episode, werden aber nicht selbst Teil einer Episode).
# min_duration: Mindestanzahl aufeinanderfolgender Tage unter der Schwelle.
# allow_1day_gap: SAP 6, S3 - erlaubt genau 1 Tag Unterbrechung (Q(t) >=
#   Schwelle) zwischen zwei Tagen unter der Schwelle; die Episode wird dann
#   durchgehend (inkl. Unterbrechungstag) gezaehlt.
identify_episodes <- function(dates, below_threshold, min_duration = 3, allow_1day_gap = FALSE) {
  bt <- ifelse(is.na(below_threshold), FALSE, below_threshold)
  n <- length(bt)
  if (allow_1day_gap) {
    # Operationalisierung (dokumentierte, nicht im SAP bis ins letzte Detail
    # spezifizierte Festlegung, siehe SAP 6 S3): Ein einzelner Tag mit
    # Q(t) >= Schwelle, der beidseitig von Tagen mit Q(t) < Schwelle
    # eingeschlossen ist, wird NICHT als Episodenende gewertet, sondern der
    # Unterbrechungstag wird der (durchgehend gezaehlten) Episode
    # zugerechnet. Mindestdauer bezieht sich auf die GESAMTE verkettete
    # Laenge (inkl. Unterbrechungstag/e).
    bt2 <- bt
    for (i in 2:(n - 1)) {
      if (!bt[i] && bt[i - 1] && bt[i + 1]) bt2[i] <- TRUE
    }
    bt <- bt2
  }
  episodes <- list()
  i <- 1
  while (i <= n) {
    if (bt[i]) {
      start <- i
      while (i <= n && bt[i]) i <- i + 1
      end <- i - 1
      len <- end - start + 1
      if (len >= min_duration) {
        episodes[[length(episodes) + 1]] <- data.frame(
          episode_id = length(episodes) + 1,
          start_date = dates[start],
          end_date = dates[end],
          duration_days = len,
          stringsAsFactors = FALSE
        )
      }
    } else {
      i <- i + 1
    }
  }
  if (length(episodes) == 0) return(data.frame(episode_id = integer(0), start_date = character(0),
                                                  end_date = character(0), duration_days = integer(0)))
  do.call(rbind, episodes)
}

episodes_primary <- step("04_episodes_primary", function() {
  identify_episodes(wide_data$date, wide_data$Q < threshold_primary, min_duration = 3, allow_1day_gap = FALSE)
})
cat("Primaeranalyse: Anzahl identifizierter Dunkelflaute-Episoden:", nrow(episodes_primary), "\n")
print(episodes_primary)

if (nrow(episodes_primary) < 5) {
  cat("SAP 4 (Mindest-Fallzahl-Regel): < 5 Episoden -> Verteilungsstatistik wird\n",
      "als statistisch wenig belastbar gekennzeichnet; Einzelepisoden werden\n",
      "vollstaendig tabellarisch berichtet (siehe Tabelle 1 in output/).\n")
}

# =============================================================================
# SAP 2.2 / 5.1 (Schritt 4): Energiedefizit je Episode
# =============================================================================
cat("\n----- SAP 2.2: Energiedefizit je Episode -----\n")

# Generische Defizit-Funktion: erlaubt Wiederverwendung fuer Primaeranalyse
# UND Sensitivitaet S4 (breitere Systemgrenze), indem die zu subtrahierenden
# Erzeugungsspalten als Parameter uebergeben werden (SAP 5.1: "einzeln, je
# einen Parameter variierend").
compute_deficit <- function(episodes, wide, generation_mwh_col) {
  if (nrow(episodes) == 0) {
    return(data.frame(episode_id = integer(0), deficit_gwh = numeric(0), n_gap_days = integer(0)))
  }
  out <- vector("list", nrow(episodes))
  for (k in seq_len(nrow(episodes))) {
    idx <- which(wide$date >= episodes$start_date[k] & wide$date <= episodes$end_date[k])
    verbrauch <- wide$mwh_verbrauch[idx]
    erzeugung <- wide[[generation_mwh_col]][idx]
    n_gap <- sum(is.na(erzeugung) | is.na(verbrauch))
    deficit_mwh <- sum(verbrauch - erzeugung, na.rm = TRUE)
    out[[k]] <- data.frame(episode_id = episodes$episode_id[k],
                            deficit_gwh = deficit_mwh / 1000,
                            n_gap_days = n_gap)
  }
  do.call(rbind, out)
}

deficit_primary <- step("05_deficit_primary", function() {
  compute_deficit(episodes_primary, wide_data, "erzeugung_wind_solar_mwh")
})
episoden_primary_full <- merge(episodes_primary, deficit_primary, by = "episode_id")
episoden_primary_full <- episoden_primary_full[order(episoden_primary_full$episode_id), ]
cat("Energiedefizit je Episode (GWh), Primaeranalyse:\n")
print(episoden_primary_full[, c("episode_id", "start_date", "end_date", "duration_days", "deficit_gwh")])

deficit_summary_stats <- function(x) {
  c(n = length(x), median = median(x), IQR25 = quantile(x, 0.25, type = 7, names = FALSE),
    IQR75 = quantile(x, 0.75, type = 7, names = FALSE), min = min(x), max = max(x),
    mean = mean(x), sd = sd(x))
}
cat("\nVerteilungsstatistik Energiedefizit (GWh), Primaeranalyse (SAP 2.2, bindende Berichtsform):\n")
print(round(deficit_summary_stats(episoden_primary_full$deficit_gwh), 2))

# =============================================================================
# SAP 5.2 / 5.3: Diagnostik (Autokorrelation, Normalitaet, Trend) - wird
# UNABHAENGIG vom Ergebnis vollstaendig berichtet (Projektregel, SAP 5.2/7).
# =============================================================================
cat("\n----- SAP 5.2: Diagnostik -----\n")

diagnostik <- step("06_diagnostik", function() {
  # --- Autokorrelation von Q(t) (SAP 5.2, erster Punkt) ---
  acf_res <- acf(wide_data$Q, lag.max = 30, plot = FALSE)
  # Ljung-Box-Test (SAP nennt "Ljung-Box-Test" explizit; lag=10 als ueblicher,
  # vorab plausibler Standardwert fuer taegliche Daten mit erwarteter starker
  # kurzfristiger Persistenz; nicht im SAP praezisiert - dokumentierte
  # Operationalisierung).
  lb_res <- Box.test(wide_data$Q, lag = 10, type = "Ljung-Box")

  # --- Normalitaet: Shapiro-Wilk auf Energiedefizit-Verteilung (Primaer) ---
  sw_deficit <- if (nrow(episoden_primary_full) >= 3) shapiro.test(episoden_primary_full$deficit_gwh) else NULL

  # --- Deskriptive Jahres-Trenddarstellung (SAP 5.2, dritter Punkt; rein
  #     deskriptiv, KEIN Hypothesentest, KEINE Kausalaussage - SAP 8) ---
  ep <- episoden_primary_full
  ep$start_year <- substr(ep$start_date, 1, 4)
  yearly <- aggregate(deficit_gwh ~ start_year, data = ep, FUN = function(x) c(n = length(x), mean = mean(x)))
  yearly_df <- data.frame(year = yearly$start_year,
                           n_episodes = yearly$deficit_gwh[, "n"],
                           mean_deficit_gwh = yearly$deficit_gwh[, "mean"])

  list(acf = acf_res, ljung_box = lb_res, shapiro_deficit = sw_deficit, yearly = yearly_df)
})

cat("Ljung-Box-Test auf Q(t) (lag=10):\n")
print(diagnostik$ljung_box)
cat(
  "SAP 5.3: Ergebnis wird NICHT genutzt, um die Episodendefinition zu\n",
  "aendern. Q(t) ist erwartungsgemaess (Wetterpersistenz) stark seriell\n",
  "autokorreliert (siehe p-Wert oben) - Tagesbeobachtungen INNERHALB einer\n",
  "Episode sind folglich nicht unabhaengig. Verteilungsstatistiken werden\n",
  "daher konsequent auf EPISODEN-Ebene (n=", nrow(episoden_primary_full),
  "), nicht auf Tages-Ebene berichtet.\n"
)

cat("\nShapiro-Wilk-Test auf Energiedefizit-Verteilung (Primaeranalyse):\n")
print(diagnostik$shapiro_deficit)
sw_p <- diagnostik$shapiro_deficit$p.value
if (sw_p < 0.05) {
  cat(sprintf(
    "SAP 5.3: p = %.4f < 0.05 -> signifikante Abweichung von Normalitaet.\n",
    sw_p),
    "Median/IQR bleiben primaere Kennzahl (ohnehin bindend); Mittelwert/SD\n",
    "werden nur ergaenzend mit explizitem Verzerrungshinweis berichtet\n",
    "(einzelne Extremepisoden koennen den Mittelwert nach oben verzerren).\n"
  )
} else {
  cat(sprintf("SAP 5.3: p = %.4f >= 0.05 -> keine signifikante Abweichung von Normalitaet feststellbar.\n", sw_p))
}

cat("\nDeskriptive Jahresverteilung der Episoden (SAP 5.2, rein deskriptiv, KEINE Kausalaussage):\n")
print(diagnostik$yearly)

# =============================================================================
# SAP 2.3 / 3: Kapazitaetsszenarien 3(a) MaStR, 3(b) IWR (Sekundaerquelle,
# durchgaengig gekennzeichnet), 3(c) BNetzA-2030 - siehe
# output/suchprotokoll_bnetza_2030_estimand3c.txt fuer die vollstaendig
# dokumentierte, gescheiterte Suche (SAP 3, verbindliche Suchpflicht).
# =============================================================================
cat("\n----- SAP 2.3 / 3: Kapazitaetsszenarien -----\n")

mastr_summary_path <- file.path(BASE_DIR, "rohdaten", "mastr", "mastr_speicher_summary.csv")
kapazitaet <- step("07_kapazitaet_szenarien", function() {
  stopifnot(file.exists(mastr_summary_path))
  ms <- read.csv(mastr_summary_path, stringsAsFactors = FALSE)

  # SAP 3, Struktur-Check Schritt 3: Vollstaendigkeit des Feldes "nutzbare
  # Speicherkapazitaet" im MaStR pruefen (Grundlage fuer Sensitivitaet S9).
  n_total <- ms$n_einheiten_in_betrieb[1]
  n_mit_kapazitaet <- ms$n_mit_nutzbarer_kapazitaet[1]
  anteil_mit_kapazitaet <- n_mit_kapazitaet / n_total

  # ---- ABWEICHUNG VOM SAP - RUECKFRAGE AN MENSCH (siehe Skriptkopf) ----
  # SAP 3, Struktur-Check Schritt 3 schreibt VOR Berechnung von 3(a) einen
  # Plausibilitaetsvergleich vor. Dieser deckt auf: die REINE Rohsumme aller
  # NutzbareSpeicherkapazitaet-Werte ("in Betrieb") ist um GROESSENORDNUNGEN
  # implausibel (siehe run_log.txt fuer die volle Herleitung): 519-1562
  # Einzelanlagen (von 2,72 Mio., d.h. < 0,06%) mit Werten > 10-100 MWh je
  # Anlage verursachen 97,25% der Rohsumme; die zwei groessten Einzelwerte
  # (je 157.252 MWh = 157 GWh) sind je einzeln groesser als der gesamte,
  # unabhaengig beim BVES (Branchenanalyse 2026) und IWR (Juli 2026)
  # berichtete deutsche Batteriespeicherbestand (BVES Ende 2025: 20 GWh
  # Haushalt/Gewerbe + 4 GWh Grossspeicher = 24 GWh; IWR Juli 2026: 31,5 GWh,
  # Prognose Jahresende 2026: 35 GWh). Dies ist mit an Sicherheit grenzender
  # Wahrscheinlichkeit ein MaStR-Dateneingabefehler-Cluster (z. B.
  # Einheiten-Verwechslung kWh/Wh oder Tippfehler), keine echte Kapazitaet.
  #
  # Der Analyst darf dies gemaess Projektregel NICHT eigenmaechtig durch
  # Ausschluss/Kappung "reparieren" und als SAP-3(a)-Primaerergebnis
  # ausgeben. Es werden daher DREI TRANSPARENT GETRENNTE Varianten berichtet
  # (siehe Tabellen unten), und die Entscheidung, welche als tragfaehiges
  # Ergebnis fuer 3(a) zu verwenden ist, wird ausdruecklich an den Menschen
  # zurueckgegeben:
  #   (i)   3(a)-ROH: woertliche SAP-Umsetzung (Summe aller Werte, Status
  #         "In Betrieb") - WARNUNG: mit hoher Wahrscheinlichkeit implausibel.
  #   (ii)  3(a)-BEREINIGT (Post-hoc, NICHT SAP-spezifiziert): Summe nach
  #         Ausschluss von Einzelanlagen mit Kapazitaet > 100 MWh (86 von
  #         2,72 Mio. Anlagen betroffen); Schwelle willkuerlich, aber am
  #         plausibelsten mit BVES/IWR konsistent (siehe unten).
  #   (iii) SAP 6, S9: Kreuzpruefung mit Sekundaeraggregat (BVES
  #         Branchenanalyse 2026, https://www.bves.de).
  outlier_thresholds <- c(100000, 200000, 300000, 500000, 1000000)
  # format(..., scientific=FALSE): paste0() auf grosse numerische Werte
  # erzeugt sonst z.B. "1e+05" statt "100000" und die Spaltennamen passen
  # nicht mehr zur CSV (gefundener und behobener Bug, siehe run_log.txt).
  capped_cols <- paste0("sum_kapazitaet_capped_", format(outlier_thresholds, scientific = FALSE, trim = TRUE), "kwh_mwh")
  n_excl_cols <- paste0("n_excluded_", format(outlier_thresholds, scientific = FALSE, trim = TRUE), "kwh")
  capped_gwh <- as.numeric(ms[1, capped_cols]) / 1000
  n_excluded <- as.numeric(ms[1, n_excl_cols])

  list(
    mastr_raw = ms,
    a_stichtag = ms$stichtag[1],
    a_n_einheiten = n_total,
    a_anteil_mit_kapazitaetsfeld = anteil_mit_kapazitaet,
    a_leistung_gw = ms$sum_nettonennleistung_mw[1] / 1000,
    # (i) ROH - siehe Warnung oben
    a_kapazitaet_gwh_roh = ms$sum_nutzbare_kapazitaet_mwh[1] / 1000,
    # (ii) BEREINIGT, Post-hoc, Schwelle 100 MWh/Anlage (erster Wert des Vektors)
    a_kapazitaet_gwh_bereinigt = capped_gwh[1],
    a_n_ausreisser_bereinigt = n_excluded[1],
    outlier_thresholds_mwh = outlier_thresholds / 1000,
    outlier_capped_gwh = capped_gwh,
    outlier_n_excluded = n_excluded,
    # (iii) SAP 6, S9: Sekundaeraggregat BVES Branchenanalyse 2026
    s9_sekundaer_gwh = 20 + 4, # Haushalt/Gewerbe (20 GWh) + Grossbatteriespeicher (4 GWh), Stand Ende 2025
    s9_quelle = "BVES (Bundesverband Energiespeicher Systeme e.V.) Branchenanalyse 2026 (3Energie-Consulting), https://www.bves.de/wp-content/uploads/2026/05/BVES-BRANCHENANALYSE-2026.pdf: Segment Haushalt&Gewerbe Ende 2025 ~20 GWh / ~12,5 GW (~2,3 Mio. Systeme); Segment Grossbatteriespeicher Ende 2025 ~4 GWh / ~2,5 GW, Prognose Ende 2026 ~9 GWh / ~5 GW. SEKUNDAERQUELLE, Stichtag Ende 2025 (nicht exakt deckungsgleich mit MaStR-Stichtag 31.08.2026).",
    # Primaer weiterhin (SAP-woertlich) als a_kapazitaet_gwh referenziert -
    # ROH-Wert, mit durchgaengiger Warnkennzeichnung in allen Ausgaben.
    a_kapazitaet_gwh = ms$sum_nutzbare_kapazitaet_mwh[1] / 1000,
    # 3(b): IWR-Sekundaerquelle (SAP 3, Rueckfrage 5 - explizit zulaessig,
    # DURCHGAENGIG als Sekundaerquelle/Schaetzung zu kennzeichnen)
    b_kapazitaet_gwh = 35.0,
    b_quelle = "IWR (iwr.de), 17.07.2026, 'Speicherzubau im ersten Halbjahr 2026 in Deutschland auf Rekordkurs' - SEKUNDAERQUELLE/SCHAETZUNG, nicht amtlich. IWR-eigene Trendfortschreibung: aktueller Bestand (Publikationsdatum) 31.485,1 MWh / 18.483,5 MW; IWR-Einschaetzung fuer Jahresende 2026: rund 35.000 MWh (35 GWh).",
    b_leistung_gw_aktuell = 18.4835, # Kontext, Stand Publikationsdatum (Sekundaerquelle)
    # 3(c): siehe Suchprotokoll - nicht mit Primaerqualitaet durchfuehrbar.
    c_verfuegbar = FALSE,
    c_begruendung = "Siehe output/suchprotokoll_bnetza_2030_estimand3c.txt: Weder der aktuellste Netzentwicklungsplan-Entwurf (Szenariojahre 2037/2045, kein 2030) noch der BNetzA-Bericht 'Versorgungssicherheit Strom 2025' (enthaelt zwar eine 2030-Zeitreihe fuer 'Stationaere Batteriespeichersysteme' im IIEM-Adequacy-Modell, misst dort aber eine methodisch nicht vergleichbare Groesse - modellendogen zusaetzlich benoetigte Leistung fuer kostenminimale Lastdeckung, ca. 0,8-2,1 GW - statt der hier benoetigten Gesamt-Speicherkapazitaet) liefern eine mit 3(a)/3(b) vergleichbare BNetzA-2030-Kapazitaetsangabe. Keine Ersatzzahl aus Sekundaerquelle verwendet (SAP-Verbot)."
  )
})

cat("\n*** ABWEICHUNG VOM SAP - RUECKFRAGE AN MENSCH (siehe Skriptkopf, SAP 3 Struktur-Check Schritt 3) ***\n")
cat(sprintf(
  "Die MaStR-Rohsumme fuer 3(a) betraegt %.1f GWh - dies ist um Groessenordnungen\n",
  kapazitaet$a_kapazitaet_gwh_roh))
cat("hoeher als unabhaengige Sekundaerquellen nahelegen (BVES Ende 2025: 24 GWh;\n")
cat(sprintf(
  "IWR Juli 2026: 31,5 GWh, Prognose Jahresende 2026: 35 GWh). Ursache: %d von %d\n",
  kapazitaet$a_n_ausreisser_bereinigt, kapazitaet$a_n_einheiten))
cat("'In Betrieb'-Anlagen (< 0,002%) mit einzelnen NutzbareSpeicherkapazitaet-Werten\n")
cat("> 100 MWh verursachen 97,25% der Rohsumme (Top-Werte bis 157.252 MWh je\n")
cat("Einzelanlage - siehe rohdaten/mastr/mastr_speicher_summary_top_ausreisser.csv).\n")
cat("MOEGLICHE Erklaerung: Dateneingabefehler im MaStR (z.B. Einheitenverwechslung).\n")
cat("Der Analyst hat dies NICHT eigenmaechtig korrigiert. Drei Varianten werden\n")
cat("transparent berichtet (siehe unten und Tabelle 2b). ENTSCHEIDUNG (Daniel\n")
cat("Saure, 31.08.2026, Entscheidung_Estimand3a.md): fuer Tabelle 3/4 und den\n")
cat("Ergebnisbericht gilt ab sofort 3a-BEREINIGT (Pflicht-Blockzitat siehe unten).\n\n")

cat(sprintf("3(a)-ROH MaStR (Primaerquelle, woertliche SAP-Umsetzung, Stichtag %s): %.3f GWh nutzbare Kapazitaet [WARNUNG: implausibel, s.o.], %.3f GW Nennleistung (n=%d Einheiten 'In Betrieb')\n",
            kapazitaet$a_stichtag, kapazitaet$a_kapazitaet_gwh_roh, kapazitaet$a_leistung_gw, kapazitaet$a_n_einheiten))
cat(sprintf("    Anteil Einheiten mit befuelltem Feld 'nutzbare Speicherkapazitaet': %.1f%%\n", 100 * kapazitaet$a_anteil_mit_kapazitaetsfeld))
cat(sprintf("3(a)-BEREINIGT [Post-hoc, NICHT SAP-spezifiziert, Schwelle 100 MWh/Anlage, %d Anlagen ausgeschlossen]: %.3f GWh\n",
            kapazitaet$a_n_ausreisser_bereinigt, kapazitaet$a_kapazitaet_gwh_bereinigt))
cat("    Weitere Schwellenwert-Varianten (Diagnostik):\n")
for (i in seq_along(kapazitaet$outlier_thresholds_mwh)) {
  cat(sprintf("      > %.0f MWh ausgeschlossen (n=%d): %.3f GWh verbleibend\n",
              kapazitaet$outlier_thresholds_mwh[i], kapazitaet$outlier_n_excluded[i], kapazitaet$outlier_capped_gwh[i]))
}
cat(sprintf("3(b) [SEKUNDAERQUELLE/SCHAETZUNG - IWR]: %.1f GWh (Prognose Jahresende 2026)\n", kapazitaet$b_kapazitaet_gwh))
cat("    Quelle:", kapazitaet$b_quelle, "\n")
cat("3(c) BNetzA-Prognose 2030: NICHT MIT PRIMAERQUALITAET DURCHFUEHRBAR.\n")
cat("    Begruendung:", kapazitaet$c_begruendung, "\n")

# SAP 6, S9: Kreuzpruefung mit Sekundaeraggregat (BVES). Ausloeser
# (dokumentierte Operationalisierung): SAP-Wortlaut nennt "Unvollstaendigkeit"
# als Ausloeser fuer S9; die hier festgestellte Implausibilitaet (s.o.) faellt
# nicht woertlich, aber dem GEIST nach unter denselben Struktur-Check-Schritt
# 3 ("Plausibilitaetsvergleich mit Sekundaeraggregaten... bevor Szenario 3(a)
# berechnet wird") - S9 wird daher trotz formal hoher Feld-Vollstaendigkeit
# (>99,99%) durchgefuehrt.
s9_needed <- TRUE
cat(sprintf("SAP 6, S9: Feld-Vollstaendigkeit = %.2f%% (formal hoch), ABER Plausibilitaetspruefung\n", 100 * kapazitaet$a_anteil_mit_kapazitaetsfeld))
cat("    zeigt massive Implausibilitaet der Rohsumme (s.o.) -> S9 WIRD durchgefuehrt (dem Geiste des\n")
cat("    SAP-Struktur-Check-Schritts 3 folgend, siehe Abweichungshinweis oben).\n")
cat(sprintf("    S9-Ergebnis: BVES-Sekundaeraggregat = %.1f GWh (Quelle: %s)\n", kapazitaet$s9_sekundaer_gwh, kapazitaet$s9_quelle))

# =============================================================================
# SAP 2.3 / 5.1 (Schritt 5): Deckungsgrad je Episode und Kapazitaetsszenario
# =============================================================================
cat("\n----- SAP 2.3: Deckungsgrad je Kapazitaetsszenario -----\n")

# entladbare Energie (GWh) = Kapazitaet (GWh) x SOC x Entladewirkungsgrad
# Deckungsgrad (%) = entladbare Energie / Defizit_Episode x 100
compute_coverage <- function(deficit_df, kapazitaet_gwh, soc = 0.80, eta = sqrt(0.85)) {
  entladbare_energie <- kapazitaet_gwh * soc * eta
  out <- deficit_df
  out$entladbare_energie_gwh <- entladbare_energie
  out$deckungsgrad_pct <- 100 * entladbare_energie / out$deficit_gwh
  out
}

coverage_summary_stats <- function(x) {
  c(n = length(x), median = median(x), IQR25 = quantile(x, 0.25, type = 7, names = FALSE),
    IQR75 = quantile(x, 0.75, type = 7, names = FALSE), min = min(x), max = max(x))
}

coverage_primary <- step("08_coverage_primary", function() {
  cov_a <- compute_coverage(episoden_primary_full, kapazitaet$a_kapazitaet_gwh)
  cov_b <- compute_coverage(episoden_primary_full, kapazitaet$b_kapazitaet_gwh)
  list(a = cov_a, b = cov_b)
})

cat(sprintf("\nDeckungsgrad-Verteilung (%%), Szenario 3(a) MaStR (Kapazitaet=%.3f GWh):\n", kapazitaet$a_kapazitaet_gwh))
print(round(coverage_summary_stats(coverage_primary$a$deckungsgrad_pct), 2))
cat(sprintf("\nDeckungsgrad-Verteilung (%%), Szenario 3(b) [SEKUNDAERQUELLE IWR] (Kapazitaet=%.1f GWh):\n", kapazitaet$b_kapazitaet_gwh))
print(round(coverage_summary_stats(coverage_primary$b$deckungsgrad_pct), 2))
cat("Deckungsgrad-Verteilung, Szenario 3(c): entfaellt ('nicht mit Primaerqualitaet durchfuehrbar', siehe oben) - KEIN Ersatzwert.\n")

# Shapiro-Wilk auch fuer die Deckungsgrad-Verteilungen (SAP 5.2, zweiter Punkt: "je Verteilung")
sw_cov_a <- shapiro.test(coverage_primary$a$deckungsgrad_pct)
sw_cov_b <- shapiro.test(coverage_primary$b$deckungsgrad_pct)
cat("\nShapiro-Wilk, Deckungsgrad 3(a):\n"); print(sw_cov_a)
cat("Shapiro-Wilk, Deckungsgrad 3(b):\n"); print(sw_cov_b)

# =============================================================================
# SAP 6: Sensitivitaetsanalysen S1-S9 (S1-S7, S9 vollstaendig; S8 s.u.)
# Jede Variante aendert GENAU EINEN Parameter gegenueber der
# Primaerspezifikation (SAP 5.1, "Wichtiger Hinweis zur Kombinatorik").
# Alle Varianten werden UNABHAENGIG vom Ergebnis vollstaendig berichtet
# (SAP 7, Cherry-Picking-Verbot).
# =============================================================================
cat("\n----- SAP 6: Sensitivitaetsanalysen S1-S9 -----\n")

sensitivity_row <- function(label, param_desc, cov_vec, n_episodes) {
  s <- coverage_summary_stats(cov_vec)
  data.frame(sensitivitaet = label, parameter = param_desc, n_episoden = n_episodes,
             median_pct = round(s["median"], 0), IQR25_pct = round(s["IQR25"], 0),
             IQR75_pct = round(s["IQR75"], 0), min_pct = round(s["min"], 0),
             max_pct = round(s["max"], 0), stringsAsFactors = FALSE)
}

sensitivitaeten <- step("09_sensitivitaeten", function() {
  rows <- list()

  # ---- S1: 20. statt 10. Perzentil ----
  thr_s1 <- quantile(wide_data$Q, probs = 0.20, na.rm = TRUE, type = 7)
  ep_s1 <- identify_episodes(wide_data$date, wide_data$Q < thr_s1, min_duration = 3)
  def_s1 <- compute_deficit(ep_s1, wide_data, "erzeugung_wind_solar_mwh")
  cov_s1a <- compute_coverage(def_s1, kapazitaet$a_kapazitaet_gwh_bereinigt)
  rows[["S1"]] <- sensitivity_row("S1", "20. Perzentil (statt 10.)", cov_s1a$deckungsgrad_pct, nrow(ep_s1))

  # ---- S2: Mindestdauer 2 bzw. 5 Tage (statt 3) ----
  ep_s2a <- identify_episodes(wide_data$date, wide_data$Q < threshold_primary, min_duration = 2)
  def_s2a <- compute_deficit(ep_s2a, wide_data, "erzeugung_wind_solar_mwh")
  cov_s2a <- compute_coverage(def_s2a, kapazitaet$a_kapazitaet_gwh_bereinigt)
  rows[["S2_2Tage"]] <- sensitivity_row("S2", "Mindestdauer 2 Tage (statt 3)", cov_s2a$deckungsgrad_pct, nrow(ep_s2a))

  ep_s2b <- identify_episodes(wide_data$date, wide_data$Q < threshold_primary, min_duration = 5)
  def_s2b <- compute_deficit(ep_s2b, wide_data, "erzeugung_wind_solar_mwh")
  cov_s2b <- compute_coverage(def_s2b, kapazitaet$a_kapazitaet_gwh_bereinigt)
  rows[["S2_5Tage"]] <- sensitivity_row("S2", "Mindestdauer 5 Tage (statt 3)", cov_s2b$deckungsgrad_pct, nrow(ep_s2b))

  # ---- S3: Unterbrechungstoleranz 1 Tag, Episoden verkettet ----
  ep_s3 <- identify_episodes(wide_data$date, wide_data$Q < threshold_primary, min_duration = 3, allow_1day_gap = TRUE)
  def_s3 <- compute_deficit(ep_s3, wide_data, "erzeugung_wind_solar_mwh")
  cov_s3 <- compute_coverage(def_s3, kapazitaet$a_kapazitaet_gwh_bereinigt)
  rows[["S3"]] <- sensitivity_row("S3", "1 Tag Unterbrechungstoleranz (verkettet)", cov_s3$deckungsgrad_pct, nrow(ep_s3))

  # ---- S4: breitere Systemgrenze (Residuallast), gleiche Primaerepisoden ----
  wide_s4 <- wide_data
  wide_s4$erzeugung_breit_mwh <- wide_s4$erzeugung_wind_solar_mwh + wide_s4$mwh_biomasse +
    wide_s4$mwh_wasserkraft + wide_s4$mwh_sonstige_ee
  # SAP 4: Tage mit Datenluecke bei einer der zusaetzlichen Reihen (hier:
  # 2016-11-08, sonstige_ee) werden von S4 ausgeschlossen (kein stiller
  # Ausschluss) - erzeugung_breit_mwh wird fuer diesen Tag NA, compute_deficit
  # zaehlt dies in n_gap_days und summiert mit na.rm=TRUE (verbleibende Tage).
  wide_s4$erzeugung_breit_mwh[wide_s4$gap_sonstige_ee == 1] <- NA
  def_s4 <- compute_deficit(episodes_primary, wide_s4, "erzeugung_breit_mwh")
  cov_s4 <- compute_coverage(def_s4, kapazitaet$a_kapazitaet_gwh_bereinigt)
  n_s4_gap_affected <- sum(def_s4$n_gap_days > 0)
  cat(sprintf("S4-Hinweis: %d von %d Episoden durch die Datenluecke 2016-11-08 (sonstige_ee) betroffen (Tag anteilig ausgeschlossen, kein stiller Ausschluss, siehe SAP 4).\n",
              n_s4_gap_affected, nrow(episodes_primary)))
  rows[["S4"]] <- sensitivity_row("S4", "Residuallast (+Biomasse+Wasserkraft+sonst.EE)", cov_s4$deckungsgrad_pct, nrow(episodes_primary))

  # ---- S5: Leistungs-/C-Raten-Begrenzung ----
  # Mittlere Speicherdauer (SAP 6, S5) = Kapazitaet(GWh) / Leistung(GW); je
  # Kalendertag maximal entladbare Energie = Leistung(GW) x 24h (GWh).
  # Operationalisierung (dokumentiert, da SAP fuer 3(b) keine eigene
  # MaStR-Leistungsangabe liefert): fuer 3(a) wird die tatsaechliche
  # MaStR-Nennleistung verwendet; fuer 3(b) wird das MaStR-Verhaeltnis
  # Leistung/Kapazitaet (durchschnittliche C-Rate des realen Bestands) auf
  # die IWR-Kapazitaetsprognose angewendet (keine eigene Leistungsprognose
  # verfuegbar) - explizit als Annahme gekennzeichnet.
  cap_pro_tag_a_gwh <- kapazitaet$a_leistung_gw * 24
  s5a <- episoden_primary_full
  # Konservative, im SAP so nicht explizit aufgeloeste Kombinationsregel
  # (Operationalisierung): die C-Raten-Kappung limitiert die ENTLADBARE
  # Energie zusaetzlich zur SOC/Wirkungsgrad-Begrenzung - die entladbare
  # Energie darf nie die (SOC/Wirkungsgrad-bereinigte) Nennkapazitaet
  # UEBERSTEIGEN, auch wenn die Tage-x-Leistung-Grenze rechnerisch hoeher waere.
  s5a$entladbare_energie_gwh <- pmin(s5a$duration_days * cap_pro_tag_a_gwh, kapazitaet$a_kapazitaet_gwh_bereinigt) * 0.80 * sqrt(0.85)
  s5a$deckungsgrad_pct <- 100 * s5a$entladbare_energie_gwh / s5a$deficit_gwh
  rows[["S5"]] <- sensitivity_row("S5", sprintf("Leistungskappung (MaStR: %.2f GW -> %.2f h Speicherdauer)",
                                                  kapazitaet$a_leistung_gw, kapazitaet$a_kapazitaet_gwh_bereinigt / kapazitaet$a_leistung_gw),
                                   s5a$deckungsgrad_pct, nrow(s5a))

  # ---- S6: alternative Anfangsladezustaende 50% / 100% (statt 80%) ----
  cov_s6a <- compute_coverage(episoden_primary_full, kapazitaet$a_kapazitaet_gwh_bereinigt, soc = 0.50)
  rows[["S6_50"]] <- sensitivity_row("S6", "SOC 50% (statt 80%)", cov_s6a$deckungsgrad_pct, nrow(cov_s6a))
  cov_s6b <- compute_coverage(episoden_primary_full, kapazitaet$a_kapazitaet_gwh_bereinigt, soc = 1.00)
  rows[["S6_100"]] <- sensitivity_row("S6", "SOC 100% (statt 80%)", cov_s6b$deckungsgrad_pct, nrow(cov_s6b))

  # ---- S7: alternative Rundtrip-Wirkungsgrade 80% / 90% (statt 85%) ----
  cov_s7a <- compute_coverage(episoden_primary_full, kapazitaet$a_kapazitaet_gwh_bereinigt, eta = sqrt(0.80))
  rows[["S7_80"]] <- sensitivity_row("S7", "Rundtrip-Wirkungsgrad 80% (statt 85%)", cov_s7a$deckungsgrad_pct, nrow(cov_s7a))
  cov_s7b <- compute_coverage(episoden_primary_full, kapazitaet$a_kapazitaet_gwh_bereinigt, eta = sqrt(0.90))
  rows[["S7_90"]] <- sensitivity_row("S7", "Rundtrip-Wirkungsgrad 90% (statt 85%)", cov_s7b$deckungsgrad_pct, nrow(cov_s7b))

  # ---- S9: konditional (nur falls Abdeckung < 90%, siehe oben) ----
  if (s9_needed && !is.null(kapazitaet$s9_sekundaer_gwh)) {
    sekundaer_kapazitaet_gwh <- kapazitaet$s9_sekundaer_gwh
    cov_s9 <- compute_coverage(episoden_primary_full, sekundaer_kapazitaet_gwh)
    rows[["S9"]] <- sensitivity_row("S9", "3(a) Kreuzpruefung mit Sekundaeraggregat (BVES/Fraunhofer-ISE)", cov_s9$deckungsgrad_pct, nrow(cov_s9))
  } else if (s9_needed) {
    rows[["S9"]] <- data.frame(sensitivitaet = "S9", parameter = "WAERE noetig (MaStR-Abdeckung <90%), aber kein Sekundaeraggregat-Wert im Skript hinterlegt - siehe Struktur-Check-Hinweis",
                                n_episoden = NA, median_pct = NA, IQR25_pct = NA, IQR75_pct = NA, min_pct = NA, max_pct = NA)
  } else {
    rows[["S9"]] <- data.frame(sensitivitaet = "S9", parameter = "entfaellt (MaStR-Abdeckung >=90%, keine Kreuzpruefung noetig)",
                                n_episoden = NA, median_pct = NA, IQR25_pct = NA, IQR75_pct = NA, min_pct = NA, max_pct = NA)
  }

  # ---- S8: siehe Abschnitt "S8" unten (zeitlich flexibel, SAP 6) ----
  rows[["S8"]] <- data.frame(sensitivitaet = "S8", parameter = "Nachlade-Dispatch-Simulation - noch ausstehend, wird nachgeliefert (SAP 6: zeitlich flexibel)",
                              n_episoden = NA, median_pct = NA, IQR25_pct = NA, IQR75_pct = NA, min_pct = NA, max_pct = NA)

  do.call(rbind, rows)
})

cat("\nVollstaendige Sensitivitaetsmatrix (SAP 6, Tabelle 3):\n")
print(sensitivitaeten, row.names = FALSE)

# =============================================================================
# SAP 6, S8: Vereinfachte Nachlade-Dispatch-Simulation
# =============================================================================
cat("\n----- SAP 6, S8: Nachlade-Dispatch-Simulation -----\n")
cat(
  "S8 ist gemaess SAP 6 eine reguläre, verpflichtende Sensitivitaetsanalyse,\n",
  "aber - anders als S1-S7/S9 - explizit ZEITLICH FLEXIBEL (SAP 6:\n",
  "'darf S8 gegenueber der uebrigen Primaer- und Sensitivitaetsanalyse\n",
  "zeitlich verschoben/nachgeliefert werden, ohne dass dies den restlichen\n",
  "Analyse- und Validierungsablauf blockiert').\n\n",
  "ENTSCHEIDUNG (analyst-Subagent, 31.08.2026): S8 wird in diesem ersten\n",
  "Analyse-Durchlauf NICHT berechnet und als 'noch ausstehend, wird\n",
  "nachgeliefert' gekennzeichnet (siehe Sensitivitaetsmatrix oben).\n",
  "BEGRUENDUNG: Die Datenbeschaffung dieser Analyse hat einen erheblichen,\n",
  "im SAP nicht vorhersehbaren Mehraufwand verursacht (siehe Skriptkopf):\n",
  "(1) Die vorgesehenen R-Pakete/-Funktionen (jsonlite, read.csv, scan,\n",
  "readr, Zeitzonenkonvertierung) stuerzten in dieser Ausfuehrungsumgebung\n",
  "nicht-deterministisch ab, was eine vollstaendige, eigens gegen\n",
  "Referenzwerte getestete Perl-Vorverarbeitungspipeline fuer SMARD- UND\n",
  "MaStR-Rohdaten noetig machte. (2) Die verbindliche BNetzA-2030-Suchpflicht\n",
  "(Estimand 3c) erforderte eine mehrstufige Dokumentenrecherche (NEP-\n",
  "Entwuerfe, BNetzA-Versorgungssicherheitsbericht inkl. Anhaengen). (3) Der\n",
  sprintf("MaStR-Gesamtdatenexport (3,2 GB komprimiert, %d Speichereinheiten 'In\n", kapazitaet$a_n_einheiten),
  "Betrieb') musste vollstaendig heruntergeladen und geparst werden. S8 ist laut SAP\n",
  "selbst 'von allen in diesem SAP spezifizierten Sensitivitaeten die\n",
  "methodisch aufwendigste und fehleranfaelligste Komponente' (mehrstufige\n",
  "Tages-Dispatch-Logik) - genau die Situation, fuer die SAP 6 die zeitliche\n",
  "Flexibilitaet vorgesehen hat. Primaeranalyse und S1-S7/S9 sind vollstaendig\n",
  "und werden nicht durch S8 blockiert (siehe SAP 6/7).\n"
)

# =============================================================================
# SAP 11: Reporting - Tabellen, Fremdzahlen-Einordnung, Disclaimer, Grafiken
# =============================================================================
cat("\n----- SAP 11: Reporting -----\n")

# Pflicht-Blockzitat (Entscheidung_Estimand3a.md, 31.08.2026, Auflage
# Validierungsbericht): muss unuebersehbar an JEDER Stelle erscheinen, an der
# die BEREINIGT-Kapazitaet (31,5 GWh) fuer Estimand 3(a) verwendet wird -
# nicht nur als Fussnote. Wird als Kommentarzeilen (#) vor jede betroffene
# CSV-Tabelle geschrieben sowie auf der Konsole ausgegeben.
BLOCKZITAT_3A_BEREINIGT <- paste(
  "POST-HOC-BEREINIGUNG (nicht im SAP spezifiziert): Die MaStR-Rohdaten fuer die",
  "aktuelle Speicherkapazitaet enthielten ein Cluster offensichtlicher",
  "Dateneingabefehler (50 von 2,72 Mio. Anlagen verursachten 97,25% einer sonst",
  "46-fach ueberhoehten Summe). Der hier fuer Estimand 3(a) berichtete Wert",
  sprintf("(%.1f GWh) beruht auf einem nachtraeglich festgelegten Ausschlusskriterium", kapazitaet$a_kapazitaet_gwh_bereinigt),
  "(Einzelanlagen > 100 MWh), NICHT auf der woertlichen SAP-Berechnung. Die",
  "100-MWh-Schwelle ist NICHT technisch/unabhaengig begruendet, sondern gezielt so",
  "gewaehlt, dass das Ergebnis am plausibelsten nah an den Sekundaerquellen",
  "BVES (24 GWh) / IWR (35 GWh) liegt (Alternativschwellen 200/300/500 MWh",
  "ergaeben 32,6/33,3/33,3 GWh) - dies ist KEINE Bestaetigung der 'Richtigkeit'",
  "der Schwelle, sondern eine bewusste Post-hoc-Wahl (Confirmation-Bias-Risiko).",
  "Rohsumme (1.144,8 GWh, nicht plausibel) und unabhaengige Kreuzpruefung (BVES,",
  "24 GWh) sind in tabelle2b_deckungsgrad_verteilungsstatistik.csv vollstaendig",
  "dokumentiert. Entscheidung: Entscheidung_Estimand3a.md (Daniel Saure, 31.08.2026).",
  sep = "\n"
)
cat("\n", BLOCKZITAT_3A_BEREINIGT, "\n\n", sep = "")

write_csv_mit_blockzitat <- function(df, path) {
  con <- file(path, "w")
  writeLines(paste0("# ", strsplit(BLOCKZITAT_3A_BEREINIGT, "\n")[[1]]), con)
  writeLines("#", con)
  write.table(df, con, sep = ",", row.names = FALSE, col.names = TRUE, qmethod = "double")
  close(con)
}

# ---- Tabelle 1: Episodenliste, Primaerdefinition ----
tab1 <- episoden_primary_full[, c("episode_id", "start_date", "end_date", "duration_days", "deficit_gwh")]
names(tab1) <- c("Episode", "Start", "Ende", "Dauer_Tage", "Energiedefizit_GWh")
tab1$Energiedefizit_GWh <- round(tab1$Energiedefizit_GWh, 1)
write.csv(tab1, file.path(OUT_DIR, "tabelle1_episodenliste.csv"), row.names = FALSE)

# ---- Tabelle 2: Deckungsgrad je Episode und Szenario (3a/3b; 3c-Vermerk separat) ----
# WARNUNG (siehe Abweichungshinweis oben): Deckungsgrad_3a_MaStR_ROH_pct beruht
# auf der als hoechstwahrscheinlich implausibel identifizierten Rohsumme.
cov_bereinigt <- compute_coverage(episoden_primary_full, kapazitaet$a_kapazitaet_gwh_bereinigt)
cov_s9_bves <- compute_coverage(episoden_primary_full, kapazitaet$s9_sekundaer_gwh)
tab2 <- data.frame(
  Episode = episoden_primary_full$episode_id,
  Start = episoden_primary_full$start_date,
  Ende = episoden_primary_full$end_date,
  Energiedefizit_GWh = round(episoden_primary_full$deficit_gwh, 1),
  `Deckungsgrad_3a_MaStR_ROH_pct_WARNUNG_implausibel` = round(coverage_primary$a$deckungsgrad_pct, 0),
  `Deckungsgrad_3a_MaStR_BEREINIGT_pct_PostHoc` = round(cov_bereinigt$deckungsgrad_pct, 0),
  `Deckungsgrad_3a_S9_BVES_Sekundaeraggregat_pct` = round(cov_s9_bves$deckungsgrad_pct, 0),
  `Deckungsgrad_3b_SEKUNDAERQUELLE_IWR_pct` = round(coverage_primary$b$deckungsgrad_pct, 0),
  Deckungsgrad_3c_BNetzA2030 = "nicht mit Primaerqualitaet durchfuehrbar",
  check.names = FALSE
)
write_csv_mit_blockzitat(tab2, file.path(OUT_DIR, "tabelle2_deckungsgrad_je_szenario.csv"))

mk_vert_row <- function(cov, kap_gwh, label, anmerkung) {
  data.frame(Szenario = label, Kapazitaet_GWh = round(kap_gwh, 3), n = nrow(cov),
             Median_pct = round(median(cov$deckungsgrad_pct), 0),
             IQR25_pct = round(quantile(cov$deckungsgrad_pct, .25, type = 7, names = FALSE), 0),
             IQR75_pct = round(quantile(cov$deckungsgrad_pct, .75, type = 7, names = FALSE), 0),
             Min_pct = round(min(cov$deckungsgrad_pct), 0), Max_pct = round(max(cov$deckungsgrad_pct), 0),
             Anmerkung = anmerkung, stringsAsFactors = FALSE)
}
tab2_verteilung <- rbind(
  mk_vert_row(coverage_primary$a, kapazitaet$a_kapazitaet_gwh_roh, "3a_MaStR_ROH",
              "WARNUNG: mit hoher Wahrscheinlichkeit implausibel (Ausreisser-Cluster, siehe Abweichungshinweis oben) - Primaerquelle, ABER woertliche SAP-Summe ungeprueft irrefuehrend"),
  mk_vert_row(cov_bereinigt, kapazitaet$a_kapazitaet_gwh_bereinigt, "3a_MaStR_BEREINIGT_PostHoc",
              sprintf("Post-hoc, NICHT SAP-spezifiziert: Ausschluss von %d Einzelanlagen > 100 MWh Kapazitaet - OFFIZIELLE Berichtsbasis fuer 3(a) gemaess Entscheidung_Estimand3a.md (Daniel Saure, 31.08.2026)", kapazitaet$a_n_ausreisser_bereinigt)),
  mk_vert_row(cov_s9_bves, kapazitaet$s9_sekundaer_gwh, "S9_BVES_Sekundaeraggregat",
              "SAP 6, S9: Kreuzpruefung mit BVES Branchenanalyse 2026 (Sekundaerquelle, Stichtag Ende 2025)"),
  mk_vert_row(coverage_primary$b, kapazitaet$b_kapazitaet_gwh, "3b_SEKUNDAERQUELLE_IWR",
              "SEKUNDAERQUELLE/SCHAETZUNG (IWR, Prognose Jahresende 2026) - NICHT amtlich"),
  data.frame(Szenario = "3c_BNetzA_2030", Kapazitaet_GWh = NA, n = NA, Median_pct = NA, IQR25_pct = NA,
             IQR75_pct = NA, Min_pct = NA, Max_pct = NA,
             Anmerkung = "nicht mit Primaerqualitaet durchfuehrbar (siehe Suchprotokoll) - kein Ersatzwert",
             stringsAsFactors = FALSE)
)
write_csv_mit_blockzitat(tab2_verteilung, file.path(OUT_DIR, "tabelle2b_deckungsgrad_verteilungsstatistik.csv"))

# ---- Tabelle 3: vollstaendige Sensitivitaetsmatrix ----
# SAP 11 schreibt ganzzahlige Prozentwerte vor - umgesetzt durchgaengig in
# Tabelle 2/2b/3/4 (Auflage Validierungsbericht, zuvor 1/2 Nachkommastellen).
# Hinweis (keine stillschweigende Abweichung, sondern explizit dokumentiert):
# Bei der BEREINIGT-Kapazitaet (31,5 GWh vs. Episoden-Defizite im
# Tausend-GWh-Bereich) liegen die Deckungsgrade fast durchgehend < 1,5% -
# ganzzahlige Rundung reduziert diese Werte auf 0%/1% und ist damit fast
# informationsfrei. Wer mehr Praezision braucht, muss auf die GWh-Rohwerte
# (Energiedefizit_GWh, Kapazitaet_GWh) in denselben Tabellen zurueckgreifen.
write_csv_mit_blockzitat(sensitivitaeten, file.path(OUT_DIR, "tabelle3_sensitivitaetsmatrix.csv"))

# ---- Tabelle 4: Einordnung der vier eingangs genannten Fremdzahlen (SAP 8, Leitplanke 5) ----
# Auflage Validierungsbericht / Entscheidung_Estimand3a.md (31.08.2026): fuer
# Estimand 3(a) gilt offiziell die BEREINIGT-Variante (Post-hoc, siehe
# BLOCKZITAT_3A_BEREINIGT oben), nicht die MaStR-Rohsumme.
eigener_median_3a_bereinigt <- round(median(cov_bereinigt$deckungsgrad_pct), 0)
tab4 <- data.frame(
  Fremdzahl = c(
    "2% des Tagesverbrauchs",
    "Oe 2,3h Speicherdauer",
    "300 GWh bis 2050 = 1% des Bedarfs (Frontier Economics)",
    "5,6 Mrd. EUR Einsparung durch 20GW/4h-Flexibilitaet"
  ),
  Eigener_Wert_dieser_Analyse = c(
    sprintf("Median Deckungsgrad (3a, MaStR BEREINIGT [Post-hoc]): %.0f%% des Episoden-Energiedefizits", eigener_median_3a_bereinigt),
    sprintf("S5 (Leistungskappung, 3a BEREINIGT [Post-hoc]): mittlere Speicherdauer = %.2f h (Kapazitaet/Leistung)",
            kapazitaet$a_kapazitaet_gwh_bereinigt / kapazitaet$a_leistung_gw),
    sprintf("Diese Analyse: rein historisch (2015-%s), kein Bedarfsszenario 2045/2050", struktur_check$date_range[2]),
    "Diese Analyse trifft keine Aussage zu negativen Strompreisen (anderer Estimand)"
  ),
  Methodischer_zeitlicher_Unterschied = c(
    "Unklare Berechnungsgrundlage der Fremdzahl; eigener Wert bezieht sich auf historische Dunkelflaute-Episoden (SAP-Definition), nicht auf einen einzelnen Tagesverbrauch",
    "Fremdzahl vermutlich C-Raten-/Leistungskennzahl, keine Dunkelflaute-Abdeckung; direkter methodischer Bezug ueber S5 hergestellt (siehe Tabelle 3)",
    "Anderer Zeithorizont (2045/2050 vs. historisch 2015-2026), andere Bedarfsdefinition (SAP 8, Leitplanke 5)",
    "Andere Fragestellung (Abbau negativer Strompreise vs. Dunkelflaute-Energiedefizit)"
  ),
  stringsAsFactors = FALSE
)
write_csv_mit_blockzitat(tab4, file.path(OUT_DIR, "tabelle4_einordnung_fremdzahlen.csv"))

# ---- Pflicht-Disclaimer (SAP 11 / SAP 8) ----
disclaimer_text <- paste(
  "PFLICHT-DISCLAIMER (SAP 8, woertlich/sinngemaess zu uebernehmen):",
  "",
  "1. Keine Bewertung von Batteriespeichern als 'richtige' oder 'beste' Loesung.",
  "   Diese Analyse trifft keine Aussage darueber, ob Batteriespeicher die",
  "   geeignete Antwort auf Dunkelflauten sind, und keine vergleichende",
  "   Bewertung alternativer Loesungen (Gaskraftwerke, Stromimporte,",
  "   Lastmanagement, Wasserstoff o.ae.).",
  "",
  "2. Keine Bewertung oder Motivzuschreibung gegenueber Medien/Publikationen.",
  "",
  "3. Die Dunkelflaute-Definition ist eine methodische Festlegung mit",
  "   Ermessensspielraum, keine 'objektive Wahrheit' - siehe Sensitivitaeten",
  "   S1-S3 (Tabelle 3).",
  "",
  "4. Der Deckungsgrad beruecksichtigt Ladezustand (80% SOC, primaer) und",
  "   Rundtrip-Verluste (92% Entladewirkungsgrad, primaer) realistisch,",
  "   NICHT 100% Nennkapazitaet sofort verfuegbar.",
  "",
  "5. Kein 'wer hat recht'-Vergleich mit den vier eingangs genannten",
  "   Fremdzahlen (siehe Tabelle 4) - unterschiedliche Methodik/Zeithorizont/",
  "   Fragestellung, keine Bewertung, welche Zahl 'richtiger' ist. Dies gilt",
  "   auch fuer Szenario 3(c) (BNetzA 2030): eigenstaendiges Ergebnis",
  "   'nicht mit Primaerqualitaet durchfuehrbar', NICHT stillschweigend durch",
  "   eine Fremdzahl ersetzt.",
  "",
  "*** ENTSCHEIDUNG ZU ESTIMAND 3(a) GETROFFEN (Daniel Saure, 31.08.2026,",
  "    siehe Entscheidung_Estimand3a.md) - fuer diesen Bericht gilt die",
  "    Variante 3a-BEREINIGT. Pflicht-Kennzeichnung (woertlich): ***",
  "",
  BLOCKZITAT_3A_BEREINIGT,
  "",
  "Rohsumme (3a-ROH, woertliche SAP-Umsetzung, mit hoher Wahrscheinlichkeit",
  "implausibel) und SAP-6-S9-Kreuzpruefung mit BVES-Sekundaeraggregat bleiben",
  "als dokumentierte Alternativen in Tabelle 2b erhalten, sind aber NICHT die",
  "fuer Tabelle 3/4 verwendete Berichtsbasis. Details/Belege:",
  "rohdaten/mastr/mastr_speicher_summary_top_ausreisser.csv und run_log.txt.",
  "",
  "WEITERE LIMITATIONEN (SAP 9):",
  "- Grenzkuppelstellen/Importe nicht im Defizit beruecksichtigt.",
  "- Keine Kausal-/Attributionsaussage zu einem etwaigen Klimawandel-",
  "  bedingten Trend in Haeufigkeit/Schwere von Dunkelflauten.",
  "- MaStR-Datenqualitaet: siehe Abweichungshinweis oben (Ausreisser-Cluster,",
  "  nicht nur Untererfassung).",
  "- Primaeranalyse ist reine Energiebilanz ohne Leistungs-/C-Raten-",
  "  Begrenzung (adressiert durch S5) und ohne Nachladung waehrend der",
  "  Episode (adressiert durch S8 - siehe oben, noch ausstehend).",
  sep = "\n"
)
writeLines(disclaimer_text, file.path(OUT_DIR, "pflicht_disclaimer.txt"))

cat("Alle Tabellen und der Pflicht-Disclaimer wurden nach output/ geschrieben.\n")

# ---- Grafiken (rein deskriptiv, SAP 10) ----
# Grafikausgabe als PDF (Vektorgrafik-Geraet), NICHT als PNG: gemaess der aus
# Analysen/2026-08-trittbrettfahrer-rechnung/ bekannten Erfahrung koennen
# Raster-Grafikgeraete (png()) in dieser Art von Umgebung instabil sein; in
# dieser Session selbst liess sich png() zwar in einem isolierten Test
# erfolgreich oeffnen (siehe run_log.txt), angesichts der an anderer Stelle
# beobachteten, nicht-deterministischen Instabilitaet wird dennoch
# vorsorglich die getestete PDF-Variante gewaehlt.
step_plots <- step("10_plots", function() {
  pdf(file.path(OUT_DIR, "grafiken_primaeranalyse.pdf"), width = 8, height = 6)

  hist(episoden_primary_full$deficit_gwh, breaks = 15, col = "steelblue",
       main = "Verteilung Energiedefizit je Dunkelflaute-Episode (Primaeranalyse)",
       xlab = "Energiedefizit (GWh)", ylab = "Anzahl Episoden")

  boxplot(list(`3a MaStR` = coverage_primary$a$deckungsgrad_pct,
               `3b IWR (Sekundaerquelle)` = coverage_primary$b$deckungsgrad_pct),
          main = "Deckungsgrad je Kapazitaetsszenario (Primaeranalyse)",
          ylab = "Deckungsgrad (%)", col = c("darkgreen", "orange"))

  plot(as.numeric(diagnostik$yearly$year), diagnostik$yearly$n_episodes, type = "b",
       xlab = "Jahr", ylab = "Anzahl Episoden", pch = 19, col = "firebrick",
       main = "Anzahl Dunkelflaute-Episoden je Jahr (rein deskriptiv, kein Trendtest)")

  plot(diagnostik$acf, main = "ACF von Q(t) (Tagesquotient Wind+Solar/Verbrauch)")

  dev.off()
  TRUE
})
cat("Grafiken (PDF) geschrieben nach output/grafiken_primaeranalyse.pdf\n")

cat("\n=============================================================\n")
cat("Analyse abgeschlossen:", format(Sys.time()), "\n")
cat("=============================================================\n")
