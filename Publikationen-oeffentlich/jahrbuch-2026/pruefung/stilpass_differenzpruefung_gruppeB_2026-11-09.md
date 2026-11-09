# Differenzprüfung Stilpass, Gruppe B (Kurzfassung Kapitel Sommer, Welt, Klimaziel, Korrekturen)

**Datum:** 09.11.2026 · **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor) · **Ablauf:** `stilregeln.md` v0.3, Punkt 3.
**Geprüfte Dateien:** `kurz/04-sommer.md` (Titel: Kapitel 5), `kurz/05-welt.md` (Kapitel 6), `kurz/06-klimaziel.md` (Kapitel 7), `kurz/07-korrekturen.md` (Kapitel 10). Nicht Teil der Prüfung: `04b-kasten-hitzezahlen.md`.
**Kapitel wurden nicht verändert. Dieses Dokument enthält keinen Freigabevermerk.**

## Methode (Stand dieser Fassung: nachträglich auf HEAD-Basis)

Erste Fassung dieser Datei (ohne Git) verglich gegen Langfassung und Prüfdateien. Diese Fassung ersetzt sie. Grundlage ist jetzt der **Wort-Diff HEAD gegen Arbeitskopie** (`git diff --word-diff=plain -U1 HEAD`, vom Aufrufer erzeugt, Ablage im Scratchpad `stildiff/0[4-7]-*.worddiff.txt`). "Alt" = HEAD-Wortlaut, "Neu" = Arbeitskopie. **Jeder Hunk der vier Diffs wurde einzeln geprüft.** Ich selbst habe weder Git ausgeführt noch die Diffs erzeugt; ich habe sie mit der Arbeitskopie (vollständig gelesen) abgeglichen, sie stimmen überein.

Befunde, die nicht im Diff stehen (schon in HEAD vorhanden), sind unten getrennt als **Altlasten** geführt. Sie sind nicht durch den Stilpass entstanden, sind mir aber beim Vergleich mit der Langfassung aufgefallen.

Schweregrade: **kritisch** = Zahl, Quelle oder Aussage inhaltlich anders; **mittel** = Vorbehalt oder Zuordnung verloren, verstärkt oder neu; **gering** = Nuance, Verständlichkeit, Stil; **Hinweis** = geprüft, kein Mangel.

## Gesamtübersicht

| Kapitel (Datei) | Zahlen / Daten / Namen / Quellen [n] | Aussagen und Vorbehalte | Gesamturteil Stilpass |
|---|---|---|---|
| 5 Sommer (`04-sommer.md`) | unverändert | keine Änderung; zwei Verständlichkeits-Nuancen (gering) | **ok** |
| 6 Welt (`05-welt.md`) | unverändert | **eine Abschwächung eines Vorbehalts (mittel, B5-1)**, mehrere Nuancen (gering) | **ok mit Auflage** (B5-1) |
| 7 Klimaziel (`06-klimaziel.md`) | unverändert | keine Änderung (gering: "nur", Reihenfolge) | **ok** |
| 10 Korrekturen (`07-korrekturen.md`) | unverändert | keine Änderung von Fakten; Lehren-Absatz jetzt im Präsens (gering, Grenzfall) | **ok** |

Kritisch: 0. Mittel: 1. Keine Zahl, kein Datum, kein Name, kein Zitat, keine Quellenangabe [n] und kein Quellenverzeichnis wurde durch den Stilpass verändert. Die Kopfzeilen erhielten nur den Zusatz "Stilpass 28.10.2026 (Stilregeln v0.3), Differenzprüfung steht aus." (in allen vier Dateien; Hinweis, kein Mangel).

---

## Kapitel 5 – Sommer (`04-sommer.md`)

