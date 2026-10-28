# Nachtrag zum Differenz-Faktencheck Kurzfassung Kapitel 6 (Jahrbuch 2026), Nachprüfung der Einarbeitung

**Geprüft:** `kurz/06-klimaziel.md` (Stand nach Überarbeitung vom 28.10.2026) gegen `kapitel/04-klimaziel.md` (Langfassung), `pruefung/faktencheck_kurz_kap06.md` (Erstbericht, unverändert) und `Analysen/2026-08-expertenrat-budgetabgleich/Validierungsbericht_expertenrat-budgetabgleich.md`, Nachtrag 4 (Z. 440 bis 476). Kapiteltext und Erstbericht nicht verändert.
**Prüfdatum:** 28.10.2026 · **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). Kein Freigabevermerk. Kein git.
**Methode:** Text gelesen, nicht die Meldung. Quellen und Rechenläufe nicht neu geöffnet. Die Grafik `grafiken/kap04_grafik2_budget_overshoot.png` wurde als Bild gelesen.

## Kurzurteil: ok mit Restauflagen

Alle drei mittleren Befunde (Nr. 1 bis 3) sind behoben, die zurückgeholten Stellen stimmen wörtlich oder sinngleich mit der Langfassung. Quelle [4] und die Bildunterschrift von Grafik 2 sind durch Nachtrag 4 des Validierungsberichts gedeckt. Die drei Platzhalter sind unverändert. Kein mittlerer oder kritischer Befund. Offen: ein neuer geringer Befund (Beschriftung im Bild nennt noch „Fassung 4“) und die geringen Altbefunde 4, 5, 8.

Zählung nach Nachprüfung: kritisch 0, mittel 0, gering offen aus dem Erstbericht 3 (Nr. 4, 5, 8), gering neu 1 (N1).

## Tabelle: frühere mittlere Befunde

| Nr. | Befund (Kurzform) | behoben | Beleg (Zeile Kurztext, Vergleich Lang) |
|---|---|---|---|
| 1 | ARIMA ohne Erklärung (A6, Stilregel 2) | ja | Z. 17: „ein ARIMA-Modell (ein Zeitreihenmodell, bei dem die Unsicherheit mit jedem Jahr weiter in die Zukunft wächst)“. Wortgleich mit Lang Z. 17. Zahlen 390 (182 bis 598) und 274 (16 bis 532) unverändert. |
| 2 | Agora-Satz zur Preisursache fehlte (A2) | ja | Z. 41: „Agora führt den Rückgang größtenteils auf die gestiegenen fossilen Energiepreise zurück.“ Wortgleich mit Lang Z. 42, gleiche Stelle im Satzgefüge, Schlusssatz „einzelne Beobachtung, kein Test [4]“ bleibt. Der in der Langfassung offene Hinweis (Agora-Ursachenangabe verkürzt, Faktencheck Kap. 4 Nachtrag 1, A2) gilt unverändert und nicht zusätzlich. |
| 3 | Prüflage zum 2040-Trend ohne Kontext (Validierungsbericht) | ja | Z. 70: „Der Artikel sprach von einer unabhängigen Prüfung. Dokumentiert ist sie nur in einem Commit-Vermerk vom 27. August („Pilot validiert: R-Ergebnisse matchen Referenzwerte, HAC-Abweichung dokumentiert“), im Repository liegt für diesen Trend kein Validierungsbericht als Datei. Für die Expertenrat-Analyse liegen Validierungsberichte als Dateien vor.“ Sinngleich mit Lang Z. 71; gestrichen bleiben der Lauf-Log-Satz, die Repository-Pfade und „Nach heutigen Maßstäben würden wir dafür einen eigenen Bericht verlangen“. Das ist eine zulässige Kürzung, keine Entschärfung der Kernaussage. |

Formatfehler Nr. 8(a): Leerzeile vor „## Zwei Zeitfenster, zwei Antworten“ ist da (Z. 9 bis 10). Behoben.

## Prüfung Quelle [4] und Grafikunterschrift 2 gegen Validierungsbericht Nachtrag 4

| Angabe im Kurztext | Beleg im Validierungsbericht | Ergebnis |
|---|---|---|
| Quelle [4] (Z. 77): „Analysebericht … Fassung 5, 26.10.2026 (vorläufig …)“ | Nachtrag 4: „Gepruefter Stand: Commit 5bae415 (Fassung 5)“; Datum 26.10.2026 dort nur indirekt (Auflage N4.2(b)/N5.1: Kopf „Fassung 5, 26.10.2026“ setzen); Langfassung nennt dasselbe Datum | bestätigt (Datum indirekt) |
| „Nachprüfung der Fassung 5 durch den Validator liegt seit 28.10.2026 vor“ | Nachtrag 4, „Datum: 28.10.2026“ | bestätigt |
| „freigabefähig mit Auflagen“ | Gesamturteil Fassung 5: „FREIGABEFAEHIG MIT AUFLAGEN. Keine kritischen, keine wesentlichen Befunde“; offen N5.1 (gering, Statuszeile), N5.2 (Hinweis) | bestätigt |
| „Freigabe der Analyse durch Daniel Saure steht aus“ | Nachtrag 4: „die Freigabe der Analyse liegt bei Daniel Saure“; kein Freigabevermerk im Bericht | bestätigt (nicht widerlegt; im Bericht kein Vermerk) |
| Bildunterschrift Grafik 2 (Z. 47): „Analysebericht Fassung 5 (vorläufig; Fassung 5 ergänzt nur die Dokumentation)“ | Nachtrag 4, Diff: nur Textzeilen in Bericht und Protokoll geändert (Kopf, Statuszeile, Absatz 2.4, 9 Zeilen Protokoll); Skript, `output/` (CSV, PNG), Kernzahlen, Intervalle, Klassifikationen unverändert | bestätigt |
| Zahlen in Grafik 2 / Ergebnistext (plus 25 bis plus 584; 8 von 9; 4 von 6; 690 / 41 / 648,8; 327 / 7 / 2,1 / 1,5 / 3,6) | Nachtrag 4: „Kernzahlen … unverändert“; Zahlen im Bericht Nachtrag 1 (W3: +25 bis +584, 8 von 9, 4 von 6, +40,9) abgeglichen; 690 / 41 / 648,8 / 327 / 1,5 / 3,6 in Nachtrag 4 nicht einzeln genannt, nur über „Kernzahlen unverändert“ gedeckt | bestätigt (Teil indirekt) |

