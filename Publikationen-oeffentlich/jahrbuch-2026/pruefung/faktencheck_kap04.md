# Faktencheck Kapitel 4 (Jahrbuch 2026): „Schafft Deutschland sein Klimaziel?“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/04-klimaziel.md` (Entwurf v0.1, 24.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 80 ist nicht Buchtext).
**Geprüfte Grafiken:** `grafiken/kap04_grafik1_trend2040.png`, `grafiken/kap04_grafik2_budget_overshoot.png` (als Bilder gelesen und gegen die Tabellen verglichen).
**Prüfdatum:** 24.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md`: Differenzprüfung gegen die Ursprungsquellen; Regel: keine neue Berechnung, keine neue Inferenz, der Stil darf nichts verändern, verstärken oder abschwächen. Das Kapitel enthält zwei Evidenzcheck-Ergebnisse (THG-Trend 2040: veröffentlicht, Substack 27.08.2026; Expertenrat-Budgetabgleich: **nicht veröffentlicht, nicht freigegeben**) und einen Stand-Absatz zum Prognose-Check. Für den Expertenrat-Abschnitt gilt zusätzlich das Gate der Stufe Evidenzcheck (Validierungsbericht ohne „kritisch“ plus Freigabe Daniel Saure). Die Freigabe ist Sache von Daniel Saure und wird hier nicht vermerkt.

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| Artikel „Erreicht Deutschland sein Klimaziel 2040? …“, Referenzfassung `quellen-artikel/2026-08-27_erreicht-deutschland-sein-klimaziel.html` (Abruf 22.10.2026, post_date 2026-08-27T16:53Z) | gelesen (vollständig) | Abgleich vollständig. Der Artikel nennt nur „Bereich 407–598 Mt“ und „16–328 Mt“, keine weiteren Intervalle. |
| `Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md` (v1.0) und `DE-Emissionen-Trendprojektion-2040.R` | gelesen (vollständig) | Reihe 1990–2025 (36 Werte) im Skript fest eingetragen; Fenster A/B/C; Hauptverfahren OLS-Prognoseintervall (SAP 5.4), ARIMA als Sensitivität. **Im Ordner liegt kein `run_log.txt` und kein Validierungsbericht unter den erwarteten Namen** (siehe Nr. 60–62). |
| Konsolenwerte des Rechenlaufs vom 24.10.2026 (OLS A 486,0 [406,6; 565,5], ARIMA A 389,9 [181,5; 598,3]; OLS B 207,0 [86,3; 327,8], ARIMA B 274,2 [16,4; 532,1]) | **nur aus dem Prüfauftrag**, nicht als Datei im Repo | Eigene Gegenrechnung ohne R (Abschn. 2.3): B-OLS vollständig von Hand reproduziert; A-OLS und beide ARIMA-Intervalle über Werte aus dem Analysebericht (σ̂ = 34,3; σ² = 753,7 bzw. 1153,6) reproduziert. Alle vier Intervalle stimmen. Ein Lauf-Protokoll als Datei fehlt (A10). |
| `Analysen/2026-08-expertenrat-budgetabgleich/Analysebericht_Expertenrat-Budgetabgleich.md` (Fassung 4, 24.10.2026) | gelesen (vollständig) | Alle Zahlen des Abschnitts „Wie weit sind wir bis 2030?“ einzeln abgeglichen. |
| `output/estimand1_tabelle.csv`, `output/estimand2_tabelle.csv` | gelesen | Zahlen stimmen mit dem Bericht und dem Kapitel überein (Details in Abschn. 2.4). |
| `Validierungsbericht_expertenrat-budgetabgleich.md` inkl. Nachtrag 1, 2, **3** (Commit 4e7974e, 24.10.2026) | gelesen (Gesamtbericht) | Nachtrag 3 (Fassung 4): freigabefähig mit Auflagen, 0 kritisch, 0 wesentlich, 2 gering (N4.1 beschädigter Absatz Bericht 2.4, N4.2 Restwidersprüche/Statuszeile). |
| `Analysen/2026-10-prognose-check-projektionsberichte/SAP_prognose-check-projektionsberichte.md` (Kopf) und `run_log.txt` | gelesen (Kopf; Run-Log bis Z. 227) | SAP v1.1 final, eingefroren 22.10.2026; Run-Log: Lauf 01_integritaet.R am 22.10.2026, STOPP nach SAP 3.5.5, keine Fehlermaße berechnet. |
| `.git/logs/HEAD` (Reflog, als Textdatei gelesen) | gelesen | Commit ef3d8d9 = Initial-Commit vom 27.08.2026 mit dem zitierten Wortlaut; Commit 4e7974e (Nachtrag 3) liegt unmittelbar vor efe06db (Entwurf Kapitel 4). |
| Klimaschutzgesetz § 3 Abs. 1 Nr. 2 (gesetze-im-internet.de, WebFetch 24.10.2026) | gelesen | Wortlaut „bis zum Jahr 2040 um mindestens 88 Prozent“. |
| Agora Energiewende, Halbjahresbilanz 2026 (Pressemitteilung 28.08.2026) | nur Websuche (Sekundärberichte: evangelisch.de, ms-aktuell.de: „rund 327 Mio. t, rund 7 Mio. t weniger“); Primärseite nicht geöffnet | 327 und „7 Mt weniger“ stimmen mit dem Analysebericht und der Validierung überein (Validierung: Quellenzahlen stehen in den Primärquellen). |
| Expertenrat-Prüfbericht (rohdaten/expertenrat/bericht.txt) | nicht selbst geöffnet; über Analysebericht Abschn. 0 und Validierungsbericht (Quellenzahlen 6199, 6194,5, 4,5, 60–100 „stehen so in den Primärquellen“) | Werte über die Validierung belegt. |
| Git-Verzeichnisinhalt von `Analysen/2026-08-emissionen/` | **nicht auflistbar** (kein Listing-Werkzeug in dieser Umgebung) | Aussagen zu „liegt nicht im Repo“ nur über Zugriffsversuche auf die erwarteten Dateinamen. |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen (Abschn. 4), E-Nummern auf die Empfehlungen (Abschn. 5).

### 2.1 Kopfzeile und „Kurz gesagt“ (Z. 2 und 4)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „THG-Trend 2040: veröffentlicht (27.08.2026)“ | Referenzfassung, post_date | bestätigt | |
| 2 | Der Artikel nennt „407–598“ und „16–328“ | Referenzfassung (Abschnitt „Die Kernzahl“) | bestätigt | Wörtlich so im Artikel. |
| 3 | „Validierung Nachtrag 1 und 2 vorhanden, Nachtrag 3 (Fassung 4) bei Abfassung noch offen“ | Validierungsbericht Nachtrag 3; Reflog (4e7974e, 24.10.2026) | Abweichung | Stand überholt: Nachtrag 3 liegt vor (freigabefähig mit Auflagen, 0 kritisch, 2 gering). Er wurde direkt vor dem Entwurf von Kapitel 4 eingecheckt. Der Kopf des Analyseberichts sagt noch „Fassung 4 noch nicht erneut geprüft“ (laut Nachtrag 3, N4.2 b, offen). A3. |
| 4 | „Ergebnisse nicht von Daniel Saure freigegeben, nicht veröffentlicht“; Abschnitt darf erst bleiben bei Freigabe und Validierungsbericht ohne „kritisch“; Deadline 13.11.2026, sonst Plan B | Analysebericht (Status: „keine Freigabe der Analyse, keine Veröffentlichung“); CLAUDE.md (Gate Evidenzcheck); Reflog (Commit f891c39 „Deadline 13.11.“) | bestätigt | Gate-Stand korrekt beschrieben, abgesehen von Nr. 3. |
| 5 | „(3) Prognose-Check: nur Stand und Methode, kein Ergebnis“ | `run_log.txt` Abschn. 5 | bestätigt | Stand des Run-Logs: 22.10.2026, 19:23. Spätere Läufe sind aus der Datei nicht ersichtlich. |
| 6 | „… um 88 Prozent gegenüber 1990 zu senken, das sind 150 Millionen Tonnen“ | KSG § 3 Abs. 1 Nr. 2; Skript (1252,94 × 0,12 = 150,4) | Abweichung (gering) | Gesetz: „um mindestens 88 Prozent“. „Mindestens“ fehlt; 150 ist gerundet, der Zielwert ist 150,4 Mt als Obergrenze (Grafik 1 nennt 150,4). A8. |
| 7 | „Schreibt man den Trend seit 1990 fort, wird das Ziel klar verfehlt.“ | Artikel („Ziel nicht erreichbar“); Konsole/Handrechnung: alle A-Intervalle liegen über 181 Mt | Abweichung (gering) | Zahlen tragen die Aussage. Aber: Im Fenster A ist die Autokorrelation signifikant (DW 0,648, p = 3,8e-07) und die Linearität verletzt (Analysebericht 2.1); der SAP selbst nennt das OLS-Intervall bei Autokorrelation „tendenziell zu eng“ (SAP 5.4). Davon steht im Kapitel nichts. A5. |
| 8 | „Schreibt man nur die letzten zehn Jahre fort, liegt das Ziel noch im Unsicherheitsbereich.“ | Artikel; Intervalle B | bestätigt | Beide B-Intervalle enthalten 150,4. |
| 9 | „Beides ist keine Prognose.“ | Artikel („keine Prognose“) | bestätigt | |
| 10 | „Ob Deutschland sein Budget bis 2030 einhält, kann unsere Rechnung nicht entscheiden.“ | Analysebericht Kernaussage 2 („keine belastbare Aussage“) | bestätigt | |

### 2.2 „Wo wir stehen“ (Z. 8)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 11 | „Emissionen 2025 laut UBA rund 649 Mt CO₂-Äquivalent“ | Skript (648,83); Analysebericht Abschn. 0 (Reihe stimmt mit klimadashboard-Tabelle auf 0,0000 Mt überein; Expertenrat nennt 648,9) | bestätigt | Der SAP führt 2024/2025 als „vorläufig“. Das Kapitel sagt das nicht (E7). |
| 12 | „rund 48 Prozent weniger als 1990 [1][2]“ | Artikel (−48 %); 648,83 / 1252,94 = 0,518 | bestätigt | −48,2 %. |
| 13 | „Klimadashboards zeigen meist zwei Zahlen nebeneinander“ | Artikel (wörtlich „meist“) | Abweichung (gering) | Häufigkeitsangabe ohne Beleg; übernommen aus dem Artikel. SAP 1 nennt klimadashboard.de nur beispielhaft. E2. |

### 2.3 „Zwei Zeitfenster, zwei Antworten“ (Z. 10–23) und Grafik 1

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 14 | „im Evidenzcheck vom 27. August nachgerechnet [1]“, „linear fortgeschrieben“ | Referenzfassung | bestätigt | |
| 15 | Langfrist 1990–2025: Fortschreibung „etwa 486 Mt“ | Konsole 486,0; Analysebericht Abschn. 0 („Reproduktion … 486,0“); Handrechnung (Mittel 958,885 + 32,5 × (−14,55) = 486,0) | bestätigt | |
| 16 | Intervall Langfrist „rund 407 bis 566 Mt“ | Konsole [406,6; 565,5]; Handrechnung: s = 34,3, t₀,₉₇₅(34) = 2,032, √(1 + 1/36 + 32,5²/3885) = 1,140 → ± 79,5 | bestätigt (Rundungsgrenze) | 565,5 wird auf 566 aufgerundet; der ungerundete Wert ist nicht dokumentiert (565,5 kann 565 oder 566 sein). Die Angabe „rund“ deckt das. E7. |
| 17 | „95-Prozent-Prognoseintervall (das ist der Bereich, in dem der Wert bei diesem Modell mit 95 Prozent Wahrscheinlichkeit läge)“ | Eigene Erklärung | Abweichung (gering) | Vereinfachende Lesart; im Fenster A gilt sie wegen der Autokorrelation nur eingeschränkt (Nr. 7). E1. |
| 18 | „Das Ziel von 150 liegt weit außerhalb.“ | Intervalle A | bestätigt | Untere Grenzen 406,6 (OLS) und 181,5 (ARIMA). |
| 19 | 10-Jahres: „etwa 207 Mt, Intervall rund 86 bis 328“; „Ziel liegt im Intervall, aber nicht in der Mitte“ | Konsole 207,0 [86,3; 327,8]; Handrechnung: Mittel 776,624, Steigung −28,479, Fit 207,04; s = 24,55, t(9) = 2,262, Faktor 2,174 → ± 120,7 → [86,3; 327,8] | bestätigt | Vollständig von Hand reproduziert. |
| 20 | ARIMA: „390 Mt (Intervall 182 bis 598)“ Langfrist, „274 Mt (Intervall 16 bis 532)“ 10-Jahres | Konsole 389,9 [181,5; 598,3] / 274,2 [16,4; 532,1]; Plausibilität: ARIMA(0,1,0) mit Drift, Mittel = 648,83 + 15 × Drift (−17,26 bzw. −24,97), Halbbreite 1,96 × √(15 σ²) mit σ² 753,7 bzw. 1153,6 (Analysebericht 2.3, gleiche Daten/Fenster) → [181,5; 598,3] / [16,4; 532,1] | bestätigt | Die ARIMA-Ordnung des 2040-Laufs steht nicht in einer Datei im Repo; die Übereinstimmung der Werte macht (0,1,0) mit Drift sehr wahrscheinlich. 181,5 → 182 ist knapp (181,52). |
| 21 | ARIMA „berücksichtigt, dass aufeinanderfolgende Jahre nicht unabhängig voneinander sind“ | Analysebericht 2.3: `auto.arima` wählt in allen Fenstern ein Random-Walk-Modell (0,1,0), in A und B mit Drift; SAP 5.4 („autokorrelationsrobuste Alternative“) | Abweichung (gering) | Für ein Random Walk mit Drift ist die Beschreibung ungenau: Das Modell nimmt unabhängige Jahreszuwächse an, die Unsicherheit wächst mit dem Horizont. Der Satz erklärt nicht, was das Verfahren tut. A6. |
| 22 | „Beim Langfrist-Trend liegt das Ziel außerhalb aller Intervalle, beim 10-Jahres-Trend innerhalb.“ | Intervalle (OLS und ARIMA) | bestätigt | 150,4 < 181,5; 16,4 ≤ 150,4 ≤ 532,1; 86,3 ≤ 150,4 ≤ 327,8. |
| 23 | „An der Aussage ändert das nichts.“ | Zahlen | bestätigt | |
| 24 | Grafik 1: Punkte 486 / 390 / 207 / 274, Intervallenden, Zielwert 150,4; Quellenzeile „Blau: OLS-Intervall (Hauptverfahren laut Analyseplan), grau: ARIMA (Kontrollrechnung)“ | Konsolenwerte; SAP 5.4 | bestätigt | Bild gelesen: Balkenenden bei ≈ 407/566, 182/598, 86/328, 16/532, Zielmarke bei 150. Titel „Dieselben Daten, zwei Zeitfenster, zwei Antworten“ deckt sich mit Kapitelaussage. Die Grafik zeigt wie der Text nur zwei Fenster (Nr. 25). |
| 25 | Nur zwei Zeitfenster (A: 1990–2025, B: 2015–2025) werden gezeigt | SAP 5.1, 7 (drei Fenster, „alle drei werden berichtet“; C = 2020–2025, rein deskriptiv); Analysebericht 2.2 (Fenster C ausgewiesen) | Abweichung (gering) | Fenster C fehlt im Kapitel und im Artikel. Das Kapitel nennt später „8 von 9 Intervallen über alle Fenster“, ohne dass C erklärt wäre (Nr. 41). A7. |
| 26 | „Welches Zeitfenster man wählt, entscheidet über die Schlagzeile … beides technisch korrekt … und irreführend, wenn man das andere verschweigt [1]“ | Artikel (wörtlich, „36-Jahres-Trend“ → „langer Trend“) | bestätigt | |
| 27 | „Was die Rechnung nicht ist“: keine Prognose, keine Annahmen über Politik, keine Bewertung | Artikel („Was das bedeutet – und was nicht“) | bestätigt | |

### 2.4 „Wie weit sind wir bis 2030? Der Expertenrat-Budgetabgleich“ (Z. 31–49) und Grafik 2

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 28 | Kennzeichnung „[VORLÄUFIG: … nicht freigegeben … nur im Buch, wenn Freigabe und Validierung bis zum 13.11.2026 vorliegen]“ | Analysebericht Status; Kopfzeile | bestätigt | Sauber gekennzeichnet (Absatz in Z. 33, Kopfzeile Z. 2, Bildquelle in Grafik 2). Aktualisierungsbedarf: Nr. 3. |
| 29 | „Das Klimaschutzgesetz erlaubt 2021 bis 2030 insgesamt 6.199 Mt (ohne Landnutzung)“ | Analysebericht Abschn. 0; Validierung (Anlage 2 KSG: 786+756+720+682+643+604+565+523+482+438 = 6199) | bestätigt | |
| 30 | „Der Expertenrat hat im Mai 2026 … geprüft“ | Analysebericht Quellentabelle (veröffentlicht 18.05.2026) | bestätigt | |
| 31 | „knapp unter dem Budget, Puffer 4,5 Mt (0,07 Prozent)“ | Analysebericht Abschn. 0 (6194,5 gegen 6199, −4,5, 0,07 %) | bestätigt | |
| 32 | „50/50-Pfad … etwa 60 bis 100 Millionen Tonnen über dem Budget“ | Analysebericht Abschn. 0 (60–100 Mt, 1,0–1,6 %) | bestätigt | |
| 33 | Erläuterung „bei dem Überschreiten und Unterschreiten gleich wahrscheinlich sind“ | – | nicht prüfbar | Die Erläuterung steht weder im Analysebericht noch in der Validierung; der Expertenrat-Text wurde nicht selbst geöffnet. A11. |
| 34 | „vorab einen Analyseplan festgelegt und eingefroren und beide Zeitfenster von oben benutzt [4]“ | SAP v1.1 (Commit d9215cb, 29.08.2026; Erratum 1 freigegeben, d20e448, 23.10.2026) | bestätigt | Der SAP nutzt A, B und C (C deskriptiv); „beide Zeitfenster“ ist verkürzt (Nr. 25). |
| 35 | Agora: „Emissionen im ersten Halbjahr 2026 auf 327 Mt“ | Analysebericht Abschn. 1; Websuche | bestätigt | Vorläufige Schätzung. |
| 36 | „rund 2,1 Prozent weniger als im ersten Halbjahr 2025“ (als Agora-Aussage) | Analysebericht Abschn. 1; `estimand1_tabelle.csv` | Abweichung | −2,1 % ist keine Agora-Zahl, sondern abgeleitet: 327 / 334 − 1 = −2,096 %, mit H1 2025 = 327 + 7 aus gerundeten Agora-Angaben. Agora nennt „−2 %“ (POST-HOC-Zeile der Tabelle). Das Kapitel schreibt die abgeleitete Zahl Agora zu. A2. |
| 37 | „näher an der mittleren Jahresrate des Langfrist-Trends (−1,5 %) als an der des 10-Jahres-Trends (−3,6 %)“ | Analysebericht Abschn. 1 (−1,543 / −3,641; d_A 0,6 pp, d_B 1,5 pp; robust gegen beide Toleranzen und die Rundungsspanne) | bestätigt | Die Raten sind aus gefitteten Werten berechnet (SAP-Definition); beobachtete Mittelraten wären −1,86 % und −3,20 % (Fußnote im Bericht), im Kapitel nicht genannt. |
| 38 | „Das ist ein Wert aus einer vorläufigen Schätzung und eine einzelne Beobachtung, kein Test.“ | Analysebericht Abschn. 1 („Deskriptiv, n = 1, kein Test“) | bestätigt | |
| 39 | Überschrift „Die Halbjahresdaten 2026 liegen näher am langen Trend.“ | Analysebericht Abschn. 0 und 1; Validierung G4 | Abweichung (gering) | Verallgemeinernd („Halbjahresdaten“ statt ein einzelner Halbjahreswert). Agora führt den Rückgang „größtenteils auf die gestiegenen fossilen Energiepreise infolge der Blockade der Straße von Hormus“ zurück; die Validierung (G4) verlangt dieses Quellenzitat, weil die H1-Rate „nicht gleichartig mit einer langjährigen mittleren Rate“ ist. Im Kapitel fehlt es. A2. |
| 40 | „geschätzte Überschreitung … zwischen plus 25 und plus 584 Mt“; „Kein Punktwert liegt im Korridor von 60 bis 100“ | `estimand2_tabelle.csv` (25,0; 584,2; 266,3; 150,6; zusätzlich C: 138,7; 525,2) | bestätigt | Spanne gilt für die Punktwerte der Fenster A und B. |
| 41 | „8 von 9 Intervallen über alle Fenster überdecken den Korridor“ | Analysebericht 2.2 (nur A-Bootstrap 429–737 nicht); csv `Intervall_deckt_Korridor` | bestätigt (mit Hinweis) | Die „9“ enthält die drei C-Zeilen (rein deskriptiv), im Kapitel unerklärt (Nr. 25). Parameter- und Prognoseintervalle sind nicht gleichartig (Bericht 2.2, Spaltenlesart); der Zähler mischt sie, wie auch der Bericht. A7. |
| 42 | „vier der sechs Intervalle der beiden Hauptfenster überdecken zugleich den Korridor und die Null“ | Analysebericht 2.2; csv (`Intervall_deckt_Null`: A-ARIMA, B ×3) | bestätigt | „Hauptfenster“ ist ein Kapitelbegriff; der Bericht sagt „es gibt keine ausgezeichnete Hauptkombination“. |
| 43 | „Das Modell beginnt 2026 bei rund 690 Mt, etwa 41 über dem tatsächlichen Wert von 2025 (648,8)“ | Analysebericht Kernaussage 3 (689,7; +40,9; Residuum 2025 −55,4) | bestätigt | |
| 44 | „Ein großer Teil der hohen Überschreitung geht auf diesen Sprung zurück und sagt wenig über das Tempo“ | Analysebericht Kernaussage 3; Validierung N1.2 (W3: Niveausprung erklärt rund 277 von 584 Mt) | bestätigt | „Großer Teil“ ist durch „knapp die Hälfte“ gedeckt. |
| 45 | Grafik 2: sechs Zeilen mit Punktwerten und Intervallen (A analytisch 38,9–1129,5; A Bootstrap 429–737; A ARIMA −132,7–665,4; B analytisch −202,7–252,8; B Bootstrap −159–201; B ARIMA −343,1–644,3), Korridor 60–100 | `estimand2_tabelle.csv` | bestätigt | Bild gelesen: Balkenenden und Korridorband (≈ 60–99) stimmen mit der Tabelle. Bildunterschrift „blau = Unsicherheit des Trends, grau = zusätzlich Streuung künftiger Jahre“ deckt sich mit der Spaltenlesart (Bericht 2.2). Offen: Die Bildquellenzeile enthält „vorläufig, nicht freigegeben“ (im Bild eingebettet, nicht nur in der Bildunterschrift). Fenster C und die Verfahren (analytisch, Bootstrap, ARIMA) werden im Text nicht erklärt. A13. |
| 46 | „Was das heißt. … Sie sagt: Mit dem Tempo des langen Trends würde Deutschland das Budget deutlich überschreiten, mit dem Tempo der letzten zehn Jahre ungefähr einhalten. Das ist dieselbe Botschaft wie oben: Die Antwort hängt vom Blickwinkel ab.“ | Analysebericht Kernaussage 2 und 3, Limitationen; Validierung N1.5 | **Abweichung (wesentlich)** | (a) Der Bericht sagt ausdrücklich, die A-Zeilen seien „nicht als Trendaussage über das Tempo lesbar“ (Niveausprung, Linearitätsverletzung); der Satz liest sie genau so und widerspricht dem Kapitel selbst (Z. 43). (b) „ungefähr einhalten“ trifft nur zwei der drei B-Zeilen (+25,0); B-ARIMA liegt bei +150,6 („pessimistischer“). (c) Der Bericht kommt zu „keine belastbare Aussage“; „dieselbe Botschaft wie oben“ ist eine neue Verknüpfung. Verstoß gegen „keine neue Inferenz“. A1. |
| 47 | „Unsere Fortschreibung bestätigt den Expertenrat nicht und widerlegt ihn nicht.“ | Analysebericht Kernaussage 2; 2.5 („Keine Entscheidung darüber, welche der beiden offiziellen Stellen ‚recht hat‘“) | bestätigt | |
| 48 | „Eine einfache Gerade ist nicht die Methode des Expertenrats. Der arbeitet mit Sektorzielen, Sonderregeln und Übertragungen zwischen Jahren.“ | Analysebericht Limitationen („sektorale Ziele, LULUCF-Sonderregeln, Übertragungsmechanismen“) | bestätigt | Über den Analysebericht belegt, nicht am Expertenrat-Original geprüft. |

### 2.5 „Ein Maßstab für Prognosen: der Prognose-Check“ (Z. 51–53)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 49 | „Projektionen der Bundesregierung (Projektionsberichte 2015 bis 2023) … gesamt und je Sektor“ | SAP Titel/Untertitel | bestätigt | |
| 50 | „mit den Emissionen, die später tatsächlich gemessen wurden“ | SAP („tatsächlich inventarisierten“; Referenzinventar UBA, Submission 2026) | Abweichung (gering) | Emissionen werden inventarisiert (berechnet und gemeldet), nicht gemessen. A9. |
| 51 | „Der Analyseplan ist seit dem 22. Oktober 2026 eingefroren [5]“ | SAP Kopf (v1.1 final, eingefroren 22.10.2026 als v1.0; Amendment 1 freigegeben 22.10.2026) | bestätigt | |
| 52 | „Ein validiertes Ergebnis lag zum Redaktionsschluss nicht vor. Deshalb steht hier keines.“ | `run_log.txt` (STOPP nach SAP 3.5.5, keine Fehlermaße) | bestätigt | Stand der Datei 22.10.2026. Der Platzhalter „[Falls bis zum Satz validiert …]“ (Z. 53) ist Entwurfsrest. A9. |
| 53 | „Mehr dazu in Kapitel 10.“ | – | nicht prüfbar | Kapitel 10 nicht Gegenstand dieser Prüfung. |

### 2.6 „Was heißt das für dich?“ (Z. 55–59)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 54 | „Beide Antworten können mit denselben Daten rechnerisch stimmen.“ | Artikel | bestätigt | |
| 55 | „Eine Zahl für 2040 ist eine Fortschreibung, keine Vorhersage. Achte auf die Spanne.“ | Artikel | bestätigt | Beschreibend. |
| 56 | „Ein Puffer von 4,5 Mt bei einem Budget von mehr als 6.000 ist winzig. Das ist keine Beruhigung und kein Alarm, es zeigt nur, wie knapp die Rechnung ist.“ | Analysebericht Abschn. 0 (0,07 %) | Abweichung (gering) | Zahl stimmt. „winzig“ und „keine Beruhigung, kein Alarm“ sind Wertung; „wie knapp die Rechnung ist“ ist eine neue Deutung (die Rechnung des Expertenrats). E3. |

### 2.7 „Lagen wir richtig?“ (Z. 61–66)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 57 | „Bei der Wiederholung der Rechnung für den Expertenrat-Abgleich ergaben sich dieselben 486 und 207 Millionen Tonnen für 2040.“ | Analysebericht Abschn. 0 („Reproduktion … 486,0 und 207,0 Mt (publiziert 486 und 207)“) | bestätigt | |
| 58 | Artikel „407–598“ und „16–328“; aus der Rechnung 407–566 und 86–328; 598 = Obergrenze, 16 = Untergrenze des ARIMA-Intervalls | Referenzfassung; Konsole; Handrechnung (Nr. 16, 19, 20) | bestätigt | Die Zuordnung beruht auf Wertgleichheit (598,3; 16,4); wie der Artikel zu den Werten kam, ist nicht dokumentiert (Kap. 8 führt die Ursache als offen). |
| 59 | „An den Schlüssen ändert das nichts. Es steht deshalb auch in Kapitel 8.“ | Nr. 22; Kapitel 8 Fall 6 | bestätigt | |

### 2.8 „Woher wir das wissen“ (Z. 70)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 60 | „Analysepläne, R-Code und Rohdaten liegen im Repository (`Analysen/2026-08-emissionen/`, …)“ | SAP und Skript gelesen; Analysebericht Abschn. 0 (Reihe im Skript Z. 15–20) | Abweichung (gering) | SAP und Skript sind vorhanden. Eine Rohdatei oder ein Lauf-Protokoll für den 2040-Lauf wurde nicht gefunden; die Reihe steht fest im Skript. Verzeichnis nicht auflistbar, daher Vorbehalt. A10. |
| 61 | „Im Repository liegt kein Validierungsbericht als Datei.“ | Zugriffsversuche auf `Validierungsbericht_…`/`Validierung_DE-Emissionen-Trendprojektion-2040.md` (nicht vorhanden); SAP ohne Verweis | nicht prüfbar (vollständig) | Nicht widerlegt, aber nicht vollständig prüfbar (kein Listing). Gegenprüfung per `git ls-files Analysen/2026-08-emissionen` empfohlen. A12. |
| 62 | Zitat des Commit-Vermerks „Pilot validiert: R-Ergebnisse matchen Referenzwerte, HAC-Abweichung dokumentiert“, „vom 27. August“ | Reflog Zeile 1: Commit ef3d8d9, 1787843414 (= 27.08.2026), „commit (initial)“ | bestätigt | Wortlaut exakt. Hinweis: Es ist der **Initial-Commit** des Repos. Dass er die Prüfung dokumentiert, ist daraus nicht ersichtlich; das Kapitel sagt das richtig vorsichtig. |
| 63 | „Der Artikel sprach von einer unabhängigen Prüfung.“ | Referenzfassung (Methodik: „Unabhängige Prüfung: Ein zweiter, vom eigentlichen Analyse-Code getrennter Prüfschritt …“) | bestätigt | |
| 64 | „Nach heutigen Maßstäben würden wir dafür einen eigenen Bericht verlangen.“ | CLAUDE.md (Workflow Schritt 4 validator; Dokumentationspflicht bei Nachkontrollen) | bestätigt | |
| 65 | Auslassung: Der SAP ist „retrospektiv erstellt“ („nach einer explorativen Sichtung der Daten … exploratorisch, nicht als präregistriert-konfirmatorisch“; Feld „Autor:in / Freigabe“ leer) | SAP v1.0 Abschn. 0 und Kopf; Artikel („vorab festgelegt“, „wurde vor der Modellierung festgelegt“) | **Abweichung (wesentlich)** | Das Kapitel nennt „Analysepläne“ im Repo und beschreibt die Prüflage, aber nicht, dass der Plan des 2040-Trends nicht vorab festgelegt war. Der Artikel behauptet das Gegenteil. Für das Buch ist das relevant (Glaubwürdigkeit der Evidenzcheck-Methode; Kapitel 8 und 9). A4. |
| 66 | „Für die Expertenrat-Analyse liegen Validierungsberichte als Dateien vor.“ | Validierungsbericht (Gesamtbericht + Nachtrag 1–3) | bestätigt | |
| 67 | Datenquelle UBA via klimadashboard.de (CC BY 4.0) | SAP 3 | bestätigt | |

### 2.9 Quellenliste (Z. 74–78)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 68 | [1] Titel, Datum 27.08.2026, URL | Referenzfassung (Metadaten) | bestätigt | |
| 69 | [2] UBA Emissionsdaten 2025 (Stand 14.03.2026) über klimadashboard.de | Analysebericht Abschn. 0 (API-Feld `update` = 2026-03-14) | bestätigt (Datum) | URL `klimadashboard.de/emissionen` nicht geöffnet. |
| 70 | [3] Expertenrat, veröffentlicht 18.05.2026, mit Werten; URL nur `expertenrat-klima.de` | Analysebericht Abschn. 0 | bestätigt (Datum, Werte) | Direktlink auf den Prüfbericht fehlt (E4). |
| 71 | [4] Analysebericht Fassung 4 (24.10.2026, vorläufig); SAP v1.1 (eingefroren 29.08.2026, Erratum 1 freigegeben 23.10.2026); Agora (28.08.2026) | Analysebericht Kopf; Reflog | bestätigt | |
| 72 | [5] SAP Prognose-Check #1, v1.1, eingefroren 22.10.2026 | SAP Kopf | bestätigt | |

## 3. Zusatzprüfung: neue Berechnung und Inferenz

- **Neue Berechnung:** keine. Rundungen (565,5 → 566; 181,5 → 182; 648,83 → 649; 4,5 / 6199 = 0,07 %) sind Darstellung. Die Prüfung hat die Intervalle des 2040-Laufs unabhängig nachvollzogen (Nr. 16, 19, 20), das Kapitel rechnet nichts selbst.
- **Neue Inferenz/Zuspitzung:** Nr. 46 („Tempo“, „dieselbe Botschaft“), Nr. 36 (abgeleitete Zahl als Agora-Aussage), Nr. 56 („wie knapp die Rechnung ist“), Nr. 21 (Beschreibung des ARIMA-Verfahrens).
- **Regel des Kapitelplans** („Zahlen im Buch stammen aus dem veröffentlichten, validierten Stand“): Der Expertenrat-Abschnitt ist bewusst eine Ausnahme und deshalb an das Gate gebunden (Nr. 28). Bei Nicht-Freigabe bis 13.11. gilt Plan B (nur ankündigen).
- **Sensible Sprache:** nicht einschlägig.

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Z. 49 („Was das heißt“).** (Nr. 46) Der Satz „Mit dem Tempo des langen Trends würde Deutschland das Budget deutlich überschreiten, mit dem Tempo der letzten zehn Jahre ungefähr einhalten. Das ist dieselbe Botschaft wie oben …“ streichen oder auf den Bericht zurückführen.
Änderungsvorschlag: „Unsere Fortschreibung bestätigt den Expertenrat nicht und widerlegt ihn nicht. Je nach Zeitfenster und Methode liegt die geschätzte Überschreitung zwischen plus 25 und plus 584 Millionen Tonnen. Der hohe Wert des Langfrist-Trends sagt wegen des Sprungs von 2025 auf 2026 wenig über das Tempo. Das Ergebnis hängt von Zeitfenster und Methode ab.“ Der Schlusssatz zur Methode des Expertenrats bleibt.

**A2. Z. 41 (Halbjahreswert).** (Nr. 36, 39) Die −2,1 % nicht Agora zuschreiben und die Einordnung von Agora ergänzen.
Änderungsvorschlag: „Agora Energiewende schätzt die Emissionen im ersten Halbjahr 2026 auf 327 Millionen Tonnen, rund 7 Millionen weniger als im ersten Halbjahr 2025. Nach unserer Rechnung aus den gerundeten Agora-Zahlen sind das rund 2,1 Prozent weniger (Agora selbst nennt rund 2 Prozent). Agora führt den Rückgang größtenteils auf die gestiegenen fossilen Energiepreise zurück. Das ist näher an … [wie bisher]“. Die Überschrift „Die Halbjahresdaten 2026 liegen näher am langen Trend“ in „Der Halbjahreswert 2026 liegt näher am langen Trend“ ändern.

**A3. Z. 2 (Kopfzeile).** (Nr. 3) Stand aktualisieren: Validierung Nachtrag 3 (24.10.2026, Commit 4e7974e) liegt vor, Ergebnis „freigabefähig mit Auflagen“, 0 kritisch, 2 gering offen (N4.1, N4.2). Hinweis: Der Kopf des Analyseberichts trägt noch „Fassung 4 noch nicht erneut geprüft“.

**A4. Z. 70 („Woher wir das wissen“) und Kapitel 8.** (Nr. 65) Ergänzen: Der Analyseplan des 2040-Trends wurde nach einer ersten Sichtung der Daten erstellt (SAP v1.0: „retrospektiv“, exploratorisch, nicht präregistriert). Der Artikel vom 27.08. schreibt dagegen, der Plan sei „vor der Modellierung festgelegt“ worden. Entscheidung Daniel Saure, ob das als weiterer Korrekturfall in Kapitel 8 aufgenommen wird (Hinweis in `faktencheck_kap08.md`, Befund B1).

**A5. Z. 14 und Z. 4 (Intervalle, Fenster A).** (Nr. 7, 17) Einen Vorbehalt ergänzen: Das OLS-Intervall ist laut Analyseplan bei Autokorrelation tendenziell zu eng; im langen Fenster ist die Autokorrelation signifikant (Durbin-Watson 0,65). Kein neuer Rechenschritt, nur Wiedergabe von SAP 5.4 und Analysebericht 2.1. Optional in „Was die Rechnung nicht ist“.

**A6. Z. 17 (ARIMA-Beschreibung).** (Nr. 21) Ersetzen durch eine zutreffende Kurzbeschreibung, z. B. „ein zweites Verfahren (ARIMA, ein Zeitreihenmodell), bei dem die Unsicherheit mit jedem Jahr weiter in die Zukunft wächst“.

**A7. Fenster C und „9 Intervalle“ (Z. 42, Z. 47, Grafik 2).** (Nr. 25, 41) Entweder erklären, dass die „9“ drei Zeitfenster einschließlich 2020–2025 (rein deskriptiv) umfasst, oder die Zählung auf die beiden Hauptfenster („5 von 6“ laut Bericht) beschränken. Das Kapitel nennt Fenster C nirgends.

**A8. Z. 4 (Zielwert).** (Nr. 6) „um mindestens 88 Prozent“ und „höchstens rund 150 Millionen Tonnen (150,4)“.

**A9. Z. 53 (Prognose-Check).** (Nr. 50, 52) „gemessen“ durch „inventarisiert/gemeldet“ ersetzen; den Platzhalter in eckigen Klammern vor Satz entfernen oder erledigen.

**A10. Nachweisdatei für den Rechenlauf vom 24.10.2026.** (Quellen, Nr. 15–20, 60) Die Konsolenwerte (406,6; 565,5; 389,9; 181,5; 598,3; 86,3; 327,8; 274,2; 16,4; 532,1) liegen nur im Chat/Prüfauftrag. Vor Freigabe das Protokoll (Konsole plus R-Version) als Datei in `Analysen/2026-08-emissionen/` ablegen (z. B. `run_log_2026-10-24.txt`), sonst sind Kapitel 4 und Kapitel 8 (Fall 6) nicht gegen eine Datei belegt (CLAUDE.md, Verifikationspflicht). Die Rechenprobe in Abschn. 2.3 ersetzt das nicht.

**A11. Z. 35 (Definition „50/50-Pfad“).** (Nr. 33) Die Erläuterung „gleich wahrscheinlich“ am Expertenrat-Text belegen oder streichen.

**A12. Z. 70 (Aussage „kein Validierungsbericht als Datei“).** (Nr. 61) Mit `git ls-files Analysen/2026-08-emissionen` bestätigen. Die Aussage ist nur über Zugriffsversuche gestützt.

**A13. Grafik 2 und Hinweise unter den Grafiken.** (Nr. 45) Die Quellenzeile im Bild nennt „vorläufig, nicht freigegeben“; vor Satz/Export neu erzeugen (die Kopfzeile verlangt nur das Entfernen der Hinweise unter den Grafiken). Bildunterschrift Z. 47 um Fenster C und die drei Verfahren ergänzen oder die Zeilenbeschriftung im Text erklären.

## 5. Empfehlungen (nicht bindend)

- **E1.** Z. 14: „mit 95 Prozent Wahrscheinlichkeit läge“ ersetzen durch „bei diesem Modell und den üblichen Annahmen in 95 von 100 Fällen läge“ oder entfernen.
- **E2.** Z. 8: „meist“ belegen oder streichen („zeigen oft zwei Zahlen“ wäre dieselbe Häufigkeitsangabe).
- **E3.** Z. 59: „winzig“ durch die Zahl (0,07 Prozent) ersetzen, „keine Beruhigung und kein Alarm“ streichen.
- **E4.** Quelle [3]: Direktlink auf den Prüfbericht (Titel, Seite) statt `expertenrat-klima.de`.
- **E5.** Quelle [2]: Abrufdatum nennen; SAP führt 2024/2025 als „vorläufig“ (Z. 8, E7).
- **E6.** Erläutern, dass die mittleren Jahresraten (−1,5 und −3,6 Prozent) aus den Trendgeraden berechnet sind (beobachtete Mittelraten −1,86 und −3,20 Prozent laut Bericht).
- **E7.** Rundung 565,5: den ungerundeten Wert aus dem Lauf-Protokoll (A10) entnehmen; erst dann „566“ festschreiben.
- **E8.** „Hauptfenster“ (Z. 42) durch „die beiden Zeitfenster A und B“ ersetzen.

## 6. Nicht geprüft / Vorbehalte

- **Rechenlauf 24.10.2026:** nur aus dem Auftrag; keine Datei. Die Intervalle habe ich unabhängig nachvollzogen (B-OLS von Hand; A-OLS mit σ̂ = 34,3 aus der Validierung; ARIMA über σ² aus dem Analysebericht), ohne R. Für die ARIMA-Ordnung des 2040-Laufs gibt es keine Datei.
- **Expertenrat-Prüfbericht (PDF, bericht.txt)** und **Agora-Primärseite:** nicht selbst geöffnet; Werte über Analysebericht, Validierungsbericht und Sekundärberichte.
- **Prognose-Check:** Stand nur bis zum Run-Log vom 22.10.2026.
- **Verzeichnisinhalte:** kein Listing möglich; Dateiexistenzen nur über Zugriffsversuche.
- **Kapitel 10:** nicht geprüft.
- **Stil, Wortzahl, Leseniveau, Rechtschreibung** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A13 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. Für den Expertenrat-Abschnitt: Freigabe der Analyse durch Daniel Saure nach Lektüre des aktuellen Berichts (Validierung Nachtrag 3 liegt vor, Auflagen N4.1/N4.2 offen). Ohne Freigabe bis 13.11.2026: Plan B (nur ankündigen).
3. Entscheidung Daniel Saure zu A4 (Kapitel 8, Befund B1).
4. Vor Satz: Kopfzeile, Herkunftstabelle, Platzhalter und Grafik-Hinweise entfernen.
5. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (13 Auflagen, 8 Empfehlungen). Kein Punkt ist „kritisch“. Die Zahlen des 2040-Abschnitts stimmen: 486 und 207 Mt; Intervalle OLS 407–566 und 86–328; ARIMA 390 (182–598) und 274 (16–532) wurden unabhängig nachvollzogen; die Darstellung der Abweichung gegenüber dem Artikel („407–598“, „16–328“; Mischung aus OLS- und ARIMA-Grenzen) ist numerisch belegt. Die Zahlen des Expertenrat-Abschnitts stimmen mit Analysebericht Fassung 4 und den CSV überein (6.199; 4,5/0,07 %; 60–100; 327; −1,5/−3,6 %; +25 bis +584; 8 von 9; 4 von 6; 690/+41). Die Kennzeichnung „VORLÄUFIG“ und der Gate-Stand (Analyse nicht freigegeben) sind sauber; die Kopfzeile ist durch Nachtrag 3 überholt (A3). Die Aussage zum fehlenden Validierungsbericht des 2040-Trends (nur Commit ef3d8d9, Initial-Commit) ist durch das Reflog gedeckt, aber nicht vollständig prüfbar (A12). Gewichtigste Befunde: die Schlussdeutung „Was das heißt“ (A1, neue Inferenz gegen den eigenen Bericht), die als Agora-Zahl ausgegebene Eigenableitung −2,1 % ohne Agora-Preiszitat (A2), die fehlende Offenlegung, dass der SAP des 2040-Trends retrospektiv war (A4), und das fehlende Lauf-Protokoll als Datei (A10). Keine neue Berechnung im Kapitel.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
