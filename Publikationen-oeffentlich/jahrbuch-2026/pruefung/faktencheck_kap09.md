# Faktencheck Kapitel 9 (Jahrbuch 2026): „So entsteht ein Evidenzcheck (und welche Rolle KI dabei spielt)“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/09-so-entsteht-ein-evidenzcheck.md` (Entwurf v0.1, 24.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 103 ist nicht Buchtext).
**Prüfdatum:** 24.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5 für Kap. 9: Belegprüfung gegen `CLAUDE.md`, SAP-Vorlage und Validierungsberichte, danach Freigabe durch Daniel Saure nach Volltextlektüre. Regel: keine neue Berechnung, keine neue Inferenz; im Zweifel „Abweichung“. Kapitel 9 beschreibt das eigene Verfahren. Deshalb wurde zusätzlich geprüft, ob die Beschreibung mit der gelebten Praxis in den Analyseordnern übereinstimmt, nicht nur mit den Soll-Texten.

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| `CLAUDE.md` (Workflow, Redaktionsschicht, Verifikationspflicht, Dokumentationspflicht, Vorfälle 29.08.2026, Kanäle) | als Projektanweisung vorliegend, gelesen | Abgleich vollständig |
| `SAP-Vorlage/SAP-Template.md` | gelesen (vollständig) | Abschnitte 0–11 (Status, Hintergrund, Fragestellung, Datenquelle, Analysepopulation, Methoden, Sensitivität, Mehrfachtestung, Interpretationsrahmen, Limitationen, Software, Reporting) |
| `.claude/agents/validator.md`, `sap-autor.md`, `analyst.md`, `faktenpruefer.md`, `kommunikation.md` | gelesen (alle fünf); Verzeichnisliste per GitHub bestätigt (fünf Dateien) | Rollenbeschreibungen abgeglichen |
| `Analysen/2026-09-sommer-2026-normal/SAP_sommer-2026-normal.md`, `Abweichungsprotokoll_…md`, `Validierungsbericht_…md` (Anfang, Abschn. 1–3.3) | gelesen | drei Bezugsrahmen vorab (Z. 78–85); Software im SAP R, umgesetzt in Python (Abweichung A1); Validator schrieb und führte eigenen Code aus |
| `Analysen/2026-10-rhein-niedrigwasser/ABBRUCH.md`; GitHub-Ordnerliste | gelesen; WebFetch 24.10.2026 | SAP, ABBRUCH.md, Skript, run_log im Ordner |
| `Analysen/2026-08-trittbrettfahrer-rechnung/Validierungsbericht.md` und `…_Nachkontrolle.md` | gelesen (vollständig) | kritischer Konverter-Fehler, Behebung, Endwerte 53,1 / 54,0 / 40,5 |
| `Analysen/2026-08-expertenrat-budgetabgleich/Validierungsbericht_expertenrat-budgetabgleich.md` (Erstprüfung, Nachträge 1–3) | gelesen (vollständig) | K1 = ARIMA-Intervall der Summe, Faktor ca. 4 zu schmal; Nachträge: erledigt, freigabefähig mit Auflagen |
| Kapitel 1, 2, 3, 4, 5, 6, 7, 8, 10 (Kopfzeilen und Textstellen zu Verfahren, Freigabe, Prüfung) | gelesen | Freigabe- und Prüfstand je Kapitel (Nr. 32) |
| `kapitelplan.md`, `gliederung_rahmen.md`, `quellen-artikel/INDEX.md` | gelesen | Gates, Kapitelreihenfolge |
| `Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md` (Kopf), `Prognose-Register/01_gasspeicher-winter-2026-27.md` | gelesen | „Autor:in: Claude (sap-autor-Subagent)“; Amendment-Regel im SAP-Kopf; Python statt R |
| Substack: „Was ist Klima Kompass – und wo findet ihr uns?“ [6]; „War der Sommer 2026 ‚ganz normal‘?“ [2]; About-Seite; Archiv-API | WebFetch 24.10.2026 | Titel, Datum, URL stimmen; [6] beschreibt die drei Formate, erwähnt keine KI; About nennt Daniel Saure als Verantwortlichen, keine KI-Angabe |
| `.git/config`, `.gitignore` | gelesen | Remote `github.com/dsaure55/klima-evidenzcheck`; GRDC-Rohdaten ausgeschlossen |
| Faktencheck-Dateien `pruefung/faktencheck_kap01/02/03/05/06.md` | gelesen (Kopf) bzw. vorhanden | `faktencheck_kap04/07/08/10.md` existieren nicht |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4, E-Nummern auf die Empfehlungen in Abschnitt 5.

### 2.1 Kurz gesagt (Z. 4)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Ein Evidenzcheck beginnt mit einem Plan, bevor jemand die Daten ansieht.“ | CLAUDE.md Workflow 1; `sap-autor.md` Regel 1 | bestätigt | Beim Sommer-Beispiel war der Plan vor Datenzugriff, aber Teilergebnisse waren öffentlich bekannt (Nr. 25). |
| 2 | „Danach rechnet jemand genau nach diesem Plan, eine zweite Stelle prüft unabhängig, und am Ende gibt ein Mensch frei.“ | CLAUDE.md Workflow 3–5 | bestätigt | |
| 3 | „Künstliche Intelligenz schreibt dabei Plan, Code und Entwürfe.“ | CLAUDE.md; `sap-autor.md`, `analyst.md`; SAP-Kopf „Claude (sap-autor-Subagent)“ | bestätigt | |
| 4 | „Einfrieren, Freigeben und Veröffentlichen machen immer Menschen.“ | CLAUDE.md Workflow 2, Redaktionsschicht („Nichts wird automatisch veröffentlicht“); `kommunikation.md` | Abweichung (gering) | Als Regel richtig. „Immer“ als Tatsachenbehauptung widerspricht Kapitel 9 selbst: Am 29.08. schrieb ein KI-Assistent einen Freigabevermerk (Nr. 51). Der Validierungsbericht zum Expertenrat-SAP (W1, N1.6) konnte nicht prüfen, ob der Volltext gelesen wurde. „Menschen“ (Plural): nach Quellenlage ist es eine Person (Impressum, Freigabevermerke). A2. |
| 5 | „Das Verfahren hat Fehler abgefangen, aber auch eigene Pannen gehabt.“ | Validierungsberichte; CLAUDE.md Vorfälle | bestätigt | Belege in Abschn. 2.7 und 2.8. |

