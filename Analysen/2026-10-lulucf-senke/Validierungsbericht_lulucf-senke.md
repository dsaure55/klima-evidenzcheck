# Validierungsbericht LULUCF-Senke (unabhaengiges Statistik-Review)

Datum: 29.10.2026. Geprueft gegen: SAP v1.0 (final) und Amendment 1 (final). Geprueft: lulucf-senke.R, run_log.txt, Analysebericht, Abweichungsprotokoll, output/, rohdaten/. Es wurde nichts in den Analysedateien geaendert. Kein Freigabevermerk. Nicht Gegenstand (bekannt offen): K2-Rest, K4-Rest, K13.

## Gesamturteil: GERING (kein kritischer Befund, kein inhaltlicher Rechenfehler; freigabefaehig nach Behebung der Auflagen A1 bis A3)

Alle Kernzahlen wurden mit eigenem R-Skript (unabhaengig aus den xlsx-Dateien eingelesen) reproduziert, ohne Abweichung. Es bleiben Darstellungs- und Vollstaendigkeitsmaengel im Bericht (Lizenzhinweis fehlt, SAP-8.x-Pflichtsaetze teilweise fehlen).

## Validierungsbogen (SAP Abschnitt 14)

| Nr. | Ergebnis | Fundstelle / Anmerkung |
|---|---|---|
| V1 | erfuellt | SAP final v1.0, Amendment 1 mit Freigabevermerk; Vorwissen im Bericht Abschnitt 0 (Befund 4) |
| V2 | erfuellt | SHA-256 aller vier Dateien neu berechnet, identisch mit PRUEFSUMMEN.txt und PROVENIENZ.txt; Run-Log Abschnitt Integritaet |
| V3 | erfuellt | Zeile 4. Land Use (Zeile 35, Blatt GHG_CO2eq), inkl. HWP (Zeile 41 eigene Zeile), positiv = Quelle; GWP: Quelle 2 nennt 28/265 (AR5-konsistent) |
| V4 | erfuellt | Integritaetschecks im Run-Log; doppelte Uebertragung der PDF-Stichprobe dokumentiert (Hinweis 9) |
| V5 | erfuellt | M(2024) = 58,414 nachgerechnet; D30/D40/D45 = 83,414/93,414/98,414 |
| V6 | erfuellt | n = 15/35/7, D deskriptiv, 2017 und 2018 gerechnet |
| V7 | erfuellt | M-Dach bei 2028,5, 1/4-Term, t(n-2): alle drei Fenster identisch nachgerechnet |
| V8 | erfuellt | Kategorien B, A, C = K-ueber (nachgerechnet); S3b-C = K-im |
| V9 | erfuellt | r_req = -13,902 (Divisor 6); r_obs5 = 5,459; r_obs10 = 5,189; alle r_obs > 0, kein Q |
| V10 | erfuellt | DW, BP, SW, Cook, Hebel, Residuen 2023/24 nachgerechnet; Autokorrelation (A) im Bericht interpretiert; HAC tatsaechlich angewendet |
| V11 | erfuellt | S1 (Ordnung, Seed, 10.000 Pfade) reproduziert; S4 korrekt als nicht durchgefuehrt ausgewiesen |
| V12 | erfuellt | Lag floor(4(n/100)^(2/9)) = 2/3/2, prewhite = FALSE; Holm nachvollzogen |
| V13 | erfuellt | keine Fortschreibung 2040/2045 im Skript; Z40/Z45 nur als Marker/Abstand |
| V14 | teilweise | alle drei Fenster gleichrangig, B zuerst, Konjunktiv, 26,9 nur bei S7; aber Befunde 2 und 3 |
| V15 | erfuellt, mit Hinweis | Befunde 6 und 7 |
| V16 | erfuellt | OWID/GCP als nicht durchgefuehrt gekennzeichnet |
| V17 | teilweise | Grafiken/Tabellen vorhanden; Lizenzhinweis fehlt (Befund 2), p-Wert-Darstellung (Befund 5) |

## Befunde

Schweregrad: kritisch 0, wesentlich 1, gering 5, Hinweis 5 (Befund 1 ist ein positiver Hinweis).

