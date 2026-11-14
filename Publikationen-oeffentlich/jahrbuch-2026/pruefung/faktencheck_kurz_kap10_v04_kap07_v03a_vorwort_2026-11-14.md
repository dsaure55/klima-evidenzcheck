# Faktencheck Kurzfassung: Kapitel 10 v0.4, Kapitel 7 v0.3a, Vorwort v0.1 (14.11.2026)

Prüfer: Subagent `faktenpruefer` (unabhängig, nicht Autor). Die Kapitel- und Vorwortdateien wurden nicht verändert. Ampel: bestätigt / Abweichung / nicht prüfbar / kritisch. Schweregrade: kritisch, hoch, mittel, gering.

Grenzen dieser Prüfung: Ich hatte nur Lese- und Schreibzugriff, keine Suchfunktion. Die Suche nach „566“ (Teil B) habe ich deshalb durch vollständiges Lesen der genannten Dateien ersetzt. Nicht abrufbar bzw. wie vorgegeben als gegeben genommen: Substack-Veröffentlichungszeit (13:25 Uhr), UNEP-Pressemitteilung (Satz „These outcomes are worse …“), Artikeltexte auf Substack. Geprüft gegen die Dateien im Repo bzw. in `Redaktion/` (privat, nicht im öffentlichen Repo).

---

## A. Kapitel 10 (`kurz/07-korrekturen.md`, v0.4), Differenz gegen v0.3

Gegenstand: `pruefung/diff_kap10_v04_2026-11-14.diff.txt`. Die Differenz stimmt mit dem Dateistand überein. Geänderte Stellen: Kopfzeile, Platzhalter Liste-Stand, Fall 1 Ursache, Fall 3 Kanäle, Fall 4 Zeiten, Fall 5 Ursache und Lehre, Fall 6 Obergrenze, Ursache und Lehre, Fall 7 Ursache und Lehre.

### A1 Tabelle der geänderten Stellen

