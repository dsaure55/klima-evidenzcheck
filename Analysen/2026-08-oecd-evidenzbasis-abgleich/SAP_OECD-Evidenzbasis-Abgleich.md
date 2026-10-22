# Statistischer Analyseplan (SAP)

**Titel:** OECD-Evidenzbasis-Abgleich — (1) Internationales Ranking Deutschlands
bei Carbon-Pricing-Stringenz (OECD CPEN) und (2) Konsistenz des deutschen
Emissions-Reduktionstempos mit der OECD/IFCMA-Meta-Analyse-Erwartung

**Version:** 0.1 (Entwurf, prospektiv erstellt — vor jeglichem Datenzugriff)
**Datum:** 2026-09-14
**Status:** draft
**Autor:in / Freigabe:** _________________________ Datum: __________

---

## 0. Status dieser Analyse

Dieser SAP wurde **prospektiv** verfasst: Es wurden vor Erstellung dieses Dokuments
keine Rohdaten der OECD Carbon Pricing and Energy Taxation Database (CPEN) und
keine Rohdaten/Zahlen des OECD/IFCMA-Reports gesichtet, und es wurde kein Code
geschrieben. Diesem SAP wurden vom auftraggebenden Kontext **keine** Analyseergebnisse,
Zahlen oder Grafiken mitgeliefert. Der Status bleibt dennoch `draft`, bis ein Mensch
das Dokument vollständig liest, ggf. Rückfragen (siehe Abschnitt 11) beantwortet
und den SAP ausdrücklich einfriert (Status `draft` → `final`, mit Versionsnummer,
Datum und Namenseintrag im Freigabefeld). Vor diesem Einfrieren darf keine Analyse
in R begonnen werden.

**Zentrale Struktur-Regel dieses SAP:** Er enthält **zwei strikt getrennte
Estimands** mit unterschiedlichen Primärquellen, unterschiedlicher Aussagekraft und
unterschiedlichen Limitationen. Sie werden in getrennten Teilen (Teil A / Teil B)
mit jeweils eigenem Abschnitt zu Datenquelle, Methode und Limitationen behandelt.
Ergebnisse aus Teil A und Teil B dürfen **nicht** zu einer gemeinsamen Aussage
verschmolzen werden (siehe Abschnitt 6 und 8).

**Wichtiger Sonderhinweis zu Teil B (Estimand 2):** Teil B verwendet als
Vergleichsgröße für Deutschlands Reduktionstempo NICHT neu berechnete Daten,
sondern zitiert Ergebnisse aus der bereits vorliegenden Analyse
`Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md`. Diese
referenzierte Analyse kennzeichnet sich in ihrem eigenen Abschnitt 0 **explizit
als exploratorisch, nicht präregistriert-konfirmatorisch** (sie wurde nach einer
informellen explorativen Pilotsichtung erstellt; es liegt kein Validierungsbericht
und kein ausgefüllter Freigabevermerk zu dieser Datei vor). Die Wiederverwendung
dieser Ergebnisse als Kontext in Teil B **ändert nichts an diesem Status**. Dieser
Hinweis wird in Abschnitt 3.2 (Datenquelle Teil B) erneut und ausführlich platziert,
nicht nur hier und in Abschnitt 8.

---

## 1. Hintergrund / Rationale (übergreifend)

Öffentliche Kommunikation zu deutscher Klimapolitik bezieht sich zunehmend auf
OECD-Evidenz aus zwei unterschiedlichen Quellen: (a) der OECD Carbon Pricing and
Energy Taxation Database (CPEN), die für über 71 Länder die "Effective Carbon
Rates" (ECR) als Maß für die Stringenz der CO2-Bepreisung vergleichbar macht, und
(b) einer OECD/IFCMA-Meta-Analyse von ca. 190 ex-post-empirischen Studien zur
Wirksamkeit von Klimapolitikinstrumenten, öffentlich beworben u. a. über eine
LinkedIn-Ankündigung (Kurzlink brnw.ch/21x5D02), die einen medianen jährlichen
Emissionsrückgang von ca. 5 % bei wirksamer Politik berichtet, mit den stärksten
Effekten bei "economic instruments" (Steuern, Emissionshandel).

