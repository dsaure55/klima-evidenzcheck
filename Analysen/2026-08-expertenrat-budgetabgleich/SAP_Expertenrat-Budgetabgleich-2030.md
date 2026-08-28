# Statistischer Analyseplan (SAP)

**Titel:** Sind der vom Expertenrat fuer Klimafragen genannte Schwellenwert einer
Emissionsbudget-Ueberschreitung 2021-2030 (60-100 Mt CO2-Aeq.) und die H1-2026-
Emissionsdaten mit der bereits publizierten 2040-Trendprojektion sowie mit einer
eigenstaendigen Trendfortschreibung bis 2030 statistisch kompatibel?

**Version:** 1.0 (draft)
**Datum:** 2026-08-28
**Autor:in / Freigabe:** _________________________ Datum: __________

---

## 0. Status dieser Analyse

[x] Praeregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[ ] Exploratorisch

**Status: draft** - noch NICHT eingefroren. Freigabe/Einfrieren erfolgt durch einen
Menschen (siehe Projektanweisung), erst danach darf der analyst-Subagent aktiv werden.

Zum Zeitpunkt der Erstellung dieses SAP liegen im Repository KEINE Daten zu
H1-2026, zum genannten FAZ-Artikel oder zum Expertenrat-Schwellenwert vor. Diese
drei externen Quellen wurden noch nicht gesichtet - es handelt sich um eine echte
prospektive Praeregistrierung.

**Transparenzhinweis (Abgrenzung zu bereits vorliegenden Ergebnissen):** Im
Hintergrundabschnitt (1) werden Ergebnisse der bereits abgeschlossenen,
eingefrorenen UND oeffentlich publizierten Analyse
`SAP_DE-Emissionen-Trendprojektion-2040.md` (Version final v1.0, Commit 3dfe809)
zitiert: Projektion 2040 Fenster A = 486 Mt, Fenster B = 207 Mt [95%-PI 86-328],
Zielwert 150,4 Mt, Basisjahr 2025 = 648,83 Mt. Dies sind Ergebnisse einer FRUEHEREN,
bereits abgeschlossenen und unveraenderlichen Analyse und dienen hier ausschliesslich
als Kontext/Vergleichsgroesse fuer Estimand 1 (Abschnitt 2). Es sind KEINE Ergebnisse
der hier neu praeregistrierten Analyse - fuer Estimand 1 und Estimand 2 wurden noch
keinerlei Daten gesichtet oder berechnet. Der Status "praeregistriert" bleibt daher
gueltig und wird NICHT auf "exploratory (retrospektiv)" herabgestuft. Sollte sich vor
dem Einfrieren herausstellen, dass entgegen dieser Annahme doch bereits jemand die
H1-2026-Zahlen, den vollen FAZ-Artikeltext oder den Expertenrats-Bericht inhaltlich
gesichtet und dabei ergebnisrelevante Zahlen mit in die SAP-Erstellung eingebracht
hat, MUSS der Status vor dem Einfrieren auf "exploratory (retrospektiv)" korrigiert
werden - dies ist vor der Freigabe explizit zu verifizieren (siehe Offene Punkte am
Ende).

---

## 0b. Strukturentscheidung: Neuer SAP vs. Amendment

**Entscheidung: eigenstaendiger NEUER SAP** (neuer Ordner
`Analysen/2026-08-expertenrat-budgetabgleich/`), KEIN Amendment des bestehenden
`SAP_DE-Emissionen-Trendprojektion-2040.md`.

Begruendung:

1. **Andere Estimands, nicht nur andere Parameter derselben Frage.** Der bestehende
   SAP beantwortet eine Punktziel-Frage fuer das Jahr 2040 (-88 % ggue. 1990). Die
   vorliegende Analyse stellt zwei neue Fragen: (a) einen Soll-Ist-Abgleich der
   bestehenden Projektion mit neu erhobenen H1-2026-Daten, und (b) einen Vergleich
   mit einem KUMULATIVEN Budgetkonzept 2021-2030, das einer anderen Systematik
   folgt (aggregierte Jahresemissionsmengen/Restbudget-Logik des Klimaschutzgesetzes
   bzw. der Expertenrats-Pruefung) als das lineare Punktziel 2040. Das ist keine
   blosse Erweiterung des Zeitfensters oder eine methodische Korrektur derselben
   Fragestellung, sondern eine neue Fragestellung mit neuem Zielkonstrukt.