| # | Behauptung | Quelle | Ergebnis | Schweregrad | Hinweis |
|---|---|---|---|---|---|
| A1 | Fall 1: „Woher die 42 Milliarden stammen, ist nicht dokumentiert.“ | `Reports/2026-09-65-euro-rein/faktencheck.md`: Nr. 30 („Urheber der ‚Marktschätzung‘ nicht genannt“), Abschn. 3 („Herkunft der 42 Mrd. l“ ohne Skript nicht prüfbar) | bestätigt mit Hinweis | gering | Gedeckt. Der Artikel selbst nennt „Marktschätzung auf Basis der BAFA-Mineralölstatistik“. Das Kapitel könnte das erwähnen, weil „nicht dokumentiert“ sonst weiter klingt als „Urheber nicht genannt, Zahl passt nicht zur BAFA-Basis“. |
| A2 | Fall 3: „Die Entwürfe der Posts nennen den Bundestagsbeschluss vom 15. Oktober, aber nicht, dass der Bundesrat noch beteiligt ist.“ | `Reports/2026-10-17-co2-preis-2027/kanal-entwuerfe/whatsapp.md`, `instagram.md`, `facebook.md`, dazu `assets/karussell.html` | bestätigt | gering | Alle drei Entwürfe nennen „15. Oktober“, keiner nennt den Bundesrat. Auch das Karussell (6 Folien) nennt ihn nicht. Hinweis: Das belegt die Entwürfe, nicht die tatsächlich gepostete Fassung. Das Kapitel sagt korrekt „Entwürfe“. Ob der gepostete Text wortgleich ist, steht nirgends in den Dateien (nur „gepostet … laut Daniel“). |
| A3 | Fall 3: „Gepostet wurden sie laut unserer Redaktionsliste am 18. Oktober.“ | `Redaktion/redaktion.md`, Zeile 2026-10-co2-preis-2027: „W/I/F gepostet 18.10.2026 (laut Daniel)“ | bestätigt mit Hinweis | gering | Datum stimmt. Die Quelle ist privat (`Redaktion/` per `.gitignore`), Leser können sie nicht prüfen. Das Kapitel nennt „laut Daniel“ nicht. 18.10. liegt vor der Korrektur (22.10.), das passt zu „schon vor der Korrektur veröffentlicht“. |
| A4 | Fall 3: Die Posts „verlinken auf die korrigierte Fassung“ | Entwürfe: Links auf `…/p/co-preis-2027-eingefroren-was-das?utm_…` | bestätigt | gering | Der Slug ist unverändert, der Link zeigt auf die später aktualisierte Seite. Dass der Slug nach 22.10. gleich blieb, habe ich nicht live geprüft (Substack nicht abrufbar). |
| A5 | Fall 4: Der Lauf endete 12:51 Uhr. | `Analysen/2026-08-hitzesommer-2026/run_log.txt`: „Skriptlauf beendet: 2026-08-29 12:51:23“ (Start 12:50:47) | bestätigt | gering | Das Log nennt keine Zeitzone. Der Vergleich mit 13:25 (+02:00) setzt gleiche Ortszeit voraus. |
| A6 | Fall 4: Artikel um 13:25 Uhr, „rund eine halbe Stunde“ nach dem Lauf | `datePublished 2026-08-29T13:25:25+02:00` (von dir als gegeben) | bestätigt (als gegeben) | gering | 12:51 bis 13:25 sind 34 Minuten. „Rund eine halbe Stunde“ ist vertretbar. |
| A7 | Fall 4: Das Laufprotokoll (Schritt 5c) hielt fest, dass sich 9.400 für 2018 in keiner der drei RKI-Ausgaben bestätigen ließ; mögliche Herkunft Bulletin 42/2022, obere Grenze für 2019; „Vermutung“ | `run_log.txt`, Schritt 5(c) | bestätigt | – | Wortlaut stimmt: „konnte in KEINER der drei … reproduziert werden“, „2019 6.900 [4.000; 9.400]“, „AUSDRÜCKLICH UNBESTÄTIGTE … VERMUTUNG“. |
| A8 | Fall 4: Der Artikel „sprach trotzdem von einer aufgedeckten Verwechslung“ | run_log (Kenntnis im Log), Artikeltext nicht abrufbar | Abweichung | gering | „Trotzdem“ unterstellt, dass die Autorenseite das Log vor der Veröffentlichung kannte. Belegt ist nur: Das Log lag ab 12:51 vor, der Artikel kam 34 Minuten später. Ob es gelesen wurde, ist nirgends dokumentiert. Ich empfehle neutrale Fassung („und sprach von …“). „Aufgedeckt“ kann ich ohne Artikeltext nicht prüfen. |
| A9 | Fall 5: Der Satz „These outcomes are worse than last year’s projections“ steht in der UNEP-Pressemitteilung vom 21.10.2026, Abschnitt „Temperature projections still far too high“, direkt nach 2,8 und 2,6 Grad | von dir als gegeben; zusätzlich `Redaktion/ideen/2026-10-21-unep-pressemitteilung-abruf.md` | bestätigt (als gegeben) | gering | Das Protokoll zeigt den Satz direkt nach den Werten 2,8 und 2,6 („…due to the withdrawal of the United States …“). Der Abschnittstitel steht dort nicht, und das Protokoll trägt nur den Abruf vom 21.10., nicht „abgerufen am 14. November 2026“. Das Datum 14.11. ist für mich nicht prüfbar. Das Protokoll ist privat. |
| A10 | Fall 5 Ursache: „Unser Stück hat das für alle drei Werte übernommen.“ | Pressemitteilung (Satz bezieht sich nach Wortlaut auf 2,8 und 2,6; 2,1 steht im Folgeabsatz), Artikel nicht abrufbar | Abweichung | mittel | Die Ursache ist eine Kausalbehauptung über den Entstehungsweg des Artikels. Sie ist in keiner Datei dokumentiert. Für 2,1 Grad trägt der Pressemitteilungssatz sie nicht. Außerdem entsteht eine nicht erklärte Spannung: Die Pressemitteilung nennt 2,8 „schlechter als im Vorjahr“, die Zusammenfassung des Berichts laut Kapitel „unverändert“. Das Kapitel stellt die Pressemitteilung als Quelle des Fehlers dar, sagt aber nicht, dass Pressemitteilung und Bericht sich hier widersprechen. Empfehlung: Wie bei Fall 6/7 „nicht dokumentiert“ oder „wahrscheinlich“ formulieren, und den Widerspruch Pressemitteilung/Bericht benennen. |
| A11 | Fall 5 Lehre: „Zahlen aus einem Bericht gleichen wir mit dessen Zusammenfassung ab.“ | – | Abweichung | gering | Die Pressemitteilung ist selbst eine Zusammenfassung. Gemeint ist offenbar die Executive Summary. Zusatz: Laut `Redaktion/redaktion.md` wurde die Executive Summary beim Faktencheck am 21.10. nicht gelesen. Der Satz beschreibt also eine künftige Praxis. |
| A12 | Fall 6: Obergrenze 565 (statt 566) | `Analysen/2026-08-emissionen/nachrechnung_2026-10-29.txt`: Fenster 1990-2025: „Projektion 2040 486.030, 95%-PI 406.610 bis 565.451“ | bestätigt | – | 565,451 rundet auf 565. 566 wäre nur ab 565,5 richtig. Auch 407 (406,610), 86 (86,302), 328 (327,778), 486 (486,030) und 207 (207,040) stimmen. |
| A13 | Fall 6: ARIMA-Spannen 182 bis 598 und 16 bis 532, Punktwerte 390/274 | nicht in der Nachrechnungsdatei | nicht prüfbar | gering | Nicht Teil der Änderung. Dieselben Zahlen stehen in Kapitel 7 und in Grafik 1 (Balkenenden und Punkte passen visuell). Quelle ist der Analysebericht, den ich hier nicht geöffnet habe. |
| A14 | Fall 6: „Beim Nachrechnen für Kapitel 7 am 24. Oktober haben wir festgestellt …“ | Nachrechnungsdatei heißt und stammt vom 29.10.2026; Kopfzeile v0.4 nennt „Nachrechnung vom 29.10.2026“ | Abweichung | mittel | Das Datum 24.10. ist in keiner geprüften Datei belegt und steht im Widerspruch zur Datierung der Nachrechnung (29.10.). Nicht in der v0.4-Differenz geändert, aber der Fall-6-Absatz mit der geänderten Zahl enthält es. Möglicherweise Verwechslung mit dem 24.10. (Abruf der UNEP-Exec-Summary, Kapitel 6 Quelle [13]). Daniel prüfen lassen. |
| A15 | Fall 6/7 Ursache: „Wie es dazu kam, ist nicht dokumentiert, und wir vermuten es nicht.“ | In `Analysen/2026-08-emissionen/` nichts Gegenteiliges gefunden | nicht prüfbar | gering | Negativbehauptung („nicht dokumentiert“) kann ich nur für die gelesenen Dateien bestätigen. In dem Fenster, das ich gesehen habe, gibt es keine Ursachenangabe. Vollständig prüfbar wäre das nur mit Zugriff auf den Commit-Verlauf. |
| A16 | Fall 6/7 Lehre „(vorläufig, die Ursache ist ungeklärt)“ | Abschnitt „Was wir daraus gelernt haben“ im selben Kapitel | Abweichung | mittel | Lehre 6 („Zahlen mit Ergebnistabelle abgleichen“) und Lehre 7 („Vorgehen mit Analyseplan und Status abgleichen“) kommen im zusammenfassenden Absatz „Was wir daraus gelernt haben“ nicht vor (dort: Rechenwege, Verweise, Links, Berichtszahlen, Gesetze, Datenreihen). Außerdem gibt es in `CLAUDE.md` keine entsprechende Regel. Die Lehren sind Zusagen. Sie sind als solche in Ordnung, aber nicht als gelebte Praxis belegt (Formulierung „gleichen wir ab“ im Präsens). |

