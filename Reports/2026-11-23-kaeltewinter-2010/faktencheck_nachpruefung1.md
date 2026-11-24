# Faktencheck, Nachprüfung 1: Evidenzcheck „Kältewinter wie 2010“, Artikelentwurf v2 (Substack)

Geprüfter Text: `Reports/2026-11-23-kaeltewinter-2010/kanal-entwuerfe/substack.md`, Fassung v2 vom 24.11.2026. Der Artikel wurde nicht verändert. Diese Nachprüfung ist kein Freigabevermerk.
Prüfer: faktenpruefer-Subagent (unabhängig, hat den Text nicht geschrieben), Stand 24.11.2026.
Bezug: `Reports/2026-11-23-kaeltewinter-2010/faktencheck.md` (23.11.2026; 0 kritisch, 1 hoch, 4 mittel, 11 gering).

Geprüft gegen:
- `Analysen/2026-11-kaeltewinter-2010/Analysebericht_kaeltewinter-2010.md` (Abschnitte 1 bis 10.1)
- `Analysen/2026-11-kaeltewinter-2010/SAP_kaeltewinter-2010.md` v1.0 final (Abschnitte 0 bis 13)
- `output/tabelle1_E1.csv`, `output/tabelle2_E2_sensitivitaeten.csv` (Zahlen erneut einzeln abgeglichen)
- `Reports/2026-11-23-kaeltewinter-2010/INES_Doku_S13-15_textauszug.txt` (neu)
- `kanal-entwuerfe/assets/grafik1_zeitreihe_jfm.png` und `assets/grafik2_praediktive_verteilung_2027.png` (angesehen, mit `output/` verglichen)
- GitHub-Link zum Analyseordner (Abruf 24.11.2026)
- Für unverändert übernommene Sätze (INES-Pressemitteilung, Quellenliste, „Mehr erfahren“, Kanalzeile) gilt das Prüfergebnis aus `faktencheck.md`. Diese Stellen wurden nicht erneut abgerufen.

## Gesamturteil

**Weitgehend erledigt: 0 kritisch, 0 hoch, 0 mittel offen. Offen sind 2 alte Befunde (teilweise, gering) und 3 neue (gering).**

- H1, M1 bis M4 sind erledigt.
- G1, G2, G4 bis G8, G10 und G11 sind erledigt. G3 und G9 sind teilweise erledigt.
- Alle Zahlen im v2-Text stimmen mit `ergebnisse.json`, Tabelle 1, Tabelle 2 und dem Analysebericht überein. Ich habe keine neu berechnete Zahl und keine neue Inferenz gefunden.
- Wortzahl: rund 755 Wörter und damit unter der Grenze von 800 aus SAP 11 (Auszählung siehe unten).
- Der GitHub-Link ist erreichbar.
- Neu sind drei geringe Punkte. Der wichtigste: Die E1-Tabelle zeigt nur noch 3 der 6 vorab festgelegten Teilzeiträume (N-1).

**Korrektur meines Faktenchecks vom 23.11.2026:** Dort hatte ich geschrieben, das INES-PDF bestehe nur aus Seitenbildern und habe keine Textebene. Das war wahrscheinlich falsch. Der pdftotext-Auszug enthält zusammenhängenden Fließtext mit den Seitenzahlen 13, 14 und 15. Bei einem reinen Bild-PDF liefert pdftotext keinen Text. Meine frühere Einschätzung beruhte auf einem abgeschnittenen Abruf, der nur die eingebetteten Abbildungen (JPEG) zeigte. Den Auszug selbst kann ich nicht mit dem PDF abgleichen, weil mir hier weder pdftotext noch pdftoppm zur Verfügung stehen. Der Auszug stammt von der Top-Level-Session. Er ist in sich schlüssig und passt zum Wortlaut-Eintrag in SAP 3.3.

## Status der Befunde aus `faktencheck.md`

