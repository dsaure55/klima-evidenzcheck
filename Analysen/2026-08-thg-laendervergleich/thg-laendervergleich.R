#-------------------------------------------------------------------------------
# Titel:   Vergleich der Pro-Kopf-CO2-/THG-Emissionen Saarland-Bayern-Berlin
#          (indirekter Vergleich ueber Bayern als Bruecken-Komparator)
# SAP:     Analysen/2026-08-thg-laendervergleich/
#          SAP_THG-Laendervergleich-Saarland-Bayern-Berlin.md
#          Version 1.1 (Amendment zu Version 1.0), Status "final",
#          freigegeben 28.08.2026 (Daniel Saure). Historischer Stand v1.0:
#          Status final, freigegeben 27.08.2026 (Daniel Saure).
# Quelle:  Laenderarbeitskreis Energiebilanzen (LAK), www.lak-energiebilanzen.de,
#          Indikator "CO2-Emissionen je Einwohner" (Quellenbilanz, Indikator-Code
#          i300 -> Variable co2_qb_pro_ew). Diese LAK-Reihe ist die Datenbasis,
#          auf der auch UBA/klimadashboard.de den Bundeslaender-Indikator
#          "Kohlendioxid-Emissionen nach Bundeslaendern" aufbauen (SAP Abschnitt 3).
#          Rohdaten-Abzug (CSV, unveraendert) liegt neben diesem Skript unter:
#          co2_je_einwohner_lak_rohdaten.csv
# Zugriffsdatum: 2026-08-27 (Datenzugriff/Erststand unveraendert durch Amendment
#          v1.1 -- dieses Amendment aendert nur Auswertungsmethodik, nicht die
#          zugrundeliegenden Rohdaten oder deren Zugriffsdatum)
#
# R-Version und Paketversionen (SAP Abschnitt 10), zum Ausfuehrungszeitpunkt:
#   R version 4.6.1 (2026-06-24 ucrt)
#   dplyr, lmtest, sandwich, boot, mblm, ggplot2 (lokal installierte Versionen)
#-------------------------------------------------------------------------------
#
# ===========================================================================
# SAP-AMENDMENT v1.1 (28.08.2026) -- IN DIESEM SKRIPT UMGESETZTE AENDERUNGEN
# (Anlass: unabhaengiger Validierungsbericht zur v1.0-Analyse,
#  Analysen/2026-08-thg-laendervergleich/Validierungsbericht_THG-Laendervergleich.md,
#  Gesamteinschaetzung "Freigegeben mit Auflagen")
#
# 1) Primaere Unsicherheitsquantifizierung: HAC -> Bootstrap (SAP 5.3/5.4/10/11).
#    Moving-Block-Bootstrap-KIs sind jetzt primaer; Newey-West-HAC-KIs sind
#    sensitivitaetsanalytisch (Rollentausch ggue. v1.0). Die Berechnungs-
#    verfahren selbst sind unveraendert.
# 2) Zusaetzliches Fenster n=8 als gleichrangige primaere Variante (SAP 4/5.1/6).
#    Bisher wurde nur n=5 (2019-2023, zusammenhaengend) primaer gerechnet. Neu:
#    n=8 (Luecken 2017/2018 einzeln entfernt: 2014-2016 + 2019-2023) wird
#    PARALLEL und GLEICHRANGIG mit vollstaendigem Kontrast-Set (E2a, E2b, E1,
#    E1') und beiden CI-Typen gerechnet. Das vormalige S2a (5-Jahres-Fenster
#    als separate Sensitivitaetsanalyse) entfaellt (jetzt Teil der
#    Primaeranalyse als Variante n=5, keine Doppelfuehrung).
# 3) Keine Signifikanzsprache fuer primaere Kontraste E1/E2a/E2b/E1' (SAP 5.5/7).
#    Konsolen-Output, CSV-Spalten und Text verzichten fuer diese vier Groessen
#    auf "signifikant"/"nicht signifikant" und p-Wert-Schwellenaussagen als
#    Bedeutsamkeitsaussage. Holm-korrigierte p-Werte werden weiterhin (rein
#    deskriptiv gekennzeichnet, Spalten "p_deskriptiv_roh"/"p_deskriptiv_holm")
#    ausgegeben. Diagnostik-Tests (DW, BG, Shapiro-Wilk) sind von dieser
#    Sprachregelung NICHT betroffen -- sie sind keine primaeren Kontraste.
# 4) Korrektur der Abweichung (C) im Header (SAP Abschnitt 3, siehe unten):
#    Die fruehere Behauptung eines gescheiterten Destatis-Zugriffsversuchs war
#    unbelegt (kein Log/Zeitstempel/Code-Pfad mit Netzwerkzugriff im Repo) und
#    wurde ehrlich umformuliert zu "nicht versucht, da kein Netzwerkzugriff in
#    der Analyseumgebung verfuegbar".
#
# ZUSAETZLICH (keine SAP-Aenderung, aber vom Validator als reine
# Vollstaendigkeits-/Implementierungsluecken benannt und hier behoben):
# - E1'-Zeile fehlte in tabelle_kontraste_primaer.csv -> ergaenzt (fuer beide
#   Fenstervarianten).
# - S6 (Berlin bruchbereinigt) berichtete nur den Berlin-eigenen Fitted-Wert,
#   nicht neu berechnete E2a/E2b/E1 -> jetzt vollstaendig mit allen drei
#   Kontrasten unter Verwendung des bruchbereinigten Berlin-Werts berichtet.
# ===========================================================================
#
# ===========================================================================
# ABWEICHUNGEN VOM SAP -- RUECKFRAGE AN MENSCH (Sammelstelle, Details jeweils
# an der betroffenen Stelle im Skript wiederholt):
#
# (A) Zielgroesse (SAP Abschnitt 2/3): Es existiert auf Bundeslandebene KEINE
#     harmonisierte THG-Gesamtreihe (alle Kyoto-Gase in CO2-Aeq.). Verfuegbar
#     ist ausschliesslich die energiebedingte CO2-Reihe des LAK (== UBA-Reihe
#     "Kohlendioxid-Emissionen nach Bundeslaendern"). Gemaess der im SAP selbst
#     vordefinierten Fallback-Regel (Abschnitt 2) wird diese CO2-Reihe daher
#     als PRIMAERE Zielgroesse verwendet. Dies ist KEINE eigenmaechtige
#     Abweichung (SAP sieht diesen Fall explizit vor). Vom Validator als
#     "bestanden" bewertet.
#
# (B) Bevoelkerungskonvention (SAP Abschnitt 5.1: "primaer ... Bevoelkerungs-
#     stand 31.12."): Die verwendete LAK-Reihe ist eine bereits fertige,
#     offiziell publizierte Pro-Kopf-Kennzahl, die intern die DURCHSCHNITTS-
#     BEVOELKERUNG (Jahresdurchschnitt, Zensus-2022-Basis) verwendet, nicht den
#     Bevoelkerungsstand zum 31.12. Der SAP selbst (Abschnitt 3) sieht eine
#     separate Destatis-31.12.-Neuberechnung "nur falls die UBA-Reihe nicht
#     bereits als Pro-Kopf-Wert vorliegt" vor -- das ist hier nicht der Fall.
#     Es wird daher die fertige, offiziell gepruefte LAK/UBA-Pro-Kopf-Reihe
#     (Jahresdurchschnittsbevoelkerung) als PRIMAER verwendet, NICHT eine selbst
#     konstruierte 31.12.-Kennzahl. Dies weicht vom WORTLAUT der Bevoelkerungs-
#     konvention in SAP 5.1 ab -> Rueckfrage an Mensch, unveraendert offen
#     (nicht Gegenstand des Amendments v1.1).
#
# (C) [KORRIGIERT durch SAP-Amendment v1.1, Aenderung 4] S3 (alternative
#     Bevoelkerungskonvention, SAP Abschnitt 6): Diese Sensitivitaetsanalyse
#     (Bevoelkerungsstand 31.12. statt Jahresdurchschnitt) konnte in dieser
#     Sitzung NICHT durchgefuehrt werden. Ehrliche Praezisierung (der
#     Validierungsbericht bemaengelte zu Recht, dass die vormalige Formulierung
#     "automatisierte Zugriffsversuche ... scheiterten" im Repository nicht
#     belegt war -- es existiert kein Code-Pfad, der ueberhaupt einen
#     Netzwerkzugriff auf Destatis GENESIS-Online/Regionalstatistik.de
#     unternimmt, kein HTTP-Log, kein Zeitstempel, keine Fehlermeldung):
#     Ein automatisierter Zugriff auf Destatis GENESIS-Online oder
#     Regionalstatistik.de wurde in dieser Sitzung NICHT VERSUCHT, da kein
#     Netzwerkzugriff in der Analyseumgebung verfuegbar ist (die
#     Ausfuehrungsumgebung dieses Skripts hat keinen ausgehenden
#     Internetzugriff). Es wurden KEINE Bevoelkerungszahlen aus dem
#     Gedaechtnis/ungeprueften Quellen eingesetzt, um keine unverifizierten
#     Zahlen als "praezise" auszugeben. -> Rueckfrage an Mensch: entweder
#     (a) eine Destatis-Bevoelkerungsreihe (Stand 31.12., je Bundesland und
#     Jahr) manuell bereitstellen, oder (b) S3 als "nicht durchfuehrbar"
#     akzeptieren.
#
# (D) S1 (alternative Zielgroesse THG-Gesamt vs. CO2, SAP Abschnitt 6): Der
#     SAP sieht S1 nur vor, "falls sowohl THG-Gesamt- als auch reine-CO2-Reihe
#     verfuegbar sind". Da keine Bundesland-THG-Gesamtreihe gefunden wurde
#     (siehe (A)), ENTFAELLT S1 gemaess der SAP-eigenen Bedingung. Beruht auf
#     einer Pruefung der UBA-/LAK-Webseiten in dieser Sitzung, nicht auf einer
#     erschoepfenden Suche aller denkbaren Quellen -> falls dem Menschen eine
#     Bundeslaender-THG-Gesamtreihe bekannt ist, bitte nachreichen. Vom
#     Validator als "bestanden" bewertet.
#
# (E) [GELOEST durch SAP-Amendment v1.1, Aenderung 2] Fehlende Werte im
#     primaeren 10-Jahres-Fenster (SAP Abschnitt 4): Saarland fehlt in den
#     Jahren 2017 und 2018. In v1.0 wurde dies als Reduktion auf den
#     zusammenhaengenden n=5-Zeitraum (2019-2023) ausgelegt; der
#     Validierungsbericht wies zu Recht darauf hin, dass dies eine nicht
#     eskalierte, konsequenzreiche Interpretationsentscheidung war (sie ist
#     die Ursache des HAC/T=5-Problems, siehe Aenderung 1). Mit Amendment v1.1
#     ist dies keine offene Abweichung mehr: Beide Varianten (n=5
#     zusammenhaengend UND n=8, Luecken einzeln entfernt) werden jetzt
#     GLEICHRANGIG als primaere Varianten parallel gerechnet (SAP 4/5.1).
# ===========================================================================

