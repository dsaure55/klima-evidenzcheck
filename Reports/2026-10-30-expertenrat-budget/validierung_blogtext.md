# Validierung Blogtext (Gate Stufe Evidenzcheck): Klimabudget bis 2030

**Geprüfter Text:** `Reports/2026-10-30-expertenrat-budget/kanal-entwuerfe/substack.md` (Entwurf, unversioniert, Stand 30.10.2026)
**Grundlage:** `Analysen/2026-08-expertenrat-budgetabgleich/`: Analysebericht Fassung 5b (Commit aacfb9d; die Freigabe durch Daniel Saure gilt für Fassung 5a, 5b ist reine Dokumentation, Nachtrag 6 = 0 kritisch), `output/estimand1_tabelle.csv`, `output/estimand2_tabelle.csv`, `output/diagnostik_tabelle.csv`, `output/datenabgleich_basiszeitreihe.csv`, SAP v1.1, Erratum 1, Validierungsbericht bis Nachtrag 6, `rohdaten/expertenrat/bericht.txt`, `rohdaten/agora/pm_deutschland-droht.html`; UBA-Hintergrundpapier `Reports/2026-10-28-klimaziel-2026/quellen/UBA.txt`.
**Prüfer:** validator-Subagent (KI, getrennte Rolle), 30.10.2026. Der Blogtext wurde nicht verändert.

**Eigene Nachrechnung (R 4.6.1, aus `datenabgleich_basiszeitreihe.csv`):** OLS-Fortschreibung A startet 2026 bei 689,72 Mt (Sprung +40,89 Mt gegenüber 648,83), Residuum 2025 = -55,44 Mt; Overshoot A/B/C = 584,19 / 25,03 / 138,75 Mt; CAGR aus gefitteten Werten A -1,543 %, B -3,641 %; Rate H1 = -7/334 = -2,096 %; Kum. Ist 2021-2025 = 3480,08 Mt. Alles identisch mit CSV und Bericht. Zusatz: Würde die A-Gerade mit gleicher Steigung am beobachteten Wert 2025 ansetzen, läge der Overshoot bei rund 307 Mt; der Niveaueffekt macht also rund 277 der 584 Mt aus (knapp die Hälfte).

## Gesamturteil: **mit Auflagen**

Alle Zahlen der Tabelle und der Kernaussagen stimmen mit den CSV-Dateien überein (Rundung, Vorzeichen, Bereichsgrenzen, Zuordnung). Anhang A kommt nicht vor, Post-hoc-Ergebnisse stehen nicht in der Kernaussage. Es gibt aber eine falsche Sachaussage zum Methodenvergleich (A3), eine nicht belegte Zuschreibung an den Expertenrat (A4), eine Wertung, die über die Analyse hinausgeht (A5), und zwei Veröffentlichungsvoraussetzungen, die derzeit nicht erfüllt sind (A1, A2).

**A1 und A2 sind blockierend:** Wird der Text vor ihrer Erfüllung veröffentlicht, enthält er eine derzeit falsche Aussage ("inzwischen korrigiert") bzw. Links auf einen veralteten Repository-Stand. Das wäre als "kritisch" zu werten.

## Ampel je Prüfpunkt

| # | Prüfpunkt | Ampel |
|---|---|---|
| 1 | Zahlen gegen CSV/Bericht/Quellen | bestanden (Kleinigkeiten A9, A10) |
| 2 | Überinterpretation | Abweichung (A3, A5, A6, A7) |
| 3 | Methodenbeschreibung | Abweichung (A1, A8, A11) |
| 4 | 3,8 vs. 4,5 / Fußnote 27 | Abweichung (A4) |
| 5 | Projektionsdaten, Expertenrat 50/50-Pfad | bestanden (Formulierung A10) |
| 6 | Halbjahr 327 / -2,1 % / -1,5 / -3,6 % | Abweichung, gering (A9) |
| 7 | Anhang A / Post-hoc | bestanden |
| 8 | Grafik und Bildunterschrift | Abweichung (A12) |
| - | Veröffentlichungsvoraussetzungen | blockierend offen (A1, A2) |

## Einzelbefunde

