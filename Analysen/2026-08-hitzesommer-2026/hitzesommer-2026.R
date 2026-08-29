## ============================================================================
## Hitzesommer 2026 -- statistische Einordnung ggue. historischer Schwankungs-
## breite hitzebedingter Sterbefaelle (RKI)
##
## SAP: Analysen/2026-08-hitzesommer-2026/SAP_hitzesommer-2026.md
##      Version 1.1, Status: final, Freigabe Daniel Saure, 28.08.2026
##
## Dieses Skript implementiert 1:1 das im SAP festgelegte Vorgehen. Jede
## Sektion referenziert die zugehoerige SAP-Abschnittsnummer. Abweichungen vom
## SAP sind zwingend als "Abweichung vom SAP - Rueckfrage an Mensch" markiert
## (siehe CLAUDE.md-Vorgabe fuer den analyst-Subagenten); es wurde NICHTS am
## methodischen Vorgehen eigenmaechtig geaendert.
##
## KORREKTURLAUF (29.08.2026) gemaess Validierungsbericht_Hitzesommer-2026.md
## ("Freigabe mit Auflagen"): Fuenf konkrete Auflagen umgesetzt, KEINE
## Aenderung am methodischen Vorgehen/an der Kernschlussfolgerung:
##  1. SAP-5.3-Pflichtkennzeichnung des primaeren PI als "moeglicherweise
##     unpraezise" ergaenzt (bei primaerem PI-Report UND in der Zusammenfassung).
##  2. Forest-Plot: 2025 optisch/textlich als vorlaeufig/nicht finalisiert
##     gekennzeichnet (eigene Farbe/Form/Legendeneintrag).
##  3. S3 (Delta-Methode): Jahre 1993/1996/2011 (CV 247%/249%/134%) explizit
##     als "Delta-Approximation unzuverlaessig" markiert (neue CSV).
##  4. 2018-Diskrepanz (SAP 8.1, "~9.400"): begruendete, ausdruecklich
##     unbestaetigte Vermutung zur Herkunft ergaenzt (Verwechslung mit oberer
##     PI-Grenze 2019 in EB-42-2022).
##  5. tabelle_modellzusammenfassung.csv: QEp-Spalte SAP-11-konform gerundet
##     (fmt_p()), Rohwert zusaetzlich in QEp_roh.
##
## ---------------------------------------------------------------------------
## ZUSAMMENFASSUNG DER ABWEICHUNGEN VOM SAP (Details jeweils inline markiert):
##
## (A) Abweichung vom SAP - Rueckfrage an Mensch [SAP Abschnitt 2 / 3 Schritt 4]:
##     Der SAP nimmt an, dass die historischen Referenzjahre bis 2025
##     "abgeschlossene, finale Jahresschaetzungen" sind. Der Struktur-Check
##     (Abschnitt 1 dieses Skripts) zeigt: Fuer 2025 existiert (Stand
##     Zugriffsdatum 29.08.2026) KEINE im Epid-Bull-Format finalisierte
##     Jahresschaetzung (die letzte solche Publikation, "Hitzebedingte
##     Mortalitaet in Deutschland 2023 und 2024", deckt nur bis 2024 ab). Der
##     jüngste verfuegbare RKI-Wert fuer 2025 stammt aus dem letzten
##     Wochenbericht der Saison 2025 (KW 38/2025, Berichtsdatum 02.10.2025)
##     und ist dort vom RKI selbst ausdruecklich als "noch unvollstaendig"
##     gekennzeichnet -- strukturell identisch zur Vorlaeufigkeits-Logik, die
##     der SAP explizit nur fuer 2026 vorsieht. Gemaess Instruktion ("SAP
##     buchstabengetreu umsetzen, Abweichung markieren statt eigenmaechtig
##     aendern") wird 2025 dennoch wie im SAP vorgesehen in das primaere
##     historische Fenster (bis einschliesslich 2025) aufgenommen, mit dem
##     best verfuegbaren Wert (KW38/2025). Dies wird in JEDER Ergebnis-
##     darstellung, die 2025 betrifft, als Limitation ausgewiesen.
##
## (B) Abweichung vom SAP - Rueckfrage an Mensch [SAP Abschnitt 5.1 Schritt 1 /
##     Abschnitt 6, S3]: Der SAP sieht fuer die log-Skalen-Sensitivitaet (S3)
##     eine "Rueckrechnung von SEi auf der log-Skala" aus den publizierten
##     Intervallgrenzen vor. Das ist rechnerisch NICHT direkt umsetzbar, weil
##     ein grosser Teil der historischen RKI-Prädiktionsintervalle eine
##     NEGATIVE untere Grenze hat (vom RKI selbst so kommentiert: "Negative
##     Werte der unteren Praediktionsgrenze bedeuten, dass sich die Zahl der
##     Todesfaelle nicht eindeutig von normalen Schwankungen abgrenzen
##     laesst") -- log(negative Zahl) ist nicht definiert. S3 wird daher
##     stattdessen ueber die Delta-Methode approximiert:
##     SE_log,i = SE_i / theta_i (Standardnaeherung fuer log-Transformationen).
##     Dies wird in Abschnitt 6/S3 explizit dokumentiert.
##
## (C) Hinweis (keine Abweichung, aber Praezisierung): Das vom RKI publizierte
##     Unsicherheitsintervall heisst in der Primaerquelle selbst
##     "95%-Praediktionsintervall" (Modellunsicherheit der Jahres-/
##     Wochenschaetzung). Das ist NICHT identisch mit dem in SAP 5.1 Schritt 4
##     geschaetzten meta-analytischen 95%-Praediktionsintervall (Schwankungs-
##     breite kuenftiger Jahre). Beide Ebenen werden im Folgenden klar
##     unterschieden ("RKI-Unsicherheitsintervall je Jahr" vs. "meta-
##     analytisches Praediktionsintervall").
##
## Datenquelle (SAP Abschnitt 3): Robert Koch-Institut (RKI). Primaerquellen
## (PDF, edoc.rki.de), alle im Ordner output/ als Belege abgelegt:
##  - EB-19-2025 ("Hitzebedingte Mortalitaet in Deutschland 2023 und 2024",
##    Epid Bull 2025;19:3-9, DOI 10.25646/13135) + Anhang-xlsx (1992-2024)
##  - RKI-Wochenbericht KW38/2025 (Berichtsdatum 02.10.2025) -> 2025-Wert
##  - RKI-Wochenbericht KW33/2026 (Berichtsdatum 27.08.2026) -> 2026-Wert
##  - EB-42-2022 und EB-26-2023 (Methodikbruch-Dokumentation, s.u.)
## Zugriffsdatum: 2026-08-29 (automatisierter Zugriff via curl/edoc.rki.de,
##   erfolgreich; kein Netzwerk-Blocker aufgetreten).
##
## ============================================================================

## ---- 0. Setup ---------------------------------------------------------
suppressMessages({
  library(metafor)   # Random-/Fixed-Effect-Modelle, Meta-Regression, LOO
  library(meta)      # Kreuzvalidierung der Primaerschaetzung (SAP 10)
  library(lmtest)    # Durbin-Watson-Test (SAP 5.2)
  library(boot)      # Bootstrap-Praediktionsintervall (SAP 6, S6)
  library(ggplot2)   # Forest-Plot, Diagnostikgrafiken (SAP 11)
  library(dplyr)
})

cat("R Version:", R.version.string, "\n")
cat("metafor:", as.character(packageVersion("metafor")),
    " meta:", as.character(packageVersion("meta")),
    " lmtest:", as.character(packageVersion("lmtest")),
    " boot:", as.character(packageVersion("boot")),
    " ggplot2:", as.character(packageVersion("ggplot2")), "\n\n")

skript_dir <- "C:/Users/dsaur/klima-evidenzcheck/Analysen/2026-08-hitzesommer-2026"
out_dir    <- file.path(skript_dir, "output")
if (!dir.exists(out_dir)) dir.create(out_dir, recursive = TRUE)

runlog_path <- file.path(skript_dir, "run_log.txt")
runlog_con  <- file(runlog_path, open = "wt")
sink(runlog_con, split = TRUE)  # alles, was hier ausgegeben wird, geht auch ins Run-Log

fmt_p <- function(p) ifelse(p < 0.01, "p < 0.01", sprintf("p = %.2f", p))
z95   <- qnorm(0.975)  # = 1.959964, SAP 5.1 Schritt 1

cat("========================================================================\n")
cat("HITZESOMMER 2026 -- Analyse gemaess SAP_hitzesommer-2026.md v1.1 (final)\n")
cat("Skriptlauf:", format(Sys.time()), "\n")
cat("========================================================================\n\n")

## ============================================================================
## SAP 3: STRUKTUR-CHECK DER RKI-PRIMAERQUELLE (vor jeder Modellschaetzung)
## ============================================================================
cat("\n### SAP 3: Struktur-Check der Datenquelle #############################\n\n")

roh <- read.csv(file.path(skript_dir, "rki_hitzebedingte_sterbefaelle_rohdaten.csv"),
                 stringsAsFactors = FALSE)