2. **Praezedenzfall-Abgrenzung.** In diesem Projekt existiert bereits ein
   etabliertes Amendment-Verfahren (SAP-Amendment v1.1, THG-Laendervergleich
   SL-BY-BE, Commits c9dc0b0/20c6747/bd469bf: "Fix: Residual-basierter
   Moving-Block-Bootstrap statt Rohwert-Reprojektion"). Dort wurde eine laufende,
   noch nicht mit einem Bericht abgeschlossene Analyse um eine methodische
   Korrektur ERGAENZT, OHNE die Fragestellung selbst zu aendern. Der vorliegende
   Fall unterscheidet sich davon: Hier liegt bereits ein FINALER, VEROEFFENTLICHTER
   SAP zu einer ANDEREN, abgeschlossenen Frage vor, und es kommt eine
   eigenstaendige neue Fragestellung mit neuen externen Quellen hinzu. Das
   entspricht nicht der Amendment-Situation.
3. **Bereits publiziertes Dokument bleibt unangetastet.** Der bestehende SAP ist
   final UND bereits oeffentlich publiziert (Commit 3dfe809, seitdem ggf. bereits
   zitiert/verlinkt). Ein Amendment wuerde dieses zitierfaehige Dokument nachtraeglich
   veraendern und den Audit-Trail der bereits veroeffentlichten Aussage verwaessern.
   Die neue Analyse nutzt dessen Ergebnisse nur als Kontext (Abschnitt 1), veraendert
   aber nichts an dessen Daten, Modellen, Diagnostik oder Schlussfolgerungen - jene
   bleiben so stehen, wie sie eingefroren und publiziert wurden.
4. **Neue Datenquellen erfordern eigenen Abgleichsschritt.** Agora Energiewende, der
   Expertenrat fuer Klimafragen und die FAZ als journalistische Sekundaerquelle waren
   nicht Teil des urspruenglichen SAP und bringen eine eigene, vorab zu klaerende
   Datenherkunfts-/Vintage-Problematik mit (siehe Abschnitt 4a) - das rechtfertigt
   eine eigene, vollstaendige SAP-Struktur statt eines kurzen Amendment-Absatzes.
5. **Wiederverwendung von Basisdaten/-methodik als Bruecke, nicht als Amendment-
   Grund.** Gemeinsam ist nur die zugrunde liegende UBA-Zeitreihe 1990-2025 und die
   OLS-Trendfortschreibungs-Methodik. Diese werden hier explizit UNVERAENDERT
   uebernommen (Abschnitt 4), aber auf ein neues Zielkonstrukt (kumulative Summe
   statt Punktwert, neuer Horizont 2030 statt 2040) angewendet. Methodische
   Kontinuitaet wird durch Verweise auf den bestehenden SAP hergestellt, nicht durch
   dessen Aenderung.

Der bestehende SAP und seine Ergebnisse bleiben unveraendert gueltig und werden durch
diese Analyse nicht rueckwirkend korrigiert oder ersetzt.

---

## 1. Hintergrund / Rationale

Ein FAZ-Artikel ("Deutschland droht erstmals Klimaziel zu verfehlen", Stand H1 2026)
zitiert den unabhaengigen Expertenrat fuer Klimafragen mit einer voraussichtlichen
Ueberschreitung des deutschen Emissionsbudgets 2021-2030 um 60-100 Mt CO2-Aeq. und
nennt einen Emissionsrueckgang von ca. 2 % im ersten Halbjahr 2026 (Quelle laut
Artikel: Agora Energiewende). Der Artikel nennt zudem ca. 625 Mt Gesamtemissionen
fuer 2025 - ein Wert, der von dem in der bestehenden, bereits publizierten Analyse
verwendeten Wert (648,83 Mt, UBA via klimadashboard.de) abweicht.

Diese Diskrepanz sowie die Existenz zweier unterschiedlicher Zielkonzepte (lineares
Punktziel 2040 vs. kumulatives Budget 2021-2030) bergen ein hohes Risiko fuer
oeffentliche Fehlinterpretation: Journalistische und politische Kommunikation
vermischt haeufig unterschiedliche Zeithorizonte, Zielarten und Datenstaende zu einer
einzigen, scheinbar widerspruechlichen Aussage ("Deutschland schafft/schafft nicht
sein Klimaziel"), obwohl es sich um mehrere, methodisch getrennte Fragen handelt.
Diese Analyse soll (a) die Datengrundlage der externen Zahlen transparent gegen die
eigene, bereits publizierte Datengrundlage abgleichen, und (b) zwei praezise,
getrennt zu beantwortende statistische Fragen dazu beantworten - ohne die
bestehende, bereits veroeffentlichte 2040-Analyse zu veraendern.

## 2. Fragestellung (Estimand)

Diese Analyse hat ZWEI getrennte, nicht zu vermischende Estimands (siehe auch
Abschnitt 8b). Beide werden unabhaengig voneinander und getrennt berichtet.

### Estimand 1 - Konsistenz von H1-2026 mit der bestehenden 2040-Projektion

**Frage:** Liegt die im ersten Halbjahr 2026 beobachtete Jahres-ueber-Jahres-Rate
(H1 2026 vs. H1 2025, in %, gemaess Agora Energiewende/FAZ) naeher an der
durchschnittlichen jaehrlichen prozentualen Rueckgangsrate ("CAGR"), die Fenster A
(Langfrist-Trend 1990-2025) impliziert, oder an derjenigen, die Fenster B
(10-Jahres-Trend 2015-2025) impliziert - beides aus der bereits eingefrorenen und
publizierten Analyse `SAP_DE-Emissionen-Trendprojektion-2040.md` uebernommen, OHNE
die dortigen Modelle neu zu schaetzen?

**Praezise Operationalisierung:**

- `CAGR_A = (fit_A(2025) / fit_A(1990))^(1/35) - 1`
- `CAGR_B = (fit_B(2025) / fit_B(2015))^(1/10) - 1`

  wobei `fit_A()` und `fit_B()` die gefitteten Werte der bereits im bestehenden SAP
  geschaetzten und eingefrorenen OLS-Modelle A und B sind (keine Neuschaetzung; Werte
  werden entweder aus dem archivierten Skript `DE-Emissionen-Trendprojektion-2040.R`
  reproduziert oder - falls im dortigen Output-Ordner bereits gespeichert - direkt
  aus dem archivierten Ergebnis uebernommen).
- `Rate_H1 = (Emissionen_H1_2026 - Emissionen_H1_2025) / Emissionen_H1_2025`
  (Quelle: Agora Energiewende, wie im FAZ-Artikel zitiert bzw. bei der Primaerquelle
  Agora direkt nachgesehen).
- Distanzmass: `d_A = |Rate_H1 - CAGR_A|`, `d_B = |Rate_H1 - CAGR_B|` (in
  Prozentpunkten).
- Klassifikation (vorab festgelegt, keine nachtraegliche Anpassung):
  - `d_A < d_B - 0,05 Prozentpunkte` -> "naeher an Fenster A (pessimistischeres
    Szenario)"
  - `d_B < d_A - 0,05 Prozentpunkte` -> "naeher an Fenster B (optimistischeres
    Szenario)"
  - sonst (Differenz der Distanzen <= 0,05 Prozentpunkte) -> "nicht unterscheidbar,
    beide Fenster gleich nah" (vorab festgelegte Toleranzschwelle zur Vermeidung
    einer willkuerlichen Entscheidung bei Beinahe-Gleichstand)

