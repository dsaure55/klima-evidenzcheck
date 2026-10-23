# Validierungsbericht: Expertenrat-Budgetabgleich 2030

**Gepruefter Stand:** Commit 78250e3 (Analyse vom 23.10.2026, "nicht validiert, nicht freigegeben")
**Gepruefte Dateien:** SAP v1.1, `expertenrat-budgetabgleich.R`, `run_log.txt`, Analysebericht, Abweichungsprotokoll, `output/*`, `rohdaten/*` (alle unter `Analysen/2026-08-expertenrat-budgetabgleich/`)
**Rolle:** unabhaengiges Statistik-Review (validator). SAP, Skript und Analysebericht wurden nicht veraendert. Kein Commit, kein Freigabevermerk.
**Pruefdatum:** 23.10.2026

## Gesamteinschaetzung

**NICHT FREIGABEFAEHIG in der vorliegenden Fassung** (1 kritischer Befund). Nach Behebung von K1 und Umsetzung der wesentlichen Auflagen (W1-W5) halte ich die Analyse fuer **freigabefaehig mit Auflagen**. Dazu ist eine fokussierte Nachpruefung noetig, die als eigene Datei festgehalten wird (CLAUDE.md, Dokumentationspflicht bei Nachkontrollen).

**Befunde: 1 kritisch, 5 wesentlich, 6 gering.**

Was gut ist: Basiszeitreihe, OLS-Punktwerte, Overshoot-Werte, analytische und Bootstrap-Intervalle, DW/Shapiro, CAGR und H1-Rate habe ich unabhaengig reproduziert, sie stimmen. Die Quellenzahlen (6199, 6194,5, 4,5, 60-100, 327, 7, 635) stehen so in den Primaerquellen. Abweichungen vom SAP sind weitgehend offen gekennzeichnet. K1 ist ein Implementierungsfehler in einer Teilrechnung (ARIMA-Intervall), kein Konzeptfehler.

## Ampel je Pruefpunkt

| # | Pruefpunkt | Ampel |
|---|---|---|
| 1 | SAP-Konformitaet | Abweichung (W2, G6; SAP selbst inkonsistent, W1) |
| 2 | Diagnostik | Abweichung (K1 betrifft ARIMA-Varianz; W4 Linearitaet nicht interpretiert; G3) |
| 3 | Mehrfachtestung / Cherry-Picking | bestanden mit Hinweis (alles berichtet; Hinweis W2 zur 625-Variante) |
| 4 | Rechenpruefung | **kritisch** (K1), sonst bestanden |
| 5 | Limitationen sichtbar | Abweichung (stehen in Bericht Abschnitt 3, aber nicht bei den Ergebnissen: W3, W4, W5) |
| 6 | Rundung / Darstellung | Abweichung gering (G1, G6) |

---

## 1. Rechenpruefung und Kernzahlen

**Vorgehen:** (a) Skript in einer Kopie (Scratchpad) neu ausgefuehrt: `estimand1_tabelle.csv`, `estimand2_tabelle.csv`, `diagnostik_tabelle.csv` byte-identisch, `run_log.txt` identisch bis auf den Zeitstempel. (b) Unabhaengig davon eigene R-Berechnung, die die Reihe aus der API-Rohdatei (`kd_api_emissions_DE.csv`, Summe der UBA-THG-Zeilen) ableitet, nicht aus dem Altskript. Der identische Neulauf beweist nur Determinismus, nicht Richtigkeit (K1 wird exakt reproduziert).

| Groesse | Bericht | Eigene Berechnung | Ergebnis |
|---|---|---|---|
| UBA-Reihe 1990-2025 | 36 Werte | 36 Werte aus API-Summe, identisch auf 2 Nachkommastellen | bestanden |
| Kum. Ist 2021-2025 | 3480,1 | 3480,08 | bestanden |
| Budget 2021-2030 | 6199 | KSG Anlage 2 (gesetze-im-internet.de, BGBl. 2024 I Nr. 235): 786+756+720+682+643+604+565+523+482+438 = 6199 | bestanden |
| Projektionssumme / Puffer | 6194 / 4,5 | ERK-Tabelle: 6194,5 gegen 6199, Unterschreitung -4,5 | bestanden |
| OLS 2026-2030, A | 689,7 / 675,2 / 660,6 / 646,1 / 631,5 (Summe 3303,1) | identisch | bestanden |
| OLS 2026-2030, B | 605,7 ... 491,8 (Summe 2744,0) | identisch | bestanden |
| OLS 2026-2030, C | 618,9 ... 524,2 (Summe 2857,7) | identisch | bestanden |
| Overshoot A (analytisch, Bootstrap) | +584,2 | +584,2 | bestanden |
| Overshoot B (analytisch, Bootstrap) | +25,0 | +25,0 | bestanden |
| Overshoot ARIMA A / B / C | +266,3 / +150,6 / +525,2 | +266,3 / +150,7 / +525,3 (auto.arima (0,1,0), Drift in A/B) | Punktwerte bestanden |
| Analytisches 95%-Intervall A (HAC) | 38,9 - 1129,5 | 38,9 - 1129,5 (NeweyWest, prewhite = TRUE) | bestanden (G3) |
| Analytisches 95%-Intervall B | -202,7 - 252,8 | -202,7 - 252,8 | bestanden |
| Bootstrap-Intervall A / B | 429,0-737,3 / -158,9-201,4 | 434,9-738,3 / -155,2-193,1 (anderer Seed) | im MC-Fehler bestanden |
| **ARIMA-Intervall (Summe)** | A 173,1-359,5; B 35,3-265,9; C 390,0-660,5 | A **-132,7-665,4**; B **-343,0-644,3**; C **-53,9-1104,4** | **kritisch (K1)** |
| DW (p) | A 0,648 (<0,0001); B 1,937 (0,308); C 1,933 (0,215) | 0,648 (3,8e-7); 1,937 (0,308); 1,933 (0,214) | bestanden |
| Shapiro-Wilk p | 0,687 / 0,450 / 0,502 | 0,687 / 0,450 / 0,502 | bestanden |
| CAGR_A / CAGR_B | -1,543 % / -3,641 % | identisch | bestanden |
| H1-Rate | -7/334 = -2,096 % | -2,0958 % | bestanden |
| Publizierte 2040-Projektion | A 486,0; B 207,0 | A 486,03; B 207,04 | **korrekt reproduziert** |
| Rundungsspanne H1-Rate (nicht berichtet) | - | 7 +/- 0,5 Mt: -1,95 % bis -2,24 % | Klassifikation unveraendert (Abstand >= 0,9 pp) |