### 1. Zahlen (bestanden)
- Tabelle, alle neun Zeilen: Punktwerte 584 / 584 / 266 / 25 / 25 / 151 / 139 / 139 / 525 und Bereiche 39 bis 1129, 429 bis 737, -133 bis 665, -203 bis 253, -159 bis 201, -343 bis 644, -430 bis 708, -116 bis 502, -54 bis 1104 entsprechen `estimand2_tabelle.csv` (Spalten `Overshoot_eigen`, `Overshoot_Intervall_unten/oben`), korrekt auf ganze Mt gerundet, Zuordnung Fenster/Methode richtig. Ganze Mt weichen vom SAP-Reporting (eine Nachkommastelle) ab; für einen Blogtext vertretbar, die Bootstrap-Grenzen stehen auch im Bericht in ganzen Mt.
- "zwischen 25 und 584", "keiner im Korridor 60 bis 100": korrekt (auch die C-Werte 139 und 525 liegen außerhalb).
- "8 von 9 Bereichen schließen den Korridor ein, nur A-Bootstrap liegt ganz darüber": korrekt (Spalte `Intervall_deckt_Korridor`).
- "In den beiden Hauptfenstern reichen vier von sechs Bereichen bis unter null": korrekt (A-ARIMA, B dreimal). "Viele reichen zugleich bis unter null" (Kurzüberblick): korrekt, insgesamt 7 von 9.
- 6199, 6194, 4,5, 60 bis 100, 3480, 689,7, 648,8, "rund 41": korrekt.
- 3,8 Mt: steht im UBA-Hintergrundpapier vom 14.03.2026 (`UBA.txt`, Zeilen 30-32 und 62-63), korrekt zitiert.

### 2. Überinterpretation
- "Acht der neun ... / vier von sechs ...": gedeckt (Bericht, Kernaussage 2 und Abschnitt 2.2). Die Zählung mischt Parameter- und Prognosebereiche; der Text sagt das erst im Absatz danach (A11).
- "Damit kann eine reine Trendrechnung nicht entscheiden ...": gedeckt ("Die Analyse erlaubt keine belastbare Aussage ...").
- Modellartefakt: im Kern gedeckt ("Ein großer Teil des A-Overshoots geht auf diesen Niveausprung zurück"); nachgerechnet rund 277 von 584 Mt. "zuletzt schneller gesunken, als eine gerade Linie über 36 Jahre abbilden kann": gedeckt (umgekehrtes U im Residuenplot, Residuum 2025 -55,4 Mt). "Diese Lücke zählt in jedem der fünf Jahre mit" ist vereinfacht (A7).
- "Die Bereiche dort unterschätzen die Unsicherheit eher": gedeckt (Bericht 2.1: Intervalle, insbesondere Parameterintervalle, unterschätzen die Modellunsicherheit). Es fehlt, dass die Newey-West-Korrektur tatsächlich angewendet wurde (A8).
- "Mit elf oder sechs Jahreswerten werden die Bereiche zwangsläufig breit": nicht gedeckt (A6).
- "Die zweite Art ist breiter": für Fenster A sachlich falsch (A3).
- "Die Lücke, um die gestritten wird, ist klein im Vergleich zur Unsicherheit" und "Für politische Entscheidungen heißt das ...": gehen zu weit (A5).

### 3. Methodenbeschreibung
- "eingefroren 29.08." ist belegt (SAP-Kopf, Commit d9215cb, Bestätigung Daniel Saure 23.10.2026). "bevor wir die Daten zum Halbjahr und den Bericht des Expertenrats ausgewertet haben" ist wörtlich richtig, lässt aber weg, dass die Schlagzeilenzahlen (60 bis 100 Mt, ca. 2 Prozent im Halbjahr, 625) beim Schreiben des Plans bekannt und Anlass der Analyse waren (SAP Abschnitt 0, Update 29.08.2026). Die Agora-Pressemitteilung erschien am 28.08., einen Tag vor dem Einfrieren (A11).
- Erratum-Absatz: korrekt (Erratum Abschnitte 0, 2 und 6; nach dem ersten Lauf vom 23.10. geschrieben; keine Änderung von Fragestellung und Methoden; technische Details während der Auswertung festgelegt). Die 625 wird nur als Planfehler genannt, ohne Anhang-A-Zahlen.
- "Unabhängige Prüfung fand einen Rechenfehler in den ARIMA-Bereichen, behoben, erneut geprüft": korrekt (Befund K1; Nachträge 1 bis 6).
- "Trendgerade mit klassischem Unsicherheitsbereich": für Fenster A falsch, dort Newey-West (A8).
- Bootstrap-Erklärung "die Streuung der Daten wird vielfach neu durchgemischt": stark vereinfacht (A8).
- Parameter- vs. Prognosebereich: Bedeutung korrekt beschrieben, Breitenvergleich falsch (A3).
- "Diese Analyse [27.08.] war explorativ ...": belegt (SAP 2040, Version 1.0 "retrospektiv erstellt"). "Den Artikel dazu haben wir inzwischen korrigiert": derzeit falsch (A1).