Alle Hunks geprüft. Rein formale Änderungen ohne Befund (Doppelpunkt zu Punkt, Satzumstellung, Wortersatz bei gleicher Aussage): Kurz gesagt ("Sterbefälle:" → "Sterbefälle."); Fuchs-Zeile (Doppelpunkt → Komma, Konjunktiv bleibt, Zitat "extrem ungewöhnlich" unverändert); "Einstufung … als Konvention vor der Auswertung festgelegt" (gleiche Aussage); Fortschreibungsabsatz (Absätze vertauscht und "Wichtig:" gestrichen; Zahlen 2051 / 2038–2075 / 2033 / 2023–2049 / knapp 0,5 Grad unverändert; "keine Klimaprojektion" und "steckt nicht in unseren Intervallen" bleiben; "wirklich" gestrichen, Aussage gleich); Perzentil-Absatz (zwei Sätze zusammengelegt, 0,09 Grad und "Größenordnung möglicher Nachkorrekturen am vorläufigen Wert [1]" bleiben); "2026 liegt deutlich darüber."; "Das Modell passt nicht perfekt."; RKI-Absatz ("Der Abgleich ist beschreibend und keine neue Rechnung [5]"); Medienabsatz ("deshalb", "ihre Methode ist aber beschrieben", Qualitätsmessung-Satz zusammengelegt, [5][8] unverändert); "Eine Absicht der Redaktionen zeigen die Zahlen nicht."; Was-heißt-das-Punkt 1; Woher-Absatz (Temperaturen, Stand 2. September, Werte vorläufig, 1992–2025, Metaanalyse unverändert).

| Nr. | Schwere | Fundstelle | Alt (HEAD) | Neu | Bewertung |
|---|---|---|---|---|---|
| S4-1 | gering | "Die Behauptung", Schluss | "Wir haben vorab festgelegt, womit wir vergleichen, und dann nachgerechnet." | "Prüfen lässt sich das nur, wenn man sagt, womit man vergleicht. **Das** haben wir vorab festgelegt und dann nachgerechnet." | Aussage bleibt ("vorab festgelegt" erhalten). Der Bezug von "Das" ist weniger eindeutig (der Vergleichsmaßstab oder das Prüfen). Leicht ungenauer, keine Veränderung der Aussage. |
| S4-2 | gering | Absatz "Bei der Zahl sind vier Punkte zu beachten" | Vier Aufzählungspunkte mit Schlagwort-Köpfen ("Schätzung, nicht Zählung", "Nicht altersbereinigt", "Methodik im Wandel", "Eine Vergleichszahl, mit der wir nicht gerechnet haben") | Fließtext: erster und zweiter Punkt ohne Zähler, dann "**Drittens** hat sich die Methodik geändert:", "**Viertens** haben wir mit einer Vergleichszahl nicht gerechnet." | Inhalt aller vier Punkte wörtlich gleich (inkl. "und mit diesen Daten lässt es sich nicht trennen", "Wir können nicht ausschließen", "Möglicherweise", "nicht abschließend geklärt", "nicht belegt"; [3][4][5][6] bleiben). Zählung "Drittens/Viertens" ohne "Erstens/Zweitens"; ein neuer Doppelpunkt. Stilfrage, keine Aussageänderung. |
| S4-3 | Hinweis | RKI-Absatz, letzter Satz | "Die Schätzung aus KW 37 ist noch nicht die endgültige Jahresschätzung." | "… ist **die letzte der Saison, aber** noch nicht die endgültige Jahresschätzung." | Neu hinzugekommen ist nur die Wiederholung dessen, was der erste Satz des Absatzes ("Im letzten Wochenbericht der Saison") schon sagt. Keine neue Aussage. |
| S4-4 | Hinweis | Überschrift "Temperatur" | "drei Maßstäbe, drei Antworten" | "drei Maßstäbe" | Überschrift gekürzt, keine inhaltliche Aussage verloren. |
| S4-5 | Hinweis | "Lagen wir richtig?" | vier Punkte mit fetten Köpfen ("Noch offen:", "Nicht geprüft:", "Wie es weitergeht:") | Köpfe gestrichen, Inhalt der Punkte unverändert | Aussagen gleich. |

