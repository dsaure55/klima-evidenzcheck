# Analysebericht: Expertenrat-Budgetabgleich 2021-2030 und H1-2026

**SAP:** `SAP_Expertenrat-Budgetabgleich-2030.md`, Version 1.1 (Header: final, eingefroren 29.08.2026, Commit d9215cb)
**Skript:** `expertenrat-budgetabgleich.R` (R 4.6.1), Lauf vom 23.10.2026, fehlerfrei durchgelaufen (Exit-Code 0)
**Log:** `run_log.txt`, `output/sessionInfo.txt`
**Status dieses Berichts:** Analyst-Ausgabe, NICHT validiert, keine Freigabe, keine Veroeffentlichung.
**Abweichungen vom SAP / Rueckfragen:** siehe `Abweichungsprotokoll_expertenrat-budgetabgleich.md` (RF-1 bis RF-11). Post-hoc-Anteile sind im Text mit "POST-HOC" gekennzeichnet.

Rundung wie im SAP (11): eine Nachkommastelle fuer Mt und Prozentpunkte. Bei Estimand 1 steht zusaetzlich die ungerundete Distanz in Klammern, weil die Toleranzschwelle (0,05 pp) feiner als eine Nachkommastelle ist.

---

## 0. Datenabgleich (SAP 4a), vor allen Ergebnissen

Der Datenabgleich wurde vor jeder Modellierung durchgefuehrt und bestanden (kein Stopp, keine `STOPP.md`).

### Quellen, Zugriffsdaten, Vintage, Systemgrenze (SAP 3)

| # | Quelle | Zugriff | Stand / Vintage | Systemgrenze | Rohdaten |
|---|---|---|---|---|---|
| 1 | UBA via klimadashboard.de (CC BY 4.0) | 23.10.2026 (SAP verweist auf Erstzugriff 27.08.2026) | UBA-Emissionsdaten 2025 vom 14.03.2026 (API-Feld `update` = 2026-03-14) | Gesamt-THG in CO2-Aeq., KSG-Sektoren, produktionsbasiert, ohne LULUCF | `rohdaten/klimadashboard/` |
| 2 | Agora Energiewende, Halbjahresbilanz 2026 (Pressemitteilung 28.08.2026) | 23.10.2026 | erste Schaetzung auf vorlaeufigen Daten | nicht ausdruecklich benannt; aus KSG-Bezug und Konsistenz (635 + 13 = 648 Mt) als Gesamt-THG ohne LULUCF abgeleitet | `rohdaten/agora/` |
| 3 | FAZ-Artikel | Abruf versucht 23.10.2026, nicht abrufbar | - | - | `rohdaten/suchprotokoll/faz/` |
| 4 | Expertenrat fuer Klimafragen, Pruefbericht Emissionsdaten 2025 / Projektionsdaten 2026 | 23.10.2026 | veroeffentlicht 18.05.2026 | Summe der Jahresemissionsgesamtmengen aller Sektoren ohne LULUCF (Anlage 2 KSG) | `rohdaten/expertenrat/` |
| 5 | Bundesregierung / UBA Projektionsdaten 2026 (Puffer 4,5 Mt) | nur sekundaer ueber Quelle 4 | vorgelegt 14.03.2026; Datentabelle UBA laut Literaturverzeichnis des Pruefberichts Stand 07.05.2026 | Mit-Massnahmen-Szenario, ohne LULUCF | in `rohdaten/expertenrat/bericht.txt` |

Pruefsummen (SHA-256) aller Rohdateien: `rohdaten/SHA256SUMS.txt` (auch im Log).

### Suchversuch Quelle 4 (Suchhinweis SAP 3)

Der Pruefbericht wurde aktiv auf expertenrat-klima.de gefunden (Publikationsliste, Detailseite, PDF mit 23,1 MB und Pressemitteilung). Der Fallback (nur 60/100 Mt ohne Budgetgroesse) war NICHT noetig. Aus der Primaerquelle:

- Gesamtbudget 2021-2030 (Summe der Jahresemissionsgesamtmengen, ohne LULUCF, Anlage 2 KSG): **6199 Mt CO2-Aeq.**
- Summe der THG-Emissionen 2021-2030 laut Projektionsdaten 2026 in Verbindung mit den Emissionsdaten 2025: 6194 Mt, also Puffer **4,5 Mt (0,07 %)**.
- Einschaetzung des Expertenrats: Ein "50/50-Emissionspfad" laege etwa **60 bis 100 Mt (1,0-1,6 %)** ueber dem zulaessigen Emissionsbudget bis 2030.
- UBA-Gesamtemissionen 2025 laut Expertenrat: 648,9 Mt (ohne LULUCF), Rueckgang 0,1 % ggue. 2024.

