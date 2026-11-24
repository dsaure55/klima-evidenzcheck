# Faktencheck: Evidenzcheck „Kältewinter wie 2010“, Artikelentwurf (Substack)

Geprüfter Text: `Reports/2026-11-23-kaeltewinter-2010/kanal-entwuerfe/substack.md` (Entwurf, Stand 23.11.2026). Der Artikel wurde nicht verändert. Dieser Faktencheck ist kein Freigabevermerk.
Prüfer: faktenpruefer-Subagent (unabhängig, hat den Text nicht geschrieben), Stand 23.11.2026.
Stufe: Evidenzcheck. Maßstab: Jede Zahl und Aussage muss im validierten Analysebericht, in den Ergebnisdateien, im Validierungsbericht (mit Nachtrag 1 und 2) oder in den INES-Quellen belegt sein. Keine neue Inferenz über den Analysebericht hinaus.

Geprüft gegen (alles unter `Analysen/2026-11-kaeltewinter-2010/`):
- `Analysebericht_kaeltewinter-2010.md` (Abschnitte 1 bis 10.1)
- `Validierungsbericht_kaeltewinter-2010.md` mit Nachtrag 1 und Nachtrag 2
- `Abweichungsprotokoll_kaeltewinter-2010.md` (A1 bis A15, Bestätigungen, Status)
- `SAP_kaeltewinter-2010.md` v1.0 final (Abschnitte 0 bis 11)
- `output/ergebnisse.json`, `tabelle1_E1.csv`, `tabelle2_E2_sensitivitaeten.csv`, `zielgroessen_jahreswerte_1881-2026.csv`, `arbeitsdaten_monatswerte_bis_2026-03.csv` (Zeilen 2009 bis 2012)
- `output/grafik1_zeitreihe_jfm.png`, `output/grafik2_praediktive_verteilung_2027.png` (angesehen)
- `quellen/INES_PM_2026-11-10.html` (Text gelesen)
- `quellen/INES_Dokumentation_November-Update_2026.pdf`: **nicht lesbar.** Das PDF besteht nur aus eingebetteten Seitenbildern (JPEG), ohne Textebene. Lokal fehlt `pdftoppm`/`pdftotext`, und der Abruf über die Original-URL liefert ebenfalls nur Bilddaten. Dasselbe gilt für die INES-Präsentation. Aussagen aus der Dokumentation habe ich daher nur gegen den Eintrag in SAP 3.3 geprüft, nicht gegen das Dokument selbst.
- Links per Abruf (23.11.2026): INES-PM, INES-Dokumentation (PDF), DWD-Verzeichnis, beide Substack-Artikel unter „Mehr erfahren“.

## Gesamturteil

**Bedingt: 0 kritisch, 1 hoch, 4 mittel, 11 gering.**

Alle Zahlen stimmen mit den Ergebnisdateien und dem Analysebericht überein. Geprüft wurden über 50 Zahlenangaben, keine davon ist falsch. Die Auflagen des validators sind weitgehend umgesetzt:

- (a) Die 3 % stehen an allen Kernstellen mit der Spanne 0,5 bis 10 %. Einzige Ausnahme ist der Vergleich „5 % statt 3 %“ (G1).
- (b) Spanne und Rechenwege sind sauber getrennt (Absatz unter „Wie stabil ist das Ergebnis?“).
- (c) Die SAP-8-Inhalte sind vorhanden.
- (e) S9b ist offengelegt.
- (d) Die Limitationen sind nicht vollständig: Nr. 7 fehlt, Nr. 5 ist nur zum Teil enthalten.

Vor einer Freigabe sollte der hohe Befund behoben werden:

1. **H1:** Der Artikel stellt den Aufbau des INES-Szenarios als belegte Tatsache aus der INES-Dokumentation dar: „Für November und Dezember 2026 nimmt es November und Dezember 2010“, „das Wetter des ganzen Jahres 2010“, „Es setzt das Ende von 2010 vor den Anfang von 2010“. Die einzige Quelle im Projekt (SAP 3.3) formuliert das als Lesart der Top-Level-Session („offenbar“) und kennzeichnet sie als „nicht vom sap-autor geprüft“. Die zugehörige Limitation 7 (Analysebericht 7.2) fehlt im Artikel. Ich konnte die Dokumentation nicht lesen (Bild-PDF), die Lesart also nicht unabhängig bestätigen.