library(dplyr)
library(lmtest)
library(sandwich)
library(boot)
library(mblm)
library(ggplot2)

set.seed(20260827)  # Reproduzierbarkeit des Moving-Block-Bootstraps (SAP 5.4)

if (!dir.exists("output")) dir.create("output")

alpha <- 0.05  # SAP 5.5
R_BOOT <- 2000  # Anzahl Bootstrap-Replikate (SAP 5.4, primaer gemaess Amendment v1.1)
BLOCK_LEN <- 2  # Blocklaenge Moving-Block-Bootstrap (SAP 5.4)

# Standardisierter Interpretationshinweis, verpflichtend fuer jede Darstellung
# (SAP Abschnitt 8.1/8.2/8.3/11):
interpretationshinweis <- paste(
  "Hinweis: Territoriale Produktionsbilanz (nicht Konsumbilanz) - Unterschiede",
  "spiegeln primaer Industrie-/Kraftwerksstandorte bzw. Stadtstaat-Struktur,",
  "nicht Klimapolitik oder Lebensstil wider. Keine Kausal- oder Politikaussage.",
  "n=3 Laender: administrative Vollerhebung, keine Zufallsstichprobe. Die",
  "Bayern-Bruecke ist hypothesengenerierend/eingeschraenkt belastbar (SAP 8.3).",
  "Primaere Unsicherheitsquantifizierung (SAP-Amendment v1.1): Moving-Block-",
  "Bootstrap-Konfidenzintervalle; Newey-West-HAC-KIs sind sensitivitaetsanalytisch."
)
cat(strwrap(interpretationshinweis, width = 80), sep = "\n")
cat("\n")

#===============================================================================
# SAP 3: Metadaten-/Struktur-Check der Datenquelle
# (ERSTER dokumentierter Schritt, VOR jeder Modellschaetzung)
#===============================================================================

raw <- read.csv("co2_je_einwohner_lak_rohdaten.csv", sep = ";", skip = 4,
                 fileEncoding = "latin1", stringsAsFactors = FALSE,
                 col.names = c("Land", "Jahr", "Anm", "CO2_pro_Kopf", "Stand"))

laender_alle <- c("Bayern", "Berlin", "Saarland", "Hamburg", "Bremen",
                   "Hessen", "Rheinland.Pfalz")
raw$Land[raw$Land == "Rheinland-Pfalz"] <- "Rheinland.Pfalz"
raw <- raw[!is.na(raw$Land) & raw$Land %in% laender_alle, ]
raw$Jahr <- as.integer(raw$Jahr)
raw$CO2_pro_Kopf <- suppressWarnings(as.numeric(raw$CO2_pro_Kopf))
raw$Stand[raw$Stand == ""] <- NA

cat("=== SAP 3: Struktur-Check der Datenquelle ===\n")
cat("Quelle: Laenderarbeitskreis Energiebilanzen (LAK), Indikator i300\n")
cat("  'CO2-Emissionen je Einwohner' (Quellenbilanz, energiebedingtes CO2).\n")
cat("Zielgroesse laut Struktur-Check: energiebedingtes CO2 je Einwohner (t/EW),\n")
cat("  NICHT THG-Gesamt (keine harmonisierte Bundeslaender-THG-Gesamtreihe\n")
cat("  gefunden) -> Fallback-Regel SAP Abschnitt 2 greift, siehe Abweichung (A).\n")
cat("Bevoelkerungskonvention der Quelle: Jahresdurchschnittsbevoelkerung\n")
cat("  (Zensus 2022), siehe Abweichung (B).\n")
cat(sprintf("Zugriffsdatum: 2026-08-27. Datenstand je Zelle variiert (Spalte\n"))
cat("  'Stand' in Rohdaten, zuletzt 20.11.2025 fuer Berlin 2023/2024).\n\n")