### 4. 3,8 vs. 4,5 und Fußnote 27
Wortlaut Fußnote 27 (`bericht.txt` Z. 2775-2778, gleichlautend unter der Abbildung Z. 737-740): "Die durch den Expertenrat berechneten **sektoralen** Über- und Unterschreitungen bis 2030 weichen von den Werten des Umweltbundesamtes in **UBA (2026p)** ab. Das liegt darin begründet, dass das Umweltbundesamt bei der Anwendung des Ausgleichsmechanismus nicht die aktuellen Daten verwendet, sondern nur bis zum ersten Inventarbericht die Daten für die Berechnung mit einbezieht."
- Die Fußnote hängt am Puffer 4,5 Mt (Rz. 99), bezieht sich aber ausdrücklich auf **sektorale** Werte und auf **UBA (2026p), "Treibhausgas-Projektionen 2026 - Ergebnisse kompakt"** (Literaturverzeichnis Z. 11826), **nicht** auf das im Blog als [4] zitierte Hintergrundpapier vom 14.03.2026. Die Zahl 3,8 kommt im Expertenratsbericht nicht vor.
- Dass die 3,8 Mt aus demselben Grund abweichen, ist plausibel (das Hintergrundpapier rechnet ab 2026 mit "rechnerisch angepassten Jahresemissionsgesamtmengen nach Anlage 2a in Verbindung mit § 4 Absatz 2 KSG"), aber eine eigene Schlussfolgerung. "Den Unterschied erklärt der Expertenrat damit" schreibt dem Expertenrat eine Aussage zu, die er so nicht macht. Die freigegebene Gliederung verlangt hier: "nur, was die Quellen sagen; Ursache nicht vermuten".
- "älterer Datenstand" ist als Laienübersetzung von "nicht die aktuellen Daten ..., sondern nur bis zum ersten Inventarbericht" vertretbar.

### 5. Projektionsdaten und Expertenrat
- "mit den beschlossenen Maßnahmen": gedeckt (Mit-Maßnahmen-Szenario; UBA: "klimapolitische Beschlüsse mit Stand November 2025").
- "Summe 6194, Puffer 4,5, so rechnet es der Expertenrat": gedeckt (Rz. 99 und Zusammenfassung: 6 194 Mt, Puffer 4,5 Mt, 0,07 %). Leser rechnen 6199 - 6194 = 5 (A10).
- 50/50-Pfad in "Worum es geht": korrekt wiedergegeben. "hält sie für zu optimistisch": gedeckt ("unterschätzen").
- Einleitung "hält ... eine Überschreitung um etwa 60 bis 100 Mt für wahrscheinlicher": unscharf, wahrscheinlicher als was? (A10).

### 6. Halbjahr
- 327 Mt, Rückgang 7 Mt, Haupttreiber Energiepreiskrise: korrekt (Agora-PM 28.08.2026). -2,1 % = 7/334 korrekt abgeleitet (Agora selbst: "zwei Prozent"; im Teaser "um bis zu 7 Millionen Tonnen").
- -1,5 % und -3,6 % sind korrekt, beruhen aber auf **gefitteten** Werten (1213,5 auf 704,3 bzw. 919,0 auf 634,2 Mt). Aus beobachteten Werten ergäben sich -1,86 % und -3,20 % (Bericht, Fußnote Estimand 1). Der Blog sagt nicht, dass es das Tempo der Trendgeraden ist; wer aus den UBA-Daten nachrechnet, findet andere Zahlen (A9). Die Einordnung "näher an A" ändert sich dadurch nicht.
- "einzelner, vorläufiger Wert und kein Test", "sagt nichts darüber, wo die Summe bis 2030 landet": gedeckt.