Zusaetzlich verifiziert: Das SAP-Amendment THG-Laendervergleich verwendete `block_len = 2` und `set.seed(20260827)` (`thg-laendervergleich.R`, Zeilen 160, 166); RF-4 stimmt. Konsistenzcheck der Reihe: Summe der KSG-Jahresmengen 2021-2025 = 3587, minus Ist 3480,1 = 106,9; der Expertenrat nennt 106,7 Mt Unterschreitung (Diff. 0,2 Mt).

---

## 2. Befunde

### KRITISCH

#### K1 - ARIMA-Intervall der Summe ist um den Faktor ca. 4 zu schmal (Vorzeichenfehler in der Kovarianzkonstruktion)

**Wo:** `expertenrat-budgetabgleich.R`, Funktion `arima_summe()`, Zeile 396: `ar_poly <- convolve(ar_poly, c(1, -1), type = "open")`. Betrifft alle ARIMA-Zeilen in Analysebericht 2.2 und 2.3, `estimand2_overshoot.png` und `estimand2_tabelle.csv` (Spalten KI_unten, KI_oben, Overshoot_KI_*).

**Was:** Die R-Funktion `convolve(x, y, type = "open")` kehrt das zweite Argument um. `convolve(1, c(1,-1), type="open")` ergibt `c(-1, 1)` statt `c(1, -1)`. Der AR-Koeffizient der Differenzierung wird dadurch als phi = -1 statt +1 gelesen, die psi-Gewichte alternieren (+1, -1, +1, ...) statt konstant 1 zu sein. Die Diagonale der Kovarianzmatrix (psi zum Quadrat) bleibt identisch, die Nebendiagonalen bekommen das falsche Vorzeichen. Die eingebaute Kontrolle (`kontrolle_diag`, 1e-14) vergleicht nur die Diagonale gegen `forecast()` und ist blind fuer genau diesen Fehler. In allen drei Fenstern waehlt auto.arima ARIMA(0,1,0) (Random Walk, mit Drift in A und B): die Prognosefehler 2026-2030 sind stark positiv korreliert, die Varianz der Summe ist sigma^2 * 55, nicht ca. sigma^2 * 5.

**Beleg (eigene Rechnung auf zwei Wegen):**
- Analytisch: Var(Summe) = sigma^2 * Summe_ij min(i,j) = 55 sigma^2. Standardabweichung der Summe primaer: A 203,6, B 251,9, C 295,5. Aus den Berichtsintervallen folgt dagegen 47,5 / 58,8 / 69,0, exakt das Ergebnis der fehlerhaften Formel.
- Simulation (`simulate(fit, nsim = 5, future = TRUE)`, 20000 Laeufe, Fenster B): sd der Summe = 253,0. Das passt zur korrekten Formel (251,9), nicht zum Bericht (58,8).

**Korrigierte ARIMA-Intervalle (Primaer, 2025 = 648,83; Punktwerte unveraendert):**

| Fenster | Overshoot | Bericht (falsch) | korrekt (eigene Rechnung; Normalapproximation wie SAP, ohne Unsicherheit des Drift-Parameters) |
|---|---|---|---|
| A | 266,3 | 173,1 - 359,5 | -132,7 - 665,4 |
| B | 150,6 | 35,3 - 265,9 | -343,0 - 644,3 |
| C | 525,2 | 390,0 - 660,5 | -53,9 - 1104,4 |

(Formale 625-Variante: A 113,1 [-284,1; 510,4], B -28,1 [-506,4; 450,2], C 382,2 [-218,8; 983,3].)

**Folge:** Der Bericht zeigt derzeit, dass die ARIMA-Intervalle in A den Korridor und die Null klar ausschliessen und in B nur knapp ueber Null liegen. Das stimmt nicht. Korrekt ueberdecken alle ARIMA-Intervalle gleichzeitig den Korridor 60-100, die Bundesregierungsangabe (-4,5) und die Null. Die punktbasierte Klassifikation aendert sich nicht, aber jede Aussage, die auf der Breite des ARIMA-Intervalls beruht, ist falsch, ebenso die Grafik. Fuer eine Veroeffentlichung ist das relevant, weil die ARIMA-Balken die einzigen Prognoseintervalle im Bericht sind.

