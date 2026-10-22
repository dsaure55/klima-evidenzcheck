# Statistischer Analyseplan (SAP) – Prognose-Check #1

**Titel:** Wie treffsicher waren die Projektionsberichte der Bundesregierung?
Vergleich der projizierten mit den tatsächlich inventarisierten deutschen
Treibhausgasemissionen (gesamt und je Sektor), Berichte 2015–2023.

**Format:** Klima Kompass · Evidenzcheck (Flaggschiff-Stück), Unterformat
"Prognose-Check" (erster Check dieser Art). Umfang größer als ein
Schnellcheck, ca. eine Woche Bearbeitung (Entscheidung Daniel Saure,
22.10.2026).
**Version:** 1.0 (**final**, eingefroren am 22.10.2026)
**Datum:** 22.10.2026
**Autor:in:** Claude (sap-autor-Subagent), geprüft durch Daniel Saure
**Status: final, eingefroren am 22.10.2026, freigegeben durch Daniel Saure.**
**Freigabe:** Daniel Saure, 22.10.2026 (im Chat: „Volltext gelesen, einfrieren“).
Grundlage der Freigabe ist der Volltext v0.2, der Daniel am 22.10.2026 als
Datei zugeschickt wurde. Einzige Änderung danach und vor dem Einfrieren: In
Abschnitt 12.2 wurde Daniels Antwort „A–D wie empfohlen“ vermerkt; die dort
festgelegten Regeln selbst blieben unverändert. Ab jetzt sind Änderungen nur
als gekennzeichnetes Amendment bzw. als „Post-hoc“ zulässig.

**Geplanter Ordner:** `Analysen/2026-10-prognose-check-projektionsberichte/`

**Versionshistorie:**
- **v0.1 draft (22.10.2026):** Erstentwurf, präregistriert vor Datenzugriff.
- **v0.2 draft (22.10.2026):** Einarbeitung der Antworten von Daniel Saure
  vom 22.10.2026 auf die Rückfragen 1–11 (Wortlaut: "ok nehme deine antworten
  an"). Wesentliche Änderungen: (a) Abgleich mit dem Master-Template
  `SAP-Vorlage/SAP-Template.md`, Abschnitt 5 nach Template-Gliederung
  5.1–5.5 neu geordnet, neuer Abschnitt 5.5 "Signifikanzniveau" (keines, da
  rein deskriptiv), Abschnitt 8 um die festen Template-Prüfpunkte ergänzt;
  (b) **Primärskala getauscht, vor jedem Datenzugriff:** basisjahrbereinigte
  Projektion ist jetzt Primäranalyse, unbereinigte Projektion wird
  Sensitivität S1; (c) Projektionsbericht 2013 ausdrücklich ausgeschlossen;
  (d) Format/Umfang festgelegt; (e) Abschnitt 12 in "Beantwortete Rückfragen"
  umgewandelt. Weiterhin keine Daten gesichtet.
- **v1.0 final (22.10.2026):** Eingefroren nach Freigabe durch Daniel Saure
  („Volltext gelesen, einfrieren“). Rückfragen 12.2 A–D wie empfohlen
  beantwortet. Inhaltlich identisch mit v0.2. Bis zum Einfrieren keine Daten
  gesichtet.

**Hinweis zur Vorlage:** Das Master-Template liegt jetzt als
`SAP-Vorlage/SAP-Template.md` im Repo und wurde für v0.2 gelesen. Der Entwurf
wurde dagegen abgeglichen: Alle Template-Abschnitte 0–11 sind vorhanden und in
derselben Nummerierung belegt (inkl. 5.1 Primäranalyse, 5.2
Modellannahmen-Prüfung, 5.3 Korrektur bei Annahmenverletzung, 5.4
Unsicherheitsquantifizierung, 5.5 Signifikanzniveau sowie der festen
Prüfpunkte in Abschnitt 8). Abschnitte 12 (Rückfragen) und 13 (Rohdateien)
sind projektspezifische Ergänzungen über das Template hinaus. Die
Template-Felder "Zugriffsdatum" und "Datenstand laut Quelle" (Abschnitt 3)
werden erst beim Datenzugriff ausgefüllt und sind bis dahin als Platzhalter
markiert.

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst; Einfrieren steht noch aus)
[ ] Exploratorisch

- **Präregistrierte Analyse.** Für diesen SAP wurden **keine Daten gesichtet**:
  weder die Tabellen oder Datenanhänge der Projektionsberichte noch
  Inventardaten des UBA, noch EEA-, OWID- oder GCP-Zeitreihen. Kein Code
  ausgeführt. Es wurden keine Analyseergebnisse mitgeliefert. Das gilt auch
  für die Überarbeitung zu v0.2, einschließlich des Tauschs der Primärskala.
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
- **Inhaltsstufe:** Evidenzcheck (neue Analyse). Regel "eine Analyse zur
  Zeit": Laut Daniel Saure (22.10.2026) läuft kein anderer Evidenzcheck
  (Rhein-Niedrigwasser am 19.10.2026 abgebrochen). Der Check kann nach dem
  Einfrieren starten.

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

**Warum die basisjahrbereinigte Skala primär ist (Entscheidung 22.10.2026):**
Die Primäranalyse misst die Treffsicherheit des **projizierten Verlaufs**
ab dem Ausgangsjahr des jeweiligen Berichts. Spätere Inventarrevisionen und
Umstellungen der Treibhauspotenziale (GWP), die das Niveau des Ausgangsjahres
rückwirkend verändern, werden dadurch nicht als Prognosefehler gewertet. Die
unbereinigte Gegenüberstellung (Projektion direkt gegen das aktuelle Inventar)
wird vollständig als Sensitivität S1 berichtet.

## 2. Fragestellung (Estimands)

### 2.1 Grundgrößen und Notation

