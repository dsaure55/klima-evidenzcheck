# Differenzprüfung Stilpass: Jahrbuch-Kurzfassung Kapitel 10 (Fehlerliste), v0.1 zu v0.2

Datum der Prüfung: 14.11.2026
Geprüfte Datei (v0.2): `Publikationen-oeffentlich/jahrbuch-2026/kurz/07-korrekturen.md`
Vergleichsbasis: Wortdiff `pruefung/diff_kap10_v02_2026-11-14.diff.txt` (v0.1 = `git show ac99c31~1:...`)
Prüfer: faktenpruefer (unabhängig, hat den Text nicht verfasst). Kapitel-Datei nicht verändert. Kein Freigabevermerk.
Platzhalter in eckigen Klammern: bewusst offen, nicht Gegenstand.

## Methode und Grenzen

- Alle Änderungsstellen (Hunks) des Wortdiffs wurden einzeln gelesen und gegen die aktuelle Datei abgeglichen. Alle "+"-Zeilen des Diffs stehen wörtlich in v0.2.
- Der Diff enthält Änderungen nur im Kopfvermerk und in Fall 6 und 7. Es wurden keine Zahl, kein Datum, keine Fallnummer und kein Verweis auf andere Kapitel verändert (geprüft: 407/566/86/328, 598/16, 182/598, 16/532, 486/207, 150, 27. August, 24. Oktober, Kapitel 7).
- Grenze: In dieser Prüfsitzung stand kein Shell-Zugriff zur Verfügung. Der Diff wurde daher nicht selbst mit `git show ac99c31~1:...` neu erzeugt. Dass außerhalb der Hunks nichts geändert wurde, stützt sich auf die Vollständigkeit der gelieferten Diff-Datei (Befund 8).
- Kein Quellenabgleich nötig, da keine Tatsachen neu eingeführt wurden. Die Prüfung ist rein inhaltlich-semantisch.

## Tabelle

| Nr. | Stelle | v0.1 zu v0.2 | Inhaltlich verschoben? | Schweregrad | Hinweis |
|---|---|---|---|---|---|
| 1 | Kopfvermerk | "v0.1 (28.10.2026)," zu "v0.2 (14.11.2026, Stilpass Fachbegriffe; v0.1 vom 28.10.2026)," | Nein | gering | Reine Versionsangabe. Der Vermerk nennt weiter "Stilpass 28.10.2026 (Stilregeln v0.3)" und "Differenzprüfung 09.11.2026"; der v0.2-Stilpass und diese Differenzprüfung sind dort nicht als Stand eingetragen. Formal nachtragen, falls gewünscht. Ohnehin "Vor Satz/Export entfernen". |
| 2 | Fall 6, Hauptverfahren | "das OLS-Prognoseintervall" zu "eine einfache Trendrechnung mit ihrer Unsicherheitsspanne" | Nein, Aussage und Zahlen (407 bis 566, 86 bis 328) unverändert | gering | Verlust: "OLS" und die Fachbezeichnung "Prognoseintervall" entfallen. "Unsicherheitsspanne" ist weiter als Intervall zu verstehen, benennt aber nicht mehr ausdrücklich ein Prognoseintervall (Einzelwert) im Unterschied zu einem Konfidenzintervall. Der Fehler (Mischung der Grenzen zweier Verfahren) bleibt in der Aussage intakt. Das Niveau (z. B. 95 Prozent) wurde auch in v0.1 nicht genannt, also keine neue Lücke. |
| 3 | Fall 6, ARIMA | "kontrollrechnung mit ARIMA" zu "mit einem zweiten Verfahren (ARIMA)" | Nein | gering | "Zweites Verfahren" stand der Sache nach schon (Hauptverfahren vs. Kontrollrechnung) und stützt den Folgesatz "aus beiden Verfahren". Keine Rangverschiebung: Der Satz nennt es weiter "Kontrollrechnung". |
| 4 | Fall 6, "Intervalle" zu "Spannen" (3 Stellen: Klammer 182 bis 598 / 16 bis 532, "außerhalb aller Spannen", "Kapitel 7 nennt die Spannen") | Wortersatz | Nein, Zahlen und Aussage (Ziel 150 außerhalb aller beim Langfrist-Trend, innerhalb aller beim 10-Jahres-Trend) identisch | gering | "Bereiche" (Artikelangaben) und "Spannen" (Modellergebnisse) sind nun nahe Synonyme; die Unterscheidung trägt nur der Kontext. Verweis auf Kapitel 7 ("nennt die Spannen") ist nur stimmig, wenn Kapitel 7 den Begriff ebenfalls verwendet. Nicht Teil dieser Differenzprüfung, bei der Gesamtabstimmung der Kapitel beachten. |
| 5 | Fall 7, Analysestatus | "exploratorisch" zu "erkundend (explorativ)" | Nein | gering | Gleichbedeutend. Die unveränderte Stelle "Kapitel 7 beschreibt die Analyse als explorativ" bleibt konsistent (Begriff wird in Klammer eingeführt). |
| 6 | Fall 7, Analysestatus | "nicht als präregistriert-konfirmatorisch" zu "nicht als vorab festgelegte Prüfung" | Geringfügig: Vorbehalt bleibt erhalten (Analyse ist nicht vorab festgelegt) | gering | Zwei Fachmerkmale (öffentliche Präregistrierung, bestätigende Hypothesenprüfung) werden zu einem alltagssprachlichen Ausdruck zusammengezogen. Der Ausdruck spiegelt zugleich die im Artikel behauptete Formulierung ("vor der Modellierung festgelegt"), wodurch der Gegensatz zur Korrektur klar bleibt. Es wird nicht neu behauptet, dass je eine Präregistrierung existiert hätte oder nicht. |
| 7 | Fall 7, Newey-West | "die Newey-West-Korrektur" zu "die Korrektur für zusammenhängende Jahreswerte (Newey-West)" | Nein | gering | Umschreibung ist fachlich zutreffend (Autokorrelationskorrektur) und der Name bleibt in Klammern. Einschränkung "im Plan nur den Test der Steigung" unverändert. |
| 8 | Fall 7, Prognoseintervall | "Das Prognoseintervall für 2040 ist im Hauptverfahren ein klassisches OLS-Intervall, das ... zu eng ausfällt" zu "Die Spanne für 2040 stammt im Hauptverfahren aus einer klassischen Trendrechnung, die ... zu eng ausfällt" | Nein im Kern, leichte Unschärfe | gering | Das Attribut "tendenziell zu eng" bezog sich in v0.1 auf das Intervall, bezieht sich jetzt grammatisch auf die "Trendrechnung". Sinngemäß ist gemeint, dass die daraus abgeleitete Spanne zu eng ist; ein Leser könnte aber "Trendrechnung ist zu eng" als schief empfinden. Außerdem heißt das Verfahren in Fall 6 "einfache", in Fall 7 "klassische" Trendrechnung: gleicher Gegenstand, zwei Adjektive. Vorschlag (nicht umgesetzt): einheitlich "klassische Trendrechnung" und "Die Spanne ... fällt dadurch tendenziell zu eng aus". |
| 9 | Fall 7, Gekennzeichnet | "zum Intervall" zu "zur Spanne" | Nein | gering | Wortersatz, Aussage gleich. |
| 10 | Gesamtdiff | Vollständigkeit der Diff-Datei | Nicht selbst reproduziert | gering | Siehe Grenzen. Empfehlung: einmal `git diff --word-diff ac99c31~1 ac99c31 -- Publikationen-oeffentlich/jahrbuch-2026/kurz/07-korrekturen.md` gegenlesen, ob nur die genannten Hunks erscheinen. |