### Identitaet der UBA-Basiszeitreihe 1990-2025

Die 36 Werte im archivierten Skript `Analysen/2026-08-emissionen/DE-Emissionen-Trendprojektion-2040.R` (Zeilen 15-20) wurden verglichen mit (a) der Tabelle auf klimadashboard.de/emissionen (Spalte "total") und (b) der unabhaengig aus der Open-Data-API berechneten Summe aller THG-Zeilen der UBA-Kategorien:

- Max. Abweichung HTML-Tabelle zum alten Skript: 0,0000 Mt (alle 36 Jahre exakt identisch).
- Max. Abweichung API-Summe zum alten Skript: 0,0047 Mt (API liefert drei Nachkommastellen; Rundungsdifferenz).
- Ergebnis: Reihe identisch. Detail: `output/datenabgleich_basiszeitreihe.csv`.
- Reproduktion der publizierten 2040-Projektionen mit den Modellen A/B: 486,0 Mt bzw. 207,0 Mt (publiziert: 486 bzw. 207).

Kleine Differenz zur Expertenrat-Angabe: 2025 = 648,83 (klimadashboard) vs. 648,9 (Expertenrat, Angabe des UBA); 2024 = 649,74 vs. 649,8 (ERK Tabelle 3). Ursache nicht im Detail geprueft (Rundung/Nachberechnung moeglich), Betrag unter 0,1 Mt.

### Diskrepanz "625 Mt" vs. "648,83 Mt" (SAP 4a.1)

- 648,83 Mt ist der UBA-Wert der Gesamtemissionen 2025 (Expertenrat: 648,9 Mt).
- 625 Mt ist laut Agora (Pressemitteilung und Halbjahresbilanz) die **gesetzlich festgelegte Emissionshoechstgrenze fuer das Jahr 2026** nach Klimaschutzgesetz, kein Emissionswert fuer 2025. Agora nennt zusaetzlich eine Hochrechnung 2026 von 635 Mt, also 13 Mt weniger als 2025 (implizit 648 Mt fuer 2025).
- Die Diskrepanz beruht damit auf zwei unterschiedlichen Groessen (Ist 2025 vs. Zielwert 2026), nicht auf einem anderen Erhebungsstand und nicht auf anderen Systemgrenzen. Die Annahme im SAP-Hintergrund (625 als 2025-Basiswert) trifft nach der Primaerquelle nicht zu (RF-2).
- Anwendung der Entscheidungsregel: Estimand 1 mit 648,83 (zwingend). Estimand 2 primaer mit 648,83. Weil der SAP die parallele Rechnung mit dem Alternativwert vorschreibt und keine Sensitivitaet ausgelassen werden soll, wurde Estimand 2 FORMAL zusaetzlich mit 2025 = 625 gerechnet. Diese Variante ist inhaltlich nicht belastbar (Zielwert statt Emissionswert) und steht nur zur Vollstaendigkeit der vorab festgelegten Tabellenstruktur da.

### Systemgrenzen-Check (SAP 4a.3)

Alle Quellen beziehen sich auf Gesamt-THG ohne LULUCF, territorial. Fuer Agora ist das nur indirekt belegt (Limitation). Es wurde keine Abweichung gefunden, die einen direkten Zahlenvergleich verzerrt. Tabelle: `output/systemgrenzen_check.csv`.

### Weitere Datenabgleich-Befunde

- Historische H1/H2-Reihe (SAP 2, 6.4): Eine oeffentliche Agora-/UBA-Reihe mit mindestens 5 vollstaendigen Halbjahrespaaren wurde nicht gefunden (Agora-Sitemap mit 1129 URLs und Pressemitteilungsliste durchsucht; nur die Halbjahresbilanz 2026 enthaelt eine H1-Gesamt-THG-Schaetzung). Die saisonal gewichtete Sensitivitaet entfaellt daher ersatzlos, wie im SAP vorgesehen. Keine Verdopplung der H1-Zahl.
- Agora weist selbst darauf hin, dass der tatsaechliche Rueckgang geringer ausfallen koenne als ausgewiesen (Unsicherheit beim Heizoel-Absatz/Lagermodell). Die H1-Zahl ist vorlaeufig und eine zusaetzliche, nicht quantifizierte Unsicherheitsquelle (SAP 8a).

---

## 1. Estimand 1: H1 2026 gegenueber den Trendmodellen A und B

