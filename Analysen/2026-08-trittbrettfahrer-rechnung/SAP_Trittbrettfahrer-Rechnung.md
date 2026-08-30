# Statistischer Analyseplan (SAP) – "Trittbrettfahrer-Rechnung"

**Titel:** Wenn alle Länder mit einem Emissionsanteil kleiner oder gleich dem
Deutschlands das "wir sind zu klein, um zu zählen"-Argument nutzten, welchen
kumulierten Anteil der weltweiten Treibhausgasemissionen würde das umfassen?
Eine deskriptive Konzentrationsanalyse ("Trittbrettfahrer-Rechnung").

**Version:** 0.1 (Entwurf)
**Datum:** 30.08.2026
**Autor:in:** sap-autor-Subagent (automatisiert erstellt, Entwurf zur Prüfung)
**Freigabe:** _________________________ Datum: __________ *(noch ausstehend –
siehe Abschnitt 0 und Zusammenfassung am Ende dieses Dokuments)*

---

## 0. Status dieser Analyse

[ ] Präregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

**Aktueller Status: `draft` (weder eingefroren noch präregistriert im
engeren Sinn).**

Dieses Dokument wurde verfasst, **bevor** irgendwelche Länder-, Emissions- oder
Bevölkerungsdaten für diese Fragestellung gesichtet wurden. Es liegen keine
Analyseergebnisse, Zahlen oder Grafiken vor, die in diesen SAP eingeflossen
sind – die Kernzahl aus der Auftragsbeschreibung (Deutschlands Emissionsanteil)
wurde bewusst **nicht** übernommen, sondern wird in Abschnitt 3/4 als
Ermittlungsschritt aus der Primärquelle festgeschrieben. Sobald ein
verantwortlicher Mensch (Karin o. Ä.) den vollständigen Text gelesen und
ausdrücklich freigegeben hat, wird oben die Checkbox "Präregistriert" gesetzt,
Version und Datum aktualisiert und der Status auf `final` geändert. Bis dahin
darf keine Datensichtung und kein Analyse-Code erfolgen (siehe
Projektanweisung, Workflow-Schritt 2→3).

---

## 1. Hintergrund / Rationale

In der öffentlichen Klimadebatte wird von einzelnen Staaten (u. a. Deutschland)
regelmäßig das Argument vorgebracht, der eigene Emissionsanteil an den
weltweiten Treibhausgasemissionen sei zu klein, um für die globale
Klimabilanz relevant zu sein ("wir sind zu klein, um zu zählen"). Eine
verbreitete Gegenrechnung lautet: Würden alle Länder mit einem gleich
kleinen oder kleineren Anteil dasselbe Argument nutzen, summierte sich das
möglicherweise zu einem erheblichen Teil der Weltemissionen – das Argument
wäre dann nicht mehr auf ein einzelnes Land beschränkt anwendbar, ohne dass
ein relevanter Teil der Emissionen "unadressiert" bliebe.

Diese Analyse liefert dazu eine rein **deskriptive
Konzentrations-/Aggregationsrechnung**: Sie beantwortet, wie groß der
kumulierte Anteil aller Länder ist, deren individueller Emissionsanteil
kleiner oder gleich dem Deutschlands ist – für aktuelle Jahresemissionen und
für kumulierte historische Emissionen, sowie stratifiziert nach
Pro-Kopf-Ausstoß, um eine unangemessene Vermischung mit einkommensschwachen
Ländern zu vermeiden.

**Wichtige Abgrenzung:** Diese Analyse ist **keine** Fortführung oder
Ersetzung einer Fairness-, Verantwortungs- oder Pro-Kopf-Gerechtigkeitsanalyse.
Sollte im Projekt bereits eine SAP-Analyse zu historischer Verantwortung
oder Emissions-Trendprojektion vorliegen, ist diese als inhaltlich
eigenständig zu behandeln und nicht als Vorstufe oder Ergänzung dieser
Rechnung zu interpretieren (siehe Abschnitt 8 für die explizite
Nicht-Aussage zu Fairness/Verantwortung). Der sap-autor hat zum Zeitpunkt der
Erstellung dieses Dokuments keine bereits eingefrorene SAP-Datei zu diesem
Thema im Projektordner auffinden können; sollte eine solche existieren, ist
sie vom Analysten ergänzend zu referenzieren, ohne dass sich an der
Estimand-Definition dieses SAP etwas ändert.

## 2. Fragestellung (Estimands)

Es werden **drei Estimands** strikt getrennt berechnet und berichtet. Keiner
ersetzt einen anderen; alle drei müssen im finalen Bericht gemeinsam
erscheinen (siehe Abschnitt 7).

### Estimand 1 (PRIMÄR) – Konzentrationskurve

Für zwei Zeithorizonte getrennt (siehe Estimand 2) wird jeweils eine Kurve
erstellt:

- Alle Länder (Definition siehe Abschnitt 4) werden absteigend nach ihrem
  Anteil an den weltweiten Emissionen sortiert.