**Altlasten (nicht durch Stilpass, schon in HEAD; Vergleich mit Langfassung):** (a) "Woher wir das wissen": "**Die Analysepläne** haben wir vor Sichtung der Daten festgelegt." Die Langfassung sagt das im Singular nur für den Temperaturplan; ob der Sterbefall-Plan ebenfalls vor Datensichtung festgelegt war, ist gegen `faktencheck_kap01.md` zu belegen (gering bis mittel). Entfallen sind dort auch "Abweichungen protokolliert", "Kernzahlen unabhängig validieren lassen" und "2026 aus der Modellbildung ausgeschlossen". (b) "Lagen wir richtig?": "Termine können sich verschieben" fehlt (HEAD). (c) "Wie wir diese Jahresschätzungen … wie einzelne Studien behandelt" fehlt (HEAD).

**Gesamturteil Kapitel 5: ok.** Der Stilpass hat keine Aussage, Zahl, Einschränkung, Quellenangabe oder keinen Vorbehalt verändert.

---

## Kapitel 6 – Welt (`05-welt.md`)

Rein formale Änderungen ohne Befund: "Trotzdem geht das UNEP" → "Das UNEP geht trotzdem" (gleich); "Doppelpunkt zu Punkt" an mehreren Stellen; Copernicus-Satz in Konjunktiv (siehe S5-5); "stellt ausdrücklich fest" → "hält ausdrücklich fest" (gleich); RONI-Satz umgestellt (gleiche Aussage, [11]); "Umgekehrt stimmt auch der Satz … nicht. Die Schwelle ist nah, das zeigen die Monate …" ([1]); UNEP-Titel-Satz umgestellt ([12][13]); Szenario-Satz ("Setzen die Minderungen sofort ein und sind sie sehr streng" = "Mit sofort einsetzenden, sehr strengen Minderungen"; 66 Prozent, 1,7 bis 1,8, etwa 50 Prozent, [12][13] bleiben); "Die gute Nachricht:" → "Erfreulich ist:" (gleiche Wertung); CDR-Definition (Doppelpunkt/"aber" gestrichen); 40-Prozent-Satz; "wächst mit der Zeit auf 1,2 (2035) und 5,2 (2050)" (Zahlen/Einheit gleich); "Einfach ist das nicht."; 320-Milliarden-Absatz ("Ob das gelingt, nennt UNEP selbst unsicher [12][13]" = gleiche Aussage); Aufzählung "Was die Daten nicht zeigen" zu Fließtext ("Annahmen, keine Messungen [13]"; UNEP-Beleg [12] bleibt); Was-heißt-das-Punkt 3; "Lagen wir richtig?" ohne fette Köpfe; Woher-Absatz.