**Harte Nebenbedingung (siehe auch Abschnitt 8a):** Es findet KEINE Hochrechnung der
H1-Zahl auf einen Jahreswert 2026 durch simple Verdopplung statt. Falls und nur
falls beim Datenzugriff eine historische Agora- oder UBA-Zeitreihe mit mindestens
5 vollstaendigen Halbjahrespaaren (H1 UND H2 desselben Jahres) oeffentlich verfuegbar
ist, wird zusaetzlich sensitivitaetsanalytisch (nicht primaer) ein saisonal
gewichteter Jahreswert 2026 geschaetzt (Gewichtung = empirisches H1/Jahres-Verhaeltnis
der letzten verfuegbaren 5 Jahre, Median statt Mittelwert zur Robustheit gegen
Ausreisserjahre). Ist eine solche Zeitreihe nicht verfuegbar, wird ausschliesslich
der H1-vs-H1-Vorjahresvergleich (Rate_H1 wie oben) verwendet - dies ist die
Primaerspezifikation.

**Einordnung des Ergebnisses:** Da es sich um einen Einzelwert-Vergleich (n=1
Beobachtungspunkt fuer H1 2026) handelt, wird KEIN formaler Signifikanztest
durchgefuehrt und KEIN p-Wert berichtet. Das Ergebnis ist rein deskriptiv/orientierend
("naeher an ..."), nicht konfirmatorisch.

### Estimand 2 - Eigenstaendige 2030-Trendfortschreibung vs. Expertenrat-Schwellenwert

**Frage:** Liegt die aus einer eigenstaendigen, methodisch zur bestehenden 2040-
Analyse analogen Trendfortschreibung berechnete kumulative Emissionsmenge
2021-2030 oberhalb, unterhalb oder innerhalb des vom Expertenrat genannten
Ueberschreitungskorridors (60-100 Mt CO2-Aeq. ueber dem erlaubten Gesamtbudget
2021-2030)?

**Praezise Operationalisierung:**

- `Kumuliert_Ist_2021_2025` = Summe der tatsaechlichen (nicht modellierten) UBA-
  Jahreswerte 2021-2025, identisch zum bestehenden, eingefrorenen Datensatz
  (Abschnitt 4).
- `Kumuliert_Projektion_2026_2030(Fenster)` = Summe der fuenf Jahres-Punktschaetzungen
  2026, 2027, 2028, 2029, 2030 aus dem OLS-Modell des jeweiligen Fensters (A, B oder
  C - siehe 5.1.2). Es wird NICHT die H1-2026-Teiljahreszahl als zusaetzlicher
  Datenpunkt in dieses Modell eingespeist (das Modell verwendet ausschliesslich
  vollstaendige Jahreswerte 1990-2025, identisch zur bestehenden Analyse) - Estimand
  1 und Estimand 2 sind damit vollstaendig unabhaengig voneinander in Bezug auf die
  verwendeten Rohdaten.
- `Kumuliert_Gesamt_2021_2030(Fenster) = Kumuliert_Ist_2021_2025 +
  Kumuliert_Projektion_2026_2030(Fenster)`
- `Overshoot_eigen(Fenster) = Kumuliert_Gesamt_2021_2030(Fenster) -
  Budget_Gesamt_2021_2030(Expertenrat)`, wobei `Budget_Gesamt_2021_2030
  (Expertenrat)` die vom Expertenrat fuer Klimafragen selbst in seinem/seinen
  offiziellen Gutachten definierte erlaubte Gesamtemissionsmenge 2021-2030 ist
  (Primaerquelle, siehe Abschnitt 3/4a - NICHT aus dem FAZ-Artikel rekonstruiert,
  falls die Primaerquelle auffindbar ist).
- Klassifikation je Fenster (A, B; Fenster C nur deskriptiv/Kontext):
  - `60 Mt <= Overshoot_eigen <= 100 Mt` -> "kompatibel mit dem Expertenrats-
    Schwellenwert"
  - `Overshoot_eigen < 60 Mt` -> "eigene Projektion optimistischer als Expertenrat
    (geringere oder keine Ueberschreitung)"
  - `Overshoot_eigen > 100 Mt` -> "eigene Projektion pessimistischer als
    Expertenrat (groessere Ueberschreitung)"

**Fallback, falls `Budget_Gesamt_2021_2030(Expertenrat)` nicht aus einer
Primaerquelle bestimmbar ist:** Estimand 2 wird dann NICHT quantitativ in Mt
Overshoot beantwortet. Stattdessen wird ausschliesslich berichtet, wie sich
`Kumuliert_Gesamt_2021_2030(Fenster)` gegenueber dem in Abschnitt 3/4a dokumentierten,
direkt zitierten Expertenrat-Schwellenwert (60-100 Mt) verhaelt, unter der
expliziten Annahme, dass das implizite Budget = eigene Projektion minus 60 bzw.
minus 100 Mt gesetzt wird (zwei Randszenarien statt einer Punktschaetzung). Dieser
Fallback wird im Ergebnisbericht klar als "nicht auf Basis der Expertenrat-
Primaerquelle, sondern auf Basis des sekundaer zitierten Korridors" gekennzeichnet.

