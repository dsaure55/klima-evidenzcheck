# Erratum 1 zum SAP „Expertenrat-Budgetabgleich 2030“ (v1.1)

**Status: ENTWURF, nicht freigegeben.** Freigabe/Datierung durch Daniel Saure ausstehend. Ein Freigabevermerk wird erst eingetragen, nachdem Daniel Saure den vollständigen aktuellen Text gelesen und ausdrücklich bestätigt hat (CLAUDE.md, Verifikationspflicht).
**Entwurf vom:** 23.10.2026 (Claude, Top-Level-Session)
**Bezug:** `SAP_Expertenrat-Budgetabgleich-2030.md`, Version 1.1 (eingefroren 29.08.2026, Commit `d9215cb`). **Der SAP-Text wird durch dieses Erratum nicht verändert.**
**Anlass:** Validierungsbericht (`Validierungsbericht_expertenrat-budgetabgleich.md`), Befunde W1, W2, W5 und Rückfragen RF-1 bis RF-7 im Abweichungsprotokoll; Empfehlung des Validators (Nachtrag 1), die Punkte in einer eigenen, datierten Datei festzuhalten.
**Geltung:** für den Analyselauf vom 23.10.2026 (Fassung 1 bis 3 des Analyseberichts).

## 0. Was ein Erratum ist und was nicht

- Es **berichtigt Sachfehler im SAP-Text** und **schließt Lücken**, die der SAP offenließ. Es ändert weder Estimands noch Methoden noch Klassifikationsregeln.
- Es ist **kein Amendment** im Sinne einer Methodenänderung. Jede inhaltliche Methodenänderung bräuchte ein gekennzeichnetes Amendment mit erneuter Freigabe.
- Es ersetzt **nicht** die Freigabe des SAP vom 29.08.2026. Die Textwidersprüche im SAP (Abschnitt 0 „Status: draft“, Offene Punkte Nr. 6, abgebrochene Header-Zeile) bleiben im SAP-Text stehen und werden hier erklärt (Abschnitt 5).

## 1. Sachfehler: Die 625 Mt sind kein 2025-Emissionswert (SAP Abschnitte 1, 3, 4a.1, 4a.2, 6.3)

**Was im SAP steht:** Der SAP nimmt an, ein FAZ-Artikel nenne „ca. 625 Mt Gesamtemissionen für 2025“, und leitet daraus eine „Diskrepanz 2025-Basiswert“ (625 Mt gegen 648,83 Mt) ab. Darauf bauen die Entscheidungsregel 4a.2 und die parallele Berechnung in 6.3 auf.

**Befund (Analyse vom 23.10.2026, Validierung bestätigt):**
- Laut Agora Energiewende (Pressemitteilung vom 28.08.2026, Primärquelle von den analyst- und validator-Subagenten gelesen) sind 625 Mt die **gesetzliche Emissionshöchstmenge für 2026**, kein Emissionswert für 2025. Es gibt keinen alternativen 2025-Emissionswert neben 648,83 Mt (UBA via klimadashboard.de).
- Anlage 2 des Bundes-Klimaschutzgesetzes (am 23.10.2026 abgerufen, `rohdaten/ksg/`) nennt für 2026 **604 Mt** (die Anlage summiert zu 6.199 Mt, dem Gesamtbudget 2021–2030).
- **Herkunft der 625 Mt: nicht belegt.** Eine Plausibilitätsrechnung (604 Mt plus der Anteil der nach § 4 Abs. 2 KSG angepassten Jahresmenge, grob 604 + 21,2 = 625,2) ist eine Rekonstruktion des Validators bzw. des analysts und **keine belegte Quelle**. In den Expertenrat-Dokumenten kommt die Zahl 625 nicht vor.

**Folgen:**
- **Estimand 1:** nicht betroffen (verwendet nach 4a.2 ohnehin 648,83 Mt).
- **Estimand 2:** Primärbasis 2025 = 648,83 Mt bleibt richtig.
- **4a.1 und 4a.2:** Die dort beschriebene „Diskrepanz“ besteht in dieser Form nicht. Die Entscheidungsregel für die Diskrepanz wurde nicht ausgelöst.
- **6.3:** Die parallele Berechnung mit 625 Mt war nach dieser Klärung **nicht SAP-vorgeschrieben**. Sie wurde dennoch gerechnet und steht **nur in Anhang A des Analyseberichts** (post hoc, zur Dokumentation).
- **Verwendung:** Anhang A bleibt als Audit-Trail im Repository. Er geht **nicht** in Substack-Stücke, Kapitel oder Kanaltexte ein (Entscheidung Daniel Saure, 23.10.2026).
- Die bereits veröffentlichte 2040-Analyse wird nicht rückwirkend verändert.