| Nr. | Schwere | Fundstelle | Alt (HEAD) | Neu | Bewertung |
|---|---|---|---|---|---|
| **S5-1** | **mittel** | "Der Weg zurück", Absatz "Wo die Welt heute hinsteuert" | "**Mit 66 Prozent Wahrscheinlichkeit bleibt** die Erwärmung bis 2100 **unter folgenden Werten**. Bei aktueller Politik sind es 2,8 Grad … sind es 2,6 Grad. Im optimistischsten Fall … sind es 2,1 Grad [13]." (Obergrenze und 66 Prozent gelten für alle drei Werte) | "Bei aktueller Politik bleibt die Erwärmung bis 2100 mit 66 Prozent Wahrscheinlichkeit unter 2,8 Grad … bleibt sie mit derselben Wahrscheinlichkeit unter 2,6 Grad. Im optimistischsten Fall, mit allen Zusagen und zusätzlichen Netto-null-Zielen, **sind es 2,1 Grad** [13]." | Beim dritten Wert fehlen "unter" und der 66-Prozent-Bezug. "sind es 2,1 Grad" liest sich als Punktwert. Das ist eine **Abschwächung des Vorbehalts**, den Kapitel 10 (Fall 5) gerade als zuvor fehlend rügt. Auflage: "bleibt sie mit derselben Wahrscheinlichkeit unter 2,1 Grad" (oder Satzstellung, die den Bezug trägt). |
| S5-2 | gering | "Kurz gesagt" Satz 1 | "bedeutet nicht, dass das Pariser Ziel gerissen ist" | "heißt **noch** nicht, dass das Pariser Ziel gerissen ist" | "noch nicht" legt nahe, dass es später passiert. Die Quelle sagt das nicht, die Langfassung auch nicht. Wortwahl-Verschiebung; zurück auf "bedeutet nicht". |
| S5-3 | gering | "Was heißt das für dich?", Punkt 1 | "Ein warmer Monat und ein verfehltes Ziel sind zwei verschiedene Aussagen." | "Ein warmer Monat sagt **noch nichts über** ein verfehltes Ziel." | Wie S5-2 ("noch"); zudem von einer Feststellung der Verschiedenheit zu einer Aussage über Aussagekraft. Gering. |
| S5-4 | gering | "Wie das Ziel gemessen wird" | "Ein Monat mit 1,63 Grad sagt also viel darüber, wie warm es gerade ist, aber nicht, ob das Pariser Ziel verfehlt ist." | "Ein Monat mit 1,63 Grad zeigt, wie warm es gerade ist. Ob das Pariser Ziel verfehlt ist, lässt sich daraus **allein** nicht ablesen." | Mit "allein" kommt eine Einschränkung hinzu (entspricht der Langfassung). Die Aussage wird dadurch minimal weicher, aber nicht falsch. Hinweis-nah; in Kombination mit S5-2/S5-3 wirkt der Stilpass an dieser Stelle uneinheitlich (einmal weicher, zweimal "noch"). |
| S5-5 | gering | "Was gemessen wurde" | "Copernicus meldete am 12. Oktober 2026: Der September 2026 **war** weltweit der zweitwärmste September … gewesen" | "… meldete am 12. Oktober 2026, der September 2026 **sei** weltweit der zweitwärmste September seit Beginn der Datenreihe **gewesen**." | Wechsel in indirekte Rede (Konjunktiv). Zahlen und [1] unverändert. Konjunktiv kann Distanz zur Meldung signalisieren, ist aber korrekt als Berichtsform. Hinweis/gering. |
| S5-6 | gering | CDR-Absatz "Später holen wir das CO₂ …" | "Die Jahre 2026 bis 2030 nennt der Bericht **entscheidend**, weil der Aufbau dieser Verfahren Zeit braucht [14]." | "Auf die Jahre 2026 bis 2030 kommt es laut Bericht **besonders** an, weil …" | "entscheidend" → "besonders": **schwächer** als die Quellenformulierung (Regel 5 verlangt ein konkretes Wort, die Grenzen verlangen gleiche Stärke). Vorschlag: "ankommt es laut Bericht entscheidend" ist verboten; besser "sind laut Bericht die wichtigsten Jahre" oder "kommt es laut Bericht vor allem an". Im Zweifel: Abweichung. |
| S5-7 | gering | Absatz vor der Tabelle | "Was dafür nötig wäre, im Vergleich zu den neuen Zusagen der Staaten (…):" | "Die Tabelle stellt gegenüber, was dafür nötig wäre und was die neuen Zusagen der Staaten **bringen** (…)." | "bringen" sagt Wirkung der Zusagen aus; der Vorbehalt "bei voller Umsetzung" steht in der Tabellenüberschrift und in "Kurz gesagt". Aussage nicht falsch, aber der Vorbehalt steht jetzt nur in der Tabelle. Hinweis/gering. |
| S5-8 | Hinweis | "Lagen wir richtig?", Punkt 1 | "Das lässt sich noch nicht sagen: Der Zeitraum ist noch nicht abgeschlossen." | "Ob das so kommt, lässt sich noch nicht sagen, denn der Zeitraum ist noch nicht abgeschlossen." | Aussage gleich. |

**Altlasten (in HEAD, nicht Stilpass):** (a) Kopfzeile verweist auf "Kapitel 7, Fall 5"; das Korrekturkapitel heißt jetzt "Kapitel 10" (veralteter Querverweis, in der zu entfernenden Kopfzeile, gering/mittel). (b) "Das Abscheiden von CO₂ am Schornstein" ohne "eines Kohle- oder Gaskraftwerks" (Langfassung). (c) "Die Lücke von 0,3 …" ohne "Der Bericht beziffert" (Langfassung). (d) "laut Bericht" nach UNEP-Absatz mehrdeutig. (e) Vergleichbarkeitsvorbehalt aus Grafik 1 der Langfassung fehlt. (f) "Fast alles stimmt" ohne Aufzählung dessen, was die Zusammenfassung ergänzt.