**Wichtig:** Estimand 2 betrifft ausschliesslich den 2030-Zeithorizont und das
kumulative Budgetkonzept. Er ersetzt, ergaenzt oder korrigiert NICHT die 2040-
Punktzielanalyse der bestehenden SAP (siehe Abschnitt 8b).

## 3. Datenquelle

| # | Quelle | Zweck | Zugriffsdatum | Datenstand/Vintage (zu dokumentieren) |
|---|---|---|---|---|
| 1 | Umweltbundesamt (UBA) via klimadashboard.de (CC BY 4.0) | Basiszeitreihe 1990-2025 (identisch zur bestehenden Analyse, keine Neuerhebung) | bereits erfolgt (27.08.2026, siehe bestehender SAP) | wie in bestehendem SAP dokumentiert (648,83 Mt fuer 2025) |
| 2 | Agora Energiewende | H1-2026- und H1-2025-Emissionswert bzw. YoY-Rate; ggf. historische H1/H2-Zeitreihe fuer Sensitivitaet | beim Ausfuehren des Skripts zu dokumentieren | Vorlaeufigkeit/Berichtsdatum explizit vermerken |
| 3 | FAZ-Artikel "Deutschland droht erstmals Klimaziel zu verfehlen" | Sekundaerzitat der Expertenrat-Schwellenwerte und der 625-Mt-2025-Zahl; NUR als Fundstellen-/Zitatnachweis, nicht als Primaerquelle fuer Zahlen, wo eine Primaerquelle auffindbar ist | beim Ausfuehren des Skripts zu dokumentieren (Erscheinungsdatum des Artikels) | - |
| 4 | Expertenrat fuer Klimafragen (offizielles Gutachten/Pressemitteilung) | Primaerquelle fuer (a) Ueberschreitungskorridor 60-100 Mt und (b) Gesamtbudget 2021-2030 in Mt CO2-Aeq. | beim Ausfuehren des Skripts zu dokumentieren | Berichtsjahr/Edition des Gutachtens exakt vermerken |

Fuer alle vier Quellen gilt: Zugriffsdatum, Publikationsdatum/Berichtsstand und -
soweit erkennbar - die zugrunde liegende Systemgrenze (Gase, Sektoren, LULUCF
ja/nein, Territorial-/Produktionsprinzip) sind vom Analysten explizit im Skript-
Header und im Ergebnisbericht zu dokumentieren, BEVOR Zahlen aus unterschiedlichen
Quellen numerisch miteinander verglichen werden (siehe 4a).

## 4. Analysepopulation

- **Basiszeitreihe (Estimand 1 und 2, Modellinput):** 1990-2025, n = 36
  Jahresbeobachtungen, Gesamt-THG-Emissionen Deutschland in Mt CO2-Aeq., alle
  Sektoren summiert - UNVERAENDERT aus der bestehenden, bereits publizierten Analyse
  uebernommen (identische 36 Werte wie in
  `Analysen/2026-08-emissionen/DE-Emissionen-Trendprojektion-2040.R`, Zeilen 15-20).
  Keine Neuerhebung, keine Neuschaetzung dieser Werte. Kein Ausschluss von
  Beobachtungen (2020/Corona-Effekt bleibt enthalten, wie im bestehenden SAP
  begruendet).
- **Zusatzdatenpunkt (Estimand 1, nur Vergleichsgroesse, KEIN Modellinput):**
  H1-2026- und H1-2025-Teiljahreswert (Quelle Agora Energiewende). Fliesst
  ausschliesslich als externer Vergleichswert in die Distanzberechnung ein, NICHT
  in die Schaetzung irgendeines Regressionsmodells.
- **Zusatzdatenpunkte (Estimand 2, externe Zielgroesse):** Vom Expertenrat fuer
  Klimafragen genannter Ueberschreitungskorridor (60-100 Mt) und - falls auffindbar
  - das zugrunde liegende Gesamtbudget 2021-2030.
- **Explizit NICHT Teil der Analysepopulation:** Der FAZ-Artikeltext selbst wird
  nicht inhaltlich/politisch analysiert, sondern nur als Fundstelle fuer Zahlen und
  Quellenangaben genutzt.

## 4a. Datenabgleich vor jeder Modellierung (verbindlicher erster Analyseschritt)

Dieser Schritt ist als Schritt 0 des Analyseskripts vorab festgelegt und MUSS vor
jeder Modellschaetzung, jeder Grafik und jeder Kennzahlenberechnung abgeschlossen
und dokumentiert sein.

1. **Diskrepanz 2025-Basiswert (625 Mt lt. FAZ/Agora vs. 648,83 Mt lt. UBA/
   klimadashboard.de, wie in der bestehenden Analyse verwendet):** Der Analyst
   dokumentiert fuer beide Zahlen explizit: exakte Primaerquelle, Publikations-/
   Erhebungsdatum, und - soweit erkennbar - Berichtsstand (z. B. "vorlaeufige
   UBA-Schaetzung Maerz 2026" vs. "revidierte/finale UBA-Zahl", oder abweichende
   Systemgrenzen).