- b = Projektionsbericht (Berichtsjahr = Jahr der Meldung an die EU-Kommission)
- s ∈ {MMS, MWMS} = Szenario
- t = Zieljahr (Kalenderjahr, für das der Bericht einen Emissionswert ausweist)
- k = Sektor (k = "gesamt" oder ein Sektor nach Abschnitt 4.4)
- J_b = letztes Jahr, für das Bericht b historische Inventarwerte (keine
  Projektion) verwendet; aus dem Bericht selbst abzulesen und je Bericht in der
  Datentabelle zu dokumentieren ("Ausgangsjahr")
- P(b,s,t,k) = projizierter Wert in Mt CO2-Äquivalent, wie im Bericht bzw. dessen
  amtlichem Datenanhang ausgewiesen (unbereinigt)
- P(b,s,J_b,k) = der im Bericht für das Ausgangsjahr J_b ausgewiesene
  historische Wert
- A(t,k) = Ist-Wert in Mt CO2-Äquivalent aus dem Referenzinventar (Abschnitt 3.2)
- **P\*(b,s,t,k) = P(b,s,t,k) · A(J_b,k) / P(b,s,J_b,k)** = basisjahrbereinigte
  Projektion: der projizierte Pfad wird multiplikativ so umskaliert, dass er
  im Ausgangsjahr J_b genau auf dem heutigen Inventarwert A(J_b,k) liegt.
  Die relative Entwicklung des Pfads ab J_b bleibt dabei unverändert.
- Prognosehorizont h = t − J_b (in Jahren); nur Paare mit h ≥ 1 sind
  auswertbar (echte Projektion, kein historischer Wert)

**Verbindliche Regeln zur Umskalierung:**
1. Die Umskalierung erfolgt **je Sektor separat** mit dem sektoreigenen
   Faktor A(J_b,k) / P(b,s,J_b,k); "gesamt" wird mit dem Faktor der
   Gesamtemissionen umskaliert, **nicht** als Summe umskalierter Sektoren.
   (Folge: Die Summe der bereinigten Sektorwerte muss nicht dem bereinigten
   Gesamtwert entsprechen; das wird nicht korrigiert, sondern im Anhang
   ausgewiesen.)
2. Der Faktor wird je Szenario aus dem jeweils im Bericht für dieses Szenario
   ausgewiesenen historischen Wert für J_b gebildet (in der Regel identisch
   für MMS und MWMS; Abweichungen werden dokumentiert).
3. Weist ein Bericht für J_b (gesamt bzw. Sektor k) keinen historischen Wert
   aus, ist P\* für diesen Bericht (bzw. Sektor) nicht berechenbar. Der
   Bericht bzw. Sektor fällt dann aus der Primärpopulation heraus, wird
   dokumentiert und erscheint ausschließlich in der unbereinigten
   Sensitivität S1. Es wird kein Ersatzwert (z. B. aus einer früheren
   Inventarsubmission) eingesetzt (siehe Rückfrage 12.2, Punkt A; beantwortet: keine Ersatzregel).

### 2.2 Fehlermaße (vorab festgelegt)

Q bezeichnet den projizierten Vergleichswert: **Q = P\* in der
Primäranalyse**, Q = P in Sensitivität S1.

| Kürzel | Definition | Einheit | Lesart |
|---|---|---|---|
| E | Q − A | Mt CO2e | > 0: Projektion lag über dem Ist-Wert (Überschätzung der Emissionen) |
| RE | 100 · (Q − A) / A | % | relativer vorzeichenbehafteter Fehler |
| ARE | \|RE\| | % | relativer absoluter Fehler (Treffsicherheit ohne Richtung) |
| MRE | arithm. Mittel von RE über eine vorab definierte Menge von Paaren | % | mittlere Verzerrung (Bias) |
| MdRE | Median von RE | % | robuste Verzerrung |
| MAPE | arithm. Mittel von ARE | % | mittlere Treffsicherheit |
| k/n | Anzahl Paare mit RE > 0 von n Paaren | Anzahl | Richtungskonsistenz (rein deskriptiv, kein Test) |

Vorzeichenkonvention verbindlich: **positiv = Emissionen überschätzt**.
Kennzeichnung im Analyseoutput: Kennzahlen der Primärskala ohne Zusatz bzw.
mit "\*" (E\*, RE\*, ARE\*), Kennzahlen der unbereinigten Skala mit dem Zusatz
"unb." (z. B. RE_unb).

### 2.3 Estimands

**E1 (primär) – Abweichung für das Zieljahr 2020, Gesamtemissionen, MMS,
basisjahrbereinigt.**
RE\*(b, MMS, 2020, gesamt) für jeden Bericht b der Primärpopulation mit
J_b < 2020, einzeln berichtet (keine Mittelung als Kernzahl), dazu E\* und ARE\*.
Begründung: 2020 ist das einzige Zieljahr, das von allen frühen Berichten
explizit projiziert wurde und für das ein politisches Ziel (−40 % gegenüber
1990) existierte. Die Corona-Prägung von 2020 wird in S3a/S3b adressiert;
die unbereinigte Variante in S1.

**E2 (primär) – Systematische Verzerrung und Treffsicherheit über alle
auswertbaren Paare, Gesamtemissionen, MMS, basisjahrbereinigt.**
MRE, MdRE, MAPE und k/n (jeweils auf Basis von RE\*) über alle Paare
(b, MMS, t, gesamt) der Primärpopulation (Abschnitt 4), zusätzlich
aufgeschlüsselt nach Prognosehorizont h (Strukturvariable, Abschnitt 5.1.3).

**E3 (sekundär) – Szenarienvergleich MMS vs. MWMS (basisjahrbereinigt).**
Für jedes Paar (b, t, gesamt), für das beide Szenarien vorliegen:
D = ARE\*(MWMS) − ARE\*(MMS) (negativ = MWMS lag näher am Ist-Wert) sowie die
Differenz der vorzeichenbehafteten Fehler RE\*(MWMS) − RE\*(MMS).
Berichtet: alle Einzelwerte, Median von D, Anzahl Paare mit D < 0 von n.
Interpretationsgrenze siehe 8.2.