### 7. Anhang A / Post-hoc (bestanden)
Keine Zahl aus Anhang A (546,1, -53,0 usw.), kein Post-hoc-Prognoseintervall aus 2.4, keine Bootstrap-Sensitivität, keine "näher an"-Zuordnung (RF-6). Die 625 erscheint nur als Beschreibung des Planfehlers.

### 8. Grafik
`assets/estimand2_overshoot.png` ist bytegleich mit `output/estimand2_overshoot.png` (SHA-256 9028df7b...). Die Bildunterschrift ist inhaltlich richtig (Punkte, Balken, Korridor rot hinterlegt, 4,5 praktisch auf der Nulllinie). Die Grafik ist aber eine Analysegrafik: Titel "Estimand 2 ... Overshoot", Achse mit "ggue." und "Aeq.", Untertitel mit "ueber", Zeilen "Fenster A | analytisch-parametrisch" und "Moving-Block-Bootstrap", Legende "Bundesregierung" statt "Projektionsdaten". Die Bildunterschrift erklärt weder Fenster A/B/C = Langfrist / 10 Jahre / kurz noch die zwei Farben (grün = Bereich des Trends, blau = ARIMA-Bereich der tatsächlichen Summe), A12.

## Auflagen

**A1 (blockierend, Veröffentlichungsvoraussetzung).** Der Text sagt "Den Artikel dazu haben wir inzwischen korrigiert [5]"; Quelle [5] enthält noch den Platzhalter "korrigiert am [Datum]". Abruf am 30.10.2026: Der Artikel https://klimaevidenzcheck.substack.com/p/erreicht-deutschland-sein-klimaziel ist online, ein Korrekturhinweis (explorativ) ist darin nicht zu finden; `Reports/2026-08-27-klimaziel-2040/korrektur_entwurf.md` ist ein Entwurf. Vorschlag: Erst die Korrektur veröffentlichen, dann das Datum in [5] eintragen und den Link erneut öffnen. Andernfalls den Satz ändern ("Eine Korrektur des Artikels folgt").

**A2 (blockierend, Veröffentlichungsvoraussetzung).** Die Links [6] und "Repository" zeigen auf GitHub `main`. Der lokale Stand ist 20 Commits vor `origin/main`; auf GitHub fehlen u. a. `Freigabe_Analyse_Daniel_Saure_2026-10-30.md`, Fassung 5b und Nachtrag 6, auf die sich der Text beruft ("Analysebericht (Fassung 5b)", "danach wurde erneut geprüft"). Vorschlag: vor Veröffentlichung pushen und die Links prüfen; die in der Freigabedatei angekündigte Ergänzung zu 5b nachtragen.

**A3 (mittel, Sachfehler).** "Die zweite Art [ARIMA] ist breiter" stimmt nicht allgemein: In Fenster A ist der Bereich der Trendgeraden (39 bis 1129, Breite 1091) **breiter** als der ARIMA-Bereich (-133 bis 665, Breite 798), wegen der Newey-West-Korrektur. In C sind beide etwa gleich breit (1138 vs. 1158). Nur in B ist ARIMA deutlich breiter. Vorschlag: "Die zweite Art enthält mehr Unsicherheit und ist deshalb meist breiter. Im Langfrist-Fenster ist der Bereich der Trendgeraden trotzdem breiter, weil dort für die Autokorrelation korrigiert wurde. Beide Arten lassen sich nicht direkt vergleichen."

