# Statistischer Analyseplan (SAP) – IPCC-Abkehr von RCP8.5

**Titel:** Bedeutet die Abkehr des IPCC vom Extremszenario RCP8.5 (bzw. SSP5-8.5) für die
projizierten globalen Erwärmungsbereiche eine physische Risiko-Herabstufung oder eine
Wahrscheinlichkeits-Rekalibrierung der zugrunde liegenden Emissionspfade? Eine strukturierte
Evidenzsynthese publizierter IPCC-Wahrscheinlichkeitsangaben (AR5 vs. AR6, ggf. AR7-Prozessdokumente).

**Version:** 1.0 (final)
**Datum:** 28.08.2026
**Autor:in / Freigabe:** sap-autor-Subagent (Klima-Evidenzcheck-Projekt) / Freigegeben: dsaure55 / Datum: 28.08.2026

**Änderungshistorie:**
- v0.1 (28.08.2026): Erste Fassung, vier offene Rückfragen an den Menschen (Abschnitt 12).
- v0.2 (28.08.2026): Rückfragen 1–3 durch den Menschen entschieden (siehe Abschnitt 12): (1) AR5⟷AR6
  bestätigt als primärer Vergleich, AR7 bleibt gekennzeichnete Sensitivität; (2) Sekundärliteratur wird
  zitierfähiger Bestandteil der Evidenzbasis im Report (nicht nur interne Prüfung); (3) fachliche
  Gegenprüfung durch klimawissenschaftlich ausgebildete Person wird verbindliche Vorbedingung für die
  Veröffentlichung. Rückfrage 4 (formales Einfrieren) stand weiterhin aus.
- **v1.0 (28.08.2026): Eingefroren/final.** Rückfrage 4 (formales Einfrieren) durch den Menschen
  entschieden. Ab dieser Version ist keine Abweichung vom festgelegten Vorgehen mehr ohne explizite
  Kennzeichnung als "Post-hoc" zulässig (Projektregel).

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor systematischer Dokumenten-/Zitatextraktion verfasst und einzufrieren)
[ ] Exploratorisch (Daten/Fundstellen wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

**Hinweis zur Art der Analyse:** Dies ist **keine Primärdatenanalyse** und **keine statistische
Neuschätzung** von Wahrscheinlichkeiten oder Temperaturbereichen. Es handelt sich um eine
**qualitative/strukturierte Evidenzsynthese** bereits publizierter, wahrscheinlichkeitsgewichteter
IPCC-Aussagen. Entsprechend wurde Abschnitt 5 des Master-Templates ("Statistische Methoden") durch
eine **Synthese-Methodik** ersetzt; weitere Abweichungen vom Standard-Aufbau sind an den jeweiligen
Stellen explizit begründet.

**Bestätigung Präregistrierungs-Status:** Dem SAP-Autor wurden im Auftrag **keine** Analyseergebnisse,
Zahlen, extrahierten Zitate oder Grafiken zu den betroffenen IPCC-Dokumenten mitgeliefert. Der SAP wird
daher als prospektiv (Status `draft`, vor Dokumentzugriff) erstellt und ist nach menschlicher Freigabe
als `final` einzufrieren, **bevor** die systematische Extraktion (Analyst-Schritt) beginnt. Sollte sich
im weiteren Verlauf herausstellen, dass am Auftrag beteiligte Personen die relevanten Fundstellen bereits
gesichtet/vorausgewählt haben, ist dieser SAP als "Status: exploratory (retrospektiv)" umzuwidmen, nicht
als "final" zu behandeln.

---

## 1. Hintergrund / Rationale

Der IPCC hat zwischen dem 5. Sachstandsbericht (AR5, 2013/2014) und dem 6. Sachstandsbericht
(AR6, 2021–2023) sein Szenario-Rahmenwerk verändert: von den vier "Representative Concentration
Pathways" (RCPs, gleichrangig als Konzentrationspfade ohne explizite Eintrittswahrscheinlichkeit
konzipiert) hin zu den "Shared Socioeconomic Pathways" (SSPs), bei denen AR6 – anders als AR5 –
in Kapiteln, Technical Summary und Cross-Chapter Boxen explizit qualitative Aussagen zur
**Plausibilität/Wahrscheinlichkeit des Eintretens** einzelner Pfade macht (u. a. die Einschätzung,
dass ein Weiterverfolgen sehr hoher Emissionspfade wie SSP5-8.5 angesichts aktueller energiewirtschaftlicher
Trends als "unwahrscheinlich" gilt).

Diese Neubewertung wird in der öffentlichen und politischen Debatte (u. a. im Bundestag) unterschiedlich
gedeutet: Die eine Lesart interpretiert sie als Eingeständnis, dass frühere "Worst-Case"-Erzählungen
("RCP8.5 als Business-as-usual") übertrieben waren ("Ende eines Alarmismus-/Betrugsnarrativs"). Die
andere Lesart warnt vor einer Verwechslung zweier unterschiedlicher statistischer Objekte: (a) der
Wahrscheinlichkeit, dass ein bestimmter **Emissionspfad** tatsächlich eintritt (eine sozioökonomische/
energiepolitische Einschätzung), und (b) der **physikalischen Unsicherheitsspanne der Erwärmung**
gegeben einen bestimmten Strahlungsantrieb (eine klimasensitivitätsbezogene Größe, z. B. beeinflusst
durch aktualisierte Schätzungen der Gleichgewichts-Klimasensitivität ECS zwischen AR5 und AR6).

