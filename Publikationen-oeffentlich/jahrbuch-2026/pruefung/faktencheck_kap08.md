# Faktencheck Kapitel 8 (Jahrbuch 2026): „Korrekturen 2026: Wo wir falsch lagen“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/08-korrekturen.md` (Entwurf v0.1, 24.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 134 ist nicht Buchtext).
**Prüfdatum:** 24.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` (Stufe Einordnung/Wissen): Differenzprüfung gegen die Ursprungsquellen; keine neue Berechnung, keine neue Inferenz. Kapitel 8 ist ein Rückblick auf eigene Fehler. Geprüft wurde deshalb, ob jede Fallbeschreibung (Fehler, Ursache, Änderung, Lehre) durch die Korrekturvermerke, Faktenchecks, Laufprotokolle und die veröffentlichten Referenzfassungen gedeckt ist, und ob das Kapitel über den dokumentierten Stand hinausgeht (Ursachenaussagen). Die Fälle 5 und 6 und die Aufnahme in das Buch sind laut Kopfzeile noch Entscheidung von Daniel Saure; diese Entscheidung wird hier nicht vorweggenommen.

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| `Reports/2026-09-65-euro-rein/korrektur_2026-10-17.md`, `faktencheck.md` (inkl. Nachtrag), Referenzfassung `quellen-artikel/2026-09-18_65-euro-rein-59-euro-raus.html` | gelesen (vollständig) | Abgleich vollständig. Referenzfassung = korrigierte Fassung (Hinweisblock oben, „Zu den Grafiken“, Nachtrag). |
| `Reports/2026-10-16-el-nino-1-5-grad/korrektur_2026-10-16.md`, Referenzfassung `…/2026-10-16_monate-uber-15-grad-ist-das-pariser.html` | gelesen (vollständig) | Abgleich vollständig. |
| `Reports/2026-10-17-co2-preis-2027/korrektur_2026-10-22.md`, `faktencheck.md` (mit Nachtrag 1 und 2), `faktencheck_zweitpruefung_2026-10-22.md`, Referenzfassung `…/2026-10-17_co-preis-2027-eingefroren-was-das.html` | gelesen (vollständig) | Abgleich vollständig. |
| Referenzfassung „Der Hitzesommer 2026 …“ (29.08.2026), `Analysen/2026-08-hitzesommer-2026/run_log.txt`, Kapitel 1 (freigegeben v0.8) | gelesen (vollständig) | Abgleich vollständig. |
| Referenzfassung „Zurück auf 1,5 Grad …“ (21.10.2026), UNEP Executive Summary (Textdatei `Reports/2026-10-21-emissions-gap-2026/ES_EmissionsGapReport2026_text.txt`, Z. 1–610), `pruefung/faktencheck_kap06.md`, Kapitel 6 (freigegeben v0.2) | gelesen (ES teilweise: Punkte 5–7, Tabelle ES.1) | ES Punkt 7 (Überschrift „… only the scenario based on current policies remains unchanged“) bestätigt. UNEP-Pressemitteilung nicht selbst abgerufen (laut faktencheck_kap06: HTTP 403). |
| Referenzfassung „Erreicht Deutschland sein Klimaziel 2040? …“ (27.08.2026), SAP, R-Skript, Kapitel 4 (Entwurf) | gelesen | Siehe `faktencheck_kap04.md`. |
| Referenzfassung „Die Trittbrettfahrer-Rechnung …“ (31.08.2026), `Analysen/2026-08-trittbrettfahrer-rechnung/Validierungsbericht.md`, Kapitel 5 (freigegeben v0.2) | gelesen | Nachkontroll-Validierungsbericht (laut Reflog als Datei festgehalten) **nicht geöffnet** (Dateiname nicht gefunden). |
| Kapitel 3 (freigegeben v0.2) | gelesen (vollständig) | Fälle 1 und 3 stimmen mit Kapitel 3 überein (Abschn. 2.2/2.4). |
| `quellen-artikel/INDEX.md`, `kapitelplan.md` (Abschn. 4), `Redaktion/redaktion.md` (privat, lokal gelesen) | gelesen | Grundlage für die Aussagen zur Vollständigkeitsprüfung (Z. 10) und zur Anzahl der Artikel (Z. 4). |
| `.git/logs/HEAD` (Reflog, als Textdatei gelesen) | gelesen | Datums- und Reihenfolge-Belege für Commits. |
| Substack-Seite „Über / Impressum“ (WebFetch 24.10.2026) | gelesen | E-Mail-Kontakt vorhanden, kein Kontaktformular. |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen (Abschn. 4), E-Nummern auf die Empfehlungen (Abschn. 5), B-Nummern auf Befunde außerhalb des Kapitels (Abschn. 3).

### 2.1 Kopfzeile, „Kurz gesagt“, „Unser Grundsatz“ und Übersicht (Z. 2–21)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Grundlage: die drei Korrekturvermerke in `Reports/`, Kapitel 1, 3, 5, 6 (freigegeben) und die Prüfprotokolle“ | Reflog (Kap. 1 v0.8 freigegeben 23.10.; Kap. 3 v0.2 23.10.; Kap. 5 v0.2 24.10.; Kap. 6 v0.2 24.10.) | bestätigt | Kopfzeilen der Kapitel stimmen. |
| 2 | Fall 6 „beim Schreiben von Kapitel 4 entdeckt“ | Reflog (Commit efe06db: „neuer Befund: Bereichsangaben im Artikel 27.8. weichen von der Rechnung ab“) | bestätigt | |
| 3 | „Stand: Hitzesommer-Artikel nicht geändert“ | Referenzfassung (Abruf 22.10.): Satz „korrekter Wert: rund 8.500, nicht 9.400“ unverändert, kein Hinweisblock | bestätigt (Stand 22.10.) | Vor Satz am Live-Artikel prüfen, wie die Kopfzeile selbst sagt. |
| 4 | „in sechs unserer 16 veröffentlichten Artikel Fehler oder Unbelegtes gefunden“ | `kapitelplan.md` Abschn. 3/4 („16 Posts“, Stand Substack-Archiv 22.10.2026); `redaktion.md` (Ökostrom „veröffentlicht … 23.10.2026“) | Abweichung | 16 ist der Archivstand vom 22.10. Der Ökostrom-Beitrag (Wissen) erschien laut Pipeline am 23.10., also vor dem Redaktionsschluss; damit sind es mindestens 17 Posts (16 inhaltliche plus Vorstellung). Der Ökostrom-Beitrag ist in der Abgleichstabelle (INDEX) nicht enthalten. A4, B2. |
| 5 | Aufschlüsselung: zwei falsche Zahlen, ein falscher Verweis, ein fehlender Gesetzgebungsstand, eine unbelegte Erklärung, eine ungenaue Quellenwiedergabe | Übersichtstabelle Z. 14–21 | bestätigt | 2 + 1 + 1 + 1 + 1 = 6, deckt sich mit den sechs Zeilen. |
| 6 | „Keine Korrektur hat die Kernaussage eines Artikels umgeworfen.“ | Fall 1: Faktencheck (Kernaussage hält); Fall 3: Korridor unverändert; Fall 6: Ziel außerhalb/innerhalb unverändert (Kap. 4 Nr. 22); Fall 5: 18 % vs. 5–8 % unberührt | bestätigt | Für Fall 4 und 2 nicht betroffen. |
| 7 | „bei den meisten wäre ein anderer Ablauf möglich gewesen, der den Fehler früher gefunden hätte“ | – | nicht prüfbar | Kontrafaktische Wertung. Für Fall 3 sagt die Aktenlage anderes (Nr. 37). E3. |
| 8 | „Fehler korrigieren wir sichtbar. Wo es geht, im Artikel selbst, mit Datum und Grund.“ | Fall 1, 3: Hinweisblock mit Datum und Grund (bestätigt); Fall 2: kein Hinweis (Z. 45 selbst); Fälle 4–6: nicht geändert | Abweichung | Als Beschreibung der Praxis trifft der Satz nur auf zwei der sechs Fälle zu, als Grundsatz ist er in Z. 45 und in den offenen Fällen nicht eingelöst. Das Kapitel sagt das an den Fällen offen, der Grundsatz-Satz allein liest sich anders. A5. |
| 9 | „Die Dateien dazu liegen im öffentlichen Repository, mit Vorher- und Nachher-Fassung, wo wir sie haben.“ | Fall 1: `artikel_original_2026-10-17.*`/`artikel_korrigiert_…html` (Korrekturvermerk) ✓; Fälle 2: Vermerk im Reflog committed (Commit 7893fe9); Fall 3: `korrektur_2026-10-22.md` – Commit im Reflog nicht erkennbar | nicht prüfbar (teilweise) | „Öffentlich“ laut CLAUDE.md („Repo ist öffentlich“); `Redaktion/` ist privat. Ob `korrektur_2026-10-22.md` committed ist, mit `git ls-files Reports/2026-10-17-co2-preis-2027/` prüfen. A12. |
| 10 | „Wir haben sie gegen alle 16 bis dahin veröffentlichten Artikel abgeglichen. Das war ein Textvergleich der veröffentlichten Fassungen mit den Entwürfen im Repository.“ | `INDEX.md` (Wort-4-Gramm-Vergleich, „keine inhaltliche Prüfung“; drei Posts ohne Repo-Entwurf: 27.8., 29.8., 14.9.); `kapitelplan.md` (Satz-für-Satz-Abgleich CO₂-Preis offen) | **Abweichung (wesentlich)** | (a) Der Abgleich hat die Fehler der Fälle 2 bis 6 nicht gefunden und konnte es nicht: Er prüft nur, ob Substack- und Repo-Text übereinstimmen. (b) Für die drei Evidenzchecks 27.8., 29.8. und 14.9. gab es keinen Entwurf zum Vergleichen. (c) Fall 6 wurde zufällig beim Schreiben von Kapitel 4 entdeckt. (d) 17 statt 16 Posts (Nr. 4). Der Satz erweckt den Eindruck einer inhaltlichen Vollständigkeitsprüfung. A4. |
| 11 | „Änderungen, die nirgends dokumentiert sind, können wir damit nicht ausschließen.“ | INDEX | bestätigt | Ehrlicher Vorbehalt. |
| 12 | Übersichtszeile 1: „65 Euro rein“ (18.09.), „Absatzbasis … zu niedrig“, „Hinweis oben im Artikel, korrigiert am 17.10.“ | Referenzfassung; Korrekturvermerk | bestätigt | |
| 13 | Zeile 2: „Monate über 1,5 Grad“ (16.10.), „Link auf den falschen eigenen Artikel“, „am 16.10. korrigiert, kein Hinweis im Artikel“ | Korrekturvermerk; Referenzfassung (kein Hinweisblock) | bestätigt | |
| 14 | Zeile 3: „CO₂-Preis 2027“ (17.10.), „neuer Titel, Hinweis ‚Aktualisiert am 22.10.2026‘“ | Referenzfassung (Abruf 22.10.) | bestätigt | |
| 15 | Zeile 4: „Der Hitzesommer 2026“ (29.08.), „Erklärung für abweichende Vergleichszahl 2018 nicht belegt“, „bisher nicht geändert“ | Referenzfassung; `run_log.txt` | bestätigt | |
| 16 | Zeile 5: „Zurück auf 1,5 Grad“ (21.10.), „Temperaturwerte als ‚alle schlechter als im Vorjahr‘ wiedergegeben“, offen | Referenzfassung; ES Punkt 7 | bestätigt | |
| 17 | Zeile 6: „Erreicht Deutschland sein Klimaziel 2040?“ (27.08.), „Zwei Bereichsangaben (Prognoseintervalle) stimmen nicht mit der Rechnung überein“, offen | Referenzfassung; Konsolenwerte (`faktencheck_kap04.md`) | bestätigt | |

### 2.2 Fall 1: „65 Euro rein, 59 Euro raus“ (Z. 25–37)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 18 | „Absatzmenge von 42 Milliarden Litern … Richtig sind rund 62 Milliarden Liter.“ | Faktencheck #30, Nachtrag N1 (62,0 und 62,2 Mrd. l, zwei unabhängige Wege) | bestätigt | |
| 19 | „Mehrverbrauch zu niedrig, Kosten je zusätzlicher Tonne CO₂ zu hoch“ | Faktencheck #42, #44 (0,18–0,37 Mt; 4.300–8.700 €/t) | bestätigt | |
| 20 | „Die im Artikel diskutierte Abweichung zwischen 1,2 und 1,6 Milliarden Euro gab es nicht.“ | Faktencheck #41, N1 („erklärt sich vollständig durch die zu niedrige Absatzbasis“); Referenzfassung („In der ersten Fassung stand hier eine offene Differenz“) | bestätigt | Genauer: Die Differenz entstand durch die falsche Basis. |
| 21 | „Untergrenze … Mehrwertsteuermodell lag bei 21 statt 23 Cent“; „Kennzeichnung als Bruttowert fehlte“; „Bezugsbasis beim Deutschlandticket nicht klar“ | Faktencheck #27, #31, #47; Referenzfassung (Hinweisblock) | bestätigt | |
| 22 | „‚Sechseinhalbfache‘ hätte 6,4-fach heißen müssen“ | Faktencheck #39 („großzügig gerundet; korrekt wäre ‚gut das Sechsfache‘ oder ‚6,4-fach‘“) | Abweichung (gering) | „hätte … heißen müssen“ ist strenger als der Faktencheck. Die Referenzfassung nennt jetzt „rund das 6,4-Fache“. A6. |
| 23 | „Dazu kamen kleinere Fehler: …“ (Aufzählung) | Faktencheck #18, #45, #46; Referenzfassung „Zu den Grafiken“ | Abweichung (gering) | Die Aufzählung ist nicht vollständig: Die Verteilungsbeispiele (88/14 Euro) beruhten auf unterschiedlichen, nicht genannten Verbräuchen (jetzt im Artikel mit „9,0 bzw. 6,5 l“ gekennzeichnet); „73 Prozent“ Diesel-Weitergabe statt rund 72 (steht noch in der Grafik-Fußnote); der Emissionsfaktor „nach UBA“ war nicht verifizierbar (#15). Das Kapitel sagt „kleinere Fehler“ ohne „unter anderem“. A6. |
| 24 | „Wir hatten geschrieben, Rechenweg und Skript würden im Repository veröffentlicht. Das war nicht geschehen. Der Satz ist ersetzt.“ | Faktencheck Abschn. 3; Referenzfassung (kursive Schlusszeile: „Ein Skript haben wir entgegen der ursprünglichen Ankündigung nicht veröffentlicht.“) | bestätigt | |
| 25 | „Kernaussage hielt: Tankrabatt hob 91 bis 95 Prozent des CO₂-Preises auf Benzin auf“ | Faktencheck #34 | bestätigt | |
| 26 | „Auch Auktion, Rabatthöhe, amtliche Kosten und die zitierten Studien waren bestätigt.“ | Faktencheck #1–#14, #19–#26 (bestätigt); #15, #16 (nicht verifizierbar), #18 (abweichend), #23 (Netto/Brutto offen) | bestätigt (mit Hinweis) | Gilt für die genannten Gruppen; der Satz lässt offen, dass daneben Punkte „nicht verifizierbar“ blieben (siehe Nr. 23). |
| 27 | „**Ursache.** Das Stück war ein Rechenkommentar, kein Evidenzcheck. Es hatte keinen vorab festgelegten Analyseplan und keine unabhängige Validierung.“ | Referenzfassung („Rechenkommentar, keine präregistrierte Analyse“); Faktencheck Abschn. 3 („kein SAP, keine Validierung“) | **Abweichung (wesentlich)** | Beides ist belegt, aber es ist kein Beleg für die **Ursache** der falschen Zahl. Faktencheck #30: „Urheber der ‚Marktschätzung‘ nicht genannt“; warum 42 statt 62 Mrd. l eingesetzt wurden, ist nirgends dokumentiert. Belegt ist höchstens, warum der Fehler nicht vorab auffiel. A3. |
| 28 | „Den Fehler fand ein nachträglicher Faktencheck am 17. Oktober.“ | Faktencheck (Datum 17.10.2026, „Nachträglicher Faktencheck eines bereits veröffentlichten Beitrags“); Reflog (Commit 283aca4) | bestätigt | Warum nachträglich geprüft wurde, steht nirgends; die Aussage selbst ist belegt. |
| 29 | „Zahlen korrigiert oder gekennzeichnet, Quellen verlinkt, Hinweis oben; drei Grafiken zeigen den ursprünglichen Stand, Hinweis am Ende; Nachtrag zur Energiesteuersenkung vom 25. September“ | Referenzfassung (Hinweisblock, „Zu den Grafiken“, Nachtrag); Artikel enthält drei Bilder (INDEX: „65 Euro (3)“) | bestätigt | |
| 30 | Lehre: „Wo wir Rechenwege versprechen, müssen sie bei Veröffentlichung bereitliegen. Und Eingangsgrößen werden gegen eine zweite, unabhängige Zahl gegengerechnet.“ | – | nicht prüfbar | Selbstverpflichtung; in CLAUDE.md oder den Skills nicht verankert (E3). |

### 2.3 Fall 2: „Monate über 1,5 Grad“ (Z. 39–47)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 31 | Link auf „unseren eigenen Evidenzcheck zum Sommer 2026“ führte zum Stück vom 29. August (Hitzetote); falsche Vorschaukarte | Korrekturvermerk (URL `substack.com/home/post/p-213266771`) | bestätigt | |
| 32 | Ursache: im Chat als Sommer-Link angegeben, ohne Zielabgleich übernommen; der Faktencheck prüfte den Link gegen den Veröffentlichungsvermerk, nicht das Ziel | Korrekturvermerk („Ursache“) | bestätigt | Wörtlich gedeckt. |
| 33 | „Der Link zeigt jetzt auf den richtigen Artikel („War der Sommer 2026 ‚ganz normal‘?“). … Werte (19,6 °C, plus 3,3 Grad, plus 1,1 Grad)“ | Referenzfassung (Quelle [9] = `…/p/war-der-sommer-2026-ganz-normal`); Korrekturvermerk; Kapitel 1 (Tabelle) | bestätigt | |
| 34 | „Die Änderung erfolgte ohne Hinweis im Artikel und ohne neue E-Mail“ | Korrekturvermerk („Update ohne erneuten E-Mail-Versand“); Referenzfassung (kein Hinweisblock) | bestätigt | |
| 35 | „Das hätten wir kennzeichnen sollen, deshalb steht es hier.“ | – (Korrekturvermerk nennt als Lehre nur das Linkziel) | nicht prüfbar | Wertung des Kapitels, kein dokumentierter Beschluss (E1). |
| 36 | Lehre: „Eigene Verweise öffnen wir künftig und gleichen Titel und Kernaussage ab“ | Korrekturvermerk („Lehre“) | bestätigt | |

### 2.4 Fall 3: „CO₂-Preis 2027“ (Z. 49–59)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 37 | „**Ursache.** Der erste Faktencheck prüfte die Zahlen, aber nicht den Stand des Gesetzgebungsverfahrens.“ | `faktencheck.md` (17.10.), Nachtrag 1, E4; Nachtrag 2 („E4 bleibt nicht prüfbar. Das ist unschädlich, weil der Artikel nur den Bundestagsbeschluss nennt“) | **Abweichung (wesentlich)** | Die Aktenlage widerspricht: Der erste Faktencheck hat die Frage ausdrücklich gestellt (E4: „Optional erwähnen, dass das Gesetz nach dem Bundestagsbeschluss noch den Bundesrat passiert“), die Nachprüfung hat den Vorgang 462/26 gefunden, den abschließenden Stand aber „nicht auffindbar“ genannt, den Artikel als „sachlich korrekt“ eingestuft („Formulierungen wie ‚Gesetz ist in Kraft‘ wären dagegen unzulässig“) und keine Auflage gesetzt. Richtig wäre: Die Frage wurde gesehen, nicht beantwortet und als nicht blockierend behandelt. A1. |
| 38 | „Erst eine zweite Prüfung am 22. Oktober fand das Problem.“ | `faktencheck_zweitpruefung_2026-10-22.md` (Kopfhinweis: „Unabhängige Zweitprüfung eines parallel in der Cloud-Session entstandenen Entwurfs (Doppelarbeit …)“; Prüfweg nur Websuche) | Abweichung | Datei und Datum stimmen; der Befund (Bundesrat, Präsens-Formulierungen) steht dort als „kritisch“. Aber: Es war keine geplante zweite Prüfstufe, sondern Doppelarbeit in einer Parallelsitzung („der freigegebene Entwurf auf main war dort nicht sichtbar“). Der Kopfhinweis sagt, die Befunde betreffen auch die freigegebene Fassung. Das Kapitel gibt das Zustandekommen verkürzt wieder. A1. |
| 39 | „Der Bundestag hatte am 15. Oktober die Änderung des Brennstoffemissionshandelsgesetzes beschlossen. Wir schrieben aber so, als sei sie schon in Kraft. Es fehlte, dass der Bundesrat noch abschließend beraten musste.“ | Korrekturvermerk („klang es so, als sei …“); Zweitprüfung Nr. 4 (Präsens, „Das folgt direkt aus dem Gesetz“); Referenzfassung | bestätigt | Der Vermerk sagt „klang so“, das Kapitel „schrieben so“. Die Zweitprüfung belegt die Präsens-Formulierungen („bleibt“, „gilt“, „folgt direkt aus dem Gesetz“). |
| 40 | Änderungen: neuer Titel („Bundestag friert CO₂-Preis 2027 ein – was das an der Zapfsäule bedeutet“), „soll“, „tritt das Gesetz wie beschlossen in Kraft“, neue Quelle zum Bundesrat, Hinweis „Aktualisiert am 22.10.2026“ | Referenzfassung (Abruf 22.10.: „soll … bleiben“, „Tritt das Gesetz wie beschlossen in Kraft“, Quelle [5] Bundesrat Drs. 462/26, Hinweisblock); Korrekturvermerk | bestätigt | INDEX: Satz-für-Satz-Abgleich der 22.10.-Änderungen steht noch aus; Titel und Hinweis sind bestätigt. |
| 41 | „Die Posts auf WhatsApp, Instagram und Facebook waren schon vor der Korrektur veröffentlicht. Sie verlinken auf die korrigierte Fassung.“ | Korrekturvermerk; `redaktion.md` (W/I/F gepostet bis 19.10.) | bestätigt | |
| 42 | „Sie sagen, der Preis ‚bleibe‘ eingefroren. Das war nur als Beschlussstand des Bundestags richtig.“ | Korrekturvermerk („enthalten ‚eingefroren‘/‚bleibt 2027‘“; „Aussage zum Bundestagsbeschluss korrekt“) | Abweichung (gering) | Der Wortlaut „bleibe“ in Anführungszeichen ist nicht belegt (Vermerk: „bleibt 2027“, „eingefroren“). Die Kanalentwürfe wurden nicht geöffnet. A7. |
| 43 | Platzhalter „[Stand der Anpassung von Instagram-Text und Facebook-Text … offen]“ | Korrekturvermerk („Empfehlung: nachträglich anpassen“) | bestätigt | Konsistent mit Kopfzeile (c). |
| 44 | Lehre: „Bei allem, was ein Gesetz betrifft, nennen wir den Stand mit Datum: Entwurf, beschlossen, in Kraft.“ | Kapitel 3 (Stand 22.10.2026) | bestätigt | Selbstverpflichtung, im Kapitel 3 bereits umgesetzt. |

### 2.5 Fall 4: „Der Hitzesommer 2026“ (Z. 61–71)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 45 | „Vor der Veröffentlichung kursierte für 2018 eine Vergleichszahl von 9.400 … Der Analyseplan nennt sie.“ | `run_log.txt` Schritt 5(c) (SAP 8.1: „aktuell ~9.400“) | bestätigt | |
| 46 | „Gerechnet haben wir mit dem RKI-Wert von rund 8.500 (Epidemiologisches Bulletin 19/2025).“ | `run_log.txt` (EB-19-2025: 8.500 [7.100; 10.100]); Kapitel 1 | bestätigt | |
| 47 | „Im Artikel vom 29. August haben wir den Unterschied als Verwechslung in einer Sekundärquelle erklärt.“ | Referenzfassung („… haben wir selbst eine Verwechslung in einer Sekundärquelle aufgedeckt (korrekter Wert: rund 8.500, nicht 9.400)“) | bestätigt | |
| 48 | „**Was wir danach festgestellt haben.** Diese Erklärung ist nicht belegt.“ | `run_log.txt` Schritt 5(c): Skriptlauf 29.08.2026 12:50:47–12:51:23 dokumentiert bereits die Nicht-Bestätigung der 9.400 in allen drei RKI-Ausgaben und die Vermutung zu 2019; Artikel: post_date 29.08.2026 11:25 UTC (= 13:25 MESZ) | **Abweichung (wesentlich)** | „danach“ ist nicht belegt: Das Protokoll vom selben Tag, vor der Veröffentlichung (sofern die Log-Zeit MESZ ist; die Zeitzone ist nicht dokumentiert), hielt fest, dass „~9.400“ für 2018 in keiner Primärquelle reproduzierbar ist, und nannte „Sekundärquelle/Dashboard-Rundung“ nur als ungeprüfte Möglichkeit. Der Artikel behauptete dennoch eine aufgedeckte Verwechslung. Das ist der eigentliche Fehler (Aussage gegen das eigene Protokoll). A2. |
| 49 | „In keiner der drei geprüften RKI-Ausgaben (2022, 2023, 2025) ließ sich die 9.400 für 2018 bestätigen.“ | `run_log.txt` (EB-42-2022: 8.300; EB-26-2023: 8.400; EB-19-2025: 8.500) | bestätigt | |
| 50 | „Möglicherweise stammt sie aus dem Bulletin 42/2022: Dort ist 9.400 die obere Grenze des Unsicherheitsintervalls für 2019. Das ist eine Vermutung.“ | `run_log.txt` („2019 6.900 [4.000; 9.400]“, eb42.txt Zeile 352; „AUSDRÜCKLICH UNBESTÄTIGTE … VERMUTUNG“) | bestätigt | Wie in Kapitel 1. |
| 51 | „Was das für das Ergebnis bedeutet. Nichts. Die Aussage … außerhalb der bisherigen Bandbreite … hängt nicht an dieser Zahl.“ | `run_log.txt` (Primärergebnis aus der Reihe 1992–2025; Zeile „Kernfeststellung … unabhängig vom exakten SAP-Zahlenwert“); SAP 8.1 (9.400 nur Kontext) | bestätigt (mit Hinweis) | „Nichts“ ist eine Wertung; die Aussage ist durch das Protokoll gedeckt (13 von 13 Varianten). |
| 52 | „Falsch ist nur die Erklärung im Methodenteil.“ | Referenzfassung | Abweichung (gering) | Der Satz steht im Abschnitt „Was das nicht bedeutet“ (Punkt „Zweitens“), nicht im Abschnitt „Methodik (kurz)“. A2. |
| 53 | „Bisher nichts am Artikel. … Hier im Buch ist die Sache offengelegt, ebenso in Kapitel 1.“ | Referenzfassung (Abruf 22.10.); Kapitel 1 Z. 59 | bestätigt | |
| 54 | Lehre: „Wir erklären keine Abweichung, die wir nicht belegen können.“ | – | nicht prüfbar | Selbstverpflichtung. |

### 2.6 Fall 5: „Zurück auf 1,5 Grad“ (Z. 73–81)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 55 | „… gab die drei Temperaturwerte (2,8, 2,6 und 2,1 Grad) so wieder, als seien alle drei schlechter als im Vorjahr.“ | Referenzfassung („Diese Werte sind schlechter als im Vorjahresbericht“) | bestätigt | |
| 56 | „Laut Zusammenfassung des Berichts stimmt das nur für 2,6 und 2,1 Grad. Der Wert bei aktueller Politik, 2,8 Grad, ist gegenüber dem Vorjahr unverändert.“ | ES Punkt 7 (Überschrift „Temperature projections have increased slightly compared with last year – only the scenario based on current policies remains unchanged“; 2,6 °C „a worse outcome than expected last year“; 2,1 °C „worse than expected last year“) | bestätigt | |
| 57 | „Außerdem fehlte, dass die Werte mit einer Wahrscheinlichkeit von 66 Prozent gelten.“ | ES Punkt 7 („66 per cent chance … limited to 2.8°C“); Referenzfassung („könnte … 2,8 Grad erreichen“, keine Wahrscheinlichkeit) | bestätigt | |
| 58 | „**Ursache.** Beim Abgleich mit der Executive Summary für Kapitel 6 fiel die Abweichung auf. Warum sie im Artikel entstand, haben wir noch nicht aufgearbeitet.“ | `faktencheck_kap06.md` Nr. 38 („Die Fehlzuordnung stammt aus [18]/PM“; PM: „These outcomes are worse than last year’s projections“) | Abweichung (gering) | Dass die Abweichung beim ES-Abgleich auffiel, ist belegt. „Noch nicht aufgearbeitet“ ist insofern unvollständig, als der Faktencheck zu Kapitel 6 die Herkunft aus dem Pressemitteilungs-Satz bereits benennt (PM selbst nicht abgerufen, HTTP 403). Keine unbelegte Ursachenbehauptung im Kapitel. A8. |
| 59 | „Kapitel 6 gibt die richtige Fassung wieder. Am Artikel auf Substack ist bisher nichts geändert.“ | Kapitel 6 Z. 47 („… Die Werte für 2,6 und 2,1 Grad sind schlechter …, der Wert für die aktuelle Politik (2,8 Grad) ist unverändert“); Referenzfassung (Abruf 22.10.) | bestätigt | |
| 60 | Fall nennt nur 2,8 Grad und die 66 Prozent | `faktencheck_kap06.md` A3, A4 (fehlender Kontext der 5,0 %, „Klimazusagen“ = neue NDCs) | Abweichung (gering) | Der Artikel enthält die in Kapitel 6 korrigierten Verkürzungen (5,0 % ohne Kontext; „Klimazusagen der Staaten“) ebenfalls. Kapitel 8 nennt sie nicht; ob sie Korrekturfälle sind, entscheidet Daniel Saure. A8. |

### 2.7 Fall 6: „Erreicht Deutschland sein Klimaziel 2040?“ (Z. 83–93)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 61 | Artikel nannte „407–598 Mt“ und „16–328 Mt“ | Referenzfassung | bestätigt | |
| 62 | „Beim Nachrechnen für Kapitel 4 am 24. Oktober … Das Hauptverfahren der Analyse (das OLS-Prognoseintervall) ergibt 407 bis 566 und 86 bis 328 Millionen Tonnen.“ | SAP 5.4 (primär: OLS-Prognoseintervall); Konsolenwerte [406,6; 565,5] und [86,3; 327,8]; Handrechnung (`faktencheck_kap04.md` Nr. 16, 19) | bestätigt | Der Lauf liegt nur im Auftrag/Chat, nicht als Datei (Kap. 4, A10). Rundung 565,5 → 566 an der Grenze. |
| 63 | „Die in den Artikel übernommenen Randwerte 598 und 16 stammen aus der Kontrollrechnung mit ARIMA (Intervalle 182 bis 598 und 16 bis 532).“ | Konsole [181,5; 598,3] und [16,4; 532,1]; Kontrolle über σ² aus dem Analysebericht (Kap. 4 Nr. 20) | bestätigt (numerisch) | „Stammen aus“ ist die Zuordnung nach Wertgleichheit; wie der Artikel zu den Werten kam, ist nicht dokumentiert (das Kapitel führt die Ursache selbst als offen). „Stimmen mit … überein“ wäre genauer. A10. |
| 64 | „Die Bereiche im Artikel mischen also je eine Grenze aus beiden Verfahren.“ | Intervalle (A: untere OLS 406,6, obere ARIMA 598,3; B: untere ARIMA 16,4, obere OLS 327,8) | bestätigt | Beide Mischungen sind nicht einheitlich (A: unten OLS, oben ARIMA; B: unten ARIMA, oben OLS). Das ist ein Beleg gegen eine einfache Min/Max-Erklärung (Min/Max wäre 181,5–598,3 bzw. 16,4–532,1). |
| 65 | „Die Projektionen selbst (486 und 207 Millionen Tonnen) und die Aussagen sind unberührt. Beim Langfrist-Trend liegt das Ziel von 150 außerhalb aller Intervalle, beim 10-Jahres-Trend innerhalb aller.“ | Kap. 4 Nr. 15, 19, 22 | bestätigt | |
| 66 | „Ursache. Das haben wir noch nicht aufgearbeitet.“ | – | bestätigt | Zutreffend und als offen gekennzeichnet; keine unbelegte Ursachenaussage. |
| 67 | „Kapitel 4 nennt die Intervalle aus der Rechnung. Am Artikel auf Substack ist bisher nichts geändert.“ | Kapitel 4 Z. 14–17; Referenzfassung (Abruf 22.10.) | bestätigt | |
| 68 | Lehre: „Zahlen im Text gleichen wir vor der Veröffentlichung noch einmal mit der Ergebnistabelle des Rechenlaufs ab.“ | – | nicht prüfbar | Selbstverpflichtung (vorläufig). Ergebnistabelle als Datei fehlt für den 2040-Lauf (Kap. 4, A10). |

### 2.8 „Was wir vor der Veröffentlichung gefunden haben“, Lehren, Fehler melden, Quellen (Z. 95–132)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 69 | „Die unabhängige Validierung fand in der ersten Prüfrunde einen kritischen Fehler in einem Datenkonverter.“ | `Validierungsbericht.md` (Trittbrettfahrer): `xlsx_sheet_to_csv.pl` Zeile 91; Reflog (Commit 11e1100: „Validierung findet kritischen Konverter-Bug“) | bestätigt | |
| 70 | „Er hatte die historische Kernzahl und zwei Varianten verfälscht.“ | Validierungsbericht („Estimand 1b/2b sowie Sensitivitäten 2, 3 und der 2b-Teil von Sensitivität 4: NICHT VALIDE“); Kapitel 5 („historische Kernzahl sowie die konsumbasierte und die Landnutzungsvariante“) | Abweichung (gering) | Betroffen waren auch der historische Teil der Rangplatz-Sensitivität (Sensitivität 4). Kapitel 5 hat dieselbe Formulierung. Der Artikel spricht nur von „einem falschen Zwischenwert für die historische Kernzahl“. A9. |
| 71 | „Der falsche Wert wurde nie veröffentlicht.“ | Reflog (Konverter-Fix 200f63c und Nachkontrolle 8032902 vor „Report-Entwürfe freigegeben“ eb41d32, 31.08.); Artikel 31.08. | bestätigt | |
| 72 | „Nach der Korrektur wurden die betroffenen Werte unabhängig nachgerechnet und bestätigt.“ | Referenzfassung („nach Behebung wurden alle Kernzahlen unabhängig neu berechnet und bestätigt“); Reflog (Commit 8032902 „Nachkontroll-Validierungsbericht (Freigabe) als Datei festgehalten“) | bestätigt (Artikel) | Nachkontroll-Datei nicht geöffnet. |
| 73 | „Der Artikel nennt den Vorgang im Methodenteil [1].“ | Referenzfassung (Methodik-Box, Punkt „Validierung“) | bestätigt | |
| 74 | „Das zeigt, was das Verfahren leistet … Es zeigt nicht, dass keine übrig sind.“ | – | bestätigt | Wertung, mit Vorbehalt formuliert. |
| 75 | „Was wir daraus gelernt haben“: drei Punkte (Rechenwege, Verweise/Quellen, Stand und Datum) | Fälle 1–3, 5 | nicht prüfbar | Selbstverpflichtungen. E3. |
| 76 | „Schreib uns in die Kommentare unter dem jeweiligen Artikel auf Substack oder über die Kontaktmöglichkeit auf der Seite ‚Über / Impressum‘ (URL)“ | Substack-Seite (WebFetch): E-Mail-Adresse, kein Formular | bestätigt (Kontakt) / nicht prüfbar (Kommentare) | Ob Kommentare unter den Artikeln aktiviert sind, ist nicht geprüft. Die URL stimmt mit CLAUDE.md. „Wir prüfen es und schreiben die Antwort mit Datum dazu“ ist Selbstverpflichtung. |
| 77 | „Was heißt das für dich?“ (drei Punkte) | – | bestätigt | Beschreibend. |
| 78 | „Lagen wir richtig? Dieses ganze Kapitel ist die Antwort … nicht immer.“ | – | bestätigt | |
| 79 | Quellen [1]–[6], [8]: Titel, Datum, URL | Referenzfassungen (Metadaten) | bestätigt | [5] ist gekürzt (Original: „… Teil der Bandbreite? Was die Zahlen zeigen“). [4]: Titel nach Korrektur, „aktualisiert am 22.10.2026“ ✓. |
| 80 | Quellenverzeichnis: Reihenfolge [8] vor [7]; die Fälle zitieren im Text keine Nummern außer [1] | Textdurchsicht | Abweichung (gering) | Kosmetik. A11. |
| 81 | [7] Repository-Link `github.com/dsaure55/klima-evidenzcheck` | CLAUDE.md (Repo ist öffentlich) | bestätigt | |

## 3. Befunde außerhalb des Kapitels (für die Vollständigkeit der Liste)

**B1. Artikel 27.08.2026 (Fall-6-Artikel): „vorab festgelegt“ und „Newey-West“.** Der Artikel schreibt: „mit einem vorab festgelegten Analyseplan“; „Der Analyseplan … wurde vor der Modellierung festgelegt, um nachträgliches Auswählen des günstigsten Ergebnisses auszuschließen“. Der SAP v1.0 sagt: „retrospektiv erstellt“, „nach einer explorativen Sichtung der Daten“, „Die Analyse gilt daher als exploratorisch, nicht als präregistriert-konfirmatorisch“ (SAP Abschn. 0; Feld „Autor:in / Freigabe“ leer). Zudem nennt die Methodik „Newey-West-korrigierte Standardfehler“; im Skript gilt die HAC-Korrektur nur dem Steigungstest, die Prognoseintervalle sind klassische OLS-Intervalle (SAP 5.4, Skript `predict(…, interval = "prediction")`). Und der Artikel nennt nur zwei der drei Zeitfenster (SAP 7: „alle drei werden berichtet“). Das ist möglicherweise ein weiterer Korrekturfall (Fall 7, Art: Methodenangabe). Entscheidung Daniel Saure (siehe A13); Bezug zu `faktencheck_kap04.md` A4.

**B2. Anzahl der Artikel und Ökostrom-Beitrag.** Siehe Nr. 4 und 10. Der Ökostrom-Beitrag (23.10.) ist nicht in der Abgleichstabelle (INDEX) und nicht Teil der Vollständigkeitsprüfung.

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Fall 3, „Ursache“ (Z. 53).** (Nr. 37, 38) Die Ursachenaussage an die Aktenlage anpassen.
Änderungsvorschlag: „**Ursache.** Der erste Faktencheck am 17. Oktober hat gefragt, ob der Bundesrat noch beteiligt ist, konnte den Stand aber nicht klären und stufte den Artikel als korrekt ein, solange er nur den Bundestagsbeschluss nennt. Eine zweite, unabhängige Prüfung am 22. Oktober (ein Entwurf war parallel noch einmal entstanden) fand über die Suche den Bundesrat-Vorgang und die Präsens-Formulierungen und stufte sie als kritisch ein.“ Alternativ die Ursache offen lassen („noch nicht aufgearbeitet“).

**A2. Fall 4 (Z. 63–71).** (Nr. 48, 52) „Was wir danach festgestellt haben“ ersetzen: Das Laufprotokoll vom 29. August (`run_log.txt`, Schritt 5c) hielt bereits fest, dass die 9.400 für 2018 in keiner der drei RKI-Ausgaben bestätigt werden konnte; der Artikel erschien am selben Tag und sprach trotzdem von einer aufgedeckten Verwechslung in einer Sekundärquelle. Zeitzone des Logs und Reihenfolge vor Satz klären (Log-Zeit 12:50 gegen Veröffentlichung 13:25 MESZ). „im Methodenteil“ ersetzen durch „im Abschnitt ‚Was das nicht bedeutet‘“. Die Aufnahme einer Ursache („wie kam es zu der Aussage im Artikel?“) nur nach Klärung; keine Vermutung.

**A3. Fall 1, „Ursache“ (Z. 33).** (Nr. 27) Überschrift und Aussage trennen: Warum die falsche Absatzbasis eingesetzt wurde, ist nicht dokumentiert (Faktencheck #30: Urheber der „Marktschätzung“ nicht genannt). Belegbar ist: Das Stück hatte keinen vorab festgelegten Analyseplan und keine unabhängige Validierung, deshalb fiel die Zahl nicht früher auf. Änderungsvorschlag: „**Warum es nicht früher auffiel.** …“ und einen Satz „Woher die 42 Milliarden stammen, wissen wir nicht mehr genau“ nur, wenn Daniel Saure das bestätigt.

**A4. Anzahl und Art des Abgleichs (Z. 4, Z. 10).** (Nr. 4, 10) Anzahl auf den Stand zum Redaktionsschluss bringen (mindestens 17 Posts einschließlich Ökostrom, 23.10.) und den Abgleich benennen, wie er war: Wortvergleich der Substack-Fassung mit dem Repo-Entwurf (Textkern, keine inhaltliche Prüfung; für drei Evidenzchecks gab es keinen Entwurf). Sonst entsteht der Eindruck einer inhaltlichen Vollständigkeitsprüfung. Optional den Satz ergänzen: „Zwei der sechs Fälle haben wir erst beim Schreiben dieses Buchs bemerkt.“ (nur wenn Daniel Saure bestätigt, welche; belegt ist nur Fall 6 und der Abgleich zu Fall 5/Kapitel 6).

**A5. „Unser Grundsatz“ (Z. 8).** (Nr. 8) Den ersten Satz an die Praxis anpassen: „Fehler wollen wir sichtbar korrigieren.“ Oder: Die offenen Fälle 2, 4, 5, 6 ausdrücklich im Grundsatz ansprechen.

**A6. Fall 1: „hätte … heißen müssen“ und „kleinere Fehler“ (Z. 27).** (Nr. 22, 23) „‚Sechseinhalbfache‘ war gerundet; richtig ist rund das 6,4-Fache“; die Aufzählung mit „unter anderem“ einleiten oder ergänzen (Verteilungsbeispiele ohne genannten Verbrauch, „73“ statt rund 72 Prozent in der Grafik-Fußnote, Emissionsfaktor-Quelle nicht verifizierbar).

**A7. Fall 3, Kanalposts (Z. 57).** (Nr. 42) „bleibe“ nicht in Anführungszeichen setzen, solange der Wortlaut nicht aus den Kanalentwürfen belegt ist (Korrekturvermerk: „eingefroren“/„bleibt 2027“). Kanalentwürfe prüfen oder paraphrasieren („Sie sagen, der Preis ‚bleibt‘ 2027 ‚eingefroren‘“ nur nach Abgleich).

**A8. Fall 5 (Z. 73–81).** (Nr. 58, 60) Den Hinweis „Ursache noch nicht aufgearbeitet“ durch den belegten Teil ergänzen („Die Pressemitteilung formuliert ‚These outcomes are worse than last year’s projections‘; unser Stück hat das übernommen“; PM-Wortlaut aus dem Session-Protokoll, Abruf offen). Entscheidung Daniel Saure, ob die weiteren Verkürzungen im Artikel (5,0 Prozent ohne Kontext, „Klimazusagen der Staaten“) als Teil des Falls genannt werden.

**A9. Konverter-Fehler (Z. 97).** (Nr. 70) „zwei Varianten“ prüfen: Laut Validierungsbericht waren auch der historische Teil der Rangplatz-Sensitivität betroffen; Formulierung mit Kapitel 5 abstimmen (dort ebenfalls „zwei Varianten“) oder „mehrere Varianten“.

**A10. Fall 6 (Z. 85) und Nachweisdatei.** (Nr. 62, 63, 68) „stammen aus der Kontrollrechnung“ ersetzen durch „stimmen mit den Grenzen der Kontrollrechnung (ARIMA) überein“; den Lauf vom 24.10.2026 als Datei im Analyseordner ablegen (Kapitel 4, A10), sonst fehlt der Beleg für Fall 6.

**A11. Quellenverzeichnis (Z. 125–132).** (Nr. 80) Reihenfolge [7]/[8] ordnen und die Nummern im Text der Fälle verwenden (derzeit nur [1]).

**A12. Öffentliches Repository und Korrekturvermerke (Z. 8).** (Nr. 9) Mit `git ls-files Reports/2026-10-17-co2-preis-2027/` prüfen, ob `korrektur_2026-10-22.md` committed ist; sonst vor Veröffentlichung committen oder den Satz einschränken.

**A13. Entscheidung Daniel Saure zu B1.** Ob der Artikel vom 27.08. wegen „vorab festgelegt“/„Newey-West“ als Fall 7 aufgenommen wird (Bezug `faktencheck_kap04.md` A4). Solange nicht entschieden, ist die Aussage in Z. 4 „sechs von 16“ unvollständig.

## 5. Empfehlungen (nicht bindend)

- **E1.** Fall 2: „Das hätten wir kennzeichnen sollen“ als Entscheidung kennzeichnen („Wir haben entschieden …“) oder als Wertung stehen lassen; belegt ist nur die Tatsache ohne Hinweis.
- **E2.** Z. 4: „Keine Korrektur hat die Kernaussage umgeworfen“ ist belegt; ergänzen „soweit bis jetzt bekannt“ (zwei Fälle offen).
- **E3.** Die Lehren (Z. 37, 71, 101–103) als „Wir nehmen uns vor“ formulieren und, wo ein Regelwerk besteht (CLAUDE.md, Skills), dorthin verweisen. Aktuell ist nur die Link-Prüfung (Fall 2) als Regel dokumentiert.
- **E4.** Z. 10: Die Abgleichstabelle (INDEX) als Anhang nennen.
- **E5.** Quelle [5] mit Volltitel.
- **E6.** Nach Klärung der Ursachen in den Fällen 5 und 6 die „Lehre“ ohne „[Erst nach Klärung …]“ formulieren.

## 6. Nicht geprüft / Vorbehalte

- **Nachkontroll-Validierungsbericht zur Trittbrettfahrer-Rechnung:** Dateiname nicht gefunden, nicht geöffnet; Aussagen dazu nur über Artikel, Kapitel 5 und Reflog.
- **UNEP-Pressemitteilung:** nicht abgerufen; PM-Wortlaut nur über `faktencheck_kap06.md`.
- **Kanalentwürfe (WhatsApp, Instagram, Facebook)** zum CO₂-Preis-Stück: nicht geöffnet.
- **Aktueller Substack-Stand:** Referenzfassungen vom 22.10.2026; Änderungen danach sind nicht ausgeschlossen (vor Satz neu abrufen).
- **Verzeichnisinhalte:** kein Listing möglich; Dateiexistenzen nur über Zugriffsversuche. Commit-Aussagen über den Reflog (nur Meldungstexte).
- **Kommentarfunktion unter den Artikeln:** nicht geprüft.
- **Stil, Wortzahl, Leseniveau, Rechtschreibung** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A12 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. Entscheidungen Daniel Saure laut Kopfzeile des Kapitels: Aufnahme der Fälle 5 und 6 (und ggf. 7), Hinweis auf Substack ja/nein, Hitzesommer-Artikel, Kanalposts CO₂-Preis. Die Gate-Prüfung hier ersetzt diese Entscheidungen nicht.
3. Vor Satz: Liste gegen alle bis dahin veröffentlichten Artikel neu abgleichen (inhaltlich, nicht nur als Textvergleich), Referenzfassungen neu abrufen.
4. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (13 Auflagen, 6 Empfehlungen). Kein Punkt ist „kritisch“. Die Sachangaben der Fälle stimmen mit den Korrekturvermerken, Faktenchecks und den Kapiteln 1, 3, 5, 6 überein: Fall 1 (42 → 62 Mrd. Liter, 21 → 23 Cent, 6,4-fach, Kernaussage 91–95 Prozent), Fall 2 (falscher Link, Zielartikel, Werte 19,6 / +3,3 / +1,1, ohne Hinweis), Fall 3 (Bundestag 15.10., Bundesrat, Titel/Hinweis 22.10.), Fall 4 (9.400 nicht bestätigt, 2019-Vermutung), Fall 5 (2,8 Grad unverändert, 66 Prozent), Fall 6 (OLS 407–566 und 86–328, ARIMA-Grenzen 598 und 16) und der Konverter-Fehler. Die Ursachenaussagen sind dagegen nicht durchgängig belegt: Fall 3 widerspricht der Aktenlage (der erste Faktencheck hat den Bundesrat als Prüfanregung genannt, A1), Fall 4 stellt die Chronologie falsch dar (das Protokoll vom 29.08. hielt die Nicht-Bestätigung bereits fest, A2), Fall 1 nennt Rahmenbedingungen als Ursache (A3). Die Vollständigkeitsaussage („alle 16“, „Textvergleich“) ist zu stark und zahlenmäßig überholt (A4); ein weiterer möglicher Korrekturfall liegt beim Artikel vom 27.08. („vorab festgelegt“, B1). Keine neue Berechnung im Kapitel; die Fälle 5 und 6 sind als offen gekennzeichnet und dürfen ohne Entscheidung von Daniel Saure nicht als abgeschlossen gelten.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*

---

## Nachtrag 1: Differenzprüfung der eingearbeiteten Auflagen und des neuen Falls 7 (26.10.2026)

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/08-korrekturen.md` in der Fassung nach Commit 3045f3f (Auflagen A1–A13 laut Commit-Meldung eingearbeitet, Fall 7 neu; Datei am 26.10.2026 vollständig neu gelesen). Zeilenangaben „Z.“ beziehen sich auf diese neue Fassung. Kapitel nicht verändert.
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Kapitels). **Dieser Nachtrag enthält keinen Freigabevermerk.**
**Dafür neu gelesen:** `Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md` (Kopf, Abschn. 0, 5.3, 5.4, 7); Artikel vom 27.08.2026 (`quellen-artikel/2026-08-27_erreicht-deutschland-sein-klimaziel.html`, vollständig); `Analysen/2026-08-emissionen/run_log_2026-10-24.txt`; `Analysen/2026-08-hitzesommer-2026/run_log.txt` (Schritt 5c, Zeitstempel); `Reports/2026-10-17-co2-preis-2027/faktencheck.md` (Nachträge 1 und 2); `Analysen/2026-08-trittbrettfahrer-rechnung/Validierungsbericht.md`; Kapitel 4, 5, 6 (aktuelle Fassungen); Reflog `.git/logs/HEAD` Zeilen 96–155; `faktencheck_kap04.md` (Nachtrag 1).
**Grenzen:** Keine Shell; `git ls-files` nicht ausführbar. Aktueller Live-Stand der Substack-Artikel nicht neu abgerufen (Referenzfassungen vom 22.10.2026). Kanalentwürfe und UNEP-Pressemitteilung nicht geöffnet.
**Skala:** umgesetzt / teilweise / nicht umgesetzt. Spalte „Neue unbelegte Aussage?“: ja oder nein, mit Begründung.

