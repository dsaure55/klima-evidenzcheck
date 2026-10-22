# Statistischer Analyseplan (SAP) – Prognose-Register 2027

**Titel:** Welche Werte erwarten wir für das Jahr 2027? Vier vorab festgelegte,
später eindeutig als „getroffen / nicht getroffen“ bewertbare Vorhersagen:
(V1) Sommermitteltemperatur Deutschland, (V2) Anzahl Hitzetage Deutschland,
(V3) Anzahl Monate mit globaler Temperatur über 1,5 °C über vorindustriell,
(V4) deutsche Treibhausgasemissionen. Berechnet wird ausschließlich mit Daten
bis Ende 2026.

**Format:** Klima Kompass · Evidenzcheck, Unterformat „Prognose-Register“
(prospektiv). Inhaltsstufe: Evidenzcheck (neue Inferenz).
**Version:** 0.3
**Status: draft**
**Datum:** 22.10.2026
**Autor:in:** Claude (sap-autor-Subagent)
**Freigabe/Einfrieren:** ausstehend. Das Einfrieren erfolgt ausschließlich
durch Daniel Saure, nachdem er den vollständigen aktuellen Text gelesen und
ausdrücklich bestätigt hat (CLAUDE.md, Verifikationspflicht). V3 darf getrennt
eingefroren werden (Rückfrage 7, beantwortet 22.10.2026). Offene Vorbedingung
vor dem Einfrieren von V2: Dateiprüfung nach Rückfrage 3 (siehe 3.2). Offene
Vorbedingungen vor dem Einfrieren aller Teile (auch V3): Rückfragen 20 und 21
(siehe 12).

**Geplanter Ordner:** `Analysen/2026-10-prognose-register-2027/`
**Vorlage:** `SAP-Vorlage/SAP-Template.md`. Die Struktur wurde übernommen, die
Vorlage selbst ist unverändert. Die Abschnitte 0–11 entsprechen der Vorlage.
Abschnitt 12 (Rückfragen) und Abschnitt 13 (Rohdateien) sind projektspezifische
Ergänzungen, wie im Prognose-Check.

**Versionshistorie:**
- **v0.1 draft (22.10.2026):** Erstentwurf, präregistriert. Keine Daten
  gesichtet, kein Code ausgeführt.