Bestehende öffentliche Darstellungen vermischen diese beiden Objekte häufig, ohne die zugrunde liegenden
IPCC-Formulierungen selbst systematisch zu vergleichen. Diese Analyse schließt diese Lücke, indem sie
**ausschließlich anhand der IPCC-eigenen publizierten Formulierungen und Zahlenangaben** (nicht anhand
politischer Kommentare) rekonstruiert, ob und in welchem Ausmaß sich zwischen den Berichten (a) die
**physikalisch projizierte Erwärmungsspanne** für einen vergleichbaren hohen Antriebspfad verändert hat
und/oder (b) lediglich die **zugewiesene Eintrittswahrscheinlichkeit dieses Pfades** neu bewertet wurde.

---

## 2. Fragestellung (Estimand)

**Primärer Vergleichs-Estimand:** Für die globale mittlere Oberflächentemperaturanomalie (GSAT/GMST,
relativ zu einer harmonisierten Referenzperiode 1850–1900) unter dem jeweils höchsten in AR5 und AR6
vollständig assessierten Emissions-/Konzentrationspfad der "sehr hohen Emissionen"-Familie
(RCP8.5 in AR5 ⟷ SSP5-8.5 in AR6, gemäß der von IPCC selbst dokumentierten Pfad-Korrespondenz) wird für
jede der drei in AR6 SPM Table SPM.1 definierten Zielperioden (nahfristig 2021–2040, mittelfristig
2041–2060, langfristig 2081–2100) folgender **kategorialer Vergleich** durchgeführt:

1. Hat sich der **berichtete physikalische Wahrscheinlichkeitsbereich der Erwärmung** (Bestwert,
   "likely"-Bereich 17–83 %, ggf. "very likely"-Bereich 5–95 %) für den jeweils höchsten Pfad zwischen
   AR5 und AR6 verändert (Kategorie: **physische Risiko-Herabstufung**, sofern explizit auf aktualisierte
   physikalische Evidenz – z. B. ECS-Neubewertung – zurückgeführt)?
2. Hat sich unabhängig davon lediglich die **zugewiesene Eintrittswahrscheinlichkeit des Emissionspfades
   selbst** verändert, d. h. äußert sich der jeweilige Bericht explizit dazu, wie wahrscheinlich es ist,
   dass die reale Emissionsentwicklung diesem Pfad folgt (Kategorie: **Wahrscheinlichkeits-Rekalibrierung**)?
3. Treten beide Aspekte gleichzeitig auf, oder ist die Evidenzlage für eine eindeutige Zuordnung nicht
   ausreichend?

Die exakten Entscheidungsregeln für diese Klassifikation sind in Abschnitt 5.4/5.5 **vorab und
verbindlich** festgelegt, damit zwei unabhängige Bearbeiter:innen anhand derselben Fundstellen zur
selben Klassifikation kämen. Es wird **keine neue Wahrscheinlichkeit oder kein neues Temperaturintervall
berechnet** – der Estimand ist die **dokumentierte Übereinstimmung/Nicht-Übereinstimmung** zwischen
publizierten Aussagen, nicht ein neu geschätzter Parameter.

**Explizit außerhalb des Estimanden:** Eine eigene Bewertung, ob SSP5-8.5 "physikalisch plausibel" ist
oder ob die energiewirtschaftliche Einschätzung des IPCC zutrifft, ist **nicht** Gegenstand dieser
Analyse (siehe Abschnitt 8/9 – politische Neutralität).

---

## 3. Datenquelle

**Anmerkung zur Abweichung vom Template:** Statt einer einzelnen Primärdatenquelle (z. B. klimadashboard.de)
werden hier mehrere **offizielle IPCC-Publikationen** als Evidenzbasis definiert; das Datenzugriffsdatum
kann nicht vorab fixiert werden, da die systematische Extraktion erst nach Einfrieren dieses SAP im
Analyst-Schritt erfolgt.

**Primäre Quellen (physikalische Wissenschaft, WG1):**
- IPCC AR5 (2013): Working Group I, *Summary for Policymakers* (SPM Table SPM.2), *Technical Summary*,
  Kapitel 12 ("Long-term Climate Change: Projections, Commitments and Irreversibility"), Annex II
  (Szenario-/RCP-Beschreibungen).
- IPCC AR6 (2021): Working Group I, *Summary for Policymakers* (insb. Table SPM.1, SPM.3, SPM.4),
  *Technical Summary* (insb. Box TS.7 "Emission scenarios, likelihood, and the SSP–RCP framework"),
  Cross-Chapter Box 1.4 ("Scenarios and Pathways used in this report"), Kapitel 4 und Kapitel 7
  (Klimasensitivität/ECS).
- IPCC AR6 Synthesis Report (2023): Summary for Policymakers, sofern dort eigenständige
  Wahrscheinlichkeitsaussagen zu Szenarien gemacht werden.

**Ergänzende/kontextualisierende Quellen (nur für Sensitivitätsanalyse, siehe Abschnitt 6):**
- IPCC AR6 Working Group III, Kapitel 3 (Emissionspfade/NDC-Kompatibilität), sofern dort
  Plausibilitätsaussagen zu SSP5-8.5 gemacht werden.