for (l in c("Bayern", "Berlin", "Saarland")) {
  sub <- raw[raw$Land == l, ]
  verf <- sub$Jahr[!is.na(sub$CO2_pro_Kopf)]
  fehlt <- sub$Jahr[is.na(sub$CO2_pro_Kopf)]
  cat(sprintf("%s: verfuegbare Jahre %d-%d, n=%d; fehlende Jahre im Bereich: %s\n",
              l, min(verf), max(verf), length(verf),
              paste(fehlt[fehlt >= min(verf) & fehlt <= max(verf)], collapse = ", ")))
}
cat("\n")

# Breite Tabelle fuer das primaere Laender-Trio
trio <- raw[raw$Land %in% c("Bayern", "Berlin", "Saarland"), c("Land", "Jahr", "CO2_pro_Kopf")]
trio_wide <- reshape(trio, idvar = "Jahr", timevar = "Land", direction = "wide")
names(trio_wide) <- sub("^CO2_pro_Kopf\\.", "", names(trio_wide))
trio_wide <- trio_wide[order(trio_wide$Jahr), ]

# Zieljahr = neuestes Jahr mit Werten fuer ALLE DREI Laender (SAP Abschnitt 2)
komplett <- trio_wide[complete.cases(trio_wide[, c("Bayern", "Berlin", "Saarland")]), ]
zieljahr <- max(komplett$Jahr)
cat(sprintf("=== Zieljahr (neuestes gemeinsames Jahr aller drei Laender): %d ===\n\n", zieljahr))

#-------------------------------------------------------------------------------
# SAP 4 (angepasst durch Amendment v1.1, Aenderung 2): Bestimmung BEIDER
# gleichrangiger primaerer Fenstervarianten (n=5 zusammenhaengend, n=8 Luecken
# einzeln entfernt) bei fehlenden Werten im naiven 10-Jahres-Fenster.
#-------------------------------------------------------------------------------

find_longest_complete_window <- function(df_wide, end_year, span, cols) {
  start_naiv <- end_year - span + 1
  jahre <- start_naiv:end_year
  vollst <- sapply(jahre, function(y) {
    row <- df_wide[df_wide$Jahr == y, cols, drop = FALSE]
    nrow(row) == 1 && all(!is.na(row))
  })
  rl <- rle(vollst)
  ends <- cumsum(rl$lengths)
  starts <- ends - rl$lengths + 1
  idx_true <- which(rl$values)
  if (length(idx_true) == 0) stop("Kein vollstaendiger Teilzeitraum gefunden.")
  runs <- data.frame(start = jahre[starts[idx_true]], end = jahre[ends[idx_true]],
                      length = rl$lengths[idx_true])
  beste <- runs[runs$length == max(runs$length), ]
  beste <- beste[which.max(beste$end), ]  # Tie-Break: naeher am Zieljahr
  list(start = beste$start, end = beste$end, length = beste$length,
       naiv_start = start_naiv, naiv_end = end_year, alle_runs = runs)
}

fenster_10j <- find_longest_complete_window(trio_wide, zieljahr, 10, c("Bayern", "Berlin", "Saarland"))

cat("=== SAP 4: Primaere Fenstervarianten (Amendment v1.1, Aenderung 2) ===\n")
cat(sprintf("Naives 10-Jahres-Fenster: %d-%d\n", fenster_10j$naiv_start, fenster_10j$naiv_end))

# --- Variante n=5: laengster zusammenhaengender vollstaendiger Teilzeitraum ---
n5_von <- fenster_10j$start
n5_bis <- fenster_10j$end
n5_jahre <- n5_von:n5_bis

# --- Variante n=8: alle Jahre des naiven 10-Jahres-Fensters, fuer die ALLE
#     DREI Laender Werte haben (Luecken 2017/2018 einzeln entfernt statt
#     Reduktion auf den laengsten zusammenhaengenden Zeitraum). Gleiches
#     (nicht notwendigerweise zusammenhaengendes) Jahres-Set fuer alle drei
#     Laendermodelle, damit die algebraische Identitaet E1' = E1 (SAP
#     Abschnitt 2) unveraendert gilt. ---
naiv_jahre <- fenster_10j$naiv_start:fenster_10j$naiv_end
n8_jahre <- sort(trio_wide$Jahr[trio_wide$Jahr %in% naiv_jahre &
                                  complete.cases(trio_wide[, c("Bayern", "Berlin", "Saarland")])])
n8_von <- min(n8_jahre)
n8_bis <- max(n8_jahre)

if (fenster_10j$length < 10) {
  cat("-> UNVOLLSTAENDIG (Saarland fehlt 2017 und 2018 im naiven Fenster).\n")
  cat("   Beide gleichrangigen primaeren Fenstervarianten (SAP 4, Amendment v1.1):\n")
  print(fenster_10j$alle_runs)
  cat(sprintf("   Variante n=5 (zusammenhaengend): %d-%d (n=%d Jahre)\n",
              n5_von, n5_bis, length(n5_jahre)))
  cat(sprintf("   Variante n=8 (Luecken einzeln entfernt): %s (n=%d Jahre)\n",
              paste(n8_jahre, collapse = ", "), length(n8_jahre)))
} else {
  cat("-> VOLLSTAENDIG: Einziges primaeres 10-Jahres-Fenster, keine Varianten noetig.\n")
  n8_jahre <- n5_jahre; n8_von <- n5_von; n8_bis <- n5_bis
}
cat("\n")

#===============================================================================
# Gemeinsame Hilfsfunktionen fuer SAP 5.1-5.4 (fuer beide Fenstervarianten
# identisch verwendet)
#===============================================================================

# OLS-Fit fuer ein Land ueber ein explizites Jahres-Set (kontiguierlich oder nicht)
fit_ols_jahre <- function(df_wide, land, jahre_vec) {
  sub <- df_wide[df_wide$Jahr %in% jahre_vec & !is.na(df_wide[[land]]), ]
  sub <- data.frame(Jahr = sub$Jahr, y = sub[[land]])
  sub <- sub[order(sub$Jahr), ]
  modell <- lm(y ~ Jahr, data = sub)
  list(land = land, modell = modell, n = nrow(sub), daten = sub)
}

# HAC-basierte Fitted-Value-CI (SAP 5.4: Amendment v1.1 -> sensitivitaetsanalytisch)
hac_fitted_ci <- function(fit_obj, zieljahr, level = 0.95) {
  modell <- fit_obj$modell
  n <- fit_obj$n
  df_resid <- n - 2
  vc <- tryCatch(sandwich::NeweyWest(modell, prewhite = FALSE),
                  error = function(e) sandwich::vcovHC(modell, type = "HC1"))
  x0 <- c(1, zieljahr)
  fit_val <- as.numeric(coef(modell) %*% x0)
  var_val <- as.numeric(t(x0) %*% vc %*% x0)
  se_val <- sqrt(max(var_val, 0))
  tcrit <- qt(1 - (1 - level) / 2, df = max(df_resid, 1))
  list(land = fit_obj$land, fit = fit_val, se = se_val,
       lwr = fit_val - tcrit * se_val, upr = fit_val + tcrit * se_val,
       df = df_resid, n = n)
}
# Hinweis: sandwich::NeweyWest() meldet bei kleinem n (n=5) die Warnung
# "more weights than observations, only first n used" -- dies ist der zentrale,
# im Validierungsbericht dokumentierte Befund, der zur Umstufung von HAC von
# primaer auf sensitivitaetsanalytisch gefuehrt hat (Amendment v1.1, Aenderung 1).