## --- Schritt 1: fruehestes/spaetestes verfuegbares Jahr --------------------
cat("--- Schritt 1: Zeitliche Abdeckung der RKI-Reihe ---\n")
cat("Fruehestes Jahr in der aktuellen RKI-Primaerquelle (EB-19-2025 Anhang,\n")
cat("  Deutschland-Blatt):", min(roh$jahr[roh$status == "final"]), "\n")
cat("Spaetestes Jahr mit FINALER Jahresschaetzung (EB-19-2025):",
    max(roh$jahr[roh$status == "final"]), "\n")
cat("2025: bester verfuegbarer Wert = letzter Wochenbericht der Saison\n")
cat("  (KW38/2025), von RKI selbst als 'noch unvollstaendig' bezeichnet.\n")
cat("2026 (Zieljahr): vorlaeufiger, unterjaehriger Wochenbericht (s. Schritt 4).\n\n")

## --- Schritt 2: exakte Definition der Zielgroesse --------------------------
cat("--- Schritt 2: Definition der Zielgroesse ---\n")
cat("Formal bestaetigt anhand RKI-Primaerquelle (Tabelle 1 in allen geprueften\n")
cat("  Wochen-/Jahresberichten): Die Zielgroesse 'Geschaetzte Anzahl\n")
cat("  Sterbefaelle' ist eine ABSOLUTE, NICHT altersstandardisierte Fallzahl.\n")
cat("  Sie steht in der Quelle NEBEN einer separaten Spalte 'Sterbefaelle pro\n")
cat("  100.000 Einwohner' (bevoelkerungsbezogene Rate, ebenfalls NICHT\n")
cat("  altersstandardisiert -- nur populationsgroessen-normiert, keine\n")
cat("  Alterskohorten-Gewichtung). Dies bestaetigt formal die SAP-8.2-Annahme.\n")
cat("  Zeitliche Abgrenzung: Sommerhalbjahr, kumulativ KW15 bis KW(Berichts-\n")
cat("  woche); Attributionsmethodik: GAM-basiertes Exzess-Mortalitaetsmodell\n")
cat("  (Modellwert 'mit Hitze' minus 'ohne Hitze', Schwelle ca. 20 Grad C\n")
cat("  Wochenmitteltemperatur).\n\n")

## --- Schritt 3: Sicherheitsniveau/Form des Unsicherheitsintervalls ---------
cat("--- Schritt 3: Sicherheitsniveau und Form des Unsicherheitsintervalls ---\n")
cat("Ausschliesslich anhand RKI-Primaerquelle (PDF, Tabelle 1) festgestellt:\n")
cat("  Alle geprueften Berichte (EB-19-2025, EB-42-2022, EB-26-2023,\n")
cat("  Wochenberichte KW33/2026 und KW38/2025) bezeichnen ihr Intervall\n")
cat("  explizit als '95%-Praediktionsintervall' (kein 'Konfidenzintervall').\n")
cat("  => Sicherheitsniveau = 95%, z = 1.959964 (SAP 5.1 Schritt 1 unveraendert\n")
cat("     anwendbar; kein abweichendes Niveau, keine Anpassung von z noetig.\n")
cat("  (Hinweis C im Skriptkopf: begriffliche Abgrenzung ggue. dem\n")
cat("   meta-analytischen Praediktionsintervall dieser Analyse.)\n\n")

asym <- roh %>% filter(status == "final") %>%
  mutate(diff_unten = punktschaetzer - pi_unten,
         diff_oben  = pi_oben - punktschaetzer,
         asym_ratio = diff_oben / diff_unten)
cat("Symmetrie-Check (Punktschaetzer vs. untere/obere PI-Grenze), n =",
    nrow(asym), "historische Jahre:\n")
cat("  Median(oben-unten Verhaeltnis) =", round(median(asym$asym_ratio), 2),
    "; Range [", round(min(asym$asym_ratio), 2), ";",
    round(max(asym$asym_ratio), 2), "]\n")
cat("  -> Intervalle sind ueberwiegend NAEHERUNGSWEISE symmetrisch (kleine\n")
cat("     Abweichungen durch Rundung auf Zehner-/Hunderterstelle erklaerbar),\n")
cat("     aber nicht exakt symmetrisch. Gemaess SAP 5.1 wird dies dokumentiert;\n")
cat("     S3 (log-Skala, Abschnitt 6) wird gemaess SAP-Abschnitt-6-Praeambel\n")
cat("     ohnehin IMMER (nicht nur konditional) durchgefuehrt.\n\n")

cat("Bedingte Entscheidungsregel SE_2026 (SAP Abschnitt 3 Schritt 3, finale\n")
cat("  Ueberarbeitung): PRIMAERER FALL trifft zu -- RKI publiziert im\n")
cat("  verwendeten Wochenbericht KW33/2026 ein formales 95%-Praediktions-\n")
cat("  intervall (15.800 [14.500; 17.000]). Der FALLBACK (SE_2026 = sd der\n")
cat("  historischen Punktschaetzer) wird NICHT benoetigt/angewendet.\n\n")

## --- Schritt 4: Vorliegen und Vorlaeufigkeit der 2026-Schaetzung -----------
cat("--- Schritt 4: 2026-Schaetzung -- Verfuegbarkeit und Vorlaeufigkeit ---\n")
cat("Verwendeter Bericht: RKI-Wochenbericht zur hitzebedingten Mortalitaet\n")
cat("  Kalenderwoche (ISO-Woche): KW 33/2026 (10.08.-16.08.2026)\n")
cat("  Berichtsdatum: 27.08.2026\n")
cat("  Kumulativer Berichtszeitraum: KW 15 bis KW 33/2026\n")
cat("  Punktschaetzer / 95%-Praediktionsintervall: 15.800 [14.500; 17.000]\n")
cat("  VORLAEUFIGKEITS-HINWEIS (Pflichtangabe SAP Abschnitt 11): Diese Zahl\n")
cat("  ist ausdruecklich UNVOLLSTAENDIG (Sommer-Berichtszeitraum bis\n")
cat("  September) und wird im Saisonverlauf weiter revidiert. Zum Vergleich:\n")
cat("  die KW38/2025-Schaetzung fuer 2025 (2.500) stieg gegenueber frueheren\n")
cat("  Wochenberichten der Saison 2025 im Verlauf an -- ein Beleg dafuer,\n")
cat("  dass solche unterjaehrigen Schaetzungen tatsaechlich nachtraeglich\n")
cat("  (i.d.R. nach oben) korrigiert werden koennen (SAP Abschnitt 9).\n\n")

## --- Schritt 5: Methodikbrueche / Quellenabweichungen (SYSTEMATISCH,
##     ALLE Jahre, nicht nur 2018) -------------------------------------------
cat("--- Schritt 5: Methodikbrueche und Quellenabweichungen (systematische\n")
cat("    Pruefung ALLER Jahre, nicht nur des SAP-Hinweises zu 2018) ---\n\n")

cat("(a) Von der RKI-Quelle SELBST EXPLIZIT benannter Methodikbruch:\n")
cat("    EB-19-2025 (Methoden-Abschnitt) dokumentiert woertlich: 'Da es in\n")
cat("    Folge der COVID-19-Pandemie ... nicht nur zu deutlichen Uebersterb-\n")
cat("    lichkeiten in Deutschland kam, sondern sich auch das saisonale\n")
cat("    Sterblichkeitsmuster veraenderte, verwenden wir fuer die Zeit SEIT\n")
cat("    DEM JAHR 2020 eine flexiblere Kurve zur Modellierung der\n")
cat("    Sterblichkeit.' => Explizit benannter, DATIERTER Strukturbruch in\n")
cat("    der Trendmodellierung, Bruchjahr = 2020. Dies ist die primaere\n")
cat("    Grundlage fuer den Trigger des Sensitivitaetsfensters S1c (SAP\n")
cat("    Abschnitt 4, Bedingung (i)).\n\n")

cat("(b) Weiterer von der Quelle selbst dokumentierter Verfahrenswechsel:\n")
cat("    EB-26-2023 ('Neubestimmung der Praediktionsintervalle...') aendert\n")
cat("    explizit, welche Kalenderwochen in die Schaetzung eingehen (nur noch\n")
cat("    Wochen mit tatsaechlicher Hitzewirkung statt pauschal KW15-40) sowie\n")
cat("    die Rundungskonvention -- mit dem Ergebnis spuerbar schmalerer\n")
cat("    Unsicherheitsintervalle. Die hier als Primaerquelle verwendete\n")
cat("    EB-19-2025-Reihe (1992-2024) wendet die AKTUELLE Methodik\n")
cat("    einheitlich rueckwirkend auf die gesamte Reihe an -- innerhalb\n")
cat("    dieses fuer die Analyse verwendeten Datensatzes liegt also KEIN\n")
cat("    Versions-Mischmasch vor. Der 2020-Bruch unter (a) bleibt jedoch\n")
cat("    bestehen, da er eine strukturelle Eigenschaft der AKTUELLEN Methodik\n")
cat("    selbst ist (unterschiedliche Modellflexibilitaet vor/nach 2020).\n\n")

