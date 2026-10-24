# Analysebericht: Expertenrat-Budgetabgleich 2021-2030 und H1-2026

**Fassung 4 (nach Nachpruefung 2 der Validierung), 24.10.2026.** Fassung 1 (Commit 78250e3) enthielt einen Rechenfehler in den ARIMA-Intervallen (behoben in Fassung 2); Fassung 3 behebt vier geringe Befunde der Nachpruefung (N2.1-N2.4: Beschreibung des POST-HOC-Prognoseintervalls, Seed-Beschriftung, Grafikreste, Zusatzkontrollen). Kernzahlen sind gegenueber Fassung 2 unveraendert (Abschnitt "Aenderungen nach Validierung", Fassung 3). Fassung 4 gleicht die Dokumentation an das freigegebene Erratum an, korrigiert die Erklaerung zu Fenster C und ergaenzt Achsenmarken (N3.1-N3.3); Kernzahlen unveraendert.
**SAP:** `SAP_Expertenrat-Budgetabgleich-2030.md`, Version 1.1 (Header: final, eingefroren 29.08.2026, Commit d9215cb). Die Bestaetigung durch Daniel Saure, dass v1.1 als eingefroren gilt, ist in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` dokumentiert. Die Antworten zu den Offenen Punkten 6a ("Limitation reicht") und 6b (Datenquellen-Zeile 5 bestaetigt) liegen vor (Daniel Saure, 23.10.2026); das SAP-Erratum 1 (`SAP_Erratum_1_Expertenrat-Budgetabgleich-2030.md`) wurde freigegeben (Commit d20e448). Dokumentiert in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` (Abschnitt "Ergaenzung") und im Erratum. Die verbliebenen Textwidersprueche im SAP (Abschnitt 0 "draft", Offene Punkte 6) bleiben als Hinweis bestehen und sind im Erratum berichtigt. Der SAP wurde nicht veraendert.
**Skript:** `expertenrat-budgetabgleich.R` (R 4.6.1), fehlerfrei durchgelaufen (Exit-Code 0), Log `run_log.txt`, `output/sessionInfo.txt`.
**Status:** Analyst-Ausgabe; Nachpruefung 1 und 2 der Validierung liegen vor (Nachtrag 1 und 2 im Validierungsbericht), Fassung 4 ist noch nicht erneut geprueft; keine Freigabe der Analyse, keine Veroeffentlichung.
**Abweichungen / Rueckfragen / Post-hoc:** `Abweichungsprotokoll_expertenrat-budgetabgleich.md`.

Rundung wie im SAP (11): eine Nachkommastelle fuer Mt und Prozentpunkte; Ausnahmen sind gekennzeichnet (Estimand 1: drei Stellen in Klammern wegen der Toleranz 0,05 pp; Bootstrap-Grenzen in ganzen Mt wegen Monte-Carlo-Fehler).

---

## Kernaussage (vorangestellt)

1. **Estimand 1:** Die Halbjahresrate H1 2026 gegenueber H1 2025 (-2,1 %, vorlaeufige Agora-Schaetzung) liegt naeher an der mittleren Rate des Langfrist-Trends (Fenster A, -1,5 %) als an der des 10-Jahres-Trends (Fenster B, -3,6 %). Das ist robust gegenueber beiden Toleranzschwellen und der Rundung. Deskriptiv, n = 1, kein Test.
2. **Estimand 2:** Die eigene Trendfortschreibung ergibt einen Overshoot gegenueber dem Budget 6199 Mt, der je nach Fenster und Methode zwischen **+25 und +584 Mt** (Punktwerte Fenster A und B) liegt. Der Expertenrat-Korridor 60-100 Mt wird von keinem Punktwert getroffen. **Aber:** 8 von 9 Intervallen (alle Fenster) bzw. 5 von 6 (Fenster A und B) ueberdecken den Korridor; nur das Bootstrap-Parameterintervall von Fenster A (429-737 Mt) schliesst ihn aus. 4 der 6 Intervalle von Fenster A/B ueberdecken zugleich die Null (Budget eingehalten) und den Korridor. **Die Analyse erlaubt keine belastbare Aussage, ob der Expertenrat-Korridor getroffen wird.** Die Spanne haengt von Fenster und Methode ab; es gibt keine ausgezeichnete Hauptkombination.
3. **Modellartefakt-Hinweis Fenster A:** Die Fortschreibung beginnt 2026 bei 689,7 Mt, 40,9 Mt ueber dem beobachteten 2025-Wert (648,83 Mt). Das Residuum 2025 betraegt -55,4 Mt (siehe Linearitaet unten). Ein grosser Teil des A-Overshoots (+584 Mt) geht auf diesen Niveausprung zurueck; die A-Zeilen sind nicht als Trendaussage ueber das Tempo lesbar.

---

## 0. Datenabgleich (SAP 4a), vor allen Ergebnissen

Der Datenabgleich wurde vor jeder Modellierung durchgefuehrt und bestanden (kein Stopp, keine `STOPP.md`).

### Quellen, Zugriffsdaten, Vintage, Systemgrenze (SAP 3)