# Moving-Block-Bootstrap: liefert VOLLEN Replikat-Vektor der Fitted-Werte im
# Zieljahr (SAP 5.4, primaer gemaess Amendment v1.1). Aus den Replikat-Vektoren
# zweier Laender werden Kontrast-CIs durch elementweise Differenzbildung
# gewonnen (Annahme unabhaengiger Laender-Zeitreihen, analog zur HAC-
# Delta-Formel SE(Delta)=sqrt(SE1^2+SE2^2), SAP 5.4).
mbb_replicates <- function(daten, zieljahr, R = R_BOOT, block_len = BLOCK_LEN) {
  n <- nrow(daten)
  block_len <- min(block_len, n - 1)
  n_bloecke <- ceiling(n / block_len)
  starts_pool <- 1:(n - block_len + 1)
  sapply(seq_len(R), function(i) {
    idx_start <- sample(starts_pool, n_bloecke, replace = TRUE)
    idx <- unlist(lapply(idx_start, function(s) s:(s + block_len - 1)))
    idx <- idx[idx <= n][seq_len(n)]
    idx[is.na(idx)] <- sample.int(n, sum(is.na(idx)), replace = TRUE)
    resampled <- daten[idx, ]
    resampled$Jahr <- daten$Jahr  # Jahr-Achse fix, nur y wird block-resampled
    m <- lm(y ~ Jahr, data = resampled)
    as.numeric(predict(m, newdata = data.frame(Jahr = zieljahr)))
  })
}

# Baut ein vollstaendiges Land-Modell-Objekt (OLS-Fit + HAC-CI [sensitivitaets-
# analytisch] + Bootstrap-CI [primaer]) fuer ein Land und ein Jahres-Set.
baue_landmodell <- function(df_wide, land, jahre_vec, zieljahr) {
  fit_obj <- fit_ols_jahre(df_wide, land, jahre_vec)
  hac <- hac_fitted_ci(fit_obj, zieljahr)
  boot_rep <- mbb_replicates(fit_obj$daten, zieljahr)
  list(land = land, modell = fit_obj$modell, n = fit_obj$n, daten = fit_obj$daten,
       fit = hac$fit,
       hac_se = hac$se, hac_lwr = hac$lwr, hac_upr = hac$upr, hac_df = hac$df,
       boot_rep = boot_rep,
       boot_lwr = as.numeric(quantile(boot_rep, 0.025)),
       boot_upr = as.numeric(quantile(boot_rep, 0.975)))
}

# Kontrast (Differenz) zweier Land-Modell-Objekte, primaer via Bootstrap-CI,
# sensitivitaetsanalytisch via HAC-CI (Amendment v1.1, Aenderung 1). Der
# Holm-p-Wert basiert (wie in v1.0) auf der HAC-t-Statistik und wird gemaess
# Amendment v1.1, Aenderung 3, rein deskriptiv gekennzeichnet (siehe SAP 5.5/7).
kontrast_variant <- function(a, b, label) {
  delta <- a$fit - b$fit
  hac_se <- sqrt(a$hac_se^2 + b$hac_se^2)
  hac_df <- max(a$hac_df + b$hac_df, 1)
  tcrit <- qt(0.975, df = hac_df)
  tstat <- delta / hac_se
  p <- 2 * (1 - pt(abs(tstat), df = hac_df))
  boot_delta_rep <- a$boot_rep - b$boot_rep
  list(label = label, delta = delta,
       boot_lwr = as.numeric(quantile(boot_delta_rep, 0.025)),
       boot_upr = as.numeric(quantile(boot_delta_rep, 0.975)),
       hac_lwr = delta - tcrit * hac_se, hac_upr = delta + tcrit * hac_se,
       hac_se = hac_se, hac_df = hac_df, t = tstat, p = p)
}

format_p <- function(p) if (is.na(p)) "NA" else if (p < 0.10) sprintf("%.2f", p) else "p >= 0.10"

# Generischer HAC-only-Kontrast (fuer Sensitivitaetsanalysen S1-S6 unveraendert
# ggue. v1.0 verwendet -- diese bleiben sensitivitaetsanalytisch HAC-basiert,
# nicht Gegenstand des Amendments v1.1)
kontrast <- function(fit_a, fit_b, label, df_override = NULL) {
  delta <- fit_a$fit - fit_b$fit
  se <- sqrt(fit_a$se^2 + fit_b$se^2)
  df <- if (is.null(df_override)) (fit_a$df + fit_b$df) else df_override
  df <- max(df, 1)
  tcrit <- qt(0.975, df = df)
  tstat <- delta / se
  p <- 2 * (1 - pt(abs(tstat), df = df))
  list(label = label, delta = delta, se = se, lwr = delta - tcrit * se,
       upr = delta + tcrit * se, df = df, t = tstat, p = p)
}

#===============================================================================
# SAP 5.1-5.4/7: Vollstaendige Analyse EINER Fenstervariante
# (wird unten fuer n=5 UND n=8 aufgerufen -- Amendment v1.1, Aenderung 2)
#===============================================================================