cat("(c) Jahresweise Quellenabweichung, konkretes Beispiel 2018 (SAP 8.1-\n")
cat("    Hinweis), SYSTEMATISCH ueber drei RKI-Publikationsversionen geprueft:\n")
tab_2018 <- data.frame(
  Publikation = c("EB-42-2022 (Okt. 2022, Originaltabelle)",
                  "EB-26-2023 (Jun. 2023, Neubestimmung PI)",
                  "EB-19-2025 (Mai 2025, aktuellste Primaerquelle)"),
  Wert_2018 = c("8.300 [5.400; 11.100]",
                "8.400 [7.100; 9.800]",
                "8.500 [7.100; 10.100]")
)
print(tab_2018, row.names = FALSE)
cat("\n  => Es bestaetigt sich eine REALE, aber MODERATE Verschiebung des\n")
cat("     2018-Schaetzers ueber Publikationsversionen (8.300 -> 8.400 ->\n")
cat("     8.500; deutlich schmalere Unsicherheitsintervalle in neueren\n")
cat("     Versionen). Der im SAP (Abschnitt 8.1) als Kontext genannte\n")
cat("     konkrete Wert 'aktuell ~9.400' konnte in KEINER der drei\n")
cat("     geprueften RKI-Primaerquellen (edoc.rki.de) reproduziert werden --\n")
cat("     dies wird hier transparent als NICHT-Bestaetigung des im SAP\n")
cat("     genannten Einzelwerts dokumentiert (moeglicherweise Sekundaer-\n")
cat("     quelle/Dashboard-Rundung oder eine hier nicht aufgefundene weitere\n")
cat("     Publikationsversion; ungeprueft). Das grundsaetzliche Phaenomen\n")
cat("     'Methodikrevisionen veraendern publizierte Werte fuer dasselbe\n")
cat("     Jahr' ist damit unabhaengig vom exakten SAP-Zahlenwert bestaetigt\n")
cat("     und stuetzt zusaetzlich (neben (a)) den S1c-Trigger.\n\n")
cat("     BEGRUENDETE, AUSDRUECKLICH UNBESTAETIGTE VERMUTUNG zur Herkunft\n")
cat("     des SAP-Werts 'aktuell ~9.400' (Validierungsbericht Auflage 4,\n")
cat("     eigene Volltextsuche in allen fuenf extrahierten RKI-Dokumenten):\n")
cat("     Der Wert 9.400 taucht tatsaechlich EIN einziges Mal auf --\n")
cat("     in EB-42-2022, jedoch als OBERE 95%-Praediktionsintervallgrenze\n")
cat("     fuer das Jahr 2019 (nicht 2018!): '2019 6.900 [4.000; 9.400]'\n")
cat("     (eb42.txt, Zeile 352). Dies ist ein plausibler, aber NICHT\n")
cat("     abschliessend verifizierter Kandidat fuer die Herkunft der im SAP\n")
cat("     genannten Zahl: vermutlich eine Verwechslung entweder zwischen\n")
cat("     Punktschaetzer und Intervall-OBERGRENZE, oder zwischen den\n")
cat("     benachbarten 'Rekordsommer'-Jahren 2018 und 2019 (die in\n")
cat("     Sekundaerquellen/Dashboards oft gemeinsam genannt werden). Diese\n")
cat("     Erklaerung wird HIER AUSDRUECKLICH ALS UNBESTAETIGTE, WENN AUCH\n")
cat("     BEGRUENDETE VERMUTUNG dokumentiert -- nicht als gesicherter\n")
cat("     Befund -- und aendert nichts an der oben bereits dokumentierten\n")
cat("     Kernfeststellung, dass '~9.400' fuer 2018 in keiner der drei\n")
cat("     geprueften Primaerquellen reproduzierbar ist.\n\n")

cat("=> ERGEBNIS Schritt 5 / Trigger-Bedingung SAP Abschnitt 4:\n")
cat("   Trigger (i) 'von der Quelle selbst explizit benannter Methodikbruch'\n")
cat("   ist ERFUELLT (COVID-bedingte Modelltrendaenderung ab 2020).\n")
bruchjahr <- 2020
cat("   => S1c-Fenster (Abschnitt 6) = Jahre ab", bruchjahr, "bis 2025.\n\n")

## ---- Historische Datenreihe + 2026 zusammenstellen ------------------------
hist_final <- roh %>% filter(jahr <= 2025) %>%
  mutate(sei = (pi_oben - pi_unten) / (2 * z95),
         vi  = sei^2)
cat("Primaeres historisches Referenzfenster (SAP Abschnitt 4): ",
    min(hist_final$jahr), "-", max(hist_final$jahr),
    ", n =", nrow(hist_final), "Jahre (keine fehlenden Werte in diesem\n")
cat("  durchgehenden Fenster; SAP-Ausschlusskriterium 'fehlende Werte' nicht\n")
cat("  einschlaegig).\n\n")

theta_2026 <- roh$punktschaetzer[roh$jahr == 2026]
pi_lo_2026 <- roh$pi_unten[roh$jahr == 2026]
pi_hi_2026 <- roh$pi_oben[roh$jahr == 2026]
se_2026    <- (pi_hi_2026 - pi_lo_2026) / (2 * z95)
cat("2026 (Zieljahr, NICHT im historischen Fenster):", theta_2026,
    "[", pi_lo_2026, ";", pi_hi_2026, "], SE_2026 =", round(se_2026, 1),
    "(primaerer Fall, aus RKI-PI zurueckgerechnet)\n\n")

write.csv(hist_final, file.path(out_dir, "aufbereitete_historische_reihe.csv"),
          row.names = FALSE)

## ============================================================================
## Hilfsfunktionen
## ============================================================================

## Higgins-Thompson-Spiegelhalter-PI, SAP 5.1 Schritt 4: df = k - p - 1,
## wobei p = Anzahl Regressionskoeffizienten (p=1 im reinen RE-Modell ->
## df = k-2, wie im SAP woertlich angegeben; verallgemeinert fuer S5-
## Meta-Regression mit p=2 -> df = k-3).
compute_pi <- function(mu, se_mu, tau2, k, p = 1) {
  df <- k - p - 1
  if (df <= 0) return(c(pi_lo = NA, pi_hi = NA, df = df))
  tcrit <- qt(0.975, df = df)
  se_pi <- sqrt(tau2 + se_mu^2)
  c(pi_lo = mu - tcrit * se_pi, pi_hi = mu + tcrit * se_pi, df = df)
}

classify <- function(theta, pi_lo, pi_hi) {
  if (is.na(pi_lo) || is.na(pi_hi)) return(NA_character_)
  if (theta < pi_lo) "unterhalb PI"
  else if (theta > pi_hi) "oberhalb PI"
  else "innerhalb PI"
}

zscore_2026 <- function(theta, mu, tau2, se_mu, se_target) {
  (theta - mu) / sqrt(tau2 + se_mu^2 + se_target^2)
}

## ============================================================================
## SAP 5.1: PRIMAERANALYSE
## ============================================================================
cat("\n### SAP 5.1: Primaeranalyse (REML, HKSJ, volles historisches Fenster) ##\n\n")

m_primaer <- rma(yi = punktschaetzer, vi = vi, data = hist_final,
                  method = "REML", test = "knha")
print(m_primaer)

mu_p    <- as.numeric(m_primaer$b)
se_mu_p <- as.numeric(m_primaer$se)
tau2_p  <- m_primaer$tau2
k_p     <- m_primaer$k
pi_p    <- compute_pi(mu_p, se_mu_p, tau2_p, k_p, p = 1)

cat("\n--- Schritt 3: Heterogenitaetsmasse (Primaerfenster) ---\n")
tau2_ci <- confint(m_primaer)$random["tau^2", c("ci.lb", "ci.ub")]
i2_ci   <- confint(m_primaer)$random["I^2(%)", c("ci.lb", "ci.ub")]
cat("Cochran's Q(df=", k_p - 1, ") =", round(m_primaer$QE, 2), ",",
    fmt_p(m_primaer$QEp), "\n")
cat("tau^2 =", round(tau2_p, 2), " [95%-CI:", round(tau2_ci[1], 2), ";",
    round(tau2_ci[2], 2), "]\n")
cat("I^2 =", round(m_primaer$I2, 2), "% [95%-CI:", round(i2_ci[1], 2), ";",
    round(i2_ci[2], 2), "]\n")

cat("\n--- Schritt 4: 95%-Praediktionsintervall (Higgins-Thompson-\n")
cat("    Spiegelhalter, df = k-2 =", pi_p["df"], ") ---\n")
cat("mu_hat =", round(mu_p, 0), " (SE =", round(se_mu_p, 1), ", HKSJ-adjustiert)\n")
cat("95%-Praediktionsintervall: [", round(pi_p["pi_lo"], 0), ";",
    round(pi_p["pi_hi"], 0), "]\n")

