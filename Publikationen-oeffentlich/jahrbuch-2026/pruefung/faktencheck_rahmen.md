# Faktencheck Rahmentexte (Jahrbuch 2026): Einleitung, Überblick, Nachwort, Glossar, Kanäle und Impressum

**Geprüfte Dateien** (Entwürfe v0.1, 24.10.2026, nicht verändert; Stand nach den Änderungen vom 24.10.: Einleitung mit gelieferter Angabe FAKT 1, Kanäle/Impressum mit Über-Text und Impressum aus Daniels Chat):
- `Publikationen-oeffentlich/jahrbuch-2026/kapitel/00-einleitung.md`
- `…/00b-ueberblick.md`
- `…/11-nachwort.md`
- `…/12-glossar.md`
- `…/13-kanaele-impressum.md`

Zeilenangaben „Z.“ beziehen sich auf diese Fassungen. Kopfzeilen und eckige Klammern mit Platzhaltern oder Hinweisen sind nicht Buchtext (Platzhalter siehe Abschn. 3, nicht bewertet).
**Prüfdatum:** 24.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor der Entwürfe)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschn. 5/7: Einleitung und Nachwort volle Prüfung; Überblick und Glossar Differenzprüfung gegen die Kapitel; Kanäle Abgleich mit CLAUDE.md und Substack-Seite. Regel: keine neue Berechnung, keine neue Inferenz; im Zweifel „Abweichung“. Kapitel 9 hat eine eigene Datei (`faktencheck_kap09.md`).

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| Kapitel 1, 2, 3, 5, 6 (freigegebene Fassungen, Kopfzeilen und Kurz-gesagt-Absätze) | gelesen (Kap. 1, 2, 3, 5 vollständig, Kap. 6 Kopf und Kurz gesagt) | Abgleich Überblick, Glossar, Einleitung |
| Kapitel 4, 7, 8, 9, 10 (Entwürfe v0.1, nicht geprüft) | gelesen (vollständig); Kap. 9 nach der Änderung vom 24.10. neu gelesen | Abgleich nur gegen den Entwurfsstand; Aussagen des Überblicks über diese Kapitel sind so lange vorläufig |
| `00-einleitung.md`, `13-kanaele-impressum.md` | nach den Änderungen vom 24.10. neu gelesen | Abschn. 2.1, 2.5, 2.6 |
| `CLAUDE.md` (Workflow, Stufen, Kanäle, Impressum, Name) | als Projektanweisung vorliegend, gelesen | Kanal-URLs, Stufen, Gates, Namensregel |
| `quellen-artikel/INDEX.md`, Archiv-API (WebFetch 24.10.2026) | gelesen | 17 Posts; frühester 27.08.2026 („Erreicht Deutschland sein Klimaziel 2040?“); `_archiv.json` nicht gelesen (Datei zu groß), API stattdessen |
| About-Seite `https://klimaevidenzcheck.substack.com/about` (WebFetch 24.10.2026, zwei Abrufe) | gelesen, nur als Zusammenfassung des Abrufwerkzeugs (kein wörtlicher Text erhältlich) | Links auf Newsletter, Instagram, Facebook, WhatsApp, GitHub; „Jede Zahl hat eine Quelle“; drei Formate; Faktencheck-Satz; Code/Analysepläne öffentlich; Impressum mit § 5 DDG, § 18 Abs. 2 MStV, Anschrift Hattersheim am Main, E-Mail-Kontakt, Geltung für Instagram/Facebook/WhatsApp, Datenschutz mit Substack-Link; keine KI-Angabe |
| Beitrag „Was ist Klima Kompass – und wo findet ihr uns?“ (WebFetch 24.10.2026) | gelesen | Beschreibt Evidenzcheck, Einordnung, Wissen; Repository-Link; Impressum-Link; erwähnt keine KI |
| `kapitelplan.md`, `gliederung_rahmen.md`, `faktencheck_kap01/02/03/05/06.md` (Köpfe), `faktencheck_kap09.md` | gelesen | Gates, Prüfstand |
| `.gitignore`, `.git/config`, `ABBRUCH.md` Rhein, `SAP Prognose-Register 2027` (Kopf), `Prognose-Register/01_gasspeicher-winter-2026-27.md` | gelesen | Rohdaten-Ausschluss; Remote-URL; Register-Eintrag #1 registriert 22.10.2026; vier Zielgrößen 2027 |
| Validierungsbericht Expertenrat (Nachtrag 3) | gelesen | Stand der Analyse für Nachwort/Überblick |

## 2. Tabellen der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4, E-Nummern auf die Empfehlungen in Abschnitt 5.

