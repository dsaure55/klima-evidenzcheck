#-------------------------------------------------------------------------------
# Titel:   Expertenrat-Budgetabgleich 2021-2030 und H1-2026-Konsistenz
# SAP:     Analysen/2026-08-expertenrat-budgetabgleich/
#          SAP_Expertenrat-Budgetabgleich-2030.md, Version 1.1
#          (Status im Header: final, eingefroren 29.08.2026, freigegeben durch
#          Daniel Saure; Commit d9215cb)
# Analyst: analyst-Subagent, Ausfuehrung 2026-10-23
# R:       siehe output/sessionInfo.txt (R 4.6.1)
#-------------------------------------------------------------------------------
#
# ===== ABWEICHUNGEN / RUECKFRAGEN AN DEN MENSCHEN (Kurzfassung) ==============
# Ausfuehrlich: Abweichungsprotokoll_expertenrat-budgetabgleich.md
# Kennzeichnung: "Abweichung vom SAP - Rueckfrage an Mensch" (RF) bzw. "Post-hoc".
#
# RF-1  SAP intern widerspruechlich: Header sagt "final / eingefroren", Abschnitt 0
#       sagt weiterhin "Status: draft", "Offene Punkte" Nr. 6 steht als "NOCH
#       OFFEN". Git-Historie (Commit d9215cb) belegt Einfrieren; ich habe nach dem
#       Header (final) gearbeitet. Tabellenzeile 5 (Bundesregierung) wurde wie im
#       SAP-Text stehend umgesetzt. Bitte bestaetigen.
# RF-2  SAP-Hintergrund (Abschn. 1/4a) nimmt an, "625 Mt" sei ein Wert fuer die
#       2025-Gesamtemissionen. Laut Primaerquelle (Agora, 28.08.2026) ist 625 Mt die
#       gesetzliche Emissionshoechstgrenze (KSG) fuer das JAHR 2026. Es gibt damit
#       keinen alternativen 2025-Emissionswert; die SAP-Entscheidungsregel 4a.2
#       ("alternativer 2025-Wert") greift inhaltlich ins Leere. Um keine im SAP
#       vorgeschriebene Sensitivitaet auszulassen (Regel 2), wird Estimand 2
#       FORMAL trotzdem mit 2025 = 625 Mt als Sensitivitaets-Variante gerechnet
#       und als "inhaltlich nicht belastbar (Zahl ist kein 2025-Emissionswert)"
#       gekennzeichnet. Bitte entscheiden, ob diese Variante im Bericht bleibt.
# RF-3  SAP 5.4 Verfahren 1 (Varianz aus Kovarianz der Koeffizienten) und
#       Verfahren 2 (residualbasierter MBB) liefern Intervalle fuer die
#       ERWARTUNGSWERT-Summe (nur Parameterunsicherheit), NICHT fuer die
#       tatsaechliche Summe (die zukuenftige Residuen enthielte). Das ARIMA-
#       Verfahren (Verfahren 3) enthaelt dagegen die Prognoseunsicherheit.
#       Die drei Intervalle sind daher nicht gleichartig. Umgesetzt exakt wie im
#       SAP; Hinweis im Bericht. Keine zusaetzliche Prognoseintervall-Variante.
# RF-4  SAP legt Blocklaenge des MBB nicht fest. Uebernommen: block_len = 2
#       (wie SAP-Amendment v1.1 THG-Laendervergleich), Seed 20260827 (dort
#       verwendeter Seed), B = 2000.
# RF-5  Estimand 1: Agora nennt "327 Mt" und "rund 7 Mt bzw. zwei Prozent weniger".
#       Rate_H1 wird gemaess SAP-Formel aus den Absolutwerten gebildet:
#       H1_2025 = 327 + 7 = 334 (aus gerundeten Angaben abgeleitet), Rate =
#       -7/334. POST-HOC (nicht im SAP): Zusatzvariante mit der von Agora
#       genannten gerundeten Rate -2,0 % zur Beurteilung der Rundungsempfindlichkeit.
# RF-6  SAP 8c/2: "numerisch naeher an Bundesregierung oder Expertenrat" ist nicht
#       operationalisiert. Ergaenzt (Post-hoc-Operationalisierung): Distanz zum
#       Expertenrat = 0 wenn Overshoot im Korridor 60-100, sonst Abstand zum
#       naechsten Korridorrand; Distanz zur Bundesregierung = |Overshoot - (-4,5)|.
# RF-7  Quelle 5 (Bundesregierung/UBA Projektionsdaten 2026, 4,5 Mt Puffer) wurde
#       NICHT beim UBA-Datacube direkt abgerufen, sondern ist als Zitat im
#       Pruefbericht des Expertenrats (Primaerquelle Quelle 4) belegt. Quelle 3
#       (FAZ) konnte nicht abgerufen werden (Paywall/dynamische Seite); die
#       zitierten Zahlen wurden stattdessen in den Primaerquellen Agora (Quelle 2)
#       und Expertenrat (Quelle 4) direkt gefunden.
# RF-8  Quelle 1: SAP verweist auf Zugriff 27.08.2026. Die Reihe wurde am
#       23.10.2026 erneut bei klimadashboard.de (HTML-Seite und Open-Data-API)
#       abgerufen und gegen die 36 Werte im alten Skript abgeglichen (Schritt 0).
# RF-9  Fenster C (n = 6): Gemaess SAP rein deskriptiv. Intervalle fuer C werden
#       zur Vollstaendigkeit der festen Tabellenstruktur (SAP 7/11) berechnet, sind
#       aber ausdruecklich NICHT inferenziell zu lesen; keine HAC-Korrektur fuer C.
# RF-10 SAP-Dateiname in Abschn. 10 lautet "Expertenrat-Budgetabgleich-2030.R";
#       auftragsgemaess (Aufruf) heisst das Skript expertenrat-budgetabgleich.R.
# RF-11 Estimand 1, Sensitivitaet "saisonal gewichtete Jahreshochrechnung" (SAP 2,
#       6.4): Voraussetzung (>= 5 vollstaendige H1/H2-Paare einer oeffentlichen
#       Agora-/UBA-Reihe) nicht erfuellt (siehe Schritt 0, Suchprotokoll). Sie
#       entfaellt ersatzlos, wie vom SAP fuer diesen Fall vorgeschrieben.
# =============================================================================
#
# ===== DATENQUELLEN (SAP 3), Zugriff 23.10.2026 =============================
# Q1 UBA via klimadashboard.de (CC BY 4.0). Dateien rohdaten/klimadashboard/:
#    kd_emissionen.html (Seite https://klimadashboard.de/emissionen, Tabelle der
#    KSG-Sektoren 1990-2025, Spalte "total") und kd_api_emissions_DE.csv
#    (Open-Data-API api.klimadashboard.org/v0/data/emissions_data, Quelle
#    "Umweltbundesamt Deutschland", Spalte update = 2026-03-14, Gas == "THG",
#    Summe der CRF-Kategorien). Vintage: UBA-Emissionsdaten 2025 vom 14.03.2026
#    (Berechnung der Emissionsdaten 2025, nach Expertenrat "vorlaeufig" im Sinne
#    der Nachberechnung durch das Inventar 2027). Systemgrenze: produktionsbasiert/
#    territorial, Gesamt-THG (CO2-Aeq., alle KSG-Sektoren), OHNE LULUCF.
# Q2 Agora Energiewende, "Halbjahresbilanz 2026" (Seite und Pressemitteilung
#    "Deutschland droht 2026 erstmals sein Klimaziel zu verfehlen", 28.08.2026).
#    Dateien rohdaten/agora/. Erste Schaetzung auf Basis vorlaeufiger Daten;
#    Agora weist selbst auf Unsicherheit (Heizoel-Lagermodell) hin, der
#    Rueckgang koenne geringer ausfallen. Systemgrenze: nicht ausdruecklich
#    benannt; aus dem Vergleich mit der KSG-Hoechstgrenze 2026 (625) und dem
#    2025-Wert (635 + 13 = 648) als Gesamt-THG ohne LULUCF abgeleitet.
# Q3 FAZ-Artikel: nicht abrufbar (rohdaten/suchprotokoll/faz/). Nur Fundstelle.
# Q4 Expertenrat fuer Klimafragen, "Pruefbericht zur Berechnung der deutschen
#    Treibhausgasemissionen fuer das Jahr 2025 und zu den Projektionsdaten 2026",
#    veroeffentlicht 18.05.2026 (PDF + Pressemitteilung), rohdaten/expertenrat/.
#    Fundstelle: https://expertenrat-klima.de/publikationen/pruefbericht-zur-
#    berechnung-der-deutschen-treibhausgasemissionen-fuer-das-jahr-2025-und-zu-
#    den-projektionsdaten-2026 . Systemgrenze: Summe der Jahresemissionsgesamt-
#    mengen aller Sektoren OHNE LULUCF (KSG Anlage 2), territorial.
# Q5 Bundesregierung/UBA Projektionsdaten 2026 (vorgelegt 14.03.2026, Datenstand
#    UBA 2026q: 07.05.2026 laut Literaturverzeichnis des Pruefberichts): Puffer
#    4,5 Mt (Summe 6194 vs. Budget 6199), Mit-Massnahmen-Szenario, ohne LULUCF.
#    Quelle hier sekundaer ueber Q4 (siehe RF-7).
# =============================================================================