**E4 (sekundär) – Sektoren (basisjahrbereinigt, sektoreigener Faktor).**
E1 und E2 je Sektor k (Abschnitt 4.4), Szenario MMS; für MWMS nur als
Tabellenanhang.

**E5 (sekundär) – Zerlegung der unbereinigten Abweichung in Startpunkt- und
Verlaufsanteil.** Diese Zerlegung wird auf der **unbereinigten** Skala
berechnet, weil sie gerade zeigen soll, wie groß der Niveauanteil ist, den die
Primärskala herausnimmt. Für jedes Paar mit vorhandenem P(b,s,J_b,k) gilt exakt:
E_unb = [P(b,s,J_b,k) − A(J_b,k)] + [(P(b,s,t,k) − P(b,s,J_b,k)) − (A(t,k) − A(J_b,k))]
- erster Term = **Startpunktabweichung** (Inventarrevision des Ausgangsjahres,
  inkl. GWP-Umstellung)
- zweiter Term = **additive Verlaufsabweichung**

Beide Anteile werden in Mt CO2e und als Anteil an |E_unb| berichtet.
Hinweis zur Abgrenzung: Die Primärskala entfernt den Startpunkt
**multiplikativ** (Umskalierung), E5 **additiv**. E\* und der zweite Term von
E5 sind deshalb nicht identisch; beide werden nebeneinander berichtet, keiner
ersetzt den anderen. Liegt im Bericht kein historischer Wert für J_b vor,
entfällt E5 für diesen Bericht (dokumentiert).

**Ausdrücklich nicht Gegenstand:** Ursachenanalyse einzelner Abweichungen
(welche Annahme war "falsch"), Bewertung aktueller Projektionen für 2030 oder
2045, Aussagen über Zielerreichung künftiger Jahre.

## 3. Datenquellen

**Template-Pflichtfelder (werden beim Datenzugriff ausgefüllt, im
`run_log.txt` gespiegelt):**
- Quelle(n): siehe 3.1–3.3
- Zugriffsdatum: [TT.MM.JJJJ – beim Datenzugriff eintragen]
- Datenstand laut Quelle: [Bezeichnung der Inventarsubmission und der
  Berichtsfassungen – beim Datenzugriff eintragen]
- Lizenz/Nutzungsbedingungen: [je Quelle beim Datenzugriff eintragen]

### 3.1 Projektionen (primär)
- **Projektionsberichte der Bundesregierung** an die EU-Kommission, Berichtsjahre
  2015, 2017, 2019, 2021, 2023 (amtliche PDF-Fassungen, veröffentlicht durch
  UBA/BMUB/BMU/BMWK), jeweils einschließlich amtlicher Daten- bzw.
  Tabellenanhänge, falls vorhanden. Bei Abweichung zwischen PDF-Text und
  Datenanhang hat der **Datenanhang** Vorrang; Abweichungen werden dokumentiert.
- **Nicht einbezogen:** Projektionsbericht 2013 (Entscheidung Daniel Saure,
  22.10.2026), weder primär noch als Sensitivität.
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
  eine neuere Fassung erscheint. Aus dieser Submission stammen sowohl A(t,k)
  als auch die für die Umskalierung benötigten A(J_b,k).
- Bezugsgröße "gesamt": nationale Gesamtemissionen **ohne LULUCF**, ohne
  internationalen Luft- und Seeverkehr (Memo-Positionen), in der Abgrenzung
  der Zeile "Gesamt ohne LULUCF" der jeweiligen Quelle. Behandlung indirekter
  CO2-Emissionen: wie in der Quelle; wird sie zwischen Bericht und Inventar
  unterschiedlich behandelt, ist das im Datenblatt zu vermerken (relevant für
  E5 und S1).
- **Für S2 (Revisionen):** frühere Inventarsubmissionen, konkret jeweils die
  **erste Submission, die das Zieljahr t enthält** ("Erstveröffentlichung").
- **Für S7:** UBA-Vorjahresschätzung für 2025 (Veröffentlichung nach § 5 KSG,
  Frühjahr 2026). Kein Inventarwert, daher nur Sensitivität (bestätigt
  22.10.2026).

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
1. **Doppelte Extraktion:** Die Projektionswerte (einschließlich der
   historischen Werte P(b,s,J_b,k) für die Umskalierung) werden aus
   PDF-Tabellen (falls kein maschinenlesbarer Anhang vorliegt) in eine
   Extraktionstabelle übertragen, mit Fundstelle (Bericht, Seite,
   Tabellennummer) je Wert. Der Abgleich erfolgt gegen die EEA-Datenbank (3.1)
   oder, falls dort nicht vorhanden, durch eine zweite unabhängige Übertragung.
   Jede Differenz wird vor der Auswertung aufgelöst und dokumentiert.
2. **Summenprüfung:** Summe der Sektorwerte = Gesamtwert ± 1 % je Bericht,
   Szenario und Jahr (auf unbereinigter Skala); Abweichungen werden
   dokumentiert, nicht korrigiert.
3. **Einheiten und Metrik:** Je Bericht und Inventarsubmission wird festgehalten,
   welche Treibhauspotenziale (GWP, IPCC AR4 oder AR5) verwendet wurden.
4. **Plausibilisierung Ist-Reihe:** Die UBA-Gesamtemissionen 2015–2024 werden
   der OWID-Reihe gegenübergestellt; Abweichungen > 5 % werden im Bericht
   erläutert (Abgrenzungsunterschiede), lösen aber keine Änderung der
   Primärquelle aus.
5. **Bestimmung von J_b:** je Bericht aus dem Bericht selbst (Kapitel zur
   Datengrundlage bzw. letzter als historisch gekennzeichneter Wert). Ist J_b
   nicht eindeutig, Stopp und Rückfrage an Daniel vor der Auswertung. J_b ist
   für die Primärskala zentral (Umskalierungsjahr).