**A4 (mittel, Quellenzuschreibung).** "Den Unterschied erklärt der Expertenrat damit, dass das Umweltbundesamt den Ausgleich zwischen den Jahren mit einem älteren Datenstand berechnet [2]" ist durch Fußnote 27 nicht gedeckt (betrifft sektorale Werte in UBA 2026p, nennt 3,8 nicht). Vorschlag: "Der Expertenrat weist darauf hin, dass seine Werte von denen des Umweltbundesamts abweichen, weil das Umweltbundesamt beim Ausgleich zwischen den Jahren nicht die aktuellsten Daten verwendet [2]. Ob das den Unterschied zwischen 3,8 und 4,5 vollständig erklärt, sagen die Quellen nicht." Alternative ohne Erklärung: "Die beiden Werte stammen aus unterschiedlichen Berechnungen; beide bedeuten: ..."

**A5 (mittel, Wertung über die Analyse hinaus).** (a) "Die Lücke, um die gestritten wird, ist klein im Vergleich zur Unsicherheit" ist nur gegenüber der Unsicherheit **einer reinen Trendrechnung** gedeckt; über die Unsicherheit der Projektionsdaten oder der Expertenrat-Schätzung sagt die Analyse nichts. Zudem bleibt offen, welche Lücke gemeint ist. Vorschlag: "Der Abstand zwischen den beiden offiziellen Einschätzungen (rund 65 bis 105 Millionen Tonnen) ist klein im Vergleich zur Unsicherheit einer reinen Trendrechnung." (b) "Für politische Entscheidungen heißt das: Das Budget ist so eng ..." ist eine politische Folgerung (Bericht, Limitationen: "keine politische Bewertung") und folgt nicht aus der eigenen Rechnung, sondern aus dem Puffer der Projektionsdaten. Vorschlag mit Quelle: "Nach den Projektionsdaten bleibt ein Puffer von 4,5 Millionen Tonnen, rund 0,07 Prozent des Budgets [2]. Das Umweltbundesamt nennt die knappe Einhaltung selbst nicht richtungssicher [4]." (c) "Wer eine einzelne Zahl für 2030 nennt": gemeint ist die Summe 2021 bis 2030; präzisieren.

**A6 (mittel).** "Die kürzeren Fenster haben ein anderes Problem: Mit elf oder sechs Jahreswerten werden die Bereiche zwangsläufig breit." Nicht gedeckt: Die Trendbereiche in B (-203 bis 253, -159 bis 201) sind schmaler als in A. Der Bericht nennt als Problem der kurzen Fenster die geringe Teststärke (Autokorrelation bei n = 11 bzw. 6 kaum nachweisbar, ACF Lag 2 in B auffällig) und den wenig aussagekräftigen Block-Bootstrap; die Bereiche können dort ebenfalls zu schmal sein. Vorschlag: "Die kürzeren Fenster haben ein anderes Problem: Mit elf oder sechs Jahreswerten lässt sich kaum prüfen, ob die Annahmen stimmen. Auch dort können die Bereiche zu schmal sein."

**A7 (gering).** "Die Trendgerade startet 2026 bei 689,7, rund 41 mehr als 2025 ... Diese Lücke zählt in jedem der fünf Jahre bis 2030 mit." Vereinfachung: Der Abstand der Geraden zum beobachteten Wert beträgt schon 2025 rund 55 Mt (Residuum) und bleibt bei gleicher Steigung in jedem Jahr gleich; die 41 Mt enthalten bereits einen Jahresschritt der Geraden. Nachgerechnet macht der Niveaueffekt rund 277 der 584 Mt aus. Vorschlag: "Schon 2025 liegt die Gerade 55 Millionen Tonnen über dem tatsächlichen Wert. Dieser Abstand zählt in jedem der fünf Jahre bis 2030 mit, zusammen fast die Hälfte der 584." Oder den Mechanismus-Satz weglassen; "zum großen Teil" bleibt gedeckt.

**A8 (mittel, Methodenbeschreibung).** "eine Trendgerade mit klassischem Unsicherheitsbereich" ist für das Langfrist-Fenster falsch: Dort wurde wegen signifikanter Autokorrelation (Durbin-Watson 0,65) nach SAP die Newey-West-Korrektur tatsächlich angewendet (Standardfehler der Summe rund viermal so groß wie bei OLS). Im Abschnitt "Warum die Spanne so breit ist" fehlt das ebenfalls; so entsteht der Eindruck, die Autokorrelation sei nur festgestellt worden. Vorschlag: "eine Trendgerade mit rechnerischem Unsicherheitsbereich (im Langfrist-Fenster mit Korrektur für die Autokorrelation)" und im Abschnitt "Warum ...": "Wir haben dafür korrigiert, trotzdem unterschätzen die Bereiche dort die Unsicherheit eher." Bootstrap präziser: "dabei werden die Abweichungen von der Geraden in kurzen Blöcken vielfach neu zusammengesetzt und die Gerade jedes Mal neu berechnet".