### A2 Widersprüche und Konsistenz im Kapiteltext

| # | Befund | Schweregrad | Hinweis |
|---|---|---|---|
| W1 | „Kurz gesagt“ sagt „bis Redaktionsschluss veröffentlichten Artikel“. Der Platzhalter zum Stand der Liste lässt die Option „Stand 22. Oktober“ zu. Dann stimmt „bis Redaktionsschluss“ nicht mehr. Die Einleitung nennt außerdem 27. August bis 21. Oktober als Zeitraum des Buchs, Kapitel 7 aber Beiträge bis 12.11. | mittel | Bewusst offen (Platzhalter). Die Entscheidung muss vor Satz in „Kurz gesagt“, im Absatz „Die Liste hat den Stand …“ und im Vorwort („sechs Artikel“) gleichlautend nachgezogen werden. |
| W2 | „Kurz gesagt“ zählt: „Bei zwei Artikeln … Zahlen falsch, bei einem ein Verweis, bei einem … Gesetzgebungsstand, bei einem … Erklärung, bei einem … Quelle ungenau, bei einem … Arbeitsweise“. Das sind 2+1+1+1+1+1 = 7 Artikel. Das Kapitel spricht aber von sechs Artikeln. Fall 6 und 7 betreffen denselben Artikel. | mittel | Satz so umbauen, dass klar ist: sieben Fälle, davon zwei im selben Artikel. Außerdem sind in Fall 5 ebenfalls Zahlen falsch wiedergegeben (also drei, nicht zwei „Zahlen“-Fälle, wenn man Fall 1, 5, 6 zählt). |
| W3 | „Bei den meisten Fällen wäre ein anderer Ablauf möglich gewesen, der den Fehler früher gefunden hätte.“ ist eine Wertung ohne Beleg, während Fall 6/7 sagen, die Ursache sei ungeklärt. | gering | Für Fall 1 bis 5 durch Ursache-Abschnitte gedeckt, für 6 und 7 nicht. „Meisten“ ist damit knapp tragfähig. |
| W4 | Kopfzeile v0.4 enthält veraltete Aussage „Hinweis: Offen sind … Ursache und Lehre bei Fall 5 bis 7 sowie der Stand der Kanalposts“. v0.4 hat Ursache/Lehre gefüllt. | gering | Kopfzeile wird vor Satz entfernt. Aufräumen. |
| W5 | Fall 5 „Gekennzeichnet“: „Kapitel 6 gibt die richtige Fassung wieder.“ | gering | Nicht Teil der Änderung. Inhalt von Kapitel 6 habe ich nicht gegengelesen. |
| W6 | Fall 6 „Was stimmt“: „Beim Langfrist-Trend liegt das Ziel von 150 außerhalb aller Spannen, beim 10-Jahres-Trend innerhalb aller.“ | – | Rechnerisch gedeckt: 150 < 407 und < 182; 150 liegt in 86–328 und 16–532. |
| W7 | Keine neuen inferentiellen Rechnungen gefunden. Die einzige Rechnung ist die Rundung 565,451 auf 565, sie stimmt. | – | – |

