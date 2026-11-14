# Differenzprüfung Jahrbuch-Kurzfassung Kapitel 10 (Fehlerliste), Fall 4, v0.2 zu v0.3

Datum: 14.11.2026. Prüfer: faktenpruefer (unabhängig, nicht Autor). Kapitel-Datei nicht verändert. **Kein Freigabevermerk.**
Geprüft: `kurz/07-korrekturen.md` (v0.3), Wortdiff `pruefung/diff_kap10_v03_2026-11-14.diff.txt`.
Gegengelesen: `kurz/04-sommer.md` (Absatz "Viertens ..."), `Analysen/2026-08-hitzesommer-2026/SAP_hitzesommer-2026.md` (Abschnitte 3 Schritt 5, 4, 8.1), `Analysen/2026-08-hitzesommer-2026/run_log.txt` (Schritt 5c), Live-Artikel [5] (Abruf 14.11.2026).

## Grenzen

- Kein Shell-Zugriff: Der Diff wurde nicht neu erzeugt. Alle vier Hunks des Diffs wurden gelesen und stehen wörtlich in v0.3.
- Das "Laufprotokoll" ist als `run_log.txt` abgelegt (Skriptlauf 29.08.2026 12:50:47). Die Datei enthält keinen Artikel-Zeitstempel.
- Der Live-Artikel wurde über einen Abrufdienst mit Textzusammenfassung gelesen, nicht im Rohtext. Die Fundstelle (Abschnitt) ist deshalb nicht sicher bestimmt.
- Die Entscheidung Daniel Saure (Chat, 14.11.2026, "letzteres bleibt so") ist als Chat nicht prüfbar. Belegt ist nur, dass Kopfvermerk Kap. 10 und Kopfvermerk Kap. 5 sie gleichlautend wiedergeben.

## Befunde

| Nr. | Stelle | Befund | Schweregrad |
|---|---|---|---|
| 1 | (a) "Im Analyseplan stand für 2018 eine Vergleichszahl von 9.400" | Sachlich gedeckt: SAP 8.1 und Abschnitt 3 Schritt 5 nennen für 2018 "aktuell zitiert: rund 9.400" (frühere Quellen: rund 8.500). Aber "Vergleichszahl" ist etwas stärker als der SAP: Dort ist die Zahl ausdrücklich "reiner Kontext", keine Analysegröße. Kap. 5 sagt genauer "als Kontext die Zahl 9.400" und "mit einer Vergleichszahl nicht gerechnet". Der Wegfall von "kursierte" und "Der Analyseplan nennt sie" verschiebt die Bedeutung nicht, die Herkunft "im SAP als zitierter Wert" bleibt korrekt. Hinweis: "Vergleichszahl" ist auch das Wort des Artikels. | gering |
| 2 | (b) "Nicht belegt ist nur die Erklärung im Abschnitt „Was das nicht bedeutet“" | "Nicht belegt" ist mit Kap. 5 ("nicht belegt"), dem Satz "Diese Erklärung ist nicht belegt" im selben Fall und dem "Kurz gesagt" (unbelegte Erklärung) konsistent; der Widerspruch "falsch" in v0.2 ist behoben. Die Fundstelle ist dagegen nicht bestätigt: Der Live-Artikel formuliert die Verwechslung ("bei der Prüfung einer im Vorfeld kursierenden Vergleichszahl für 2018 haben wir selbst eine Verwechslung in einer Sekundärquelle aufgedeckt (korrekter Wert: rund 8.500, nicht 9.400)") laut Abruf unter "Zweitens". Der Abschnitt "Was das nicht bedeutet" hat ein eigenes "Zweitens" (Erhebungsmethodik) ohne diese Stelle. Die Abschnittsangabe stammt unverändert aus v0.1/v0.2, wird aber bei jetzt bestehender Konsistenzprüfung relevant. Ebenfalls nicht abgedeckt: Der Artikel nennt 8.500 als "korrekten Wert", das Kapitel spricht nur von dem Wert, mit dem gerechnet wurde. | mittel |
| 3 | (c) "Am Artikel auf Substack ist nichts geändert, und dabei bleibt es." | Tatsache bestätigt: Am Live-Artikel steht kein Korrektur- oder Aktualisierungshinweis. Bedeutungsverschiebung: Aus "bisher nichts, Entscheidung offen" wird eine endgültige öffentliche Zusage. Sie hat nur den Chat als Beleg und wird nicht begründet. Sie steht in Spannung zu "Unser Grundsatz" ("Fehler wollen wir sichtbar korrigieren, wo es geht im Artikel selbst") und zur Lehre desselben Falls ("Wir erklären keine Abweichung, die wir nicht belegen können"): Der Artikel trägt die unbelegte Erklärung weiter. Die Spannung ist offengelegt (die Überschrift lautet weiter "Gekennzeichnet"), aber ohne Begründung für den Verzicht. Zudem sagen Fall 5 bis 7 "bisher nichts, Entscheidung offen". Fall 4 wird damit anders behandelt, ohne dass das erklärt wird. Redaktionelle Entscheidung bei Daniel Saure. | mittel |
| 4 | Satz "Der Artikel erschien am selben Tag und sprach trotzdem von einer aufgedeckten Verwechslung." zusammen mit Platzhalter "[Reihenfolge am selben Tag vor Satz klären.]" | Inhaltlich gedeckt: Run-Log Schritt 5c (29.08.2026) hält fest, dass "~9.400" für 2018 in keiner der drei Primärquellen (EB-42-2022, EB-26-2023, EB-19-2025) reproduzierbar ist; der Artikel ist vom 29.08.2026 und spricht von "aufgedeckt". Das Log nennt die Verwechslung selbst nur eine "unbestätigte, wenn auch begründete Vermutung". Aber: "trotzdem" behauptet, das Log lag vor dem Artikel. Genau das sagt der Platzhalter als ungeklärt. Das Log hat Skriptlauf-Zeit 12:50:47, der Artikel keine abrufbare Uhrzeit. Der Satz und der Platzhalter widersprechen sich also: Der Satz entscheidet die Reihenfolge, der Platzhalter lässt sie offen. Entweder "trotzdem" streichen (z. B. "Der Artikel erschien am selben Tag und sprach von einer aufgedeckten Verwechslung") oder die Reihenfolge klären. Beides wurde durch v0.3 nicht berührt, ist aber mit (a) und (c) im Absatz jetzt der einzige verbleibende Platzhalter von Fall 4. | mittel |
| 5 | Satz "Möglicherweise stammt sie aus dem Bulletin 42/2022" | Fakten bestätigt (Run-Log: "2019 6.900 [4.000; 9.400]" in EB-42-2022, einziges Vorkommen von 9.400; als Vermutung markiert, im Kapitel ebenso: "Das ist eine Vermutung"). Durch die Streichung von "Der Analyseplan nennt sie" steht die Zahl 9.400 jetzt weiter vorn und mit mehr Sätzen Abstand. Das Wort "sie" bezieht sich grammatisch auf "Verwechslung" (letztes Femininum), gemeint ist die Zahl 9.400. Kap. 5 sagt klar "die 9.400 ... stammt sie". | gering |
| 6 | Kopfvermerk Kap. 10 (d) | Bestätigt: v0.3 nennt die Änderungen zutreffend und stellt klar, dass die Freigabe von v0.2 für v0.3 nicht gilt. Der Kopf widerspricht sich aber selbst: Er sagt "Hinweis auf Substack entschieden", führt aber unter "Hinweis: Offen sind ... ob und wann Hinweise auf Substack gesetzt werden (Fall 4 bis 7 ...)" Fall 4 weiter als offen. Außerdem benennt er den Platzhalter in Fall 4 nicht, nur die Wegnahme der Entscheidung. Kopf ist "vor Satz/Export entfernen", daher nur redaktionell. | gering |
| 7 | Kopfvermerk Kap. 5 (nicht Prüfgegenstand, aber Querkonsistenz) | Der Kopf von `kurz/04-sommer.md` sagt noch: Kap. 10 sage dort "falsch" (anzugleichen) und "zwei Platzhalter in Kapitel 10 Fall 4 sind offen". Nach v0.3 stimmt beides nicht mehr (kein "falsch", nur noch ein Platzhalter). Der Fließtext von Kap. 5 ist unberührt und konsistent. | gering |
| 8 | Prüfumfang | Diff nicht selbst erzeugt, Artikel nur über Abrufdienst gelesen, Chat-Entscheidung nicht prüfbar (siehe Grenzen). | gering |