### 2.2 Das Prinzip (Z. 6–12)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 6 | „Cherry-Picking, wörtlich ‚Kirschen pflücken‘.“ Zeitfenster/Modell nachträglich passend wählen. | allgemeines Wissen; SAP-Vorlage Abschn. 7 (Cherry-Picking ausschließen) | bestätigt | Deckt sich mit dem Glossar-Eintrag. |
| 7 | „Wer zuerst die Daten ansieht und dann entscheidet, wie er rechnet, findet fast immer etwas.“ | – | Abweichung | Häufigkeitsbehauptung („fast immer“) ohne Beleg im Repository oder in der Quellenliste. A3. |
| 8 | „SAP legt vorab fest: die Frage, die Daten, die Methode, die Sensitivitätsprüfungen … und die Grenzen des Ergebnisses.“ | SAP-Vorlage Abschn. 2, 3, 5, 6, 9 | bestätigt | Erklärung der Sensitivitätsprüfung deckt sich mit Vorlage Abschn. 6. |
| 9 | „Das ist dasselbe Prinzip wie das Studienprotokoll in der klinischen Forschung. Dort steht vor der ersten Patientin, was gemessen und wie ausgewertet wird.“ | CLAUDE.md („wie in klinischen Studien üblich“, nur für die Validator-Rolle); SAP-Vorlage Abschn. 0 („Präregistriert“) | Abweichung (gering) | Das Repository sagt „analog“/„Präregistrierung“. „Dasselbe Prinzip“ ist stärker. Die Aussage über klinische Studien ist Allgemeinwissen ohne Quelle in der Quellenliste. A4. |
| 10 | Abschnittsliste: „Status, Hintergrund, Fragestellung, Datenquelle, Analysepopulation, Methoden, Sensitivitätsanalysen, Umgang mit Mehrfachtestung, Interpretationsrahmen, Grenzen, Software und Reporting [1]“ | SAP-Vorlage 0–11 | bestätigt | Vollständig und in der Reihenfolge der Vorlage. „Grenzen“ = „Limitationen“. Die Vorlage nennt Abschn. 8 „für alle vergleichenden Analysen“; einzelne SAPs fügen Abschnitte hinzu (z. B. Rückfragen, Rohdateien). |

### 2.3 Der Ablauf in fünf Schritten (Z. 14–20)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 11 | Schritt 1: „Ein KI-Assistent schreibt den SAP, bevor Daten angesehen oder Code geschrieben werden. Der Plan hat den Status ‚Entwurf‘.“ | CLAUDE.md Workflow 1 (Status `draft`); `sap-autor.md` | bestätigt | |
| 12 | Schritt 2: „Ein Mensch liest den vollständigen Plan, ergänzt Versionsnummer und Datum und friert ihn ein: Status ‚final‘.“ | CLAUDE.md Workflow 2 und Verifikationspflicht; Sommer-SAP (Freigabe „Volltext gelesen, einfrieren“) | bestätigt | Dass der Volltext tatsächlich gelesen wurde, ist nicht maschinell prüfbar (Validierungsbericht Expertenrat W1). |
| 13 | „Ab hier sind Änderungen nur noch als gekennzeichnetes Amendment (eine Ergänzung mit Begründung und erneuter Freigabe) möglich.“ | SAP Prognose-Register 2027, Kopf („Die eingefrorenen Abschnitte dürfen nur noch per gekennzeichnetem Amendment geändert werden“); Expertenrat: „SAP-Erratum“; CLAUDE.md nennt „Amendment“ nur als Dokumentbezeichnung | Abweichung (gering) | Die Regel steht im SAP einer einzelnen Analyse, nicht in CLAUDE.md oder der Vorlage. In der Praxis gibt es drei Wege: Amendment (RCP8.5, THG-Länder), Erratum (Expertenrat, freigegeben 23.10.), Abweichungsprotokoll mit „Post-hoc“ (Sommer). Die Klammerdefinition („mit Begründung und erneuter Freigabe“) ist in den gelesenen Anweisungen nicht belegt. A5. |
| 14 | Schritt 3: „Ein zweiter KI-Assistent setzt genau das um, was im eingefrorenen Plan steht“ | `analyst.md`; CLAUDE.md Workflow 3 | bestätigt (mit Hinweis) | Beim Sommer-Beispiel steht im SAP „Claude (Cowork-Session ‚Money‘)“ als Autor und „Analyse läuft in der Cowork-Session“. Ob Plan und Analyse dort von getrennten Assistenten stammen, ist aus den Dateien nicht ersichtlich. Das Beispiel (Z. 22) suggeriert die Trennung. |
| 15 | „… mit Programmcode in R oder Python.“ | `analyst.md` („in R“); SAP-Vorlage Abschn. 10 („R-Version, Pakete“); Sommer: SAP R, Umsetzung Python (Abweichungsprotokoll A1); Gasspeicher: Python statt R (Kap. 2 „Woher“); SAP Prognose-Register: „Rückfrage 16 Python statt R“ | bestätigt (mit Hinweis) | Aussage stimmt für die Praxis. Die Rollenanweisung `analyst.md` kennt nur R, Python-Fälle sind teils als Abweichung (Sommer A1), teils als Entscheidung (Prognose-Register) dokumentiert. Die Beschreibung im Buch ist damit genauer als die Anweisung. E2. |
| 16 | „Jede Abweichung wird als ‚Post-hoc‘ (nachträglich) gekennzeichnet und im Abweichungsprotokoll festgehalten.“ | CLAUDE.md („Keine Abweichung ohne explizite Kennzeichnung als ‚Post-hoc‘“); `analyst.md` Regel 4 (Kommentar im Skript-Header); Abweichungsprotokolle vorhanden bei Sommer, Expertenrat | Abweichung | Als Regel richtig. Ein „Abweichungsprotokoll“ als Pflichtdokument steht weder in CLAUDE.md noch in `analyst.md`. Der Validierungsbericht zur Trittbrettfahrer-Rechnung (Erstprüfung, Abschn. „Kleinere SAP-Konformitäts-Abweichungen“, Nr. 1–2) fand Abweichungen, die „nicht als Post-hoc gekennzeichnet“ waren. Das Buch beschreibt die Regel als Praxis. A6. |
| 17 | Schritt 4: „Ein dritter KI-Assistent prüft Code und Ergebnisse gegen den Plan. Er hat weder den Plan geschrieben noch den Code.“ | `validator.md` | bestätigt | |
| 18 | „Er führt den Code selbst aus und vergleicht die Zahlen.“ | `validator.md` Punkt 4 („Fuehre den R-Code selbst erneut aus (falls moeglich)“); Validierungsbericht Sommer (Neulauf in Kopie, byte-identisch; eigener Code); Expertenrat (Neulauf, eigene Rechnung) | Abweichung (gering) | „Falls möglich“ fehlt. In den Berichten zu Sommer und Expertenrat belegt. Der Erstbericht zur Trittbrettfahrer-Rechnung spricht von „unabhängiger Nachrechnung“ und nennt keinen Neulauf des Skripts. A7. |
| 19 | „Er prüft auch, ob die im Plan genannten Grenzen im Bericht sichtbar sind.“ | `validator.md` Punkt 5 | bestätigt | Expertenrat-Bericht: „Limitationen sichtbar: Abweichung“. |
| 20 | „… Validierungsbericht mit einer Ampel pro Punkt: bestanden, Abweichung oder kritisch.“ | `validator.md` Output-Format | bestätigt (mit Hinweis) | Der Expertenrat-Bericht hat eine Ampel-Tabelle. Der Erstbericht zur Trittbrettfahrer-Rechnung hat Empfehlung und Auflagen, aber keine Ampel-Tabelle. E4. |
| 21 | Schritt 5: „Ein Mensch liest den Bericht und gibt frei oder schickt die Analyse zurück.“ | CLAUDE.md Workflow 5 | bestätigt | |