Nicht prüfbar bzw. bekannt offen:
- Wortlaut der INES-Dokumentation (Bild-PDF, siehe oben).
- GitHub-Link zum Analyseordner: vor dem `git push` noch 404 (bekannt, laut Entwurfskopf 10 Commits nicht gepusht).
- Der Ordner `assets/` mit den Grafiken existiert unter `Reports/2026-11-23-kaeltewinter-2010/` nicht. Die Grafiken liegen nur unter `Analysen/.../output/` (G9).

## Befunde nach Schweregrad

### Hoch

| Nr. | Fundstelle (Artikel) | Befund | Vorschlag |
|---|---|---|---|
| H1 | Abschnitt „Was ‚Kälte wie 2010‘ bei INES bedeutet“, Absätze 1 und 2; Bullet 4 („INES rechnet mit dem Wetter des ganzen Jahres 2010, also auch mit dem sehr kalten Dezember 2010“); Abschnitt „Was diese Analyse nicht sagt“ | (1) Laut SAP 3.3 gibt die Dokumentation nur „Kalte Temperaturen: EU-Wetterjahr 2010“ wörtlich wieder. Dass INES für Nov./Dez. 2026 die Monate Nov./Dez. 2010 einsetzt, steht dort als Einordnung der Top-Level-Session mit „offenbar“ (SAP 3.3, Eintrag „Einordnung … nicht vom sap-autor geprüft“; ebenso SAP 2.5: „also offenbar November–Dezember 2010“). Der Artikel macht daraus „In der Dokumentation von INES steht, wie das Kälteszenario gebaut ist … Für November und Dezember 2026 nimmt es November und Dezember 2010“. Damit wird eine Lesart als Quellenaussage ausgegeben. (2) Limitation 7 aus Analysebericht 7.2 (INES-Einordnung nicht vom sap-autor geprüft) fehlt im Artikel ganz. Auflage (d) bzw. V-1 verlangt alle Limitationen sinngemäß. (3) Ich konnte die Lesart nicht gegenprüfen, weil das PDF keine Textebene hat. Die ganze S14-Begründung (Bullet 4, Absatz zu November bis März) hängt an dieser Lesart. | Entweder die Dokumentation (S. 13–15) von einem Menschen lesen lassen und die Zuordnung mit Fundstelle bestätigen, oder vorsichtig formulieren: „INES rechnet mit dem ‚EU-Wetterjahr 2010‘. Nach unserer Lesart der Dokumentation heißt das: … für November und Dezember 2026 November und Dezember 2010.“ Zusätzlich die Limitation 7 sinngemäß aufnehmen, z. B. „Wie INES das Szenario aufbaut, haben wir der INES-Dokumentation entnommen. Diese Einordnung wurde im Analyseplan nicht unabhängig gegengelesen.“ |

### Mittel

| Nr. | Fundstelle | Befund | Vorschlag |
|---|---|---|---|
| M1 | Überschrift: „‚Nur bei Kälte wie 2010 fehlt Gas‘“ | Die Anführungszeichen machen den Satz zum Zitat. Weder in der INES-Pressemitteilung noch in SAP 1 kommt dieser Wortlaut vor. Die PM sagt: Versorgung „bei normalen und warmen Temperaturverläufen gesichert“, Lücken „bei einem extrem kalten Winter entsprechend dem Referenzjahr 2010“. Die Zuspitzung „Nur …“ ist sinngemäß vertretbar, als Zitat aber nicht belegt. | Anführungszeichen entfernen, als eigene Zusammenfassung kennzeichnen, oder den PM-Wortlaut verwenden („bei einem extrem kalten Winter entsprechend dem Referenzjahr 2010“). |
| M2 | Bullet 4 „Das INES-Szenario als Ganzes …“; Abschnitt „Was ‚Kälte wie 2010‘ …“, Absatz 2 | Limitation 5 (Analysebericht 7.2) ist nur zum Teil enthalten. Die Kombination ist beschrieben. Es fehlt, dass die Primärgröße (JFM) nur den zweiten Teil des Szenarios abbildet, dass S14 mit zusammenhängenden historischen Zeiträumen vergleicht und dass beides nur eine Näherung ist. „Das INES-Szenario als Ganzes“ überzeichnet S14 zusätzlich: S14 betrachtet nur das Deutschland-Mittel (8.3) und ist laut SAP 6 eine „Rechnung mit dem INES-Zeitraum November bis März“, kein Hauptergebnis. | Bullet 4: „Rechnet man mit dem INES-Zeitraum November bis März …“ statt „als Ganzes“. Einen Satz ergänzen: „Beide Rechnungen sind Näherungen an ein Szenario, das so nie als ein Winter aufgetreten ist.“ |
| M3 | Bullet 5 („Je nach vorab festgelegtem Rechenweg … zwischen 0,4 % und 10 %“), Abschnitt „Wie stabil …“, Absatz 3 | Das Maximum der Spannbreite (10 %, S9b) beruht auf einer Festlegung **nach** dem Einfrieren. Laut Abweichungsprotokoll A4 ist sie „Post-hoc (Verfahren)“: Der empirische Anteil wird einschließlich 2010 gezählt. Der validator nennt die Angabe „vor Sichtung der Ergebnisse festgelegt“ ausdrücklich „nicht prüfbar“ (Validierungsbericht A4). Die Offenlegung (2010 zählt mit, ohne 2010 7 %) steht im Artikel, und Auflage (e) ist erfüllt. „Vorab festgelegter Rechenweg“ trifft aber nur auf die Spannbreiten-Aussage und die Liste der Sensitivitäten zu (SAP 6), nicht auf diese Zählweise. | In Absatz 3 ergänzen, z. B.: „Dass 2010 hier mitzählt, haben wir erst bei der Umsetzung festgelegt; es steht im Abweichungsprotokoll und bleibt so.“ In Bullet 5 „vorab festgelegt“ streichen oder auf „vorab festgelegte Gegenrechnungen“ beschränken. |
| M4 | ganzer Artikel | SAP 11 („Veröffentlichung“) gibt für den Substack-Artikel „≤ 800 Wörter, 1–2 Grafiken“ vor. Grob ausgezählt hat der Artikeltext ohne Quellen, Hinweisblock und Kanalzeile rund 1.200 bis 1.300 Wörter. Das ist eine Abweichung von einer vorab festgelegten Reporting-Regel. Die Pflichtinhalte (Limitationen, SAP 8, S9b-Offenlegung) machen einen Teil der Länge aus. | Kürzen, z. B. Tabelle der Teilzeiträume oder den Absatz zum Kalenderjahr straffen. Oder die Überschreitung durch Daniel Saure bewusst entscheiden lassen und als Abweichung von SAP 11 vermerken. |