Für Journalismus, NGO-Arbeit und Politikberatung ist relevant, (1) wo Deutschland
im internationalen Vergleich der Carbon-Pricing-Stringenz steht, und (2) ob das
beobachtete deutsche Emissions-Reduktionstempo im Lichte dieser Meta-Evidenz als
plausibel im erwarteten Bereich liegend eingeordnet werden kann. Beide Fragen
werden häufig in derselben Kommunikation nebeneinander genannt, sind aber
methodisch und datenseitig vollständig unabhängig voneinander — daher die
strikte Trennung in diesem SAP.

---

## Teil A — Estimand 1: Internationales Ranking der Carbon-Pricing-Stringenz

### 2.1 Fragestellung (Estimand 1)

**Primärfrage:** An welcher Rangposition bzw. welchem Perzentil steht Deutschland
im internationalen Vergleich der "Effective Carbon Rate" (ECR) gemäß OECD CPEN,
für die vorab festgelegten Jahre (siehe 2.3), sowohl gesamtwirtschaftlich
(alle Sektoren) als auch — soweit die Datenbank dies einheitlich für die
Ländergruppe hergibt — sektoral differenziert?

**Operationalisierung (verbindlich, vor Datenzugriff festgelegt):**

- **Indikator (primär):** Die von der OECD in den CPEN-Vergleichstabellen als
  Hauptindikator publizierte "Effective Carbon Rate" (ECR) — die Summe aus
  expliziten CO2-Steuern, Preisen aus Emissionshandelssystemen (ETS) und
  energiebezogenen Verbrauchsteuern auf CO2-Emissionen aus Energienutzung —, in
  EUR pro Tonne CO2 bzw. der von der OECD standardmäßig ausgewiesenen
  Vergleichswährung/-einheit. Falls die Datenbank zusätzlich eine um
  fossile Subventionen bereinigte Variante ("Net Effective Carbon Rate" nach
  Subventionsabzug) als separate Zeitreihe ausweist, gilt dies als
  Sensitivitätsanalyse (siehe 2.5), nicht als Primäranalyse.
- **Rangdefinition:** Rang 1 = höchster ECR-Wert (strengste Bepreisung) unter
  allen in der jeweiligen Jahresausgabe der CPEN-Vergleichstabelle enthaltenen
  Ländern/Volkswirtschaften (Stand CPEN: aktuell ca. 71–72 Länder; kein manueller
  Ausschluss einzelner Länder aus der von der OECD gelieferten Vergleichsgruppe).
- **Perzentil-Formel:** Perzentil(Deutschland) = 100 × (N − Rang) / (N − 1), mit
  N = Anzahl der Länder in der jeweiligen Jahrestabelle. Diese Formel wird
  einheitlich für alle Jahre, Sektoren und die Gesamtwirtschaftsebene verwendet.

### 2.2 Datenquelle (Teil A)

- **Primärquelle:** OECD Carbon Pricing and Energy Taxation Database (CPEN),
  Indikator "Effective Carbon Rates", öffentlich zugänglich über die OECD
  (oecd.org/tax/tax-policy/carbon-pricing.htm bzw. OECD.Stat/OECD Data Explorer).
  Zugriffsdatum und exakte Publikationsversion/Datenstand der CPEN-Ausgabe werden
  bei Datenzugriff dokumentiert (Pflichtangabe im Analyseskript-Header).
- **Sekundärquelle (Fallback/Kreuzprüfung, gemäß Projektstandard):** Our World in
  Data (OWID), sofern dort vergleichbare Carbon-Pricing-Kennzahlen vorliegen.
  OWID dient ausschließlich der Plausibilisierung und wird nur herangezogen, wenn
  ein dokumentiertes Zugriffsproblem auf die OECD-CPEN-Primärquelle vorliegt
  (z. B. Datenbank nicht erreichbar, Tabellenstruktur zum Zugriffszeitpunkt
  fehlerhaft). Bei Abweichung zwischen OECD-CPEN und OWID hat die OECD-CPEN-
  Primärquelle immer Vorrang; eine Abweichung wird im Ergebnisbericht dokumentiert,
  nicht stillschweigend durch die OWID-Zahl ersetzt.