## Ausdrücklich geprüft: keine Verschiebung bei

- Zahlen und Datumsangaben: alle unverändert (siehe Methode).
- Vorbehalte und offene Platzhalter: alle Platzhalter in Fall 6 und 7 ("Ursache vor Satz klären", "Entscheidung offen", "Erst nach Klärung der Ursache formulieren") sowie "vorläufig"-Lehren unverändert. Der Vorbehalt "bisher nichts am Artikel geändert" bleibt.
- Kernaussagen: "Das Zeitfenster entscheidet über die Schlagzeile", "Die Zahlen sind davon nicht betroffen" (Fall 7) und "Projektionen selbst (486 und 207 Mt) unberührt" (Fall 6) unverändert.
- Keine neue Berechnung, Inferenz oder Tatsachenbehauptung eingeführt. Die einzige Ergänzung mit Sachgehalt ist die Beschreibung "für zusammenhängende Jahreswerte" bei Newey-West; sie war im selben Absatz bereits vorhanden ("bei zusammenhängenden Jahreswerten tendenziell zu eng") und ist keine neue Aussage.
- "Kurz gesagt"-Absatz, "Unser Grundsatz", Fälle 1 bis 5 und alle folgenden Abschnitte: laut Diff unverändert.

## Gesamturteil

Ergebnis: OK. Der Stilpass v0.2 hat keine Aussage, Zahl, kein Datum und keinen Vorbehalt inhaltlich verschoben.

Befunde: 0 kritisch, 0 hoch, 0 mittel, 10 gering (reine Formulierungs- und Konsistenzhinweise; Nr. 8 ist die einzige mit leichter sprachlicher Unschärfe, Nr. 10 der Prüfvorbehalt zur Diff-Vollständigkeit).

Offen für Daniel Saure: Dieses Dokument ist keine Freigabe. Die erneute Freigabe von v0.2 setzt voraus, dass er den aktuellen Volltext selbst gelesen hat. Platzhalter und die Gegenprüfung der Einarbeitung (Kopfvermerk) bleiben davon unberührt.
