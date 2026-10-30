# Faktencheck: Substack-Entwurf Ausbaupfad Wind an Land und Solar

**Geprüfter Text:** `Reports/2026-10-30-ausbaupfad/kanal-entwuerfe/substack.md` (Stufe Evidenzcheck)
**Geprüft von:** faktenpruefer-Subagent, unabhängig, 30.10.2026. Der Artikel wurde nicht verändert. Dieses Dokument enthält keinen Freigabevermerk.
**Geprüft gegen:** `Analysen/2026-10-ausbaupfad-wind-solar/` mit `Analysebericht_...md`, `output/tabelle2_E1_...csv`, `output/tabelle3_E2_E3_E4_...csv`, `output/tabelle3_E5_...csv`, `output/zwischen/voll_tabelle3_primaer.csv`, `Validierungsbericht_...md` (inkl. Nachprüfung 1), `Freigabe_Ergebnisse_Daniel_Saure_2026-10-30.md`, `Nachtrag_Zweitquelle_...md`, `Abweichungsprotokoll_...md`, SAP v1.0; ferner gesetze-im-internet.de (§ 4 EEG, § 1 WindSeeG), MaStR-Downloadseite, Energy-Charts-API, GitHub-Verzeichnis, Substack-About, beide Grafiken, `stilregeln.md`.

## Gesamturteil

**Abweichungen, in dieser Fassung nicht veröffentlichungsreif. 0 kritisch, 6 hoch, 10 mittel, 7 niedrig.**

