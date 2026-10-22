# Faktencheck: „Hitzesommer ohne Klima? Was Medien weglassen – und was die Zahlen sagen“

**Geprüfter Entwurf:** `Reports/2026-10-17-klimaberichterstattung-hitze/kanal-entwuerfe/substack.md` (Stufe: Einordnung)
**Prüfdatum:** 17.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Der Artikel wurde nicht verändert.** Diese Datei enthält keinen Freigabevermerk.

## Geprüfte Quellen und Zugriff

| Nr. | Quelle | Zugriff | Ergebnis |
|---|---|---|---|
| [1] | Treibhauspost #125, steady.page/.../6c3c7fc9-... | WebFetch am 17.10.2026: **HTTP 403 Forbidden** (auch über steadyhq.com-Redirect); Websuche ohne Treffer auf den Text | **nicht geprüft** – Inhalt des Interviews konnte nicht eingesehen werden |
| [2] | MedienKlimaBericht Nr. 1, lokale Kopie `quellen/MedienKlimaBericht_Nr1_H1-2026.txt` | vollständig gelesen; Online-URL liefert ein PDF (ca. 926 KB), Text per WebFetch nicht lesbar | Prüfung gegen lokalen Text |
| [3] | RKI-Seite „Bericht Hitzemortalität“ | WebFetch am 17.10.2026 | geprüft |
| [4] | Eigener Evidenzcheck (Substack, 29.08.2026) + `Analysen/2026-08-hitzesommer-2026/` (SAP v1.1 final, run_log.txt, Validierungsbericht) | WebFetch + lokale Dateien | geprüft |
| Zusatz | brandmelder.org (Startseite), Websuche zu Döschners Biografie | WebFetch/WebSearch | nur Sekundärangaben |

## Tabelle der Behauptungen