| Nr. | Befund (kurz) | Status | Nachweis in v2 / Hinweis |
|---|---|---|---|
| H1 | INES-Lesart (Nov./Dez. 2010 für Nov./Dez. 2026) als Quellenaussage dargestellt; Limitation 7 fehlt | **erledigt** | (1) Beide Zitate stimmen wörtlich mit dem Textauszug überein: „Kalte Temperaturen: EU-Wetterjahr 2010“ (S. 13) und „die extrem kalten Temperaturen des Jahres 2010 in den Monaten Dezember und Januar signifikant unter den Temperaturen der letzten Jahre (2018 – 2023)“ (S. 14). Der Artikel gibt „signifikant“ außerhalb der Anführungszeichen mit „deutlich“ wieder. Das ist sinngemäß zulässig. (2) Die Übertragung ist jetzt klar als Lesart gekennzeichnet: „Wir lesen das so, dass auch November und Dezember mit dem Wetter von Ende 2010 gerechnet werden. INES schreibt das nicht ausdrücklich, es ist unsere Lesart.“ Bullet 4 sagt ebenfalls „nach unserer Lesart“. (3) Der Auszug stützt die Lesart für Dezember sogar: „Eine Füllstandsentwicklung, die für diese Monate [Dezember und Januar] aus den Temperaturen des Jahres 2010 abgeleitet wird …“ (S. 14/15). Für November steht im Auszug nichts. Die Kennzeichnung als „unsere Lesart“ ist also eher vorsichtig und damit ausreichend. (4) Limitation 7 ist damit sinngemäß abgedeckt: Der Leser erfährt, dass die Zuordnung eine eigene Einordnung ist. Der interne Prozesshinweis (sap-autor hat die Doku nicht gelesen) ist für Leser nicht nötig. Einschränkung: Den Auszug konnte ich nicht gegen das PDF prüfen (siehe Gesamturteil). |
| M1 | Titel als unbelegtes Zitat | **erledigt** | Neuer Titel „Kälte wie 2010: Wie wahrscheinlich ist so ein Spätwinter heute?“ ohne Anführungszeichen und ohne Ergebniszahl. Der PM-Wortlaut „entsprechend dem Referenzjahr 2010“ steht korrekt im ersten Absatz. |
| M2 | Limitation 5 nur zum Teil; „INES-Szenario als Ganzes“ | **erledigt** | „als Ganzes“ ist gestrichen. Bullet 4 lautet „Rechnet man November bis März …“ und ist als „Nebenrechnung, kein Hauptergebnis“ bezeichnet (SAP 6). Neu: „Unsere Hauptgröße ist deshalb Januar bis März …“, die Definition der S14-Referenz („November und Dezember 2010 plus Januar bis März 2010“, entspricht SAP 2.5 und Analysebericht 2) und „Beides ist nur eine Annäherung an ein Szenario, das so nie als ein Winter aufgetreten ist.“ Hinweis: Dass S14 mit *zusammenhängenden* historischen Zeiträumen vergleicht, steht nicht ausdrücklich da. Sinngemäß reicht der Näherungssatz. |
| M3 | „vorab festgelegt“ trifft auf die S9b-Zählweise nicht zu (A4, Post-hoc) | **erledigt** | „Wie diese Zählung genau gerechnet wird, haben wir erst nach dem Einfrieren des Plans festgelegt und im Abweichungsprotokoll vermerkt.“ In Bullet 5 alt (jetzt Abschnitt „Wie stabil ist das?“) steht „Wir hatten vorab Gegenrechnungen festgelegt“. Das ist richtig (SAP 6), weil der Post-hoc-Teil gleich danach offengelegt wird. |
| M4 | Länge über SAP 11 (≤ 800 Wörter) | **erledigt** | Von Hand ausgezählt: rund 755 Wörter (Methode siehe unten). |
| G1 | „5 % statt 3 %“ zu allgemein | **erledigt** | „die Bootstrap-Rechenwege, die diese Annahme nicht brauchen, ergeben 5 %“. Das entspricht Tabelle 2 (S10 Boot und Block-Boot, je 0,0536 → 5 %) und Analysebericht 4.3. Die 3 % stehen hier nicht mehr ohne Spanne. |
| G2 | „Die meisten zwischen 2 % und 5 %“ (neue Verdichtung) | **erledigt** | Satz gestrichen. |
| G3 | „Platz 35“ ohne Gleichstand | **teilweise** | Neu: „Damit gehört 2010 zu den kältesten 35 Spätwintern seit 1881.“ Bei Rang 35 mit Gleichstand (1883, Analysebericht 3, A10) ist das formal richtig. Der Gleichstand wird aber nicht genannt. Zusammen mit „In 35 von 145 Jahren … 0,0 °C oder darunter“ kann der Leser auf 35 statt 36 Jahre kommen. Vorschlag wie bisher: „(gleichauf mit 1883)“ oder „zu den 36 Wintern mit 0,0 °C oder darunter“. Wahl bei Daniel. |
| G4 | „jeder ordentlichen Risikorechnung“, „legitim“ | **erledigt** | „Ein Kälteszenario ist in einer Risikorechnung methodisch üblich.“ Das ist der Wortlaut von SAP 8 und Analysebericht 7.1. „legitim“ ist gestrichen. |
| G5 | „sehr kalter Dezember 2010“ | **erledigt** | Die Wertung ist gestrichen. Die Doku-Aussage zu Dezember/Januar steht jetzt als Zitat mit Quelle [2]. |
| G6 | „Seitdem wird viel … gesprochen“ | **erledigt** | Satz gestrichen. |
| G7 | „Spanne“ für drei Intervalle | **erledigt** | E1 und Trend-KI heißen jetzt „95-%-Bereich“, E2 heißt „Unsicherheitsspanne“/„Spanne“. Die Abgrenzung zur „Spannbreite über die Rechenwege“ wird ausdrücklich erklärt. |
| G8 | Auswahleffekt fehlt | **erledigt** | „Das ist eine Beschreibung: INES hat 2010 gerade wegen seiner Kälte gewählt.“ (SAP 8, Analysebericht 4.1/7.1). |
| G9 | Grafiken fehlen in `assets/`; „#n“ fehlt; Untertitel/Teaser | **teilweise** | (a) Beide Dateien liegen jetzt unter `kanal-entwuerfe/assets/`. Angesehen und mit `Analysen/…/output/` verglichen: sichtbar identisch (Grafik 1: Quelle „Deutscher Wetterdienst, Datenschnitt März 2026“, blau „mindestens so kalt wie 2010“, rot Trend 1971–2026, Kreuz 2027; Grafik 2: „(3 %, Spanne 0,5 % bis 10 %)“, „Grundrate, keine Prognose für den Winter 2026/27“). Die Bitgleichheit (sha256) konnte ich ohne Shell nicht prüfen. Das bitte vor der Veröffentlichung nachholen. (b) Die Reihenzeile lautet weiter „Klima Kompass · Evidenzcheck“ ohne „#n“ (CLAUDE.md: „Klima Kompass · Evidenzcheck #n“). **Offen.** (c) Kein Untertitel. Der Titel nennt kein Ergebnis und verletzt SAP 6 damit nicht. Die Box „auf einen Blick“ enthält S14, aber gekennzeichnet als Nebenrechnung. Das ist vertretbar. Wird ein Untertitel ergänzt, darf er nur E1/E2 nennen. |
| G10 | „bevor wir die Daten angesehen haben“ | **erledigt** | „bevor wir die Daten heruntergeladen haben“. Belegt: Einfrieren 20:52, DWD-Download 21:02 MEZ (Validierungsbericht, SAP 12 Nr. 1). |
| G11 | „deshalb“-Logik bei „einmal in 30 Jahren“ | **erledigt** | „Das entspricht grob einem solchen Spätwinter in 30 Jahren.“ (Tabelle 2: Wiederkehr 30,25 → 30). |