# ---- Umgebung ----------------------------------------------------------------
args_all <- commandArgs(FALSE)
f_arg <- sub("^--file=", "", args_all[grep("^--file=", args_all)])
BASE <- if (length(f_arg) == 1) normalizePath(dirname(f_arg), winslash = "/") else normalizePath(getwd(), winslash = "/")
ROH  <- file.path(BASE, "rohdaten")
OUT  <- file.path(BASE, "output")
dir.create(OUT, showWarnings = FALSE)

suppressPackageStartupMessages({
  library(sandwich)
  library(lmtest)
  library(forecast)
  library(ggplot2)
  library(digest)
})

cat("=== Expertenrat-Budgetabgleich 2030 - Lauf", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "===\n")
cat("R:", R.version.string, "\n")

stop_analyse <- function(grund) {
  txt <- c("# STOPP - Analyse abgebrochen",
           "", paste("Zeitpunkt:", format(Sys.time(), "%Y-%m-%d %H:%M:%S")),
           "", "Grund:", "", grund,
           "", "Es wurde nicht weitergerechnet (SAP 4a Schritt 4).")
  writeLines(txt, file.path(BASE, "STOPP.md"))
  stop(paste("STOPP:", grund), call. = FALSE)
}

# Hilfsfunktionen -------------------------------------------------------------
lies_text <- function(pfad) {
  x <- readLines(pfad, warn = FALSE, encoding = "UTF-8")
  x <- paste(x, collapse = " ")
  x <- gsub("[   ]", " ", x, perl = TRUE)
  gsub("[[:space:]]+", " ", x, perl = TRUE)
}
html_zu_text <- function(pfad) {
  x <- paste(readLines(pfad, warn = FALSE, encoding = "UTF-8"), collapse = "\n")
  x <- gsub("(?s)<script.*?</script>", " ", x, perl = TRUE)
  x <- gsub("(?s)<style.*?</style>", " ", x, perl = TRUE)
  x <- gsub("<[^>]+>", " ", x, perl = TRUE)
  x <- gsub("&nbsp;", " ", x, fixed = TRUE)
  x <- gsub("[   ]", " ", x, perl = TRUE)
  gsub("[[:space:]]+", " ", x, perl = TRUE)
}
hole <- function(text, muster, gruppe = 1, quelle = "") {
  m <- regmatches(text, regexec(muster, text, perl = TRUE))[[1]]
  if (length(m) < gruppe + 1) stop_analyse(sprintf("Erwartete Fundstelle nicht gefunden (%s): %s", quelle, muster))
  m[gruppe + 1]
}
de_num <- function(s) as.numeric(gsub(",", ".", gsub("[. ]", "", sub(",", "#", s, fixed = TRUE), perl = TRUE), fixed = TRUE))
de_num2 <- function(s) { s <- gsub(" ", "", s); s <- gsub("\\.", "", s); as.numeric(sub(",", ".", s)) }

#===============================================================================
# SCHRITT 0 / SAP 3 + 4a: Datenbeschaffung, Pruefsummen, Datenabgleich
# (MUSS vor jeder Modellierung abgeschlossen sein)
#===============================================================================

# ---- SAP 3: Pruefsummen aller Rohdateien ------------------------------------
cat("\n--- SAP 3: SHA-256-Pruefsummen der Rohdaten ---\n")
roh_dateien <- list.files(ROH, recursive = TRUE, full.names = TRUE)
roh_dateien <- roh_dateien[!grepl("SHA256SUMS", roh_dateien)]
pruefsummen <- data.frame(
  sha256 = vapply(roh_dateien, function(p) digest(p, algo = "sha256", file = TRUE), character(1)),
  datei  = sub(paste0(ROH, "/"), "", roh_dateien, fixed = TRUE),
  stringsAsFactors = FALSE)
writeLines(paste(pruefsummen$sha256, pruefsummen$datei), file.path(ROH, "SHA256SUMS.txt"))
print(pruefsummen[, c("datei", "sha256")], row.names = FALSE)