2. **Entscheidungsregel bei Diskrepanz:**
   - Fuer **Estimand 1** (Vergleich mit der bereits publizierten 2040-Projektion)
     wird der 2025-Basiswert der bestehenden, eingefrorenen Analyse (648,83 Mt)
     zwingend beibehalten, um die interne Konsistenz mit dem bereits publizierten
     Ergebnis zu wahren. Die bestehende Analyse wird NICHT rueckwirkend mit dem
     625-Mt-Wert neu gerechnet.
   - Fuer **Estimand 2** (neue, eigenstaendige 2026-2030-Projektion): FALLS sich
     die Diskrepanz eindeutig auf unterschiedliche UBA-Erhebungsstaende
     zurueckfuehren laesst (vorlaeufige vs. spaetere/revidierte Schaetzung), wird
     der jeweils AKTUELLERE/AUTORITATIVERE UBA-Wert als Primaerbasis fuer 2025
     verwendet; der aeltere/abweichende Wert wird als Sensitivitaetsanalyse parallel
     mitgefuehrt (d. h. Estimand 2 wird zusaetzlich einmal mit 648,83 Mt und einmal
     mit dem alternativen 2025-Wert als Sensitivitaet gerechnet, beide werden
     berichtet).
   - FALLS sich die Diskrepanz NICHT eindeutig auf einen Erhebungsstand
     zurueckfuehren laesst (z. B. unterschiedliche Systemgrenzen/Gase/Sektoren),
     werden beide Werte gleichrangig als Primaer- und Sensitivitaets-Variante
     nebeneinander berichtet, und die Diskrepanz wird zusaetzlich unter
     Limitationen (Abschnitt 9) explizit benannt.
   - In keinem Fall wird nachtraeglich einer der beiden Werte verworfen, weil er
     zu einem "ungünstigeren" Ergebnis fuehrt.
3. **Systemgrenzen-Check (Voraussetzung fuer jeden Zahlenvergleich, siehe auch
   8a/8b):** Vor dem numerischen Vergleich von UBA-, Agora- und Expertenrat-Zahlen
   dokumentiert der Analyst, ob alle drei Quellen (a) dieselbe Gas-/Sektor-Abgrenzung
   (Gesamt-THG in CO2-Aeq., alle Sektoren) verwenden, (b) dasselbe
   Territorial-/Produktionsprinzip zugrunde legen, und (c) LULUCF gleich behandeln.
   Werden Abweichungen festgestellt, die einen direkten Zahlenvergleich verzerren
   koennten, wird dies als Limitation dokumentiert und in der Ergebnisinterpretation
   ausdruecklich relativierend erwaehnt - keine stillschweigende Gleichsetzung
   unterschiedlich abgegrenzter Groessen.
4. Erst nach Abschluss der Schritte 1-3 (inkl. schriftlicher Dokumentation im
   Skript-Header bzw. Kommentarblock) darf mit Abschnitt 5 (Modellierung)
   fortgefahren werden.

## 5. Statistische Methoden

### 5.1 Primaeranalyse

#### 5.1.1 Estimand 1

Keine Neuschaetzung eines Modells. Reproduktion/Uebernahme der gefitteten Werte der
bestehenden, eingefrorenen OLS-Modelle A (1990-2025) und B (2015-2025) aus
`DE-Emissionen-Trendprojektion-2040.R`, Berechnung von `CAGR_A`, `CAGR_B` und
`Rate_H1` sowie der Distanzmasse `d_A`, `d_B` wie in Abschnitt 2 definiert.

#### 5.1.2 Estimand 2

Lineare OLS-Regression Emissionen ~ Jahr, fuer dieselben drei Zeitfenster wie in
der bestehenden Analyse (identische Fensterdefinitionen, zur Wahrung methodischer
Vergleichbarkeit):

| Fenster | Zeitraum | n | Rolle in dieser Analyse |
|---|---|---|---|
| A | 1990-2025 | 36 | Primaer (gleichrangig mit B) |
| B | 2015-2025 | 11 | Primaer (gleichrangig mit A) |
| C | 2020-2025 | 6 | Rein deskriptiv/Sensitivitaet - keine Inferenz (n zu klein) |

Fenster A und B werden als GLEICHRANGIGE Primaeranalysen behandelt (wie im
bestehenden SAP) - es erfolgt KEINE nachtraegliche Auswahl eines "Hauptfensters"
nach Sichtung der Ergebnisse. Fenster C dient ausschliesslich der deskriptiven
Einordnung.

Fuer jedes Fenster werden die Punktschaetzungen fuer die Jahre 2026-2030
(Einzelwerte) und deren Summe berechnet (siehe Estimand 2, Abschnitt 2).

### 5.2 Modellannahmen-Pruefung

Identisch zur bestehenden Analyse (dieselben Modelle A/B werden ohnehin nur um
einen kuerzeren Extrapolationshorizont ergaenzt, nicht neu spezifiziert):

- Linearitaet: Residuen-vs-Fitted-Plot
- Autokorrelation: Durbin-Watson-Test, ACF der Residuen
- Normalitaet: Shapiro-Wilk-Test der Residuen

Da die Modelle A und B mit denen der bestehenden Analyse identisch sind, koennen die
dort bereits dokumentierten Diagnostikergebnisse uebernommen werden, sofern die
Datenbasis unveraendert ist (Abschnitt 4). Bei Verwendung eines alternativen
2025-Basiswerts (Sensitivitaet gemaess 4a) wird die Diagnostik fuer diese Variante
erneut durchgefuehrt.

### 5.3 Korrektur bei Annahmenverletzung

