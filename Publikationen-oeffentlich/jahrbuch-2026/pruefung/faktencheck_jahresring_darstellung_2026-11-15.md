# Faktencheck: Jahresring (Darstellung und Erklärsatz), Jahrbuch 2026

Prüfdatum: 15.11.2026
Rolle: unabhängiger Faktenprüfer (Satz und Skript nicht selbst erstellt)
Diese Datei ist ein Prüfbericht, kein Freigabevermerk.

## Gegenstand

Satz (Rückseite der Lesefassung; auf dem Umschlag „Der Ring auf dem Umschlag …“):

> „Der Ring auf der Titelseite zeigt jeden Sommer in Deutschland seit 1881. Blau: kühler, Koralle: wärmer als das Mittel 1961–1990. Daten: Deutscher Wetterdienst.“

Darstellung: `Publikationen/jahrbuch-2026-buch/jahresring.js` (Ring Titelseite, Logo-Variante, Teilseiten-Ring, Farbband).

Geprüft gegen:

- `Analysen/2026-09-sommer-2026-normal/rohdaten/dwd_sommer_deutschland.csv`
- `Analysen/2026-09-sommer-2026-normal/rohdaten/regional_averages_tm_summer.txt` (Kopfzeile: „erstellt am: 20260902“)
- DWD Open Data, online abgerufen am 15.11.2026: https://opendata.dwd.de/climate_environment/CDC/regional_averages_DE/seasonal/air_temperature_mean/regional_averages_tm_summer.txt
- `Publikationen-oeffentlich/jahrbuch-2026/kurz/04-sommer.md` (Kapitel 5)

## Urteil

**ok mit Auflagen.**

| Stufe | Anzahl |
|---|---|
| kritisch | 0 |
| hoch | 0 |
| mittel | 3 |
| gering | 4 |

Der Satz ist sachlich richtig. Die Daten im Skript stimmen mit CSV und DWD-Rohdatei überein. Die Auflagen betreffen Vollständigkeit: fehlender Datenstand und Vorläufigkeit (M1), die ungleich gestreckte Farbskala (M2) und die Logo-Variante mit Jahrzehntmitteln (M3).

## Einschränkungen dieser Prüfung

- Mir stand kein Werkzeug zur Ausführung von Code zur Verfügung. Der Wertevergleich erfolgte durch zeilenweises Lesen (jahrzehntweise), alle Summen und Mittel sind von Hand gerechnet, nicht maschinell. Ein mechanischer Abgleich (Skript-Array gegen CSV-Spalte) wäre eine billige zusätzliche Absicherung.
- Der Online-Abgleich mit dem DWD umfasst die Kopfzeile und 12 Stichprobenjahre, nicht alle 146 Zeilen. Die Werte wurden vom Abrufwerkzeug als Tabelle übertragen, nicht als Rohzeilen zitiert.
- Die gerenderte Ausgabe (PDF/HTML von Titelseite, Umschlag, Rückseite) habe ich nicht gesehen. Geprüft ist die Logik des Skripts, nicht das Druckbild (Farbwirkung, Lesbarkeit der Beschriftung, tatsächliche Platzierung von Ring und Logo).
- Der Evidenzcheck-Report vom 11.09.2026 (Quelle [1] in Kapitel 5) wurde nicht geöffnet. Die Konsistenzprüfung bezieht sich wie beauftragt auf Kapitel 5.

## Prüftabelle