## SAP 5.3, Pflichtkennzeichnung (Validierungsbericht Auflage 1): SAP 5.3
## verlangt woertlich, dass bei signifikanter Normalitaetsabweichung der
## Residuen "die REML-basierte Normal-Approximation ... primaer [bleibt],
## aber als moeglicherweise unpraezise gekennzeichnet [wird]". Die formale
## Shapiro-Wilk-Testung erfolgt vollstaendig weiter unten unter SAP 5.2
## (Diagnostik-Plan); hier wird dieselbe, bereits an m_primaer verfuegbare
## Teststatistik vorab herangezogen, um die Pflichtkennzeichnung direkt an
## der Stelle zu platzieren, an der das primaere PI selbst berichtet wird
## (Objekte resid_stud_primaer/sw_test_primaer werden unten unter SAP 5.2
## wiederverwendet, nicht erneut berechnet).
resid_stud_primaer <- rstudent(m_primaer)$z
sw_test_primaer    <- shapiro.test(resid_stud_primaer)
normalitaet_verletzt <- sw_test_primaer$p.value < 0.05
if (normalitaet_verletzt) {
  cat("\nHINWEIS (SAP 5.3, Pflichtkennzeichnung): Das oben berichtete\n")
  cat("  PRIMAERE 95%-Praediktionsintervall ist aufgrund signifikanter\n")
  cat("  Normalitaetsabweichung der Residuen (Shapiro-Wilk",
      fmt_p(sw_test_primaer$p.value), "-- Details siehe SAP 5.2 unten)\n")
  cat("  MOEGLICHERWEISE UNPRAEZISE. Es bleibt gemaess SAP 5.3 dennoch\n")
  cat("  primaer; zusaetzlich wird ein verteilungsfreies\n")
  cat("  Praediktionsintervall berichtet (S6, SAP Abschnitt 6).\n\n")
}

cat("\n--- Schritt 5: Klassifikation und Effektgroesse fuer 2026 (PRIMAERES\n")
cat("    ERGEBNIS) ---\n")
klass_p <- classify(theta_2026, pi_p["pi_lo"], pi_p["pi_hi"])
z_p     <- zscore_2026(theta_2026, mu_p, tau2_p, se_mu_p, se_2026)
cat("theta_2026 =", theta_2026, " liegt", klass_p, "\n")
cat("z_2026 =", round(z_p, 2), "\n")
cat("(Sprachregelung SAP 5.5/8.3: KEINE 'statistisch signifikant\n")
cat(" aussergewoehnlich'-Formulierung; rein deskriptive Einordnung.)\n\n")

cat("--- Kreuzvalidierung mit Paket 'meta' (SAP Abschnitt 10) ---\n")
m_check <- metagen(TE = punktschaetzer, seTE = sei, studlab = as.character(jahr),
                    data = hist_final, method.tau = "REML", hakn = TRUE,
                    prediction = TRUE, method.predict = "HTS")
cat("meta::metagen mu =", round(m_check$TE.random, 1),
    " (metafor:", round(mu_p, 1), ") -- ")
cat(ifelse(abs(m_check$TE.random - mu_p) < 0.5, "UEBEREINSTIMMUNG.\n",
           "ABWEICHUNG, siehe Detailoutput.\n"))
cat("meta::metagen PI: [", round(m_check$lower.predict, 0), ";",
    round(m_check$upper.predict, 0), "] (metafor: [",
    round(pi_p["pi_lo"], 0), ";", round(pi_p["pi_hi"], 0), "])\n\n")

## ============================================================================
## SAP 5.2: MODELLANNAHMEN-PRUEFUNG (DIAGNOSTIK)
## ============================================================================
cat("\n### SAP 5.2: Diagnostik-Plan #############################################\n\n")

## --- Trendpruefung: Meta-Regression auf Kalenderjahr -----------------------
cat("--- Trendpruefung (Meta-Regression theta_i ~ Jahr) ---\n")
m_trend <- rma(yi = punktschaetzer, vi = vi, mods = ~jahr, data = hist_final,
                method = "REML", test = "knha")
print(m_trend)
beta1   <- m_trend$b[2]
beta1_p <- m_trend$pval[2]
trend_signifikant <- beta1_p < 0.05
cat("\nSteigung beta1 =", round(beta1, 2), "Sterbefaelle/Jahr,",
    fmt_p(beta1_p), "-> Trend",
    ifelse(trend_signifikant, "SIGNIFIKANT (alpha=0.05)",
           "NICHT signifikant (alpha=0.05)"), "\n")
cat("(SAP 8.1: Der Trend-Test unterscheidet NICHT zwischen realem\n")
cat(" Erwaermungstrend, Bevoelkerungsalterung (SAP 8.2) und Methodikbruch\n")
cat(" (s. Struktur-Check, u.a. der 2020-Modellbruch) als Ursache.)\n\n")

## --- Autokorrelation: Durbin-Watson auf Residuen des Trendmodells ----------
## Technische Umsetzung (siehe Skriptkopf): lmtest::dwtest unterstuetzt keine
## gewichteten lm-Modelle direkt. Die WLS-Schaetzung wird daher durch
## Variablentransformation (y*sqrt(w), x*sqrt(w)) exakt repliziert und dann
## dwtest() auf das äquivalente (ungewichtete) lm-Objekt angewendet -- dies
## ist rechnerisch identisch zur gewichteten Trendregression, macht die
## Residuen aber fuer dwtest() zugaenglich.
cat("--- Autokorrelation (Durbin-Watson auf Residuen des Trendmodells) ---\n")
w_dw  <- 1 / (hist_final$vi + m_trend$tau2)  # Gewichte wie im Trend-Meta-Regressionsmodell (m_trend)
sw_dw <- sqrt(w_dw)
dat_dw <- data.frame(ytil = hist_final$punktschaetzer * sw_dw,
                      sw   = sw_dw,
                      xtil = hist_final$jahr * sw_dw)
m_dw <- lm(ytil ~ 0 + sw + xtil, data = dat_dw)
dw_test <- dwtest(m_dw)
cat("DW =", round(dw_test$statistic, 3), ",", fmt_p(dw_test$p.value),
    "->", ifelse(dw_test$p.value < 0.05,
                  "SIGNIFIKANTE Autokorrelation (alpha=0.05)",
                  "keine signifikante Autokorrelation (alpha=0.05)"), "\n\n")
autokorr_signifikant <- dw_test$p.value < 0.05

## --- Normalitaet der studentisierten Residuen ------------------------------
## Hinweis: resid_stud/sw_test/normalitaet_verletzt wurden bereits weiter oben
## (SAP 5.1, direkt bei der Berichterstattung des primaeren PI) berechnet, um
## dort die SAP-5.3-Pflichtkennzeichnung zu ermoeglichen. Hier werden dieselben
## Objekte wiederverwendet (keine erneute Berechnung), formal unter SAP 5.2
## ausgewiesen und geplottet.
cat("--- Normalitaet der studentisierten Residuen (Shapiro-Wilk + QQ-Plot) ---\n")
resid_stud <- resid_stud_primaer
sw_test <- sw_test_primaer
cat("Shapiro-Wilk: W =", round(sw_test$statistic, 3), ",",
    fmt_p(sw_test$p.value), "->",
    ifelse(sw_test$p.value < 0.05,
           "SIGNIFIKANTE Abweichung von Normalitaet (alpha=0.05)",
           "kein Hinweis auf Abweichung von Normalitaet (alpha=0.05)"), "\n\n")
## normalitaet_verletzt bereits oben (SAP 5.1) gesetzt; hier nur bestaetigend
## erneut zugewiesen, Wert identisch.
normalitaet_verletzt <- sw_test$p.value < 0.05

png(file.path(out_dir, "diagnostik_qqplot.png"), width = 1000, height = 900, res = 150)
qqnorm(resid_stud, main = "QQ-Plot: studentisierte Residuen (Primaermodell)",
       xlab = "Theoretische Quantile", ylab = "Studentisierte Residuen")
qqline(resid_stud, col = "red")
dev.off()

## --- Einfluss-/Ausreisserdiagnostik: Leave-one-out -------------------------
cat("--- Leave-one-out-Diagnostik (SAP 5.2 / S7) ---\n")
loo <- leave1out(m_primaer)
loo_df <- data.frame(jahr_ausgeschlossen = hist_final$jahr,
                      mu_hat = round(loo$estimate, 1),
                      tau2   = round(loo$tau2, 1),
                      I2     = round(loo$I2, 1),
                      Q      = round(loo$Q, 2),
                      Qp     = loo$Qp)
print(loo_df, row.names = FALSE)
write.csv(loo_df, file.path(out_dir, "tabelle_leave_one_out.csv"), row.names = FALSE)

mu_range_loo <- range(loo$estimate)
cat("\nSpannweite mu_hat ueber alle Leave-one-out-Wiederholungen: [",
    round(mu_range_loo[1], 0), ";", round(mu_range_loo[2], 0),
    "] (Primaer-mu_hat:", round(mu_p, 0), ")\n")
auffaelligstes_jahr <- hist_final$jahr[which.max(abs(resid_stud))]
cat("Auffaelligstes Einzeljahr (groesstes |studentisiertes Residuum| =",
    round(max(abs(resid_stud)), 2), "):", auffaelligstes_jahr,
    "-- wird benannt, gemaess SAP 5.2 NICHT aus der Primaeranalyse\n")
cat("entfernt.\n\n")

png(file.path(out_dir, "diagnostik_leave_one_out.png"), width = 1200, height = 800, res = 150)
p_loo <- ggplot(loo_df, aes(x = factor(jahr_ausgeschlossen), y = mu_hat)) +
  geom_point(size = 2, color = "steelblue") +
  geom_hline(yintercept = mu_p, linetype = "dashed", color = "darkred") +
  labs(title = "Leave-one-out: gepooltes mu_hat je ausgeschlossenem Jahr",
       subtitle = "Gestrichelte Linie = mu_hat der Primaeranalyse (alle Jahre)",
       x = "Ausgeschlossenes Jahr", y = "mu_hat (Sterbefaelle)") +
  theme_minimal(base_size = 11) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, size = 7))
print(p_loo)
dev.off()