Modelle A (1990-2025) und B (2015-2025) wurden nicht neu spezifiziert, sondern mit den Daten der publizierten Analyse reproduziert. Dies ist ausschliesslich eine Betrachtung der Jahres-ueber-Jahres-Rate; sie sagt nichts ueber das Budget 2021-2030 aus (SAP 8b).

| Groesse | Wert |
|---|---|
| H1 2026 (Agora, vorlaeufig) | 327 Mt |
| H1 2025 (abgeleitet: 327 + 7) | 334 Mt (aus gerundeten Agora-Angaben, RF-5) |
| Rate_H1 (primaer, aus Absolutwerten) | -2,1 % (-2,096 %) |
| fit_A(1990) / fit_A(2025) | 1213,5 / 704,3 Mt |
| CAGR_A | -1,5 % (-1,543 %) |
| fit_B(2015) / fit_B(2025) | 919,0 / 634,2 Mt |
| CAGR_B | -3,6 % (-3,641 %) |

| Rate-Variante | Toleranz | d_A | d_B | Einordnung |
|---|---|---|---|---|
| primaer (-2,1 %) | 0,05 pp | 0,6 pp (0,553) | 1,5 pp (1,545) | naeher an Fenster A (pessimistischeres Szenario) |
| primaer (-2,1 %) | 0,1 pp | 0,6 pp (0,553) | 1,5 pp (1,545) | naeher an Fenster A (pessimistischeres Szenario) |
| POST-HOC: von Agora genannte Rate (-2,0 %) | 0,05 pp | 0,5 pp (0,457) | 1,6 pp (1,641) | naeher an Fenster A |
| POST-HOC: -2,0 % | 0,1 pp | 0,5 pp (0,457) | 1,6 pp (1,641) | naeher an Fenster A |

**Robustheitsaussage (SAP 2, 6.6):** Die Klassifikation stimmt bei der primaeren Schwelle (0,05 pp) und der Sensitivitaetsschwelle (0,1 pp) ueberein (robust). Das gilt auch fuer die post-hoc geprueften gerundeten Rate (-2,0 %). Die Distanzdifferenz (ca. 1,0 bis 1,2 pp) liegt weit ueber beiden Toleranzschwellen.

Hinweis: n = 1 Beobachtung, rein deskriptiv, kein p-Wert. Die Modellkurve A liegt 2025 bei 704,3 Mt, die beobachtete Reihe bei 648,8 Mt. Grafik: `output/estimand1_h1_vs_cagr.png`.

---

## 2. Estimand 2: Eigene Trendfortschreibung 2021-2030 gegenueber dem Expertenrat-Korridor

Ein getrennter Teil (SAP 8b): kumulatives Budgetkonzept 2021-2030, Budget 6199 Mt. `Overshoot_eigen = Kumuliert_Ist_2021_2025 + Summe der Projektion 2026-2030 - 6199`. Die Klassifikation bezieht sich auf den Punktwert der jeweiligen Zeile. Alle Kombinationen sind aufgefuehrt, keine wurde ausgewaehlt (SAP 7). Fenster C ist rein deskriptiv.

Kumuliert_Ist_2021_2025: 3480,1 Mt (primaer) bzw. 3456,2 Mt (formale Variante mit 2025 = 625).

### 2.1 Diagnostik (SAP 5.2, 5.3), unguenstige Ergebnisse eingeschlossen

| Variante | Fenster | n | Durbin-Watson (p) | Shapiro-Wilk (p) | Kovarianz fuer analytische Summe |
|---|---|---|---|---|---|
| primaer | A | 36 | 0,648 (<0,0001), Autokorrelation signifikant | 0,687 | Newey-West (HAC) |
| primaer | B | 11 | 1,937 (0,308) | 0,450 | klassisch OLS |
| primaer | C | 6 | 1,933 (0,215) | 0,502 | OLS (deskriptiv) |
| 625-Variante | A | 36 | 0,598 (<0,0001), signifikant | 0,697 | Newey-West |
| 625-Variante | B | 11 | 1,915 (0,294) | 0,955 | klassisch OLS |
| 625-Variante | C | 6 | 1,841 (0,176) | 0,724 | OLS (deskriptiv) |

Steigung (primaer): Fenster A -14,5 Mt/Jahr (Newey-West p = 5,9e-09; klassisch p = 2,9e-24), Fenster B -28,5 Mt/Jahr (klassisch p = 6,8e-07; Newey-West p = 3,0e-09). Bei Fenster B hat der DW-Test mit n = 11 geringe Teststaerke; ein nicht signifikanter DW-Test belegt keine Unabhaengigkeit der Residuen. Residuen-vs-Fitted- und ACF-Plots: `output/diagnostik_<variante>_<fenster>.png`.