**Gesamturteil Kapitel 6: ok mit Auflage.** Auflage: S5-1 (Obergrenze/Wahrscheinlichkeit auch bei 2,1 Grad). Empfohlen: S5-2, S5-3 ("noch" streichen), S5-6 ("besonders" prüfen).

---

## Kapitel 7 – Klimaziel (`06-klimaziel.md`)

Alle Hunks geprüft. Ohne Befund: "Kurz gesagt" ("betrachtet:" → "."; "klar verfehlt" → "deutlich verfehlt", gleiche Stärke); Zeitfenster-Absatz (Aufzählung zu Fließtext; 486, 407–566, Ziel 150 "weit außerhalb", 207, 86–328, "im Intervall, aber nicht in der Mitte", ARIMA 390 (182–598) / 274 (16–532), "liegt das Ziel außerhalb aller Intervalle, … innerhalb" unverändert; Erklärung des Prognoseintervalls und des ARIMA-Modells erhalten; "nachgerechnet" → "fortgeschrieben" beschreibt dieselbe Handlung); Budgetabsatz (6.199, ohne Landnutzung, Mai 2026, 4,5 / 0,07 Prozent, 60 bis 100, beide Platzhalter-Texte unverändert); "Das Ergebnis hat drei Teile": Halbjahreswert (327, 7, 2,1 Prozent, "Agora selbst nennt rund 2 Prozent", Agora-Ursachensatz, minus 1,5 / minus 3,6, "vorläufige Schätzung und eine einzelne Beobachtung, kein Test [4]"), zweiter Teil (plus 25 bis plus 584, Korridor 60 bis 100, 8 von 9, 4 von 6, "eingehaltenes Budget [4]"), dritter Teil (690, 41, 648,8) wörtlich gleich in der Aussage; "Dazu ein Vorbehalt:" ("Zum Schluss … den wir ernst nehmen" gestrichen, Vorbehalt zur Expertenrat-Methode bleibt); Prognose-Check-Absatz (nur Doppelpunkt; Platzhalter unverändert); Was-heißt-das; Lagen-wir-richtig (486, 207, 407–598/407–566, 16–328/86–328 unverändert).

| Nr. | Schwere | Fundstelle | Alt (HEAD) | Neu | Bewertung |
|---|---|---|---|---|---|
| S6-1 | gering | "Was die Rechnung nicht ist" | "Wir zeigen, ob die bisherigen Trends, einfach fortgeschrieben, mit dem Ziel zusammenpassen." | "Wir zeigen **nur**, ob …" | "nur" kommt hinzu. Es verengt eine Selbstbeschreibung (Einschränkung, keine Verstärkung der Aussage über Ergebnisse). Hinweis/gering. |
| S6-2 | gering | Absatz nach Grafik 1 | "Das Zeitfenster entscheidet über die Schlagzeile: „Deutschland auf Kurs“ oder „Deutschland verfehlt sein Ziel deutlich“. Beides wäre mit denselben Daten technisch korrekt …" | "Je nach Zeitfenster **lautet die Schlagzeile** „Deutschland auf Kurs“ oder … Mit denselben öffentlichen Daten wäre beides technisch korrekt …" | Die Aussage "das Zeitfenster entscheidet über die Schlagzeile" ist jetzt "lautet die Schlagzeile": gleiche Stärke, beides tatsächlich im HEAD ähnlich. Konjunktiv "wäre" bleibt. Hinweis. |
| S6-3 | Hinweis | "Was heißt das für dich?" | "Das ist keine Beruhigung und kein Alarm, es zeigt nur …" | "Das beruhigt nicht und alarmiert nicht. Es zeigt nur …" | Aussage gleich. |