### N.1 Auflagen A1 bis A13

| Auflage | Ergebnis | Befund an der neuen Fassung | Neue unbelegte Aussage? |
|---|---|---|---|
| A1 (Fall 3, Ursache, Z. 54) | umgesetzt (mit Hinweis) | Wortlaut entspricht dem Änderungsvorschlag, nur ohne den Klammerzusatz „(ein Entwurf war parallel noch einmal entstanden)“. Aktenlage: Faktencheck 17.10. (E4 Prüfanregung zum Bundesrat), Nachtrag 1 (Vorgang 462/26 gefunden, Stand „nicht auffindbar“, Artikel „sachlich korrekt“), Nachtrag 2 (E4 „nicht prüfbar … unschädlich“); Zweitprüfung 22.10. fand Bundesrat und Präsens-Formulierungen. Hinweis: „Zweite, unabhängige Prüfung“ lässt weg, dass sie Doppelarbeit in einer Parallelsitzung war (Kopfhinweis der Zweitprüfung); gering. | nein |
| A2 (Fall 4, Z. 66) | teilweise | Überschrift ersetzt („Was wir festgestellt haben“); Text: „Das Laufprotokoll vom 29. August (Schritt 5c) hielt bereits fest, dass sich die 9.400 für 2018 in keiner der drei RKI-Ausgaben bestätigen ließ. Der Artikel erschien am selben Tag und sprach trotzdem von einer aufgedeckten Verwechslung.“ ✓ (Protokoll Schritt 5c; Artikel „aufgedeckt“). „im Methodenteil“ ist durch „im Abschnitt „Was das nicht bedeutet““ ersetzt (Z. 68) ✓. Offen: Die Reihenfolge am selben Tag ist nicht geklärt (Platzhalter „[Reihenfolge am selben Tag vor Satz klären.]“ steht im Text), obwohl „bereits“ und „trotzdem“ sie als Tatsache setzen. Beleg: Das Log meldet „Skriptlauf: 2026-08-29 12:50:47“ bis „12:51:23“ ohne Zeitzone; der Artikel hat post_date 11:25 UTC (13:25 MESZ). Läuft das Log in MESZ (die Reflog-Zeiten sind +0200), lag es rund 34 Minuten vor der Veröffentlichung; dokumentiert ist das nicht. Zusätzlich steht der Satz „In keiner der drei geprüften RKI-Ausgaben … bestätigen“ zweimal im Absatz. | ja (Reihenfolge als Tatsache, Platzhalter offen) |
| A3 (Fall 1, Z. 34) | umgesetzt | „**Warum es nicht früher auffiel.** Das Stück war ein Rechenkommentar, kein Evidenzcheck. Es hatte keinen vorab festgelegten Analyseplan und keine unabhängige Validierung. Den Fehler fand ein nachträglicher Faktencheck.“ Der Satz zur Herkunft der 42 Milliarden steht nur als Klammer-Platzhalter („nur, wenn Daniel Saure es bestätigt“). | nein |
| A4 (Z. 4, Z. 10) | umgesetzt | Z. 4: „16“ ist entfernt („unserer bis Redaktionsschluss veröffentlichten Artikel“). Z. 10: Platzhalter „[Anzahl … derzeit mindestens 17]“ (Archiv 17 Posts, INDEX); Abgleich als „auf Wortlaut verglichen (Textkern, keine inhaltliche Prüfung; für drei Evidenzchecks gab es keinen Entwurf)“ ✓ (INDEX). Zu den neuen Zahlen siehe N.2, N1 und N2. | ja, siehe N1 und N2 |
| A5 („Unser Grundsatz“, Z. 8) | umgesetzt | „Fehler wollen wir sichtbar korrigieren. Wo es geht, im Artikel selbst, mit Datum und Grund.“ | nein |
| A6 (Fall 1, Z. 28) | umgesetzt | „Dazu kamen unter anderem kleinere Fehler …“; „„Sechseinhalbfache“ war gerundet; richtig ist rund das 6,4-Fache.“ | nein |
| A7 (Fall 3, Kanäle, Z. 58) | umgesetzt | Ohne Anführungszeichen: „Sie sprechen davon, dass der Preis eingefroren sei und 2027 bleibe.“ Platzhalter „[Wortlaut aus den Kanalentwürfen vor Satz abgleichen.]“ steht dabei. Deckt sich mit dem Korrekturvermerk („eingefroren“/„bleibt 2027“). | nein |
| A8 (Fall 5, Z. 78) | teilweise | Ursache jetzt: „Die Pressemitteilung formuliert, diese Ergebnisse seien schlechter als die Projektionen des Vorjahres („These outcomes are worse than last year’s projections“), und unser Stück hat das für alle drei Werte übernommen.“ plus Platzhalter „[Wortlaut der Pressemitteilung vor Satz abrufen und belegen.]“. Der Satz ist als Tatsache formuliert, der PM-Wortlaut stammt nur aus `faktencheck_kap06.md` Nr. 38 (PM selbst nicht abgerufen, HTTP 403). Die Entscheidung Daniel Saure zu den weiteren Verkürzungen im Artikel (5,0 Prozent ohne Kontext, „Klimazusagen der Staaten“) ist im Kapitel nicht abgebildet. | ja (Ursache vor Abruf der PM als Tatsache, Platzhalter offen) |
| A9 (Konverter-Fehler, Z. 110) | umgesetzt | „… die historische Kernzahl und mehrere Varianten verfälscht.“ Validierungsbericht: Estimand 1b/2b, Sensitivitäten 2, 3 und der 2b-Teil von Sensitivität 4. Kapitel 5 nennt konkret „die historische Kernzahl sowie die konsumbasierte und die Landnutzungsvariante“; „mehrere“ widerspricht dem nicht. | nein |
| A10 (Fall 6, Z. 86, Nachweisdatei) | umgesetzt | „stimmen mit den Grenzen der Kontrollrechnung mit ARIMA überein (Intervalle 182 bis 598 und 16 bis 532)“ ✓. `run_log_2026-10-24.txt` liegt vor und bestätigt alle Zahlen (406,6/565,5; 181,5/598,3; 86,3/327,8; 16,4/532,1). | nein |
| A11 (Quellenverzeichnis) | teilweise | Reihenfolge geordnet: [1] Trittbrettfahrer, [2] 65 Euro, [3] Monate, [4] CO₂-Preis, [5] Hitzesommer, [6] Zurück auf 1,5 Grad, [7] Erreicht Deutschland, [8] Repository (entspricht den Fällen 1 bis 7). Die Nummern werden im Text der Fälle weiterhin nicht verwendet (nur [1]). | nein |
| A12 (Repository, Z. 8) | nicht umgesetzt | Satz unverändert. In den gelesenen Reflog-Zeilen 96–155 ist kein Commit zu `Reports/2026-10-17-co2-preis-2027/korrektur_2026-10-22.md` erkennbar; ohne `git ls-files Reports/2026-10-17-co2-preis-2027/` bleibt die Aussage nicht prüfbar. | nein |
| A13 (Entscheidung zu B1, Fall 7) | umgesetzt (Entscheidung offen) | Fall 7 ist als Abschnitt und Übersichtszeile aufgenommen, Überschrift trägt „[Aufnahme: Entscheidung Daniel Saure offen]“. Prüfung des Inhalts: N.2. Die Kopfzeile (Z. 2) nennt Fall 7 nicht. | siehe N.2 |

