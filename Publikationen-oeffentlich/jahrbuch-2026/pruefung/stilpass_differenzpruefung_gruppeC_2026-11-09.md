# Differenzprüfung Stilpass, Gruppe C (Kurzfassung Kapitel 08, 09, 11, 12), Diff gegen HEAD

**Geprüft:** `kurz/08-zehn-fragen.md`, `kurz/09-so-pruefen-wir.md`, `kurz/11-nachwort.md`, `kurz/12-glossar.md`. Arbeitskopie gegen HEAD, anhand der Wort-Diffs `git diff --word-diff=plain -U1 HEAD` (bereitgestellt als `scratchpad/stildiff/*.worddiff.txt`; Format `[-alt-]{+neu+}`). Maßstab: `stilregeln.md` v0.3, Ablauf Punkt 3.
**Prüfdatum:** 09.11.2026 · **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). **Dieses Dokument enthält keinen Freigabevermerk.** Kapitel nicht verändert.
**Hinweis zur Methode:** Diese Fassung ersetzt die frühere, die ohne HEAD-Zugriff erstellt war. „Alt“ ist hier der HEAD-Wortlaut. Ich habe die Diffs selbst nicht erzeugt, sondern die übergebenen Dateien gelesen; sie enthalten jede Änderung der vier Kapitel (nicht geänderte Passagen erscheinen nur als Kontext).

Schweregrade: kritisch (Aussage/Zahl verändert oder verstärkt) · mittel (Vorbehalt, Reichweite oder Inhalt verschoben bzw. neu hinzugekommen) · gering (Wortwahl mit minimaler Nuance) · neutral (reine Stiländerung) · Hinweis.

## Ergebnis in Kürze

- **Keine Zahl, kein Datum, kein Name, kein Quellenverweis, keine Kapitelnummer wurde durch den Stilpass verändert.** In den Diffs steht keine einzige solche Stelle.
- Kapitel 08 und 12: keine inhaltliche Änderung. Nur gering/neutral.
- Kapitel 09: **ein neuer Satz** (mittel, belegt durch `CLAUDE.md`).
- Kapitel 11: **eine Reichweiten-Verschiebung** des Vorbehalts „noch nicht abgeschlossen“ (mittel).
- Die „Herkunft offen“-Fälle meiner ersten Fassung sind geklärt: Dunkelflaute-Definition (12), 145 Mrd. (08 Frage 5), Kapitelverweise und Kopfzeilen-Verweise, „Berichtigung“ im Glossar, das Fehlen von „der Saison“, „sinngemäß“ usw. stehen **unverändert in HEAD**. Sie sind keine Stilpass-Effekte (Abschnitt „Bestand in HEAD“ unten).

---

## Kapitel 08 – Zehn Fragen an jede Klimazahl

Jede Änderung im Diff, einzeln:

| Nr. | Fundstelle | Alt (HEAD) | Neu | Wirkung | Schwere |
|---|---|---|---|---|---|
| 1 | Kopfzeile | – | „Stilpass 28.10.2026 (Stilregeln v0.3), Differenzprüfung steht aus.“ ergänzt | nur Kopfzeile | neutral |
| 2 | Kurz gesagt | „Nicht jede Zahl muss alle zehn Fragen bestehen.“ | „Eine Zahl muss nicht alle zehn Fragen bestehen.“ | gleiche Aussage | neutral |
| 3 | Frage 2, Text | „Passt der Zeitraum der Zahl zu dem Zeitraum, über den die Aussage gemacht wird?“ | „Der Zeitraum der Zahl sollte zu dem Zeitraum passen, über den die Aussage gemacht wird.“ | Prüffrage wird Empfehlung („sollte“); inhaltlich gleich | neutral |
| 4 | Frage 2, Beispiel | „… misst die Erwärmung aber als gleitendes 20-Jahres-Mittel und stellt fest, dass …“ | „… allerdings als gleitendes 20-Jahres-Mittel. Er stellt fest, dass …“ | Satz geteilt, Aussage gleich; Zahl und Quellenverweis [2] [3] unverändert | neutral |
| 5 | Frage 3, Text | „Wenn nur ‚mehr als sonst‘ dasteht, frag nach: Als wann?“ | „Steht nur ‚mehr als sonst‘ da, frag nach, als wann.“ | gleich | neutral |
| 6 | Frage 3, Beispiel | „… gegen den Erwärmungstrend nur 1,1 Grad mehr („ungewöhnlich warm“) [4].“ | „… gegen den Erwärmungstrend 1,1 Grad mehr …“ | „nur“ entfällt: weniger Wertung, Zahl und Einstufung gleich | gering |
| 7 | Frage 5, Beispiel | „… fossilen Alternative: im Schnitt rund 145 Milliarden Euro pro Jahr (Nettoinvestitionen), gegenüber dem schon Investierten noch rund 65 Milliarden Euro pro Jahr zusätzlich [6].“ | „… Alternative, im Schnitt rund 145 Milliarden Euro pro Jahr (Nettoinvestitionen). Gegenüber dem, was schon investiert wird, sind es noch rund 65 Milliarden Euro pro Jahr zusätzlich [6].“ | Satz geteilt. Zahlen, „im Schnitt“, „rund“, „noch“ und [6] unverändert. Der Bezug von „sind es“ ist die Differenz zum Aufpreis, wie vorher | neutral |
| 8 | Frage 6, Text | „Ist eine Zahl auf die Stelle genau angegeben, stammt aber aus einem Modell, sei misstrauisch.“ | „… angegeben und stammt aus einem Modell, sei misstrauisch.“ | „aber“ entfällt, Sinn gleich | neutral |
| 9 | Frage 6, Beispiel | „… (TWh), das Prognoseintervall reicht von 69 bis 230 TWh [8]. Das ist breit, und es ist ehrlich.“ | „… (TWh). Das Prognoseintervall reicht von 69 bis 230 TWh [8]. Das ist eine große Spanne.“ | Zahlen und „rund“, „erwarten wir“ unverändert; Selbstbewertung „ehrlich“ entfällt | neutral |
| 10 | Frage 7, Text | „Wörter wie ‚würde‘, ‚könnte‘, ‚wenn‘ sind Hinweise auf ein Szenario.“ | „… ‚könnte‘ und ‚wenn‘ deuten auf ein Szenario hin.“ | gleiche Stärke („Hinweise“/„deuten hin“) | neutral |
| 11 | Frage 7, Beispiel | „… rechnet ein Szenario durch: Was müsste geschehen, damit … sinkt? Das ist keine Vorhersage, dass es so kommt [9].“ | „… durch. Es fragt, was geschehen müsste, damit … sinkt. Eine Vorhersage, dass es so kommt, ist das nicht [9].“ | Frage wird Aussage, Sinn gleich | neutral |
| 12 | Frage 8, Text | „Steht ein Datum dabei? Bei Gesetzen: Ist es beschlossen, in Kraft oder erst ein Entwurf?“ | „Achte auf das Datum. Bei Gesetzen gilt es zu unterscheiden, ob sie beschlossen sind, in Kraft sind oder erst ein Entwurf vorliegt.“ | gleich | neutral |
| 13 | Frage 9, Text | „Gibt es einen Link auf Daten, Rechenweg oder Code? Ein ‚laut einer Studie‘ ohne Titel zählt nicht.“ | „Prüfe, ob es einen Link … gibt. Ein ‚laut einer Studie‘ ohne Titel genügt nicht.“ | „zählt nicht“ (wird nicht anerkannt) zu „genügt nicht“ (reicht nicht): minimal milder | gering |
| 14 | Frage 9, Beispiel | „… unsere Evidenzchecks: Der Analyseplan wird …“ | „… Evidenzchecks. Der Analyseplan wird …“ | „in der Regel“ und „Ausnahmen und Lücken nennen wir, etwa in Kapitel 7“ unverändert | neutral |
| 15 | Frage 10, Text | „Trenne in Gedanken die Zahl und die Folgerung.“ | „… die Zahl von der Folgerung.“ | gleich | neutral |
| 16 | „Lagen wir richtig?“ | „Bei den Beispielen in diesem Kapitel haben wir die Zahlen aus den veröffentlichten Artikeln übernommen und nicht neu berechnet.“ | „Die Zahlen in den Beispielen haben wir aus den veröffentlichten Artikeln übernommen und nicht neu berechnet.“ | gleich | neutral |