| Nr. | Behauptung / Eigenschaft | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | Array `D` hat 146 Werte ab 1881 | `jahresring.js` Z. 3, CSV Z. 2–147 | bestätigt | 14 volle Jahrzehnte + 6 Werte = 146; CSV hat 146 Datenzeilen 1881–2026 |
| 2 | Werte und Reihenfolge `D` = CSV | wie oben | bestätigt | alle 146 Werte in gleicher Reihenfolge identisch, keine Abweichung gefunden (Vergleich durch Lesen, siehe Einschränkungen) |
| 3 | CSV = Spalte „Deutschland“ der DWD-Rohdatei im Ordner | `regional_averages_tm_summer.txt`, letzte Spalte | bestätigt | alle 146 Jahre gelesen und identisch; Datei vollständig lesbar |
| 4 | Rohdatei = aktueller DWD-Stand | DWD Open Data, Abruf 15.11.2026 | bestätigt (Stichprobe) | Kopfzeile online weiter „erstellt am: 20260902“; Deutschland-Werte für 1881, 1913, 1956, 1961, 1990, 2003, 2018, 2019, 2022, 2024, 2025, 2026 identisch; letztes Jahr 2026 |
| 5 | „jeden Sommer in Deutschland seit 1881“ | CSV, Rohdatei | bestätigt | 146 Sommer, lückenlos 1881–2026; „Sommer“ ist in der DWD-Datei die Jahreszeit `summer` (Juni–August), Größe ist die Lufttemperatur (Gebietsmittel). Der Satz nennt weder „Temperatur“ noch die Monate, siehe G1 |
| 6 | „Blau: kühler, Koralle: wärmer als das Mittel 1961–1990“ | `jahresring.js` Z. 5, 9 | bestätigt | Referenz = Mittel der 30 Werte 1961–1990 aus derselben Reihe = 488,01 / 30 = 16,27 °C; `v<ref` blau, sonst koralle; kein Wert liegt genau auf der Referenz |
| 7 | Referenz passt zu Kapitel 5 | Kap. 5, Tabelle „Klima 1961–1990: 16,3 °C“ | bestätigt | 16,27 gerundet 16,3 |
| 8 | Wert 2026 passt zu Kapitel 5 | Kap. 5: „19,6 °C“, „+3,3 Grad“, „zweitwärmste seit 1881“ | bestätigt | Skript: 19,55; gerundet 19,6; Abstand 19,55 − 16,27 = 3,28, gerundet 3,3; nur 2003 (19,67) ist wärmer |
| 9 | „Daten: Deutscher Wetterdienst“ | Rohdatei, Kap. 5 „Woher wir das wissen“ | bestätigt, unvollständig | gleiche Quelle wie Kapitel 5 (DWD, Climate Data Center, Gebietsmittel). Kapitel 5 nennt zusätzlich „Stand 2. September 2026; Werte 2025 und 2026 vorläufig“. Das fehlt im Satz, siehe M1 |
| 10 | Farbstärke je Seite auf kühlsten bzw. wärmsten Wert gestreckt, Exponent 0,75 | `jahresring.js` Z. 6, 9 | bestätigt (Beschreibung trifft zu) | Minimum 14,73 (1913 und 1956), Maximum 19,67 (2003). Folge: ungleiche Skalen, siehe M2 |
| 11 | Balkenlänge Titelseite linear zwischen Minimum und Maximum | Z. 13, 21 | bestätigt (Beschreibung trifft zu) | Länge 5 (Minimum) bis 27 (Maximum) Einheiten, siehe G2 |
| 12 | Logo: 15 Jahrzehntmittel, letztes mit 6 Jahren, eigene Streckung | Z. 14–16 | bestätigt (Beschreibung trifft zu) | Mittel nachgerechnet, siehe M3 |
| 13 | Beschriftung „1881 →“ und „2026“, Nadel auf letztem Segment | Z. 12, 19, 21 | bestätigt (Logik) | Ring beginnt rechts neben der 12-Uhr-Stellung und läuft im Uhrzeigersinn; „1881 →“ steht rechts, „2026“ links der Lücke; Nadelwinkel = Mitte des letzten Segments (2026 bzw. 2021–2026). Druckbild nicht gesehen: nicht prüfbar |
| 14 | Ring steht tatsächlich auf Titelseite und Umschlag | nicht vorgelegt | nicht prüfbar | Layout nicht gesehen, siehe G3 |
| 15 | Darstellung „rein beschreibend“ | Skript gesamt | bestätigt mit Hinweis | siehe Abschnitt „Neue Inferenz?“ und M3 |

## Befunde

### Mittel

**M1 – Datenstand und Vorläufigkeit fehlen.**
Kapitel 5 kennzeichnet die Werte 2025 und 2026 durchgehend als vorläufig (Grafik 1, „Woher wir das wissen“, „Lagen wir richtig?“; Stand der DWD-Daten 2. September 2026). Der Erklärsatz nennt nur „Daten: Deutscher Wetterdienst“. Gerade das Segment 2026, auf das die Nadel zeigt, ist vorläufig. Für das Bild ist das praktisch folgenlos (eine Nachkorrektur um 0,1 Grad wäre nicht sichtbar), für die Quellenangabe ist es eine Lücke gegenüber dem eigenen Standard in Kapitel 5.
Auflage: Stand und Vorläufigkeit im Satz ergänzen oder, wenn der Platz auf der Rückseite nicht reicht, im Impressum/Bildnachweis. Ob dort schon ein Hinweis steht, habe ich nicht geprüft.