Empfehlungen E1 bis E6: E2 teilweise (Z. 4 „soweit bis jetzt bekannt“ fehlt weiter), E4 und E5 offen; E3 und E6 unverändert (Lehren Fall 5, 6, 7 als „Vorläufig“ markiert).

### N.2 Fall 7 (Z. 96–106) und neue Befunde

Prüfung der Beschreibung gegen SAP v1.0 (Kopf, Abschn. 0, 5.3, 5.4), Artikel vom 27.08.2026 und `run_log_2026-10-24.txt`.

| Nr. | Behauptung im Kapitel | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| F1 | „Der Artikel schreibt, der Analyseplan sei „vor der Modellierung festgelegt“ worden, um nachträgliches Auswählen auszuschließen.“ | Artikel, Methodik („Vorgehen“): „Der Analyseplan … wurde vor der Modellierung festgelegt, um nachträgliches Auswählen des günstigsten Ergebnisses auszuschließen“; Einleitung: „mit einem vorab festgelegten Analyseplan“ | bestätigt | Wörtliches Zitat ist korrekt, Rest sinngemäß. |
| F2 | „Der Analyseplan selbst trägt die Kennzeichnung „retrospektiv erstellt““ | SAP Kopf: „Version: 1.0 (retrospektiv erstellt)“ | bestätigt | |
| F3 | „Er wurde nach einer ersten Sichtung der Daten verfasst, bei der drei Zeitfenster informell verglichen wurden.“ | SAP Abschn. 0: „nach einer explorativen Sichtung der Daten erstellt (Pilotanalyse vom 27.08.2026, drei Zeitfenster wurden informell verglichen)“ | bestätigt (mit Hinweis) | „ersten“ statt „explorativen“: sinngemäß, aber nicht wörtlich. Datum der Pilotanalyse (27.08.) ist der Tag der Veröffentlichung des Artikels; das Kapitel nennt es nicht. |
| F4 | „Die Analyse gilt deshalb als exploratorisch, nicht als vorab festgelegt.“ | SAP Abschn. 0: „Die Analyse gilt daher als exploratorisch, nicht als praeregistriert-konfirmatorisch.“ | Abweichung (gering) | „vorab festgelegt“ ist Paraphrase; der SAP-Wortlaut ist „präregistriert-konfirmatorisch“. Ableitbar aus Absatz 2 des Abschnitts („Fuer alle kuenftigen Analysen gilt das Vorgehen umgekehrt …“), aber nicht wörtlich. Vorschlag: SAP-Wortlaut übernehmen (wie Kap. 4 Z. 71 „nicht als vorab festgelegt“ abstimmen). |
| F5 | „Außerdem betrifft die Newey-West-Korrektur im Plan nur den Test der Steigung.“ | SAP 5.3: „Newey-West-HAC-korrigierte Standardfehler fuer den Steigungskoeffizienten“; run_log: „Steigung (Newey-West-korrigiert)“ je Fenster | bestätigt | Das Kapitel zitiert aber nicht, was der Artikel dazu schreibt („lineare Trendregression mit Newey-West-korrigierten Standardfehlern (robust gegenüber der Autokorrelation …)“). Ohne diese Gegenüberstellung ist für Leser nicht erkennbar, warum das ein Fehler des Artikels ist (Abweichung, gering). |
| F6 | „Das Prognoseintervall für 2040 ist im Hauptverfahren ein klassisches OLS-Intervall, das bei zusammenhängenden Jahreswerten tendenziell zu eng ausfällt.“ | SAP 5.4: „Primaer: klassisches OLS-Prognoseintervall (95 %) – bekannte Limitation: bei autokorrelierten Residuen tendenziell zu eng“; run_log: „OLS-Projektion 2040 … (95%-PI …)“ | bestätigt | |
| F7 | „Was blieb. Die Kernaussage des Artikels: Das Zeitfenster entscheidet über die Schlagzeile. Sie passt zu einer explorativen Analyse sogar gut. Die Zahlen sind davon nicht betroffen.“ | Artikel („Welches Zeitfenster man wählt, entscheidet über die Schlagzeile“) | Abweichung (gering) | Kernaussage ✓. „passt … sogar gut“ ist eine Wertung ohne Beleg. „davon“ (von der Arbeitsweise-Angabe) ist neben Fall 6 missverständlich, weil für denselben Artikel zwei Bereichsangaben nicht stimmen. |
| F8 | „Ursache. [Noch nicht aufgearbeitet, nicht vermuten.]“ | – | bestätigt | Ehrlicher Platzhalter. |
| F9 | „Kapitel 4 beschreibt die Analyse als explorativ und nennt die Einschränkungen zum Intervall.“ | Kap. 4 Z. 29 („Intervalle eher zu eng“), Z. 71 („retrospektiv“, „exploratorisch“) | bestätigt | Kap. 4 schreibt „exploratorisch“, Kap. 8 „explorativ“: vereinheitlichen. |
| F10 | Übersichtszeile 7: „Plan als „vor der Modellierung festgelegt“ beschrieben, der Plan selbst ist retrospektiv“, Art „Arbeitsweise“, „bisher nicht geändert“ | Artikel (Referenzfassung 22.10., unverändert); SAP | bestätigt | Stand 22.10.; vor Satz am Live-Artikel prüfen. |
| F11 | Lehre: „Beschreiben wir unser Vorgehen im Artikel, gleichen wir es vorher mit dem Analyseplan und seinem Status ab.“ | – | nicht prüfbar | Selbstverpflichtung, als „Vorläufig“ gekennzeichnet. |
| F12 | Nicht im Fall genannt: Der Artikel zeigt nur zwei der drei Zeitfenster (SAP 5.1, 7: „alle drei werden berichtet“). | SAP 5.1, 7; Artikel | nicht prüfbar (Entscheidung offen) | Aus B1 (Erstprüfung); Entscheidung Daniel Saure, ob dieser Punkt zum Fall gehört. |