### 2.1 Einleitung (`00-einleitung.md`)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Dieses Buch ist das Klima-Jahr 2026 in Zahlen: War der Sommer normal? Reicht das Gas für den Winter? Was kostet Klimapolitik? Schafft Deutschland sein Klimaziel?“ (Z. 4) | Kapitel 1–4 (Titel/Fragen) | Abweichung (gering) | Die Fragen stimmen mit den Kapiteln überein. „Klima-Jahr 2026“ legt ein ganzes Jahr nahe; die Artikel stammen aus dem Zeitraum 27.08.–21.10.2026 (Archiv, INDEX). A7. |
| 2 | „Zu jeder dieser Fragen gab es in diesem Jahr Zahlen, die stimmten, Zahlen, die verkürzt waren, und Zahlen, bei denen ein Vergleich fehlte.“ (Z. 4) | Kap. 1 (Vergleichsmaßstab), Kap. 2 (Müller vergleicht mit einem Winter; 136 TWh stimmen), Kap. 3 (6 Billionen brutto), Kap. 4 (Zeitfenster) | bestätigt (mit Hinweis) | Pauschal („zu jeder“). In den Kapiteln nachvollziehbar, aber nicht für jede Frage alle drei Sorten. E6. |
| 3 | „Klima Kompass ist ein Projekt, das Aussagen zu Klima und Energie an öffentlichen Daten prüft und erklärt.“ (Z. 8) | Beitrag vom 16.10.2026 („Wir prüfen Aussagen zu Klima und Energie an öffentlichen Daten“) | bestätigt | |
| 4 | „Unseren ersten Artikel haben wir am 27. August 2026 veröffentlicht.“ (Z. 8) | Archiv-API 24.10.2026; INDEX.md (27.8. THG-Trend 2040) | bestätigt | Frühester von 17 Posts; Veröffentlichungsdatum stimmt. |
| 5 | „Unser Prinzip ist einfach: Jede Zahl hat eine Quelle, und wir legen vorab fest, wie wir rechnen.“ (Z. 10) | Kap. 2 Z. 45 (Zahl „300 GWh bis 2050“ „nicht belegt“); Kap. 3 Z. 22, 40 (Rechenkommentar ohne vorab festgelegten Plan); Kap. 4 Z. 70 (THG-Trend 2040 ohne Validierungsbericht als Datei) | Abweichung | Zwei Absolutaussagen. Das Vorab-Festlegen gilt für Evidenzchecks (CLAUDE.md), nicht für Einordnung, Wissen und den Rechenkommentar. „Jede Zahl hat eine Quelle“ widerspricht der Kennzeichnung „nicht belegt“ in Kap. 2. Der Satz steht wörtlich auch auf der About-Seite und in Kap. 13 (Nr. 79). A1. |
| 6 | „Dabei hilft uns künstliche Intelligenz. Sie schreibt Analysepläne, Programmcode und Entwürfe.“ (Z. 10) | CLAUDE.md; `.claude/agents/`; SAP-Autorenzeilen; Kap. 9 | bestätigt | Der Beitrag vom 16.10. und die About-Seite erwähnen KI nicht; das Buch ist die erste öffentliche Nennung außerhalb des Repositorys (Kap. 9: „Claude von Anthropic“ als Angabe entschieden). |
| 7 | „Freigeben und veröffentlichen tun Menschen.“ (Z. 10) | CLAUDE.md; Impressum (Verantwortlicher: Daniel Saure); Einleitung Z. 8 („ein Mathematiker“) | Abweichung (gering) | Regel stimmt; Plural „Menschen“ nach Quellenlage unbelegt: Die Einleitung selbst spricht jetzt von einer Person („ein Mathematiker“). Vorfall vom 29.08. (Kap. 9). A2. |
| 8 | Tabelle: **Evidenzcheck** „eingefrorener Analyseplan, unabhängige Validierung ohne Befund ‚kritisch‘, Freigabe“ (Z. 18) | CLAUDE.md Stufen | bestätigt | |
| 9 | Tabelle: **Einordnung** „ergänzt um bereits veröffentlichte eigene Ergebnisse oder Zahlen aus der Quelle, ohne neue Rechnung“; Prüfung „Faktencheck, Freigabe“ (Z. 19) | CLAUDE.md Stufen | bestätigt | |
| 10 | Tabelle: **Wissen** „Erklärstück auf Basis seriöser Quellen“; „Faktencheck, Freigabe“ (Z. 20) | CLAUDE.md Stufen | bestätigt | |
| 11 | Tabelle: **Prognose-Register** „Registrierung mit Zeitstempel im Repository, Auswertung unabhängig vom Ausgang“ (Z. 21) | Registerdatei #1 (22.10.2026, „maßgeblich ist der Zeitstempel des Git-Commits“); SAP Register 2027 („Format: Evidenzcheck, Unterformat ‚Prognose-Register‘“; Registrierung mit Validierungsbericht im selben Commit) | Abweichung (gering) | Das Register ist laut SAP ein Unterformat des Evidenzchecks mit dessen Gate; die Tabelle nennt nur Registrierung und Auswertung, nicht Plan-Einfrieren und Validierung, und führt es als vierte „Form“. CLAUDE.md kennt es nicht als Stufe. Die Überschrift sagt „drei Formen und ein Register“, die Tabelle hat vier Zeilen. A6. |
| 12 | „Eine Analyse beantwortet eine Frage. Eine Einordnung hilft, wenn ein Thema gerade in den Nachrichten ist. Ein Wissensstück erklärt, was man dafür wissen muss.“ (Z. 23) | `gliederung_rahmen.md` (gleicher Wortlaut); CLAUDE.md Stufen | bestätigt | Beschreibung der Stufen, Wertung ohne Zahl. |
| 13 | „Offene Daten und offener Code. Analysepläne, Programme, Rohdaten und Prüfberichte liegen im öffentlichen Repository (https://github.com/dsaure55/klima-evidenzcheck).“ (Z. 27) | `.git/config` (origin); About-Seite („Code und Analysepläne sind öffentlich“); GitHub-Ordnerlisten | Abweichung | URL stimmt. Nicht für jede Analyse: GRDC-Rohdaten per `.gitignore` ausgeschlossen, Rhein-Rohdaten „nicht eingecheckt“ (`ABBRUCH.md`), Rohdaten der Batterie-/Dunkelflauten-Analyse derzeit unversioniert (git status); zu „65 Euro“ gibt es kein Skript (Kap. 3 Z. 40), zum THG-Trend 2040 keinen Validierungsbericht als Datei (Kap. 4 Z. 70). Die About-Seite und Kap. 13 sagen enger „Code und Analysepläne“. A3. |
| 14 | „Sichtbare Korrekturen. Wo wir falsch lagen, steht es mit Datum und Begründung in Kapitel 8. Auch abgebrochene Analysen bleiben sichtbar.“ (Z. 28) | Kap. 8 (Entwurf); `ABBRUCH.md`; Kap. 9 | Abweichung (gering) | Kap. 8: Bei Fall 4 fehlt ein Korrekturdatum („bisher nichts geändert“), bei Fall 5 und 6 steht „Ursache … noch nicht aufgearbeitet“ und „Aufnahme offen“. „Mit Datum und Begründung“ trifft derzeit auf drei von sechs Fällen nur teilweise zu. Der abgebrochene Rhein-Fall steht in Kap. 9 und im Repository, nicht in Kap. 8. A4. |
| 15 | „Quellen und Stand im Text. Jede Zahl hat eine Quelle und einen Datenstand. Wo etwas eine Schätzung mit Spanne ist, steht die Spanne dabei.“ (Z. 29) | Kap. 2 Z. 45 und Kopfzeile Kap. 2 (DWD-Abgleich nicht als erledigt dokumentiert); Kap. 3 (Nachtrag „belegt ist das nicht“) | Abweichung | Wie Nr. 5. „Spanne dabei“: Stichprobe in Kap. 1–6 ohne Gegenbefund, aber nicht für das ganze Buch prüfbar. A1. |
| 16 | „Das Prognose-Register. Wir messen uns an unseren eigenen Vorhersagen (Kapitel 10).“ (Z. 30) | Kap. 10; Registerdatei #1 | bestätigt | Bisher ein Eintrag registriert; Auswertung frühestens Mai/Juni 2027. |
| 17 | Aufbau: „Was stimmt (Kapitel 1 bis 6): sechs Fragen … Was nicht (Kapitel 7 bis 9): wie du Zahlen selbst prüfst, wo wir falsch lagen und wie ein Evidenzcheck entsteht. Was kommt (Kapitel 10)“ (Z. 34–38) | `kapitelplan.md` Gliederung; Kapitelüberschriften 7, 8, 9, 10 | bestätigt | |
| 18 | Raster: „Kurz gesagt, Haupttext, Was heißt das für dich?, Lagen wir richtig?, Woher wir das wissen“ (Z. 40) | Kapitel 1–10 | bestätigt (mit Hinweis) | In allen zehn Kapiteln vorhanden. In Kap. 7 bis 10 ist der „Haupttext“ nicht als eigener Abschnitt benannt; Kap. 8 beantwortet „Lagen wir richtig?“ mit einem Verweis auf das ganze Kapitel. |
| 19 | „Grafiken zeigen vorhandene Zahlen aus unseren Analysen oder den genannten Quellen. Sie enthalten keine neuen Rechnungen.“ (Z. 45) | Grafikunterschriften Kap. 1–6; Kap. 4 Z. 21, 47 und Kopfzeile | Abweichung (gering) | Kap. 1–3, 5, 6 stimmen. In Kap. 4 stammen die 407–566 und 86–328 aus einem Rechenlauf vom 24.10.2026 (Kopfzeile, Herkunftstabelle) und weichen von den Bereichen im Artikel vom 27.08. ab (Kap. 8 Fall 6); Grafik 2 zeigt einen vorläufigen Analysebericht. Die Bildunterschriften sagen „keine neue Rechnung“. A5. |
| 20 | „Kapitel 4 enthält die Evidenzchecks dieses Herbstes, soweit sie bis zum Redaktionsschluss geprüft und freigegeben sind. Was noch aussteht, steht dort ausdrücklich.“ (Z. 46) | Kap. 4 (Abschnitt „VORLÄUFIG“, Plan B); `kapitelplan.md` Abschn. 11 | bestätigt | Gilt, solange der Vorbehalt in Kap. 4 stehen bleibt. |
| 21 | „Was das Buch nicht ist: … kein Lehrbuch der Statistik und gibt keine Empfehlung zu Geld, Gesundheit oder Politik.“ (Z. 47) | `kapitelplan.md` Abschn. 2 („keine Handlungsempfehlungen zu Geld, Gesundheit oder Politik“) | bestätigt | |
| 22 | „Hinter den Zahlen zu hitzebedingten Sterbefällen stehen Menschen. Wir gehen damit so um.“ (Z. 47) | Kap. 1 Z. 38 | bestätigt | „So“ bleibt unbestimmt; Kap. 1 formuliert „wir schreiben von Todesfällen durch Hitze und gehen vorsichtig mit den Zahlen um“. E3. |
| 23 | „Für alle, die Klimazahlen verstehen und prüfen wollen, ohne Vorkenntnisse in Statistik.“ (Z. 51) | `gliederung_rahmen.md` (Zielgruppe); Kap. 7 | bestätigt | Selbstbeschreibung. |
| 24 | „Klima Kompass gibt es auf Substack, Instagram, Facebook und als WhatsApp-Kanal.“ (Z. 55) | CLAUDE.md Kanäle; About-Seite | bestätigt | |
| 25 | „Die Seite ‚Über / Impressum‘ auf Substack ist der Knotenpunkt, dort stehen alle Links (siehe letzte Seite).“ (Z. 55) | CLAUDE.md („Zentrale Seite … Knotenpunkt“); About-Seite 24.10.2026 | bestätigt | Die About-Seite verlinkt Newsletter, Instagram, Facebook, WhatsApp und GitHub. „Letzte Seite“ ist ein Satzverweis. |

### 2.2 Überblick (`00b-ueberblick.md`)

Maßstab: Der Kopf sagt, jede Zeile sei der Kurz-gesagt-Absatz „gekürzt“; die Zeilen dürfen nichts Neues behaupten und nichts Eingeschränktes uneingeschränkt wiedergeben. Verglichen wird mit den Kurz-gesagt-Absätzen der Kapitel (Kap. 1–6 freigegebene Fassung, Kap. 7–10 Entwurf).

| Nr. | Behauptung (Zeile) | Quelle (Kurz gesagt) | Ergebnis | Hinweis |
|---|---|---|---|---|
| 26 | Kopf: „Jede Zeile ist der Kurz-gesagt-Absatz des jeweiligen Kapitels, gekürzt.“ (Z. 2) | Vergleich der zehn Zeilen | Abweichung | Die Zeilen sind nicht nur gekürzt: Nr. 27–34 lassen Einschränkungen weg oder ändern Formulierungen. A8. |
| 27 | Kapitel 1: „‚Normal‘ hängt vom Vergleich ab: Mit 19,6 °C war der Sommer 2026 der zweitwärmste seit 1881, und die geschätzten 16.000 hitzebedingten Sterbefälle liegen deutlich außerhalb der Bandbreite seit 1992.“ (Z. 8) | Kap. 1 Kurz gesagt | Abweichung (gering) | Zahlen stimmen (19,6 °C, zweitwärmster seit 1881, 16.000, außerhalb der Bandbreite seit 1992). Es fehlen „Sommerhalbjahr“ (RKI-Schätzung gilt für KW 15–37, nicht nur Juni–August) und der Schlusssatz „Warum das so ist, sagen diese Zahlen nicht“. Der „und“-Satz verbindet Temperatur und Sterbefälle ohne die Kausalgrenze. A9. |
| 28 | Kapitel 2: „Ein Füllstand in Prozent sagt wenig; entscheidend sind Menge, Temperatur und laufende Lieferungen, und heutige Batteriespeicher könnten die Dunkelflauten seit 2015 nur zu etwa 0,5 bis 1 Prozent abdecken.“ (Z. 9) | Kap. 2 Kurz gesagt: „… hätten … in unserer Rechnung die Dunkelflauten seit 2015 nur zu rund 0,5 bis 1 Prozent abdecken können (mit nachträglich bereinigten Kapazitätsdaten, ohne Nachladung und ohne Importe).“ | Abweichung | Die drei Einschränkungen und „in unserer Rechnung“ fehlen; aus „hätten … abdecken können“ (rückblickend, Rechnung) wird „könnten … abdecken“ (allgemeine Aussage). Kap. 2 nennt die Zahl selbst „eher eine zu niedrige Näherung“. Der Überblick behauptet dadurch mehr, als das Kapitel sagt. A10. |
| 29 | Kapitel 3: „Der Tankrabatt hob 91 bis 95 Prozent des CO₂-Preises auf Benzin auf, und die ‚6 Billionen Euro‘ sind Bruttoinvestitionen, zusätzlich nötig sind laut KfW rund 65 Milliarden Euro pro Jahr.“ (Z. 10) | Kap. 3 Kurz gesagt: „… hat **nach unserer Rechnung** 91 bis 95 Prozent … wieder aufgehoben.“ | Abweichung (gering) | Die Zahlen stimmen (91–95 %, 65 Mrd. laut KfW). „Nach unserer Rechnung“ fehlt: die 91–95 Prozent stammen aus einem Rechenkommentar, nicht aus einem Evidenzcheck (Kap. 3 Z. 22). Die Frage „wer zahlt?“ hat im Satz keine Antwort. A11. |
| 30 | Kapitel 4: „Das hängt vom Zeitfenster ab: Der lange Trend verfehlt das Ziel 2040 deutlich, der 10-Jahres-Trend liegt im Unsicherheitsbereich.“ (Z. 11) | Kap. 4 Kurz gesagt: „… Schreibt man den Trend … fort, wird das Ziel klar verfehlt … Beides ist keine Prognose.“ | Abweichung (gering) | Zahlen/Aussage sinngemäß. Es fehlt „fortgeschrieben, beides ist keine Prognose“; „der lange Trend verfehlt“ liest sich wie eine Feststellung. Das Kapitel ist Entwurf, der Platzhalter sagt es selbst. A11. |
| 31 | Kapitel 5: „Deutschland verursacht rund 1,3 Prozent der weltweiten Emissionen, aber alle Länder mit höchstens diesem Anteil zusammen fast ein Drittel.“ (Z. 12) | Kap. 5 Kurz gesagt: „Deutschland verursachte **2024** rund 1,3 Prozent der weltweiten **Treibhausgas**emissionen (Rang 12 von 208) … 31,7 Prozent … Das ist ein Gedankenexperiment und keine Schuldfrage.“ | Abweichung | Jahr und Gasbezug fehlen („verursacht“ im Präsens, „Emissionen“). Kap. 5 zeigt gerade, dass die Zahl vom Bezug abhängt (CO₂: 1,5 %; historisch 5,3 %; Z. 20, 38–41, 56). Der Satz „Gedankenexperiment, keine Schuldfrage“ fehlt. A12. |
| 32 | Kapitel 6: „Ein Monat über 1,5 Grad reißt das Ziel nicht, aber der Weg zurück verlangt viel mehr, als die Staaten zugesagt haben, und CO₂-Entnahme ergänzt die Minderung nur.“ (Z. 13) | Kap. 6 Kurz gesagt (freigegeben v0.2): „… bedeutet nicht, dass das Pariser Ziel gerissen ist … 18 Prozent … Die Klimazusagen der Staaten bringen 5 bis 8 Prozent … ergänzt die Minderung, ersetzt sie aber nicht.“ | Abweichung (gering) | „Viel mehr“ ist eine Wertung; Kap. 6 nennt 18 gegen 5–8 Prozent. Der Faktencheck zu Kap. 6 (A4) hält fest, dass die 5–8 Prozent für die neuen NDCs gelten (nicht für alle Zusagen der Staaten); der Überblick übernimmt die weite Formulierung. Aus „bedeutet nicht, dass gerissen ist“ wird „reißt nicht“; unkritisch. Es fehlt die Zeitangabe „bis 2030, gegenüber 2025“. A13. |
| 33 | Kapitel 7: „Mit zehn Fragen, von ‚Woher stammt die Zahl?‘ bis ‚Folgt daraus, was behauptet wird?‘.“ (Z. 19) | Kap. 7 (Frage 1: „Wer sagt das, und woher stammt die Zahl?“; Frage 10 wörtlich) | Abweichung (gering) | Zitat in Anführungszeichen ist nicht wörtlich (Frage 1 gekürzt). Kapitel 7 ist Entwurf ohne Faktencheck. A14. |
| 34 | Kapitel 8: „In sechs Artikeln gab es Fehler oder Unbelegtes; keine Korrektur hat eine Kernaussage umgeworfen, und wir nennen jeden Fall mit Datum und Ursache.“ (Z. 20) | Kap. 8 Kurz gesagt und Fälle 1–6 | Abweichung | „Sechs Artikel“ stimmt mit Kap. 8 überein (6 Fälle, 6 Artikel; Aufschlüsselung 2+1+1+1+1 passt). Aber: (a) Fälle 5 und 6 sind „Aufnahme offen [Entscheidung Daniel Saure]“, ohne sie wären es vier; (b) „mit Datum und Ursache“: bei Fall 5 und 6 „Ursache … noch nicht aufgearbeitet“, bei Fall 4 kein Korrekturdatum; (c) „jeden Fall“ ist nicht belegbar, Kap. 8 räumt selbst ein, undokumentierte Änderungen nicht ausschließen zu können; Kap. 4 Z. 70 und Kap. 2 Z. 45 nennen weitere mögliche Fälle (Prüfung des Artikels vom 27.08., Zahl „300 GWh“), die in Kap. 8 fehlen. (d) Kap. 8 nennt „16“ Artikel, das Archiv zeigt am 24.10. 17. A15. |
| 35 | Kapitel 9: „Erst festlegen, dann rechnen, dann unabhängig prüfen; KI schreibt Pläne, Code und Entwürfe, Menschen frieren ein, geben frei und veröffentlichen.“ (Z. 21) | Kap. 9 Kurz gesagt | bestätigt (mit Hinweis) | Sinngemäß. Kap. 9 ist Entwurf; die Prüfung von Kap. 9 (`faktencheck_kap09.md`) beanstandet „immer Menschen“ (A2 dort). Änderungen an Kap. 9 hier mitziehen. |
| 36 | Kapitel 10: „Wir legen uns vorab fest, mit Spanne, Regel und Zeitstempel, und melden später ‚getroffen‘ oder ‚nicht getroffen‘.“ (Z. 27) | Kap. 10 Kurz gesagt | bestätigt (mit Hinweis) | Stimmt. Kap. 10 sagt zusätzlich: ein Eintrag registriert, vier geplant, keine Zahlen für 2027. Kap. 10 ist Entwurf ohne Faktencheck. |
| 37 | Fragen-Spalte: Kap. 7 „Wie erkenne ich, ob eine Klimazahl etwas taugt?“, Kap. 8 „Wo lagen wir falsch?“, Kap. 10 „Was kommt 2027, und woran kannst du uns messen?“ (Z. 19, 20, 27) | Kapitelüberschriften 7, 8, 10 | Abweichung (gering) | Weichen von den Kapitelüberschriften ab („Zehn Fragen an jede Klimazahl“; „Korrekturen 2026: Wo wir falsch lagen“; „Das Prognose-Register: Wir legen uns fest, bevor wir es wissen“). Kein Sachfehler, aber nicht „die Frage des Kapitels“. A16. |
| 38 | Überschrift „Das Jahr in zehn Fragen“ (Z. 1) | Kapitelzahl 1–10 | bestätigt | `kapitelplan.md` sprach von sechs Fragen (nur Teil 1). |
| 39 | Zeile Kap. 4: [Platzhalter] | – | – | Platzhalter, nicht bewertet (Abschn. 3). |

### 2.3 Nachwort (`11-nachwort.md`)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 40 | „Das Klima-Jahr 2026 hat uns eine Menge Zahlen geliefert. Einige davon haben wir geprüft, einige erklärt, und bei einigen haben wir uns selbst korrigiert.“ (Z. 4) | Kap. 1–8 | bestätigt (mit Hinweis) | Sachlich (Evidenzchecks, Wissen/Einordnung, Korrekturen). „Klima-Jahr“: Zeitraum 27.08.–21.10.2026 (A7). |
| 41 | „Wenn du bis hierher gelesen hast, kennst du unsere Arbeitsweise und weißt, wo du uns widersprechen kannst.“ (Z. 4) | Kap. 8 („Wie du uns einen Fehler meldest“), Kap. 9; Impressum (E-Mail-Kontakt, Kap. 13) | bestätigt (mit Hinweis) | Wertung. Ein Kontaktweg ist durch das Impressum (E-Mail laut About-Seite) belegt. Ob Kommentare unter den Artikeln freigeschaltet sind (Kap. 8), ist nicht geprüft. E5. |
| 42 | „Der erste Eintrag, die Gasspeicher-Entnahme im Winter 2026/27, ist registriert.“ (Z. 8) | Registerdatei #1 („Registriert: 22.10.2026“) | bestätigt | |
| 43 | „Die Auswertung folgt, sobald die Daten vorliegen, voraussichtlich im Frühsommer 2027.“ (Z. 8) | Registerdatei („Mai/Juni 2027“, Eurostat bis März 2027) | bestätigt | „Frühsommer“ = Mai/Juni. |
| 44 | „Für 2027 planen wir vier weitere Vorhersagen (Kapitel 10). Termine können sich verschieben.“ (Z. 8) | SAP Prognose-Register 2027 (vier Vorhersagen V1–V4; Teilfreigabe V3); Registerdatei (Einträge #2–#5 reserviert, laut SAP-Verlauf) | bestätigt | Als „geplant“ gekennzeichnet; der SAP ist erst teilweise eingefroren. |
| 45 | „Offene Analysen. Der Prognose-Check … und der Abgleich mit dem Expertenrat sind der Stand dieses Herbstes.“ (Z. 9) | SAP Prognose-Check (v1.1 final, eingefroren 22.10.); Validierungsbericht Expertenrat (Nachtrag 3: Fassung 4 freigabefähig mit Auflagen); Kap. 4 | bestätigt (mit Hinweis) | Stand 24.10.: Prognose-Check ohne Ergebnis; Expertenrat nicht freigegeben, nicht veröffentlicht. Zum Redaktionsschluss neu abgleichen. |
| 46 | „Wo sie zum Redaktionsschluss noch nicht abgeschlossen sind, veröffentlichen wir sie auf Substack, sobald sie geprüft und freigegeben sind.“ (Z. 9) | Kap. 4 (Plan B); Kap. 9 (Rhein-Analyse abgebrochen) | Abweichung (gering) | Zusage, keine Tatsache; Kap. 9 zeigt, dass Analysen abgebrochen werden können. Formulierung als Absicht. A17. |
| 47 | „Das Buch ist ein Stand vom Redaktionsschluss. Die Artikel auf Substack gehen weiter, und wenn wir bei einem Kapitel etwas ändern müssen, schreiben wir es dort mit Datum dazu.“ (Z. 14) | Kap. 8 (Praxis: Hinweis im Artikel mit Datum); `kapitelplan.md` | nicht prüfbar | Absichtserklärung; „dort“ lässt offen, ob Artikel oder Kapitel gemeint ist. E4. |
| 48 | „Findest du einen Fehler, sag uns Bescheid (Kapitel 8). Gute Fragen können zu Evidenzchecks werden.“ (Z. 14) | Kap. 8; Themenradar/Backlog (CLAUDE.md) | bestätigt (mit Hinweis) | Verweis stimmt; Meldeweg siehe Nr. 41. |
| 49 | Ausblick auf nicht umgesetzte Analysen (Z. 10) | – | – | Platzhalter, nicht bewertet. |

### 2.4 Glossar (`12-glossar.md`)

| Nr. | Begriff / Definition | Quelle (Kapiteltext) | Ergebnis | Hinweis |
|---|---|---|---|---|
| 50 | **95-Prozent-Intervall (Prognoseintervall):** „Der Bereich, in dem ein Wert nach dem verwendeten Modell mit 95 Prozent Wahrscheinlichkeit liegt.“ (Kap. 4, 10) | Kap. 4 Z. 14 (gleiche Erklärung); Kap. 10 Z. 16 („19 von 20 Fällen“) | bestätigt (mit Hinweis) | Passt zum Prognoseintervall. Kap. 1 und 2 verwenden außerdem „Konfidenzintervall“ (Fieller; Quote 12–74 Prozent) für etwas anderes (Unsicherheit eines Schätzwerts), das das Glossar nicht abdeckt. E1. |
| 51 | **Amendment:** „Eine gekennzeichnete Änderung an einem eingefrorenen Analyseplan, mit Begründung und erneuter Freigabe.“ (Kap. 9) | Kap. 9 Z. 17 („eine Ergänzung mit Begründung und erneuter Freigabe“) | Abweichung (gering) | „Änderung“ im Glossar, „Ergänzung“ im Kapitel; die Definition ist in CLAUDE.md und Vorlage nicht belegt (nur im SAP Prognose-Register-Kopf: Änderung per „gekennzeichnetem Amendment“); in der Praxis auch „Erratum“ (Expertenrat). Mit Kap. 9 A5 abstimmen. A18. |
| 52 | **ARIMA:** „Ein Zeitreihenmodell, das berücksichtigt, dass aufeinanderfolgende Jahre nicht unabhängig voneinander sind. Bei uns eine Kontrollrechnung.“ (Kap. 4) | Kap. 4 Z. 17 (Kontrollrechnung beim THG-Trend 2040); Kap. 4 Z. 47 (Expertenrat: eines von drei Verfahren, einziges mit Streuung künftiger Jahre) | Abweichung (gering) | Im Teil „Zwei Zeitfenster“ ist ARIMA Kontrollrechnung; im Expertenrat-Abschnitt ein gleichrangiges Verfahren. „Bei uns eine Kontrollrechnung“ gilt nicht durchgehend. A18. |
| 53 | **Brutto / netto:** „Brutto ist die volle Summe, etwa der ganze Preis einer Wärmepumpe. Netto (bei Investitionen) ist nur der Aufpreis gegenüber der Alternative.“ (Kap. 3, 7) | Kap. 3 Z. 9, 18 („Bruttowerte, also mit Mehrwertsteuer“; IWH brutto, KfW netto); Kap. 3 Z. 54–58; Kap. 7 Frage 5; Kap. 8 Fall 1 | Abweichung | Kap. 3 verwendet „brutto/netto“ auch für mit/ohne Mehrwertsteuer (Tabelle IWH gegen KfW, „lassen sich nicht direkt vergleichen“). Diese Bedeutung fehlt; das Glossar erklärt nur die Investitionsbedeutung. A19. |
| 54 | **Cherry-Picking:** „Aus mehreren möglichen Rechnungen nachträglich die auswählen, die das gewünschte Ergebnis liefert.“ (Kap. 9) | Kap. 9 Z. 8 („das Zeitfenster, das schön aussieht, und das Modell, das zum Wunsch passt“) | bestätigt | |
| 55 | **Dunkelflaute:** „Mehrtägige Phase mit gleichzeitig wenig Wind- und Solarstrom.“ (Kap. 2) | Kap. 2 Z. 47 („mindestens drei Tage in Folge mit besonders wenig Wind- und Solarstrom im Verhältnis zum Verbrauch“; Schwelle ist eine Festlegung mit Ermessensspielraum); Kap. 7 Frage 10 | Abweichung (gering) | Das Glossar gibt die allgemeine Lesart (wie Kap. 7), nicht die Definition der Analyse in Kap. 2 (mindestens drei Tage, relativ zum Verbrauch). Zahlen aus Kap. 2 (50 Episoden) hängen an dieser Definition. A20. |
| 56 | **Einordnung / Evidenzcheck / Wissen:** „Unsere drei Formen von Beiträgen (siehe Einleitung und Kapitel 9).“ | Einleitung; Kap. 9 | bestätigt (mit Hinweis) | Einleitung führt zusätzlich das Prognose-Register (Nr. 11). |
| 57 | **Faktencheck:** „Unabhängige Prüfung, bei der jede Zahl und Tatsachenbehauptung gegen ihre Quelle abgeglichen wird.“ (Kap. 9) | Kap. 9 Z. 32; `faktenpruefer.md` | bestätigt | |
| 58 | **Konsumbasiert / produktionsbasiert:** „Konsumbasiert zählt Emissionen dort, wo Güter verbraucht werden, produktionsbasiert dort, wo sie entstehen.“ (Kap. 5) | Kap. 5 Z. 39, 50 | bestätigt | |
| 59 | **Post-hoc:** „Nachträglich, also nicht im Analyseplan vorgesehen. Wir kennzeichnen es.“ (Kap. 9) | Kap. 9 Z. 18; CLAUDE.md | bestätigt (mit Hinweis) | Kap. 9 Prüfung Nr. 16: Die Kennzeichnung wurde nicht in jedem Fall eingehalten (Trittbrettfahrer-Rechnung). „Wir kennzeichnen es“ als Regel. |
| 60 | **Prognose-Register:** „Öffentliche Liste unserer Vorhersagen mit Spanne, Bewertungsregel, Stichtag und Zeitstempel.“ (Kap. 10) | Kap. 10 Z. 8–14 | bestätigt | |
| 61 | **SAP:** „Der vorab festgelegte Plan einer Analyse mit Frage, Daten, Methode, Sensitivitätsprüfungen und Grenzen.“ (Kap. 9) | Kap. 9 Z. 10 | bestätigt | |
| 62 | **Sensitivitätsanalyse:** „Prüfung, wie sich das Ergebnis ändert, wenn man andere vernünftige Annahmen trifft.“ (Kap. 9) | Kap. 9 Z. 10 | bestätigt | |
| 63 | **Szenario / Prognose / Projektion:** „Ein Szenario sagt, was bei bestimmten Annahmen geschähe. Eine Prognose sagt, was erwartet wird.“ (Kap. 7, 10) | Kap. 7 Frage 7 (Messung, Szenario, Prognose); Kap. 10 Z. 18 („Klimaprojektion beschreibt, was unter bestimmten Annahmen über Emissionen passiert“) | Abweichung (gering) | Der Begriff „Projektion“ steht in der Überschrift, wird aber nicht erklärt; Kap. 10 definiert ihn. Kap. 4 und 6 unterscheiden „Fortschreibung“ und „Szenario“. A21. |
| 64 | **Validierung:** „Unabhängige Prüfung von Code und Ergebnissen gegen den Analyseplan.“ (Kap. 9) | Kap. 9 Z. 19 | bestätigt | |
| 65 | Kopf: „Nur Begriffe, die in den Kapiteln erklärt werden; Erklärungen sind den Kapiteltexten entnommen.“ (Z. 2) | Vergleich Nr. 50–64 | bestätigt (mit Hinweis) | Gilt für alle Einträge außer den in Nr. 51–53, 55, 63 genannten Abweichungen. 15 Einträge (Einordnung/Evidenzcheck/Wissen als einer gezählt); `kapitelplan.md` nannte 20–30. E2. |

### 2.5 Kanäle und Impressum (`13-kanaele-impressum.md`, Linkliste Z. 6–11)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 66 | Substack: `https://klimaevidenzcheck.substack.com/` | CLAUDE.md Kanaltabelle; About-Seite 24.10.2026 | bestätigt | Ohne Tracking-Parameter. |
| 67 | Instagram: `https://www.instagram.com/klima_kompass/` | CLAUDE.md; About-Seite | bestätigt | Abruf des Profils selbst nicht geprüft. |
| 68 | Facebook: `https://www.facebook.com/profile.php?id=61595673411252` | CLAUDE.md; About-Seite | bestätigt | Abruf des Profils selbst nicht geprüft. |
| 69 | WhatsApp-Kanal: `https://whatsapp.com/channel/0029Vb7dScK5kg74YY4ksf1j` | CLAUDE.md; About-Seite | bestätigt | Abruf des Kanals selbst nicht geprüft. |
| 70 | Repository: `https://github.com/dsaure55/klima-evidenzcheck` – „Repository mit Analysen, Code und Daten“ | `.git/config`; About-Seite; GitHub abrufbar | bestätigt (mit Hinweis) | URL stimmt. „Daten“ nicht für jede Analyse (Nr. 13). A3. |
| 71 | „Über uns / Impressum: `https://klimaevidenzcheck.substack.com/about`“ | CLAUDE.md („Über / Impressum“, URL gleich); About-Seite | Abweichung (gering) | URL stimmt. Die Bezeichnung weicht ab: CLAUDE.md, Einleitung und Kopf nennen „Über / Impressum“. A22. |
| 72 | Kopf: „URLs aus `CLAUDE.md` (feste Kanal-URLs)“; „Impressum … § 18 Abs. 2 MStV“ | CLAUDE.md; About-Seite | bestätigt | Der Name Daniel Saures erscheint nach CLAUDE.md öffentlich nur im Impressum; das ist eingehalten (Nr. 78). |
| 73 | Zeile „Substack (die ausführlichen Texte)“ | CLAUDE.md (Substack = Artikelkanal) | bestätigt | Beschreibend. |
| 74 | Kein LinkedIn-Eintrag | CLAUDE.md („LinkedIn seit 16.10.2026 eingestellt“) | bestätigt | |

### 2.6 Neu seit Auftragsbeginn: Einleitung „Wer wir sind“ und Kap. 13 „Über Klima Kompass“, „Impressum“

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 75 | „Hinter Klima Kompass steht ein Mathematiker, den der Klimawandel besorgt und der dazu einen Beitrag leisten will.“ (Einleitung Z. 8) | Selbstangabe Daniel Saure (Chat 24.10., laut Anmerkung im Text); Impressum nennt „Dr. Daniel Saure“, kein Fach | nicht prüfbar | Beruf/Fach und Beweggrund stehen in keiner gelesenen Quelle im Repository oder auf den Substack-Seiten. Als Selbstauskunft übernommen; Aufnahme laut Kopfzeile nur nach ausdrücklicher Bestätigung (liegt für FAKT 1 vor, Wortlaut im Chat nicht einsehbar). |
| 76 | „Ihm fiel auf: In der öffentlichen Diskussion fehlt es oft an Daten und Analysen. Das wollen wir ändern.“ (Z. 8) | – | Abweichung | Wertung mit Häufigkeitswort („oft“) ohne Beleg; als persönliche Motivation lesbar, aber als Tatsachenbehauptung nicht belegt. Wechsel von „ihm“ zu „wir“ (Person gegen Team) unklar. A23. |
| 77 | „Wer verantwortlich ist, steht im Impressum.“ (Z. 8) | Kap. 13 Impressum (Verantwortlich nach § 18 Abs. 2 MStV: Dr. Daniel Saure); About-Seite | bestätigt | Name steht im Fließtext der Einleitung nicht (Projektregel eingehalten, Anmerkung im Text fragt es offen). |
| 78 | Kap. 13 „Über Klima Kompass“: „prüft Aussagen zu Klima und Energie an öffentlichen Daten, zum Beispiel vom Umweltbundesamt, vom Deutschen Wetterdienst oder von Copernicus.“ (Z. 15) | About-Seite (gleiche Quellen genannt); Kap. 1, 4, 6 (UBA, DWD, Copernicus) | bestätigt | |
| 79 | „Jede Zahl hat eine Quelle.“ (Z. 15) | About-Seite (gleicher Satz); Kap. 2 Z. 45 | Abweichung | Wie Nr. 5: Absolutaussage, in Kap. 2 gibt es eine als „nicht belegt“ gekennzeichnete Zahl. A1. |
| 80 | Drei Formate: Evidenzcheck („legen wir in einem Analyseplan fest, wie wir rechnen. Danach prüft eine unabhängige Validierung Code und Ergebnisse“), Einordnung („ohne neue Berechnung“), Wissen (Z. 17–21) | CLAUDE.md Stufen; About-Seite; Beitrag 16.10. | bestätigt | Inhaltlich deckungsgleich mit der About-Seite. |
| 81 | „Einordnungen und Wissensstücke durchlaufen vor der Veröffentlichung einen Faktencheck. Code und Analysepläne sind öffentlich: https://github.com/dsaure55/klima-evidenzcheck“ (Z. 23) | CLAUDE.md Gates; About-Seite (Faktencheck-Satz, GitHub-Link) | bestätigt | Enger und damit richtiger als Einleitung Z. 27 (Nr. 13). Für frühe Beiträge (vor der Stufenregel vom 16.10.) gilt der Faktencheck nicht durchgängig; der Satz beschreibt die heutige Regel. |
| 82 | Impressum: „Angaben gemäß § 5 DDG“; Name, Anschrift Hattersheim am Main; „Kontakt: dsaure55@gmail.com“; „Verantwortlich für den Inhalt nach § 18 Abs. 2 MStV: Dr. Daniel Saure, Anschrift wie oben.“ (Z. 27–36) | About-Seite 24.10.2026 (Impressum mit § 5 DDG, § 18 Abs. 2 MStV, Anschrift in Hattersheim am Main, E-Mail-Kontakt) | bestätigt (mit Hinweis) | Inhaltlich übereinstimmend. Ein wörtlicher Zeichenabgleich (Straße, PLZ, E-Mail-Adresse) war nicht möglich, weil das Abrufwerkzeug den Seitentext nur zusammenfasst und Daten nicht wiedergibt. Kopfzeile verlangt den Abgleich gegen die Live-Seite vor Satz: weiterhin offen. Rechtliche Eignung eines gedruckten/verteilten Impressums (§ 5 DDG im Buch) nicht Gegenstand der Prüfung. A24. |
| 83 | „Dieses Impressum gilt auch für die Auftritte von Klima Kompass auf Instagram, Facebook und WhatsApp.“ (Z. 38) | About-Seite (Geltung für Instagram, Facebook, WhatsApp) | bestätigt | |
| 84 | Datenschutz: „Der Newsletter wird über die Plattform Substack betrieben. … Datenschutzerklärung von Substack: https://substack.com/privacy“ (Z. 42) | About-Seite (Substack-Datenschutz-Link) | bestätigt (mit Hinweis) | Inhalt stimmt; die exakte Link-URL wurde nicht wörtlich verglichen und nicht geöffnet. A24. |

## 3. Platzhalter (markiert, nicht bewertet)

- `00-einleitung.md`: **[FAKT 1 geliefert … Offen: Soll „Dr. Daniel Saure“ hier im Fließtext stehen? …]** (Z. 8, Hinweisklammer im Text; vor Satz entfernen); **[FAKT 2 offen]** (Z. 8); **[FAKT 3 … Daniel Saure, 24.10.2026: „Ja“]** (Z. 55; die Aufforderung zur Rückmeldung steht noch nicht im Fließtext); **[FAKT 4: Dank an wen? Oder streichen.]** (Z. 57); **[Datum, voraussichtlich 15.11.2026]** (Z. 44, Redaktionsschluss).
- `00b-ueberblick.md`: **[Expertenrat-Abgleich und Prognose-Check: Stand beim Satz ergänzen.]** (Z. 11, Kap. 4); „Seitenverweise folgen beim Satz“ (Kopf).
- `11-nachwort.md`: **[Ausblick auf Analysen, die nicht ins Buch kamen …]** (Z. 10).
- `13-kanaele-impressum.md`: kein Platzhalter mehr im Text; der Impressum-Wortlaut ist eingefügt, die Kopfzeile verlangt den Abgleich gegen die Live-Seite vor Satz (Nr. 82).
- Aussagen über Finanzierung, Unabhängigkeit und Interessen: nicht im Text (laut Anmerkung nicht geliefert).

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Einleitung Z. 10, Z. 29 und Kap. 13 Z. 15: „Jede Zahl hat eine Quelle“ / „vorab festlegen“.** (Nr. 5, 15, 79) Absolutformulierungen. Änderungsvorschlag: „Jede Zahl nennt ihre Quelle; wo wir keine fanden, sagen wir das (Beispiel: Kapitel 2). Bei Evidenzchecks legen wir vorab fest, wie wir rechnen.“ Z. 29 entsprechend („Quelle und Datenstand, soweit sie bekannt sind“). Der Satz steht auch auf der Live-Seite; Anpassung dort Entscheidung Daniel Saure, im Buch aber nicht zu übernehmen.

**A2. Einleitung Z. 10: „Freigeben und veröffentlichen tun Menschen.“** (Nr. 7) Mit Z. 8 („ein Mathematiker“) vereinheitlichen: „Ein Mensch gibt frei und veröffentlicht.“ Abstimmen mit Kap. 9 A2.

**A3. Einleitung Z. 27 und Kanäle Z. 10: Repository-Inhalt.** (Nr. 13, 70) „Analysepläne, Programme, Rohdaten und Prüfberichte“ einschränken (nicht jede Analyse hat alles; Lizenz- und technische Gründe), wie auf der About-Seite und in Kap. 13 Z. 23 („Code und Analysepläne“), und mit Kap. 9 A14 gleich formulieren.

**A4. Einleitung Z. 28: „mit Datum und Begründung in Kapitel 8“.** (Nr. 14) Erst formulieren, wenn Kap. 8 die offenen Fälle (4, 5, 6) entschieden hat; sonst „mit Datum, soweit geändert, und Begründung, soweit geklärt“. Abgebrochene Analysen: Verweis auf Kap. 9 statt Kap. 8.

**A5. Einleitung Z. 45: „keine neuen Rechnungen“.** (Nr. 19) In Kap. 4 stammen Intervalle aus einem Rechenlauf vom 24.10. (abweichend vom Artikel). Entweder „keine neuen Analysen; wo Werte aus einem erneuten Lauf stammen, steht es im Kapitel“ oder Kap. 4 entsprechend kennzeichnen (Kap. 4 ist ungeprüft; Prüfung offen).

**A6. Einleitung Z. 14–21: Prognose-Register.** (Nr. 11) Einordnung (vierte Form oder Unterformat des Evidenzchecks) vereinheitlichen und mit Kap. 9 abstimmen; „Was vorab geprüft wird“ um Einfrieren des Plans und Validierung ergänzen oder die Spalte entsprechend umbenennen.

**A7. „Klima-Jahr 2026“ (Einleitung Z. 4, Nachwort Z. 4, Überblick-Kopf).** (Nr. 1, 40) Zeitraum der Artikel (27.08. bis 21.10.2026, Stand Redaktionsschluss) nennen oder „Herbst 2026“ verwenden.

**A8. Überblick Kopf Z. 2.** (Nr. 26) „gekürzt“ ersetzen durch „zusammengefasst“ oder die Zeilen so ändern, dass sie nur kürzen (A9–A15). Differenzprüfung nach jeder Änderung an einem Kurz gesagt wiederholen.

**A9. Überblick Zeile 1 (Z. 8).** (Nr. 27) „Sommerhalbjahr“ ergänzen und die Kausalgrenze erhalten, z. B. „… liegen deutlich außerhalb der Bandbreite seit 1992; warum, sagen die Zahlen nicht.“

**A10. Überblick Zeile 2 (Z. 9).** (Nr. 28) Einschränkungen zurückgeben: „… hätten die heute installierten Batteriespeicher die Dunkelflauten seit 2015 in unserer Rechnung nur zu etwa 0,5 bis 1 Prozent abdecken können (mit bereinigten Kapazitätsdaten, ohne Nachladung und Importe).“ (Wortlaut an Kap. 2 anpassen.)

**A11. Überblick Zeilen 3 und 4 (Z. 10–11).** (Nr. 29, 30) Zeile 3: „nach unserer Rechnung“ vor „hob 91 bis 95 Prozent …“; „Wer zahlt?“ beantworten oder die Frage kürzen. Zeile 4: „Schreibt man den Trend fort, …; beides ist keine Prognose.“ Platzhalter erst nach Entscheidung zu Kap. 4 füllen.

**A12. Überblick Zeile 5 (Z. 12).** (Nr. 31) „2024“ und „Treibhausgas-“ ergänzen und den Gedankenexperiment-Satz zurückgeben: „Deutschland verursachte 2024 rund 1,3 Prozent der weltweiten Treibhausgasemissionen, aber alle Länder mit höchstens diesem Anteil zusammen fast ein Drittel. Das ist ein Gedankenexperiment.“

**A13. Überblick Zeile 6 (Z. 13).** (Nr. 32) „viel mehr, als die Staaten zugesagt haben“ ersetzen durch die Zahlen (bis 2030 minus 18 Prozent gegenüber 2025 nötig, die neuen Zusagen bringen 5 bis 8 Prozent) und der Faktencheck-Auflage A4 zu Kap. 6 folgen; „reißt das Ziel nicht“ durch „bedeutet nicht, dass das Ziel gerissen ist“ ersetzen.

**A14. Überblick Zeile 7 (Z. 19).** (Nr. 33) Zitat wörtlich („Wer sagt das, und woher stammt die Zahl?“) oder ohne Anführungszeichen.

**A15. Überblick Zeile 8 (Z. 20).** (Nr. 34) Erst nach Klärung von Kap. 8 (Fälle 4–6, Ursachen, Vollständigkeit) formulieren; Zahl „sechs“ und Bezugsgröße „16“/„17“ mit Kap. 8 abstimmen; „jeden Fall“ durch „die Fälle, die wir gefunden haben“ ersetzen, entsprechend Kap. 8 Z. 10. „Mit Datum und Ursache“ nur, wenn zutrifft.

**A16. Überblick Fragen-Spalte (Z. 19, 20, 27).** (Nr. 37) Fragen an die Kapitelüberschriften angleichen oder bewusst Leserfragen nennen und die Kapitel anpassen.

**A17. Nachwort Z. 9: Zusage.** (Nr. 46) „veröffentlichen wir sie“ als Absicht formulieren („wir wollen sie veröffentlichen, sobald …“); Verweis auf Kap. 9 (abgebrochene Analyse) bedenken.

**A18. Glossar Amendment/ARIMA.** (Nr. 51, 52) „Amendment“ mit der Fassung in Kap. 9 abstimmen (Kap. 9 A5), einheitlich „Ergänzung“ oder „Änderung“; „Erratum“ aufnehmen, falls es im Buch vorkommt. ARIMA: „Bei uns meist eine Kontrollrechnung, im Expertenrat-Abgleich eines von drei Verfahren.“

**A19. Glossar Brutto/netto.** (Nr. 53) Zweite Bedeutung ergänzen: „Bei Preisen und Abgaben: brutto = mit Mehrwertsteuer, netto = ohne.“

**A20. Glossar Dunkelflaute.** (Nr. 55) Definition der Analyse ergänzen: „In unserer Auswertung: mindestens drei Tage in Folge, in denen Wind und Sonne im Verhältnis zum Verbrauch besonders wenig liefern.“

**A21. Glossar Szenario/Prognose/Projektion.** (Nr. 63) Projektion erklären („Rechnung, die beschreibt, was unter bestimmten Annahmen passiert“, Kap. 10) oder aus der Überschrift streichen.

**A22. Kanäle Z. 11: Bezeichnung.** (Nr. 71) „Über / Impressum“ verwenden (wie CLAUDE.md und Einleitung).

**A23. Einleitung Z. 8: „Wer wir sind“.** (Nr. 75, 76) „Mathematiker“, „besorgt“ und „fehlt es oft an Daten und Analysen“ sind Selbstaussagen bzw. Wertungen ohne Beleg im Repository; Daniel Saure bestätigt die Formulierung ausdrücklich am gesetzten Text oder streicht „oft“/formuliert als persönliche Sicht („Ihm fiel auf, dass …“ mit Beispiel aus den Kapiteln). „Ihm … wir“ vereinheitlichen. Die Anmerkungsklammer (FAKT 1) vor Satz entfernen.

**A24. Kap. 13 Impressum und Datenschutz.** (Nr. 82, 84) Vor Satz Wort für Wort gegen die Live-Seite abgleichen (Anschrift, E-Mail, § 5 DDG, § 18 Abs. 2 MStV, Substack-Link) und die Prüfung als Nachtrag in dieser Datei festhalten; der heute mögliche Abgleich war nur inhaltlich.

## 5. Empfehlungen (nicht bindend)

- **E1.** Glossar: „Konfidenzintervall“ aufnehmen (verwendet in Kap. 1 und 2) und vom Prognoseintervall abgrenzen.
- **E2.** Glossar: Begriffe ergänzen, die im Buch ohne Erklärung bleiben könnten (Standardabweichung, NDC, Overshoot, Metaanalyse); `kapitelplan.md` nannte 20–30 Einträge, vorhanden sind 15.
- **E3.** Einleitung Z. 47: „Wir gehen damit so um“ konkretisieren („vorsichtig, ohne Dramatisierung“, wie Kap. 1).
- **E4.** Nachwort Z. 14: „dort“ klären (Substack-Artikel oder Kapitel).
- **E5.** Meldeweg (Einleitung [FAKT 3], Kap. 8, Nachwort): Das Impressum nennt eine E-Mail-Adresse; vor Satz prüfen, ob Kommentare auf Substack freigeschaltet sind, und Kap. 8 darauf abstimmen.
- **E6.** Einleitung Z. 4: Der Satz „Zu jeder dieser Fragen …“ kann mit je einem Kapitelbeispiel belegt werden; derzeit pauschal.
- **E7.** Herkunftsangaben in den Kopfzeilen vor Satz entfernen (wie vermerkt). Kap. 8 und Überblick: Bezugsgröße „16 Artikel“ (Archiv zeigt 17) abstimmen.
- **E8.** Kap. 13 enthält die persönliche Anschrift und E-Mail-Adresse einer Privatperson in einem verteilten Dokument. Das entspricht der Live-Seite; Daniel Saure bestätigt die Übernahme in ein PDF ausdrücklich (keine Rechtsprüfung).

## 6. Nicht geprüft / Vorbehalte

- **Kapitel 4, 7, 8, 9, 10:** nur als Vergleichsbasis gelesen; ohne Faktencheck (Kap. 9: eigene Datei). Alle Überblicks-, Nachwort- und Glossar-Aussagen über diese Kapitel gelten nur für den Entwurfsstand und müssen nach deren Prüfung neu abgeglichen werden.
- **Kapitel 1–3, 5, 6:** Textstellen zu den Rahmenaussagen gelesen; die Faktenchecks dieser Kapitel wurden nicht neu durchgeführt.
- **Instagram-, Facebook- und WhatsApp-Seiten selbst:** nicht abgerufen; URLs nur gegen CLAUDE.md und About-Seite verglichen.
- **Impressum-Wortlaut:** nur inhaltlich gegen die Zusammenfassung des Abrufwerkzeugs geprüft, nicht wörtlich (Nr. 82, 84). Chat-Aussagen Daniel Saures zu FAKT 1 und zum Impressum nicht einsehbar.
- **Substack-Kommentarfunktion:** nicht geprüft.
- **Satzverweise („siehe letzte Seite“, Seitenzahlen):** erst nach Layout prüfbar.
- **Stil, Wortzahl, Leseniveau, Rechtschreibung:** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A24 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. FAKT 2 und 4, [Datum] und den Nachwort-Ausblick von Daniel Saure liefern lassen; die dann ergänzten Texte erneut prüfen.
3. Impressum und Datenschutz gegen die Live-Seite Wort für Wort abgleichen (A24).
4. Überblick und Glossar nach Fertigstellung und Prüfung von Kap. 4, 7, 8, 9, 10 erneut gegen die Kapitel abgleichen (Differenzprüfung).
5. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (24 Auflagen, 8 Empfehlungen; Platzhalter offen). Kein Punkt ist „kritisch“. Bestätigt sind die Kanal-URLs (alle vier plus GitHub, gegen CLAUDE.md und die About-Seite), das Datum des ersten Artikels (27.08.2026, Archiv), die Beschreibung der Stufen, der Buchaufbau, das Raster, die Angaben zum Prognose-Register (Eintrag #1 registriert 22.10.2026, Auswertung Mai/Juni 2027, vier geplante Vorhersagen), die Mehrzahl der Glossar-Definitionen und der Inhalt des neuen Über-Textes und Impressums in Kap. 13 (inhaltlich gegen die Live-Seite, nicht wörtlich). Wesentliche Mängel: Der Überblick gibt einige Kurz-gesagt-Absätze nicht nur gekürzt, sondern mit weggelassenen Einschränkungen wieder (Zeile 2: Batteriespeicher ohne „in unserer Rechnung“, Bereinigung, Nachladung, Importe; Zeile 5: ohne Jahr, Gasbezug und Gedankenexperiment-Satz; Zeile 3 und 4 ohne „nach unserer Rechnung“ bzw. „keine Prognose“; Zeile 8: „mit Datum und Ursache“ trifft auf die offenen Fälle 5 und 6 nicht zu, „sechs Artikel“ passt zu Kap. 8 nur einschließlich der Fälle mit „Aufnahme offen“) (A8–A16); die Einleitung und Kap. 13 enthalten Absolutformulierungen („Jede Zahl hat eine Quelle“, „Rohdaten und Prüfberichte“ im Repository), die Kap. 2, 3, 4 und der Repository-Stand widerlegen (A1, A3); die neue Angabe zu FAKT 1 ist Selbstauskunft mit unbelegter Wertung (A23); Glossar-Einträge Brutto/netto, Dunkelflaute und Szenario/Projektion weichen von den Kapiteltexten ab (A19–A21). Keine neue Berechnung in den Rahmentexten.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