**Behebung (nicht durch mich):** Polynommultiplikation korrekt schreiben, z. B. `ar_poly <- c(ar_poly, 0) - c(0, ar_poly)` oder `convolve(ar_poly, rev(c(1,-1)), type = "open")`. Kontrolle um eine Nebendiagonalen-Pruefung erweitern (Vergleich von sum(Sigma) mit Simulation oder mit 55 sigma^2 fuer ARIMA(0,1,0), h = 5). Tabellen, Grafik und Bericht (2.2, 2.3) neu erzeugen und im Abweichungsprotokoll Fehler samt Korrektur eintragen. Die alte Version bleibt im Git-Verlauf, die Korrektur wird als eigener Commit dokumentiert, nicht still ueberschrieben.

---

### WESENTLICH

#### W1 - SAP-Text intern widerspruechlich; Gueltigkeit von v1.1 muss der Mensch ausdruecklich bestaetigen (RF-1)

**Wo:** SAP Zeilen 8-11 (Header, Klammer bricht mitten im Satz ab), Zeile 19 ("Status: draft - noch NICHT eingefroren"), Zeilen 706-722 (Offene Punkte Nr. 6 "NOCH OFFEN"), Zeilen 724-727 ("Verbleibend vor dem Einfrieren ...").

**Bewertung:** Ich teile die Einschaetzung des Analysten, dass nach Header und Commit d9215cb (Commit-Text: "Volltext von Daniel Saure vollstaendig gelesen und freigegeben") gearbeitet werden durfte, und dass er die Inkonsistenz gemeldet statt still entschieden hat. Ich kann aber nicht pruefen, ob der Volltext tatsaechlich gelesen wurde (Verifikationspflicht aus CLAUDE.md). Das Diff von d9215cb zeigt: Der Header wurde ausgetauscht und Antworten wurden eingearbeitet, die Entwurfsbausteine (Status draft, Offene Punkte 6) blieben stehen, der Header-Satz bricht ab. Das spricht eher fuer einen schnellen Header-Austausch als fuer eine vollstaendige Redaktion.

**Auflage:** Der Mensch bestaetigt selbst schriftlich (z. B. Zeile im Abweichungsprotokoll): (a) v1.1 gilt, (b) Nr. 6a (Pruefbericht-Fund als Limitation, kein Blocker) und 6b (Quelle 5 Bundesregierung als Kontextzeile) sind wie umgesetzt entschieden. Den eingefrorenen SAP nicht still bearbeiten; Fehler darin (W2) als datiertes Erratum/Amendment fuehren.

#### W2 - RF-2 (625 Mt): Kernbefund richtig, Formulierung ungenau; die 625-Parallelrechnung ist nicht SAP-vorgeschrieben und gehoert nicht gleichrangig in den Hauptteil

**Sachpruefung:** Agora (Pressemitteilung 28.08.2026 und Halbjahresseite, `rohdaten/agora/`) schreibt: "Deutschlands Emissionshoechstgrenze laut Klimaschutzgesetz fuer 2026 ist auf 625 Millionen Tonnen CO2-Aeq festgelegt", die Hochrechnung 2026 liege bei 635 Mt, "13 Mt weniger als 2025". 625 ist damit kein Emissionswert fuer 2025. Die SAP-Annahme (Abschnitte 1, 3 Zeile 3, 4a.1, 4a.2, 6.3) ist falsch. Das teile ich.

**Praezisierung, die der Analyst uebersehen hat:** Anlage 2 KSG (BGBl. 2024 I Nr. 235, von mir bei gesetze-im-internet.de abgerufen) nennt fuer 2026 **604 Mt** (2025: 643 Mt). Die 625 sind also nicht der Gesetzeswert der Anlage 2, sondern nach meiner Rekonstruktion die nach Paragraph 4 Abs. 2 KSG vom UBA **angepasste** Jahresmenge (604 + 106,7/5 = 625,3; Rekonstruktion von mir, nicht belegt). Agora deutet das in Fussnote 2 an ("Angepasst nach KSG, Paragraph 4 (2)"); der Expertenrat meldet zum UBA-Anpassungsverfahren ausdruecklich Klaerungsbedarf (ERK-Bericht Kap. 6.2). In `rohdaten/expertenrat/bericht.txt` kommt die Zahl 625 nicht vor, Agora ist die einzige Quelle. Die Formulierung "gesetzliche Emissionshoechstgrenze (KSG) fuer das JAHR 2026" (Skript Z. 253 und 427, Bericht Abschnitt 0 und 2.3, Protokoll RF-2) sollte lauten: "von Agora als gesetzliche Hoechstgrenze 2026 genannter Wert (nach Paragraph 4 Abs. 2 KSG angepasste Jahresmenge; Anlage 2 KSG selbst: 604 Mt)".

**Folgen fuer die Estimands:**
- Estimand 1: keine Folge. Nach SAP 4a.2 wird ohnehin 648,83 verwendet; die 2025-Zahl geht nur ueber die gefitteten Modelle A/B ein.
- Estimand 2: Die Primaerrechnung mit 648,83 ist richtig und ausreichend. Es gibt keinen alternativen 2025-Emissionswert, die Regel 4a.2 greift ins Leere. Die Bedingung in SAP 6.3 ("Bei ungeklaerter 2025-Basiswert-Diskrepanz") ist nach der Klaerung gerade **nicht** erfuellt (die Diskrepanz ist geklaert: andere Groesse). Die Aussage in Bericht und Protokoll, der SAP schreibe die Parallelrechnung vor, ist daher zu stark. Es ist eine zusaetzliche, nicht SAP-erforderliche Rechnung.
- Die "625-Variante" ersetzt den beobachteten 2025-Wert im Datensatz (und damit im Regressionsfit) durch einen Zielwert und beantwortet keine sinnvolle Frage. Problem der Darstellung: Sie steht im Hauptteil (Bericht 2.3), hat in `estimand2_overshoot.png` ein eigenes **oberes** Panel gleicher Groesse und geht in die Haeufigkeitszaehlung im Skriptlog ein (primaer 4 pessimistisch / 2 optimistisch, 625-Variante 3 / 3). Dabei kippt eine Methode von "pessimistischer" nach "optimistischer". Das erweckt den Eindruck einer Robustheitsanalyse, die keine ist, und vergroessert die Zahl der Vergleiche (SAP 7).