### Gesamturteil A

**ok mit Auflagen.** 0 kritisch, 0 hoch, 4 mittel (A10, A14, A16, W1, W2 zählt als eine Gruppe mit W1; genau: A10, A14, A16, W1, W2 = 5 mittel), 11 gering/ohne Befund. Mittlere Auflagen:
1. A10: Ursache Fall 5 als „nicht dokumentiert“ oder „vermutlich“ formulieren und den Widerspruch Pressemitteilung/Bericht benennen.
2. A14: „24. Oktober“ in Fall 6 belegen oder korrigieren.
3. A16: Lehren 6 und 7 in „Was wir daraus gelernt haben“ aufnehmen oder als Absicht formulieren.
4. W1/W2: Zählung „Kurz gesagt“ und Stand der Liste (Platzhalter) vor Satz abgleichen.
Die geänderte Obergrenze 565 ist belegt.

---

## B. Kapitel 7 (`kurz/06-klimaziel.md`, v0.3a), Änderung 566 zu 565

Gegenstand: `pruefung/diff_kap07_v03a_2026-11-14.diff.txt`. Die Differenz enthält genau zwei Stellen, beide im Dateistand umgesetzt.

| # | Prüfpunkt | Ergebnis | Schweregrad | Hinweis |
|---|---|---|---|---|
| B1 | Abschnitt „Zwei Zeitfenster, zwei Antworten“: „zwischen rund 407 und 565 Millionen Tonnen“ | bestätigt | – | Nachrechnung: 406,610 bis 565,451. |
| B2 | Abschnitt „Lagen wir richtig?“: „aus der Rechnung folgen 407 bis 565 (die 598 ist die Obergrenze der ARIMA-Spanne)“ | bestätigt | – | wie B1. |
| B3 | Stimmt 565 gegen die Nachrechnung? | bestätigt | – | 565,451 rundet auf 565, 566 wäre falsch. Übrige Werte im selben Absatz (486, 207, 86, 328) passen ebenfalls. |
| B4 | Suche „566“ in `kurz/06-klimaziel.md` | bestätigt | gering | Im Text kein Treffer mehr. Treffer nur in der Kopfzeile (historischer Vermerk „von 566 auf 565“). |
| B5 | Suche „566“ in `kurz/14-quellenverzeichnis.md` | bestätigt | – | Kein Treffer. Das Verzeichnis enthält keine Intervallwerte zum 2040-Trend. |
| B6 | Suche „566“ in `kurz/00b-ueberblick.md` | bestätigt | – | Kein Treffer. Zeile Kapitel 7 nennt keine Zahlen zum 2040-Intervall. |
| B7 | Suche „566“ in `kurz/07-korrekturen.md` | bestätigt | gering | Text: nur „565“ (Fall 6). Treffer „566“ nur in der Kopfzeile als Änderungsvermerk (v0.4). |
| B8 | Grafik 1 (`grafiken/kap04_grafik1_trend2040.png`) | nicht prüfbar | gering | Die Grafik hat keine Zahlenbeschriftung der Intervallenden. Das Balkenende liegt visuell bei etwa 565. Sie ändert sich nicht. |
| B9 | Kopfzeilenbehauptung „Wert 565,5 im Lauf-Log war schon gerundet“ | nicht prüfbar | gering | Lauf-Log nicht geöffnet. Plausibel (565,451 gerundet auf eine Stelle gibt 565,5). Nur Kopfzeile, wird vor Satz entfernt. |
| B10 | Reichweite der Suche | Einschränkung | gering | Nur die vier genannten Dateien geprüft (ohne Suchwerkzeug vollständig gelesen). Andere Dateien der Kurzfassung (Einleitung, Kapitel 1 bis 5, 7a, 8, 9, Glossar, Vorwort) und die Langfassung wurden nicht auf „566“ durchsucht. Vor Satz einmal per Volltextsuche über `kurz/` und die Langfassung prüfen. Der Substack-Artikel vom 27.08. nennt weiter „407–598“ (so von Kapitel 10 dargestellt). |