### Gering

| Nr. | Fundstelle | Befund | Vorschlag |
|---|---|---|---|
| G1 | „Wie stabil …“, Absatz 2: „Rechenwege, die ohne diese Annahme auskommen, ergeben 5 % statt 3 %.“ | (a) Hier stehen die 3 % ohne Spanne (Auflage a). Der Bezug ist klar, und der Analysebericht 4.3 formuliert genauso. (b) Die Aussage ist zu allgemein. Der Analysebericht nennt nur die **Bootstrap-Schätzer** (S10: M1-Boot, M1-Block-Boot, je 5 %). Auch S9b, der empirische Anteil, kommt ohne Normalverteilung aus und liefert 10 %. (c) „kalte Ausreißer etwas häufiger“: Laut Bericht sind die Residuen linksschief (g₁ = −0,51) und die kältesten Residuen liegen unter der Normalverteilungslinie. Shapiro-Wilk (p = 0,14) löst die Umschaltregel nicht aus. Das sinngemäße „Normalmodell kann kalte Extreme eher knapp schätzen“ fehlt. | „Die beiden Bootstrap-Rechenwege, die ohne diese Annahme auskommen, ergeben 5 % statt 3 %. Das Normalmodell kann kalte Extreme also eher knapp schätzen.“ |
| G2 | „Wie stabil …“, Absatz 1: „Die meisten liegen zwischen 2 % und 5 %.“ | Steht so nicht im Analysebericht. Es ist eine Zusammenfassung des Autors aus Tabelle 2. Sie stimmt für die gerundeten Werte (10 von 13 Sensitivitätszeilen: S1, S2, S7, S8, S9a, S10 ×3, S12, S13). Ungerundet liegen S1 (1,7 %) und S8 (1,6 %) unter 2 %. Es ist keine neue Rechnung, aber eine neue Verdichtung. | Vertretbar. Präziser wäre: „Die meisten liegen gerundet zwischen 2 % und 5 % (10 von 13 Rechnungen).“ |
| G3 | „146 Spätwinter …“: „Platz 35 der kältesten“ | Laut Analysebericht 3 ist der Rang 35 ein Gleichstand mit 1883 nach der 0,01-°C-Rundung. Ungerundet ist 1883 kälter (0,0336 gegen 0,0339 °C, A10), streng genommen wäre 2010 also Platz 36. Die Zahl entspricht dem Bericht. | „Platz 35 (gleichauf mit 1883)“. |
| G4 | „Vorweg zur Einordnung“: „Ein Kälteszenario gehört zu jeder ordentlichen Risikorechnung“; INES-Abschnitt: „Das ist für eine Risikorechnung legitim“ | SAP 8 / Analysebericht 7.1: „methodisch üblich“. „Jeder ordentlichen“ und „legitim“ sind stärker und eine (positive) Bewertung. SAP 8 verlangt sachliche Nennung ohne Bewertung. Inhaltlich ist Auflage (c) erfüllt: INES als Verband der Speicherbetreiber, Kälteszenario üblich, kein Urteil über INES. | „Ein Kälteszenario ist in einer Risikorechnung methodisch üblich, ganz gleich, wie wahrscheinlich es ist.“ „legitim“ durch „üblich“ ersetzen oder streichen. |
| G5 | Bullet 4: „mit dem sehr kalten Dezember 2010“ | Der DWD-Wert für Dezember 2010 ist −3,66 °C (`arbeitsdaten_monatswerte_bis_2026-03.csv`). Eine Einordnung „sehr kalt“ (Rang o. Ä.) steht in keiner Ergebnisdatei. INES schreibt laut SAP 3.3 „deutlich kälter als 2018–2023“. Die Wertung des Autors ist plausibel, aber nicht aus dem Bericht belegt. Hängt außerdem an H1. | „mit dem Dezember 2010, den INES als deutlich kälter als 2018 bis 2023 beschreibt“. |
| G6 | Einleitung: „Seitdem wird viel über diesen einen Winter gesprochen.“ | Nicht belegt. SAP 1 nennt zwei Medienberichte (ZDFheute, cleanthinking.de), ein Umfang der Debatte ist nicht belegt. | Abschwächen („Medien haben darüber berichtet“) oder streichen. |
| G7 | mehrfach | „Spanne“ steht für drei verschiedene Intervalle: Clopper-Pearson bei E1 (Tabelle, Bullet 1), 95-%-KI des Trendniveaus (2,4 bis 4,2 °C) und die Unsicherheitsspanne der Parametersimulation (0,5 bis 10 %, S14 0,01 bis 2 %). Die Trennung von der Spannbreite über die Rechenwege (Auflage b) ist eingehalten, das Wort „Spannbreite“ kommt nicht vor, der Unterschied wird ausdrücklich erklärt. | Optional: bei E1 „Vertrauensbereich“ statt „Spanne“ (die Tabellenfußnote tut das schon). |
| G8 | „146 Spätwinter …“ | SAP 8 / Analysebericht 7.1 (Auswahleffekt): Rang und Residuum von 2010 sind Beschreibung, keine unabhängige Bestätigung der Außergewöhnlichkeit. Der Artikel nennt den Rang, aber nicht diesen Hinweis. Er behauptet allerdings auch keine Außergewöhnlichkeit. | Optional einen Halbsatz: „INES hat 2010 gerade wegen seiner Kälte gewählt.“ |
| G9 | Hinweisblock, Grafik-Platzhalter, Kopf | (a) `assets/grafik1_zeitreihe_jfm.png` und `assets/grafik2_…png` gibt es unter `Reports/2026-11-23-kaeltewinter-2010/` nicht. Die Grafiken liegen nur in `Analysen/2026-11-kaeltewinter-2010/output/`. Inhaltlich entsprechen sie der Beschreibung im Artikel: blau „mindestens so kalt wie 2010“, roter Trend 1971–2026, gestrichelt 0,0 °C, Quelle „Deutscher Wetterdienst, Datenschnitt März 2026“; Grafik 2 mit „(3 %, Spanne 0,5 % bis 10 %)“. (b) Die Reihenzeile lautet „Klima Kompass · Evidenzcheck“ ohne „#n“ (CLAUDE.md). (c) Es gibt keinen Untertitel bzw. Teaser. Nach SAP 6 dürfen Überschrift und Teaser nur E1 und E2 nennen. Das ist zu beachten, wenn der Untertitel ergänzt wird. Die Box „auf einen Blick“ enthält S14 und die Spannbreite. Als Teaser gelesen wäre das grenzwertig, als Ergebnisübersicht ist es vertretbar. | Grafiken vor der Veröffentlichung in den Reports-Ordner kopieren und nach der Kopie gegen `output/` vergleichen (sha256). Nummer ergänzen. Den Untertitel nur mit E1/E2 formulieren. |
| G10 | „So haben wir gerechnet“: „… eingefroren, bevor wir die Daten angesehen haben“ | Für diese Analyse belegt: Einfrieren 20:52, DWD-Download 21:02 MEZ (Validierungsbericht SAP 12 Nr. 1); laut SAP 0 hat der sap-autor keine Daten gesichtet. Transparenzhinweis: Im Projekt lagen die DWD-Monatswerte Okt. 2013 bis März 2026 schon aus dem Gasspeicher-Check vor (Integritäts-Check 3.5-3). Dass jemand sie für diesen SAP angesehen hat, ist nicht belegt. | Vertretbar. Optional „bevor wir die Daten für diese Analyse geladen haben“. |
| G11 | „Wie wahrscheinlich …“, Absatz 2: „Ungefähr einmal in 30 Jahren ist deshalb die beste Schätzung.“ | Das „deshalb“ verweist auf den vorherigen Satz (wenig Wissen über kalte Ausreißer), nicht auf die 3 %. Die Logik stimmt so nicht. Die Zahl ist richtig (30 Jahre, Spanne 10 bis 210). | „Ungefähr einmal in 30 Jahren ist die beste Schätzung, die Spanne reicht aber …“ |