**M2 – Farbstärke: Blau und Koralle haben verschiedene Skalen.**
Der Satz behauptet nur die Farbrichtung, und die stimmt. Die Farbstärke wird aber je Seite getrennt gestreckt:

- Jahresring: volles Blau bei 1,54 Grad unter dem Mittel (14,73), volles Koralle bei 3,40 Grad über dem Mittel (19,67). Ein Sommer 1,5 Grad über dem Mittel erscheint nur etwa halb so kräftig (rund 55 % Koralle) wie ein Sommer 1,5 Grad darunter (100 % Blau).
- Gleich kräftige Farben bedeuten also nicht gleich große Abstände. Wer Blau und Koralle vergleicht, überschätzt die kühlen Abweichungen etwa um den Faktor 2.
- Der Exponent 0,75 hebt zusätzlich kleine Abweichungen an. Sommer nahe am Mittel (z. B. 1883 mit 16,26 und 1899 mit 16,27) erscheinen fast neutral und weder blau noch koralle.

Die Verzerrung geht nicht in Richtung „Erwärmung übertreiben“ (die warmen Jahre werden eher gedämpft), ist aber eine Eigenschaft, die ein Leser nicht erraten kann.
Auflage: entweder im Impressum/Bildnachweis offenlegen (Vorschlag unten) oder eine gemeinsame, symmetrische Skala verwenden. Der Satz auf der Rückseite muss das nicht tragen.

**M3 – Logo-Variante: Jahrzehntmittel, unvollständiges letztes Jahrzehnt, sehr ungleiche Skalen.**
Nachgerechnete Jahrzehntmittel (°C): 1881–90 16,02; 1891–1900 16,24; 1901–10 16,01; 1911–20 15,96; 1921–30 16,05; 1931–40 16,66; 1941–50 16,81; 1951–60 16,26; 1961–70 16,12; 1971–80 16,23; 1981–90 16,46; 1991–2000 17,11; 2001–10 17,60; 2011–20 17,95; 2021–26 18,66 (nur 6 Jahre). Acht Segmente sind blau, sieben koralle.

- Diese 15 Mittel stehen nicht in Kapitel 5. Sie sind arithmetische Mittel der veröffentlichten Reihe, also beschreibend, aber neu gebildete Zahlen, die bisher keine Prüfung durchlaufen haben. Diese Datei prüft sie erstmals (von Hand).
- Das letzte Segment umfasst 6 statt 10 Jahre, darunter die zwei vorläufigen Werte, und ist das wärmste. Die Nadel zeigt darauf. Der Erklärsatz erwähnt das nicht.
- Die Streckung ist im Logo deutlich ungleicher als im Jahresring: volles Blau bei 0,30 Grad unter dem Mittel (1911–20), volles Koralle bei 2,40 Grad darüber (2021–26). Das Jahrzehnt 1931–40 liegt 0,39 Grad über dem Mittel und erscheint mit rund 26 % Koralle; 1881–90 liegt 0,24 Grad darunter und erscheint mit rund 85 % Blau. Die frühen Jahrzehnte wirken dadurch deutlich „kalt“, obwohl sie nur 0,2 bis 0,3 Grad unter dem Mittel liegen.
- Der Erklärsatz beschreibt nur den Jahresring („jeden Sommer“). Auf das Logo passt er nicht. Stehen Logo und Jahresring auf derselben Seite, ist „der Ring“ nicht eindeutig.

Auflage: Als reines Markenzeichen ohne Datenaussage ist das Logo vertretbar. Dann sollte im Impressum/Bildnachweis ein Satz stehen, dass es die Sommer zu Jahrzehnten zusammenfasst und das letzte Segment nur 2021–2026 umfasst. Wird das Logo irgendwo als Datengrafik erklärt, braucht es eine eigene Legende und die Skala gehört offengelegt.

### Gering

**G1 – „Sommer“ und Messgröße nicht benannt.** Der Satz sagt weder „Temperatur“ noch „Juni bis August“. „Kühler/wärmer“ macht die Größe erkennbar, die Abgrenzung des Sommers nicht. Kapitel 5 schreibt „Der Sommer (Juni bis August)“ und „im Mittel“. Empfehlung: „Mitteltemperatur“ und „(Juni bis August)“ ergänzen.