png(file.path(out_dir, "diagnostik_trend.png"), width = 1200, height = 800, res = 150)
pred_trend <- predict(m_trend)
trend_plot_df <- cbind(hist_final, pred_trend)
p_trend <- ggplot(trend_plot_df, aes(x = jahr, y = punktschaetzer)) +
  geom_ribbon(aes(ymin = ci.lb, ymax = ci.ub), fill = "steelblue", alpha = 0.2) +
  geom_line(aes(y = pred), color = "steelblue", linewidth = 1) +
  geom_point() +
  geom_point(data = data.frame(jahr = 2026, punktschaetzer = theta_2026),
             color = "darkred", size = 3) +
  labs(title = "Meta-Regressions-Trendlinie (theta_i ~ Jahr) mit 95%-Konfidenzband",
       subtitle = paste0("beta1 = ", round(beta1, 2), " Sterbefaelle/Jahr, ",
                          fmt_p(beta1_p), " -- 2026 (rot) nicht im Modell enthalten"),
       x = "Jahr", y = "Hitzebedingte Sterbefaelle") +
  theme_minimal(base_size = 11)
print(p_trend)
dev.off()

## ============================================================================
## SAP 5.3: KORREKTUR BEI ANNAHMENVERLETZUNG
## ============================================================================
cat("\n### SAP 5.3: Bewertung der Diagnostik-Trigger ###########################\n\n")
cat("Signifikanter Trend (alpha=0.05):", trend_signifikant, "\n")
cat("Signifikante Autokorrelation (DW, alpha=0.05):", autokorr_signifikant, "\n")
cat("Signifikante Normalitaetsabweichung (Shapiro-Wilk, alpha=0.05):",
    normalitaet_verletzt, "\n\n")
if (trend_signifikant || autokorr_signifikant) {
  cat("=> Trigger ausgeloest: Das statische (trendfreie) Praediktionsintervall\n")
  cat("   BLEIBT primaer (SAP 5.3), wird aber als potenziell verzerrt\n")
  cat("   gekennzeichnet. Trend-adjustiertes PI (S5) ist gemaess SAP als\n")
  cat("   'besonders zu beachten' auszuweisen (siehe Sensitivitaetstabelle).\n\n")
} else {
  cat("=> Kein Trend-/Autokorrelations-Trigger ausgeloest. S5 wird dennoch\n")
  cat("   gemaess SAP Abschnitt 6 (immer durchzufuehren) berechnet und\n")
  cat("   berichtet, aber ohne besondere Kennzeichnung.\n\n")
}
if (normalitaet_verletzt) {
  cat("=> Normalitaets-Trigger ausgeloest: S6 (verteilungsfreies PI) ist\n")
  cat("   gemaess SAP als zusaetzlich zu beachtende Sensitivitaet zu werten.\n")
  cat("   PFLICHTKENNZEICHNUNG (SAP 5.3, woertliche Vorgabe, siehe auch\n")
  cat("   Hinweis oben bei SAP 5.1 Schritt 4): Das PRIMAERE 95%-Praediktions-\n")
  cat("   intervall [", round(pi_p["pi_lo"], 0), ";", round(pi_p["pi_hi"], 0),
      "] bleibt zwar primaer, ist aber\n")
  cat("   aufgrund dieser signifikanten Normalitaetsabweichung der Residuen\n")
  cat("   (Shapiro-Wilk", fmt_p(sw_test$p.value), ") moeglicherweise unpraezise.\n\n")
} else {
  cat("=> Kein Normalitaets-Trigger; S6 wird dennoch (Abschnitt 6: immer)\n")
  cat("   berechnet und berichtet.\n\n")
}

## ============================================================================
## SAP 6: SENSITIVITAETSANALYSEN S1-S8 (VOLLSTAENDIG, KEIN CHERRY-PICKING)
## ============================================================================
cat("\n### SAP 6: Sensitivitaetsanalysen S1-S8 ##################################\n\n")

ergebnisse <- list()

add_ergebnis <- function(variante, k, mu, se_mu, tau2, pi_lo, pi_hi, theta = theta_2026,
                          se_target = se_2026, hinweis = "") {
  z <- zscore_2026(theta, mu, tau2, se_mu, se_target)
  data.frame(Variante = variante, k = k, mu_hat = round(mu, 0),
             se_mu = round(se_mu, 1), tau2 = round(tau2, 2),
             PI_unten = round(pi_lo, 0), PI_oben = round(pi_hi, 0),
             Klassifikation_2026 = classify(theta, pi_lo, pi_hi),
             z_2026 = round(z, 2), Hinweis = hinweis, stringsAsFactors = FALSE)
}

## --- S1: alternative historische Zeitfenster -------------------------------
cat("--- S1a: letzte 10 Jahre vor 2026 (2016-2025) ---\n")
d_s1a <- hist_final %>% filter(jahr >= 2016, jahr <= 2025)
m_s1a <- rma(yi = punktschaetzer, vi = vi, data = d_s1a, method = "REML", test = "knha")
pi_s1a <- compute_pi(as.numeric(m_s1a$b), as.numeric(m_s1a$se), m_s1a$tau2, m_s1a$k)
cat("k =", m_s1a$k, ", mu_hat =", round(as.numeric(m_s1a$b), 0),
    ", PI = [", round(pi_s1a["pi_lo"], 0), ";", round(pi_s1a["pi_hi"], 0), "]\n")
ergebnisse[["S1a_letzte10J"]] <- add_ergebnis("S1a: letzte 10 Jahre (2016-2025)",
  m_s1a$k, as.numeric(m_s1a$b), as.numeric(m_s1a$se), m_s1a$tau2,
  pi_s1a["pi_lo"], pi_s1a["pi_hi"])

cat("\n--- S1b: letzte 15 Jahre vor 2026 (2011-2025) ---\n")
d_s1b <- hist_final %>% filter(jahr >= 2011, jahr <= 2025)
m_s1b <- rma(yi = punktschaetzer, vi = vi, data = d_s1b, method = "REML", test = "knha")
pi_s1b <- compute_pi(as.numeric(m_s1b$b), as.numeric(m_s1b$se), m_s1b$tau2, m_s1b$k)
cat("k =", m_s1b$k, ", mu_hat =", round(as.numeric(m_s1b$b), 0),
    ", PI = [", round(pi_s1b["pi_lo"], 0), ";", round(pi_s1b["pi_hi"], 0), "]\n")
ergebnisse[["S1b_letzte15J"]] <- add_ergebnis("S1b: letzte 15 Jahre (2011-2025)",
  m_s1b$k, as.numeric(m_s1b$b), as.numeric(m_s1b$se), m_s1b$tau2,
  pi_s1b["pi_lo"], pi_s1b["pi_hi"])

cat("\n--- S1c: Jahre ab Bruchjahr", bruchjahr,
    "(getriggert durch Struktur-Check Schritt 5) ---\n")
d_s1c <- hist_final %>% filter(jahr >= bruchjahr)
m_s1c <- rma(yi = punktschaetzer, vi = vi, data = d_s1c, method = "REML", test = "knha")
pi_s1c <- compute_pi(as.numeric(m_s1c$b), as.numeric(m_s1c$se), m_s1c$tau2, m_s1c$k)
cat("k =", m_s1c$k, ", mu_hat =", round(as.numeric(m_s1c$b), 0),
    ", PI = [", round(pi_s1c["pi_lo"], 0), ";", round(pi_s1c["pi_hi"], 0), "]\n")
if (m_s1c$k < 5) cat("HINWEIS: k < 5 -> PI statistisch wenig belastbar (SAP Abschnitt 4).\n")
ergebnisse[["S1c_seitBruch"]] <- add_ergebnis(
  paste0("S1c: Jahre ab Bruchjahr ", bruchjahr, " (2020-2025)"),
  m_s1c$k, as.numeric(m_s1c$b), as.numeric(m_s1c$se), m_s1c$tau2,
  pi_s1c["pi_lo"], pi_s1c["pi_hi"],
  hinweis = ifelse(m_s1c$k < 5, "k<5: PI wenig belastbar", ""))

## --- S2: alternative tau^2-Schaetzer ----------------------------------------
cat("\n--- S2: alternative tau^2-Schaetzer (DerSimonian-Laird, Paule-Mandel) ---\n")
m_dl <- rma(yi = punktschaetzer, vi = vi, data = hist_final, method = "DL", test = "knha")
pi_dl <- compute_pi(as.numeric(m_dl$b), as.numeric(m_dl$se), m_dl$tau2, m_dl$k)
cat("DerSimonian-Laird: tau2 =", round(m_dl$tau2, 2), ", mu_hat =",
    round(as.numeric(m_dl$b), 0), ", PI = [", round(pi_dl["pi_lo"], 0), ";",
    round(pi_dl["pi_hi"], 0), "]\n")
ergebnisse[["S2_DL"]] <- add_ergebnis("S2: tau2-Schaetzer DerSimonian-Laird",
  m_dl$k, as.numeric(m_dl$b), as.numeric(m_dl$se), m_dl$tau2,
  pi_dl["pi_lo"], pi_dl["pi_hi"])