### Gesamturteil B

**ok.** 0 kritisch, 0 hoch, 0 mittel, 4 gering (B4/B7 Kopfzeilenvermerk, B8, B9, B10). 565 stimmt gegen die Nachrechnung, in den vier genannten Dateien nennt keine Textstelle mehr 566 als Obergrenze.

---

## C. Vorwort (`kurz/00a-vorwort.md`, Entwurf v0.1)

Belege: Einleitung (`kurz/00-einleitung.md`), Kapitel 9 (`kurz/09-so-pruefen-wir.md`), Kapitel 10 (`kurz/07-korrekturen.md`), Stilregeln v0.3 (`stilregeln.md`).

### C1 Tatsachenangaben

| # | Behauptung im Vorwort | Beleg | Ergebnis | Schweregrad | Hinweis |
|---|---|---|---|---|---|
| C1 | „Ich bin Mathematiker, und der Klimawandel macht mir Sorgen.“ | Einleitung, „Wer wir sind“: „der Mathematiker Dr. Daniel Saure, den der Klimawandel besorgt“ | bestätigt | – | |
| C2 | „Aus beidem ist Klima Kompass entstanden.“ | Einleitung: „… und der dazu einen Beitrag leisten will“ | Abweichung | gering | Entstehungsgeschichte (Kausalität) steht so nicht in den Belegen. Die Einleitung sagt nur, er wolle einen Beitrag leisten. |
| C3 | „In der öffentlichen Diskussion begegnen mir viele Zahlen. Oft steht nicht dabei, woher sie kommen, für welchen Zeitraum sie gelten und womit sie verglichen werden.“ | Einleitung: „Aus seiner Sicht fehlt es in der öffentlichen Diskussion oft an Daten und Analysen.“ | Abweichung | mittel | Die drei Mängel (Herkunft, Zeitraum, Vergleich) stehen in Einleitung, Kapitel 9 und 10 nicht. Die Einleitung sagt etwas anderes („fehlt an Daten und Analysen“). Entweder bei Daniel als Aussage bestätigen lassen oder an die Einleitung angleichen. Kapitel 1 (zehn Fragen) habe ich nicht gelesen und es war nicht als Beleg benannt. |
| C4 | „Genau das wollte ich tun und aufschreiben, mit öffentlichen Daten.“ | Einleitung: „prüft und erklärt Aussagen … an öffentlichen Daten“; „Wir haben nachgesehen … und schreiben auf“ | bestätigt | – | |
| C5 | „Am 27. August 2026 ist unser erster Artikel erschienen.“ | Einleitung: „Unseren ersten Artikel haben wir am 27. August 2026 veröffentlicht.“ Kapitel 10 nennt 27.08. für „Erreicht Deutschland sein Klimaziel 2040?“ | bestätigt | – | In der Einleitung steht zusätzlich der offene Platzhalter [FAKT 2] (ob es Klima Kompass schon vor dem Artikel gab). Die Aussage „erster Artikel“ bleibt davon unberührt. |
| C6 | „In diesem Buch stehen die Antworten aus dem Herbst: War der Sommer normal? Reicht das Gas für den Winter? Was kostet Klimapolitik? Schafft Deutschland sein Klimaziel?“ | Einleitung, erster Absatz (wörtlich gleiche vier Fragen, „Herbst 2026“) | bestätigt | – | |
| C7 | „Manche Zahlen stimmten, manche waren verkürzt, bei manchen fehlte der Vergleich.“ | Einleitung, erster Absatz | bestätigt | – | |
| C8 | „Künstliche Intelligenz … schreibt Analysepläne, Programmcode und Entwürfe.“ | Einleitung („Sie schreibt Analysepläne, Programmcode und Entwürfe“); Kapitel 9 („KI schreibt SAP-Entwürfe, Analyse-Code, Validierungen, Faktenchecks und Entwürfe …“) | bestätigt mit Hinweis | gering | Gedeckt, aber verkürzt: Nach Kapitel 9 schreibt die KI auch Validierungen und Faktenchecks. Das Vorwort lässt das weg. Die Einleitung kürzt gleich. Könnte als Auslassung gelesen werden, weil Prüfen im Vorwort nur dem Menschen zugeschrieben wird. |
| C9 | „Ich lese, prüfe und gebe frei, und ich veröffentliche.“ | Einleitung: „Ein Mensch gibt frei und veröffentlicht“; Kapitel 9: „Menschen prüfen und frieren den SAP ein, lesen die Berichte, ändern, geben frei und veröffentlichen“ | bestätigt mit Hinweis | gering | Singular „Ich“ gedeckt nur über die Verantwortung von Daniel Saure (Einleitung: „ein Mensch“, Kapitel 9: „Menschen“). „Prüfe“ ist in Kapitel 9 breiter gefasst (auch zweite KI als Prüfer). |
| C10 | „Wie das abläuft, steht in Kapitel 9.“ | Einleitung („(Kapitel 9)“), Kapitel 9 Titel | bestätigt | – | |
| C11 | „Sieben Fälle in sechs Artikeln stehen in Kapitel 10, mit Datum und mit dem, was falsch war.“ | Kapitel 10: 7 Fälle; Artikel: 65 Euro, Monate über 1,5 Grad, CO₂-Preis, Hitzesommer, Zurück auf 1,5 Grad, Klimaziel 2040 (Fall 6 und 7 gleicher Artikel) = 6 Artikel | bestätigt mit Hinweis | mittel | Zahl stimmt für den Stand der Liste (16 Beiträge bis 21.10.). Sie hängt am offenen Platzhalter in Kapitel 10: Werden die sieben späteren Beiträge abgeglichen, kann sich die Zahl ändern. „Mit Datum“: Fall 4 bis 7 tragen das Veröffentlichungsdatum des Artikels, kein Korrekturdatum (es gibt keine Korrektur). Zudem ist Fall 4 „unbelegt“ und Fall 7 eine „Angabe zur Arbeitsweise“. „Wir haben uns auch geirrt“ trifft nicht auf alle sieben genau zu. Zahl vor Satz mit Kapitel 10 gleichziehen. |
| C12 | „Ich finde, dass man einer Quelle vor allem dann trauen kann, wenn sie ihre Fehler selbst zeigt.“ | Kapitel 10: „Eine Korrektur ist kein Grund, einer Quelle zu misstrauen. Misstrauisch sein solltest du dort, wo es nie eine gibt.“ Aber auch: „Dass keine übrig sind, folgt daraus nicht.“ | Abweichung | mittel | Wertung, stärker als der Beleg. Kapitel 10 sagt „kein Grund zu misstrauen“, das Vorwort „vor allem dann trauen“. Wirkt außerdem wie Selbstlob (Stilregel 10, siehe C2-Stil). Als Meinung gekennzeichnet („Ich finde“), aber ohne Quelle im Buch. Streichen oder an Kapitel 10 angleichen. |
| C13 | „Du musst das Buch nicht der Reihe nach lesen. Wer nur eine Frage hat, schlägt das Kapitel dazu auf.“ | Einleitung, „So liest du dieses Buch“ (Teil 1/2, Raster, „Überblick vorab“) | nicht prüfbar | gering | Die Lesempfehlung steht nicht in den Belegen. Die Einleitung beschreibt nur den Aufbau. Plausibel, aber neu. Der Verweis auf „Auf einen Blick“ fehlt. |
| C14 | „Die zehn Fragen in Kapitel 1 helfen bei jeder Klimazahl, auch bei solchen, die nicht in diesem Buch vorkommen.“ | Einleitung: „die zehn Fragen, mit denen du jede Klimazahl prüfen kannst (Kapitel 1)“; `00b-ueberblick.md` Zeile 1 | bestätigt mit Hinweis | gering | „Jede Klimazahl“ gedeckt, der Zusatz „auch bei solchen, die nicht in diesem Buch vorkommen“ ist eine Folgerung. Kapitel 1 selbst nicht gelesen. |
| C15 | „Wenn dir ein Fehler auffällt, sag es uns. In Kapitel 10 steht, wie.“ | Kapitel 10: „Einen Fehler meldest du uns in den Kommentaren … oder über die Seite ‚Über / Impressum‘ …“; Kapitel 9: „sag uns Bescheid (Kapitel 10)“ | bestätigt | – | URL der About-Seite stimmt mit CLAUDE.md überein. |
| C16 | Kopfzeile: „Enthält nur Angaben, die an anderer Stelle im Buch stehen; keine neuen Tatsachen.“ | – | Abweichung | gering | Trifft nicht ganz zu: C2, C3, C12 und C13 sind neu bzw. nicht belegt. Kopfzeile wird vor Satz entfernt. |