# ---- SAP 4: Basiszeitreihe aus dem archivierten Skript (36 Werte) ------------
alt_zeilen <- readLines(file.path(BASE, "..", "2026-08-emissionen", "DE-Emissionen-Trendprojektion-2040.R"), warn = FALSE)
alt_block  <- paste(alt_zeilen[16:20], collapse = " ")
alt_werte  <- as.numeric(strsplit(gsub("[^0-9.,]", "", gsub("emissionen <- c\\(", "", alt_block)), ",")[[1]])
alt_werte  <- alt_werte[!is.na(alt_werte)]
if (length(alt_werte) != 36) stop_analyse(sprintf("Altes Skript: %d statt 36 Werte gelesen.", length(alt_werte)))
jahr <- 1990:2025
emissionen <- alt_werte                          # Modellinput gemaess SAP 4 (identisch zur publizierten Analyse)
df <- data.frame(jahr = jahr, emissionen = emissionen)

# ---- SAP 4a/3 Q1: Identitaetsnachweis gegen klimadashboard.de (HTML-Seite) ---
kd_html <- paste(readLines(file.path(ROH, "klimadashboard", "kd_emissionen.html"), warn = FALSE, encoding = "UTF-8"), collapse = "\n")
kd_m <- regmatches(kd_html, gregexpr('\\{year:"[0-9]{4}",energy:"[^}]*?total:"[0-9.,]+"\\}', kd_html, perl = TRUE))[[1]]
kd_jahr <- as.integer(sub('.*year:"([0-9]+)".*', "\\1", kd_m))
kd_tot  <- de_num2(sub('.*total:"([0-9.,]+)".*', "\\1", kd_m))
sel <- kd_jahr %in% 1990:2025 & !duplicated(kd_jahr)   # Deutschland-Tabelle: Jahre 1990-2025 (2. Block 1750-1799 = andere Tabelle)
kd_df <- data.frame(jahr = kd_jahr[sel], kd_html = kd_tot[sel])
kd_df <- kd_df[order(kd_df$jahr), ]

# Unabhaengiger Nachweis ueber die Open-Data-API (Summe der THG-Zeilen aller CRF-Kategorien)
api <- read.csv(file.path(ROH, "klimadashboard", "kd_api_emissions_DE.csv"), stringsAsFactors = FALSE)
api_uba <- api[api$source == "Umweltbundesamt Deutschland" & api$gas == "THG", ]
api_sum <- tapply(api_uba$value, api_uba$year, sum) / 1e6
api_df  <- data.frame(jahr = as.integer(names(api_sum)), kd_api = as.numeric(api_sum))
api_update <- unique(api_uba$update)

abgleich <- Reduce(function(a, b) merge(a, b, by = "jahr"), list(df, kd_df, api_df))
names(abgleich)[2] <- "altes_skript"
abgleich$diff_html <- abgleich$kd_html - abgleich$altes_skript
abgleich$diff_api  <- abgleich$kd_api  - abgleich$altes_skript
cat("\n--- SAP 4a/Q1: Identitaetsnachweis der UBA-Basiszeitreihe 1990-2025 ---\n")
cat(sprintf("Anzahl Jahre abgeglichen: %d\n", nrow(abgleich)))
cat(sprintf("Max |HTML-Seite - altes Skript|: %.4f Mt\n", max(abs(abgleich$diff_html))))
cat(sprintf("Max |API (Summe CRF-Kategorien) - altes Skript|: %.4f Mt (API-Werte auf 3 Nachkommastellen)\n", max(abs(abgleich$diff_api))))
cat(sprintf("API: Feld 'update' der UBA-Zeilen: %s\n", paste(api_update, collapse = ", ")))
write.csv(abgleich, file.path(OUT, "datenabgleich_basiszeitreihe.csv"), row.names = FALSE)
if (nrow(abgleich) != 36 || max(abs(abgleich$diff_html)) > 0.0051 || max(abs(abgleich$diff_api)) > 0.0051) {
  stop_analyse("Basiszeitreihe 1990-2025 ist NICHT identisch zur Reihe der publizierten 2040-Analyse (Abweichung > Rundung). Siehe output/datenabgleich_basiszeitreihe.csv.")
}
cat("ERGEBNIS: Reihe identisch (alle 36 Jahre, Abweichung <= Rundung auf 0,01 Mt) -> weiter.\n")

# ---- SAP 3 Q4: Expertenrat-Primaerquelle (Pruefbericht 18.05.2026) -----------
erk <- lies_text(file.path(ROH, "expertenrat", "bericht.txt"))
erk_pm <- lies_text(file.path(ROH, "expertenrat", "pm.txt"))
budget_2021_2030 <- de_num2(hole(erk, "Zeitraum von 2021 bis 2030 in H.he von ([0-9 ]+) Mt CO2", 1, "ERK Bericht"))
proj_summe       <- de_num2(hole(erk, "Zeitraum bei ([0-9 ]+) Mt CO2-.q\\. liegen", 1, "ERK Bericht"))
puffer_breg      <- de_num2(hole(erk, "Puffer in H.he von ([0-9,]+) Mt CO2-.q\\. \\(0,07 %\\)", 1, "ERK Bericht"))
erk_korr_lo      <- as.numeric(hole(erk, "etwa ([0-9]+) bis ([0-9]+) Mt CO2-.q\\. \\(1,0-1,6 %\\)", 1, "ERK Bericht"))
erk_korr_hi      <- as.numeric(hole(erk, "etwa ([0-9]+) bis ([0-9]+) Mt CO2-.q\\. \\(1,0-1,6 %\\)", 2, "ERK Bericht"))
erk_2025         <- de_num2(hole(erk, "Jahr 2025 ([0-9,]+) Mt CO2-.q\\. ohne Landnutzung", 1, "ERK Bericht"))
erk_pm_ok        <- grepl("60 bis 100 Mt", erk_pm) && grepl("4,5 Mt", erk_pm)
cat("\n--- SAP 3 Q4/Q5: Werte aus dem Expertenrat-Pruefbericht (18.05.2026) ---\n")
cat(sprintf("Gesamtbudget 2021-2030 (Summe Jahresemissionsgesamtmengen, ohne LULUCF, Anlage 2 KSG): %s Mt CO2-Aeq.\n", format(budget_2021_2030)))
cat(sprintf("Summe THG 2021-2030 lt. Projektionsdaten 2026 (Q5): %s Mt; Puffer (Q5): %.1f Mt\n", format(proj_summe), puffer_breg))
cat(sprintf("Einschaetzung Expertenrat: Ueberschreitung %g-%g Mt (50/50-Emissionspfad)\n", erk_korr_lo, erk_korr_hi))
cat(sprintf("UBA-Emissionen 2025 lt. Expertenrat (ohne LULUCF): %.1f Mt; Pressemitteilung bestaetigt 60-100/4,5: %s\n", erk_2025, erk_pm_ok))
if (budget_2021_2030 != 6199 || erk_korr_lo != 60 || erk_korr_hi != 100 || abs(puffer_breg - 4.5) > 1e-9) {
  stop_analyse("Werte im Expertenrat-Pruefbericht weichen von den erwarteten Eckwerten ab (6199 / 60-100 / 4,5).")
}
budget <- budget_2021_2030
KORR <- c(lo = erk_korr_lo, hi = erk_korr_hi)
OVERSHOOT_BREG <- -puffer_breg      # Bundesregierung: Unterschreitung um 4,5 Mt = Overshoot -4,5