## Prüfprotokoll (Behauptung, Quelle, Ergebnis)

Ampel: bestätigt / Abweichung / nicht prüfbar / kritisch.

| Behauptung (Artikel) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Überschrift „‚Nur bei Kälte wie 2010 fehlt Gas‘“ als Zitat | INES-PM (HTML) | Abweichung | M1: kein Wortlaut |
| Gasspeicher mit niedrigem Füllstand in den Winter gestartet | INES-PM: „historisch niedrigen Füllstand in die Heizperiode 2026/27“, 61 % | bestätigt | |
| INES = Verband der Gasspeicherbetreiber, Initiative Energien Speichern | SAP 8, Analysebericht 7.1; PM (Name „Initiative Energien Speichern e. V.“) | bestätigt | |
| Szenarien veröffentlicht am 10. November | PM (Datum 10.11.2026, `article:published_time`) | bestätigt | |
| Bei normalen und warmen Temperaturverläufen Versorgung gesichert | PM, wörtlich „bei normalen und warmen Temperaturverläufen gesichert“ | bestätigt | |
| Zitat „entsprechend dem Referenzjahr 2010“ | PM, wörtlich | bestätigt | |
| Bedarf im Januar, Februar und März 2027 nicht vollständig gedeckt | PM: „im Januar, Februar und März 2027 nicht vollständig gedeckt werden“ | bestätigt | |
| bis zu 6,6 TWh in einem Monat, im Modell | PM: „im Modell bis zu 6,6 Terawattstunden (TWh) innerhalb eines Monats“ | bestätigt | |
| „Seitdem wird viel über diesen einen Winter gesprochen“ | SAP 1 (zwei Medienberichte) | nicht prüfbar | G6 |
| SAP-8-Absatz (INES vertritt Betreiber; Kälteszenario üblich; kein Urteil über INES) | SAP 8, Analysebericht 7.1 | bestätigt | Auflage (c) erfüllt; Wortwahl siehe G4 |
| Seit 1881 etwa jeder vierte Spätwinter; 35 von 145; 24 % (17 % bis 32 %) | `ergebnisse.json` E1 (k 35, n 145, h 0,2414, CP 0,174/0,319); `tabelle1_E1.csv` | bestätigt | |
| „bei 0,0 °C oder darunter“ | SAP 2.0 (Vergleich auf 0,01 °C), `zielgroessen_…csv` | bestätigt | Kriterium ist T ≤ 0,03 °C nach 0,01-Rundung. Kein Jahr liegt zwischen 0,035 und 0,05 °C, die Formulierung führt also zur selben Menge. |
| 1881–1930 fast jedes dritte Jahr (32 %) | `tabelle1_E1.csv` (16/50) | bestätigt | |
| Letzte 30 Jahre nur zweimal, 2006 und 2013 | `tabelle1_E1.csv` 1997–2026: 2/29, Jahre 2006 2013 | bestätigt | 2010 ausgeschlossen, im Artikel per Fußnote erklärt |
| „Seit 2013 war kein Januar bis März mehr so kalt“ | E1-Jahresliste endet 2013; `zielgroessen_…csv` 2014–2026 alle ≥ 1,5 °C | bestätigt | Aus der vorab festgelegten Jahresliste abgelesen, keine neue Rechnung |
| Heute etwa 3 % pro Jahr, Spanne 0,5 % bis 10 % | `ergebnisse.json` E2 p 0,0331, span 0,0048/0,0995; Tabelle 2 | bestätigt | Auflage (a) an Kernstellen erfüllt (Bullet 3, Grafik 2, Absatz E2) |
| Ungefähr einmal in 30 Jahren | Tabelle 2 Wiederkehr 30,25 → 30 | bestätigt | |
| INES rechnet mit dem Wetter des ganzen Jahres 2010, auch Dezember 2010 | SAP 3.3 (Einordnung „offenbar“, nicht vom sap-autor geprüft); Dokumentation nicht lesbar | Abweichung | H1 |
| „sehr kalter Dezember 2010“ | `arbeitsdaten…csv`: Dez. 2010 −3,66 °C; SAP 3.3 („deutlich kälter als 2018–2023“) | Abweichung | G5, Wertung |
| S14: etwa 0,4 % pro Jahr (0,01 % bis 2 %) | `ergebnisse.json` S14 p 0,00363, span 0,000127/0,0173; Tabelle 2 | bestätigt | Formulierung „als Ganzes“ siehe M2 |
| Je nach Rechenweg 0,4 % bis 10 % | `ergebnisse.json` spannbreite [0,00363; 0,1]; Analysebericht 5 | bestätigt (Zahl) | „vorab festgelegt“ siehe M3 |
| Zitat „EU-Wetterjahr 2010“ | SAP 3.3 (Wortlaut-Eintrag); PDF nicht lesbar | nicht prüfbar | Stimmt mit SAP 3.3 überein; nicht gegen das Original geprüft |
| Jan.–März 2027 = Wetter Jan.–März 2010; Nov./Dez. 2026 = Nov./Dez. 2010 | SAP 3.3, 2.5 („offenbar“) | Abweichung | H1 |
| INES: vor allem Dezember und Januar 2010 deutlich kälter als 2018 bis 2023 | SAP 0 und 3.3 („in den Monaten Dezember und Januar“) | nicht prüfbar | Stimmt mit SAP 3.3 überein. Der Teil aus SAP 3.3, dass Feb./März 2018 kälter waren als im Szenario, wird nicht erwähnt (kein Fehler) |
| Szenario nie als ein zusammenhängender Winter aufgetreten | Analysebericht 7 (Kombinationszeitraum), 7.2 Nr. 5 | bestätigt | Hängt an H1 |
| Hauptgröße JFM, daneben Nov.–März | SAP 2.0, 2.5, 6 | bestätigt | |
| JFM 2010 = 0,0 °C | `ergebnisse.json` T_ref 0,0339 | bestätigt | |
| Platz 35 von 146 | `ergebnisse.json` rank2010 35; Analysebericht 3 | bestätigt | Gleichstand mit 1883, G3 |
| Grafik 1: blau mindestens so kalt, rot Trend 1971–2026, Quelle DWD, Datenschnitt März 2026 | `output/grafik1_zeitreihe_jfm.png` (angesehen) | bestätigt | Datei im `assets/`-Ordner fehlt, G9 |
| Tabelle E1: alle sechs Zeilen (k/n, Anteil, CP) | `tabelle1_E1.csv`, Analysebericht 3 | bestätigt | alle Rundungen korrekt (z. B. 0,0085 → 0,8 %; 0,0219 → 2 %) |
| Fußnote: 2010 nicht mitgezählt, 95-%-Vertrauensbereich | SAP 2.1, 5.4 | bestätigt | |
| Häufigkeiten nicht trendbereinigt | SAP 2.1, Analysebericht 3 | bestätigt | |
| Trend etwa 0,4 Grad pro Jahrzehnt seit 1971 | `ergebnisse.json` b1 0,0381 K/Jahr; Analysebericht 4.1 | bestätigt | |
| Erwartetes Mittel 2027: 3,3 °C (2,4 bis 4,2 °C) | `ergebnisse.json` yhat2027 3,271, CI 2,366/4,176 | bestätigt | |
| Grafik 2: (3 %, Spanne 0,5 % bis 10 %), Grundrate | `output/grafik2_…png` (angesehen), Nachtrag 2 N-1 | bestätigt | |
| Rechnung beruht auf 56 Jahren; wenig Wissen über kalte Ausreißer | Analysebericht 4.1, 7.2 Nr. 3 | bestätigt | Limitation 3 enthalten |
| Einmal in 10 bis 210 Jahren | Tabelle 2: Wiederkehr [10,05; 207,8] → 10; 210 | bestätigt | |
| Nov.–März: 21 von 145, 14 % | `ergebnisse.json` S14 e1 (21/145, 0,1448) | bestätigt | |
| Nov.–März „zuletzt im Winter 1995/96“ | S14-Jahresliste endet mit 1996; U_t = Nov. (t−1) bis März (t) (SAP 2.5, Validierungsbericht 4) | bestätigt | Aus der Liste abgelesen; die Überlappungsjahre 2010/2011 sind nicht darunter |
| 14 vorab festgelegte Gegenrechnungen, vier entfallen wegen Tagesdaten vor Datenzugriff | SAP 6 (S1–S14), 3.2, 7 („vor jedem Datenzugriff entschieden (v0.2)“) | bestätigt | |
| „Wir haben vorab festgelegt, mit welchen anderen Rechenwegen …“ | SAP 6 | bestätigt | Zur S9b-Zählweise siehe M3 |
| Die meisten Rechenwege zwischen 2 % und 5 % | Tabelle 2 (gerundete Werte) | Abweichung | G2, neue Verdichtung |
| Normalverteilungsannahme; kalte Ausreißer etwas häufiger | Analysebericht 4.2, 4.3 (Schiefe −0,51, Q-Q) | bestätigt (sinngemäß) | G1 (c) |
| Rechenwege ohne diese Annahme: 5 % statt 3 % | Tabelle 2 S10 Boot/Block-Boot 5 %; Analysebericht 4.3 | Abweichung | G1 (a), (b) |
| Trend seit 1881: 9 % | Tabelle 2 S6 (0,089) | bestätigt | S7 (Trend seit 1961) ergibt 3 %. „Hängt viel davon ab“ gilt nur für S6 |
| Höchster Wert 10 %, einfache Zählung der letzten 30 Jahre, 2010 zählt mit; ohne 2010 7 % | Tabelle 2 S9b (3/30); Analysebericht 5 (Offenlegung V-2); Tabelle 1 (2/29) | bestätigt | Auflage (e) erfüllt; Post-hoc siehe M3 |
| Über alle Rechenwege 0,4 % (INES-Zeitraum) bis 10 %; anders als Spanne 0,5–10 % des Hauptmodells | Analysebericht 5, 4.3; Nachtrag 2 N2.5 (Begriffsklarheit) | bestätigt | Auflage (b) erfüllt |
| Limitation „Nichts über die Gasversorgung“ | SAP 8.2, Analysebericht 7 | bestätigt | keine ausgeschlossene Formulierung |
| Limitation „Keine Vorhersage“, Daten nach März 2026 nicht verwendet, auch nicht der bisherige Herbst | SAP 8.1, Analysebericht 7, 7.2 Nr. 6 | bestätigt | auch der S14-Hinweis (8.1) ist sinngemäß enthalten |
| Limitation „Nur Deutschland“, INES mit Wetter in ganz Europa | SAP 8.3, Analysebericht 7 | bestätigt | |
| Limitation „Keine kurzen Kältewellen“; kein tägliches DWD-Gebietsmittel | Analysebericht 7.2 Nr. 1, SAP 3.2 | bestätigt | |
| Limitation: weniger Stationen vor 1951; Referenzjahr grobes Maß, von INES gewählt | Analysebericht 7.2 Nr. 2, 4 | bestätigt | N-4 beachtet (nicht auf E1/S6/S8 verengt) |
| Limitation 5 (kombiniertes Szenario, beides Näherung) | Analysebericht 7.2 Nr. 5 | Abweichung | M2, nur zum Teil |
| Limitation 7 (INES-Einordnung nicht vom sap-autor geprüft) | Analysebericht 7.2 Nr. 7 | Abweichung | fehlt, H1 |
| Plan eingefroren, bevor Daten angesehen | Validierungsbericht SAP 12 Nr. 1, SAP 0 | bestätigt | G10 |
| DWD-Monatsmittel ab 1881; linearer Trend 1971–2026 | SAP 2.0, 2.2; Analysebericht 4.1 | bestätigt | |
| Modellwahl an zwei vorab festgelegten Tests, nicht am Ergebnis | SAP 5.3; Analysebericht 4.2 (Ljung-Box p 0,398, Shapiro-Wilk p 0,141) | bestätigt | |
| Unabhängige Validierung, nachgerechnet, zweimal nachgeprüft, ohne kritischen Befund | Validierungsbericht, Nachtrag 1, Nachtrag 2 | bestätigt | Erstprüfung mit 3 Befunden „mittel“, nicht erwähnt (zulässig) |
| Jede Abweichung im Abweichungsprotokoll | Abweichungsprotokoll A1–A15 | bestätigt | |
| GitHub-Link Analyseordner | – | nicht prüfbar | vor `git push` 404 (bekannt) |
| Quelle [1]: Titel, Datum, URL | PM per Abruf erreichbar; Titel wörtlich | bestätigt | |
| Quelle [2]: Dokumentation, Abschnitt 3.3, URL | URL per Abruf erreichbar (PDF, ca. 2,4 MB); Abschnitt laut SAP 3.3 „Sensitivitätsanalyse unterschiedlicher Temperaturverläufe“, S. 13–15 | nicht prüfbar (Inhalt) | Link funktioniert; Inhalt ist ein Bild-PDF. Seitenangabe S. 13–15 optional ergänzen |
| Quelle [3]: DWD CDC, Monatswerte, abgerufen 23.11.2026, Datenschnitt März 2026, CC BY 4.0, URL | Verzeichnis per Abruf erreichbar (tm_01 bis tm_12, Stand 02.11.2026); Analysebericht Kopf; Nachtrag 1 V-4 (Lizenz vom validator verifiziert) | bestätigt | Die Winterdatei (S1) liegt in `seasonal/`. Wird im Artikel nicht genutzt, kein Fehler |
| Mehr erfahren: „Reichen 136 Terawattstunden? …“ | Substack-Abruf: Titel identisch, 14.09.2026 | bestätigt | |
| Mehr erfahren: „Gasspeicher bei 60 Prozent – was heißt das für den Winter?“ | Substack-Abruf: Titel identisch, 17.10.2026 | bestätigt | Kennzeichnung „Einordnung“ passt zum Untertitel des Artikels |
| Kanalzeile (Instagram, Facebook, WhatsApp, Über/Impressum) | CLAUDE.md, Tabelle „Kanäle“ | bestätigt | URLs identisch |