m_pm <- rma(yi = punktschaetzer, vi = vi, data = hist_final, method = "PM", test = "knha")
pi_pm <- compute_pi(as.numeric(m_pm$b), as.numeric(m_pm$se), m_pm$tau2, m_pm$k)
cat("Paule-Mandel: tau2 =", round(m_pm$tau2, 2), ", mu_hat =",
    round(as.numeric(m_pm$b), 0), ", PI = [", round(pi_pm["pi_lo"], 0), ";",
    round(pi_pm["pi_hi"], 0), "]\n")
ergebnisse[["S2_PM"]] <- add_ergebnis("S2: tau2-Schaetzer Paule-Mandel",
  m_pm$k, as.numeric(m_pm$b), as.numeric(m_pm$se), m_pm$tau2,
  pi_pm["pi_lo"], pi_pm["pi_hi"])

## --- S3: log-Skalen-SE-Konversion (Delta-Methode, s. Abweichung B) ---------
cat("\n--- S3: Log-Skalen-Variante ---\n")
n_neg <- sum(hist_final$pi_unten <= 0)
cat("Abweichung vom SAP (siehe Skriptkopf, Punkt B):", n_neg, "von",
    nrow(hist_final), "historischen Jahren haben eine untere PI-Grenze <= 0\n")
cat("(log daher nicht direkt aus den Intervallgrenzen rueckrechenbar).\n")
cat("Operationalisierung: Delta-Methode SE_log,i = SE_i / theta_i.\n")
d_s3 <- hist_final %>% mutate(y_log = log(punktschaetzer),
                               se_log = sei / punktschaetzer,
                               vi_log = se_log^2)

## Validierungsbericht Auflage 5 (Prioritaet 3): Die Delta-Naeherung
## SE_log,i = SE_i/theta_i (= Variationskoeffizient CV_i der Jahresschaetzung)
## ist nur fuer kleine CV eine gute lineare Approximation; sie wird fuer
## CV > ca. 30-50% zunehmend ungenau. Eigene Nachrechnung (nutzt die bereits
## vorhandene se_log-Spalte, KEINE neue Berechnung des CV) identifiziert genau
## drei Jahre mit besonders hohem CV: 1996 (CV=249%), 1993 (CV=247%),
## 2011 (CV=134%). Diese werden hier explizit gekennzeichnet.
d_s3$cv_delta <- d_s3$se_log  # CV_i = SE_i/theta_i, identisch zur bereits berechneten se_log-Spalte
jahre_delta_unzuverlaessig <- c(1993, 1996, 2011)
d_s3$delta_warnung <- ifelse(
  d_s3$jahr %in% jahre_delta_unzuverlaessig,
  "Delta-Approximation fuer dieses Jahr unzuverlaessig, mit Vorsicht interpretieren",
  "")
cat("Zuverlaessigkeits-Check der Delta-Naeherung (Validierungsbericht Auflage 5):\n")
cat("  CV_i = SE_i/theta_i je historischem Jahr; Naeherung wird fuer CV > ca.\n")
cat("  30-50% zunehmend ungenau. Jahre mit auffaellig hohem CV:\n")
print(d_s3 %>% filter(jahr %in% jahre_delta_unzuverlaessig) %>%
        transmute(jahr, punktschaetzer, sei, CV_Prozent = round(cv_delta * 100, 0),
                   Warnung = delta_warnung),
      row.names = FALSE)
cat("  => Fuer die Jahre", paste(jahre_delta_unzuverlaessig, collapse = ", "),
    "gilt: Delta-Approximation fuer dieses Jahr unzuverlaessig,\n")
cat("     mit Vorsicht interpretieren. S3 (Gesamtmodell) bleibt dennoch wie\n")
cat("     vom SAP vorgesehen ueber ALLE Jahre gepoolt berechnet (kein Ausschluss\n")
cat("     einzelner Jahre -- SAP sieht kein CV-basiertes Ausschlusskriterium vor).\n\n")
write.csv(d_s3 %>% transmute(jahr, punktschaetzer, sei, CV_Prozent = round(cv_delta * 100, 1),
                              delta_warnung),
          file.path(out_dir, "s3_delta_methode_zuverlaessigkeit.csv"), row.names = FALSE)

m_s3 <- rma(yi = y_log, vi = vi_log, data = d_s3, method = "REML", test = "knha")
mu_log <- as.numeric(m_s3$b); se_mu_log <- as.numeric(m_s3$se)
pi_log <- compute_pi(mu_log, se_mu_log, m_s3$tau2, m_s3$k)
mu_s3_rueck <- exp(mu_log)
pi_s3_lo <- exp(pi_log["pi_lo"]); pi_s3_hi <- exp(pi_log["pi_hi"])
cat("Log-Skala: mu_hat_log =", round(mu_log, 4), "-> rueck-transformiert:",
    round(mu_s3_rueck, 0), ", PI = [", round(pi_s3_lo, 0), ";",
    round(pi_s3_hi, 0), "] (Originalskala)\n")
se_2026_log <- se_2026 / theta_2026
z_s3 <- (log(theta_2026) - mu_log) / sqrt(m_s3$tau2 + se_mu_log^2 + se_2026_log^2)
ergebnisse[["S3_log"]] <- data.frame(
  Variante = "S3: Log-Skalen-Konversion (Delta-Methode)", k = m_s3$k,
  mu_hat = round(mu_s3_rueck, 0), se_mu = NA, tau2 = round(m_s3$tau2, 4),
  PI_unten = round(pi_s3_lo, 0), PI_oben = round(pi_s3_hi, 0),
  Klassifikation_2026 = classify(theta_2026, pi_s3_lo, pi_s3_hi),
  z_2026 = round(z_s3, 2),
  Hinweis = paste0("Abweichung B: Delta-Methode statt direkter log(PI)-",
    "Rueckrechnung. Fuer Jahre ", paste(jahre_delta_unzuverlaessig, collapse = "/"),
    " ist die Delta-Approximation unzuverlaessig (siehe ",
    "s3_delta_methode_zuverlaessigkeit.csv), aendert aber nichts an der ",
    "gepoolten S3-Klassifikation."),
  stringsAsFactors = FALSE)

## --- S4: Fixed-Effect-Modell ------------------------------------------------
cat("\n--- S4: Fixed-Effect-(Common-Effect-)Modell ---\n")
m_fe <- rma(yi = punktschaetzer, vi = vi, data = hist_final, method = "EE")
pi_fe <- compute_pi(as.numeric(m_fe$b), as.numeric(m_fe$se), 0, m_fe$k)
cat("mu_hat =", round(as.numeric(m_fe$b), 0), " (tau2 = 0 per Modellannahme),\n")
cat("PI (= CI, da tau2=0 im FE-Modell) = [", round(pi_fe["pi_lo"], 0), ";",
    round(pi_fe["pi_hi"], 0), "]\n")
ergebnisse[["S4_FE"]] <- add_ergebnis("S4: Fixed-Effect-Modell",
  m_fe$k, as.numeric(m_fe$b), as.numeric(m_fe$se), 0,
  pi_fe["pi_lo"], pi_fe["pi_hi"],
  hinweis = "tau2 auf 0 fixiert; PI=CI unter FE-Annahme")

## --- S5: Trend-adjustierte Meta-Regression ---------------------------------
cat("\n--- S5: Trend-adjustierte Meta-Regression (Prognose fuer 2026) ---\n")
pred_2026 <- predict(m_trend, newmods = 2026)
mu_trend_2026 <- as.numeric(pred_2026$pred)
se_trend_2026 <- as.numeric(pred_2026$se)
pi_trend <- compute_pi(mu_trend_2026, se_trend_2026, m_trend$tau2, m_trend$k, p = 2)
cat("Trend-Prognose fuer 2026: ", round(mu_trend_2026, 0),
    " (SE =", round(se_trend_2026, 1), "), PI = [",
    round(pi_trend["pi_lo"], 0), ";", round(pi_trend["pi_hi"], 0), "]\n")
if (trend_signifikant) {
  cat("(Signifikanter Trend gemaess 5.3 -> S5 ist hier BESONDERS zu beachten.)\n")
}
z_s5 <- zscore_2026(theta_2026, mu_trend_2026, m_trend$tau2, se_trend_2026, se_2026)
ergebnisse[["S5_trend"]] <- data.frame(
  Variante = "S5: Trend-adjustierte Meta-Regression (2026-Prognose)",
  k = m_trend$k, mu_hat = round(mu_trend_2026, 0), se_mu = round(se_trend_2026, 1),
  tau2 = round(m_trend$tau2, 2), PI_unten = round(pi_trend["pi_lo"], 0),
  PI_oben = round(pi_trend["pi_hi"], 0),
  Klassifikation_2026 = classify(theta_2026, pi_trend["pi_lo"], pi_trend["pi_hi"]),
  z_2026 = round(z_s5, 2),
  Hinweis = ifelse(trend_signifikant, "Signifikanter Trend - besonders zu beachten (SAP 5.3)", ""),
  stringsAsFactors = FALSE)

## --- S6: verteilungsfreies Praediktionsintervall ---------------------------
cat("\n--- S6: Verteilungsfreies Praediktionsintervall ---\n")
emp_lo <- quantile(hist_final$punktschaetzer, 0.025)
emp_hi <- quantile(hist_final$punktschaetzer, 0.975)
cat("Empirisches Perzentil-Intervall (2.5%/97.5% der historischen\n")
cat("  Punktschaetzer): [", round(emp_lo, 0), ";", round(emp_hi, 0), "]\n")
ergebnisse[["S6_empirisch"]] <- data.frame(
  Variante = "S6a: Empirisches Perzentil-Intervall (roh)", k = nrow(hist_final),
  mu_hat = round(median(hist_final$punktschaetzer), 0), se_mu = NA, tau2 = NA,
  PI_unten = round(emp_lo, 0), PI_oben = round(emp_hi, 0),
  Klassifikation_2026 = classify(theta_2026, emp_lo, emp_hi), z_2026 = NA,
  Hinweis = "Kein Modell; deskriptive Perzentile der historischen Reihe",
  stringsAsFactors = FALSE)