### 2.3 Analysepopulation (Teil A)

- **Länder:** Alle Länder/Volkswirtschaften, die in der jeweiligen
  CPEN-Jahresvergleichstabelle enthalten sind. Kein Ausschluss einzelner Länder.
- **Jahre (verbindlich vorab festgelegt, kein Cherry-Picking nach Sichtung):**
  - Primär: **2018 und 2021** (fest, unabhängig vom Ergebnis für Deutschland).
  - Zusätzlich als Sensitivitätsjahr: das **jüngste in der zum Zugriffszeitpunkt
    abrufbaren CPEN-Version verfügbare Jahr mit vollständiger Länderabdeckung**
    (definiert als: mindestens 90 % der im Jahr 2018 in der Vergleichstabelle
    enthaltenen Länder sind auch in diesem jüngeren Jahr mit einem ECR-Wert
    vertreten). Diese Verfügbarkeitsprüfung wird vor jeder inhaltlichen Sichtung
    von Deutschlands Position dokumentiert (Datenverfügbarkeits-Log im
    Analyseskript), damit die Jahresauswahl nicht nachträglich nach güns­tigstem
    Ergebnis für Deutschland erfolgen kann. Die Regel selbst — nicht die Wahl des
    Jahres — ist hiermit vorab festgelegt.
- **Aggregationsebenen (beide sind Teil der Primäranalyse, nicht nur Sensitivität,
  gemäß Auftrag "nicht nur ein aggregierter Gesamtwert"):**
  1. Gesamtwirtschaftliche ECR (alle Sektoren zusammengefasst) — ein Rang/Perzentil
     pro Jahr.
  2. Sektorale ECR-Ranglisten für alle Sektoren, die die CPEN-Datenbank
     **einheitlich für die gesamte Ländergruppe** ausweist (erwartungsgemäß u. a.
     Straßenverkehr, sonstiger Verkehr, Industrie, Strom/Elektrizität,
     Gebäude/Haushalte & Gewerbe, Landwirtschaft/Fischerei — die exakte, zum
     Zugriffszeitpunkt tatsächlich verfügbare Sektorliste wird vollständig
     dokumentiert und **vollständig berichtet**, nicht selektiv nach für
     Deutschland günstigen Sektoren ausgewählt).

### 2.4 Statistische Methoden (Teil A)

Estimand 1 ist **ausschließlich deskriptiv** (Positionsmaße: Rang, Perzentil).
Es wird **kein Signifikanztest und kein Regressions- oder Zeitreihenmodell**
geschätzt.

**Diagnostik-Plan (explizite Begründung, warum Autokorrelation/Normalität hier
nicht anwendbar sind — bewusste methodische Entscheidung, keine Auslassung):**
Da es sich um Querschnittsdaten einzelner Jahre handelt und kein Zeitreihen- oder
Regressionsmodell geschätzt wird, ist ein Autokorrelationstest (z. B.
Durbin-Watson) hier konzeptionell nicht anwendbar. Als deskriptive Einordnung
wird lediglich die Verteilungsform der ECR-Werte über alle Länder eines Jahres
(Histogramm, Schiefe-Maß) berichtet, um Deutschlands Position im Kontext der
Gesamtverteilung sichtbar zu machen — dies dient ausschließlich der
Visualisierung, nicht einer Signifikanzaussage. Ein formaler
Normalitätstest (z. B. Shapiro-Wilk) wird nicht durchgeführt, da für
Rang-/Perzentilstatistiken keine Normalverteilungsannahme erforderlich ist.

### 2.5 Sensitivitätsanalysen (Teil A)