## Prüfung auf neue Inferenz

Maßstab: Der Artikel darf nur wiedergeben, was im Analysebericht und in den Ergebnisdateien steht. Die eigenen Ableitungen des Autors:

- „Seit 2013 war kein Januar bis März mehr so kalt“ und „zuletzt im Winter 1995/96“: aus den vorab festgelegten Jahreslisten (E1, S14) abgelesen. Keine neue Rechnung, **bestätigt.**
- „Platz 35“: steht im Bericht, **bestätigt** (Gleichstand, G3).
- „etwa einmal in 10 bis 210 Jahren“: Tabelle 2, **bestätigt.**
- „14 vorab festgelegte Gegenrechnungen, vier entfallen“: SAP 6, **bestätigt.**
- „Die meisten zwischen 2 % und 5 %“: neue Verdichtung, nur mit gerundeten Werten richtig (G2), **Abweichung, gering.**
- „Rechenwege ohne diese Annahme: 5 %“: verallgemeinert über den Bericht hinaus (G1), **Abweichung, gering.**
- Lesart des INES-Szenarios als Kalenderjahr mit Nov./Dez. 2010: wird als Quellenaussage dargestellt, ist aber eine ungeprüfte Einordnung (H1), **Abweichung, hoch.**
- „sehr kalter Dezember“, „jeder ordentlichen Risikorechnung“, „legitim“, „Seitdem wird viel … gesprochen“: Wertungen bzw. Zusätze ohne Beleg (G4 bis G6).

