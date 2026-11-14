# Differenzprüfung Kurzfassung Kapitel 1 (Zehn Fragen), v0.1 gegen v0.2, 14.11.2026

Geprüft: `kurz/08-zehn-fragen.md` (v0.2, aktuell) gegen die Wortdiff-Datei `pruefung/diff_kap01_v02_2026-11-14.diff.txt` (v0.1 nach v0.2). Verglichen mit `kurz/REIHENFOLGE.md` (Stand 28.10.2026) und `kurz/07-korrekturen.md` (Kapitel 10, v0.2).
Methode und Grenze: Ich hatte keinen Shell-Zugriff, `git show d2d320a~1:...` wurde nicht ausgeführt. v0.1 ist nur über die Diff-Datei bekannt. Die Diff-Datei wurde nicht gegen Git gegengeprüft. Wörtlich bestätigt ist nur: Was die Diff-Datei zeigt, steht so in v0.2, und die Diff-Datei enthält drei Änderungsblöcke. Dass sonst nichts geändert wurde, folgt aus der Diff-Datei und ist unabhängig nicht belegt.
Schweregrade: kritisch / hoch / mittel / gering / Hinweis.

## 1. Änderungen laut Diff

| Nr. | Stelle | v0.1 | v0.2 | Aussage/Zahl/Datum/Vorbehalt verschoben? | Schwere |
|---|---|---|---|---|---|
| 1 | Frage 1, RKI-Beispiel | „das Unsicherheitsintervall bei 14.400 bis 17.600 [1]“ | „die Unsicherheitsspanne bei 14.400 bis 17.600 [1]“ | Nein. Zahlen (16.000; 14.400 bis 17.600), Stand 24.09.2026, KW 15 bis 37 und Quelle [1] sind unverändert. Bei „Spanne“ geht der statistische Fachbegriff verloren, der Konfidenzniveau/Intervallcharakter andeutet. Das ist gewollt (Stilpass), die Aussage bleibt gleich. | gering |
| 2 | Frage 6, Gasspeicher-Beispiel | „Das Prognoseintervall reicht von 69 bis 230 TWh [8]“ | „Die Prognosespanne reicht von 69 bis 230 TWh [8]“ | Nein. Zahlen 150 TWh, 69 bis 230 TWh, Quelle [8] unverändert. Der Folgesatz „Das ist eine große Spanne“ passt jetzt sprachlich besser. Fachlich bleibt offen, ob die Quelle ein Prognoseintervall mit definiertem Niveau meint. Das ist eine Frage an die Quelle, nicht an die Änderung. | gering |
| 3 | Kopfvermerk | v0.1-Vermerk ohne v0.2-Eintrag | Eintrag „v0.2 (14.11.2026, Stilpass: Intervall zu Spanne; Kapitelverweise 3, 7, 9, 10 gegen REIHENFOLGE.md geprüft; v0.1 vom 28.10.2026)“ ergänzt; Rest unverändert | Nein im Sachtext. Der Vermerk wird vor Satz entfernt. Siehe aber Nr. 5. | gering |

Ergebnis: Keine Zahl, kein Datum, keine Quelle, keine Einschränkung („Stand“, „zum Redaktionsschluss zu aktualisieren“, „in der Regel“) wurde laut Diff verändert. Nur die beiden Begriffe wurden getauscht.

## 2. Kapitelverweise gegen REIHENFOLGE.md

| Verweis im Text | Stelle | Gemeint | Laut REIHENFOLGE.md | Ergebnis |
|---|---|---|---|---|
| Kapitel 3 | Frage 4 („Mehr dazu in Kapitel 3“) und Frage 10 („Kapitel 3“) | 1,3 Prozent / Trittbrettfahrer, „zu klein“ | 3 = 02-zu-klein.md | stimmt |
| Kapitel 10 | Frage 8 („Siehe Kapitel 10“) | CO₂-Preis-Korrektur | 10 = 07-korrekturen.md; dort Fall 3 (CO₂-Preis 2027) | stimmt |
| Kapitel 9 | Frage 9 („unabhängige Prüfung … Kapitel 9“) | Prüfverfahren | 9 = 09-so-pruefen-wir.md | stimmt |
| Kapitel 7 | Frage 9 („Ausnahmen und Lücken … Kapitel 7“) | Klimaziel 2040, Analyseplan retrospektiv | 7 = 06-klimaziel.md; Kapitel 10 Fall 6 und 7 verweisen auf Kapitel 7 als explorative Analyse | stimmt inhaltlich |
| Zitat [7] bei „65 Euro rein, 59 Euro raus“ | Frage 9 | Quellenliste | [7] im Quellenverzeichnis = „65 Euro rein, 59 Euro raus“ | stimmt |

Alle Verweise passen zur Nummerierung. Ob die Inhalte der Zielkapitel das Gemeinte tragen, wurde nur für Kapitel 10 (Fall 3, 6, 7) gelesen, nicht für 3 und 9.