# ---- SAP 3 Q2: Agora Halbjahresbilanz 2026 -----------------------------------
ag  <- html_zu_text(file.path(ROH, "agora", "halbjahresbilanz_seite.html"))
ag_pm <- html_zu_text(file.path(ROH, "agora", "pm_deutschland-droht.html"))
h1_2026   <- as.numeric(hole(ag, "bis Ende Juni ([0-9]+) Millionen Tonnen", 1, "Agora Seite"))
h1_delta  <- as.numeric(hole(ag, "rund ([0-9]+) Millionen Tonnen CO.{1,6} beziehungsweise (\\w+) Prozent weniger", 1, "Agora Seite"))
h1_prozent_wort <- hole(ag, "rund ([0-9]+) Millionen Tonnen CO.{1,6} beziehungsweise (\\w+) Prozent weniger", 2, "Agora Seite")
ksg_2026  <- as.numeric(hole(ag, "Emissionsh.chstgrenze (?:laut Klimaschutzgesetz )?f.r 2026 (?:auf )?([0-9]+) Millionen Tonnen", 1, "Agora Seite"))
agora_2026_hochr <- as.numeric(hole(ag, "lediglich auf ([0-9]+) Millionen Tonnen", 1, "Agora Seite"))
agora_vs_2025    <- as.numeric(hole(ag, "R.ckgang von ([0-9]+) Millionen Tonnen CO.{1,6} gegen.ber dem Jahr 2025", 1, "Agora Seite"))
pm_datum  <- hole(ag_pm, "Berlin, ([0-9]+\\. \\w+ [0-9]{4})", 1, "Agora PM")
if (h1_prozent_wort != "zwei") stop_analyse("Agora: Prozentangabe nicht 'zwei'.")
h1_prozent_genannt <- -2.0
h1_2025_abgeleitet <- h1_2026 + h1_delta
cat("\n--- SAP 3 Q2: Agora Energiewende, Halbjahresbilanz 2026 (Pressemitteilung vom ", pm_datum, ") ---\n", sep = "")
cat(sprintf("H1 2026: %g Mt CO2-Aeq.; Rueckgang ggue. Vorjahreszeitraum: %g Mt (%s Prozent)\n", h1_2026, h1_delta, h1_prozent_wort))
cat(sprintf("abgeleiteter H1-2025-Wert = %g + %g = %g Mt (aus gerundeten Angaben)\n", h1_2026, h1_delta, h1_2025_abgeleitet))
cat(sprintf("KSG-Hoechstgrenze 2026 lt. Agora: %g Mt; Agora-Hochrechnung 2026: %g Mt (= %g Mt weniger als 2025)\n",
            ksg_2026, agora_2026_hochr, agora_vs_2025))
cat(sprintf("Implizierter 2025-Wert bei Agora: %g + %g = %g Mt\n", agora_2026_hochr, agora_vs_2025, agora_2026_hochr + agora_vs_2025))

# ---- SAP 4a Punkt 1: Diskrepanz 625 vs 648,83 -------------------------------
cat("\n--- SAP 4a.1: Diskrepanz '625 Mt' vs. '648,83 Mt' ---\n")
cat(sprintf("648,83 Mt = UBA-Gesamtemissionen 2025 (klimadashboard.de, UBA-Stand 14.03.2026); Expertenrat nennt fuer UBA 2025: %.1f Mt (Differenz %.2f Mt = Rundung/Nachkomma).\n", erk_2025, erk_2025 - 648.83))
cat(sprintf("625 Mt = gesetzliche Emissionshoechstgrenze (KSG) fuer das JAHR 2026 lt. Agora (%g Mt) - KEIN Emissionswert fuer 2025.\n", ksg_2026))
cat("BEFUND: Die Diskrepanz beruht auf unterschiedlichen GROESSEN (Ist 2025 vs. Zielwert 2026), nicht auf unterschiedlichen UBA-Erhebungsstaenden\n")
cat("        und nicht auf unterschiedlichen Systemgrenzen. Es existiert kein alternativer 2025-Emissionswert (siehe RF-2).\n")
cat("Entscheidungsregel 4a.2: Estimand 1 -> 648,83 (zwingend). Estimand 2 -> 648,83 primaer;\n")
cat("  FORMALE Sensitivitaets-Variante mit 2025 = 625 wird gerechnet (SAP 6.3 will beide Werte nebeneinander), aber als nicht belastbar gekennzeichnet.\n")
ALT_2025 <- ksg_2026

# ---- SAP 4a Punkt 3: Systemgrenzen-Check -------------------------------------
sg <- data.frame(
  Quelle = c("Q1 UBA/klimadashboard", "Q2 Agora", "Q4 Expertenrat", "Q5 Projektionsdaten 2026"),
  Gas_Sektor = c("Gesamt-THG CO2-Aeq., KSG-Sektoren (Energie, Industrie, Verkehr, Gebaeude, Landwirtschaft, F-Gase, Abfall)",
                 "Gesamt-THG, Sektoren nicht einzeln definiert; Bezug KSG-Hoechstgrenze",
                 "Gesamt-THG aller Sektoren (Anlage 2 KSG)",
                 "Gesamt-THG aller Sektoren (Mit-Massnahmen-Szenario)"),
  Prinzip = c("produktionsbasiert/territorial (Quellenangabe klimadashboard)", "nicht ausdruecklich genannt; aus KSG-Bezug: territorial",
              "territorial (KSG-Inventar)", "territorial (KSG-Inventar)"),
  LULUCF = c("ohne (Summe der sieben KSG-Sektoren; 1990 = 1252,94 vs. 1253,1 ohne LULUCF im Inventar 2026 lt. ERK)",
             "nicht ausdruecklich genannt; Konsistenz mit ERK-Wert 648,9 (635+13=648) deutet auf ohne LULUCF",
             "ohne LULUCF (ausdruecklich)", "ohne LULUCF (ausdruecklich, ERK Fussnote 26)"),
  stringsAsFactors = FALSE)
cat("\n--- SAP 4a.3: Systemgrenzen-Check ---\n")
print(sg, row.names = FALSE)
cat("ERGEBNIS: Keine Abweichung der Systemgrenzen festgestellt, die einen direkten Zahlenvergleich verzerrt; fuer Agora ist die Systemgrenze nur indirekt belegt (Limitation, SAP 9).\n")
write.csv(sg, file.path(OUT, "systemgrenzen_check.csv"), row.names = FALSE)