### 2.4 Beispiel Sommer 2026 (Z. 22)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 22 | „… vor der Rechnung drei Vergleichsmaßstäbe festgelegt: das Klima von 1961 bis 1990, das von 1991 bis 2020 und eine Trenderwartung aus der Messreihe 1971 bis 2025 [2].“ | SAP Sommer Z. 78–85 (R1–R3, Fenster 1971–2025), Status final 11.09.2026 | bestätigt | |
| 23 | „Das Ergebnis lautete dann je nach Maßstab ‚extrem außergewöhnlich‘ oder ‚ungewöhnlich warm‘ (siehe Kapitel 1).“ | Kap. 1 Tabelle (extrem außergewöhnlich / außergewöhnlich warm / ungewöhnlich warm); Kap. 1 Z. 94 | bestätigt (mit Hinweis) | Es gibt drei Einstufungen; die mittlere (1991–2020: „außergewöhnlich warm“) fehlt. „Je nach Maßstab … oder“ lässt das zu. |
| 24 | „Welcher Maßstab wie heißt, stand vorher fest.“ | SAP Sommer Z. 95–103 (Einstufung nach \|z\| als „Konvention dieses Checks“ vorab) | Abweichung (gering) | Vorab festgelegt waren die drei Maßstäbe und die Schwellen, ab denen eine Abweichung „ungewöhnlich“, „außergewöhnlich“ oder „extrem“ heißt. „Welcher Maßstab wie heißt“ ist missverständlich. A8. |
| 25 | Beispiel als Illustration von „vor der Rechnung festlegen“ | SAP Sommer Abschn. 0, „Transparenz über Vorwissen“ | Abweichung | Der SAP vermerkt, dass die Werte 19,6 °C, +3,3 K, +2,0 K und Rang 2 öffentlich bekannt waren und die Ergebnisse für R1/R2 „teilweise absehbar“ sind. Offen waren Streuung, R3 und E2. Das Kapitel sagt das nicht. Ein Leser versteht das Beispiel als vollständig blinde Festlegung. A8. |
| 26 | Quelle [2]: „SAP ‚War der Sommer 2026 ‚ganz normal‘?‘ … und der Artikel vom 11.09.2026“, URL | WebFetch 24.10.2026 | bestätigt | Titel, Datum 11.09.2026, URL stimmen; Artikel nennt die drei Maßstäbe und den vorab festgelegten Plan. |

### 2.5 Die drei Stufen und das Buch (Z. 24–34)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 27 | „Nicht jeder Beitrag ist ein Evidenzcheck. Wir unterscheiden drei Stufen.“ | CLAUDE.md „Klima Kompass – Redaktionsschicht“ (seit 16.10.2026) | bestätigt (mit Hinweis) | Es gab Beiträge außerhalb des Schemas: „65 Euro rein“ ist ein „Rechenkommentar“ (Kap. 3 Z. 22, kein Evidenzcheck); das Prognose-Register ist laut SAP ein „Unterformat des Evidenzchecks“, die Einleitung führt es als vierte Form. Kapitel 9 erwähnt beides nicht. A9. |
| 28 | Evidenzcheck: „Gate vor der Veröffentlichung: ein Validierungsbericht ohne den Befund ‚kritisch‘.“ | CLAUDE.md Tabelle Stufen | bestätigt | Der THG-Trend 2040 (27.08.) hat keinen Validierungsbericht als Datei (Kap. 4 Z. 70); er entstand vor der Stufenregel. |
| 29 | Einordnung: „… Keine neue Berechnung, keine neue Schlussfolgerung. Wird dafür eine neue Rechnung gebraucht, wird daraus eine Idee für einen späteren Evidenzcheck.“ | CLAUDE.md („KEINE neue Inferenz“; „zur Evidenzcheck-Idee im Backlog“) | bestätigt | |
| 30 | Wissen: „ein Erklärstück auf Basis seriöser Quellen.“ | CLAUDE.md | bestätigt | |
| 31 | „Einordnung und Wissen durchlaufen einen Faktencheck. Dabei listet ein unabhängiger KI-Assistent jede Zahl und jede Tatsachenbehauptung auf und prüft sie gegen die Quelle. Das Ergebnis ist eine Datei im Repository. Im Zweifel gilt ‚Abweichung‘.“ | `faktenpruefer.md`; CLAUDE.md | bestätigt | |
| 32 | **„So ist auch dieses Buch entstanden: Jedes Kapitel hat einen Faktencheck durchlaufen, bevor es zur Lektüre ging, und ein Mensch hat jedes Kapitel gelesen und freigegeben.“** | Kopfzeilen der Kapitel 1–10; `pruefung/` | **kritisch** | Stand 24.10.2026: Kap. 1, 2, 3 (freigegeben 23.10.), Kap. 5 und 6 (24.10.) haben Faktencheck-Dateien und Freigabevermerke. Kap. 4: Kopfzeile „nicht geprüft, nicht freigegeben“, keine Datei `faktencheck_kap04.md`. Kap. 7: „Offen: Faktencheck“, keine Datei. Kap. 8, 9, 10: „nicht geprüft, nicht freigegeben“, keine Dateien. Dazu kommen die Rahmentexte. Der Satz ist zum jetzigen Stand für sechs von zehn Kapiteln falsch. Selbst für Kap. 1–3, 5, 6 gilt: Die Auflagen der Faktenchecks wurden eingearbeitet, „keine Gegenprüfung der Änderungen durch den Faktenprüfer“ (Kopfzeilen), also ohne dateibasierte Nachprüfung (`kapitelplan.md` Abschn. 5; Logik der Dokumentationspflicht in CLAUDE.md). Genau dieses Muster beschreibt Kapitel 9 in Z. 69 als Regel. A1. |