**Altlasten (in HEAD, nicht Stilpass):** (a) Quelle [4]: "Nachprüfung der Fassung 5 durch den Validator **liegt seit 28.10.2026 vor: freigabefähig mit Auflagen** …" (Langfassung und Differenz-Faktencheck vom 28.10.: "ausstehend") sowie Unterschrift Grafik 2: "Analysebericht **Fassung 5** (vorläufig; **Fassung 5 ergänzt nur die Dokumentation**)" (Faktencheck-Stand 28.10.: "Fassung 4"). Das sind neue Tatsachenangaben nach dem geprüften Stand, **nicht durch den Stilpass**; ich konnte die Validierungsdatei nicht öffnen und habe sie nicht belegt. Vor Freigabe gegen den Nachprüfungsbericht und den Analysebericht Fassung 5 prüfen (mittel). (b) "Prognose-Check": "gesamt und je Sektor" fehlt (Langfassung). (c) "Hauptverfahren" nicht definiert, "OLS" und Durbin-Watson fehlen (Faktencheck Nr. 4).

**Gesamturteil Kapitel 7: ok.** Der Stilpass hat keine Zahl, Quellenangabe oder Einschränkung verändert; die Altlast (a) ist unabhängig davon zu klären.

---

## Kapitel 10 – Korrekturen (`07-korrekturen.md`)

Alle Hunks geprüft. Ohne Befund: "Kurz gesagt" (Aufzählung in Sätze umgeschrieben, Zählung unverändert: zwei Artikel Zahlen, ein Verweis, ein Gesetzgebungsstand, eine Erklärung, eine Quelle, eine Arbeitsweise; "Keine Korrektur hat die Kernaussage eines Artikels umgeworfen." erhalten); "uns aufgefallen, nämlich Fall 5, 6 und 7"; Fall 1 (42/62 Milliarden, 1,2/1,6, 21/23 Cent, Brutto, Deutschlandticket, 6,4-Fache, Skript, "unter anderem" erhalten; "diskutierte" → "besprochene"); Fall 2 ("aber" → "jedoch"); Fall 3 (15. Oktober, 17./22. Oktober, "Dass der Bundesrat noch abschließend beraten musste, fehlte."); Fall 4 (9.400/8.500, drei RKI-Ausgaben, Bulletin 42/2022 (2019), "Vermutung", beide Platzhalter); Fall 5 (2,8/2,6/2,1, 66 Prozent, Pressemitteilungs-Zitat; "stimmt" → "gilt"); Fall 6 (407–566, 86–328, 598 / 16, ARIMA 182–598 / 16–532, 24. Oktober); Fall 7 ("retrospektiv erstellt", "exploratorisch und nicht als präregistriert-konfirmatorisch", Newey-West, OLS-Intervall "tendenziell zu eng"); Konverter-Fall ("nie veröffentlicht", "unabhängig nachgerechnet und bestätigt", "Dass keine übrig sind, folgt daraus nicht"); Meldeabsatz ("den Artikel und die Stelle"); "Wenn wir etwas nicht belegen können, sagen wir das, auch bei unseren eigenen Erklärungen"; "Lagen wir richtig?" ("Fehler, die wir nicht kennen, fehlen in der Liste" = "Ausgenommen sind Fehler, die wir nicht kennen").

