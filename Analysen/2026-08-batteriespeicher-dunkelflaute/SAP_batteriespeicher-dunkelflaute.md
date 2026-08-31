# Statistischer Analyseplan (SAP) – Batteriespeicher und Dunkelflauten

**Titel:** Wie groß war das historische Energiedefizit in deutschen
"Dunkelflauten" (mehrtägige Perioden mit gleichzeitig geringer Wind- und
Solarerzeugung) tatsächlich, und welchen Anteil davon hätte die aktuell
installierte bzw. die für Ende 2026 / 2030 erwartete Batteriespeicherkapazität
real decken können?

**Version:** 0.2 (Entwurf)
**Status:** draft
**Datum (Entwurf v0.1):** 30.08.2026
**Datum (Überarbeitung v0.2):** 30.08.2026
**Autor:in:** sap-autor-Subagent (Klima-Evidenzcheck-Projekt)
**Freigabe/Einfrieren:** ausstehend – **nicht** freigegeben, **nicht**
eingefroren. Kein Datenzugriff, keine Ergebnisse gesichtet. Status bleibt
`draft`, bis der Mensch nach vollständiger Lektüre des aktuellen Volltextes
ausdrücklich freigibt.

**Versionshistorie:**
- **v0.1 (30.08.2026):** Erstentwurf, präregistriert vor jedem Zugriff auf
  SMARD-, Marktstammdatenregister- oder BNetzA-Planungsdaten. Fünf offene
  Rückfragen an den Menschen formuliert (Abschnitt 12).
- **v0.2 (30.08.2026):** Alle fünf Rückfragen aus v0.1 durch Daniel Saure
  beantwortet. Rückfragen 1, 2 und 5 als "beantwortet, bestätigt" ohne
  inhaltliche Änderung markiert (Abschnitt 12). Rückfrage 3 (Estimand 3c,
  BNetzA-2030-Quelle) führte zu einer verschärften, verbindlichen Regel:
  ernsthafte dokumentierte Suchpflicht nach einer offiziellen BNetzA-Quelle;
  bei nachweislich gescheiterter Suche ist 3(c) explizit als "nicht mit
  Primärqualität durchführbar" zu berichten, **keine** Ersatzzahl aus einer
  Sekundärquelle (z. B. Frontier Economics) zulässig – Regel wurde explizit
  in Abschnitt 2.3, 3, 9 und 12 verankert, nicht nur in Abschnitt 12
  vermerkt. Rückfrage 4 (S8) führte zur Klarstellung, dass S8 als reguläre,
  verpflichtende Sensitivitätsanalyse im SAP bleibt (nicht streichen), aber
  als methodisch aufwendigste/fehleranfälligste Komponente gekennzeichnet
  und – anders als S1–S7/S9 – zeitlich flexibel (verschiebbar/nachlieferbar
  ohne Blockade der übrigen Analyse) markiert wird (Abschnitt 6). Kein
  Datenzugriff, keine Ergebnisse gesichtet. Status bleibt **draft**, SAP ist
  weiterhin **nicht** eingefroren – Freigabe erfolgt erst nach erneuter
  vollständiger Lektüre des aktualisierten Volltextes durch den Menschen.

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff auf die Primärquellen SMARD,
    Marktstammdatenregister und BNetzA-Planungsdokumente verfasst)
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