- Peer-reviewte Sekundärliteratur, die die AR6-Neubewertung explizit diskutiert (z. B. Hausfather &
  Peters 2020, Schwalm et al. 2020, Pielke & Ritchie 2021, Ho et al. 2019). **Entscheidung des Menschen
  (v0.2):** Diese Literatur dient nicht nur der internen Plausibilitätsprüfung, sondern wird als
  **zitierfähiger Bestandteil der Evidenzbasis im finalen Report** behandelt. Sie bleibt dabei weiterhin
  **nicht** Primärquelle für die Klassifikation nach Abschnitt 5.4 – diese basiert ausschließlich auf den
  offiziell verabschiedeten IPCC-WG1-Dokumenten selbst (Abschnitt 5.5, Aussagekraft-Schwelle). Die
  Sekundärliteratur wird gesondert ausgewiesen als externe Einordnung/Validierung der eigenen
  Klassifikation und darf im Report namentlich zitiert werden.

**Kritischer offener Punkt zu "AR7" (siehe auch Abschnitt 12/Rückfragen):** Der 7. Sachstandsbericht
(AR7) befindet sich nach aktuellem öffentlichem Kenntnisstand im laufenden Berichtszyklus; ein
vollständiger WG1-Bericht mit assessierten Wahrscheinlichkeitsbereichen liegt zum Zeitpunkt der
SAP-Erstellung **nicht** vor. Sollte im Analyst-Schritt kein offiziell publiziertes IPCC-Dokument mit
quantitativen Wahrscheinlichkeitsangaben zu AR7 auffindbar sein, ist ausschließlich der Vergleich
AR5 ⟷ AR6 als **primäre** Analyse durchzuführen; etwaige AR7-Scoping-/Verfahrensdokumente (z. B.
genehmigtes AR7-Outline, Panel-Beschlüsse zum Szenario-Rahmen) werden – falls vorhanden – nur als
**gesondert gekennzeichnete, vorläufige Sensitivitätsergänzung** behandelt (Abschnitt 6), niemals
gleichrangig mit einem vollständigen WG1-Assessment.

**Zugriffsdatum:** wird vom analyst-Subagenten beim Extraktionsschritt dokumentiert (Datum je
Dokumentenzugriff, inkl. verwendeter Dokumentversion/-DOI), da dieser SAP vor Dokumentzugriff verfasst
wurde.

**Datenstand laut Quelle:** AR5 (2013/2014), AR6 WG1 (2021), AR6 Synthesis Report (2023); AR7-Status
gemäß Abschnitt oben.

---

## 4. Analysepopulation (hier: Dokumenten-/Evidenzpopulation)

**Anmerkung zur Abweichung vom Template:** Statt einer Stichprobe von Beobachtungseinheiten (z. B.
Länder-Jahre) wird hier die Population der **eingeschlossenen Textstellen/Fundstellen** definiert.

**Einschlusskriterien:**
- Offizielle, von IPCC-Gremien verabschiedete Berichtsteile (SPM, Technical Summary, Kapiteltext,
  Cross-Chapter Boxen) der in Abschnitt 3 genannten Berichte.
- Aussagen, die sich auf die **globale** mittlere Oberflächentemperatur (GSAT/GMST) beziehen – nicht
  regionale oder sektorale Erwärmungsangaben (siehe Ausschluss unten). Dies begrenzt den Scope auf die
  in der öffentlichen Debatte typischerweise zitierte "Erwärmungsbereichs"-Kennzahl.
- Aussagen zum jeweils höchsten vollständig assessierten Emissions-/Konzentrationspfad
  (RCP8.5 bzw. SSP5-8.5) für die drei Zielperioden nahfristig/mittelfristig/langfristig (siehe
  Abschnitt 2), inkl. der jeweils verwendeten Referenzperiode.
- Innerhalb dieser Berichte zitierte Primärliteratur **nur**, soweit sie explizit als methodische
  Grundlage einer Wahrscheinlichkeitsaussage benannt wird (zur Methodeninterpretation, nicht als
  zusätzliche, eigenständige Wahrscheinlichkeitsquelle).

**Ausschlusskriterien:**
- Nicht-IPCC-Sekundärquellen (Nachrichtenartikel, Blogbeiträge, Bundestagsreden, NGO-Publikationen) –
  diese dürfen im Abschnitt "Hintergrund" des späteren Reports als Kontext der Debatte erwähnt werden,
  fließen aber **nicht** in die Klassifikation nach Abschnitt 5.4 ein.
- Nicht offiziell verabschiedete/durchgesickerte AR7-Entwurfstexte (Einhaltung des IPCC-Prozesses und
  wissenschaftlicher Sorgfalt).
- Regionale/sektorale IPCC-Sonderberichte (z. B. SR1.5, SROCC, SRCCL) und WG2/WG3-Kapitel außerhalb der
  in Abschnitt 6 definierten Sensitivitätsanalyse – Begründung: Fokus der Fragestellung liegt auf der
  global assessierten physikalischen Erwärmungsspanne (WG1), nicht auf Folgenabschätzung oder Minderung.