- Die kumulierte Summe der Anteile (y-Achse, 0–100 %) wird als Funktion der
  Anzahl/Position der bereits eingeschlossenen Länder (x-Achse, Rang 1 = größter
  Emittent) dargestellt.
- Deutschlands Position (Rang und kumulierter Anteil an dieser Stelle) wird in
  der Grafik explizit markiert (z. B. vertikale/horizontale Hilfslinie plus
  Beschriftung).
- Dies ergibt **zwei** Kurven: (1a) auf Basis aktueller Jahresemissionen,
  (1b) auf Basis kumulierter historischer Emissionen. Beide sind gleichrangig
  zu berichten (siehe Estimand 2).

Diese Kurve – nicht eine einzelne Kennzahl – ist der **Hauptoutput** der
Analyse. Begründung: Ein einzelner Schwellenwert (Deutschlands Anteil) wirkt
sonst willkürlich privilegiert; die vollständige Kurve macht sichtbar, wie
empfindlich das Ergebnis von der genauen Schwellenwahl abhängt (vgl.
Abschnitt 6 und 8).

### Estimand 2 – Abgeleitete Kernzahl (Deutschlands Schwelle)

Kumulierter Anteil aller Länder mit individuellem Anteil **kleiner oder
gleich** Deutschlands Anteil (Deutschland selbst eingeschlossen), getrennt für:

- **2a – aktuelle Jahresemissionen:** Anteil bezogen auf das jeweils aktuellste
  vollständige Berichtsjahr der Primärquelle (siehe Abschnitt 3/4).
- **2b – kumulierte historische Emissionen:** Anteil bezogen auf die Summe der
  Emissionen jedes Landes seit Beginn der Zeitreihe der Primärquelle bis zum
  jeweils aktuellsten vollständigen Berichtsjahr.

Beide Zeithorizonte (2a, 2b) sind **gleichrangig** zu berichten – keiner ist
Haupt-, der andere Nebenbefund.

**Formale Definition (für beide Zeithorizonte gleich):**

Sei `s_i` der Anteil von Land `i` an der Summe aller `n` in die Analyse
einbezogenen Länder (Abschnitt 4), `s_DE` der Anteil Deutschlands. Dann ist
die Kernzahl:

```
Kernzahl = Summe(s_i) über alle i mit s_i <= s_DE
```

Deutschland ist in dieser Summe enthalten. Länder mit exakt identischem
Anteilswert wie Deutschland (auf der verwendeten Rundungsstufe der
Rohdaten) werden **eingeschlossen** (`<=`, nicht `<`) – diese Definition ist
im Auftrag bereits vorgegeben und wird nicht variiert.

### Estimand 3 – Fairness-Stratifizierung (Pro-Kopf-Filter)

Dieselbe Berechnung wie 2a (aktuelle Jahresemissionen), aber **beschränkt auf
die Teilmenge der Länder mit überdurchschnittlichem Pro-Kopf-Ausstoß**:

- Globaler Durchschnitt = Summe aller einbezogenen nationalen
  Gesamtemissionen (aktuelles Jahr, gleiche Quelle/Größe wie 2a) geteilt durch
  die Summe der zugehörigen Landesbevölkerungen (Weltbank, gleiches
  Berichtsjahr, siehe Abschnitt 3).
- Ein Land geht nur dann in die Kernzahl-Berechnung ein (sowohl im Zähler als
  auch im Nenner "aller einbezogenen Länder"), wenn sein Pro-Kopf-Ausstoß
  **über** diesem globalen Durchschnitt liegt.
- Innerhalb dieser reduzierten Ländermenge wird erneut die Schwelle
  "Anteil <= Deutschlands Anteil" angewendet – wobei Deutschlands Anteil hier
  auf die **reduzierte** Ländermenge bezogen neu berechnet wird (nicht der
  globale Anteil aus 2a). Beide Varianten (Anteil an Weltgesamtemissionen vs.
  Anteil an der Emissionssumme der pro-Kopf-überdurchschnittlichen Länder)
  werden nebeneinander ausgewiesen, klar beschriftet, um Verwechslungen
  auszuschließen.
- Voraussetzung: Deutschland liegt selbst über dem globalen
  Pro-Kopf-Durchschnitt. Diese Annahme wird als Teil der Datenermittlung
  geprüft und dokumentiert (nicht vorausgesetzt). Falls Deutschland **nicht**
  über dem globalen Pro-Kopf-Durchschnitt liegt, ist Estimand 3 in der
  vorliegenden Form nicht sinnvoll definierbar; in diesem (aus heutiger
  öffentlicher Datenlage unwahrscheinlichen, aber nicht ausgeschlossenen)
  Fall ist die Analyse zu stoppen und dem Menschen zur Entscheidung
  vorzulegen, statt eigenmächtig eine Ersatzdefinition zu wählen.

---

## 3. Datenquelle

Die Quellen werden **in dieser Reihenfolge** geprüft; ein Wechsel zu einer
nachrangigen Quelle ist nur zulässig, wenn der Zugriffsversuch auf die
vorrangige Quelle dokumentiert und der Grund für den Wechsel im Analyseskript
bzw. Reporting explizit festgehalten wird (kein stiller Fallback).