| # | Behauptung im Entwurf | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | RKI schätzt für Sommer 2026 „rund 16.000 hitzebedingte Sterbefälle“ | [3] | bestätigt | RKI: 16.000 [95 %-PI 14.400; 17.600], kumulativ KW 15–37/2026. |
| 2 | „letzter Wochenbericht der Saison (KW 37, Stand 24. September 2026)“ | [3] | bestätigt | RKI wörtlich: „Mit diesem Bericht endet die wöchentliche Berichterstattung 2026.“ KW 37 = 07.–13.09.2026, Stand 24.09.2026. Hinweis: Das ist noch keine finale Jahresschätzung (Epid. Bull.); der Entwurf nennt 16.000 den „neuen Wert“, ohne das zu erwähnen (siehe #17). |
| 3 | Unsicherheitsintervall 14.400 bis 17.600 | [3] | bestätigt | Laut RKI ein „95 %-Prädiktionsintervall“. „Unsicherheitsintervall“ ist als laienverständliche Bezeichnung vertretbar. |
| 4 | „Das RKI schätzt … mit einem statistischen Modell“; „Modellschätzung der zusätzlichen Sterbefälle in Hitzephasen“; „nicht von Totenscheinen“ | [3] | bestätigt | Laut RKI ist das die Differenz zwischen den Modellwerten mit Hitze und ohne Hitze (Temperatur bei ca. 20 °C gedeckelt). Hitze steht laut RKI meist nicht auf dem Totenschein. |
| 5 | „Die RKI-Zahlen sind zudem nicht nach Alter bereinigt“ | [3], [4], run_log Schritt 2 | bestätigt | Laut run_log ist das eine absolute, nicht altersstandardisierte Fallzahl. |
| 6 | „Weil die Bevölkerung älter wird, steigt ein Teil des Risikos auch unabhängig vom Klima [4]“ | [4], SAP 8.2 | Abweichung (gering) | [4] sagt, dass ein Teil des *langfristig steigenden Grundniveaus* (also der Fallzahlen) plausibel auf die Alterung zurückgeht. „Risiko“ legt eine Aussage über das individuelle Risiko nahe, und die macht [4] nicht. Vorschlag: „steigt ein Teil der Fallzahlen“. |
| 7 | „Die Zahl aus dem Interview stimmt also“ | [1], [3] | nicht prüfbar (Teil [1]) | Die RKI-Seite ist bestätigt. Ob das Interview genau „16.000 Hitzetote“ nennt, lässt sich nicht prüfen (403). |
| 8 | Evidenzcheck „Ende August“, Titel, 29.08.2026 | [4] | bestätigt | Titel, Untertitel und Datum stimmen. |
| 9 | „RKI-Reihe seit 1992“, „vorab festgelegter, unabhängig validierter Analyseplan“ | SAP v1.1 final (Freigabe 28.08.2026), run_log, Validierungsbericht | bestätigt | Fenster 1992–2025, k = 34. Validierungsbericht: „Freigabe mit Auflagen“. Laut Auftrag gibt es einen Nachtrag, dessen Inhalt hier nicht im Detail nachgeprüft wurde. |
| 10 | Mittel 1992–2025 „rund 2.955“ | run_log (mu_hat = 2955,28), [4] | bestätigt | Laut Validierungsbericht unabhängig nachgerechnet. |
| 11 | „Ein ‚normales‘ Jahr hätte nach unserem Modell höchstens rund 8.700 erwarten lassen“ | run_log (PI oben 8.671), [4] („maximal rund 8.700“) | bestätigt, mit Hinweis | Zahl und Formulierung decken sich mit dem veröffentlichten Artikel. Fachlich ist das die Obergrenze eines 95 %-Prädiktionsintervalls, kein hartes „höchstens“. Laut SAP 5.3 und run_log ist dieses PI wegen der verletzten Normalitätsannahme (Shapiro-Wilk p < 0,01) „möglicherweise unpräzise“. Der Entwurf übernimmt diese Einschränkung nicht. |
| 12 | „Der damals vorläufige Wert von 15.800“ | run_log Schritt 4 (KW 33/2026, Bericht 27.08.2026), [4] | bestätigt | |
| 13 | „lag weit darüber, und zwar in allen acht Sensitivitätsanalysen“ | [4] („acht … alle robust in derselben Richtung“), SAP 6, run_log | bestätigt, mit Hinweis | Das deckt sich mit dem veröffentlichten Artikel. Genauer: In den Sensitivitätsanalysen gelten jeweils *eigene* Obergrenzen (bis 12.028 bei S3, 10.200 bei S6a), nicht 8.700. Außerdem liefert S7 keine eigene Einordnung für 2026 (13 von 13 einordbaren Varianten liegen oberhalb). Satzbau-Vorschlag: „… lag auch in allen Sensitivitätsanalysen oberhalb der jeweiligen Obergrenze“. |
| 14 | Kurz gesagt: „liegt das weit über allem, was seit 1992 als normale Schwankung gelten kann“ | [4] | Abweichung | (a) [4] hat 15.800 eingeordnet, nicht 16.000 (siehe #16). (b) „allem, was … gelten kann“ ist ein Superlativ. [4] spricht vorsichtiger von „außerhalb der bekannten Schwankungsbreite“ bzw. des 95 %-Prognoseintervalls. Vorschlag: „deutlich oberhalb der Schwankungsbreite, die unser Evidenzcheck für die Jahre seit 1992 ermittelt hat“. |
| 15 | „Der neue Wert von 16.000 liegt noch etwas höher“ | [3], [4] | bestätigt | 16.000 > 15.800, rein beschreibend. |
| 16 | „selbst die Untergrenze des RKI-Intervalls (14.400) übersteigt unsere Obergrenze deutlich. Das ist ein beschreibender Abgleich, keine neue Berechnung.“ | SAP 2/5.1, run_log, [4] | **Abweichung (gewichtig) – Inferenzregel Stufe Einordnung** | Zu prüfen war, ob das eine neue Inferenz ist. **Punktschätzer:** 16.000 mit der veröffentlichten Grenze 8.700 zu vergleichen, ist für sich genommen ein zulässiger beschreibender Abgleich. Da 16.000 > 15.800 gilt, deckt die veröffentlichte Einordnung den Wert mit ab. **Untergrenze:** Der Vergleich „RKI-Untergrenze gegen eigene PI-Obergrenze“ ist ein *neues Entscheidungskriterium*. Es steht weder im SAP noch im veröffentlichten Artikel. Der SAP behandelt die Unsicherheit des 2026-Werts ausschließlich über den z-Score (SE₂₀₂₆ im Nenner), nicht über einen Vergleich von Intervallgrenzen. Zudem werden hier zwei verschiedene Intervalltypen gegeneinander gelegt (RKI-Prädiktionsintervall einer Modellschätzung gegen metaanalytisches PI). Der Satz suggeriert eine zusätzliche Robustheitsaussage, die nicht validiert ist. Die Selbstauskunft „keine neue Berechnung“ deckt diesen Teil daher nicht. **Auflage: Halbsatz zur Untergrenze streichen.** |
| 17 | „Fest steht: Der Sommer 2026 war bei der Hitzesterblichkeit kein gewöhnliches schlechtes Jahr.“ und Fazit: „Der Sommer 2026 war bei den Hitzetoten außergewöhnlich“ | SAP 2, 5.5, 8.1, 8.3, 9/11; [4] | Abweichung | Der SAP schreibt für *jede* Ergebnisdarstellung vor: (a) den Hinweis, dass ein vorläufiger, unterjähriger Wert mit finalen Jahreswerten verglichen wird (SAP 2). (b) Eine als außergewöhnlich eingestufte Schätzung erlaubt nicht automatisch den Schluss auf einen realen Extremwert, solange ein Methodikbruch nicht ausgeschlossen ist (SAP 8.1, run_log: dokumentierter Bruch 2020). Der Entwurf formuliert als feststehende Tatsache („Fest steht“, „war … außergewöhnlich“) und nennt keine dieser beiden Einschränkungen. Auch der veröffentlichte Artikel [4] verwendet das Wort „außergewöhnlich“ nicht. Vorschlag: „liegt deutlich außerhalb der bisherigen Schwankungsbreite“ plus eine kurze Einschränkung (vorläufiger Wert, Methodikwechsel des RKI ab 2020). |
| 18 | „Unser Evidenzcheck zeigt, dass 2026 außerhalb der bisherigen Bandbreite lag, nicht warum“ | [4], SAP 8.3 | bestätigt | Korrekte Trennung von Einordnung und Ursache. |
| 19 | Döschner: Interview am 17.10.2026 in Treibhauspost #125, Titel „Warum ignoriert die ARD die Klimakrise?“ | [1] | nicht prüfbar | 403. Der 17.10.2026 ist ein Samstag (plausibel bei einem zweiwöchentlichen Samstags-Newsletter), aber nicht belegt. |
| 20 | Döschner „war lange Energieexperte der ARD“ | Websuche (Sekundärquellen), [2] („langjähriger/früherer ARD-Journalist“) | bestätigt (sekundär) | Laut Sekundärquellen war er langjähriger WDR-Journalist mit Schwerpunkt Energie und Klima, seit 2023 im Ruhestand. Präziser wäre „beim WDR“. |
| 21 | Döschner „hat das Online-Magazin brandmelder mitgegründet“ | brandmelder.org, Websuche | Abweichung | Nicht belegt. brandmelder bezeichnet sich als „Projekt des Netzwerk Klimajournalismus Deutschland e. V.“ und nennt keine Gründer. Sekundärquellen: Döschner ist Mitgründer und Vorstand des *Netzwerks Klimajournalismus* und leitet die Redaktion von brandmelder. Vorschlag: „leitet die Redaktion des Portals brandmelder“ oder „Mitgründer des Netzwerks Klimajournalismus“. |
| 22 | Zitat „Weglassen ist das neue Leugnen“ (Döschner) | [1] | nicht prüfbar | Wortlaut und Zuordnung (Döschner selbst oder Überschrift bzw. Redaktion) konnten nicht geprüft werden (403). **Kernzitat des Stücks, muss vor Freigabe am Originaltext geprüft werden.** Länge: 5 Wörter. |
| 23 | Paraphrase der These: Medien berichten über Hitze, Dürre und Niedrigwasser, lassen aber den Klimabezug weg | [1]; Sekundärquellen | nicht prüfbar | Die Linie passt zu Döschners öffentlich bekannter Position, ob das Interview sie so formuliert, ist aber nicht geprüft. Die Aufzählung „Dürre, Niedrigwasser“ stammt vermutlich aus [1] und ist nicht belegt. |
| 24 | „Als Belege nennt das Interview die ‚16.000 Hitzetoten‘ … und den MedienKlimaBericht“ | [1] | nicht prüfbar | 403. |
| 25 | Redaktionen lassen Klimabezug „aus Angst oder aus Strategie“ weg = Döschners Einschätzung „aus eigener Erfahrung“ | [1] | nicht prüfbar | 403. Die Kennzeichnung als Einschätzung ist methodisch richtig. Die Paraphrase muss trotzdem am Originaltext geprüft werden. Fairness-Hinweis: Laut Sekundärquelle (turi2) hatte Döschner einen Rechtsstreit mit dem WDR. Der Entwurf muss das nicht nennen, die Redaktion sollte es aber kennen, wenn sie seine „eigene Erfahrung“ zitiert. |
| 26 | MedienKlimaBericht wertet „das gesamte Programm von Das Erste und ZDF für Januar bis Juni 2026“ aus | [2] S. 1, Anhang A | bestätigt | „Gesamtprogramm“, Daten bis einschließlich 30.06. |
| 27 | Tabelle: 2023 2,2 % / 1,95 %; 2024 1,49 % / 1,43 %; 2025 1,29 % / 1,29 %; H1 2026 0,95 % / 0,82 % | [2] Kap. 2.1, Kap. 4, Überblick | bestätigt | Alle acht Werte stimmen. Hinweis: H1 2026 ist ein Halbjahreswert, die übrigen sind Jahreswerte. Der Bericht vergleicht selbst so, die Tabellenbeschriftung macht es kenntlich. |
| 28 | „weniger als einem Prozent der Sendeminuten von Das Erste und ZDF“ | [2] | bestätigt | Gilt für beide Sender einzeln. |
| 29 | „Das Erste hat die Juni-Hitzewelle erst am siebten Tag der Warnperiode des DWD mit dem Klimawandel in Verbindung gebracht“ | [2] Überblick, Kap. 3.3, Kap. 4 | Abweichung | Tageszählung bestätigt: DWD-Warnungen ab 18.06., erste explizite Einordnung in der 20-Uhr-Tagesschau am 24.06. (= 7. Tag, „sechs Tage nach Beginn“). Der Bericht sagt aber „erstmals **als klimawandelbedingt eingeordnet**“ und dokumentiert *vorher* drei Randstellen mit Klimabezug (18.06. Freibad, „globale Erwärmung“; 19.06. Wettermoderation; 19./20.06. Servicebeitrag „auf den Klimawandel mit seinen immer heißeren Sommern“). „In Verbindung gebracht“ ist also weiter gefasst als die Quelle und streng genommen falsch. Vorschlag: „erst am siebten Tag … ausdrücklich als klimawandelbedingt eingeordnet“. |
| 30 | FR/UK/ES: Klimabezug „vom ersten Tag an üblich“ | [2] Überblick („vom ersten Tag an Standard“), Kap. 3.2/3.4 | bestätigt | Korrekt im Konjunktiv als Aussage des Berichts wiedergegeben. „Belegt mit Beispielen aus dem Programm“ stimmt (Anhang A: „exemplarisch ausgewählt“). |
| 31 | Methode: automatische Transkription; Klima-Minute = Minute mit der Zeichenfolge „Klima“, z. B. „Klimakrise“, „Weltklimarat“ | [2] Anhang A | bestätigt | |
| 32 | „Fehltreffer wie ‚Klimaanlage‘ werden herausgefiltert“ | [2] Anhang A | Abweichung (gering) | Laut Quelle wurden nur „die gängigsten falsch-positiven Treffer“ herausgefiltert. Vorschlag: „die häufigsten Fehltreffer“. |
| 33 | „trifft das Verfahren in 94 Prozent der Fälle richtig“ (Precision) | [2] Anhang A | Abweichung | Die Zahl stimmt, die Erklärung nicht. Precision 94 % heißt: 94 % der *gezählten* Klima-Minuten sind tatsächlich Klima-Minuten. „In 94 Prozent der Fälle richtig“ liest sich wie die Gesamttrefferquote (Accuracy). Vorschlag: „94 Prozent der gezählten Minuten sind tatsächlich Klima-Minuten“. Zusatzhinweis: Die Kennwerte stammen laut Fußnote 13 („ebd.“) aus einer Validierung von 2022 (Media Perspektiven), nicht aus diesem Bericht. |
| 34 | „findet 89 Prozent der tatsächlichen Klima-Minuten“ (Recall) | [2] Anhang A | bestätigt | Korrekte Übersetzung von Recall. |
| 35 | Erweitertes Begriffsfeld: Hitzephasen „zusätzlich auf weitere Begriffe wie ‚Erderhitzung‘“ geprüft | [2] Anhang A | bestätigt | Deutsches Ursachen-Begriffsfeld: u. a. „Erwärmung“, „Erhitzung“; Ereignis-Korpus: u. a. „Erderhitzung“. Ergänzender Hinweis: Für diese Begriffsliste gibt es laut Bericht „keine eigene Validierung“. |
| 36 | „KLIMA° vor acht ist ein Verein, der sich für mehr Klimaberichterstattung einsetzt … Seite mit einem klaren Anliegen“ | [2] S. 2, S. 14 | Abweichung (gering) | Im Kern fair. Selbstbeschreibung: gemeinnütziger Verein, setzt sich „für eine bessere und der Relevanz der Klimakrise angemessene Berichterstattung“ ein, spendenfinanziert. Der Bericht fordert am Ende ausdrücklich einen festen Sendeplatz für ein Format wie das des Vereins (S. 14). Das ist ein Eigeninteresse, das „klares Anliegen“ nur andeutet. Vorschlag: Selbstbeschreibung näher übernehmen und das Eigeninteresse benennen. |
| 37 | „Die Methode ist aber offengelegt und nachvollziehbar“ | [2] Anhang A | Abweichung (gering) | Die Methode ist *beschrieben*. Begriffslisten sind nur auszugsweise („u. a.“) angegeben, Daten und Skripte nicht veröffentlicht, die Hitzephasen-Liste ist nicht validiert. „Offengelegt und nachvollziehbar“ ist eine Wertung, die über die Quelle hinausgeht. Vorschlag: „Die Methode ist im Bericht beschrieben.“ |
| 38 | Bericht verweist auf eine WWA-Studie zur Juni-Hitze; „haben wir nicht selbst geprüft“ | [2] Kap. 3, Fn. 3 | bestätigt | Laut Bericht ist die Juni-Hitzewelle ohne Erderhitzung „so gut wie unmöglich“. Der Entwurf übernimmt diese Aussage zu Recht nicht als eigenen Befund. |
| 39 | Fazit: Klima-Anteil „auf den niedrigsten Stand seit Beginn der Messung gefallen“ | [2] Überblick („niedrigste Wert seit Beginn der kontinuierlichen Messungen Mitte 2021“), Kap. 4 | bestätigt, mit Hinweis | Inhaltlich gedeckt. Im Fazit steht es aber als eigene Feststellung. Die Werte für 2021/2022 sind im Entwurf nicht enthalten und nur als Aussage des Berichts belegt. Vorschlag: „laut KLIMA° vor acht“ ergänzen. |
| 40 | „Nur zwei Sender … Für Zeitungen, Privatsender oder Onlinemedien sagt er nichts aus. Auslandsvergleich beruht auf Beispielen aus den beiden Hitzephasen.“ | [2] Anhang A, B | bestätigt | Der Auslandsvergleich stützt sich auf einen Ereignis-Korpus von 24 Sendern aus 17 Ländern und exemplarische Zitate. |
| 41 | Quellenangabe [2]: Titel, „(Juli 2026)“, URL | [2], WebFetch | bestätigt (indirekt) | Die URL liefert ein PDF (ca. 926 KB), dessen Inhalt per WebFetch nicht lesbar war. Der Juli ist plausibel (Datenstand 30.06., Abrufdaten 07.07.2026, Pfad /2026/07/). Hinweis: Der Dateiname lautet „KlimaMedienBericht“, der Titel „MedienKlimaBericht“. Das ist kein Fehler im Entwurf. |
| 42 | Quellenangabe [3] | [3] | bestätigt | |
| 43 | Quellenangabe [4] inkl. Verweis auf github.com/dsaure55/klima-evidenzcheck | [4] | bestätigt (GitHub-Link nicht geöffnet) | |

## Querschnittsprüfungen

| Prüfpunkt | Ergebnis | Hinweis |
|---|---|---|
| Keine neue Berechnung oder Inferenz (Stufe Einordnung) | **Abweichung** | Siehe #16 (Vergleich der Untergrenze = neues Kriterium) und #17 („Fest steht“, „außergewöhnlich“ ohne die vom SAP verlangten Einschränkungen). Der reine Vergleich der Punktschätzer 16.000 / 15.800 / 8.700 ist zulässig. |
| Trennung Korrelation/Kausalität | bestätigt, mit Hinweis | Abschnitt „Was die Daten nicht zeigen“ trennt sauber: keine Ursachenaussage, keine Absicht, Attribution nur als Verweis. Hinweis: Überschrift „Was Medien weglassen“ verallgemeinert über zwei Sender hinaus, und die Gegenüberstellung von Todeszahlen und Klimaminuten in „Kurz gesagt“ legt einen Zusammenhang nahe. Der Text entschärft das, die Überschrift nicht. |
| Superlative ohne Beleg | Abweichung | „weit über allem“ (#14), „Fest steht“ (#17), „außergewöhnlich“ (#17). „Niedrigster Stand seit Beginn der Messung“ ist belegt (#39). |
| Zitate unter 15 Wörtern | bestätigt | Längstes wörtliches Zitat: „Weglassen ist das neue Leugnen“ (5 Wörter). Sonst nur Einzelwörter („16.000 Hitzetoten“, „Klima“, „normales“). Der Wortlaut des Döschner-Zitats ist nicht prüfbar (#22). |
| Schlusszeile gegen CLAUDE.md | bestätigt | Instagram, Facebook, WhatsApp-Kanal und Über/Impressum stimmen zeichengenau mit der Tabelle in CLAUDE.md überein, ohne Tracking-Parameter. Kein LinkedIn. |
| Umfang 600–1000 Wörter | bestätigt (Schätzung) | Manuell gezählt: ca. 880–920 Wörter Fließtext inkl. Überschriften und Tabelle, ohne Quellenliste und Schlusszeile. Mit Quellenliste knapp über 1.000. Kein Werkzeug zur exakten Zählung verwendet. |
| Name Daniel Saure | bestätigt | Nur im internen Entwurfsvermerk (Zeile 1), nicht im Artikeltext. |

## Gesamturteil: **ok mit Auflagen**

Kein Punkt ist „kritisch“ im Sinne einer nachweislich falschen Zahl. Alle Zahlen aus [2], [3] und [4] stimmen. Abweichungen gibt es bei Interpretation und Wortwahl. Außerdem ist die Anlassquelle [1] nicht prüfbar, das betrifft das Kernzitat und alle Döschner-Paraphrasen. Der Satz zur Untergrenze (#16) verstößt gegen die Regel „keine neue Inferenz“ der Stufe Einordnung und muss vor einer Freigabe entfernt werden.

### Auflagen (vor Freigabe zu erfüllen)

1. **#16:** Den Halbsatz „selbst die Untergrenze des RKI-Intervalls (14.400) übersteigt unsere Obergrenze deutlich“ streichen (neues, nicht validiertes Kriterium). Den Punktschätzer-Vergleich (16.000 > 15.800 > 8.700) beibehalten.
2. **#17:** „Fest steht …“ und „war … außergewöhnlich“ (Fazit) abschwächen, z. B. „liegt deutlich außerhalb der bisherigen Schwankungsbreite“. Dazu einen kurzen Hinweis gemäß SAP 2/8.1: Der Wert ist vorläufig (keine finale Jahresschätzung), und ein Methodikwechsel des RKI (ab 2020) ist als Alternativerklärung nicht ausgeschlossen.
3. **#14:** „weit über allem, was seit 1992 als normale Schwankung gelten kann“ durch die Formulierung aus [4] ersetzen („außerhalb der bekannten Schwankungsbreite seit 1992“).
4. **#22–#25, #19, #7:** Döschner-Zitat „Weglassen ist das neue Leugnen“ (Wortlaut und Urheber), die Paraphrasen (Hitze/Dürre/Niedrigwasser, „Angst oder Strategie“, „eigene Erfahrung“), die genannten Belege (16.000, MedienKlimaBericht) sowie Titel, Nummer und Datum der Ausgabe von einem Menschen am Originaltext prüfen lassen. Für den Faktenprüfer war der Text nicht zugänglich (HTTP 403).
5. **#21:** „hat das Online-Magazin brandmelder mitgegründet“ korrigieren, z. B. „leitet die Redaktion des Portals brandmelder“ (vor Veröffentlichung nochmals an einer Primärquelle prüfen).
6. **#29:** „mit dem Klimawandel in Verbindung gebracht“ ersetzen durch „ausdrücklich als klimawandelbedingt eingeordnet“ (der Bericht dokumentiert frühere Randerwähnungen).
7. **#33:** Precision korrekt erklären („94 Prozent der gezählten Minuten sind tatsächlich Klima-Minuten“).

### Empfehlungen (nicht zwingend)

- #6: „Teil des Risikos“ ersetzen durch „Teil der Fallzahlen“.
- #11: Hinweis, dass das Prognoseintervall wegen der verletzten Normalitätsannahme „möglicherweise unpräzise“ ist (SAP 5.3). Das fehlt allerdings auch im veröffentlichten Artikel [4].
- #13: „in allen Sensitivitätsanalysen oberhalb der jeweiligen Obergrenze“ statt eines Bezugs auf 8.700.
- #32, #36, #37: „die häufigsten Fehltreffer“; Selbstbeschreibung des Vereins näher übernehmen und das Eigeninteresse (fester Sendeplatz) benennen; „Methode ist beschrieben“ statt „offengelegt und nachvollziehbar“.
- #39: Im Fazit „laut KLIMA° vor acht“ ergänzen.
- Überschrift: „Was Medien weglassen“ ist breiter als die Datengrundlage (zwei Sender). Eventuell „Was ARD und ZDF weglassen“.
- Transparenz: [1] und [2] sind nicht unabhängig voneinander. Der MedienKlimaBericht zitiert Döschner (Kap. 4), Döschners Interview zitiert den Bericht.

### Quellen der Prüfung

- RKI: https://www.rki.de/DE/Themen/Gesundheit-und-Gesellschaft/Gesundheitliche-Einflussfaktoren-A-Z/H/Hitze/Bericht_Hitzemortalitaet.html (abgerufen 17.10.2026)
- Eigener Evidenzcheck: https://klimaevidenzcheck.substack.com/p/der-hitzesommer-2026-ausreier-oder (abgerufen 17.10.2026)
- Lokal: `Analysen/2026-08-hitzesommer-2026/SAP_hitzesommer-2026.md` (v1.1 final), `run_log.txt` (Lauf 29.08.2026), `Validierungsbericht_hitzesommer-2026.md`
- Lokal: `Reports/2026-10-17-klimaberichterstattung-hitze/quellen/MedienKlimaBericht_Nr1_H1-2026.txt`
- brandmelder: https://brandmelder.org/ (abgerufen 17.10.2026)
- Sekundär (Biografie Döschner): https://www.podbean.com/ew/dir-v6dwk-2f2927ca, https://www.turi2.de/?p=4110953, https://www.energiezukunft.eu/klimakrise/das-feuer-nicht-laenger-verschweigen
- Nicht zugänglich: https://steady.page/de/treibhauspost/posts/6c3c7fc9-cbaf-4e84-8c07-d679bcac8adf (HTTP 403)

## Nachtrag 1 (Nachprüfung, 17.10.2026)

**Geprüft:** überarbeiteter Entwurf `Reports/2026-10-17-klimaberichterstattung-hitze/kanal-entwuerfe/substack.md` (Stand 17.10.2026, vollständig gelesen)
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Umfang:** Auflagen 1, 2, 3, 5, 6 und 7, übernommene Empfehlungen, neu eingefügte Sätze. Auflage 4 übernimmt laut Auftrag Daniel Saure selbst.
**Erneut herangezogene Quellen:** lokale Kopie von [2] (vollständig neu gelesen), `SAP_hitzesommer-2026.md` (Abschnitte 2, 5.3, 8.1, 8.2), `run_log.txt` (SAP 3, Schritte 1 bis 5, Primäranalyse), [4] per WebFetch (17.10.2026), brandmelder.org per WebFetch (17.10.2026).
**Der Artikel wurde nicht verändert.** Dieser Nachtrag enthält keinen Freigabevermerk.

### Auflagen: Status

| Auflage | Status | Belegsatz aus dem Entwurf | Prüfhinweis |
|---|---|---|---|
| 1 (#16, Untergrenze streichen) | **erfüllt** | „Der neue Wert von 16.000 liegt noch etwas höher als die 15.800, mit denen wir gerechnet haben. Das ist ein beschreibender Abgleich, keine neue Berechnung.“ | Der Halbsatz zur Untergrenze 14.400 ist vollständig entfernt. Die 14.400 erscheint nur noch als Teil des RKI-Intervalls (Absatz „Was unsere Daten zeigen“), ohne Vergleich mit der eigenen Obergrenze. Es bleibt der Punktschätzer-Vergleich, der zulässig ist. Die Selbstauskunft „keine neue Berechnung“ trifft jetzt zu. |
| 2 (#17, „Fest steht“/„außergewöhnlich“ abschwächen, Einschränkungen nennen) | **erfüllt** | Absatz 3: „Zwei Einschränkungen aus unserem Analyseplan gelten weiter: Auch die RKI-Schätzung zum Saisonende ist noch keine endgültige Jahresschätzung. Und das RKI hat seine Methodik ab 2020 geändert. Dass ein Teil des Abstands darauf zurückgeht, können wir nicht ausschließen.“ Fazit: „Mit geschätzt 16.000 hitzebedingten Sterbefällen liegt der Sommer 2026 deutlich außerhalb der bisherigen Schwankungsbreite. Die Zahl ist vorläufig, und ein Einfluss der geänderten RKI-Methodik ist nicht ausgeschlossen.“ | „Fest steht“ ist entfernt, „war … außergewöhnlich“ im Fazit ersetzt. Beide vom SAP verlangten Einschränkungen sind gedeckt: Vorläufigkeit (SAP 2; run_log Schritt 4; RKI [3] zum Ende der Wochenberichte) und Methodikbruch als Alternativerklärung (SAP 8.1; run_log Schritt 5a: RKI verwendet „für die Zeit seit dem Jahr 2020 eine flexiblere Kurve zur Modellierung der Sterblichkeit“). „Außergewöhnlich“ steht nur noch in der Leitfrage („War der Sommer 2026 … tatsächlich außergewöhnlich …?“), als Frage und nicht als Befund. Das ist zulässig. Feinhinweise siehe N2 und N3. |
| 3 (#14, Formulierung aus [4]) | **erfüllt** | „Nach unserer eigenen Auswertung liegt das außerhalb der bekannten Schwankungsbreite seit 1992.“ | Deckt sich mit [4] („außerhalb der bekannten Schwankungsbreite“, Bezug: 34 Jahre ab 1992). Der Bezug auf 16.000 statt 15.800 ist über den zulässigen Punktschätzer-Vergleich (16.000 > 15.800) gedeckt. |
| 4 (#7, #19, #22–#25, Prüfung am Originaltext [1]) | **offen – Prüfung durch Mensch** | unverändert: „Für ihn gilt: ‚Weglassen ist das neue Leugnen‘.“ sowie die Paraphrasen und Angaben zur Ausgabe | Laut Auftrag prüft Daniel Saure am Originaltext. [1] ist für den Faktenprüfer weiterhin nicht zugänglich (kein neuer Abruf versucht). Bis zur dokumentierten Prüfung bleibt die Auflage offen. |
| 5 (#21, brandmelder) | **erfüllt** (mit Hinweis N1) | „Döschner war lange Energieexperte der ARD und steht hinter dem Online-Magazin brandmelder, das die deutsche Klimaberichterstattung kritisch beobachtet.“ | Die unbelegte Gründeraussage ist entfernt. „Steht hinter“ ist unspezifisch und mit allen vorliegenden Quellen vereinbar: Sekundärquellen (leitet die Redaktion; Mitgründer und Vorstand des Trägervereins Netzwerk Klimajournalismus), [2] Fn. 7 (Döschner veröffentlicht im „Brandmelder“) sowie die von der Hauptsession berichtete Angabe „ins Leben gerufen“ (von mir nicht geprüft). Die Zweckbeschreibung ist mit der Selbstdarstellung von brandmelder.org vereinbar (das Projekt beobachtet die Klimaberichterstattung, ordnet sie ein und legt Muster offen; Untertitel laut [2] Fn. 7: „Klima braucht Kontext“). |
| 6 (#29, „ausdrücklich als klimawandelbedingt eingeordnet“) | **erfüllt** | „Laut dem Bericht hat Das Erste die Juni-Hitzewelle erst am siebten Tag der Warnperiode des Deutschen Wetterdienstes ausdrücklich als klimawandelbedingt eingeordnet. Vorher gab es nur einzelne Randerwähnungen.“ | Wortlaut gemäß [2] („erst am siebten Tag der DWD-Warnperiode erstmals als klimawandelbedingt ein[geordnet]“). Der neue Satz zu den Randerwähnungen ist gedeckt durch [2] Kap. 3.3: Der Klimabezug „beschränkt sich … auf drei Randstellen“ (18.06., 19.06., 19./20.06.). |
| 7 (#33, Precision) | **erfüllt** | „Nach eigenen Angaben sind 94 Prozent der gezählten Minuten tatsächlich Klima-Minuten, und das Verfahren findet 89 Prozent aller Klima-Minuten [2].“ | Precision und Recall sind jetzt fachlich korrekt übersetzt (vgl. [2] Anhang A: „Genauigkeit (Precision) von 94 % und eine Trefferquote (Recall) von 89 %“). Feinhinweis siehe N4. |

### Übernommene Empfehlungen

| Empfehlung | Belegsatz aus dem Entwurf | Ergebnis |
|---|---|---|
| #6 „Teil der Fallzahlen“ | „Weil die Bevölkerung älter wird, steigt ein Teil der Fallzahlen auch unabhängig vom Klima [4].“ | bestätigt (SAP 8.2; run_log Schritt 2: absolute, nicht altersstandardisierte Fallzahl; [4] spricht von der „alternden Bevölkerung“) |
| #32 „die häufigsten Fehltreffer“ | „Die häufigsten Fehltreffer wie ‚Klimaanlage‘ werden herausgefiltert.“ | bestätigt ([2] Anhang A: „Die gängigsten falsch-positiven Treffer wie etwa ‚Wirtschaftsklima‘ oder ‚Klimaanlage‘ wurden rausgefiltert.“) |
| #37 „Methode ist im Bericht beschrieben“ | „Die Methode ist im Bericht aber beschrieben.“ | bestätigt (keine Wertung mehr über die Quelle hinaus) |
| #39 „laut KLIMA° vor acht“ | „Gleichzeitig ist der Klima-Anteil im Programm von Das Erste und ZDF laut KLIMA° vor acht auf den niedrigsten Stand seit Beginn der Messung gefallen.“ | bestätigt ([2] Überblick: „niedrigste Wert seit Beginn der kontinuierlichen Messungen Mitte 2021“; jetzt korrekt als Aussage des Berichts gekennzeichnet) |

Nicht übernommen (bleiben Empfehlungen, keine Auflagen): #11 (Hinweis „möglicherweise unpräzise“), #13 (jeweilige Obergrenzen der Sensitivitätsanalysen), #36 (Eigeninteresse des Vereins benennen), Überschrift „Was Medien weglassen“, Transparenzhinweis zur Abhängigkeit von [1] und [2], #20 („beim WDR“).

### Prüfung auf neue Fehler und neue Inferenz

Neue oder geänderte Sätze wurden gegen SAP, run_log, [2], [4] und brandmelder.org geprüft. **Es wurde keine neue Berechnung und keine neue Inferenz eingeführt.** Die Einschränkungssätze geben Vorgaben und dokumentierte Befunde des eingefrorenen SAP und des run_log wieder (SAP 2, 8.1; run_log Schritte 4 und 5a). Sie ziehen daraus keine neuen Schlüsse. Kein Punkt ist „kritisch“.

Feinhinweise (keine Auflagen, im Zweifel als geringe Abweichung geführt):

| Nr. | Stelle | Ergebnis | Hinweis |
|---|---|---|---|
| N1 | „steht hinter dem Online-Magazin brandmelder“ | Abweichung (gering) | brandmelder nennt sich selbst „ein Projekt des Netzwerk Klimajournalismus Deutschland e. V.“, nicht „Online-Magazin“. Die Startseite nennt keine Person als Verantwortliche. „Steht hinter“ ist mit den Quellen vereinbar, bleibt aber unbestimmt (Gründer, Redaktionsleiter oder Trägerverein?). Wenn Daniel Saure bei der Prüfung von Auflage 4 am Treibhauspost-Text „ins Leben gerufen“ bestätigt, ist die gewählte Formulierung davon gedeckt. „Online-Magazin“ ist als Gattungsbezeichnung vertretbar. |
| N2 | „Und das RKI hat seine Methodik ab 2020 geändert.“ | bestätigt, mit Hinweis | Inhaltlich gedeckt (run_log 5a, Zitat aus RKI EB-19-2025). Genauer: Das RKI modelliert die Sterblichkeit *für die Jahre ab 2020* mit einer flexibleren Kurve. Die aktuelle Methodik wird rückwirkend auf die ganze Reihe angewandt (run_log 5b). „Ab 2020 geändert“ könnte als Datum der Methodenrevision gelesen werden. Für Laien vertretbar. Die Angabe steht nicht in [4], sondern nur im Analyseplan bzw. run_log (über den GitHub-Verweis in [4] erreichbar). Ein Quellenverweis am Satz fehlt. Vorschlag: „[4]“ anhängen oder „laut RKI“ ergänzen. |
| N3 | „Dass ein Teil des Abstands darauf zurückgeht, können wir nicht ausschließen.“ / Fazit „deutlich außerhalb“ | bestätigt | Entspricht SAP 8.1 (Methodikbruch als nicht ausgeschlossene Alternativerklärung). Es wird keine Größenordnung behauptet. „Deutlich“ ist durch [4] („weit unter der tatsächlichen 2026er-Schätzung“) und run_log (z = 4,46) gedeckt. Die Alterung (SAP 8.2) als zweite Alternativerklärung wird im Abschnitt „Was die Daten nicht zeigen“ genannt. |
| N4 | „Nach eigenen Angaben sind 94 Prozent …“ | bestätigt, mit Hinweis | Gemeint ist: laut Bericht. Laut [2] Fn. 12/13 („ebd.“) stammen die Kennwerte aus einer Validierungsveröffentlichung von 2022 (Media Perspektiven) und gelten laut Anhang A nur für die „Klima“-Zählung der Jahresreihe, nicht für die Hitzephasen-Begriffsliste. Der Entwurf behauptet nichts Gegenteiliges. |
| N5 | Kurz gesagt / Fazit: 16.000 statt 15.800 | bestätigt | Übertragung der veröffentlichten Einordnung auf 16.000 ist über den reinen Punktschätzer-Vergleich gedeckt (siehe #16). Durch die neuen Einschränkungen (Auflage 2) ist die Vorläufigkeit jetzt benannt. |

### Neues Gesamturteil: **ok mit Auflagen**

Die Auflagen 1, 2, 3, 5, 6 und 7 sind erfüllt. Die übernommenen Empfehlungen (#6, #32, #37, #39) sind korrekt umgesetzt. Neue Inferenz oder neue Fehler wurden nicht eingeführt, es gibt nur die Feinhinweise N1 und N2 (gering, keine Auflage). Das Urteil bleibt „ok mit Auflagen“, weil Auflage 4 offen ist. Der Kern der Anlassquelle ([1]: Zitat, Paraphrasen, Angaben zur Ausgabe) ist weiterhin von niemandem dokumentiert am Originaltext geprüft.

**Verbleibende Auflage (vor Freigabe zu erfüllen):**

4. **#7, #19, #22–#25:** Prüfung durch Daniel Saure am Originaltext von Treibhauspost #125: Wortlaut und Urheber von „Weglassen ist das neue Leugnen“, die Paraphrasen (Hitze/Dürre/Niedrigwasser, „Angst oder Strategie“, „eigene Erfahrung“), die genannten Belege („16.000 Hitzetote“, MedienKlimaBericht) sowie Titel, Nummer und Datum der Ausgabe. Empfehlung: Ergebnis der Prüfung als Datei festhalten (z. B. als Nachtrag 2 in dieser Datei), damit das Gate dateibasiert nachweisbar ist.

**Optionale Feinkorrekturen:** N1 (brandmelder-Rolle präzisieren, sobald am Treibhauspost-Text geprüft), N2 (Quellenverweis am Methodik-Satz).

## Nachtrag 2 (17.10.2026)

**Geprüft:** Entwurf `Reports/2026-10-17-klimaberichterstattung-hitze/kanal-entwuerfe/substack.md` (Stand 17.10.2026, vollständig neu gelesen)
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Umfang:** Dokumentation von Auflage 4 (Prüfung durch einen Menschen), Prüfung der Änderungen N1 und N2 seit Nachtrag 1 und der neuen Quelle [5], Prüfung auf neue Fehler und neue Inferenz.
**Herangezogene Quellen:** `Analysen/2026-08-hitzesommer-2026/output/eb19.txt` (lokale Textfassung des Bulletins, Einleitung und Methoden, Zeilen 1–78), edoc.rki.de (Landingpage per WebFetch, 17.10.2026), doi.org/10.25646/13135 (Weiterleitung geprüft, 17.10.2026), brandmelder.org (WebFetch, 17.10.2026).
**Der Artikel wurde nicht verändert.** Dieser Nachtrag enthält keinen Freigabevermerk.

### Auflage 4: Status

| Auflage | Status | Nachweis | Hinweis |
|---|---|---|---|
| 4 (#7, #19, #22–#25, Prüfung am Originaltext [1]) | **erfüllt (Prüfung durch Mensch, 17.10.2026)** | Laut Hauptsession hat Daniel Saure am 17.10.2026 im Chat erklärt, dass er den Originaltext von Treibhauspost #125 geprüft hat. Wortlaut: „stimmt alles und habe alles gelesen“. Damit sind laut Auftrag bestätigt: das Zitat „Weglassen ist das neue Leugnen“ (Wortlaut und Urheber), die Paraphrasen (Hitze/Dürre/Niedrigwasser, „Angst oder Strategie“, „eigene Erfahrung“), die genannten Belege („16.000 Hitzetote“, MedienKlimaBericht) sowie Titel, Nummer und Datum der Ausgabe. | **Das ist eine menschliche Prüfung, keine Prüfung des Faktenprüfers.** [1] wurde von mir nicht erneut abgerufen und nicht selbst nachgeprüft. Daniels Aussage liegt mir nur in der Wiedergabe durch die Hauptsession vor, nicht als eigene Datei oder Originalnachricht. Die Punkte #7, #19 und #22–#25 bleiben aus Sicht des Faktenprüfers „nicht prüfbar“. Für das Gate gelten sie als durch Daniel Saure geprüft. |

### Prüfung der Änderungen seit Nachtrag 1

| Nr. | Neue Formulierung im Entwurf | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| N1 | „Döschner … steht hinter brandmelder, einem Projekt des Netzwerks Klimajournalismus Deutschland, das die deutsche Klimaberichterstattung kritisch beobachtet.“ | brandmelder.org (WebFetch 17.10.2026); Sekundärquellen aus der Erstprüfung | **bestätigt** | Die Trägerangabe ist jetzt primär belegt. brandmelder.org schreibt wörtlich: „Ein Projekt des Netzwerk Klimajournalismus Deutschland e.V.“. Die Bezeichnung „Online-Magazin“ (Feinhinweis N1 aus Nachtrag 1) ist entfernt. Zum Zweck schreibt die Seite sinngemäß, dass sie die Klimaberichterstattung beobachtet und einordnet und Muster sichtbar macht. „Kritisch beobachtet“ ist damit vereinbar. Döschners Rolle („steht hinter“) belegt die Startseite selbst nicht: Sie nennt ihn nur als Autor (neben Arnhold, Kösters und Janzen). Gedeckt ist die Rolle durch Sekundärquellen (leitet die Redaktion, Mitgründer und Vorstand des Trägervereins). Ob der Treibhauspost-Text das sagt, fällt unter Daniels Prüfung (Auflage 4) und wurde von mir nicht geprüft. Die Formulierung ist weiterhin unbestimmt, aber nicht falsch. Grammatik: „des Netzwerks Klimajournalismus Deutschland“ ist korrekt dekliniert. Der Vereinsname lautet amtlich „Netzwerk Klimajournalismus Deutschland e. V.“. Dass „e. V.“ weggelassen wird, ist redaktionell üblich. |
| N2a | „Und das RKI modelliert die Sterblichkeit seit 2020 wegen der Corona-Pandemie mit einer flexibleren Kurve [5].“ | [5] lokal: `eb19.txt` Einleitung (Zeilen 23–33, S. 3) und Methoden (Zeilen 52–61, rechte Spalte, S. 4) | **bestätigt** | Belegstelle Einleitung (S. 3): „Da es in Folge der Coronavirus Disease 2019-(COVID-19-)Pandemie nicht nur zu deutlichen Übersterblichkeiten in Deutschland kam, sondern sich auch das saisonale Sterblichkeitsmuster veränderte, verwenden wir für die Zeit seit dem Jahr 2020 eine flexiblere Kurve zur Modellierung der Sterblichkeit.“ Methoden (S. 4): Nach 2020 zeigen sich „in Folge der COVID-19-Pandemie veränderte Muster“. Das wird durch „eine Erhöhung der Anzahl der Freiheitsgrade des Spline-Trends für diesen Zeitraum im Modell berücksichtigt“. Die Paraphrase ist korrekt: Zeitraum (seit 2020), Grund (Corona-Pandemie) und Inhalt (flexiblere Kurve). Der Feinhinweis N2 aus Nachtrag 1 (Lesart „ab 2020 geändert“ als Revisionsdatum, fehlender Quellenverweis) ist damit erledigt. |
| N2b | „Dass ein Teil des Abstands auf diese Methodenänderung zurückgeht, können wir nicht ausschließen.“ | SAP 8.1, run_log 5a (siehe Nachtrag 1, N3); [5] | **bestätigt, mit Hinweis** | Das ist keine neue Inferenz. Es gibt die im eingefrorenen SAP (8.1) festgelegte, nicht ausgeschlossene Alternativerklärung wieder und behauptet keine Größenordnung. Hinweis zur Wortwahl: Das RKI selbst schreibt, die Methodik stimme „im Wesentlichen mit der Methodik der früheren Publikationen überein“ (Einleitung). Es beschreibt die flexiblere Kurve als Anpassung für den Zeitraum ab 2020. „Methodenänderung“ ist eine Verkürzung, die SAP und run_log ebenso verwenden („Methodikbruch“). Das ist vertretbar und keine Auflage. |
| [5] | „Robert Koch-Institut: Hitzebedingte Mortalität in Deutschland 2023 und 2024. Epidemiologisches Bulletin 19/2025, 7. Mai 2025, Abschnitt Einleitung/Methoden (Kopie unter Analysen/2026-08-hitzesommer-2026/output/ im Repository).“ | `eb19.txt` Kopfzeile (Zeilen 1–3); edoc.rki.de (WebFetch 17.10.2026) | **Abweichung (gering)** | Titel, Heftnummer 19/2025 und Datum 7. Mai 2025 sind bestätigt, lokal (Kopfzeile „Epidemiologisches Bulletin 19\|2025 7. Mai 2025“, Titel S. 3) und auf edoc.rki.de (Titel, Datum 2025-05-07, Autor Matthias an der Heiden, DOI 10.25646/13135). Die Abschnittsangabe „Einleitung/Methoden“ stimmt. Abweichung: Die Quellenangabe enthält keine öffentliche URL und keine DOI. Sie verweist nur auf eine Kopie „im Repository“. Ob die Datei im öffentlichen GitHub-Repository tatsächlich liegt (also versioniert und nicht nur lokal vorhanden ist), habe ich nicht geprüft. Für Leserinnen und Leser des Substack-Artikels ist die Quelle so schwer auffindbar. Empfehlung: die verifizierte offizielle Fundstelle angeben (siehe unten). Der Autor wird in [5] nicht genannt. Das ist bei RKI-Bulletins als institutionelle Zitierung vertretbar. |

**Verifizierte URL für [5]:**
- DOI: https://doi.org/10.25646/13135 (am 17.10.2026 aufgerufen: 302-Weiterleitung auf die edoc-Landingpage)
- Landingpage: https://edoc.rki.de/handle/176904/12682 (am 17.10.2026 aufgerufen: Titel „Hitzebedingte Mortalität in Deutschland 2023 und 2024“, Autor an der Heiden, Matthias, Datum 2025-05-07, DOI 10.25646/13135)
- PDF: https://edoc.rki.de/bitstream/handle/176904/12682/EB-19-2025_10-25646-13135.pdf (am 17.10.2026 aufgerufen: liefert ein PDF mit ca. 646 KB. Der Text war per WebFetch nicht lesbar, ein Wortabgleich mit der lokalen Kopie war daher online nicht möglich. Dateiname und Landingpage passen zu Heft 19/2025.)

### Prüfung auf neue Fehler und neue Inferenz

- **Keine neue Berechnung, keine neue Inferenz.** N1 ist eine reine Beschreibung des Trägers. N2a gibt die RKI-Methodik beschreibend wieder. N2b wiederholt die im SAP 8.1 vorab festgelegte Einschränkung und behauptet keine Größenordnung.
- Fazit („ein Einfluss der geänderten RKI-Methodik ist nicht ausgeschlossen“) ist mit N2a/N2b konsistent.
- Die übrigen Textteile sind gegenüber Nachtrag 1 unverändert (Abgleich mit den dort zitierten Belegsätzen). Ausgenommen sind die Sätze N1, N2a und N2b sowie die neue Quelle [5]. Neue Fehler wurden nicht gefunden.
- Feinhinweis (keine Auflage): Leserinnen und Leser könnten „seit 2020“ so verstehen, dass das RKI die Methode erst seit 2020 anwendet. Gemeint ist der modellierte Zeitraum. Der Kontext („wegen der Corona-Pandemie“) macht das hinreichend klar.

### Gesamturteil Nachtrag 2: **ok**

Alle Auflagen sind erfüllt. Die Auflagen 1–3 und 5–7 sind laut Nachtrag 1 durch den Faktenprüfer erfüllt. Auflage 4 ist durch die Prüfung von Daniel Saure am Originaltext erfüllt (17.10.2026, Wortlaut siehe oben). Die Feinhinweise N1 und N2 aus Nachtrag 1 sind umgesetzt, N2a ist an der Primärquelle [5] belegt. Kein Punkt ist „kritisch“, und es gibt keine neue Inferenz.

**Restauflagen:** keine.

**Empfehlungen (nicht zwingend):**
- [5]: Die öffentliche Fundstelle ergänzen, z. B. „https://doi.org/10.25646/13135“, statt nur auf die Kopie im Repository zu verweisen. Falls der Repository-Verweis bleibt, vorher prüfen, ob die Datei im öffentlichen Repository tatsächlich vorhanden ist.
- Die Empfehlungen aus Nachtrag 1, die nicht übernommen wurden (#11, #13, #20, #36, Überschrift, Transparenzhinweis [1]/[2]), gelten unverändert.