- Reine Zahlenangaben ohne begleitenden Wahrscheinlichkeits-/Herkunftstext (siehe Abschnitt 5.5 –
  führt zu Kategorie "nicht klassifizierbar", nicht zu Ausschluss aus der Ergebnistabelle).

**Baseline-Harmonisierung (zwingend vor Vergleich):** AR5 verwendet für Langfrist-Projektionen primär
die Referenzperiode 1986–2005, AR6 primär 1850–1900. Für den Vergleich werden **ausschließlich von IPCC
selbst publizierte Offset-/Umrechnungswerte** (z. B. aus AR6 Cross-Chapter Box 2.3 oder vergleichbaren
offiziellen Quellen) verwendet, um AR5-Werte auf die 1850–1900-Basis umzurechnen. Eine eigene statistische
Neuberechnung des Offsets ist **nicht zulässig** (Konsistenz mit "keine quantitative Neuberechnung",
siehe Abschnitt 0/5).

---

## 5. Synthese-Methodik (ersetzt "Statistische Methoden")

**Anmerkung zur Abweichung vom Template:** Da keine Primärdaten vorliegen und kein Regressions-/
Zeitreihenmodell geschätzt wird, entfällt die im Master-Template vorgesehene Diagnostik zu
Autokorrelation und Normalität von Residuen – es gibt keine Residuen und keine wiederholten Messungen
an denselben Untersuchungseinheiten. Stattdessen werden hier die für eine **strukturierte
Literatursynthese** relevanten methodischen Analogien definiert (Extraktionsvalidität statt
Modellannahmen, Klassifikationsschema statt Punktschätzer, textuelle Evidenzschwelle statt
Signifikanzniveau). Dies dient demselben Zweck wie die Originalabschnitte: Vorab-Festlegung, damit im
Nachhinein keine für das gewünschte Ergebnis günstigste Interpretation gewählt werden kann.

### 5.1 Primäre Synthesestrategie

Für jede Zielperiode (nahfristig/mittelfristig/langfristig) und jeden Berichtsvergleich (primär:
AR5 ⟷ AR6) werden aus den eingeschlossenen Fundstellen (Abschnitt 4) folgende Elemente **tabellarisch**
extrahiert:

- Bestwert/Median der GSAT-Anomalie für den jeweils höchsten Pfad (harmonisierte Basis 1850–1900)
- "likely"-Bereich (17–83 %), sofern berichtet
- "very likely"-Bereich (5–95 %), sofern berichtet
- Exaktes Zitat jeder qualitativen Aussage zur **Eintrittswahrscheinlichkeit des Emissionspfades selbst**
  (z. B. Formulierungen zu "unwahrscheinlich angesichts aktueller Trends")
- Exaktes Zitat jeder Aussage, die eine Änderung der physikalischen Bandbreite explizit auf
  aktualisierte physikalische Evidenz zurückführt (z. B. ECS-Neubewertung, CMIP6 vs. CMIP5)
- Fundstellenangabe (Bericht, Kapitel/Box, Seite/Abschnittsnummer)

Die Extraktion erfolgt **unabhängig durch zwei Bearbeitungsdurchläufe** (analog Dual-Extraction in
systematischen Reviews, z. B. PRISMA-Prinzip) mit anschließender Diskrepanz-Klärung anhand des
Wortlauts der Quelle – nicht anhand der jeweils "passenderen" Interpretation.

### 5.2 Extraktionsprotokoll und Vergleichbarkeitskriterien

Ein Vergleich zwischen zwei Berichten wird nur dann als **valide/interpretierbar** behandelt, wenn
kumulativ gilt:
1. Gleiche (nach Abschnitt 4 harmonisierte) Referenzperiode,
2. gleiche oder von IPCC selbst amtlich zugeordnete Zielperiode,
3. gleiche, von IPCC selbst dokumentierte Pfad-Korrespondenz (RCP8.5 ⟷ SSP5-8.5), keine eigene
   Zuordnung der Bearbeitenden,
4. Aussagen stammen aus derselben Working Group (WG1/physikalische Wissenschaft) – Aussagen aus WG2/WG3
   werden nicht mit WG1-Wahrscheinlichkeitsangaben vermischt, sondern getrennt ausgewiesen (siehe
   Abschnitt 6).

Sind diese Kriterien für eine bestimmte Zielperiode/Kennzahl nicht erfüllt, wird dies in der
Ergebnistabelle als "nicht vergleichbar" ausgewiesen – **keine** erzwungene Vergleichbarkeit durch
zusätzliche eigene Annahmen.

### 5.3 Umgang mit methodischen Diskontinuitäten zwischen Berichten (ersetzt Autokorrelations-/Normalitätsprüfung)

Folgende Diskontinuitäten werden als eigene, getrennt zu kodierende Dimension der Extraktion erfasst,
da sie potenzielle Fehlinterpretationen des Vergleichs erzeugen können:

- **Modellgenerations-Wechsel:** AR5 basiert überwiegend auf CMIP5-Modellensembles, AR6 auf CMIP6 plus
  "assessed"-Kombination mehrerer Evidenzlinien (nicht reine Modell-Perzentile). Eine Änderung der
  berichteten Bandbreite kann daher (a) auf neue physikalische Erkenntnisse, (b) auf eine veränderte
  *statistische Ableitungsmethode* der Bandbreite selbst oder (c) auf eine veränderte
  Pfad-Wahrscheinlichkeitseinschätzung zurückgehen. Diese drei Ursachen werden **getrennt kodiert**, nicht
  zu einer Gesamtaussage zusammengefasst.