| Zweck | Quelle (Priorität) | Rolle |
|---|---|---|
| Aktuelle Jahresemissionen je Land (2a, Estimand 1a, Estimand 3) | **EDGAR** (Emissions Database for Global Atmospheric Research, EU JRC), Länder-Zeitreihe THG gesamt (CO2-Äq) | Primärquelle |
| Sensitivität zu aktuellen Jahresemissionen | **EDGAR**, CO2-only-Teilmenge derselben Datenbank | Sensitivität (Abschnitt 6) |
| Kumulierte historische Emissionen je Land (2b, Estimand 1b) | **Global Carbon Project / Global Carbon Budget**, nationale territoriale fossile CO2-Emissionen (fossil fuels + cement) | Primärquelle |
| Sensitivität zu historischen Emissionen | **Global Carbon Project**, Landnutzungsänderungs-Emissionen (LULUCF-Teildatensatz), zusätzlich zu fossilen Emissionen | Sensitivität (Abschnitt 6) |
| Kreuzprüfung/Ergänzung, falls Rohdatenzugriff auf EDGAR/GCP erschwert ist | **Our World in Data** (aggregiert EDGAR- bzw. GCP-Daten) | **Sekundärquelle** – nur zur Kreuzprüfung bzw. als dokumentierter Fallback, nicht gleichrangig mit EDGAR/GCP. Jede Verwendung von OWID-Zahlen anstelle der Primärquelle ist im Skript und Bericht explizit zu kennzeichnen. |
| Bevölkerung je Land (Estimand 3, Nenner Pro-Kopf-Berechnung) | **Weltbank** (World Development Indicators, Bevölkerung gesamt) | Primärquelle für diesen Zweck |

**Zugriffsdatum:** [vom Analysten beim tatsächlichen Datenzugriff einzutragen,
nicht vorab durch den SAP-Autor zu setzen]
**Datenstand laut Quelle:** [vom Analysten einzutragen – jeweils aktuellste
zum Zugriffszeitpunkt verfügbare Version/Vintage von EDGAR, GCP und Weltbank]

**Ermittlung von Deutschlands Ausgangswert (zwingend):** Deutschlands exakter
aktueller Emissionsanteil ist **nicht** Teil dieses SAP und wird an keiner
Stelle dieses Dokuments beziffert. Er ist ausschließlich aus der
EDGAR-Primärquelle zu ermitteln (Deutschlands nationale THG-Gesamtemission im
aktuellsten Berichtsjahr, geteilt durch die Summe aller einbezogenen
Länderemissionen desselben Jahres derselben Quelle) und als erster
Analyseschritt zu dokumentieren, bevor die Schwellenwertrechnung (Estimand 2)
ausgeführt wird. Eine Kreuzprüfung dieses Werts gegen OWID ist verpflichtend
zu dokumentieren (Abweichung in Prozentpunkten angeben); im Konfliktfall gilt
der EDGAR-Wert als maßgeblich für die Schwellendefinition.

## 4. Analysepopulation

- **Beobachtungseinheit:** Staaten/Länder gemäß EDGAR- bzw. GCP-Länderliste
  (ISO3-Code als Schlüssel zur Harmonisierung über alle vier Quellen hinweg,
  z. B. via `countrycode`-Paket oder gleichwertigem Mapping).
- **Zeitraum 2a/Estimand 1a/Estimand 3:** aktuellstes vollständiges
  Berichtsjahr, das in der zum Zugriffszeitpunkt aktuellen EDGAR-Version für
  (nahezu) alle Länder vorliegt. Wird für ein Land im aktuellsten Jahr kein
  Wert ausgewiesen, ist dies pro Land zu dokumentieren (siehe
  Ausschlusskriterien unten), nicht durch Interpolation zu ersetzen.
- **Zeitraum 2b/Estimand 1b:** vom frühesten in der zum Zugriffszeitpunkt
  aktuellen Global-Carbon-Budget-Version dokumentierten Jahr der nationalen
  fossilen CO2-Zeitreihe (in der Literatur meist ab ca. 1750, hier nicht als
  fixer Zahlenwert vorausgesetzt, sondern aus der Quelle selbst zu
  übernehmen) bis zum aktuellsten vollständigen Berichtsjahr, jeweils
  kumuliert je Land.
- **Einschlusskriterien:** Alle in der jeweiligen Quelle als souveräne
  Staaten bzw. eigenständig berichtete Länder geführten Einheiten, für die im
  betrachteten Jahr/Zeitraum ein numerischer Emissionswert vorliegt.
