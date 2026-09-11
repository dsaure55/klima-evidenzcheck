# Abweichungsprotokoll (Post-hoc) – Schnellcheck "Sommer 2026 – ganz normal?"

Bezug: SAP v1.0 final, 11.09.2026. Alle Abweichungen betreffen Umsetzung/Software,
nicht Estimands, Bezugsrahmen, Schwellen oder Auswahl der berichteten Ergebnisse.

| Nr. | SAP-Stelle | Plan | Umsetzung | Grund | Einschätzung Auswirkung |
|---|---|---|---|---|---|
| A1 | 10 Software | R (stats, lmtest, sandwich, forecast, segmented, boot, ggplot2) | Python 3.11 mit numpy/scipy/pandas/matplotlib; alle Verfahren manuell implementiert | R und statsmodels in der Cloud-Umgebung nicht installierbar (Paketquellen gesperrt) | gering für OLS/Fieller/Bootstrap (deterministische Formeln); **Reproduktion in R in lokaler Pipeline empfohlen** |
| A2 | 3 Datenquelle | Rohdatei unverändert im Analyseordner | Deutschland-Spalte transkribiert; Prüfsummen (n, Summe, Σ Jahr·Wert) auf Originalseite berechnet und identisch | Datei aus Cloud nicht direkt abrufbar; Zugriff nur über Browser | keine bei identischen Prüfsummen; **Nachtrag 11.09.2026: Originaldatei byte-identisch (Länge + Prüfsumme über alle Bytes) als `rohdaten/regional_averages_tm_summer.txt` abgelegt – Auflage 9 erledigt** |
| A3 | 5.3/5.5 Durbin-Watson | lmtest::dwtest, zweiseitig (SAP 5.5) | DW-Statistik + Monte-Carlo-p-Wert (100 000 Simulationen, Seed 20260911); **Rev. 1: zweiseitig p = 0,65** (erster Lauf fälschlich einseitig 0,32, vom Validator beanstandet) | A1 | keine (nicht signifikant in beiden Varianten) |
| A4 | 5.4 HAC | sandwich::NeweyWest (automatische Bandbreite, Prewhitening) | Bartlett-Kern, fester Lag 3 = floor(4·(n/100)^(2/9)) | A1 | keine – Korrektur nicht ausgelöst |
| A5 | 6 S3 | Paket segmented (iterative Schätzung) | Rastersuche Bruchpunkt 1891–2015 in 0,1-Jahr-Schritten, min. RSS; Intervalle bedingt auf Bruchpunkt, df = n − 4 | A1 | gering; Bruchpunkt-Unsicherheit wie im SAP angekündigt nicht enthalten |
| A6 | 6 S4 | forecast::auto.arima mit Drift | Nachbau: d per KPSS (Level, Lag 3, krit. Wert 0,463); p, q ≤ 2; CSS-Schätzung (Nelder-Mead) statt Maximum Likelihood; Auswahl nach AICc | A1 | mittel für Modellwahl (AICc-Unterschiede zwischen (0,1,1), (1,1,1), (1,1,2) < 0,4); Ergebnis 2058 liegt innerhalb 10 Jahre vom Primärergebnis |
| A7 | 2 E2 | Schwelle 19,6 °C | zusätzlich post-hoc mit Dateiwert 19,55 °C gerechnet | Transparenz | nur Info, ±1 Jahr |
| A8 | 5.4 Normalität | "deutliche Nicht-Normalität" nicht quantifiziert | Shapiro-Wilk p = 0,014 als Auslöser gewertet → S5-Perzentile in den Vordergrund, Wiederkehrzeiten nur Größenordnung | Auslegung einer unbestimmten SAP-Formulierung, konservativ | beeinflusst Gewichtung der R3-Einstufung (z: "ungewöhnlich warm" vs. Perzentil: innerhalb zentraler 80 %) – beide werden berichtet |

## Revision 1 (11.09.2026) – Umsetzung der Validierungsauflagen

Keine Änderung an Estimands, Modellen oder Primärergebnissen. Geändert: DW-Test zweiseitig
(A3); empirische Häufigkeit und Perzentil-Abstand für R3 ergänzt; Wiederkehrzeiten nur noch
als grobe Klassen mit Vermerk "nicht belastbar"; Multiplizitäts-Check um KI-Grenzen
erweitert; S5-Zeile in Tabelle 2, Jahre als Ganzzahlen; Grafik: Quelle ausgeschrieben,
"Normalbereich" → "Mittel ± 1 SD", Konventions- und Szenario-Hinweis, t**-Beschriftung;
Analysebericht: Kernaussagen überarbeitet, R2 und t** ergänzt, Limitationen ergänzt.
Auflage 9 am 11.09.2026 erledigt (siehe A2).