Fast alle Zahlen stimmen mit Bericht, CSV und Nachtrag überein (Tabelle unten, Spalte „bestätigt"). Die Probleme liegen in vier Bereichen:

1. **Wortwahl und Einordnung** gegen SAP 11/12 und Bericht (Wort „verfehlt", Satz „außerhalb des Bereichs", wertende Zusätze).
2. **Eine falsch beschriftete Spalte** („Netto-Zubau pro Jahr in den Fenstern" zeigt die Geradensteigung, nicht den Netto-Zubau).
3. **Freigabeauflagen nur teilweise erfüllt** (Solar brutto/netto nicht überall nebeneinander; monatsgenaue Zeitpunkte je Fenster trotz Auflage „nur als Spanne").
4. **Gegenprobe (Nachtrag) ohne Validierung und nicht im öffentlichen Repo**, während der Text [5] darauf verweist und von „unabhängiger Prüfung" spricht.

Keine neue Berechnung gefunden. Neu sind drei Vergleichs- bzw. Bruchaussagen („höher als der Durchschnitt der letzten fünf Jahre", „rund ein Sechstel", Prozentform von s_W/R). Sie lassen sich aus Berichtszahlen ableiten, stehen aber so nicht im Bericht (siehe M-6, M-7).

---

## 1. Zahlenprüfung (Behauptung | Quelle | Ergebnis | Hinweis)

| # | Behauptung im Artikel (Zeile) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | Ziele 2030: 115 GW Wind an Land, 215 GW Solar (Z. 7) | § 4 EEG (URL geöffnet 30.10.2026), SAP 2.2 | bestätigt | Seite: Nr. 1 d) 115 GW, Nr. 3 d) 215 GW |
| 2 | Zwischenziel 2024: 69 GW Wind, 88 GW Solar (Z. 12, 19, 21) | § 4 EEG | bestätigt | Gesetz sagt „im Jahr 2024"; „Ende 2024" ist SAP-Setzung (K2), im Text nicht als Setzung ausgewiesen (N-2) |
| 3 | Ziele 2026: 84 GW / 128 GW (Z. 60) | § 4 EEG | bestätigt | |
| 4 | Wind auf See „mindestens 30 GW bis 2030" (Z. 64) | § 1 Abs. 2 WindSeeG (URL geöffnet) | bestätigt | |
| 5 | Kein Fassungsstand auf gesetze-im-internet.de (Z. 76, Quellen [1], [2]) | beide Seiten | bestätigt | Seite [1]: „nichtamtliches Inhaltsverzeichnis", kein Datum |
| 6 | Wind an Land Dez 2024: 63,5 GW, Abstand −5,5 GW (−8,0 %) (Z. 12, 23) | `tabelle2_E1` | bestätigt | 63,514 − 69 = −5,486 |
| 7 | Solar brutto Dez 2024: 100,8 GW, +12,8 GW (+14,6 %) (Z. 24) | `tabelle2_E1`, Bericht Abschn. 2 | bestätigt | |
| 8 | Solar netto Dez 2024: 90,1 GW, +2,1 GW (+2,3 %) (Z. 25) | Bericht Abschn. 2 (S6), Nachtrag (90,050) | bestätigt | Die CSV `tabelle2_E1` enthält nur die Primärzeilen; Netto steht im Bericht und in `tabelle4_*` |
| 9 | Bestand Jul 2026: Wind 70,4; Solar brutto 128,1; netto 113,5 GW (Z. 11, 34 ff.) | Bericht Abschn. 3, 6 (S6), Nachtrag | bestätigt | rekonstruiert aus Export 29.10.2026, nicht „im Register stehend" (M-1) |
| 10 | Wind: 01/2036, 12/2036, 12/2041 (Z. 35) | `tabelle3_E2...`, `voll_tabelle3_primaer.csv` | bestätigt | |
| 11 | Solar brutto: 08/2031, 08/2031, 09/2032 (Z. 36) | dto. | bestätigt | |
| 12 | Solar netto: 06/2033, 06/2033, 09/2034 (Z. 37) | Bericht Abschn. 6 (S6), Nachtrag Abschn. 5 | bestätigt | |
| 13 | „Wind 2036 bis 2041", „Solar 2031 bis 2032" (Z. 13) | Bericht Abschn. 3 | bestätigt | |
| 14 | R: Wind 10,1; Solar 19,7 GW/Jahr (Z. 14, 51, 55, 56) | `voll_tabelle3`: 10,105 / 19,678 | bestätigt | Solar-R ist die Brutto-Basis (C(T) = 128,1). Netto-R wäre 23,0 (nur im Nachtrag) (H-3) |
| 15 | Wind „Netto-Zubau pro Jahr" 4,7 / 4,3 / 3,0 (Z. 55) | `voll_tabelle3` Spalte `b_GW_jahr` | **Abweichung** | Das ist s_W (Geradensteigung). Der Netto-Zubau (`N_GW_jahr`) ist 4,7 / 4,2 / 3,0 (H-2) |
| 16 | Solar „Netto-Zubau pro Jahr" 17,2 / 17,2 / 14,8 (Z. 14, 56) | `voll_tabelle3` Spalte `b_GW_jahr` | **Abweichung** | Netto-Zubau (`N_GW_jahr`) ist 17,9 / 17,3 / 14,0. Z. 14 „zuletzt waren es 14,8 bis 17,2" stimmt also nicht (H-2) |
| 17 | „Anteil des Nötigen" 30 bis 46 % (Wind), 75 bis 87 % (Solar) (Z. 55 f.) | Bericht Abschn. 3 s_W/R = 0,46 / 0,43 / 0,30 und 0,87 / 0,87 / 0,75; `voll`: 0,465 / 0,428 / 0,297; 0,875 / 0,875 / 0,751 | bestätigt (Prozentform neu) | Im Bericht nur als Verhältnis. Die gerundete CSV zeigt 0,5 / 0,4 / 0,3 und 0,9 / 0,9 / 0,8 (G-2). Solar-Anteil ist auf Brutto-Basis (H-3) |
| 18 | Q_W Wind „15 bis 17 Prozent", Solar „weniger als ein Prozent" (Z. 58) | Bericht Abschn. 3 E4: 15,7 / 15,3 / 16,8; 0,9 / 0,8 / 0,5 % | bestätigt | |
| 19 | „rund ein Sechstel" (Z. 58) | nicht im Bericht | **Abweichung (neu)** | 1/6 = 16,7 %; Spanne 15,3 bis 16,8 %. Rechnerisch tragbar, aber neue Formulierung (M-7) |
| 20 | Repowering zählt als Stilllegung und Zubau, wird nicht herausgerechnet (Z. 58) | Bericht Abschn. 3, 8 Nr. 7 | bestätigt | |
| 21 | Wind Ende 2026 „70 bis 72 GW" (Z. 60) | Bericht Abschn. 4: 72,4 / 72,1 / 70,1 | bestätigt | „deutlich unter" ist neu (M-7) |
| 22 | Solar 2026: Ziel „unterhalb oder innerhalb" des Bereichs (Z. 60) | Bericht Abschn. 4 | bestätigt | F12/F24 unterhalb, F60 innerhalb. Die Berichtsformulierung „Das Ergebnis hängt vom Fenster ab" fehlt |
| 23 | Wind auf See Jul 2026 „rund 10,9 GW" (Z. 64) | `tabelle3_E5` | bestätigt | |
| 24 | Wind auf See „2036, 2051 oder bis 2060 nicht erreicht" (Z. 64) | `tabelle3_E5`: 05/2036, 03/2051, F60 „nicht bis 2060 erreicht" | bestätigt (Zahlen) | Satz grammatisch irreführend (M-9). Horizont 2060 unerklärt |
| 25 | Solar Netto liegt „rund 11 Prozent" unter Brutto (Z. 27) | Bericht Abschn. 8 Nr. 4; 90,05/100,81 = −10,7 %, 113,5/128,1 = −11,4 % | bestätigt | |
| 26 | Verschiebung „rund zwei Jahre" (Z. 15) | Bericht Abschn. 6 (22 bis 24 Monate) | bestätigt | |
| 27 | Durbin-Watson „0,02 bis 0,47" für F24 und F60 (Z. 72) | `diagnostik_*.csv`, Bericht Abschn. 7 | **Abweichung** | Solar F24 = 1,09 liegt außerhalb dieser Spanne (M-3) |
| 28 | „rund 1.100 Windeinheiten, rund 143.000 Solareinheiten" „In Betrieb" ohne Leistung/Datum (Z. 74) | Bericht Abschn. 8 Nr. 3: 1 121 / 142 845 | bestätigt | Richtung der Wirkung „unbekannt" im Bericht, im Text korrekt als „lässt sich nicht erkennen" |
| 29 | 17 Festlegungen, neun Hinweise (Z. 86) | Abweichungsprotokoll A-01..A-17, H-01..H-09 | bestätigt | H-01..H-09 sind Hinweise zu Daten, Dokumentation und Ablauf. „zum Datenformat" ist etwas eng (N-6) |
| 30 | Energy-Charts weicht bei Wind um 0,12 %, Solar DC um 0,01 bis 0,04 % ab (Z. 80) | Nachtrag Abschn. 4; API-Werte am 30.10.2026 selbst abgerufen: Wind 63,589 / 70,452, DC 100,8 / 128,075, AC 92,493 / 116,649 | bestätigt | Rohwerte decken sich mit dem Nachtrag |
| 31 | AC liegt „8 bis 9 Prozent darunter" (Z. 80) | Nachtrag: −8,25 bis −9,07 % | bestätigt | |
| 32 | AC „trifft ungefähr unsere Nettonennleistung" (Z. 80) | Nachtrag Abschn. 4: „+2,7 % … ohne sie zu treffen"; Zuordnung „ein Muster in den Zahlen, keine dokumentierte Definition" | **Abweichung** | Verschärfung (M-8) |
| 33 | „Erreichungszeitpunkte stimmen überein" (Z. 80) | Nachtrag Abschn. 5 | teilweise | Wind/Solar-DC: gleicher Monat in 5 von 6 Fällen, sonst ±1 Monat. AC gegen MaStR-netto: 01/2033 gegen 06/2033, 04/2034 gegen 09/2034, also rund 5 Monate Unterschied (M-8) |
| 34 | Lizenz Energy-Charts nicht bestätigt, keine Originaldaten gezeigt (Z. 82) | Nachtrag Abschn. 2; Grafiken geprüft | bestätigt | In beiden Grafiken keine Energy-Charts-Reihe |
| 35 | Plan am 29.10.2026 eingefroren (Z. 86) | SAP Kopf | bestätigt | |
| 36 | Prüfung rechnete „mit eigenem Code aus den Registerdateien nach, kein kritisches Problem" (Z. 86) | Validierungsbericht | bestätigt (Wortlaut) | Der Text lässt weg, dass die Erstprüfung 2 „hoch" fand (inzwischen geschlossen), und dass die Prüfung die Zielwerte und die Nachtrags-Gegenprobe nicht abdeckte (H-5, M-4) |
| 37 | Vorwissen: DIW-Monitor, Wind rund 68 GW, „Solar näher am Pfad" (Z. 88) | Bericht Abschn. 0, SAP 0 | teilweise | Bericht: „PV näher am Pfad **als Wind**"; Quelle „pv magazine zum DIW-Monitor, Februar 2026"; „Plan nicht angepasst" ist Umformulierung von „unabhängig davon festgelegt" (N-3) |
| 38 | Testlauf: Skriptversion nicht erhalten, danach „nur Darstellung und Beschriftungen" geändert (Z. 88) | Bericht 8 Nr. 10b, Protokoll Abschn. 4 | teilweise | Fehlt: Der Analyst sah vorher die Zwischenergebnisse. Der Bericht nennt zusätzlich „Logtexte, unname-Aufrufe". Vgl. M-4 |
| 39 | „Im Code der Endfassung erkennt die Prüfung keine Methodenwahl, die vom Ergebnis abhängt" (Z. 88) | Validierungsbericht M-5 | bestätigt | Im Bericht „per Code-Review plausibel" |
| 40 | Quelle [3]: Export 20261029_26.2, Stand 29.10.2026, „Datenlizenz Deutschland, Namensnennung 2.0" | SAP 3.1, MaStR-Downloadseite (30.10.2026) | bestätigt | Offizieller Name: „Datenlizenz Deutschland – Namensnennung – Version 2.0" (dl-de/by-2-0) (N-5) |
| 41 | Quelle [4]: Energy-Charts-URL, abgerufen und Datenstand 30.10.2026 | Nachtrag Abschn. 1/2; API selbst abgerufen | bestätigt | |
| 42 | Quelle [5]: GitHub-Ordner mit Analyseplan, Bericht, Abweichungsprotokoll, Validierungsbericht, **Nachtrag Zweitquelle** | GitHub-Verzeichnisliste (30.10.2026) | **Abweichung** | Liste zeigt SAP, Analysebericht, Abweichungsprotokoll, Validierungsbericht, Skript, Log. **Nachtrag und Freigabe-Datei nicht sichtbar** (H-5) |
| 43 | Links im Fuß (Instagram, Facebook, WhatsApp, About) | CLAUDE.md, feste URLs | bestätigt | |

---

## 2. Befunde nach Schweregrad

### Hoch

**H-1 „verfehlt" und weitere Wertungswörter (Z. 12).**
„… hat Windenergie an Land mit 63,5 GW um 5,5 GW verfehlt." SAP 11 verbietet ausdrücklich „Verfehlung", SAP 8.0/12 verlangt wertungsfreie, symmetrische Sprache. Der Bericht schreibt „Bestand unter dem Zwischenziel". Der Satz ist außerdem asymmetrisch zu „knapp darüber" bei Solar.
*Vorschlag:* „Wind an Land lag Ende 2024 mit 63,5 GW um 5,5 GW unter dem Zwischenziel von 69 GW. Solar lag mit 100,8 GW (brutto) bzw. 90,1 GW (netto) über dem Zwischenziel von 88 GW." („knapp" streichen, siehe M-7.)

**H-2 Spalte „Netto-Zubau pro Jahr in den Fenstern" ist die Geradensteigung (Z. 14, 53 bis 56).**
Gezeigt werden s_W = 12·b (Wind 4,7 / 4,3 / 3,0; Solar 17,2 / 17,2 / 14,8). Der tatsächliche Netto-Zubau der Fenster (E4, `N_GW_jahr`, bzw. ā_W) ist Wind 4,7 / 4,2 / 3,0 und Solar **17,9 / 17,3 / 14,0**. Bei Solar sind das bis zu 0,8 GW Unterschied. „Zuletzt waren es 14,8 bis 17,2 GW" (Z. 14) stimmt für den Netto-Zubau nicht (richtig 14,0 bis 17,9). Zudem steht in Z. 14 nur „Zubau", gemeint ist der Netto-Zubau.
*Vorschlag:* Spaltenkopf „Zubau je Jahr nach der Geraden des Fensters (GW)" und „Netto-Zubau" in Z. 14 klar benennen. Alternativ die Werte aus E4 (ā_W) nehmen und „Anteil des Nötigen" aus dem Bericht (s_W/R) mit dem Zusatz „nach der Geraden" belassen. Der Anteil gehört zu s_W, nicht zu ā_W.

**H-3 Auflage 2 (Solar brutto und netto nebeneinander) nur teilweise erfüllt.**
Erfüllt in der E1-Tabelle (Z. 21 bis 25) und der Erreichungstabelle (Z. 33 bis 37). Nicht erfüllt:
- Z. 11 („128,1 GW Solar", Verweis „dazu unten mehr", aber kein Nettowert),
- Z. 13 (Solar „zwischen 2031 und 2032" ohne „brutto", Netto-Spanne fehlt),
- Z. 14 und Z. 51 bis 56 (R = 19,7 und „75 bis 87 %" ohne Kennzeichnung „brutto"; Netto-R = 23,0 steht nur im Nachtrag, die Netto-Steigungen 14,85 / 14,84 / 12,83 nur dort),
- Grafik 2 (nur Brutto).
Der Bericht warnt ausdrücklich, dass die Leistungsgröße die Solar-Aussage verschiebt. Wer nur die Zusammenfassung liest, bekommt nur die günstigere Brutto-Variante.
*Vorschlag:* Z. 11 „128,1 GW brutto (113,5 GW netto)"; Z. 13 „bei Solar 2031 bis 2032 (brutto) bzw. 2033 bis 2034 (netto)"; Spalte/Tabelle als „Solar (brutto)" kennzeichnen und den Hinweis ergänzen, dass die Nettorechnung höhere Werte nötig macht. Netto-R aus dem Nachtrag nur mit Quellenangabe übernehmen oder weglassen. Grafik 2 mit Hinweis „nur Bruttoleistung".

**H-4 Auflage 3 (Zeitpunkte nur als Spanne über die Fenster) widersprüchlich umgesetzt (Z. 33 bis 39).**
Die Tabelle nennt je Fenster monatsgenaue Punkte („01/2036 / 12/2036 / 12/2041"). Z. 39 behauptet danach „Zeitpunkte nennen wir nur als Spanne über die drei Fenster". Der Bericht (Abschn. 0/3) will ausdrücklich nur die Spanne zitiert sehen („2036 bis 2041"), weil Intervalle bei F24/F60 zu eng und Monatsgenauigkeit nicht belastbar ist.
*Vorschlag:* Tabelle auf Jahre oder Spannen („2036 bis 2041", „2031 bis 2032", „2033 bis 2034") umstellen oder die Monatswerte als „Punkt der Geraden, je Fenster, nicht auf den Monat belastbar" kennzeichnen. Der Satz in Z. 39 muss zur Tabelle passen. Die gleiche Genauigkeit gilt für Z. 80 (dort schon Jahre, in Ordnung).

**H-5 Gegenprobe ohne Validierung und nicht im öffentlichen Repo (Z. 80 bis 82, 86, 96).**
Der Nachtrag ist laut eigener Kennzeichnung „Post-hoc, nach Validierung". Weder Validierungsbericht noch Nachprüfung 1 enthalten ihn. Z. 86 („Eine unabhängige Prüfung hat die Zahlen … nachgerechnet") lässt sich so lesen, als umfasse sie auch die Gegenprobe. Zusätzlich: Quelle [5] nennt den Nachtrag, die GitHub-Verzeichnisliste vom 30.10.2026 zeigt ihn nicht (und nicht die Freigabe-Datei). Der Leser kann ihn also nicht nachvollziehen. Die Rohwerte habe ich gegen die Energy-Charts-API geprüft und sie stimmen (Zeile 30 der Tabelle), die Auswertung aber nicht unabhängig neu gerechnet.
*Vorschlag:* Satz ergänzen: „Die Gegenprobe haben wir nach der Prüfung nachgeholt, sie wurde nicht erneut unabhängig geprüft." Vor Veröffentlichung Nachtrag (und Freigabe) committen und pushen, danach Link in [5] öffnen und gegenprüfen. Alternativ den Nachtrag kurz durch den validator nachprüfen lassen (Datei als Anhang, CLAUDE.md).

**H-6 „Das Ziel 2030 liegt in allen Fenstern außerhalb des Bereichs …" (Z. 39).**
Richtung korrekt (Ziel liegt in 6 von 6 Fällen oberhalb von U, siehe `voll_tabelle3`), aber:
- Wortlaut weicht von der in SAP 12 festgelegten Formulierung ab („oberhalb des 95-%-Prognoseintervalls der Fortschreibung"). „Außerhalb des Bereichs" ist ohne Definition nicht verständlich, das Intervall wird im Artikel nirgends eingeführt (kein „95 %", kein „punktweise").
- Der Bericht betont, dass das Intervall **nur die Streuung um die Gerade** abdeckt, nicht die Annahme konstanten Zubaus. Dieser Satz fehlt.
- Bei F24/F60 sind die Intervalle laut Bericht und Freigabeauflage „zu eng, nicht belastbar". Die Aussage „in allen Fenstern" stützt sich dort auf diese Intervalle. Der Vorbehalt kommt erst in Z. 72, mehrere Absätze später.
- Es erinnert an ein Testergebnis; SAP 5.5 sieht keinen Hypothesentest über Ziele vor.
*Vorschlag:* „Die Gerade jedes Fensters liegt Ende 2030 unter dem Ziel, bei Wind an Land und bei Solar. Das Ziel liegt in allen sechs Fällen über dem 95-%-Prognoseintervall der Geraden (Intervall bei 24 und 60 Monaten zu eng, siehe unten; es deckt nur die Streuung um die Gerade ab, nicht die Annahme eines gleichbleibenden Zubaus)." Dazu die Werte am 31.12.2030 aus dem Bericht (Wind 91,2 / 89,3 / 82,1 GW; Solar 203,8 / 203,8 / 189,7 GW), die der Artikel bisher nicht nennt.

### Mittel

**M-1 „Bestand heute" und „im Register" (Z. 7, 11); Endmonat Juli 2026 unerklärt.**
Z. 7 „wo der Bestand heute steht". Der Bestand endet im Juli 2026 und ist aus dem Export vom 29.10.2026 rekonstruiert. Spätere Monate liegen höher (Sep 2026: Wind 71,3, Solar 131,1 GW laut Bericht Abschn. 6/Nachtrag). Warum der Endmonat Juli gewählt wurde (drei Monate Puffer wegen Nachmeldungen, SAP 2.1), steht im Artikel nicht, und Aug bis Okt tauchen nur als offene Punkte in den Grafiken auf.
*Vorschlag:* „… wo der Bestand Ende Juli 2026 stand (aus dem Registerstand vom 29.10.2026 rekonstruiert; die drei jüngsten Monate lassen wir weg, weil Nachmeldungen sie noch verändern)".

**M-2 Hinweis zur Leistungsgröße verkürzt (Z. 27).**
„Die Dokumentation des Registers erklärt den Unterschied nicht." Geprüft wurde nur die Felddokumentation des Gesamtdatenexports (Rev. 26.2). Die externe Hilfeseite „Datendefinitionen" wurde ausdrücklich nicht geprüft (SAP 3.3, K6). Der Bericht (Abschn. 0) nennt außerdem den gegenläufigen Befund, dass das Register bei EEG-Anlagen die Nettonennleistung „installierte Leistung" nennt. Der Artikel lässt das weg, und es spricht für die Netto-Variante.
*Vorschlag:* „Die Felddokumentation des Datenexports erklärt den Unterschied nicht; eine weitere Hilfeseite des Registers haben wir nicht geprüft. Bei EEG-Anlagen nennt das Register die Nettonennleistung ‚installierte Leistung'. Welche Größe näher am Gesetzesbegriff liegt, konnten wir nicht prüfen."

**M-3 Durbin-Watson-Spanne unvollständig (Z. 72).**
„… 24- und 60-Monats-Fenster … (0,02 bis 0,47)". Solar F24 hat 1,09. Der Validierungsbericht (G-6/G-7) hat schon darauf hingewiesen, dass „zu eng bei F24 und F60" für Solar F24 pauschal ist.
*Vorschlag:* „(Durbin-Watson-Wert 0,02 bis 0,47, bei Solar mit 24 Monaten 1,09)" und Fachwort in einem Halbsatz erklären (Stilregel 2): „Werte weit unter 2 zeigen, dass aufeinanderfolgende Abweichungen gleichgerichtet sind".

**M-4 Testlauf, Prüfung, „Analyst" (Z. 86, 88).**
(a) Es fehlt „nach Sichtung der Zwischenergebnisse". Das ist der Kern der Auflage M-5 und der Grund, warum die Aussage wichtig ist. (b) Ebenfalls fehlen: kein Commit vor dem Testlauf, Endlauf überschrieb Log und Outputs, Prüfung hält die Aussage nur „per Code-Review für plausibel". (c) „Analyst", „nach seiner Angabe" und „unabhängige Prüfung" lesen sich wie menschliche Personen. Analyst und Prüfer sind Subagenten (KI). Die About-Seite nennt KI-Einsatz laut Abruf nicht und erklärt nicht, was „unabhängig" heißt. Das ist eine Entscheidung für Daniel Saure; ohne Klarstellung kann der Leser die Aussagen falsch einordnen.
*Vorschlag:* „Der Analyst (ein KI-Subagent) hat vor dem Endlauf einen Testlauf gemacht und dabei die Zwischenergebnisse gesehen. Die Skriptversion davon ist nicht erhalten. Nach seiner Angabe hat er danach nur Darstellung, Logtexte und Beschriftungen geändert. Wir können das nicht nachprüfen. Die Prüfung hält es aufgrund des Codes für plausibel." „unabhängig" definieren („vom Rechenschritt getrennt").

**M-5 Zweitquellenabgleich: Auflage 1 erfüllt, Lücken bleiben (Z. 80 bis 82).**
Erfüllt ist: Zweitquelle genannt, Unabhängigkeitsvorbehalt gesetzt, Lizenz offen benannt. Nicht gesagt wird: nur Energy-Charts verglichen (BNetzA-EE-Statistik und OWID nicht), Solar-DC/AC-Zuordnung nicht aus Originaldokumentation belegt, Energy-Charts schreibt rückwirkend fort (Ende 2025: 116,8 aus Presseinfo gegen 118,111 aus der Reihe).
*Vorschlag:* Ein Satz: „Energy-Charts ist die einzige Zweitquelle; die Statistik der Bundesnetzagentur haben wir nicht abgeglichen. Dass die Gleichstromleistung der Modulleistung entspricht, haben wir nicht im Original geprüft."

**M-6 Neue Aussage „Der Zubau der letzten 12 Monate war höher als der Durchschnitt der letzten fünf Jahre" (Z. 39).**
Steht so nicht im Bericht. Aus den Berichtszahlen ableitbar: ā_12 / ā_60 = Wind 4,7 / 3,0, Solar 17,9 / 14,0 GW pro Jahr. Es ist aber eine neue Aussage, nicht nur eine Tabellenzahl, und sie liest sich als Trendbehauptung. SAP 8.0 will ein außergewöhnliches F12-Jahr nicht als Trend deuten. Zusätzlich ist F12 am stärksten von Nachmeldungen betroffen (SAP 8.3). „Vor allem bei Wind" ist nicht in der Quelle (Spanne Wind 2036 bis 2041 gegen Solar 2031 bis 2032 ist aber zahlenmäßig zutreffend).
*Vorschlag:* Ersetzen durch eine Tabellenaussage: „Das liegt an unterschiedlichem Zubau: Bei Wind an Land waren es in den letzten 12 Monaten 4,7 GW im Jahr, im Fünfjahresfenster 3,0 GW." Dann ohne Wertung oder Trendformulierung. Oder streichen.

**M-7 Wertende Zusätze (Z. 12, 58, 60).**
„knapp darüber" (Z. 12), „deutlich unter dem Ziel" (Z. 60), „rund ein Sechstel" (Z. 58). Alle nicht im Bericht, SAP 8.0/8.4 verlangt neutrale, symmetrische Sprache („Bestand auf oder über dem Zwischenziel"). „Ein Sechstel" (16,7 %) passt knapp, die Bandbreite ist 15 bis 17 %.
*Vorschlag:* „knapp", „deutlich" streichen; „rund ein Sechstel" weglassen und nur „15 bis 17 Prozent" nennen. Bei Z. 60 die Differenz benennen: „Das Ziel 2026 (84 GW) liegt um 12 bis 14 GW über dem fortgeschriebenen Wert". Das wäre eine neue Subtraktion; besser nur beide Zahlen nebeneinander nennen und den Berichtswortlaut („Ziel oberhalb des Intervalls") verwenden.

**M-8 Gegenprobe: Verschärfung „trifft ungefähr" und „stimmen überein" (Z. 80).**
Der Nachtrag sagt: Solar AC nähert sich netto mit +2,7 %, „ohne sie zu treffen"; die Zuordnung ist ein Zahlenmuster, keine dokumentierte Definition. Zeitpunkte: Wind/Solar-DC gleicher Monat in 5 von 6 Fällen; Energy-Charts-AC liegt bei 01/2033, 01/2033, 04/2034 gegen MaStR-netto 06/2033, 06/2033, 09/2034, also rund 5 Monate früher. Nur die Jahre decken sich.
*Vorschlag:* „Die Wechselstromleistung liegt 8 bis 9 Prozent darunter und liegt damit nahe an unserer Nettonennleistung (etwa 3 Prozent darüber). Ob das die Definitionen widerspiegelt, haben wir nicht belegt. Die Erreichungsjahre sind in beiden Quellen gleich; bei Netto/AC liegen die Monate rund fünf Monate auseinander."

**M-9 Windenergie auf See, Satz Z. 64.**
„Je nach Fenster wäre das Ziel 2036, 2051 oder bis 2060 nicht erreicht." Der Satz ist mehrdeutig. Richtig: F12 Punkt 05/2036, F24 03/2051, F60 „nicht bis 2060 erreicht" (Suchhorizont 2060). Zudem fehlen der Hinweis, dass dafür R = 4,3 GW/Jahr nötig wäre (nicht nötig), und für E5 die gleichen Autokorrelationsprobleme (DW 0,81 / 0,13 / 0,11) wie bei F24/F60. Die Jahre sind auf Jahresgenauigkeit zitiert, ok.
*Vorschlag:* „Bei einer Geraden über 12 Monate läge das Ziel 2036, über 24 Monate 2051. Über 60 Monate wäre es bis 2060 nicht erreicht (weiter haben wir nicht gesucht). Die Intervalle sind hier ebenfalls zu eng."

**M-10 Grafiken (`assets/grafik1_wind_an_land.png`, `grafik2_solar.png`).**
Inhaltlich stimmen die Kurven mit den Tabellen überein: Bestand rund 63,5 bzw. 100,8 GW Ende 2024, rund 70 bzw. 128 GW bei T; Fortschreibungsenden Wind F12 rund 91, F24 rund 89, F60 rund 82 GW; Solar F12/F24 rund 204, F60 rund 190 GW; Zielstern 115 bzw. 215 GW; Zielpfad 69/84/99/115/157/160 bzw. 88/128/172/215/309/400 (die Werte 2028/2035/2040 habe ich zusätzlich gegen § 4 EEG geprüft, sie stimmen). Pixelgenaue Werte habe ich nicht abgelesen.
Beanstandungen:
- Titel „Paragraf 4 EEG" statt „§ 4 EEG" und ASCII-Umschreibungen („Verlaengerung"); G-5 des Validierungsberichts ist offen und sollte laut Nachprüfung „spätestens vor Veröffentlichung der Grafiken" behoben sein. Der Artikel macht das Problem sichtbar, statt es zu beheben, indem die Unterschrift sagt „Die Grafik trägt in ihrer Überschrift die Nummer 1 und ‚Paragraf 4 EEG'." Das ist ein redaktioneller Prüfvermerk, kein Leserinhalt.
- Die Unterschrift nennt „Positive Werte in GW", das ist missverständlich; die Achse heißt „installierte Leistung (GW)".
- Die 95-%-Prognosebänder von F24 und F60 erscheinen ohne den Hinweis, dass sie zu eng sind (Auflage 3, Intervalle). Die Beschriftung „Prognoseband" und „Prognose" widerspricht dem Satz „keine Prognose" im Text.
- Legende „T_S1" und „Monate nach T bis T_S1" ist Projektjargon und im Artikel nirgends erklärt.
- Grafik 2 zeigt nur Brutto (siehe H-3).
- Zielpunkte stehen am 31.12. und deshalb rechts der Jahreszahl (Ziel 2030 bei 2031,0). Das ist korrekt, kann aber falsch gelesen werden; Unterschrift könnte es erwähnen.
*Vorschlag:* Grafiken mit „§ 4 EEG" und Umlauten neu erzeugen (Neulauf, siehe G-5), Prüfhinweis aus der Unterschrift streichen, Bänder mit „Intervall bei 24 und 60 Monaten zu eng" kennzeichnen und Legendeneinträge erklären.

### Niedrig

**N-1 Titel (Z. 5).** „Wind und Solar" ist ungenau (Analyse gilt für Wind an Land; Wind auf See ist Randnotiz). „Wann erreicht Deutschland die Ausbauziele …" kann als Prognose gelesen werden. *Vorschlag:* „Wann wären die Ausbauziele für Wind an Land und Solar erreicht, wenn der Zubau so weitergeht wie in den letzten ein bis fünf Jahren?" (Spanne aus den drei Fenstern).

**N-2 Zielstichtag.** Das Gesetz sagt „im Jahr 2024/2026/2030". „Ende 2024", „Ende 2026" ist die SAP-Setzung (Bestand am 31.12.). Im Text als Setzung kennzeichnen („wir vergleichen mit dem Bestand am 31.12.").

**N-3 Vorwissen (Z. 88).** Genauer nach Bericht: „Solar näher am Pfad **als Wind**"; Quelle „pv magazine zum DIW-Monitor, Februar 2026" nennen; „Alle Fenster, Modelle und Regeln wurden unabhängig davon festgelegt" statt „Daran haben wir den Plan nicht angepasst" (sinngleich, aber der Bericht-Wortlaut ist enger).

**N-4 Fehlende Richtungsangaben der Unsicherheit (Z. 74).** Der Bericht nennt: fehlende Stilllegungsmeldungen überzeichnen den Netto-Zubau tendenziell (Zeitpunkte wirken dann zu früh); Nachmeldungen können die jüngsten Monate unterzählen (SAP 8.2, 8.3). Der Artikel schreibt nur „können ihn verändern". Zu ergänzen ist, dass die Fortschreibung dadurch eher günstiger ausfällt als die Wirklichkeit, bzw. in der Gegenrichtung für Nachmeldungen.

**N-5 Lizenz (Z. 94).** „Datenlizenz Deutschland, Namensnennung 2.0" ist der Sache nach richtig (Downloadseite nennt „Datenlizenz Deutschland – Namensnennung – Version 2.0", verlinkt auf govdata.de). Offizielle Form: „Datenlizenz Deutschland – Namensnennung – Version 2.0 (dl-de/by-2-0)". Den Lizenztext selbst habe ich nicht gelesen. Ob ein Änderungsvermerk („Daten bearbeitet") und der Lizenz-Link erforderlich sind, muss gegen den Lizenztext geprüft werden. Es steht nirgends im Artikel, dass die Daten bearbeitet wurden (rekonstruiert, fortgeschrieben).

**N-6 Z. 86 „neun Hinweise zum Datenformat".** H-01..H-09 betreffen Katalognamen, Prüfsummenliste, Pakete, Einleseweg, Extrakte, Listen, Inbetriebnahmejahre, Warnungen, G-Nummern. Besser: „neun Hinweise zu Daten und Dokumentation".

**N-7 Prozentbasis (Z. 21 bis 25).** „(−8,0 %)" ist Prozent des Ziels (SAP 2.3). Im Artikel ohne Basis. Spaltenkopf „Abstand (Prozent des Ziels)".

### Stil (Stilregeln v0.3)

Kein Gedankenstrich-Gebrauch im Text, keine fetten Schlagwortköpfe, keine Modewörter wie „entscheidend" oder „im Kern". Auffällig:
- **Gegensatzformeln gehäuft (Regel 1):** „… keine Prognose" (Z. 68), „… keine Bewertung von Politik" (Z. 68), „… keine Stromerzeugung und kein Anteil am Strommix" (Z. 70), „… keine unabhängige Bestätigung" (Z. 82). Die Aussagen sind Pflichtvorbehalte aus dem Bericht und bleiben. Verteilen oder in positive Sätze fassen („Sie beschreibt, was herauskäme, wenn …").
- **Ankündigungssatz/Pose (Regel 6/10):** „Zur Offenheit gehört:" (Z. 88). Streichen und direkt „Wir kannten vorab …".
- **Doppelpunkt als Stilmittel (Regel 3):** „… hängt vom Fenster ab, vor allem bei Wind: Der Zubau …" (Z. 39).
- **Gleichförmiger Satzanfang „Wir …"** in Z. 7, 19, 27, 31, 74, 76, 80, 82, 86, 88 (Regel 7). Variieren.
- **Fachwörter ohne Erklärung (Regel 2):** Durbin-Watson, Bruttoleistung/Nettonennleistung (nur halb erklärt), Gleichstrom-/Wechselstromleistung, „Prognoseintervall", „Suchhorizont" fehlen oder sind unklar. „Fortschreibung" ist erklärt.
- „wohl keine unabhängige Bestätigung … vermutlich" (Z. 82): doppelte Abschwächung. Der Nachtrag sagt „Indiz, kein Beleg"; besser direkt: „Das ist vermutlich keine unabhängige Bestätigung."
- Z. 60 steht zwischen „Wie viel mehr Zubau nötig" und Wind auf See, ohne Überleitung: eigener Abschnitt („Zwischenziel 2026") würde die Struktur verbessern (Regel 5).
- „Nettoleistung" (Z. 80) statt „Nettonennleistung": einheitlich schreiben.

---

## 3. Freigabeauflagen (Freigabe_Ergebnisse_Daniel_Saure_2026-10-30.md)

| Auflage | Stand im Entwurf | Ergebnis |
|---|---|---|
| 1 Zweitquelle genannt oder Abgleich nachgeholt | Abgleich mit Energy-Charts nachgeholt und im Text ehrlich als nicht unabhängig eingeordnet (Z. 78 bis 82) | erfüllt, Lücken M-5, H-5 (Nachtrag ohne Validierung, nicht im Repo) |
| 2 Solar brutto und netto nebeneinander | E1- und Erreichungstabelle ja; Zusammenfassung, R/Anteil-Tabelle, Grafik 2 nein | **teilweise (H-3)** |
| 3 Zeitpunkte nur als Spanne; Intervalle bei 24/60 Monaten zu eng | „zu eng" ausdrücklich gesagt (Z. 72); Spanne in Z. 13, 80. Aber Monatswerte je Fenster in der Tabelle (Z. 35 bis 37), Satz „außerhalb des Bereichs" ohne Vorbehalt (Z. 39), Grafikbänder ohne Hinweis | **teilweise (H-4, H-6, M-10)** |
| 4 Testlauf-Version nicht erhalten, Bericht sagt das | Aussage vorhanden (Z. 88), aber ohne „nach Sichtung der Zwischenergebnisse" | **teilweise (M-4)** |

Weitere SAP-/Bericht-Vorgaben:
- Wörter „Prognose/Verfehlung/signifikant": „signifikant" kommt nicht vor, „Prognose" nur in Verneinung (gut, aber Grafik-Beschriftung „Prognoseband"); „verfehlt" kommt vor (H-1).
- „Fortschreibung ist keine Prognose" steht im Text (Z. 68). Ohne Politik-, Ursachen- oder Erzeugungsaussagen. Erfüllt.
- Offengelegtes Vorwissen genannt (Z. 88); Endmonat T nur beiläufig (M-1).
- „Das Ergebnis hängt vom Fenster ab" steht im Text (Z. 39), aber nicht in der Zusammenfassung.
- E5 steht nicht in Überschrift/Teaser (SAP 7.3 erfüllt).

---

## 4. Was ich nicht prüfen konnte

- **Rohdaten und Rekonstruktion des Bestands** (MaStR-XML, 40 GB teils gelöscht): nicht neu berechnet. Zahlen gegen Bericht, CSV und die Nachrechnung des validators geprüft; die Unabhängigkeit liegt bei dessen Prüfung. Der Validierungsbericht selbst nennt als nicht geprüft: Inhalt der Gelöschte-und-Deaktivierte-Dateien auf Nummernebene, Katalogcodes, Zielwerte gegen Gesetz (das habe ich nachgeholt), einzelne Listen, Parallel-Einheiten.
- **Nachtrag Zweitquelle:** Rohwerte der Energy-Charts-Reihe (Dez 2024, Jul 2026) selbst gegen die API geprüft, nicht aber die Fortschreibungen auf der Energy-Charts-Reihe. Die MaStR-Zeilen des Nachtrags stimmen mit den Primär- und S6-Werten überein.
- **Lizenz** der Energy-Charts-Reihe (laut Nachtrag selbst offen) und den **Lizenztext** dl-de/by-2-0 (insbesondere Pflichten zu Quellenvermerk und Änderungshinweis).
- **Vollständigkeit des GitHub-Verzeichnisses:** Die Verzeichnisliste zeigte „View all files"; ob Nachtrag und Freigabe-Datei dennoch vorhanden sind, ist unsicher. Ob der Stand des Analyseberichts auf GitHub dem lokalen Nachprüfungs-Stand entspricht, habe ich nicht verglichen.
- **Grafiken:** nur visuell gegen Tabellenwerte abgeglichen (keine Pixelmessung, keine Prüfung der zugrunde liegenden Datenreihen).
- **Zeitpunkt des SAP-Einfrierens gegenüber dem Datenzugriff** (Rohdaten wurden 29.10. gegen 10:19 bis 10:37 UTC geladen/hashed; Einfrierzeit nicht dokumentiert). „Bevor wir die Daten ausgewertet haben" (Z. 86) ist durch SAP-Kopf und Protokoll gedeckt, nicht minutengenau.
- **Ob Daniel Saure den Nachtrag gelesen hat:** Freigabe-Datei nennt Analysebericht und Abweichungsprotokoll, nicht den Nachtrag.
- **Substack-Vorgaben des Skills `blog-artikel`** (Schlusszeile, „Evidenzcheck #n", Teaser-Länge): Skill nicht geprüft. In der Kopfzeile fehlt die Nummer „#n" aus CLAUDE.md („Klima Kompass · Evidenzcheck #n").
- **Ob und wo KI-Einsatz öffentlich offengelegt ist** (Impressum, Methodenseite): About-Seite nennt ihn laut Abruf nicht; andere Seiten nicht geprüft.

---

# Nachprüfung 1

**Geprüfter Text:** `Reports/2026-10-30-ausbaupfad/kanal-entwuerfe/substack.md`, Fassung „ENTWURF v2 (30.10.2026)". Zeilenangaben beziehen sich auf diese v2-Datei (Z. n), nicht auf v1 oben.
**Geprüft von:** faktenpruefer-Subagent, unabhängig, 30.10.2026. Der Artikel wurde nicht verändert. Dieser Abschnitt enthält keinen Freigabevermerk.
**Zusätzlich geöffnet bzw. gelesen:** Analysebericht, `voll_tabelle3_primaer.csv`, Nachtrag Zweitquelle, Validierungsbericht, SAP 2.1, 2.2, 3.2, 3.3, 3.5 (alle `Analysen/2026-10-ausbaupfad-wind-solar/`), § 4 EEG auf gesetze-im-internet.de (erneut, 30.10.2026), GitHub-Verzeichnis (erneut), beide Grafikdateien (erneut), `Publikationen-oeffentlich/jahrbuch-2026/stilregeln.md` (v0.3), Skill `blog-artikel`.

## 4.1 Gesamturteil Nachprüfung 1

**Abweichungen, noch nicht veröffentlichungsreif, aber deutlich besser als v1. 0 kritisch, 1 hoch, 8 mittel, 15 niedrig (Restbestand, Liste in 4.5).**

- Von den 23 Befunden aus der Erstprüfung sind **9 umgesetzt, 9 teilweise, 5 offen** (4.2). Als „bewusst offen" ist keiner gekennzeichnet; der Entwurf nennt keine Begründung für unerledigte Punkte.
- **Alle sechs hohen Befunde sind inhaltlich bearbeitet.** Vier gelten als umgesetzt. H-3 (Solar brutto/netto) und H-5 (Gegenprobe/Repo) sind nur teilweise erledigt. Davon bleibt genau ein hoher Rest: Quelle [5] nennt einen „Nachtrag Zweitquelle", der im GitHub-Ordner nicht zu sehen ist (R-1).
- **Neue Fehler:** Keine falsche Zahl gefunden. Alle abgefragten Zahlen stimmen mit Bericht, CSV und Nachtrag (4.3). Neu sind 3 mittlere Befunde (Doppelbedeutung „Gegenprobe" und Herkunft der 23,0 GW; Begriffsvermischung „Netto-Zubau" gegen „netto"; „rund fünf Monate früher" als neue Differenz) und 8 niedrige.
- **Neue Berechnung:** Keine Berechnung im Sinn einer neuen Methode. Zwei Aussagen sind aber abgeleitet und stehen so nicht in Bericht oder Nachtrag: „rund fünf Monate früher" (Differenz zweier Monatswerte, R-9) und „Anteil des Nötigen" in Prozent (nur Prozentform eines Berichtsverhältnisses, bereits in v1 bestätigt).
- Die Grafikdateien sind gegenüber v1 **unverändert** (Titel „Paragraf 4 EEG", „Verlaengerung", „Prognoseband", Legende „T_S1").

## 4.2 Status der 23 Erstbefunde

Legende: umgesetzt / teilweise / offen (nicht als „bewusst offen" begründet). „Rest" verweist auf die Liste in 4.5.

| Befund | Status | Fundstelle in v2 | Anmerkung |
|---|---|---|---|
| H-1 „verfehlt", „knapp darüber" | umgesetzt | Z. 12 | „verfehlt" und „knapp" sind gestrichen. Jetzt „nicht erreicht: 63,5 GW, also 5,5 GW darunter" und „12,8 GW darüber". Sinngemäß symmetrisch, am Bericht ausgerichtet. |
| H-2 Spalte „Netto-Zubau" = Steigung | umgesetzt | Z. 57 bis 62 | Spalte heißt „Steigung der Geraden pro Jahr"; Z. 62 nennt den echten Netto-Zubau (Solar 17,9 / 17,3 / 14,0). Werte stimmen (4.3). Rest R-8 (Begriff „Netto") und R-19 (Z. 14). |
| H-3 Solar brutto und netto nebeneinander | teilweise | Z. 11, 13, 14, 21 bis 25, 33 bis 41, 55, 51 | Neu nebeneinander: Z. 11, 12 (Ziel 2024), 13 (Spanne brutto/netto), 14 (R 19,7 und 23,0), Tabellen Z. 21 bis 25 und 37 bis 41. Nicht: Tabelle Z. 57 bis 60 (nur Solar brutto, Steigung und Anteil für netto fehlen), Z. 43 und Z. 66 („Solar" ohne Größe), Grafik 2 (nur brutto, Unterschrift nennt wenigstens „rund 11 Prozent tiefer"). Rest R-2. |
| H-4 Zeitpunkte nur als Spanne | umgesetzt | Z. 13, 33 bis 43 | Tabelle Z. 37 bis 41 nennt „2036 bis 2041", „2031 bis 2032", „2033 bis 2034". Z. 43 begründet (zu enge Intervalle). Reste: Wind auf See je Fenster (R-20), „fünf Monate" (R-9). |
| H-5 Gegenprobe ohne Validierung, nicht im Repo | teilweise | Z. 88, 92, 102 | Text jetzt ehrlich: „nach der unabhängigen Prüfung nachgeholt, sie ist daher nicht Teil dieser Prüfung". **Repo offen:** GitHub-Verzeichnis (30.10.2026) enthält keinen Nachtrag und keine Freigabe-Datei, [5] nennt ihn aber (Z. 102). Rest R-1, R-7. |
| H-6 „außerhalb des Bereichs" | umgesetzt | Z. 35, 43 | Formulierung wie SAP 12 („oberhalb des 95-Prozent-Prognoseintervalls"); Intervall erklärt; Satz „deckt nur die Streuung ... nicht enthalten" da; Vorbehalt „zu eng" im selben Absatz (Z. 43). Rest: Werte der Geraden am 31.12.2030 fehlen (R-22). |
| M-1 „Bestand heute", Endmonat | teilweise | Z. 7, 11, 29 | Endmonat Juli und Grund stehen jetzt in Z. 29. Z. 7 „wo der Bestand steht" und Z. 11 „standen im Register" bleiben (rekonstruiert, nicht „im Register"). Rest R-10, R-17. |
| M-2 Dokumentation, „installierte Leistung" | teilweise | Z. 27 | Gegenläufiger Befund („Bei EEG-Anlagen nennt das Register die Nettonennleistung ‚installierte Leistung'") ist ergänzt. Offen: „Felddokumentation des Registers" statt „des Datenexports"; die externe Hilfeseite ist nicht als ungeprüft genannt; „konnten wir nicht klären" statt „nicht geprüft". Rest R-3, R-24. |
| M-3 Durbin-Watson | umgesetzt | Z. 78 | „zwischen 0,02 und 0,47 (bei Solar mit 24 Monaten bei 1,09)" stimmt (4.3). Fachwort nur als „ein Maß dafür" erklärt; was die Werte bedeuten (weit unter 2), steht nicht da (Stil, 4.6). |
| M-4 Testlauf, KI, „unabhängig" | teilweise | Z. 94, 92 | „nach Sichtung der Zwischenergebnisse" ergänzt, „Das lässt sich nicht nachprüfen" ergänzt. Offen: „nur Darstellung und Beschriftungen" lässt „Logtexte, unname-Aufrufe" weg; kein Commit vor Testlauf und überschriebenes Log fehlen; Analyst und Prüfer erscheinen weiter als „Auswertender" und „Prüfung" ohne Hinweis auf KI-Subagenten (Entscheidung Daniel Saure, nicht als bewusst offen vermerkt). Rest R-4. |
| M-5 Zweitquelle, Lücken | offen | Z. 86 bis 88 | Nicht ergänzt: einzige Zweitquelle, BNetzA/OWID nicht abgeglichen, DC/AC-Zuordnung nicht im Original geprüft, Energy-Charts schreibt rückwirkend fort. Rest R-5. |
| M-6 „höher als Durchschnitt" | umgesetzt | Z. 43 | Gestrichen; ersetzt durch „Im 12-Monats-Fenster lag der Zubau bei 4,7 GW pro Jahr, im 60-Monats-Fenster bei 3,0 GW" (Bericht: Netto-Zubau 4,7 / 3,0, stimmt). „am stärksten bei Windenergie an Land" ist durch die Spannen im Bericht (Wind 2036 bis 2041 gegen Solar 2031 bis 2032) gedeckt. |
| M-7 „knapp", „deutlich", „Sechstel" | umgesetzt | Z. 12, 64, 66 | Alle drei gestrichen. Z. 64: „15 bis 17 Prozent", Z. 66 nur beide Zahlen. |
| M-8 „trifft ungefähr", „stimmen überein" | teilweise | Z. 86 | „trifft ungefähr" ersetzt durch Zahlenangabe „2,7 Prozent über unserer Nettonennleistung". Neu aufgenommen „rund fünf Monate früher" (R-9). Wind ±1 Monat bei F24 nicht erwähnt. |
| M-9 Wind auf See | teilweise | Z. 70 | Satz jetzt eindeutig (2036, 2051, bis 2060 nicht erreicht). Neu: „Die Intervalle sind auch hier zu eng" (nicht im Bericht, R-20); Horizont 2060 unerklärt; Jahre je Fenster statt Spanne. |
| M-10 Grafiken | offen | Z. 45 bis 51; Dateien | Dateien unverändert. Unterschrift Z. 47 enthält weiter den Prüfvermerk „Die Grafik trägt in ihrer Überschrift die Nummer 1 und schreibt „Paragraf 4 EEG“." (kein Leserinhalt). „Prognoseband", „T_S1", „Verlaengerung" bleiben. Z. 51 nennt immerhin „rund 11 Prozent tiefer". Rest R-6. |
| N-1 Titel | teilweise | Z. 5, 7 | „Wind an Land" im Titel ergänzt. „Zubau der letzten Monate" passt nicht zum 60-Monats-Fenster. Rest R-12. |
| N-2 Zielstichtag | umgesetzt | Z. 19 | „Als Stichtag nehmen wir jeweils den 31. Dezember ... Annahme unseres Analyseplans, das Gesetz nennt keinen Tag." Stimmt (§ 4 EEG: nur „im Jahr 2024/2026/2030", SAP 2.1/2.2 K2). Z. 12 und Z. 66 sagen „Ende 2024/2026" schon vor der Erklärung, unkritisch. |
| N-3 Vorwissen | teilweise | Z. 94 | „Zur Offenheit gehört" gestrichen. Weiter „Solar näher am Pfad" ohne „als Wind"; Quelle (pv magazine) nicht genannt. Rest R-13. |
| N-4 Richtung der Unsicherheit | offen | Z. 80 | Unverändert „können ihn verändern". Rest R-14. |
| N-5 Lizenz | offen | Q [3] | Formel leicht geändert („Datenlizenz Deutschland, Namensnennung, Version 2.0"), nicht die offizielle Form; kein Bearbeitungsvermerk. Rest R-15. |
| N-6 „Datenformat" | offen | Z. 92 | Unverändert. Rest R-16. |
| N-7 Prozentbasis | umgesetzt | Z. 21 | Spaltenkopf „Abstand (in Prozent des Ziels)". |

Zählung: umgesetzt 9 (H-1, H-2, H-4, H-6, M-3, M-6, M-7, N-2, N-7), teilweise 9 (H-3, H-5, M-1, M-2, M-4, M-8, M-9, N-1, N-3), offen 5 (M-5, M-10, N-4, N-5, N-6).

## 4.3 Prüfung der neuen und geänderten Aussagen in v2

Ergebnis: bestätigt / Abweichung / nicht prüfbar. Im Zweifel Abweichung.

| # | Behauptung in v2 (Z.) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „23,0 GW (netto, Gegenprobe)" Solar, nötiger Zubau pro Jahr (Z. 14, 55) | Nachtrag Abschn. 5, Spalte R, Zeile „MaStR Solar netto (S6)": 23,0; nachgerechnet (215 − 113,534) / (53/12) = 22,97 | bestätigt (Zahl) | Die Zahl steht **nur im Nachtrag**, nicht im Analysebericht und ist nicht von der Prüfung abgedeckt. „Gegenprobe" bedeutet im Text zweierlei (Netto-Rechnung S6 in Z. 27, 55; Energy-Charts in Z. 84 bis 88). Z. 88 sagt „Die Gegenprobe haben wir nach der unabhängigen Prüfung nachgeholt": Für die Netto-Rechnung S6 stimmt das nicht (die ist validiert, nur R netto nicht), für Energy-Charts ja. Der Leser kann nicht erkennen, was ungeprüft ist (R-7). |
| 2 | „Der tatsächliche Netto-Zubau ... liegt dicht daran, bei Solar mit 17,9 / 17,3 / 14,0 GW etwas anders" (Z. 62) | `voll_tabelle3_primaer.csv`, `N_GW_jahr`: Wind 4,664 / 4,153 / 3,036; Solar 17,862 / 17,319 / 14,019; Bericht Abschn. 3 E4 | bestätigt (Zahlen) | Wind: Steigung 4,7 / 4,3 / 3,0 gegen Netto-Zubau 4,7 / 4,2 / 3,0, „dicht daran" stimmt. Solar: Steigung 17,2 / 17,2 / 14,8 gegen 17,9 / 17,3 / 14,0 (bis 0,8 GW), „etwas anders" ist untertrieben, aber nicht falsch. Die Wind-Werte stehen nicht im Text. „Netto-Zubau" meint hier die Bilanzgröße nach Stilllegungen in Bruttoleistung, nicht die Nettonennleistung (R-8). |
| 3 | „Wind an Land ... 70 bis 72 GW" Ende 2026, „Ziel in allen Fenstern oberhalb des Intervalls" (Z. 66) | Bericht Abschn. 4: 72,4 [72,0; 72,9] / 72,1 [71,6; 72,5] / 70,1 [68,7; 71,6]; `voll`: `kat2026` | bestätigt | 70,1 bis 72,4 gerundet 70 bis 72. Ziel 84 liegt weit über allen Obergrenzen (auch bei den zu engen Intervallen F24/F60 ohne Folge für die Aussage). |
| 4 | Solar 2026 „in zwei Fenstern unterhalb und in einem innerhalb des Intervalls" (Z. 66, E1b) | Bericht Abschn. 4: F12/F24 „Ziel unterhalb des Intervalls", F60 „im Intervall" | bestätigt | Richtig; entspricht auch dem Wortlaut „Ziel unterhalb/im Intervall". Aber: Solar-Größe nicht genannt (brutto), die Fortschreibungswerte (135,0 / 135,0 / 130,5 GW) fehlen, die Konsequenz (Fortschreibung liegt über dem Ziel) bleibt dem Leser überlassen; F24 stützt sich auf ein zu enges Intervall (R-21). Netto für 2026 gibt es nicht. |
| 5 | Energy-Charts-AC „rund fünf Monate früher" als MaStR netto (Z. 86) | Nachtrag Abschn. 5: AC 01/2033, 01/2033, 04/2034; netto 06/2033, 06/2033, 09/2034 | bestätigt (Zahl), **Abweichung (Form)** | Differenz in allen drei Fenstern exakt 5 Monate. Der Nachtrag nennt aber nur die Monatspunkte, nicht die Differenz; neue Subtraktion. Außerdem Monatsgenauigkeit trotz Auflage 3 („Zeitpunkte nur als Spanne") und aus dem nicht validierten Nachtrag (R-9). „im selben Zeitraum 2033 bis 2034": bestätigt (AC 2033/2033/2034, netto 2033/2033/2034). |
| 6 | „Bei der Bruttoleistung stimmen die Zeitpunkte mit unseren überein" (Z. 86) | Nachtrag Abschn. 5: Solar DC gegen MaStR brutto: 08/2031, 08/2031, 09/2032 in beiden | bestätigt (Solar) | Wind wird nicht erwähnt: dort ist F24 um einen Monat verschoben (11/2036 gegen 12/2036), in 5 von 6 Fällen gleicher Monat. Der Satz ist nicht falsch, aber unvollständig (R-23). |
| 7 | AC „8 bis 9 Prozent darunter und 2,7 Prozent über unserer Nettonennleistung"; Wind 0,12 %; DC 0,01 bis 0,04 % (Z. 86) | Nachtrag Abschn. 4: AC −8,25 bis −9,07 %; netto +2,71 bis +2,75 %; Wind +0,12 %; DC −0,01 bis −0,04 % | bestätigt | „2,7" ist knapp (2,71 bis 2,75, also bis 2,8). „darunter" bezieht sich nicht erkennbar auf die Bruttoleistung; Nachtrag sagt „ohne sie zu treffen" und „Muster in den Zahlen, keine dokumentierte Definition", beides fehlt (R-23). |
| 8 | „Wir enden ... im Juli 2026, weil die letzten drei Monate noch nicht vollständig gemeldet sind" (Z. 29) | SAP 2.1 („T = drei Kalendermonate vor dem Exportmonat ... der Monat ist damit stets vollständig"), SAP 3.5 Nr. 1 („Einheiten werden teils nachträglich registriert. Die jüngsten Monate sind ... systematisch unterzählt ... Auch die Monate bis T können noch unterzählt sein") | **Abweichung** (niedrig) | Regel und Grund stimmen. Aber: SAP sagt „teils", der Artikel „oft"; der Artikel behauptet als Befund („sind noch nicht vollständig gemeldet"), was eine vorab gesetzte Vorsichtsregel ist (nicht gemessen); die Einschränkung „auch Juli kann noch unterzählt sein" steht erst in Z. 80 (R-17). |
| 9 | „bei Windenergie an Land sind beide Werte gleich" (Z. 27) | Bericht Abschn. 6 (S6): Brutto und Netto in den Daten identisch; Validierungsbericht Nachrechnung Nr. 2 („Wind Brutto gleich Netto bestätigt") | bestätigt | Gilt für die Einheitendaten. Der Nachtrag (Abschn. 4) hat die Identität „nicht weiter untersucht". Unkritisch. |
| 10 | „Das Ziel 2030 liegt in allen drei Fenstern oberhalb des 95-Prozent-Prognoseintervalls, bei Wind an Land und bei Solar. Die Gerade käme Ende 2030 also nach dieser Rechnung nicht bis ans Ziel heran." (Z. 43) | Bericht Abschn. 3 (6 von 6 oberhalb, Werte 31.12.2030: 91,2 / 89,3 / 82,1 und 203,8 / 203,8 / 189,7); `voll`: `kat2030` | bestätigt | Formulierung wie SAP 12. „Nicht bis ans Ziel heran" folgt aus dem Intervall (Ziel liegt über der Obergrenze, also über der Geraden) und deckt sich mit den Berichtswerten. Die Werte selbst fehlen im Text (R-22). Gilt für Solar brutto; Solar netto steht nur im Nachtrag (178,9 / 178,9 / 167,1, ebenfalls unter 215). Aussage stützt sich bei F24/F60 auf zu enge Intervalle; der Vorbehalt folgt im nächsten Satz. |
| 11 | Erklärung des Intervalls: „Zu jeder Fortschreibung gehört ein 95-Prozent-Prognoseintervall. Es zeigt, in welchem Bereich der Wert Ende 2030 bei dieser Geraden liegen würde. Das Intervall deckt nur die Streuung der Monatswerte um die Gerade ab. Ob der Zubau konstant bleibt, ist darin nicht enthalten." (Z. 35) | Bericht Abschn. 3 und 8 Nr. 1 („Das Intervall deckt nur die Streuung um die Gerade ab, nicht die Annahme konstanten Zubaus", „punktweise"); SAP 2.3 (klassische OLS, neue Beobachtung) | teilweise | Der Kern stimmt mit dem Bericht. Unscharf: „der Wert ... bei dieser Geraden" lässt offen, dass es um den Monatswert geht; „95 Prozent" wird nicht erklärt; „nur die Streuung um die Gerade" lässt aus, dass klassische Intervalle auch die Unsicherheit der Steigung enthalten, und dass sie Unabhängigkeit der Abweichungen voraussetzen (steht erst Z. 78) (R-22). |
| 12 | Zielstichtag: „31. Dezember des Zieljahres ... Annahme unseres Analyseplans, das Gesetz nennt keinen Tag." (Z. 19) | § 4 EEG (30.10.2026 erneut geöffnet): „69 Gigawatt im Jahr 2024", „im Jahr 2026", „im Jahr 2030"; SAP 2.1 und 2.2 (K2, Entscheidung Daniel Saure) | bestätigt | „Annahme unseres Analyseplans" ist korrekt (Setzung, von Daniel Saure am 29.10.2026 übernommen). |
| 13 | „Die Gegenprobe haben wir nach der unabhängigen Prüfung nachgeholt, sie ist daher nicht Teil dieser Prüfung." (Z. 88) | Nachtrag Kopf („Post-hoc, nach Validierung"), Validierungsbericht (kein Hinweis auf Nachtrag) | bestätigt | Vgl. Zeile 1 dieser Tabelle zur Mehrdeutigkeit von „Gegenprobe". |
| 14 | Durbin-Watson „zwischen 0,02 und 0,47 (bei Solar mit 24 Monaten bei 1,09)" (Z. 78) | Bericht Abschn. 7: Wind F24 0,47, F60 0,04; Solar F24 1,09, F60 0,02 | bestätigt | |
| 15 | „Auch die Zusatzrechnungen mit robusteren Verfahren beheben das nicht." (Z. 78) | Bericht Abschn. 3 und 6 (S5): „nicht als ‚robust' zu lesen (Auflage H-1)"; Validierungsbericht H-1 (b) | **Abweichung** (niedrig) | In der Sache stimmt es (S5 behebt das Problem nicht). Das Wort „robusteren" ist aber genau das Etikett, das der Bericht auf Auflage der Prüfung vermeidet. Besser „Zusatzrechnungen mit Newey-West-Standardfehlern und Block-Bootstrap" (R-18). |
| 16 | Wind auf See: „Die Intervalle sind auch hier zu eng." (Z. 70) | Bericht Abschn. 5 und 7: DW 0,81 / 0,13 / 0,11 | **Abweichung** (niedrig) | Der Bericht sagt „zu eng" nur für Wind an Land und Solar (F24, F60). Für E5 steht keine Aussage; DW-Werte stützen sie, aber es ist eine neue Folgerung aus Diagnosewerten (R-20). Außerdem je Fenster Jahre statt Spanne. |
| 17 | Testlauf: „Nach der Angabe des Auswertenden wurden nach Sichtung der Zwischenergebnisse nur Darstellung und Beschriftungen geändert. Das lässt sich nicht nachprüfen." (Z. 94) | Bericht Abschn. 8 Nr. 10b: „Darstellung, Logtexte, Beschriftungen und `unname`-Aufrufe", „nicht verifizierbar" | teilweise | „nur Darstellung und Beschriftungen" ist enger als der Bericht (R-4). „nach Sichtung der Zwischenergebnisse" jetzt korrekt. |
| 18 | Quelle [5]: „Analyseplan v1.0, Analysebericht, Abweichungsprotokoll, Validierungsbericht und Nachtrag Zweitquelle" im GitHub-Ordner (Z. 102) | GitHub-Verzeichnisliste (30.10.2026, erneut geöffnet): SAP, Analysebericht, Abweichungsprotokoll, Validierungsbericht, Skript, Log, `output`, `rohdaten`; **kein** Nachtrag, **keine** Freigabe-Datei | **Abweichung** (hoch) | Hinweis der Seite: „View all files", Liste kann unvollständig sein; Nachtrag nicht sichtbar. Der Ordner enthält möglicherweise auch ältere Stände der Berichte (nicht verglichen). (R-1) |
| 19 | Zahlen im Kopf der Ergebnisse (Z. 11 bis 14) | s. 4.4 und Tabelle 1, Zeilen 6 bis 14 oben | bestätigt | 70,4 / 128,1 / 113,5 GW; 63,5 / 100,8 / 90,1; Abstände −5,5 / +12,8 / +2,1; 2036 bis 2041; 2031 bis 2032 brutto; 2033 bis 2034 netto; R 10,1 / 19,7 / 23,0; Steigungen 3,0 bis 4,7 und 14,8 bis 17,2. |
| 20 | Tabelle „Nötig pro Jahr" (Z. 57 bis 60): Steigung 4,7 / 4,3 / 3,0 und 17,2 / 17,2 / 14,8; Anteil 46 / 43 / 30 % und 87 / 87 / 75 % | `voll`: `b_GW_jahr`; `anteil_sW_an_R` 0,4647 / 0,4275 / 0,2969; 0,8747 / 0,8749 / 0,7515 | bestätigt | Prozentform des Berichtsverhältnisses; rechnerisch nur ×100. Solar-Zeile nur brutto. |
| 21 | Gegenprobe: „Bei Windenergie an Land weicht sie um 0,12 Prozent ab, bei Solar in der Gleichstromleistung um 0,01 bis 0,04 Prozent" (Z. 86) | Nachtrag Abschn. 4 | bestätigt | Bezugsgröße (MaStR brutto) nicht genannt. |
| 22 | „Die Abweichungen sind so klein, dass beide Reihen vermutlich auf demselben Register beruhen. Belegt haben wir das nicht." (Z. 88) | Nachtrag Abschn. 3 („Indiz, kein Beleg") | bestätigt | Doppelte Abschwächung „wohl ... vermutlich" bleibt (Stil, 4.6). |
| 23 | Wind auf See „rund 10,9 GW", 2036, 2051, „bis 2060 nicht erreicht" (Z. 70) | `tabelle3_E5` (05/2036, 03/2051, F60 „nicht bis 2060 erreicht") | bestätigt | |
| 24 | „rund 1.100 Windeinheiten und rund 143.000 Solareinheiten ... In Betrieb" (Z. 80); „17 Festlegungen ... neun Hinweise" (Z. 92) | Bericht Abschn. 8 Nr. 3; Abweichungsprotokoll | bestätigt | „neun Hinweise zum Datenformat" bleibt unscharf (R-16). |
| 25 | „Bei EEG-Anlagen nennt das Register die Nettonennleistung ‚installierte Leistung'." (Z. 27) | SAP 3.3 (Feld `InstallierteLeistung`, „Installierte Nettonennleistung der EEG-Anlage", `AnlagenEegWind/Solar`) | bestätigt | Stammt aus der Felddokumentation (Anlagenebene, diese Dateien lagen nicht vor); „das Register nennt" ist damit etwas weit gefasst (R-3). |
| 26 | „Bei Windenergie ... gehen 15 bis 17 Prozent des Brutto-Zubaus durch Stilllegungen wieder verloren, bei Solar weniger als ein Prozent" (Z. 64) | Bericht Abschn. 3 E4 (15,3 bis 16,8 %; 0,5 bis 0,9 %) | bestätigt | „wieder verloren" ist leicht deutend, der Bericht sagt „Anteil der Stilllegungen am Brutto-Zubau". Unkritisch. |
| 27 | „Der tatsächliche Netto-Zubau" (Z. 62) | Stilregel v0.3, Nr. 5 | Hinweis | „tatsächlich" als Füllwort (R-22 nicht berührt, Stil). |

Ergebnis der Prüfung der von Ihnen genannten Punkte:
- „23,0 GW (netto, Gegenprobe)": Zahl korrekt, Herkunft nur Nachtrag (nicht validiert, nicht im Repo), Etikett „Gegenprobe" doppelt belegt (R-7).
- „17,9 / 17,3 / 14,0": korrekt, Begriff „Netto-Zubau" kollidiert mit „Solar, netto" (R-8).
- „70 bis 72 GW" und E1b-Solar-Satz: korrekt.
- „rund fünf Monate früher": rechnerisch korrekt, aber neue Differenz und Monatsangabe (R-9).
- „Wir enden ... im Juli 2026": Regel und Grund durch SAP gedeckt, Formulierung „oft/noch nicht vollständig gemeldet" stärker als SAP (R-17).
- „bei Windenergie an Land sind beide Werte gleich": korrekt.
- „oberhalb des 95-Prozent-Prognoseintervalls ... nicht bis ans Ziel heran": korrekt; Werte fehlen (R-22).
- Erklärung des Intervalls: im Kern korrekt, unscharf (R-22).
- Zielstichtag-Annahme: korrekt und als Setzung ausgewiesen.

## 4.4 Neue Aussagen ohne Beleg oder als neue Folgerung

Eine neue Berechnung oder Inferenz im engeren Sinn (Stufe Einordnung) liegt **nicht** vor. Abgeleitete Aussagen, die so nicht in Bericht oder Nachtrag stehen:
1. „rund fünf Monate früher" (Z. 86): Differenz zweier Nachtrags-Monatswerte (R-9).
2. „Die Intervalle sind auch hier zu eng" bei Wind auf See (Z. 70): Folgerung aus den DW-Werten (R-20).
3. Prozentform „Anteil des Nötigen" (Z. 57 bis 60): trivial aus dem Berichtsverhältnis, Wert gleich.
4. „am stärksten bei Windenergie an Land" (Z. 43): Vergleich der im Bericht stehenden Spannen, zahlenmäßig gedeckt.

## 4.5 Restbestand (Schweregrad, Fundstelle, Korrekturvorschlag)

### Hoch

**R-1 (aus H-5) Quelle [5] nennt einen Nachtrag, der im Repo nicht zu sehen ist (Z. 102, Z. 88 bis 92).**
Das GitHub-Verzeichnis (30.10.2026) zeigt weder `Nachtrag_Zweitquelle_...md` noch `Freigabe_Ergebnisse_...md`. Leser können die Gegenprobe nicht nachprüfen. Dies ist eine Handlung vor Veröffentlichung, kein Textfehler.
*Vorschlag:* Nachtrag (und Freigabe-Datei, falls öffentlich gewollt) committen und pushen, danach den Link in [5] öffnen und das Verzeichnis gegenlesen. Sonst „und Nachtrag Zweitquelle" aus [5] streichen und im Text sagen, dass die Gegenprobe nicht öffentlich einsehbar ist.

### Mittel

**R-2 (aus H-3) Solar brutto/netto nicht überall nebeneinander (Z. 43, 51, 57 bis 60, 66).**
Tabelle Z. 57 bis 60 hat nur „Solar, brutto". Die Netto-Steigungen (14,85 / 14,84 / 12,83) und der Anteil stehen nur im Nachtrag. Z. 43 („bei Solar") und Z. 66 („Bei Solar liegt das Ziel ...") nennen die Größe nicht. Grafik 2 zeigt nur Brutto.
*Vorschlag:* In Z. 43 „bei Solar (brutto und netto)" schreiben (netto: Ziel oberhalb des Intervalls laut Nachtrag, nur mit Quellenhinweis) oder „bei Solar in der Bruttoleistung" einfügen. Z. 66 „Bei Solar (brutto) ...". Grafik 2: Hinweis „nur Bruttoleistung" ins Bild.

**R-3 (aus M-2) Z. 27.**
„Die Felddokumentation des Registers erklärt den Unterschied nicht" ist enger gemeint (Datenexport, SAP 3.3 nennt eine externe Hilfeseite, die nicht geprüft wurde). „konnten wir nicht klären" legt nahe, es wurde versucht und gescheitert, der Bericht sagt „ungeprüft".
*Vorschlag:* „Die Felddokumentation des Datenexports erklärt den Unterschied nicht. Eine weitere Hilfeseite des Registers haben wir nicht geprüft. ... Welche Größe näher am Begriff im Gesetz liegt, haben wir nicht geprüft."

**R-4 (aus M-4) Z. 94 (und Z. 92).**
„nur Darstellung und Beschriftungen" lässt „Logtexte, unname-Aufrufe" aus; fehlt: kein Commit vor dem Testlauf, Endlauf überschrieb Log und Outputs. Der „Auswertende" und „die Prüfung" werden nicht als KI-Subagenten gekennzeichnet; das ist eine Entscheidung für Daniel Saure.
*Vorschlag:* „Nach der Angabe des Auswertenden wurden danach nur Darstellung, Logtexte und Beschriftungen geändert. Das lässt sich nicht nachprüfen, weil Skript und Log des Testlaufs überschrieben sind." Entscheidung zur KI-Offenlegung vermerken (öffentlich nennen oder bewusst offen lassen).

**R-5 (aus M-5) Z. 86 bis 88.**
Lücken der Zweitquelle bleiben unbenannt.
*Vorschlag:* Ein Satz: „Energy-Charts ist die einzige Zweitquelle, die wir abgefragt haben; die Statistik der Bundesnetzagentur haben wir nicht verglichen. Dass die Gleichstromleistung der Modulleistung entspricht, haben wir nicht im Original geprüft."

**R-6 (aus M-10) Grafiken (Dateien) und Unterschrift Z. 47.**
Grafikdateien unverändert („Paragraf 4 EEG", „Verlaengerung", „Prognoseband", „T_S1"). Unterschrift Z. 47 enthält einen Prüfvermerk für die Redaktion, der in der Veröffentlichung nicht stehen darf.
*Vorschlag:* Grafiken neu erzeugen („§ 4 EEG", Umlaute, „Fortschreibungsband", Legende ohne „T_S1"), Prüfsatz aus Z. 47 streichen, Hinweis „Bänder bei 24 und 60 Monaten zu eng".

**R-7 (neu) „Gegenprobe" doppelt belegt, Herkunft der 23,0 GW (Z. 14, 27, 55, 84 bis 88).**
„Gegenprobe" steht für die Netto-Rechnung (Z. 27, 55) und für Energy-Charts (Überschrift Z. 84). Z. 88 „nach der unabhängigen Prüfung nachgeholt, daher nicht Teil dieser Prüfung" gilt nur für Energy-Charts und für R netto (23,0), nicht für die validierte Netto-Rechnung S6 (Erreichungsjahre 2033 bis 2034).
*Vorschlag:* Netto-Rechnung „Nettonennleistung (Variante)" nennen, Abschnitt Z. 84 „Zweite Quelle" betiteln. Bei „23,0 GW (netto)" in Z. 14 und 55 Quelle und Status sagen, zum Beispiel „23,0 GW (netto; Nachtrag nach der Prüfung, nicht unabhängig geprüft)".

**R-8 (neu) „Netto" in zwei Bedeutungen (Z. 14, 55 bis 62).**
SAP Abschn. 1 trennt „Netto-Zubau" (Zubau minus Stilllegungen, Bilanzgröße) strikt von „Nettonennleistung" (MaStR-Feld) und verlangt das auch im Bericht. v2 benutzt „Netto-Zubau" (Z. 62: 17,9 / 17,3 / 14,0, in Bruttoleistung) und „Solar, netto" (Nettonennleistung, Z. 41, 60) nebeneinander. Leser verstehen den Netto-Zubau als Zubau der Nettonennleistung, das ist falsch.
*Vorschlag:* „Zubau nach Abzug der Stilllegungen (in Bruttoleistung)" statt „Netto-Zubau"; Tabellenzeilen „Solar (Bruttoleistung)" und „Solar (Nettonennleistung)".

**R-9 (neu) „rund fünf Monate früher" (Z. 86).**
Neue Differenz, Monatsgenauigkeit trotz Auflage 3, nur aus dem nicht validierten Nachtrag. Außerdem sagt „Bei der Bruttoleistung stimmen die Zeitpunkte überein" nichts über Wind (dort in einem Fall um einen Monat versetzt).
*Vorschlag:* „Die Erreichungsjahre sind in beiden Quellen gleich (Brutto und Gleichstrom 2031 bis 2032, Netto und Wechselstrom 2033 bis 2034)." Monatsdifferenz streichen. Zum Wind den Nachtragsbefund „gleicher Monat in 5 von 6 Fällen, sonst ±1 Monat" übernehmen.

### Niedrig

- **R-10 (aus M-1) Z. 7, 11:** „wo der Bestand steht", „standen im Register" bei rekonstruiertem Bestand. *Vorschlag:* „wo der Bestand Ende Juli 2026 stand (aus dem Registerstand vom 29.10.2026 rekonstruiert)".
- **R-11 (aus M-9) Z. 70:** „bis 2060" ohne Erklärung. *Vorschlag:* „(weiter als bis 2060 haben wir nicht gerechnet)".
- **R-12 (aus N-1) Z. 5, 7:** „Zubau der letzten Monate" bei Fenstern bis 60 Monate. *Vorschlag:* „der letzten ein bis fünf Jahre".
- **R-13 (aus N-3) Z. 94:** „Solar näher am Pfad" statt „näher am Pfad als Wind"; Quelle (pv magazine, Februar 2026) fehlt.
- **R-14 (aus N-4) Z. 80:** Richtung der Unsicherheit fehlt (fehlende Stilllegungsmeldungen überzeichnen den Netto-Zubau tendenziell, Nachmeldungen können die jüngsten Monate unterzählen). *Vorschlag:* Ein Satz nach Bericht Abschn. 3 und 8.
- **R-15 (aus N-5) Quelle [3]:** Lizenzname nicht in der offiziellen Form; Bearbeitungsvermerk nicht geprüft. *Vorschlag:* „Datenlizenz Deutschland – Namensnennung – Version 2.0", Hinweis „Daten rekonstruiert und fortgeschrieben".
- **R-16 (aus N-6) Z. 92:** „zum Datenformat" -> „zu Daten und Dokumentation".
- **R-17 (neu) Z. 29:** „oft nachträglich eingetragen" (SAP: „teils") und „sind noch nicht vollständig gemeldet" als Befund. *Vorschlag:* „Wir enden im Juli 2026, weil Anlagen teils nachträglich eingetragen werden und die jüngsten Monate dadurch zu niedrig ausfallen können. Auch Juli kann noch nicht ganz vollständig sein."
- **R-18 (neu) Z. 78:** „robusteren Verfahren". *Vorschlag:* „Zusatzrechnungen mit Newey-West-Standardfehlern und Block-Bootstrap".
- **R-19 (neu) Z. 14:** „Die Fenster zeigen bei Wind 3,0 bis 4,7 GW pro Jahr und bei Solar 14,8 bis 17,2 GW (brutto)." Das ist die Steigung der Geraden, im Satz nicht benannt (Netto-Zubau Solar wäre 14,0 bis 17,9). *Vorschlag:* „Die Geraden der Fenster steigen bei Wind um 3,0 bis 4,7 GW pro Jahr, bei Solar (brutto) um 14,8 bis 17,2 GW."
- **R-20 (neu) Z. 70:** „Die Intervalle sind auch hier zu eng": nicht im Bericht (Folgerung aus DW 0,81 / 0,13 / 0,11); Jahre je Fenster. *Vorschlag:* „Die Durbin-Watson-Werte sind auch hier niedrig (0,11 bis 0,81), die Intervalle dürften zu eng sein." oder streichen; Jahre als Spanne oder mit Hinweis „je Fenster, nicht belastbar".
- **R-21 (neu) Z. 66:** Solar 2026 ohne Größe und Werte; „Ende 2026" sieht aus wie Gesetzestext, ist aber der Stichtag unseres Plans (Gesetz: „im Jahr 2026"). *Vorschlag:* „Die Fortschreibung ergibt für Solar (brutto) 130,5 bis 135,0 GW, das Ziel (128 GW) liegt in zwei Fenstern unterhalb und in einem innerhalb des Intervalls." Werte aus Bericht Abschn. 4.
- **R-22 (neu) Z. 35, 43:** Intervall-Erklärung unscharf („95 Prozent" unerklärt, Monatswert, Unabhängigkeit der Abweichungen), Werte der Geraden am 31.12.2030 fehlen. *Vorschlag:* „Das 95-Prozent-Prognoseintervall gibt an, in welchem Bereich ein einzelner Monatswert Ende 2030 bei dieser Geraden läge, wenn die Abweichungen um die Gerade zufällig streuen." Dazu Werte 91,2 / 89,3 / 82,1 GW (Wind) und 203,8 / 203,8 / 189,7 GW (Solar brutto) aus Bericht Abschn. 3.
- **R-23 (neu) Z. 86:** „darunter" ohne Bezugsgröße; „2,7 Prozent" statt „2,7 bis 2,8"; Nachtragsvorbehalt („ohne sie zu treffen", „Muster in den Zahlen, keine dokumentierte Definition") fehlt. *Vorschlag:* „Die Wechselstromleistung liegt 8 bis 9 Prozent unter unserer Bruttoleistung und etwa 3 Prozent über unserer Nettonennleistung. Ob das den Definitionen entspricht, haben wir nicht belegt."
- **R-24 (neu) Z. 27:** siehe R-3 („konnten wir nicht klären" -> „haben wir nicht geprüft"). Mit R-3 zusammen zu beheben; hier nur als eigener Zähler geführt.

Zählung: hoch 1 (R-1), mittel 8 (R-2 bis R-9), niedrig 15 (R-10 bis R-24).

## 4.6 Stilregeln v0.3

Punkte aus v1 erledigt: „Zur Offenheit gehört" gestrichen (Regel 6/10), „Nettoleistung" vereinheitlicht, kein Gedankenstrich, keine fetten Schlagwortköpfe, keine Modewörter („entscheidend", „im Kern", „zentral").

Weiter offen oder neu:
- **Gegensatzformeln (Regel 1):** „keine Prognose" (Z. 33 in beiden Unterschriften Z. 47 und 51, Z. 74), „keine Bewertung von Politik" (Z. 74), „keine Stromerzeugung und kein Anteil am Strommix" (Z. 76), „keine unabhängige Bestätigung" (Z. 88), „nicht als Vorhersage" (Z. 15). Pflichtvorbehalte aus dem Bericht, die bleiben; verteilen oder positiv fassen.
- **Doppelpunkt als Stilmittel (Regel 3):** „... hängt vom Fenster ab, am stärksten bei Windenergie an Land: Im 12-Monats-Fenster ..." (Z. 43); „nicht erreicht: 63,5 GW" (Z. 12).
- **Gleichförmiger Satzanfang „Wir ..." (Regel 7):** Z. 7, 19, 27, 29, 33, 43, 86, 88, 94.
- **Fachwörter (Regel 2):** Durbin-Watson nur als „Maß dafür" erklärt, die Bedeutung der Werte fehlt; Gleichstrom-/Wechselstromleistung unerklärt; Bruttoleistung/Nettonennleistung nur über den Prozentunterschied beschrieben; „95-Prozent" unerklärt.
- **Füllwort „tatsächlich" (Regel 5):** „Der tatsächliche Netto-Zubau" (Z. 62); „tatsächlich" streichen.
- **Doppelte Abschwächung** „wohl ... vermutlich" (Z. 88) bleibt. *Vorschlag:* „Das ist vermutlich keine unabhängige Bestätigung."
- **Behördenwörter (Regel 4):** „Auswertende" (Z. 94) statt „der Analyst"/„wer die Auswertung gemacht hat" (siehe R-4).
- **Struktur (Regel 5):** Zwischenziel 2026 (Z. 66) steht ohne Überschrift im Abschnitt „Wie viel mehr Zubau nötig".
- **Meta-Text:** Z. 47 (Prüfvermerk, R-6); Z. 1 Kopf „Nachprüfung steht aus" ist Entwurfskopf und bei Veröffentlichung zu entfernen. Die Reihenzeile (Z. 3) trägt keine Nummer „#n" (nicht prüfbar, Skill/CLAUDE.md fordert „Evidenzcheck #n").

## 4.7 Freigabeauflagen (Stand v2)

| Auflage | Stand in v2 | Ergebnis |
|---|---|---|
| 1 Zweitquelle genannt oder Abgleich nachgeholt | Energy-Charts-Abgleich nachgeholt, Unabhängigkeitsvorbehalt, Lizenz offen, „nicht Teil dieser Prüfung" (Z. 84 bis 88) | **erfüllt** im Text; Lücken R-5, R-1, R-7 |
| 2 Solar brutto und netto nebeneinander | Z. 11 bis 14, Tabellen Z. 21 bis 25 und 37 bis 41, Z. 55 | **teilweise** (R-2): Tabelle Z. 57 bis 60, Z. 43, Z. 66 und Grafik 2 nur brutto bzw. ohne Größe |
| 3 Zeitpunkte nur als Spanne; zu enge Intervalle | Tabelle als Spanne (Z. 37 bis 41), „zu eng" in Z. 15, 43, 70, 78, Intervall-Erklärung Z. 35 | **erfüllt** für Hauptergebnisse; Reste R-9 (fünf Monate), R-20 (Wind auf See), R-6 (Bänder in Grafiken ohne Hinweis) |
| 4 Testlauf: Version nicht erhalten | Z. 94 ergänzt um „nach Sichtung der Zwischenergebnisse", „nicht nachprüfen" | **teilweise** (R-4) |

## 4.8 Fazit und nächster Schritt

Der Entwurf v2 ist inhaltlich korrekt und deutlich vorsichtiger als v1. Alle geprüften Zahlen stimmen, es gibt keine falsche Zahl und keine neue Methode. Veröffentlichungsreif ist er noch nicht, weil (a) der Nachtrag im Repo fehlt, auf den [5] verweist (R-1), (b) Solar brutto/netto in einer Tabelle, in Z. 43/66 und in Grafik 2 noch einseitig ist (R-2), (c) die Grafiken unverändert und der Prüfvermerk in Z. 47 noch im Text steht (R-6), (d) die Begriffe „Netto" und „Gegenprobe" doppelt belegt sind und dadurch ein Fehllesen möglich ist (R-7, R-8) und (e) „rund fünf Monate" aus dem unvalidierten Nachtrag gegen die Auflage „nur als Spanne" läuft (R-9).

**Gesamturteil: Abweichungen. 0 kritisch, 1 hoch, 8 mittel, 15 niedrig.** Empfehlung: v3 mit R-1 bis R-9 (mindestens), danach fokussierte Nachprüfung 2. Dieses Dokument enthält keinen Freigabevermerk. Die Freigabe liegt bei Daniel Saure nach Volltextlektüre.

**Nicht geprüft in Nachprüfung 1:** Pixelwerte der Grafiken (nur Sichtprüfung, unverändert gegenüber v1); Lizenztext dl-de/by-2-0; Inhalt des GitHub-Ordners über die erste Listenseite hinaus; ob KI-Einsatz öffentlich offengelegt ist; Skill-Vorgaben „Evidenzcheck #n". Die Nachtragszahlen (Energy-Charts) habe ich nur an Rohwerten gegen die API geprüft (siehe Abschnitt 4 oben), nicht die Fortschreibungen auf der Energy-Charts-Reihe.