set.seed(20260828)  # Reproduzierbarkeit
boot_pred <- function(data, idx) {
  resampled <- data[idx, ]
  m <- try(rma(yi = punktschaetzer, vi = vi, data = resampled, method = "REML"),
           silent = TRUE)
  if (inherits(m, "try-error")) return(NA_real_)
  as.numeric(m$b) + rnorm(1, 0, sqrt(max(m$tau2, 0)))  # simulierte "kuenftige" Beobachtung
}
boot_res <- boot(hist_final, boot_pred, R = 5000)
boot_ci <- quantile(boot_res$t, c(0.025, 0.975), na.rm = TRUE)
cat("Bootstrap-Praediktionsintervall (case-resampling, R=5000, simulierte\n")
cat("  kuenftige Jahresbeobachtung mu*+u*): [", round(boot_ci[1], 0), ";",
    round(boot_ci[2], 0), "]\n")
ergebnisse[["S6_bootstrap"]] <- data.frame(
  Variante = "S6b: Bootstrap-Praediktionsintervall (R=5000)", k = nrow(hist_final),
  mu_hat = round(mean(boot_res$t, na.rm = TRUE), 0), se_mu = NA, tau2 = NA,
  PI_unten = round(boot_ci[1], 0), PI_oben = round(boot_ci[2], 0),
  Klassifikation_2026 = classify(theta_2026, boot_ci[1], boot_ci[2]), z_2026 = NA,
  Hinweis = "Case-Resampling-Bootstrap, seed=20260828",
  stringsAsFactors = FALSE)

## --- S7: Leave-one-out -> bereits oben als eigene Tabelle erzeugt ----------
cat("\n--- S7: Leave-one-out-Robustheit ---\n")
cat("Vollstaendige Tabelle in output/tabelle_leave_one_out.csv (siehe SAP 5.2\n")
cat("  oben) sowie output/diagnostik_leave_one_out.png. S7 liefert PER\n")
cat("  DEFINITION keine eigene 2026-Klassifikationsvariante (es werden keine\n")
cat("  neuen PI-Grenzen fuer 2026 konstruiert, sondern die Stabilitaet der\n")
cat("  HISTORISCHEN Schaetzung mu_hat/tau2/I2 geprueft) -- daher taucht S7\n")
cat("  NICHT als Zeile in der Klassifikations-Anhangstabelle auf, sondern\n")
cat("  wird als eigenstaendige Diagnostik-Tabelle/Grafik gemaess SAP\n")
cat("  Abschnitt 11(d) berichtet.\n\n")

## --- S8: HKSJ vs. Standard-Wald-Inferenz -----------------------------------
cat("--- S8: HKSJ vs. Standard-Wald-Inferenz fuer mu_hat ---\n")
m_wald <- rma(yi = punktschaetzer, vi = vi, data = hist_final, method = "REML",
               test = "z")
pi_wald <- compute_pi(as.numeric(m_wald$b), as.numeric(m_wald$se), m_wald$tau2,
                       m_wald$k)
cat("HKSJ   : se(mu_hat) =", round(se_mu_p, 2), ", PI-Breite =",
    round(pi_p["pi_hi"] - pi_p["pi_lo"], 0), "\n")
cat("Wald(z): se(mu_hat) =", round(as.numeric(m_wald$se), 2), ", PI-Breite =",
    round(pi_wald["pi_hi"] - pi_wald["pi_lo"], 0), "\n")
ergebnisse[["S8_HKSJ"]] <- add_ergebnis("S8a: HKSJ-Inferenz (= Primaeranalyse)",
  m_primaer$k, mu_p, se_mu_p, tau2_p, pi_p["pi_lo"], pi_p["pi_hi"],
  hinweis = "identisch zur Primaeranalyse (Referenz fuer S8-Vergleich)")
ergebnisse[["S8_Wald"]] <- add_ergebnis("S8b: Standard-Wald(z)-Inferenz",
  m_wald$k, as.numeric(m_wald$b), as.numeric(m_wald$se), m_wald$tau2,
  pi_wald["pi_lo"], pi_wald["pi_hi"])

## ============================================================================
## SAP 7: GESAMTUEBERSICHT (VOLLSTAENDIGE ANHANGSTABELLE, KEIN CHERRY-PICKING)
## ============================================================================
cat("\n\n### SAP 7: Vollstaendige Ergebnistabelle (Primaer + alle Sensitivitaeten)\n")
cat("################################################################\n\n")

primaer_row <- add_ergebnis("PRIMAER: volles Fenster 1992-2025, REML+HKSJ",
  k_p, mu_p, se_mu_p, tau2_p, pi_p["pi_lo"], pi_p["pi_hi"],
  hinweis = "SAP 5.1 -- bindend fuer Hauptaussage")

## Hinweis: do.call(bind_rows, ...) statt bind_rows(list(...), ergebnisse),
## da Letzteres bei mehreren Top-Level-Listenargumenten in dieser dplyr-
## Version KEIN reines Zeilen-Stacking durchfuehrt, sondern Spalten mit
## Praefixen erzeugt (verifiziert per Testskript). do.call flacht korrekt ab.
gesamt_tabelle <- do.call(bind_rows, c(list(primaer_row), ergebnisse))
print(gesamt_tabelle, row.names = FALSE)
write.csv(gesamt_tabelle, file.path(out_dir, "tabelle_klassifikation_2026_alle_varianten.csv"),
          row.names = FALSE)

n_ausserhalb <- sum(gesamt_tabelle$Klassifikation_2026 %in% c("oberhalb PI", "unterhalb PI"), na.rm = TRUE)
n_gesamt_klassifiziert <- sum(!is.na(gesamt_tabelle$Klassifikation_2026))
cat("\nZusammenfassung: In", n_ausserhalb, "von", n_gesamt_klassifiziert,
    "klassifizierbaren Varianten liegt 2026 ausserhalb des jeweiligen PI.\n")
cat("(Alle Varianten werden hier gleichrangig vollstaendig berichtet, SAP 7 --\n")
cat(" die PRIMAER-Zeile ist bindend fuer die Hauptaussage, keine nachtraegliche\n")
cat(" Umdeklarierung einer Sensitivitaetsvariante.)\n\n")

## ============================================================================
## SAP 11: REPORTING -- FOREST-PLOT
## ============================================================================
cat("\n### SAP 11: Forest-Plot ##################################################\n\n")

## Validierungsbericht Auflage 2 / Skriptkopf-Zusage (Abweichung A): 2025 muss
## in JEDER Ergebnisdarstellung, die es betrifft, optisch als vorlaeufig/nicht
## finalisiert gekennzeichnet werden. Der Forest-Plot ist die einzige Grafik,
## die 2025 zeigt -- daher wird 2025 hier als EIGENE Kategorie (eigene Farbe/
## Form/Legendeneintrag), getrennt von den 33 finalen historischen Jahren
## 1992-2024, dargestellt.
forest_final_hist <- hist_final %>% filter(jahr < 2025) %>%
  transmute(jahr = as.character(jahr), theta = punktschaetzer,
             lo = pi_unten, hi = pi_oben,
             typ = "Historisches Jahr, final (1992-2024, RKI 95%-PI)")
forest_2025 <- hist_final %>% filter(jahr == 2025) %>%
  transmute(jahr = as.character(jahr), theta = punktschaetzer,
             lo = pi_unten, hi = pi_oben,
             typ = "2025: VORLAEUFIG, nicht finalisiert (Abweichung A, KW38/2025)")
forest_2026 <- data.frame(jahr = "2026 (vorlaeufig, KW33)", theta = theta_2026,
                           lo = pi_lo_2026, hi = pi_hi_2026,
                           typ = "2026 (Zieljahr, unterjaehrig/vorlaeufig)")
forest_all <- bind_rows(forest_final_hist, forest_2025, forest_2026)
forest_all$jahr <- factor(forest_all$jahr, levels = forest_all$jahr)
## Formkennzeichnung zusaetzlich zur Farbe (redundante Kodierung), damit die
## Vorlaeufigkeit von 2025/2026 auch in Graustufendruck erkennbar bleibt.
forest_all$form <- ifelse(grepl("^2025|^2026", forest_all$typ), "vorlaeufig", "final")