6. **Verfügbarkeit von P(b,s,J_b,k):** je Bericht, Szenario und Sektor
   dokumentieren, ob ein historischer Wert für J_b ausgewiesen ist
   (Voraussetzung für P\*, Regel 2.1 Nr. 3). Diese Prüfung erfolgt, bevor
   irgendein Fehlermaß berechnet wird.

Bei Unstimmigkeiten, die sich nicht nach den obigen Regeln auflösen lassen:
Analyse stoppen, Rückfrage an Daniel.

## 4. Analysepopulation

### 4.1 Einheit
Ein Auswertungspaar = (Bericht b, Szenario s, Zieljahr t, Sektor k) mit
vorhandenem P(b,s,t,k), P(b,s,J_b,k), A(t,k) und A(J_b,k) sowie
h = t − J_b ≥ 1. Für die unbereinigte Sensitivität S1 genügen P(b,s,t,k)
und A(t,k).

### 4.2 Primärpopulation
- **Berichte:** Projektionsberichte 2015, 2017, 2019, 2021, 2023
  (EU-Meldungen). Bericht 2013 ist ausgeschlossen. UBA-Projektionsdaten
  2024/2025 nur in S6.
- **Zieljahre:** alle t im Bereich 2015 ≤ t ≤ letztes Inventarjahr des
  Referenzinventars (voraussichtlich 2024), für die der Bericht **explizit**
  einen Jahreswert ausweist. **Keine Interpolation** in der Primäranalyse.
  Zieljahr 2025 nur in S7.
- **Skala:** basisjahrbereinigt (P\*).
- **Szenario:** MMS (primär), MWMS (für E3 und Anhang).
- **Sektor:** gesamt (primär), KSG-Sektoren für E4.
- Kein auswertbares Paar wird ausgeschlossen. Die Corona- und
  Energiekrisenjahre bleiben in der Primäranalyse enthalten (S3a, S3b, S4).
- Weist ein Bericht kein MWMS aus oder ist MWMS mit MMS identisch, wird das
  dokumentiert; der Bericht fällt dann aus E3 heraus.
- Paare ohne P(b,s,J_b,k) fallen nach Regel 2.1 Nr. 3 aus der
  Primärpopulation heraus und werden in Tabelle 1 aufgeführt.

### 4.3 Erwartbare Struktur (ohne Kenntnis der Werte)
Projektionsberichte weisen Zieljahre häufig nur in Stützjahren (z. B.
Fünfjahresschritten) aus. Es ist daher möglich, dass die Primärpopulation im
Wesentlichen aus dem Zieljahr 2020 besteht und nur wenige weitere Paare
enthält. Das wird nicht durch nachträgliche Interpolation "aufgefüllt",
sondern offen berichtet; Interpolation ist ausschließlich Sensitivität S5.
Zusammenfassende Kennzahlen (MRE, MdRE, MAPE) werden nur berechnet, wenn eine
Zelle mindestens 3 Paare enthält; sonst werden nur Einzelwerte gezeigt.

### 4.4 Sektorabgrenzung
Primär: **Sektoren nach Klimaschutzgesetz (KSG, Anlage 1)** (bestätigt
22.10.2026): Energiewirtschaft, Industrie, Gebäude, Verkehr, Landwirtschaft,
Abfallwirtschaft und Sonstiges. Für Berichte, die (noch) nicht nach
KSG-Sektoren gliedern, wird vor der Auswertung eine **Zuordnungstabelle** der
dort verwendeten Quellkategorien (CRF/CRT-Kategorien) zu KSG-Sektoren erstellt
und im Analyseordner abgelegt. Ist eine eindeutige Zuordnung für einen Sektor
nicht möglich, entfällt dieser Sektor für den betreffenden Bericht
(dokumentiert); es wird nicht geschätzt. Die Zuordnungstabelle gilt
gleichermaßen für P(b,s,t,k) und P(b,s,J_b,k) und ist Teil der Prüfrunde des
validators.

## 5. Statistische Methoden

### 5.1 Primäranalyse

#### 5.1.1 Grundsatz: rein deskriptive Analyse (Begründung)
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
(basisjahrbereinigte) MMS-Projektion für 2020 über dem Ist-Wert; die
Abweichungen reichten von x bis y %."

#### 5.1.2 E1 und E2
1. Umskalierung P → P\* nach 2.1 (je Bericht, Szenario, Sektor).
2. Berechnung der Kennzahlen nach 2.2 mit Q = P\* für die in 2.3 definierten
   Mengen.
Für E1 Einzelwerte je Bericht. Für E2 Mittel- und Medianwerte über alle Paare
der Primärpopulation sowie je Horizontklasse (5.1.3).

#### 5.1.3 Prognosehorizont als Strukturvariable
h = t − J_b (primär). Horizontklassen (bestätigt 22.10.2026):
**1–3 Jahre, 4–6 Jahre, ≥ 7 Jahre**.
Berichtet werden MRE, MdRE, MAPE und k/n je Klasse (Mindestzellgröße 3, sonst
Einzelwerte). Zusätzlich grafische Darstellung von RE\* und ARE\* gegen h (alle
Paare, Punkte nach Bericht gekennzeichnet). Es wird **keine** Regression von
ARE auf h geschätzt (Abhängigkeitsstruktur, siehe 5.1.1).
Alternative Horizontdefinition (Berichtsjahr statt J_b) nur in S8.

#### 5.1.4 E3 (Szenarienvergleich)
Gepaarter deskriptiver Vergleich je (b, t) nach 2.3 auf der
basisjahrbereinigten Skala. Keine Mittelung über Berichte als Kernaussage;
Median von D und Anzahl D < 0 nur ergänzend.

