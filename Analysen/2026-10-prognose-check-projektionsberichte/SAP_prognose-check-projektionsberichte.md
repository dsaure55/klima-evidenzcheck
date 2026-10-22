# Statistischer Analyseplan (SAP) – Prognose-Check #1

**Titel:** Wie treffsicher waren die Projektionsberichte der Bundesregierung?
Vergleich der projizierten mit den tatsächlich inventarisierten deutschen
Treibhausgasemissionen (gesamt und je Sektor), Berichte 2015–2023.

**Format:** Klima Kompass · Evidenzcheck, Unterformat "Prognose-Check" (erster Check dieser Art)
**Version:** 0.1 (**draft**, nicht eingefroren)
**Datum:** 22.10.2026
**Autor:in:** Claude (sap-autor-Subagent), Entwurf zur Prüfung durch Daniel Saure
**Freigabe/Einfrieren:** ausstehend. Dieser Entwurf enthält bewusst keinen
Freigabevermerk. Ein Vermerk darf erst eingetragen werden, wenn der Mensch den
vollständigen aktuellen Text gelesen und ausdrücklich bestätigt hat
(CLAUDE.md, Verifikationspflicht).

**Geplanter Ordner:** `Analysen/2026-10-prognose-check-projektionsberichte/`

**Versionshistorie:**
- **v0.1 draft (22.10.2026):** Erstentwurf, präregistriert vor Datenzugriff.

**Hinweis zur Vorlage:** Das Master-Template in `SAP-Vorlage/` konnte in dieser
Session nicht gelesen werden (kein Dateiname auffindbar, kein Verzeichnislisting
verfügbar). Die Gliederung folgt deshalb dem SAP
`Analysen/2026-09-gasspeicher-winter/SAP_gasspeicher-winter-2026.md`, ergänzt um
alle Pflichtabschnitte (Hintergrund, Estimand, Datenquelle, Analysepopulation,
Methoden inkl. Diagnostik-Plan, Sensitivitäten, Mehrfachtestung, Limitationen,
Software, Reporting). Vor dem Einfrieren gegen das Master-Template abgleichen
(Rückfrage 1).

---

## 0. Status dieser Analyse

- **Präregistrierte Analyse.** Für diesen SAP wurden **keine Daten gesichtet**:
  weder die Tabellen oder Datenanhänge der Projektionsberichte noch
  Inventardaten des UBA, noch EEA-, OWID- oder GCP-Zeitreihen. Kein Code
  ausgeführt. Es wurden keine Analyseergebnisse mitgeliefert.
- **Transparenz über Vorwissen:** Allgemein öffentlich bekannt ist, dass
  Deutschland Projektionsberichte im Zweijahresrhythmus an die EU-Kommission
  meldet, dass sie ein "Mit-Maßnahmen-Szenario" (MMS) und ein
  "Mit-weiteren-Maßnahmen-Szenario" (MWMS) enthalten und dass das Jahr 2020 von
  der Corona-Pandemie geprägt war. Konkrete Projektions- oder Inventarwerte
  wurden für diesen SAP nicht nachgeschlagen; die Festlegungen unten sind
  unabhängig von erwarteten Ergebnissen getroffen.
- **Ergebnisoffenheit:** Der Check kann systematische Überschätzung,
  systematische Unterschätzung oder keine erkennbare Richtung zeigen. Jeder
  Ausgang wird veröffentlicht.
- **Inhaltsstufe:** Evidenzcheck (neue Analyse). Es gilt "eine Analyse zur
  Zeit" (Rückfrage 2).

## 1. Hintergrund / Rationale