1. (Hinweis) Rechenpruefung bestanden. Alle Kernwerte, Sensitivitaeten (S1, S2, S3a/b, S5, S6a/c/d, S7), Holm-Werte, Diagnostik und der Abgleich Quelle 1 gegen Quelle 2 stimmen mit Bericht und CSV ueberein (siehe Liste unten). Bericht und CSV sind konsistent, Rundung nach 5.7 korrekt (Mt eine Stelle, Steigung zwei, Q zwei).
2. (wesentlich) Lizenzhinweis fehlt im Analysebericht. SAP 11 und V17 verlangen einen Lizenzhinweis zu UBA-Material; der Bericht enthaelt weder Hinweis noch Verweis auf K13 (nur das Abweichungsprotokoll nennt K13 als offen). Behebung: Satz im Abschnitt Aussagegrenzen zur ungeklaerten Lizenz der PDF/xlsx (SAP 3.1/12.2: CC BY-NC-ND 4.0 fuer UBA-Texte und Grafiken, DL-DE-BY-2.0 bei vielen Datensaetzen, PDF/Data Cube unbestaetigt) und Pflicht zur Klaerung vor Abdruck von UBA-Grafiken oder Tabellen.
3. (gering) Pflichtaussagen aus SAP 8.2/8.3/8.4 fehlen oder sind nur angedeutet: (a) biologische Senken sind nicht dauerhaft garantiert (8.4) fehlt; (b) Hinweis, dass ein sichtbarer Trend teilweise Methodik- oder Modelleffekt sein kann (8.2), nur beilaeufig bei S6c; (c) Sektorgrenze, LULUCF nicht mit Gesamt ohne LULUCF vermischen (8.3) fehlt. Behebung: je ein neutraler Satz in Abschnitt 0.
4. (gering) Vorwissen (SAP 8.5) unvollstaendig wiedergegeben: SAP verlangt auch (b) Inventarbericht nur per Stichwortsuche gelesen, ohne Zeitreihenwerte, und (c) Aggregatwerte der UBA-Seite vom Orchestrator gesehen, Jahre 1991 bis 2023 nicht. Der Bericht nennt nur Aggregatwerte, Methodik, Sekundaerquellen und (a). Behebung: (b) und (c) ergaenzen; ausserdem, dass der Analyst beim Stopp-Oeffnen der PDF (pdftotext) Spaltenkoepfe und Kategoriezeilen sah (steht nur im Abweichungsprotokoll).
5. (gering) p-Werte im Bericht als 0,000 ausgewiesen. Nach 5.7 drei Nachkommastellen, aber 0,000 suggeriert p = 0; "< 0,001" ist praeziser (exakte Werte in tab3). Reine Darstellung.
6. (gering) Abweichungsprotokoll: Die Kopfzeile "Status: Analyse GESTOPPT, keine Auswertung durchgefuehrt, kein Skript, keine Ergebnisse" steht unveraendert ueber dem Fortsetzungsteil und ist fuer den Endstand missverstaendlich. Behebung: Kopf als Stand bei Stopp kennzeichnen. Inhaltlich sind Stopp (drei Gruende), Interpretationsnotiz Divisor (S3a = 7, S3b = 8, vom SAP nicht vorgegeben; plausibel, kategoriefolgenlos) und Fussnote Stand 03/2024 (PDF-Gesamtwerte 1990-2024 stimmen mit Quelle 1 ueberein, Fussnote vermutlich veraltet, kein Referenzwechsel) vollstaendig und ehrlich dokumentiert.
7. (gering) Grafik 1: Der Z30-Marker traegt nur "Z30 = -25"; SAP 11 verlangt den Hinweis, dass der Zielwert fuer das 4-Jahres-Mittel gilt. Der Titel nennt Submission 2026, obwohl der Dateikopf von Quelle 1 diese Bezeichnung nicht woertlich traegt (im Bericht als Hinweis erklaert, in der Grafik nicht). Behebung: Beschriftung ergaenzen.
8. (Hinweis) Tabellenzuschnitt weicht vom Reporting-Plan 11 ab: Tabelle 3 enthaelt nicht DW, ARIMA-Ordnung und -Intervall (in tab_diagnostik und tab_S1_arima); Tabelle 5 enthaelt nur S3, S5, S6a, S7 (S1, S2, S6c, S6d in Einzeldateien). Alles vorhanden, nur verteilt.
9. (Hinweis) Doppelte Uebertragung der PDF-Stichprobe: Die Sichtablesung ist im Skript hart kodiert; ich habe die Seite selbst als Bild gelesen und die Gesamtzeile fuer 1990 (36.494,9), 2000 (7.729,9), 2010 (11.311,7), 2020 (47.646,2), 2024 (57.838,9) und 2025 (26.855,1) bestaetigt, zudem Kategoriewerte 1990 und 2024 stichprobenhaft. Die Unabhaengigkeit der Ablesung von der maschinellen Auslese ist nachtraeglich nicht beweisbar; das Ergebnis ist korrekt.
10. (Hinweis) S7 Fenster C: Q = 28,74 bei r_obs = -0,55 (Konfidenzintervall schliesst 0 ein). Korrekt nach SAP und im Bericht eingeschraenkt; als instabile Division nicht in Teaser oder Grafik verwenden.
11. (Hinweis) Multiplizitaet und Cherry-Picking: bestanden. Alle drei Fenster, beide Bruchjahr-Kandidaten, die nicht robuste S3b-Ausnahme (Fenster C, K-im) und alle S-Analysen sind berichtet; Primaerfenster B wird zuerst genannt; keine Fensterverschiebung. Aussagegrenzen (Modelljahre 2023/2024, jaehrliche Neuberechnung, inventarisierte Werte, Intervall nur Modellstreuung, nicht simultan 95 %, K2 offen, S4/Data Cube/OWID/Thuenen nicht durchgefuehrt) sind sichtbar. Sprache: Konjunktiv, keine Kausalaussagen, keine Begriffe Prognose oder verfehlt.