Unverändert geblieben (Kontext im Diff bestätigt): Frage 10 mit „Gedankenexperiment, und die Grenze bei Deutschland haben wir gesetzt“, 31,7 Prozent, 1,3 Prozent, „Stand 22. Oktober 2026; zum Redaktionsschluss zu aktualisieren“, alle Kapitelverweise (3, 7, 9, 10), alle Quellenangaben.

**Gesamturteil Kapitel 08: ok (Differenz).** Der Stilpass hat keine Aussage, Zahl, Einschränkung, Quelle oder keinen Vorbehalt verändert. Zwei Nuancen (Nr. 6 „nur“, Nr. 13 „zählt nicht“ zu „genügt nicht“) sind vertretbar, aber vermerkt; bei Strenge wäre Nr. 13 auf „zählt nicht“ zurückzusetzen.

---

## Kapitel 09 – So prüfen wir (und welche Rolle KI dabei spielt)

| Nr. | Fundstelle | Alt (HEAD) | Neu | Wirkung | Schwere |
|---|---|---|---|---|---|
| 1 | Kopfzeile | – | Stilpass-Vermerk ergänzt | nur Kopfzeile; Export-Bedingung zum Satz „Auch dieses Buch …“ unverändert | neutral |
| 2 | Prinzip, SAP | „Er legt vorab fest: die Frage, die Daten, die Methode, die Sensitivitätsprüfungen (Wie ändert sich das Ergebnis, wenn man andere vernünftige Annahmen trifft?) und die Grenzen des Ergebnisses. Das ist ein ähnliches Prinzip wie das Studienprotokoll in der klinischen Forschung.“ | „Er legt vorab die Frage, die Daten, die Methode, die Sensitivitätsprüfungen und die Grenzen des Ergebnisses fest. Sensitivitätsprüfungen zeigen, wie sich das Ergebnis ändert, wenn man andere vernünftige Annahmen trifft. Ähnlich arbeitet das Studienprotokoll in der klinischen Forschung.“ | Definition der Sensitivitätsprüfung bleibt; „ähnliches Prinzip“ zu „ähnlich arbeitet“ gleiche Stärke | neutral |
| 3 | Ablauf Schritte 1 bis 5 | Fettgedruckte Schlagwörter („Plan-Entwurf.“, „Einfrieren.“, „Analyse.“, „Unabhängige Validierung.“, „Freigabe.“) | entfallen | reine Formatierung (v0.3 Nr. 4) | neutral |
| 4 | Schritt 1 | „Status ‚Entwurf‘.“ | „Der Plan hat den Status ‚Entwurf‘.“ | gleich | neutral |
| 5 | Schritt 2 | „… friert ihn ein: Status ‚final‘.“ | „… friert ihn ein, der Status ist dann ‚final‘.“ | gleich; „Amendment oder Erratum, mit Begründung und erneuter Freigabe“ unverändert | neutral |
| 6 | Schritte 3 bis 5 | – | nur Bold-Köpfe entfallen. „Abweichungen sollen … gekennzeichnet werden“, „wenn möglich“, Ampel-Stufen unverändert | Vorbehalte erhalten | neutral |
| 7 | Stufen, Einleitung | „Nicht jeder Beitrag ist ein Evidenzcheck:“ | „Nicht jeder Beitrag ist ein Evidenzcheck. Wir unterscheiden drei Stufen:“ | ergänzter Satz „Wir unterscheiden drei Stufen“: deckt sich mit der Abschnittsüberschrift „Die drei Stufen“ und `CLAUDE.md` | neutral |
| 8 | Stufe Evidenzcheck | „Gate vor der Veröffentlichung: ein Validierungsbericht ohne den Befund ‚kritisch‘.“ | „Vor der Veröffentlichung muss ein Validierungsbericht vorliegen, der den Befund ‚kritisch‘ nicht enthält.“ | Gate-Bedingung gleich | neutral |
| 9 | Stufe Einordnung | „… Keine neue Berechnung, keine neue Schlussfolgerung.“ | „Sie enthält keine neue Berechnung und keine neue Schlussfolgerung.“ | gleiche Aussage | neutral |
| 10 | Stufe Wissen | „Wissen: ein Erklärstück auf Basis seriöser Quellen.“ | „Das Wissen ist ein Erklärstück auf Basis seriöser Quellen.“ | gleich | neutral |
| 11 | KI-Rollen | „… [1]. Die Trennung hat einen Grund: Wer rechnet, prüft nicht dasselbe. Alle Rollen sind dasselbe Modell mit getrennten Anweisungen, keine getrennten Modelle.“ | „… [1]. Wer rechnet, prüft nicht dasselbe. Alle Rollen sind dasselbe Modell mit getrennten Anweisungen, es sind keine getrennten Modelle.“ | „Die Trennung hat einen Grund:“ entfällt; Begründung steht weiter im Satz. Quelle [1] und „dasselbe Modell“ unverändert | neutral |
| 12 | Was die KI nicht darf | „Was die KI nicht darf: nichts veröffentlichen und keinen Freigabevermerk eintragen, bevor ein Mensch den Volltext gelesen und ausdrücklich bestätigt hat.“ | „Die KI darf nichts veröffentlichen und keinen Freigabevermerk eintragen, bevor ein Mensch den Volltext gelesen und ausdrücklich bestätigt hat.“ | Satzbau gleich, die Reichweite von „bevor“ (nur Vermerk oder beides) war schon vorher offen und bleibt es. Entspricht dem Wortlaut der Langfassung | Hinweis |
| 13 | Vorfälle | „… zwei Vorfälle: Ein KI-Assistent … Und ein Entwurfsautor meldete …“ | „… zwei Vorfälle. Ein KI-Assistent … Ein Entwurfsautor meldete …“ | gleich; 29. August 2026 und Quelle [2] unverändert | neutral |
| 14 | Abschlussmeldung | „**Was wir geändert haben.** Eine Abschlussmeldung ist seitdem eine Behauptung, kein Beweis.“ | „Seitdem gilt eine Abschlussmeldung als Behauptung und nicht als Beweis.“ | gleich (Bold-Kopf entfällt) | neutral |
| 15 | Freigabevermerk | (nicht vorhanden) | **Neu eingefügt:** „Eine Antwort auf einzelne Rückfragen oder eine Chat-Zusammenfassung genügt dafür nicht.“ | **neu hinzugekommener Satz**. Inhaltlich gedeckt durch `CLAUDE.md` („nicht nach blosser Beantwortung einzelner Rueckfragen, und nicht auf Zuruf einer Chat-Zusammenfassung“) und die Langfassung (dort als Halbsatz), und er erledigt Befund K4 der Prüfdatei. Nach Stilregeln (nichts darf dazukommen) trotzdem ein Eingriff über den Stilpass hinaus | mittel |
| 16 | Grenzen, Aufzählung zu Fließtext | „**Keine Garantie auf Fehlerfreiheit.** Die Fälle in Kapitel 10 sind der Beleg.“ / „**Eine KI …** ersetzt keine externe Fachprüfung. Es ist eine zusätzliche Kontrolle, kein Gütesiegel. Wir sind auf Kritik von außen angewiesen.“ / „Deshalb prüfen wir den Inhalt von Dateien, nicht die Selbstauskunft.“ / „**Offene Daten und offener Code** sind kein Beweis …“ | „Es garantiert keine Fehlerfreiheit. Die Fälle in Kapitel 10 belegen das. Eine KI … ersetzt keine externe Fachprüfung. **Sie** ist eine zusätzliche Kontrolle und kein Gütesiegel, und wir sind auf Kritik von außen angewiesen. … Deshalb prüfen wir den Inhalt von Dateien und nicht die Selbstauskunft. Offene Daten und offener Code sind kein Beweis …“ | Alle Vorbehalte erhalten. Einzige Nuance: „Es ist“ wird zu „Sie ist“, das Bezugswort wechselt von der Prüfung zur KI. Sinn praktisch gleich | gering |
| 17 | „Lagen wir richtig?“ | „Eine Einschränkung:“ | „Eine Einschränkung gibt es:“ | gleich; „Beispiel: Kapitel 7“ unverändert | neutral |