| Nr. | Schwere | Fundstelle | Alt (HEAD) | Neu | Bewertung |
|---|---|---|---|---|---|
| S7-1 | gering (Grenzfall) | "Was wir daraus gelernt haben" | Liste: "Rechenwege nachvollziehbar halten. Was wir versprechen, liegt bei Veröffentlichung bereit. / Verweise und Quellen öffnen. Links und Berichtszahlen werden abgeglichen. / Stand und Datum nennen. … steht, von wann sie sind" | Fließtext im Präsens: "**Wir halten** Rechenwege nachvollziehbar: Was wir versprechen, liegt bei der Veröffentlichung bereit. **Wir öffnen** Verweise und Quellen und gleichen Links und Berichtszahlen ab. … **nennen wir**, von wann sie sind und was noch fehlt." | Aus Lehren/Zielen (infinitiv bzw. Passiv, unter der Überschrift "gelernt haben") wird eine Ist-Beschreibung. Die Fälle 5 bis 7 zeigen, dass die Praxis bis jetzt nicht durchgängig so war. Stärker als der Alt-Wortlaut; zurück auf "Künftig öffnen wir …" / "Wir wollen …" oder Überschrift beibehalten und Lehre-Form wählen. Im Zweifel: Abweichung. |
| S7-2 | gering | Fall 1, "Ursache" | "Das Stück war ein Rechenkommentar, kein Evidenzcheck, ohne Analyseplan und ohne unabhängige Validierung." | "Das Stück war ein Rechenkommentar und kein Evidenzcheck, **es hatte also** weder einen Analyseplan noch eine unabhängige Validierung." | "also" macht aus einer Beschreibung eine Folgerung. Inhaltlich plausibel (Evidenzcheck = mit SAP), aber neue Verknüpfung. Gering. |
| S7-3 | gering | Fall 1, "Lehre" | "Und Eingangsgrößen werden gegen eine zweite, unabhängige Zahl gegengerechnet." | "Eingangsgrößen **rechnen wir mit** einer zweiten, unabhängigen Zahl **gegen**." | Passiv → "wir"; Sinn gleich, Wortlaut holprig. Wie S7-1 leichte Ist-Form. |
| S7-4 | gering | Fall 2, "Ursache" | "Der Link wurde ohne Abgleich des Ziels übernommen. Der Faktencheck prüfte nicht, wohin er führt." | "**Wir haben** den Link übernommen, ohne sein Ziel abzugleichen. **Auch** der Faktencheck prüfte nicht, wohin er führt." | Zuschreibung wird aktiv und persönlich ("Wir"), "Auch" verteilt die Verantwortung. Keine Faktenänderung. Hinweis. |
| S7-5 | gering | "Kurz gesagt" | "bei einem einen falschen Verweis" | "bei einem ein Verweis" (im Satz: "Bei zwei Artikeln waren Zahlen falsch, bei einem ein Verweis, bei einem fehlte …") | "falsch" fehlt beim Verweis; ellipsenbedingt ist es zu ergänzen, steht aber nicht da. Zahl der Fälle unberührt. Vorschlag: "bei einem war ein Verweis falsch". |
| S7-6 | Hinweis | Fall 7, "Was stimmt" | "Die Kernaussage des Artikels: Das Zeitfenster …" | "Die Kernaussage des Artikels **bleibt bestehen**: Das Zeitfenster …" | Gleiche Aussage, unter der Überschrift "Was stimmt" ohnehin gemeint. |
| S7-7 | Hinweis | Konverter-Fall | "Das Verfahren fängt Fehler ab …" | "Das Verfahren fängt **also** Fehler ab …" | "also" neu (Folgerung aus einem Einzelfall). Der Gegen-Vorbehalt "Dass keine übrig sind, folgt daraus nicht" bleibt. |

**Altlasten (in HEAD, nicht Stilpass):** (a) Fall 3, "Die Kanäle": "Dass der Preis eingefroren sei und 2027 bleibe, war nur als Beschlussstand des Bundestags richtig." ohne Subjekt "Sie [die Posts] sprechen davon" (Langfassung). (b) Fall 1 "Ursache" ohne "vorab festgelegten" bei Analyseplan (Langfassung; bereits in HEAD "ohne Analyseplan"). (c) Fall 1 "Gekennzeichnet" "Zahlen korrigiert" statt "korrigiert oder gekennzeichnet". (d) Fall 6 "in den Artikel übernommenen" fehlt. (e) Fall 4 "Möglicherweise stammt sie" mit unklarem Bezug von "sie". (f) Meldeabsatz: Kommentarfunktion und "Wir prüfen es" (Langfassung: "Kontaktmöglichkeit", "Wir prüfen es und").

**Gesamturteil Kapitel 10: ok.** Keine Fakten, Zahlen oder Quellen verändert. Empfohlen: S7-1 (Präsens zurücknehmen), S7-5.

---

## Stilregeln v0.3: Verstöße je Kapitel (nur im Zustand der Arbeitskopie, Fokus Stilpass)

Alle gering.