## 2. Lücken im SAP, die der Analyselauf schließen musste

| Nr. | Lücke | Umsetzung im Lauf vom 23.10.2026 | Quelle der Festlegung |
|---|---|---|---|
| L1 | Blocklänge des Moving-Block-Bootstrap (SAP 5.4, Verfahren 2) nicht festgelegt | Blocklänge 2, B = 2.000, Seed 20260827 | übernommen aus dem Amendment v1.1 der Länder-Analyse (RF-4). Bei n = 36 und starker Autokorrelation in Fenster A ist Länge 2 knapp |
| L2 | Newey-West-HAC (SAP 5.3): Bandbreite/Voreinstellungen des Schätzers nicht festgelegt | Voreinstellungen des im Skript genutzten HAC-Schätzers; das Prewhitening wirkt stark (Standardfehler der 5-Jahres-Summe in Fenster A: OLS 63,2 Mt, HAC mit Prewhitening 268,3 Mt, ohne Prewhitening 134,9 Mt; Validierungsbericht G3) | Skript und Analysebericht, Abschnitt Diagnostik |
| L3 | H1 2025 nicht direkt in der Quelle | Abgeleitet aus Agora: H1 2026 = 327 Mt, „rund 7 Mt bzw. 2 Prozent weniger“, also H1 2025 = 334 Mt, Rate = −7/334 = −2,096 %. Post hoc zusätzlich mit der von Agora genannten gerundeten Rate −2,0 %; Einordnung identisch | RF-5 |
| L4 | „Numerisch näher an Expertenrat bzw. Bundesregierung“ (SAP 2, 8c) nicht definiert | Post-hoc, nur deskriptiv: Distanz zum Expertenrat = 0 im Korridor 60–100 Mt, sonst Abstand zum nächsten Rand; Distanz zur Bundesregierung = Abstand zum Overshoot-Wert −4,5 Mt (Puffer). **Die Operationalisierung ist strukturell zugunsten des breiten Korridors verzerrt und für Fenster-A-Zeilen bedeutungslos** (Validierungsbericht, RF-6) | RF-6 |
| L5 | Fenster C (n = 6) „rein deskriptiv“, soll aber in allen Tabellen erscheinen | Punktschätzung, OLS-Kovarianz ohne HAC, Intervalle berechnet, ausdrücklich „nicht inferenziell“ | RF-9 |
| L6 | Dateiname des Skripts | `expertenrat-budgetabgleich.R` (Auftragsname; SAP nennt `Expertenrat-Budgetabgleich-2030.R`) | RF-10 |
| L7 | Saisonal gewichtete Hochrechnung (SAP 2, 6.4) | **entfällt ersatzlos**, weil keine fünf vollständigen H1/H2-Paare öffentlich auffindbar waren (Suchprotokoll `rohdaten/suchprotokoll/`). Eine zusätzliche Suche in UBA/AGEB (ohne Tiefensuche in PDF-Anhängen) blieb ohne Treffer | SAP 6.4 selbst sieht das vor |

## 3. Intervallarten in Estimand 2 (SAP 5.4)

- Der SAP nennt drei Verfahren für die Unsicherheit der kumulativen Summe und verlangt, sie nebeneinander zu tabellieren. Die drei sind **nicht gleichartig**: Verfahren 1 (analytisch-parametrisch) und 2 (Moving-Block-Bootstrap) liefern ein **Parameterintervall** (Unsicherheit der geschätzten Trendparameter). Verfahren 3 (ARIMA) liefert ein **Prognoseintervall** (auch die Streuung künftiger Jahreswerte).
- Die Spalten heißen deshalb im Analysebericht ab Fassung 2 „Parameterintervall“ und „Prognoseintervall“. Die Klassifikation stützt sich nur auf die Punktwerte (Spalte „Klassifikation (nur Punktwert)“).
- Ein zusätzliches **post hoc** gekennzeichnetes Prognoseintervall für die OLS-Verfahren ist **deskriptiv** und fließt nicht in Klassifikation, Kernaussage oder Haupttabelle ein (Empfehlung des Validators: kein Amendment nötig, solange es dabei bleibt).

