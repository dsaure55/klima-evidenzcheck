# Kapitel 10 – Das Prognose-Register: Wir legen uns fest, bevor wir es wissen
**ENTWURF v0.1 (24.10.2026) – nicht geprüft, nicht freigegeben. Grundlage: `Prognose-Register/01_gasspeicher-winter-2026-27.md`, SAP „Prognose-Register 2027“ (Stand 23.10.2026: V3 und allgemeine Abschnitte eingefroren, V1/V2/V4 weiter Entwurf), SAP „Prognose-Check“ (v1.1 final). Alle Angaben zu 2027 sind „geplant“ und vor Satz gegen den dann gültigen SAP-Stand und Termine abzugleichen; Fristen nicht verschärfen. Keine Vorhersagewerte für 2027 im Buch (der SAP verbietet das bis zur Registrierung). Offen: Faktencheck (`pruefung/faktencheck_kap10.md`). Vor Satz/Export: diese Kopfzeile und die Herkunftstabelle entfernen.**

**Kurz gesagt:** Vorhersagen lassen sich hinterher zurechtbiegen. Deshalb legen wir uns vorher fest: mit Zahl, Spanne, Bewertungsregel und Zeitpunkt der Auswertung, versehen mit einem Zeitstempel im öffentlichen Repository. Später sagen wir offen, ob wir getroffen haben oder nicht, egal wie es ausgeht. Eine Vorhersage ist registriert: wie viel Gas im Winter 2026/27 aus den deutschen Speichern entnommen wird. Für 2027 planen wir vier weitere. Zahlen dazu nennen wir hier nicht, weil wir sie erst nach dem Jahreswechsel berechnen dürfen.

## Das Prinzip

Ein Prognose-Register ist eine öffentliche Liste von Vorhersagen mit Datum. Jeder Eintrag enthält:

- die **Zielgröße**: Was genau wird vorhergesagt?
- die **Vorhersage** mit einer Spanne, nicht nur einem Punkt,
- die **Bewertungsregel**: Wann gilt sie als getroffen, wann nicht?
- den **Stichtag** der Auswertung (bei Eintrag #1: sobald Eurostat die Werte liefert),
- einen **Zeitstempel**: Der Git-Commit im Repository hält fest, wann der Eintrag angelegt wurde. Spätere Änderungen wären in der öffentlichen Versionsgeschichte sichtbar.

Wir schreiben später „lag im registrierten 95-Prozent-Intervall“ oder „lag außerhalb“, nicht „richtig“ oder „falsch“. Ein 95-Prozent-Prognoseintervall heißt: Wenn das Modell stimmt und sich nichts Grundlegendes ändert, liegt der Wert in 19 von 20 Fällen darin. Sprünge wie ein Vulkanausbruch oder eine Energiekrise sind in diesem Bereich nicht enthalten. Auch wenn der Wert einmal danebenliegt, war nicht zwingend das Modell schlecht. Aber wer immer wieder danebenliegt, sollte sein Modell hinterfragen. Genau das sehen die Leserinnen und Leser nur, wenn alle Ergebnisse veröffentlicht werden, unabhängig vom Ausgang.

**Was das nicht ist.** Eine Vorhersage im Register ist keine Wette und keine Klimaprojektion. Eine Klimaprojektion beschreibt, was unter bestimmten Annahmen über Emissionen passiert. Unsere Vorhersagen sind kurzfristig und prüfbar, mit festem Stichtag. Sie sagen nichts über die ferne Zukunft.

## Eintrag #1: Gasspeicher-Entnahme im Winter 2026/27

**Die Leserfrage:** Reicht das Gas für den Winter? Genauer, und das können wir prüfen: Wie viel wird im Winter 2026/27 aus den deutschen Speichern entnommen?

**Registriert am 22. Oktober 2026.** Die Grundlage ist unser Evidenzcheck „Reichen 136 Terawattstunden?“ vom 14. September, mit eingefrorenem Analyseplan und unabhängiger Prüfung [1][2]. Bei der Prüfung stand ein Abgleich der Temperaturwerte mit den Originaldateien noch aus. [Entscheidung Daniel Saure: Erledigung als Datei nachweisen oder so stehen lassen.] Neu gerechnet wurde für den Eintrag nichts.

**Die Zielgröße:** die Netto-Entnahme aus den deutschen Gasspeichern von Oktober 2026 bis März 2027, gemessen mit den Eurostat-Monatsdaten, in Terawattstunden (TWh) [2].

**Die Vorhersagen:**

- **V1 (die Kernvorhersage, temperaturbereinigt).** Wir setzen die tatsächliche Wintertemperatur in das unveränderte Modell der Analyse ein. Die tatsächliche Entnahme liegt dann im zugehörigen 95-Prozent-Prognoseintervall. Liegt die Wintertemperatur außerhalb des Bereichs der Modellanpassung (3,75 bis 6,18 °C), wird V1 nicht bewertet, weil das eine Extrapolation wäre. Das berichten wir dann so.
- **V2 (die vereinfachte Lesart).** Die Entnahme liegt zwischen 69 und 230 TWh. Das ist das Prognoseintervall für einen durchschnittlich kalten Winter (4,21 °C). Der erwartete Wert liegt bei rund 150 TWh. Ein deutlich kälterer oder milderer Winter kann aus diesem Bereich fallen, ohne dass das Modell falsch war. Maßgeblich ist deshalb V1.

**Wann wir auswerten:** sobald Eurostat die Werte bis März 2027 veröffentlicht, voraussichtlich im Mai oder Juni 2027. Wir berichten dann tatsächliche Entnahme, tatsächliche Wintertemperatur, V1 und V2 jeweils als „getroffen“ oder „nicht getroffen“ und die Abweichung vom erwarteten Wert [2].

**Was wir offenlegen.** Bei der Registrierung war der Winter drei Wochen alt. Daten zur Speicherentnahme seit Oktober haben wir für den Eintrag nicht ausgewertet. Öffentlich bekannt war der Füllstand von 60,5 Prozent am 16. Oktober [3]. Das ist ein Bestand, keine Entnahme.

**Was wir nicht vorhersagen:** Versorgungssicherheit, Preise und kurze Kältewellen.

## Was als Nächstes kommt: das Register 2027 (geplant)

Für 2027 planen wir vier weitere Einträge. Der Analyseplan dazu liegt vor, ist aber nur zum Teil eingefroren. Daten, Zahlen und Termine können sich ändern. Die vier Zielgrößen:

1. die Sommermitteltemperatur in Deutschland,
2. die Anzahl der Hitzetage in Deutschland,
3. die Anzahl der Monate mit einer globalen Temperatur über 1,5 °C über dem vorindustriellen Niveau,
4. die deutschen Treibhausgasemissionen.

**Das Prinzip:** Wir rechnen ausschließlich mit Daten bis Ende 2026. Beobachtungen aus 2027 dürfen wir vor der Registrierung nicht ansehen, auch nicht vorläufige Werte oder Tageswerte. Das gilt ausdrücklich auch für den Copernicus-Datendienst, der fast in Echtzeit zeigt, wie warm es gerade ist [4].

**Warum es im Buch keine Zahlen gibt.** Der Plan sperrt die Berechnung, bis er eingefroren ist, bis der Prognose-Check abgeschlossen ist und bis die Daten bis Ende 2026 vorliegen. Beim globalen Temperaturwert gilt für den Prognose-Check eine vorab festgelegte Ausnahme. Beim globalen Temperaturwert (3.) muss die Registrierung bis zum 15. Januar 2027 stehen, bei den anderen bis zum 31. Januar 2027. Die Stichtage der Auswertung liegen zwischen dem 15. September 2027 und dem 31. März 2028. Das Buch erscheint früher. Wir können dir also zeigen, wie wir vorgehen, aber noch nicht, was wir erwarten.

Die Registrierung erscheint spätestens am 31. Januar 2027 in einem gemeinsamen Beitrag auf Substack. Die Auswertung veröffentlichen wir unabhängig vom Ausgang. Termine können sich verschieben, und wir nennen es dann.

Einige Hinweise gehören zu den Zielgrößen: Bei den Hitzetagen zählt das Flächenmittel für Deutschland, keine einzelne Messstation. Bei den Monaten über 1,5 °C sagen Monatswerte nichts über die Pariser 20-Jahres-Grenze. Bei den Treibhausgasemissionen geht es um die Zahl ohne Landnutzung (laut UBA-Vorjahresschätzung). Alles ist geplant.

## Ein verwandter Check: der Prognose-Check

Ein verwandter Evidenzcheck schaut zurück: Wie treffsicher waren die Projektionsberichte der Bundesregierung? Der Prognose-Check vergleicht die projizierten mit den tatsächlich inventarisierten deutschen Treibhausgasemissionen, gesamt und je Sektor, für die Berichte 2015 bis 2023. Der Analyseplan wurde am 22. Oktober 2026 eingefroren [5]. Stand 24. Oktober 2026 liegt kein validiertes Ergebnis vor, deshalb nennen wir hier keines. Seine Ergebnisse fließen nicht in die Methoden des Registers ein, er muss aber abgeschlossen sein, bevor drei der vier Vorhersagen für 2027 berechnet werden dürfen. [Am 15.11.2026 gegen Laufprotokoll, Validierungsbericht und Freigabe neu prüfen.]

## Wie du mitprüfen kannst

- Die Registereinträge liegen im öffentlichen Repository im Ordner `Prognose-Register/`, jeder als eigene Datei.
- Der **Zeitstempel** ist der Git-Commit. Er zeigt, wann ein Eintrag angelegt wurde und ob er danach verändert wurde. Die Versionsgeschichte kann jeder einsehen.
- Analysepläne, Programme und Ergebnisse liegen unter `Analysen/`; die Rohdaten für das Register 2027 kommen mit dem Registrierungs-Commit dazu.
- Findest du einen Fehler oder eine Lücke, sag uns Bescheid (Kapitel 8).

## Was heißt das für dich?

- Eine Vorhersage ohne Bewertungsregel und ohne Stichtag lässt sich nicht prüfen. Misstraue ihr.
- Wer seine Treffer zeigt und die Fehlschläge versteckt, hat dir nur einen Teil der Wahrheit gesagt. Bei einem Register stehen alle Ergebnisse.
- Ein „nicht getroffen“ ist keine Blamage, sondern Information. Ein einzelner Fehltreffer sagt noch nicht, ob das Modell schlecht ist; das lässt sich erst über mehrere Jahrgänge beurteilen.

## Lagen wir richtig?

Das wissen wir noch nicht. Das ist der Sinn des Registers: Die Antwort kommt erst später und wird veröffentlicht, wie auch immer sie ausfällt. Der erste Test ist die Gasspeicher-Vorhersage, voraussichtlich im Mai oder Juni 2027, sobald Eurostat die Werte bis März 2027 veröffentlicht.

## Woher wir das wissen

Die Angaben zu Eintrag #1 stammen aus der Registerdatei und der validierten Analyse. Die Angaben zum Register 2027 stammen aus dem Analyseplan in seinem Stand vom 23. Oktober 2026 und sind als geplant zu verstehen.

## Quellen

[1] Klima Kompass: „Reichen 136 Terawattstunden? Was der Vergleich der Bundesnetzagentur nicht zeigt“, 14.09.2026. https://klimaevidenzcheck.substack.com/p/reichen-136-terawattstunden-was-der
[2] Klima Kompass: Prognose-Register, Eintrag #1, Gasspeicher-Entnahme Winter 2026/27, registriert 22.10.2026 (`Prognose-Register/01_gasspeicher-winter-2026-27.md`); Analyse `Analysen/2026-09-gasspeicher-winter/` (SAP, Analysebericht, Validierungsbericht).
[3] Klima Kompass: „Gasspeicher bei 60 Prozent – was heißt das für den Winter?“, 17.10.2026 (nach Bundesnetzagentur). https://klimaevidenzcheck.substack.com/p/gasspeicher-bei-60-prozent-was-heit
[4] Klima Kompass: SAP „Prognose-Register 2027“ (`Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md`), Stand 23.10.2026 (Teilfreigabe: V3 und allgemeine Abschnitte; V1, V2, V4 Entwurf).
[5] Klima Kompass: SAP „Prognose-Check #1: Wie treffsicher waren die Projektionsberichte der Bundesregierung?“, v1.1, eingefroren 22.10.2026 (`Analysen/2026-10-prognose-check-projektionsberichte/`).

## Herkunftstabelle (nicht ins Buch)

| Aussage | Herkunft |
|---|---|
| Eintrag #1, V1, V2, 69–230, 150, 4,21 °C, 3,75–6,18 °C | `Prognose-Register/01_gasspeicher-winter-2026-27.md` |
| Auswertung Mai/Juni 2027 (Eurostat) | dieselbe Datei („Auswertung“) |
| 60,5 % am 16.10. | Artikel 17.10. |
| Vier Zielgrößen, Fristen 15.01./31.01.2027, Stichtage | SAP Register 2027 (Abschnitt 0.1, 2.x, Tabelle Termine), Stand 23.10.2026 |
| Teilfreigabe V3 | SAP Register 2027 Kopf |
| Datenschnitt, Climate Pulse | SAP Register 2027 Sperre 1 |
| Prognose-Check, SAP eingefroren 22.10.2026 | `SAP_prognose-check-projektionsberichte.md` Kopf |
| Prognose-Check ohne validiertes Ergebnis | `run_log.txt` (Stopp nach SAP 3.5.5, Rückfrage offen) |