### C2 Verstöße gegen Stilregeln v0.3

| # | Regel | Fundstelle | Schweregrad | Hinweis |
|---|---|---|---|---|
| S1 | Stimme: Erzählform „wir“, „keine Ich-Form“ (bestätigt 23.10.2026) | Absatz 1 bis 4 durchgängig „Ich“; Absatz 3 und 4 mischen „uns“, „Wir“, „Ich“ | mittel | Die Kopfzeile nennt die Ich-Form als Vorschlag mit offener Entscheidung. Formal ein Regelverstoß. Zusätzlich uneinheitlich im Text („Bei der Arbeit hilft uns …“, „Ich lese …“, „Wir haben uns auch geirrt. … Ich finde …“). |
| S2 | Stimme: „du“ nur im Baustein „Was heißt das für dich?“, sonst ohne direkte Anrede | Absatz 5: „Du musst …“, „dir“, „sag es uns“ | gering | Die Einleitung benutzt dieselbe Anrede, daher in der Praxis üblich. Bei Vorworten naheliegend. Regelfrage mit Daniel klären. |
| S3 | Regel 1 Gegensatzformeln | keine gefunden | – | „Du musst … nicht der Reihe nach lesen“ ist eine einfache Verneinung, keine Formel. |
| S4 | Regel 2 Dreierreihen aus Reflex | „woher sie kommen, für welchen Zeitraum sie gelten und womit sie verglichen werden“; „Ich lese, prüfe und gebe frei“; „Manche … manche … bei manchen“ | gering | Die ersten beiden sind inhaltlich dreiteilig, wirken aber als Reihung. Die Anapher „Manche/manche/bei manchen“ stammt aus der Einleitung. Drei Reihungen auf wenig Raum. |
| S5 | Regel 3 Gedankenstriche, Doppelpunkte | Kein Gedankenstrich. Ein Doppelpunkt (vor der Fragenreihe) | – | Doppelpunkt vor echter Aufzählung ist erlaubt. |
| S6 | Regel 5 Floskel- und Modewörter | keine der gelisteten Wörter gefunden | – | „Genau das“ (Absatz 1) ist ein leichter Verstärker (Regel 9). Gering. |
| S7 | Regel 6 Rhetorische Fragen | vier Fragen in Absatz 2 | gering | Es sind Themenfragen aus der Einleitung, keine Übergänge. Die Wirkung ist trotzdem rhetorisch. Vertretbar. |
| S8 | Regel 7 gleichförmiger Satzbau, Merksatz am Absatzende | Absatz 4 endet mit der Wertung „Ich finde …“ als Merksatz | gering | Die übrigen Absätze variieren. |
| S9 | Regel 8 Abstraktes statt Konkretes | Absatz 1 („viele Zahlen“, „oft“) ohne Beispiel | gering | Ein Beispiel aus Kapitel 2 oder 5 wäre konkreter. Dabei nichts Neues behaupten. |
| S10 | Regel 10 Pose und Pathos, Selbstlob | Satz „Ich finde, dass man einer Quelle vor allem dann trauen kann, wenn sie ihre Fehler selbst zeigt.“ | mittel | Streift Selbstlob („wir zeigen Fehler, also vertraut uns“). Siehe C12. |
| S11 | Regel 4 fette Schlagwortköpfe, Regel 9 Beteuerungen, Sensible Sprache | keine gefunden | – | |