## Auflagen an den analyst

- A1 (Pflicht): Lizenzhinweis in den Bericht (Befund 2).
- A2 (Pflicht): SAP-8.2/8.3/8.4-Saetze und vollstaendige Vorwissen-Offenlegung ergaenzen (Befunde 3, 4).
- A3 (Pflicht): p-Werte als "< 0,001"; Kopf des Abweichungsprotokolls klarstellen; Grafik-1-Beschriftung Z30 und Titel (Befunde 5, 6, 7).
- A4 (optional): Tabellenzuschnitt (Befund 8) im Bericht ausdruecklich benennen.

Nach Umsetzung genuegt eine fokussierte Nachpruefung als Anhang zu dieser Datei (CLAUDE.md); die Rechenwerte muessen nicht erneut vollstaendig geprueft werden, sofern Skript und CSV unveraendert bleiben.

## Selbst nachgerechnete Werte (eigenes Skript, Daten direkt aus Quelle 1 gelesen)

| Groesse | Eigene Rechnung | Bericht/CSV | Abweichung |
|---|---|---|---|
| M(2024) | 58,414 | 58,414 | 0 |
| D30 / D40 / D45 | 83,414 / 93,414 / 98,414 | gleich | 0 |
| M(2023), M(2022), M(2019), M(2014) | 55,866 / 47,824 / 31,120 / 6,523 | 55,9 / 47,8 | 0 |
| r_req | -13,902 | -13,90 | 0 |
| r_obs5 / r_obs10 | 5,459 / 5,189 | 5,46 / 5,19 | 0 |
| Fenster B: beta, KI, M-Dach, PI | 4,936 [3,379; 6,494], 86,752, [63,601; 109,903] | gleich | 0 |
| Fenster A | 1,957 [1,375; 2,539], 53,710, [31,497; 75,924] | gleich | 0 |
| Fenster C | 2,616 [-2,303; 7,535], 73,990, [33,654; 114,327] | gleich | 0 |
| Kategorien B/A/C | K-ueber / K-ueber / K-ueber | gleich | 0 |
| HAC-KI B/A/C (Lag 2/3/2) | [3,628; 6,244] / [1,114; 2,800] / [-0,567; 5,799] | gleich | 0 |
| p HAC B/A/C; Holm | 1,8e-06 / 4,2e-05 / 0,0883; Holm nachvollzogen | gleich | 0 |
| DW B/A/C (p) | 1,691 (0,174) / 1,136 (0,0018) / 2,006 (0,289) | gleich | 0 |
| BP-p, SW-p, Cook-Markierungen | 0,612/0,542/0,717; 0,595/0,0085/n.a.; 2010 / 1990,2023 / 2018 | gleich | 0 |
| S3a (A, B, C) | 51,81 [28,92; 74,69] / 89,88 [63,57; 116,19] / 81,73 [20,55; 142,91] | gleich | 0 |
| S3b (A, B, C) | 46,77 [24,38; 69,16] / 83,33 [54,00; 112,65] / 52,17 [-25,73; 130,06], C = K-im | gleich | 0 |
| S5: M(2024), D30, r_req; A, B, C | 61,89, 86,89, -14,48; 59,17 / 91,39 / 71,33 | gleich | 0 |
| S6a (2017-2024) | beta 5,127; 90,31 [45,87; 134,75] | gleich | 0 |
| S6c gamma (B: 2017, 2018; A: 2017, 2018) | 17,43 / 34,80; 30,97 / 36,90 (KI identisch) | gleich | 0 |
| S7: M(2025), D30, r_req; A/B/C; Q(C) | 53,89, 78,89, -15,78; 51,26 / 73,75 / 47,09; 28,74 | gleich | 0 |
| S1 ARIMA B / A (Seed 20261029, 10.000 Pfade) | (0,0,0) [74,50; 98,44] / (1,0,0) [28,33; 75,42] | gleich | 0 |
| Quelle 1 gegen Quelle 2 (Gesamt, 35 Jahre) | max. Differenz 1,4e-14 Mt; Q2-2025 = 26,855 | gleich | 0 |
| PDF-Stichprobe Gesamt 1990/2000/2010/2020/2024 (Sicht) | 36.494,9 / 7.729,9 / 11.311,7 / 47.646,2 / 57.838,9 kt | = Quelle 1 (unter 0,0001 Mt) | 0 |
| SHA-256 xlsx (2), PDF | identisch mit Pruefsummenlisten | | 0 |