Bei signifikanter Autokorrelation (Durbin-Watson-Test, alpha = 0,05):
Newey-West-HAC-korrigierte Kovarianzmatrix (sandwich::NeweyWest) - identisch zur
bestehenden Analyse, zusaetzlich als Grundlage fuer die Varianzfortpflanzung der
kumulativen Summe (siehe 5.4).

### 5.4 Unsicherheitsquantifizierung

Fuer die kumulative Summe `Kumuliert_Projektion_2026_2030(Fenster)` (Estimand 2)
ist die Unsicherheitsfortpflanzung ueber 5 abhaengige Jahresprognosen methodisch
anspruchsvoller als ein einzelner Prognosepunkt (wie im bestehenden SAP fuer 2040).
Es werden DREI Verfahren vorab festgelegt:

1. **Primaer:** Analytisch-parametrische Varianzfortpflanzung der Summe auf Basis
   der Kovarianzmatrix der OLS-Vorhersagen `Var(Summe) = 1' * Cov(y_hat) * 1`, wobei
   `Cov(y_hat)` aus der (ggf. HAC-korrigierten, siehe 5.3) Kovarianzmatrix der
   Regressionskoeffizienten abgeleitet wird; 95 %-Intervall ueber
   Normal-/t-Approximation (df = n-2).
2. **Sensitivitaet 1:** Residual-basierter Moving-Block-Bootstrap (B = 2000
   Wiederholungen) - dieselbe Methodik, die im Rahmen des SAP-Amendments v1.1
   (THG-Laendervergleich SL-BY-BE, Commit bd469bf) bereits als
   autokorrelationsrobuste Alternative zu einer naiven Rohwert-Reprojektion
   etabliert wurde. Empirisches 2,5-/97,5-Perzentil der resultierenden
   Summenverteilung.
3. **Sensitivitaet 2:** ARIMA-basierte Prognose (forecast::auto.arima,
   forecast::forecast, h = 5) fuer die Jahre 2026-2030, Summe der Punktprognosen
   und Varianz der Summe aus der modellimplizierten Kovarianzstruktur - analog zur
   ARIMA-Sensitivitaet der bestehenden 2040-Analyse.

Fuer Estimand 1 wird keine Unsicherheitsquantifizierung im klassischen Sinn
durchgefuehrt (Einzelwert-Vergleich, siehe Abschnitt 2).

### 5.5 Signifikanzniveau

alpha = 0,05, zweiseitig, fuer den Steigungstest der Modelle A/B (H0: Steigung = 0)
- identisch zur bestehenden Analyse. Fuer Estimand 1 und fuer die
Overshoot-Klassifikation in Estimand 2 werden KEINE p-Werte berichtet (deskriptive
Einordnung anhand vorab festgelegter Schwellen, siehe Abschnitt 2).

## 6. Sensitivitaetsanalysen

1. Fenster A und B (gleichrangig primaer) sowie Fenster C (rein deskriptiv) werden
   fuer Estimand 2 IMMER alle drei berichtet.
2. Fuer die Unsicherheit der kumulativen Summe (Estimand 2): analytisch-
   parametrisch (primaer) vs. Moving-Block-Bootstrap vs. ARIMA (beide
   Sensitivitaet) - alle drei werden nebeneinander tabelliert.
3. Bei ungeklaerter 2025-Basiswert-Diskrepanz (625 vs. 648,83 Mt, siehe 4a):
   parallele Berechnung von Estimand 2 mit beiden Basiswerten.
4. Fuer Estimand 1: falls eine ausreichend lange historische Agora-/UBA-
   Halbjahresreihe verfuegbar ist, zusaetzliche Sensitivitaet mittels saisonal
   gewichteter Jahreshochrechnung (siehe Abschnitt 2, harte Nebenbedingung) -
   andernfalls entfaellt diese Sensitivitaet ersatzlos (kein Ersatz durch naive
   Verdopplung).
5. Fuer Estimand 2 bei nicht auffindbarer Expertenrat-Primaerquelle fuer das
   Gesamtbudget: Fallback-Berechnung mit den beiden Randwerten des zitierten
   Korridors (60 Mt und 100 Mt) statt einer Punktschaetzung (siehe Abschnitt 2).

## 7. Umgang mit Mehrfachtestung / Multiplizitaet

Es werden fuer Estimand 2 bis zu 3 Fenster x 3 Unsicherheitsmethoden x (ggf. 2
Basiswert-Varianten) Kombinationen berechnet. ALLE werden in einer festen,
vorab spezifizierten Tabellenstruktur vollstaendig nebeneinander berichtet. Es
erfolgt KEINE Auswahl der Kombination mit dem "guenstigsten" oder "medienwirksamsten"
Ergebnis fuer die Kommunikation. Fuer Estimand 1 wird das (einzige, vorab
festgelegte) Distanzmass-Ergebnis ungekuerzt berichtet, unabhaengig davon, ob es
naeher an Fenster A oder B liegt. Fenster C dient in beiden Estimands ausschliesslich
der Einordnung, nicht der Inferenz.

## 8. Interpretationsrahmen / Confounder

*Fester Abschnitt - vor der Analyse ausgefuellt, nicht erst beim Schreiben des
Ergebnistexts.*