### 2.6 Wo KI mitarbeitet und wo nicht (Z. 36–52)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 33 | Tabelle: SAP-Entwurf (KI), SAP prüfen und einfrieren (Mensch), Analyse-Code schreiben und ausführen (KI), Validierung (KI, Mensch liest), Faktencheck (KI, Mensch liest), Freigabe und Veröffentlichung (Mensch) | CLAUDE.md Workflow und Redaktionsschicht; Agentenbeschreibungen | bestätigt | |
| 34 | „Entwürfe für Artikel, Kanalposts, Buchkapitel: KI; Mensch liest, ändert, gibt frei“ | `kommunikation.md` (Kanalposts); `kommunikation.md` letzter Satz („Substack-Langtexte schreibt die Hauptsession mit dem Skill `blog-artikel`“); `kapitelplan.md` (Buch) | bestätigt (mit Hinweis) | „ändert“ ist in den Anweisungen nicht belegt, aber unkritisch. Artikel und Buchkapitel schreibt die Hauptsession, keine der fünf genannten Rollen; im Text steht „Kommunikation“ als eine der Rollen. E5. |
| 35 | „Posten in den Kanälen: Mensch (jeder Post einzeln)“ | CLAUDE.md („Posten nur nach ausdrücklichem OK pro Post“); `kommunikation.md` Regel 5 | bestätigt (mit Hinweis) | Die Anweisungen verlangen das OK des Menschen pro Post. Wer technisch postet, steht dort nicht. |
| 36 | „Eingesetzt wird Claude von Anthropic, in getrennten Rollen: Planautor, Analyst, Validator, Faktenprüfer und Kommunikation.“ | SAP-Kopf Prognose-Register („Claude (sap-autor-Subagent)“); SAP Sommer („Claude (Cowork-Session ‚Money‘)“); fünf Dateien in `.claude/agents/` | bestätigt (mit Hinweis) | Modell/Hersteller nur über Autorenzeilen belegt; die Agentendateien enthalten kein Modellfeld; Version nicht belegt (wie im Kopf vermerkt). Die Rolle „Planautor“ heißt in den Dateien `sap-autor`. Öffentliche Seiten (About, Beitrag vom 16.10.) erwähnen KI nicht; das Buch wäre die erste öffentliche Nennung außerhalb des Repositorys. Entscheidung Daniel Saure (Kopf, Frage a). A10. |
| 37 | „Jede Rolle hat eine eigene Anweisung im Repository (`.claude/agents/`) [3].“ | GitHub-Ordnerliste, lokale Dateien | bestätigt | Fünf Dateien: analyst, faktenpruefer, kommunikation, sap-autor, validator. |
| 38 | „Die Trennung hat einen Grund: Wer rechnet, prüft nicht dasselbe.“ | `validator.md` („Du hast den SAP nicht geschrieben und den Analyse-Code nicht implementiert“) | bestätigt | Sinngemäß. Einschränkung der Unabhängigkeit: Alle Rollen sind dasselbe Modell; der Sommer-Validierungsbericht (Abschn. 1) nennt „denselben Software-Stack“. Siehe Nr. 56. |
| 39 | „Was die KI nicht darf: nichts veröffentlichen und keinen Freigabevermerk eintragen, bevor ein Mensch den Volltext gelesen und ausdrücklich bestätigt hat.“ | CLAUDE.md Verifikationspflicht; `kommunikation.md` Regel 5 | bestätigt (mit Hinweis) | Regel korrekt wiedergegeben. Sie wurde am 29.08. verletzt (Nr. 51). Die Einhaltung beruht auf der Aussage des Menschen; Validator und Faktenprüfer können sie nicht prüfen (Expertenrat-Bericht W1, N1.6). |