## Neue Befunde in v2

| Nr. | Fundstelle | Befund | Schwere | Vorschlag |
|---|---|---|---|---|
| N-1 | Tabelle unter „146 Spätwinter im Vergleich“ | Die E1-Tabelle zeigt nur noch 3 der 6 vorab festgelegten Zeiträume (1881–2026, 1881–1930, 1997–2026). Es fehlen 1931–1960 (8/30, 27 %), 1961–1990 (8/30, 27 %) und 1991–2020 (3/29, 10 %). SAP 7 sagt: „Alle Teilzeiträume in E1 … werden vollständig berichtet, auch wenn sie dem Primärergebnis widersprechen“ (Prüfpunkt SAP 12.9, bezogen auf den Bericht). Der Analysebericht erfüllt das. Für den Artikel ist die Regel nicht eindeutig. Die weggelassenen Zeilen widersprechen der Aussage „seltener geworden“ nicht, aber die Auswahl zeigt gerade die beiden Randzeiträume. Im Zweifel ist das eine Abweichung. | gering | Eine Zeile unter der Tabelle: „Weitere vorab festgelegte Zeiträume (1931–1960 und 1961–1990 je 27 %, 1991–2020 10 %) stehen im Analysebericht.“ Oder alle sechs Zeilen zeigen (rund 24 Wörter mehr, weiter unter 800). |
| N-2 | „Was diese Analyse nicht sagt“, Punkt „Keine Vorhersage“ | SAP 8.1 und 11 verlangen für S14 ausdrücklich den Hinweis, dass ein Teil des Zeitraums November 2026 bis März 2027 schon beobachtet ist und bewusst nicht einfließt. v1 hatte dazu noch „auch nicht der bisherige Herbst“. In v2 steht nur noch allgemein „Daten nach März 2026 haben wir bewusst nicht verwendet.“ Sinngemäß ist das abgedeckt, ausdrücklich nicht mehr. | gering | Zum Beispiel: „Daten nach März 2026 haben wir bewusst nicht verwendet, auch nicht den bisherigen Herbst.“ (+5 Wörter) |
| N-3 | „Was ‚Kälte wie 2010‘ bei INES heißt“, Satz 2 | „Die Temperaturen von 2010 lagen dort …“: Das „dort“ ist mehrdeutig (in der Dokumentation oder im Szenario). Der Inhalt ist korrekt (Doku S. 14). | gering | „Laut Dokumentation lagen die Temperaturen von 2010 …“ (optional). |