**A9 (gering).** Halbjahr: klarstellen, dass -1,5 % und -3,6 % das Tempo der **Trendgeraden** sind, z. B. "näher am Tempo der Langfrist-Geraden (1,5 Prozent weniger pro Jahr) als an dem der 10-Jahres-Geraden (3,6 Prozent)". Beim Halbjahreswert die Agora-Angabe nennen: "rund 7 Millionen Tonnen oder 2 Prozent weniger (genau gerechnet 2,1 Prozent)". Im Kurzüberblick "passt eher zum" durch "liegt näher am" ersetzen.

**A10 (gering).** (a) Einleitung: "hält ... für wahrscheinlicher" ersetzen durch "geht dagegen von einer Überschreitung um etwa 60 bis 100 Millionen Tonnen aus [2]" (Wortlaut Expertenrat: "geht ... von einer Zielverfehlung aus"). (b) "rund 6194" oder "6194,5" schreiben, sonst rechnen Leser einen Puffer von 5. (c) "Ob das reicht" ist missverständlich; besser "Ob Deutschland das einhält".

**A11 (mittel, Offenheit der Präregistrierung).** Nach "... ausgewertet haben" ergänzen: "Die Schlagzeilen-Zahlen (60 bis 100 Millionen Tonnen, rund 2 Prozent im Halbjahr) kannten wir aus der Presse; sie waren der Anlass der Analyse." Außerdem die Zählung "acht der neun" erst nach dem Absatz über die zwei Arten von Bereichen bringen oder dort "Bereiche unterschiedlicher Art" einfügen.

**A12 (mittel, Grafik).** Bildunterschrift ergänzen: "Fenster A = Langfrist (1990-2025), B = 10 Jahre (2015-2025), C = kurz (2020-2025, nur beschreibend). Grün: Bereich des Trends (Trendgerade, Bootstrap); blau: Bereich der tatsächlichen Summe (ARIMA). ‚Bundesregierung‘ in der Grafik = Projektionsdaten 2026." Besser: eine Lesefassung der Grafik (Umlaute, ohne "Estimand" und "Overshoot", Beschriftungen wie in der Tabelle). Sie darf nur das Layout ändern und muss gegen die CSV nachgeprüft werden.

**Empfehlungen (keine Auflage).** (a) "Eine unabhängige Prüfung" um "(ein getrennter KI-Prüfschritt, siehe Über-Bereich)" ergänzen, wie im Jahrbuch-Kapitel "So prüfen wir" beschrieben. (b) "am Mittwoch erklärt" nur bei Veröffentlichung in dieser Woche; sonst "am 28. Oktober".

## Was nicht beanstandet wird
"Was diese Analyse nicht sagt" und "Grenzen" geben die Limitationen des Berichts im Wesentlichen wieder (Annahmen in A verletzt, Agora vorläufig, Puffer nur aus Sekundärquellen, nicht versionierte Rohdatei mit Prüfsumme). Nicht genannt ist die Abhängigkeit der Bereiche von technischen Festlegungen (Blocklänge, HAC-Voreinstellungen); für einen Blogtext vertretbar, wenn A6 und A8 umgesetzt werden. Quellen [1] bis [4], [7], [8] passen zum Inhalt; Link [3] (Titel und Aussage zum Nachsteuern an der Summe bis 2030) am 30.10.2026 geöffnet und geprüft.

## Nachprüfung
Nach Umsetzung der Auflagen ist eine fokussierte Nachprüfung als Nachtrag in dieser Datei festzuhalten (CLAUDE.md, Dokumentationspflicht). Danach Freigabe des Blogtexts durch Daniel Saure nach Volltextlektüre.