#### 5.1.5 E4 (Sektoren)
Wie 5.1.2 je Sektor, mit sektoreigenem Umskalierungsfaktor. Sektoren werden in
fester Reihenfolge (KSG-Anlage 1) berichtet, nicht nach Größe der Abweichung
sortiert.

#### 5.1.6 E5 (Zerlegung)
Berechnung der zwei Terme nach 2.3 (unbereinigte Skala) für jedes Paar;
Darstellung als gestapeltes Balkendiagramm je Bericht für das Zieljahr 2020
(gesamt, MMS) und als Tabelle für alle Paare. Zusätzlich je Bericht der
Umskalierungsfaktor A(J_b,k) / P(b,s,J_b,k) (gesamt), damit die Größe der
Basisjahrbereinigung transparent ist.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan: Autokorrelation, Normalität, Ausreißer)
Da kein inferenzielles Modell geschätzt wird, gibt es keine Modellannahmen, die
formal zu prüfen wären. Formale Tests auf Autokorrelation (z. B. Durbin-Watson,
Ljung-Box) oder Normalität (z. B. Shapiro-Wilk) werden **nicht** durchgeführt
und dienen nicht als Entscheidungsgrundlage: Bei n ≤ ca. 20 abhängigen Paaren
haben sie keine verwertbare Trennschärfe, und ihr Ergebnis würde keine
Methodenentscheidung auslösen. Die Template-Prüfung auf Transitivität entfällt
(kein indirekter/Netzwerk-Vergleich, siehe 8). Stattdessen verbindlich:
1. **Abhängigkeitsstruktur offenlegen:** Tabelle, welche Paare dasselbe
   Zieljahr bzw. denselben Bericht teilen; im Bericht ausdrücklicher Hinweis,
   dass die Paare nicht unabhängig sind (Autokorrelation entlang t innerhalb
   eines Berichts und gemeinsame Zieljahr-Schocks über Berichte).
2. **Grafische Prüfung der Verteilung:** Punktdiagramm aller RE\*-Werte (kein
   Histogramm bei kleiner Fallzahl), um Schiefe oder einzelne dominierende
   Werte sichtbar zu machen. Deshalb wird neben dem Mittel (MRE) stets der
   Median (MdRE) berichtet.
3. **Einflussanalyse (Leave-one-report-out):** Die E2-Kennzahlen (Primärskala)
   werden jeweils ohne einen Bericht neu berechnet. Ausdrücklich berichtet
   wird, wenn das Weglassen eines einzelnen Berichts (a) das Vorzeichen von
   MRE oder MdRE umkehrt oder (b) MAPE um mehr als 25 % (relativ) verändert.
   Kein Bericht wird deswegen ausgeschlossen.
4. **Zieljahr-Schocks:** Verlauf von RE\* je Bericht über t grafisch; ein
   gemeinsamer Ausschlag aller Berichte in einem Zieljahr wird als
   Zieljahr-Effekt (nicht als Berichtsqualität) gekennzeichnet.
5. **Plausibilität der Umskalierung:** Umskalierungsfaktoren je Bericht
   tabellarisch; Faktoren außerhalb 0,90–1,10 werden im Bericht erläutert
   (Ursache laut Bericht/Inventar, z. B. GWP-Wechsel), lösen aber keine
   Änderung der Primärskala aus.

### 5.3 Korrektur bei Annahmenverletzung
Entfällt: Es gibt kein Modell, dessen Standardfehler oder Tests korrigiert
werden müssten (z. B. keine Newey-West-HAC-Korrektur). Der Abhängigkeit und
möglichen Ausreißern wird ausschließlich durch die in 5.2 festgelegten
Maßnahmen begegnet (Median neben Mittelwert, Leave-one-report-out,
Offenlegung der Abhängigkeitsstruktur, Einzelwertdarstellung). Keine
Transformation, keine Winsorisierung, kein Ausschluss von Werten.

### 5.4 Unsicherheitsquantifizierung
Es werden keine Konfidenzintervalle berechnet (Begründung 5.1.1), weder primär
noch sensitivitätsanalytisch; auch kein Bootstrap. Die Streuung wird über
Spannweite und vollständige Einzelwerte gezeigt; die Robustheit über
Leave-one-report-out (5.2) und die Sensitivitäten (6). Falls die Berichte
selbst Unsicherheitsbänder oder Sensitivitätsrechnungen zu ihren Projektionen
ausweisen, wird für E1 zusätzlich deskriptiv berichtet, ob der Ist-Wert
innerhalb dieses Bandes lag (nur wenn im Bericht ausgewiesen, keine eigene
Konstruktion). Ein solches Band wird mit demselben Faktor wie P\* umskaliert;
das unbereinigte Band wird in S1 berichtet.

### 5.5 Signifikanzniveau
**Es wird kein Signifikanzniveau festgelegt** (kein α), weil die Analyse rein
deskriptiv ist und keine Hypothesentests durchgeführt werden (Begründung
5.1.1; Entscheidung Daniel Saure, 22.10.2026, zu Template-Abschnitt 5.5).
Es werden keine p-Werte berechnet oder berichtet.

## 6. Sensitivitätsanalysen