**(a) H1-Daten sind vorlaeufig und nicht direkt auf Jahreswerte hochrechenbar.**
Eine naive Verdopplung der H1-2026-Zahl zur Schaetzung des Jahreswerts 2026 ist ein
METHODISCHER FEHLER und wird in dieser Analyse explizit AUSGESCHLOSSEN. Grund:
Deutschlands Emissionen sind saisonal ungleich verteilt (u. a. hoeherer
Heizenergiebedarf im zweiten Halbjahr/Winter), sodass H1-Werte systematisch nicht
die Haelfte des Jahreswerts abbilden. Falls eine Jahresschaetzung dennoch versucht
wird, geschieht dies AUSSCHLIESSLICH ueber die in Abschnitt 2 vorab festgelegte
saisonal gewichtete Methode (basierend auf dem historischen H1/Jahres-Verhaeltnis
der letzten 5 verfuegbaren Jahre) und NUR sensitivitaetsanalytisch. Primaer wird
ausschliesslich der H1-vs-H1-Vorjahresvergleich verwendet. Zusaetzlich ist zu
pruefen, ob der von Agora zitierte H1-Wert selbst bereits vorlaeufig/revisionsbeduerftig
ist (analog zur UBA-Vorlaeufigkeitsproblematik bei Jahreswerten) - dies wird bei
der Ergebnisinterpretation als zusaetzliche Unsicherheitsquelle benannt, nicht
quantifiziert.