# ---- SAP 2/6.4: Historische H1/H2-Reihe (Voraussetzung Sensitivitaet) --------
cat("\n--- SAP 2 (harte Nebenbedingung) / 6.4: Verfuegbarkeit einer H1/H2-Reihe ---\n")
cat("Suche: Agora-Sitemap (1129 URLs, rohdaten/suchprotokoll/agora/), Agora-Pressemitteilungsliste: nur die Halbjahresbilanz 2026\n")
cat("enthaelt eine H1-Gesamt-THG-Schaetzung; keine oeffentliche Reihe mit >= 5 vollstaendigen H1/H2-Paaren gefunden.\n")
cat("-> saisonal gewichtete Jahreshochrechnung entfaellt ersatzlos (kein Ersatz durch Verdopplung). Primaerspezifikation: H1-vs-H1.\n")

# ---- SAP 3 Q3: FAZ ------------------------------------------------------------
cat("\n--- SAP 3 Q3: FAZ-Artikel ---\n")
cat("Abruf versucht (faz.net Suche/Ressort, 23.10.2026): Artikel nicht auffindbar/abrufbar (dynamische Suche, Paywall).\n")
cat("Die im SAP dem FAZ-Artikel zugeschriebenen Zahlen (60-100 Mt, 2 % H1-Rueckgang, 625) wurden direkt in Q2/Q4 gefunden (siehe oben).\n")

cat("\n=== SCHRITT 0 ABGESCHLOSSEN: Datenabgleich bestanden, Modellierung beginnt ===\n")

#===============================================================================
# SAP 5.1.1: Estimand 1 - H1 2026 vs. CAGR aus Modell A und B (keine Neuschaetzung)
#===============================================================================
cat("\n\n############ ESTIMAND 1 ############\n")
fit_fenster <- function(von, bis, d = df) lm(emissionen ~ jahr, data = subset(d, jahr >= von & jahr <= bis))
mA <- fit_fenster(1990, 2025)
mB <- fit_fenster(2015, 2025)
fA <- function(j) as.numeric(predict(mA, data.frame(jahr = j)))
fB <- function(j) as.numeric(predict(mB, data.frame(jahr = j)))
CAGR_A <- (fA(2025) / fA(1990))^(1 / 35) - 1
CAGR_B <- (fB(2025) / fB(2015))^(1 / 10) - 1
cat(sprintf("fit_A(1990) = %.2f, fit_A(2025) = %.2f  -> CAGR_A = %.3f %%\n", fA(1990), fA(2025), 100 * CAGR_A))
cat(sprintf("fit_B(2015) = %.2f, fit_B(2025) = %.2f  -> CAGR_B = %.3f %%\n", fB(2015), fB(2025), 100 * CAGR_B))
# Kontrolle gegen publizierte 2040-Projektion (Kontext, SAP 0): Fenster A = 486, B = 207
cat(sprintf("Kontrolle (Reproduktion der publizierten Projektion 2040): A = %.1f Mt (publ. 486), B = %.1f Mt (publ. 207)\n", fA(2040), fB(2040)))
if (abs(fA(2040) - 486) > 1 || abs(fB(2040) - 207) > 1) {
  cat("WARNUNG: Reproduktion weicht von den im SAP zitierten Werten ab (>1 Mt).\n")
}

klassifiziere_e1 <- function(rate_pp, tol) {
  dA <- abs(rate_pp - 100 * CAGR_A); dB <- abs(rate_pp - 100 * CAGR_B)
  k <- if (dA < dB - tol) "naeher an Fenster A (pessimistischeres Szenario)"
       else if (dB < dA - tol) "naeher an Fenster B (optimistischeres Szenario)"
       else "nicht unterscheidbar, beide Fenster gleich nah"
  list(dA = dA, dB = dB, klasse = k)
}
rate_primaer <- 100 * (h1_2026 - h1_2025_abgeleitet) / h1_2025_abgeleitet     # SAP-Formel, Primaer
rate_variante <- h1_prozent_genannt                                           # POST-HOC: von Agora genannte gerundete Rate
e1 <- do.call(rbind, lapply(list(list(n = "Primaer: aus Absolutwerten (327 / 334)", r = rate_primaer, post = "nein"),
                                 list(n = "POST-HOC: von Agora genannte Rate (-2 %)", r = rate_variante, post = "ja")),
  function(v) do.call(rbind, lapply(c(0.05, 0.10), function(tol) {
    k <- klassifiziere_e1(v$r, tol)
    data.frame(Rate_Variante = v$n, Post_hoc = v$post, Toleranz_pp = tol,
               Rate_H1_pct = v$r, CAGR_A_pct = 100 * CAGR_A, CAGR_B_pct = 100 * CAGR_B,
               d_A_pp = k$dA, d_B_pp = k$dB, Diff_dB_minus_dA_pp = k$dB - k$dA,
               Einordnung = k$klasse, stringsAsFactors = FALSE)
  }))))
cat("\n--- Estimand 1: Ergebnis (SAP 11; Detailwerte auf 3 Nachkommastellen, da Toleranz 0,05 pp) ---\n")
print(transform(e1, Rate_H1_pct = round(Rate_H1_pct, 3), CAGR_A_pct = round(CAGR_A_pct, 3), CAGR_B_pct = round(CAGR_B_pct, 3),
                d_A_pp = round(d_A_pp, 3), d_B_pp = round(d_B_pp, 3), Diff_dB_minus_dA_pp = round(Diff_dB_minus_dA_pp, 3)), row.names = FALSE)
cat("\n--- Estimand 1: Rundung gemaess SAP 11 (eine Nachkommastelle) ---\n")
print(transform(e1[, c("Rate_Variante", "Toleranz_pp", "Rate_H1_pct", "CAGR_A_pct", "CAGR_B_pct", "d_A_pp", "d_B_pp", "Einordnung")],
                Rate_H1_pct = round(Rate_H1_pct, 1), CAGR_A_pct = round(CAGR_A_pct, 1), CAGR_B_pct = round(CAGR_B_pct, 1),
                d_A_pp = round(d_A_pp, 1), d_B_pp = round(d_B_pp, 1)), row.names = FALSE)
robust_prim <- length(unique(e1$Einordnung[e1$Post_hoc == "nein"])) == 1
robust_var  <- length(unique(e1$Einordnung[e1$Post_hoc == "ja"])) == 1
cat(sprintf("\nROBUSTHEIT Toleranzschwelle 0,05 vs 0,1 pp (Primaer-Rate): %s\n", if (robust_prim) "Einordnung stimmt ueberein (robust)" else "Einordnung weicht ab (NICHT robust)"))
cat(sprintf("ROBUSTHEIT Toleranzschwelle (POST-HOC-Rate -2 %%): %s\n", if (robust_var) "Einordnung stimmt ueberein (robust)" else "Einordnung weicht ab (NICHT robust)"))
cat("Hinweis: deskriptiv, n = 1 Beobachtung, kein Signifikanztest, kein p-Wert (SAP 2).\n")
write.csv(e1, file.path(OUT, "estimand1_tabelle.csv"), row.names = FALSE)