analysiere_fenster <- function(label, jahre_vec, df_wide, zieljahr) {

  cat(sprintf("\n########################################################\n"))
  cat(sprintf("# Primaere Fenstervariante %s (Jahre: %s, n=%d)\n",
              label, paste(range(jahre_vec), collapse = "-"), length(jahre_vec)))
  cat(sprintf("########################################################\n\n"))

  landmodelle <- lapply(c("Bayern", "Berlin", "Saarland"), baue_landmodell,
                         df_wide = df_wide, jahre_vec = jahre_vec, zieljahr = zieljahr)
  names(landmodelle) <- c("Bayern", "Berlin", "Saarland")

  cat(sprintf("=== SAP 5.1: OLS-Trendmodelle je Bundesland (Fenster %s) ===\n\n", label))
  for (l in names(landmodelle)) {
    cat(sprintf("--- %s (n=%d) ---\n", l, landmodelle[[l]]$n))
    print(summary(landmodelle[[l]]$modell)$coefficients)
    cat("\n")
  }

  # --- SAP 5.2: Diagnostik je Modell -----------------------------------------
  cat(sprintf("=== SAP 5.2: Diagnostik je Modell (Fenster %s) ===\n\n", label))
  diagnostik <- list()
  for (l in names(landmodelle)) {
    m <- landmodelle[[l]]$modell
    n <- landmodelle[[l]]$n
    dw <- tryCatch(lmtest::dwtest(m), error = function(e) NULL)
    bg <- tryCatch(lmtest::bgtest(m, order = 1), error = function(e) NULL)
    sw <- tryCatch(shapiro.test(residuals(m)), error = function(e) NULL)
    cd <- cooks.distance(m)
    cat(sprintf("--- %s ---\n", l))
    cat(sprintf("Durbin-Watson: DW=%.3f, p=%.3f %s\n",
                ifelse(is.null(dw), NA, dw$statistic),
                ifelse(is.null(dw), NA, dw$p.value),
                ifelse(!is.null(dw) && dw$p.value < alpha, "(signifikant @ 0.05)", "(nicht signifikant)")))
    cat(sprintf("Breusch-Godfrey (Ordnung 1): LM=%.3f, p=%.3f %s\n",
                ifelse(is.null(bg), NA, bg$statistic),
                ifelse(is.null(bg), NA, bg$p.value),
                ifelse(!is.null(bg) && bg$p.value < alpha, "(signifikant @ 0.05)", "(nicht signifikant)")))
    cat(sprintf("Shapiro-Wilk (Normalitaet Residuen): W=%.3f, p=%.3f %s\n",
                ifelse(is.null(sw), NA, sw$statistic),
                ifelse(is.null(sw), NA, sw$p.value),
                ifelse(!is.null(sw) && sw$p.value < alpha, "(Abweichung von Normalitaet @ 0.05)", "(kein Hinweis auf Abweichung)")))
    jahre_l <- landmodelle[[l]]$daten$Jahr
    cat("Cook's Distance je Beobachtung (Jahr = Wert):\n")
    print(setNames(round(cd, 3), jahre_l))
    schwelle <- 4 / n
    auffaellig <- jahre_l[cd > schwelle]
    if (length(auffaellig) > 0) {
      cat(sprintf("-> Auffaellige Jahre (Cook's D > 4/n=%.2f): %s. Werden benannt,\n",
                  schwelle, paste(auffaellig, collapse = ", ")))
      cat("   aber gemaess SAP 5.2 NICHT von der Primaeranalyse ausgeschlossen.\n")
    } else {
      cat("-> Keine Beobachtung ueberschreitet die Cook's-D-Faustregel (4/n).\n")
    }
    cat("\n")
    diagnostik[[l]] <- list(dw = dw, bg = bg, sw = sw, cd = cd)
  }

  # QQ-Plots und Residuen-vs-Jahr-Plots je Fenstervariante (SAP 5.2)
  png(sprintf("output/diagnostik_qqplots_%s.png", label), width = 1200, height = 450, res = 130)
  par(mfrow = c(1, 3))
  for (l in names(landmodelle)) {
    qqnorm(residuals(landmodelle[[l]]$modell), main = paste("QQ-Plot Residuen:", l, "-", label))
    qqline(residuals(landmodelle[[l]]$modell), col = "red")
  }
  dev.off()

  png(sprintf("output/diagnostik_residuen_vs_jahr_%s.png", label), width = 1200, height = 450, res = 130)
  par(mfrow = c(1, 3))
  for (l in names(landmodelle)) {
    plot(landmodelle[[l]]$daten$Jahr, residuals(landmodelle[[l]]$modell),
         xlab = "Jahr", ylab = "Residuum", main = paste("Residuen vs. Jahr:", l, "-", label), pch = 19)
    abline(h = 0, lty = 2, col = "grey40")
  }
  dev.off()

  # Transitivitaets-Ordering-Check (SAP 5.2/8.3)
  ordering_ok <- (landmodelle$Berlin$fit <= landmodelle$Bayern$fit &&
                    landmodelle$Bayern$fit <= landmodelle$Saarland$fit)
  cat(sprintf("=== Transitivitaets-Ordering-Check (SAP 5.2/8.3, Fenster %s) ===\n", label))
  cat(sprintf("Fitted-Werte im Zieljahr %d: Berlin=%.2f, Bayern=%.2f, Saarland=%.2f t/Kopf\n",
              zieljahr, landmodelle$Berlin$fit, landmodelle$Bayern$fit, landmodelle$Saarland$fit))
  if (ordering_ok) {
    cat("-> ORDERING BESTAETIGT: Bayern liegt zahlenmaessig zwischen Berlin und Saarland.\n\n")
  } else {
    cat("-> WARNUNG: ORDERING VERLETZT -- Bayern liegt NICHT zwischen Berlin und Saarland!\n")
    cat("   Dies relativiert gemaess SAP 5.2/8.3 zusaetzlich die Aussagekraft der\n")
    cat("   Bayern-Bruecken-Interpretation (E2a/E2b). Der direkte Vergleich E1\n")
    cat("   bleibt hiervon unberuehrt gueltig.\n\n")
  }

  # SAP 5.3: Autokorrelations-Meldung
  dw_sig <- any(sapply(diagnostik, function(d) !is.null(d$dw) && d$dw$p.value < alpha))
  bg_sig <- any(sapply(diagnostik, function(d) !is.null(d$bg) && d$bg$p.value < alpha))
  hac_ausgeloest <- dw_sig || bg_sig
  cat(sprintf("=== SAP 5.3: Korrekturregel (Fenster %s) ===\n", label))
  cat(sprintf("Autokorrelation signifikant (DW oder BG, alpha=0.05) bei mind. einem Land: %s\n",
              hac_ausgeloest))
  cat("Gemaess Amendment v1.1 (SAP 5.3/5.4) ist die primaere Unsicherheits-\n")
  cat("quantifizierung ohnehin Moving-Block-Bootstrap (der die Autokorrelations-\n")
  cat("struktur durch blockweises Resampling beruecksichtigt); Newey-West-HAC\n")
  cat("wird UNABHAENGIG vom Ausloese-Status einheitlich als Sensitivitaets-\n")
  cat("analyse fuer alle drei Modelle berichtet (SAP 5.3: 'einheitliche\n")
  cat("Anwendung ueber alle drei Modelle').\n\n")

  sw_sig <- any(sapply(diagnostik, function(d) !is.null(d$sw) && d$sw$p.value < alpha))
  if (sw_sig) {
    cat("Normalitaetsabweichung (Shapiro-Wilk) bei mind. einem Land signifikant\n")
    cat("-> zusaetzliche Theil-Sen-Sensitivitaetsanalyse (S4) wird berichtet.\n\n")
  } else {
    cat("Keine signifikante Normalitaetsabweichung (Shapiro-Wilk) gefunden;\n")
    cat("Theil-Sen (S4) wird dennoch gemaess SAP 6 vollstaendig berichtet.\n\n")
  }

  # --- Niveau-Tabelle: primaer Bootstrap-KI, sensitivitaetsanalytisch HAC-KI --
  cat(sprintf("=== Fitted-Werte im Zieljahr %d, Fenster %s ===\n", zieljahr, label))
  cat("(primaer: Moving-Block-Bootstrap-KI; sensitivitaetsanalytisch: HAC-KI -- Amendment v1.1)\n")
  niveau_tab <- do.call(rbind, lapply(names(landmodelle), function(l) {
    x <- landmodelle[[l]]
    data.frame(Fenster = label, Land = l, Fit = round(x$fit, 1),
               Boot_KI_unten = round(x$boot_lwr, 1), Boot_KI_oben = round(x$boot_upr, 1),
               HAC_KI_unten = round(x$hac_lwr, 1), HAC_KI_oben = round(x$hac_upr, 1),
               stringsAsFactors = FALSE)
  }))
  print(niveau_tab, row.names = FALSE)
  cat("\n")

  # --- SAP 7: Primaere Kontraste E2a, E2b, E1, E1' ---------------------------
  # Amendment v1.1, Aenderung 3: KEINE Signifikanzsprache fuer diese vier
  # Groessen. Punktschaetzung + Konfidenzintervall (primaer: Bootstrap) stehen
  # fuer sich. Holm-korrigierte p-Werte sind rein deskriptiv (Spaltennamen
  # p_deskriptiv_*), keine Signifikanzaussage.
  E2a <- kontrast_variant(landmodelle$Saarland, landmodelle$Bayern, "E2a: Saarland - Bayern")
  E2b <- kontrast_variant(landmodelle$Bayern, landmodelle$Berlin, "E2b: Bayern - Berlin")
  E1  <- kontrast_variant(landmodelle$Saarland, landmodelle$Berlin, "E1: Saarland - Berlin (direkt)")
  E1_strich_delta <- E2a$delta + E2b$delta  # algebraisch identisch zu E1$delta (SAP 2/7)

  p_roh <- c(E2a$p, E2b$p, E1$p)
  p_holm <- p.adjust(p_roh, method = "holm")

  cat(sprintf("=== SAP 7: Primaere Kontraste (Fenster %s) -- primaer Bootstrap-KI,\n", label))
  cat("    sensitivitaetsanalytisch HAC-KI, p-Werte rein deskriptiv (Amendment v1.1) ===\n")
  kontrast_tab <- data.frame(
    Fenster = label,
    Kontrast = c(E2a$label, E2b$label, E1$label,
                 "E1': E2a + E2b (Konsistenzpruefung, kein separater Test, SAP 7)"),
    Delta = round(c(E2a$delta, E2b$delta, E1$delta, E1_strich_delta), 1),
    Boot_KI_unten = round(c(E2a$boot_lwr, E2b$boot_lwr, E1$boot_lwr, NA), 1),
    Boot_KI_oben = round(c(E2a$boot_upr, E2b$boot_upr, E1$boot_upr, NA), 1),
    HAC_KI_unten = round(c(E2a$hac_lwr, E2b$hac_lwr, E1$hac_lwr, NA), 1),
    HAC_KI_oben = round(c(E2a$hac_upr, E2b$hac_upr, E1$hac_upr, NA), 1),
    p_deskriptiv_roh = c(sapply(p_roh, format_p), NA),
    p_deskriptiv_holm = c(sapply(p_holm, format_p), NA),
    stringsAsFactors = FALSE
  )
  print(kontrast_tab, row.names = FALSE)
  cat(sprintf("Hinweis: E1' ist eine rein rechnerische Konsistenzpruefung (Delta=%.1f,\n",
              E1_strich_delta))
  cat(sprintf("  algebraisch identisch zu E1=%.1f); kein separater Test/kein separates\n", E1$delta))
  cat("  CI gemaess SAP 7 (Doppelzaehlung wuerde die Fehlerrate verzerren).\n\n")

  list(label = label, jahre = jahre_vec, landmodelle = landmodelle, diagnostik = diagnostik,
       ordering_ok = ordering_ok, hac_ausgeloest = hac_ausgeloest,
       niveau_tab = niveau_tab, kontrast_tab = kontrast_tab,
       E2a = E2a, E2b = E2b, E1 = E1, E1_strich_delta = E1_strich_delta)
}

