# Statistischer Analyseplan (SAP) – Kältewinter wie 2010

**Titel:** Wie oft war der Januar bis März in Deutschland seit 1881 mindestens
so kalt wie Januar bis März 2010, und mit welcher Wahrscheinlichkeit (mit
Unsicherheitsspanne) ist ein solcher Spätwinter unter den Klimabedingungen von
2027 zu erwarten? Einordnung des Kälteszenarios („Winter wie 2010“) aus der
Gasspeicher-Modellierung des Verbands INES, ohne eigene Aussage zur
Gasversorgung.

**Format:** Klima Kompass · Evidenzcheck (neue Inferenz). Inhaltsstufe:
Evidenzcheck.
**Version:** 1.0
**Status: final** (eingefroren)
**Datum:** 23.11.2026
**Autor:in:** Claude (sap-autor-Subagent)
**Freigabe/Einfrieren:** Daniel Saure, 23.11.2026. Wortlaut im Chat: „Gelesen,
einfrieren“ auf die Frage, ob er den vollständigen SAP v0.2 gelesen hat und
ihn einfriert. Die Frage nannte ausdrücklich als mitzulesende Punkte: die
beiden S14-Festlegungen des sap-autors (Überlapp-Jahre 2009/10 und 2010/11
bleiben in E1, Zusatzwert ohne sie; S14 nutzt den Schätzer der
Primärgröße), die Ausweichregel zum Download (Entscheidung Daniel Saure, falls
nicht bis 31.12.2026) und die Bestätigung von R7 (keine Sperre aus
Registereintrag #1 berührt). Eingefrorener Text = v0.2 plus Statuswechsel und
diesen Vermerk. Änderungen ab jetzt nur per gekennzeichnetem Amendment vor
Datenzugriff.

**Geplanter Ordner:** `Analysen/2026-11-kaeltewinter-2010/`
**Vorlage:** `SAP-Vorlage/SAP-Template.md`. Struktur übernommen, Vorlage
unverändert. Abschnitte 0–11 entsprechen der Vorlage; Abschnitte 12
(Validierungsplan), 13 (Rohdateien) und 14 (Rückfragen) sind projektspezifische
Ergänzungen wie in früheren SAPs.

**Versionshistorie:**
- **v1.0 final (23.11.2026):** eingefroren durch Daniel Saure (Wortlaut
  siehe Kopf). Inhalt identisch mit v0.2; geändert nur Status, Version und
  Freigabevermerk.
- **v0.1 draft (23.11.2026):** Erstentwurf, präregistriert vor Datenzugriff.
  Keine Daten heruntergeladen oder gesichtet, kein Code geschrieben oder
  ausgeführt.
- **v0.2 draft (23.11.2026):** Einarbeitung der Entscheidungen von Daniel
  Saure (Chat, 23.11.2026; dokumentiert in 14.1 und 14.2) und der von der
  Top-Level-Session eingetragenen INES-Primärquelle (3.3). Abschnitte 3.3, 14.1
  und 14.2 inhaltlich unverändert. Weiterhin keine Daten heruntergeladen oder
  gesichtet, kein Code geschrieben oder ausgeführt. Im Einzelnen:
  - **R1–R4, R6, R9, R10 (Entscheidung Daniel Saure, 14.1):** Empfehlungen
    übernommen; in 2.0, 2.2, 2.4 b, 3.4, 5.3 und 14 als entschieden
    gekennzeichnet. Inhaltlich keine Methodenänderung gegenüber v0.1.
  - **R5 (Entscheidung Daniel Saure, 14.2):** Tagesdaten-Sensitivitäten S3,
    S4, S5 und S11 entfallen ersatzlos; keine HYRAS-Auswertung, keine
    Stationsauswahl. Grund: kein tägliches Gebietsmittel im DWD-CDC, HYRAS erst
    ab 1951 und mehrere GB Umfang. Nummerierung beibehalten (Vermerk
    „entfallen“), damit Verweise stabil bleiben. Betroffen: 2.0, 2.4 a, 3.1,
    3.2, 6, 8.4, 9, 10, 11, 12, 13.
  - **R12 / geänderte R2 (Entscheidung Daniel Saure, 14.2):** neue
    Sensitivität **S14** für den INES-Kombinationszeitraum (Nov.–Dez. 2010 +
    Jan.–Mär. 2010 gegen jeden historischen Zeitraum Nov. (t−1) bis Mär. (t)),
    E1 und E2, Trendfenster 1971–2026. Primärgröße bleibt JFM. Neuer Abschnitt
    2.5; betroffen außerdem 3.1, 4, 6, 7, 8.1, 9, 11, 12, 13. Datenschnitt
    bleibt März 2026.
  - **R7 (Prüfung Top-Level-Session, 14.2):** Ergebnis „keine Sperre berührt“
    in 2.4 b übernommen, Bestätigung durch Daniel Saure beim Einfrieren
    ausstehend. Betroffen: 2.4 b, 11, 12.
  - **R8 (Top-Level-Session, 14.2):** INES-Primärquelle gesichert (3.3);
    Folgeregel aus 3.3 angewendet: Primärdefinition JFM 2010 bleibt. Betroffen:
    0, 1, 2.0, 2.3, 8.3, 9, 13.
  - **Vom sap-autor ergänzte Präzisierungen zu S14** (nicht ausdrücklich
    entschieden, beim Lesen des Volltextes zu prüfen): Behandlung der teilweise
    mit 2010 überlappenden Zeiträume t = 2010 und t = 2011 in E1 (2.5), und
    dass S14 in E2 denselben Schätzer wie die Primärgröße nutzt (keine eigene
    Umschaltung, analog S1/S2).

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst; Einfrieren steht noch aus)
[ ] Exploratorisch

- **Präregistriert vor Datenzugriff.** Für diesen SAP wurden weder DWD-Reihen
  (Monats-, Jahreszeiten- oder Tageswerte) noch HYRAS-Raster noch OWID-Daten
  gesichtet. Der Auftrag enthielt keine Analyseergebnisse, Zahlen oder Grafiken
  zu dieser Fragestellung. Er enthielt nur die Zahlen aus der zu prüfenden
  Medienbehauptung (bis ca. 6,6 TWh Lücke pro Monat); das sind Inhalte der
  Behauptung, keine Ergebnisse dieser Analyse.
- **Gelesen wurden** (um Definitionen konsistent zu halten):
  `SAP-Vorlage/SAP-Template.md`, der SAP v1.0 final
  `Analysen/2026-09-gasspeicher-winter/SAP_gasspeicher-winter-2026.md` (nur
  der SAP, keine Ergebnisdateien, kein Bericht) und der SAP
  `Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md`
  (Kopf, Abschnitte 0, 0.1, 1, 2.0–2.6, Anfang von 3).
  Für v0.2 hat der sap-autor ausschließlich diesen SAP gelesen. Die
  INES-Dokumente unter `quellen/` hat der sap-autor nicht selbst gelesen; die
  INES-Angaben stammen aus dem Eintrag der Top-Level-Session in 3.3.
