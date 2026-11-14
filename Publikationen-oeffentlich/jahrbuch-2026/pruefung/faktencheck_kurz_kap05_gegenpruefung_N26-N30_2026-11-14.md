# Gegenprüfung Kurzfassung Kapitel 5 (Sommer): Auflagen N26–N30, Fall „Vergleichszahl 2018“, Kopfvermerk

**Geprüft:** `kurz/04-sommer.md` (Kapitel 5, Kopfvermerk v0.2, 13.11.2026), Grafiken `grafiken/kap01_grafik1_sommertemperatur.png` und `kap01_grafik2_todesfaelle_hitze.png` (als Bild gelesen), `kurz/07-korrekturen.md` (Kapitel 10, Fall 4), `Analysen/2026-08-hitzesommer-2026/run_log.txt` (Zeilen 1–400, Schritt 5c) und `SAP_hitzesommer-2026.md` (Kopf, Zeilen 1–40 und 300–380).
**Maßstab für die Auflagen:** Original in `pruefung/faktencheck_kap01.md`, Nachtrag 5, Abschnitt N5.6 (N26–N30) und N5.8; Vorprüfung `pruefung/faktencheck_kurz_kap04.md`.
**Prüfdatum:** 14.11.2026 · **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). Kapitel-Dateien nicht verändert. Diese Datei enthält keinen Freigabevermerk.

## Gesamturteil: ok mit Auflagen

Befunde: **kritisch 0 · hoch 0 · mittel 2 · gering 5 (gesamt 7)**.
N26, N27, N28 sind im Kurztext und in Grafik 2 im Kern umgesetzt (zwei Restpunkte, gering). N29 und N30 sind entfallen (bestätigt). Der Fall „Vergleichszahl 2018“ ist in Zahlen und Datum konsistent mit Kapitel 10 Fall 4 und dem Laufprotokoll; die Bewertung weicht aber in einem Wort ab (mittel). Der Kopfvermerk ist an zwei Stellen veraltet bzw. unvollständig (mittel).

## 1. Auflagen N26–N30

| Auflage (Original) | Soll | Befund in Kurztext / Grafik | Ergebnis |
|---|---|---|---|
| N26 (mittel), Grafik 2: Linienbeschriftung | „Obergrenze eines normalen Jahres“ ersetzen, „Prognoseintervall“ nennen | PNG: „Gestrichelt: Obergrenze des 95-%-Prognoseintervalls für ein normales Jahr, rund 8.700“ (angesehen). Alt-Text (Z. 41) und Bildunterschrift (Z. 43: „keinen Höchstwert“) angepasst. Das Wort „normal“ steht noch in der Grafik (Original-Vorschlag: nur im Text). | bestätigt (Kern), siehe B1 |
| N26, Text: Reihenfolge | Erst Linie erklären, dann 1994/2003; „kein Höchstwert“ | Z. 45: erst „bis zu etwa 8.700 … So weit reicht das 95-Prozent-Prognoseintervall nach oben“, dann 1994/2003 mit 10.200 „über der Linie“, „höchste Jahreswerte der Reihe 1992–2025“. „Auch“ ist entfallen (K4-10 erledigt). „kein Höchstwert“ steht nur in der Bildunterschrift, nicht im Fließtext. | bestätigt, mit Hinweis (B1) |
| N27 (gering), Deutung „passt zur Rechtsschiefe“ | beschreibend ersetzen; „höher als Schätzwerte und obere Grenzen“ | Z. 45: „höchsten Jahreswerte der Reihe“; „Schon das untere Ende (14.400) liegt höher als die Schätzwerte dieser beiden Jahre und als deren obere Intervallgrenzen (11.400 und 11.600)“. Rechtsschiefe in Z. 47 als eigener Satz wieder aufgenommen (K4-1 erledigt). Zahlen gegen Nachtrag 5 (CSV-Werte 10.200, 11.400, 11.600) identisch. | bestätigt |
| N28 (gering), 2026/2025 als vorläufig | Beschriftung am 2026-Punkt; 2025-Beschriftung am Punkt/Legende; Bildunterschrift-Satz | PNG: „2026: 16.000 (vorläufig, KW 15–37; Spanne 14.400–17.600)“ vorhanden. Bildunterschrift Z. 43: „1992 bis 2024 sind Saisonschätzungen, 2025 und 2026 sind vorläufig (unvollständige Saison)“ vorhanden. „2025 vorläufig (KW 15–38)“ steht weiter unter der Achse, getrennt vom offenen Kreis, der Kreis ist in der Legende nicht erklärt. | bestätigt (2026, Bildunterschrift); 2025-Teil nur teilweise, siehe B2 |
| N29 (gering), Titel Grafik 3 „sinkt“ | Titel ändern | Grafik 3 ist in der Kurzfassung nicht enthalten (nur zwei Bilder, Z. 31 und 41). Die Medienzahlen stehen als Tabelle (Z. 63–68), kein „sinkt“ im Text. | bestätigt (entfallen) |
| N30 (gering), WWA-Zeitraum/Region | Zeitraum und Region präzisieren | WWA-Absatz und Quelle [9] fehlen im Kurztext (Quellen [1]–[8]); kein Verweis auf WWA. | bestätigt (entfallen) |