Primär ist ausschließlich die Spezifikation nach Abschnitt 2–5 mit der
**basisjahrbereinigten Skala** und der Primärpopulation 4.2. Alle folgenden
Varianten sind vorab festgelegt, werden **vollständig** berichtet und können
das Primärergebnis nicht ersetzen. Ein nachträglicher Tausch von Primär- und
Sensitivitätsskala ist ausgeschlossen (Festlegung vor Datenzugriff, v0.2).
Soweit nicht anders angegeben, werden alle Sensitivitäten S2–S9 auf der
basisjahrbereinigten Skala gerechnet.

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | **Unbereinigte Projektion:** Q = P(b,s,t,k), d. h. die Projektion wird ohne Umskalierung direkt dem Referenzinventar gegenübergestellt (Niveauverschiebungen durch Inventarrevision und GWP-Umstellung gehen in die Abweichung ein). Umfasst auch Berichte/Sektoren, die mangels P(b,s,J_b,k) aus der Primärpopulation herausfallen; diese werden in S1 gesondert gekennzeichnet. | E1, E2, E3, E4 |
| S2 | **Inventarrevision:** Ist-Wert A(t,k) **und** Umskalierungsbasis A(J_b,k) aus der Erstveröffentlichung (erste Submission, die t enthält) statt aus dem Referenzinventar, damit Zähler und Basis aus derselben Submission stammen | E1, E2 |
| S3a | **Corona:** ohne Zieljahr 2020 | E2, E3, E4 |
| S3b | **Corona inkl. Nachholeffekt:** ohne Zieljahre 2020 und 2021 | E2, E3, E4 |
| S4 | **Energiekrise:** ohne Zieljahr 2022 (bestätigt 22.10.2026) | E2, E3, E4 |
| S5 | **Interpolation:** zusätzliche Paare durch lineare Interpolation zwischen explizit ausgewiesenen Stützjahren desselben Berichts und Szenarios (keine Extrapolation); Interpolation auf P, anschließend Umskalierung mit demselben Faktor | E2, E3 |
| S6 | **Erweiterte Berichtsmenge:** zusätzlich UBA-Projektionsdaten 2024 und 2025 (J_b und Umskalierung nach denselben Regeln) | E2, E3 |
| S7 | **Vorjahresschätzung 2025** als zusätzlicher Ist-Wert (Zieljahr 2025); Umskalierungsbasis bleibt A(J_b,k) aus dem Referenzinventar | E2, E3 |
| S8 | **Alternative Horizontdefinition:** h' = t − Berichtsjahr | E2 (Horizontanalyse) |
| S9 | **Gesamtemissionen mit LULUCF** (nur wenn Bericht und Inventar diese Größe ausweisen); Umskalierung mit LULUCF-inklusiven Werten für J_b | E1, E2 |

Kombinationen von Sensitivitäten werden nicht gebildet, mit einer Ausnahme:
S1 (unbereinigt) wird zusätzlich gemeinsam mit S3a berichtet, weil Revisions-
und Corona-Effekt sich im Zieljahr 2020 überlagern können.

Wird eine Sensitivität mangels Daten undurchführbar (z. B. keine
Erstveröffentlichung mit Wert für J_b in S2), wird sie als "nicht
durchgeführt, Grund: …" berichtet, nicht stillschweigend weggelassen.

## 7. Umgang mit Mehrfachtestung / Multiplizität

Es werden keine Hypothesentests durchgeführt; eine formale Adjustierung
(Bonferroni, Holm, FDR) entfällt daher (siehe auch 5.5). Das eigentliche
Multiplizitätsrisiko ist hier die **selektive Berichterstattung** aus einer
großen Zahl von Zellen (Bericht × Szenario × Zieljahr × Sektor × Skala ×
Sensitivität). Gegenmaßnahmen:
1. **Vorab festgelegte Kernzahlen** (die einzigen, die in Überschrift,
   Teaser und Grafik 1 verwendet werden dürfen), jeweils
   **basisjahrbereinigt**:
   (a) RE\*(b, MMS, 2020, gesamt) je Bericht (E1);
   (b) MRE, MdRE, MAPE und k/n über die Primärpopulation, gesamt, MMS (E2).
2. Die unbereinigten Werte (S1) und alle übrigen Werte sind sekundär bzw.
   beschreibend und werden vollständig in Tabellen berichtet, unabhängig
   davon, ob sie "interessant" ausfallen. Eine unbereinigte Zahl darf nicht
   in Überschrift oder Teaser verwendet werden, auch wenn sie
   eindrucksvoller oder anschaulicher erscheint.
3. Keine nachträgliche Auswahl von Berichten, Zieljahren, Szenarien,
   Sektoren, Horizontklassen, Skalen oder Sensitivitäten, die eine bestimmte
   Aussage am besten stützen. Einzelne auffällige Sektor- oder Jahreswerte
   werden im Text nur im Kontext der Gesamttabelle genannt.
4. Jede Abweichung vom SAP wird als "Post-hoc" gekennzeichnet.

## 8. Interpretationsrahmen / Confounder

### 8.0 Feste Prüfpunkte des Master-Templates
- **Produktions- vs. Konsum-Perspektive:** Projektionen und Inventar folgen
  beide der territorialen Produktionsperspektive (UNFCCC-Berichterstattung).
  Der Vergleich ist innerhalb dieser Perspektive konsistent. Fehlinterpretation,
  die vermieden werden muss: Eine Unterschreitung der Projektion darf nicht
  als "Deutschland hat weniger Emissionen verursacht" im Konsumsinne gedeutet
  werden; Verlagerungen (z. B. Produktionsrückgang energieintensiver Industrie
  mit Importersatz) erscheinen als geringere Ist-Emissionen. Im Bericht wird
  die Perspektive genannt.
- **Keine implizite Politik-/Verhaltensbewertung:** Abweichungen werden nicht
  als Erfolg oder Versagen von Klimapolitik oder Modellierung eingeordnet
  (siehe 8.1, 8.5). Festgelegt vor der Analyse: Eine Abweichung wird als
  Abstand eines bedingten Szenarios zum Ist-Wert beschrieben, ohne
  Ursachenzuschreibung.
- **Transitivitätsannahme bei indirekten/Netzwerk-Vergleichen:** nicht
  anwendbar. Jeder Vergleich ist direkt (Projektion vs. Ist-Wert desselben
  Jahres und Sektors); E3 ist ein direkter gepaarter Vergleich innerhalb
  desselben Berichts.