Die Bundesregierung legt nach EU-Recht (bis 2018: Monitoring-Mechanismus-
Verordnung (EU) 525/2013, Art. 14; ab 2019: Governance-Verordnung (EU)
2018/1999, Art. 18) regelmäßig Projektionen der Treibhausgasemissionen vor.
Seit der KSG-Novelle erscheinen zusätzlich jährliche "Projektionsdaten" des UBA,
die u. a. für die Prüfung der Zielerreichung nach Klimaschutzgesetz verwendet
werden. Diese Projektionen prägen politische Debatten ("Ziel wird erreicht /
verfehlt").

**Mehrwert dieses Checks:** Rückblickend lässt sich prüfen, wie weit die
früheren Projektionen von dem abwichen, was das Treibhausgasinventar heute für
dieselben Jahre ausweist, ob die Abweichungen eine Richtung haben, wie sie mit
dem Prognosehorizont wachsen und ob MMS oder MWMS näher lag. Das gibt eine
empirische Einordnung, wie viel Gewicht aktuellen Projektionen beigemessen
werden kann.

**Wichtige begriffliche Einordnung (gilt für den gesamten SAP und den Bericht):**
Projektionen sind **bedingte Szenarien** ("wenn die Maßnahmen X gelten und die
Rahmenannahmen Y eintreten"), keine unbedingten Vorhersagen. Eine Abweichung
vom Ist-Wert ist deshalb kein "Fehler" im Sinne schlechter Modellierung allein,
sondern vermischt (a) Modellfehler, (b) abweichende Rahmenannahmen
(Wirtschaft, Preise, Bevölkerung, Wetter), (c) später beschlossene oder nicht
umgesetzte Maßnahmen und (d) Schocks (Corona, Energiekrise). Der Begriff
"Prognosefehler" wird im SAP als technischer Name der Kennzahl verwendet; im
Bericht wird primär von "Abweichung der Projektion vom Ist-Wert" gesprochen.

## 2. Fragestellung (Estimands)

### 2.1 Grundgrößen und Notation

- b = Projektionsbericht (Berichtsjahr = Jahr der Meldung an die EU-Kommission)
- s ∈ {MMS, MWMS} = Szenario
- t = Zieljahr (Kalenderjahr, für das der Bericht einen Emissionswert ausweist)
- k = Sektor (k = "gesamt" oder ein Sektor nach Abschnitt 4.4)
- J_b = letztes Jahr, für das Bericht b historische Inventarwerte (keine
  Projektion) verwendet; aus dem Bericht selbst abzulesen und je Bericht in der
  Datentabelle zu dokumentieren
- P(b,s,t,k) = projizierter Wert in Mt CO2-Äquivalent, wie im Bericht bzw. dessen
  amtlichem Datenanhang ausgewiesen
- A(t,k) = Ist-Wert in Mt CO2-Äquivalent aus dem Referenzinventar (Abschnitt 3.2)
- Prognosehorizont h = t − J_b (in Jahren); nur Paare mit h ≥ 1 sind
  auswertbar (echte Projektion, kein historischer Wert)

### 2.2 Fehlermaße (vorab festgelegt)

| Kürzel | Definition | Einheit | Lesart |
|---|---|---|---|
| E | P − A | Mt CO2e | > 0: Projektion lag über dem Ist-Wert (Überschätzung der Emissionen) |
| RE | 100 · (P − A) / A | % | relativer vorzeichenbehafteter Fehler |
| ARE | \|RE\| | % | relativer absoluter Fehler (Treffsicherheit ohne Richtung) |
| MRE | arithm. Mittel von RE über eine vorab definierte Menge von Paaren | % | mittlere Verzerrung (Bias) |
| MdRE | Median von RE | % | robuste Verzerrung |
| MAPE | arithm. Mittel von ARE | % | mittlere Treffsicherheit |
| k/n | Anzahl Paare mit RE > 0 von n Paaren | Anzahl | Richtungskonsistenz (rein deskriptiv, kein Test) |

Vorzeichenkonvention verbindlich: **positiv = Emissionen überschätzt**.

### 2.3 Estimands

**E1 (primär) – Abweichung für das Zieljahr 2020, Gesamtemissionen, MMS.**
RE(b, MMS, 2020, gesamt) für jeden Bericht b mit J_b < 2020, einzeln berichtet
(keine Mittelung als Kernzahl), dazu E und ARE.
Begründung: 2020 ist das einzige Zieljahr, das von allen frühen Berichten
explizit projiziert wurde und für das ein politisches Ziel (−40 % gegenüber
1990) existierte. Die Corona-Prägung von 2020 wird in S3 adressiert.

**E2 (primär) – Systematische Verzerrung und Treffsicherheit über alle
auswertbaren Paare, Gesamtemissionen, MMS.**
MRE, MdRE, MAPE und k/n über alle Paare (b, MMS, t, gesamt) der
Primärpopulation (Abschnitt 4), zusätzlich aufgeschlüsselt nach
Prognosehorizont h (Strukturvariable, Abschnitt 5.3).

**E3 (sekundär) – Szenarienvergleich MMS vs. MWMS.**
Für jedes Paar (b, t, gesamt), für das beide Szenarien vorliegen:
D = ARE(MWMS) − ARE(MMS) (negativ = MWMS lag näher am Ist-Wert) sowie die
Differenz der vorzeichenbehafteten Fehler RE(MWMS) − RE(MMS).
Berichtet: alle Einzelwerte, Median von D, Anzahl Paare mit D < 0 von n.
Interpretationsgrenze siehe 8.2.

**E4 (sekundär) – Sektoren.**
E1 und E2 je Sektor k (Abschnitt 4.4), Szenario MMS; für MWMS nur als
Tabellenanhang.

**E5 (sekundär) – Zerlegung der Abweichung in Startpunkt- und
Verlaufsanteil.** Für jedes Paar der Primärpopulation gilt exakt:
E = [P(b,s,J_b,k) − A(J_b,k)] + [(P(b,s,t,k) − P(b,s,J_b,k)) − (A(t,k) − A(J_b,k))]
- erster Term = **Startpunktabweichung** (Inventarrevision des Ausgangsjahres,
  inkl. GWP-Umstellung; dabei ist P(b,s,J_b,k) der im Bericht ausgewiesene
  historische Wert für J_b)
- zweiter Term = **Verlaufsabweichung** (eigentliche Projektionsleistung)

Beide Anteile werden in Mt CO2e und als Anteil an |E| berichtet. Liegt im
Bericht kein historischer Wert für J_b vor, entfällt E5 für diesen Bericht
(dokumentiert).

**Ausdrücklich nicht Gegenstand:** Ursachenanalyse einzelner Abweichungen
(welche Annahme war "falsch"), Bewertung aktueller Projektionen für 2030 oder
2045, Aussagen über Zielerreichung künftiger Jahre.

## 3. Datenquellen

### 3.1 Projektionen (primär)
- **Projektionsberichte der Bundesregierung** an die EU-Kommission, Berichtsjahre
  2015, 2017, 2019, 2021, 2023 (amtliche PDF-Fassungen, veröffentlicht durch
  UBA/BMUB/BMU/BMWK), jeweils einschließlich amtlicher Daten- bzw.
  Tabellenanhänge, falls vorhanden. Bei Abweichung zwischen PDF-Text und
  Datenanhang hat der **Datenanhang** Vorrang; Abweichungen werden dokumentiert.
- **Für S6:** UBA-"Projektionsdaten" 2024 und 2025 (jährliche Projektionen
  nach KSG).
- **Kreuzprüfung der Übertragung (nicht additiv):** EEA/Reportnet-Datenbank der
  von den Mitgliedstaaten gemeldeten THG-Projektionen. Abweichungen zwischen
  EEA-Datenbank und nationalem Bericht werden berichtet, nicht verrechnet;
  maßgeblich ist der nationale Bericht.

### 3.2 Ist-Werte (primär)
- **UBA-Treibhausgasinventar**, Referenzstand für die Primäranalyse: die
  **neueste vollständige Inventarsubmission, die zum Zeitpunkt des
  Datenzugriffs veröffentlicht ist** (voraussichtlich Submission 2026,
  Inventarjahre bis einschließlich 2024). Die genaue Submission (Bezeichnung,
  Veröffentlichungsdatum, Dateiname) wird beim Datenzugriff im `run_log.txt`
  festgehalten und danach nicht mehr gewechselt, auch wenn während der Analyse
  eine neuere Fassung erscheint.
- Bezugsgröße "gesamt": nationale Gesamtemissionen **ohne LULUCF**, ohne
  internationalen Luft- und Seeverkehr (Memo-Positionen), in der Abgrenzung
  der Zeile "Gesamt ohne LULUCF" der jeweiligen Quelle. Behandlung indirekter
  CO2-Emissionen: wie in der Quelle; wird sie zwischen Bericht und Inventar
  unterschiedlich behandelt, ist das im Datenblatt zu vermerken (relevant für
  E5).
- **Für S2 (Revisionen):** frühere Inventarsubmissionen, konkret jeweils die
  **erste Submission, die das Zieljahr t enthält** ("Erstveröffentlichung").
- **Für S7:** UBA-Vorjahresschätzung für 2025 (Veröffentlichung nach § 5 KSG,
  Frühjahr 2026). Kein Inventarwert, daher nur Sensitivität.

### 3.3 Sekundärquellen (nur Plausibilisierung, siehe CLAUDE.md)
- **Our World in Data** (THG gesamt Deutschland) und **Global Carbon Project**
  (fossiles CO2 Deutschland). Verwendung ausschließlich für einen
  Größenordnungs-Abgleich der Ist-Reihe (Abschnitt 3.5, Punkt 4).
  Diese Quellen gehen in keine Kennzahl ein. Bei Abweichung hat das UBA-Inventar
  Vorrang. Ein Fallback auf OWID kommt nur bei dokumentiertem
  Zugriffsproblem auf das UBA-Inventar in Frage und erfordert eine
  SAP-Änderung (Amendment) vor der Auswertung.

### 3.4 Beschaffung
Wie bei früheren Checks ist der Netzzugang der Cloud-Session zu Behörden-
servern voraussichtlich eingeschränkt. Daher Download durch Daniel; Ablage
**unverändert** unter `rohdaten/` im Analyseordner, Zugriffsdatum und Quelle im
`run_log.txt`. Liste in Abschnitt 13.

### 3.5 Datenextraktion und Integritäts-Checks (vor jeder Auswertung)
1. **Doppelte Extraktion:** Die Projektionswerte werden aus PDF-Tabellen
   (falls kein maschinenlesbarer Anhang vorliegt) in eine Extraktionstabelle
   übertragen, mit Fundstelle (Bericht, Seite, Tabellennummer) je Wert. Der
   Abgleich erfolgt gegen die EEA-Datenbank (3.1) oder, falls dort nicht
   vorhanden, durch eine zweite unabhängige Übertragung. Jede Differenz wird
   vor der Auswertung aufgelöst und dokumentiert.
2. **Summenprüfung:** Summe der Sektorwerte = Gesamtwert ± 1 % je Bericht,
   Szenario und Jahr; Abweichungen werden dokumentiert, nicht korrigiert.
3. **Einheiten und Metrik:** Je Bericht und Inventarsubmission wird festgehalten,
   welche Treibhauspotenziale (GWP, IPCC AR4 oder AR5) verwendet wurden.
4. **Plausibilisierung Ist-Reihe:** Die UBA-Gesamtemissionen 2015–2024 werden
   der OWID-Reihe gegenübergestellt; Abweichungen > 5 % werden im Bericht
   erläutert (Abgrenzungsunterschiede), lösen aber keine Änderung der
   Primärquelle aus.
5. **Bestimmung von J_b:** je Bericht aus dem Bericht selbst (Kapitel zur
   Datengrundlage bzw. letzter als historisch gekennzeichneter Wert). Ist J_b
   nicht eindeutig, Stopp und Rückfrage an Daniel vor der Auswertung.

Bei Unstimmigkeiten, die sich nicht nach den obigen Regeln auflösen lassen:
Analyse stoppen, Rückfrage an Daniel.

## 4. Analysepopulation

### 4.1 Einheit
Ein Auswertungspaar = (Bericht b, Szenario s, Zieljahr t, Sektor k) mit
vorhandenem P und A und h = t − J_b ≥ 1.

### 4.2 Primärpopulation
- **Berichte:** Projektionsberichte 2015, 2017, 2019, 2021, 2023 (EU-Meldungen).
- **Zieljahre:** alle t im Bereich 2015 ≤ t ≤ letztes Inventarjahr des
  Referenzinventars (voraussichtlich 2024), für die der Bericht **explizit**
  einen Jahreswert ausweist. **Keine Interpolation** in der Primäranalyse.
- **Szenario:** MMS (primär), MWMS (für E3 und Anhang).
- **Sektor:** gesamt (primär), Sektoren für E4.
- Kein auswertbares Paar wird ausgeschlossen. Die Corona- und
  Energiekrisenjahre bleiben in der Primäranalyse enthalten (S3, S4).
- Weist ein Bericht kein MWMS aus oder ist MWMS mit MMS identisch, wird das
  dokumentiert; der Bericht fällt dann aus E3 heraus.

### 4.3 Erwartbare Struktur (ohne Kenntnis der Werte)
Projektionsberichte weisen Zieljahre häufig nur in Stützjahren (z. B.
Fünfjahresschritten) aus. Es ist daher möglich, dass die Primärpopulation im
Wesentlichen aus dem Zieljahr 2020 besteht und nur wenige weitere Paare
enthält. Das wird nicht durch nachträgliche Interpolation "aufgefüllt",
sondern offen berichtet; Interpolation ist ausschließlich Sensitivität S5.
Zusammenfassende Kennzahlen (MRE, MdRE, MAPE) werden nur berechnet, wenn eine
Zelle mindestens 3 Paare enthält; sonst werden nur Einzelwerte gezeigt.

### 4.4 Sektorabgrenzung
Primär: **Sektoren nach Klimaschutzgesetz (KSG, Anlage 1)**:
Energiewirtschaft, Industrie, Gebäude, Verkehr, Landwirtschaft, Abfallwirtschaft
und Sonstiges. Für Berichte, die (noch) nicht nach KSG-Sektoren gliedern, wird
vor der Auswertung eine **Zuordnungstabelle** der dort verwendeten
Quellkategorien (CRF/CRT-Kategorien) zu KSG-Sektoren erstellt und im
Analyseordner abgelegt. Ist eine eindeutige Zuordnung für einen Sektor nicht
möglich, entfällt dieser Sektor für den betreffenden Bericht (dokumentiert);
es wird nicht geschätzt. Die Zuordnungstabelle ist Teil der Prüfrunde des
validators.

## 5. Statistische Methoden

### 5.1 Grundsatz: rein deskriptive Analyse (Begründung)
Die Analyse ist **ausschließlich deskriptiv**. Es werden keine
Hypothesentests, p-Werte oder Konfidenzintervalle als Kernaussage berichtet.
Begründung:
1. **Sehr kleine Zahl unabhängiger Einheiten:** fünf Berichte in der
   Primärpopulation; die Zahl der Auswertungspaare ist größer, die Paare sind
   aber nicht unabhängig.
2. **Starke Abhängigkeiten:** Alle Berichte werden am selben Ist-Wert je
   Zieljahr gemessen (ein Schock wie Corona trifft alle Berichte gleichzeitig);
   aufeinanderfolgende Berichte beruhen auf weitgehend gleicher
   Modellinfrastruktur und überlappenden Annahmen; Fehler für benachbarte
   Zieljahre desselben Berichts sind durch den Projektionspfad verkettet.
3. **Keine sinnvolle Grundgesamtheit:** Die Berichte sind die vollständige
   Menge der betrachteten Projektionen, keine Zufallsstichprobe. Eine
   inferenzielle Verallgemeinerung auf "künftige Projektionen" würde
   Stationarität des Projektionsprozesses unterstellen, die nicht gegeben ist
   (Methodenänderungen, neue Maßnahmenlage).
Formulierungen wie "signifikant über-/unterschätzt" sind im Bericht
ausgeschlossen. Zulässig sind Aussagen der Form "In k von n Berichten lag die
MMS-Projektion für 2020 über dem Ist-Wert; die Abweichungen reichten von x bis
y %."

### 5.2 E1 und E2
Berechnung der Kennzahlen nach 2.2 für die in 2.3 definierten Mengen.
Für E1 Einzelwerte je Bericht. Für E2 Mittel- und Medianwerte über alle Paare
der Primärpopulation sowie je Horizontklasse (5.3).

### 5.3 Prognosehorizont als Strukturvariable
h = t − J_b (primär). Horizontklassen: **1–3 Jahre, 4–6 Jahre, ≥ 7 Jahre**.
Berichtet werden MRE, MdRE, MAPE und k/n je Klasse (Mindestzellgröße 3, sonst
Einzelwerte). Zusätzlich grafische Darstellung von RE und ARE gegen h (alle
Paare, Punkte nach Bericht gekennzeichnet). Es wird **keine** Regression von
ARE auf h geschätzt (Abhängigkeitsstruktur, siehe 5.1).
Alternative Horizontdefinition (Berichtsjahr statt J_b) nur in S8.

### 5.4 E3 (Szenarienvergleich)
Gepaarter deskriptiver Vergleich je (b, t) nach 2.3. Keine Mittelung über
Berichte als Kernaussage; Median von D und Anzahl D < 0 nur ergänzend.

### 5.5 E4 (Sektoren)
Wie 5.2 je Sektor. Sektoren werden in fester Reihenfolge (KSG-Anlage 1)
berichtet, nicht nach Größe der Abweichung sortiert.

### 5.6 E5 (Zerlegung)
Berechnung der zwei Terme nach 2.3 für jedes Paar; Darstellung als gestapeltes
Balkendiagramm je Bericht für das Zieljahr 2020 (gesamt, MMS) und als Tabelle
für alle Paare.

### 5.7 Diagnostik-Plan (Autokorrelation, Normalität, Ausreißer)
Da kein inferenzielles Modell geschätzt wird, gibt es keine Modellannahmen, die
formal zu prüfen wären. Formale Tests auf Autokorrelation (z. B. Durbin-Watson,
Ljung-Box) oder Normalität (z. B. Shapiro-Wilk) werden **nicht** durchgeführt
und dienen nicht als Entscheidungsgrundlage: Bei n ≤ ca. 20 abhängigen Paaren
haben sie keine verwertbare Trennschärfe, und ihr Ergebnis würde keine
Methodenentscheidung auslösen. Stattdessen verbindlich:
1. **Abhängigkeitsstruktur offenlegen:** Tabelle, welche Paare dasselbe
   Zieljahr bzw. denselben Bericht teilen; im Bericht ausdrücklicher Hinweis,
   dass die Paare nicht unabhängig sind.
2. **Grafische Prüfung der Verteilung:** Punktdiagramm aller RE-Werte (kein
   Histogramm bei kleiner Fallzahl), um Schiefe oder einzelne dominierende
   Werte sichtbar zu machen. Deshalb wird neben dem Mittel (MRE) stets der
   Median (MdRE) berichtet.
3. **Einflussanalyse (Leave-one-report-out):** Die E2-Kennzahlen werden
   jeweils ohne einen Bericht neu berechnet. Ausdrücklich berichtet wird,
   wenn das Weglassen eines einzelnen Berichts (a) das Vorzeichen von MRE
   oder MdRE umkehrt oder (b) MAPE um mehr als 25 % (relativ) verändert.
   Kein Bericht wird deswegen ausgeschlossen.
4. **Zieljahr-Schocks:** Verlauf von RE je Bericht über t grafisch; ein
   gemeinsamer Ausschlag aller Berichte in einem Zieljahr wird als
   Zieljahr-Effekt (nicht als Berichtsqualität) gekennzeichnet.

### 5.8 Unsicherheit
Es werden keine Konfidenzintervalle berechnet (Begründung 5.1). Die Streuung
wird über Spannweite und Einzelwerte vollständig gezeigt. Falls die Berichte
selbst Unsicherheitsbänder oder Sensitivitätsrechnungen zu ihren Projektionen
ausweisen, wird für E1 zusätzlich deskriptiv berichtet, ob der Ist-Wert
innerhalb dieses Bandes lag (nur wenn im Bericht ausgewiesen, keine eigene
Konstruktion).

## 6. Sensitivitätsanalysen

Primär ist ausschließlich die Spezifikation nach Abschnitt 2–5 mit der
Primärpopulation 4.2. Alle folgenden Varianten sind vorab festgelegt, werden
**vollständig** berichtet und können das Primärergebnis nicht ersetzen.

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | **Basisjahrbereinigte Projektion:** P* = P(b,s,t,k) · A(J_b,k) / P(b,s,J_b,k), d. h. der projizierte Pfad wird auf den heutigen Inventarwert des Ausgangsjahres skaliert (entfernt Niveauverschiebungen durch Inventarrevision und GWP-Umstellung) | E1, E2, E3, E4 |
| S2 | **Inventarrevision:** Ist-Wert aus der Erstveröffentlichung (erste Submission, die t enthält) statt aus dem Referenzinventar | E1, E2 |
| S3a | **Corona:** ohne Zieljahr 2020 | E2, E3, E4 |
| S3b | **Corona inkl. Nachholeffekt:** ohne Zieljahre 2020 und 2021 | E2, E3, E4 |
| S4 | **Energiekrise:** ohne Zieljahr 2022 | E2, E3, E4 |
| S5 | **Interpolation:** zusätzliche Paare durch lineare Interpolation zwischen explizit ausgewiesenen Stützjahren desselben Berichts und Szenarios (keine Extrapolation) | E2, E3 |
| S6 | **Erweiterte Berichtsmenge:** zusätzlich UBA-Projektionsdaten 2024 und 2025 | E2, E3 |
| S7 | **Vorjahresschätzung 2025** als zusätzlicher Ist-Wert (Zieljahr 2025) | E2, E3 |
| S8 | **Alternative Horizontdefinition:** h' = t − Berichtsjahr | E2 (Horizontanalyse) |
| S9 | **Gesamtemissionen mit LULUCF** (nur wenn Bericht und Inventar diese Größe ausweisen) | E1, E2 |

Kombinationen von Sensitivitäten werden nicht gebildet, mit einer Ausnahme:
S1 wird zusätzlich gemeinsam mit S3a berichtet, weil Revisions- und
Corona-Effekt sich im Zieljahr 2020 überlagern können.

Wird eine Sensitivität mangels Daten undurchführbar (z. B. kein historischer
Wert für J_b im Bericht für S1), wird sie als "nicht durchgeführt, Grund: …"
berichtet, nicht stillschweigend weggelassen.

## 7. Umgang mit Mehrfachtestung

Es werden keine Hypothesentests durchgeführt; eine formale Adjustierung
(Bonferroni, Holm, FDR) entfällt daher. Das eigentliche Multiplizitätsrisiko
ist hier die **selektive Berichterstattung** aus einer großen Zahl von Zellen
(Bericht × Szenario × Zieljahr × Sektor × Sensitivität). Gegenmaßnahmen:
1. **Vorab festgelegte Kernzahlen** (die einzigen, die in Überschrift,
   Teaser und Grafik 1 verwendet werden dürfen):
   (a) RE(b, MMS, 2020, gesamt) je Bericht (E1);
   (b) MRE, MdRE, MAPE und k/n über die Primärpopulation, gesamt, MMS (E2).
2. Alle übrigen Werte sind sekundär bzw. beschreibend und werden vollständig
   in Tabellen berichtet, unabhängig davon, ob sie "interessant" ausfallen.
3. Keine nachträgliche Auswahl von Berichten, Zieljahren, Szenarien,
   Sektoren, Horizontklassen oder Sensitivitäten, die eine bestimmte Aussage
   am besten stützen. Einzelne auffällige Sektor- oder Jahreswerte werden im
   Text nur im Kontext der Gesamttabelle genannt.
4. Jede Abweichung vom SAP wird als "Post-hoc" gekennzeichnet.

## 8. Interpretationsrahmen / Confounder

### 8.1 Projektion ist keine Vorhersage
Siehe Abschnitt 1. Eine große Abweichung kann bedeuten, dass sich Annahmen
(Wirtschaftsentwicklung, Energiepreise, Maßnahmen) anders entwickelt haben,
nicht zwingend, dass das Modell schlecht war. Der Bericht formuliert keine
Aussagen über die Qualität der beteiligten Forschungsinstitute.

### 8.2 MMS vs. MWMS
Das MWMS unterstellt zusätzliche, zum Berichtszeitpunkt geplante Maßnahmen. Lag
das MWMS näher am Ist-Wert, kann das heißen, dass diese Maßnahmen tatsächlich
umgesetzt wurden, oder dass andere Faktoren zufällig in dieselbe Richtung
wirkten. E3 ist deshalb **kein** Ranking der Szenarien nach "Güte", sondern
eine Beschreibung, welches Szenario dem tatsächlichen Verlauf näher lag.

### 8.3 Inventarrevisionen und Metrikwechsel
Das Inventar wird jährlich rückwirkend revidiert; zudem wechselte die
Berichterstattung im Zeitverlauf die Treibhauspotenziale (AR4 → AR5). Ältere
Berichte und das heutige Inventar sind daher nicht zwingend auf derselben
Skala. Abbildung über E5 (Zerlegung), S1 und S2; im Bericht prominent erklärt.

### 8.4 Schocks
Corona (2020/21) und Energiekrise (2022) waren in keinem vor 2020
veröffentlichten Bericht absehbar. Abbildung über S3a, S3b, S4.

### 8.5 Neutralität
Der Check bewertet weder die Klimapolitik einzelner Regierungen noch die
Ziele selbst. Abweichungen in beide Richtungen werden gleich behandelt und mit
demselben Wortlaut beschrieben.

## 9. Limitationen

- Sehr kleine Zahl von Berichten; Paare stark voneinander abhängig;
  Kennzahlen sind instabil (Leave-one-report-out, 5.7).
- Wenige explizit ausgewiesene Zieljahre in der Vergangenheit; die Analyse
  kann sich im Kern auf ein einziges Zieljahr (2020) stützen, das zudem von
  einem Sonderereignis geprägt ist.
- Übertragungsfehler aus PDF-Tabellen möglich (Gegenmaßnahme 3.5).
- Sektorabgrenzungen älterer Berichte nur über eine Zuordnungstabelle
  vergleichbar; Restunschärfen möglich.
- Das Referenzinventar wird künftig weiter revidiert; die Ergebnisse gelten
  für den dokumentierten Inventarstand.
- Keine Ursachenzerlegung nach Treibern (Wirtschaft, Preise, Maßnahmen,
  Wetter); E5 trennt nur Startpunkt- und Verlaufsanteil.
- Die Berichte sind keine Zufallsstichprobe; keine Verallgemeinerung auf die
  Treffsicherheit künftiger Projektionen.

## 10. Software

R (Version im Skript-Header dokumentiert), voraussichtliche Pakete: readxl
(bzw. readr), dplyr, tidyr, ggplot2. Skript
`prognose-check-projektionsberichte.R`. Eingelesen werden ausschließlich die
unverändert abgelegten Rohdateien und die dokumentierte Extraktionstabelle
(3.5) sowie die Sektor-Zuordnungstabelle (4.4); kein Netzzugriff aus dem
Skript. Keine Zufallskomponente vorgesehen (daher kein Seed nötig).
Sitzungsinformationen (Paketversionen) werden in `output/` gespeichert.

## 11. Reporting-Plan

- **Grafik 1 (Kerngrafik):** Ist-Emissionen gesamt (Referenzinventar) als
  Linie, darüber die MMS-Projektionspfade aller Berichte der Primärpopulation
  (nur explizit ausgewiesene Punkte, verbunden), Zieljahr 2020 markiert.
- **Grafik 2:** RE gegen Prognosehorizont h, alle Paare (gesamt, MMS und MWMS
  unterschiedlich markiert).
- **Grafik 3:** Zerlegung E5 für das Zieljahr 2020.
- **Tabelle 1:** je Bericht: Berichtsjahr, J_b, ausgewiesene Zieljahre,
  Szenarien, GWP-Basis, Fundstelle.
- **Tabelle 2:** alle Paare mit P, A, E, RE, ARE, h (gesamt; MMS und MWMS).
- **Tabelle 3:** Kernzahlen E1/E2 primär und unter allen Sensitivitäten S1–S9.
- **Tabelle 4:** Sektoren (E4).
- **Anhang:** Extraktionstabelle mit Fundstellen, Sektor-Zuordnungstabelle,
  Abhängigkeitsstruktur (5.7), Leave-one-report-out.
- **Rundung:** Mt CO2e ganzzahlig, relative Fehler auf eine Nachkommastelle,
  Anteile in Prozent ohne Nachkommastelle.
- **Wortwahl:** "Projektion lag x % über/unter dem Ist-Wert"; nicht
  "Fehlprognose", nicht "signifikant".
- Kernaussagen erst nach Validierung (validator) formulieren. Kanalfassungen
  nur über den Klima-Kompass-Ablauf (Substack, Instagram, Facebook, WhatsApp;
  keine LinkedIn-Fassung).

## 12. Rückfragen an Daniel (offen)

1. **Master-Template:** Das Template in `SAP-Vorlage/` war in dieser Session
   nicht auffindbar. Wie heißt die Datei? Der Entwurf sollte vor dem
   Einfrieren dagegen abgeglichen werden.
2. **Eine Analyse zur Zeit:** Läuft aktuell noch ein anderer Evidenzcheck,
   oder kann dieser Prognose-Check nach dem Einfrieren direkt starten?
3. **Berichtsmenge:** Primär die EU-Berichte 2015, 2017, 2019, 2021, 2023,
   UBA-Projektionsdaten 2024/2025 nur als Sensitivität (S6) – einverstanden?
   Soll zusätzlich der Projektionsbericht 2013 einbezogen werden (dann mehr
   Paare für 2020, aber ältere Methodik)?
4. **Primäres Fehlermaß auf welcher Skala?** Der Entwurf folgt der Vorgabe
   "Ist-Werte aus dem aktuellsten Inventar" und rechnet primär mit
   unbereinigten Projektionswerten. Wegen GWP-Umstellung und
   Inventarrevisionen könnte die basisjahrbereinigte Variante (S1) die
   fairere Primärgröße sein. Soll S1 Primäranalyse werden (und die
   unbereinigte Variante Sensitivität)? Bitte vor dem Einfrieren entscheiden;
   nachträglich ist kein Tausch zulässig.
5. **Primärszenario MMS:** Einverstanden, dass MMS primär ist (Abbild der
   zum Berichtszeitpunkt beschlossenen Maßnahmen) und MWMS sekundär (E3)?
6. **Ist-Wert 2025:** Die UBA-Vorjahresschätzung 2025 ist kein Inventarwert und
   deshalb nur Sensitivität (S7). Einverstanden, oder soll 2025 ganz entfallen?
7. **Sektorabgrenzung:** KSG-Sektoren primär (mit Zuordnungstabelle für ältere
   Berichte) – oder lieber die fünf in der Anfrage genannten Sektoren
   (Energie, Industrie, Gebäude, Verkehr, Landwirtschaft) ohne
   Abfall/Sonstiges?
8. **Horizontklassen:** 1–3 / 4–6 / ≥ 7 Jahre – passend, oder andere Grenzen?
9. **Energiekrise 2022 (S4):** Soll dieser Ausschluss als Sensitivität
   bleiben, oder reicht die Corona-Sensitivität?
10. **Format und Umfang:** Gelten für den Prognose-Check dieselben Vorgaben wie
    beim Schnellcheck (2–3 Arbeitstage, eine Prüfrunde, Substack ≤ 800 Wörter,
    1 Grafik), oder ist ein größerer Umfang vorgesehen? Die Extraktion aus
    fünf PDF-Berichten ist aufwendiger als ein einzelner Datensatz-Download.
11. **Einfrieren:** Freigabe erst nach Lesen des vollständigen Textes, im
    Wortlaut analog früherer SAPs ("Volltext gelesen, einfrieren").

## 13. Benötigte Rohdateien (Download durch Daniel)

1. Projektionsberichte 2015, 2017, 2019, 2021, 2023 der Bundesregierung
   (PDF) und – falls vorhanden – die zugehörigen amtlichen Datenanhänge
   (Excel/CSV).
2. Für S6: UBA-Projektionsdaten 2024 und 2025 (Bericht und Datenanhang).
3. UBA-Treibhausgasinventar, neueste Submission (Emissionstabellen gesamt und
   nach KSG-Sektoren bzw. CRT-Kategorien, 1990 bis letztes Inventarjahr).
4. Für S2: die früheren Inventarsubmissionen, die jeweils als erste die
   Zieljahre enthielten (Umfang nach Feststellung der Zieljahre; Liste wird
   nach Schritt 3.5 konkretisiert, ohne die Ist-Werte vorher auszuwerten).
5. Für S7: UBA-Vorjahresschätzung 2025.
6. Für die Übertragungskontrolle: Export der EEA/Reportnet-Projektionsdaten für
   Deutschland (alle verfügbaren Meldejahre).
7. Für die Plausibilisierung: OWID-Datensatz THG-Emissionen Deutschland und
   GCP-Datensatz fossiles CO2 Deutschland.

Alle Rohdateien werden unverändert im Analyseordner abgelegt und mit Quelle und
Zugriffsdatum im `run_log.txt` dokumentiert.