Neue und fortbestehende Befunde im Kapitel:

| Nr. | Befund | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| N1 | Kurz gesagt (Z. 4): „in sieben unserer … veröffentlichten Artikel Fehler oder Unbelegtes gefunden“. Fall 6 und Fall 7 betreffen denselben Artikel (27.08.), die Übersichtstabelle (Z. 14–22) hat sieben Zeilen für sechs Artikel. Die Aufschlüsselung („bei zwei Artikeln falsche Zahlen, … bei einem eine Angabe zur Arbeitsweise“) zählt die Fälle, nicht die Artikel. | Übersichtstabelle Z. 14–22 | Abweichung (mittel) | Richtig wäre „in sechs Artikeln, sieben Fälle“ oder „sieben Fälle in sechs Artikeln“. Der Überblick (`00b-ueberblick.md` Zeile 8) nennt keine Zahl mehr und ist davon nicht betroffen. |
| N2 | Z. 10: „Zwei der Fälle haben wir erst beim Schreiben dieses Buchs bemerkt: Fall 5 und Fall 6.“ Fall 7 wurde ebenfalls erst im Zuge der Buchprüfung bemerkt (Faktencheck Kapitel 4 vom 24.10., Befund B1/A4; Reflog 3045f3f: „Kap. 8 Fall 7 (Analyseplan 2040-Trend retrospektiv)“). | `faktencheck_kap04.md` A4; `faktencheck_kap08.md` B1; Reflog | Abweichung (gering) | „Zwei“ ist durch Fall 7 überholt („drei: Fall 5, 6 und 7“); sonst ist die Aufzählung unvollständig. |
| N3 | Kopfzeile (Z. 2): nennt die Entscheidung zu Fall 5 und 6, nicht zu Fall 7; sonst unverändert. | Kopfzeile | Abweichung (gering) | Vor Satz anpassen („Fall 7: Entscheidung offen“). |
| N4 | Fall 4 (Z. 66): doppelter Satz („In keiner der drei geprüften RKI-Ausgaben … bestätigen“). | Kapitel | Abweichung (gering) | Redundanz, kein Sachfehler. |
| N5 | Fall 3 (Z. 54): „Eine zweite, unabhängige Prüfung am 22. Oktober fand …“. Die Zweitprüfung war Doppelarbeit aus einer Parallelsitzung, nicht eine geplante zweite Prüfstufe. | `faktencheck_zweitpruefung_2026-10-22.md` (Kopfhinweis) | Abweichung (gering) | Siehe A1; Hinweis auf „parallel entstandenen Entwurf“ kann entfallen, solange „zweite, unabhängige Prüfung“ den Charakter nicht als Standardstufe darstellt. |