- **Bewusst nicht gelesen:** `Prognose-Register/01_gasspeicher-winter-2026-27.md`
  (Registereintrag #1). Er enthält registrierte Vorhersagewerte zur
  Gasspeicher-Entnahme im Winter 2026/27 und möglicherweise
  temperaturbezogene Größen. Das ist zu nah an dieser Fragestellung, um es vor
  dem Einfrieren zu lesen. Die Top-Level-Session hat nur die Abschnitte
  „Auswertung“ und „Offenlegung“ geprüft (14.2, R7); Ergebnis in 2.4 b.
- **Transparenz über Vorwissen:** Allgemein bekannt ist, dass der Winter 2009/10
  in Deutschland als kalt gilt. Genau deshalb hat INES ihn als Kälteszenario
  gewählt. Über den Eintrag in 3.3 sind außerdem qualitative Aussagen der
  INES-Dokumentation bekannt (Dezember und Januar 2010 deutlich kälter als
  2018–2023; Februar/März 2018 kälter als im INES-Kälteszenario). Konkrete
  Temperaturwerte, Ränge oder Häufigkeiten sind für diesen SAP weder
  nachgeschlagen noch verwendet worden. Die Ergebnisse des Gasspeicher-Checks
  (Regression Entnahme ~ Temperatur) sind nicht gesichtet worden und werden hier
  nicht verwendet.
- **Auswahleffekt, offen benannt:** Die Referenz (2010) wurde von INES gerade
  wegen ihrer Kälte ausgewählt. Das ist kein Mangel dieser Analyse, sondern ihr
  Gegenstand. Der Bericht sagt aber, dass ein nachträglich als „kalt“
  ausgewähltes Jahr in der eigenen Reihe zwangsläufig im kalten Teil liegt
  (siehe 8).
- **Ergebnisoffenheit:** Das Ergebnis kann zeigen, dass ein solcher Winter heute
  ein realistisches Risiko ist, oder dass er selten geworden ist. Beide
  Ausgänge werden veröffentlicht. Die Analyse bewertet INES nicht.

## 1. Hintergrund / Rationale

**Anlass (Stand 10./11.11.2026):** Laut Berichterstattung und
INES-Pressemitteilung vom 10.11.2026 (Primärquelle, 3.3) sagt der
Gasspeicherverband INES (Initiative Energien Speichern), dass das Gas in
Deutschland im Winter 2026/27 bei normalen oder milden Temperaturen bis zum
Frühjahr reicht. Erst bei einem extrem kalten Winter „entsprechend dem
Referenzjahr 2010“ entstünden im Modell Lücken (laut Berichten bis zu ca.
6,6 TWh pro Monat, Januar bis März 2027).
Sekundärquellen:
- ZDFheute: https://www.zdfheute.de/wirtschaft/heizen-gasspeicher-warnung-engpass-winter-verband-100.html
- cleanthinking.de: https://www.cleanthinking.de/?p=1075770
Primärquelle: siehe 3.3.

Laut Gasspeicher-SAP (Abschnitt 1, B2) rechnete INES schon im Szenario-Update
vom 08.09.2026 mit dem „EU-Wetterjahr 2010“ als kaltem Winter.

**Lücke in der öffentlichen Darstellung:** Die Aussage hängt an einem
Bedingungssatz („bei einem Winter wie 2010“). Für die Einordnung fehlt die
Gegenfrage: Wie wahrscheinlich ist diese Bedingung? Ohne diese Zahl lässt sich
das Szenario entweder als Panikmache abtun oder als akute Gefahr lesen. Beides
ist ohne Grundrate nicht begründet. Der Check liefert diese Grundrate mit
Unsicherheit und rechnet **keine** Gasbilanz.

**Mehrwert gegenüber eigenen früheren Arbeiten:** Der Gasspeicher-Check
(„Reichen 136 TWh?“) hat Entnahme und Temperatur über rund zehn Winter in
Beziehung gesetzt. Er hat nicht gefragt, wie selten ein bestimmter kalter
Winter im langen Klimaverlauf ist. Diese Analyse nutzt die lange
DWD-Temperaturreihe (ab 1881) und braucht keine Gasdaten.

## 2. Fragestellung (Estimands)

### 2.0 Grundbegriffe (gelten für alle Estimands)

- **Jahr y:** bezeichnet den Spätwinter Januar–März des Kalenderjahres y.
- **Zielgröße (primär) T_y:** Mitteltemperatur Januar–März (JFM) des
  DWD-Gebietsmittels Deutschland im Jahr y, in °C, berechnet als nach
  Tagesanzahl gewichtetes Mittel der drei Monatswerte:
  T_y = (31·T_Jan + d_Feb·T_Feb + 31·T_Mär) / (62 + d_Feb), d_Feb = 28 bzw. 29
  im Schaltjahr. Monatswerte aus den DWD-Dateien
  `regional_averages_tm_01.txt`, `_02.txt`, `_03.txt`, Spalte „Deutschland“,
  so wie sie in der Datei stehen (zwei Nachkommastellen). T_y wird ungerundet
  weiterverwendet.
- **Referenzwert T_ref:** T_2010, berechnet nach derselben Formel aus derselben
  Datei. T_ref wird nicht aus Pressemitteilungen oder anderen Quellen
  übernommen.
- **„Mindestens so kalt wie 2010“:** T_y ≤ T_ref, wobei beide Seiten vor dem
  Vergleich auf **0,01 °C** gerundet werden (Genauigkeit der Quelle). Gleichstand
  zählt als „mindestens so kalt“.
- **Begründung der Wahl JFM (entschieden, R1, 14.1):**
  1. Die von INES genannten Lücken betreffen Januar bis März 2027. Die Zielgröße
     deckt genau diese Monate ab.
  2. INES setzt laut Primärquelle das **Kalenderjahr** 2010 („EU-Wetterjahr
     2010“) ein (3.3). Für Januar–März 2027 gilt damit das Wetter Januar–März
     2010. Nach der Folgeregel in 3.3 bleibt die Primärdefinition unverändert.
     Der von INES zusätzlich eingesetzte Zeitraum November–Dezember 2010 wird
     als Sensitivität S14 abgebildet (2.5), nicht als Primärgröße.
  3. Monatliche Gebietsmittel gibt es ab 1881 in einer einheitlichen
     DWD-Reihe; die lange Reihe ist für seltene Ereignisse nötig.
  4. Ein Monatsmittel ist ein grober, aber direkt verständlicher Stellvertreter
     für den Heizbedarf. Gradtage und Kältephasen auf Tagesbasis werden
     **nicht** gerechnet (S3–S5, S11 entfallen, R5, 14.2); siehe Limitationen
     (9).

### 2.1 E1 (primär, deskriptiv) – Historische Häufigkeit

- **Grundgesamtheit:** alle Jahre 1881–2026 außer 2010 selbst (n = 145).
- **Kennzahl:** k₁ = Anzahl der Jahre mit T_y ≤ T_ref; Anteil h₁ = k₁ / 145 mit
  **Clopper-Pearson-95-%-Intervall**.
- Zusätzlich (gleichwertig vorab festgelegt, beschreibend):
  - k und Anteil in den festen Teilzeiträumen 1881–1930, 1931–1960,
    1961–1990, 1991–2020 und 1997–2026 (jeweils ohne 2010), mit
    Clopper-Pearson-Intervall;
  - Rang von T_2010 unter allen 146 Jahren (1 = kältestes);
  - Liste der Jahre mit T_y ≤ T_ref und das letzte Jahr vor 2010 sowie das
    erste Jahr nach 2010 mit T_y ≤ T_ref (oder „keines“).
- E1 ist ausdrücklich **nicht trendbereinigt**. Es beantwortet „wie oft kam
  das vor“, nicht „wie wahrscheinlich ist es heute“.

### 2.2 E2 (primär, Kernzahl) – Wahrscheinlichkeit unter Klimabedingungen von 2027

- **Estimand:** P₂₀₂₇ = Wahrscheinlichkeit, dass T_2027 ≤ T_ref, unter einem
  statistischen Modell, das den Klimazustand durch einen Trend beschreibt und
  die Jahr-zu-Jahr-Schwankung als Zufallsstreuung um diesen Trend.
  Das ist eine **klimatologische Grundrate**, keine Wettervorhersage für den
  Winter 2026/27 (Abschnitt 8.1).
- **Primäres Modell M1:** OLS-Regression T_y = b₀ + b₁·y + ε_y,
  ε_y ~ N(0, σ²) unabhängig, auf dem **Trendfenster 1971–2026 (n = 56)**
  (entschieden, R3, 14.1).
  Begründung: dasselbe Fenster wie das validierte Trendmodell des
  Sommer-2026-Checks und V1 des Prognose-Registers (Konsistenz im Projekt);
  ab etwa den 1970er Jahren ist die Erwärmung in Deutschland näherungsweise
  linear beschreibbar, während eine Gerade ab 1881 den Verlauf schlechter
  abbilden würde. Andere Fenster nur als Sensitivität (S6, S7).
- **Punktschätzer (primär):** prädiktive Wahrscheinlichkeit aus der
  t-Verteilung,
  P̂₂₀₂₇ = F_{t, n−2}( (T_ref − ŷ₂₀₂₇) / (σ̂ · √(1 + h₂₀₂₇)) ),
  mit ŷ₂₀₂₇ = b̂₀ + b̂₁·2027, σ̂ = Residual-Standardabweichung (Divisor n − 2),
  h₂₀₂₇ = Hebelwert des Jahres 2027 im Fenster 1971–2026.
- **Zusätzlich berichtet (aus M1 abgeleitet, keine eigenen Estimands):**
  - Wiederkehrzeit 1 / P̂₂₀₂₇ in Jahren („etwa einmal in X Jahren“);
  - Residuum von 2010 in Einheiten von σ̂ (z-Wert) und sein Rang unter den
    56 Residuen: Wie ungewöhnlich war 2010 gemessen am damaligen Trend?
  - ŷ₂₀₂₇ und ŷ₂₀₁₀ (Trendniveau heute und damals) mit 95-%-KI.
- **Vorab festgelegte Umschaltregeln (deterministisch, Abschnitt 5.3;
  entschieden, R4, 14.1):** Je nach Ergebnis der Diagnostik in 5.2 wird der
  Primärschätzer nach festen Regeln durch M1-AR oder M1-Boot ersetzt. Die
  Umschaltung hängt ausschließlich am Diagnostikergebnis, nie an der Höhe von
  P̂₂₀₂₇. Alle Varianten werden immer berichtet.

### 2.3 Ausdrücklich nicht Gegenstand

- keine Gasbilanz, keine Aussage zu Speicherfüllständen, Importen oder einer
  „Wahrscheinlichkeit einer Gasmangellage“;
- keine Wettervorhersage oder Saisonprognose für den Winter 2026/27;
- keine Nachrechnung oder Bewertung des INES-Modells;
- keine Attribution (Ursachen der Erwärmung, Polarwirbel, Blockadelagen);
- keine Aussage für einzelne Regionen oder Städte; nur Deutschland-Gebietsmittel;
- kein europäisches Wetterjahr: INES rechnet laut Dokumentation (3.3) mit dem
  „EU-Wetterjahr 2010“, diese Analyse nur mit Deutschland (Abschnitt 9);
- keine Auswertung oder Anzeige der bereits beobachteten Monate Oktober und
  November 2026 und keine Berechnung des tatsächlichen Zeitraums November
  2026–März 2027 (R6, 14.1; 2.5).

### 2.4 Abgrenzung zu bestehenden Arbeiten

**(a) Evidenzcheck „Reichen 136 TWh?“
(`Analysen/2026-09-gasspeicher-winter/`, SAP v1.0 final):**

| | Gasspeicher-Check | Diese Analyse |
|---|---|---|
| Zielgröße | Netto-Speicherentnahme (TWh) | Temperatur (°C) |
| Temperaturdefinition | DWD-Gebietsmittel Deutschland, Monatsmittel, mit Monatslängen gewichtetes Mittel Okt.–Mär. | dieselbe Datenfamilie und dieselbe Gewichtung; Fenster **Jan.–Mär.** (primär), Okt.–Mär. als S2, Nov.–Mär. (INES-Kombination) als S14 |
| Gradtage | VDI 3807 als S5 (nur ohne Zusatzaufwand) | keine (S3 entfallen, R5) |
| Zeitraum | Winter 2016/17–2025/26 (n = 10) | 1881–2026 (E1), 1971–2026 (E2) |
| Kälte-Benchmark | 10. Perzentil der Okt.–Mär.-Temperatur 1996–2025 | Referenzjahr 2010 |

- **Konsistenz:** Datenquelle, Spalte und Gewichtung werden übernommen.
- **Begründete Abweichung:** Primär Jan.–Mär. statt Okt.–Mär., weil die zu
  prüfende Aussage sich auf Lücken Januar–März bezieht und weil INES für diese
  Monate das Wetter Januar–März 2010 einsetzt (2.0, 3.3). Die Definition des
  Gasspeicher-Checks wird als S2 vollständig mitgerechnet.
- **Keine Rückwirkung:** Die Ergebnisse des Gasspeicher-Checks werden weder
  verwendet noch neu bewertet. Insbesondere wird **keine** Kombination der Art
  „Wahrscheinlichkeit Kältewinter × Entnahme pro Grad = Wahrscheinlichkeit
  Lücke“ gerechnet oder im Text nahegelegt.
- **Integritätsabgleich:** Die Monatswerte Okt. 2013–Mär. 2026 werden mit der
  im Gasspeicher-Ordner abgelegten Datei abgeglichen (3.5).

**(b) Prognose-Register 2027
(`Analysen/2026-10-prognose-register-2027/`, Abschnitt 0.1 Sperren):**

Prüfung Sperre für Sperre:
- **Sperre 1 (Datenschnitt 31.12.2026, keine Beobachtung aus 2027 vor der
  Registrierung):** Sie gilt dem Wortlaut nach für die Berechnung von V1–V4.
  Diese Analyse braucht keine Beobachtung aus 2027 und keine aus dem Winter
  2026/27: **Datenschnitt hier = März 2026** (letzter vollständiger
  Januar–März; gilt auch für S14, 2.5). Risiko: Die DWD-Monatsdateien enthalten
  beim Abruf auch Monate ab Oktober 2026. Festlegung (entschieden, R6, 14.1):
  (i) Der Download der Rohdateien erfolgt **bis spätestens 31.12.2026**.
  Gelingt das nicht, wird nicht eigenmächtig verschoben, sondern Daniel Saure
  entscheidet vor dem Download (v0.1 nannte als Ausweichtermin: nach dem
  Registrierungs-Commit von V1/V2/V4, spätestens 31.01.2027).
  (ii) Das Skript verwirft beim Einlesen alle Werte nach März 2026, bevor
  irgendeine Ausgabe erzeugt wird; keine Ausgabedatei, Grafik oder Logzeile
  enthält einen Wert ab Oktober 2026. Die bereits erschienenen Monatswerte
  Oktober/November 2026 werden nicht ausgewertet und nicht angezeigt. Damit
  wird weder Sperre 1 berührt noch der Zielwinter von Registereintrag #1
  angesehen.
- **Sperre 2 (Reihenfolge Prognose-Check vor Register):** betrifft diese
  Analyse nicht; sie ist weder Prognose-Check noch Registereintrag.
- **Sperre 3 (keine Rückkopplung aus dem Prognose-Check):** nicht berührt;
  diese Analyse verwendet keine Projektionsberichte.
- **Umgekehrte Rückkopplung auf das Register:** Ergebnisse dieser Analyse
  dürfen **weder** Methoden, Fenster oder Intervalle von V1–V4 verändern
  (Register-SAP noch teilweise draft; V1 nutzt dieselbe Datenfamilie DWD
  Gebietsmittel, aber eine andere Jahreszeit), **noch** Anlass für eine
  Neuregistrierung von Eintrag #1 sein, **noch** in die Auswertung von
  Eintrag #1 einfließen. Eine Neuregistrierung im Register ist dort nur für
  Rechenfehler vorgesehen; diese Analyse ist kein Rechenfehler-Befund.
  Sicherung: Der analyst dieser Analyse arbeitet ausschließlich im Ordner
  `Analysen/2026-11-kaeltewinter-2010/` und schreibt nichts in
  `Prognose-Register/` oder `Analysen/2026-10-prognose-register-2027/`; der
  validator prüft das per `git diff` (Abschnitt 12).
- **Registereintrag #1 (Gasspeicher-Entnahme Winter 2026/27):** Geprüft durch
  die Top-Level-Session am 23.11.2026 (14.2, R7), nur die Abschnitte
  „Auswertung“ und „Offenlegung“ von
  `Prognose-Register/01_gasspeicher-winter-2026-27.md`; der Abschnitt
  „Vorhersagen“ wurde bewusst nicht gelesen. Ergebnis: Dort stehen keine
  Sperren und keine Kommunikationsverbote; Auswertung nach Eurostat-Daten
  (Mai/Juni 2027), Veröffentlichung unabhängig vom Ergebnis; „Nicht
  vorhergesagt werden: Versorgungssicherheit, Preise, kurze Kältewellen.“
  **Ergebnis: keine Sperre berührt. Durch Daniel Saure zu bestätigen beim
  Einfrieren.** Unabhängig davon gilt weiter: Der Bericht dieser Analyse
  erwähnt Eintrag #1 nicht wertend und nennt keine seiner Vorhersagewerte.
- **Fazit:** Nach den gelesenen Abschnitten ist keine vorab festgelegte Sperre
  berührt, sofern Datenschnitt und Downloadzeitpunkt wie oben eingehalten
  werden. Ausstehend ist allein die Bestätigung des R7-Ergebnisses durch Daniel
  Saure beim Einfrieren.

### 2.5 Sensitivitäts-Estimand S14 – INES-Kombinationszeitraum (neu in v0.2)

Entschieden durch Daniel Saure (R12, 14.2); ändert R2. **Keine Primärgröße.**
Die Primärgröße bleibt T_y (JFM, 2.0).

- **Hintergrund:** INES setzt das Kalenderjahr 2010 ein; für November–Dezember
  2026 also offenbar November–Dezember 2010, für Januar–März 2027 Januar–März
  2010 (3.3). Der INES-Zeitraum ist damit eine Kombination aus zwei
  verschiedenen Wintern, kein physikalisch zusammenhängender Winter.
- **Referenzwert T_ref^S14:** nach Tagesanzahl gewichtetes Mittel der
  DWD-Monatsgebietsmittel Deutschland (dieselben Dateien und dieselbe Spalte wie
  2.0) von November 2010, Dezember 2010, Januar 2010, Februar 2010 und März
  2010:
  T_ref^S14 = (30·T_Nov2010 + 31·T_Dez2010 + 31·T_Jan2010 + 28·T_Feb2010
  + 31·T_Mär2010) / 151.
- **Historische Vergleichsgröße U_t:** für jedes Jahr t das gewichtete Mittel
  des zusammenhängenden Zeitraums November (t−1) bis März (t):
  U_t = (30·T_Nov(t−1) + 31·T_Dez(t−1) + 31·T_Jan(t) + d_Feb(t)·T_Feb(t)
  + 31·T_Mär(t)) / (123 + d_Feb(t)), d_Feb = 28 bzw. 29 im Schaltjahr.
- **„Mindestens so kalt“:** U_t ≤ T_ref^S14, beide Seiten vor dem Vergleich
  auf 0,01 °C gerundet; Gleichstand zählt als „mindestens so kalt“.
- **E1 für S14:** Grundgesamtheit t = 1882–2026 (n = 145; der erste
  vollständige Zeitraum ist November 1881–März 1882). Kein historischer
  Zeitraum ist mit der Referenz identisch; deshalb wird kein Jahr
  ausgeschlossen. Die Zeiträume t = 2010 (Nov. 2009–Mär. 2010) und t = 2011
  (Nov. 2010–Mär. 2011) überlappen teilweise mit der Referenz; sie bleiben
  enthalten, werden in der Liste als „teilweise überlappend“ markiert, und
  zusätzlich wird k ohne diese beiden Jahre (n = 143) mit Clopper-Pearson
  berichtet (vorab festgelegt, beschreibend). Berichtet werden: k, Anteil mit
  Clopper-Pearson-95-%-Intervall, Rang von T_ref^S14 unter den 145
  historischen Werten zuzüglich Referenz (146 Werte, 1 = kältester), Liste der
  Jahre mit U_t ≤ T_ref^S14. Keine Teilzeiträume.
- **E2 für S14:** P^S14₂₀₂₇ = Wahrscheinlichkeit, dass U_2027 (Zeitraum
  November 2026–März 2027) ≤ T_ref^S14 ist, unter dem Trendmodell. Festes
  Trendfenster t = 1971–2026 (n = 56; Zeiträume Nov. 1970–Mär. 1971 bis
  Nov. 2025–Mär. 2026), linear wie M1 (R3). Schätzer: derjenige, der sich aus
  5.3 für die **Primärgröße** ergibt (keine eigene Umschaltung, analog S1/S2);
  Unsicherheitsspanne nach dem zugehörigen Verfahren in 5.4; Wiederkehrzeit wie
  in 2.2.
- **Ausdrücklich (R6):** Der tatsächliche Wert U_2027 wird **nicht** berechnet.
  Die Monatswerte Oktober und November 2026 werden weder eingelesen noch
  ausgewertet noch angezeigt; Dezember 2026 bis März 2027 ebenso nicht. Der
  Datenschnitt bleibt März 2026. P^S14₂₀₂₇ ist eine klimatologische Grundrate
  ohne Kenntnis des bisherigen Verlaufs des Winters 2026/27 (8.1).

## 3. Datenquelle

**Template-Pflichtfelder (beim Datenzugriff ausfüllen und in `run_log.txt`
spiegeln):**
- Quelle: Deutscher Wetterdienst (DWD), Climate Data Center (CDC)
- Zugriffsdatum: [TT.MM.JJJJ – beim Download eintragen]
- Datenstand laut Quelle: [Dateikopf bzw. Änderungsdatum je Datei eintragen]
- Lizenz: Nutzung mit Quellenangabe „Deutscher Wetterdienst“ (beim Download
  nach aktueller DWD-Nutzungsbedingung bestätigen)

### 3.1 Primärquelle Temperatur (E1, E2, S1, S2, S6–S10, S12–S14)

- DWD CDC, `climate_environment/CDC/regional_averages_DE/monthly/air_temperature_mean/`,
  Dateien für die Monate 01, 02, 03 (primär) sowie 10, 11, 12 (für S1, S2,
  S14), Spalte „Deutschland“, Jahre 1881 bis zuletzt verfügbar; verwendet bis
  einschließlich März 2026 (Datenschnitt, 2.4 b).
- Für S1 zusätzlich: `regional_averages_DE/seasonal/air_temperature_mean/regional_averages_tm_winter.txt`
  (DJF). Welche Jahreszahl der DWD einem Winter zuordnet (Jahr des Januars
  oder des Dezembers), wird aus dem Dateikopf übernommen und im `run_log.txt`
  festgehalten; S1 verwendet den Winter Dezember 2009–Februar 2010.
- **Versionierung:** Rohdateien unverändert unter `rohdaten/dwd/` ablegen,
  SHA-256-Prüfsumme und Zugriffsdatum in `run_log.txt`. Gerechnet wird mit dem
  Dateiinhalt zum Abrufzeitpunkt. Spätere DWD-Revisionen ändern das Ergebnis
  nicht; bekannt gewordene Revisionen werden im Bericht genannt.
- **Beschaffung:** Download durch Daniel Saure über den Browser (aus der
  Cloud-Session laut Gasspeicher-SAP gesperrt, Stand 14.09.2026), Ablage
  unverändert, bis spätestens 31.12.2026 (R6). Kein Abtippen und kein Einfügen
  als Chattext (Lehre aus dem Gasspeicher-Check).

### 3.2 Tagesdaten – entfallen (v0.2)

- **Entfallen per Entscheidung Daniel Saure (R5, 14.2, 23.11.2026).** Es
  werden keine Tagesdaten beschafft oder ausgewertet; keine HYRAS-Auswertung,
  keine Ersatzlösung mit selbst ausgewählten Einzelstationen.
- **Begründung (aus 14.2):** Im DWD-CDC gibt es unter `regional_averages_DE/`
  nur `annual/`, `monthly/`, `seasonal/`, kein tägliches Gebietsmittel.
  HYRAS-DE-Tagesraster liegen erst ab 1951 vor und umfassen rund 60 MB je Jahr
  (mehrere GB gesamt). Aufwand und kürzere Reihe sprechen gegen die Aufnahme.
- **Folge:** Die Sensitivitäten S3, S4, S5 und S11 entfallen ersatzlos
  (Abschnitt 6). Die Prüfung erfolgte nur anhand von Verzeichnis- und
  Dateinamen; es wurden keine Werte gesichtet.

### 3.3 INES-Primärquelle (vor jeder Datensichtung zu sichern)

- **Zu sichern:** Pressemitteilung bzw. Szenario-Dokument von INES vom
  November 2026, aus dem die Medienberichte stammen, insbesondere die
  **Definition des Kälteszenarios** (welches Wetterjahr, welche Region, welche
  Monate, Temperatur- oder Gradtagbasis, Tages- oder Monatsauflösung).
- **Reihenfolge (verbindlich):** Die INES-Definition wird **vor dem
  Einfrieren dieses SAP** wörtlich mit Fundstelle (URL, Datum, Abrufdatum) in
  diesem Abschnitt eingetragen, und **vor jedem Datenzugriff**. Ablage als PDF
  oder Seitenkopie unter `quellen/` im Analyseordner.
- **Folgeregel:** Bestätigt die INES-Definition, dass für Januar–März 2027 das
  Wetter von Januar–März 2010 eingesetzt wird (oder ein Winter, der Januar–März
  2010 enthält), bleibt die Primärdefinition (2.0) unverändert. Weicht sie
  davon ab (z. B. anderes Jahr, nur eine Kältewelle, ein synthetisches
  Szenario), wird der SAP **vor dem Einfrieren** angepasst (neue
  Versionsnummer, Änderung begründet). Nach dem Einfrieren nur noch per
  gekennzeichnetem Amendment vor Datenzugriff.
- **Findet sich keine Primärquelle:** Die Aussage wird im Bericht als
  „übereinstimmend in Medien wiedergegeben“ gekennzeichnet; die Primärdefinition
  JFM 2010 gilt dann unverändert (sie ist mit beiden Lesarten verträglich).
- Eintragsfeld:
  - Fundstelle: INES, „INES-Gas-Szenarien: Niedrige Speicherfüllstände
    gefährden Versorgungssicherheit bei extremer Kälte“, Pressemitteilung vom
    10.11.2026, https://energien-speichern.de/ines-gas-szenarien-niedrige-speicherfuellstaende-gefaehrden-versorgungssicherheit-bei-extremer-kaelte/ ;
    Dokumentation zum November-Update, Abschnitt 3.3 „Sensitivitätsanalyse
    unterschiedlicher Temperaturverläufe“ (S. 13–15),
    https://energien-speichern.de/wp-content/uploads/2026/11/INES-Gas-Szenarien_November-Update_Dokumentation.pdf .
    Abgerufen 23.11.2026 durch die Top-Level-Session, abgelegt unter
    `quellen/INES_PM_2026-11-10.html` und
    `quellen/INES_Dokumentation_November-Update_2026.pdf`.
  - Wortlaut der Szenario-Definition (Dokumentation, 3.3): Unter gleicher
    Modell-Parametrisierung wurden zwei weitere Wetterjahre gerechnet:
    „Kalte Temperaturen: EU-Wetterjahr 2010“, „Warme Temperaturen:
    EU-Wetterjahr 2020“; Normaljahr ist das „Wetterjahr 2016“ (3.2).
    Pressemitteilung: „extrem kalten Winter entsprechend dem Referenzjahr 2010“.
    Szenariozeitraum ab Füllstand 1. November 2026; Lücken im Januar, Februar
    und März 2027. Die Dokumentation betont, dass 2010 „in den Monaten Dezember
    und Januar“ deutlich unter 2018–2023 lag, und nennt 2018 als Jahr mit
    kälterem Februar/März als im INES-Kälteszenario.
  - Einordnung (Top-Level-Session, 23.11.2026, nicht vom sap-autor geprüft):
    INES setzt das **Kalenderjahr** 2010 ein. Für Januar–März 2027 gilt damit
    das Wetter Januar–März 2010; nach der Folgeregel oben bleibt die
    Primärdefinition (2.0) unverändert. **Aber:** Für November–Dezember 2026
    setzt INES offenbar November–Dezember 2010 ein, und die Dokumentation
    hebt Dezember 2010 als extrem kalt hervor. Das Szenario ist damit eine
    Kombination aus Nov.–Dez. 2010 und Jan.–Mär. 2010, kein physikalischer
    Winter. Entschieden (14.2, Daniel Saure 23.11.2026): Sensitivität für
    diesen Kombinationszeitraum wird aufgenommen (S14, siehe 2.5); R2
    entsprechend geändert.
  - Abrufdatum: 23.11.2026

### 3.4 Sekundärquelle Our World in Data (Plausibilisierung)

- Geprüft gemäß CLAUDE.md; Aufnahme entschieden (R9, 14.1), sofern der
  Datensatz existiert. OWID führt keine DWD-Gebietsmittel. In Frage kommt
  ein OWID-Datensatz zu monatlichen Oberflächentemperaturen je Land, der nach
  OWID-Angabe auf Copernicus-ERA5 beruht (Verfügbarkeit und Beginnjahr beim
  Datenzugriff prüfen, nicht vorab angenommen).
- **Verwendung, falls vorhanden:** ausschließlich Plausibilisierung, keine
  Verrechnung: Rang von JFM 2010 innerhalb des gemeinsamen Zeitraums in beiden
  Quellen und Korrelation (Pearson) der JFM-Mittel im gemeinsamen Zeitraum.
  Abweichungen werden berichtet. Bei Widerspruch gilt der DWD. Für S14 erfolgt
  keine OWID-Plausibilisierung.
- **Fallback:** OWID ersetzt den DWD nur bei dokumentiertem
  Zugriffsproblem auf die DWD-Daten, das auch über den Browser-Download nicht
  lösbar ist. Dann wird die Analyse als „mit Sekundärquelle gerechnet“
  gekennzeichnet; E1 ist dann nur ab Beginn der OWID-Reihe möglich.
- Ist der Datensatz nicht vorhanden: „OWID betrachtet, kein geeigneter
  Datensatz“ im Bericht.
- Auch beim OWID-Datensatz gilt der Datenschnitt März 2026 (2.4 b).

### 3.5 Integritäts-Checks (vor jeder Auswertung)

1. Alle Monatswerte Januar 1881 bis März 2026 vorhanden, keine Fehlwerte, keine
   Werte außerhalb −15 °C bis +15 °C (Plausibilitätsgrenze für
   Deutschland-Monatsmittel Okt.–Mär.; Überschreitung = Stopp und Rückfrage,
   kein Ausschluss).
2. DJF aus Monatswerten vs. saisonale DWD-Winterdatei: Abweichung je Jahr
   ≤ 0,05 °C (Rundungstoleranz); größere Abweichungen dokumentieren.
3. Abgleich Okt. 2013–Mär. 2026 mit
   `Analysen/2026-09-gasspeicher-winter/rohdaten/dwd/dwd_gebietsmittel_deutschland_wintermonate.csv`:
   Abweichungen je Monat dokumentieren. Maßgeblich ist die neue
   Original-Rohdatei; eine Abweichung ist ein Hinweis auf einen
   Übertragungsfehler oder eine Revision und wird an Daniel gemeldet (betrifft
   den Gasspeicher-Check, nicht diese Analyse).
4. Nach dem Filter: kein Monatswert nach März 2026 im Arbeitsdatensatz
   (Prüfung ohne Ausgabe der verworfenen Werte).
5. Ergebnis der Checks als „bestanden / nicht bestanden“ in `run_log.txt`.

## 4. Analysepopulation

- **Einheit:** ein Jahr y mit seinem Januar–März (primär); für S1 der Winter
  Dezember–Februar, für S2 das Winterhalbjahr Oktober–März, für S14 der
  Zeitraum November–März (je benannt nach dem Jahr des Januars).
- **E1:** 1881–2026 (146 Jahre), Vergleichsmenge ohne 2010: n = 145. Für S1, S2
  und S14 beginnt die Reihe 1882 (Dezember, Oktober bzw. November 1881 als
  erster Vormonat). S14: n = 145 (1882–2026, kein Ausschluss; zusätzlich
  n = 143 ohne 2010 und 2011, 2.5).
- **E2 (M1):** Trendfenster 1971–2026, n = 56. Das Jahr 2010 bleibt im
  Fenster (es ist Teil des Klimaverlaufs; der Ausschluss wäre selbst eine
  Ergebnisentscheidung). Sensitivität ohne 2010: S12. S14: Fenster t =
  1971–2026, n = 56.
- **Ausschlüsse:** keine. Kein Jahr wird wegen auffälliger Werte entfernt.
- **Datenschnitt:** März 2026. Monate ab Oktober 2026 werden nicht eingelesen
  (2.4 b); dies gilt ausdrücklich auch für S14.

## 5. Statistische Methoden

### 5.1 Primäranalyse

- **E1:** Zählung und Anteil nach 2.1; Clopper-Pearson-Intervall (exakt,
  zweiseitig 95 %).
- **E2:** OLS-Modell M1 nach 2.2; Punktschätzer P̂₂₀₂₇ aus der t-prädiktiven
  Verteilung; Unsicherheitsspanne nach 5.4.
- Es werden keine Hypothesentests als Kernaussage verwendet. Berichtet werden
  Schätzwerte mit Intervallen.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan für M1)