**Bewertung der berichteten Behandlung:** "Primaer 648,83, formal zusaetzlich 625, gekennzeichnet als nicht belastbar" ist transparent und vertretbar, aber nicht optimal. Die Kennzeichnung ist vorhanden (gut).

**Auflage:** (1) 625-Variante in einen klar abgesetzten Anhang ("Formalrechnung ohne Aussagewert, nicht SAP-erforderlich, post-hoc") verschieben und aus Hauptgrafik und Haeufigkeitszaehlung entfernen; ich bevorzuge, sie ganz zu streichen und im Bericht kurz zu begruenden, warum 6.3 nicht ausgeloest wurde. Entscheidung beim Menschen. (2) Wortlaut zur 625 korrigieren (s. o.). (3) SAP-Fehler als Erratum festhalten. Die Veroeffentlichung darf die Aussage "FAZ/Agora nennen 625 Mt als 2025-Wert" nirgends uebernehmen.

#### W3 - Interpretation Estimand 2: Fenster A ist als Extrapolation strukturell verzerrt; "kein Punktwert im Korridor" ist ohne Intervallkontext irrefuehrend

**Wo:** Bericht 2.2 (Satz "Im primaeren Lauf liegt kein Punktwert innerhalb des Korridors"), 2.4, Grafik `estimand2_trend_bis_2030.png`.

(a) Modell A (1990-2025) liegt 2025 bei 704,3 Mt, beobachtet sind 648,8 (Residuum -55,4 Mt). Die Fortschreibung startet 2026 bei 689,7 Mt, also **41 Mt ueber dem beobachteten 2025-Wert** (+6,3 %). Die Grafik zeigt diesen Sprung deutlich, der Bericht kommentiert ihn bei Estimand 2 nicht (nur bei Estimand 1 steht ein Nebensatz). Ein erheblicher Teil des A-Overshoots (+584 Mt) stammt aus diesem Niveausprung, nicht aus einer Aussage ueber das Tempo. Eine Fortschreibung, die hoeher beginnt als der letzte Beobachtungswert, ist kein "pessimistischeres Szenario" im Sinne einer Trendaussage, sondern ein Modellartefakt (Nichtlinearitaet, siehe W4). Dass ARIMA mit Ankerpunkt 2025 nur +266 statt +584 liefert, zeigt die Abhaengigkeit.

(b) "Kein Punktwert im Korridor" ist wahr, aber nach Korrektur von K1 enthalten 8 von 9 Primaer-Intervallen den Korridor; nur das Bootstrap-Intervall A (429-737, reine Parameterunsicherheit, Blocklaenge 2, siehe G2) schliesst ihn aus. B-analytisch und B-Bootstrap enthalten gleichzeitig Korridor, Null und -4,5. Die SAP-Klassifikation ist punktbasiert und formal zulaessig; wer daraus "optimistischer/pessimistischer als Expertenrat" liest, liest mehr hinein, als die Daten tragen.

(c) Die Abhaengigkeit von Fenster und Methode wird berichtet (Bericht 2.4 letzter Satz, Protokoll Ende), eine Hauptkombination wird nicht gewaehlt. Das ist gut. Es fehlt eine ausdrueckliche Kernaussage in Klartext vor den Tabellen: "Die Spanne der eigenen Fortschreibung reicht von +25 bis +584 Mt (Punktwerte); die Analyse erlaubt keine belastbare Aussage, ob der Expertenrat-Korridor getroffen wird."

**Auflage:** (a) Niveausprung 2025 -> 2026 in Fenster A (+41 Mt) und das Residuum 2025 bei Estimand 2 benennen; Zeile A als nicht trendinterpretierbar einordnen. (b) Spaltenueberschrift "Klassifikation (nur Punktwert)" und ein Satz zur Intervallueberdeckung. (c) Spanne +25 bis +584 voranstellen. Kein verbales "naeher am Expertenrat" fuer A-Zeilen (siehe RF-6).

#### W4 - Diagnostik: Linearitaetspruefung durchgefuehrt, aber nicht interpretiert; Fenster A zeigt systematische Kruemmung

**Wo:** SAP 5.2 verlangt Residuen-vs-Fitted (Linearitaet), DW, ACF, Shapiro-Wilk. Das Skript erzeugt alle (`output/diagnostik_*.png`), der Bericht 2.1 wertet aber nur DW und Shapiro-Wilk aus; zu den Plots steht nur ein Verweis.

**Befund (Sicht auf `diagnostik_primaer_A.png`):** Die Residuen von Fenster A zeigen ein ausgepraegtes umgekehrtes U (positiv in der Mitte, deutlich negativ an beiden Enden, 2025: -55 Mt). Das ist eine klare Linearitaetsverletzung, die die Extrapolation direkt betrifft (W3). Der ACF liegt bei Lag 1 um 0,6 und bei Lag 2 um 0,35 (ueber der Schranke). In Fenster B liegt der ACF bei Lag 2 (ca. -0,7) knapp ausserhalb der Schranke; bei n = 11 nicht belastbar, aber nicht erwaehnt.