## 3. Verträglichkeit Frage 9 mit Kapitel 10 Fall 7 (Hinweis)

Frage 9: „Der Analyseplan wird vor der Rechnung festgelegt, der Code liegt im Repository, und eine unabhängige Prüfung schreibt in der Regel einen Bericht dazu (Kapitel 9). Ausnahmen und Lücken nennen wir, etwa in Kapitel 7.“
Kapitel 10 Fall 7: Der Analyseplan zum Klimaziel-Artikel war „retrospektiv erstellt“, also nach erster Datensichtung.

Einschätzung: Verträglich, aber knapp. Der erste Satz steht ohne „in der Regel“ als Aussage im Präsens und wird von Fall 7 für einen konkreten Artikel widerlegt. Der Folgesatz („Ausnahmen und Lücken nennen wir, etwa in Kapitel 7“) fängt das ab. Kapitel 7 beschreibt die Analyse als explorativ. Es fehlt der direkte Verweis auf Kapitel 10 (Fall 7), wo die Ausnahme als Fehler ausgewiesen ist. Schwere: Hinweis (nur Anregung, keine Änderung gefordert). Mögliche Formulierungsfrage für Daniel: „in der Regel“ auch beim Analyseplan ergänzen.

## 4. Weitere Beobachtungen (nicht durch v0.2 verursacht)

| Nr. | Beobachtung | Schwere |
|---|---|---|
| 4 | Kopfvermerk enthält weiterhin den alten Satz „die Kapitelverweise (hier 2, 7 und 9) sind mit den fertigen Kapiteln abzugleichen“. Er widerspricht dem neuen Eintrag („3, 7, 9, 10 geprüft“). Die tatsächlichen Verweise sind 3, 7, 9, 10. Der Vermerk wird vor Satz entfernt, ist aber intern irreführend. | gering |
| 5 | Der Vermerk nennt „Differenzprüfung 09.11.2026 (Datei in pruefung/stilpass_differenzpruefung_gruppe*)“ und „Freigabe durch Daniel Saure steht aus“. Diese Datei hier ist die v0.2-Differenzprüfung und im Vermerk noch nicht genannt. Keinen Freigabevermerk eingetragen oder verlangt, das ist Sache des Menschen. | Hinweis |
| 6 | Quellenzählung im Text: Frage 6 zitiert [8], Frage 9 zitiert [7]. Die Reihenfolge ist nicht aufsteigend (Verzeichnis ist nach Auftreten nummeriert nur bis [6]). Keine Sachabweichung, vermutlich aus v0.1 übernommen. | gering |
| 7 | Terminologie: Kapitel 1 sagt jetzt „Unsicherheitsspanne“/„Prognosespanne“. Kapitel 10 Fall 4 nennt weiter „Unsicherheitsintervalls“ (Bulletin 42/2022, obere Grenze für 2019). Kapitel 10 Fall 6 sagt „Unsicherheitsspanne“. Uneinheitlich im Gesamtwerk, kein Sachfehler. | gering |
| 8 | Quellenprüfung (Links, Zahlen wie 16.000, 1,63 Grad, 19,6 °C, 31,7 Prozent, 6 Billionen, 150 TWh) war nicht Gegenstand dieser Differenzprüfung und wurde nicht neu durchgeführt. Es gilt der Stand von `faktencheck_kurz_kap08.md` (28.10.2026). Dort steht die Gegenprüfung der Einarbeitung der mittleren Auflagen weiterhin aus. | Hinweis |

## 5. Gesamturteil

Die Änderungen v0.1 nach v0.2 sind rein terminologisch (Intervall zu Spanne, zweimal) plus Kopfvermerk. Laut Diff-Datei hat sich keine Zahl, kein Datum, keine Quelle und kein Vorbehalt verschoben. Kapitelverweise 3, 7, 9, 10 passen zu REIHENFOLGE.md. Die Aussage in Frage 9 ist mit Kapitel 10 Fall 7 verträglich, mit Hinweis auf fehlendes „in der Regel“ beim Analyseplan.

Ergebnis: ok. 0 kritisch, 0 hoch, 0 mittel, 5 gering (Nr. 1, 2, 3, 4, 6, 7 als gering gezählt: tatsächlich 6 gering), 2 Hinweise (Frage 9 und Kapitel 10 Fall 7; Nr. 5 und Nr. 8 als weitere Hinweise).

Korrektur der Zählung zur Klarheit: gering = Nr. 1, 2, 3, 4, 6, 7 (6 Punkte); Hinweise = Frage-9-Abschnitt, Nr. 5, Nr. 8 (3 Punkte).

Einschränkung: Vergleichsbasis war ausschließlich die Diff-Datei, nicht Git. Empfehlung: einmal `git diff d2d320a~1 d2d320a -- Publikationen-oeffentlich/jahrbuch-2026/kurz/08-zehn-fragen.md` ausführen, um Vollständigkeit der Diff-Datei zu bestätigen.
Kein Freigabevermerk geschrieben. Die Kapiteldatei wurde nicht verändert.
