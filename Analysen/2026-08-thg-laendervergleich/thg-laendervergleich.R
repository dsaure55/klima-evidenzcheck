#-------------------------------------------------------------------------------
# Titel:   Vergleich der Pro-Kopf-CO2-/THG-Emissionen Saarland-Bayern-Berlin
#          (indirekter Vergleich ueber Bayern als Bruecken-Komparator)
# SAP:     Analysen/2026-08-thg-laendervergleich/
#          SAP_THG-Laendervergleich-Saarland-Bayern-Berlin.md
#          Version 1.0, Status "final", freigegeben 27.08.2026 (Daniel Saure)
# Quelle:  Laenderarbeitskreis Energiebilanzen (LAK), www.lak-energiebilanzen.de,
#          Indikator "CO2-Emissionen je Einwohner" (Quellenbilanz, Indikator-Code
#          i300 -> Variable co2_qb_pro_ew). Diese LAK-Reihe ist die Datenbasis,
#          auf der auch UBA/klimadashboard.de den Bundeslaender-Indikator
#          "Kohlendioxid-Emissionen nach Bundeslaendern" aufbauen (SAP Abschnitt 3).
#          Rohdaten-Abzug (CSV, unveraendert) liegt neben diesem Skript unter:
#          co2_je_einwohner_lak_rohdaten.csv
# Zugriffsdatum: 2026-08-27
#
# R-Version und Paketversionen (SAP Abschnitt 10), zum Ausfuehrungszeitpunkt:
#   R version 4.6.1 (2026-06-24 ucrt)
#   dplyr 1.2.1, lmtest 0.9.40, sandwich 3.1.3, boot 1.3.32, mblm 0.12.1,
#   ggplot2 4.0.3
#-------------------------------------------------------------------------------
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
#     Abweichung (SAP sieht diesen Fall explizit vor), wird hier aber trotzdem
#     dokumentiert, weil es (B) und (C) unten nach sich zieht.
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
#     konvention in SAP 5.1 ab -> Rueckfrage an Mensch, ob dies akzeptabel ist
#     oder ob eine 31.12.-Neuberechnung explizit gewuenscht wird.
#
# (C) S3 (alternative Bevoelkerungskonvention, SAP Abschnitt 6): Diese
#     Sensitivitaetsanalyse (Bevoelkerungsstand 31.12. statt Jahresdurchschnitt)
#     konnte in dieser Sitzung NICHT durchgefuehrt werden. Automatisierte
#     Zugriffsversuche auf Destatis GENESIS-Online und Regionalstatistik.de
#     scheiterten an deren session-/JavaScript-basierter Architektur (kein
#     stabiler, unauthentifizierter CSV-/API-Export erreichbar). Es wurden
#     KEINE Bevoelkerungszahlen aus dem Gedaechtnis/ungeprueften Quellen
#     eingesetzt, um keine unverifizierten Zahlen als "praezise" auszugeben.
#     -> Rueckfrage an Mensch: entweder (a) eine Destatis-Bevoelkerungsreihe
#     (Stand 31.12., je Bundesland und Jahr) manuell bereitstellen, oder
#     (b) S3 als "nicht durchfuehrbar" akzeptieren.
#
# (D) S1 (alternative Zielgroesse THG-Gesamt vs. CO2, SAP Abschnitt 6): Der
#     SAP sieht S1 nur vor, "falls sowohl THG-Gesamt- als auch reine-CO2-Reihe
#     verfuegbar sind". Da keine Bundesland-THG-Gesamtreihe gefunden wurde
#     (siehe (A)), ENTFAELLT S1 gemaess der SAP-eigenen Bedingung. Dies beruht
#     auf einer Pruefung der UBA-/LAK-Webseiten in dieser Sitzung, nicht auf
#     einer erschoepfenden Suche aller denkbaren Quellen -> falls dem Menschen
#     eine Bundeslaender-THG-Gesamtreihe bekannt ist, bitte nachreichen.
#
# (E) Fehlende Werte im primaeren 10-Jahres-Fenster (SAP Abschnitt 4): Saarland
#     fehlt in den Jahren 2017 und 2018. Gemaess der im SAP selbst vorgesehenen
#     Fallback-Regel wird das Fenster auf den laengsten gemeinsam vollstaendig
#     verfuegbaren ZUSAMMENHAENGENDEN Zeitraum innerhalb der letzten 10 Jahre
#     reduziert (Details siehe Abschnitt "SAP 3/4" unten im Code). Dies ist
#     ebenfalls KEINE eigenmaechtige Abweichung, sondern Anwendung der
#     SAP-eigenen Regel; die Wahl "zusammenhaengend, laengste Periode" ist eine
#     dokumentierte Analysten-Interpretation des Wortlauts "Zeitraum".
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