| # | Quelle | Zugriff | Stand / Vintage | Systemgrenze | Rohdaten |
|---|---|---|---|---|---|
| 1 | UBA via klimadashboard.de (CC BY 4.0) | 23.10.2026 (SAP verweist auf Erstzugriff 27.08.2026) | UBA-Emissionsdaten 2025 vom 14.03.2026 (API-Feld `update` = 2026-03-14) | Gesamt-THG in CO2-Aeq., KSG-Sektoren, produktionsbasiert, ohne LULUCF | `rohdaten/klimadashboard/` |
| 2 | Agora Energiewende, Halbjahresbilanz 2026 (Pressemitteilung 28.08.2026) | 23.10.2026 | erste Schaetzung auf vorlaeufigen Daten | nicht ausdruecklich benannt; aus KSG-Bezug und Konsistenz (635 + 13 = 648 Mt) als Gesamt-THG ohne LULUCF abgeleitet | `rohdaten/agora/` |
| 3 | FAZ-Artikel | Abruf versucht 23.10.2026, nicht abrufbar | - | - | `rohdaten/suchprotokoll/faz/` |
| 4 | Expertenrat fuer Klimafragen, Pruefbericht Emissionsdaten 2025 / Projektionsdaten 2026 | 23.10.2026 | veroeffentlicht 18.05.2026 | Summe der Jahresemissionsgesamtmengen ohne LULUCF (Anlage 2 KSG) | `rohdaten/expertenrat/` |
| 5 | Bundesregierung / UBA Projektionsdaten 2026 (Puffer 4,5 Mt) | nur sekundaer ueber Quelle 4 | vorgelegt 14.03.2026; UBA-Datentabelle laut Literaturverzeichnis des Pruefberichts Stand 07.05.2026 | Mit-Massnahmen-Szenario, ohne LULUCF | in `rohdaten/expertenrat/bericht.txt` |
| - | KSG Anlage 2 (gesetze-im-internet.de, BGBl. 2024 I Nr. 235) | 23.10.2026 | - | Jahresemissionsgesamtmengen 2020-2030 | `rohdaten/ksg/` |

Pruefsummen (SHA-256): `rohdaten/SHA256SUMS.txt`. Die Datei ist ab Fassung 2 festgeschrieben und wird vom Skript nur noch verglichen (Lauf: alle 24 Dateien unveraendert). Fuer die in Fassung 2 neu hinzugekommenen Dateien (KSG-Seite, UBA-/AGEB-Suchprotokoll) wurde die Datei einmalig neu angelegt; die Hashes aller bereits in Fassung 1 vorhandenen Dateien sind unveraendert (verglichen).

### Suchversuch Quelle 4 (SAP 3, Suchhinweis)

Der Pruefbericht wurde aktiv auf expertenrat-klima.de gefunden. Der Fallback (nur 60/100 Mt) war nicht noetig. Aus der Primaerquelle:

- Gesamtbudget 2021-2030 (ohne LULUCF, Anlage 2 KSG): **6199 Mt CO2-Aeq.**
- Summe THG 2021-2030 laut Projektionsdaten 2026 in Verbindung mit den Emissionsdaten 2025: 6194 Mt, Puffer **4,5 Mt (0,07 %)** (der Bericht fuehrt 6194,5 und -4,5).
- Einschaetzung des Expertenrats: Ein "50/50-Emissionspfad" laege etwa **60 bis 100 Mt (1,0-1,6 %)** ueber dem zulaessigen Emissionsbudget bis 2030.
- UBA-Gesamtemissionen 2025 laut Expertenrat: 648,9 Mt (ohne LULUCF).

### Identitaet der UBA-Basiszeitreihe 1990-2025

Die 36 Werte im archivierten Skript `Analysen/2026-08-emissionen/DE-Emissionen-Trendprojektion-2040.R` (Zeilen 15-20) stimmen mit der Tabelle auf klimadashboard.de/emissionen exakt ueberein (Abweichung 0,0000 Mt) und mit der aus der Open-Data-API summierten Reihe bis auf Rundung (max. 0,0047 Mt). Detail: `output/datenabgleich_basiszeitreihe.csv`. Reproduktion der publizierten 2040-Projektionen: 486,0 und 207,0 Mt (publiziert 486 und 207). Differenz zu den Expertenrat-Angaben (2025: 648,83 vs. 648,9; 2024: 649,74 vs. 649,8) unter 0,1 Mt, Ursache nicht untersucht.

### Diskrepanz "625 Mt" vs. "648,83 Mt" (SAP 4a.1; Wortlaut nach Validierung W2 korrigiert)

- 648,83 Mt ist der UBA-Wert der Gesamtemissionen 2025 (Expertenrat: 648,9 Mt).
- Der SAP-Hintergrund nahm 625 Mt faelschlich als 2025-Emissionswert an. Agora nennt 625 Mt (Pressemitteilung und Halbjahresbilanz, Fussnote 2 dort: "Angepasst nach KSG Par. 4 (2)") als gesetzliche Hoechstmenge fuer 2026 und eine Hochrechnung 2026 von 635 Mt, also 13 Mt weniger als 2025.
- Anlage 2 KSG (BGBl. 2024 I Nr. 235, am 23.10.2026 abgerufen) nennt fuer 2026 jedoch **604 Mt** (2025: 643 Mt). Die 625 sind daher nicht der Anlage-2-Wert. **Moeglicherweise** handelt es sich um die nach Par. 4 Abs. 2 KSG angepasste Jahresmenge: Der Expertenrat nennt fuer 2030 eine vom UBA angepasste Menge von 459,2 Mt gegenueber 438 Mt in Anlage 2 (Differenz 21,2 Mt); 604 + 21,2 = 625,2. Das ist eine Plausibilitaetsrechnung. **Nicht belegt:** In den Expertenrat-Dokumenten kommt die Zahl 625 nicht vor, Agora ist die einzige Quelle.
- Die Diskrepanz beruht damit auf zwei unterschiedlichen Groessen (Ist 2025 vs. Jahresmenge 2026), nicht auf einem anderen Erhebungsstand oder anderen Systemgrenzen. Ein alternativer 2025-Emissionswert existiert nicht. Die Bedingung in SAP 6.3 (ungeklaerte Diskrepanz) ist damit nicht ausgeloest; die Parallelrechnung mit 625 ist nicht SAP-erforderlich.
- Anwendung der Entscheidungsregel: Estimand 1 und 2 verwenden 648,83. Die Rechnung mit 625 im Datensatz steht ausschliesslich im **Anhang A** (Entscheidung Daniel Saure, 23.10.2026).