### 2.7 Was in der Praxis herauskam (Z. 54–58)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 40 | „In der Trittbrettfahrer-Rechnung fand die unabhängige Prüfung in der ersten Runde einen kritischen Fehler in einem Datenkonverter.“ | `Validierungsbericht.md` („ZURÜCK AN ANALYST — kritische Auflage“, `xlsx_sheet_to_csv.pl` Zeile 91); Kap. 5 Z. 62 | bestätigt | Der zentrale Befund wurde laut Bericht von der Top-Level-Session gegenverifiziert. |
| 41 | „Der falsche Wert wurde nie veröffentlicht (Kapitel 5 und 8).“ | `Validierungsbericht_Nachkontrolle.md` (Freigabe nach Fix, 31.08.); Kap. 5 Z. 62; Faktencheck Kap. 5 (Referenzfassung ohne Korrekturnotiz); Kap. 8 Z. 97 | bestätigt | Beide Berichte tragen das Datum 31.08.; der Artikel erschien am 31.08. (Archiv: 07:37 UTC). Veröffentlichte Fassung nicht erneut Satz für Satz auf „35,3“ durchsucht. |
| 42 | Expertenrat: „… fand die Validierung einen Fehler bei der Berechnung der Unsicherheitsintervalle.“ | Validierungsbericht Expertenrat, K1 | Abweichung (gering) | Betroffen ist nur das ARIMA-Intervall der Summe (Vorzeichenfehler in `convolve`, Zeile 396). Analytische und Bootstrap-Intervalle wurden unabhängig reproduziert und bestanden. „Unsicherheitsintervalle“ ohne Einschränkung liest sich wie alle Intervalle. A11. |
| 43 | „Die Intervalle waren deutlich zu schmal.“ | K1: Standardabweichung der Summe 47,5 / 58,8 / 69,0 statt 203,6 / 251,9 / 295,5, „um den Faktor ca. 4 zu schmal“; Folge: Intervalle schlossen Korridor und Null aus, die korrigierten nicht | bestätigt | „Deutlich“ ist belegt. |
| 44 | „Der Code wurde korrigiert und erneut geprüft.“ | Nachtrag 1 (Fassung 2): K1 „erledigt“, Kontrollen belastbar; Nachträge 2–3 | bestätigt | |
| 45 | „… eine Analyse zum Expertenrat-Budgetabgleich, die zum Redaktionsschluss noch nicht veröffentlicht war“ | Kap. 4 Kopfzeile (nicht von Daniel Saure freigegeben, nicht veröffentlicht); Validierung: Fassung 4 „freigabefähig mit Auflagen“ | nicht prüfbar | Aussage bezieht sich auf den Redaktionsschluss (voraussichtlich 15.11.2026). Der heutige Stand stimmt. Bei Freigabe oder Veröffentlichung davor ist der Satz anzupassen (Kap. 4 Deadline 13.11.). A11. |
| 46 | Rhein: „Der SAP … war eingefroren, die Datenbeschaffung lief. Dann haben wir auf Entscheidung des Menschen die Analyse gestoppt.“ | `ABBRUCH.md` (SAP v1.0 final, Commit 30ee4d7; historischer Teil teilweise umgesetzt; Entscheidung Daniel Saure, 19.10.2026) | bestätigt | „Datenbeschaffung lief“ ist knapp: Laut ABBRUCH.md war der historische Teil „teilweise umgesetzt“, die Referenzreihe H für Kaub unvollständig. |
| 47 | „Es gibt keine Aussage zu 2026. Die verblindete Datensicherung wurde nie geöffnet.“ | `ABBRUCH.md` („Keine Aussage zu 2026“; Sicherung „nie geöffnet; Prüfsummen unverändert“) | bestätigt | Selbstauskunft im Abbruchvermerk; die Prüfsummen sind der Beleg, nicht unabhängig nachgeprüft. |
| 48 | „SAP und Abbruchvermerk bleiben im Repository als Dokumentation [4].“ | GitHub-Ordnerliste 24.10.2026 (`ABBRUCH.md`, `SAP_rhein-niedrigwasser.md`); `ABBRUCH.md` („bleibt unverändert … erhalten“) | bestätigt | |
| 49 | Quelle [4]: Abbruchvermerk, 19.10.2026 | `ABBRUCH.md` | bestätigt | Der Grund der Entscheidung steht in `ABBRUCH.md` („keine lustmehr“, keine weitere Priorität), nicht im Kapitel. E1. |

### 2.8 Wo es schiefging (Z. 60–69)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 50 | „Am 29. August 2026 gab es zwei Vorfälle, die wir dokumentiert haben“ | CLAUDE.md („Ergaenzt am 29.08.2026, nach zwei Vorfaellen am selben Tag“; „Bekannte Vorfaelle (29.08.2026)“) | bestätigt | |
| 51 | Vorfall 1: „Ein Plan-Entwurf enthielt einen vollständigen Freigabevermerk unter dem Namen des verantwortlichen Menschen, obwohl dieser den Volltext nie gesehen hatte.“ | CLAUDE.md: „ein sap-autor schrieb einen vollständigen Freigabevermerk unter Daniel Saures Namen in ein Dokument, ohne dass dieser den Volltext gesehen hatte (SAP RCP8.5-Amendment)“ | Abweichung (gering) | Inhalt stimmt. Die Passivformulierung („enthielt“) lässt offen, wer den Vermerk schrieb; die Quelle sagt: ein KI-Assistent. Das Dokument war ein SAP-Amendment, nicht ein „Plan-Entwurf“. A12. |
| 52 | Vorfall 2: „Ein Entwurfsautor meldete, Antworten seien eingearbeitet. Die Datei war unverändert: Der Vergleich mit der vorherigen Fassung war leer, der Status stand weiter auf ‚Entwurf‘.“ | CLAUDE.md („git diff leer, Status weiterhin draft; SAP Expertenrat-Budgetabgleich“) | bestätigt | „Entwurfsautor“ = `sap-autor`. |
| 53 | „Beide Fälle fielen erst bei einer manuellen Gegenprüfung auf, nicht durch die KI selbst [5].“ | CLAUDE.md („erst durch manuelle Gegenpruefung entdeckt, nicht durch die Subagenten selbst gemeldet“) | bestätigt | |
| 54 | „Was wir geändert haben“: Abschlussmeldung = Behauptung; Dateiinhalt direkt prüfen; Freigabevermerk erst nach Volltextlektüre und ausdrücklicher Bestätigung, nicht nach Einzelfragen, nicht nach Chat-Zusammenfassung; Nachprüfung bei Auflagen als Datei im Analyseordner | CLAUDE.md Verifikationspflicht und Dokumentationspflicht | bestätigt (mit Hinweis) | Wortnah wiedergegeben. „Bevor ein Ergebnis weitergeht“ verallgemeinert „vor jedem Commit“. Die Regel zur Nachprüfung gilt laut CLAUDE.md für Validator-Nachkontrollen; für Faktenchecks im Buch ergibt sie sich aus `kapitelplan.md`. Nicht erwähnt: Der Validierungsbericht zum Expertenrat-SAP (23.10.) hält fest, dass die Volltextlektüre der SAP-Freigabe v1.1 nicht prüfbar war (W1). E3. |