## Prüfprotokoll v2 (Behauptung, Quelle, Ergebnis)

Ampel: bestätigt / Abweichung / nicht prüfbar / kritisch.

| Behauptung (Artikel v2) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Titel „Kälte wie 2010: Wie wahrscheinlich ist so ein Spätwinter heute?“ | SAP 6 (Überschrift nur E1/E2) | bestätigt | Kein Ergebnis im Titel, kein Zitat |
| INES = Initiative Energien Speichern, Verband der Gasspeicherbetreiber; Szenarien am 10. November | PM (faktencheck.md), SAP 8 | bestätigt | unverändert gegenüber v1 |
| Normale/warme Temperaturverläufe: Versorgung gesichert | PM (faktencheck.md) | bestätigt | unverändert |
| „entsprechend dem Referenzjahr 2010“; Jan., Feb., März 2027 nicht vollständig gedeckt; bis zu 6,6 TWh in einem Monat, im Modell | PM (faktencheck.md); Doku S. 15 („im Januar, Februar und März 2027 zu Unterdeckungen von bis zu …“) | bestätigt | |
| Kälteszenario in Risikorechnung methodisch üblich; Zahlen bewerten INES nicht | SAP 8; Analysebericht 7.1 | bestätigt | Auflage (c) erfüllt |
| 35 von 145, 24 % (17–32 %), 0,0 °C oder darunter, „etwa jeder vierte“ | `tabelle1_E1.csv` (0,2414; 0,1743/0,3194) | bestätigt | |
| 1881–1930: 32 %; letzte 30 Jahre nur 2006 und 2013; seitdem keiner | `tabelle1_E1.csv` (16/50; 1997–2026: 2006 2013); Analysebericht 3 | bestätigt | |
| 3 % pro Jahr, Unsicherheitsspanne 0,5–10 %; grob einmal in 30 Jahren | `tabelle2…csv` Primär (0,0331; 0,0048/0,0995; 30,25) | bestätigt | Auflage (a) erfüllt |
| Nov.–März: etwa 0,4 % (0,01–2 %), Nebenrechnung | `tabelle2…csv` S14 (0,00363; 0,000127/0,0173); SAP 6 | bestätigt | „nach unserer Lesart“, siehe H1 |
| Zitat „EU-Wetterjahr 2010“ [2] | Textauszug S. 13 | bestätigt | gegen Auszug, nicht gegen das PDF selbst |
| Zitat „in den Monaten Dezember und Januar“, deutlich unter 2018 bis 2023 | Textauszug S. 14 („signifikant unter … (2018 – 2023)“) | bestätigt | „dort“ mehrdeutig (N-3) |
| Nov./Dez. mit Wetter Ende 2010, als „unsere Lesart“ gekennzeichnet | SAP 3.3/2.5; Textauszug S. 14/15 (Dezember gestützt, November nicht erwähnt) | bestätigt | als Lesart korrekt gekennzeichnet |
| Hauptgröße JFM = Monate mit INES-Lücken; Zusatzrechnung Nov.–Dez. 2010 + Jan.–März 2010; beides Annäherung | SAP 2.0, 2.5, 9; Analysebericht 2, 7.2 Nr. 5 | bestätigt | |
| JFM 2010 = 0,0 °C [3] | `ergebnisse.json` T_ref 0,0339; Analysebericht 2 | bestätigt | |
| „zu den kältesten 35 Spätwintern seit 1881“ | Analysebericht 3 (Rang 35, Gleichstand mit 1883) | Abweichung (gering) | G3 teilweise |
| „INES hat 2010 gerade wegen seiner Kälte gewählt“ | SAP 0, 8; Analysebericht 7.1 | bestätigt | |
| Tabelle: 1881–2026 35/145, 24 % (17–32 %); 1881–1930 16/50, 32 % (20–47 %); 1997–2026 2/29, 7 % (0,8–23 %) | `tabelle1_E1.csv` (0,195/0,467; 0,0690, 0,00846/0,2277) | bestätigt (Zahlen) | Auswahl der Zeilen: N-1 |
| 2010 nicht mitgezählt; nicht trendbereinigt | SAP 2.1 | bestätigt | |
| Trend etwa 0,4 Grad pro Jahrzehnt seit 1971 | Analysebericht 4.1 (0,0381 K/Jahr) | bestätigt | |
| 2027: 3,3 °C (2,4 bis 4,2 °C) | Analysebericht 4.1 | bestätigt | |
| 3 %, Spanne 0,5–10 %, einmal in 10 bis 210 Jahren | Tabelle 2 Primär [10,05; 207,8] | bestätigt | |
| Grafik 1/2 (Platzhalter und Dateien in `assets/`) | angesehen; Analysebericht 8 | bestätigt (inhaltlich) | sha256 nicht prüfbar (G9) |
| Spanne breit wegen nur 56 Jahren und seltener kalter Ausreißer | Analysebericht 4.1 (n = 56), 7.2 Nr. 3 | bestätigt (sinngemäß) | Limitation 3 |
| Vorab Gegenrechnungen; Ergebnis 0,4 % (Nov.–März) bis 10 %; Spannbreite ≠ Unsicherheitsspanne | SAP 6; Analysebericht 5 | bestätigt | Auflage (b) erfüllt |
| Normalverteilte Abweichungen angenommen; kalte Ausreißer etwas häufiger; Bootstrap 5 % | Analysebericht 4.2, 4.3; Tabelle 2 S10 | bestätigt | G1 erledigt |
| Obergrenze 10 % aus einfacher Zählung der letzten 30 Jahre, 2010 zählt mit, ohne 2010 7 % | Tabelle 2 S9b (3/30); Tabelle 1 (2/29); Analysebericht 5 | bestätigt | Auflage (e) erfüllt |
| Zählweise erst nach dem Einfrieren festgelegt, im Abweichungsprotokoll | Abweichungsprotokoll A4 (Post-hoc), Tabelle 2 „(A4, Post-hoc)“ | bestätigt | M3 erledigt |
| Nichts über die Gasversorgung; Temperatur ≠ Gasbedarf; keine Wahrscheinlichkeit einer Versorgungslücke | SAP 8.2 | bestätigt | keine ausgeschlossene Formulierung |
| Keine Vorhersage; Grundrate; Daten nach März 2026 nicht verwendet | SAP 8.1, Analysebericht 7 | bestätigt | S14-Zusatz nur implizit (N-2) |
| Nur Deutschland; INES mit Wetter in Europa | SAP 8.3; Textauszug S. 13 („für Europa“) | bestätigt | |
| Keine kurzen Kältewellen | Analysebericht 7.2 Nr. 1 | bestätigt | |
| Weniger Stationen vor 1951; Referenzjahr grobes Maß | Analysebericht 7.2 Nr. 2, 4 | bestätigt | „von INES gewählt“ steht beim Auswahleffekt |
| Plan eingefroren vor Download; Validierung ohne kritischen Befund | Validierungsbericht SAP 12 Nr. 1, Nachträge 1 und 2 | bestätigt | |
| GitHub-Link Analyseordner | Abruf 24.11.2026 | bestätigt | erreichbar; SAP, R-Skript, Abweichungsprotokoll, Analysebericht, Validierungsbericht, `output/`, `quellen/` sichtbar |
| Quelle [2] mit „Abschnitt 3.3, S. 13–15“ | Textauszug (Abschnitt 3.3 beginnt S. 13, läuft bis S. 15); SAP 3.3 | bestätigt | |
| Quellen [1], [3], „Mehr erfahren“, Kanalzeile | faktencheck.md | bestätigt | unverändert gegenüber v1, nicht erneut abgerufen |