# --- Beide gleichrangigen primaeren Fenstervarianten (Amendment v1.1, Aenderung 2) ---
res_n5 <- analysiere_fenster("n5", n5_jahre, trio_wide, zieljahr)
res_n8 <- analysiere_fenster("n8", n8_jahre, trio_wide, zieljahr)

#===============================================================================
# SAP 6: Sensitivitaetsanalysen S1-S6 (vollstaendig, kein Cherry-Picking)
# Referenzbasis: Fenstervariante n=5 (n5_von/n5_bis), wie in v1.0. Das Amendment
# v1.1 aendert nur, dass n=5 UND n=8 beide primaer sind (siehe oben); die
# Sensitivitaetsanalysen S1, S3-S6 selbst wurden durch das Amendment NICHT auf
# beide Fenstervarianten dupliziert (SAP Abschnitt 6 unveraendert bzgl. S1/S3-S6;
# nur die vormalige S2a ist -- als Variante n=5 -- in die Primaeranalyse
# aufgegangen und entfaellt hier als separate Sensitivitaetsanalyse).
#===============================================================================

# Hilfsfunktion: komplette (HAC-basierte, sensitivitaetsanalytische) Kontrast-
# Berechnung fuer ein beliebiges Fenster -- unveraendert ggue. v1.0
kontraste_fenster <- function(df_wide, jahre_vec, laender = c("Saarland", "Bayern", "Berlin"),
                                zieljahr_lok = zieljahr, methode = "ols") {
  fits <- lapply(laender, function(l) {
    if (methode == "ols") {
      fit_ols_jahre(df_wide, l, jahre_vec)
    } else if (methode == "theilsen") {
      sub <- df_wide[df_wide$Jahr %in% jahre_vec & !is.na(df_wide[[l]]), ]
      sub <- data.frame(Jahr = sub$Jahr, y = sub[[l]])
      list(land = l, modell = mblm::mblm(y ~ Jahr, data = sub, repeated = FALSE),
           n = nrow(sub), daten = sub)
    }
  })
  names(fits) <- laender
  if (methode == "ols") {
    hac <- lapply(fits, hac_fitted_ci, zieljahr = zieljahr_lok)
  } else {
    # Theil-Sen: kein HAC-Standard. mblm::confint() liefert fuer den Intercept
    # bei sehr kleinem n haeufig ein uneigentliches Intervall [-Inf, Inf]
    # (getestet), wodurch ein daraus abgeleitetes Fitted-Value-CI unbrauchbar
    # waere. SAP schreibt fuer Theil-Sen keine spezifische Inferenzmethode vor
    # -> es werden NUR Punktschaetzer berichtet (dokumentierte Analystenwahl).
    hac <- lapply(fits, function(f) {
      fit_val <- as.numeric(coef(f$modell)[1] + coef(f$modell)[2] * zieljahr_lok)
      list(land = f$land, fit = fit_val, se = NA, lwr = NA_real_, upr = NA_real_,
           df = f$n - 2, n = f$n)
    })
  }
  names(hac) <- laender
  e2a <- kontrast(hac[[1]], hac[[2]], "E2a")
  e2b <- kontrast(hac[[2]], hac[[3]], "E2b")
  e1  <- kontrast(hac[[1]], hac[[3]], "E1")
  list(fits = fits, hac = hac, E2a = e2a, E2b = e2b, E1 = e1)
}

sensitivitaet_zeilen <- list()

# --- S1: alternative Zielgroesse -----------------------------------------
cat("=== S1: alternative Zielgroesse (THG-Gesamt vs. CO2) ===\n")
cat("ENTFAELLT: keine Bundeslaender-THG-Gesamtreihe verfuegbar (Abweichung (D)).\n\n")
sensitivitaet_zeilen[["S1"]] <- data.frame(
  Sensitivitaet = "S1: alt. Zielgroesse (THG-Gesamt)", Kontrast = c("E2a", "E2b", "E1"),
  Delta = NA, KI_unten = NA, KI_oben = NA, Anmerkung = "entfaellt (keine Datenquelle)"
)

# --- S2a (neu benannt, vormals S2b): gesamte verfuegbare Zeitreihe --------
# (Das vormalige S2a, "5-Jahres-Fenster", ist mit Amendment v1.1 Teil der
# Primaeranalyse als Variante n=5 geworden und entfaellt hier als separate
# Sensitivitaetsanalyse -- SAP Abschnitt 6, Amendment-Historie Aenderung 2.)
cat("=== S2a: gesamte verfuegbare gemeinsame Zeitreihe (SAP 6, Amendment v1.1) ===\n")
von_voll <- min(trio_wide$Jahr[!is.na(trio_wide$Saarland)])
jahre_voll <- von_voll:zieljahr
cat(sprintf("Fenster: %d-%d (fruehestes Jahr mit Saarland-Daten; NA-Jahre je Land\n",
            von_voll, zieljahr))