**Richtig gemacht:** DW A = 0,648 (p < 0,0001) wird als signifikant berichtet, Newey-West wurde tatsaechlich angewendet (Skript Z. 479-481: `Vc <- if (hac_noetig) NeweyWest(modell) else vcov(modell)`, in die Summenvarianz eingeflossen, von mir reproduziert). Bei B/C ist keine signifikante Autokorrelation berichtet, und der Bericht sagt korrekt, dass der DW-Test bei n = 11 geringe Teststaerke hat und "nicht signifikant" keine Unabhaengigkeit belegt. Fuer C (n = 6) steht der Hinweis nur in der Limitationenliste; dort ergaenzen.

**Auflage:** In Bericht 2.1 je Fenster eine Zeile zu Linearitaet und ACF (A: Kruemmung, Residuum 2025; B/C: kein klares Muster, n zu klein). Die Linearitaetsverletzung in A als Limitation direkt bei Estimand 2 sichtbar machen, nicht nur im allgemeinen SAP-Abschnitt 9.

#### W5 - Intervalle der drei Verfahren sind nicht gleichartig (RF-3); die Estimand-2-Frage betrifft aber die tatsaechliche Summe, nicht den Erwartungswert

**Bewertung RF-3:** Ich teile die Einschaetzung. Analytisch (Var = 1^T X0 V X0^T 1) und residualer MBB erfassen nur die Unsicherheit der geschaetzten Trendparameter, nicht die Streuung kuenftiger Jahreswerte um den Trend. ARIMA (nach Korrektur K1) enthaelt die Prognoseunsicherheit. Der Bericht sagt das in 2.2, in der Limitationenliste und in den Grafik-Untertiteln (gut). Aber: Estimand 2 fragt, ob die kumulative Emissionsmenge im oder ueber dem Korridor liegt; dafuer waere ein Prognoseintervall der tatsaechlichen Summe die inhaltlich passende Groesse. Die Spaltenueberschrift "95%-Intervall" suggeriert Vergleichbarkeit.

**Eigene Zusatzrechnung (nicht im SAP, nur zur Einordnung):** Prognoseintervall der Summe bei unabhaengigen Fehlern (Parameterfehler plus 5 sigma^2), Overshoot: A [382; 786], B [-234; 284], C [-460; 737]. Fuer A ist dieses Intervall wegen der starken Autokorrelation (DW 0,65) zu optimistisch; fuer B nur wenig breiter als das SAP-Intervall [-203; 253], weil die Parameterunsicherheit (Extrapolation) dominiert.

**Auflage:** SAP-Methoden unveraendert lassen (Regel 2). Spaltenueberschriften "Parameterintervall (Erwartungswert)" bzw. "Prognoseintervall (tatsaechliche Summe)" statt "95%-Intervall". Optional eine eindeutig als **POST-HOC** gekennzeichnete Spalte "Prognoseintervall der Summe" (z. B. GLS mit AR(1)-Fehlern fuer A). Ob das ein Amendment braucht, entscheidet der Mensch.

---

### GERING

#### G1 - Grafiken
- `estimand1_h1_vs_cagr.png`: Untertitel rechts abgeschnitten ("... (UBA/kl"); die Balkenwerte (`geom_text`, weiss, `vjust = 1.4`) liegen bei negativen Balken ausserhalb des Balkens und sind damit weiss auf weiss unsichtbar. Die Werte -2,1 / -1,5 / -3,6 % fehlen in der Grafik. Y-Achsentitel fast am Untertitel. Abhilfe: Beschriftung fuer negative Werte, Untertitelumbruch.
- `estimand2_overshoot.png`: Bundesregierungslinie (-4,5, blau gestrichelt) liegt praktisch auf der Nulllinie und ist nicht unterscheidbar; keine Legende fuer Korridor und Bundesregierung (nur Text im Untertitel); das 625-Panel steht oben, das Primaer-Panel unten; x-Achse bis 1500 wegen des A-HAC-Balkens, wodurch der Korridor (60-100) sehr schmal erscheint. Abhilfe: Primaer oben, 625 in Anhang oder weg, Korridor beschriften, Bundesregierung als Marker mit Label. ARIMA-Balken nach K1 neu erzeugen.
- `estimand2_trend_bis_2030.png`: Die beobachtete Linie hat keinen Legendeneintrag; der Sprung der A-Kurve (W3) ist nicht kommentiert; Titel und Quellenangabe in Ordnung.
- Diagnostik-PNGs: lesbar, Beschriftung korrekt.

#### G2 - Bootstrap (RF-4): Blocklaenge, Seed, B
**Empfehlung:** Primaer bei Blocklaenge 2, Seed 20260827, B = 2000 bleiben (SAP-Amendment-Praezedenz, Seed und Blocklaenge im Altskript verifiziert, B = 2000 ist SAP-Vorgabe). Aber: (1) Bei n = 36 und Residual-Autokorrelation um 0,6 ist Laenge 2 kurz. Eigene Sensitivitaet (einmaliger Lauf, anderer Seed): Obergrenze Overshoot A 738 (Block 2), 779 (Block 4), 797 (Block 6); das B-Intervall wird bei laengeren Bloecken enger (n = 11, wenige Startpunkte), ist also instabil. Als POST-HOC-Sensitivitaet Blocklaenge 4 fuer Fenster A ausweisen; fuer B/C den Block-Bootstrap als wenig aussagekraeftig kennzeichnen. (2) B = 2000 hat Monte-Carlo-Fehler der Perzentilgrenzen von einigen Mt (mein Lauf mit anderem Seed weicht um 1-8 Mt ab); eine Nachkommastelle (z. B. 429,0) suggeriert Praezision. Auf ganze Mt runden oder B = 10000 als Kontrolle. (3) Seed und Blocklaenge im Erratum festhalten. Die Implementierung (Residuen, Neuschaetzung, Summe der 5 Fortschreibungen) ist korrekt.