### Systemgrenzen-Check (SAP 4a.3)

Alle Quellen beziehen sich auf Gesamt-THG ohne LULUCF, territorial; fuer Agora nur indirekt belegt (Limitation). Keine verzerrende Abweichung gefunden. `output/systemgrenzen_check.csv`.

### Weitere Befunde

- **H1/H2-Reihe (SAP 2, 6.4):** Keine oeffentliche Reihe mit mindestens 5 vollstaendigen H1/H2-Paaren gefunden. Durchsucht wurden die Agora-Sitemap (1129 URLs) und Pressemitteilungsliste sowie (in Fassung 2 ergaenzt) UBA- und AGEB-Seiten (`rohdaten/suchprotokoll/uba_agueb/`: keine Treffer fuer Halbjahres-Gesamt-THG; UBA berichtet jaehrlich; Grenze: keine Tiefensuche in PDF-Anhaengen). Die saisonale Sensitivitaet entfaellt ersatzlos, keine Verdopplung.
- Agora schreibt, der Rueckgang sei "groesstenteils auf die gestiegenen fossilen Energiepreise infolge der Blockade der Strasse von Hormus zurueckzufuehren" und koenne wegen statistischer Unschaerfen beim Heizoelabsatz geringer ausfallen (Zitat der Quelle, keine Ursachenaussage dieser Analyse). Die H1-Rate ist damit ein kurzfristiges, vorlaeufiges Signal und nicht gleichartig mit einer langjaehrigen mittleren Rate.

---

## 1. Estimand 1: H1 2026 gegenueber den Trendmodellen A und B

Modelle A (1990-2025) und B (2015-2025) wurden nicht neu spezifiziert, sondern mit den Daten der publizierten Analyse reproduziert. Betrachtet wird nur die Jahres-ueber-Jahres-Rate; sie sagt nichts ueber das Budget 2021-2030 aus (SAP 8b). Das SAP-Label "pessimistischeres Szenario" fuer Fenster A ist ein Etikett fuer den Abstand, keine Trendbestaetigung.

| Groesse | Wert |
|---|---|
| H1 2026 (Agora, vorlaeufig) | 327 Mt |
| H1 2025 (abgeleitet: 327 + 7) | 334 Mt (aus gerundeten Agora-Angaben) |
| Rate_H1 (primaer) | -2,1 % (-2,096 %) |
| CAGR_A (aus gefitteten Werten 1213,5 -> 704,3 Mt) | -1,5 % (-1,543 %) |
| CAGR_B (aus gefitteten Werten 919,0 -> 634,2 Mt) | -3,6 % (-3,641 %) |

| Rate-Variante | Toleranz | d_A | d_B | Einordnung |
|---|---|---|---|---|
| primaer (-2,1 %) | 0,05 pp | 0,6 pp (0,553) | 1,5 pp (1,545) | naeher an Fenster A |
| primaer (-2,1 %) | 0,1 pp | 0,6 pp (0,553) | 1,5 pp (1,545) | naeher an Fenster A |
| POST-HOC: Agora-Rate -2,0 % | 0,05 / 0,1 pp | 0,5 pp (0,457) | 1,6 pp (1,641) | naeher an Fenster A |
| POST-HOC: Rundungsspanne Rueckgang 7 +/- 0,5 Mt: -1,95 % | 0,05 pp | 0,4 pp (0,406) | 1,7 pp (1,692) | naeher an Fenster A |
| POST-HOC: Rundungsspanne: -2,24 % | 0,05 pp | 0,7 pp (0,700) | 1,4 pp (1,399) | naeher an Fenster A |

**Robustheitsaussage (SAP 2, 6.6):** Die Klassifikation stimmt bei 0,05 und 0,1 pp ueberein (robust) und aendert sich auch innerhalb der Rundungsspanne der H1-Rate nicht (Abstand der Distanzen mindestens 0,7 pp).
**Fussnote:** Die CAGR beruhen auf gefitteten Werten (Modell A liegt 2025 bei 704,3 Mt, beobachtet 648,8 Mt). Beobachtete mittlere Jahresraten waeren -1,86 % (1990-2025) und -3,20 % (2015-2025); das ist nicht die SAP-Definition und aendert die Einordnung nicht.
Kein Signifikanztest, kein p-Wert. Grafik: `output/estimand1_h1_vs_cagr.png`.

---

## 2. Estimand 2: Eigene Trendfortschreibung 2021-2030 gegenueber dem Expertenrat-Korridor

Kumulatives Budgetkonzept 2021-2030, Budget 6199 Mt (getrennt von Estimand 1, SAP 8b). `Overshoot = Kum_Ist_2021_2025 (3480,1 Mt) + Summe Fortschreibung 2026-2030 - 6199`. Alle Kombinationen sind aufgefuehrt; nichts wurde ausgewaehlt (SAP 7). Fenster C ist rein deskriptiv und wird nicht klassifiziert.

### 2.1 Diagnostik (SAP 5.2, 5.3), unguenstige Ergebnisse eingeschlossen

| Fenster | n | Durbin-Watson (p) | Shapiro-Wilk p | ACF Lag 1 / Lag 2 (Schranke) | Residuum 2025 | Kovarianz fuer analytische Summe |
|---|---|---|---|---|---|---|
| A | 36 | 0,648 (3,8e-07), signifikant | 0,687 | 0,62 / 0,35 (+/- 0,33) | -55,4 Mt | Newey-West (HAC) |
| B | 11 | 1,937 (0,308) | 0,450 | -0,03 / -0,69 (+/- 0,59) | +14,6 Mt | klassisch OLS |
| C | 6 | 1,933 (0,215) | 0,502 | -0,10 / -0,65 (+/- 0,80) | +6,2 Mt | OLS (deskriptiv) |