- **Ausschlusskriterien (zwingend zu dokumentieren, nicht dem Analysten zur
  Ad-hoc-Entscheidung zu überlassen):**
  - Regionale/supranationale Aggregate, die Doppelzählungen erzeugen würden
    (z. B. "EU27", "World", Kontinent-Summen) – nur die einzelnen
    Mitgliedstaaten fließen in die Länder-Rangfolge ein.
  - Nicht-nationale Sammelkategorien wie "International Shipping" oder
    "International Aviation" – separat auszuweisen, nicht in die
    Länder-Rangfolge einzurechnen, aber ihr Anteil an der Weltsumme ist im
    Bericht als Fußnote zu nennen (relevant für die Interpretierbarkeit von
    100 %-Summen).
  - Länder/Gebiete ohne numerischen Wert im jeweiligen Jahr in der
    verwendeten Quelle (z. B. wegen fehlender Berichterstattung) – als Liste
    im Analyseoutput dokumentieren, nicht stillschweigend auf 0 setzen.
  - Für Estimand 3 zusätzlich: Länder ohne zugehörigen
    Weltbank-Bevölkerungswert im selben Berichtsjahr – ebenfalls als Liste
    dokumentieren und von Estimand 3 ausschließen (mit Angabe, wie groß ihr
    Anteil an der THG-Gesamtsumme aus 2a ist, damit die Größenordnung des
    Ausschlusses einschätzbar bleibt).
- **Rangfolge-Tie-Break:** Bei exakt identischem Emissionsanteil zweier oder
  mehrerer Länder (auf der Rundungsstufe der Rohdaten) erfolgt die
  Rangvergabe alphabetisch nach ISO3-Code. Dies ist relevant für die
  Positionsangabe in Estimand 1 und die Nachbarschafts-Sensitivität in
  Abschnitt 6.
- **Deutschlands Rang:** Rang von Deutschland in der jeweiligen
  Länder-Rangfolge (aktuelles Jahr bzw. historisch kumuliert), abgeleitet aus
  derselben Sortierung wie Estimand 1.

## 5. Statistische Methoden

### 5.1 Primäranalyse

Diese Analyse ist **deterministisch-deskriptiv**, kein Schätz- oder
Testverfahren mit Stichprobenunsicherheit im klassischen Sinn. Primäranalyse
je Estimand:

- **Estimand 1 (1a, 1b):** Länder je Zeithorizont absteigend nach Anteil
  sortieren (Tie-Break siehe Abschnitt 4), kumulative Summe der Anteile
  berechnen, als Funktion des Rangs plotten, Deutschlands Position markieren.
- **Estimand 2 (2a, 2b):** Summenbildung aller Anteile mit `s_i <= s_DE`
  gemäß Formel in Abschnitt 2, getrennt für aktuelles Jahr (EDGAR, THG
  gesamt) und historisch kumuliert (GCP, fossile CO2 + Zement, ohne
  Landnutzungsänderung als Primärvariante).
- **Estimand 3:** Filterung auf pro-Kopf-überdurchschnittliche Länder (Basis:
  aktuelles Jahr, EDGAR THG gesamt, Weltbank-Bevölkerung desselben Jahres),
  dann Anwendung derselben Schwellenformel wie 2a auf die gefilterte
  Ländermenge, mit den zwei in Abschnitt 2 genannten Bezugsgrößen
  (Weltanteil vs. Anteil an der gefilterten Teilmenge).

### 5.2 Modellannahmen-Prüfung

Da kein Regressions-, Zeitreihen- oder Inferenzmodell gefittet wird (reine
Summen-/Rangbildung über einen Querschnitt bzw. eine kumulierte Summe),
entfallen klassische Diagnostik-Fragen wie **Autokorrelation** (relevant nur
bei Zeitreihenmodellen mit Residuen) und **Normalität** (relevant nur bei
Verfahren, die Normalverteilungsannahmen für Schätzer/Residuen benötigen,
z. B. t-Tests, lineare Regression). Diese werden hier **nicht** durchgeführt;
diese Nichtanwendbarkeit ist explizit zu vermerken, nicht stillschweigend zu
übergehen:

- Die Verteilung der Länderanteile ist per Konstruktion extrem rechtsschief
  (wenige sehr große Emittenten, viele kleine) – das ist der Gegenstand der
  Analyse selbst (Konzentrationskurve), keine zu prüfende/zu korrigierende
  Modellannahme.
- Es gibt keine zeitliche Abfolge von Beobachtungen innerhalb eines
  Estimand-Zweigs, auf die sich Autokorrelation beziehen könnte (2a/Estimand
  1a/Estimand 3 sind Querschnitte eines Jahres; 2b/Estimand 1b ist eine
  bereits kumulierte Summe über die Zeit, kein Zeitreihenmodell).
- **Stattdessen relevante Robustheitsprüfung:** Sensitivität der
  Kernergebnisse gegenüber (a) Datenrevisionen zwischen Quellenversionen,
  (b) alternativer Gasbasis (CO2 vs. THG gesamt), (c) alternativer
  Systemgrenze (production- vs. consumption-based), (d) Einbezug/Ausschluss
  von Landnutzungsänderungs-Emissionen. Diese werden in Abschnitt 6 als
  Sensitivitätsanalysen geführt, nicht als "Annahmenkorrektur".

### 5.3 Korrektur bei Annahmenverletzung

Entfällt (siehe 5.2) – es gibt keine zu korrigierenden Modellannahmen, da
kein statistisches Modell im engeren Sinn gefittet wird.

### 5.4 Unsicherheitsquantifizierung