1. Zusätzliches jüngstes verfügbares Jahr (siehe 2.3) neben den festen
   Primärjahren 2018/2021 — wird gleichrangig neben den Primärjahren berichtet,
   nicht als Ersatz.
2. Falls die CPEN-Datenbank eine subventionsbereinigte "Net Effective Carbon
   Rate" als separate Zeitreihe ausweist: Ranking auf dieser Basis als
   Sensitivitätsanalyse zur primären ECR-Definition.
3. Alle Sektor-Ranglisten (2.3, Punkt 2) werden vollständig nebeneinander
   berichtet — keine Auswahl eines "repräsentativen" Sektors.

### 2.6 Limitationen (Teil A)

- Internationale Vergleichbarkeit von Carbon-Pricing-Indikatoren ist durch
  unterschiedliche nationale Steuersysteme, Ausnahmeregelungen und
  Wechselkurseffekte eingeschränkt; die OECD-Methodik reduziert, beseitigt diese
  Einschränkung aber nicht vollständig.
- Ein hoher Rang/Perzentil bei der ECR ist ein Maß für die **Stringenz der
  Bepreisung**, nicht automatisch für die **Wirksamkeit** der Klimapolitik eines
  Landes insgesamt (siehe auch Abschnitt 8, Punkt 2 zur Kausalitäts-Abgrenzung).
- Sektorale Abdeckung und Datenverfügbarkeit können zwischen Ländern variieren;
  fehlende Werte für einzelne Länder/Sektoren werden dokumentiert, nicht durch
  Schätzungen ersetzt.
- OWID als Sekundärquelle deckt vermutlich nicht dieselbe methodische Tiefe
  (Sektordifferenzierung, ETS-Komponenten) ab wie CPEN und ist daher nur als
  grobe Plausibilisierung geeignet, nicht als gleichwertiger Ersatz.

---

## Teil B — Estimand 2: Konsistenz des deutschen Emissions-Reduktionstempos mit der OECD/IFCMA-Erwartung

### 3.1 Fragestellung (Estimand 2)

**Primärfrage:** Liegt das für Deutschland in der bereits vorliegenden Analyse
`Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md` ermittelte
Reduktionstempo — umgerechnet in eine mittlere jährliche prozentuale
Änderungsrate — unterhalb, innerhalb oder oberhalb des in der OECD/IFCMA-
Meta-Analyse berichteten Medianwerts von ca. 5 % jährlichem Rückgang für als
"wirksam" eingestufte Politikpakete?

**Ausdrücklich KEINE Neuberechnung:** Für Deutschlands tatsächliches
Reduktionstempo wird in dieser Analyse **nichts neu berechnet**. Es werden
ausschließlich die bereits vorliegenden Steigungskoeffizienten (Fenster A:
1990–2025, Fenster B: 2015–2025; Fenster C: 2020–2025 rein deskriptiv) aus der
genannten Analyse **zitiert und in eine prozentuale Rate umgerechnet** (siehe
3.4). Es wird kein neues Regressionsmodell auf den UBA-Emissionsdaten geschätzt.

### 3.2 Datenquelle (Teil B)

**Primärquelle für den Erwartungswert:** OECD/IFCMA-Meta-Analyse (ca. 190
ex-post-empirische Studien), öffentlich zugänglicher Report, angekündigt via
LinkedIn (Kurzlink brnw.ch/21x5D02). Da es sich um einen verkürzten
Tracking-Link handelt, ist dieser **keine zitierfähige Dauerquelle**: Bei
Datenzugriff ist verbindlich der offizielle OECD-Publikationstitel, das
Publikationsdatum und eine dauerhafte OECD-Kennung (z. B. DOI oder
oecd.org-Permalink) zu ermitteln und im Analyseskript zu dokumentieren, bevor der
Report inhaltlich verwendet wird. Lässt sich der Report über den Kurzlink nicht
mehr auffinden, gilt dies als dokumentiertes Primärquellen-Zugriffsproblem; eine
OWID-Entsprechung existiert für diese spezifische Meta-Analyse nicht, sodass in
diesem Fall keine Substitution möglich ist, sondern das Fehlen im Bericht
transparent zu machen ist (siehe 3.6).