Steigung: A -14,5 Mt/Jahr (Newey-West p = 5,9e-09; klassisch 2,9e-24), B -28,5 Mt/Jahr (klassisch p = 6,8e-07; Newey-West p = 3,0e-09; letzterer bei n = 11 nicht belastbar, da von Prewhitening und Bandbreite abhaengig; fuer B wird HAC nach SAP nicht angewendet).

**Interpretation der Linearitaet und Autokorrelation (Limitation, keine neuen Modelle):**
- **Fenster A:** Der Residuen-vs-Fitted-Plot zeigt ein deutliches umgekehrtes U (positive Residuen in der Mitte des Fitted-Bereichs, deutlich negative an beiden Enden, 2025: -55,4 Mt). Das ist eine systematische Abweichung von der Linearitaet, die die Extrapolation direkt betrifft. Zusammen mit der signifikanten Autokorrelation (ACF Lag 1 = 0,62, Lag 2 = 0,35, beide oberhalb der Schranke) bedeutet das: Die A-Fortschreibung ist als Trendaussage nur eingeschraenkt interpretierbar; die Intervalle (insbesondere die Parameterintervalle) unterschaetzen die Modellunsicherheit.
- **Fenster B:** Kein klares Muster im Residuenplot. Der ACF liegt bei Lag 2 (-0,69) knapp ausserhalb der Schranke (-0,59); bei n = 11 und etwa neun gepruefter Lags nicht belastbar, aber zu nennen. Der DW-Test hat bei n = 11 geringe Teststaerke; "nicht signifikant" belegt keine Unabhaengigkeit der Residuen.
- **Fenster C:** n = 6; Residuenplot und ACF erlauben keine Beurteilung. Rein deskriptiv.

Plots: `output/diagnostik_primaer_A.png`, `_B.png`, `_C.png`.

### 2.2 Ergebnistabelle (2025 = 648,83 Mt), Mt CO2-Aeq.

**Spaltenlesart (W5):** "Parameterintervall" (analytisch, Bootstrap) beschreibt nur die Unsicherheit der geschaetzten Trendparameter, also den Erwartungswert der Summe; die tatsaechliche Summe enthielte zusaetzlich die Streuung der kuenftigen Jahreswerte. "Prognoseintervall" (ARIMA) beschreibt die Unsicherheit der tatsaechlichen Summe. Die beiden Typen sind nicht gleichartig und nicht direkt vergleichbar. Die Klassifikation bezieht sich nur auf den Punktwert.

| Fenster | Methode | Intervalltyp | Kum. Gesamt | 95 %-Intervall (Gesamt) | Overshoot | 95 %-Intervall (Overshoot) | Klassifikation (nur Punktwert) | Intervall deckt Korridor 60-100 |
|---|---|---|---|---|---|---|---|---|
| A | analytisch (HAC) | Parameter | 6783,2 | 6237,9 - 7328,5 | 584,2 | 38,9 - 1129,5 | pessimistischer | ja |
| A | Bootstrap | Parameter | 6783,2 | 6628 - 6936 | 584,2 | 429 - 737 | pessimistischer | nein |
| A | ARIMA(0,1,0) mit Drift | Prognose | 6465,3 | 6066,3 - 6864,4 | 266,3 | -132,7 - 665,4 | pessimistischer | ja |
| B | analytisch (OLS) | Parameter | 6224,0 | 5996,3 - 6451,8 | 25,0 | -202,7 - 252,8 | optimistischer | ja |
| B | Bootstrap | Parameter | 6224,0 | 6040 - 6400 | 25,0 | -159 - 201 | optimistischer | ja |
| B | ARIMA(0,1,0) mit Drift | Prognose | 6349,6 | 5855,9 - 6843,3 | 150,6 | -343,1 - 644,3 | pessimistischer | ja |
| C (deskriptiv) | analytisch | Parameter | 6337,7 | 5768,7 - 6906,8 | 138,7 | -430,3 - 707,8 | - | ja |
| C (deskriptiv) | Bootstrap | Parameter | 6337,7 | 6083 - 6701 | 138,7 | -116 - 502 | - | ja |
| C (deskriptiv) | ARIMA(0,1,0) | Prognose | 6724,2 | 6145,1 - 7303,4 | 525,2 | -53,9 - 1104,4 | - | ja |

Schwellen (SAP 2): Overshoot im Korridor 60-100 Mt = kompatibel, darunter optimistischer, darueber pessimistischer als der Expertenrat. Kein Punktwert liegt im Korridor. Fenster A/B: 4 Zeilen "pessimistischer", 2 "optimistischer". **Intervallueberdeckung:** 8 von 9 Intervallen ueberdecken den Korridor (nur A-Bootstrap nicht); 4 der 6 Intervalle von A/B ueberdecken Korridor und Null gleichzeitig. Wer aus der Klassifikation "optimistischer/pessimistischer" liest, liest mehr hinein, als die Daten tragen.
Bootstrap-Grenzen sind wegen des Monte-Carlo-Fehlers (siehe 2.4) in ganzen Mt angegeben.

Punktschaetzungen 2026-2030 (OLS): Fenster A 689,7 / 675,2 / 660,6 / 646,1 / 631,5 Mt; B 605,7 / 577,3 / 548,8 / 520,3 / 491,8 Mt; C 618,9 / 595,2 / 571,5 / 547,8 / 524,2 Mt. Niveausprung 2025 -> 2026: A +40,9 Mt, B -43,1 Mt, C -29,9 Mt (Modell gegen beobachteten Wert 648,83 Mt). Die Einordnung von A als Modellartefakt (Niveausprung, Linearitaetsverletzung) steht in der Kernaussage.

Grafiken: `output/estimand2_overshoot.png` (Hauptteil), `output/estimand2_trend_bis_2030.png`.

### 2.3 ARIMA-Kontrollen (nach Fehlerbehebung K1)