# Grafik Estimand 1 (getrennt von Estimand 2, SAP 8b/11)
g1 <- data.frame(Groesse = c("H1 2026 ggue. H1 2025\n(Agora, vorlaeufig)", "Fenster A: CAGR\n(Trend 1990-2025)", "Fenster B: CAGR\n(Trend 2015-2025)"),
                 Wert = c(rate_primaer, 100 * CAGR_A, 100 * CAGR_B))
g1$Groesse <- factor(g1$Groesse, levels = g1$Groesse)
p1 <- ggplot(g1, aes(Groesse, Wert, fill = Groesse)) +
  geom_col(width = 0.55, show.legend = FALSE) +
  geom_text(aes(label = sprintf("%.1f %%", Wert)), vjust = 1.4, color = "white", size = 4) +
  scale_fill_manual(values = c("#e34948", "#2a78d6", "#1baf7a")) +
  labs(title = "Estimand 1: Jaehrliche Veraenderungsrate - H1 2026 und Trendmodelle",
       subtitle = "H1: Agora Energiewende (vorlaeufig). CAGR: gefittete OLS-Werte der publizierten 2040-Analyse (UBA/klimadashboard.de)",
       x = NULL, y = "Veraenderung pro Jahr bzw. ggue. Vorjahreszeitraum (%)") +
  theme_minimal(base_size = 11)
ggsave(file.path(OUT, "estimand1_h1_vs_cagr.png"), p1, width = 7.5, height = 4.5, dpi = 200)

#===============================================================================
# SAP 5.1.2 / 5.2 / 5.3 / 5.4: Estimand 2 - kumulative Trendfortschreibung 2021-2030
#===============================================================================
cat("\n\n############ ESTIMAND 2 ############\n")
cat(sprintf("Budget_Gesamt_2021_2030 (Expertenrat, Primaerquelle): %g Mt; Korridor Expertenrat: %g-%g Mt; Bundesregierung: Overshoot %.1f Mt\n",
            budget, KORR["lo"], KORR["hi"], OVERSHOOT_BREG))

FENSTER <- list(A = c(1990, 2025), B = c(2015, 2025), C = c(2020, 2025))
PROJ_JAHRE <- 2026:2030
R_BOOT <- 2000; BLOCK_LEN <- 2
set.seed(20260827)

ist_21_25_von <- function(d) sum(d$emissionen[d$jahr >= 2021 & d$jahr <= 2025])

# Residual-basierter Moving-Block-Bootstrap (Mechanik wie SAP-Amendment v1.1 THG-Laendervergleich)
mbb_summen <- function(modell, sub, R = R_BOOT, block_len = BLOCK_LEN) {
  n <- nrow(sub); block_len <- min(block_len, n - 1)
  n_bl <- ceiling(n / block_len); starts <- 1:(n - block_len + 1)
  fit0 <- fitted(modell); res0 <- residuals(modell)
  X0 <- cbind(1, PROJ_JAHRE); xs <- colSums(X0)
  vapply(seq_len(R), function(b) {
    idx <- unlist(lapply(sample(starts, n_bl, replace = TRUE), function(s) s:(s + block_len - 1)))[1:n]
    y_star <- fit0 + res0[idx]
    bm <- lm(y_star ~ sub$jahr)
    sum(xs * coef(bm))
  }, numeric(1))
}

# ARIMA: Punktprognose, Summe und Varianz der Summe aus der Kovarianzstruktur der Prognosefehler
arima_summe <- function(sub, h = 5, level = 0.95) {
  ts_obj <- ts(sub$emissionen, start = min(sub$jahr), frequency = 1)
  fit <- forecast::auto.arima(ts_obj)
  fc <- forecast::forecast(fit, h = h, level = 95)
  punkt <- as.numeric(fc$mean)
  arma <- fit$arma                      # (p, q, P, Q, period, d, D)
  p <- arma[1]; q <- arma[2]; d <- arma[6]
  phi <- if (p > 0) fit$model$phi[seq_len(p)] else numeric(0)
  theta <- if (q > 0) fit$model$theta[seq_len(q)] else numeric(0)
  # AR-Polynom (1 - sum phi B^i) * (1 - B)^d
  ar_poly <- c(1, -phi)
  if (d > 0) for (k in seq_len(d)) ar_poly <- convolve(ar_poly, c(1, -1), type = "open")
  ar_full <- -ar_poly[-1]
  psi <- c(1, if (h > 1) ARMAtoMA(ar = ar_full, ma = theta, lag.max = h - 1) else numeric(0))
  s2 <- fit$sigma2
  Sigma <- matrix(0, h, h)
  for (i in 1:h) for (j in 1:h) {
    m <- min(i, j); lag <- abs(i - j)
    Sigma[i, j] <- s2 * sum(psi[1:m] * psi[(1:m) + lag])
  }
  se_ref <- (as.numeric(fc$upper[, 1]) - punkt) / qnorm(0.975)
  kontrolle <- max(abs(sqrt(diag(Sigma)) - se_ref))
  sd_summe <- sqrt(sum(Sigma))
  list(modell = paste0("ARIMA(", paste(arma[c(1, 6, 2)], collapse = ","), ")", if (!is.null(fit$coef["drift"]) && "drift" %in% names(fit$coef)) " mit Drift" else ""),
       summe = sum(punkt), lo = sum(punkt) - qnorm(0.975) * sd_summe, hi = sum(punkt) + qnorm(0.975) * sd_summe,
       sd = sd_summe, kontrolle_diag = kontrolle)
}

klassifiziere_e2 <- function(ov) {
  if (ov >= KORR["lo"] && ov <= KORR["hi"]) "kompatibel mit Expertenrats-Schwellenwert"
  else if (ov < KORR["lo"]) "eigene Projektion optimistischer als Expertenrat (geringere/keine Ueberschreitung)"
  else "eigene Projektion pessimistischer als Expertenrat (groessere Ueberschreitung)"
}
naeher_an <- function(ov) {
  d_erk <- if (ov >= KORR["lo"] && ov <= KORR["hi"]) 0 else min(abs(ov - KORR["lo"]), abs(ov - KORR["hi"]))
  d_br  <- abs(ov - OVERSHOOT_BREG)
  c(d_erk = unname(d_erk), d_breg = unname(d_br),
    text = if (d_erk < d_br) "numerisch naeher an Expertenrat" else if (d_br < d_erk) "numerisch naeher an Bundesregierung" else "gleich weit")
}

diag_rows <- list(); e2_rows <- list(); koef_rows <- list()
VARIANTEN <- list(primaer = list(label = "Primaer: 2025 = 648,83 (UBA)", wert2025 = 648.83),
                  sens625 = list(label = "Sensitivitaet formal: 2025 = 625 (KSG-Grenze 2026, kein Emissionswert; RF-2)", wert2025 = ALT_2025))