- Kein Konfidenzintervall im klassischen (stichprobenbasierten) Sinn, da
  keine Stichprobe aus einer Grundgesamtheit gezogen wird, sondern (nahezu)
  vollständige Länderabdeckung vorliegt.
- Stattdessen: Sofern EDGAR bzw. GCP für die Weltsumme oder für einzelne
  Länder dokumentierte Unsicherheitsbandbreiten ausweisen (z. B. GCP nennt
  regelmäßig eine Gesamtunsicherheit für die globale fossile CO2-Bilanz),
  sind diese im Bericht als Kontextinformation zu übernehmen und explizit als
  **Quellen-Unsicherheit**, nicht als statistische Inferenzunsicherheit
  dieser Analyse, zu kennzeichnen.
- Die in Abschnitt 6 festgelegten Sensitivitätsanalysen (Gasbasis,
  Systemgrenze, Schwellennachbarschaft, Datenvintage) dienen als
  primäres Instrument, um die Robustheit der Kernzahlen sichtbar zu machen
  – anstelle eines klassischen Konfidenzintervalls.

### 5.5 Signifikanzniveau

Nicht zutreffend – es werden keine Hypothesentests durchgeführt und keine
p-Werte berichtet. Alle Ergebnisse sind deskriptive Kennzahlen mit
zugehörigen, vorab festgelegten Sensitivitätsvarianten (Abschnitt 6/7).

## 6. Sensitivitätsanalysen

Alle folgenden Varianten sind **vorab** festgelegt und werden **zusätzlich**
zur Primäranalyse berichtet (nicht als Ersatz, nicht als Auswahlmenge zur
nachträglichen Bestwert-Selektion):

1. **Gasbasis (aktuelles Jahr):** CO2-only statt THG gesamt (CO2-Äq), EDGAR,
   für Estimand 1a, 2a und Estimand 3.
2. **Systemgrenze (aktuelles Jahr):** Konsumbasierte statt produktionsbasierte
   Emissionen, sofern über OWID (auf Basis publizierter
   Konsum-Emissionsdaten, z. B. Global Carbon Project consumption-based
   accounting) verfügbar, für Estimand 2a. Explizit als Sekundärquelle
   gekennzeichnet (siehe Abschnitt 3) und im Bericht getrennt von der
   produktionsbasierten Primärzahl ausgewiesen (siehe auch Abschnitt 8,
   Produktions- vs. Konsumperspektive).
3. **Historische Systemgrenze:** Einbezug der GCP-Landnutzungsänderungs-
   Emissionen zusätzlich zu fossilen Emissionen + Zement, für Estimand 1b
   und 2b, getrennt von der Primärvariante (nur fossil + Zement) ausgewiesen,
   mit Hinweis auf die höhere Modellunsicherheit dieser Teilkomponente.
4. **Schwellennachbarschaft ("Rank-Sensitivity"):** Kumulierter Anteil nicht
   nur exakt am Rang Deutschlands, sondern zusätzlich an den Rängen
   Deutschland−20, Deutschland−10, Deutschland+10 und Deutschland+20 (jeweils
   inklusive aller Länder bis zu diesem Rang), tabellarisch für **beide**
   Zeithorizonte (2a und 2b). Zweck: Sichtbarmachen, wie stark die Kernzahl
   von der exakten Position Deutschlands abhängt (siehe Abschnitt 8).
5. **Alternative Pro-Kopf-Referenz (Estimand 3):** Zusätzlich zur
   primären Schwelle "globaler Pro-Kopf-Durchschnitt (Mittelwert)" wird
   dieselbe Berechnung mit dem **globalen Pro-Kopf-Median** als Schwelle
   wiederholt, da der Mittelwert durch einzelne sehr hohe
   Pro-Kopf-Emittenten (z. B. kleine, ölexportierende Staaten) nach oben
   verzerrt sein kann. Beide Varianten werden nebeneinander berichtet, mit
   klarer Kennzeichnung, welche primär ist (Mittelwert, wie im Auftrag
   festgelegt).
6. **Datenvintage-Kreuzprüfung:** Vergleich der EDGAR-Primärzahl für
   Deutschlands aktuellen Anteil (Estimand 2a-Ausgangswert) gegen den
   entsprechenden OWID-Wert; Abweichung in Prozentpunkten dokumentieren
   (siehe Abschnitt 3).

## 7. Umgang mit Mehrfachtestung / Multiplizität

Es werden keine p-Werte berechnet, daher keine klassische
Alpha-Adjustierung (z. B. Bonferroni). Das funktionale Äquivalent zur
Multiplizitätskontrolle ist hier die **verpflichtende gemeinsame Berichtung
aller vorab festgelegten Varianten**, um eine nachträgliche Auswahl des
"eindrucksvollsten" Ergebnisses auszuschließen:

- Im finalen Bericht **müssen immer alle drei Estimands** (1, 2, 3)
  erscheinen – nie nur Estimand 2 (die Einzelzahl) isoliert ohne die
  Konzentrationskurve (Estimand 1).