Unverändert (Kontext): Satz „Auch dieses Buch durchläuft das Verfahren: …“ (wortgleich), alle Kapitelverweise (3, 10, 7), Quellen [1] und [2], „Menschen“-Rollen, „Die Modelle können sich irren, und sie irren sich manchmal überzeugend“.

**Gesamturteil Kapitel 09: ok mit Auflage.** Auflage: Der neu eingefügte Satz (Nr. 15) ist eine Ergänzung, keine Stiländerung. Daniel Saure bzw. der Faktencheck sollen ihn ausdrücklich bestätigen oder zurücknehmen (er ist sachlich belegt). Sonst keine Veränderung von Aussage, Zahl, Vorbehalt oder Quelle.

---

## Kapitel 11 – Nachwort und Ausblick

| Nr. | Fundstelle | Alt (HEAD) | Neu | Wirkung | Schwere |
|---|---|---|---|---|---|
| 1 | Kopfzeile | – | Stilpass-Vermerk ergänzt | nur Kopfzeile; „Alle Aussagen zu 2027 sind ‚geplant‘“ unverändert | neutral |
| 2 | 1. Punkt | „**Das Prognose-Register.** Der erste Eintrag, die Gasspeicher-Entnahme im Winter 2026/27, ist registriert.“ | „Im Prognose-Register ist der erste Eintrag, die Gasspeicher-Entnahme im Winter 2026/27, registriert.“ | gleich. „voraussichtlich im Mai oder Juni 2027“, „vier weitere Vorhersagen“, „Termine können sich verschieben“, „(Kapitel 8)“ unverändert | neutral |
| 3 | 2. Punkt | „**Offene Analysen.** Wo der Prognose-Check und der Abgleich mit dem Expertenrat zum Redaktionsschluss noch nicht abgeschlossen sind, wollen wir sie auf Substack veröffentlichen, sobald sie geprüft und freigegeben sind.“ | „Sind der Prognose-Check und der Abgleich mit dem Expertenrat zum Redaktionsschluss noch nicht abgeschlossen, wollen wir sie auf Substack veröffentlichen, sobald sie geprüft und freigegeben sind.“ | „Wo … sind“ gilt für jedes Vorhaben einzeln. „Sind A und B … noch nicht abgeschlossen“ lässt sich auch als „wenn beide noch offen sind“ lesen. Die Bedingung für das Veröffentlichungs-Versprechen verschiebt sich damit leicht. „wollen wir“ und „sobald geprüft und freigegeben“ bleiben | mittel |
| 4 | 3. Punkt | Platzhalter in eckigen Klammern | unverändert | | – |