Hinweis: Die ARIMA-Simulation stimmt mit demselben Seed ueberein; bei anderer Ziehungsreihenfolge waeren kleine Abweichungen normal.

---

## Anhang: Nachpruefung 1 (29.10.2026)

Gepruefter Stand: Commit e12000f (Analyst setzt A1 bis A4 um). Geprueft wurde der tatsaechliche Dateitext und das Diff gegen den Vorstand (git show, nur lesend), nicht die Meldung. Geaendert wurden laut Diff nur Analysebericht, Abweichungsprotokoll, lulucf-senke.R (Grafik 1: Titel und Z30-Beschriftung), run_log.txt (Zeitstempel) und grafik1_zeitreihe_fenster_ziel.png. Keine CSV-Datei im Commit (0 CSV-Aenderungen).

### Auflagen

| Auflage | Umgesetzt | Beleg |
|---|---|---|
| A1 Lizenzhinweis | ja | Analysebericht Abschnitt 0, Punkt "Lizenz (SAP 3.1, 11, K13, noch offen)": Lizenz fuer PDF, beide xlsx und Data Cube nicht bestaetigt; CC BY-NC-ND 4.0 (UBA-Texte/Grafiken), DL-DE-BY-2.0 (viele Datensaetze); vor Abdruck im Wortlaut klaeren. Entspricht SAP 3.1/12.2 |
| A2 SAP-8.2/8.3/8.4-Saetze und Vorwissen | ja | Punkt "Einordnung (SAP 8.2, 8.3, 8.4)": Methodik-/Modelleffekt moeglich und nicht herausgerechnet; LULUCF nicht Teil von Gesamt ohne LULUCF; Senken nicht dauerhaft garantiert, ohne Bewertung. Vorwissen jetzt (a), (b), (c) wie SAP 8.5; (c) nennt Gesamtsektor 1990/2024 und Kategorien 2024 (deckt sich mit SAP Abschnitt 0); Pdftotext-Einsicht des Analysten benannt |
| A3 p-Werte, Protokollkopf, Grafik 1 | ja | Berichtstext: "< 0,001" statt 0,000 (B, A; unadjustiert, Holm, HAC), C 0,230/0,230 und 0,088/0,088 unveraendert. Protokollkopf: "Status (Endstand): Analyse nach Amendment 1 durchgefuehrt; Stopp siehe Eintrag 1" mit Erlaeuterung des Stopp-Abschnitts. Grafik 1 siehe unten |
| A4 Tabellenzuschnitt benennen | ja | Punkt "Tabellenzuschnitt (Hinweis)": nennt tab_diagnostik, tab_S1_arima, tab_S2_Q_HAC, tab3, tab_S6c, tab_S6d, tab5 (S3, S5, S6a, S7) |