### Gesamturteil C

**ok mit Auflagen.** 0 kritisch, 0 hoch, 4 mittel (C3, C11, C12, S1; S10 deckt sich mit C12), Rest gering. Mittlere Auflagen:
1. C3: Die Aussage zu den Zahlen in der öffentlichen Diskussion belegen lassen (Daniel) oder an die Einleitung angleichen.
2. C11: Zahl „sieben Fälle in sechs Artikeln“ erst nach Entscheidung zum Stand der Liste in Kapitel 10 festschreiben; „mit Datum“ und „geirrt“ prüfen.
3. C12/S10: Wertungssatz „Ich finde … trauen“ streichen oder an Kapitel 10 angleichen.
4. S1: Erzählform entscheiden (Ich oder wir) und im ganzen Vorwort einheitlich halten.

---

## Zusammenfassung

| Teil | Gesamturteil | kritisch | hoch | mittel | gering |
|---|---|---|---|---|---|
| A Kapitel 10 v0.4 | ok mit Auflagen | 0 | 0 | 5 | 11 |
| B Kapitel 7 v0.3a | ok | 0 | 0 | 0 | 4 |
| C Vorwort v0.1 | ok mit Auflagen | 0 | 0 | 4 | 12 |

Anmerkung zur Zählung A: mittel = A10, A14, A16, W1, W2.
