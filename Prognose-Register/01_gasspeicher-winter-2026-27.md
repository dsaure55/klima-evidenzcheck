# Prognose-Register · Eintrag #1 – Gasspeicher-Entnahme Winter 2026/27

**Registriert:** 22.10.2026 (maßgeblich ist der Zeitstempel des Git-Commits)
**Freigabe:** Daniel Saure, 22.10.2026 (im Chat: „1. ja“ auf die Frage, ob die Gasspeicher-Vorhersage jetzt registriert werden soll)
**Leserfrage:** Reicht das Gas für den Winter?
**Grundlage:** Klima Kompass · Evidenzcheck „Reichen 136 Terawattstunden?“ vom 14.09.2026
(https://klimaevidenzcheck.substack.com/p/reichen-136-terawattstunden-was-der),
SAP v1.0 (eingefroren 14.09.2026), validiert, siehe `Analysen/2026-09-gasspeicher-winter/`.
**Neue Berechnung:** keine. Alle Werte stammen aus der validierten Analyse.

## Zielgröße

Netto-Entnahme aus den deutschen Gasspeichern im Winter 2026/27 (Oktober 2026 bis März 2027),
genau wie in der Analyse definiert: −Σ `STK_CHG_MG` aus Eurostat `nrg_cb_gasm`, Deutschland,
Oktober bis März, Umrechnung TJ → TWh durch 3600.

## Vorhersagen

**V1 (Kernvorhersage, temperaturbereinigt):** Setzt man die tatsächliche Wintertemperatur 2026/27
(DWD-Gebietsmittel Deutschland, definiert wie in SAP 3.2 der Analyse) in das unveränderte
Modell der Analyse ein (Entnahme ~ Wintertemperatur, Winter 2016/17–2025/26, Skript
`gasspeicher-winter-2026.py`), liegt die tatsächliche Entnahme innerhalb des zugehörigen
95-%-Prognoseintervalls.
Ausnahme: Liegt die Wintertemperatur außerhalb des Fitbereichs von 3,75 bis 6,18 °C, wird V1 nicht
bewertet, weil das eine Extrapolation wäre. Das wird dann so berichtet.

**V2 (vereinfachte Lesart):** Die Entnahme liegt zwischen **69 und 230 TWh**. Das ist das
95-%-Prognoseintervall für einen durchschnittlich kalten Winter (4,21 °C), der erwartete Wert
liegt bei **rund 150 TWh**. Ein deutlich kälterer oder milderer Winter kann aus diesem Bereich
fallen, ohne dass das Modell falsch war. Maßgeblich für die Bewertung ist deshalb V1.

## Auswertung

- Sobald Eurostat die Werte bis März 2027 veröffentlicht (voraussichtlich Mai/Juni 2027).
- Berichtet werden: tatsächliche Entnahme, tatsächliche Wintertemperatur, V1 und V2 jeweils
  „getroffen / nicht getroffen“, Abweichung vom erwarteten Wert.
- Veröffentlichung des Ergebnisses unabhängig davon, ob die Vorhersage zutrifft.

## Offenlegung

- Bei der Registrierung war der Winter 2026/27 drei Wochen alt. Daten zur Speicherentnahme seit
  Oktober 2026 wurden für diesen Eintrag nicht ausgewertet. Öffentlich bekannt war der
  Füllstand von 60,5 % am 16.10.2026 (BNetzA, siehe Einordnung vom 17.10.2026). Das ist ein
  Bestand, keine Entnahme.
- Nicht vorhergesagt werden: Versorgungssicherheit, Preise, kurze Kältewellen.