**G2 – Balkenlänge ohne Nullpunkt und ohne Maßstab.** Die Länge läuft von 5 (kühlster Sommer) bis 27 Einheiten (wärmster Sommer). Sie ist nicht proportional zur Temperatur, und das Mittel 1961–1990 hat keine markierte Länge. Der Satz erwähnt die Länge nicht. Für ein Titelbild vertretbar; im Bildnachweis mit erwähnen.

**G3 – Platzierung und Druckbild nicht geprüft.** Ob der Ring auf Titelseite und Umschlag so steht, wie die beiden Satzvarianten sagen, und ob „1881 →“ und „2026“ lesbar an der Lücke stehen, lässt sich nur am gesetzten Dokument prüfen. Dasselbe gilt für Teilseiten-Ring und Farbband (gleiche Daten, ohne Legende; als Schmuckelemente unkritisch).

**G4 – Werte sind fest im Skript eingetragen.** Korrigiert der DWD die vorläufigen Werte 2025/2026, ändert sich das Skript nicht von selbst. Stand heute (15.11.2026) trägt die DWD-Datei weiter das Erstelldatum 2. September 2026, es gibt also keine Abweichung. Vor Druckfreigabe einmal erneut abgleichen.

## Antworten auf die vier Prüffragen

1. **Daten:** Die 146 Werte im Skript stimmen in Anzahl, Reihenfolge und Wert mit der CSV überein. Die CSV stimmt mit der Spalte „Deutschland“ der DWD-Rohdatei überein (alle 146 Jahre gelesen). Die Rohdatei stimmt in Kopfzeile und 12 Stichprobenjahren mit dem heutigen DWD-Stand überein.
2. **Satz:** Sachlich richtig. Nicht vollständig: Datenstand und Vorläufigkeit fehlen (M1), Messgröße und Monate fehlen (G1). Die Streckung der Farbskala (M2) und das unvollständige letzte Jahrzehnt im Logo (M3) verschweigt der Satz; beides gehört nicht zwingend auf die Rückseite, aber in den Bildnachweis.
3. **Konsistenz mit Kapitel 5:** gleiche Quelle (DWD, Gebietsmittel Deutschland, Stand 2. September 2026), gleicher Referenzzeitraum (1961–1990; 16,27 gegenüber 16,3 gerundet), gleicher Wert 2026 (19,55 gegenüber 19,6 gerundet). Kein Widerspruch.
4. **Neue Inferenz?** Nein. Das Skript bildet ein Mittel (1961–1990), Minimum und Maximum und im Logo 15 Jahrzehntmittel. Das sind beschreibende Kennwerte, keine Trendschätzung, kein Test, keine Prognose. Das Mittel 1961–1990 ist bereits in Kapitel 5 veröffentlicht. Die Jahrzehntmittel sind neu gebildet, aber rein arithmetisch (M3). Die Nadel auf 2026 ist ein Gestaltungselement und keine Aussage.

## Formulierungsvorschlag

Rückseite (Umschlag entsprechend mit „auf dem Umschlag“):

> „Der Ring auf der Titelseite zeigt die Mitteltemperatur jedes Sommers (Juni bis August) in Deutschland von 1881 bis 2026. Blau: kühler, Koralle: wärmer als das Mittel 1961–1990. Daten: Deutscher Wetterdienst, Stand 2. September 2026; 2025 und 2026 vorläufig.“

Zusatz für Impressum/Bildnachweis (erledigt M2, M3, G2):

> „Je kräftiger die Farbe, desto größer der Abstand zum Mittel. Blau und Koralle haben getrennte Skalen: Das kräftigste Blau steht für rund 1,5 Grad unter, das kräftigste Koralle für rund 3,4 Grad über dem Mittel. Die Länge der Striche reicht vom kühlsten Sommer (14,7 °C; 1913 und 1956) bis zum wärmsten (19,7 °C; 2003). Das Logo fasst die Sommer zu Jahrzehnten zusammen, mit eigener Farbskala; das letzte Segment umfasst nur 2021 bis 2026.“

Die Zahlen im Zusatz (1,5; 3,4; 14,7; 19,7; Jahre 1913, 1956, 2003) stammen aus der Nachrechnung in dieser Datei. Werden sie übernommen, sollten sie einmal maschinell gegengerechnet werden.

## Offen

- maschineller Abgleich Array gegen CSV und Nachrechnung der Mittel (hier nur von Hand)
- Sichtprüfung des gesetzten Dokuments (Titelseite, Umschlag, Rückseite, Logo)
- erneuter Abgleich mit dem DWD vor Druck (G4)
- Entscheidung zu M2/M3: offenlegen oder Skala ändern