**Gesamturteil Kapitel 11: ok mit Auflage.** Nr. 3: Vorschlag, die einzelne Geltung zu erhalten („Ist einer der beiden … noch nicht abgeschlossen, …“ oder „Wo sie … noch nicht abgeschlossen sind, …“ zurücksetzen). Sonst keine Veränderung.

---

## Kapitel 12 – Glossar

| Nr. | Fundstelle | Alt (HEAD) | Neu | Wirkung | Schwere |
|---|---|---|---|---|---|
| 1 | Kopfzeile | – | Stilpass-Vermerk ergänzt | nur Kopfzeile | neutral |
| 2 | ARIMA | „Bei uns meist eine Kontrollrechnung, im Expertenrat-Abgleich eines von drei Verfahren. (Kapitel 7)“ | „Wir nutzen es meist als Kontrollrechnung; im Expertenrat-Abgleich ist es eines von drei Verfahren. (Kapitel 7)“ | „meist“ und „eines von drei Verfahren“ erhalten | neutral |
| 3 | Brutto / netto | „Bei Investitionen: Brutto ist die volle Summe, etwa der ganze Preis einer Wärmepumpe; netto ist nur der Aufpreis gegenüber der Alternative. Bei Preisen und Abgaben: brutto = mit Mehrwertsteuer, netto = ohne. (Kapitel 2, 1)“ | „Bei Investitionen ist brutto die volle Summe, etwa der ganze Preis einer Wärmepumpe, und netto nur der Aufpreis gegenüber der Alternative. Bei Preisen und Abgaben bedeutet brutto mit Mehrwertsteuer und netto ohne. (Kapitel 2, 1)“ | gleiche Definition | neutral |