Ich habe keine neu berechnete Zahl gefunden. Alle Zahlenwerte und Rundungen entsprechen `ergebnisse.json`, `tabelle1_E1.csv` und `tabelle2_E2_sensitivitaeten.csv`.

## Auflagen des validators für den Artikel (Übersicht)

| Auflage | Ergebnis | Fundstelle |
|---|---|---|
| (a) 3 % nie ohne Spanne 0,5–10 % | weitgehend erfüllt | Bullet 3, Grafik 2, Absatz E2. Ausnahme: „5 % statt 3 %“ (G1) |
| (b) Spanne (Hauptmodell) und Rechenwege-Spannbreite 0,4–10 % nicht vermischt | erfüllt | Absatz „Über alle Rechenwege …“ |
| (c) SAP 8: INES als Verband der Speicherbetreiber, Kälteszenario üblich, kein Urteil über INES | erfüllt | Wortwahl zu stark (G4) |
| (d) alle Limitationen aus 7.2 sinngemäß | **nicht vollständig** | Nr. 7 fehlt (H1), Nr. 5 zum Teil (M2); Nr. 1–4 und 6 enthalten |
| (e) Offenlegung S9b (2010 zählt mit, ohne 2010 7 %) | erfüllt | Post-hoc-Charakter fehlt (M3) |

## Nicht geprüft

- Wortlaut der INES-Dokumentation und der Präsentation (Bild-PDF, kein Werkzeug für OCR oder Rendering). Die Aussagen dazu sind nur gegen SAP 3.3 abgeglichen.
- GitHub-Link (vor Push 404, bekannt).
- Ob die später in `assets/` kopierten Grafiken bitidentisch mit `output/` sind (Ordner existiert noch nicht).
- Die Wortzahl ist grob ausgezählt, nicht maschinell.
- Es wurde kein Freigabevermerk geschrieben und der Artikel nicht verändert.