> **Zwingender Status-Hinweis zur Kontextquelle (nicht nur in Abschnitt 8,
> sondern hier direkt an der Quellenbeschreibung):** Die als Vergleichsgröße für
> Deutschlands Reduktionstempo herangezogene Analyse
> `Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md` ist
> **selbst als exploratorisch und NICHT präregistriert-konfirmatorisch
> gekennzeichnet** (siehe deren Abschnitt 0: erstellt nach einer informellen
> explorativen Pilotsichtung von drei Zeitfenstern). Für diese Datei liegt
> weder ein Validierungsbericht noch ein ausgefüllter Freigabevermerk vor. Jede
> Zahl aus dieser Quelle, die in Teil B dieser Analyse verwendet wird, ist
> **entsprechend als "Kontextwert aus einer explorativen, nicht präregistrierten
> Vorgängeranalyse" zu kennzeichnen** — in jeder Tabelle, jeder Grafikbeschriftung
> und jedem Fließtext-Satz, der diese Zahl nennt, nicht nur einmalig im
> Limitationsabschnitt. Diese Kennzeichnung ist ausdrücklich **keine** nachträgliche
> Neubewertung oder Aufwertung der alten Analyse — deren Status bleibt unverändert
> exploratorisch — sondern eine neue, eigenständige Fragestellung, die die alten
> Ergebnisse lediglich als Kontext zitiert (siehe auch Abschnitt 8, Punkt 4).
- **Sekundärquelle (Fallback/Kreuzprüfung, gemäß Projektstandard):** Our World in
  Data (OWID) kommt in Teil B ausschließlich als Fallback zur Plausibilisierung
  der zugrunde liegenden deutschen Emissionsreihe in Betracht (nicht als Ersatz
  für den IFCMA-Report selbst, für den keine OWID-Entsprechung existiert), und
  auch dort nur bei dokumentiertem Zugriffsproblem auf die UBA-Primärdaten der
  referenzierten Analyse.

### 3.3 Analysepopulation (Teil B)

- **Deutschland-Seite:** Wie in der referenzierten Analyse festgelegt — Fenster A
  (1990–2025, n=36), Fenster B (2015–2025, n=11), Fenster C (2020–2025, n=6,
  rein deskriptiv). Keine eigene Neudefinition der Zeitfenster in diesem SAP.
- **IFCMA-Seite:** Der berichtete Median (~5 % p. a.) über ca. 190 Studien. Es
  wird dokumentiert, welche Streuungs-/Bandbreitenangabe (z. B. Interquartilsabstand,
  Range) der Report zusätzlich zum Median ausweist, sofern verfügbar, sowie die
  im Report selbst berichtete regionale Verteilung der Studienbasis (laut OECD-
  Angabe ca. 70 % Nordamerika/Europa, ca. 5 % Afrika/Ozeanien) und die
  Aufschlüsselung nach Instrumententyp (u. a. "economic instruments" als Kategorie
  mit den stärksten berichteten Effekten).

### 3.4 Statistische Methoden (Teil B)

**Umrechnung des Deutschland-Trends in eine jährliche Prozentrate (primär):**
Für Fenster A und Fenster B wird die bereits vorliegende OLS-Steigung b
(Mt CO2-Äq. pro Jahr, ggf. HAC-korrigiert gemäß der referenzierten Analyse) in
eine mittlere jährliche prozentuale Änderungsrate umgerechnet als:

  Rate (% p. a.) = (b / Mittelwert der Emissionen im jeweiligen Fenster) × 100

Fenster C wird, wie in der referenzierten Analyse festgelegt, nur deskriptiv
nachrichtlich mitgeführt (n=6, keine Inferenz).