- **Kalibrierte Sprache:** Die IPCC-eigene Unsicherheitsleitlinie (Calibrated Language Guidance Note)
  wird zwischen Berichten konsistent, aber ggf. mit leicht unterschiedlicher zugrunde liegender
  Evidenzbasis verwendet ("likely" ≠ zwingend identische zugrunde liegende Datenbasis über Berichte
  hinweg) – wird als Limitation dokumentiert (Abschnitt 9), nicht durch eigene Neukalibrierung "korrigiert".
- **Working-Group-Konsistenzprüfung:** siehe 5.2, Punkt 4.

### 5.4 Klassifikationsschema (ersetzt Unsicherheitsquantifizierung)

Für jede vergleichbare Zielperiode/Kennzahl (nach 5.2) wird eine der folgenden vier, **vorab und
symmetrisch definierten** Kategorien vergeben. Keine dieser Kategorien wird vorab als wahrscheinlicher
angenommen; die Zuordnung erfolgt ausschließlich anhand der in 5.1 extrahierten Zitate:

- **(A) Wahrscheinlichkeits-Rekalibrierung:** Die physikalische Erwärmungsspanne für den jeweils
  höchsten Pfad ist (im Rahmen der berichteten Unsicherheit) im Wesentlichen unverändert; die
  Veränderung betrifft ausschließlich die assessierte Eintrittswahrscheinlichkeit des zugrunde
  liegenden Emissionspfades, explizit im Quelltext benannt (z. B. Verweis auf aktuelle
  energiewirtschaftliche/politische Entwicklungen).
- **(B) Physische Risiko-Herabstufung:** Die berichtete physikalische Bandbreite für einen
  vergleichbaren Antriebs-/Konzentrationswert selbst hat sich verändert, explizit auf aktualisierte
  physikalische Evidenz zurückgeführt (z. B. engere ECS-Schätzung), unabhängig von einer Aussage zur
  Pfad-Wahrscheinlichkeit.
- **(C) Gemischtes Bild:** Belege für (A) und (B) liegen gleichzeitig für dieselbe Zielperiode vor. In
  diesem Fall sind **beide** Aspekte getrennt zu berichten – keine Verdichtung auf eine einzelne Aussage.
- **(D) Nicht klassifizierbar:** Die Quelllage erlaubt keine eindeutige Zuordnung zu (A), (B) oder (C)
  (z. B. reine Zahlenänderung ohne begleitende Herkunftsaussage im Text).

**Robustheitsmaß:** Als Analogon zur Unsicherheitsquantifizierung wird die **Konkordanz der beiden
unabhängigen Extraktions-/Klassifikationsdurchläufe** (5.1) je Zielperiode berichtet. Zusätzlich wird
als Sensitivitätsprüfung eine "blinde" Re-Klassifikation ohne Kenntnis/Referenz auf die politische
Bundestagsdebatte durchgeführt, um motivierte Urteilsbildung zu vermeiden.

### 5.5 Aussagekraft-Schwelle (ersetzt Signifikanzniveau)

Eine Zuordnung zu Kategorie (A) oder (B) ist **nur zulässig**, wenn mindestens ein wörtlich zitierbarer
Satz aus einem offiziell verabschiedeten IPCC-WG1-Dokument (SPM, Technical Summary oder Kapiteltext)
vorliegt, der explizit die **Ursache** der Veränderung benennt (Pfad-Wahrscheinlichkeit vs. physikalische
Evidenz). Eine bloße numerische Differenz zwischen zwei Berichten reicht **nicht** aus, um (A) oder (B)
zu vergeben – ohne begleitenden Herkunftstext ist zwingend Kategorie (D) zu vergeben. Diese Regel ist
das Äquivalent eines vorab festgelegten Signifikanzniveaus: Sie verhindert, dass eine gewünschte
Interpretation nachträglich in mehrdeutige Zahlen hineingelesen wird.

---

## 6. Sensitivitätsanalysen

Folgende Ergänzungen werden **zusätzlich zur Primäranalyse**, aber **getrennt ausgewiesen** berichtet
(keine Vermischung mit der Primärtabelle nach 5.1–5.4):

1. **WG3-Perspektive:** Aussagen aus AR6 WG3 (insb. Kapitel 3) zur Kompatibilität von SSP5-8.5 mit
   aktuellen nationalen Klimazielen (NDCs) – getrennt ausgewiesen als "Mitigations-/Politik-Perspektive",
   nicht Teil der WG1-Kernklassifikation.
2. **Externe Validierung durch Sekundärliteratur (zitierfähig, Entscheidung v0.2):** Abgleich der
   eigenen Klassifikation (5.4) mit expliziten Einschätzungen in peer-reviewter Kommentarliteratur
   (z. B. Hausfather & Peters 2020, Schwalm et al. 2020, Pielke & Ritchie 2021, Ho et al. 2019). Diese
   Quellen dürfen im finalen Report als eigenständiger, namentlich zitierter Bestandteil der Evidenzbasis
   erscheinen (z. B. "Diese Einordnung deckt sich mit Hausfather & Peters 2020, die..."); sie ersetzen
   jedoch weiterhin **nicht** die WG1-Primärextraktion und dürfen die Klassifikation nach 5.4 nicht
   allein begründen (das bleibt WG1-SPM/TS/Kapiteltext vorbehalten, Abschnitt 5.5).