- Innerhalb von Estimand 2 **müssen immer beide Zeithorizonte** (2a und 2b)
  gemeinsam erscheinen, nie nur der plakativere Wert.
- Alle sechs in Abschnitt 6 festgelegten Sensitivitätsanalysen **müssen im
  Bericht auftauchen** (mindestens als Tabelle/Anhang), auch wenn die
  Kernaussage im Fließtext primär auf der jeweiligen Primärvariante beruht.
- Die Rank-Sensitivity-Tabelle (Abschnitt 6, Punkt 4) ist **verpflichtend**
  gemeinsam mit jeder Nennung der Kernzahl aus Estimand 2 darzustellen oder
  mindestens in unmittelbarer Nähe zu verlinken/referenzieren – nicht als
  optionaler Anhang, der übersprungen werden kann.
- Kein Ergebnis (Primär- oder Sensitivitätsvariante) darf nachträglich als
  "nicht relevant" aus dem Bericht entfernt werden, weil es weniger
  eindrucksvoll ausfällt als eine andere Variante.

## 8. Interpretationsrahmen / Confounder

*Fester Abschnitt, vor der Analyse ausgefüllt, nicht erst beim Schreiben des
Ergebnistexts.*

- **Produktions- vs. Konsum-Perspektive:** Die Primäranalyse verwendet
  durchgängig **produktionsbasierte** (territoriale) Emissionen (EDGAR,
  GCP). Das bedeutet, Emissionen werden dort gezählt, wo sie physisch
  entstehen, nicht dort, wo die daraus resultierenden Güter/Dienstleistungen
  konsumiert werden. Für Länder mit hohem Nettoimport emissionsintensiver
  Güter (potenziell auch Deutschland) kann die konsumbasierte Zahl
  (Sensitivität, Abschnitt 6, Punkt 2) spürbar höher liegen als die
  produktionsbasierte. **Fehlinterpretation, die zu vermeiden ist:** Der
  Bericht darf die produktionsbasierte Kernzahl nicht so formulieren, als
  beschreibe sie die "tatsächliche Klimaverantwortung" eines Landes – sie
  beschreibt ausschließlich territoriale Emissionsanteile.
- **Keine implizite Politik-/Verhaltensbewertung:** Diese Analyse trifft
  **keine Aussage** darüber, ob ein niedriger oder hoher Emissionsanteil
  eines Landes auf ambitionierte Klimapolitik, auf strukturelle Faktoren
  (Wirtschaftsgröße, Industriestruktur, Bevölkerungszahl, historische
  Entwicklungsphase) oder auf reinen Zufall der Ländergrenzen zurückgeht. Der
  Bericht formuliert ausschließlich Anteils-/Konzentrationsaussagen, keine
  Bewertung von Maßnahmen oder Ambition.