Alle anderen Glossareinträge (darunter Dunkelflaute, Amendment/Erratum, Szenario/Prognose, 95-Prozent-Intervall) sind im Diff **nicht** enthalten, also unverändert.

**Gesamturteil Kapitel 12: ok.** Keine inhaltliche Änderung durch den Stilpass.

---

## Verstöße gegen Stilregeln v0.3 im jetzigen Text (Fließtext, ohne Kopfzeile, Tabellen, Raster)

Diese Punkte stehen (bis auf Nr. 5) bereits in HEAD, der Stilpass hat sie nicht behoben.

| Nr. | Kap. | Regel | Fundstelle und Wortlaut | Schwere |
|---|---|---|---|---|
| 1 | 08 | v0.3 Nr. 1 (Gegensatzformeln, höchstens eine pro Kapitel) | „Eine Zahl muss nicht alle zehn Fragen bestehen. Wichtig ist, …“; „Die Zahl kann stimmen, und der Schluss daraus trotzdem nicht.“; „Die zehn Fragen sind keine Zauberformel, und wir haben sie nicht immer selbst befolgt.“; „Eine Vorhersage, dass es so kommt, ist das nicht.“ | gering |
| 2 | 08 | v0.3 Nr. 3 (Doppelpunkt nur vor Aufzählung/Definition) | Frage 5: „Brutto und netto, Investition und Kosten, mit oder ohne Steuer: Das Etikett ändert die Zahl.“ | gering |
| 3 | 08 | Regel 7 / v0.3 Nr. 10 (Bild, Pose) | Frage 1: „ein Gerücht mit Prozentzeichen“; „Zauberformel“ | gering |
| 4 | 08 | Regel 4 („gehört dazu“) | „Zu Frage 9 gehört ein nicht eingelöstes Skript-Versprechen“ | gering |
| 5 | 09 | v0.3 Nr. 1 (viele Gegensatzformeln), durch die Umwandlung der Aufzählung in Fließtext in einen Absatz gedrängt | „Es garantiert keine Fehlerfreiheit … ersetzt keine externe Fachprüfung. Sie ist … und kein Gütesiegel … Deshalb prüfen wir … und nicht die Selbstauskunft … sind kein Beweis … Sie sorgen dafür …“; außerdem „Behauptung und nicht als Beweis“ | gering |
| 6 | 09 | v0.3 Nr. 6 (rhetorische Frage als Übergang) | „Wo findest du alles? Im öffentlichen Repository …“ | gering |
| 7 | 08 | Sensible Sprache (Satz, dass hinter den Zahlen Menschen stehen) | Frage 1 nennt „16.000 Hitzetote“ (zulässig im Zitat), ohne erinnernden Satz | gering |
| 8 | 11, 12 | – | keine Verstöße gefunden | – |