### 2.2 Ergebnistabelle primaer (2025 = 648,83 Mt), Mt CO2-Aeq.

Intervalle sind 95 %-Intervalle fuer die Gesamtsumme 2021-2030 bzw. den Overshoot. Wichtig fuer die Lesart: Die Intervalle der Methoden "analytisch" und "Bootstrap" beschreiben nur die Parameterunsicherheit des Trends (SAP-Vorgabe, siehe RF-3); das ARIMA-Intervall beschreibt die Prognoseunsicherheit. Sie sind daher nicht gleichartig.

| Fenster | Methode | Kum. Gesamt | 95 %-Intervall | Overshoot | Overshoot 95 % | Klassifikation |
|---|---|---|---|---|---|---|
| A | analytisch (HAC) | 6783,2 | 6237,9 - 7328,5 | 584,2 | 38,9 - 1129,5 | pessimistischer als Expertenrat |
| A | Bootstrap | 6783,2 | 6628,0 - 6936,3 | 584,2 | 429,0 - 737,3 | pessimistischer |
| A | ARIMA(0,1,0) mit Drift | 6465,3 | 6372,1 - 6558,5 | 266,3 | 173,1 - 359,5 | pessimistischer |
| B | analytisch (OLS) | 6224,0 | 5996,3 - 6451,8 | 25,0 | -202,7 - 252,8 | optimistischer als Expertenrat |
| B | Bootstrap | 6224,0 | 6040,1 - 6400,4 | 25,0 | -158,9 - 201,4 | optimistischer |
| B | ARIMA(0,1,0) mit Drift | 6349,6 | 6234,3 - 6464,9 | 150,6 | 35,3 - 265,9 | pessimistischer |
| C (deskriptiv) | analytisch | 6337,7 | 5768,7 - 6906,8 | 138,7 | -430,3 - 707,8 | (pessimistischer) |
| C (deskriptiv) | Bootstrap | 6337,7 | 6083,4 - 6701,3 | 138,7 | -115,6 - 502,3 | (pessimistischer) |
| C (deskriptiv) | ARIMA(0,1,0) | 6724,2 | 6589,0 - 6859,5 | 525,2 | 390,0 - 660,5 | (pessimistischer) |

Klassifikationsschwellen (SAP 2): Overshoot im Korridor 60-100 Mt = kompatibel; darunter = optimistischer; darueber = pessimistischer. Im primaeren Lauf liegt **kein** Punktwert innerhalb des Korridors 60-100 Mt. Bei Fenster A und B zusammen (6 Zeilen) fallen 4 Zeilen in "pessimistischer", 2 Zeilen in "optimistischer".

Punktschaetzungen 2026-2030 (OLS, primaer): Fenster A 689,7 / 675,2 / 660,6 / 646,1 / 631,5 Mt; Fenster B 605,7 / 577,3 / 548,8 / 520,3 / 491,8 Mt; Fenster C 618,9 / 595,2 / 571,5 / 547,8 / 524,2 Mt. Der Expertenrat nennt fuer das Projektionsdaten-Szenario 2030 einen Wert von 468,4 Mt; dieser Wert ist kein Modellinput.

### 2.3 Ergebnistabelle formale Variante (2025 = 625, RF-2, inhaltlich nicht belastbar)

| Fenster | Methode | Kum. Gesamt | 95 %-Intervall | Overshoot | Overshoot 95 % | Klassifikation |
|---|---|---|---|---|---|---|
| A | analytisch (HAC) | 6745,1 | 5795,4 - 7694,7 | 546,1 | -403,6 - 1495,7 | pessimistischer |
| A | Bootstrap | 6745,1 | 6585,5 - 6901,6 | 546,1 | 386,5 - 702,6 | pessimistischer |
| A | ARIMA(0,1,0) mit Drift | 6312,1 | 6219,3 - 6404,9 | 113,1 | 20,3 - 205,9 | pessimistischer |
| B | analytisch (OLS) | 6146,0 | 5924,9 - 6367,2 | -53,0 | -274,1 - 168,2 | optimistischer |
| B | Bootstrap | 6146,0 | 5972,5 - 6320,8 | -53,0 | -226,5 - 121,8 | optimistischer |
| B | ARIMA(0,1,0) mit Drift | 6170,9 | 6059,2 - 6282,6 | -28,1 | -139,8 - 83,6 | optimistischer |
| C (deskriptiv) | analytisch | 6200,4 | 5633,5 - 6767,4 | 1,4 | -565,5 - 568,4 | (optimistischer) |
| C (deskriptiv) | Bootstrap | 6200,4 | 5996,9 - 6552,6 | 1,4 | -202,1 - 353,6 | (optimistischer) |
| C (deskriptiv) | ARIMA(0,1,0) | 6581,2 | 6440,9 - 6721,6 | 382,2 | 241,9 - 522,6 | (pessimistischer) |