**Gegenüberstellung mit dem IFCMA-Median:** Es handelt sich um eine
**deskriptive Gegenüberstellung, keinen formalen statistischen Test** (kein
H0/H1, kein p-Wert für "Konsistenz"), da die beiden Vergleichsgrößen aus
methodisch heterogenen Quellen mit unterschiedlicher Fehlerstruktur stammen
(einzelnes Land mit Zeitreihen-Konfidenzintervall vs. Median einer heterogenen
Studienstichprobe ohne gemeinsame Stichprobenverteilung) und daher kein valider
Zwei-Stichproben-Test konstruierbar ist. Berichtet wird, ob der Punktschätzer
(und, soweit aus der referenzierten Analyse verfügbar, das 95 %-Konfidenz- bzw.
Prognoseintervall) für Deutschland unterhalb, innerhalb oder oberhalb des
IFCMA-Medianwerts (ggf. dessen berichteter Bandbreite) liegt — getrennt für
Fenster A und Fenster B, beide gleichrangig berichtet.

**Diagnostik-Plan:** In Teil B werden **keine neuen Diagnosen** durchgeführt.
Die in der referenzierten Analyse bereits vorab festgelegten und (laut deren
eigenem SAP) durchgeführten Prüfungen — Durbin-Watson-Test und ACF der Residuen
für Autokorrelation, Shapiro-Wilk-Test für Normalität, ggf. Newey-West-HAC-
Korrektur — werden **unverändert übernommen und referenziert**, nicht wiederholt.
Da die Ursprungsanalyse selbst exploratorisch ist, tragen auch deren Diagnose-
Ergebnisse **keine präregistriert-konfirmatorische Aussagekraft**; dieser SAP
verändert das nicht.

### 3.5 Sensitivitätsanalysen (Teil B)

1. Gegenüberstellung sowohl für Fenster A als auch Fenster B (beide werden
   berichtet, keine Auswahl des für die "Konsistenz"-Aussage günstigeren
   Fensters). Fenster C wird nur nachrichtlich ergänzt.
2. Alternative Umrechnungsformel als Sensitivität zur primären Formel (3.4):
   Endpunkt-zu-Endpunkt-CAGR auf Basis der tatsächlichen (nicht modellierten)
   Emissionswerte am Anfang und Ende des jeweiligen Fensters, als zusätzliche
   deskriptive Kontrollgröße, nicht als Ersatz für die primäre Formel.
3. Falls der IFCMA-Report eine Aufschlüsselung nach Instrumententyp
   ("economic instruments" vs. andere) mit separaten Medianwerten ausweist: Der
   spezifische Median für "economic instruments" wird zusätzlich zum
   Gesamtmedian berichtet (rein deskriptiv, siehe Abgrenzung Abschnitt 8, Punkt 2 —
   dies impliziert keine Aussage, dass Deutschlands Politikmix überwiegend dieser
   Kategorie zuzuordnen ist).

### 3.6 Limitationen (Teil B)

- Die Vergleichsgröße für Deutschland stammt aus einer explorativen, nicht
  präregistrierten Analyse (siehe Status-Hinweis in 3.2); alle darauf basierenden
  Aussagen in Teil B erben diese Einschränkung.
- Kein formaler statistischer Test möglich (siehe 3.4); die Einordnung
  "unterhalb/innerhalb/oberhalb" ist eine deskriptive Heuristik, kein
  Signifikanzergebnis.
- Die IFCMA-Studienbasis ist regional stark ungleich verteilt (siehe 3.3 und
  Abschnitt 8, Punkt 1) — der 5 %-Median ist daher nicht ohne Weiteres auf
  Deutschland übertragbar.
- Keine Kausalaussage zu Carbon Pricing als alleinigem Treiber des deutschen
  Trends (siehe Abschnitt 8, Punkt 2).
- Der zitierte Kurzlink (brnw.ch/21x5D02) ist keine dauerhaft stabile Quelle;
  falls zum Zugriffszeitpunkt nicht mehr auflösbar, ist dies explizit im
  Analysebericht zu vermerken (siehe 3.2).

---

## 4. Umgang mit Mehrfachtestung / Multiplizität (übergreifend)