## Platzhalter

Vorhanden und wortgleich mit Lang: (1) „[VORLÄUFIG: Dieser Abschnitt beruht … bis zum 13.11.2026 vorliegen.]“ (Z. 33), (2) „[Erläuterung zum 50/50-Pfad am Expertenrat-Wortlaut belegen oder streichen]“ (Z. 35), (3) „[PLATZHALTER (Daniel Saure, 24.10.2026: „Machen wir später“): …]“ (Z. 53). Unverändert.

## Querverweise (alt -> neu)

Kopfzeile „Kapitel 7, Fall 6“ und Z. 70 „Kapitel 7, Fall 7“: stimmen. `kurz/07-korrekturen.md` enthält Fall 6 („Erreicht Deutschland sein Klimaziel 2040?“, Intervalle) und Fall 7 (Arbeitsweise „vor der Modellierung festgelegt“). Z. 65 „auch in Kapitel 7“ stimmt. „Kapitel 10“ unverändert (alt 10 -> 10; Kap. 10 nicht gesichtet). Damit ist der frühere Vorbehalt Nr. 6 aufgelöst.

## Kurz-gesagt-Absatz (Z. 4)

Wortgleich mit Lang Z. 4: 88 Prozent bis 2040 gegenüber 1990, höchstens rund 150 Millionen Tonnen, zwei Zeitfenster, „keine Prognose“, Budget 2030 nicht entscheidbar. Durch Haupttext gedeckt, Zahlen stimmen weiter (486 / 207 / 150; 407 bis 566; 86 bis 328).

## Neue Befunde

| Nr. | Stelle | Befund | Schweregrad | Vorschlag |
|---|---|---|---|---|
| N1 | Grafik 2 (PNG `kap04_grafik2_budget_overshoot.png`) gegen Bildunterschrift Z. 47 und Quelle [4] | Die Bildunterschrift (und Quelle [4]) nennen „Fassung 5“. Das PNG trägt in der eingebetteten Quellenzeile „Analysebericht Fassung 4, vorläufig, nicht freigegeben“. Zahlen und Aussagen sind laut Nachtrag 4 unverändert, nur das Etikett im Bild passt nicht zur Unterschrift. Das ist der bereits in Erstbericht Nr. 5(c) genannte eingebettete „vorläufig, nicht freigegeben“-Hinweis, jetzt mit abweichender Fassungsangabe. | gering | Vor Satz Grafik neu erzeugen oder Unterschrift auf „Zahlen unverändert seit Fassung 4“ präzisieren; Bildhinweis ohnehin vor Satz entfernen. |

Beim Einarbeiten sind sonst keine neuen Fehler, Zuspitzungen oder Zahlen entstanden. Eine Formulierungsänderung (Z. 23: „Das Zeitfenster entscheidet über die Schlagzeile: ‚Deutschland auf Kurs‘ oder ‚Deutschland verfehlt sein Ziel deutlich‘. Beides wäre … technisch korrekt“ statt der Langfassung mit Zuordnung 10-Jahres-Trend / Langfrist-Trend) ist sinngleich, verliert aber die Zuordnung, welches Fenster zu welcher Schlagzeile führt. Hinweis, kein Befund.

## Offene geringe Befunde aus dem Erstbericht

| Nr. | Stand | Beleg |
|---|---|---|
| 4 | offen: „Hauptverfahren“ nicht benannt („OLS“ fehlt), „deutlich“ ohne Durbin-Watson-Beleg; „mit je drei Verfahren“ in Grafik 2 nicht erklärt | Z. 29, Z. 47 |
| 5 | offen: Kopfzeile erwähnt nicht N3 (Redaktionsschluss-Satz nur Stand 22.10.), N4 („Der Prüfstein kommt noch“, Verknüpfung als Inferenz), A13 (Hinweis im Bild), N1 (Nachprüfung Fassung 5 liegt jetzt vor, steht nur in Quelle [4]) | Z. 2, Z. 53, Z. 66, Z. 77 |
| 8 | teilweise: (a) Leerzeile erledigt; (b) Ergebnis-Satz 2 weiter lang mit Klammer und drei Teilen | Z. 42 |

Nr. 7 (keine Änderung nötig): unverändert, in Ordnung. Nr. 6 (Querverweise): erledigt, siehe oben.

## Nicht geprüft

Rechenläufe, Analysebericht, Expertenrat-Prüfbericht, Agora-Primärquelle nicht erneut geöffnet. Kapitel 10 der Kurzfassung nicht gesichtet.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