Alle Prüfungen auf den OLS-Residuen von M1 (1971–2026), alle Ergebnisse werden
berichtet:
- **Autokorrelation:** ACF und PACF bis Lag 10 (Grafik); Ljung-Box-Test mit
  Lag 5 (fitdf = 0); Durbin-Watson zur Information.
- **Normalität:** Q-Q-Plot; Shapiro-Wilk-Test; Schiefe (Stichprobenschiefe,
  zur Information). Hintergrund: Kalte Winter entstehen oft durch
  Blockadelagen; eine linksschiefe Verteilung ist fachlich möglich und wäre für
  die linke Flanke, um die es hier geht, relevant.
- **Varianzhomogenität über die Zeit:** Residuen gegen Jahr; Breusch-Pagan-Test
  gegen das Jahr (zur Information, keine Umschaltregel); Residual-SD
  1971–1998 vs. 1999–2026 beschreibend.
- **Einfluss:** Cook's Distance, Kennzeichnung von Jahren mit D > 4/n; kein
  Ausschluss.
- **Linearität:** Residuen gegen angepasste Werte; LOESS-Glättung der Residuen
  nur grafisch.
- Für die Zielgrößen-Varianten S1, S2 und S14 wird keine eigene Diagnostik als
  Entscheidungsgrundlage verwendet (kein eigener Schätzerwechsel, 6).