#### G3 - HAC-Details und Newey-West-Steigungstests
- Die Intervallbreite der analytischen Summe in A haengt stark von den sandwich-Voreinstellungen ab (`prewhite = TRUE`, automatische Bandbreite). Eigene Rechnung, Standardfehler der Summe in A: OLS 63, NeweyWest mit Prewhitening 268, ohne Prewhitening 135; Overshoot-Intervall A entsprechend [456; 713], [39; 1130], [310; 858]. Die SAP-Vorgabe "sandwich::NeweyWest" ist eingehalten (konsistent mit dem Altskript); der Bericht sollte aber den Faktor ca. 4 gegenueber OLS und die Abhaengigkeit von den Voreinstellungen nennen.
- Newey-West-Steigungstest B: p = 3,0e-9 ist kleiner als der klassische p = 6,8e-7, bei n = 11 unplausibel stabil (Prewhitening/Bandbreite). Wird berichtet wie in der bestehenden Analyse; kommentieren als "bei n = 11 nicht belastbar". Keine Auswirkung auf Schlussfolgerungen (fuer B wird HAC nach SAP nicht angewendet).

#### G4 - Estimand 1: Zusaetze zur Einordnung
- "Naeher an Fenster A" ist rechnerisch korrekt und gegenueber beiden Toleranzschwellen und der Rundung robust. Das SAP-Label "pessimistischeres Szenario" darf nicht als Trendbestaetigung gelesen werden.
- Agora schreibt, der H1-Rueckgang sei "groesstenteils auf die gestiegenen fossilen Energiepreise" zurueckzufuehren und koenne geringer ausfallen (Heizoel-Statistik; Pressemitteilung: "um bis zu 7 Mt"). Das ist keine Ursachenaussage der Analyse, sollte aber als Quellenzitat im Bericht stehen: Die H1-Rate ist ein kurzfristiges, vorlaeufiges, laut Agora stark preisgetriebenes Signal und nicht gleichartig mit einer langjaehrigen mittleren Rate. Vorlaeufigkeit und Heizoel-Risiko nennt der Bericht bereits (gut); die Zuordnung zum Preiseffekt fehlt. Eigene Ursachenaussagen sind sonst korrekt vermieden.
- CAGR_A/B beruhen auf gefitteten Werten (704,3 statt beobachteter 648,8 in 2025). Beobachtete mittlere Raten waeren -1,86 % (1990-2025) und -3,20 % (2015-2025). SAP-konform (SAP 2, 5.1.1), Klassifikation unveraendert; als Fussnote nennen.
- RF-5: Ableitung 327 + 7 = 334 ist SAP-konform. Statt der "-2,0 %-Variante" ist die Rundungsspanne (-1,95 % bis -2,24 %) aussagekraeftiger.

#### G5 - Suchprotokoll H1/H2-Reihe (RF-11)
SAP 2 verlangt die Pruefung einer "historischen Agora- oder UBA-Zeitreihe" mit mindestens 5 H1/H2-Paaren. Dokumentiert ist nur die Agora-Suche (Sitemap, Pressemitteilungsliste). Ein UBA-/AGEB-Suchversuch fehlt in `rohdaten/suchprotokoll/`. Das Ergebnis "entfaellt" ist plausibel, und die Vorgabe "keine Verdopplung" wurde eingehalten; fuer den Nachweis fehlt die UBA-Seite. Auflage: Suche ergaenzen oder als Limitation benennen.

#### G6 - Rundung, Darstellung, Dateien
- SAP 11 verlangt eine Nachkommastelle fuer Mt und pp. Der Bericht gibt bei Estimand 1 zusaetzlich drei Nachkommastellen in Klammern an (Toleranz 0,05 pp), gekennzeichnet: zulaessig. Die Rohwerte in den CSV sind ungerundet, nur die Tabellenausgabe ist gerundet: in Ordnung.
- Fenster C wird in Bericht 2.2/2.3 mit "(pessimistischer)" in Klammern klassifiziert, obwohl SAP 2 nur A und B klassifiziert und C nur deskriptiv sein soll. Klammerlabel streichen.
- `rohdaten/SHA256SUMS.txt` wird vom Skript bei jedem Lauf **neu geschrieben** (Zeile 164) und kann Aenderungen an Rohdateien daher nicht erkennen; das Format (ein Leerzeichen, CRLF) ist nicht mit `sha256sum -c` kompatibel. Empfehlung: Pruefsummen einmalig festschreiben und im Skript nur vergleichen.

---

## 3. Bewertung der Rueckfragen RF-1 bis RF-11