Die Ergebnisse der beiden Basiswert-Varianten stimmen bei Fenster A in allen drei Methoden ueberein ("pessimistischer"). Bei Fenster B kippt die ARIMA-Zeile von "pessimistischer" (primaer) nach "optimistischer" (625-Variante). Das ist eine reine Sensitivitaets-Beobachtung zu einer Eingabe, die kein Emissionswert ist.

### 2.4 Einordnung als dritte, methodisch transparente Stimme (SAP 8c)

Dies ist keine Entscheidung darueber, welche der beiden offiziellen Stellen "recht hat", und keine Bewertung ihrer Methodik. Es wird nur gezaehlt, welchem Wert die eigene Fortschreibung numerisch naeher liegt: dem Expertenrat-Korridor (Distanz 0, wenn im Korridor, sonst Abstand zum naechsten Rand) oder der Bundesregierungs-Angabe (Overshoot -4,5 Mt, Puffer). Die Operationalisierung ist eine Ergaenzung (RF-6, POST-HOC).

Primaerlauf, Fenster A und B:

- naeher am Expertenrat-Korridor: A analytisch (Overshoot 584,2), A Bootstrap (584,2), A ARIMA (266,3), B ARIMA (150,6; Abstand zum Korridorrand 50,6 gegenueber 155,1 zur Bundesregierungs-Angabe);
- naeher an der Bundesregierungs-Angabe: B analytisch (25,0; Abstand 29,5 gegenueber 35,0 zum Korridor) und B Bootstrap (25,0).

Bei den Fenster-A-Zeilen liegt der eigene Wert weit ausserhalb beider Angaben; "naeher" ist dort nur eine relative Aussage (Abstand zum Korridor 484 bzw. 166 Mt). Die Methodenwahl bestimmt das Bild; es gibt keine ausgezeichnete Hauptkombination.

Grafiken: `output/estimand2_overshoot.png` (Overshoot je Fenster/Methode mit Korridor und Bundesregierungs-Linie), `output/estimand2_trend_bis_2030.png`.

---

## 3. Limitationen (SAP 9, ergaenzt um Befunde dieses Laufs)

- H1-2026 ist eine vorlaeufige Agora-Schaetzung; H1 2025 wurde aus gerundeten Angaben abgeleitet (334 Mt).
- Die lineare OLS-Fortschreibung ist ein statistisches Konstrukt, nicht die Compliance-Methodik des Expertenrats (sektorale Ziele, LULUCF-Sonderregeln, Uebertragsmechanismen).
- Die Intervalle von analytischer Methode und Bootstrap erfassen nur die Parameterunsicherheit (RF-3); der Block-Bootstrap mit Blocklaenge 2 bei n = 36 beruecksichtigt die starke Autokorrelation in Fenster A nur grob. Die analytische HAC-Variante in Fenster A ergibt deutlich breitere Intervalle als der Bootstrap.
- Fenster B (n = 11) und C (n = 6) haben breite Intervalle; Fenster C ist rein deskriptiv.
- Systemgrenze von Agora nur indirekt belegt; Quellen 3 (FAZ) und 5 (Primaerabruf beim UBA) nicht direkt eingesehen (RF-7).
- Die Variante mit 2025 = 625 verwendet einen Zielwert statt eines Emissionswerts und ist nicht belastbar.
- Keine Kausalaussage, keine politische Bewertung.

## 4. Dateien

- Skript: `expertenrat-budgetabgleich.R`; Log: `run_log.txt`
- Tabellen: `output/estimand1_tabelle.csv`, `output/estimand2_tabelle.csv`, `output/diagnostik_tabelle.csv`, `output/datenabgleich_basiszeitreihe.csv`, `output/systemgrenzen_check.csv`
- Grafiken: `output/estimand1_h1_vs_cagr.png`, `output/estimand2_overshoot.png`, `output/estimand2_trend_bis_2030.png`, `output/diagnostik_*.png`
- Rohdaten und Pruefsummen: `rohdaten/`, `rohdaten/SHA256SUMS.txt`