### 5.3 Korrektur bei Annahmenverletzung (vorab festgelegte Umschaltregeln; entschieden, R4)

Die Regeln werden genau einmal auf das Fenster 1971–2026 der Primärgröße
angewendet; das Ergebnis bestimmt den Primärschätzer. Die Tests dienen hier nur
als deterministische Entscheidungsregel (α = 0,05):

| Ljung-Box (Lag 5) p < 0,05 | Shapiro-Wilk p < 0,05 | Primärschätzer für E2 |
|---|---|---|
| nein | nein | **M1** (t-prädiktiv, 2.2) |
| ja | nein | **M1-AR:** Regression mit AR(1)-Fehlern, GLS per Maximum Likelihood; ŷ₂₀₂₇ = b̂₀ + b̂₁·2027 + φ̂·û₂₀₂₆; Prognosevarianz = σ̂²_e + x₂₀₂₇'·Var(b̂)·x₂₀₂₇; P̂ = Φ((T_ref − ŷ₂₀₂₇)/√Prognosevarianz) |
| nein | ja | **M1-Boot:** Residuen-Bootstrap (5.4), Punktschätzer = Anteil der Werte ŷ₂₀₂₇ + e_i (i = 1…56) mit ≤ T_ref |
| ja | ja | **M1-Block-Boot:** wie M1-Boot, aber Moving-Block-Bootstrap der Residuen mit Blocklänge 3 |