cat("  einzeln aus der jeweiligen Landesregression ausgeschlossen, siehe Log unten)\n")
res_s2a <- kontraste_fenster(trio_wide, jahre_voll)
for (l in names(res_s2a$fits)) cat(sprintf("  %s: n=%d Jahre verwendet\n", l, res_s2a$fits[[l]]$n))
for (k in list(res_s2a$E2a, res_s2a$E2b, res_s2a$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat("\n")
sensitivitaet_zeilen[["S2a"]] <- data.frame(
  Sensitivitaet = sprintf("S2a: gesamte Zeitreihe (%d-%d)", von_voll, zieljahr),
  Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s2a$E2a$delta, res_s2a$E2b$delta, res_s2a$E1$delta), 1),
  KI_unten = round(c(res_s2a$E2a$lwr, res_s2a$E2b$lwr, res_s2a$E1$lwr), 1),
  KI_oben = round(c(res_s2a$E2a$upr, res_s2a$E2b$upr, res_s2a$E1$upr), 1),
  Anmerkung = ""
)

# --- S2b (vormals S2c): reiner Einzeljahreswert ohne Trendmodell ---------
cat("=== S2b: reiner Einzeljahreswert im Zieljahr (ohne Trendmodell, SAP 6) ===\n")
ez_sl <- trio_wide$Saarland[trio_wide$Jahr == zieljahr]
ez_by <- trio_wide$Bayern[trio_wide$Jahr == zieljahr]
ez_be <- trio_wide$Berlin[trio_wide$Jahr == zieljahr]
cat(sprintf("Saarland=%.1f, Bayern=%.1f, Berlin=%.1f t/Kopf (kein CI: Einzelbeobachtung,\n",
            ez_sl, ez_by, ez_be))
cat("  kein Extrapolations-/Glaettungseffekt gemaess SAP S2b)\n\n")
sensitivitaet_zeilen[["S2b"]] <- data.frame(
  Sensitivitaet = "S2b: Einzeljahreswert (kein Trendmodell)",
  Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(ez_sl - ez_by, ez_by - ez_be, ez_sl - ez_be), 1),
  KI_unten = NA, KI_oben = NA, Anmerkung = "kein CI (Einzelbeobachtung, kein Modell)"
)

# --- S3: alternative Bevoelkerungskonvention ------------------------------
cat("=== S3: alternative Bevoelkerungskonvention (31.12. statt Jahresdurchschnitt) ===\n")
cat("NICHT DURCHGEFUEHRT in dieser Sitzung (Abweichung (C) oben, korrigiert gemaess\n")
cat("Amendment v1.1: kein Netzwerkzugriff in der Analyseumgebung verfuegbar -- ein\n")
cat("automatisierter Destatis-Zugriff wurde daher NICHT VERSUCHT, nicht 'versucht\n")
cat("und gescheitert').\n\n")
sensitivitaet_zeilen[["S3"]] <- data.frame(
  Sensitivitaet = "S3: alt. Bevoelkerungskonvention (31.12.)", Kontrast = c("E2a", "E2b", "E1"),
  Delta = NA, KI_unten = NA, KI_oben = NA,
  Anmerkung = "nicht durchfuehrbar: kein Netzwerkzugriff verfuegbar (nicht versucht, s. Abweichung C)"
)

# --- S4: Theil-Sen robuste Trendschaetzung (Referenzfenster n=5) ---------
cat("=== S4: Theil-Sen-Schaetzer (robust) statt OLS (Fenster n=5) ===\n")
res_s4 <- kontraste_fenster(trio_wide, n5_jahre, methode = "theilsen")
for (k in list(res_s4$E2a, res_s4$E2b, res_s4$E1))
  cat(sprintf("  %s: Delta=%.1f [%s, %s]\n", k$label, k$delta,
              ifelse(is.na(k$lwr), "NA", sprintf("%.1f", k$lwr)),
              ifelse(is.na(k$upr), "NA", sprintf("%.1f", k$upr))))
cat("\n")
sensitivitaet_zeilen[["S4"]] <- data.frame(
  Sensitivitaet = "S4: Theil-Sen (robust) statt OLS (Fenster n=5)", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s4$E2a$delta, res_s4$E2b$delta, res_s4$E1$delta), 1),
  KI_unten = round(c(res_s4$E2a$lwr, res_s4$E2b$lwr, res_s4$E1$lwr), 1),
  KI_oben = round(c(res_s4$E2a$upr, res_s4$E2b$upr, res_s4$E1$upr), 1),
  Anmerkung = "nur Punktschaetzer (kein CI, s. Skript-Kommentar oben)"
)

# --- S5: alternativer/erweiterter Brueckenkomparator (Referenzfenster n=5) --
cat("=== S5: alternative Brueckenkomparatoren (Fenster n=5) ===\n")
holen_alt <- function(land_lak) {
  sub <- raw[raw$Land == land_lak, c("Jahr", "CO2_pro_Kopf")]
  names(sub) <- c("Jahr", land_lak)
  sub
}
alt_hh <- holen_alt("Hamburg"); alt_rlp <- holen_alt("Rheinland.Pfalz")

trio_hh <- merge(trio_wide[, c("Jahr", "Saarland", "Berlin")], alt_hh, by = "Jahr")
trio_rlp <- merge(trio_wide[, c("Jahr", "Saarland", "Berlin")], alt_rlp, by = "Jahr")

cat("--- S5a: Hamburg als Stadtstaat-Bruecke ---\n")
res_s5a <- kontraste_fenster(trio_hh, n5_jahre, laender = c("Saarland", "Hamburg", "Berlin"))
for (k in list(res_s5a$E2a, res_s5a$E2b, res_s5a$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat("\n--- S5b: Rheinland-Pfalz als gemischtes Flaechenland-Bruecke ---\n")
res_s5b <- kontraste_fenster(trio_rlp, n5_jahre, laender = c("Saarland", "Rheinland.Pfalz", "Berlin"))
for (k in list(res_s5b$E2a, res_s5b$E2b, res_s5b$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat(sprintf("\nHinweis: E1 (Saarland-Berlin direkt) ist unabhaengig vom Bruecken-Land\n"))
cat(sprintf("algebraisch identisch (E1=%.1f in allen Bruecken-Varianten, Fenster n=5), siehe SAP Abschnitt 2.\n\n",
            res_n5$E1$delta))

sensitivitaet_zeilen[["S5a"]] <- data.frame(
  Sensitivitaet = "S5a: Bruecke Hamburg statt Bayern (Fenster n=5)", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s5a$E2a$delta, res_s5a$E2b$delta, res_s5a$E1$delta), 1),
  KI_unten = round(c(res_s5a$E2a$lwr, res_s5a$E2b$lwr, res_s5a$E1$lwr), 1),
  KI_oben = round(c(res_s5a$E2a$upr, res_s5a$E2b$upr, res_s5a$E1$upr), 1), Anmerkung = ""
)
sensitivitaet_zeilen[["S5b"]] <- data.frame(
  Sensitivitaet = "S5b: Bruecke Rheinland-Pfalz statt Bayern (Fenster n=5)", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s5b$E2a$delta, res_s5b$E2b$delta, res_s5b$E1$delta), 1),
  KI_unten = round(c(res_s5b$E2a$lwr, res_s5b$E2b$lwr, res_s5b$E1$lwr), 1),
  KI_oben = round(c(res_s5b$E2a$upr, res_s5b$E2b$upr, res_s5b$E1$upr), 1), Anmerkung = ""
)