## 4. Quellen (SAP 3)

- **Quelle 3 (FAZ-Artikel):** nicht abrufbar (Paywall). Die zitierten Zahlen wurden bei Agora (28.08.2026) und im Prüfbericht des Expertenrats direkt gefunden. Der FAZ-Artikel bleibt nur Fundstellenhinweis.
- **Quelle 4 (Expertenrat, Prüfbericht Projektionsdaten 2026, Mai 2026, veröffentlicht 18.05.2026):** wurde aufgefunden. Der Fallback (nur Randwerte 60/100 Mt) kam **nicht** zur Anwendung. Gesamtbudget 2021–2030: 6.199 Mt (ohne LULUCF), Projektionsdaten 2026: 6.194 Mt, Puffer 4,5 Mt.
- **Quelle 5 (UBA-Projektionsdaten 2026):** nicht direkt abrufbar, nur über den Expertenrat-Bericht belegt.
- **Zugriffsdatum Quelle 1:** zusätzlich am 23.10.2026 abgerufen und gegen die 36 Werte im alten Skript verglichen (identisch, Abweichung ≤ 0,005 Mt durch Rundung).

## 5. Statusfragen im SAP-Text (W1, RF-1)

- Kopf des SAP: „Status: final, eingefroren am 29.08.2026, freigegeben durch Daniel Saure“; Commit `d9215cb`: „Volltext von Daniel Saure vollständig gelesen und freigegeben, 29.08.2026“.
- Im Text des SAP stehen weiter „Status: draft“ in Abschnitt 0, die abgebrochene Header-Zeile (Zeilen 9–11) und **Offene Punkte Nr. 6a und 6b** als „NOCH OFFEN“.
- **Bestätigung vom 23.10.2026:** Daniel Saure hat im Chat bestätigt, dass der SAP eingefroren ist (Wortlaut in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md`; das Zitat dort ist nach 300 Zeichen abgeschnitten).
- **Offen und von Daniel Saure zu beantworten:**

| Punkt | Frage laut SAP | Vorschlag des sap-autors | Empfehlung für diesen Entwurf | Entscheidung Daniel Saure |
|---|---|---|---|---|
| 6a | „Prüfbericht-Fund nicht garantiert“ als eigener Blocker oder als reine Limitation (SAP 9)? | Limitation | **Limitation**: Der Prüfbericht wurde tatsächlich gefunden, ein Blocker ist damit gegenstandslos | **Limitation reicht** (Daniel Saure, 23.10.2026, Chat: „6a: Limitation reicht.“) |
| 6b | Datenquellen-Zeile 5 „Bundesregierung, Projektionsdaten 2026“ (4,5-Mt-Puffer) als Arbeitsvorschlag bestätigen oder verwerfen | probeweise eingefügt | **bestätigen** (Quelle 5 ist im SAP und im Lauf nur als Kontext verwendet und fließt in keine Modellschätzung ein; Beleg nur über den Expertenrat-Bericht, siehe Abschnitt 4) | **bestätigt** (Daniel Saure, 23.10.2026, Chat: „6b: Datenquellen-Zeile 5 (Bundesregierung, Projektionsdaten 2026) wird bestätigt.“) |

Die Antworten zu 6a und 6b liegen seit 23.10.2026 vor (Chat). Sie ersetzen nicht die Freigabe dieses Erratums und nicht die Lektüre des Volltextes. Daniel Saure hat angekündigt, das Erratum jetzt vollständig zu lesen; die Freigabe steht aus.

## 6. Was dieses Erratum nicht ändert

- Estimands, Fenster A/B/C, Methoden (OLS, Newey-West bei signifikanter Autokorrelation, Moving-Block-Bootstrap, ARIMA), Signifikanzniveau 0,05, Toleranzschwellen 0,05 und 0,1 Prozentpunkte, Klassifikationsregeln.
- Die Aussage des Analyseberichts, dass die Ergebnisse stark von Fenster und Methode abhängen und die Analyse keine belastbare Aussage erlaubt, ob der Korridor 60–100 Mt getroffen wird.

## 7. Freigabe

**Freigegeben durch:** [ausstehend]
**Datum:** [ausstehend]
**Wortlaut der Freigabe:** [ausstehend]
Erst nach vollständiger Lektüre dieser Datei durch Daniel Saure auszufüllen (die Antworten zu 6a und 6b liegen vor, siehe Abschnitt 5).