for (vn in names(VARIANTEN)) {
  V <- VARIANTEN[[vn]]
  dv <- df; dv$emissionen[dv$jahr == 2025] <- V$wert2025
  ist <- ist_21_25_von(dv)
  cat(sprintf("\n================ Variante: %s ================\n", V$label))
  cat(sprintf("Kumuliert_Ist_2021_2025 = %.1f Mt\n", ist))
  for (fn in names(FENSTER)) {
    von <- FENSTER[[fn]][1]; bis <- FENSTER[[fn]][2]
    sub <- subset(dv, jahr >= von & jahr <= bis); n <- nrow(sub)
    modell <- lm(emissionen ~ jahr, data = sub)
    cat(sprintf("\n=== Variante %s, Fenster %s (%d-%d, n=%d) ===\n", vn, fn, von, bis, n))

    # SAP 5.2: Diagnostik
    dw <- tryCatch(lmtest::dwtest(modell), error = function(e) NULL)
    sw <- tryCatch(shapiro.test(residuals(modell)), error = function(e) NULL)
    dw_p <- if (!is.null(dw)) dw$p.value else NA; dw_stat <- if (!is.null(dw)) unname(dw$statistic) else NA
    sw_p <- if (!is.null(sw)) sw$p.value else NA
    cat(sprintf("Durbin-Watson: DW = %.3f, p = %.4f (H1: positive Autokorrelation)\n", dw_stat, dw_p))
    cat(sprintf("Shapiro-Wilk (Residuen): p = %.4f\n", sw_p))
    inferenz <- fn %in% c("A", "B")
    dw_sig <- !is.na(dw_p) && dw_p < 0.05
    hac_noetig <- inferenz && dw_sig
    cat(sprintf("Autokorrelation signifikant (alpha = 0,05): %s -> Kovarianzmatrix: %s\n", if (dw_sig) "JA" else "nein",
                if (!inferenz) "OLS (Fenster C: rein deskriptiv, keine HAC/Inferenz; RF-9)" else if (hac_noetig) "Newey-West (HAC), SAP 5.3" else "klassisch OLS (DW nicht signifikant)"))
    # Residuen-Plots (Linearitaet, ACF)
    png(file.path(OUT, sprintf("diagnostik_%s_%s.png", vn, fn)), width = 1400, height = 560, res = 130)
    op <- par(mfrow = c(1, 2))
    plot(fitted(modell), residuals(modell), xlab = "Gefittete Werte (Mt)", ylab = "Residuen (Mt)",
         main = sprintf("Residuen vs. Fitted - %s, Fenster %s", vn, fn), pch = 19); abline(h = 0, lty = 2)
    acf(residuals(modell), main = sprintf("ACF Residuen - %s, Fenster %s", vn, fn), lag.max = max(2, min(10, n - 2)))
    par(op); dev.off()

    # Steigungstest (alpha = 0,05 zweiseitig; SAP 5.5): klassisch und HAC (wie bestehende Analyse)
    if (inferenz) {
      ct_ols <- coeftest(modell)["jahr", ]
      ct_hac <- tryCatch(coeftest(modell, vcov = NeweyWest(modell))["jahr", ], error = function(e) rep(NA_real_, 4))
      cat(sprintf("Steigung: %.3f Mt/Jahr | klassisch p = %.4g | Newey-West p = %.4g\n", coef(modell)["jahr"], ct_ols[4], ct_hac[4]))
    } else { ct_ols <- ct_hac <- rep(NA_real_, 4); cat(sprintf("Steigung: %.3f Mt/Jahr (rein deskriptiv)\n", coef(modell)["jahr"])) }
    diag_rows[[length(diag_rows) + 1]] <- data.frame(Variante = vn, Fenster = fn, n = n, Steigung = unname(coef(modell)["jahr"]),
      DW = dw_stat, DW_p = dw_p, DW_signifikant = dw_sig, ShapiroWilk_p = sw_p, HAC_verwendet = hac_noetig,
      Steigung_p_klassisch = unname(ct_ols[4]), Steigung_p_NeweyWest = unname(ct_hac[4]))

    # Punktschaetzungen 2026-2030 (OLS)
    jahre_df <- data.frame(jahr = PROJ_JAHRE)
    pts <- as.numeric(predict(modell, jahre_df))
    names(pts) <- PROJ_JAHRE
    cat("OLS-Punktschaetzungen 2026-2030 (Mt): ", paste(sprintf("%d: %.1f", PROJ_JAHRE, pts), collapse = " | "), "\n")
    summe_ols <- sum(pts)
    # SAP 5.4.1 analytisch-parametrisch: Var(Summe) = 1' X0 V X0' 1
    X0 <- cbind(1, PROJ_JAHRE); xs <- colSums(X0)
    Vc <- if (hac_noetig) NeweyWest(modell) else vcov(modell)
    var_s <- as.numeric(t(xs) %*% Vc %*% xs)
    tq <- qt(0.975, df = n - 2)
    a_lo <- summe_ols - tq * sqrt(var_s); a_hi <- summe_ols + tq * sqrt(var_s)
    # SAP 5.4.2 Moving-Block-Bootstrap
    bs <- mbb_summen(modell, sub)
    b_lo <- unname(quantile(bs, 0.025)); b_hi <- unname(quantile(bs, 0.975))
    # SAP 5.4.3 ARIMA
    ar <- tryCatch(arima_summe(sub), error = function(e) { cat("ARIMA-Fehler:", conditionMessage(e), "\n"); NULL })
    if (!is.null(ar)) cat(sprintf("%s: Summe 2026-2030 = %.1f Mt (95%%-Intervall %.1f - %.1f); Kontrolle Diagonale vs. forecast(): %.2e\n",
                                  ar$modell, ar$summe, ar$lo, ar$hi, ar$kontrolle_diag))

    zeile <- function(methode, s, lo, hi, modelltext) {
      ges <- ist + s; ov <- ges - budget
      nn <- naeher_an(ov)
      data.frame(Variante = vn, Fenster = fn, Methode = methode, Modell = modelltext,
                 Kum_Ist_2021_2025 = ist, Kum_Proj_2026_2030 = s, Kum_Gesamt_2021_2030 = ges,
                 KI_unten = ges + lo, KI_oben = ges + hi,
                 Overshoot_eigen = ov, Overshoot_KI_unten = ov + lo, Overshoot_KI_oben = ov + hi,
                 Klassifikation = klassifiziere_e2(ov) , Deskriptiv_nur = !inferenz,
                 Dist_Expertenrat = as.numeric(nn["d_erk"]), Dist_Bundesregierung = as.numeric(nn["d_breg"]),
                 Naeher_an = nn["text"], stringsAsFactors = FALSE, row.names = NULL)
    }
    e2_rows[[length(e2_rows) + 1]] <- zeile("analytisch-parametrisch (HAC falls DW sig.)", summe_ols, a_lo - summe_ols, a_hi - summe_ols, "OLS")
    e2_rows[[length(e2_rows) + 1]] <- zeile("Moving-Block-Bootstrap (B=2000, Residuen)", summe_ols, b_lo - summe_ols, b_hi - summe_ols, "OLS")
    if (!is.null(ar)) e2_rows[[length(e2_rows) + 1]] <- zeile("ARIMA (auto.arima, h=5)", ar$summe, ar$lo - ar$summe, ar$hi - ar$summe, ar$modell)
  }
}