3. **AR7-Prozessdokumente (falls verfügbar):** Sofern zum Zeitpunkt der Extraktion offiziell publizierte
   IPCC-AR7-Scoping-/Verfahrensdokumente mit quantitativen oder qualitativen Wahrscheinlichkeitsangaben
   vorliegen, werden diese gesondert und ausdrücklich als "vorläufig/prozessual, kein vollständiges
   WG1-Assessment" gekennzeichnet berichtet.
4. **Alternative Baseline-Konversion:** Falls mehr als ein offiziell publizierter Umrechnungsfaktor
   zwischen 1986–2005- und 1850–1900-Basis existiert, wird die Primäranalyse mit dem in AR6 SPM/TS
   genannten Wert durchgeführt; alternative offizielle Werte werden als Sensitivitätsrechnung mit
   ausgewiesen.

---

## 7. Umgang mit Mehrfachtestung / Multiplizität

**Anmerkung zur Abweichung vom Template:** Es werden keine p-Werte erzeugt, daher ist eine klassische
Alpha-Adjustierung (z. B. Bonferroni) nicht anwendbar. Das funktionale Äquivalent zur Vermeidung von
"Ergebnis-Cherry-Picking" ist hier die **vollständige Vorab-Festlegung aller zu berichtenden
Vergleiche**:

- Alle drei Zielperioden (nahfristig, mittelfristig, langfristig) werden **für alle** in Abschnitt 4
  eingeschlossenen Berichtsvergleiche berichtet, unabhängig davon, welches Ergebnis sich zeigt.
- Es wird explizit **kein** selektives Zitieren einzelner Nebensätze aus Kapiteltext erlaubt, die dem
  Gesamtbild der jeweiligen SPM widersprechen; im Zweifel gilt die höchste offizielle
  Aggregationsebene (SPM) als maßgeblich, Kapitel-/Box-Fundstellen dienen der Kontextualisierung, nicht
  der Priorisierung einer bestimmten Lesart.
- Die vier Klassifikationskategorien (A–D, Abschnitt 5.4) werden **für jede** Zielperiode einzeln
  berichtet, auch wenn sich über die Perioden hinweg kein einheitliches Bild ergibt – eine Verdichtung
  auf eine einzige Gesamtaussage im späteren Report ist nur zulässig, wenn alle Perioden dieselbe
  Kategorie ergeben; andernfalls muss der Report die Heterogenität explizit abbilden.

---

## 8. Interpretationsrahmen / Confounder

> **Zentrale, verbindliche Leitplanke für Analyst, Validator und Kommunikation (nicht verhandelbar):**
> **Diese Analyse bezieht KEINE Position in der aktuellen politischen Debatte im Bundestag zum Thema
> Klimaszenarien – weder im Sinne eines "Ende des Betrugs"-Narrativs noch im Sinne einer "Entwarnung".**
> Es handelt sich ausschließlich um eine **methodische Einordnung der Szenario-Wahrscheinlichkeiten und
> ihrer Interpretation in der Fachliteratur**, basierend auf den offiziellen Formulierungen der IPCC-
> Berichte selbst. Weder die Klassifikation (A)/(B)/(C)/(D) noch ein etwaiges Überwiegen einer Kategorie
> darf im Analyst- oder Validator-Schritt oder im späteren Report als Unterstützung oder Widerlegung
> einer politischen Position formuliert werden. Formulierungen wie "Betrug", "Entwarnung", "Alarmismus"
> oder vergleichbare wertende Begriffe aus der politischen Debatte sind im Ergebnisteil des Reports
> **nicht zu verwenden** – ausschließlich die in Abschnitt 5.4 definierten neutralen Kategorienlabels.
>
> **Verbindliche Publikationsvorbedingung (Entscheidung des Menschen, v0.2):** Zusätzlich zur inhaltlichen
> Neutralität ist eine **fachliche Gegenprüfung durch eine klimawissenschaftlich ausgebildete Person**
> zwingende Vorbedingung für die Veröffentlichung dieses Reports – nicht nur ein empfohlener Hinweis.
> Der Report darf **nicht** als abgeschlossen/veröffentlichungsreif behandelt werden, solange diese
> Prüfung nicht stattgefunden hat und ihr Ergebnis nicht dokumentiert ist. Bis dahin ist jede Fassung des
> Reports durchgängig und deutlich sichtbar als **"Entwurf – fachliche Prüfung ausstehend"** zu
> kennzeichnen (Titel/Kopfzeile jeder Ausgabeform, siehe Abschnitt 11). Diese Kennzeichnung entfällt erst,
> wenn die fachliche Gegenprüfung dokumentiert erfolgt und etwaige Korrekturen eingearbeitet sind.

Weitere Punkte des Standard-Interpretationsrahmens, geprüft auf Anwendbarkeit:

- **Produktions- vs. Konsum-Perspektive:** **Nicht anwendbar** – es handelt sich nicht um einen
  Emissionsbilanzierungsvergleich zwischen Ländern, sondern um einen Vergleich publizierter
  Wahrscheinlichkeitsaussagen zu einem globalen Emissionspfad.
- **Regression zur Mitte bei Trendvergleichen:** **Nicht anwendbar** – es werden keine Länder- oder
  Einheiten-Trends mit unterschiedlichem Ausgangsniveau verglichen, sondern zwei diskrete
  Berichtsaussagen zum selben globalen Pfad.
- **Transitivitätsannahme (adaptiert – "Brücken-Vergleichbarkeit"):** Die Vergleichbarkeit von RCP8.5
  (AR5) und SSP5-8.5 (AR6) beruht auf der von IPCC selbst dokumentierten Pfad-Korrespondenz. Sollte sich
  bei der Extraktion zeigen, dass diese beiden Pfade sich in nicht-triviale Weise in ihren Annahmen
  unterscheiden (z. B. Landnutzung, Aerosole, Nicht-CO2-Forcings), die für die Interpretierbarkeit des
  Vergleichs relevant sind, ist dies explizit als Einschränkung der Vergleichbarkeit zu dokumentieren
  (führt ggf. zu Kategorie (D), nicht zu stillschweigender Vergleichbarkeitsannahme).
- **Keine implizite Politik-/Verhaltensbewertung:** Siehe Leitplanke oben – hier zusätzlich konkretisiert:
  Eine unterschiedliche Einschätzung der Pfad-Wahrscheinlichkeit zwischen AR5 und AR6 ist primär auf
  veränderte energiewirtschaftliche/technologische Rahmendaten (z. B. Kohleausbau-Trends, erneuerbare
  Energien) zurückzuführen, wie sie der IPCC selbst benennt – nicht auf eine Bewertung "richtiger" oder
  "falscher" Klimapolitik einzelner Staaten. Dies ist vorab so festzuhalten, unabhängig davon, welches
  Klassifikationsergebnis sich zeigt.

---

## 9. Limitationen

- **Politische Neutralität (Wiederholung der Leitplanke aus Abschnitt 8):** Diese Analyse trifft keine
  Aussage darüber, ob die aktuelle Klimapolitik "zu alarmistisch" oder "zu entspannt" war/ist. Sie
  bewertet ausschließlich die interne Konsistenz und Herkunft publizierter IPCC-Wahrscheinlichkeits-
  aussagen.
- **Keine quantitative Neuberechnung:** Es werden keine eigenen statistischen Modelle geschätzt und
  keine neuen Wahrscheinlichkeiten oder Konfidenzintervalle berechnet. Die Aussagekraft der Synthese ist
  durch die Explizitheit der Originalquellen begrenzt (siehe Aussagekraft-Schwelle, Abschnitt 5.5).
- **Kalibrierte Sprache über Berichte hinweg:** Begriffe wie "likely" oder "very likely" folgen zwar
  derselben IPCC-Leitlinie, können aber auf leicht unterschiedlichen zugrunde liegenden Evidenzbasen
  beruhen (siehe 5.3) – ein direkter Zahlenvergleich kann dadurch eine Scheingenauigkeit suggerieren.
- **AR7-Verfügbarkeit:** Zum Zeitpunkt der SAP-Erstellung liegt kein vollständiger AR7-WG1-Bericht vor;
  ein vollwertiger AR6-AR7-Vergleich ist ggf. nicht möglich (siehe Abschnitt 3/6 und offene Rückfrage
  unten).
- **Fachliche Grenzen der Extraktion / verbindliche Vorbedingung (v0.2):** Die SAP-Erstellung und
  Extraktion erfolgen nicht durch ausgebildete Klimawissenschaftler:innen; technische Aussagen zu
  ECS/CMIP6-Methodik müssen im Validator-Schritt durch fachkundige Prüfung gegengelesen werden. Über die
  Validator-Prüfung hinaus ist – wie in Abschnitt 8 als Leitplanke festgehalten – eine **gesonderte
  fachliche Gegenprüfung durch eine klimawissenschaftlich ausgebildete Person zwingende Vorbedingung für
  die Veröffentlichung**. Ohne diese Prüfung bleibt der Report dauerhaft im Status "Entwurf – fachliche
  Prüfung ausstehend" (Abschnitt 11).
- **Scope-Begrenzung auf globale GSAT-Werte:** Regionale oder sektorale Erwärmungs-/Risikoangaben sind
  explizit ausgeschlossen (Abschnitt 4) und dürfen im Report nicht implizit als "die" IPCC-Position zu
  regionalen Risiken dargestellt werden.

---

## 10. Software

**Anmerkung zur Abweichung vom Template:** Da keine statistische Modellierung stattfindet, wird R hier
ausschließlich zur **tabellarischen Aufbereitung und rein deskriptiven Visualisierung** der extrahierten,
publizierten Werte eingesetzt (z. B. Balken zur Darstellung überlappender "likely"-Bereiche je Bericht),
nicht zur Schätzung neuer statistischer Größen.