# --- S6: bruchbereinigtes Fenster fuer Berlin (ab 1991) -------------------
# Vollstaendigkeitskorrektur (Validierungsbericht Punkt 5, keine SAP-Aenderung):
# v1.0 berichtete hier nur den Berlin-eigenen Fitted-Wert-Unterschied, nicht
# neu berechnete E2a/E2b/E1. Jetzt: vollstaendige Neuberechnung aller drei
# primaeren Kontraste mit dem bruchbereinigten Berlin-Wert (Referenzfenster
# n=5 fuer Bayern/Saarland, wie bei S4/S5).
cat("=== S6: bruchbereinigtes Fenster fuer Berlin (Ost-West-Zusammenfuehrung) ===\n")
cat("Hinweis zur Umsetzung: die gemeinsame Trio-Zeitreihe (S2a) beginnt wegen\n")
cat(sprintf("fehlender Saarland-Daten ohnehin erst %d und beruehrt den\n", von_voll))
cat("Bruch 1990/1991 damit gar nicht. S6 wird daher als eigenstaendiger\n")
cat("Berlin-Robustheitscheck auf Basis von Berlins LAENGSTER EIGENER Zeitreihe\n")
cat("(1990 vs. ab 1991) umgesetzt, wie in SAP 4/6 inhaltlich intendiert.\n")
berlin_voll <- raw[raw$Land == "Berlin" & !is.na(raw$CO2_pro_Kopf), c("Jahr", "CO2_pro_Kopf")]
m_be_mit1990 <- lm(CO2_pro_Kopf ~ Jahr, data = berlin_voll)
berlin_ab1991 <- subset(berlin_voll, Jahr >= 1991)
m_be_ab1991 <- lm(CO2_pro_Kopf ~ Jahr, data = berlin_ab1991)
fit_mit <- predict(m_be_mit1990, newdata = data.frame(Jahr = zieljahr))
fit_ohne <- predict(m_be_ab1991, newdata = data.frame(Jahr = zieljahr))
cat(sprintf("Berlin-Fitted-Wert %d MIT 1990: %.2f t/Kopf; OHNE 1990 (ab 1991): %.2f t/Kopf\n",
            zieljahr, fit_mit, fit_ohne))
cat(sprintf("Differenz: %.2f t/Kopf (%.1f%% des Niveaus)\n\n",
            fit_mit - fit_ohne, 100 * (fit_mit - fit_ohne) / fit_ohne))

# Vollstaendige Neuberechnung E2a/E2b/E1 mit bruchbereinigtem Berlin-Wert:
sl_hac_n5 <- hac_fitted_ci(fit_ols_jahre(trio_wide, "Saarland", n5_jahre), zieljahr)
by_hac_n5 <- hac_fitted_ci(fit_ols_jahre(trio_wide, "Bayern", n5_jahre), zieljahr)
be_alt_hac <- hac_fitted_ci(list(land = "Berlin_ab1991", modell = m_be_ab1991, n = nrow(berlin_ab1991)), zieljahr)

e2a_s6 <- kontrast(sl_hac_n5, by_hac_n5, "E2a")      # unveraendert: Berlin nicht beteiligt
e2b_s6 <- kontrast(by_hac_n5, be_alt_hac, "E2b")      # Bayern - Berlin(ab1991)
e1_s6  <- kontrast(sl_hac_n5, be_alt_hac, "E1")       # Saarland - Berlin(ab1991)

cat("Neuberechnete primaere Kontraste mit bruchbereinigtem Berlin-Wert (Fenster n=5):\n")
for (k in list(e2a_s6, e2b_s6, e1_s6))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat("\n")

sensitivitaet_zeilen[["S6"]] <- data.frame(
  Sensitivitaet = "S6: Berlin bruchbereinigt (ab 1991, eigene Langreihe; Fenster n=5)",
  Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(e2a_s6$delta, e2b_s6$delta, e1_s6$delta), 1),
  KI_unten = round(c(e2a_s6$lwr, e2b_s6$lwr, e1_s6$lwr), 1),
  KI_oben = round(c(e2a_s6$upr, e2b_s6$upr, e1_s6$upr), 1),
  Anmerkung = c("unveraendert ggue. Primaeranalyse n=5 (Berlin nicht an E2a beteiligt)",
                sprintf("Berlin ab1991-Fitted=%.2f (statt mit-1990=%.2f)", fit_ohne, fit_mit),
                sprintf("Berlin ab1991-Fitted=%.2f (statt mit-1990=%.2f)", fit_ohne, fit_mit))
)

#===============================================================================
# SAP 11: Reporting -- Tabellen und Grafiken
#===============================================================================

niveau_tab_all <- rbind(res_n5$niveau_tab, res_n8$niveau_tab)
kontrast_tab_all <- rbind(res_n5$kontrast_tab, res_n8$kontrast_tab)

write.csv(niveau_tab_all, "output/tabelle_niveaus_zieljahr.csv", row.names = FALSE)
write.csv(kontrast_tab_all, "output/tabelle_kontraste_primaer.csv", row.names = FALSE)

anhang_tab <- do.call(rbind, sensitivitaet_zeilen)
rownames(anhang_tab) <- NULL
write.csv(anhang_tab, "output/tabelle_anhang_sensitivitaeten_S1-S6.csv", row.names = FALSE)
cat("=== Vollstaendige Anhangstabelle S1-S6 (SAP 6/7/11) ===\n")
print(anhang_tab, row.names = FALSE)
cat("\n")

cat("=== Kombinierte Tabelle: primaere Niveaus, beide Fenstervarianten (SAP 11a) ===\n")
print(niveau_tab_all, row.names = FALSE)
cat("\n=== Kombinierte Tabelle: primaere Kontraste, beide Fenstervarianten (SAP 11c) ===\n")
print(kontrast_tab_all, row.names = FALSE)
cat("\n")

# Balkendiagramme mit Fehlerbalken, primaer Bootstrap-KI, je Fenstervariante
# getrennt (SAP 11b, Amendment v1.1)
zeichne_balken <- function(niveau_tab_variante, label) {
  plot_df <- niveau_tab_variante
  plot_df$Land <- factor(plot_df$Land, levels = c("Saarland", "Bayern", "Berlin"))
  p <- ggplot(plot_df, aes(x = Land, y = Fit, fill = Land)) +
    geom_col(width = 0.6) +
    geom_errorbar(aes(ymin = Boot_KI_unten, ymax = Boot_KI_oben), width = 0.15) +
    scale_fill_manual(values = c("Saarland" = "#c0392b", "Bayern" = "#2a78d6", "Berlin" = "#1baf7a")) +
    labs(title = sprintf("Pro-Kopf-CO2-Emissionen im Zieljahr %d (Fenster %s, 95%%-Bootstrap-KI, primaer)",
                          zieljahr, label),
         subtitle = "Quelle: Laenderarbeitskreis Energiebilanzen (LAK) | eigene Berechnung (OLS-Trend)",
         x = NULL, y = "t CO2 pro Kopf",
         caption = paste(strwrap(interpretationshinweis, width = 100), collapse = "\n")) +
    theme_minimal(base_size = 11) +
    theme(legend.position = "none", plot.caption = element_text(hjust = 0, size = 7))
  ggsave(sprintf("output/balkendiagramm_niveaus_zieljahr_%s.png", label), p, width = 7.5, height = 5.5, dpi = 200)
}
zeichne_balken(res_n5$niveau_tab, "n5")
zeichne_balken(res_n8$niveau_tab, "n8")

cat("=== Skript vollstaendig durchgelaufen. Outputs in output/ gespeichert. ===\n")