- **v0.2 draft (22.10.2026):** Rückfragen 1–16 von Daniel Saure am 22.10.2026
  beantwortet („alle wie empfohlen“, mit zwei Präzisierungen: Rückfrage 14
  Registereinträge #2–#5 plus Substack, Rückfrage 16 Python statt R). Antworten
  in die betroffenen Abschnitte eingearbeitet (0, 0.1, 2.0–2.5, 3.2–3.4, 9, 10,
  11, 12, 13). Rückfrage 3 teilweise offen (Dateiprüfung durch Daniel vor dem
  Einfrieren). Neue Rückfragen 17–19 aus der Einarbeitung. Status weiter
  draft. Keine Daten gesichtet, kein Code ausgeführt. Zusätzlich gelesen:
  `Prognose-Register/01_gasspeicher-winter-2026-27.md` (Formatvorlage für die
  Einträge #2–#5).
- **v0.3 draft (22.10.2026):** Rückfragen 17–19 von Daniel Saure am 22.10.2026
  beantwortet („17 bis 19 wie von dir vorgeschlagen“): 17 Option (b) mit
  Korrekturregel per gekennzeichneter Neuregistrierung, 18 Dateinamen und
  Reservierung #2–#5, 19 Option (a) gemeinsamer Substack-Beitrag bis
  31.01.2027. Eingearbeitet in Kopf, 0.1, 7, 10, 11, 12. Aus der Einarbeitung
  ergeben sich zwei neue Rückfragen (20: welche Fassung bei einer
  Neuregistrierung primär zählt, Widerspruch zu Abschnitt 7; 21: Verhältnis
  zur Commit-Regel in CLAUDE.md). Rückfrage 3 unverändert teilweise offen.
  Status weiter draft. Keine Daten gesichtet, kein Code ausgeführt.

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst; Einfrieren steht noch aus)
[ ] Exploratorisch

- **Präregistriert vor Datenzugriff.** Für diesen SAP wurden keine Daten
  gesichtet: weder DWD-Zeitreihen (Sommermittel, Hitzetage) noch
  Copernicus/ERA5-Monatswerte noch UBA-Emissionsdaten oder -Projektionen noch
  OWID. Kein Code ausgeführt. Der Auftrag enthielt keine Analyseergebnisse,
  Zahlen oder Grafiken.
- **Gelesen wurden** (erlaubt laut Auftrag, um Modelle und Definitionen zu
  übernehmen): SAP, Analysebericht, Validierungsbericht, Abweichungsprotokoll
  und Skript des validierten Checks `Analysen/2026-09-sommer-2026-normal/`,
  der SAP `Analysen/2026-08-hitzesommer-2026/` und der SAP v1.0 final
  `Analysen/2026-10-prognose-check-projektionsberichte/`. Für v0.2 zusätzlich
  der Registereintrag `Prognose-Register/01_gasspeicher-winter-2026-27.md`
  (nur als Formatvorlage; er enthält Vorhersagewerte einer anderen, bereits
  validierten und veröffentlichten Analyse, die mit V1–V4 nichts zu tun
  haben). Für v0.3 wurde nichts Zusätzliches gelesen.
- **Transparenz über Vorwissen:** Aus dem validierten Sommer-2026-Check sind
  der Modellfit 1971–2025, die Sensitivität S2 (Fit 1971–2026) und der
  vorläufige DWD-Wert für den Sommer 2026 bekannt. Damit ist die
  Trendgrundlage für V1 weitgehend absehbar. Das ist für ein Prognose-Register
  unschädlich: Maßgeblich ist, dass **keine Beobachtung des Zieljahres 2027**
  existiert oder gesichtet wird, wenn Methode und Bewertungsregel festgelegt
  werden. Eine Prognosezahl wird in diesem SAP weder berechnet noch genannt.
- **Ergebnisoffenheit:** Jede Vorhersage kann getroffen oder nicht getroffen
  werden. Alle vier Bewertungen werden veröffentlicht, unabhängig vom Ausgang.

### 0.1 Sperren und Fristen (verbindlich)

**Sperre 1 – Datenschnitt:** Berechnet wird ausschließlich mit Daten, deren
Beobachtungszeitraum spätestens am 31.12.2026 endet. Für V4 gilt zusätzlich:
Es werden nur Veröffentlichungen verwendet, die bis zum 31.12.2026 erschienen
sind (Details in 3.4). Keine Beobachtung aus 2027, auch keine Tageswerte und
keine vorläufigen Werte, darf vor der Registrierung der Vorhersagen gesichtet
werden. Das gilt ausdrücklich auch für den Copernicus-„Climate Pulse“
(tägliche ERA5-Werte nahezu in Echtzeit).

**Sperre 2 – Reihenfolge:** Die Berechnung (analyst-Subagent) beginnt erst,
wenn
(a) der SAP bzw. der betreffende Teil von Daniel Saure eingefroren ist. V3
darf zusammen mit den allgemeinen Abschnitten getrennt eingefroren werden
(Rückfrage 7, beantwortet; Abschnittsliste dort), **und**
(b) der Prognose-Check `Analysen/2026-10-prognose-check-projektionsberichte/`
abgeschlossen ist. „Abgeschlossen“ heißt (Rückfrage 9, beantwortet): Der
Validierungsbericht liegt als Datei vor, enthält keinen Befund „kritisch“, und
Daniel Saure hat die Ergebnisse freigegeben. Eine Veröffentlichung auf
Substack ist nicht erforderlich, **und**
(c) die Daten bis Ende 2026 bei der jeweiligen Quelle veröffentlicht sind.

**Vorab festgelegte Ausnahme von Sperre 2 (b), nur für V3** (Rückfrage 8,
beantwortet: Option a): Ist der Prognose-Check am 12.01.2027 nicht
abgeschlossen, wird V3 trotzdem gerechnet und registriert. Begründung: V3
teilt weder Daten noch Methode mit dem Prognose-Check, und die V3-Frist ist
durch die Veröffentlichung der 2027-Werte bei Copernicus erzwungen. Sperre 2
(a) und (c) sowie Sperre 1 und 3 gelten für V3 unverändert. Für V1, V2 und V4
gibt es keine Ausnahme.

**Sperre 3 – Keine Rückkopplung aus dem Prognose-Check:** Ergebnisse des
Prognose-Checks dürfen Methoden, Fenster oder Intervalle dieses SAP nicht
verändern (Rückfrage 11, beantwortet: nicht nutzen). Eine Änderung nach dem
Einfrieren ist nur als gekennzeichnetes Amendment **vor** der Berechnung
zulässig, mit Begründung und erneuter Freigabe durch Daniel Saure.

**Zeitkritisch – V3 (Copernicus):** Copernicus veröffentlicht ab Anfang Januar
2027 die ersten Werte für 2027 (tägliche ERA5-Werte im Climate Pulse bereits ab
den ersten Januartagen, den Monatswert Januar 2027 im Monatsbulletin Anfang
Februar 2027). **Der Teil V3 muss deshalb bis 15.12.2026 eingefroren und bis
15.01.2027 berechnet, validiert, von Daniel Saure freigegeben und registriert
sein** (Rückfragen 7 und 17, beantwortet). Rechnung, Validierung, Freigabe und
Registrierungs-Commit von V3 liegen also alle zwischen der Veröffentlichung
des C3S-Monatswerts Dezember 2026 (Anfang Januar 2027) und dem 15.01.2027.
V1, V2 und V4 werden bis 31.12.2026 eingefroren.

| Schritt | V1 Sommer | V2 Hitzetage | V3 Monate > 1,5 °C | V4 THG |
|---|---|---|---|---|
| Einfrieren SAP (spätestens) | 31.12.2026 | 31.12.2026 (Vorbedingung: Dateiprüfung Rückfrage 3) | **15.12.2026** (getrenntes Einfrieren zulässig) | 31.12.2026 |
| Frühester Rechenbeginn | 01.01.2027, nach Sperre 2 | sobald Jahreswert 2026 beim DWD vorliegt, nach Sperre 2 | sobald der Monatswert Dezember 2026 bei C3S vorliegt, nach Sperre 2 (a), (c); Ausnahme von (b) siehe oben | 01.01.2027, nach Sperre 2 |
| Registrierung (gemeinsamer Commit von Ergebnis-CSV und Registerdatei, erst nach Validierung und Freigabe durch Daniel Saure) spätestens | 31.01.2027 | 31.01.2027 | **15.01.2027** | 31.01.2027 (in jedem Fall vor der UBA-Vorjahresschätzung 2026, März 2027) |
| Registereintrag | #2 | #3 | #4 | #5 |
| Gemeinsamer Substack-Beitrag (alle vier Vorhersagen) spätestens | 31.01.2027 | 31.01.2027 | 31.01.2027 | 31.01.2027 |
| Stichtag der Auswertung | 15.09.2027 | 31.01.2028 | 31.01.2028 | 31.03.2028 |

**Registrierung:** Die berechneten Vorhersagen werden mit Datum, Datenstand,
Zugriffsdatum und Prüfsummen der Rohdateien in einer Ergebnistabelle
`output/register_2027.csv` abgelegt. Zusätzlich wird je Vorhersage ein
Eintrag im Prognose-Register angelegt (Rückfragen 14 und 18, beantwortet):

| Vorhersage | Registereintrag | Datei (festgelegt, Rückfrage 18) |
|---|---|---|
| V1 Sommermittel 2027 | **#2** | `Prognose-Register/02_sommermittel-2027.md` |
| V2 Hitzetage 2027 | **#3** | `Prognose-Register/03_hitzetage-2027.md` |
| V3 Monate > 1,5 °C 2027 | **#4** | `Prognose-Register/04_monate-ueber-1-5-grad-2027.md` |
| V4 THG-Emissionen 2027 | **#5** | `Prognose-Register/05_thg-emissionen-2027.md` |

**Reservierung der Nummern (Rückfrage 18, beantwortet):** Die Nummern #2–#5
sind für dieses Register reserviert. Ein anderer Registereintrag, der bis
Januar 2027 entsteht, erhält #6 oder höher. Die Nummern #2–#5 folgen der
Reihenfolge V1–V4, nicht der zeitlichen Reihenfolge der Registrierung (V3 wird
zuerst registriert). Format und Felder der Einträge: Abschnitt 11.

**Ablauf je Vorhersage (Rückfrage 17, beantwortet: Option b):**
1. Rechnung nach dem eingefrorenen SAP (analyst-Subagent). Es entstehen die
   Ergebnis-CSV und ein Entwurf der Registerdatei.
2. Unabhängige Prüfung durch den validator-Subagenten gegen den SAP;
   Validierungsbericht als Datei im Analyseordner.
3. Daniel Saure liest den Registereintrag und gibt ihn ausdrücklich frei.
   Erst danach wird das Feld „Freigabe“ im Eintrag ausgefüllt (Abschnitt 11).
4. Ergebnis-CSV und Registerdatei werden **gemeinsam** committet, erst nach
   Validierung und Freigabe und innerhalb der jeweiligen Frist (Tabelle
   oben). Der Hash dieses Registrierungs-Commits ist der verbindliche
   Zeitstempel der Vorhersage.
Was zwischen Schritt 1 und Schritt 4 committet werden darf (Verhältnis zur
Commit-Regel in CLAUDE.md), ist offen: Rückfrage 21.

Weichen CSV und Registerdatei voneinander ab, gilt die CSV (sie ist die vom
Skript erzeugte Quelle); die Abweichung wird als Fehler im Register vermerkt.
Nach der Registrierung wird an den Vorhersagen nichts mehr geändert, mit
einer einzigen Ausnahme: der Neuregistrierung nach der folgenden
Korrekturregel.

**Korrekturregel nach dem Registrierungs-Commit (Rückfrage 17, beantwortet):**
- Findet der validator nach dem Registrierungs-Commit einen Rechenfehler,
  wird dieser als **gekennzeichnete Neuregistrierung mit neuem Commit**
  korrigiert.
- Ein Rechenfehler ist eine Abweichung der Rechnung von der eingefrorenen
  Spezifikation (2.1–2.4, 6) oder ein Fehler in den eingelesenen Daten. Eine
  Neuregistrierung ändert nie Methode, Fenster, Intervallniveau,
  Schwellenregel oder Bewertungsregel (Abschnitte 5.3 und 7).
- **Der ursprüngliche Eintrag bleibt sichtbar und wird nicht
  überschrieben:** `output/register_2027.csv` und der registrierte Teil der
  Registerdatei bleiben unverändert. Die korrigierten Werte werden in einer
  neuen Datei `output/register_2027_neuregistrierung_<n>.csv` abgelegt und in
  der Registerdatei als Nachtrag „Neuregistrierung <n>“ ergänzt, mit Datum,
  Grund (Beschreibung des Rechenfehlers) und Commit-Hash.
- Die Neuregistrierung durchläuft dieselben Schritte 2–4 wie die
  Erstregistrierung (Validierung, ausdrückliche Freigabe durch Daniel Saure,
  Commit).
- Bei der Auswertung wird **gegen beide Fassungen** bewertet. Beide
  Ergebnisse werden berichtet, und die Korrektur wird mit Datum und Grund
  offengelegt (Abschnitt 11). Welche Fassung in der Primärbewertung und in
  der Gesamtbilanz „k von 4“ zählt und ob eine Neuregistrierung zeitlich
  begrenzt ist, ist offen: Rückfrage 20.

**Öffentliche Registrierung auf Substack (Rückfrage 19, beantwortet: Option
a):** ein gemeinsamer Beitrag für alle vier Vorhersagen nach der Registrierung
aller vier, spätestens am 31.01.2027 (Abschnitt 11). Er ersetzt den
Commit-Zeitstempel nicht. Der verbindliche Zeitstempel ist der Commit.

**Fallback V3, falls der Dezemberwert 2026 nicht rechtzeitig vorliegt:**
Liegt der C3S-Monatswert Dezember 2026 bis zum 12.01.2027 nicht vor, wird V3
mit Daten bis einschließlich November 2026 berechnet. Der Prognosehorizont
beträgt dann 13 statt 12 Monate (Dezember 2026 wird mitsimuliert, aber nicht
gezählt). Ein Ersatz des Dezemberwerts aus Tageswerten des Climate Pulse ist
ausgeschlossen, weil dort zugleich 2027-Werte sichtbar wären.

## 1. Hintergrund / Rationale

Retrospektive Prüfungen (wie der laufende Prognose-Check) zeigen, wie gut
frühere Projektionen waren. Sie haben aber einen strukturellen Nachteil: Die
Bewertungsregel wird erst festgelegt, wenn der Ausgang bekannt ist. Ein
Prognose-Register dreht das um. Methode, Datenquelle, Stichtag und
Bewertungsregel werden festgelegt und öffentlich mit Zeitstempel
registriert, **bevor** das Zieljahr beginnt. Danach ist keine nachträgliche
Anpassung mehr möglich.

Mehrwert:
1. **Prüfbarkeit der eigenen Methoden:** Die Modelle aus validierten
   Klima-Kompass-Checks (Trendmodell des Sommer-2026-Checks) werden einem
   echten Out-of-sample-Test unterzogen.
2. **Ehrliche Unsicherheitskommunikation:** Jede Vorhersage hat ein
   Prognoseintervall. Bewertet wird, ob der beobachtete Wert darin liegt,
   nicht nur, ob die Punktschätzung „nah“ war.
3. **Kalibrierung über die Zeit:** Über mehrere Register-Jahrgänge lässt sich
   prüfen, ob 95-%-Intervalle tatsächlich in etwa 95 % der Fälle treffen.
   Ein einzelner Jahrgang mit vier Vorhersagen kann das nicht leisten
   (siehe 7 und 8).

Die vier Größen decken drei Ebenen ab: deutsches Klima (V1, V2), globales
Klima (V3) und deutsche Emissionen (V4). Sie werden als Einträge #2–#5 im
bestehenden Prognose-Register geführt (Eintrag #1: Gasspeicher-Entnahme
Winter 2026/27).

## 2. Fragestellung (Estimands)

### 2.0 Allgemeine Festlegungen für alle Vorhersagen

- Jede Vorhersage Vk besteht aus: **Punktvorhersage** (Median der
  prädiktiven Verteilung), **primärem 95-%-Prognoseintervall** [L95, U95]
  und **sekundärem 80-%-Prognoseintervall** [L80, U80] (Rückfrage 12,
  beantwortet: beibehalten).
- **Primäre Bewertungsregel (gilt für V1–V4):** „getroffen“, wenn der am
  Stichtag nach Abschnitt 3 festgestellte Beobachtungswert Y₂₀₂₇ die Bedingung
  L95 ≤ Y₂₀₂₇ ≤ U95 erfüllt. Die Grenzen zählen zum Intervall. Sonst „nicht
  getroffen“. Die Rundung der Grenzen ist je Vorhersage festgelegt.
- „Nicht auswertbar“ ist ein eigener dritter Ausgang. Er tritt nur unter den
  in Abschnitt 3 vorab genannten Bedingungen ein (Quelle stellt die Größe
  nicht bereit). Er wird nie als „getroffen“ oder „nicht getroffen“ gezählt.
- **Sekundäre Bewertungsgrößen** (vorab festgelegt, immer berichtet, nie in
  der Überschrift): Treffer im 80-%-Intervall; Prognosefehler Y₂₀₂₇ −
  Punktvorhersage; Lage des Beobachtungswerts in der prädiktiven Verteilung
  (PIT-Wert = prädiktive Verteilungsfunktion an der Stelle Y₂₀₂₇); bei V3
  zusätzlich der Ranked Probability Score (RPS); Vergleich mit einer naiven
  Referenzprognose (je Vorhersage festgelegt).

### 2.1 V1 – Sommermitteltemperatur Deutschland 2027 (Registereintrag #2)

- **Zielgröße Y₂₀₂₇:** DWD-Gebietsmittel Deutschland der Lufttemperatur,
  Jahreszeit Sommer (Juni–August) 2027, in °C, Spalte „Deutschland“ der Datei
  `regional_averages_tm_summer.txt` (wie im Sommer-2026-Check).
- **Modell (übernommen aus dem validierten Sommer-2026-Check, Rahmen R3):**
  OLS-Regression T = b₀ + b₁·Jahr + ε auf den Sommern des Trendfensters;
  klassisches 95-%-Prognoseintervall für 2027:
  ŷ₂₀₂₇ ± t(0,975; n−2) · √(σ̂²·(1 + h₂₀₂₇)), h = Hebelwert des Jahres 2027.
- **Primäres Trendfenster: 1971–2026 (n = 56)** (Rückfrage 1, beantwortet).
  Begründung: Das validierte Modell schätzt den Trend auf allen Sommern ab
  1971 bis zum Vorjahr des Zieljahres und bewertet das Zieljahr
  out-of-sample. Für das Zieljahr 2027 entspricht das dem Fenster 1971–2026.
  Diese Spezifikation wurde im Sommer-2026-Check als Sensitivität S2 gerechnet
  und unabhängig validiert (Validierungsbericht, Abschnitt 3.4). Das
  unveränderte Fenster 1971–2025 ist Sensitivität S1-a. Ein gleitendes Fenster
  wird nicht gerechnet. Es wird nichts anderes geändert: kein Fensterbeginn,
  keine Transformation, keine Kovariaten.
- **Punktvorhersage:** ŷ₂₀₂₇ (bei symmetrischem t-Intervall identisch mit
  dem Median).
- **80-%-Intervall:** dieselbe Formel mit t(0,90; n−2).
- **Rundung für die Bewertung:** Grenzen auf 0,01 °C gerundet (Genauigkeit
  der DWD-Datei, Format zwei Nachkommastellen). Verglichen wird mit dem
  Dateiwert auf zwei Nachkommastellen.
- **Naive Referenzprognose (sekundär):** Mittel der Klimanormalperiode
  1991–2020 (aktuelle WMO-Referenz), mit Intervall
  Mittel ± t(0,975; 29)·SD·√(1 + 1/30).

### 2.2 V2 – Anzahl Hitzetage Deutschland 2027 (Registereintrag #3)

- **Kenntag:** Hitzetag („Heißer Tag“) = Tag mit Tageshöchsttemperatur
  Tmax ≥ 30,0 °C (DWD-Definition).
- **Zielgröße Y₂₀₂₇:** **DWD-Gebietsmittel Deutschland der Anzahl Heißer
  Tage im Kalenderjahr 2027** (CDC `regional_averages_DE`, Kenntage, jährliche
  Werte). Das Gebietsmittel ist ein Flächenmittel aus gerasterten
  Stationsdaten und daher in der Regel keine ganze Zahl. Es ist keine
  Einzelstation und keine Summe über Stationen.
  Begründung: konsistent mit V1 (gleiche Raumbezugsgröße Deutschland),
  amtlich, lange homogene Reihe, keine Auswahl einzelner Stationen nötig.
  Entscheidung für das Gebietsmittel: Rückfrage 3, beantwortet.
  **Offene Vorbedingung:** Ob die Datei existiert und ab welchem Jahr sie
  beginnt, ist noch nicht geprüft (siehe 3.2 und Rückfrage 3).
- **Primäres Modell:** OLS-Regression auf der **Quadratwurzel** der jährlichen
  Werte: √Y = c₀ + c₁·Jahr + ε, Trendfenster **1971–2026** (gleiches Fenster
  wie V1; Rückfrage 4, beantwortet). 95-%-Prognoseintervall auf der
  Wurzelskala wie in V1; die Grenzen werden quadriert zurücktransformiert, die
  untere Grenze wird bei 0 abgeschnitten, falls die Wurzelskala-Grenze negativ
  ist.
  Begründung: Zähldatenähnliche Größen sind rechtsschief, und ihre Streuung
  wächst mit dem Niveau. Die Wurzeltransformation stabilisiert die Varianz.
  Quantile bleiben unter monotoner Rücktransformation erhalten, das
  Intervall ist also auf der Originalskala gültig. Punktvorhersage = Median =
  (Wurzelskala-Vorhersage)².
- **80-%-Intervall:** analog mit t(0,90; n−2).
- **Rundung für die Bewertung:** Grenzen auf die Nachkommastellen gerundet,
  die die DWD-Datei für diese Größe verwendet (beim Datenzugriff
  dokumentieren). Verglichen wird mit dem Dateiwert.
- **Naive Referenzprognose (sekundär):** Mittel 1991–2020 der Hitzetage, mit
  Intervall aus den empirischen 2,5-%- und 97,5-%-Quantilen der 30 Werte.

### 2.3 V3 – Anzahl Monate 2027 mit globaler Temperatur über 1,5 °C über vorindustriell (Registereintrag #4)

- **Zielgröße Y₂₀₂₇:** Anzahl K ∈ {0, 1, …, 12} der Kalendermonate 2027, deren
  globale Mitteltemperatur der bodennahen Luft (ERA5, Copernicus Climate
  Change Service, C3S) mehr als 1,50 °C über dem vorindustriellen Niveau liegt.
- **Definition wie bei Copernicus:**
  - Monatliche Anomalie der globalen 2-m-Temperatur aus ERA5 gegenüber dem
    Monatsmittel **1991–2020** (C3S-Standardreferenz),
  - umgerechnet auf **vorindustriell = 1850–1900**, indem der von C3S
    veröffentlichte konstante Abstand zwischen 1991–2020 und 1850–1900
    addiert wird (so berichtet C3S in den Monatsbulletins „x °C über
    vorindustriell“). Der Wert dieses Abstands wird beim Datenzugriff aus der
    C3S-Methodikbeschreibung übernommen und im `run_log.txt` mit Fundstelle
    festgehalten. Er wird hier bewusst nicht aus dem Gedächtnis eingetragen.
  - Maßgeblich sind die von C3S veröffentlichten Monatswerte über
    vorindustriell, gerundet auf zwei Nachkommastellen (wie veröffentlicht).
- **Schwellenregel (primär):** Ein Monat zählt, wenn der veröffentlichte
  Wert **> 1,50 °C** ist (streng größer, Wortlaut „über 1,5 °C“; Rückfrage 5,
  beantwortet). Variante „≥ 1,50 °C“ wird als Sensitivität S3-g mitgezählt und
  berichtet.
- **Primäres Modell:** lineare Regression mit AR(1)-Fehlern auf der
  monatlichen Anomaliereihe (gegenüber 1991–2020):
  a_t = α + β·t + u_t, u_t = φ·u_{t−1} + e_t, e_t ~ N(0, σ²),
  t = Monatsindex. Trendfenster **Januar 1991 bis Dezember 2026**
  (432 Monate). Schätzung per Maximum Likelihood.
  Begründung: Monatswerte sind stark autokorreliert (u. a. ENSO-Persistenz).
  AR(1) ist die einfachste Fehlerstruktur, die das abbildet. Fenster ab 1991
  = Beginn der C3S-Referenzperiode.
- **Prädiktive Verteilung von K (Simulation):** B = 100 000 simulierte Pfade
  Januar–Dezember 2027, jeweils
  (1) Parametervektor (α, β, φ, log σ) aus der asymptotischen
  Normalverteilung der ML-Schätzer gezogen (Parameterunsicherheit),
  (2) Startwert = geschätztes Residuum u im Dezember 2026,
  (3) zwölf Monate fortgeschrieben, Offset addiert, auf zwei
  Nachkommastellen gerundet, Monate > 1,50 °C gezählt.
  Fester Seed: 20261022. Gezogene φ mit |φ| ≥ 1 werden verworfen und neu
  gezogen; der Anteil wird berichtet.
- **Punktvorhersage:** Median der simulierten K.
- **95-%-Intervall:** [L95, U95] mit L95 = kleinstes k mit P(K ≤ k) ≥ 0,025 und
  U95 = kleinstes k mit P(K ≤ k) ≥ 0,975 (ganze Zahlen). 80-%-Intervall
  analog mit 0,10 und 0,90. Wegen der diskreten Größe kann die tatsächliche
  Überdeckung über 95 % liegen; sie wird berichtet.
- **Zusätzlich registriert:** die vollständige Wahrscheinlichkeitsverteilung
  P(K = k) für k = 0…12 und je Monat 2027 die Wahrscheinlichkeit, über 1,50 °C
  zu liegen (Grundlage für RPS und Brier-Score).
- **Naive Referenzprognose (sekundär):** Persistenz, d. h. K₂₀₂₇ = Anzahl der
  Monate 2026 über 1,50 °C (ohne Intervall, nur Fehlervergleich).

### 2.4 V4 – Deutsche Treibhausgasemissionen 2027 (Registereintrag #5)

- **Zielgröße Y₂₀₂₇:** Treibhausgasemissionen Deutschlands 2027, gesamt
  **ohne LULUCF**, ohne internationalen Luft- und Seeverkehr, in Mt
  CO₂-Äquivalent, wie in der **UBA-Vorjahresschätzung für 2027** (Veröffentlichung
  nach § 5 KSG, erwartet bis 15.03.2028) ausgewiesen. Abgrenzung „gesamt ohne
  LULUCF“ wie im Prognose-Check (SAP 3.2).
- **Datenbasis (Stand 31.12.2026):** UBA-Treibhausgasinventar, neueste bis
  31.12.2026 veröffentlichte Submission (voraussichtlich Submission 2026,
  Jahre bis 2024), ergänzt um die UBA-Vorjahresschätzung für 2025 (März 2026)
  als letzten Wert. Der Emissionswert 2026 ist zum Rechenzeitpunkt nicht
  veröffentlicht. Der Prognosehorizont beträgt daher h = 2 Jahre (2025 → 2027).
- **Primäres Modell: Random Walk mit Drift auf der logarithmierten Reihe**
  (Rückfrage 10, beantwortet).
  d_t = ln E_t − ln E_{t−1}; Drift μ̂ = Mittel der d_t, σ̂ = Standardabweichung
  der d_t über die **Differenzen 2006–2025** (Jahrespaare 2005/06 bis
  2024/25, m = 20).
  Punktvorhersage (Median): E₂₀₂₅ · exp(2·μ̂).
  95-%-Prognoseintervall:
  ln E₂₀₂₅ + 2·μ̂ ± t(0,975; m−1) · σ̂ · √(2 + 2²/m), zurücktransformiert mit exp.
  80-%-Intervall analog mit t(0,90; m−1).
  Begründung: Ein Drift-Modell setzt am zuletzt bekannten Niveau an und
  schreibt die mittlere relative Jahresänderung fort. Es braucht keine
  Annahmen über Maßnahmen und ist in der Prognoseliteratur der übliche
  einfache Vergleichsmaßstab. 20 Jahre: lang genug für eine stabile
  Driftschätzung und ohne die Sonderentwicklung der frühen 1990er Jahre
  (Wiedervereinigung). Andere Fenster nur als Sensitivitäten S4-a bis S4-f.
- **Rundung für die Bewertung:** Grenzen auf 0,1 Mt CO₂e gerundet.
  Verglichen wird mit dem Wert aus der genauesten amtlichen UBA-Tabelle der
  Vorjahresschätzung (nicht mit einer gerundeten Zahl aus der
  Pressemitteilung, sofern eine genauere Tabelle existiert).
- **Vergleichsprognose (sekundär, nicht bewertet als Treffer):** der in den
  neuesten bis 31.12.2026 veröffentlichten UBA-Projektionsdaten ausgewiesene
  Wert für 2027 im Mit-Maßnahmen-Szenario (MMS). Berichtet wird nur dessen
  Abweichung vom Beobachtungswert, neben der eigenen Vorhersage. Liegt kein
  expliziter Wert für 2027 vor, entfällt der Vergleich (dokumentiert, keine
  Interpolation).
- **Naive Referenzprognose (sekundär):** keine Veränderung, d. h. E₂₀₂₇ = E₂₀₂₅.

### 2.5 Abgrenzung zum Prognose-Check (SAP v1.0 final)

| | Prognose-Check | Prognose-Register 2027, V4 |
|---|---|---|
| Richtung | retrospektiv | prospektiv |
| Gegenstand | Projektionsberichte der Bundesregierung 2015–2023 (MMS/MWMS) | eigene statistische Vorhersage |
| Zieljahre | 2015 bis letztes Inventarjahr (≈ 2024), 2025 nur in S7 | ausschließlich 2027 |
| Ist-Wert | UBA-Inventar (primär), Vorjahresschätzung 2025 nur in S7 | UBA-Vorjahresschätzung 2027 (primär) |
| Statistik | rein deskriptiv, keine Intervalle | Prognoseintervall, Trefferregel |

- **Keine Doppelung:** keine gemeinsamen Zieljahre, keine gemeinsamen
  Kennzahlen.
- **Kein Widerspruch:** Der Prognose-Check schließt eine Verallgemeinerung
  seiner Ergebnisse auf die Treffsicherheit künftiger Projektionen
  ausdrücklich aus (dort Abschnitt 9). Deshalb werden seine Fehlermaße hier
  **nicht** zur Konstruktion von Intervallen verwendet (Sperre 3;
  Rückfrage 11, beantwortet: nicht nutzen). Die UBA-Projektion für 2027
  erscheint hier nur als beschreibende Vergleichsprognose, nicht als
  Bewertung der Projektionen.
- Begriffsgebrauch wie im Prognose-Check: Projektionen sind bedingte
  Szenarien. Die eigene V4-Vorhersage ist eine unbedingte statistische
  Fortschreibung. Beides wird im Bericht nicht gleichgesetzt.

### 2.6 Abgrenzung zu bestehenden Analysen

- **Sommer-2026-Check:** V1 übernimmt dessen Modell. Es wird kein Estimand
  jenes Checks neu bewertet. Die dortigen Ergebnisse bleiben unberührt.
- **Hitzesommer 2026** (`Analysen/2026-08-hitzesommer-2026/`): betrifft
  hitzebedingte Sterbefälle (RKI). Andere Zielgröße, andere Daten. V2 zählt
  meteorologische Kenntage, keine Gesundheitsfolgen. Keine Überschneidung.
- **Prognose-Register #1** (Gasspeicher-Entnahme Winter 2026/27): eigene
  Grundlage (validierte Gasspeicher-Analyse), andere Zielgröße. Gemeinsam
  ist nur das Registerformat. Keine Überschneidung in Daten oder Methode.

**Ausdrücklich nicht Gegenstand:** Ursachenanalyse (Attribution), Bewertung
von Klimapolitik, Zielerreichung nach KSG, physikalische Klimaprojektionen,
saisonale Wettervorhersagen.

## 3. Datenquelle

**Template-Pflichtfelder (werden beim Datenzugriff ausgefüllt und im
`run_log.txt` gespiegelt):**
- Quelle(n): siehe 3.1–3.4
- Zugriffsdatum: [TT.MM.JJJJ – je Quelle beim Datenzugriff eintragen]
- Datenstand laut Quelle: [Dateikopf „erstellt am“, Bulletin-Datum bzw.
  Submission – beim Datenzugriff eintragen]
- Lizenz: [je Quelle beim Datenzugriff eintragen; DWD: Quellenangabe
  „Deutscher Wetterdienst“; C3S: Copernicus-Lizenz mit Quellenangabe; UBA:
  Nutzungsbedingungen laut Veröffentlichung]

### 3.1 V1 – DWD Sommermittel
- **Primärquelle:** DWD Climate Data Center, `regional_averages_DE/seasonal/
  air_temperature_mean/regional_averages_tm_summer.txt`, Spalte Deutschland.
- **Rechendaten:** Datei, abgerufen im Rechenfenster (0.1), Jahre 1881–2026.
  Verwendet wird der Dateiinhalt zum Abrufzeitpunkt, auch wenn er von der im
  Sommer-Check abgelegten Fassung abweicht.
- **Integritäts-Check vor der Rechnung:** Vergleich 1971–2025 mit
  `Analysen/2026-09-sommer-2026-normal/rohdaten/regional_averages_tm_summer.txt`.
  Abweichungen je Jahr werden dokumentiert. Sind alle Werte 1971–2026
  identisch, muss der Fit 1971–2026 die im Validierungsbericht (Abschnitt 3.4,
  S2) dokumentierte Steigung reproduzieren, sonst Stopp und Rückfrage. Sind
  Werte revidiert, wird mit der neuen Datei gerechnet und die Revision im
  Register vermerkt.
- **Bewertungsdaten (Stichtag):** dieselbe Datei in der Fassung, die am
  **15.09.2027** abgerufen wird (Rückfrage 2, beantwortet; Dateikopf „erstellt
  am“ muss ≥ 01.09.2027 sein, sonst Abruf an jedem folgenden Werktag
  wiederholen, bis eine solche Fassung vorliegt). Spätere Revisionen ändern
  die Bewertung nicht, werden aber im Auswertungsbericht genannt, wenn sie bis
  zur Veröffentlichung bekannt werden. Die DWD-Pressemitteilung Ende August
  2027 dient nur der Plausibilisierung.
- **Nicht auswertbar,** wenn der DWD bis 31.12.2027 keinen Sommerwert 2027 in
  dieser Datei bereitstellt.
- **OWID:** betrachtet und verworfen. OWID bietet keine saisonalen
  DWD-Gebietsmittel für Deutschland (Begründung wie im Sommer-2026-Check).
  Bei Zugriffsproblemen auf DWD-CDC: Download durch Daniel über den Browser,
  kein Sekundär-Fallback.

### 3.2 V2 – DWD Hitzetage
- **Primärquelle:** DWD Climate Data Center, `regional_averages_DE`, Kenntag
  „Heiße Tage“ (Tmax ≥ 30 °C), jährliche Gebietsmittel, Spalte Deutschland
  (Rückfrage 3, beantwortet: Gebietsmittel).
- **Offene Vorbedingung vor dem Einfrieren von V2 (nicht erledigt):** Daniel
  Saure prüft, ob die Datei existiert und ab welchem Jahr sie beginnt. Geprüft
  werden ausschließlich Dateiname und Kopfzeile, keine Werte. Das Ergebnis
  (Pfad, Dateiname, erstes Jahr, Prüfdatum) wird vor dem Einfrieren in diesen
  Abschnitt eingetragen:
  - Pfad/Dateiname: [offen]
  - Erstes Jahr der Reihe: [offen]
  - Geprüft am / durch: [offen]
  Fehlt die Datei oder beginnt sie nach 1971, wird V2 vor dem Einfrieren auf
  eine Stationsliste umgestellt bzw. das Fenster angepasst. Das ist dann eine
  neue Rückfrage und eine neue SAP-Version, keine Entscheidung des
  analyst-Subagenten.
- **Rechendaten:** Fassung mit vollständigem Jahreswert 2026, abgerufen im
  Rechenfenster.
- **Bewertungsdaten (Stichtag):** Fassung, die am **31.01.2028** abgerufen wird
  und den Jahreswert 2027 enthält. Fehlt er an diesem Tag, wird der Abruf
  wöchentlich wiederholt. **Nicht auswertbar,** wenn bis 30.06.2028 kein
  Jahreswert 2027 vorliegt.
- **Integritäts-Check:** lückenlose Jahresreihe im Trendfenster, keine
  negativen Werte; Plausibilisierung des Jahreswerts 2026 gegen die
  DWD-Jahresbilanz 2026 (Pressemitteilung), sofern sie eine Deutschland-Zahl
  nennt. Abweichungen werden dokumentiert, die CDC-Datei hat Vorrang.
- **OWID:** betrachtet und verworfen (keine deutschen Kenntag-Reihen).

### 3.3 V3 – Copernicus/ERA5
- **Primärquelle:** Copernicus Climate Change Service (C3S), monatliche
  ERA5-Werte der globalen mittleren 2-m-Temperatur als Anomalie gegenüber
  1991–2020 und gegenüber 1850–1900, wie sie C3S zu den Monatsbulletins
  („Surface air temperature“) als Datendatei bereitstellt. Ist keine
  Datendatei verfügbar, wird die monatliche ERA5-Globalreihe aus dem
  Copernicus Climate Data Store verwendet und mit der C3S-Methodik (Referenz
  1991–2020, Offset) umgerechnet. Die gewählte Variante wird dokumentiert.
- **Rechendaten:** Monate 01/1991–12/2026, abgerufen im Rechenfenster
  (nach Veröffentlichung des Dezemberwerts 2026, bis 15.01.2027). Der
  Rechner darf dabei keine 2027-Werte öffnen (Sperre 1).
- **Bewertungsdaten (Stichtag):** dieselbe Datenreihe, abgerufen am
  **31.01.2028** (nach dem Bulletin für Dezember 2027). Maßgeblich sind die
  Werte aller zwölf Monate 2027 in dieser Fassung, einschließlich
  zwischenzeitlicher Korrekturen (Übergang vorläufig ERA5T → endgültig ERA5).
- **Definitionswechsel** (Rückfrage 6, beantwortet): Ändert C3S zwischen
  Einfrieren und Stichtag den Offset, die Referenzperiode oder den
  Reanalyse-Datensatz (z. B. Nachfolger von ERA5), gilt primär die beim
  Einfrieren dokumentierte Definition. Soweit möglich wird Y₂₀₂₇ mit ihr
  nachgerechnet. Die C3S-Angabe nach neuer Definition wird zusätzlich
  berichtet. Ist eine Nachrechnung nicht möglich: Bewertung nach der neuen
  C3S-Angabe, im Bericht als Definitionswechsel gekennzeichnet.
- **Nicht auswertbar,** wenn C3S bis 30.06.2028 keine Monatswerte für alle
  zwölf Monate 2027 bereitstellt.
- **OWID (Sekundärquelle, gemäß CLAUDE.md):** Die OWID-Reihe zu monatlichen
  globalen Temperaturanomalien beruht ebenfalls auf ERA5. Sie dient nur der
  Kreuzprüfung der Rechendaten (Abweichungen > 0,02 °C je Monat
  dokumentieren) und als Fallback bei dokumentiertem Zugriffsproblem auf
  C3S. Ein Fallback erfordert ein Amendment vor der Rechnung. Bei
  Abweichungen hat C3S Vorrang.

### 3.4 V4 – UBA
- **Primärquellen (Rechendaten):** UBA-Treibhausgasinventar, neueste bis
  31.12.2026 veröffentlichte Submission (Gesamtemissionen ohne LULUCF,
  1990 bis letztes Inventarjahr); UBA-Vorjahresschätzung für 2025 (März
  2026). Zusammengesetzte Reihe: Inventarwerte bis zum letzten
  Inventarjahr, für 2025 die Vorjahresschätzung. Liegt in der Submission
  bereits ein Inventarwert für 2025 vor, hat dieser Vorrang (dokumentiert).
- **Publikationsschnitt:** Nur Veröffentlichungen mit Datum ≤ 31.12.2026.
  Eine im Rechenfenster (Januar 2027) erscheinende neue Submission wird
  nicht verwendet.
- **Vergleichsprognose:** neueste bis 31.12.2026 veröffentlichte
  UBA-Projektionsdaten, Wert 2027, MMS, gesamt ohne LULUCF.
- **Bewertungsdaten (Stichtag):** UBA-Vorjahresschätzung für 2027, Abruf am
  **31.03.2028**, Erstveröffentlichung. Spätere Revisionen ändern die
  Bewertung nicht. Erscheint sie verspätet, wird bis 30.06.2028 gewartet.
  Danach Fallback (Rückfrage 13, beantwortet: Inventar-Fallback): Bewertung
  gegen den ersten Inventarwert für 2027 (voraussichtlich Submission 2029),
  im Bericht deutlich als Fallback gekennzeichnet.
- **Integritäts-Check:** GWP-Basis von Inventar, Vorjahresschätzung 2025 und
  Vorjahresschätzung 2027 dokumentieren. Unterscheidet sie sich, wird das
  gekennzeichnet. Die Bewertung erfolgt trotzdem nach der primären Regel.
  Gleiches gilt für eine abweichende Abgrenzung (z. B. indirekte CO₂-Emissionen).
- **OWID / Global Carbon Project (Sekundärquellen):** nur
  Größenordnungs-Abgleich der Reihe 2005–2024 (Abweichung > 5 % erläutern).
  Kein Fallback für die Zielgröße, da diese als UBA-Vorjahresschätzung
  definiert ist.

### 3.5 Beschaffung
Wie bei früheren Checks ist der Netzzugang der Cloud-Session zu
Behördenservern voraussichtlich eingeschränkt. Download durch Daniel; Ablage
unverändert unter `rohdaten/` mit Zugriffsdatum, Quelle und SHA-256-Prüfsumme
im `run_log.txt`. Für die Bewertung 2027/2028 eigene Unterordner
`rohdaten/auswertung_<V>/`.

## 4. Analysepopulation

| | Einheit | Rechendaten (Fit) | Zielbeobachtung |
|---|---|---|---|
| V1 | Sommer (JJA) eines Jahres, Deutschland | 1971–2026, n = 56 | Sommer 2027 |
| V2 | Kalenderjahr, Deutschland | 1971–2026, n = 56 (Vorbehalt: Reihenbeginn noch nicht geprüft, 3.2) | Jahr 2027 |
| V3 | Kalendermonat, global | 01/1991–12/2026, n = 432 (Fallback: bis 11/2026) | 12 Monate 2027 |
| V4 | Kalenderjahr, Deutschland | Niveaus 2005–2025, 20 Differenzen; Startwert 2025 | Jahr 2027 |

- **Keine Ausschlüsse** einzelner Jahre oder Monate (auch Extremjahre,
  Corona 2020, Energiekrise 2022 bleiben in den Fenstern). Robustheit nur über
  die vorab festgelegten Sensitivitäten (6).
- **Fehlende Werte:** keine Imputation. Fehlt ein Wert im primären Fenster,
  Stopp und Rückfrage vor der Rechnung.
- Vorläufige Werte (Sommer 2026, Hitzetage 2026, ERA5T-Monate Ende 2026,
  Vorjahresschätzung 2025) werden so verwendet, wie sie zum Rechenzeitpunkt
  vorliegen, und als vorläufig gekennzeichnet.

## 5. Statistische Methoden

### 5.1 Primäranalyse
Die primären Spezifikationen sind in 2.1–2.4 vollständig festgelegt. Zusammenfassung:

| | Primärmodell | Fenster | Intervall |
|---|---|---|---|
| V1 | OLS T ~ Jahr (validiertes Modell R3) | 1971–2026 | t-Prognoseintervall 95 % (80 % sekundär) |
| V2 | OLS √Y ~ Jahr, Rücktransformation durch Quadrieren | 1971–2026 | t-Prognoseintervall 95 % auf √-Skala, quadriert |
| V3 | lineare Regression mit AR(1)-Fehlern, ML; Simulation B = 100 000 mit Parameterunsicherheit | 01/1991–12/2026 | Quantile der simulierten Anzahl K |
| V4 | Random Walk mit Drift auf ln E | Differenzen 2006–2025 | t-Prognoseintervall für h = 2, zurücktransformiert |

Es gibt je Vorhersage **genau eine** Primärspezifikation. Sie wird
unabhängig vom Ausgang der Diagnostik berechnet und registriert (siehe 5.3).

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Alle Diagnostiken werden zum Rechenzeitpunkt durchgeführt und mit der
Vorhersage registriert. α = 0,05 zweiseitig.

**V1 und V2 (OLS):**
- Autokorrelation: Durbin-Watson-Test (zweiseitig), ACF und PACF der
  Residuen bis Lag 10 mit Grenzen ±1,96/√n.
- Normalität: Shapiro-Wilk, Q-Q-Plot, Schiefe der Residuen. Hinweis: Im
  Sommer-2026-Check zeigte das Fenster 1971–2025 Nicht-Normalität. Das
  t-Intervall von V1 kann deshalb unzutreffend kalibriert sein. Darauf
  antwortet die vorab festgelegte Sensitivität S1-d.
- Linearität: Residuen-gegen-Fitted-Plot; AIC linear vs. quadratisch (nur
  berichtet).
- Varianzhomogenität: Breusch-Pagan-Test (V2 zusätzlich: Vergleich der
  Residuenstreuung auf Original- und Wurzelskala, nur berichtet).
- Einfluss: Cook's Distance > 4/n kennzeichnen, kein Ausschluss.

**V3 (Regression mit AR(1)-Fehlern):**
- Restautokorrelation: ACF/PACF der Innovationen e_t; Ljung-Box-Test bei
  Lag 12 und Lag 24.
- Normalität der Innovationen: Shapiro-Wilk, Q-Q-Plot.
- Saisonale Restmuster: Mittel der Innovationen je Kalendermonat (nur
  berichtet).
- Stabilität: geschätztes φ und dessen Abstand zu 1 berichten.
- Überdeckungs-Rückblick (nur berichtet, ohne Folgen): dasselbe Verfahren mit
  Daten bis 12/2025 für 2026 und bis 12/2024 für 2025 gerechnet. Berichtet
  wird, ob die beobachtete Anzahl im jeweiligen 95-%-Intervall lag.

**V4 (Random Walk mit Drift):**
- Autokorrelation der Differenzen d_t: ACF bis Lag 5, Ljung-Box bei Lag 5.
- Normalität der Differenzen: Shapiro-Wilk, Q-Q-Plot.
- Einfluss: Leave-one-out der Differenzen. Berichtet wird, wie stark sich
  Drift und Intervallgrenzen verschieben, wenn eine einzelne Differenz
  weggelassen wird. Größte Verschiebung benennen, kein Ausschluss.

Eine Transitivitätsprüfung entfällt (kein indirekter Vergleich).

### 5.3 Korrektur bei Annahmenverletzung
**Kein automatischer Modellwechsel.** Die Primärvorhersagen bleiben in jedem
Fall so, wie in 2.1–2.4 festgelegt. Damit ist ausgeschlossen, dass nach
Sichtung der Diagnostik ein günstigeres Intervall gewählt wird. Bei einer
Verletzung (α = 0,05) gilt stattdessen:
- Die Verletzung wird im Register neben der Vorhersage vermerkt.
- Die vorab festgelegten Sensitivitäten, die genau diese Verletzung
  adressieren, werden in der Register-Tabelle direkt neben der
  Primärvorhersage gezeigt (nicht nur im Anhang):
  - Autokorrelation bei V1/V2: S1-e bzw. S2-e (ARIMA)
  - Nicht-Normalität bei V1/V2: S1-d bzw. S2-d (empirische/Bootstrap-Intervalle)
  - Restautokorrelation bei V3: S3-c (AR(2)) und S3-d (ARMA(1,1))
  - Nicht-Normalität bei V4: S4-e (Bootstrap der Differenzen)
- Die Bewertung „getroffen / nicht getroffen“ erfolgt ausschließlich nach der
  Primärvorhersage.

### 5.4 Unsicherheitsquantifizierung
- **Primär:** die in 2.1–2.4 festgelegten 95-%-Prognoseintervalle.
- **Sekundär:** die 80-%-Intervalle derselben Primärmodelle.
- **Sensitivitätsanalytisch:** die Intervalle aus Abschnitt 6.
- Die Intervalle bilden nur die statistische Unsicherheit des jeweiligen
  Modells ab. Strukturbrüche (z. B. Vulkanausbruch, abrupte ENSO-Wechsel,
  Konjunktur- oder Energiepreisschocks, neue Maßnahmen wie der
  EU-Emissionshandel für Gebäude und Verkehr) sind nicht enthalten. Das
  steht in jedem Ergebnistext (8.2).
- Simulationen und Bootstraps mit festem Seed 20261022 und
  B = 100 000 (V3) bzw. B = 10 000 (Bootstrap-Sensitivitäten). Generator und
  Seed-Handhabung in Python: Abschnitt 10.

### 5.5 Signifikanzniveau
Die Vorhersagen sind keine Hypothesentests. Es gibt keine p-Werte als
Kernaussage, und „signifikant“ wird für die Bewertung nicht verwendet.
α = 0,05 zweiseitig gilt nur für die Diagnostiktests in 5.2.

## 6. Sensitivitätsanalysen

Primär ist je Vorhersage ausschließlich die Spezifikation aus 2.1–2.4. Alle
folgenden Varianten werden zum selben Rechenzeitpunkt berechnet, **mit
registriert** und bei der Auswertung **vollständig** bewertet (Treffer ja/nein
je Variante). Sie können die Primärbewertung nicht ersetzen. Ein
nachträglicher Tausch ist ausgeschlossen.

**V1 – Sommermittel**

| Nr. | Variation |
|---|---|
| S1-a | Validiertes Primärmodell ganz unverändert: OLS 1971–2025, Prognose für 2027 (Horizont 2 Jahre, 2026 nicht im Fit) |
| S1-b | Trendfenster 1961–2026 |
| S1-c | Trendfenster 1991–2026 |
| S1-d | Prognoseintervall aus Residuen-Bootstrap (B = 10 000, inkl. Parameterunsicherheit, Residuen mit √(n/(n−2)) reskaliert), Perzentilgrenzen |
| S1-e | ARIMA mit Drift auf 1971–2026, Ordnung p, q ≤ 2 nach AICc (wie S4 im Sommer-Check), Prognoseintervall 2027 |
| S1-f | Segmentierte Regression 1881–2026 mit einem geschätzten Bruchpunkt, Prognose aus dem letzten Segment (wie S3 im Sommer-Check; Bruchpunkt-Unsicherheit nicht enthalten) |

**V2 – Hitzetage**

| Nr. | Variation |
|---|---|
| S2-a | OLS ohne Transformation (gleiche Spezifikation wie V1), untere Grenze bei 0 abgeschnitten |
| S2-b | Quasi-Poisson-GLM mit Log-Link, Jahr als Prädiktor, Fenster 1971–2026; Prognoseintervall aus parametrischem Bootstrap (B = 10 000) |
| S2-c | Trendfenster 1961–2026 (√-Modell), nur falls die Reihe 1961 beginnt; sonst „nicht durchgeführt, Grund: …“ |
| S2-d | Prognoseintervall aus Residuen-Bootstrap auf der √-Skala (B = 10 000), Perzentilgrenzen, quadriert |
| S2-e | ARIMA mit Drift auf √Y, 1971–2026, p, q ≤ 2 nach AICc |
| S2-f | Trendfenster 1991–2026 (√-Modell) |

**V3 – Monate über 1,5 °C**

| Nr. | Variation |
|---|---|
| S3-a | Trendfenster 01/1979–12/2026 |
| S3-b | Trendfenster 01/2001–12/2026 |
| S3-c | Fehlerstruktur AR(2) |
| S3-d | Fehlerstruktur ARMA(1,1) |
| S3-e | quadratischer Trend (Beschleunigung), sonst wie primär |
| S3-f | ohne Parameterunsicherheit (Parameter fest auf ML-Schätzwerten) |
| S3-g | Schwellenregel „≥ 1,50 °C“ statt „> 1,50 °C“ (gleiche Simulation, andere Zählung; bei der Auswertung auch Y₂₀₂₇ nach dieser Regel) |

**V4 – THG**

| Nr. | Variation |
|---|---|
| S4-a | Driftfenster 1991–2025 (34 Differenzen, ohne die Differenz 1990/91) |
| S4-b | Driftfenster 2016–2025 (10 Differenzen) |
| S4-c | log-lineare OLS-Trendregression ln E ~ Jahr auf 2005–2025, Prognoseintervall 2027 |
| S4-d | Startwert = letzter Inventarwert (voraussichtlich 2024), Horizont h = 3, Drift aus den Inventardifferenzen 2005–2024 (ohne die Vorjahresschätzung 2025) |
| S4-e | Prognoseintervall aus Bootstrap der Differenzen (B = 10 000, Summe von zwei gezogenen Differenzen plus Unsicherheit der Drift) |
| S4-f | Random Walk ohne Drift (Intervall nur aus σ̂ der Differenzen 2006–2025) |

Kombinationen von Sensitivitäten werden nicht gebildet. Ist eine Variante
undurchführbar (z. B. Modell konvergiert nicht), wird sie als „nicht
durchgeführt, Grund: …“ registriert, nicht weggelassen.

## 7. Umgang mit Mehrfachtestung / Multiplizität

- **Vollständigkeit:** Alle vier Vorhersagen werden registriert und
  ausgewertet, auch wenn einzelne Quellen später „nicht auswertbar“ sind.
  Keine Vorhersage wird nachträglich gestrichen, ergänzt oder umdefiniert.
- **Eine Primärbewertung je Vorhersage:** In Überschrift, Teaser und Grafik
  erscheinen ausschließlich die vier Primärbewertungen nach 95-%-Intervall
  (z. B. „3 von 4 getroffen“). Sensitivitäten, 80-%-Intervalle und
  Referenzprognosen stehen in Tabellen daneben, unabhängig davon, ob sie
  günstiger oder ungünstiger ausfallen. Liegt für eine Vorhersage eine
  Neuregistrierung nach der Korrekturregel in 0.1 vor, wird gegen beide
  Fassungen bewertet. Welche der beiden Fassungen die eine Primärbewertung
  liefert, ist noch nicht festgelegt (Rückfrage 20, offen; muss vor dem
  Einfrieren entschieden sein).
- **Keine nachträgliche Auswahl** von Fenster, Modell, Intervallniveau,
  Schwellenregel (V3) oder Datenfassung. Die Datenfassung für die Bewertung
  ist durch die Stichtage in Abschnitt 3 festgelegt.
- **Einordnung der Trefferzahl (vorab festgelegte Sprachregelung):** Bei vier
  gut kalibrierten 95-%-Intervallen wäre, wenn sie unabhängig wären, die
  Wahrscheinlichkeit für mindestens einen Fehltreffer 1 − 0,95⁴ ≈ 19 %. V1
  und V2 sind voneinander abhängig (heißer Sommer, mehr Hitzetage). Ein
  einzelner Fehltreffer ist deshalb kein Beleg für eine schlechte Methode,
  und vier Treffer sind kein Beleg für eine gute. Aussagen zur Kalibrierung
  sind erst über mehrere Register-Jahrgänge möglich.
- **Abgrenzung zu Registereintrag #1 und späteren Einträgen:** Die
  Gesamtbilanz „k von 4“ bezieht sich nur auf die Einträge #2–#5. Eintrag #1
  (Gasspeicher) und Einträge ab #6 werden getrennt ausgewertet und nicht in
  diese Bilanz eingerechnet.
- Jede Abweichung vom SAP wird als „Post-hoc“ gekennzeichnet.

## 8. Interpretationsrahmen / Confounder

### 8.0 Feste Prüfpunkte des Master-Templates
- **Produktions- vs. Konsum-Perspektive:** betrifft nur V4. Inventar und
  Vorjahresschätzung folgen der territorialen Produktionsperspektive
  (UNFCCC). Ein Rückgang darf nicht als Rückgang des Konsum-Fußabdrucks
  gedeutet werden; Produktionsverlagerung ins Ausland erscheint als
  geringere Emission. Die Perspektive wird im Bericht genannt. Für V1–V3
  nicht anwendbar.
- **Keine implizite Politik-/Verhaltensbewertung:** Ein Treffer oder
  Fehltreffer bei V4 sagt nichts über die Wirksamkeit von Klimapolitik.
  Er sagt nur, ob die Fortschreibung des bisherigen mittleren Verlaufs zum
  beobachteten Wert passte. Bei V1–V3 sagt er nichts über Ursachen. Vorab
  festgelegt: Abweichungen werden ohne Ursachenzuschreibung beschrieben.
- **Transitivitätsannahme:** nicht anwendbar (kein indirekter Vergleich).
- **Regression zur Mitte:** relevant für V4. Das Drift-Modell setzt am Wert
  2025 an. War 2025 ein ungewöhnliches Jahr, wird diese Abweichung in die
  Vorhersage übernommen. Gegenprüfung über S4-c (Trendmodell, nicht am
  letzten Wert verankert) und S4-d (anderer Startwert). Für V1/V2 gilt das
  nicht: Das Trendmodell ist nicht am letzten Wert verankert. Ein heißer
  Sommer 2026 verschiebt die Vorhersage nur über seinen Einfluss auf die
  Steigung. Für V3 klingt der Einfluss des letzten Monats über φ ab.

### 8.1 Statistische Fortschreibung ist keine Klimaprojektion
V1–V3 schreiben den bisherigen Messverlauf fort. Physikalische Antriebe
(ENSO-Prognosen, Vulkane, Sonnenzyklus, Aerosole) werden nicht
modelliert. Ergebnistexte formulieren: „Wenn sich der bisherige Verlauf
statistisch fortsetzt, …“.

### 8.2 Ein Jahr ist eine einzelne Ziehung
Jede Bewertung beruht auf einer einzigen Beobachtung. Ein Fehltreffer kann
auf ein Modellproblem hinweisen oder schlicht der erwartete Anteil an
Fehltreffern sein (siehe 7). Der Bericht sagt nicht „das Modell ist
widerlegt“ oder „bestätigt“.

### 8.3 Gebietsmittel und globale Mittel
V1 und V2 beschreiben Deutschland als Ganzes. Regionale Hitzeereignisse
können sich deutlich unterscheiden. V2 ist ein Flächenmittel der Anzahl
Hitzetage, nicht die Zahl an einer bestimmten Messstation. Das wird bei jeder
Nennung erklärt.

### 8.4 Monatliche 1,5-°C-Überschreitung ist nicht das Pariser Ziel
Die 1,5-°C-Grenze des Pariser Abkommens bezieht sich auf langjährige
Mittel (typisch 20 Jahre), nicht auf einzelne Monate. V3 zählt
Monatswerte. Der Bericht sagt ausdrücklich, dass weder eine einzelne
Überschreitung noch die Anzahl der Monate bedeutet, dass die Pariser Grenze
überschritten sei.

### 8.5 Vorläufigkeit und Revisionen
Rechendaten und Bewertungsdaten können vorläufig sein (DWD-Werte,
ERA5T, Vorjahresschätzung). Die Stichtagsregeln in Abschnitt 3 sind deshalb
bindend. Liegt ein Beobachtungswert innerhalb der Rundungsgenauigkeit der
Quelle an einer Intervallgrenze, wird das im Bericht ausdrücklich erwähnt.
Die Bewertung bleibt nach der Regel.

### 8.6 Neutralität
Kein Ausgang wird als „gute“ oder „schlechte“ Nachricht bewertet. Treffer
und Fehltreffer werden mit gleichem Wortlaut berichtet.

## 9. Limitationen

- Vier Einzelbeobachtungen; keine Aussage über Kalibrierung aus einem
  Jahrgang (7, 8.2).
- V1 übernimmt ein Modell, dessen Residuen im Fenster 1971–2025
  nicht normalverteilt waren. Das t-Intervall kann deshalb zu eng oder zu
  weit sein (Gegenprüfung S1-d).
- V2: Verfügbarkeit und Beginn der DWD-Gebietsmittelreihe sind noch nicht
  geprüft (offene Vorbedingung, 3.2). Ein Flächenmittel ist nicht direkt mit
  Stationszählungen in Medienberichten vergleichbar.
- V3: Das Modell enthält keine ENSO-Information. Gerade ENSO bestimmt die
  Monatswerte eines einzelnen Jahres stark. Das Intervall kann deshalb
  breit sein. Ist es sehr breit (z. B. 0 bis 12), wird das als begrenzte
  Aussagekraft berichtet und nicht nachträglich verengt.
- V3 hängt von der C3S-Definition ab (Offset, Datensatzversion); ein
  Definitionswechsel ist vorab geregelt (3.3), bleibt aber eine Unschärfe.
- V3 wird gegebenenfalls ohne abgeschlossenen Prognose-Check gerechnet
  (vorab festgelegte Ausnahme, 0.1). Das ist eine bewusste Abweichung von der
  allgemeinen Reihenfolgeregel, begründet durch die Copernicus-Frist.
- V4: Die Rechenreihe mischt Inventarwerte und eine Vorjahresschätzung. Die
  Zielgröße ist eine Schätzung, kein Inventarwert. Neue Maßnahmen und
  Schocks ab 2027 sind nicht abgebildet. Der Horizont von 2 Jahren beruht
  darauf, dass 2026 zum Rechenzeitpunkt nicht veröffentlicht ist.
- Fensterwahl (insbesondere V4) ist eine Setzung. Ihre Wirkung wird über die
  Sensitivitäten sichtbar, nicht beseitigt.
- Software: Die Umsetzung erfolgt in Python, wie der validierte
  Sommer-2026-Check (Rückfrage 16, beantwortet). Für V1 entfällt damit das
  Risiko einer Neuimplementierung. Für die neuen Modelle (V3 AR(1)-ML und
  Simulation, V4, ARIMA-Sensitivitäten) können Python-Bibliotheken andere
  Voreinstellungen haben als R-Pakete (z. B. Optimierer, Startwerte,
  AICc-Definition bei der automatischen ARIMA-Ordnungswahl). Die verwendeten
  Funktionen und Einstellungen werden deshalb im Skript-Header und im
  `run_log.txt` dokumentiert.

## 10. Software

- **Python** (Version im Skript-Header) statt R, festgelegt durch Daniel
  Saure am 22.10.2026 (Rückfrage 16). Grund: Das validierte Sommer-Modell ist
  in Python implementiert
  (`Analysen/2026-09-sommer-2026-normal/sommer_2026_normal.py`); eine
  Neuimplementierung in R wäre eine zusätzliche Fehlerquelle. Weil die
  Sprache hier vorab festgelegt ist, ist Python in diesem SAP **keine**
  Post-hoc-Abweichung (anders als A1 im Sommer-Check).
- **Voraussichtliche Pakete:** numpy, scipy, pandas, statsmodels,
  matplotlib, sowie die im validierten Skript `sommer_2026_normal.py`
  verwendeten Pakete (für S1-e und S1-f). Die endgültige Liste mit Versionen
  steht im Skript-Header und in den Sitzungsinformationen unter `output/`.
  Werden für eine Spezifikation Pakete benötigt, die hier nicht genannt
  sind, wird das im `run_log.txt` dokumentiert; die Spezifikation selbst
  (2.1–2.4, 6) ändert sich dadurch nicht.
- **V1 und die zu V1 analogen Teile:** Die OLS-Schätzung und das
  t-Prognoseintervall folgen dem Rechenweg des validierten Skripts
  `sommer_2026_normal.py`. Übernommene Funktionen werden mit Herkunft
  (Datei, Funktionsname, Commit-Hash) im Skript gekennzeichnet.
- **Skripte:** `prognose_register_2027.py` (Rechnung) und ein getrenntes
  Skript für die spätere Auswertung, `prognose_register_2027_auswertung.py`.
  Die Auswertung liest die registrierten Vorhersagen nur aus
  `output/register_2027.csv` und, falls vorhanden, aus den
  Neuregistrierungs-Dateien `output/register_2027_neuregistrierung_<n>.csv`
  (0.1, Korrekturregel). Sie rechnet keine Vorhersage neu. (Abweichung von
  der Ordnerkonvention `<thema>.R` in CLAUDE.md, begründet durch die
  Sprachfestlegung.)
- **Zufallszahlen:** ein einziger numpy-Generator (PCG64) mit Seed 20261022
  für die gesamte Rechnung; die Reihenfolge der Zufallsziehungen
  (V3-Simulation, dann Bootstrap-Sensitivitäten in der Reihenfolge von
  Abschnitt 6) wird im Skript festgelegt und dokumentiert.
- Sitzungsinformationen (Python-Version, Paketversionen, Betriebssystem) in
  `output/`.
- Kein Netzzugriff aus dem Skript. Eingelesen werden nur unverändert
  abgelegte Rohdateien.
- **Prüfschritt „Reproduktion des validierten S2-Fits“ (bleibt
  verpflichtend):** Bei unveränderten Daten muss der Fit 1971–2026 das
  validierte S2-Ergebnis des Sommer-2026-Checks reproduzieren (Steigung laut
  Validierungsbericht, Abschnitt 3.4; siehe 3.1). Gelingt das nicht: Stopp
  und Rückfrage vor jeder weiteren Rechnung.

## 11. Reporting-Plan

**Zeitpunkt 1 – Registrierung (Januar 2027, V3 bis 15.01.2027; Ablauf
Rechnung – Validierung – Freigabe – gemeinsamer Commit nach 0.1, Rückfrage 17
beantwortet):**
- Tabelle „Register 2027“ (`output/register_2027.csv`): je Vorhersage
  Zielgröße, Quelle, Punktvorhersage, 95-%- und 80-%-Intervall,
  Bewertungsregel, Stichtag, Datenstand, Registereintrag-Nummer, Commit-Hash.
- Tabelle aller Sensitivitäten (Abschnitt 6) mit Intervallen.
- V3 zusätzlich: Wahrscheinlichkeitsverteilung P(K = k), Balkendiagramm.
- Grafik je Vorhersage: Datenreihe bis 2026, Primärvorhersage 2027 mit 95-%-
  und 80-%-Intervall.
- Diagnostik (5.2) im Anhang.
- Die Ergebnis-CSV und die zugehörige Registerdatei werden erst nach
  Validierung und ausdrücklicher Freigabe durch Daniel Saure gemeinsam
  committet, innerhalb der Frist aus 0.1.

**Prognose-Register-Einträge #2–#5** (Rückfragen 14 a und 18, beantwortet):
Die vier Vorhersagen werden als Einträge **#2 (V1), #3 (V2), #4 (V3) und #5
(V4)** im Ordner `Prognose-Register/` registriert, **eine Datei pro
Vorhersage**, im gleichen Format wie Eintrag #1
(`Prognose-Register/01_gasspeicher-winter-2026-27.md`). Die Dateinamen sind
festgelegt: `02_sommermittel-2027.md`, `03_hitzetage-2027.md`,
`04_monate-ueber-1-5-grad-2027.md`, `05_thg-emissionen-2027.md` (Tabelle in
0.1). Die Nummern #2–#5 sind für dieses Register reserviert; ein anderer
Registereintrag, der bis Januar 2027 entsteht, erhält #6 oder höher. Jeder
Eintrag enthält dieselben Felder wie #1, in dieser Reihenfolge:
- Überschrift: „Prognose-Register · Eintrag #n – <Vorhersage> 2027“.
- **Registriert:** Datum (maßgeblich ist der Zeitstempel des
  Registrierungs-Commits).
- **Freigabe:** wird erst eingetragen, nachdem Daniel Saure den konkreten
  Eintrag ausdrücklich freigegeben hat (Name, Datum, Wortlaut der Freigabe,
  wie in #1). Der analyst- oder ein anderer Subagent trägt dieses Feld nie
  vorab ein (CLAUDE.md, Verifikationspflicht). Ablauf nach 0.1 (Rückfrage 17,
  beantwortet): Das Feld wird nach der Validierung und vor dem gemeinsamen
  Commit von CSV und Registerdatei ausgefüllt.
- **Leserfrage:** allgemeinverständliche Frage. Sie erläutert, ersetzt aber
  nicht die Zielgröße; bindend ist die Definition dieses SAP.
- **Grundlage:** Verweis auf diesen SAP (Pfad
  `Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md`,
  eingefrorene Version und Datum) und auf den Validierungsbericht der
  Rechnung.
- **Neue Berechnung:** ja (anders als #1). Verweis auf Skript, CSV und
  Commit.
- **Zielgröße:** wörtlich wie im SAP (2.1, 2.2, 2.3 bzw. 2.4), mit Quelle und
  Bewertungsfassung (Abschnitt 3).
- **Vorhersagen:** Primärvorhersage mit 95-%-Intervall als Kernvorhersage;
  80-%-Intervall als vereinfachte bzw. zusätzliche Lesart; bei V3 zusätzlich
  P(K = k). Sensitivitäten nur als Verweis auf die CSV, nicht als
  konkurrierende Vorhersage.
- **Auswertung:** Stichtag und Abrufregel (Abschnitt 3), Bedingungen für
  „nicht auswertbar“, Zusage der Veröffentlichung unabhängig vom Ausgang.
- **Offenlegung:** Vorwissen (Abschnitt 0), Datenstand bei der Rechnung, bei
  V3 gegebenenfalls Ausnahme von Sperre 2 (b), was nicht vorhergesagt wird.
- **Neuregistrierung** (nur im Korrekturfall nach 0.1): Nachtrag
  „Neuregistrierung <n>“ mit Datum, Grund, korrigierten Werten (aus
  `output/register_2027_neuregistrierung_<n>.csv`), Freigabe und Commit-Hash.
  Der registrierte Teil des Eintrags bleibt unverändert und sichtbar.

Die Werte in den Registerdateien werden aus `output/register_2027.csv`
(bzw. im Korrekturfall aus der Neuregistrierungs-Datei) übernommen, nicht von
Hand neu gerundet außer nach den Rundungsregeln dieses Abschnitts. Der
validator prüft die Übereinstimmung.

**Öffentliche Registrierung auf Substack** (Rückfrage 14 b, beantwortet: ja;
Rückfrage 19, beantwortet: Option a): Die registrierten Vorhersagen werden in
**einem gemeinsamen Substack-Beitrag** für alle vier Vorhersagen
veröffentlicht, nach der Registrierung aller vier, **spätestens am
31.01.2027**. V3 erhält keinen eigenen, früheren Beitrag. Der Beitrag
erscheint als „Klima Kompass · Evidenzcheck“ nach Validierung und Freigabe
durch Daniel Saure; veröffentlicht wird durch Daniel. Der verbindliche
Zeitstempel ist der Commit, nicht das Substack-Datum. Kanalfassungen nur über
den Klima-Kompass-Ablauf, keine LinkedIn-Fassung.

**Zeitpunkt 2 – Auswertungen (V1 ab 15.09.2027; V2, V3 ab 31.01.2028; V4 ab
31.03.2028):**
- je Vorhersage: Beobachtungswert mit Fundstelle und Abrufdatum, Ausgang
  (getroffen / nicht getroffen / nicht auswertbar), Lage im Intervall,
  PIT-Wert, Prognosefehler, Vergleich mit naiver Referenz bzw.
  UBA-Vergleichsprognose (V4), Treffer im 80-%-Intervall, Treffer je
  Sensitivität.
- Liegt eine Neuregistrierung vor (0.1): Bewertung gegen die ursprüngliche
  und die korrigierte Fassung, beide Ergebnisse werden berichtet, die
  Korrektur wird mit Datum und Grund offengelegt. Welche Fassung in die
  Primärbewertung und die Gesamtbilanz eingeht: Rückfrage 20 (offen).
- Das Ergebnis wird im jeweiligen Registereintrag (#2–#5) als Nachtrag
  „Auswertung“ ergänzt; der registrierte Teil des Eintrags bleibt
  unverändert.
- Gesamtbilanz nach Auswertung von V4: „k von 4 getroffen“ (nur #2–#5) mit
  der Sprachregelung aus Abschnitt 7.
- Auswertungen werden vom validator gegen den SAP und das Register geprüft,
  bevor sie veröffentlicht werden. Sie blockieren keine anderen
  Evidenzchecks (Rückfrage 15, beantwortet; die Rechnung im Januar 2027
  zählt dagegen als Analyse im Sinne von „eine Analyse zur Zeit“).

**Rundung in der Kommunikation:** V1 auf 0,1 °C; V2 auf ganze Tage (Bewertung
nach 2.2 mit Dateigenauigkeit); V3 ganze Monate, Wahrscheinlichkeiten in
ganzen Prozent; V4 auf ganze Mt CO₂e (Bewertung nach 2.4 mit 0,1 Mt).
Bei Grenznähe gilt 8.5.

**Wortwahl:** „Die Vorhersage lag im / außerhalb des vorab registrierten
95-%-Intervalls“. Nicht „richtig/falsch vorhergesagt“, nicht „signifikant“.
Kernaussagen erst nach Validierung.

## 12. Rückfragen

Rückfragen 1–16 wurden am 22.10.2026 von Daniel Saure beantwortet („alle wie
empfohlen“, mit Präzisierungen zu 14 und 16). Rückfragen 17–19 wurden am
22.10.2026 von Daniel Saure beantwortet („17 bis 19 wie von dir
vorgeschlagen“). Die Antworten sind in die genannten Abschnitte
eingearbeitet. Rückfrage 3 ist teilweise offen. Rückfragen 20 und 21 sind neu
(v0.3) und offen. Die Beantwortung der Rückfragen ist keine Freigabe des SAP;
das Einfrieren steht aus.

1. **V1 – Trendfenster.** Der Entwurf setzt das Fenster 1971–2026 als primär
   (validiertes Modell, Fit bis zum Vorjahr des Zieljahres; entspricht der
   validierten Sensitivität S2). Alternativen: (a) Fit unverändert
   1971–2025 mit Horizont 2 Jahre (jetzt S1-a); (b) gleitendes Fenster
   1972–2026 mit gleicher Länge n = 55. Empfehlung: 1971–2026 primär,
   1971–2025 als S1-a beibehalten, kein gleitendes Fenster.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen. 1971–2026
   primär, 1971–2025 als S1-a, kein gleitendes Fenster. Eingearbeitet in 2.1.
2. **V1 – Bewertungsfassung.** Bewertet wird gegen die DWD-CDC-Datei,
   abgerufen am 15.09.2027 (Dateikopf ab 01.09.2027). Alternative wäre der
   vorläufige Wert der DWD-Pressemitteilung Ende August 2027.
   Empfehlung: CDC-Datei am 15.09.2027, Pressemitteilung nur zur
   Plausibilisierung.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, CDC-Datei am
   15.09.2027. Eingearbeitet in 3.1.
3. **V2 – Raumbezug und Verfügbarkeit.** Der Entwurf setzt das
   DWD-Gebietsmittel Deutschland der Anzahl Heißer Tage (Kalenderjahr)
   primär. Verfügbarkeit und Reihenbeginn sind nicht geprüft. Alternativen:
   eine festgelegte Einzelstation oder ein Mittel über eine feste Liste von
   Stationen mit lückenloser Reihe. Empfehlung: Gebietsmittel. Daniel
   prüft vor dem Einfrieren ohne Ansicht der Werte, ob die Datei existiert
   und ab welchem Jahr sie beginnt (nur Dateiname und Kopfzeile). Fehlt sie,
   wird V2 vor dem Einfrieren auf eine Stationsliste umgestellt (neue
   Rückfrage).
   **Beantwortet 22.10.2026 (Daniel Saure), teilweise:** Gebietsmittel wie
   empfohlen. **Weiter offen (Vorbedingung vor dem Einfrieren von V2, nicht
   erledigt):** Prüfung durch Daniel, ob die Datei existiert und wann sie
   beginnt (nur Dateiname und Kopfzeile). Eintragsfelder in 3.2.
4. **V2 – Methode.** Primär OLS auf der Wurzelskala, Fenster 1971–2026;
   untransformierte OLS (S2-a) und Quasi-Poisson (S2-b) als Sensitivitäten.
   Empfehlung: so übernehmen.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, OLS auf der
   Wurzelskala. Eingearbeitet in 2.2.
5. **V3 – Schwellenregel.** Primär „> 1,50 °C“ auf dem veröffentlichten
   Wert mit zwei Nachkommastellen, „≥ 1,50 °C“ als S3-g. Empfehlung:
   so übernehmen.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, „> 1,50 °C“
   primär. Eingearbeitet in 2.3.
6. **V3 – Definitionswechsel bei C3S.** Wechselt C3S bis zum Stichtag
   Offset, Referenz oder Reanalyse-Version, gilt die beim Einfrieren
   dokumentierte Definition, soweit nachrechenbar (3.3). Empfehlung: so
   übernehmen.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, die beim
   Einfrieren dokumentierte Definition gilt. Eingearbeitet in 3.3.
7. **Getrennte Einfrierung von V3.** Empfehlung: Ja, V3 darf getrennt
   eingefroren werden, zusammen mit den allgemeinen Abschnitten 0, 1, 2.0,
   2.3, 3.3, 3.5, 5–11, spätestens am 15.12.2026. V1, V2 und V4 folgen
   spätestens am 31.12.2026. Eine Teilfreigabe gilt nur für die genannten
   Abschnitte.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen. V3 darf
   getrennt eingefroren werden (mit den genannten allgemeinen Abschnitten),
   bis 15.12.2026; der Rest bis 31.12.2026. Eingearbeitet in Kopf und 0.1.
8. **Konflikt zwischen Sperre 2 und der V3-Frist.** Optionen: (a) V3 wird
   trotzdem gerechnet (Ausnahme von Sperre 2); (b) V3 entfällt für 2027.
   Empfehlung: (a), als vorab festgelegte Ausnahme nur für V3.
   **Beantwortet 22.10.2026 (Daniel Saure):** Option (a), vorab festgelegte
   Ausnahme von Sperre 2 nur für V3. Eingearbeitet in 0.1 (Ausnahme
   betrifft nur Sperre 2 (b)) und 9.
9. **Definition „Prognose-Check abgeschlossen“.** Muss zusätzlich die
   Veröffentlichung auf Substack erfolgt sein? Empfehlung: nein, Freigabe
   der Ergebnisse reicht.
   **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, Freigabe der
   Ergebnisse reicht, keine Substack-Veröffentlichung nötig. Eingearbeitet in
   0.1 (Sperre 2 b).
10. **V4 – Modell und Driftfenster.** Primär Random Walk mit Drift auf ln E,
    Differenzen 2006–2025 (m = 20), Startwert Vorjahresschätzung 2025.
    Empfehlung: so übernehmen.
    **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, Random Walk mit
    Drift, Differenzen 2006–2025. Eingearbeitet in 2.4.
11. **V4 – Nutzung des Prognose-Checks.** Empfehlung: nicht nutzen.
    **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen,
    Prognose-Check-Ergebnisse werden nicht genutzt. Eingearbeitet in 0.1
    (Sperre 3) und 2.5.
12. **80-%-Intervalle.** Empfehlung: beibehalten.
    **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen, beibehalten.
    Eingearbeitet in 2.0.
13. **V4 – Fallback bei fehlender Vorjahresschätzung.** Empfehlung:
    Inventar-Fallback, im Bericht deutlich gekennzeichnet.
    **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen,
    Inventar-Fallback. Eingearbeitet in 3.4.
14. **Veröffentlichung und Bezug zum Prognose-Register #1.** (a) Wo liegt
    Eintrag #1, und soll dieses Register dieselbe Struktur und Nummerierung
    erhalten? (b) Sollen die registrierten Vorhersagen öffentlich auf
    Substack erscheinen?
    **Beantwortet 22.10.2026 (Daniel Saure):** (a) Eintrag #1 liegt unter
    `Prognose-Register/01_gasspeicher-winter-2026-27.md` (gelesen für v0.2).
    Die vier Vorhersagen werden als Einträge #2 bis #5 registriert, eine
    Datei pro Vorhersage, im gleichen Format wie #1, jeweils mit Verweis auf
    diesen SAP. (b) Ja, zusätzlich öffentlich auf Substack. Eingearbeitet in
    0.1 (Registrierung, Fristentabelle) und 11 (Format der Einträge,
    Substack).
15. **„Eine Analyse zur Zeit“.** Empfehlung: Auswertungen blockieren keine
    anderen Evidenzchecks; die Rechnung im Januar 2027 zählt als Analyse.
    **Beantwortet 22.10.2026 (Daniel Saure):** wie empfohlen. Eingearbeitet
    in 11.
16. **Software.** Ursprüngliche Empfehlung: R, mit Reproduktion des
    validierten S2-Fits als Kontrolle.
    **Beantwortet 22.10.2026 (Daniel Saure), abweichend von der Empfehlung:**
    Python statt R. Grund: Das validierte Sommer-Modell ist in Python
    implementiert (`Analysen/2026-09-sommer-2026-normal/sommer_2026_normal.py`),
    eine Neuimplementierung wäre eine zusätzliche Fehlerquelle. Die Kontrolle
    „Reproduktion des validierten S2-Fits“ bleibt als Prüfschritt erhalten.
    Eingearbeitet in 9, 10 und 13.

**Rückfragen aus v0.2 (beantwortet in v0.3):**

17. **Reihenfolge Validierung – Registrierung – Freigabe des Eintrags.**
    Laut CLAUDE.md muss der validator prüfen, bevor Ergebnisse in einen
    Report übernommen werden, und Eintrag #1 trägt eine ausdrückliche
    Freigabe durch Daniel. Bei V3 ist das Zeitfenster eng (Dezemberwert
    Anfang Januar 2027, Registrierung bis 15.01.2027). Zu entscheiden:
    (a) Commit der CSV sofort nach der Rechnung (Zeitstempel), Registerdatei
    erst nach Validierung und Freigabe; oder (b) CSV und Registerdatei
    gemeinsam erst nach Validierung und Freigabe, innerhalb der Frist. Und:
    Was gilt, wenn der validator nach dem Zeitstempel-Commit einen
    Rechenfehler findet (Korrektur als gekennzeichnete Neuregistrierung mit
    neuem Commit, oder Vorhersage bleibt mit Fehlervermerk bestehen)?
    **Beantwortet 22.10.2026 (Daniel Saure):** wie vorgeschlagen, Option (b).
    Ergebnis-CSV und Registerdatei werden gemeinsam committet, erst nach
    Validierung und Daniels Freigabe, innerhalb der jeweiligen Frist (V3 bis
    15.01.2027, also Rechnung, Validierung und Freigabe zwischen Anfang
    Januar und 15.01.2027). Findet der validator nach dem
    Registrierungs-Commit einen Rechenfehler, wird das als gekennzeichnete
    Neuregistrierung mit neuem Commit korrigiert. Der ursprüngliche Eintrag
    bleibt sichtbar und wird nicht überschrieben. Die Bewertung erfolgt dann
    gegen beide Fassungen, beide werden berichtet, und die Korrektur wird mit
    Datum und Grund offengelegt. Eingearbeitet in 0.1 (Ablauf,
    Korrekturregel, Fristentabelle), 7, 10 und 11. Folgefragen: 20 und 21.
18. **Dateinamen der Einträge #2–#5.** Vorschlag nach dem Muster von #1:
    `02_sommermittel-2027.md`, `03_hitzetage-2027.md`,
    `04_monate-ueber-1-5-grad-2027.md`, `05_thg-emissionen-2027.md`. Bitte
    bestätigen oder ändern. Außerdem: Ist sichergestellt, dass bis Januar
    2027 kein anderer Registereintrag die Nummern #2–#5 belegt?
    **Beantwortet 22.10.2026 (Daniel Saure):** wie vorgeschlagen. Dateinamen
    `02_sommermittel-2027.md`, `03_hitzetage-2027.md`,
    `04_monate-ueber-1-5-grad-2027.md`, `05_thg-emissionen-2027.md` in
    `Prognose-Register/`. Die Nummern #2–#5 sind für dieses Register
    reserviert. Ein anderer Registereintrag, der bis Januar 2027 entsteht,
    erhält #6 oder höher. Eingearbeitet in 0.1, 7 und 11.
19. **Substack-Zeitpunkt für V3.** V3 wird bis 15.01.2027 registriert, V1,
    V2 und V4 bis 31.01.2027. Soll es (a) einen gemeinsamen Substack-Beitrag
    nach der Registrierung aller vier geben, oder (b) für V3 einen eigenen,
    früheren Beitrag? Der verbindliche Zeitstempel ist in beiden Fällen der
    Commit.
    **Beantwortet 22.10.2026 (Daniel Saure):** wie vorgeschlagen, Option (a).
    Ein gemeinsamer Substack-Beitrag nach der Registrierung aller vier
    Vorhersagen, spätestens am 31.01.2027. Der verbindliche Zeitstempel ist
    der Commit. Eingearbeitet in 0.1 (Fristentabelle) und 11.

**Neue Rückfragen aus v0.3 (offen, vor dem Einfrieren aller Teile zu
klären):**

20. **Welche Fassung zählt nach einer Neuregistrierung primär?**
    (Widerspruch aus der Einarbeitung von Rückfrage 17.) Abschnitt 7 legt
    „genau eine Primärbewertung je Vorhersage“ fest; die Antwort auf
    Rückfrage 17 sieht bei einer Neuregistrierung die Bewertung gegen beide
    Fassungen vor, ohne festzulegen, welche in Überschrift, Teaser und
    Gesamtbilanz „k von 4“ eingeht. Ohne Festlegung könnten zwei Analysten
    zu unterschiedlichen Bilanzen kommen, und es bliebe eine nachträgliche
    Wahl der günstigeren Fassung möglich. Zu entscheiden:
    (a) Primär zählt immer die ursprünglich registrierte Fassung; die
    korrigierte Fassung wird daneben berichtet.
    (b) Primär zählt die korrigierte Fassung; die ursprüngliche wird daneben
    berichtet.
    (c) Primär zählt die korrigierte Fassung nur, wenn ihr Commit vor einem
    festen Zeitpunkt liegt (z. B. vor der ersten öffentlich verfügbaren
    Beobachtung des Zieljahres für die betreffende Größe), sonst die
    ursprüngliche.
    Zusätzlich: Ist eine Neuregistrierung zeitlich begrenzt (etwa bis zum
    Substack-Beitrag oder bis zur ersten 2027-Beobachtung), oder bis zum
    Stichtag der Auswertung zulässig? Ich lege das nicht selbst fest.
21. **Verhältnis zur Commit-Regel in CLAUDE.md.** CLAUDE.md verlangt einen
    Commit nach jedem abgeschlossenen Schritt („Analyse fertig“,
    „Validierung fertig“) als Audit-Trail. Nach Rückfrage 17 (b) dürfen
    Ergebnis-CSV und Registerdatei erst nach Validierung und Freigabe
    gemeinsam committet werden. Offen ist, was zwischen Rechnung und
    Registrierungs-Commit committet werden darf: (a) für diese Analyse
    nichts, d. h. Skript, `run_log.txt`, Ergebnis-CSV, Registerdatei und
    Validierungsbericht werden erst mit bzw. unmittelbar nach dem
    Registrierungs-Commit committet; oder (b) Skript und `run_log.txt` ohne
    Ergebniswerte dürfen vorher committet werden (dann wäre festzulegen,
    dass `run_log.txt` bis zur Registrierung keine Vorhersagewerte
    enthält); oder (c) eine andere Regel. Zugleich: Wird der
    Validierungsbericht im selben Commit wie CSV und Registerdatei abgelegt
    oder davor?

## 13. Benötigte Rohdateien (Download durch Daniel)

**Vor dem Einfrieren (nur Dateiname und Kopfzeile, keine Werte):**
0. Prüfung DWD CDC Gebietsmittel Heiße Tage: Existenz, Pfad, erstes Jahr
   (Rückfrage 3, offen; Eintrag in 3.2).

**Rechnung (Januar 2027, erst nach Sperre 2; für V3 Ausnahme von Sperre 2 (b) nach 0.1):**
1. DWD CDC `regional_averages_tm_summer.txt` (aktuelle Fassung mit Sommer 2026).
2. DWD CDC Gebietsmittel Heiße Tage, jährlich (Gebietsmittel nach Rückfrage 3;
   Datei nach der noch offenen Prüfung in 3.2), Fassung mit Jahreswert 2026.
3. C3S ERA5 monatliche globale Temperaturanomalien bis Dezember 2026, plus
   C3S-Methodikseite mit dem Offset 1991–2020 → 1850–1900. **Beim Download
   keine 2027-Werte öffnen.** Wenn die Datei 2027-Monate enthält, schneidet
   das Python-Skript sie beim Einlesen ab, bevor Werte angezeigt werden. Der
   Download erfolgt bis spätestens 12.01.2027, vor dem Erscheinen des
   Monatswerts Januar 2027.
4. UBA-Treibhausgasinventar, neueste bis 31.12.2026 veröffentlichte
   Submission (Gesamtemissionen ohne LULUCF).
5. UBA-Vorjahresschätzung 2025 (März 2026).
6. UBA-Projektionsdaten, neueste bis 31.12.2026 veröffentlichte Fassung (nur Wert 2027, MMS).
7. Kreuzprüfung: OWID monatliche globale Temperaturanomalien (V3); OWID- und
   GCP-Emissionen Deutschland (V4).
8. Für den Prüfschritt S2-Reproduktion: keine neue Datei; verwendet werden
   `Analysen/2026-09-sommer-2026-normal/rohdaten/regional_averages_tm_summer.txt`
   und `sommer_2026_normal.py` (liegen im Repository).

**Auswertung:**
9. DWD Sommerdatei, Abruf 15.09.2027.
10. DWD Heiße Tage, Abruf 31.01.2028.
11. C3S Monatswerte 2027, Abruf 31.01.2028.
12. UBA-Vorjahresschätzung 2027, Abruf 31.03.2028.

Alle Dateien unverändert ablegen, mit Quelle, Abrufdatum und SHA-256 im `run_log.txt`.