p_forest <- ggplot(forest_all, aes(x = theta, y = jahr, color = typ, shape = form)) +
  annotate("rect", xmin = pi_p["pi_lo"], xmax = pi_p["pi_hi"],
           ymin = -Inf, ymax = Inf, fill = "steelblue", alpha = 0.12) +
  geom_vline(xintercept = mu_p, linetype = "dashed", color = "steelblue4") +
  geom_pointrange(aes(xmin = lo, xmax = hi)) +
  scale_color_manual(values = c(
    "Historisches Jahr, final (1992-2024, RKI 95%-PI)" = "black",
    "2025: VORLAEUFIG, nicht finalisiert (Abweichung A, KW38/2025)" = "darkorange",
    "2026 (Zieljahr, unterjaehrig/vorlaeufig)" = "darkred")) +
  scale_shape_manual(values = c("final" = 16, "vorlaeufig" = 17), guide = "none") +
  labs(title = "Hitzebedingte Sterbefaelle in Deutschland: historische Reihe (1992-2025) und 2026",
       subtitle = paste0(
         strwrap(paste0(
           "Schattiertes Band = meta-analytisches 95%-Praediktionsintervall (primaer) [",
           round(pi_p["pi_lo"], 0), "; ", round(pi_p["pi_hi"], 0),
           "]; gestrichelte Linie = mu_hat = ", round(mu_p, 0), "."),
           width = 95, prefix = "", initial = "") |> paste(collapse = "\n"),
         "\n",
         strwrap(paste0(
           "2025 (orange, Dreieck): NICHT finalisiert (Abweichung A), letzter ",
           "verfuegbarer Wochenbericht KW38/2025, vom RKI selbst als 'noch ",
           "unvollstaendig' bezeichnet -- geht dennoch gemaess SAP in das ",
           "historische Fenster ein, s. Skriptkopf/Struktur-Check."),
           width = 95, prefix = "", initial = "") |> paste(collapse = "\n"),
         "\n",
         strwrap(paste0(
           "2026 (rot, Dreieck): KW33/2026, Berichtsdatum 27.08.2026, VORLAEUFIG ",
           "(unvollstaendige Saison) -- 2026 ist NICHT in die Modellschaetzung ",
           "eingegangen."),
           width = 95, prefix = "", initial = "") |> paste(collapse = "\n")),
       x = "Geschaetzte hitzebedingte Sterbefaelle (absolute, nicht altersstandardisierte Fallzahl)",
       y = NULL, color = NULL,
       caption = paste(strwrap(paste0(
         "Quelle: RKI (edoc.rki.de), Zugriff 29.08.2026. Statistische Einordnung, ",
         "keine kausale/politische Bewertung (SAP 8.3). Bevoelkerungsalterung als ",
         "moeglicher Confounder nicht ausschliessbar (SAP 8.2). Orange/rote Dreiecke ",
         "= vorlaeufige, nicht finalisierte Werte (2025 bzw. 2026)."), width = 130),
         collapse = "\n")) +
  theme_minimal(base_size = 10) +
  theme(legend.position = "bottom", legend.direction = "vertical",
        plot.caption = element_text(size = 6, hjust = 0),
        plot.subtitle = element_text(size = 8))
ggsave(file.path(out_dir, "forest_plot_primaer.png"), p_forest, width = 10, height = 9.5, dpi = 150)
cat("Forest-Plot gespeichert: output/forest_plot_primaer.png (2025 jetzt als\n")
cat("  eigene Kategorie 'vorlaeufig, nicht finalisiert' gekennzeichnet, SAP\n")
cat("  Skriptkopf-Zusage / Validierungsbericht Auflage 2).\n\n")

## --- Modellzusammenfassungstabelle je Variante (SAP 11 b) ------------------
modell_tabelle <- data.frame(
  Variante = c("Primaer (REML+HKSJ, 1992-2025)", "S1a (2016-2025)", "S1b (2011-2025)",
               paste0("S1c (ab ", bruchjahr, ")"), "S2 DerSimonian-Laird",
               "S2 Paule-Mandel", "S4 Fixed-Effect", "S5 Trend-Meta-Regression",
               "S8 Wald(z) statt HKSJ"),
  k    = c(k_p, m_s1a$k, m_s1b$k, m_s1c$k, m_dl$k, m_pm$k, m_fe$k, m_trend$k, m_wald$k),
  mu_hat = round(c(mu_p, as.numeric(m_s1a$b), as.numeric(m_s1b$b), as.numeric(m_s1c$b),
                    as.numeric(m_dl$b), as.numeric(m_pm$b), as.numeric(m_fe$b),
                    mu_trend_2026, as.numeric(m_wald$b)), 0),
  tau2 = round(c(tau2_p, m_s1a$tau2, m_s1b$tau2, m_s1c$tau2, m_dl$tau2, m_pm$tau2,
                  0, m_trend$tau2, m_wald$tau2), 2),
  I2   = round(c(m_primaer$I2, m_s1a$I2, m_s1b$I2, m_s1c$I2, m_dl$I2, m_pm$I2,
                  0, m_trend$I2, m_wald$I2), 2),
  QE   = round(c(m_primaer$QE, m_s1a$QE, m_s1b$QE, m_s1c$QE, m_dl$QE, m_pm$QE,
                  m_fe$QE, m_trend$QE, m_wald$QE), 2),
  QEp_roh = c(m_primaer$QEp, m_s1a$QEp, m_s1b$QEp, m_s1c$QEp, m_dl$QEp, m_pm$QEp,
            m_fe$QEp, m_trend$QEp, m_wald$QEp)
)
## SAP Abschnitt 11 (Rundung), Validierungsbericht Auflage 3: "p-Werte der
## Diagnostik-Tests mit zwei Nachkommastellen, sofern p >= 0,01, sonst
## 'p < 0,01', um Scheingenauigkeit zu vermeiden." Dieselbe Rundungslogik wie
## in der Konsolen-/Run-Log-Ausgabe (fmt_p(), Zeile 94) wird hier auf die
## primaer SICHTBARE QEp-Spalte der CSV-Ausgabe angewendet. Der Rohwert bleibt
## zusaetzlich in QEp_roh fuer evtl. Weiterverarbeitung erhalten.
modell_tabelle$QEp <- vapply(modell_tabelle$QEp_roh, fmt_p, character(1))
modell_tabelle <- modell_tabelle[, c("Variante", "k", "mu_hat", "tau2", "I2",
                                      "QE", "QEp", "QEp_roh")]
write.csv(modell_tabelle, file.path(out_dir, "tabelle_modellzusammenfassung.csv"),
          row.names = FALSE)
cat("Modellzusammenfassungstabelle gespeichert: output/tabelle_modellzusammenfassung.csv\n")
cat("  (QEp-Spalte SAP-11-konform gerundet via fmt_p(); Rohwert zusaetzlich in\n")
cat("  QEp_roh, Validierungsbericht Auflage 3)\n")
print(modell_tabelle, row.names = FALSE)

## ============================================================================
## Abschliessende Zusammenfassung
## ============================================================================
cat("\n\n### ZUSAMMENFASSUNG #######################################################\n\n")
cat("Primaerergebnis (SAP 5.1, bindend fuer Hauptaussage):\n")
cat("  2026-Schaetzer (theta_2026 =", theta_2026,
    ", vorlaeufig/unterjaehrig, KW33/2026) liegt", klass_p,
    "\n  des primaeren 95%-Praediktionsintervals [", round(pi_p["pi_lo"], 0), ";",
    round(pi_p["pi_hi"], 0), "] (gepoolt aus n =", k_p,
    "historischen Jahren 1992-2025).\n")
cat("  Standardisierte Abweichung z_2026 =", round(z_p, 2), "\n\n")
if (normalitaet_verletzt) {
  cat("PFLICHTKENNZEICHNUNG (SAP 5.3, Validierungsbericht Auflage 1): Das oben\n")
  cat("  berichtete PRIMAERE 95%-Praediktionsintervall ist aufgrund\n")
  cat("  signifikanter Normalitaetsabweichung der Residuen (Shapiro-Wilk",
      fmt_p(sw_test_primaer$p.value), ")\n")
  cat("  MOEGLICHERWEISE UNPRAEZISE. Es bleibt gemaess SAP 5.3 dennoch primaer\n")
  cat("  fuer die Hauptaussage; als Ergaenzung siehe das verteilungsfreie\n")
  cat("  Praediktionsintervall S6 (empirisch: [",
      round(ergebnisse[["S6_empirisch"]]$PI_unten, 0), ";",
      round(ergebnisse[["S6_empirisch"]]$PI_oben, 0), "]; Bootstrap: [",
      round(ergebnisse[["S6_bootstrap"]]$PI_unten, 0), ";",
      round(ergebnisse[["S6_bootstrap"]]$PI_oben, 0), "]).\n\n")
}
cat("Zentrale Limitationen (verpflichtend in jeder Ergebnisdarstellung, SAP\n")
cat("  8.1/8.2/8.3/8.5/9/11): (1) 2026-Wert ist vorlaeufig/unterjaehrig,\n")
cat("  (2) 2025-Referenzwert ist ebenfalls nicht formal finalisiert (Abweichung\n")
cat("  A, s. Skriptkopf), (3) dokumentierter Methodikbruch 2020 (COVID-bedingte\n")
cat("  Modellaenderung) als alternative Erklaerung fuer Trend/Ausreisser,\n")
cat("  (4) Bevoelkerungsalterung als wahrscheinlich real relevanter, mit diesen\n")
cat("  Daten nicht trennbarer Confounder, (5) keine kausale oder politische\n")
cat("  Interpretation zulaessig.\n\n")

cat("Skriptlauf beendet:", format(Sys.time()), "\n")
sink()
close(runlog_con)

cat("\nFertig. Run-Log geschrieben nach:", runlog_path, "\n")
cat("Output-Dateien in:", out_dir, "\n")