Der Stilpass hat Verstöße abgebaut (Fragen als Übergang in Kap. 08, fette Schlagwort-Köpfe in 09 und 11, „ehrlich“ in Kap. 08). Neu eingeführte Verstöße: keine.

## Bestand in HEAD (kein Stilpass-Effekt), bleibt offen

Diese Punkte aus meiner ersten Fassung stehen unverändert in HEAD; sie gehören zu den Prüfdateien bzw. zum Redaktionsstand, nicht zum Stilpass.

| Kap. | Stelle | Befund | Schwere |
|---|---|---|---|
| 08 | Frage 5 | Die 145 Mrd. stehen in HEAD schon als „Zusätzlich nötig ist nur der Aufpreis … im Schnitt rund 145 Milliarden“ (ohne „Die Studie nennt dafür“). Zahl richtig, Zuordnung schwächer als in der Langfassung | gering (Quelle [6] am Satzende) |
| 08 | Frage 1 | „Im letzten Wochenbericht“ ohne „der Saison“; Abgrenzung „nicht nur für Juni bis August“ fehlt (Prüfdatei K6) | gering |
| 08 | Frage 2, 3, 10 | „ausdrücklich“ (IPCC), „(Juni bis August)“, „wir stuften“, „sinngemäß“ fehlen (Prüfdatei K2, K7) | gering |
| 08, 09 | Kopfzeilen vs. Text | Kopfzeile: Kapitelverweise „hier 2, 7 und 9“ (08) bzw. „2, 6 und 7“ (09); Text: 3, 7, 9, 10 bzw. 3, 7, 10. Der Text stimmt mit den Dateiköpfen der Kurzfassung (Kap. 7 Klimaziel, 8 Prognose-Register, 10 Korrekturen) überein, die Prüfdateien vom 28.10. bestätigen aber noch die alten Nummern | mittel |
| 11 | 2. Punkt | „Projektionsberichten der Bundesregierung“ fehlt gegenüber der Langfassung; „Prognose-Check“ steht ohne Gegenstand | gering |
| 12 | Dunkelflaute | „besonders wenig … im Verhältnis zum Verbrauch, mindestens drei Tage in Folge“. „10. Perzentil“, „seit 2015“ und „Kalendertage“ der Langfassung fehlen (Kürzung der Kurzfassung) | mittel |
| 12 | Amendment / Erratum | „Ergänzung (oder Berichtigung)“ statt „Änderung“ der Langfassung | gering |
| 09 | Vorfall 2 | „Ein Entwurfsautor“ ohne Hinweis auf KI (Prüfdatei K3) | gering |
| 11, 12 | – | keine Prüfdatei zur Kurzfassung vorhanden | Hinweis |

## Kopfzeilen

Alle vier Dateien haben jetzt den Satz „Stilpass 28.10.2026 (Stilregeln v0.3), Differenzprüfung steht aus.“. Das Datum 28.10.2026 ist das Datum von Stilregeln v0.3, nicht der Tag dieses Durchlaufs (09.11.2026). Nach dieser Prüfung kann die Kopfzeile auf „Differenzprüfung 09.11.2026: siehe `pruefung/stilpass_differenzpruefung_gruppeC_2026-11-09.md`“ aktualisiert werden. Das ist Sache der Redaktion, ich habe nichts geändert.

*Kein Freigabevermerk. Die Freigabe bleibt Sache von Daniel Saure nach Volltextlektüre.*