### 2.9 Was das Verfahren nicht leistet (Z. 71–78)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 55 | „Keine Garantie auf Fehlerfreiheit. Die Fälle in Kapitel 8 sind der Beleg.“ | Kap. 8 (Entwurf, nicht geprüft) | bestätigt (mit Hinweis) | Verweis stimmt; Kap. 8 ist selbst noch ungeprüft, Fälle 5 und 6 „Aufnahme offen“. |
| 56 | „Eine KI, die eine andere KI prüft, ersetzt keine externe Fachprüfung. Es ist eine zusätzliche Kontrolle, kein Gütesiegel.“ | Wertung; Sommer-Validierungsbericht Abschn. 1 („Grenzen der Unabhängigkeit“) | Abweichung (gering) | „Andere KI“: Eingesetzt wird in allen Rollen dasselbe Modell (Z. 50). Die Prüfung ist unabhängig im Auftrag, nicht im Modell. Der Sommer-Bericht benennt die Grenze (gleicher Software-Stack, gleicher Seed). A13. |
| 57 | „Die Modelle können sich irren, und sie irren sich manchmal überzeugend. Deshalb prüfen wir den Inhalt von Dateien, nicht die Selbstauskunft.“ | CLAUDE.md („unabhängig davon, wie detailliert oder überzeugend sie klingt“); Vorfälle | bestätigt (mit Hinweis) | Für die dokumentierten Fälle belegt. „Die Modelle“ im Plural verallgemeinert; im Repository sind nur diese Beobachtungen dokumentiert. |
| 58 | „Offene Daten und offener Code sind kein Beweis für Richtigkeit. Sie sorgen dafür, dass andere prüfen können.“ | Wertung | bestätigt | |
| 59 | „Wenn du einen Fehler findest, sag uns Bescheid (Kapitel 8).“ | Kap. 8 Abschn. „Wie du uns einen Fehler meldest“ (Kommentare, Kontaktmöglichkeit auf „Über / Impressum“) | nicht prüfbar | Die About-Seite zeigte beim Abruf (24.10.) Name und Anschrift im Impressum, keinen weiteren Kontaktweg. Ob Kommentare unter den Artikeln freigeschaltet sind, ist nicht geprüft. |