- **Explizit KEINE Fairness-, Verantwortungs- oder Schuld-Aussage:** Diese
  Analyse macht **keine** Aussage über historische/moralische
  Verantwortung, über Pro-Kopf-Fairness insgesamt oder darüber, welches Land
  "mehr schuld" an der Klimakrise trägt. Es handelt sich um eine rein
  deskriptive Aggregationsrechnung über aktuelle bzw. historische
  Emissionsanteile ("was wäre, wenn alle Länder unterhalb einer bestimmten
  Anteilsschwelle dasselbe Argument nutzten"). Dies unterscheidet sich
  grundlegend von einer Fairness- oder Verantwortungsanalyse (die z. B.
  historische kumulierte Pro-Kopf-Emissionen, Entwicklungsstand oder
  Kolonialgeschichte einbeziehen würde).
- **Explizite Abgrenzung zu `Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md`:**
  Im Projektordner existiert bereits eine weitere SAP-Analyse zu
  Deutschland, die **nicht** mit dieser Rechnung verwechselt werden darf.
  Beide behandeln zwar Deutschlands Emissionen, beantworten aber
  grundverschiedene Fragestellungen mit unterschiedlichen statistischen
  Verfahren:
  - **`Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md`:**
    Wie entwickeln sich Deutschlands **eigene** Emissionen zeitlich? Eine
    **Trendprojektion/Trendfortschreibung** (lineare Regression über die
    Zeit inkl. Prognoseintervall) für **ein einzelnes Land** in die
    **Zukunft** (Projektion bis 2040 gegen das gesetzliche -88 %-Ziel).
  - **`Analysen/2026-08-trittbrettfahrer-rechnung/SAP_Trittbrettfahrer-Rechnung.md`
    (dieser SAP):** Wie groß ist der **kumulierte Anteil aller Länder** mit
    einem Emissionsanteil kleiner oder gleich Deutschlands Anteil an den
    weltweiten Emissionen? Eine **Querschnitts-Aggregation über viele
    Länder** zu einem Zeitpunkt (aktuelles Jahr) bzw. kumulativ über die
    Historie. **Keine Projektion, keine Aussage** über Deutschlands eigene
    zukünftige Entwicklung.

  Der Bericht dieser Analyse muss diesen Unterschied explizit benennen
  (Dateiname/Pfad der anderen Analyse nennen, nicht nur vage auf "eine
  frühere Analyse" verweisen), ohne inhaltliche Aussagen oder Ergebnisse der
  Trendprojektions-Analyse zu übernehmen, vorwegzunehmen oder mit den
  Estimands dieses SAP zu vermischen.
- **Schwellenwahl "Deutschlands Anteil" ist illustrativ, nicht methodisch
  privilegiert:** Die Wahl gerade dieser Schwelle ergibt sich allein aus der
  Fragestellung des Auftrags (Bezug auf ein konkretes, in der öffentlichen
  Debatte diskutiertes Land), nicht aus einem statistischen Kriterium. Aus
  diesem Grund ist Estimand 1 (die vollständige Konzentrationskurve) der
  primäre Output, und die Rank-Sensitivity-Analyse (Abschnitt 6, Punkt 4)
  ist verpflichtend mitzuberichten. Der Bericht muss explizit festhalten,
  dass eine geringfügig andere Schwelle (wenige Ränge höher oder niedriger)
  zu einer anderen Kernzahl führen kann, ohne dass dies die grundsätzliche
  Aussage der Konzentrationskurve verändert.
- **Keine Aussage über tatsächliches Verhalten einzelner Länder:** Die
  Analyse ist ein reines Gedankenexperiment ("was wäre, wenn"). Es wird
  **keine** Aussage getroffen und **keine** Daten werden erhoben darüber, ob,
  wie oft oder in welchem Kontext einzelne konkrete Länder dieses oder ein
  ähnliches Argument tatsächlich öffentlich verwenden. Jede Formulierung im
  Bericht, die dies suggeriert (z. B. "Land X argumentiert, dass..."), ist
  unzulässig; zulässig ist ausschließlich die hypothetische Formulierung
  ("würden alle Länder unterhalb dieser Schwelle so argumentieren...").
- **Transitivitätsannahme bei indirekten/Netzwerk-Vergleichen:** Nicht
  anwendbar – diese Analyse enthält keine indirekten Vergleiche über einen
  Brückenkomparator, sondern eine direkte Rangfolge/Summierung aller Länder
  auf derselben Größe (Emissionsanteil bzw. kumulierter Anteil).
- **Regression-zur-Mitte bei Trendvergleichen:** Nicht anwendbar im
  engeren Sinn, da kein Trend- oder Vorher-Nachher-Vergleich einzelner
  Länder durchgeführt wird, sondern ein Querschnitts- bzw.
  Kumulationsvergleich zu einem bzw. zwei Zeitpunkten/Zeiträumen. Zu
  beachten ist lediglich, dass der Vergleich von 2a (aktuelles Jahr) und 2b
  (historisch kumuliert) **keine Trendaussage** über einzelne Länder
  darstellt, sondern zwei separate Momentaufnahmen unterschiedlicher
  zeitlicher Aggregation (siehe auch Limitationen, Abschnitt 9, zur
  unterschiedlichen Gasbasis von 2a und 2b).

## 9. Limitationen

- **Unterschiedliche Gasbasis zwischen den Zeithorizonten:** Estimand 2a/1a
  (aktuelles Jahr) basiert primär auf EDGAR-THG-gesamt (CO2-Äquivalent,
  Kyoto-Gase o. ä., je nach EDGAR-Definition), während Estimand 2b/1b
  (historisch kumuliert) primär auf GCP-fossilem CO2 (+ Zement) basiert, ohne
  weitere Treibhausgase. Diese beiden Kernzahlen sind **nicht direkt
  wertgleich vergleichbar**, obwohl dieselbe Rechenformel verwendet wird –
  dies muss im Bericht explizit als struktureller Unterschied benannt
  werden, nicht nur implizit aus den Quellenangaben ableitbar sein.
- **Datenrevisionen:** EDGAR- und GCP-Datensätze werden periodisch
  rückwirkend revidiert. Die in dieser Analyse verwendeten Werte spiegeln
  den zum Zugriffszeitpunkt aktuellen Datenstand (Vintage) wider; spätere
  Revisionen können zu geringfügig abweichenden Werten führen. Vintage und
  Zugriffsdatum sind daher zwingender Bestandteil der Dokumentation
  (Abschnitt 3).
- **Ländergrenzen-/Klassifikationsänderungen über die Zeit:** Für die
  historische Kumulation (2b/1b) können Grenzänderungen, Staatsauflösungen
  oder -neugründungen (z. B. UdSSR, Jugoslawien, Sudan/Südsudan) die
  Zuordnung historischer Emissionen zu heutigen Staatsgebieten erschweren.
  Es wird die von GCP selbst vorgenommene Zuordnungskonvention übernommen,
  ohne eigene Neuzuordnung; abweichende Konventionen anderer Quellen (z. B.
  OWID) werden nicht nachträglich harmonisiert, sondern als
  Quellenunterschied dokumentiert, falls dies bei der Kreuzprüfung auffällt.
- **Fehlende/unterdrückte Länderdaten:** Für einzelne Länder (insbesondere
  kleine Inselstaaten, Konfliktregionen) können in einer oder mehreren
  Quellen keine oder nur geschätzte Werte vorliegen. Deren Ausschluss
  (Abschnitt 4) kann die Kernzahlen geringfügig verzerren; der summierte
  Anteil ausgeschlossener Länder an der Weltgesamtemission ist daher als
  Kontextangabe im Bericht auszuweisen.
- **EU als Sonderfall:** Die Europäische Union wird in manchen Quellen
  sowohl als Aggregat als auch über ihre Mitgliedstaaten separat
  ausgewiesen. Es fließen ausschließlich die Einzelstaaten in die
  Länder-Rangfolge ein (siehe Abschnitt 4); dies ist bei der Interpretation
  von Deutschlands Rang zu berücksichtigen, da die EU als politischer Block
  in der öffentlichen Debatte teils gemeinsam auftritt, in dieser Analyse
  aber bewusst nicht als ein "Land" gezählt wird.
- **Keine kausale oder prognostische Aussage:** Die Analyse beschreibt einen
  Ist-Zustand (bzw. eine historische Kumulation) zum Zugriffszeitpunkt. Sie
  trifft keine Aussage über zukünftige Emissionsentwicklungen oder darüber,
  was passieren würde, wenn Länder tatsächlich ihre Emissionen aufgrund
  dieses Arguments veränderten.

## 10. Software

- **Sprache/Umgebung:** R (Version beim tatsächlichen Analyselauf durch den
  analyst-Subagenten zu dokumentieren, z. B. via `sessionInfo()`).
- **Vorgesehene Pakete (durch Analysten bei Bedarf zu ergänzen/anzupassen,
  keine Ergebnisse vorwegnehmend):** `dplyr`/`tidyverse` (Datenaufbereitung),
  `readr`/`readxl` (Einlesen der Rohdaten), `countrycode` (ISO3-Harmonisierung
  über EDGAR/GCP/OWID/Weltbank hinweg), `ggplot2` (Konzentrationskurve),
  `knitr`/`gt` o. ä. (Tabellenoutput für Sensitivitätsanalysen).
- **Skript-Ablage:** `Analysen/2026-08-trittbrettfahrer-rechnung/trittbrettfahrer-rechnung.R`
  (Dateiname durch Analysten exakt zu übernehmen, Ordnerstruktur gemäß
  Projektanweisung).
- **Output-Ablage:** `Analysen/2026-08-trittbrettfahrer-rechnung/output/`

## 11. Reporting

- **Darstellung Estimand 1 (primär):** Zwei Konzentrationskurven-Grafiken
  (aktuelles Jahr / historisch kumuliert), x-Achse = Länderrang, y-Achse =
  kumulierter Anteil in %, Deutschlands Position jeweils farblich/durch
  Beschriftung hervorgehoben.
- **Darstellung Estimand 2:** Tabelle mit den Werten 2a und 2b nebeneinander,
  inkl. Deutschlands zugrundeliegendem Anteilswert, Rang und Anzahl der
  eingeschlossenen Länder, jeweils mit Primär- und Sensitivitätsvarianten
  aus Abschnitt 6 in derselben oder einer unmittelbar angrenzenden Tabelle.
- **Darstellung Estimand 3:** Tabelle analog zu 2a, mit expliziter Angabe der
  Anzahl der Länder über/unter der Pro-Kopf-Schwelle, sowie der
  Median-Sensitivität (Abschnitt 6, Punkt 5) direkt daneben.
- **Darstellung Rank-Sensitivity (Abschnitt 6, Punkt 4):** Tabelle mit den
  fünf Rangpositionen (DE−20, DE−10, DE, DE+10, DE+20) und zugehörigem
  kumuliertem Anteil, für beide Zeithorizonte.
- **Rundung:** Prozentanteile auf eine Nachkommastelle; absolute
  Länderanzahlen ganzzahlig; Pro-Kopf-Werte (t CO2-Äq/Kopf) auf zwei
  Nachkommastellen.
- **Beschriftungspflicht:** Jede Grafik/Tabelle muss eindeutig kennzeichnen,
  ob es sich um die Primärvariante oder eine Sensitivitätsvariante handelt,
  sowie Quelle, Zugriffsdatum und Berichtsjahr(e) enthalten.
- **Sprachliche Vorgabe:** Formulierungen im Fließtext folgen strikt dem
  Interpretationsrahmen aus Abschnitt 8 (keine Fairness-/Schuld-Sprache,
  keine Aussage über tatsächliches Länderverhalten, durchgängig
  konjunktivisch/hypothetisch für das "Trittbrettfahrer"-Gedankenexperiment).

---

## Änderungsprotokoll

| Version | Datum | Änderung |
|---|---|---|
| 0.1 | 30.08.2026 | Erstentwurf (draft), noch keine Datensichtung, keine Freigabe |
| 0.1 | 30.08.2026 | Abschnitt 8: Abgrenzungshinweis zu `SAP_DE-Emissionen-Trendprojektion-2040.md` konkretisiert (Dateipfad + zwei Stichpunkte zur Unterscheidung der Fragestellungen). Status weiterhin `draft`, keine Freigabe. |
</content>