### N.3 Neue Berechnung und Inferenz

Keine neue Berechnung. Neue Aussagen ohne Beleg: F7 („passt sogar gut“), der Reihenfolgesatz in Fall 4 (A2), die Ursache in Fall 5 (A8). Die Beschreibung von Fall 7 (F1, F2, F3, F5, F6, F9, F10) ist gegen SAP, Artikel und Protokoll bestätigt.

### N.4 Gesamturteil zum Nachtrag

**ok mit Auflagen, unverändert.** Von 13 Auflagen sind 9 umgesetzt (A1, A3, A4, A5, A6, A7, A9, A10, A13), 3 teilweise (A2, A8, A11), 1 nicht umgesetzt (A12, nicht prüfbar ohne `git ls-files`). Kein Punkt ist „kritisch“. Fall 7 ist inhaltlich korrekt beschrieben; die Wortlaut-Abweichung F4, die fehlende Gegenüberstellung mit dem Artikeltext (F5) und die Wertung F7 sind gering. Zwei Zahlenangaben im Kapitel sind durch Fall 7 überholt (N1: sechs Artikel, sieben Fälle; N2: drei statt zwei in der Buchprüfung bemerkte Fälle). Vor Freigabe zu klären: N1, N2, A2 (Reihenfolge am 29.08.), A8 (PM-Wortlaut), A11, A12, die Entscheidung Daniel Saures zur Aufnahme von Fall 7. Kein Freigabevermerk; die Freigabe bleibt Sache von Daniel Saure.