diag_tab <- do.call(rbind, diag_rows)
e2 <- do.call(rbind, e2_rows)
rownames(e2) <- NULL
# Hinweis: KI-Spalten sind Intervalle fuer Kum_Gesamt (Ist + Intervall der Projektionssumme)

cat("\n\n--- SAP 5.2 Diagnostik-Zusammenfassung (alle Variante x Fenster) ---\n")
print(transform(diag_tab, Steigung = round(Steigung, 2), DW = round(DW, 3), DW_p = round(DW_p, 4), ShapiroWilk_p = round(ShapiroWilk_p, 4),
                Steigung_p_klassisch = signif(Steigung_p_klassisch, 3), Steigung_p_NeweyWest = signif(Steigung_p_NeweyWest, 3)), row.names = FALSE)

cat("\n--- SAP 11 Estimand 2: Ergebnistabelle (Mt CO2-Aeq., eine Nachkommastelle) ---\n")
e2_print <- e2
num_cols <- c("Kum_Ist_2021_2025", "Kum_Proj_2026_2030", "Kum_Gesamt_2021_2030", "KI_unten", "KI_oben", "Overshoot_eigen",
              "Overshoot_KI_unten", "Overshoot_KI_oben", "Dist_Expertenrat", "Dist_Bundesregierung")
e2_print[num_cols] <- lapply(e2_print[num_cols], round, 1)
for (vn in names(VARIANTEN)) {
  cat(sprintf("\n[Variante: %s]\n", VARIANTEN[[vn]]$label))
  print(e2_print[e2_print$Variante == vn, c("Fenster", "Methode", "Kum_Gesamt_2021_2030", "KI_unten", "KI_oben", "Overshoot_eigen",
                                             "Overshoot_KI_unten", "Overshoot_KI_oben", "Klassifikation", "Naeher_an")], row.names = FALSE)
}
write.csv(e2, file.path(OUT, "estimand2_tabelle.csv"), row.names = FALSE)
write.csv(diag_tab, file.path(OUT, "diagnostik_tabelle.csv"), row.names = FALSE)

# Zusammenfassung Klassifikation (SAP 7: nichts auswaehlen, alles nebeneinander)
cat("\n--- Haeufigkeit der Klassifikationen (Fenster A und B, alle Methoden, beide Varianten; C nur deskriptiv) ---\n")
print(table(Variante = e2$Variante[e2$Fenster %in% c("A", "B")], Klasse = e2$Klassifikation[e2$Fenster %in% c("A", "B")]))

# Grafik Estimand 2 (getrennt von Estimand 1)
e2$Zeile <- paste0("Fenster ", e2$Fenster, " | ", sub(" \\(.*", "", e2$Methode))
e2$Zeile <- factor(e2$Zeile, levels = rev(unique(e2$Zeile)))
e2$VarLabel <- ifelse(e2$Variante == "primaer", "Primaer: 2025 = 648,83 Mt (UBA)", "Formale Sensitivitaet: 2025 = 625 (kein Emissionswert)")
p2 <- ggplot(e2, aes(y = Zeile)) +
  annotate("rect", xmin = KORR["lo"], xmax = KORR["hi"], ymin = -Inf, ymax = Inf, fill = "#e34948", alpha = 0.15) +
  geom_vline(xintercept = OVERSHOOT_BREG, linetype = "dashed", color = "#2a78d6") +
  geom_vline(xintercept = 0, color = "grey50") +
  geom_errorbar(aes(xmin = Overshoot_KI_unten, xmax = Overshoot_KI_oben, color = Deskriptiv_nur), orientation = "y", width = 0.25) +
  geom_point(aes(x = Overshoot_eigen, color = Deskriptiv_nur), size = 2) +
  scale_color_manual(values = c(`FALSE` = "#1baf7a", `TRUE` = "grey45"), labels = c("Fenster A/B", "Fenster C (deskriptiv)"), name = NULL) +
  facet_wrap(~VarLabel, ncol = 1, scales = "free_y") +
  labs(title = "Estimand 2: Eigene Trendfortschreibung - Overshoot 2021-2030 vs. Budget 6199 Mt",
       subtitle = "Rot: Expertenrat-Korridor 60-100 Mt | blau gestrichelt: Bundesregierung (Puffer 4,5 Mt = -4,5)\nIntervalle: 95 % (analytisch/Bootstrap: Parameterunsicherheit, ARIMA: Prognoseunsicherheit)",
       x = "Overshoot ggue. Gesamtbudget 2021-2030 (Mt CO2-Aeq.; negativ = unter Budget)", y = NULL) +
  theme_minimal(base_size = 9) + theme(legend.position = "bottom")
ggsave(file.path(OUT, "estimand2_overshoot.png"), p2, width = 9, height = 9, dpi = 200)

# Trendgrafik (Zeitreihe + Fortschreibung) fuer Estimand 2
proj_plot <- do.call(rbind, lapply(names(FENSTER), function(fn) {
  m <- fit_fenster(FENSTER[[fn]][1], FENSTER[[fn]][2])
  data.frame(jahr = 2025:2030, emissionen = c(648.83, as.numeric(predict(m, data.frame(jahr = PROJ_JAHRE)))), Fenster = paste("Fenster", fn))
}))
p3 <- ggplot() +
  geom_line(data = subset(df, jahr >= 2010), aes(jahr, emissionen), color = "#2a78d6", linewidth = 1) +
  geom_line(data = proj_plot, aes(jahr, emissionen, color = Fenster, linetype = Fenster), linewidth = 0.8) +
  labs(title = "Estimand 2: Historische Emissionen und OLS-Fortschreibung bis 2030",
       subtitle = "Quelle: UBA via klimadashboard.de | eigene Berechnung (Gesamt-THG ohne LULUCF)", x = NULL, y = "Mt CO2-Aequivalent", color = NULL, linetype = NULL) +
  theme_minimal(base_size = 11) + theme(legend.position = "bottom")
ggsave(file.path(OUT, "estimand2_trend_bis_2030.png"), p3, width = 7.5, height = 4.5, dpi = 200)

# sessionInfo (Auftrag)
writeLines(capture.output(sessionInfo()), file.path(OUT, "sessionInfo.txt"))
cat("\n=== ENDE: Skript vollstaendig durchgelaufen ===\n")