### Zahlen

Keine CSV-Aenderung (0 CSV-Dateien im Commit). Alle im Bericht stehenden Zahlen ausserhalb der p-Werte-Zeile sind im Diff unberuehrt; die p-Werte-Zeile aendert nur die Darstellung. Meine fruehere Nachrechnung (M(2024) = 58,414; Fenster B 86,752 [63,601; 109,903]; A 53,710; C 73,990; HAC, S1 bis S7) bleibt damit unveraendert gueltig. Abweichung: 0. Das Skript wurde nur in Grafik 1 geaendert (Titel, Beschriftung); keine Rechenzeile.

### Neue Sprache / neue Aussagen

Keine Kausalaussagen oder Zuspitzungen eingefuehrt. Die neuen Saetze sind neutral und stehen im Einklang mit SAP 8.2 bis 8.4 (Methodik-/Modelleffekt "kann zum Teil", Senken "nicht dauerhaft garantiert ... ohne Bewertung"). Lizenzaussage mit Vorbehalt ("voraussichtlich unkritisch", Klaerung vor Abdruck) wie im SAP.

### Grafik 1 (neu angesehen)

Titel jetzt "UBA-Trendtabelle THG 1990-2024, Stand 15.01.2026" (keine Bezeichnung "Submission 2026" mehr); Z30-Beschriftung vollstaendig lesbar: "Zielwert gilt fuer das 4-Jahres-Mittel 2027-2030, nicht fuer das Einzeljahr". Inhalt sonst unveraendert (Fenster A/B/C, Modelljahre 2023/2024 als Dreiecke, Marker 2017/2018, Nulllinie, Trend nur bis 2030). Die Beschriftung beginnt knapp links der senkrechten 2018-Linie und ueberschneidet sie leicht (kosmetisch).

### Neue Befunde

N1 (gering): Run-Log-Zeitstempel ueberschrieben. In run_log.txt steht jetzt "Erstes Oeffnen der beiden xlsx-Dateien durch den Analysten: 2026-10-29 10:27:16", der Lauf vom 10:18:30 wurde ersetzt (erstes echtes Oeffnen 10:18:30, nur noch in Git-Historie sichtbar). Der Bericht verweist weiter auf den "Zeitstempel im Run-Log" als Beleg fuer das erste Oeffnen; weder Bericht noch Abweichungsprotokoll erwaehnen den Wiederholungslauf. Behebung: ein Satz im Abweichungsprotokoll (Eintrag 11): "Lauf wiederholt am 29.10.2026 10:27 nach Auflagen A1-A4 (nur Grafik 1 und Berichtstext geaendert); Erstlauf 10:18:30; erstes Oeffnen der xlsx war 10:18:30". Keine Auswirkung auf Zahlen.
N2 (Hinweis): Z30-Beschriftung in Grafik 1 beruehrt die 2018-Linie (kosmetisch, optional).

### Aktualisiertes Gesamturteil: GERING (freigabefaehig, sobald N1 mit einem Satz dokumentiert ist)

Kritisch 0, wesentlich 0 (der fruehere wesentliche Befund 2 ist behoben), gering 1 (N1), Hinweis 1 (N2). Alle Auflagen A1 bis A4 umgesetzt; Zahlen unveraendert; keine neuen unzulaessigen Aussagen. Eine weitere Nachpruefung der Rechenwerte ist nicht noetig; N1 ist durch Sichtkontrolle des Protokolls erledigbar.