- R-Version: gemäß Projekt-Standard, vom analyst-Subagenten im Skriptkopf zu dokumentieren.
- Pakete: nur Basis-/Tabellen-/Grafikpakete (z. B. `ggplot2`, `dplyr`), keine Inferenzpakete.
- Skript-Dateiname: `ipcc-rcp85-abkehr.R` im Ordner `Analysen/2026-08-ipcc-rcp85-abkehr/`.
- **Zwingende Zusatzanforderung (Reproduzierbarkeit einer Literatursynthese):** Ein strukturiertes
  Extraktionsprotokoll (z. B. CSV/Tabelle) mit je einer Zeile pro Fundstelle
  (Bericht, Kapitel/Box, Seite/Abschnitt, Zugriffsdatum, exaktes Zitat, extrahierter Wert,
  Klassifikationskategorie) ist verpflichtend abzulegen, da Reproduzierbarkeit hier nicht durch
  Code-Rerun, sondern durch Nachvollziehbarkeit der Fundstellen hergestellt wird.

---

## 11. Reporting

- **Darstellung:** Eine strukturierte Vergleichstabelle je Zielperiode mit den Spalten: Metrik,
  AR5-Wert (harmonisiert), AR6-Wert, AR7-Status (falls vorhanden), Vergleichbarkeit (ja/nein, Begründung),
  Klassifikation (A/B/C/D), Beleg-Zitat mit Fundstelle. Ergänzend optional eine rein deskriptive Grafik
  mit überlappenden "likely"-Bereichsbalken je Bericht (keine neu geschätzten Unsicherheitsbänder).
- **Rundung/Werttreue:** Zahlenwerte werden exakt in der im Original berichteten Präzision übernommen
  (keine zusätzliche Rundung oder Neuberechnung über das Original hinaus).
- **Sprachregelung:** Im Ergebnistext werden ausschließlich die neutralen Kategorienlabels (A)–(D)
  verwendet; jede Aussage im Fließtext muss mit Bericht, Kapitel/Box und Seite belegt sein. Der Report
  muss – unabhängig vom Ergebnisüberhang – **beide** Kategorien "Risiko-Herabstufung" und
  "Wahrscheinlichkeits-Rekalibrierung" mit ihrer jeweiligen Beleglage benennen; eine Verkürzung auf ein
  einziges Narrativ in Überschrift oder Fazit ist unzulässig.
- **Pflicht-Disclaimer:** Der finale Report muss den Neutralitätshinweis aus Abschnitt 8 (politische
  Nichtpositionierung) wörtlich oder sinngemäß als Disclaimer wiederholen.
- **Sekundärliteratur im Report (Entscheidung v0.2):** Die in Abschnitt 3/6 genannte peer-reviewte
  Sekundärliteratur (z. B. Hausfather & Peters 2020) darf als eigenständiger, namentlich zitierter
  Abschnitt "Einordnung in der Fachliteratur" im Report erscheinen, getrennt von der WG1-Primärtabelle
  ausgewiesen und nicht mit dieser vermischt.
- **Kennzeichnungspflicht "Entwurf – fachliche Prüfung ausstehend" (verbindlich, v0.2):** Jede Fassung
  des Reports (Rohentwurf, Review-Fassung, jede spätere Kommunikationsableitung z. B. Substack/LinkedIn)
  muss, solange die in Abschnitt 8/9 verbindlich vorausgesetzte fachliche Gegenprüfung durch eine
  klimawissenschaftlich ausgebildete Person nicht dokumentiert vorliegt, deutlich sichtbar (Titel oder
  Kopfzeile) als **"Entwurf – fachliche Prüfung ausstehend"** gekennzeichnet sein. Diese Kennzeichnung
  darf nicht kommentarlos entfernt werden; ihre Entfernung setzt eine dokumentierte, abgeschlossene
  fachliche Prüfung voraus.

---

## 12. Offene Rückfragen an den Menschen (vor Einfrieren zu klären)

1. ~~**AR7-Bezug klären**~~ — **Entschieden (v0.2):** AR5 ⟷ AR6 ist der primäre, durchzuführende
   Vergleich. AR7-Prozessdokumente werden ausschließlich als gesondert gekennzeichnete, vorläufige
   Sensitivitätsergänzung behandelt (Abschnitt 3/6), niemals gleichrangig mit einem vollständigen
   WG1-Assessment.
2. ~~**Umfang Sekundärliteratur**~~ — **Entschieden (v0.2):** Die Sekundärliteratur (z. B. Hausfather &
   Peters 2020) wird zitierfähiger Bestandteil der Evidenzbasis im finalen Report (Abschnitt 3/6/11),
   bleibt aber ohne Einfluss auf die WG1-Kernklassifikation nach 5.4/5.5.
3. ~~**Fachliche Prüfung sicherstellen**~~ — **Entschieden (v0.2):** Eine fachliche Gegenprüfung durch
   eine klimawissenschaftlich ausgebildete Person ist verbindliche Vorbedingung für die Veröffentlichung
   (Abschnitt 8/9). Bis zu deren dokumentiertem Abschluss trägt jede Report-Fassung die Kennzeichnung
   "Entwurf – fachliche Prüfung ausstehend" (Abschnitt 11).
4. ~~**Einfrieren**~~ — **Entschieden:** Freigegeben am 28.08.2026 durch dsaure55. Status ab sofort
   `final`, Version 1.0 (siehe Kopf des Dokuments und Änderungshistorie). Der analyst-Subagent darf ab
   dieser Version mit der Dokumentenextraktion beginnen.