In allen drei Fenstern waehlt `auto.arima` ein Random-Walk-Modell (0,1,0), in A und B mit Drift. Dann sind die Prognosefehler stark positiv korreliert (psi-Gewichte alle 1); die Varianz der 5-Jahres-Summe ist sigma^2 * h(h+1)(2h+1)/6 = 55 sigma^2 (Summe ueber min(i,j) fuer h = 5). Kontrollen im Skript (`output/arima_kontrollen.csv`):

| Fenster | sigma^2 | sd Summe (Kovarianzmatrix) | sd Summe (Formel 55 sigma^2) | sd Summe (Monte-Carlo, 10000 Pfade) |
|---|---|---|---|---|
| A | 753,7 | 203,6 | 203,6 | 205,3 |
| B | 1153,6 | 251,9 | 251,9 | 253,9 |
| C | 1587,7 | 295,5 | 295,5 | 297,9 |

Der Monte-Carlo-Wert liegt 0,8 % ueber dem analytischen (Monte-Carlo-Fehler); beide Gegenproben bestehen. Die Normalapproximation beruecksichtigt die Unsicherheit des Drift-Parameters nicht (wie im SAP).

**Hinweis zum identischen Verhaeltnis (1,008):** In den sechs Anpassungen ist das Verhaeltnis Monte-Carlo/analytisch identisch, weil dieselben Zufallszahlen (Seed 20261023) verwendet werden und nur mit unterschiedlichem sigma skaliert werden. Die Hauptkontrolle ist deshalb nicht sechs unabhaengige Pruefungen. Ergaenzend (Fassung 3, `output/arima_kontrollen_zusatz.csv`) wurden simulierte Reihen mit bekannten anderen Modellen mit je eigenem Seed und 20000 Monte-Carlo-Pfaden getestet; zusaetzlich wurden die psi-Gewichte gegen geschlossene Formeln geprueft (ARIMA(1,1,0): psi_k = (1 - phi^(k+1))/(1 - phi); ARIMA(0,1,1): psi_k = 1 + theta fuer k >= 1):

| Modell (simuliert) | sd Summe analytisch | sd Summe Monte-Carlo | Verhaeltnis | max. Abw. psi zur Formel |
|---|---|---|---|---|
| ARIMA(1,1,0), phi = 0,6 | 121,72 | 121,14 | 0,995 | 4e-16 |
| ARIMA(1,1,0), phi = -0,5 | 60,36 | 59,67 | 0,988 | 2e-16 |
| ARIMA(0,1,1), theta = 0,5 | 92,50 | 92,57 | 1,001 | 0 |
| ARIMA(0,1,1), theta = -0,4 | 40,85 | 40,97 | 1,003 | 0 |
| ARIMA(0,1,0) | 61,20 | 60,83 | 0,994 | (RW-Formel) |

Alle Abweichungen liegen innerhalb von 1,2 % (Monte-Carlo-Fehler; Toleranz im Skript 3 %), die Diagonale stimmt mit `forecast()` bis auf 1e-14 ueberein. Die Kovarianzkonstruktion ist damit auch fuer AR- und MA-Terme verifiziert, nicht nur fuer den Random Walk; im Hauptlauf kommen allerdings nur (0,1,0)-Modelle vor.

### 2.4 Hinweise zu Intervallbreiten (POST-HOC, G2/G3)

- **Bootstrap (Blocklaenge 2, Seed 20260827, B = 2000):** Monte-Carlo-Fehler der Perzentilgrenzen betraegt einige Mt (Wiederholung mit anderen Seeds, B = 10000: Fenster A 431-433 / 736-741, Fenster B -158 bis -156 / 198-201). Blocklaenge 4 (POST-HOC): Fenster A 426-781 (B = 2000) bzw. 427-776 (B = 10000) statt 429-737; Fenster B -110 bis 147 bzw. -118 bis 157; Fenster C -6 bis 412. Laengere Bloecke erweitern also die Obergrenze in A und verengen die Intervalle in B/C (wenige Startpunkte); der Block-Bootstrap ist bei B/C wenig aussagekraeftig. `output/posthoc_bootstrap_sensitivitaet.csv`.
Fuer B weicht sie ab (Sensitivitaetszeile -153 bis 199 gegenueber Hauptlauf -159 bis 201); bei C liegen beide Zeilen nahezu gleich (Obergrenze identisch 502,3; Untergrenze -116,0 gegenueber -115,6). Das ist keine Zufallsuebereinstimmung, sondern eine Diskretisierungswirkung: Bei n = 6 gibt es nur wenige moegliche Ziehungen von Residuenbloecken und damit nur wenige verschiedene Bootstrap-Ergebnisse (auch die Zeilen mit anderen Seeds liefern dieselbe Untergrenze -115,6). Die Abweichung in B ist Monte-Carlo-Fehler, kein Rechenfehler.
- **HAC in Fenster A:** Der Standardfehler der 5-Jahres-Summe betraegt bei OLS 63,2 Mt, bei Newey-West mit der sandwich-Voreinstellung (Prewhitening an) 268,3 Mt, ohne Prewhitening 134,9 Mt. Die Breite des analytischen A-Intervalls (Faktor ca. 4 gegenueber OLS) haengt also stark von den Voreinstellungen ab; die SAP-Vorgabe `sandwich::NeweyWest` ist eingehalten. `output/posthoc_hac_vergleich.csv`.
- **POST-HOC, deskriptiv: Prognoseintervall der Summe fuer OLS (Fassung 3 praezisiert, N2.1).** Berechnet wird: Varianz = Parametervarianz der 5-Jahres-Summe + 5 x sigma^2 (OLS-Restvarianz; Annahme **unabhaengiger** kuenftiger Restfehler), t-Quantil mit n-2 Freiheitsgraden. Die Parametervarianz ist dieselbe wie im analytischen Parameterintervall von 2.2: in Fenster A Newey-West (HAC), in B und C klassisch OLS. Overshoot-Intervalle: **Fenster B -234,4 bis 284,4 und Fenster C -459,6 bis 737,1** (beide Varianten identisch; C n = 6). **Fenster A:** 17,1 bis 1151,3 mit HAC-Parametervarianz (SE der Summe 268,3 Mt) plus iid-Restvarianz; diese Mischung ist inkonsistent, denn die iid-Annahme ist in A verletzt (DW signifikant). Mit klassischer OLS-Parametervarianz (SE 63,2 Mt) ergibt sich 382,3 bis 786,1; dieses Intervall ist bei der vorhandenen Autokorrelation zu optimistisch. Keine der beiden A-Varianten ist ein verlaesslicher Prognosebereich; sie zeigen nur, dass das Ergebnis von der Varianzannahme abhaengt. Nicht im SAP, nicht in Kernaussage oder Klassifikation; `output/posthoc_prognoseintervall_ols.csv` (beide Varianten, Spalte `Parametervarianz_Quelle`).