## Bestätigt (ohne Befund)

- Kap. 10 Fall 4 und Kap. 5 "Viertens" stimmen in Zahlen und Quellen überein: 9.400 (2018) im Analyseplan; gerechnet mit rund 8.500 (EB 19/2025, Run-Log: 8.500 [7.100; 10.100]); 9.400 in keiner der drei RKI-Ausgaben (2022, 2023, 2025) bestätigt (Run-Log Schritt 5c); 9.400 = obere Grenze für 2019 in EB-42-2022; Erklärung nicht belegt.
- Verweis "Schritt 5c" im Laufprotokoll stimmt (dort "(c) Jahresweise Quellenabweichung ... 2018"). Dass Kap. 10 "Laufprotokoll vom 29. August" schreibt, stimmt mit dem Datum des Skriptlaufs überein.
- Keine neue Berechnung, Inferenz oder neue Zahl in den Änderungen (a) bis (d). Neu sind nur die Entscheidungsaussage (c) und die Begriffsänderung (b).
- Kap. 10 und Kap. 5 verweisen wechselseitig aufeinander ("ebenso in Kapitel 5" / "mehr dazu in Kapitel 10").

## Gesamturteil

Ergebnis: **ok mit Auflagen**. Änderung (a) und (b) sind konsistent mit Kap. 5, SAP und Run-Log. Änderung (c) ist sachlich richtig (kein Hinweis am Artikel), aber inhaltlich eine neue endgültige Zusage mit offener Spannung zum Grundsatz des Kapitels. Der Satz mit "trotzdem" und der Platzhalter zur Reihenfolge passen nicht zusammen.

Befunde insgesamt: **8** (0 kritisch, 0 hoch, 3 mittel (Nr. 2, 3, 4), 5 gering (Nr. 1, 5, 6, 7, 8)).

Auflagen vor Freigabe (mittel): (1) Fundstelle "Was das nicht bedeutet" am Live-Artikel im Rohtext prüfen und ggf. korrigieren; (2) Begründung oder Einordnung des Verzichts auf einen Hinweis zur Spannung mit dem Grundsatz klären (Entscheidung Daniel Saure); (3) "trotzdem" streichen oder Reihenfolge klären, dann Platzhalter entfernen.

Dieses Dokument ist keine Freigabe. Die erneute Freigabe von v0.3 setzt voraus, dass Daniel Saure den aktuellen Volltext selbst gelesen hat.