| RF | Teile ich die Einschaetzung? | Anmerkung / Empfehlung |
|---|---|---|
| RF-1 SAP inkonsistent | Ja, mit Auflage | Siehe W1. Arbeiten nach Header war vertretbar; Mensch muss bestaetigen. |
| RF-2 625 kein 2025-Wert | Ja im Kern, ungenau im Detail | Siehe W2. Anlage 2 KSG nennt 604 fuer 2026; 625 ist eine (nach Agora) angepasste Menge. Parallelrechnung nicht SAP-vorgeschrieben: Anhang oder streichen. |
| RF-3 Intervalle nicht gleichartig | Ja | Siehe W5. Umsetzung exakt nach SAP war richtig; Spaltenueberschriften praezisieren, Zusatz nur als POST-HOC. |
| RF-4 Blocklaenge 2, Seed, B = 2000 | Ja, mit Zusatz | Siehe G2. Primaer beibehalten (Praezedenz verifiziert), Blocklaenge 4 fuer A als POST-HOC, Rundung auf ganze Mt. Im Erratum festlegen. |
| RF-5 H1-Ableitung | Ja | 334 aus 327 + 7 ist SAP-konform; die -2,0 %-Variante ist als POST-HOC markiert; besser die Rundungsspanne berichten (G4). |
| RF-6 "naeher an" | Mit Einschraenkung | Distanz zu einem Korridor (0 innerhalb, sonst Randabstand) gegen Distanz zu einem Punkt (-4,5) ist strukturell zugunsten des breiten Korridors verzerrt. Alternative: Abstand zur Korridormitte (80) und zu -4,5 oder beide Abstaende ohne verbale Zuordnung. In dieser Datenlage aendert sich die Zuordnung nicht (B analytisch/Bootstrap: Bundesregierung; Rest: Expertenrat); fuer A-Zeilen (Abstand 484 bzw. 166 Mt) ist "naeher" bedeutungslos. Der Bericht relativiert das selbst (2.4, richtig); POST-HOC-Kennzeichnung vorhanden. |
| RF-7 Quellen 3 und 5 nicht direkt | Ja | 4,5 Mt / 6194,5 in der ERK-Tabelle belegt. FAZ nicht pruefbar; Zahlen wurden in den Primaerquellen gefunden (Primaer vor Sekundaer, richtig). UBA-Datacube nicht abgerufen, bleibt Limitation. |
| RF-8 Zugriffsdatum, Reihe identisch | Ja | Mein Abgleich ueber die API stimmt (max. 0,005 Mt). |
| RF-9 Fenster C deskriptiv | Ja | Siehe G6 (Klassifikationslabel entfernen). |
| RF-10 Dateiname | Ja | Unbedeutend. |
| RF-11 H1/H2-Sensitivitaet entfaellt | Ja, dokumentieren | Siehe G5 (UBA-Suche fehlt im Protokoll). |

---

## 4. SAP-Konformitaet im Einzelnen (Checkliste Punkt 1) und Mehrfachtestung (Punkt 3)

| SAP-Anforderung | Umsetzung | Bewertung |
|---|---|---|
| E1: CAGR_A/B aus gefitteten Werten, Exponent 1/35 bzw. 1/10 | Skript Z. 300-301 | SAP-konform |
| E1: d_A, d_B, Toleranz 0,05, Sensitivitaet 0,1, Robustheitsaussage | Z. 310-340 | SAP-konform |
| E1: kein p-Wert, keine Verdopplung | eingehalten | SAP-konform |
| E1: -2,0 %-Variante | POST-HOC, gekennzeichnet | zulaessig, gekennzeichnet |
| E2: Fenster A/B/C, OLS, 2026-2030, Summe, Ist 2021-2025 aus den 36 Werten | Z. 363-476 | SAP-konform |
| E2: Overshoot = Gesamt minus 6199; Klassifikation 60/100 | Z. 413-417 | SAP-konform |
| 5.2 Diagnostik (Linearitaet, DW, ACF, Shapiro-Wilk) | durchgefuehrt; Linearitaet nicht interpretiert | Abweichung (W4) |
| 5.3 Newey-West bei signifikantem DW, tatsaechlich angewendet | Z. 479, nur A | SAP-konform; in die analytische Summenvarianz eingeflossen (reproduziert); Bootstrap/ARIMA nach Konstruktion nicht HAC |
| 5.4.1 analytisch, df = n-2 | Z. 479-482 | SAP-konform |
| 5.4.2 MBB, B = 2000, Perzentile | Z. 371-382, 485 | SAP-konform; Blocklaenge/Seed SAP-Luecke, offen gemeldet |
| 5.4.3 ARIMA, Varianz der Summe aus Kovarianzstruktur | Z. 387-411 | **Fehler (K1)** |
| 6.1 alle drei Fenster berichtet | ja | SAP-konform |
| 6.2 alle drei Methoden nebeneinander | ja | SAP-konform (Gleichartigkeit der Intervalle: W5) |
| 6.3 625-Parallelrechnung | Bedingung nicht ausgeloest, trotzdem gerechnet | Abweichung (W2) |
| 6.4 saisonale Hochrechnung | entfaellt | SAP-konform (Dokumentation: G5) |
| 6.5 Fallback nur ohne Primaerquelle | nicht angewendet, Primaerquelle gefunden | SAP-konform |
| 6.6 Schwelle 0,1 pp | ja | SAP-konform |
| 7 Mehrfachtestung: alles berichtet, nichts selektiert | alle 18 Zeilen plus Estimand 1 vollstaendig; keine Hauptkombination hervorgehoben | bestanden; Hinweis W2 (625-Zeilen) |
| 8b getrennte Darstellung E1/E2 | eingehalten; 2040-Werte nur als Reproduktionskontrolle | SAP-konform |
| 8c keine politische Bewertung, "dritte Stimme" | eingehalten; Ursachenaussagen vermieden | bestanden |
| 9 Limitationen | Bericht Abschnitt 3 vollstaendig, aber nicht bei den Ergebnissen sichtbar | Abweichung gering (W3, W4, W5) |
| 11 Datenabgleich vorangestellt | ja (Abschnitt 0) | SAP-konform |
| 11 Rundung: eine Nachkommastelle | weitgehend; E1 zusaetzlich 3 Stellen | zulaessig, gekennzeichnet (G6) |