- **Teil A** enthält keine Signifikanztests; eine klassische Alpha-Adjustierung
  ist daher nicht einschlägig. Stattdessen gilt ein **Vollständigkeits-Gebot**:
  Alle vorab festgelegten Jahre (2018, 2021, plus Sensitivitätsjahr) und alle
  verfügbaren Sektor-Ranglisten werden **vollständig und unkommentiert
  nebeneinander** berichtet. Keine Auswahl des für Deutschland günstigsten Jahres
  oder Sektors für die Kommunikation.
- **Teil B** enthält ebenfalls keinen formalen Signifikanztest; auch hier gilt
  das Vollständigkeits-Gebot der referenzierten Analyse (Fenster A und B werden
  beide berichtet, Fenster C nachrichtlich) — konsistent mit deren eigenem
  Multiplizitäts-Statement.
- **Übergreifend (Teil A und Teil B zusammen):** Die Ergebnisse aus Teil A
  (Ranking-Position) und Teil B (Trend-Konsistenz-Einordnung) werden **nicht zu
  einer einzigen zusammengesetzten Kennzahl oder Schlussfolgerung verschmolzen**
  (z. B. keine Aussage der Form "Deutschland rangiert bei X UND reduziert im
  erwarteten Tempo, daher …"). Beide Estimands beantworten unterschiedliche
  Fragen mit unterschiedlicher Evidenzbasis und werden im Reporting als zwei
  getrennte, klar überschriebene Blöcke dargestellt (siehe Abschnitt 10).

## 5. Übergreifende Limitationen

- Beide Teilanalysen basieren auf öffentlich zugänglichen OECD-Sekundärquellen;
  eine unabhängige Reproduktion der zugrunde liegenden OECD-Rohdatenerhebung ist
  nicht Teil dieses Projekts.
- Sprach-/Übersetzungs- und Kategorisierungsunterschiede zwischen OECD-Quellen
  (z. B. Sektorabgrenzungen in CPEN vs. Politik-Kategorien in der IFCMA-
  Meta-Analyse) können die Vergleichbarkeit einzelner Detailaussagen einschränken.
- Our World in Data wird projektweit als Sekundär-/Fallback-Quelle mitgedacht,
  hat aber in beiden Teilen ausdrücklich **nachrangigen** Status gegenüber den
  OECD-Primärquellen.

## 6. Interpretationsrahmen (zwingende Zusatzpunkte)

Diese vier Punkte sind bei jeder Verwendung von Ergebnissen aus diesem SAP in
Berichten, Grafiken oder Kommunikationsentwürfen **explizit und nicht nur als
Randbemerkung** zu übernehmen:

1. **Der 5 %-Median ist kein hartes Ziel oder Normwert.** Die IFCMA-Studienbasis
   ist laut OECD-eigener Angabe regional stark ungleich verteilt (ca. 70 % der
   Studien aus Nordamerika/Europa, nur ca. 5 % aus Afrika/Ozeanien), und die
   Autoren betonen selbst hohe Heterogenität je nach Politikdesign und Kontext.
   Jede Gegenüberstellung mit Deutschland ist entsprechend relativierend zu
   kommunizieren, nicht als Erfüllung/Verfehlung einer Norm.
2. **Keine Kausalaussage.** Diese Analyse behauptet nicht, dass Carbon Pricing
   allein Deutschlands Emissionstrend erklärt. Deutschland verfolgt ein Bündel an
   Politikinstrumenten (u. a. EEG, Kohleausstieg, Gebäudeenergiegesetz), nicht
   nur Carbon Pricing. Teil A (Ranking) und Teil B (Trend-Einordnung) ordnen ein,
   behaupten aber keinen kausalen Zusammenhang zwischen der Rangposition aus
   Teil A und dem Reduktionstempo aus Teil B.
3. **Keine politische Bewertung der Bundesregierung.** Weder Teil A noch Teil B
   enthalten eine wertende Aussage über die Angemessenheit oder Qualität der
   Klimapolitik der Bundesregierung; es werden ausschließlich deskriptive
   Positions- und Trendgrößen berichtet.
4. **Die Wiederverwendung der 2040-Trendprojektions-Ergebnisse als Kontext in
   Teil B ändert nichts an deren Status.** Die referenzierte Analyse bleibt
   exploratorisch und nicht präregistriert-konfirmatorisch. Diese Verwendung ist
   **keine nachträgliche Neuinterpretation oder Aufwertung** jener alten Analyse,
   sondern eine neue, eigenständige Fragestellung (Konsistenz mit OECD/IFCMA-
   Erwartung), die die alten Ergebnisse lediglich als Kontext zitiert.

## 7. Software

- R (Version wird im Skript-Header dokumentiert, sobald der SAP eingefroren und
  die Analyse begonnen wird)
- Voraussichtliche Pakete: Werkzeuge zum Einlesen von OECD-Tabellen (z. B.
  readxl/readr), dplyr für Ranking-Berechnungen, ggplot2 für Grafiken — endgültige
  Paketwahl obliegt dem analyst-Subagenten bei Implementierung, exakt gemäß den
  hier festgelegten Methoden (kein methodischer Spielraum).
- Skriptname (vorgeschlagen, final bei Implementierung): 
  `OECD-Evidenzbasis-Abgleich.R`

## 8. Reporting-Plan

- Ergebnisdarstellung strikt getrennt in **zwei Blöcke mit eigener Überschrift**,
  jeweils mit Statuskennzeichnung:
  - **Block 1 — Estimand 1 (Ranking):** eine Tabelle mit Deutschlands Rang/
    Perzentil je Jahr (2018, 2021, Sensitivitätsjahr) und je Aggregationsebene
    (gesamtwirtschaftlich + alle verfügbaren Sektoren); optional eine Grafik zur
    Einordnung in die Länderverteilung eines Primärjahres.
  - **Block 2 — Estimand 2 (Trend-Konsistenz):** eine Tabelle mit der
    umgerechneten Prozentrate für Fenster A und B (inkl. verfügbarer
    Unsicherheitsangabe) neben dem IFCMA-Median (inkl. verfügbarer Bandbreite),
    mit der in 3.2 vorgeschriebenen Statuskennzeichnung der Kontextquelle direkt
    in der Tabellenbeschriftung.
- Rundung: ECR-Werte und Prozentraten auf eine Nachkommastelle; Ränge als
  Ganzzahl; Perzentile auf eine Nachkommastelle.
- Jede Veröffentlichung dieser Ergebnisse muss die vier Punkte aus Abschnitt 6
  (Interpretationsrahmen) sowie den Status-Hinweis zu Teil B aus Abschnitt 3.2
  enthalten.

---

## 9. Offene Punkte, die vor Freigabe (Einfrieren) menschlich zu klären sind

(Dieser Abschnitt dient der Nachvollziehbarkeit und wird nicht Teil des
eingefrorenen Analyseplans im engeren Sinne, sondern begleitet die Freigabe-
Entscheidung.)

1. Ist die pauschale Definition des Primärindikators in 2.1 ("Effective Carbon
   Rate" als Summe aus CO2-Steuern, ETS-Preisen und energiebezogenen
   Verbrauchsteuern) so korrekt, wie sie aktuell in der OECD-CPEN-Datenbank
   ausgewiesen wird, oder gibt es eine noch aktuellere OECD-Standarddefinition,
   die vorrangig verwendet werden soll?
2. Soll für Teil B zusätzlich zum Median auch ein Mittelwert der IFCMA-Studien
   berichtet werden, falls der Report beides ausweist, oder ausschließlich der
   Median (wie in der Aufgabenstellung genannt)?
3. Gibt es eine bevorzugte, bereits verifizierte Dauer-URL/DOI für den
   OECD/IFCMA-Report, die den Kurzlink brnw.ch/21x5D02 ersetzen soll, damit
   dieser Punkt nicht erst beim Datenzugriff geklärt werden muss?