- Die nicht gewählten Schätzer werden **immer** als Sensitivität mitberichtet
  (S10).
- Die Umschaltung hängt nur an den beiden p-Werten, nie an P̂₂₀₂₇.
- Bei M1-Boot / M1-Block-Boot mit Punktschätzer 0 (kein Residuum unter der
  Schwelle) wird „empirisch nicht auflösbar, kleiner als 1/56“ berichtet,
  zusammen mit der Bootstrap-Spanne; es wird dann nicht nachträglich auf M1
  zurückgewechselt.
- Die in v0.1 genannte Alternative „M1 immer primär“ ist mit der Entscheidung
  zu R4 verworfen.

### 5.4 Unsicherheitsquantifizierung

- **E1:** Clopper-Pearson-95-%-Intervall.
- **E2, M1 (primär):** Parameterunsicherheit über Simulation, B = 10 000, fester
  Seed 20261123:
  σ*² = σ̂²·(n−2)/χ²_{n−2}, β* ~ N(β̂, σ*²·(X'X)⁻¹),
  P*_b = Φ((T_ref − x₂₀₂₇'β*)/σ*).
  **Unsicherheitsspanne** = 2,5-%- und 97,5-%-Quantil der P*_b.
  (Der Mittelwert der P*_b entspricht bei diesem Vorgehen der t-prädiktiven
  Wahrscheinlichkeit P̂₂₀₂₇; Abweichung > 0,5 Prozentpunkte wird als
  Rechenhinweis gemeldet.)
- **M1-AR:** Ziehung (b₀, b₁, φ, log σ_e) aus der asymptotischen
  Normalverteilung der ML-Schätzer, B = 10 000, gezogene φ mit |φ| ≥ 1
  verwerfen und neu ziehen (Anteil berichten); P*_b wie oben; Quantile 2,5 %
  und 97,5 %.
- **M1-Boot:** B = 10 000 Residuen-Bootstrap: y* = ŷ + e* (Ziehen mit
  Zurücklegen), Neuanpassung, P*_b = Anteil von ŷ*₂₀₂₇ + e*_fit,i ≤ T_ref;
  Perzentilintervall. **M1-Block-Boot:** dasselbe mit Moving-Block-Bootstrap,
  Blocklänge 3.
- **S1, S2, S14:** dasselbe Verfahren wie für den Primärschätzer, mit der
  jeweiligen Zielgröße und Referenz (für S14: U_t und T_ref^S14, 2.5).
- **Wiederkehrzeit:** 1/P̂ mit Intervall [1/oberes, 1/unteres Quantil]; ist
  die untere Grenze 0, wird die obere Grenze der Wiederkehrzeit als „nicht
  begrenzt“ berichtet.
- Alle Intervalle werden als 95-%-Intervalle bezeichnet; bei E2 als
  „Unsicherheitsspanne“, mit dem Hinweis, dass sie nur die statistische
  Unsicherheit des gewählten Modells abbildet, nicht die Modellwahl (dafür
  Abschnitt 6).

### 5.5 Signifikanzniveau

α = 0,05 nur für die Diagnostik- und Umschaltregeln in 5.2/5.3. Die
Kernaussagen sind Schätzungen mit Intervallen, kein Signifikanztest.

## 6. Sensitivitätsanalysen

Alle Sensitivitäten werden mit Punktwert und Intervall in einer Tabelle
berichtet. E1-Sensitivitäten: Anteil mit Clopper-Pearson; E2-Sensitivitäten:
P̂ mit Spanne nach dem jeweils angegebenen Verfahren. Für Zielgrößen-Varianten
(S1, S2, S14) wird E2 mit dem Modell gerechnet, das sich aus 5.3 für die
Primärzielgröße ergibt (gleicher Schätzer, keine eigene Umschaltung), auf dem
jeweils angegebenen Fenster. Alle Sensitivitäten sind vorab festgelegt; keine
ist primär.

| Nr. | Variation | Referenz | Fenster E1 / E2 | betrifft |
|---|---|---|---|---|
| S1 | Zielgröße DJF-Mittel (Dez.–Feb.), DWD-Monatswerte, gewichtet | Winter Dez. 2009–Feb. 2010 | 1882–2026 / 1971–2026 | E1, E2 |
| S2 | Zielgröße Okt.–Mär.-Mittel, gewichtet wie im Gasspeicher-Check | Winterhalbjahr 2009/10 | 1882–2026 / 1971–2026 | E1, E2 |
| S3 | **entfallen** (v0.2, R5): Gradtagzahl G20/15 Jan.–Mär.; Grund 3.2 | – | – | – |
| S4 | **entfallen** (v0.2, R5): kälteste 14-Tage-Phase; Grund 3.2 | – | – | – |
| S5 | **entfallen** (v0.2, R5): kälteste 30-Tage-Phase; Grund 3.2 | – | – | – |
| S6 | Trendfenster 1881–2026 (linear) | JFM 2010 | – / 1881–2026 | E2 |
| S7 | Trendfenster 1961–2026 (linear) | JFM 2010 | – / 1961–2026 | E2 |
| S8 | LOESS-Trend 1881–2026 (Grad 2, span = 0,5, Gauß), Trendniveau = angepasster Wert 2026 (keine Extrapolation), Streuung = Residual-SD 1971–2026 der LOESS-Residuen, Normal-prädiktiv; Spanne per Residuen-Bootstrap (B = 10 000, Neuanpassung LOESS) | JFM 2010 | – / 1881–2026 | E2 |
| S9 | Ohne Trend: Klima der letzten 30 Jahre 1997–2026 als stationär; t-prädiktiv aus Mittel und SD (± t·SD·√(1+1/30)) und empirischer Anteil | JFM 2010 | – / 1997–2026 | E2 |
| S10 | Alle in 5.3 nicht gewählten Schätzer (M1, M1-AR, M1-Boot, M1-Block-Boot) | JFM 2010 | – / 1971–2026 | E2 |
| S11 | **entfallen** (v0.2, R5): Extremwertansatz GEV auf Tagesdaten-Blockminima; Grund 3.2 | – | – | – |
| S12 | M1 ohne das Jahr 2010 im Trendfenster | JFM 2010 | – / 1971–2026 ohne 2010 | E2 |
| S13 | Trendniveau 2026 statt 2027 (ŷ₂₀₂₆, Hebelwert 2026) | JFM 2010 | – / 1971–2026 | E2 |
| S14 | **neu (v0.2, R12):** INES-Kombinationszeitraum. Zielgröße U_t = gewichtetes Mittel Nov. (t−1) bis Mär. (t); Definition 2.5 | Nov.–Dez. 2010 + Jan.–Mär. 2010 (T_ref^S14) | 1882–2026 (zusätzlich ohne 2010, 2011) / 1971–2026 | E1, E2 |

- **Kein Wechsel des Primärergebnisses** nach Sichtung der Resultate. Die
  Überschrift und der Teaser nennen ausschließlich E1 und E2 in der
  Primärspezifikation (nach Anwendung der Regeln in 5.3). S14 wird im Text als
  „Rechnung mit dem INES-Zeitraum November bis März“ eingeordnet, nicht als
  Hauptergebnis, auch wenn S14 der INES-Szenariodefinition näher kommt.
- **Spannbreiten-Aussage (vorab festgelegt):** Der Bericht nennt zusätzlich das
  Minimum und Maximum von P̂ über alle durchgeführten E2-Sensitivitäten
  (S1, S2, S6–S10, S12–S14; „je nach Rechenweg zwischen … und …“), damit die
  Modellabhängigkeit sichtbar ist.
- Entfallene Sensitivitäten (S3, S4, S5, S11) werden in der Tabelle als
  „entfallen per SAP v0.2, Grund: keine geeigneten Tagesdaten ohne
  unverhältnismäßigen Aufwand (3.2)“ geführt, nicht weggelassen.

## 7. Umgang mit Mehrfachtestung / Multiplizität

- Es gibt **zwei** vorab festgelegte Primärgrößen: k₁/h₁ (E1) und P̂₂₀₂₇ mit
  Spanne (E2), beide für JFM. Alles andere ist beschreibend oder Sensitivität,
  einschließlich S14.
- Es wird kein Fenster, keine Zielgröße (auch nicht JFM gegen Nov.–Mär. aus
  S14), kein Trendmodell und kein Schätzer nachträglich nach der Höhe des
  Ergebnisses ausgewählt. Die einzige ergebnisabhängige Wahl ist die
  deterministische Regel in 5.3, und die hängt nur an Diagnostik-p-Werten.
- Der Wegfall von S3, S4, S5 und S11 und die Aufnahme von S14 wurden vor jedem
  Datenzugriff entschieden (v0.2) und hängen nicht an Ergebnissen.
- Alle Teilzeiträume in E1 und alle Zeilen der Sensitivitätstabelle werden
  vollständig berichtet, auch wenn sie dem Primärergebnis widersprechen.
- Keine Formulierung, die eine einzelne Sensitivität als „eigentliches“
  Ergebnis herausstellt.
- Keine Alpha-Adjustierung nötig, weil keine konfirmatorischen Tests berichtet
  werden.

## 8. Interpretationsrahmen / Confounder

- **Produktions- vs. Konsum-Perspektive:** nicht einschlägig (keine
  Emissionsanalyse).
- **Keine implizite Politik-/Verhaltensbewertung:** Das Ergebnis bewertet
  weder INES noch Bundesregierung noch Bundesnetzagentur. INES vertritt
  Speicherbetreiber; das wird sachlich als Kontext genannt (wie im
  Gasspeicher-Check 8.6), ohne Motivzuschreibung. Ein Kälteszenario in einer
  Risikorechnung ist methodisch üblich, unabhängig davon, wie wahrscheinlich es
  ist; der Bericht sagt das ausdrücklich, damit eine niedrige oder hohe
  Wahrscheinlichkeit nicht als Urteil über die Szenariowahl gelesen wird.
  Ebenso wird der Kombinationscharakter des INES-Zeitraums (S14, 2.5) sachlich
  beschrieben, nicht als Kritik.
- **Transitivitätsannahme:** nicht einschlägig (kein indirekter Vergleich).
- **Regression zur Mitte / Auswahleffekt:** Das Referenzjahr wurde wegen seiner
  Kälte ausgewählt. Seine Lage in der eigenen Reihe (Rang, Residuum) ist
  deshalb keine unabhängige Bestätigung „wie außergewöhnlich“, sondern eine
  Beschreibung. Formulierung im Bericht entsprechend.

### 8.1 Grundrate, keine Vorhersage
P̂₂₀₂₇ ist die Wahrscheinlichkeit eines solchen Spätwinters unter dem
statistischen Klimazustand 2027, ohne Kenntnis der aktuellen Wetterlage,
ENSO-Phase, Polarwirbel o. ä. Der Bericht verwendet die Formulierung
„klimatologische Wahrscheinlichkeit“ bzw. „Grundrate“, nicht „Prognose“ oder
„Vorhersage für diesen Winter“. Saisonvorhersagen werden weder gerechnet noch
zitiert. Für S14 gilt zusätzlich: Ein Teil des Zeitraums November 2026–März
2027 ist zum Veröffentlichungszeitpunkt bereits beobachtet; diese Beobachtungen
fließen bewusst nicht ein (R6). Der Bericht sagt das ausdrücklich.

### 8.2 Temperatur ist nicht Gasbedarf
Der Gasbedarf hängt auch an Wind, Sonne, Gasverstromung, Preisen, Importen und
Speicherstrategie. Aus P̂₂₀₂₇ folgt keine Wahrscheinlichkeit einer
Versorgungslücke. Ausgeschlossene Formulierungen: „Mit X % droht eine
Gaslücke“, „die Versorgung ist zu X % sicher“. Zulässig: „Ein Spätwinter
mindestens so kalt wie 2010 ist unter heutigen Klimabedingungen mit etwa X %
pro Jahr zu erwarten; für diesen Fall rechnet INES mit Lücken.“

### 8.3 Deutschland ist nicht Europa
INES nutzt laut Dokumentation das „EU-Wetterjahr 2010“ (3.3). Ein kalter
Spätwinter in Deutschland fällt nicht zwangsläufig mit Kälte in ganz Europa
zusammen und umgekehrt. Die Analyse misst nur die deutsche Komponente.

### 8.4 Trendmodell ist eine Annahme
Ein linearer Trend mit konstanter Streuung ist eine Vereinfachung. Ob sich die
Häufigkeit kalter Extreme anders entwickelt als das Mittel, wird nicht modelliert;
Hinweise darauf liefern nur die Varianzdiagnostik (5.2) und S8, S9. Der
Extremwertansatz S11 entfällt (3.2).

## 9. Limitationen

- Monatsmittel glätten kurze Kältewellen, die für Gasspitzenlast entscheidend
  sind. Tagesdaten-Sensitivitäten (Gradtage, Kältephasen, Extremwertansatz;
  S3–S5, S11) entfallen mangels täglichem DWD-Gebietsmittel und wegen des
  Aufwands und kürzeren Beginns (1951) der HYRAS-Raster (3.2). Kurze Kältewellen
  werden daher nicht abgebildet.
- Die DWD-Gebietsmittel vor 1951 beruhen auf weniger Stationen; die
  Unsicherheit früher Werte ist größer, wird aber nicht modelliert.
- E2 hat mit n = 56 eine begrenzte Grundlage für Aussagen über die linke Flanke
  der Verteilung; die Spanne ist deshalb Teil der Kernaussage.
- Ein einzelnes Referenzjahr ist eine Punktdefinition von „Kälte“; die Wahl
  stammt von INES und wird nicht optimiert.
- Das INES-Szenario kombiniert November–Dezember 2010 mit Januar–März 2010
  (3.3). Die Primärgröße (JFM) bildet nur den zweiten Teil ab; S14 bildet die
  Kombination ab, vergleicht sie aber mit zusammenhängenden historischen
  Zeiträumen. Beides ist eine Näherung an ein Szenario, das so nie als ein
  Winter aufgetreten ist.
- Die Analyse sagt nichts zu den Monaten Oktober–Dezember 2026 und nichts
  darüber, wie der Winter 2026/27 bisher verlaufen ist (Datenschnitt März
  2026), auch nicht in S14.
- Die INES-Primärquelle wurde von der Top-Level-Session gesichert und in 3.3
  eingetragen; der sap-autor hat die Dokumente nicht selbst gelesen. Die
  INES-Einordnung in 3.3 ist als „nicht vom sap-autor geprüft“ gekennzeichnet.

## 10. Software

- R (Version im Skriptkopf und in `run_log.txt`), Pakete: stats (lm, loess,
  shapiro.test, Box.test, acf), nlme (gls mit corAR1, M1-AR), binom oder
  stats::binom.test (Clopper-Pearson), lmtest (Durbin-Watson, Breusch-Pagan),
  MASS (mvrnorm für Parameterziehungen), boot oder eigene Schleife für die
  Bootstraps (Moving-Block-Bootstrap über tseries::tsbootstrap oder eigene,
  dokumentierte Funktion), ggplot2. extRemes, terra und ncdf4 entfallen
  (S11 und Tagesdaten entfallen, v0.2). Paketversionen per sessionInfo() in
  `output/session_info.txt`.
- Skript: `Analysen/2026-11-kaeltewinter-2010/kaeltewinter-2010.R`.
- Fester Seed 20261123 für alle Simulationen und Bootstraps, einmal am
  Skriptanfang gesetzt; Reihenfolge der Zufallsziehungen im Skript dokumentiert.
- Kein Netzzugriff aus dem Skript; eingelesen werden nur die abgelegten
  Rohdateien. Das Skript filtert vor jeder Ausgabe auf Monate bis März 2026
  (2.4 b).
- Der analyst schreibt ausschließlich in `Analysen/2026-11-kaeltewinter-2010/`.

## 11. Reporting

- **Grafik 1 (Hauptgrafik):** Zeitreihe JFM-Mittel 1881–2026, Trendgerade M1
  (1971–2026) mit Verlängerung bis 2027, waagerechte Linie bei T_ref, Jahre mit
  T_y ≤ T_ref hervorgehoben.
- **Grafik 2:** prädiktive Verteilung für 2027 (Primärschätzer) mit
  schattierter Fläche ≤ T_ref; Beschriftung „klimatologische Wahrscheinlichkeit,
  keine Wettervorhersage“.
- Keine Grafik enthält Monatswerte ab Oktober 2026 oder einen Wert für den
  Zeitraum November 2026–März 2027 (R6).
- **Tabelle 1:** E1 gesamt und je Teilzeitraum (k, n, Anteil, Clopper-Pearson).
- **Tabelle 2:** E2 primär und alle Sensitivitäten S1–S14 (P̂, Spanne,
  Wiederkehrzeit, Verfahren; für S1, S2 und S14 zusätzlich E1 mit k, n, Anteil,
  Clopper-Pearson; für S14 zusätzlich E1 ohne 2010/2011; für S3, S4, S5, S11
  „entfallen per SAP v0.2, Grund“).
- **Tabelle 3 (Anhang):** Diagnostik (Ljung-Box, Shapiro-Wilk, Schiefe,
  Breusch-Pagan, Residual-SD je Hälfte, auffällige Cook's-Distance-Jahre) und
  angewendete Regel aus 5.3.
- **Rundung:** Temperaturen 0,1 °C (Rechnung ungerundet, Vergleich auf 0,01 °C
  nach 2.0 bzw. 2.5); Wahrscheinlichkeiten in Prozent ohne Nachkommastelle,
  unter 1 % mit einer signifikanten Stelle (z. B. „0,4 %“); Wiederkehrzeiten
  auf ganze Jahre, ab 20 Jahren auf 5 Jahre gerundet.
- **Pflichtformulierungen im Bericht:** Grundrate statt Prognose (8.1, für S14
  einschließlich des Hinweises auf nicht verwendete Beobachtungen ab November
  2026); Temperatur ≠ Gasbedarf (8.2); Deutschland ≠ EU-Wetterjahr (8.3);
  Quelle der INES-Aussage als Primärquelle mit Fundstelle (3.3); Hinweis, dass
  das INES-Szenario Nov.–Dez. 2010 mit Jan.–Mär. 2010 kombiniert (2.5, 9).
- **Kernaussagen erst nach Validierung formulieren.**
- **Veröffentlichung:** volles Evidenzcheck-Format (R10, 14.1).
  Substack-Artikel (Skill `blog-artikel`, ≤ 800 Wörter, 1–2 Grafiken), danach
  Kanalposts über `kommunikation`/`distribution` nach ausdrücklichem OK. Kein
  LinkedIn (eingestellt seit 16.10.2026). Gate: Validierungsbericht ohne Befund
  „kritisch“.
- **Registereintrag #1:** Nach Prüfung durch die Top-Level-Session ist keine
  Sperre oder Kommunikationsregel berührt (2.4 b, R7; Bestätigung durch Daniel
  Saure beim Einfrieren). Der Bericht erwähnt Eintrag #1 nicht wertend und nennt
  keine seiner Vorhersagewerte.

## 12. Validierungsplan (für den validator-Subagenten)

Der validator prüft unabhängig gegen den eingefrorenen SAP und legt den Bericht
als Datei im Analyseordner ab (`Validierungsbericht_kaeltewinter-2010.md`);
Nachprüfungen nach Auflagen als eigene Datei bzw. Nachtrag (CLAUDE.md).

1. **SAP-Status:** Rechnung hat erst nach dem Einfrieren begonnen
   (Commit-Zeitstempel SAP final < erster Commit von Skript/Output).
2. **INES-Definition:** Eintrag in 3.3 vor dem Einfrieren vorhanden, mit
   Fundstelle; Dateien unter `quellen/` vorhanden; Primärdefinition (JFM) und
   S14 passen dazu.
3. **Rohdaten:** Prüfsummen in `run_log.txt` stimmen mit den abgelegten Dateien
   überein; Downloaddatum bis 31.12.2026 (2.4 b, R6) oder abweichender Termin
   mit dokumentierter Entscheidung Daniel Saure.
4. **Datenschnitt:** Kein Wert ab Oktober 2026 in irgendeiner Ausgabe-, Log-
   oder Grafikdatei; Filter im Skript vor der ersten Ausgabe; insbesondere kein
   berechneter Wert U_2027 und keine Monatswerte Okt./Nov. 2026 (S14, R6).
5. **Unabhängige Nachrechnung** von T_ref, k₁, h₁ mit Clopper-Pearson, der
   M1-Koeffizienten, σ̂, h₂₀₂₇ und P̂₂₀₂₇ (eigene Implementierung, nicht durch
   erneutes Ausführen des analyst-Skripts allein).
6. **Unabhängige Nachrechnung S14:** T_ref^S14 mit Gewichten 30/31/31/28/31
   und den richtigen Jahren (Nov./Dez. 2010, Jan.–Mär. 2010); U_t mit
   November/Dezember des Vorjahres; Schaltjahresgewicht; E1 mit n = 145 und
   n = 143; E2 mit Fenster 1971–2026 und dem Schätzer der Primärgröße.
7. **Diagnostik und Umschaltregel:** Ljung-Box und Shapiro-Wilk nachgerechnet;
   angewendeter Primärschätzer entspricht der Tabelle in 5.3.
8. **Simulationen:** Seed gesetzt, B wie festgelegt; Mittelwert der P*_b nahe
   P̂₂₀₂₇ (5.4); Intervalle stabil bei zweitem Lauf mit anderem Seed
   (Abweichung der Grenzen ≤ 1 Prozentpunkt, sonst Hinweis).
9. **Vollständigkeit:** Alle Sensitivitäten S1, S2, S6–S10, S12–S14 berichtet;
   S3, S4, S5, S11 als „entfallen per SAP v0.2“ mit Grund geführt und
   tatsächlich nicht gerechnet (keine Tagesdaten im Analyseordner); alle
   E1-Teilzeiträume berichtet.
10. **Integritäts-Checks** 3.5 durchgeführt und dokumentiert, inklusive Abgleich
    mit dem Gasspeicher-Ordner.
11. **Trennung vom Prognose-Register:** `git diff` bzw. `git log` zeigt keine
    Änderung durch diese Analyse in `Prognose-Register/` und
    `Analysen/2026-10-prognose-register-2027/`; Bericht nennt keine Werte aus
    Eintrag #1. Der validator prüft, ob die Bestätigung von R7 durch Daniel
    Saure beim Einfrieren dokumentiert ist; fehlt sie, liest er die Abschnitte
    „Auswertung“ und „Offenlegung“ von
    `Prognose-Register/01_gasspeicher-winter-2026-27.md` (nicht „Vorhersagen“)
    und hält fest, ob diese Analyse eine Sperre oder Kommunikationsregel
    berührt.
12. **Formulierungen:** Pflichtformulierungen (11) vorhanden; ausgeschlossene
    Formulierungen (8.2) nicht vorhanden; keine Gasbilanzaussage; S14 nicht als
    Hauptergebnis dargestellt.
13. **Abweichungen:** Jede Abweichung vom SAP ist als „Post-hoc“ gekennzeichnet
    und begründet; Befundklassen „kritisch / wesentlich / gering“.

## 13. Benötigte Rohdateien (Download durch Daniel Saure, bis 31.12.2026)

1. DWD CDC `regional_averages_DE/monthly/air_temperature_mean/`: Dateien der
   Monate 01, 02, 03, 10, 11, 12 (11 und 12 werden für S1, S2 und S14
   gebraucht).
2. DWD CDC `regional_averages_DE/seasonal/air_temperature_mean/regional_averages_tm_winter.txt`.
3. ~~Tägliches Gebietsmittel bzw. HYRAS-DE-Tagesmittel~~ – **entfällt** (v0.2,
   R5, 3.2). Keine Tagesdaten herunterladen.
4. INES-Primärquelle: bereits gesichert durch die Top-Level-Session
   (`quellen/INES_PM_2026-11-10.html`,
   `quellen/INES_Dokumentation_November-Update_2026.pdf`, 3.3); liegt damit
   **vor** den Temperaturdaten vor.
5. Optional: OWID-Datensatz zu monatlichen Temperaturen je Land (3.4, R9).

Alle Dateien unverändert im Analyseordner ablegen (`rohdaten/`, `quellen/`),
Zugriffsdatum und SHA-256 in `run_log.txt`. Downloadzeitraum: bis 31.12.2026
(R6).

## 14. Rückfragen an Daniel Saure

Stand v0.2: Die Rückfragen 1–10 und 12 sind beantwortet bzw. erledigt (14.1,
14.2). Offen sind nur noch die Punkte in 14.3.

1. **Primäre Zielgröße.** **[Beantwortet, 14.1: (a′) wie empfohlen.]**
   Optionen: (a) DJF-Mittel, (a′) Jan.–Mär.-Mittel,
   (a″) Okt.–Mär.-Mittel, (b) Gradtagzahl Jan.–Mär. bzw. Okt.–Mär.,
   (c) kälteste 14- oder 30-Tage-Phase.
   **Empfehlung: (a′) Jan.–Mär.-Mittel, DWD-Monatsgebietsmittel** (Begründung
   2.0: deckt genau die INES-Lückenmonate ab, ist in beiden Lesarten von „2010“
   enthalten, lange Reihe ab 1881, keine Abhängigkeit von Tagesdaten). DJF,
   Okt.–Mär., Gradtage und Kältephasen als S1–S5.
2. **Referenz.** **[Beantwortet, 14.1; geändert durch R12, 14.2: Referenz
   Januar–März 2010 bleibt primär; zusätzlich Sensitivität S14
   „Nov.–Dez. 2010 + Jan.–Mär. 2010“, 2.5.]**
   Empfehlung: Januar–März 2010 (bzw. in S1/S2/S4/S5 der Winter
   2009/10). Nicht empfohlen: Winter 2010/11 oder das Kalenderjahr 2010
   insgesamt, weil die INES-Lücken Januar–März 2027 betreffen. Falls die
   INES-Definition (3.3) ausdrücklich Oktober–Dezember 2010 für Oktober–Dezember
   2026 einsetzt: Soll zusätzlich eine Sensitivität „Okt.–Dez. 2010“
   aufgenommen werden? Empfehlung: nein, weil diese Monate bereits vorbei bzw.
   beobachtet sind und hier nicht gesichtet werden sollen (2.4 b).
3. **Trendfenster E2.** **[Beantwortet, 14.1: wie empfohlen.]**
   Empfehlung: 1971–2026 linear (konsistent mit
   Sommer-2026-Check und Register V1); 1881–2026, 1961–2026, LOESS und
   „letzte 30 Jahre ohne Trend“ als S6–S9. Einverstanden?
4. **Umschaltregeln in 5.3.** **[Beantwortet, 14.1: wie formuliert.]**
   Empfehlung: wie formuliert (deterministische
   Umschaltung nach Ljung-Box und Shapiro-Wilk). Alternative: M1 immer primär,
   alle anderen Schätzer nur als Sensitivität. Die Alternative ist einfacher zu
   kommunizieren, ignoriert aber eine mögliche Schiefe der linken Flanke.
5. **Tagesdaten (Vorbedingung vor dem Einfrieren).** **[Beantwortet, 14.2:
   S3–S5 und S11 entfallen; 3.2.]**
   Bitte prüfen (nur
   Dateiname und Kopfzeile, keine Werte), ob im DWD-CDC ein tägliches
   Gebietsmittel Deutschland existiert, sonst ob HYRAS-DE-Tagesraster
   handhabbar sind. Empfehlung: Wenn keines von beiden ohne großen Aufwand geht,
   S3–S5 und S11 entfallen lassen statt Stationen auszuwählen.
6. **Downloadzeitpunkt.** **[Beantwortet, 14.1: Download bis 31.12.2026;
   Okt./Nov. 2026 werden nicht ausgewertet und nicht angezeigt.]**
   Empfehlung: Rohdaten bis 31.12.2026 herunterladen
   (vor dem Datenschnitt des Prognose-Registers und bevor Januar-2027-Werte in
   den Dateien stehen). Falls das nicht klappt: erst nach dem
   Registrierungs-Commit V1/V2/V4 (spätestens 31.01.2027). Einverstanden? Und
   bestätigen Sie, dass die bereits erschienenen Monatswerte Oktober/November
   2026 bewusst nicht ausgewertet und nicht angezeigt werden sollen?
7. **Registereintrag #1.** **[Geprüft durch Top-Level-Session, 14.2: keine
   Sperre berührt; in 2.4 b eingetragen. Bestätigung durch Daniel Saure beim
   Einfrieren offen, 14.3.]**
   Die Datei `Prognose-Register/01_gasspeicher-winter-2026-27.md`
   wurde bewusst nicht gelesen. Enthält sie Sperren oder Kommunikationsregeln
   bis zur Auswertung (z. B. keine öffentliche Kommentierung des Zielwinters,
   keine thematisch verwandte Veröffentlichung vor dem Stichtag)? Empfehlung:
   vor dem Einfrieren durch Sie oder eine Top-Level-Prüfung klären, nur die
   Sperr-/Regelabschnitte lesen, und das Ergebnis hier in 2.4 b eintragen. Falls
   eine Sperre berührt ist, entscheiden Sie, ob die Veröffentlichung bis zur
   Auswertung von #1 wartet.
8. **INES-Primärquelle.** **[Erledigt, 14.2 und 3.3.]**
   Wer sichert sie, und bis wann? Empfehlung: Sie suchen
   die Pressemitteilung bzw. das Szenario-Dokument (INES-Website) und legen es
   unter `quellen/` ab; der Wortlaut wird vor dem Einfrieren in 3.3
   eingetragen. Ohne Primärquelle wird mit Kennzeichnung „Sekundärberichte“
   weitergearbeitet (3.3).
9. **OWID-Plausibilisierung.** **[Beantwortet, 14.1: aufnehmen, falls
   vorhanden.]**
   Empfehlung: aufnehmen, falls der
   Länder-Monatsdatensatz existiert (geringer Aufwand, nur Rang- und
   Korrelationsvergleich, keine Verrechnung). Einverstanden?
10. **Format und Umfang.** **[Beantwortet, 14.1: volles Format; da R5 negativ,
    ohne Tagesdaten-Sensitivitäten.]**
    Volles Evidenzcheck-Format wie hier beschrieben oder
    verkürzter „Schnellcheck“ (dann Empfehlung: S3–S5, S11 streichen, Rest
    behalten)? Empfehlung: volles Format ohne Tagesdaten-Sensitivitäten, falls
    Rückfrage 5 negativ ausgeht; Aktualität spricht für eine Veröffentlichung
    noch im Winter.
11. **Einfrieren.** **[Offen, 14.3.]**
    Erst nach Klärung von 1–10 und nachdem Sie den
    vollständigen aktuellen Text gelesen und ausdrücklich bestätigt haben;
    dann Status `final`, Versionsnummer und Datum durch Sie bzw. auf Ihr
    ausdrückliches Wort hin.
12. **INES-Kombinationszeitraum (gestellt in 14.2).** **[Beantwortet, 14.2:
    ja, als Sensitivität S14; Primärziel JFM bleibt; 2.5.]**

### 14.1 Antworten Daniel Saure (23.11.2026, Chat)

Wortlaut: „Ja, wie empfohlen“ auf die Frage, ob er die Empfehlungen zu den
Rückfragen 1–4, 6, 9 und 10 übernimmt. Damit gilt:

- R1: primäre Zielgröße (a′) Jan.–Mär.-Mittel, DWD-Monatsgebietsmittel.
- R2: Referenz Januar–März 2010; keine Sensitivität „Okt.–Dez. 2010“.
- R3: Trendfenster E2 1971–2026 linear; S6–S9 wie beschrieben.
- R4: Umschaltregeln wie in 5.3 formuliert.
- R6: Download der Rohdaten bis 31.12.2026; Monatswerte Oktober/November
  2026 werden nicht ausgewertet und nicht angezeigt.
- R9: OWID-Plausibilisierung aufnehmen, falls der Datensatz existiert.
- R10: volles Format (Tagesdaten-Sensitivitäten nur, falls R5 positiv).

Noch offen vor dem Einfrieren: R5 (Tagesdaten), R7 (Registereintrag #1),
R8 (INES-Primärquelle), R11 (Volltextlektüre und ausdrückliche Bestätigung).
Diese Antworten sind **keine** Freigabe des SAP; Status bleibt `draft`.

### 14.2 Klärungen der Top-Level-Session (23.11.2026)

- **R8 (INES-Primärquelle): erledigt.** Pressemitteilung und Dokumentation
  gesichert, Wortlaut in 3.3 eingetragen. Neu daraus: INES nutzt das
  Kalenderjahr 2010, also auch November–Dezember 2010 (siehe 3.3,
  Einordnung). **Neue Rückfrage R12 an Daniel Saure:** Soll eine
  Sensitivität „Nov.–Dez. 2010 + Jan.–Mär. 2010 gegen jeden historischen
  Zeitraum Nov.–Mär.“ aufgenommen werden? Empfehlung der Top-Level-Session: ja,
  als Sensitivität (Primärziel JFM bleibt), weil sonst die von INES
  hervorgehobene Dezember-Kälte fehlt. Das ändert die Antwort zu R2, die vor
  Kenntnis der INES-Definition gegeben wurde.
- **R5 (Tagesdaten): geprüft, nur Verzeichnis- und Dateinamen.** Im DWD-CDC
  gibt es unter `regional_averages_DE/` nur `annual/`, `monthly/`,
  `seasonal/`, kein tägliches Gebietsmittel. HYRAS-DE-Tagesraster
  (`grids_germany/daily/hyras_de/air_temperature_mean/`) liegen als
  `tas_hyras_1_<Jahr>_v6-*_de.nc` für 1951–2026 vor, rund 60 MB je Jahr
  (mehrere GB gesamt). Empfehlung der Top-Level-Session: nach Rückfrage 5
  S3–S5 und S11 entfallen lassen (Aufwand, und HYRAS beginnt erst 1951).
  Entscheidung Daniel Saure offen.
- **R7 (Registereintrag #1): geprüft, nur Abschnitte „Auswertung“ und
  „Offenlegung“** von `Prognose-Register/01_gasspeicher-winter-2026-27.md`
  gelesen, „Vorhersagen“ bewusst nicht. Dort stehen keine Sperren und keine
  Kommunikationsverbote; Auswertung nach Eurostat-Daten (Mai/Juni 2027),
  Veröffentlichung unabhängig vom Ergebnis; „Nicht vorhergesagt werden:
  Versorgungssicherheit, Preise, kurze Kältewellen.“ Ergebnis: keine Sperre
  berührt. Bitte in 2.4 b durch Daniel Saure bestätigen.
- **Antwort Daniel Saure (23.11.2026, Chat):** „Ja, beide“ auf die Frage, ob
  er beide Empfehlungen übernimmt: (1) R12: Sensitivität für den
  INES-Kombinationszeitraum Nov.–Dez. 2010 + Jan.–Mär. 2010 gegen jeden
  historischen Zeitraum Nov.–Mär. aufnehmen, Primärziel JFM bleibt; R2 ist
  damit entsprechend geändert. (2) R5: Tagesdaten-Sensitivitäten S3–S5 und
  S11 entfallen. Einarbeitung in die betroffenen Abschnitte folgt als v0.2.

### 14.3 Offene Punkte nach v0.2

1. **Volltextlektüre und ausdrückliche Bestätigung (R11):** Daniel Saure liest
   den vollständigen aktuellen Text von v0.2 (einschließlich der vom sap-autor
   ergänzten S14-Präzisierungen in 2.5, siehe Versionshistorie) und bestätigt
   ihn ausdrücklich. Erst danach Status `final`, Versionsnummer, Datum und
   Freigabefeld.
2. **Bestätigung R7:** Daniel Saure bestätigt beim Einfrieren das Ergebnis der
   Top-Level-Prüfung in 2.4 b (keine Sperre aus Registereintrag #1 berührt).