**Ausdrücklicher Hinweis zur Auftragsprüfung (zwingend, siehe Projektregel):**
Der Auftrag für diesen SAP enthält vier konkrete, öffentlich kursierende
Einzelzahlen zum Thema Batteriespeicher/Dunkelflaute-Abdeckung ("2 % des
Tagesverbrauchs"; "Ø 2,3 h Speicherdauer"; "300 GWh bis 2050 = 1 % des
Bedarfs" aus einer Frontier-Economics-Studie; "5,6 Mrd. € Einsparung durch
20 GW/4h-Flexibilität" zu negativen Strompreisen). Diese Tatsache wird hier
**sofort und ausdrücklich benannt**, wie es die Projektregel bei mitgelieferten
Zahlen im Auftrag verlangt.

**Einschätzung, warum dies die Präregistrierung nach Prüfung nicht ungültig
macht (keine automatische Übernahme dieser Einschätzung – siehe Vorbehalt
unten):**
1. Keine der vier Zahlen ist ein Ergebnis der in diesem SAP geplanten
   Primäranalyse (eigene, aus SMARD-/MaStR-Rohdaten berechnete
   Episoden-Energiedefizite und Deckungsgrade). Es handelt sich um vier
   bereits vor Auftragserteilung öffentlich publizierte, methodisch andere
   Kennzahlen mit anderer Fragestellung, anderem Zeithorizont bzw. anderer
   Berechnungsgrundlage (siehe Abschnitt 3 und 8) – kein Vorwegnehmen des
   hier zu berechnenden Ergebnisses.
2. Der Auftrag selbst schreibt ausdrücklich vor, diese vier Zahlen
   **ausschließlich als Sekundärquellen zur Einordnung/Kreuzprüfung**, **nicht
   als Berechnungsgrundlage** zu verwenden (siehe Abschnitt 3) – strukturell
   vergleichbar mit der in früheren Analysen dieses Projekts (z. B.
   `Analysen/2026-08-hitzesommer-2026/`) etablierten Praxis, bereits bekannte
   Kontext-/Quellenhinweise explizit zu benennen, ohne dass sie eine
   Analyseentscheidung vorab durch Ergebnis-Kenntnis verzerren.
3. Kein Punktschätzer, keine Verteilung und keine Grafik der hier zu
   berechnenden Größen (Episoden-Energiedefizit, Deckungsgrad) wurde
   mitgeliefert oder gesichtet.

**Ausdrücklicher Vorbehalt (zwingend):** Sollte sich im weiteren Verlauf
herausstellen, dass diese Einschätzung nicht zutrifft – z. B. weil die
Formulierung der Dunkelflaute-Definition, der Kapazitätsszenarien oder der
Sensitivitätsanalysen in diesem SAP tatsächlich so gewählt wurde, dass ein
bestimmtes, den vier Fremdzahlen ähnliches oder von ihnen abweichendes
Ergebnis wahrscheinlicher wird, oder falls sich zeigt, dass eigene
Berechnungsergebnisse entgegen der Darstellung oben doch bereits vor
SAP-Erstellung vorlagen – ist der Status zwingend auf **"Status: exploratory
(retrospektiv)"** zu ändern und die Präregistrierung als ungültig zu
kennzeichnen, statt sie als "final" zu behandeln. Diese Prüfung obliegt dem
Menschen im Freigabeprozess und dem Validator-Subagenten, nicht dem
SAP-Autor selbst.

---

## 1. Hintergrund / Rationale

In der aktuellen deutschen Medienberichterstattung zirkulieren zum Thema
Batteriespeicher-Ausbau vier methodisch nicht miteinander vergleichbare
Einzelzahlen zur Frage, wie viel einer "Dunkelflaute" Batteriespeicher
abdecken können: "2 % des Tagesverbrauchs" (Berechnungsgrundlage nicht
genannt), "Ø 2,3 h Speicherdauer" (andere Quelle/Methodik, beschreibt eine
Leistungs-/Energie-Relation, keine Dunkelflaute-Abdeckung), "300 GWh
Speicherkapazität bis 2050 entsprechen 1 % des bis 2045 nötigen Bedarfs"
(Frontier-Economics-Studie, anderer Zeithorizont, andere Bedarfsdefinition),
sowie eine Studie zu 5,6 Mrd. € Einsparung durch 20 GW/4h-Flexibilität (andere
Fragestellung: Abbau negativer Strompreise, nicht Dunkelflaute-Abdeckung).

Es existiert nach Kenntnisstand des Auftrags keine öffentlich auffindbare,
selbst aus historischen Primär-Zeitreihendaten berechnete, vorregistrierte und
mit Sensitivitätsanalysen abgesicherte Antwort auf die Frage, wie groß das
tatsächliche historische Energiedefizit während realer deutscher
Dunkelflauten war und welchen Anteil davon reale (nicht nominale)
Batteriespeicherkapazität hätte decken können. Diese Lücke schließt der
vorliegende SAP, indem er:

- eine objektive, vorab festgelegte, reproduzierbare Definition einer
  "Dunkelflaute" aus SMARD-Rohdaten ableitet (statt einer intuitiven,
  nachträglichen Einordnung einzelner Extremtage),
- das Energiedefizit als Verteilung über alle historisch identifizierten
  Episoden berichtet (nicht nur als Einzelwert der größten Episode),
- den Deckungsgrad realistisch (unter Berücksichtigung von Ladezustand vor
  Episodenbeginn und Rundtrip-Verlusten, nicht 100 % Nennkapazität) für
  mehrere, vorab benannte Kapazitäts-Zeitpunkte getrennt berechnet,
- die vier kursierenden Fremdzahlen ausschließlich zur transparenten
  Einordnung heranzieht, nicht als Berechnungsgrundlage übernimmt.

## 2. Fragestellung (Estimands)

Es werden drei getrennte, aufeinander aufbauende Estimands präregistriert.
Estimand 1 ist eine notwendige deskriptive Vorstufe für Estimand 2 und 3
(Episodenidentifikation), keine eigenständige inhaltliche Aussage.

### 2.1 Estimand 1 (Vorstufe, deskriptiv): Dunkelflaute-Identifikation

**Primäre Definition (bindend für die Primäranalyse, siehe Abschnitt 5.1 und
6 für Sensitivitäten; bestätigt ohne Änderung, siehe Abschnitt 12,
Rückfrage 1):**

- **Analyseeinheit der Vorstufe:** Kalendertag (00:00–24:00 Uhr,
  Zeitzone Europe/Berlin, inkl. korrekter Behandlung von
  Zeitumstellungstagen – siehe Struktur-Check, Abschnitt 3).
- **Tagesquotient:** Q(t) = [Wind Onshore(t) + Wind Offshore(t) + Photovoltaik(t)]
  (Tagessumme der tatsächlichen Erzeugung, GWh) ÷ Stromverbrauch(t)
  (Tagessumme, GWh; exakte SMARD-Verbrauchsdefinition wird im Struktur-Check,
  Abschnitt 3, festgestellt).
- **Schwellenwert:** Q(t) unterschreitet das **10. Perzentil** der Verteilung
  von Q(t) über die gesamte verfügbare SMARD-Historie (Januar 2015 bis zum
  letzten vollständigen Kalendermonat vor dem Analysezeitpunkt).
- **Mindestdauer:** mindestens **3 aufeinanderfolgende Kalendertage**, an
  denen Q(t) jeweils unterhalb des Schwellenwerts liegt (kein
  Unterbrechungstage-Toleranzfenster in der Primärdefinition).
- **Episodenabgrenzung:** Eine Episode beginnt am ersten und endet am letzten
  Tag einer ununterbrochenen Folge von Tagen mit Q(t) < Schwelle. Ein
  einzelner Tag mit Q(t) ≥ Schwelle beendet die Episode (keine Verkettung
  über Unterbrechungstage hinweg in der Primärdefinition).
- **Ergebnis der Vorstufe:** vollständige, chronologische Liste aller so
  identifizierten historischen Episoden mit Start, Ende, Dauer (Tage) und
  Q(t)-Verlauf – unabhängig davon, wie viele Episoden dies ergibt.

Diese Definition ist bewusst perzentilbasiert (relativ zur eigenen Historie),
nicht auf einen absoluten, extern vorgegebenen Schwellenwert gestützt, damit
sie ohne Ermessensspielraum aus den Rohdaten reproduzierbar ist.

### 2.2 Estimand 2 (PRIMÄR): Energiedefizit je Episode

Für jede unter 2.1 identifizierte Episode wird das kumulierte
Energiedefizit berechnet als:

**Defizit_Episode (GWh) = Σ_t [Stromverbrauch(t) − (Wind Onshore(t) + Wind
Offshore(t) + Photovoltaik(t))]**, summiert über alle Kalendertage t der
Episode (Systemgrenze primär: nur Wind + Solar werden von der Erzeugung
abgezogen, siehe Begründung der Systemgrenze und die breitere
Sensitivitäts-Systemgrenze in Abschnitt 5.1 und 6, S4).

**Berichtsform (bindend):** Die vollständige Verteilung des
Episoden-Energiedefizits über alle identifizierten Episoden wird berichtet
(Median, Interquartilsabstand, Minimum, Maximum, n Episoden) – **nicht** nur
die größte oder kleinste Einzelepisode.

### 2.3 Estimand 3 (PRIMÄR): Deckungsgrad durch Batteriespeicher

Für jede Episode und **getrennt, gleichrangig** für drei
Kapazitäts-Zeitpunkte:

- **(a) aktuell installierte Speicherkapazität** (Stand Analysezeitpunkt,
  Quelle: Marktstammdatenregister),
- **(b) für Ende 2026 erwartete Kapazität** (primäre Quelle: amtlichere
  Quelle falls auffindbar; Fallback: IWR-Prognose – **bestätigt zulässig**,
  siehe Abschnitt 3 und Abschnitt 12, Rückfrage 5, explizit und durchgängig
  als Sekundärquelle gekennzeichnet),
- **(c) Bundesnetzagentur-Prognose/-Planung für 2030** (ausschließlich aus
  einer offiziellen BNetzA-Quelle; **verbindliche Suchpflicht und
  ausdrückliches Ersatzzahl-Verbot**, siehe Abschnitt 3, 9 und Abschnitt 12,
  Rückfrage 3 – scheitert die dort beschriebene, dokumentierte Suche
  nachweislich, wird 3(c) explizit als **"nicht mit Primärqualität
  durchführbar"** berichtet; **keine** Ersatzzahl aus einer Sekundärquelle),

wird berechnet:

**entladbare Energie_Szenario (GWh) = installierte nutzbare Speicherkapazität
(GWh) × Anfangsladezustand vor Episodenbeginn (primär: 80 %, bestätigt ohne
Änderung, siehe Abschnitt 12, Rückfrage 2) × Entladewirkungsgrad (primär:
0,92, entsprechend einem angenommenen AC-AC-Rundtrip-Wirkungsgrad von 85 %,
bestätigt ohne Änderung, siehe Abschnitt 12, Rückfrage 2; hälftig auf
Lade-/Entladeseite aufgeteilt: √0,85 ≈ 0,922)**

**Deckungsgrad_Episode,Szenario = entladbare Energie_Szenario (GWh) ÷
Defizit_Episode (GWh)**, primär als reine Energiebilanz ohne
Nachladung während der Episode (Begründung siehe Abschnitt 5.1; verpflichtende
Sensitivität S8, siehe Abschnitt 6) und primär ohne Leistungs-/C-Raten-
Begrenzung (Begründung und verpflichtende Sensitivität siehe Abschnitt 6,
S5).

**Berichtsform (bindend):** Für jedes der drei Kapazitätsszenarien wird die
vollständige Verteilung des Deckungsgrads über alle Episoden berichtet
(Median, Interquartilsabstand, Minimum, Maximum) – **nicht** nur eine
einzelne Durchschnittszahl. Ist Szenario 3(c) gemäß obiger Regel als "nicht
mit Primärqualität durchführbar" markiert, entfällt für dieses Szenario die
Deckungsgrad-Berechnung ersatzlos (kein Ausweichen auf eine Ersatzzahl); dies
wird im Bericht als eigenständiges, benanntes Ergebnis ("3(c) nicht mit
Primärqualität durchführbar") dargestellt, nicht stillschweigend
ausgelassen.

Diese Formulierungen sind so gewählt, dass zwei unabhängige Analyst:innen mit
diesem SAP zu identischer Episodenliste, identischer Defizitberechnung und
identischer Deckungsgrad-Formel gelangen würden.

## 3. Datenquellen

**Primärquellen (in dieser Reihenfolge zu prüfen, kein Fallback ohne
dokumentierten Versuch):**

1. **SMARD (smard.de, Bundesnetzagentur):** Viertelstunden-Zeitreihen der
   tatsächlichen Stromerzeugung (Wind Onshore, Wind Offshore, Photovoltaik,
   sowie weitere Energieträger für die Sensitivitäts-Systemgrenze S4) und des
   Stromverbrauchs seit Januar 2015 (CC BY 4.0). Primärquelle für Estimand 1
   und 2.
2. **Marktstammdatenregister (MaStR, Bundesnetzagentur):** amtliches Register
   aller Stromspeicheranlagen inkl. Nennleistung, nutzbarer
   Speicherkapazität (sofern im Register erfasst) und Inbetriebnahmedatum.
   Primärquelle für Kapazitätsszenario 3(a).
3. **Bundesnetzagentur-Planungsdokumente** (primär und verpflichtend zu
   prüfen: aktuellster Netzentwicklungsplan-Entwurf Strom / Szenariorahmen
   Strom, Kraftwerkssicherheitsbericht, sowie weitere amtliche
   BNetzA-Veröffentlichungen mit expliziter Batteriespeicher-
   Kapazitätsangabe für 2030) für Kapazitätsszenario 3(c).

   **Verbindliche Regel (Entscheidung des Menschen, 30.08.2026, siehe
   Abschnitt 12, Rückfrage 3):** Der Analyst muss **ernsthaft und
   dokumentiert** nach einer offiziellen BNetzA-Quelle suchen (mindestens
   geprüft werden müssen: aktueller/aktuellster Netzentwicklungsplan-
   Entwurf, Kraftwerkssicherheitsbericht; weitere amtliche BNetzA-Quellen
   nach eigenem Ermessen). Geprüfte Dokumente, Fundstelle bzw. Beleg der
   erfolglosen Suche sind vollständig zu dokumentieren (siehe
   Software-Anforderung, Abschnitt 10).

   **Nur wenn diese Suche nachweislich scheitert**, wird Estimand 3(c)
   explizit als **"nicht mit Primärqualität durchführbar"** berichtet. In
   diesem Fall ist **keine** Ersatzzahl aus einer Sekundärquelle (z. B.
   Frontier-Economics-Studie, IWR oder vergleichbare Prognosen Dritter) als
   Substitut für Kapazitätsszenario 3(c) zulässig – weder als vermeintlich
   "primäre" Zahl noch stillschweigend als Sensitivität, die den Anschein
   einer eigenen Primärberechnung erweckt. **Begründung:** Zweck dieser
   Analyse ist eine eigene Primärrechnung auf Basis amtlicher Daten, nicht
   die Reproduktion einer fünften, methodisch weiteren Fremdzahl – das
   widerspräche unmittelbar dem in Abschnitt 1 formulierten Zweck dieses
   SAP. Dieses Verbot gilt **ausschließlich** für Szenario 3(c); es betrifft
   **nicht** die für Szenario 3(b) ausdrücklich zugelassene IWR-Sekundärquelle
   (siehe unten) und **nicht** die in Abschnitt 6 (S9) vorgesehene
   Kreuzprüfung für Szenario 3(a).

**Sekundärquellen (nur zur Einordnung/Kreuzprüfung, nicht als
Berechnungsgrundlage – Ausnahme: Szenario 3(b), siehe unten):**

- Die vier eingangs genannten Fremdzahlen (2 %-Zahl, Ø-2,3h-Zahl,
  Frontier-Economics-Studie, 5,6-Mrd.-€-Studie) – im Ergebnisbericht dem
  eigenen berechneten Wert gegenübergestellt, mit expliziter Benennung der
  methodischen/zeitlichen Abweichung (siehe Abschnitt 8), **nicht** als
  "wer hat recht"-Vergleich. Ausdrücklich **nicht** als Ersatzwert für
  Estimand 3(c) verwendbar (siehe verbindliche Regel oben).
- **IWR-Prognose für die Ende-2026-Kapazität (Szenario 3b) – bestätigt
  zulässig (Entscheidung des Menschen, 30.08.2026, siehe Abschnitt 12,
  Rückfrage 5):** zu verwenden, falls keine amtlichere Quelle (z. B.
  BNetzA-Kurzfristprognose, Marktstammdatenregister-Trendfortschreibung)
  auffindbar ist. Muss im Bericht **durchgängig und unübersehbar** als
  Sekundärquelle/Schätzung gekennzeichnet werden (Quellenangabe direkt an
  jeder Stelle, an der der Wert erscheint – Tabellen, Grafiken, Fließtext –,
  analog zur Kennzeichnungspraxis für Sekundärdaten in früheren Analysen
  dieses Projekts), nicht nur einmalig im Methodenteil. Diese Zulässigkeit
  gilt **ausschließlich** für Szenario 3(b), nicht für 3(c) (siehe
  verbindliche Regel oben).
- Sekundäre Industrieaggregate (z. B. Bundesverband Energiespeicher
  Systeme e. V. (BVES), Fraunhofer-ISE/energy-charts.info-Aggregate) **nur**
  zur Plausibilitäts-Kreuzprüfung der MaStR-Summe für Szenario 3(a), falls der
  Struktur-Check Vollständigkeitsprobleme im MaStR dokumentiert (siehe
  Sensitivität S9, Abschnitt 6).

**Erster dokumentierter Schritt vor jeder Berechnung (Struktur-Check,
analog zum in diesem Projekt etablierten Vorgehen, z. B.
`Analysen/2026-08-emissionen/`):**

1. Exakte SMARD-Verbrauchsdefinition feststellen (Netzlast vs.
   Letztverbrauch; ob Pumpspeicher-Ladestrom ein- oder ausgeschlossen ist) –
   Ergebnis bestimmt die als "Stromverbrauch" verwendete SMARD-Spalte.
2. Verfügbaren Zeitraum (frühestes/spätestes Datum, ggf. Datenlücken) für
   Wind Onshore, Wind Offshore, Photovoltaik und Verbrauch feststellen;
   Behandlung von Zeitumstellungstagen (23/25-Stunden-Tage) dokumentieren.
3. MaStR: Feststellen, ob und wie vollständig das Feld "nutzbare
   Speicherkapazität" (MWh/kWh) für Batteriespeicher erfasst ist (getrennt
   von der Nennleistung in MW); Vollständigkeit anhand Stichprobe/
   Plausibilitätsvergleich mit Sekundäraggregaten (siehe S9) prüfen und
   dokumentieren, bevor Szenario 3(a) berechnet wird.
4. Gezielte, dokumentierte Suche nach einer amtlichen BNetzA-Quelle für eine
   2030-Batteriespeicherkapazitätsangabe (siehe verbindliche Suchpflicht
   oben); Ergebnis (gefunden/nicht gefunden, mit Fundstelle bzw. Beleg des
   erfolglosen Suchversuchs) dokumentieren, bevor über Estimand 3(c)
   final entschieden wird.
5. Prüfen, ob für Szenario 3(b) eine amtlichere Quelle als IWR existiert;
   Ergebnis dokumentieren.

**Dokumentationsanforderung bei behauptetem gescheitertem Zugriff auf externe
Quellen** (konsistent mit dem in `Analysen/2026-08-thg-laendervergleich/`
etablierten Standard): Eine Behauptung eines gescheiterten
Zugriffsversuchs ist nur zulässig, wenn sie mit einem nachprüfbaren Artefakt
(Log, Zeitstempel, Fehlermeldung, Code-Pfad) belegt wird; andernfalls ist
ehrlich zu formulieren "nicht versucht, da kein Netzwerkzugriff verfügbar".
Dies gilt insbesondere für die Suchpflicht zu Estimand 3(c) oben – eine
Behauptung "keine BNetzA-Quelle gefunden" ist nur mit dokumentiertem
Suchprotokoll zulässig.

## 4. Analysepopulation

- **Analyseeinheit:** Dunkelflaute-Episode, identifiziert gemäß Abschnitt 2.1
  über den gesamten verfügbaren SMARD-Zeitraum (primär: Januar 2015 bis zum
  letzten vollständigen Kalendermonat vor Analysezeitpunkt).
- **Kein inhaltlich motivierter Ausschluss einzelner Episoden** (z. B. keine
  Entfernung besonders langer/kurzer Episoden aus der Primäranalyse);
  Auffälligkeiten werden über die deskriptive Verteilungsdarstellung
  transparent gemacht, nicht durch Entfernung.
- **Fehlende Werte:** Fehlt für einen Kalendertag ein SMARD-Viertelstundenwert
  (Wind, Solar oder Verbrauch), wird bei einer Lücke von weniger als 4
  Stunden linear interpoliert (dokumentiert); bei einer Lücke von 4 Stunden
  oder mehr wird der betroffene Tag von der Dunkelflaute-Identifikation
  ausgeschlossen und explizit als Datenlücke ausgewiesen (kein stiller
  Ausschluss).
- **Mindest-Fallzahl-Regel:** Ergibt die Primärdefinition (Abschnitt 2.1)
  weniger als 5 Episoden über die gesamte Historie, werden Median/IQR
  weiterhin berichtet, aber explizit als **statistisch wenig belastbar**
  gekennzeichnet (Verteilungsaussagen auf sehr kleiner Fallzahl); die
  Einzelepisoden werden in diesem Fall zusätzlich vollständig tabellarisch
  (nicht nur aggregiert) berichtet.
- **Kapazitätsszenarien (3a–3c):** jeweils Stand zum im Struktur-Check
  dokumentierten Zugriffsdatum (3a) bzw. gemäß der in Abschnitt 3 benannten
  Prognosequelle (3b, 3c); Speicheranlagen mit Status "stillgelegt" oder rein
  geplant/nicht in Betrieb werden für 3(a) ausgeschlossen.

## 5. Statistische Methoden

### 5.1 Primäranalyse

**Schritt 1 – Aggregation:** Viertelstundenwerte (SMARD) werden je
Kalendertag (Europe/Berlin) zu Tagessummen (GWh) aggregiert für: Wind
Onshore, Wind Offshore, Photovoltaik, Stromverbrauch (gemäß im Struktur-Check
festgelegter Spalte).

**Schritt 2 – Tagesquotient und Schwellenwert:** Q(t) gemäß Abschnitt 2.1
berechnen; 10. Perzentil von Q(t) über die gesamte Historie als Schwellenwert
festlegen.

**Schritt 3 – Episodenidentifikation:** Episoden gemäß Abschnitt 2.1
(≥ 3 aufeinanderfolgende Tage unter dem Schwellenwert, keine
Unterbrechungstoleranz) identifizieren.

**Schritt 4 – Energiedefizit je Episode:** gemäß Formel in Abschnitt 2.2;
**Systemgrenze primär: nur Wind + Solar** werden von der Erzeugung
abgezogen (nicht Biomasse, Laufwasserkraft, Kernenergie oder sonstige
nicht-fossile/nicht-batteriegestützte Erzeugung). **Begründung:** Der Begriff
"Dunkelflaute" bezieht sich wörtlich auf das gleichzeitige Fehlen von Sonne
("dunkel") und Wind ("Flaute") – die engste, unmittelbarste und am
häufigsten in der öffentlichen Debatte verwendete Lesart. Pumpspeicher-
Erzeugung wird **nicht** von der Erzeugung abgezogen, da Pumpspeicher selbst
ein Speicher-/Dispatchable-Asset analog zu Batteriespeichern ist und sonst
mit dem hier untersuchten Deckungsgrad-Gegenstand vermischt würde. Eine
breitere Systemgrenze (Residuallast-Konzept, zusätzlicher Abzug von
Biomasse/Laufwasserkraft/sonstigen Erneuerbaren) wird verpflichtend als
Sensitivität S4 (Abschnitt 6) berechnet.

**Schritt 5 – Deckungsgrad je Episode und Kapazitätsszenario:** gemäß Formel
in Abschnitt 2.3, primär mit Anfangsladezustand 80 %, Entladewirkungsgrad
0,92, ohne Nachladung während der Episode, ohne Leistungs-/C-Raten-
Begrenzung.

**Primär vs. sensitivitätsanalytisch (Übersicht, Details siehe Abschnitt 6):**

| Parameter | Primär | Sensitivitätsanalytisch |
|---|---|---|
| Perzentil-Schwelle | 10. Perzentil | 20. Perzentil (S1) |
| Mindestdauer | 3 Tage | 2 Tage, 5 Tage (S2) |
| Unterbrechungstoleranz | keine | 1 Tag erlaubt, Episoden verkettet (S3) |
| Systemgrenze | Wind + Solar | alle Erneuerbaren (Residuallast) (S4) |
| Leistungsbegrenzung | keine (reine Energiebilanz) | C-Raten-/Nennleistungs-Kappung (S5) |
| Anfangsladezustand | 80 % | 50 %, 100 % (S6) |
| Rundtrip-Wirkungsgrad | 85 % (η_Entladung 0,92) | 80 %, 90 % (S7) |
| Nachladung während Episode | keine | vereinfachte Dispatch-Simulation (S8, zeitlich flexibel, siehe Abschnitt 6) |
| Kapazitätsquelle 3(a) | MaStR-Summe | Sekundäraggregat-Kreuzprüfung (S9, konditional) |

**Wichtiger Hinweis zur Kombinatorik:** Alle Sensitivitäten in Abschnitt 6
werden **einzeln, je einen Parameter gegenüber der Primärspezifikation
variierend** berechnet (kein vollfaktorielles Ausprobieren aller
Kombinationen). Dies ist selbst eine vorab festgelegte Entscheidung, um eine
nachträgliche Auswahl der günstigsten Parameterkombination auszuschließen.

### 5.2 Diagnostik-Plan (Autokorrelation, Normalität, Stationarität)

Diese Analyse schätzt kein Regressions-/Zeitreihenmodell im klassischen
Sinn, sondern identifiziert Episoden und beschreibt Verteilungen. Dennoch
sind Autokorrelation und Normalität relevant und werden explizit geprüft:

- **Autokorrelation des Tagesquotienten Q(t):** Berechnung der
  Autokorrelationsfunktion (ACF) sowie eines Ljung-Box-Tests auf Q(t) über
  die gesamte Historie. **Zweck:** Q(t) ist durch Wetterpersistenz stark
  seriell autokorreliert; dies bedeutet, dass Tage **nicht** als unabhängige
  Ziehungen behandelt werden dürfen. Das Ergebnis wird nicht verwendet, um
  die Episodendefinition nachträglich zu ändern, sondern um im Bericht
  explizit zu dokumentieren, dass die Anzahl identifizierter Tage unter dem
  Schwellenwert nicht mit der Anzahl unabhängiger Beobachtungen verwechselt
  werden darf (relevant für die Einordnung der Fallzahl in Abschnitt 4).
- **Normalität der Verteilung von Episoden-Energiedefizit und
  Deckungsgrad:** Shapiro-Wilk-Test je Verteilung (sofern n ≥ 3). **Zweck:**
  bestimmt, ob ergänzend zu der ohnehin bindend vorgeschriebenen
  Median/IQR-Berichterstattung (Abschnitt 2.2/2.3) zusätzlich
  Mittelwert/Standardabweichung sinnvoll berichtbar sind. Bei signifikanter
  Abweichung von der Normalität (α = 0,05) wird im Bericht explizit
  gekennzeichnet, dass der Mittelwert durch einzelne Extremepisoden verzerrt
  sein kann und Median/IQR die primäre Kennzahl bleiben.
- **Stationaritäts-/Trendprüfung über die Kalenderjahre (rein deskriptiv):**
  Deskriptive Darstellung von Episodenanzahl und mittlerem Energiedefizit je
  Kalenderjahr über die Historie, **ohne** formalen Hypothesentest auf einen
  Zeittrend und **ohne** kausale Interpretation (kein Klimawandel-
  Attributionsmodell; siehe Abschnitt 8). Dies dient ausschließlich der
  Transparenz, ob die identifizierten Episoden über die Jahre gleichmäßig
  verteilt sind oder sich in bestimmten Jahren/Wintern häufen.

### 5.3 Korrektur bei Annahmenverletzung

- **Bei signifikanter Autokorrelation von Q(t) (erwartetes, nicht
  überraschendes Ergebnis):** keine Änderung der primären
  Episodendefinition; explizite Kennzeichnung im Bericht, dass
  Tagesbeobachtungen innerhalb einer Episode nicht unabhängig sind und
  Verteilungsstatistiken über *Episoden* (nicht über Tage) die relevante
  Berichtsebene sind.
- **Bei signifikanter Abweichung von der Normalität:** Median/IQR bleiben
  primäre Kennzahl (ohnehin bindend vorgeschrieben); Mittelwert/SD werden nur
  ergänzend mit explizitem Verzerrungshinweis berichtet.
- **Bei sehr kleiner Episodenzahl (n < 5, siehe Abschnitt 4):** keine
  automatische Modellanpassung; stattdessen vollständige Einzelepisoden-
  Tabelle zusätzlich zur (als wenig belastbar gekennzeichneten)
  Verteilungsstatistik.

### 5.4 Unsicherheitsquantifizierung

- **Primär:** Median, Interquartilsabstand (25./75. Perzentil), Minimum,
  Maximum und n je Verteilung (Episoden-Energiedefizit; Deckungsgrad je
  Kapazitätsszenario).
- **Ergänzend (sofern Normalitätsannahme nach 5.2 nicht verletzt):**
  Mittelwert und Standardabweichung.
- Für die Kapazitätsszenarien selbst (installierte GWh) werden, soweit aus
  den Quellen ableitbar, Bandbreiten/Unsicherheitsangaben der Quelle
  (z. B. Prognosekorridor der BNetzA-Planung oder der IWR-Prognose)
  übernommen und dokumentiert – **keine** eigene Neuschätzung dieser
  Bandbreiten.

### 5.5 Signifikanzniveau

α = 0,05, zweiseitig, ausschließlich für die diagnostischen Tests
(Ljung-Box, Shapiro-Wilk) gemäß Abschnitt 5.2. Für die primären Ergebnisse
(Energiedefizit-Verteilung, Deckungsgrad-Verteilung) wird **keine**
klassische Signifikanzsprache verwendet, da es sich um deskriptive
Verteilungsbeschreibungen historischer Episoden handelt, nicht um einen
Hypothesentest über eine Grundgesamtheit.

## 6. Sensitivitätsanalysen

Alle folgenden Varianten werden vorab festgelegt, vollständig durchgeführt
und **zusätzlich zur Primäranalyse**, nicht anstelle von ihr, berichtet –
unabhängig davon, ob sie das primäre Ergebnis bestätigen. Jede Variante
ändert genau **einen** Parameter gegenüber der Primärspezifikation
(Abschnitt 5.1, Tabelle):

1. **S1 – Alternativer Schwellenwert:** 20. Perzentil statt 10. Perzentil.
2. **S2 – Alternative Mindestdauer:** 2 Tage bzw. 5 Tage statt 3 Tage
   (zwei getrennte Varianten).
3. **S3 – Unterbrechungstoleranz:** Episoden mit genau 1 Tag Unterbrechung
   (Q(t) ≥ Schwelle an nur einem Tag zwischen zwei Tagen unter der Schwelle)
   werden zu einer durchgehenden Episode verkettet.
4. **S4 – Breitere Systemgrenze (Residuallast-Konzept):** zusätzlich zu
   Wind + Solar werden Biomasse, Laufwasserkraft und sonstige Erneuerbare
   von der Erzeugung abgezogen (Pumpspeicher weiterhin ausgeschlossen, siehe
   Begründung Abschnitt 5.1).
5. **S5 – Leistungs-/C-Raten-Begrenzung (verpflichtend, nicht optional):**
   Nutzung der MaStR-Nennleistung (GW) je Kapazitätsszenario zur Berechnung
   der mittleren Speicherdauer (Kapazität ÷ Leistung) und Kappung der pro
   Kalendertag maximal entladbaren Energiemenge auf Nennleistung × 24 h.
   Diese Sensitivität steht in direktem methodischem Bezug zur eingangs
   genannten "Ø 2,3 h Speicherdauer"-Fremdzahl und erlaubt eine transparente
   Einordnung dieser Zahl (Abschnitt 8), ohne sie zu übernehmen.
6. **S6 – Alternative Anfangsladezustände:** 50 % bzw. 100 % statt 80 %
   (zwei getrennte Varianten).
7. **S7 – Alternative Rundtrip-Wirkungsgrade:** 80 % bzw. 90 % statt 85 %
   (zwei getrennte Varianten).
8. **S8 – Vereinfachte Nachlade-Simulation während der Episode (reguläre,
   verpflichtende Sensitivitätsanalyse – Entscheidung des Menschen,
   30.08.2026, siehe Abschnitt 12, Rückfrage 4):** Erlaubt Nachladung der
   Batterie aus der während der Episode selbst weiterhin (wenn auch
   reduziert) verfügbaren Wind-/Solarerzeugung, sofern diese den
   Tagesverbrauch nicht vollständig deckt (vereinfachtes Dispatch-Modell
   auf Tagesbasis).

   **Ausdrückliche Kennzeichnung (verbindlich für den Analyst-Schritt):**
   S8 ist von allen in diesem SAP spezifizierten Sensitivitäten die
   **methodisch aufwendigste und fehleranfälligste Komponente**
   (mehrstufige Tages-Dispatch-Logik statt einfacher Parametervariation wie
   bei S1–S7/S9). S8 ist fester Bestandteil dieses SAP und darf **nicht
   ersatzlos gestrichen** werden. Sie ist jedoch – anders als S1–S7 und S9 –
   **zeitlich flexibel**: Bei Kapazitäts- oder Zeitknappheit im
   Analyse-Zyklus darf S8 gegenüber der übrigen Primär- und
   Sensitivitätsanalyse **zeitlich verschoben/nachgeliefert** werden, ohne
   dass dies den restlichen Analyse- und Validierungsablauf blockiert. Wird
   S8 in einem ersten Analyse-Durchlauf noch nicht berechnet, ist dies im
   Ergebnisbericht explizit als **"S8 – noch ausstehend, wird
   nachgeliefert"** zu kennzeichnen (nicht stillschweigend auszulassen); der
   übrige Bericht (Primäranalyse und S1–S7/S9) darf davon unabhängig als
   vollständig behandelt werden.
9. **S9 – Kreuzprüfung Kapazitätsquelle 3(a) (konditional):** Wird im
   Struktur-Check (Abschnitt 3) eine relevante Unvollständigkeit des
   MaStR-Feldes "nutzbare Speicherkapazität" dokumentiert, wird Szenario 3(a)
   zusätzlich mit einem benannten Sekundäraggregat (z. B. BVES- oder
   Fraunhofer-ISE/energy-charts.info-Summe) als Sensitivität berechnet und
   der Differenz zur MaStR-Summe explizit ausgewiesen.

## 7. Umgang mit Mehrfachtestung / Multiplizität

Der primäre Estimand besteht aus deskriptiven Verteilungen (Median/IQR/
Min-Max) über Episoden, nicht aus einer Familie formaler Hypothesentests im
klassischen Sinn – daher ist keine Holm-Bonferroni-Korrektur o. Ä. für die
primären Ergebnisse selbst anzuwenden. Die diagnostischen Tests aus 5.2
(Ljung-Box, Shapiro-Wilk) sind Modellannahmen-Prüfungen, keine inhaltlichen
Hypothesentests, und werden ohne Multiplizitätskorrektur, aber vollständig
berichtet.

Um Cherry-Picking über die neun in Abschnitt 6 aufgeführten
Sensitivitätsvarianten (S1–S9, teils mit mehreren Untervarianten) zu
verhindern: **alle** durchgeführten Varianten werden in einer vollständigen
Ergebnistabelle (Anhang) berichtet, unabhängig davon, welche Variante den
höchsten oder niedrigsten Deckungsgrad ergibt. Die Primärspezifikation aus
Abschnitt 5.1 ist bindend für die Hauptaussage des Ergebnisberichts; keine
nachträgliche Umdeklarierung einer Sensitivitätsvariante zur Hauptaussage
nach Sichtung der Ergebnisse. Ist S8 zum Berichtszeitpunkt noch nicht
nachgeliefert (siehe Abschnitt 6), wird dies in derselben Tabelle
transparent als ausstehend gekennzeichnet, nicht ausgelassen.

## 8. Interpretationsrahmen / Confounder

> **Zentrale, verbindliche Leitplanken für Analyst, Validator und
> Kommunikation (nicht verhandelbar):**
>
> 1. **Keine Bewertung von Batteriespeichern als "richtige" oder "beste"
>    Lösung.** Diese Analyse trifft **keine** Aussage darüber, ob
>    Batteriespeicher die geeignete Antwort auf Dunkelflauten sind, und
>    **keine** vergleichende Bewertung alternativer Lösungen (steuerbare
>    Gaskraftwerke, Stromimporte, Lastmanagement, Wasserstoff o. Ä.). Der
>    Deckungsgrad wird ausschließlich deskriptiv für Batteriespeicher
>    spezifisch berechnet.
> 2. **Keine Bewertung oder Motivzuschreibung gegenüber Medien/Publikationen.**
>    Die eingangs beschriebene Medienlandschafts-Recherche ist ausschließlich
>    Motivation für die Fragestellung, **kein** Analysegegenstand. Weder
>    "Boom"-Quellen noch "Kritiker"-Quellen werden im Ergebnisbericht
>    bewertet oder es werden ihnen Motive zugeschrieben.
> 3. **Die Dunkelflaute-Definition ist eine methodische Festlegung mit
>    Ermessensspielraum, keine "objektive Wahrheit".** Deshalb werden
>    zwingend Sensitivitätsanalysen mit alternativen Schwellenwerten und
>    Mindestdauern durchgeführt (S1–S3, Abschnitt 6) und **gleichrangig**
>    neben der Primärdefinition berichtet.
> 4. **Deckungsgrad-Berechnung berücksichtigt Ladezustand und
>    Rundtrip-Verluste realistisch**, nicht 100 % Nennkapazität sofort
>    verfügbar (siehe Abschnitt 5.1, primäre Annahmen 80 % SOC / 92 %
>    Entladewirkungsgrad, vorab festgelegt und begründet, nicht beim Rechnen
>    improvisiert).
> 5. **Kein "wer hat recht"-Vergleich mit den vier Fremdzahlen.** Der
>    Ergebnisbericht stellt die eigene berechnete Zahl den vier eingangs
>    genannten Fremdzahlen gegenüber und benennt explizit die jeweilige
>    methodische/zeitliche Abweichung (z. B.: andere Systemgrenze, anderer
>    Zeithorizont wie 2045/2050 statt historisch 2015–2026, andere
>    Fragestellung wie negative Strompreise statt Dunkelflaute-Abdeckung) –
>    **nicht** als Bewertung, welche Zahl "richtiger" ist. Dies gilt auch für
>    Estimand 3(c): Sollte dieses Szenario als "nicht mit Primärqualität
>    durchführbar" markiert werden, ist dies als eigenständiges Ergebnis zu
>    kommunizieren, **nicht** stillschweigend durch eine der vier Fremdzahlen
>    zu ersetzen (siehe Abschnitt 3).

**Weitere Confounder/Einschränkungen:**

- **Keine Kausal-/Attributionsaussage zu Klimawandel:** Die deskriptive
  Jahres-Darstellung der Episodenhäufigkeit (Abschnitt 5.2) erlaubt **keine**
  Aussage darüber, ob Dunkelflauten klimawandelbedingt häufiger/seltener
  werden; dafür wäre ein eigenes Attributionsmodell mit meteorologischen
  Kovariaten nötig, das nicht Gegenstand dieses SAP ist.
- **Grenzkuppelstellen/Importe nicht im Defizit berücksichtigt:** Das
  Energiedefizit wird auf Basis der inländischen Erzeugung und des
  inländischen Verbrauchs berechnet, **ohne** Verrechnung mit
  grenzüberschreitenden Stromflüssen. Ein Teil des historischen Defizits
  wurde in der Realität faktisch durch Importe gedeckt – dies wird als
  Limitation benannt (Abschnitt 9), nicht berechnet, und **nicht** bewertet
  (siehe Leitplanke 1 oben).
- **Zeithorizont-Inkonsistenz gegenüber Frontier-Economics-Studie:** Die
  eigene Analyse ist rein historisch (2015 bis Analysezeitpunkt); ein
  direkter Vergleich mit einer Bedarfsprojektion bis 2045/2050 ist nicht
  bedeutungsgleich und wird im Bericht als solcher benannt.

## 9. Limitationen

- Die Dunkelflaute-Definition (Schwellenwert, Mindestdauer,
  Unterbrechungstoleranz) ist eine vorab begründete, aber nicht
  "objektiv einzig richtige" methodische Festlegung (siehe Abschnitt 8,
  Leitplanke 3).
- Marktstammdatenregister-Datenqualität: mögliche Untererfassung oder
  verzögerte Meldung insbesondere kleiner (Heim-)Speichersysteme; das Feld
  "nutzbare Speicherkapazität" ist möglicherweise nicht für alle Anlagen
  vollständig gepflegt (siehe Struktur-Check, Abschnitt 3, und Sensitivität
  S9).
- Primäranalyse ist eine reine Energiebilanz ohne Leistungs-/C-Raten-
  Begrenzung; dies kann den Deckungsgrad bei sehr kurzen, aber intensiven
  Defizitspitzen überschätzen (adressiert durch die verpflichtende
  Sensitivität S5, aber S5 selbst ist eine vereinfachte Tageskappung, keine
  vollständige Viertelstunden-Dispatch-Simulation).
- Primäranalyse nimmt keine Nachladung während der Episode an (konservative
  Vereinfachung); die realistischere Dispatch-Simulation (S8) ist Teil des
  SAP, aber methodisch aufwendig und zeitlich flexibel (kann verschoben/
  nachgeliefert werden, siehe Abschnitt 6) – bis zu ihrer Nachlieferung ist
  der Deckungsgrad ohne S8 als konservative (eher zu niedrige)
  Näherung zu verstehen.
- **Kapazitätsszenario 3(c) (BNetzA-2030-Prognose):** Zum Zeitpunkt der
  SAP-Erstellung ist ungeprüft, ob eine belastbare amtliche Quelle
  existiert. Der Analyst muss eine ernsthafte, dokumentierte Suche nach
  einer offiziellen BNetzA-Quelle durchführen (siehe verbindliche Regel,
  Abschnitt 3); scheitert diese nachweislich, wird Szenario 3(c) explizit
  als **"nicht mit Primärqualität durchführbar"** berichtet. Eine
  Ersatzzahl aus einer Sekundärquelle (z. B. Frontier Economics) ist für
  dieses Szenario **ausdrücklich nicht zulässig** (siehe Abschnitt 3 und
  2.3) – dies unterscheidet 3(c) bewusst von Szenario 3(b), für das IWR als
  gekennzeichnete Sekundärquelle zulässig ist.
- Keine Berücksichtigung von grenzüberschreitenden Stromflüssen (siehe
  Abschnitt 8).
- Keine Kausal-/Attributionsaussage zu einem etwaigen Klimawandel-bedingten
  Trend in Häufigkeit/Schwere von Dunkelflauten (siehe Abschnitt 8).
- Zeithorizont- und Systemgrenzen-Unterschiede zu den vier eingangs genannten
  Fremdzahlen machen einen direkten Zahlenvergleich methodisch nicht
  bedeutungsgleich (siehe Abschnitt 8).

## 10. Software

- R-Version: gemäß Projekt-Standard, vom analyst-Subagenten im Skriptkopf
  zu dokumentieren.
- Pakete (vorab benannt, keine Erweiterung ohne Dokumentation): `dplyr`/
  `data.table` (Aggregation), `lubridate` (Zeitzonen-/Datumsverarbeitung),
  `ggplot2` (rein deskriptive Visualisierung), `stats` (Basis: `shapiro.test`,
  `acf`), `lmtest`/`car` (`Box.test`/Ljung-Box bzw. Durbin-Watson-Äquivalent
  je nach finaler Wahl im Struktur-Check).
- Skript-Dateiname (Vorschlag): `batteriespeicher-dunkelflaute.R` im Ordner
  `Analysen/2026-08-batteriespeicher-dunkelflaute/`.
- **Zwingende Zusatzanforderung:** Ein strukturiertes Suchprotokoll für die
  BNetzA-Planungsdokumenten-Suche (Abschnitt 3, Schritt 4) ist verpflichtend
  abzulegen (geprüfte Dokumente, gefundene/nicht gefundene Quelle, Fundstelle
  oder Beleg des erfolglosen Suchversuchs), unabhängig vom Ausgang – dies ist
  Voraussetzung dafür, dass eine Markierung "nicht mit Primärqualität
  durchführbar" für Estimand 3(c) überhaupt zulässig ist (siehe Abschnitt 3).

## 11. Reporting

- **Tabelle 1 (Episodenliste, Primärdefinition):** je Episode Start, Ende,
  Dauer (Tage), Energiedefizit (GWh).
- **Tabelle 2 (Deckungsgrad je Szenario):** je Kapazitätsszenario (3a/3b/3c)
  und je Episode der Deckungsgrad (%), plus Verteilungsstatistik
  (Median, IQR, Min, Max, n) über alle Episoden. Für 3(c): entweder
  vollständige Deckungsgrad-Verteilung (falls BNetzA-Quelle gefunden) oder
  eigenständiger Vermerk "nicht mit Primärqualität durchführbar" mit
  Verweis auf das Suchprotokoll (Abschnitt 3/10) – keine Mischform.
- **Tabelle 3 (vollständige Sensitivitätsmatrix, Anhang):** alle in
  Abschnitt 6 spezifizierten Varianten (S1–S9) mit jeweiliger
  Verteilungsstatistik des Deckungsgrads, unabhängig vom Ergebnis
  vollständig berichtet; S8 ggf. mit Vermerk "noch ausstehend, wird
  nachgeliefert" (siehe Abschnitt 6).
- **Tabelle/Abschnitt 4 (Einordnung Fremdzahlen):** eigener berechneter
  Primärwert den vier eingangs genannten Fremdzahlen gegenübergestellt, mit
  expliziter Spalte "Methodischer/zeitlicher Unterschied" – keine
  "richtig/falsch"-Bewertung (siehe Abschnitt 8). Die "Ø 2,3 h
  Speicherdauer"-Zahl wird hier explizit mit dem Ergebnis von S5 (Abschnitt
  6) in Bezug gesetzt.
- **Pflicht-Disclaimer:** Der finale Ergebnisbericht muss die fünf
  Leitplanken aus Abschnitt 8 wörtlich oder sinngemäß als Disclaimer
  wiederholen, insbesondere die Nichtbewertung alternativer Lösungen und die
  Nichtbewertung der Medienlandschaft.
- **Rundung/Werttreue:** installierte Kapazitäten und Prognosewerte werden in
  der von der jeweiligen Quelle berichteten Präzision übernommen (keine
  zusätzliche Rundung über das Original hinaus); eigene berechnete Werte
  (Defizit, Deckungsgrad) werden mit nachvollziehbarer Nachkommastellenzahl
  (i. d. R. 1 Nachkommastelle bei GWh, ganzzahlig bei Prozent) berichtet.
- **Sprachregelung:** "Deckungsgrad" wird ausschließlich als beschreibendes
  Verhältnismaß verwendet, nicht als Wertung ("ausreichend"/"unzureichend").
- **Kennzeichnung Sekundärquellen:** Jede Verwendung der IWR-Prognose
  (Szenario 3b) ist an jeder Stelle im Bericht (Tabellen, Grafiken,
  Fließtext) unübersehbar als Sekundärquelle/Schätzung zu kennzeichnen
  (siehe Abschnitt 3).

## 12. Offene Rückfragen an den Menschen (vor Einfrieren zu klären)

1. ~~**Primäre Dunkelflaute-Definition**~~ — **Beantwortet, bestätigt
   (30.08.2026, Daniel Saure):** Die primäre Definition (10. Perzentil des
   Tagesquotienten Wind+Solar/Verbrauch, Mindestdauer 3 aufeinanderfolgende
   Tage, keine Unterbrechungstoleranz) ist bestätigt, keine Änderung
   (Abschnitt 2.1, 5.1).
2. ~~**Deckungsgrad-Annahmen**~~ — **Beantwortet, bestätigt (30.08.2026,
   Daniel Saure):** Anfangsladezustand 80 % und Rundtrip-Wirkungsgrad 85 %
   (Entladewirkungsgrad 0,92) sind als primäre Annahmen bestätigt, keine
   Änderung (Abschnitt 2.3, 5.1).
3. ~~**Vorgehen bei fehlender amtlicher 2030-Quelle**~~ — **Beantwortet
   (30.08.2026, Daniel Saure):** Keine alternative Sekundärquelle für
   Estimand 3(c) zulässig. Der Analyst muss ernsthaft und dokumentiert nach
   einer offiziellen BNetzA-Quelle suchen (z. B.
   Netzentwicklungsplan-Entwurf, Kraftwerkssicherheitsbericht) und diesen
   Suchversuch dokumentieren. Nur bei nachweislich gescheitertem
   Suchversuch wird Estimand 3(c) explizit als **"nicht mit
   Primärqualität durchführbar"** berichtet – **keine** Ersatzzahl aus
   einer Sekundärquelle (z. B. Frontier Economics), da dies dem Zweck der
   Analyse (eigene Primärrechnung statt einer fünften Fremdzahl)
   widerspräche. Diese Regel ist verbindlich in Abschnitt 2.3, 3, 9 und 10
   verankert, nicht nur hier vermerkt.
4. ~~**Umfang der Nachlade-Simulation (S8)**~~ — **Beantwortet (30.08.2026,
   Daniel Saure):** S8 bleibt reguläre, verpflichtende Sensitivitätsanalyse
   im SAP (nicht ersatzlos streichen) und ist als methodisch
   aufwendigste/fehleranfälligste Komponente gekennzeichnet. Sie ist
   gegenüber S1–S7 und S9 zeitlich flexibel: Bei Kapazitäts-/Zeitknappheit
   darf S8 verschoben/nachgeliefert werden, ohne die übrige Analyse zu
   blockieren; ein Ausstehen ist im Bericht explizit zu kennzeichnen (siehe
   Abschnitt 6, S8, und Abschnitt 7/11).
5. ~~**Sekundärquelle für Szenario 3(b)**~~ — **Beantwortet, bestätigt
   (30.08.2026, Daniel Saure):** IWR ist als Sekundärquelle für die
   Ende-2026-Kapazitätsprognose zulässig, sofern im Bericht durchgängig und
   unübersehbar als Sekundärquelle/Schätzung gekennzeichnet (analog zur
   Kennzeichnungspraxis für Sekundärdaten früherer Analysen dieses
   Projekts) – siehe Abschnitt 3 und 11.

**Alle fünf ursprünglich offenen Rückfragen sind damit beantwortet.** Es
bleiben keine offenen inhaltlichen Rückfragen aus v0.1 bestehen. Der SAP ist
weiterhin **nicht** eingefroren (Status `draft`, Version 0.2) – die Freigabe
setzt gemäß Projektregel voraus, dass der Mensch den vollständigen
aktuellen Dokumenttext (nicht nur diese Zusammenfassung) selbst liest und
ausdrücklich bestätigt.