# Standardisierter Interpretationshinweis, verpflichtend fuer jede Darstellung
# (SAP Abschnitt 8.1/8.2/8.3/11):
interpretationshinweis <- paste(
  "Hinweis: Territoriale Produktionsbilanz (nicht Konsumbilanz) - Unterschiede",
  "spiegeln primaer Industrie-/Kraftwerksstandorte bzw. Stadtstaat-Struktur,",
  "nicht Klimapolitik oder Lebensstil wider. Keine Kausal- oder Politikaussage.",
  "n=3 Laender: administrative Vollerhebung, keine Zufallsstichprobe. Die",
  "Bayern-Bruecke ist hypothesengenerierend/eingeschraenkt belastbar (SAP 8.3)."
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
# SAP 4: Bestimmung des primaeren 10-Jahres-Fensters inkl. Fallback-Regel bei
# fehlenden Werten (Abweichung (E) oben)
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

cat("=== SAP 4: Primaeres Zeitfenster (10 Jahre) ===\n")
cat(sprintf("Naives 10-Jahres-Fenster: %d-%d\n", fenster_10j$naiv_start, fenster_10j$naiv_end))
if (fenster_10j$length < 10) {
  cat("-> UNVOLLSTAENDIG (Saarland fehlt 2017 und 2018 im naiven Fenster).\n")
  cat("   SAP-4-Fallback-Regel angewendet: Reduktion auf laengsten gemeinsam\n")
  cat("   vollstaendig verfuegbaren ZUSAMMENHAENGENDEN Teilzeitraum:\n")
  print(fenster_10j$alle_runs)
}
cat(sprintf("=> Gewaehltes primaeres Fenster: %d-%d (n=%d Jahre)\n\n",
            fenster_10j$start, fenster_10j$end, fenster_10j$length))

primaer_von <- fenster_10j$start
primaer_bis <- fenster_10j$end

#===============================================================================
# SAP 5.1: Primaeranalyse -- bundeslandspezifische OLS-Trendmodelle
#===============================================================================

fit_ols <- function(df_wide, land, von, bis) {
  sub <- df_wide[df_wide$Jahr >= von & df_wide$Jahr <= bis & !is.na(df_wide[[land]]), ]
  sub <- data.frame(Jahr = sub$Jahr, y = sub[[land]])
  modell <- lm(y ~ Jahr, data = sub)
  list(land = land, modell = modell, n = nrow(sub), von = von, bis = bis, daten = sub)
}

# HAC-basierte Fitted-Value-CI (SAP 5.4: primaer HAC-robust)
hac_fitted_ci <- function(fit_obj, zieljahr, level = 0.95, kind = "HC") {
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

cat("=== SAP 5.1: Primaeranalyse (OLS je Bundesland,", primaer_von, "-", primaer_bis, ") ===\n\n")

primaer_fits <- lapply(c("Bayern", "Berlin", "Saarland"),
                        function(l) fit_ols(trio_wide, l, primaer_von, primaer_bis))
names(primaer_fits) <- c("Bayern", "Berlin", "Saarland")

for (l in names(primaer_fits)) {
  cat(sprintf("--- %s (n=%d) ---\n", l, primaer_fits[[l]]$n))
  print(summary(primaer_fits[[l]]$modell)$coefficients)
  cat("\n")
}

#===============================================================================
# SAP 5.2: Diagnostik je Bundesland-Modell
#===============================================================================

cat("=== SAP 5.2: Diagnostik je Modell ===\n\n")

diagnostik <- list()
for (l in names(primaer_fits)) {
  m <- primaer_fits[[l]]$modell
  n <- primaer_fits[[l]]$n
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
  jahre_l <- primaer_fits[[l]]$daten$Jahr
  cat("Cook's Distance je Beobachtung (Jahr = Wert):\n")
  cd_named <- setNames(round(cd, 3), jahre_l)
  print(cd_named)
  # Auffaellige Jahre benennen (Faustregel-Schwellenwert 4/n), aber NICHT
  # automatisch ausschliessen (SAP 5.2: "nicht ohne inhaltlich dokumentierte,
  # vorab nicht vorgesehene Begruendung ausgeschlossen").
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

# QQ-Plots und Residuen-vs-Jahr-Plots (SAP 5.2, gespeichert unter output/)
png("output/diagnostik_qqplots.png", width = 1200, height = 450, res = 130)
par(mfrow = c(1, 3))
for (l in names(primaer_fits)) {
  qqnorm(residuals(primaer_fits[[l]]$modell), main = paste("QQ-Plot Residuen:", l))
  qqline(residuals(primaer_fits[[l]]$modell), col = "red")
}
dev.off()

png("output/diagnostik_residuen_vs_jahr.png", width = 1200, height = 450, res = 130)
par(mfrow = c(1, 3))
for (l in names(primaer_fits)) {
  plot(primaer_fits[[l]]$daten$Jahr, residuals(primaer_fits[[l]]$modell),
       xlab = "Jahr", ylab = "Residuum", main = paste("Residuen vs. Jahr:", l), pch = 19)
  abline(h = 0, lty = 2, col = "grey40")
}
dev.off()

# Transitivitaets-Ordering-Check (SAP 5.2 / 8.3): liegt Bayern-Fitted-Wert im
# Zieljahr zwischen Saarland und Berlin?
fit_by_ziel <- predict(primaer_fits$Bayern$modell, newdata = data.frame(Jahr = zieljahr))
fit_sl_ziel <- predict(primaer_fits$Saarland$modell, newdata = data.frame(Jahr = zieljahr))
fit_be_ziel <- predict(primaer_fits$Berlin$modell, newdata = data.frame(Jahr = zieljahr))
ordering_ok <- (fit_be_ziel <= fit_by_ziel && fit_by_ziel <= fit_sl_ziel)

cat("=== Transitivitaets-Ordering-Check (SAP 5.2/8.3) ===\n")
cat(sprintf("Fitted-Werte im Zieljahr %d: Berlin=%.2f, Bayern=%.2f, Saarland=%.2f t/Kopf\n",
            zieljahr, fit_be_ziel, fit_by_ziel, fit_sl_ziel))
if (ordering_ok) {
  cat("-> ORDERING BESTAETIGT: Bayern liegt zahlenmaessig zwischen Berlin und Saarland.\n\n")
} else {
  cat("-> WARNUNG: ORDERING VERLETZT -- Bayern liegt NICHT zwischen Berlin und Saarland!\n")
  cat("   Dies relativiert gemaess SAP 5.2/8.3 zusaetzlich die Aussagekraft der\n")
  cat("   Bayern-Bruecken-Interpretation (E2a/E2b). Der direkte Vergleich E1\n")
  cat("   bleibt hiervon unberuehrt gueltig.\n\n")
}

#===============================================================================
# SAP 5.3: Korrektur bei Autokorrelation -- einheitliche HAC-Anwendung
#===============================================================================

dw_sig <- any(sapply(diagnostik, function(d) !is.null(d$dw) && d$dw$p.value < alpha))
bg_sig <- any(sapply(diagnostik, function(d) !is.null(d$bg) && d$bg$p.value < alpha))
hac_ausgeloest <- dw_sig || bg_sig

cat("=== SAP 5.3: Korrekturregel ===\n")
cat(sprintf("Autokorrelation signifikant (DW oder BG, alpha=0.05) bei mind. einem Land: %s\n",
            hac_ausgeloest))
cat("Gemaess SAP 5.4 werden die primaeren Konfidenzintervalle UNABHAENGIG vom\n")
cat("Ausloese-Status ohnehin HAC-robust (Newey-West) berechnet (SAP 5.4 nennt\n")
cat("dies explizit 'primaer'); SAP 5.3 wird hier als Bestaetigungs-/Melderegel\n")
cat("verstanden: das DW/BG-Ergebnis wird -- wie oben -- unabhaengig vom Ergebnis\n")
cat("in jedem Fall berichtet. HAC wird einheitlich fuer alle drei Modelle\n")
cat("angewendet (SAP 5.3: 'einheitliche Anwendung ueber alle drei Modelle').\n\n")

sw_sig <- any(sapply(diagnostik, function(d) !is.null(d$sw) && d$sw$p.value < alpha))
if (sw_sig) {
  cat("Normalitaetsabweichung (Shapiro-Wilk) bei mind. einem Land signifikant\n")
  cat("-> zusaetzliche Theil-Sen-Sensitivitaetsanalyse (S4) unten wird berichtet\n")
  cat("(ohnehin gemaess SAP 6 fuer alle Faelle vorgeschrieben).\n\n")
} else {
  cat("Keine signifikante Normalitaetsabweichung (Shapiro-Wilk) gefunden;\n")
  cat("Theil-Sen (S4) wird dennoch gemaess SAP 6 vollstaendig berichtet.\n\n")
}

#===============================================================================
# SAP 5.4 / 7: Primaere Kontraste E2a, E2b, E1, E1' mit HAC-CI und
# Holm-Bonferroni-Korrektur
#===============================================================================

primaer_hac <- lapply(primaer_fits, hac_fitted_ci, zieljahr = zieljahr)
names(primaer_hac) <- names(primaer_fits)
# Hinweis: sandwich::NeweyWest() meldet bei derart kleinem n (=5) die Warnung
# "more weights than observations, only first n used" -- die automatische
# Newey-West-Bandbreite (SAP 5.3) uebersteigt die Beobachtungszahl; R faengt
# dies technisch ab, es unterstreicht aber zusaetzlich die im SAP selbst
# (5.4) formulierte Einschaetzung, dass HAC bei T~10 (hier sogar T=5)
# asymptotisch nur schwach abgesichert ist. Wird hier explizit dokumentiert.

cat("=== Fitted-Werte im Zieljahr", zieljahr, "mit 95%-HAC-KI (SAP 5.4) ===\n")
niveau_tab <- do.call(rbind, lapply(primaer_hac, function(x) {
  data.frame(Land = x$land, Fit = round(x$fit, 1), KI_unten = round(x$lwr, 1),
             KI_oben = round(x$upr, 1))
}))
print(niveau_tab, row.names = FALSE)
cat("\n")

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

E2a <- kontrast(primaer_hac$Saarland, primaer_hac$Bayern, "E2a: Saarland - Bayern")
E2b <- kontrast(primaer_hac$Bayern, primaer_hac$Berlin, "E2b: Bayern - Berlin")
E1  <- kontrast(primaer_hac$Saarland, primaer_hac$Berlin, "E1: Saarland - Berlin (direkt)")
E1_strich <- list(label = "E1': E2a + E2b (Konsistenz)", delta = E2a$delta + E2b$delta)

# Holm-Bonferroni-Korrektur NUR fuer die primaere Test-Familie E2a, E2b, E1 (SAP 7)
p_roh <- c(E2a$p, E2b$p, E1$p)
p_holm <- p.adjust(p_roh, method = "holm")

format_p <- function(p) if (is.na(p)) "NA" else if (p < 0.10) sprintf("%.2f", p) else "p >= 0.10"

cat("=== SAP 7: Primaere Kontraste (E2a, E2b, E1) mit Holm-Bonferroni-Korrektur ===\n")
kontrast_tab <- data.frame(
  Kontrast = c(E2a$label, E2b$label, E1$label),
  Delta = round(c(E2a$delta, E2b$delta, E1$delta), 1),
  KI_unten = round(c(E2a$lwr, E2b$lwr, E1$lwr), 1),
  KI_oben = round(c(E2a$upr, E2b$upr, E1$upr), 1),
  p_roh = sapply(p_roh, format_p),
  p_holm = sapply(p_holm, format_p)
)
print(kontrast_tab, row.names = FALSE)
cat(sprintf("\n%s: Delta=%.1f t/Kopf (rein rechnerische Konsistenzpruefung,\n",
            E1_strich$label, E1_strich$delta))
cat(sprintf("  algebraisch identisch zu E1=%.1f; kein separater Test gemaess SAP 7)\n\n", E1$delta))

#===============================================================================
# SAP 5.4: Sensitivitaetsanalytische Moving-Block-Bootstrap-KIs
#===============================================================================

cat("=== SAP 5.4 (sensitivitaetsanalytisch): Moving-Block-Bootstrap-KIs ===\n")
cat("Hinweis: bei sehr kurzer Zeitreihe (n=", primaer_fits$Bayern$n,
    ") ist Block-Bootstrap nur eingeschraenkt aussagekraeftig (vgl. SAP 5.4\n", sep = "")
cat("eigene Einschaetzung zu HAC bei T~10 - bei T=", primaer_fits$Bayern$n,
    " gilt dies erst recht). Dennoch gemaess SAP vollstaendig berichtet.\n", sep = "")

mbb_fitted <- function(daten, zieljahr, R = 2000, block_len = 2) {
  n <- nrow(daten)
  block_len <- min(block_len, n - 1)
  n_bloecke <- ceiling(n / block_len)
  boot_fun <- function(data_orig, idx_start) {
    idx <- unlist(lapply(idx_start, function(s) s:(s + block_len - 1)))
    idx <- idx[idx <= n][seq_len(n)]
    idx[is.na(idx)] <- sample.int(n, sum(is.na(idx)), replace = TRUE)
    resampled <- data_orig[idx, ]
    resampled$Jahr <- data_orig$Jahr  # Jahr-Achse fix, nur y wird block-resampled
    m <- lm(y ~ Jahr, data = resampled)
    as.numeric(predict(m, newdata = data.frame(Jahr = zieljahr)))
  }
  starts_pool <- 1:(n - block_len + 1)
  res <- replicate(R, {
    idx_start <- sample(starts_pool, n_bloecke, replace = TRUE)
    boot_fun(daten, idx_start)
  })
  c(fit = mean(res), lwr = as.numeric(quantile(res, 0.025)),
    upr = as.numeric(quantile(res, 0.975)))
}

boot_ergebnisse <- lapply(names(primaer_fits), function(l) {
  b <- mbb_fitted(primaer_fits[[l]]$daten, zieljahr)
  data.frame(Land = l, Boot_Fit = round(b["fit"], 1), Boot_KI_unten = round(b["lwr"], 1),
             Boot_KI_oben = round(b["upr"], 1))
})
boot_tab <- do.call(rbind, boot_ergebnisse)
print(boot_tab, row.names = FALSE)
cat("\n")

#===============================================================================
# SAP 6: Sensitivitaetsanalysen S1-S6 (vollstaendig, kein Cherry-Picking)
#===============================================================================

# Hilfsfunktion: komplette Kontrast-Berechnung fuer ein beliebiges Fenster
kontraste_fenster <- function(df_wide, von, bis, laender = c("Saarland", "Bayern", "Berlin"),
                                zieljahr_lok = zieljahr, methode = "ols") {
  fits <- lapply(laender, function(l) {
    if (methode == "ols") {
      fit_ols(df_wide, l, von, bis)
    } else if (methode == "theilsen") {
      sub <- df_wide[df_wide$Jahr >= von & df_wide$Jahr <= bis & !is.na(df_wide[[l]]), ]
      sub <- data.frame(Jahr = sub$Jahr, y = sub[[l]])
      list(land = l, modell = mblm::mblm(y ~ Jahr, data = sub, repeated = FALSE),
           n = nrow(sub), von = von, bis = bis, daten = sub)
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

# --- S2a: 5-Jahres-Fenster -------------------------------------------------
cat("=== S2a: 5-Jahres-Fenster ===\n")
von_5j <- zieljahr - 4
res_s2a <- kontraste_fenster(trio_wide, von_5j, zieljahr)
cat(sprintf("Fenster: %d-%d (identisch mit dem SAP-4-reduzierten Primaerfenster,\n",
            von_5j, zieljahr))
cat("  da Primaerfenster bereits auf 5 Jahre reduziert wurde -> Ergebnisse\n")
cat("  numerisch identisch zur Primaeranalyse; dennoch vollstaendig berichtet.)\n")
for (k in list(res_s2a$E2a, res_s2a$E2b, res_s2a$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat("\n")
sensitivitaet_zeilen[["S2a"]] <- data.frame(
  Sensitivitaet = "S2a: 5-Jahres-Fenster", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s2a$E2a$delta, res_s2a$E2b$delta, res_s2a$E1$delta), 1),
  KI_unten = round(c(res_s2a$E2a$lwr, res_s2a$E2b$lwr, res_s2a$E1$lwr), 1),
  KI_oben = round(c(res_s2a$E2a$upr, res_s2a$E2b$upr, res_s2a$E1$upr), 1),
  Anmerkung = "identisch zu Primaerfenster (Zufall d. SAP-4-Reduktion)"
)

# --- S2b: gesamte verfuegbare Zeitreihe -----------------------------------
cat("=== S2b: gesamte verfuegbare gemeinsame Zeitreihe ===\n")
von_voll <- min(komplett$Jahr[komplett$Jahr <= zieljahr])
# fruehestes Jahr mit Daten fuer alle drei (unter Beruecksichtigung der Luecken
# 2017/2018 bei Saarland: wir nehmen das erste Jahr, ab dem ALLE DREI ueberhaupt
# einmal einen Wert haben, und lassen einzelne fehlende Jahre in der Regression
# NA-bedingt weg (siehe fit_ols: !is.na-Filter je Land))
von_voll <- min(trio_wide$Jahr[!is.na(trio_wide$Saarland)])
cat(sprintf("Fenster: %d-%d (fruehestes Jahr mit Saarland-Daten; NA-Jahre je Land\n",
            von_voll, zieljahr))
cat("  einzeln aus der jeweiligen Landesregression ausgeschlossen, siehe Log unten)\n")
res_s2b <- kontraste_fenster(trio_wide, von_voll, zieljahr)
for (l in names(res_s2b$fits)) cat(sprintf("  %s: n=%d Jahre verwendet\n", l, res_s2b$fits[[l]]$n))
for (k in list(res_s2b$E2a, res_s2b$E2b, res_s2b$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat("\n")
sensitivitaet_zeilen[["S2b"]] <- data.frame(
  Sensitivitaet = sprintf("S2b: gesamte Zeitreihe (%d-%d)", von_voll, zieljahr),
  Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s2b$E2a$delta, res_s2b$E2b$delta, res_s2b$E1$delta), 1),
  KI_unten = round(c(res_s2b$E2a$lwr, res_s2b$E2b$lwr, res_s2b$E1$lwr), 1),
  KI_oben = round(c(res_s2b$E2a$upr, res_s2b$E2b$upr, res_s2b$E1$upr), 1),
  Anmerkung = ""
)

# --- S2c: reiner Einzeljahreswert ohne Trendmodell ------------------------
cat("=== S2c: reiner Einzeljahreswert im Zieljahr (ohne Trendmodell) ===\n")
ez_sl <- trio_wide$Saarland[trio_wide$Jahr == zieljahr]
ez_by <- trio_wide$Bayern[trio_wide$Jahr == zieljahr]
ez_be <- trio_wide$Berlin[trio_wide$Jahr == zieljahr]
cat(sprintf("Saarland=%.1f, Bayern=%.1f, Berlin=%.1f t/Kopf (kein CI: Einzelbeobachtung,\n",
            ez_sl, ez_by, ez_be))
cat("  kein Extrapolations-/Glaettungseffekt gemaess SAP S2c)\n\n")
sensitivitaet_zeilen[["S2c"]] <- data.frame(
  Sensitivitaet = "S2c: Einzeljahreswert (kein Trendmodell)",
  Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(ez_sl - ez_by, ez_by - ez_be, ez_sl - ez_be), 1),
  KI_unten = NA, KI_oben = NA, Anmerkung = "kein CI (Einzelbeobachtung, kein Modell)"
)

# --- S3: alternative Bevoelkerungskonvention ------------------------------
cat("=== S3: alternative Bevoelkerungskonvention (31.12. statt Jahresdurchschnitt) ===\n")
cat("NICHT DURCHGEFUEHRT in dieser Sitzung (Abweichung (C) oben: kein\n")
cat("automatisiert erreichbarer Destatis-Datenexport verfuegbar).\n\n")
sensitivitaet_zeilen[["S3"]] <- data.frame(
  Sensitivitaet = "S3: alt. Bevoelkerungskonvention (31.12.)", Kontrast = c("E2a", "E2b", "E1"),
  Delta = NA, KI_unten = NA, KI_oben = NA, Anmerkung = "nicht durchfuehrbar (Datenzugriff, s. Abweichung C)"
)

# --- S4: Theil-Sen robuste Trendschaetzung --------------------------------
cat("=== S4: Theil-Sen-Schaetzer (robust) statt OLS ===\n")
res_s4 <- kontraste_fenster(trio_wide, primaer_von, primaer_bis, methode = "theilsen")
for (k in list(res_s4$E2a, res_s4$E2b, res_s4$E1))
  cat(sprintf("  %s: Delta=%.1f [%s, %s]\n", k$label, k$delta,
              ifelse(is.na(k$lwr), "NA", sprintf("%.1f", k$lwr)),
              ifelse(is.na(k$upr), "NA", sprintf("%.1f", k$upr))))
cat("\n")
sensitivitaet_zeilen[["S4"]] <- data.frame(
  Sensitivitaet = "S4: Theil-Sen (robust) statt OLS", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s4$E2a$delta, res_s4$E2b$delta, res_s4$E1$delta), 1),
  KI_unten = round(c(res_s4$E2a$lwr, res_s4$E2b$lwr, res_s4$E1$lwr), 1),
  KI_oben = round(c(res_s4$E2a$upr, res_s4$E2b$upr, res_s4$E1$upr), 1),
  Anmerkung = "nur Punktschaetzer (kein CI, s. Skript-Kommentar oben)"
)

# --- S5: alternativer/erweiterter Brueckenkomparator ----------------------
cat("=== S5: alternative Brueckenkomparatoren ===\n")
holen_alt <- function(land_lak) {
  sub <- raw[raw$Land == land_lak, c("Jahr", "CO2_pro_Kopf")]
  names(sub) <- c("Jahr", land_lak)
  sub
}
alt_hh <- holen_alt("Hamburg"); alt_rlp <- holen_alt("Rheinland.Pfalz")

trio_hh <- merge(trio_wide[, c("Jahr", "Saarland", "Berlin")], alt_hh, by = "Jahr")
trio_rlp <- merge(trio_wide[, c("Jahr", "Saarland", "Berlin")], alt_rlp, by = "Jahr")

cat("--- S5a: Hamburg als Stadtstaat-Bruecke ---\n")
res_s5a <- kontraste_fenster(trio_hh, primaer_von, primaer_bis,
                              laender = c("Saarland", "Hamburg", "Berlin"))
for (k in list(res_s5a$E2a, res_s5a$E2b, res_s5a$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat("\n--- S5b: Rheinland-Pfalz als gemischtes Flaechenland-Bruecke ---\n")
res_s5b <- kontraste_fenster(trio_rlp, primaer_von, primaer_bis,
                              laender = c("Saarland", "Rheinland.Pfalz", "Berlin"))
for (k in list(res_s5b$E2a, res_s5b$E2b, res_s5b$E1))
  cat(sprintf("  %s: Delta=%.1f [%.1f, %.1f]\n", k$label, k$delta, k$lwr, k$upr))
cat(sprintf("\nHinweis: E1 (Saarland-Berlin direkt) ist unabhaengig vom Bruecken-Land\n"))
cat(sprintf("algebraisch identisch (E1=%.1f in allen Bruecken-Varianten), siehe SAP Abschnitt 2.\n\n",
            E1$delta))

sensitivitaet_zeilen[["S5a"]] <- data.frame(
  Sensitivitaet = "S5a: Bruecke Hamburg statt Bayern", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s5a$E2a$delta, res_s5a$E2b$delta, res_s5a$E1$delta), 1),
  KI_unten = round(c(res_s5a$E2a$lwr, res_s5a$E2b$lwr, res_s5a$E1$lwr), 1),
  KI_oben = round(c(res_s5a$E2a$upr, res_s5a$E2b$upr, res_s5a$E1$upr), 1), Anmerkung = ""
)
sensitivitaet_zeilen[["S5b"]] <- data.frame(
  Sensitivitaet = "S5b: Bruecke Rheinland-Pfalz statt Bayern", Kontrast = c("E2a", "E2b", "E1"),
  Delta = round(c(res_s5b$E2a$delta, res_s5b$E2b$delta, res_s5b$E1$delta), 1),
  KI_unten = round(c(res_s5b$E2a$lwr, res_s5b$E2b$lwr, res_s5b$E1$lwr), 1),
  KI_oben = round(c(res_s5b$E2a$upr, res_s5b$E2b$upr, res_s5b$E1$upr), 1), Anmerkung = ""
)

# --- S6: bruchbereinigtes Fenster fuer Berlin (ab 1991) -------------------
cat("=== S6: bruchbereinigtes Fenster fuer Berlin (Ost-West-Zusammenfuehrung) ===\n")
cat("Hinweis zur Umsetzung: die gemeinsame Trio-Zeitreihe (S2b) beginnt wegen\n")
cat("fehlender Saarland-Daten ohnehin erst", von_voll, "und beruehrt den\n")
cat("Bruch 1990/1991 damit gar nicht. S6 wird daher als eigenstaendiger\n")
cat("Berlin-Robustheitscheck auf Basis von Berlins LAENGSTER EIGENER Zeitreihe\n")
cat("(1990 vs. ab 1991) umgesetzt, wie in SAP 4/6 inhaltlich intendiert.\n")
berlin_voll <- raw[raw$Land == "Berlin" & !is.na(raw$CO2_pro_Kopf), c("Jahr", "CO2_pro_Kopf")]
m_be_mit1990 <- lm(CO2_pro_Kopf ~ Jahr, data = berlin_voll)
m_be_ab1991 <- lm(CO2_pro_Kopf ~ Jahr, data = subset(berlin_voll, Jahr >= 1991))
fit_mit <- predict(m_be_mit1990, newdata = data.frame(Jahr = zieljahr))
fit_ohne <- predict(m_be_ab1991, newdata = data.frame(Jahr = zieljahr))
cat(sprintf("Berlin-Fitted-Wert %d MIT 1990: %.2f t/Kopf; OHNE 1990 (ab 1991): %.2f t/Kopf\n",
            zieljahr, fit_mit, fit_ohne))
cat(sprintf("Differenz: %.2f t/Kopf (%.1f%% des Niveaus)\n\n",
            fit_mit - fit_ohne, 100 * (fit_mit - fit_ohne) / fit_ohne))
sensitivitaet_zeilen[["S6"]] <- data.frame(
  Sensitivitaet = "S6: Berlin bruchbereinigt (ab 1991, eigene Langreihe)",
  Kontrast = "Berlin_Fitted_Ziel", Delta = round(fit_ohne - fit_mit, 2),
  KI_unten = NA, KI_oben = NA,
  Anmerkung = sprintf("mit 1990=%.2f, ab 1991=%.2f (siehe Log)", fit_mit, fit_ohne)
)

#===============================================================================
# SAP 11: Reporting -- Tabellen und Grafiken
#===============================================================================

write.csv(niveau_tab, "output/tabelle_niveaus_zieljahr.csv", row.names = FALSE)
write.csv(kontrast_tab, "output/tabelle_kontraste_primaer.csv", row.names = FALSE)
write.csv(boot_tab, "output/tabelle_bootstrap_niveaus.csv", row.names = FALSE)

anhang_tab <- do.call(rbind, sensitivitaet_zeilen)
rownames(anhang_tab) <- NULL
write.csv(anhang_tab, "output/tabelle_anhang_sensitivitaeten_S1-S6.csv", row.names = FALSE)
cat("=== Vollstaendige Anhangstabelle S1-S6 (SAP 6/7/11) ===\n")
print(anhang_tab, row.names = FALSE)
cat("\n")

# Balkendiagramm mit Fehlerbalken (SAP 11b)
plot_df <- niveau_tab
plot_df$Land <- factor(plot_df$Land, levels = c("Saarland", "Bayern", "Berlin"))
p <- ggplot(plot_df, aes(x = Land, y = Fit, fill = Land)) +
  geom_col(width = 0.6) +
  geom_errorbar(aes(ymin = KI_unten, ymax = KI_oben), width = 0.15) +
  scale_fill_manual(values = c("Saarland" = "#c0392b", "Bayern" = "#2a78d6", "Berlin" = "#1baf7a")) +
  labs(title = sprintf("Pro-Kopf-CO2-Emissionen im Zieljahr %d (95%%-HAC-KI)", zieljahr),
       subtitle = "Quelle: Laenderarbeitskreis Energiebilanzen (LAK) | eigene Berechnung (OLS-Trend, primaeres Fenster)",
       x = NULL, y = "t CO2 pro Kopf",
       caption = paste(strwrap(interpretationshinweis, width = 100), collapse = "\n")) +
  theme_minimal(base_size = 11) +
  theme(legend.position = "none", plot.caption = element_text(hjust = 0, size = 7))
ggsave("output/balkendiagramm_niveaus_zieljahr.png", p, width = 7.5, height = 5.5, dpi = 200)

cat("=== Skript vollstaendig durchgelaufen. Outputs in output/ gespeichert. ===\n")