- **Regression-zur-Mitte bei Trendvergleichen:** Relevant für E4: Sektoren mit
  kleinem absolutem Niveau (z. B. Abfallwirtschaft) können bei kleinen
  absoluten Abweichungen große relative Fehler zeigen. Deshalb werden je Sektor
  E\* (Mt CO2e) und RE\* (%) stets nebeneinander berichtet; Sektorvergleiche
  im Text dürfen sich nicht allein auf relative Werte stützen. Ein
  Regression-zur-Mitte-Effekt über Berichte (frühe Berichte mit großer
  Abweichung, spätere mit kleiner) wird nicht als Qualitätsverbesserung
  gedeutet, ohne die unterschiedlichen Horizonte (5.1.3) zu berücksichtigen.

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
Skala. Die Primäranalyse adressiert das durch die Basisjahrbereinigung
(Niveau des Ausgangsjahres auf heutigen Inventarwert); die unbereinigte
Wirkung wird in S1 und E5 sichtbar gemacht, die Revisionswirkung auf die
Ist-Werte in S2. Im Bericht prominent erklärt, einschließlich des Hinweises,
dass die Primärzahl die Treffsicherheit des Verlaufs, nicht des absoluten
Niveaus beschreibt.

### 8.4 Schocks
Corona (2020/21) und Energiekrise (2022) waren in keinem vor 2020
veröffentlichten Bericht absehbar. Abbildung über S3a, S3b, S4.

### 8.5 Neutralität
Der Check bewertet weder die Klimapolitik einzelner Regierungen noch die
Ziele selbst. Abweichungen in beide Richtungen werden gleich behandelt und mit
demselben Wortlaut beschrieben.

## 9. Limitationen

- Sehr kleine Zahl von Berichten; Paare stark voneinander abhängig;
  Kennzahlen sind instabil (Leave-one-report-out, 5.2).
- Wenige explizit ausgewiesene Zieljahre in der Vergangenheit; die Analyse
  kann sich im Kern auf ein einziges Zieljahr (2020) stützen, das zudem von
  einem Sonderereignis geprägt ist.
- Die Basisjahrbereinigung unterstellt, dass Revisionen und GWP-Umstellungen
  im Wesentlichen als **proportionale** Niveauverschiebung wirken. Verändert
  eine Revision die Zusammensetzung (Gasmix, Quellkategorien) so, dass auch
  die Entwicklung nach J_b anders ausfiele, bleibt ein Restanteil der Revision
  in E\*. Ebenso hängt die Primärzahl am Ausgangsjahr J_b: Ein untypischer
  Wert in J_b wird auf den gesamten projizierten Pfad übertragen.
- Berichte ohne ausgewiesenen historischen Wert für J_b fallen aus der
  Primärpopulation heraus (2.1 Nr. 3), was die ohnehin kleine Zahl von
  Berichten weiter verringern kann.
- Übertragungsfehler aus PDF-Tabellen möglich (Gegenmaßnahme 3.5).
- Sektorabgrenzungen älterer Berichte nur über eine Zuordnungstabelle
  vergleichbar; Restunschärfen möglich.
- Das Referenzinventar wird künftig weiter revidiert; die Ergebnisse gelten
  für den dokumentierten Inventarstand.
- Keine Ursachenzerlegung nach Treibern (Wirtschaft, Preise, Maßnahmen,
  Wetter); E5 trennt nur Startpunkt- und Verlaufsanteil.
- Die Berichte sind keine Zufallsstichprobe; keine Verallgemeinerung auf die
  Treffsicherheit künftiger Projektionen.
- Bericht 2013 ist nicht enthalten; Aussagen gelten nur für die Berichte
  2015–2023.

## 10. Software

R (Version im Skript-Header dokumentiert), voraussichtliche Pakete: readxl
(bzw. readr), dplyr, tidyr, ggplot2. Skript
`prognose-check-projektionsberichte.R`. Eingelesen werden ausschließlich die
unverändert abgelegten Rohdateien und die dokumentierte Extraktionstabelle
(3.5) sowie die Sektor-Zuordnungstabelle (4.4); kein Netzzugriff aus dem
Skript. Keine Zufallskomponente vorgesehen (daher kein Seed nötig).
Sitzungsinformationen (Paketversionen) werden in `output/` gespeichert.

## 11. Reporting-Plan

- **Format:** Klima Kompass · Evidenzcheck (Flaggschiff-Stück), Umfang größer
  als Schnellcheck (ca. eine Woche Bearbeitung); keine Begrenzung auf eine
  Grafik oder 800 Wörter. Gate: Validierungsbericht ohne "kritisch".
- **Grafik 1 (Kerngrafik):** Ist-Emissionen gesamt (Referenzinventar) als
  Linie, darüber die **basisjahrbereinigten** MMS-Projektionspfade aller
  Berichte der Primärpopulation (jeder Pfad beginnt in J_b auf der Ist-Linie;
  nur explizit ausgewiesene Punkte, verbunden), Zieljahr 2020 markiert.
- **Grafik 1b (ergänzend, nicht Teaser):** dieselbe Darstellung mit
  unbereinigten Pfaden (S1), damit der Unterschied zwischen beiden Skalen
  sichtbar ist.
- **Grafik 2:** RE\* gegen Prognosehorizont h, alle Paare (gesamt, MMS und
  MWMS unterschiedlich markiert).
- **Grafik 3:** Zerlegung E5 (unbereinigte Skala) für das Zieljahr 2020.
- **Tabelle 1:** je Bericht: Berichtsjahr, J_b, P(b,s,J_b,gesamt) vorhanden
  ja/nein, Umskalierungsfaktor (gesamt), ausgewiesene Zieljahre, Szenarien,
  GWP-Basis, Fundstelle; Liste der aus der Primärpopulation herausgefallenen
  Berichte/Sektoren mit Grund.
- **Tabelle 2:** alle Paare mit P, P\*, A, E\*, RE\*, ARE\* und daneben E_unb,
  RE_unb, ARE_unb, h (gesamt; MMS und MWMS).
- **Tabelle 3:** Kernzahlen E1/E2 primär (basisjahrbereinigt) und unter allen
  Sensitivitäten S1–S9 sowie der Kombination S1+S3a.