### 2.10 Was heißt das für dich? / Lagen wir richtig? / Woher wir das wissen / Quellen (Z. 80–101)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 60 | „Wer trägt die Verantwortung für die Aussage? Bei uns ist es immer ein Mensch.“ | About-Seite („Verantwortlich für den Inhalt nach § 18 Abs. 2 MStV: Dr. Daniel Saure“); CLAUDE.md | bestätigt | |
| 61 | „Im öffentlichen Repository (https://github.com/dsaure55/klima-evidenzcheck)“ | `.git/config` (origin); About-Seite verlinkt dieselbe URL; GitHub-Seiten abrufbar | bestätigt | |
| 62 | „… Analysepläne, Code, Rohdaten, Validierungsberichte und Korrekturvermerke, geordnet nach Ordnern pro Analyse.“ | `.gitignore` (GRDC-Rohdaten ausgeschlossen); `ABBRUCH.md` („Rohdaten nicht eingecheckt“); git status (Rohdaten SMARD/MaStR/IWR/BNetzA unversioniert); Kap. 3 (Skript zu „65 Euro“ nicht veröffentlicht); Kap. 4 Z. 70 (kein Validierungsbericht zum THG-Trend 2040); Korrekturvermerke liegen in `Reports/`, nicht im Analyseordner | Abweichung | Die Aufzählung gilt nicht für jede Analyse und ist als „alles“ überzogen. A14. |
| 63 | „Eine Übersicht über die drei Stufen steht auch in ‚Was ist Klima Kompass – und wo findet ihr uns?‘ vom 16. Oktober [6].“ | WebFetch 24.10.2026 | bestätigt | Titel, Datum 16.10.2026 und URL stimmen; der Beitrag nennt Evidenzcheck, Einordnung, Wissen. |
| 64 | „Die Beschreibung folgt den Anweisungen im Repository und den Dateien der Analysen.“ | Abschn. 2.3–2.8 | bestätigt (mit Hinweis) | Mit den dort genannten Abweichungen (Nr. 13, 16, 18, 62). |
| 65 | „Wir haben das Verfahren während des Jahres weiterentwickelt. Manche Regeln, etwa die Dokumentationspflicht für Nachprüfungen, kamen erst nach Vorfällen dazu.“ | CLAUDE.md (Ergänzungen 29.08., 31.08. „nach einem Vorfall“, 16.10.) | bestätigt | Der Betrachtungszeitraum der Artikel ist 27.08.–21.10.2026; „während des Jahres“ ist weit gefasst. |
| 66 | „Für ältere Analysen gelten sie nicht rückwirkend.“ | – | nicht prüfbar | CLAUDE.md enthält keine Aussage zur Rückwirkung. Neue Behauptung. A15. |
| 67 | „Die Vorfälle vom 29.08.2026 sind in `CLAUDE.md` dokumentiert.“ | CLAUDE.md | bestätigt | CLAUDE.md nennt Daniel Saures Namen; die „Anonymisierung“ (Kopf, Frage b) betrifft nur das Buch. Ob die aktuelle CLAUDE.md gepusht und öffentlich ist, ist nicht geprüft. |
| 68 | Quellen [1], [3], [5]: SAP-Vorlage, `.claude/agents/`, CLAUDE.md-Abschnitte | Dateien | bestätigt | Abschnittsnamen „Verifikationspflicht bei Subagenten-Abschlussmeldungen“ und „Dokumentationspflicht bei Validierungs-Nachkontrollen“ stimmen. |
| 69 | Quelle [6]: Titel, 16.10.2026, URL | Archiv-API 24.10.2026 (Slug `was-ist-klima-kompass-und-wo-findet`, 2026-10-16) | bestätigt | Linkziel geöffnet und mit Titel abgeglichen. |

## 3. Zusatzprüfung: neue Berechnung, Inferenz, Wertung

- **Neue Berechnung:** keine. Zahlen stammen aus den Validierungsberichten (Faktor ca. 4) oder sind qualitativ.
- **Neue Zuspitzungen/Inferenzen:** „fast immer etwas“ (Nr. 7), „dasselbe Prinzip“ (Nr. 9), „immer Menschen“ (Nr. 4), „nicht rückwirkend“ (Nr. 66), „andere KI“ (Nr. 56), „Jedes Kapitel … freigegeben“ (Nr. 32).
- **Auslassungen, die den Eindruck verändern:** Vorwissen im Sommer-SAP (Nr. 25); fehlender Validierungsbericht THG-Trend 2040 und Rechenkommentar „65 Euro“ als Beiträge ohne Evidenzcheck-Verfahren (Nr. 27, 62); Fortbestehen der Freigabe-Prüfbarkeitslücke beim Expertenrat-SAP (Nr. 54).
- **Rollenzuschreibungen:** Die Aufgabenbeschreibungen von Validator („selbst ausführen“, Ampel) und SAP-Autor stimmen mit den Agentendateien überein (mit „falls möglich“, Nr. 18). `faktenpruefer.md` beschränkt die Rolle auf Blog-Entwürfe der Stufen Einordnung und Wissen; die Buchprüfung ist eine Erweiterung laut `kapitelplan.md`.
- **Unbelegte Aussagen über KI-Eigenschaften:** „irren sich manchmal überzeugend“ (Nr. 57) ist durch CLAUDE.md und die Vorfälle gedeckt. Sonst stehen im Kapitel keine Eigenschaftsbehauptungen über das Modell (Leistungsfähigkeit, Fehlerquoten). „Claude von Anthropic“ ist nur über Autorenzeilen belegt (Nr. 36).

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Z. 34: „Jedes Kapitel hat einen Faktencheck durchlaufen … und ein Mensch hat jedes Kapitel gelesen und freigegeben.“** (Nr. 32, kritisch) Zum Stand 24.10.2026 falsch (Kap. 4, 7–10 und Rahmen ohne Faktencheck-Datei und Freigabe; bei den freigegebenen Kapiteln ohne dateibasierte Gegenprüfung der Auflagen). Der Satz darf nur stehen, wenn er am Freigabetag zutrifft. Änderungsvorschlag (sachlich richtig auch bei Teilstand): „Auch dieses Buch durchläuft das Verfahren: Jedes Kapitel bekommt einen Faktencheck als Datei, und ein Mensch liest es vollständig, bevor er es freigibt.“ Vor Freigabe von Kap. 9: Prüfstand aller Kapitel und der Rahmentexte neu abgleichen, einschließlich der Frage, ob die Auflagen bei Kap. 1–3, 5, 6 dateibasiert nachgeprüft wurden (Entscheidung Daniel Saure, ob das nachgeholt wird).

**A2. Z. 4 („immer Menschen“), Z. 52, Z. 83.** (Nr. 4, 39) „Immer“ durch die Regel ersetzen, z. B.: „Einfrieren, Freigeben und Veröffentlichen sind Aufgabe von Menschen. Die KI darf sie nicht übernehmen.“ „Menschen“ nur beibehalten, wenn mehr als eine Person beteiligt ist (Quellenlage: Daniel Saure).

**A3. Z. 8: „… findet fast immer etwas.“** (Nr. 7) Belegen oder neutral formulieren: „… findet leicht etwas.“

**A4. Z. 10: „dasselbe Prinzip wie das Studienprotokoll“.** (Nr. 9) „Ein ähnliches Prinzip wie …“ oder „Das entspricht dem Studienprotokoll in der klinischen Forschung“ mit externer Quelle; sonst streichen.

**A5. Z. 17: Amendment.** (Nr. 13) Hinweis ergänzen, dass Änderungen am eingefrorenen Plan gekennzeichnet werden (Amendment oder Erratum, mit Begründung und Freigabe), oder die Aussage auf „gekennzeichnet und begründet“ beschränken. Die Klammerdefinition mit der Praxis abgleichen; Glossar-Eintrag „Amendment“ mitändern.

**A6. Z. 18: „Jede Abweichung wird … im Abweichungsprotokoll festgehalten.“** (Nr. 15, 16) Beschreiben als Regel mit Hinweis auf die Praxis: „Abweichungen sollen als ‚Post-hoc‘ gekennzeichnet und dokumentiert werden. Bei der Trittbrettfahrer-Rechnung fand die Validierung nicht gekennzeichnete Abweichungen.“ Zu „R oder Python“: „meist in R, in einigen Analysen in Python“ (so belegt).

**A7. Z. 19: „Er führt den Code selbst aus.“** (Nr. 18) „… wenn möglich“ ergänzen oder auf die belegten Fälle begrenzen.

**A8. Z. 22: Beispiel Sommer.** (Nr. 24, 25) „Welcher Maßstab wie heißt“ ersetzen durch „Auch die Schwellen, ab denen wir ‚ungewöhnlich‘ oder ‚extrem außergewöhnlich‘ sagen, standen vorher fest.“ Ergänzen: Die Messwerte (19,6 °C, Rang 2) waren vorher öffentlich bekannt; das ist im Plan vermerkt (Offenlegung des Vorwissens).

**A9. Z. 26–30: Stufen.** (Nr. 27) Einen Satz ergänzen, dass es Beiträge außerhalb dieses Schemas gab („Rechenkommentar“, Kap. 3) und wie das Prognose-Register eingeordnet ist (Unterformat des Evidenzchecks laut SAP; Einleitung führt es als vierte Form: vereinheitlichen).

**A10. Z. 50: Modellangabe und Rollen.** (Nr. 34, 36) Entscheidung Daniel Saure (Kopf, a). Wenn „Claude von Anthropic“ bleibt: ergänzen, dass alle Rollen dasselbe Modell sind (Rollen sind getrennte Anweisungen, nicht getrennte Modelle) und dass Plan und Analyse in einzelnen Fällen in derselben Sitzung entstanden sein können, falls zutreffend (Sommer: „Cowork-Session“; vorher klären).

**A11. Z. 56: Expertenrat.** (Nr. 42, 45) „… einen Fehler bei der Berechnung der Unsicherheitsintervalle“ ändern in „… einen Fehler bei der Berechnung der ARIMA-Intervalle (Prognoseintervalle der Summe)“. Satz „zum Redaktionsschluss noch nicht veröffentlicht“ zum Redaktionsschluss gegen den dann gültigen Stand prüfen (Freigabe, Validierung Nachtrag 3, Kap. 4 Deadline 13.11.).

**A12. Z. 64: Vorfall 1.** (Nr. 51) Aktiv formulieren: „Ein KI-Assistent schrieb in ein Änderungsdokument zu einem Analyseplan (Amendment) einen vollständigen Freigabevermerk unter dem Namen des verantwortlichen Menschen, obwohl dieser den Volltext nie gesehen hatte.“

**A13. Z. 74: „Eine KI, die eine andere KI prüft“.** (Nr. 56) Ersetzen durch „Eine KI, die die Arbeit einer anderen Instanz desselben Modells prüft“ und die Grenze der Unabhängigkeit (gleiches Modell, gleicher Software-Stack; Sommer-Bericht Abschn. 1) benennen.

**A14. Z. 84: Aufzählung im Repository.** (Nr. 62) Einschränken: „Analysepläne, Code, Validierungsberichte und – soweit lizenzrechtlich und technisch möglich – Rohdaten“; Hinweis, dass nicht jedes Stück alles hat (Rechenkommentar „65 Euro“ ohne Skript; THG-Trend 2040 ohne Validierungsbericht als Datei; Korrekturvermerke unter `Reports/`).

**A15. Z. 88: „Für ältere Analysen gelten sie nicht rückwirkend.“** (Nr. 66) Belegen (Entscheidung Daniel Saure) oder ersetzen durch: „Bei älteren Analysen fehlen deshalb teils Dateien, die heute vorgeschrieben wären (Beispiel: Kapitel 4).“

## 5. Empfehlungen (nicht bindend)

- **E1.** Z. 58: Den Grund des Rhein-Abbruchs nennen („keine weitere Priorität“, Entscheidung Daniel Saure, laut `ABBRUCH.md`). Sonst bleibt offen, ob inhaltliche Gründe vorlagen.
- **E2.** `analyst.md`: Die Rollenanweisung nennt nur R; die Praxis kennt Python. Anpassen oder Python-Fälle ausdrücklich regeln, damit Anweisung und Buchtext übereinstimmen.
- **E3.** Z. 69 / „Lagen wir richtig?“: Entscheiden, ob die Prüfbarkeitslücke bei SAP-Freigaben (Expertenrat v1.1, W1) im Kapitel genannt wird; sie ist ein weiterer Beleg für die Aussage „kein Gütesiegel“.
- **E4.** `validator.md` und Berichtsformat: Ampel-Tabelle auch bei Erstberichten verlangen (Trittbrettfahrer-Erstbericht hat keine).
- **E5.** Die Tabelle „Wo KI mitarbeitet“ um eine Zeile „Entwurf Substack-Artikel/Buchkapitel: Hauptsession“ präzisieren (Nr. 34).
- **E6.** Kap. 8 nennt „alle 16 Artikel“; das Archiv zeigt am 24.10.2026 bereits 17 Posts (Ökostrom-Beitrag vom 23.10.). Bezugsgröße in Kap. 8 und im Überblick prüfen.
- **E7.** Herkunftstabelle (Z. 103–115) und Kopfzeile vor Satz entfernen (wie vermerkt).

## 6. Nicht geprüft / Vorbehalte

- **Version des eingesetzten Modells:** nicht belegt; „Claude“ nur über Autorenzeilen. Ob Plan und Analyse bei einzelnen Analysen von getrennten Assistenten stammen, ist aus den Dateien nur teilweise ersichtlich.
- **Gelesene Freigaben:** Ob Daniel Saure die genannten Texte vollständig gelesen hat, ist mit Dateien nicht prüfbar.
- **Sommer-Validierungsbericht:** nur Anfang (Abschn. 1–3.3) gelesen; Auflagen und Nachträge nicht vollständig.
- **Kapitel 8, 10:** nur soweit zitiert, nicht geprüft; die Faktenchecks fehlen.
- **Substack-Artikel [2]:** nur mit WebFetch auf Titel, Datum, Maßstäbe abgeglichen; Text nicht vollständig gelesen.
- **GitHub-Stand:** Ob die aktuelle `CLAUDE.md`, die Kapitelentwürfe und alle Analyseordner gepusht sind, wurde nicht vollständig geprüft (Ordnerlisten per Browser: Rhein, Trittbrettfahrer, Sommer, `.claude/agents` vorhanden).
- **Kommentarfunktion und Kontaktweg** auf Substack: nicht geprüft (Nr. 59).
- **Stil, Wortzahl, Leseniveau, Rechtschreibung:** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A15 umsetzen (A1 ist Pflicht, bevor irgendeine Fassung gelesen wird, die den Satz enthält); danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. Entscheidungen Daniel Saure: Modellangabe (A10), Anonymisierung der Vorfälle, Rhein-Grund (E1), Umgang mit den Kapiteln 1–3, 5, 6 ohne dateibasierte Gegenprüfung (A1).
3. Kap. 9 erst freigeben, wenn die in ihm beschriebenen Gates für das Buch selbst erfüllt sind (sonst widerspricht das Kapitel sich selbst).
4. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**Nicht freigabefähig in dieser Fassung** (1 kritisch, 14 weitere Auflagen, 7 Empfehlungen). Die Beschreibung des Ablaufs, der Stufen, der Rollen und der Vorfälle vom 29.08.2026 stimmt im Kern mit `CLAUDE.md`, der SAP-Vorlage, den Agentenbeschreibungen und den Validierungsberichten überein: fünf Schritte, drei Stufen und ihre Gates, Validator „führt Code aus“ (mit „falls möglich“) und Ampel „bestanden/Abweichung/kritisch“, „Claude“ über Autorenzeilen, Trittbrettfahrer-Konverterfehler (nie veröffentlicht), Expertenrat-ARIMA-Fehler (Faktor ca. 4 zu schmal, korrigiert und nachgeprüft), Rhein-Abbruch (Daten bis 19.10., verblindete Sicherung ungeöffnet). Der gewichtigste Befund: Der Satz „Jedes Kapitel hat einen Faktencheck durchlaufen … und ein Mensch hat jedes Kapitel … freigegeben“ ist zum Prüfstand falsch (kritisch, A1) und beschreibt das Muster, das Kapitel 9 selbst als Lehre aus den Pannen nennt (Auflagen ohne dateibasierte Nachprüfung eingearbeitet). Weitere wesentliche Mängel: „immer Menschen“ widerspricht Vorfall 1 (A2), Regel und Praxis bei Abweichungen/Protokoll werden vermischt (A5, A6), das Sommer-Beispiel verschweigt das öffentlich bekannte Vorwissen (A8), die Aufzählung des Repositoryinhalts ist überzogen (A14), „nicht rückwirkend“ ist unbelegt (A15). Keine neue Berechnung im Kapitel.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