## Prüfung auf neue Inferenz (v2)

- Ich habe keine neue Zahl und keine neue Rechnung gefunden. Alle Werte und Rundungen stehen so in den Ergebnisdateien.
- Neue Formulierungen sind „gehört zu den kältesten 35“ (G3), „Das ist seltener geworden“ und „Die Spanne ist breit, weil …“. Es sind beschreibende Zusammenfassungen dessen, was im Bericht steht. Keine davon ist eine neue Inferenz.
- Die INES-Lesart ist jetzt als eigene Lesart gekennzeichnet und wird vom Doku-Auszug für Dezember gestützt.

## Auflagen des validators (Stand v2)

| Auflage | Ergebnis |
|---|---|
| (a) 3 % nie ohne Spanne | erfüllt (Bullet 3, Absatz E2, Grafik 2; „5 % statt 3 %“ entfallen) |
| (b) Unsicherheitsspanne und Spannbreite getrennt | erfüllt |
| (c) SAP 8 | erfüllt |
| (d) alle Limitationen 7.2 sinngemäß | erfüllt (Nr. 5 und 7 jetzt enthalten, siehe M2, H1) |
| (e) Offenlegung S9b | erfüllt, Post-hoc-Charakter genannt |

## Wortzählung (M4)

Gezählt wurde von Hand von der Titelzeile („# Kälte wie 2010 …“) bis vor „## Quellen“. Nicht mitgezählt sind die Entwurfszeile, die Reihenzeile, der Hinweisblock für Daniel und die beiden Grafik-Platzhalter. Gezählt wurden Tokens zwischen Leerzeichen wie bei `wc -w`: Überschriften, Tabellenzellen, Quellenmarken [1] bis [3] und die URL zählen je als ein Wort, „%“ und „°C“ als eigene Wörter, Satzzeichen nicht.

| Abschnitt | Wörter |
|---|---|
| Titel und Einleitung (2 Absätze) | 111 |
| Ergebnisse auf einen Blick (inkl. Überschrift) | 136 |
| Was „Kälte wie 2010“ bei INES heißt | 111 |
| 146 Spätwinter (inkl. Tabelle und Fußnote) | 84 |
| Wie wahrscheinlich heute? | 85 |
| Wie stabil ist das? | 110 |
| Was diese Analyse nicht sagt | 87 |
| So haben wir gerechnet | 31 |
| **Summe** | **rund 755** |

Die Zählung von Hand hat eine Unsicherheit von etwa ±10 Wörtern. Ohne „%“ und „°C“ als eigene Wörter wären es deutlich weniger. Die Grenze von 800 Wörtern aus SAP 11 ist in beiden Zählweisen eingehalten. Werden N-1 und N-2 wie vorgeschlagen umgesetzt (zusammen rund 30 Wörter), bleibt der Text unter 800.

## Nicht geprüft

- Abgleich des Textauszugs mit dem PDF selbst. Hier fehlen pdftotext und pdftoppm, und der Web-Abruf liefert nur einen abgeschnittenen Teil mit eingebetteten Bildern.
- sha256-Gleichheit von `assets/` gegen `output/`. Ohne Shell nicht möglich, die Grafiken sind nur sichtbar verglichen.
- Unveränderte Teile aus v1 (PM-Wortlaut, Quellen [1] und [3], Substack-Links) wurden nicht erneut abgerufen.
- Es wurde kein Freigabevermerk geschrieben und der Artikel nicht verändert.