| Regel | Kapitel 5 Sommer | Kapitel 6 Welt | Kapitel 7 Klimaziel | Kapitel 10 Korrekturen |
|---|---|---|---|---|
| 1 Gegensatzformeln (höchstens eine) | mehrere: "nicht von Totenscheinen, **sondern** ist eine Modellschätzung" (durch Stilpass neu gebildet), "keine Klimaprojektion", "Ein Stichwort ist kein Qualitätsmaß … keine Qualitätsmessung" | mehrere: "keine Abkürzung", "ergänzt … ersetzt sie aber nicht", "keine Messungen", "Szenarien sind keine Vorhersagen", "schnell, aber nicht schnell genug" | mehrere: "keine Prognose", "bestätigt nicht und widerlegt nicht", "beruhigt nicht und alarmiert nicht" (Umformung der alten Formel "keine Beruhigung und kein Alarm") | mehrere: "weder … noch", "kein Evidenzcheck", "Zum Freuen … keinen Anlass", "Misstrauisch … wo es nie eine gibt" |
| 2 Fachwort erklären | Perzentile, Prognoseintervall, Metaanalyse, Sensitivitätsanalysen unerklärt | RONI, Brutto-CO₂-Emissionen, Executive Summary unerklärt | "Hauptverfahren", "Korridor", "exploratorisch" unerklärt (ARIMA, Prognoseintervall erklärt) | Newey-West, OLS unerklärt |
| 3 Doppelpunkt / Gedankenstrich | **neu durch Stilpass:** "Drittens hat sich die Methodik geändert: Seit 2020 …" (kein Definitionsfall) | **neu:** "Wenn du von CO₂-Entnahme hörst: Sie findet …"; bestehend: "Erfreulich ist:" | **neu:** "Dazu ein Vorbehalt: Eine einfache Gerade …" | **neu:** "Wir halten Rechenwege nachvollziehbar: Was wir versprechen …" |
| 4 Fette Schlagwort-Köpfe | im Stilpass entfernt, in Ordnung | im Stilpass entfernt; "El Niño und Temperatur:" "UNEP-Bericht:" "Offen:" bleiben als Marken (echte Liste, tolerierbar) | im Stilpass entfernt, in Ordnung | Fall-Köpfe ("Fehler.", "Gekennzeichnet:") strukturell; Satzzeichen uneinheitlich |
| 5 Modewörter | "klarem Anliegen" (2x, aus Quelle übernommen) | "besonders" ersetzt "entscheidend" (siehe S5-6) | "tatsächlich inventarisiert" | keine |
| 6 Rhetorische Fragen / Ankündigungen | keine | "Und der UNEP-Weg zurück?" im Stilpass gestrichen, in Ordnung | "Wir wollten wissen, was …" | keine |
| 7 Gleichförmiger Satzbau | RKI-Absatz teils gleichförmig ("Das ist …") | tolerierbar | tolerierbar | tolerierbar |
| 9 Beteuerungen | keine | keine | keine | keine |
| Sensible Sprache | "Hitzetoten" nur im Zitat; Satz "Hinter diesen Zahlen stehen Menschen" vorhanden | n. a. | n. a. | "hitzebedingten Sterbefällen" |
| Stimme "wir"/"du" | eingehalten | "du" im Baustein | eingehalten | "du" im Meldeabsatz außerhalb des Bausteins (aus der Langfassung) |

Hinweis: Mehrere Gegensatzformeln sind Abgrenzungen, die die Stilregeln-Grenzen schützen (Schätzung statt Zählung, Szenario statt Vorhersage). Beim Glätten nicht ohne Rücksprache entfernen.

## Offene Punkte

- Die vier Diffs enthalten nur die Differenz zu HEAD. Der HEAD-Stand selbst entspricht dem Stand nach der Auflagen-Einarbeitung vom 28.10.; er unterscheidet sich teils von Langfassung und Differenz-Faktencheck (siehe Altlasten). Das ist nicht Gegenstand dieser Prüfung, aber in den Altlasten vermerkt.
- Altlast Kapitel 7 (a) (Quelle [4], Grafik-2-Unterschrift, "ergänzt nur die Dokumentation") ist die einzige Altlast mit neuer Tatsachenangabe. Nicht belegt.
- Primärquellen und Substack-Artikel nicht erneut geöffnet.

*Kein Freigabevermerk. Die Freigabe bleibt Sache von Daniel Saure nach Volltextlektüre.*