### 2.5 Einordnung als dritte, methodisch transparente Stimme (SAP 8c)

Keine Entscheidung darueber, welche der beiden offiziellen Stellen "recht hat". Gezaehlt wird nur, welchem Wert der eigene Punktwert numerisch naeher liegt: Expertenrat-Korridor (Distanz 0 im Korridor, sonst Randabstand) oder Bundesregierungs-Angabe (Overshoot -4,5 Mt). Operationalisierung ergaenzt (POST-HOC, RF-6); sie ist strukturell zugunsten des breiten Korridors verzerrt.

- Naeher am Expertenrat-Korridor: A analytisch, A Bootstrap, A ARIMA, B ARIMA (Abstand 50,6 gegenueber 155,1 zur Bundesregierungs-Angabe).
- Naeher an der Bundesregierungs-Angabe: B analytisch und B Bootstrap (Overshoot 25,0; Abstand 29,5 gegenueber 35,0 zum Korridor).
- Bei den A-Zeilen liegt der eigene Wert weit von beiden Angaben entfernt (Abstand zum Korridor 484 bzw. 166 Mt); "naeher" ist dort bedeutungslos und wegen des Niveausprungs ohnehin nicht trendinterpretierbar.

---

## 3. Limitationen

- H1 2026 ist eine vorlaeufige Agora-Schaetzung; H1 2025 wurde aus gerundeten Angaben abgeleitet.
- Die lineare OLS-Fortschreibung ist ein statistisches Konstrukt, nicht die Compliance-Methodik des Expertenrats (sektorale Ziele, LULUCF-Sonderregeln, Uebertragsmechanismen). Die 60-100 Mt des Expertenrats beziehen sich auf einen "50/50-Emissionspfad".
- **Linearitaet:** Fenster A verletzt sie deutlich (Residuenkruemmung, Residuum 2025 = -55,4 Mt, Niveausprung +40,9 Mt); die A-Zeilen sind Modellartefakte-anfaellig.
- **Autokorrelation:** Fenster A signifikant (DW 0,65); bei B und C geringe Teststaerke (n = 11 bzw. 6); ACF Lag 2 in B auffaellig, nicht belastbar.
- **Intervallarten** sind nicht gleichartig (Parameter vs. Prognose). Die Parameterintervalle sind keine Intervalle fuer die tatsaechliche Summe.
- Der Block-Bootstrap haengt von Blocklaenge (2, im Amendment vorgegeben) und Seed ab; die HAC-Breite in A haengt von den sandwich-Voreinstellungen ab (Prewhitening).
- Fenster B (n = 11) und C (n = 6): breite Intervalle; C rein deskriptiv.
- Systemgrenze von Agora nur indirekt belegt; Quelle 3 (FAZ) nicht abrufbar; Quelle 5 nur sekundaer ueber Quelle 4.
- Die 625 ist als Agora-Wert nicht durch Primaerdokumente belegt (Anlage 2 KSG: 604 Mt).
- Keine Kausalaussage, keine politische Bewertung.

---

## Aenderungen nach Validierung (Fassung 1 -> Fassung 2)

Grundlage: `Validierungsbericht_expertenrat-budgetabgleich.md` (Commit-Stand 78250e3). Je Befund:

| Befund | Status | Aenderung |
|---|---|---|
| **K1** ARIMA-Kovarianz | erledigt | Fehler: `convolve(ar_poly, c(1,-1), type="open")` kehrt das zweite Argument um (alternierende psi-Gewichte). Ersetzt durch eigene Polynommultiplikation `polymul()` mit Unit-Test. Neue Kontrollen: Random-Walk-Formel (sigma^2 * h(h+1)(2h+1)/6) und Monte-Carlo-Simulation (10000 Pfade); die alte Diagonalenkontrolle war blind. Alle ARIMA-Zeilen, Tabellen, Grafik und Text neu. **Alte (falsche) ARIMA-Intervalle:** Overshoot A 173,1-359,5; B 35,3-265,9; C 390,0-660,5. **Neu:** A -132,7 bis 665,4; B -343,1 bis 644,3; C -53,9 bis 1104,4 (Punktwerte unveraendert). Die Klassifikation nach Punktwert aendert sich nicht; jede Aussage aus Fassung 1, die auf der Breite der ARIMA-Intervalle beruhte, war falsch. |
| **W1** SAP-Bestaetigung | erledigt (Fassung 4: vollstaendig) | Verweis auf `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md`. Fassung 2/3 nannten noch die fehlende Antwort zu 6a/6b; ueberholt: Die Antworten zu den Offenen Punkten 6a ("Limitation reicht") und 6b (Datenquellen-Zeile 5 bestaetigt) liegen vor (Daniel Saure, 23.10.2026); das SAP-Erratum 1 (`SAP_Erratum_1_Expertenrat-Budgetabgleich-2030.md`) wurde freigegeben (Commit d20e448). Dokumentiert in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` (Abschnitt "Ergaenzung") und im Erratum. SAP, Bestaetigungsdatei und Erratum wurden nicht von mir geaendert. |
| **W2** 625-Variante | erledigt | Aus Hauptbericht, Hauptgrafik und Haeufigkeitszaehlung entfernt, in Anhang A verschoben. Wortlaut korrigiert (Agora-Wert fuer 2026, Anlage 2 KSG = 604 Mt, moegliche Anpassung nach Par. 4 Abs. 2 KSG nur plausibel, nicht belegt). Aussage "SAP schreibt Parallelrechnung vor" zurueckgenommen (SAP 6.3 nicht ausgeloest). Erratum-Hinweis im Abweichungsprotokoll; SAP nicht veraendert. |
| **W3** Interpretation | erledigt | Kernaussage mit Spanne +25 bis +584 Mt und Intervallueberdeckung vorangestellt; Niveausprung +40,9 Mt und Residuum 2025 genannt; Spalte "Klassifikation (nur Punktwert)"; kein verbales "naeher" fuer A-Zeilen. |
| **W4** Diagnostik | erledigt | Linearitaets- und ACF-Interpretation je Fenster (2.1) und als Limitation. Keine neuen Modelle. |
| **W5** Intervallarten | erledigt | Spalten "Parameterintervall" / "Prognoseintervall"; POST-HOC-Prognoseintervall fuer OLS (unabhaengige Fehler) separat (2.4), mit Gueltigkeitsvermerk fuer A. SAP-Methoden unveraendert. |
| **G1** Grafiken | erledigt | Alle visuell geprueft. Estimand 1: Untertitel umbrochen, Balkenwerte sichtbar. Estimand 2: Hauptgrafik nur primaer, Legende fuer Korridor, Budget und Bundesregierung, Hinweis zur Skala (-4,5 liegt praktisch auf der Nulllinie; das bleibt eine Skalengrenze), Intervalltypen farbig, C als "deskriptiv" im Label; 625 in eigene Anhangsgrafik. Trendgrafik: Legende fuer beobachtete Reihe, Annotation Niveausprung. |
| **G2** Bootstrap | erledigt | Monte-Carlo-Fehler genannt, Bootstrap-Grenzen in ganzen Mt, POST-HOC-Sensitivitaet Blocklaenge 4 und B = 10000. Seed/Blocklaenge im Abweichungsprotokoll. Primaer bleibt Blocklaenge 2 / Seed 20260827 / B = 2000 (Hauptergebnisse identisch zu Fassung 1). |
| **G3** HAC | erledigt | Abhaengigkeit von Prewhitening mit Zahlen genannt (2.4); NW-p bei B als nicht belastbar kommentiert. |
| **G4** Estimand 1 | erledigt | Rundungsspanne der H1-Rate (-1,95 % bis -2,24 %) und beobachtete Mittelraten als Fussnote; Agora-Zuordnung zum Preiseffekt als Quellenzitat. |
| **G5** UBA-Suchprotokoll | teilweise | UBA- und AGEB-Seiten durchsucht und protokolliert (keine Halbjahres-Gesamt-THG-Reihe); keine Tiefensuche in PDF-Anhaengen. |
| **G6** Darstellung/Dateien | erledigt | Klammer-Klassifikation bei C entfernt; SHA256SUMS festgeschrieben und vom Skript nur verglichen (Format `sha256sum -c`-kompatibel). Einmaliges Neuanlegen wegen neuer Rohdateien dokumentiert. |
| Nachpruefung | Nachpruefung 1 liegt vor (Nachtrag 1 im Validierungsbericht); Fassung 3 behebt N2.1-N2.4 | Eine fokussierte Pruefung der Fassung 3 durch den validator steht aus (CLAUDE.md). |

### Fassung 3 (Behebung der Befunde N2.1-N2.4 aus Nachtrag 1)

| Befund | Status | Aenderung |
|---|---|---|
| **N2.1** Beschreibung POST-HOC-Prognoseintervall | erledigt | Beschreibung an die tatsaechliche Rechnung angepasst (Parametervarianz aus dem analytischen Verfahren, in A HAC, plus 5 sigma^2 OLS-Restvarianz, Annahme unabhaengiger Restfehler). Rechnung selbst unveraendert. Zusaetzlich beide Varianten fuer A ausgewiesen (HAC: 17,1-1151,3; OLS-Parametervarianz: 382,3-786,1; neue Spalten in der CSV). Als POST-HOC und deskriptiv gekennzeichnet; Mischung in A als inkonsistent benannt. |
| **N2.2** Seed-Beschriftung | erledigt | Spalte umbenannt in `Seed_Neustart`, neue Spalte `Hinweis`; Erlaeuterung in 2.4 (Hauptlauf verbraucht einen Strom der Reihe nach, nur Fenster A stimmt ueberein). Keine Zahl geaendert. |
| **N2.3** Grafiken | erledigt | `estimand2_overshoot.png`: Bundesregierung (-4,5) als Marker mit Beschriftung ueber der obersten Zeile (Skala unveraendert), rechter Rand mit Abstand, die x-Skala ist nicht mehr abgeschnitten. `estimand2_trend_bis_2030.png`: Annotation mit Pfeil am Niveausprung. `estimand1_h1_vs_cagr.png`: Dezimalkomma in Balkenwerten und Achse. `anhang_625_overshoot.png` entsprechend. Alle Grafiken mit dem Read-Tool visuell geprueft. Dass -4,5 auf der Skala von rund 1500 Mt neben der Nulllinie liegt, bleibt eine Skalengrenze und ist ausdruecklich beschriftet. |
| **N2.4** Kontrollgrenzen | erledigt | Zusatzkontrollen fuer simulierte ARIMA(1,1,0)- und (0,1,1)-Reihen (je zwei Parametrisierungen) plus (0,1,0): Monte-Carlo mit eigenen Seeds und 20000 Pfaden, geschlossene psi-Formeln, Diagonale gegen `forecast()` (2.3). Hinweis zum identischen Verhaeltnis 1,008 (gleicher Seed) aufgenommen. Die Zusatzkontrollen laufen mit gesichertem und wiederhergestelltem Zufallsstrom, daher bleiben die Hauptergebnisse identisch. |
| Zahlen | unveraendert | Keine Kernzahl hat sich geaendert (Punktwerte, Overshoot-Intervalle, Diagnostik, ARIMA-Intervalle gleich); neu sind nur die zusaetzlichen Spalten/Dateien (`Parametervarianz_Quelle`, `_OLSparam`, `Seed_Neustart`, `Hinweis`, `arima_kontrollen_zusatz.csv`). Pruefsummenvergleich der Rohdaten: alle 24 Dateien unveraendert. |

---

## Anhang A: Formalrechnung mit 2025 = 625 im Datensatz (POST-HOC, ohne Aussagewert, nicht SAP-erforderlich)

625 Mt ist kein Emissionswert fuer 2025 (siehe Abschnitt 0). Die Rechnung ersetzt den beobachteten 2025-Wert im Datensatz (und damit im Regressionsfit) durch diesen Wert und beantwortet keine sinnvolle Frage. Sie steht nur zur Dokumentation der in Fassung 1 gerechneten Zeilen. Kum_Ist_2021_2025 = 3456,2 Mt. Diagnostik: DW A 0,598 (1,0e-07), B 1,915 (0,294), C 1,841 (0,176); Shapiro-Wilk 0,697 / 0,955 / 0,724; Residuum 2025 in A: -76,7 Mt; Niveausprung A +62,1 Mt.

| Fenster | Methode | Overshoot | 95 %-Intervall (Overshoot) | Punkt-Klassifikation |
|---|---|---|---|---|
| A | analytisch (HAC) | 546,1 | -403,6 - 1495,7 | pessimistischer |
| A | Bootstrap | 546,1 | 386,5 - 702,6 | pessimistischer |
| A | ARIMA(0,1,0) mit Drift | 113,1 | -284,1 - 510,4 | pessimistischer |
| B | analytisch (OLS) | -53,0 | -274,1 - 168,2 | optimistischer |
| B | Bootstrap | -53,0 | -226,5 - 121,8 | optimistischer |
| B | ARIMA(0,1,0) mit Drift | -28,1 | -506,4 - 450,3 | optimistischer |
| C (deskriptiv) | analytisch | 1,4 | -565,5 - 568,4 | - |
| C (deskriptiv) | Bootstrap | 1,4 | -202,1 - 353,6 | - |
| C (deskriptiv) | ARIMA(0,1,0) | 382,2 | -218,8 - 983,3 | - |

Dateien: `output/anhang_625_tabelle.csv`, `output/anhang_625_overshoot.png`, `output/anhang_625_diagnostik_*.png`. Diese Zeilen gehen in keine Haeufigkeitszaehlung ein. Veroeffentlichungen duerfen die Aussage "FAZ/Agora nennen 625 Mt als 2025-Wert" nicht uebernehmen.

**Verwendungsvermerk (Daniel Saure, 23.10.2026):** Anhang A bleibt als Audit-Trail im Repo, geht aber NICHT in Blog, Kapitel oder Kanaltexte.

---

## Dateien

- Skript: `expertenrat-budgetabgleich.R`; Log: `run_log.txt`
- Tabellen: `output/estimand1_tabelle.csv`, `output/estimand2_tabelle.csv`, `output/diagnostik_tabelle.csv`, `output/arima_kontrollen.csv`, `output/posthoc_*.csv`, `output/datenabgleich_basiszeitreihe.csv`, `output/systemgrenzen_check.csv`, Anhang: `output/anhang_625_*`
- Grafiken: `output/estimand1_h1_vs_cagr.png`, `output/estimand2_overshoot.png`, `output/estimand2_trend_bis_2030.png`, `output/diagnostik_primaer_*.png`
- Rohdaten und Pruefsummen: `rohdaten/`, `rohdaten/SHA256SUMS.txt`

### Fassung 4 (Behebung der Auflagen N3.1-N3.3 aus Nachtrag 2)

| Befund | Status | Aenderung |
|---|---|---|
| **N3.1** Widerspruch zu Erratum/6a/6b | erledigt | Kopf und Tabelle W1 des Berichts sowie das Abweichungsprotokoll (RF-1-Nachtrag, Offene Punkte 2 und 3, Schlusszeile) angeglichen: Die Antworten zu den Offenen Punkten 6a ("Limitation reicht") und 6b (Datenquellen-Zeile 5 bestaetigt) liegen vor (Daniel Saure, 23.10.2026); das SAP-Erratum 1 (`SAP_Erratum_1_Expertenrat-Budgetabgleich-2030.md`) wurde freigegeben (Commit d20e448). Dokumentiert in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` (Abschnitt "Ergaenzung") und im Erratum. Die Bestaetigungsdatei (von Daniel Saure/Top-Level-Session bereits ergaenzt) und das Erratum wurden nicht geaendert. |
| **N3.2** Erklaerung Fenster C | erledigt | Formulierung korrigiert (2.4): Die Naehe der C-Sensitivitaetszeile zum Hauptlauf ist eine Diskretisierungswirkung bei n = 6 (wenige moegliche Ziehungen), kein Zufall. |
| **N3.3** Achsenmarken | erledigt | `estimand2_overshoot.png` (und `anhang_625_overshoot.png`) haben jetzt Marken alle 200 Mt, darunter -400 und -200. Grafik mit Read visuell geprueft. |
| Zahlen | unveraendert | Keine Kernzahl geaendert; Skript erneut gelaufen (Exit 0), Pruefsummenvergleich: alle 24 Dateien unveraendert. |
