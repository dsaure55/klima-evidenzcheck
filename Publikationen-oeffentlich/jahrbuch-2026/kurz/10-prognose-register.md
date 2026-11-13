# Kapitel 8 – Das Prognose-Register: Wir legen uns fest, bevor wir es wissen
**KURZFASSUNG v0.2 (13.11.2026), gekürzt aus Kapitel 10 der Langfassung. Freigegeben durch Daniel Saure am 13.11.2026 (Volltext v0.2 gelesen, Kapitel in der Dateiansicht geöffnet; Wortlaut im Chat: „freigabe“, auf Rückfrage „ja, gelesen und Soll er so stehen bleiben“ zur Aussage, dass bei der Prüfung der Temperaturabgleich noch ausstand; der Platzhalter dazu wurde entfernt, der Satz bleibt unverändert). Die Freigabe gilt für den Stand Commit 9647664 plus die Entfernung des Platzhalters; die drei letzten Satzänderungen aus Nachprüfung 1 (N1 bis N3) hat der faktenpruefer nicht mehr gegengelesen. Stilpass 13.11.2026 (Stilregeln v0.3). Inhaltlich geändert gegenüber v0.1: der Abschnitt „Ein verwandter Check“ (Ergebnisse des am 12.11.2026 veröffentlichten Prognose-Checks, nur Zahlen und Aussagen des Artikels) und die Sätze in „Warum es im Buch keine Zahlen gibt“, die den Stand des Prognose-Checks nennen; Quellen [5] und [6] angepasst. Hinweis: Alle Angaben zu 2027 sind „geplant“ (SAP „Prognose-Register 2027“ Stand 23.10.2026 nur teilweise eingefroren) und vor Satz gegen den dann gültigen SAP-Stand und die Termine abzugleichen; Fristen nicht verschärfen, keine Vorhersagewerte für 2027 im Buch. Differenzprüfung und Faktencheck liegen als Datei vor (`pruefung/faktencheck_kurz_kap10_2026-11-13.md`, 0 kritisch, 0 hoch); deren Befunde (A1, A5, M1, M2, G1 bis G3) sind eingearbeitet, die Nachprüfung 1 (`pruefung/faktencheck_kurz_kap10_nachpruefung1_2026-11-13.md`, 0 kritisch, 0 hoch, 1 mittel, 2 gering) ist ebenfalls eingearbeitet (N1 bis N3: bedingte V3-Ausnahme, V1/V2-Einführung, Quelle [5]); eine Prüfung dieser letzten Satzänderungen und die Freigabe durch Daniel Saure stehen aus. Vor Satz/Export entfernen.**

**Kurz gesagt:** Vorhersagen lassen sich hinterher zurechtbiegen. Deshalb legen wir uns vorher fest: mit Zahl, Spanne, Bewertungsregel und Zeitpunkt der Auswertung, versehen mit einem Zeitstempel im öffentlichen Repository. Später sagen wir offen, ob wir getroffen haben oder nicht, egal wie es ausgeht. Eine Vorhersage ist registriert: wie viel Gas im Winter 2026/27 aus den deutschen Speichern entnommen wird. Für 2027 planen wir vier weitere. Zahlen dazu nennen wir hier nicht, weil wir sie erst nach dem Jahreswechsel berechnen dürfen.

## Das Prinzip

Ein Prognose-Register ist eine öffentliche Liste von Vorhersagen mit Datum. Jeder Eintrag enthält:

- die Zielgröße: Was genau wird vorhergesagt?
- die Vorhersage mit einer Spanne, nicht nur einem Punkt,
- die Bewertungsregel: Wann gilt sie als getroffen, wann nicht?
- den Stichtag der Auswertung (bei Eintrag #1: sobald Eurostat die Werte liefert),
- einen Zeitstempel. Der Git-Commit im Repository hält fest, wann der Eintrag angelegt wurde. Spätere Änderungen wären in der öffentlichen Versionsgeschichte sichtbar.

Wir schreiben später „lag im registrierten 95-Prozent-Intervall“ oder „lag außerhalb“, nicht „richtig“ oder „falsch“. Ein 95-Prozent-Prognoseintervall heißt: Wenn das Modell stimmt und sich nichts Grundlegendes ändert, liegt der Wert in 19 von 20 Fällen darin. Sprünge wie ein Vulkanausbruch oder eine Energiekrise sind in diesem Bereich nicht enthalten. Auch wenn der Wert einmal danebenliegt, war nicht zwingend das Modell schlecht. Wer aber immer wieder danebenliegt, sollte sein Modell hinterfragen. Das sieht man nur, wenn alle Ergebnisse veröffentlicht werden.

Eine Vorhersage im Register ist keine Wette und keine Klimaprojektion. Unsere Vorhersagen sind kurzfristig und prüfbar, mit festem Stichtag, und sagen nichts über die ferne Zukunft.

## Eintrag #1: Gasspeicher-Entnahme im Winter 2026/27

Die Leserfrage lautet: Reicht das Gas für den Winter? Genauer, und das können wir prüfen: Wie viel wird im Winter 2026/27 aus den deutschen Speichern entnommen?

Registriert haben wir den Eintrag am 22. Oktober 2026. Die Grundlage ist unser Evidenzcheck „Reichen 136 Terawattstunden?“ vom 14. September, mit eingefrorenem Analyseplan und unabhängiger Prüfung [1][2]. Bei der Prüfung stand ein Abgleich der Temperaturwerte mit den Originaldateien noch aus. Neu gerechnet wurde für den Eintrag nichts.

Die Zielgröße ist die Netto-Entnahme aus den deutschen Gasspeichern von Oktober 2026 bis März 2027, gemessen mit den Eurostat-Monatsdaten, in Terawattstunden (TWh) [2].

Registriert haben wir diese Größe als V1 (Kernvorhersage) und V2 (vereinfachte Lesart).

V1 ist die Kernvorhersage, bereinigt um die Temperatur. Wir setzen die tatsächliche Wintertemperatur in das unveränderte Modell der Analyse ein. Die tatsächliche Entnahme liegt dann im zugehörigen 95-Prozent-Prognoseintervall. Liegt die Wintertemperatur außerhalb des Bereichs der Modellanpassung (3,75 bis 6,18 °C), wird V1 nicht bewertet, weil das eine Extrapolation wäre. Das berichten wir dann so.

V2 ist die vereinfachte Lesart. Die Entnahme liegt zwischen 69 und 230 TWh. Das ist das Prognoseintervall für einen durchschnittlich kalten Winter (4,21 °C). Der erwartete Wert liegt bei rund 150 TWh. Ein deutlich kälterer oder milderer Winter kann aus diesem Bereich fallen, ohne dass das Modell falsch war. Maßgeblich ist deshalb V1.

Ausgewertet wird, sobald Eurostat die Werte bis März 2027 veröffentlicht, voraussichtlich im Mai oder Juni 2027. Wir berichten dann tatsächliche Entnahme, tatsächliche Wintertemperatur, V1 und V2 jeweils als „getroffen“ oder „nicht getroffen“ und die Abweichung vom erwarteten Wert [2].

Offenlegen müssen wir, dass der Winter bei der Registrierung drei Wochen alt war. Daten zur Speicherentnahme seit Oktober haben wir für den Eintrag nicht ausgewertet. Öffentlich bekannt war der Füllstand von 60,5 Prozent am 16. Oktober [3]. Das ist ein Bestand, keine Entnahme.

Nicht vorhergesagt werden Versorgungssicherheit, Preise und kurze Kältewellen.

## Was als Nächstes kommt: das Register 2027 (geplant)

Für 2027 planen wir vier weitere Einträge. Der Analyseplan dazu liegt vor, ist aber nur zum Teil eingefroren. Daten, Zahlen und Termine können sich ändern. Die vier Zielgrößen:

1. die Sommermitteltemperatur in Deutschland,
2. die Anzahl der Hitzetage in Deutschland,
3. die Anzahl der Monate mit einer globalen Temperatur über 1,5 °C über dem vorindustriellen Niveau,
4. die deutschen Treibhausgasemissionen.

Das Prinzip: Wir rechnen ausschließlich mit Daten bis Ende 2026. Beobachtungen aus 2027 dürfen wir vor der Registrierung nicht ansehen, auch nicht vorläufige Werte oder Tageswerte. Das gilt ausdrücklich auch für den Copernicus-Datendienst, der fast in Echtzeit zeigt, wie warm es gerade ist [4].

Warum es im Buch keine Zahlen gibt: Der Plan sperrt die Berechnung, bis er eingefroren ist, bis der Prognose-Check abgeschlossen ist und bis die Daten bis Ende 2026 vorliegen. Der Prognose-Check ist im Sinne des Plans abgeschlossen (Validierungsbericht ohne kritischen Befund, Ergebnisse freigegeben, 11.11.2026) [5][6]. Eingefroren ist der Plan erst zum Teil, und die Daten bis Ende 2026 liegen noch nicht vor. Für den globalen Temperaturwert (3.) hat der Plan vorab festgelegt: Ist der Prognose-Check am 12. Januar 2027 nicht abgeschlossen, wird dieser Wert trotzdem gerechnet und registriert, weil seine Frist durch die Veröffentlichung der Copernicus-Werte vorgegeben ist. Der Prognose-Check ist abgeschlossen, die Ausnahme greift also nicht. Die Registrierung des globalen Temperaturwerts muss bis zum 15. Januar 2027 stehen, bei den anderen bis zum 31. Januar 2027. Die Stichtage der Auswertung liegen zwischen dem 15. September 2027 und dem 31. März 2028. Das Buch erscheint früher. Wir können dir also zeigen, wie wir vorgehen, aber noch nicht, was wir erwarten.

Die Registrierung erscheint spätestens am 31. Januar 2027 in einem gemeinsamen Beitrag auf Substack. Die Auswertung veröffentlichen wir unabhängig vom Ausgang. Termine können sich verschieben, und wir nennen es dann.

Zu den Zielgrößen: Bei den Hitzetagen zählt das Flächenmittel für Deutschland, keine einzelne Messstation. Bei den Monaten über 1,5 °C sagen Monatswerte nichts über die Pariser 20-Jahres-Grenze. Bei den Treibhausgasemissionen geht es um die Zahl ohne Landnutzung (laut UBA-Vorjahresschätzung). Alles ist geplant.

## Ein verwandter Check: der Prognose-Check

Ein verwandter Evidenzcheck blickt zurück: Wie gut trafen die Projektionsberichte der Bundesregierung die Emissionen? Er vergleicht die projizierten Gesamtemissionen (ohne Landnutzung) mit dem Treibhausgasinventar des Umweltbundesamts, für die Berichte 2015 bis 2023. Den Analyseplan haben wir am 22. Oktober 2026 eingefroren, den Check am 12. November 2026 veröffentlicht [5][6].

Für das Jahr 2020 lag die Projektion in allen drei auswertbaren Berichten (2015, 2017 und 2019) über dem tatsächlichen Wert, um 10,9 bis 13,0 Prozent. Die Projektionen sind dabei auf den heutigen Inventarwert ihres Ausgangsjahres umgerechnet, damit der Vergleich den Verlauf misst. Der tatsächliche Wert für 2020 liegt bei 731 Millionen Tonnen CO₂-Äquivalent. Über alle zehn auswertbaren Vergleiche aus fünf Berichten lag die Projektion im Mittel 10,9 Prozent zu hoch, in neun von zehn Fällen [6].

Die Zahlen gelten für diese kleine Auswahl. Die zehn Vergleiche sind nicht unabhängig voneinander. Eine Projektion ist eine bedingte Rechnung und keine Vorhersage. Wir nennen keine Ursachen und sagen nichts darüber, wie künftige Projektionen ausfallen. Zwei Rechnungen aus dem Analyseplan des Checks haben wir nicht durchgeführt, welche, steht im Artikel [6].

Die Ergebnisse des Prognose-Checks fließen nicht in die Methoden des Registers ein. Das ist im Analyseplan des Registers so festgelegt.

## Wie du mitprüfen kannst

Die Registereinträge liegen im öffentlichen Repository im Ordner `Prognose-Register/`, jeder als eigene Datei. Der Zeitstempel ist der Git-Commit, die Versionsgeschichte kann jeder einsehen. Analysepläne, Programme und Ergebnisse liegen unter `Analysen/`. Die Rohdaten für das Register 2027 kommen mit dem Registrierungs-Commit dazu. Findest du einen Fehler oder eine Lücke, sag uns Bescheid (Kapitel 10).

## Was heißt das für dich?

- Eine Vorhersage ohne Bewertungsregel und ohne Stichtag lässt sich nicht prüfen. Misstraue ihr.
- Wer seine Treffer zeigt und die Fehlschläge versteckt, hat dir nur einen Teil der Wahrheit gesagt. Bei einem Register stehen alle Ergebnisse.
- Ein „nicht getroffen“ ist keine Blamage, sondern Information. Ein einzelner Fehltreffer sagt noch nicht, ob das Modell schlecht ist. Das lässt sich erst über mehrere Jahrgänge beurteilen.

## Lagen wir richtig?

Das wissen wir noch nicht. Das ist der Sinn des Registers: Die Antwort kommt erst später und wird veröffentlicht, wie auch immer sie ausfällt. Der erste Test ist die Gasspeicher-Vorhersage, voraussichtlich im Mai oder Juni 2027, sobald Eurostat die Werte bis März 2027 veröffentlicht.

## Woher wir das wissen

Die Angaben zu Eintrag #1 stammen aus der Registerdatei und der validierten Analyse. Die Angaben zum Register 2027 stammen aus dem Analyseplan in seinem Stand vom 23. Oktober 2026 und sind als geplant zu verstehen. Die Angaben zum Prognose-Check stammen aus dem veröffentlichten Evidenzcheck und seinem Analysebericht. Einzelheiten stehen in der Langfassung und im Methodenanhang.

## Quellen

[1] Klima Kompass: „Reichen 136 Terawattstunden? Was der Vergleich der Bundesnetzagentur nicht zeigt“, 14.09.2026. https://klimaevidenzcheck.substack.com/p/reichen-136-terawattstunden-was-der
[2] Klima Kompass: Prognose-Register, Eintrag #1, Gasspeicher-Entnahme Winter 2026/27, registriert 22.10.2026 (`Prognose-Register/01_gasspeicher-winter-2026-27.md`); Analyse `Analysen/2026-09-gasspeicher-winter/` (SAP, Analysebericht, Validierungsbericht).
[3] Klima Kompass: „Gasspeicher bei 60 Prozent – was heißt das für den Winter?“, 17.10.2026 (nach Bundesnetzagentur). https://klimaevidenzcheck.substack.com/p/gasspeicher-bei-60-prozent-was-heit
[4] Klima Kompass: SAP „Prognose-Register 2027“ (`Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md`), Stand 23.10.2026 (Teilfreigabe: V3 und allgemeine Abschnitte; V1, V2, V4 Entwurf).
[5] Klima Kompass: SAP „Prognose-Check #1: Wie treffsicher waren die Projektionsberichte der Bundesregierung?“, v1.2 (als v1.0 am 22.10.2026 eingefroren, ergänzt durch Amendments vom 22.10. und 09.11.2026), Analysebericht, Validierungsbericht und Freigabe der Ergebnisse (11.11.2026) (`Analysen/2026-10-prognose-check-projektionsberichte/`).
[6] Klima Kompass: „Wie gut trafen die Projektionsberichte der Bundesregierung die Emissionen von 2020?“, 12.11.2026. https://klimaevidenzcheck.substack.com/p/wie-gut-trafen-die-projektionsberichte