Grafik 1 (angesehen): Titel, Untertitel, 2026 „19,6 °C“, 2003 als einziger höherer Wert, Normalwerte 16,3 und 17,6, Raute Trendwert 18,5, Quellenzeile mit Stand 02.09.2026 und „Werte 2025 und 2026 vorläufig“ stimmen mit Tabelle und Text (Z. 15–21, 33) überein. Die frühere Gestaltungsempfehlung E17 (leere rechte Fläche) ist umgesetzt; N26–N30 betrafen Grafik 1 nicht.
Grenze dieser Prüfung: Ich habe die Grafikwerte nicht erneut gegen die CSV-Dateien oder die RKI/DWD-Quellen gelesen und das R-Skript nicht ausgeführt (R nicht verfügbar). Es ist nur nachgewiesen, dass Bildbeschriftungen und sichtbare Werte zu den Zahlen im Kurztext und in Nachtrag 5 passen.

## 2. „Viertens“ / Fall „Vergleichszahl 2018“ gegen Kapitel 10 Fall 4 und Analysen

| Punkt | Kap. 5 (Z. 53) | Kap. 10 Fall 4 | Laufprotokoll / SAP | Ergebnis |
|---|---|---|---|---|
| 9.400 als Zahl im Analyseplan für 2018 | „In unserem Analyseplan stand für 2018 als Kontext die Zahl 9.400“ | „Der Analyseplan nennt sie“ | SAP v1.1 (28.08.2026) hat laut Versionshistorie einen Hinweis zu einer bekannten 2018-Abweichung; Log Schritt 5c: „im SAP (Abschnitt 8.1) als Kontext genannte … ‚aktuell ~9.400‘“. SAP 8.1 selbst nicht gelesen. | bestätigt |
| 8.500 aus EB 19/2025 | ja | ja | Log: EB-19-2025 2018 = 8.500 [7.100; 10.100] (Vorgänger 8.300, 8.400) | bestätigt |
| Drei RKI-Ausgaben 2022, 2023, 2025, 9.400 nicht bestätigt | ja | ja | Log: EB-42-2022, EB-26-2023, EB-19-2025 | bestätigt |
| Mögliche Herkunft: Bulletin 42/2022, obere Grenze 2019 | ja, „nicht abschließend geklärt“ | ja, „Vermutung“ | Log: „2019 6.900 [4.000; 9.400]“ in EB-42-2022, ausdrücklich unbestätigte Vermutung | bestätigt |
| Datum Laufprotokoll | nicht genannt | „29. August (Schritt 5c)“, Artikel am selben Tag | Skriptlauf 2026-08-29 12:50:47 | Datum bestätigt; Uhrzeit des Artikels nicht prüfbar (in Kap. 10 als Platzhalter markiert) |
| Frühere Erklärung „Verwechslung in einer Sekundärquelle“ | „nicht belegt“ | „nicht belegt“, danach aber „Falsch ist nur die Erklärung …“ | Log: nur „unbestätigte, wenn auch begründete Vermutung“ | **Abweichung in der Bewertung, siehe B3** |
| „Kursierte vor der Veröffentlichung“ | „stand in unserem Analyseplan“ | „Vor der Veröffentlichung kursierte … eine Vergleichszahl“ | Zahl stammt aus dem eigenen SAP | Kap. 10 unpräziser, siehe B6 |
| Querverweis | „mehr dazu in Kapitel 10“ | „ebenso in Kapitel 5“ | – | konsistent |

Zahlen und Daten widersprechen sich nirgends. Die Suche nach „Vergleichszahl“, „9.400“ und „8.500“ in `Analysen/` konnte ich ohne Suchwerkzeug nur über Lektüre von run_log.txt (Zeilen 1–400) und Teilen des SAP durchführen; weitere Dateien in `Analysen/` (z. B. Validierungsbericht, Analysebericht) wurden hier nicht durchsucht.

## 3. Kopfvermerk (Z. 1) von 04-sommer.md

Vollständig und korrekt benannt (gegen Nachtrag 5, N5.8, und Vorprüfung K4-5): Datenstände zum Stichtag 15.11.; Beschriftungsänderungen der Grafiken 1 und 2 nach Freigabe (26.10.); Treibhauspost #125 (Quelle [7]) am Original durch Daniel Saure als Datei; erneute Prüfung der Grafiken und einmaliger Lauf des R-Skripts; RKI-Zahl 2026 und DWD-Wert vorläufig; Freigabe und Faktencheck nötig; Hinweis „nicht erneut geprüft“ zu den mittleren Hinweisen aus v0.2.