- **Tabelle 4:** Sektoren (E4), je Sektor E\* und RE\* nebeneinander.
- **Anhang:** Extraktionstabelle mit Fundstellen, Sektor-Zuordnungstabelle,
  Umskalierungsfaktoren je Bericht/Sektor/Szenario, Abweichung Summe der
  bereinigten Sektoren vs. bereinigter Gesamtwert, Abhängigkeitsstruktur
  (5.2), Leave-one-report-out.
- **Rundung:** Mt CO2e ganzzahlig, relative Fehler auf eine Nachkommastelle,
  Anteile in Prozent ohne Nachkommastelle, Umskalierungsfaktoren auf drei
  Nachkommastellen.
- **Wortwahl:** "Der projizierte Verlauf lag x % über/unter dem Ist-Wert";
  bei Nennung unbereinigter Werte ausdrücklich "ohne Bereinigung um spätere
  Inventarrevisionen". Nicht "Fehlprognose", nicht "signifikant".
- Kernaussagen erst nach Validierung (validator) formulieren. Kanalfassungen
  nur über den Klima-Kompass-Ablauf (Substack, Instagram, Facebook, WhatsApp;
  keine LinkedIn-Fassung).

## 12. Beantwortete Rückfragen (22.10.2026)

### 12.1 Entscheidungen Daniel Saure zu den Rückfragen aus v0.1
Antwort Daniel Saure am 22.10.2026, Wortlaut: "ok nehme deine antworten an".
Die Entscheidungen im Einzelnen, wie sie in v0.2 umgesetzt sind:

1. **Master-Template:** `SAP-Vorlage/SAP-Template.md`. Entwurf abgeglichen
   (Dokumentkopf, Abschnitt 0, 3, 5.1–5.5, 8.0). Kein Signifikanzniveau, da
   rein deskriptiv (5.5).
2. **Eine Analyse zur Zeit:** Kein anderer Evidenzcheck läuft
   (Rhein-Niedrigwasser am 19.10.2026 abgebrochen). Erledigt (Abschnitt 0).
3. **Berichtsmenge:** primär EU-Projektionsberichte 2015, 2017, 2019, 2021,
   2023; Bericht 2013 wird **nicht** einbezogen; UBA-Projektionsdaten
   2024/2025 nur als Sensitivität S6 (3.1, 4.2, 9).
4. **Primärskala:** basisjahrbereinigte Variante ist **Primäranalyse**,
   unbereinigte Variante ist Sensitivität **S1**. Begründung: misst die
   Treffsicherheit des projizierten Verlaufs, ohne spätere
   Inventarrevisionen/GWP-Umstellungen als Prognosefehler zu werten
   (1, 2.1–2.3, 4, 5, 6, 7, 8.3, 9, 11). Entscheidung vor Datenzugriff;
   kein späterer Tausch.
5. **Szenario:** MMS primär, MWMS sekundär (E3) – bestätigt.
6. **Ist-Wert 2025:** UBA-Vorjahresschätzung nur als Sensitivität S7 –
   bestätigt.
7. **Sektorabgrenzung:** KSG-Sektoren primär, mit Zuordnungstabelle für
   ältere Berichte – bestätigt (4.4).
8. **Horizontklassen:** 1–3 / 4–6 / ≥ 7 Jahre – bestätigt (5.1.3).
9. **Energiekrise:** Sensitivität ohne 2022 (S4) bleibt – bestätigt.
10. **Format und Umfang:** größer als Schnellcheck, ca. eine Woche
    Bearbeitung; Format Evidenzcheck (Flaggschiff-Stück) (Kopf, 11).
11. **Einfrieren:** erst nach Lesen des vollständigen Textes, mit dem
    Wortlaut "Volltext gelesen, einfrieren" (Kopf). Bis dahin Status `draft`.

### 12.2 Rückfragen aus der Umsetzung von v0.2 (beantwortet 22.10.2026)

**Antwort Daniel Saure, 22.10.2026: „A–D wie empfohlen“.** Damit gilt jeweils die im Entwurf bereits festgelegte Regel: A Ausschluss aus der Primärpopulation (keine Ersatzregel), B eigener Faktor je Sektor und für "gesamt", C Schwelle 0,90–1,10, D Basis in S2 aus derselben Erstveröffentlichung. Der übrige Text ist dadurch unverändert. Diese Antwort ist keine Freigabe des SAP.

A. **Fehlender historischer Wert für J_b:** Der Entwurf legt fest, dass ein
   Bericht (bzw. Sektor) ohne ausgewiesenen historischen Wert für J_b aus der
   Primärpopulation herausfällt und nur in S1 erscheint (2.1 Nr. 3). Alternative
   wäre, als Basis den Inventarwert für J_b aus der Submission zu nehmen, auf
   der der Bericht beruhte. Einverstanden mit dem Ausschluss, oder soll diese
   Alternative vorab als Ersatzregel festgelegt werden?
B. **Umskalierung je Sektor:** Sektoren werden mit eigenem Faktor umskaliert,
   "gesamt" mit dem Gesamtfaktor (keine Summenbildung aus bereinigten
   Sektoren). Einverstanden?
C. **Schwelle für Erläuterung der Umskalierungsfaktoren (5.2 Nr. 5):**
   0,90–1,10 ist ein vorab gesetzter, rein darstellerischer Wert ohne
   Auswirkung auf Ergebnisse. Passt diese Schwelle?
D. **S2 mit Basis aus Erstveröffentlichung:** In S2 stammen A(t) und A(J_b)
   aus derselben Erstveröffentlichung von t. Einverstanden?

## 13. Benötigte Rohdateien (Download durch Daniel)

1. Projektionsberichte 2015, 2017, 2019, 2021, 2023 der Bundesregierung
   (PDF) und – falls vorhanden – die zugehörigen amtlichen Datenanhänge
   (Excel/CSV). Der Bericht 2013 wird nicht benötigt.
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
