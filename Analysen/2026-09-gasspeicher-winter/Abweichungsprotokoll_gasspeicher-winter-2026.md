# Abweichungsprotokoll (Post-hoc) – Schnellcheck Gasspeicher Winter 2026/27

Bezug: SAP v1.0 final, eingefroren 14.09.2026. Keine Abweichung betrifft Estimands,
Bezugsrahmen, Schwellen oder die Auswahl der berichteten Ergebnisse.

| Nr. | SAP-Stelle | Plan | Umsetzung | Grund | Auswirkung |
|---|---|---|---|---|---|
| A1 | 10 Software | R (stats, ggplot2, binom) | Python 3 mit numpy/scipy/matplotlib; OLS, Konfidenz- und Prognoseintervalle manuell, Clopper-Pearson über `scipy.stats.beta` | R in der Cloud-Umgebung nicht verfügbar, `statsmodels` nicht installierbar (Paketquellen gesperrt) | gering – deterministische Formeln; Nachrechnung in R empfohlen |
| A2 | 3.1 Datenquelle | AGSI+/GIE-Tagesdaten | Eurostat `nrg_cb_gasm`, Monatsdaten | Session hat keinen Netzzugang zu agsi.gie.eu (Gateway 403); Wechsel vor dem Einfrieren in den SAP aufgenommen und mitfreigegeben | Monats- statt Tagesauflösung; Integritätscheck bestätigt die Zielgröße (133,7 vs. 134 TWh) |
| A3 | 3.2 Temperatur | Rohdatei unverändert im Analyseordner | Deutschland-Spalte aus in den Chat eingefügtem Dateitext übernommen (`rohdaten/dwd_gebietsmittel_deutschland_wintermonate.csv`, Herkunft im Dateikopf) | opendata.dwd.de aus der Session gesperrt; Übermittlung als Text statt als Datei | **offen** – Abgleich mit den Originaldateien steht aus, Übertragungsfehler möglich |
| A4 | 4 Analysepopulation | S2 ab Winter 2014/15 (n = 12) | erster Lauf ab 2008/09 (n = 18) | Eurostat reicht weiter zurück als erwartet | **korrigiert nach Validierung**; das lange Fenster erscheint nur nachrichtlich mit Warnhinweis zum Meldeumfang |
| A5 | 6 S5 | Gradtagzahlen nach VDI 3807 | nicht durchgeführt | Daten in dieser Session nicht beschaffbar; SAP 3.2 sieht diesen Fall ausdrücklich vor | Temperaturmaß bleibt das Wintermittel; als nicht durchgeführt gekennzeichnet |
| A6 | 11 Tabelle 1 | Speicherstand am 1. Oktober und Arbeitsgasvolumen je Winter | nicht enthalten | Eurostat weist keine Bestandsniveaus aus, nur Veränderungen | Kapazitätsentwicklung (SAP 8.4) nicht quantifizierbar, als Limitation benannt |
| A7 | 2 E2 | Anteil der Temperaturverteilung mit erwarteter Entnahme über 136 TWh | im ersten Lauf nicht berechnet | Umsetzungsfehler | **korrigiert nach Validierung**: Schwelle 4,49 °C, 60 % der Referenzwinter kälter |
| A8 | 5.1 Datenaufbereitung | keine Regel zu Nullwerten | Nullwerte in `TI_EHG_MAP` werden als Meldelücke verworfen | 43 Monate mit Wert 0, ökonomisch unplausibel; im ersten Lauf als echte Nullen gelesen | **korrigiert nach Validierung** – betrifft nur E4 (Kontextgröße), nicht E1/E2 |
| A9 | 2 E2 | Prognose für den kalten Winter (10. Perzentil) | berechnet, aber nicht berichtet | 2,69 °C liegt unter dem Fitbereich 3,75–6,18 °C | bewusste Nichtberichterstattung, im Analysebericht offengelegt |

## Änderungen nach den Prüfrunden

Zwei unabhängige Prüfrunden am 14.09.2026 (Details im Validierungsbericht). Geändert
wurden: Behandlung der Meldelücken (A8), Fenster von S2 (A4), Ergänzung von S3 für E1,
S4 sowie S1/S6 für E2, Kennzeichnung von S5 (A5), Ergänzung des präregistrierten
Schwellenwerts (A7), Kennzeichnung der Extrapolation (A9) sowie Zahlen-, Formulierungs-
und Grafikkorrekturen in den Veröffentlichungstexten. Estimands, Modelle und
Primärergebnisse blieben unverändert.