**(b) Zwei unterschiedliche Zeithorizonte und Zielarten - nicht vermischen.** Der
Expertenrat prueft ein kumulatives Emissionsbudget 2021-2030 (Summengroesse ueber
10 Jahre, vermutlich basierend auf der Systematik aggregierter
Jahresemissionsmengen nach Klimaschutzgesetz). Die bestehende Analyse prueft ein
lineares Punktziel fuer das Jahr 2040 (-88 % ggue. 1990, Einzelwert in einem
einzigen Jahr). Diese beiden Estimands (siehe Abschnitt 2) werden in Text, Tabellen
UND Grafiken STRIKT GETRENNT dargestellt. Es wird an keiner Stelle ein Satz
formuliert, der beide Zielgroessen so verknuepft, als seien sie direkt vergleichbar
oder additiv (z. B. wird NICHT formuliert: "Deutschland verfehlt sowohl das 2030- als
auch das 2040-Ziel um X Mt" als ein einziger, vermischter Wert). Zusaetzlich ist zu
beachten, dass die genaue Berechnungssystematik des Expertenrats-Budgets (z. B.
Behandlung von LULUCF, sektorale vs. aggregierte Betrachtung seit der KSG-Novelle)
von der einfachen linearen OLS-Fortschreibung dieser Analyse abweichen kann
(Abschnitt 9) - unser eigener Overshoot-Wert ist eine STATISTISCHE
Trendfortschreibung, kein Ersatz fuer die Compliance-Methodik des Expertenrats.

**(c) Keine politische Bewertung.** Die Analyse beantwortet ausschliesslich die
Frage, ob Zahlen/Schwellenwerte aus verschiedenen Quellen statistisch/methodisch
kompatibel sind. Sie bewertet NICHT, ob die Politik der Bundesregierung oder
einzelner Parteien ausreichend, angemessen oder verantwortlich ist. Im
Ergebnisbericht zulaessige Formulierungen sind ausschliesslich zahlen-/methodenbezogen
(z. B. "die eigene Projektion liegt im/ausserhalb des vom Expertenrat genannten
Korridors"); NICHT zulaessig sind wertende Formulierungen ueber Regierungshandeln,
Massnahmenausreichend/-unzureichend, oder aehnliche politische Einordnungen.

**Produktions- vs. Konsumperspektive:** Alle vier Quellen (UBA, Agora, Expertenrat,
FAZ) beziehen sich nach bisherigem Kenntnisstand auf territoriale/produktionsbasierte
deutsche Emissionen (nicht konsumbasiert). Dies ist im Rahmen des
Systemgrenzen-Checks (4a, Punkt 3) explizit zu verifizieren, bevor Zahlen
gegenuebergestellt werden.

**Transitivitaetsannahme bei indirekten Vergleichen:** Nicht anwendbar - es handelt
sich um keinen Vergleich ueber einen Bruecken-Komparator zwischen mehreren
Einheiten/Regionen, sondern um einen direkten Zeitreihen-/Schwellenwert-Abgleich
innerhalb eines Landes.

**Regression zur Mitte:** Nicht anwendbar - kein Vergleich mehrerer Einheiten mit
unterschiedlichem Ausgangsniveau, sondern eine einzelne Zeitreihe.

## 9. Limitationen

- H1-2026-Daten sind vorlaeufig und koennen spaeter revidiert werden; ein Vergleich
  mit ihnen hat daher selbst bei sorgfaeltiger Methodik einen "Momentaufnahme"-
  Charakter.
- Die eigene, rein statistische OLS-Trendfortschreibung bildet nicht notwendigerweise
  die vollstaendige Compliance-Methodik des Expertenrats ab (z. B. sektorale
  Zwischenziele, LULUCF-Sonderregelungen, Uebertragsmechanismen zwischen Jahren
  gemaess Klimaschutzgesetz) - der berechnete Overshoot-Wert ist eine Naeherung,
  kein Ersatz fuer die offizielle Pruefung.
- Kleine Stichprobe bei kurzen Zeitfenstern (B: n=11, C: n=6) fuehrt zu breiten
  Unsicherheitsintervallen; dies gilt fuer die kumulative Summe ueber 5 Jahre noch
  staerker als fuer einen Einzelpunkt (Fehlerfortpflanzung).
- Lineare Trendannahme kann durch Politik- oder Strukturbrueche verletzt sein
  (z. B. Energiepreiskrise 2022, konjunkturelle Effekte) - identisch zur
  Limitation der bestehenden Analyse.
- Externe Quellenabhaengigkeit: Werte von Agora, FAZ und Expertenrat werden nicht
  unabhaengig durch eigene Rohdatenrekonstruktion nachvalidiert; Risiko von
  Zitierketten-Ungenauigkeiten (FAZ zitiert Agora/Expertenrat) wird durch den
  Datenabgleich in Abschnitt 4a so weit wie moeglich reduziert, aber nicht
  vollstaendig ausgeschlossen.
- Keine Kausalaussage - reine Trend-/Schwellenwert-Vergleichsanalyse, keine
  Politik-Wirkungsanalyse (siehe auch 8c).
- Sollte die Primaerquelle des Expertenrats-Gesamtbudgets 2021-2030 nicht auffindbar
  sein, ist Estimand 2 nur im in Abschnitt 2 beschriebenen reduzierten
  Fallback-Format beantwortbar.

## 10. Software

- R (Version wird im Skript-Header dokumentiert, konsistent mit bestehender
  Analyse)
- Pakete: stats, sandwich, lmtest, forecast, ggplot2, sowie eine eigene
  Implementierung des residual-basierten Moving-Block-Bootstrap (analog zur
  Umsetzung im SAP-Amendment v1.1, THG-Laendervergleich SL-BY-BE)
- Skript (neu zu erstellen durch den analyst-Subagenten, erst nach Einfrieren
  dieses SAP): `Expertenrat-Budgetabgleich-2030.R`, abgelegt in
  `Analysen/2026-08-expertenrat-budgetabgleich/`
- Referenz-Input (nur lesend, keine Veraenderung): `DE-Emissionen-Trendprojektion-
  2040.R` in `Analysen/2026-08-emissionen/`

## 11. Reporting

- **Getrennte Darstellung, keine Vermischung der Zielgroessen (siehe 8b):**
  Estimand 1 und Estimand 2 erhalten je eine eigene Tabelle und ggf. eigene Grafik.
  Kein gemeinsamer Satz, der Punktziel 2040 und Budget 2030 vermengt.
  - **Estimand 1:** Tabelle mit `Rate_H1`, `CAGR_A`, `CAGR_B`, `d_A`, `d_B` und
    verbaler Einordnung ("naeher an A" / "naeher an B" / "nicht unterscheidbar").
  - **Estimand 2:** Tabelle mit Fenster (A/B/C) x Methode (analytisch/Bootstrap/
    ARIMA) x ggf. Basiswert-Variante, jeweils `Kumuliert_Gesamt_2021_2030`,
    95 %-Unsicherheitsintervall, `Overshoot_eigen`, und Klassifikation
    (kompatibel/optimistischer/pessimistischer als Expertenrat).
- **Datenabgleich (4a) wird als eigener kurzer Abschnitt im Ergebnisbericht
  vorangestellt** (Quellen, Zugriffsdaten, Vintage-Klaerung, Entscheidungsregel-
  Anwendung), bevor irgendein Ergebnis gezeigt wird.
- Keine politische Bewertung im Fliesstext (siehe 8c) - ausschliesslich
  zahlen-/methodenbezogene Formulierungen.
- Rundung: eine Nachkommastelle fuer Mt CO2-Aeq., eine Nachkommastelle fuer
  Prozentpunkte.

---

## Offene Punkte fuer den Menschen (vor Freigabe/Einfrieren zu klaeren)

Diese Punkte kann und darf der sap-autor nicht selbst entscheiden:

1. **Verifikation "keine Ergebnis-Vorabsicht":** Bitte bestaetigen, dass die im
   Auftrag genannten Zahlen (625 Mt, 60-100 Mt, ca. 2 % H1-Rueckgang) ausschliesslich
   aus der Aufgabenbeschreibung stammen und NICHT bereits durch eigene Sichtung des
   vollstaendigen FAZ-Artikels, des Agora-Berichts oder des Expertenrats-Gutachtens
   gewonnen wurden. Falls doch bereits inhaltlich gesichtet wurde, muss der Status
   dieses SAP vor dem Einfrieren auf "exploratory (retrospektiv)" geaendert werden
   (siehe Abschnitt 0).
2. **Primaerquelle Expertenrat-Gesamtbudget:** Ist die absolute Gesamtbudgetgroesse
   2021-2030 (nicht nur der 60-100-Mt-Ueberschreitungskorridor) aus einem offiziellen
   Expertenrats-Dokument bekannt/auffindbar, oder muss von vornherein mit dem in
   Abschnitt 2 beschriebenen Fallback (Randwerte 60/100 Mt statt Punktschaetzung)
   gearbeitet werden?
3. **Toleranzschwelle Estimand 1 (0,05 Prozentpunkte) und Tie-Break-Regel:** Bitte
   pruefen, ob diese Schwelle fachlich sinnvoll ist oder angepasst werden soll.
4. **Namenskonvention/Ordnerstruktur:** Bitte bestaetigen, dass
   `Analysen/2026-08-expertenrat-budgetabgleich/` als Ordnername akzeptabel ist
   (alternativ: anderes Thema-Kuerzel).
5. **Amendment-vs-neuer-SAP-Entscheidung (Abschnitt 0b):** Bitte explizit
   gegenzeichnen, dass die Wahl "neuer SAP statt Amendment" mitgetragen wird, bevor
   eingefroren wird.

Nach Klaerung dieser Punkte: Versionsnummer und Datum ergaenzen, Status auf
"final" setzen, Commit als Audit-Trail ("SAP eingefroren...").