**Cherry-Picking:** nicht festgestellt. Alle Fenster, Methoden und Varianten stehen im Bericht, einschliesslich unguenstiger/unklarer. Keine Kombination wird als Hauptergebnis hervorgehoben. Die Formulierung je Zeile in 2.4 ist deskriptiv.

---

## 5. Pruefung des Analyseberichts auf Ueberinterpretation (Checkliste Punkt 5)

- **"Liegt naeher an Fenster A"** (E1): zulaessig, rechnerisch und gegenueber Schwellen/Rundung robust, sofern (a) die SAP-Definition (Distanz der Jahres-ueber-Jahres-Rate zur gefitteten mittleren Rate) mitgeliefert wird und (b) steht, dass es sich um eine vorlaeufige, laut Agora weitgehend preisgetriebene Halbjahreszahl handelt (G4). Keine Trend- oder Politikaussage ableiten.
- **"Kein Punktwert im Korridor"** (E2): formal richtig; nur mit Intervallkontext und nach Korrektur von K1 zulaessig (W3).
- **"pessimistischer/optimistischer als Expertenrat":** nur als Etikett fuer den Punktwert vertretbar. Die eigentliche Kernaussage ist die Abhaengigkeit von Fenster und Methode (Spanne +25 bis +584 Mt); sie gehoert nach vorn (W3c).
- **Ursachenaussagen:** im Bericht vermieden (gut). Der Verweis auf die Heizoel-Unsicherheit ist eine Quellenangabe, keine Ursachenzuschreibung.
- **Abhaengigkeit von Fenster/Methode:** berichtet, nicht verschwiegen.
- **Diagnostik-Zahlen im Bericht:** DW 0,65 in A, p < 0,0001: korrekt (p = 3,8e-7). B/C: keine signifikante Autokorrelation, geringe Teststaerke bei n = 11: korrekt und angemessen formuliert. Es fehlen Zusatz fuer C (n = 6) und die Linearitaet (W4).
- **Selbstbeschreibung:** "fehlerfrei durchgelaufen" stimmt (Exit-Code 0), sagt aber nichts ueber die Richtigkeit der ARIMA-Intervalle (K1).

---

## 6. Auflagen (zusammengefasst, priorisiert)

1. **K1:** `arima_summe()` korrigieren (Zeile 396), Kontrolle um Nebendiagonalen-/Simulationsvergleich erweitern, alle ARIMA-Zeilen in Tabellen, Grafik und Bericht neu erzeugen, Abweichungsprotokoll um Fehler und Korrektur ergaenzen.
2. **W1:** Mensch bestaetigt schriftlich v1.1 und die Antworten zu Offenen Punkten 6a/6b; SAP-Fehler (625) als datiertes Erratum, nicht durch stilles Editieren des eingefrorenen SAP.
3. **W2:** 625-Variante in Anhang oder streichen; Wortlaut zur 625 korrigieren (angepasste Jahresmenge; Anlage 2 KSG: 604); Auslegung von SAP 6.3 im Bericht richtigstellen.
4. **W3:** Niveausprung in A (+41 Mt) benennen; Klassifikation als punktbasiert kennzeichnen; Aussage zur Intervallueberdeckung; Spanne +25 bis +584 voranstellen.
5. **W4:** Linearitaets- und ACF-Befunde je Fenster in Bericht 2.1 interpretieren.
6. **W5:** Spalten umbenennen (Parameterintervall vs. Prognoseintervall); optional POST-HOC-Prognoseintervall.
7. **G1-G6:** Grafiken, Bootstrap-Sensitivitaet und Rundung, HAC-Hinweis, Agora-Preiszuordnung als Zitat, UBA-Suchprotokoll, Pruefsummen festschreiben, Fenster-C-Klassifikation entfernen.
8. Nach Umsetzung: **fokussierte Nachpruefung durch den validator als eigene Datei** (Anhang an diesen Bericht), bevor ein Report- oder Kanal-Entwurf entsteht.

---

## 7. Was ich nicht pruefen konnte

- **FAZ-Artikel** "Deutschland droht erstmals Klimaziel zu verfehlen": nicht zugaenglich (weder dem Analysten noch mir). Ob dort 625 tatsaechlich als 2025-Wert steht oder die SAP-Annahme auf einer Missdeutung beruht, ist offen.
- **UBA-Projektionsdaten 2026 (Datacube, Quelle 5)** direkt: nur ueber den ERK-Bericht belegt.
- **Echtheit der SAP-Freigabe** (Volltext durch Daniel Saure gelesen): nicht pruefbar, siehe W1.
- **Agora-Seiten live:** gelesen habe ich die im Repository gespeicherten HTML-Kopien (`rohdaten/agora/`), nicht erneut live abgerufen. Die Rohdaten-Pruefsummen konnte ich nur gegen die vom Skript selbst neu erzeugte Datei abgleichen (G6), nicht gegen einen unabhaengigen Referenzstand. Anlage 2 KSG habe ich live bei gesetze-im-internet.de abgerufen.
- **ERK-PDF:** gelesen habe ich die extrahierte Textdatei `bericht.txt`, nicht das PDF visuell (Werte wie 6194,5 und -4,5 in der Extraktion eindeutig, aber nicht gegen das PDF-Layout geprueft).
- **Herleitung 604 zu 625** (604 + 106,7/5): nur Plausibilitaetsrechnung, nicht durch ein UBA-Dokument belegt.
- **Korrigierte ARIMA-Intervalle:** meine Werte beruhen auf der Normalapproximation des SAP ohne Unsicherheit des Drift-Parameters (wie im Skript); verbindliche Zahlen liefert das korrigierte Skript des Analysten.