Nicht korrekt oder nicht vollständig:
- Der Satz zu N26–N30 („eine abschließende Gegenprüfung … fand nicht statt“) gilt nach dieser Datei nicht mehr. Er ist nach Aufnahme dieser Datei zu ersetzen (B4).
- „Der Fall ‚Vergleichszahl 2018‘ muss in Kapitel 10 stehen“ ist veraltet: Er steht dort als Fall 4. Offen sind tatsächlich die Entscheidung zum Hinweis im Artikel [3] und die Platzhalter in Kapitel 10 Fall 4 („Reihenfolge am selben Tag klären“, „Entscheidung offen, ob ein Hinweis gesetzt wird“), die der Kopfvermerk nicht nennt (B4).
- Verweis auf den Methodenanhang (Z. 89) und Kapitel 8 als Ort des Prognose-Registers (Z. 85) stehen weder im Kopfvermerk noch sind sie hier prüfbar (K4-15 aus der Vorprüfung offen, B5).
- Der Kopfvermerk ist in sich redundant und teils widersprüchlich: „Differenzprüfung und Freigabe stehen aus“ (v0.2) steht neben „Differenzprüfung (ok …)“ als Datei und „Differenzprüfung 09.11.2026 … Freigabe steht aus“ (B5).
- Die in der Vorprüfung genannten mittleren Befunde K4-1 bis K4-5 sind im Text nachweislich eingearbeitet (Rechtsschiefe Z. 47; Vergleichszahl mit Quelle und früherer Erklärung Z. 53; Brandmelder-Teilsatz Z. 61; Auslandsvergleich Z. 70; Kopfzeile ergänzt). Das ist bestätigt, aber K4-7 und K4-11 (2026 nicht in der Modellbildung, Streubreite der Fortschreibung) sind nicht aufgenommen (gering, laut Vorprüfung optional/gering).

## 4. Befundliste

| Nr. | Stelle | Befund | Schweregrad | Vorschlag |
|---|---|---|---|---|
| B1 | Z. 45 und Grafik 2 (N26) | Fließtext: „Ein normales Jahr läge demnach bei bis zu etwa 8.700“ gefolgt von zwei Jahren darüber; „kein Höchstwert“ nur in der Bildunterschrift. Das Wort „normal“ steht weiter im Grafiklabel. Der Kern der Auflage (Prognoseintervall benennen, Erklärung vor Beobachtung) ist erfüllt. | gering | Im Fließtext „kein Höchstwert“ ergänzen. |
| B2 | Grafik 2 (N28) | „2025 vorläufig (KW 15–38)“ steht unter der Achse, nicht am Punkt; offener Kreis nicht in der Legende erklärt. | gering | Label neben den Punkt oder Kreis in der Legende erklären (Grafik neu rendern). |
| B3 | Kap. 10 Fall 4 vs. Kap. 5 Z. 53 | Kap. 10: „Diese Erklärung ist nicht belegt“ und später „Falsch ist nur die Erklärung …“. Laufprotokoll: unbestätigte Vermutung; „nicht belegt“ ist die belegte Aussage, „falsch“ nicht. Kap. 5 sagt durchgehend „nicht belegt“. | mittel | Kap. 10: „Falsch ist nur“ in „Nicht belegt ist nur“ ändern. |
| B4 | Kopfvermerk Z. 1 | N26–N30-Satz nach dieser Datei überholt; Aussage „Fall muss in Kapitel 10 stehen“ veraltet; Platzhalter in Kap. 10 Fall 4 (Reihenfolge am 29.08., Hinweis-Entscheidung) nicht benannt. Risiko: Freigabe auf Basis eines falschen Bildes des offenen Standes. | mittel | Vermerk neu fassen (Autor, nicht Prüfer). |
| B5 | Kopfvermerk Z. 1 | Redundant und teils widersprüchlich (Differenzprüfung „steht aus“ und „ok“); Methodenanhang und Kapitelverweis 8 nicht prüfbar. | gering | Vermerk straffen; Verweise vor Export prüfen. |
| B6 | Kap. 10 Fall 4 | „Vor der Veröffentlichung kursierte … eine Vergleichszahl“ klingt nach Fremdquelle; Zahl stand im eigenen SAP. | gering | „stand in unserem Analyseplan“ wie in Kap. 5. |
| B7 | Dateinamen/Kopfvermerke | Namenslage uneinheitlich (`04-sommer.md` ist Kapitel 5, Vorprüfung heißt `kurz_kap04`, Differenzdatei `kap05`; Kap. 10 verweist auf `faktencheck_kurz_kap07`). Nur Orientierungsproblem, keine inhaltliche Abweichung. | gering | Beim Export vereinheitlichen. |

Zahl der Befunde: **kritisch 0 · hoch 0 · mittel 2 (B3, B4) · gering 5 (B1, B2, B5, B6, B7) · gesamt 7**.

## 5. Nicht geprüft

- Grafikdaten nicht neu gegen CSV, RKI-Seite, DWD-Datei gelesen; R-Skript nicht ausgeführt.
- Aktueller Online-Stand der Substack-Artikel [3] (Hinweis gesetzt oder nicht) nicht geöffnet.
- Weitere Analysen-Dateien (Validierungsbericht, Analysebericht, SAP 8.1 im Volltext) nicht gelesen.
- Methodenanhang, Verweis „Kapitel 8“ und Treibhauspost #125 nicht prüfbar.
