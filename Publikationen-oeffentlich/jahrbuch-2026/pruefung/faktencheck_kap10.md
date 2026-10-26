# Faktencheck Kapitel 10 (Jahrbuch 2026): „Das Prognose-Register: Wir legen uns fest, bevor wir es wissen“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/10-prognose-register.md` (Entwurf v0.1, 24.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 87 ist nicht Buchtext).
**Prüfdatum:** 24.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5: volle Faktencheck-Datei für Kapitel 10, abhängig vom SAP-Stand. Regeln: keine neue Berechnung, keine neue Inferenz, Angaben zu 2027 nur als „geplant“ und exakt nach SAP, Fristen nicht verschärfen, kein Zahlenwert für 2027 (`gliederung_kap07-10.md`, „Grenzen“). Besondere Prüfpunkte laut Auftrag: (1) „geplant“-Angaben exakt gleich dem SAP, (2) keine verschärften Fristen, (3) kein Zahlenwert für 2027, (4) Erklärung „95-Prozent-Intervall“, (5) Aussage zum Stand des Prognose-Checks.
**Arbeitsweise und Grenze:** Dem Prüfer stand keine Shell zur Verfügung. Git-Angaben stammen aus den Reflog-Dateien unter `.git/logs/` (lokales `HEAD` und `refs/remotes/origin/main`). Der SAP „Prognose-Register 2027“ wurde in den Abschnitten 0 bis 3, 5 bis 11 und 12 (Rückfragen) gelesen, der SAP „Prognose-Check“ nur im Kopf und der Versionshistorie (Zeilen 1–150).

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| `Prognose-Register/01_gasspeicher-winter-2026-27.md` (Eintrag #1) | gelesen (vollständig) | Zielgröße, V1, V2, Auswertung, Offenlegung abgeglichen |
| `Analysen/2026-09-gasspeicher-winter/SAP_gasspeicher-winter-2026.md` (v1.0, eingefroren 14.09.2026; Kopf, Zeilen 1–60), `Analysebericht_gasspeicher-winter-2026.md`, `Validierungsbericht_gasspeicher-winter-2026.md` | gelesen (Analysebericht und Validierungsbericht vollständig) | 150 TWh, 69–230, 4,21 °C, Fitbereich 3,75–6,18 °C bestätigt; Validierungsbericht mit offener Auflage (Nr. 17) |
| `Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md` (v1.0-teil, Stand 23.10.2026) | gelesen (Abschnitte 0–3, 5–12) | Kopf, Sperren, Fristentabelle, Zielgrößen, Reporting, Wortwahl abgeglichen |
| `Analysen/2026-10-prognose-check-projektionsberichte/SAP_prognose-check-projektionsberichte.md` (v1.1) | gelesen (Zeilen 1–150: Kopf, Versionshistorie, Abschnitte 0–2.1) | eingefroren 22.10.2026; Amendment 1 (v1.1) am selben Tag |
| `Analysen/2026-10-prognose-check-projektionsberichte/run_log.txt` | gelesen (vollständig) | Stopp nach SAP 3.5.5, keine Ergebnisse (Nr. 45) |
| `quellen-artikel/2026-09-14_reichen-136-terawattstunden-was-der.html`, `…/2026-10-17_gasspeicher-bei-60-prozent-was-heit.html` | gelesen (vollständig) | 60,5 %, 150, 69–230 bestätigt |
| `kapitelplan.md` (Erscheinen 1.12.2026), `gliederung_kap07-10.md`, Kapitel 1, 4 (Entwurf) | gelesen | Querbezüge; Kap. 4 verweist umgekehrt auf Kap. 10 (Nr. 47) |
| `.git/logs/HEAD`, `.git/logs/refs/remotes/origin/main` | gelesen | Commit 93a0d3f „Prognose-Register #1 angelegt“, 22.10.2026, gepusht am selben Tag; SAP-Teilfreigabe-Commit 0ee0b6e, 23.10.2026, gepusht |
| Eurostat, DWD-Originaldateien, UBA, Copernicus | nicht geöffnet | nicht Gegenstand (Kapitel enthält keine neuen Werte aus diesen Quellen) |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4, E-Nummern auf die Empfehlungen in Abschnitt 5.

### 2.1 „Kurz gesagt“ (Z. 4)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Viele Vorhersagen werden hinterher zurechtgebogen.“ | – | Abweichung (gering) | Unbelegte Häufigkeitsaussage („Viele“), gleiches Muster wie Kap. 6 A9. A12. |
| 2 | „Deshalb legen wir uns vorher fest: mit Zahl, Spanne, Bewertungsregel und Stichtag, versehen mit einem Zeitstempel im öffentlichen Repository.“ | Register #1; SAP Register 2027 Abschnitt 11 | Abweichung (gering) | Für die 2027er Einträge stimmt das (Stichtage im SAP). Eintrag #1 hat keinen festen Stichtag, sondern „sobald Eurostat die Werte bis März 2027 veröffentlicht (voraussichtlich Mai/Juni 2027)“. A8. |
| 3 | „Später sagen wir offen, ob wir getroffen haben oder nicht, egal wie es ausgeht.“ | Register #1 (Auswertung); SAP 0, 7, 11 | bestätigt | |
| 4 | „Eine Vorhersage ist registriert: wie viel Gas im Winter 2026/27 aus den deutschen Speichern entnommen wird.“ | Register #1; Reflog (Commit 93a0d3f, 22.10.2026) | bestätigt | Der Eintrag enthält zwei Teilvorhersagen (V1 und V2). E2. |
| 5 | „Für 2027 planen wir vier weitere.“ | SAP Register 2027, Kopf und 0.1 (Einträge #2–#5) | bestätigt | |
| 6 | „Zahlen dazu nennen wir hier nicht, weil wir sie erst nach dem Jahreswechsel berechnen dürfen.“ | SAP 0.1 (Rechenbeginn V1 und V4: 01.01.2027; V3: sobald Dezemberwert 2026 bei C3S vorliegt; V2: sobald Jahreswert 2026 vorliegt; Sperre 1 und 2) | bestätigt | Richtig, aber verkürzt: Auch das Einfrieren und der Prognose-Check sind Bedingungen (Nr. 35). Kein Zahlenwert für 2027 im Kapitel (Abschnitt 3). |

### 2.2 „Das Prinzip“ (Z. 8–18)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 7 | Bestandteile eines Eintrags: Zielgröße, Vorhersage mit Spanne, Bewertungsregel, Stichtag, Zeitstempel | SAP 11 (Felder der Einträge); Register #1 | Abweichung (gering) | Eintrag #1: Zielgröße ✓, Vorhersage mit Spanne ✓, Bewertungsregel ✓ (V1: liegt im 95-%-Prognoseintervall), Zeitstempel ✓ (Commit); Stichtag ✗ (Eurostat-Veröffentlichung). A8. |
| 8 | „Der Git-Commit im Repository belegt, wann der Eintrag angelegt wurde und dass er seitdem nicht verändert wurde.“ | SAP 0.1 („Der Hash dieses Registrierungs-Commits ist der verbindliche Zeitstempel“; „Die Git-Historie wird nicht umgeschrieben“); Reflog | Abweichung (gering) | Der Commit belegt den Inhalt zum Zeitpunkt des Commits. „Seitdem nicht verändert“ ergibt sich nur aus der öffentlichen Versionsgeschichte (und der Selbstverpflichtung, sie nicht umzuschreiben); die Commit-Zeit ist eine Selbstangabe. Nicht per `git diff` geprüft, ob Datei #1 seit 22.10. unverändert ist. A9. |
| 9 | „Wir schreiben später ‚lag im registrierten 95-Prozent-Intervall‘ oder ‚lag außerhalb‘, nicht ‚richtig‘ oder ‚falsch‘.“ | SAP 11 („Wortwahl: ‚Die Vorhersage lag im / außerhalb des vorab registrierten 95-%-Intervalls‘. Nicht ‚richtig/falsch vorhergesagt‘“) | bestätigt | SAP, Register #1 und das Kapitel selbst verwenden zusätzlich „getroffen / nicht getroffen“; kein Widerspruch (SAP 2.0: „getroffen“ als Bewertungsregel). E1. |
| 10 | „Ein 95-Prozent-Intervall heißt: Wenn das Modell stimmt, liegt der Wert in 19 von 20 Fällen darin.“ | SAP 1 (Nr. 3), 2.0, 5.4, 9 | bestätigt (mit Hinweis) | Sachlich korrekt formuliert als Häufigkeitsaussage über wiederholte Vorhersagen mit der Bedingung „wenn das Modell stimmt“. 95 % = 19 von 20 ist keine neue Berechnung. Einschränkungen aus dem SAP, die das Kapitel nicht nennt: (a) Das Intervall bildet nur die statistische Unsicherheit des Modells ab, Strukturbrüche nicht (SAP 5.4, 8.1). (b) Bei V1 waren die Residuen im Fenster nicht normalverteilt, das t-Intervall kann falsch kalibriert sein (SAP 5.2, 9). (c) Bei V3 (ganzzahlig) kann die tatsächliche Überdeckung über 95 % liegen (SAP 2.3). (d) Es ist ein Prognoseintervall für einen künftigen Einzelwert, kein Konfidenzintervall. Das Kapitel sagt nur „Intervall“. A13. |
| 11 | „Auch wenn der Wert einmal danebenliegt, war nicht zwingend das Modell schlecht.“ | SAP 7 („Ein einzelner Fehltreffer ist deshalb kein Beleg für eine schlechte Methode“), 8.2 | bestätigt | |
| 12 | „Aber wer immer wieder danebenliegt, sollte sein Modell hinterfragen.“ | SAP 1 (Nr. 3: Kalibrierung über mehrere Jahrgänge), 7 | bestätigt (mit Hinweis) | Allgemeiner Grundsatz; „immer wieder“ ist unbestimmt. Der SAP legt fest, dass ein einzelner Jahrgang mit vier Vorhersagen keine Aussage zur Kalibrierung erlaubt. |
| 13 | „Genau das sehen die Leserinnen und Leser nur, wenn alle Ergebnisse veröffentlicht werden, unabhängig vom Ausgang.“ | SAP 0, 7, 11; Register #1 | bestätigt | |
| 14 | „Eine Vorhersage im Register ist keine Wette und keine Klimaprojektion … Unsere Vorhersagen sind kurzfristig und prüfbar, mit festem Stichtag. Sie sagen nichts über die ferne Zukunft.“ | SAP 1, 8.1 („Statistische Fortschreibung ist keine Klimaprojektion“), 2.5; Register #1 | bestätigt (für 2027) / Abweichung (gering) für #1 | Die Beschreibung der Klimaprojektion („unter bestimmten Annahmen über Emissionen“) entspricht der Begrifflichkeit der SAPs. „Fester Stichtag“ gilt für #2–#5, nicht für #1 (Nr. 2). „Keine Wette“ ist eine Begriffsbestimmung. |

### 2.3 „Eintrag #1: Gasspeicher-Entnahme im Winter 2026/27“ (Z. 20–37)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 15 | Leserfrage: „Reicht das Gas für den Winter? Genauer … Wie viel wird im Winter 2026/27 aus den deutschen Speichern entnommen?“ | Register #1 (Leserfrage, Zielgröße) | bestätigt | |
| 16 | „Registriert am 22. Oktober 2026.“ | Register #1; Reflog: Commit 93a0d3f am 22.10.2026, Push am 22.10.2026 (origin/main-Reflog) | bestätigt | Die Freigabe-Zeile der Registerdatei beruht auf „1. ja“ im Chat auf die Frage, ob registriert werden soll, nicht auf einer ausdrücklich bestätigten Volltextlektüre. Das Kapitel behauptet keine Freigabe. Hinweis für Daniel Saure und die Top-Level-Session (E3). |
| 17 | „Die Grundlage ist unser Evidenzcheck ‚Reichen 136 Terawattstunden?‘ vom 14. September, mit eingefrorenem Analyseplan und Validierung [1][2].“ | SAP v1.0 (eingefroren 14.09.2026, „Volltext gelesen, einfrieren“); Artikel 14.09.; Validierungsbericht | Abweichung (gering) | SAP und Artikel ✓. „Validierung“: Der Validierungsbericht dokumentiert zwei Prüfrunden, beide zunächst „nicht veröffentlichungsreif“, danach Korrekturen bestätigt. **Offene Auflage vor Veröffentlichung:** Die DWD-Werte stammen aus in den Chat eingefügtem Text; Abgleich mit den Originaldateien steht aus („bis dahin bleibt ein Übertragungsfehler möglich“). Ein Nachtrag mit Erledigung wurde nicht gefunden (Dateinamen nicht auflistbar, nur drei Dateien gelesen). Die Zahlen 150 und 69–230 hängen an diesen Werten. A10. |
| 18 | „Neu gerechnet wurde für den Eintrag nichts.“ | Register #1 („Neue Berechnung: keine“) | bestätigt | |
| 19 | Zielgröße: Netto-Entnahme aus den deutschen Gasspeichern von Oktober 2026 bis März 2027, Eurostat-Monatsdaten, TWh | Register #1 (Zielgröße: −Σ STK_CHG_MG, nrg_cb_gasm, Oktober bis März, TJ → TWh) | bestätigt | |
| 20 | V1 (Kernvorhersage, temperaturbereinigt): tatsächliche Wintertemperatur ins unveränderte Modell, Entnahme liegt im 95-Prozent-Prognoseintervall | Register #1 (V1) | bestätigt | |
| 21 | V1: Wintertemperatur außerhalb 3,75 bis 6,18 °C → nicht bewertet (Extrapolation), wird so berichtet | Register #1; Analysebericht (Fitbereich 3,75–6,18 °C) | bestätigt | |
| 22 | V2: „Die Entnahme liegt zwischen 69 und 230 TWh. Das ist das Prognoseintervall für einen durchschnittlich kalten Winter (4,21 °C). Der erwartete Wert liegt bei rund 150 TWh.“ | Register #1 (V2); Analysebericht E2; Artikel 14.09. und 17.10. | bestätigt | „95-%“ fehlt vor „Prognoseintervall“ (Register: 95-%-Prognoseintervall); 4,21 °C ist das Mittel 1996/97–2025/26. |
| 23 | „Ein deutlich kälterer oder milderer Winter kann aus diesem Bereich fallen, ohne dass das Modell falsch war. Maßgeblich ist deshalb V1.“ | Register #1 (V2) | bestätigt | |
| 24 | Auswertung: „sobald Eurostat die Werte bis März 2027 veröffentlicht, voraussichtlich im Mai oder Juni 2027 … V1 und V2 jeweils als ‚getroffen‘ oder ‚nicht getroffen‘ und die Abweichung vom erwarteten Wert [2]“ | Register #1 (Auswertung) | bestätigt | |
| 25 | Offenlegung: Winter bei Registrierung drei Wochen alt; Daten zur Entnahme seit Oktober nicht ausgewertet; Füllstand 60,5 % am 16.10. [3] ist ein Bestand, keine Entnahme | Register #1 (Offenlegung); Artikel 17.10. | bestätigt | |
| 26 | „Was wir nicht vorhersagen: Versorgungssicherheit, Preise und kurze Kältewellen.“ | Register #1 | bestätigt | |

### 2.4 „Was als Nächstes kommt: das Register 2027 (geplant)“ (Z. 39–52)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 27 | „Für 2027 planen wir vier weitere Einträge. Der Analyseplan dazu liegt vor, ist aber nur zum Teil eingefroren.“ | SAP Kopf (Version 1.0-teil, 23.10.2026): eingefroren V3 und Abschnitte 0, 1, 2.0, 2.3, 3.3, 3.5, 5–11; V1, V2, V4 (2.1, 2.2, 2.4, 3.1, 3.2, 3.4) draft; Reflog Commit 0ee0b6e (gepusht 23.10.) | bestätigt | Stand 23.10.2026. Änderbar bis zum Satz; V2 hat zudem offene Vorbedingungen (Dateiprüfung, Variante (a)/(b)). |
| 28 | „Daten, Zahlen und Termine können sich ändern.“ | SAP (draft-Teile; Wartefristen, Fallbacks in 3) | bestätigt | Eingefrorene Teile nur per gekennzeichnetem Amendment. |
| 29 | Zielgröße 1: „die Sommermitteltemperatur in Deutschland“ | SAP 2.1 (DWD-Gebietsmittel, Juni–August 2027, Entwurf) | bestätigt | |
| 30 | Zielgröße 2: „die Anzahl der Hitzetage in Deutschland“ | SAP 2.2 (DWD-Gebietsmittel Deutschland der Anzahl Heißer Tage, Tmax ≥ 30 °C; Entwurf), 8.3 | bestätigt (mit Hinweis) | SAP 8.3 (eingefroren) legt fest, dass bei jeder Nennung zu erklären ist, dass V2 ein Flächenmittel ist und nicht die Zahl einer Messstation. Die Erklärung fehlt im Kapitel. Offene Vorbedingung: Existenz der DWD-Reihe ungeprüft (SAP 3.2). A11. |
| 31 | Zielgröße 3: „die Anzahl der Monate mit einer globalen Temperatur über 1,5 °C über dem vorindustriellen Niveau“ | SAP 2.3 (eingefroren; ERA5/C3S, > 1,50 °C, 1850–1900), 8.4 | bestätigt (mit Hinweis) | SAP 8.4 verlangt im Ergebnistext den Hinweis, dass einzelne Monate oder deren Anzahl nicht bedeuten, dass die Pariser Grenze überschritten ist (Kap. 6 behandelt das). Ein Halbsatz im Kapitel wäre konsistent. A11. |
| 32 | Zielgröße 4: „die deutschen Treibhausgasemissionen“ | SAP 2.4 (gesamt ohne LULUCF, ohne internationalen Luft- und Seeverkehr, UBA-Vorjahresschätzung 2027; Entwurf) | bestätigt (mit Hinweis) | Abgrenzung (ohne LULUCF; Vorjahresschätzung des UBA) fehlt. A11. |
| 33 | „Wir rechnen ausschließlich mit Daten bis Ende 2026.“ | SAP 0.1 Sperre 1 | bestätigt | |
| 34 | „Beobachtungen aus 2027 dürfen wir vor der Registrierung nicht ansehen, auch nicht vorläufige Werte oder Tageswerte. Das gilt ausdrücklich auch für den Copernicus-Datendienst, der fast in Echtzeit zeigt, wie warm es gerade ist [4].“ | SAP 0.1 Sperre 1 („auch Tageswerte und vorläufige Werte … ausdrücklich auch für den Copernicus-‚Climate Pulse‘“) | bestätigt | |
| 35 | „Warum es im Buch keine Zahlen gibt. Der Plan sperrt die Berechnung, bis er eingefroren ist und die Daten bis Ende 2026 vorliegen.“ | SAP 0.1 Sperre 2: (a) Einfrieren, (b) Prognose-Check abgeschlossen (Validierungsbericht ohne „kritisch“ und Freigabe), (c) Daten veröffentlicht | Abweichung (gering) | Unvollständig: Bedingung (b) fehlt. Sie gilt für V1, V2 und V4 ohne Ausnahme, für V3 gibt es eine vorab festgelegte Ausnahme (Rechnung auch ohne abgeschlossenen Prognose-Check, wenn dieser am 12.01.2027 nicht abgeschlossen ist). Die Fristen (31.01.2027) hängen damit am Prognose-Check, dessen Stand das Kapitel in Z. 56 beschreibt. A3. |
| 36 | „Beim globalen Temperaturwert (3.) muss die Registrierung bis zum 15. Januar 2027 stehen, bei den anderen bis zum 31. Januar 2027.“ | SAP 0.1 Fristentabelle („Registrierung spätestens“: V3 15.01.2027; V1, V2, V4 31.01.2027) | bestätigt | Fristen nicht verschärft: „spätestens“ entspricht „muss stehen“. Nicht genannt (kein Fehler): Einfrieren spätestens 15.12.2026 (V3) bzw. 31.12.2026; gemeinsamer Substack-Beitrag spätestens 31.01.2027. |
| 37 | „Die Auswertung ist für die Zeit ab September 2027 bis März 2028 vorgesehen.“ | SAP 0.1 Fristentabelle („Stichtag der Auswertung“: V1 15.09.2027; V2 und V3 31.01.2028; V4 31.03.2028) und 3.1–3.4 | Abweichung (gering) | Die Stichtage sind die Tage des Datenabrufs, nicht das Ende der Auswertung. V4: Abruf am 31.03.2028; bei verspäteter UBA-Schätzung Wartefrist bis 30.06.2028, danach Fallback (voraussichtlich 2029). „Bis März 2028“ kann als Enddatum gelesen werden und verschärft so die Termine. A4. |
| 38 | „Das Buch erscheint früher.“ | `kapitelplan.md` (Erscheinen 1.12.2026) | bestätigt | Vor allen Einfrier- und Registrierungsterminen (15.12.2026 bis 31.01.2027). Bei einer Verschiebung des Erscheinens neu bewerten (E4). |
| 39 | „Wir können dir also zeigen, wie wir vorgehen, aber noch nicht, was wir erwarten.“ | Abschnitt 3 dieser Datei | bestätigt | Kein Vorhersagewert im Kapitel. |
| 40 | „Das Ergebnis wird auf Substack veröffentlicht, unabhängig vom Ausgang.“ | SAP 11 („Öffentliche Registrierung auf Substack“: gemeinsamer Beitrag zur Registrierung, spätestens 31.01.2027; Zeitpunkt 2: „Das Ergebnis wird im Registereintrag als Nachtrag ‚Auswertung‘ ergänzt“, Auswertungen „veröffentlicht“, Kanal nicht benannt) | Abweichung (gering) | „Unabhängig vom Ausgang“ ✓. Der SAP legt Substack nur für die Registrierung fest. Für die Auswertung steht dort „Nachtrag im Registereintrag“ und „veröffentlicht“, ohne Kanal. A5. |
| 41 | „Termine können sich verschieben, und wir nennen es dann.“ | SAP 3 (Wartefristen, „nicht auswertbar“, Fallback) | bestätigt | Selbstverpflichtung, im SAP durch dokumentierte Regeln gestützt. |

### 2.5 „Ein Vorläufer: der Prognose-Check“ (Z. 54–56)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 42 | „Bevor wir unsere eigenen Vorhersagen daran messen, schauen wir zurück: Wie treffsicher waren die Projektionsberichte der Bundesregierung?“ | SAP Register 2027 Sperre 3, 2.5, Rückfrage 11; SAP Prognose-Check (Verallgemeinerung ausgeschlossen) | Abweichung | „daran messen“ und die Überschrift „Vorläufer“ legen nahe, der Prognose-Check sei Maßstab oder Grundlage der eigenen Vorhersagen. Der SAP sagt das Gegenteil: Ergebnisse des Prognose-Checks dürfen Methoden, Fenster und Intervalle des Registers nicht verändern (Sperre 3), seine Fehlermaße werden nicht zur Konstruktion von Intervallen genutzt (2.5, Rückfrage 11), und er schließt eine Verallgemeinerung auf künftige Projektionen aus. Verbunden sind beide nur durch die Reihenfolge (Sperre 2 b). A1. |
| 43 | „Der Prognose-Check vergleicht die projizierten mit den tatsächlich inventarisierten deutschen Treibhausgasemissionen, gesamt und je Sektor, für die Berichte 2015 bis 2023.“ | SAP Prognose-Check (Titel; 3.1: Berichte 2015, 2017, 2019, 2021, 2023) | bestätigt | |
| 44 | „Der Analyseplan wurde am 22. Oktober 2026 eingefroren [5].“ | SAP Prognose-Check (v1.0 final, eingefroren 22.10.2026; v1.1 Amendment 1, freigegeben 22.10.2026); `run_log.txt`; Reflog | bestätigt | Quelle [5] „v1.1, eingefroren 22.10.2026“: eingefroren wurde v1.0, v1.1 ist das Amendment desselben Tages. |
| 45 | „Zum Redaktionsschluss dieses Buchs liegt kein validiertes Ergebnis vor. Deshalb nennen wir hier keines.“ | `run_log.txt` (Stand 22.10.2026, 19:23: „STOPP nach SAP 3.5.5 – J_b für die Berichte 2021 und 2023 nicht eindeutig; Rückfrage an Daniel … Keine Fehlermaße, keine Estimands, keine Sensitivitäten berechnet“); Reflog (letzter Prognose-Check-Commit 22.10.: „Zwischenstand Datenbeschaffung und Integritäts-Checks“; kein Ergebnis- oder Validierungscommit bis HEAD efe06db vom 24.10.) | Abweichung (gering) | Für den Stand 22./24.10.2026 belegt: Es gibt kein Ergebnis und keinen Validierungsbericht. Die Aussage bezieht sich aber auf den Redaktionsschluss (Stichtag 15.11.2026; Deadline für Kap. 4 13.11.2026), der in der Zukunft liegt. Dateien im Arbeitsverzeichnis, die nicht committet sind, konnten nicht geprüft werden (Git-Status gekürzt, keine Shell). Aussage muss am Stichtag neu belegt werden. A2. |
| 46 | „Deshalb nennen wir hier keines.“ (Ergebnis) | Abschnitt 3 | bestätigt | Das Kapitel nennt kein Ergebnis und keine Fehlermaße. |
| 47 | „Wo der Stand weiter ist, findest du in Kapitel 4 oder im Repository.“ | Kap. 4 (Entwurf) Z. 53 („Mehr dazu in Kapitel 10“), Z. 66 | Abweichung (gering) | Zirkelverweis: Kap. 4 verweist für den Prognose-Check auf Kapitel 10 zurück. Kap. 4 Z. 66 sagt außerdem, der Prognose-Check zeige, „wie gut solche Fortschreibungen die Wirklichkeit treffen“, was dem SAP (Verallgemeinerung ausgeschlossen) widerspricht. Betrifft Kap. 4, nicht dieses Kapitel. A2. |

### 2.6 „Wie du mitprüfen kannst“ (Z. 58–63)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 48 | „Die Registereinträge liegen im öffentlichen Repository im Ordner `Prognose-Register/`, jeder als eigene Datei.“ | `Prognose-Register/01_gasspeicher-winter-2026-27.md`; SAP 11; Reflog (Commit 93a0d3f, Push 22.10.2026); CLAUDE.md („Repo ist öffentlich“) | bestätigt | Bisher existiert nur Eintrag #1. |
| 49 | „Der Zeitstempel ist der Git-Commit. Er zeigt, wann ein Eintrag angelegt wurde und ob er danach verändert wurde. Die Versionsgeschichte kann jeder einsehen.“ | SAP 0.1 („verbindlicher Zeitstempel“); Repo öffentlich | bestätigt | Hier korrekt formuliert („zeigt, ob“), im Unterschied zu Nr. 8. |
| 50 | „Die Analysepläne, Daten und Programme liegen unter `Analysen/`.“ | Git-Status (Sitzungsbeginn: z. B. Rohdaten der Batteriespeicher-Analyse untracked); SAP Register 2027 3.5 („Die Rohdateien der Rechnung werden erst mit dem Registrierungs-Commit committet“); Validierungsbericht Gas (DWD-Originale ausstehend) | Abweichung (gering) | Pläne und Programme ja; „Daten“ nicht durchgängig. Für die Register-Rechnung 2027 liegen die Rohdaten bewusst erst ab dem Registrierungs-Commit im Repo. A14. |
| 51 | „Findest du einen Fehler oder eine Lücke, sag uns Bescheid (Kapitel 8).“ | Kap. 8 Abschnitt „Wie du uns einen Fehler meldest“ | bestätigt | Kap. 8 ungeprüft. |

### 2.7 „Was heißt das für dich?“, „Lagen wir richtig?“ (Z. 65–73)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 52 | „Eine Vorhersage ohne Spanne und ohne Stichtag lässt sich nie widerlegen.“ | – | Abweichung (gering) | Logisch überzogen: Eine Punktvorhersage ohne Spanne lässt sich widerlegen (und fast immer verfehlen). Nicht prüfbar ist eine Vorhersage ohne Bewertungsregel und ohne Stichtag. A7. |
| 53 | „Wer seine Treffer zeigt und die Fehlschläge versteckt, hat dir nur einen Teil der Wahrheit gesagt. Bei einem Register stehen alle Ergebnisse.“ | SAP 7 (Vollständigkeit) | bestätigt | Wertung; „Bei einem Register stehen alle Ergebnisse“ gilt für #2–#5 laut SAP 7. |
| 54 | „Ein ‚nicht getroffen‘ ist keine Blamage, sondern Information. Es zeigt, wo unser Modell zu eng oder zu optimistisch war.“ | SAP 7, 8.2, 8.6; Kapitel Z. 16 | Abweichung | Widerspricht dem SAP (ein Fehltreffer allein ist kein Beleg für ein Modellproblem; der Bericht sagt nicht „das Modell ist widerlegt“; Neutralität: kein Ausgang wird als gute oder schlechte Nachricht bewertet) und dem Kapitel selbst (Z. 16). „zu eng oder zu optimistisch“ ist eine Deutung ohne Quelle. A6. |
| 55 | „Lagen wir richtig? Das wissen wir noch nicht … Der erste Test ist die Gasspeicher-Vorhersage im Frühsommer 2027.“ | Register #1 („voraussichtlich Mai/Juni 2027“); `kapitelplan.md` („frühestens Mai/Juni 2027“) | Abweichung (gering) | „Frühsommer“ ist eine Verschiebung gegenüber „Mai/Juni“, und der Termin hängt an der Eurostat-Veröffentlichung. A8. |

### 2.8 „Woher wir das wissen“, Quellenliste (Z. 75–85)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 56 | „Die Angaben zu Eintrag #1 stammen aus der Registerdatei und der validierten Analyse. Die Angaben zum Register 2027 stammen aus dem Analyseplan in seinem Stand vom 23. Oktober 2026 und sind als geplant zu verstehen.“ | Register #1; Validierungsbericht; SAP Stand 23.10.2026 | bestätigt (mit Hinweis) | 2. Satz ✓. 1. Satz: „validierte“ siehe Nr. 17. |
| 57 | Quelle [1]: Titel, Datum, URL | Artikel „Reichen 136 Terawattstunden? Was der Vergleich der Bundesnetzagentur nicht zeigt“, 14.09.2026 | bestätigt | |
| 58 | Quelle [2]: `Prognose-Register/01_gasspeicher-winter-2026-27.md`; `Analysen/2026-09-gasspeicher-winter/` (SAP, Analysebericht, Validierungsbericht) | Dateien vorhanden | bestätigt | |
| 59 | Quelle [3]: Titel, Datum 17.10.2026, URL | Artikel „Gasspeicher bei 60 Prozent – was heißt das für den Winter?“ | bestätigt | |
| 60 | Quelle [4]: SAP Register 2027, Stand 23.10.2026, „Teilfreigabe: V3 und allgemeine Abschnitte; V1, V2, V4 Entwurf“ | SAP-Kopf | bestätigt | |
| 61 | Quelle [5]: SAP Prognose-Check #1, v1.1, eingefroren 22.10.2026, Titel | SAP-Kopf und Titel | bestätigt | Siehe Nr. 44. |
| 62 | Herkunftstabelle (nicht Buchtext): Zeile „Prognose-Check ohne validiertes Ergebnis“ mit Beleg `run_log.txt` (Stopp nach SAP 3.5.5, Rückfrage offen) | `run_log.txt` Z. 220–223 | bestätigt | Stand 22.10. |

## 3. Zusatzprüfung: neue Inferenz, Zahlen für 2027, Fristen

- **Zahlenwert für 2027 im Text:** keiner. Alle Zahlen im Kapitel betreffen Eintrag #1 (Winter 2026/27: 3,75; 6,18; 4,21 °C; 69; 230; 150 TWh; 60,5 %) oder sind Daten und Fristen (22.10.2026, 15.01./31.01.2027, September 2027 bis März 2028) bzw. Verfahrensgrößen („95 Prozent“, „19 von 20“). Keine Punktvorhersage, kein Intervall, keine Wahrscheinlichkeit, kein Hinweis auf eine erwartete Richtung für Sommer, Hitzetage, 1,5-Grad-Monate oder Emissionen 2027. Der Schwellenwert „1,5 °C“ in Zielgröße 3 ist Teil der Definition, kein Erwartungswert.
- **Neue Berechnung:** keine. „19 von 20“ ist die Umformulierung von 95 %.
- **Fristen:** Alle genannten Fristen entsprechen dem SAP („spätestens“). Keine Verschärfung bei den Registrierungsfristen (Nr. 36). Mögliche Verschärfung bei den Auswertungsterminen („bis März 2028“, Nr. 37). Verkürzt, aber nicht verschärft: Sperre 2 b fehlt (Nr. 35).
- **Neue Zuspitzungen/Inferenzen:** Nr. 8 („belegt … nicht verändert“), Nr. 42 („daran messen“), Nr. 52, **Nr. 54** („zu eng oder zu optimistisch“), Nr. 55 („Frühsommer“).
- **Wertende Formulierungen:** „Viele Vorhersagen werden hinterher zurechtgebogen“ (Nr. 1), „keine Blamage“ (Nr. 54). Letztere widerspricht der Neutralitätsregel des SAP (8.6), soweit sie die Auswertung bewertet.
- **Status „geplant“:** Der Abschnitt ist überschrieben „(geplant)“, die Angaben tragen den Vorbehalt „nur zum Teil eingefroren“. Die Zuordnung zu den vier Zielgrößen und der Reihenfolge 1–4 stimmt mit V1–V4 überein. Zielgrößen 1, 2 und 4 sind noch Entwurf (draft), Zielgröße 3 ist eingefroren; das Kapitel unterscheidet das nicht, sagt aber ausdrücklich „nur zum Teil“.
- **Erklärung „95-Prozent-Intervall“ (Nr. 10):** korrekt formuliert als Häufigkeitsaussage bei gültigem Modell; unvollständig bei den im SAP genannten Einschränkungen (A13).
- **Aussage zum Stand des Prognose-Checks (Nr. 45):** belegt für 22./24.10.2026 durch `run_log.txt` und Git-Reflog; als Aussage „zum Redaktionsschluss“ nicht belegbar (A2).

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Z. 56: Verhältnis Prognose-Check und Register.** (Nr. 42) „Bevor wir unsere eigenen Vorhersagen daran messen, schauen wir zurück“ ändern. Änderungsvorschlag: „Ein verwandter Evidenzcheck schaut zurück: Wie treffsicher waren die Projektionsberichte der Bundesregierung? Seine Ergebnisse fließen nicht in die Methoden des Registers ein. Er muss aber abgeschlossen sein, bevor wir drei der vier Vorhersagen für 2027 berechnen dürfen.“ Überschrift „Ein Vorläufer“ ersetzen, z. B. „Ein verwandter Check: der Prognose-Check“.

**A2. Z. 56: Stand des Prognose-Checks.** (Nr. 45, 47) „Zum Redaktionsschluss dieses Buchs liegt kein validiertes Ergebnis vor“ ersetzen durch „Stand 24. Oktober 2026 liegt kein validiertes Ergebnis vor“ und am Stichtag 15.11.2026 gegen `run_log.txt`, Validierungsbericht und Freigabe neu belegen (dann ggf. „zum Redaktionsschluss“). Zirkelverweis mit Kap. 4 auflösen (Kap. 4 Z. 53 verweist auf Kap. 10 zurück); dazu Kap. 4 Z. 66 („zeigen, wie gut solche Fortschreibungen die Wirklichkeit treffen“) mit dem SAP abgleichen.

**A3. Z. 50: Sperre 2 vollständig.** (Nr. 35) Ergänzen: „Der Plan sperrt die Berechnung, bis er eingefroren ist, bis der Prognose-Check abgeschlossen ist und bis die Daten bis Ende 2026 vorliegen. Beim globalen Temperaturwert gilt für den Prognose-Check eine vorab festgelegte Ausnahme.“ Fristen (15.01./31.01.2027) unverändert lassen.

**A4. Z. 50: Auswertungstermine.** (Nr. 37) Ändern in: „Die Stichtage der Auswertung liegen zwischen dem 15. September 2027 und dem 31. März 2028.“ Keine Formulierung, die ein Ende der Auswertung im März 2028 nahelegt.

**A5. Z. 52: Kanal der Ergebnisse.** (Nr. 40) Ändern in: „Die Registrierung erscheint spätestens am 31. Januar 2027 in einem gemeinsamen Beitrag auf Substack. Die Auswertung veröffentlichen wir unabhängig vom Ausgang (als Nachtrag im Registereintrag).“ Ob die Auswertung zusätzlich auf Substack erscheint, ist im SAP nicht festgelegt.

**A6. Z. 69: „Es zeigt, wo unser Modell zu eng oder zu optimistisch war.“** (Nr. 54) Streichen oder ersetzen: „Ein einzelner Fehltreffer sagt noch nicht, ob das Modell schlecht ist; das lässt sich erst über mehrere Jahrgänge beurteilen.“ („Blamage“ kann bleiben.)

**A7. Z. 67: „ohne Spanne und ohne Stichtag lässt sich nie widerlegen“.** (Nr. 52) Ändern in: „Eine Vorhersage ohne Bewertungsregel und ohne Stichtag lässt sich nicht prüfen. Misstraue ihr.“

**A8. Z. 4, Z. 8–13, Z. 18, Z. 73: Stichtag und Termin bei Eintrag #1.** (Nr. 2, 7, 14, 55) Der Eintrag #1 hat keinen festen Stichtag. Ergänzen oder anpassen: „… und Stichtag bzw. Zeitpunkt der Auswertung (bei Eintrag #1: sobald Eurostat die Werte liefert)“; „im Frühsommer 2027“ ersetzen durch „voraussichtlich im Mai oder Juni 2027, sobald Eurostat die Werte bis März 2027 veröffentlicht“.

**A9. Z. 14: „belegt … und dass er seitdem nicht verändert wurde“.** (Nr. 8) Ändern in: „Der Git-Commit hält fest, wann der Eintrag angelegt wurde. Spätere Änderungen wären in der öffentlichen Versionsgeschichte sichtbar.“ Vor Satz per `git diff 93a0d3f -- Prognose-Register/01_gasspeicher-winter-2026-27.md` prüfen, dass Eintrag #1 unverändert ist.

**A10. Z. 24 und Z. 77: „Validierung“/„validierte Analyse“.** (Nr. 17, 56) Der Validierungsbericht hat eine offene Auflage (DWD-Werte aus Chat-Text, Abgleich mit Originaldateien). Entweder die Erledigung als Datei nachweisen (Nachtrag am Validierungsbericht, Dokumentationspflicht CLAUDE.md) oder die Formulierung anpassen: „mit eingefrorenem Analyseplan und zwei unabhängigen Prüfrunden; ein Abgleich der Temperaturwerte mit den Originaldateien stand bei der Prüfung noch aus“. Entscheidung: Daniel Saure.

**A11. Z. 41–46: Pflichthinweise nach SAP.** (Nr. 30, 31, 32) Je Zielgröße ein Halbsatz: Hitzetage = Flächenmittel für Deutschland, keine einzelne Messstation (SAP 8.3, bindend); Monate über 1,5 °C = Monatswerte, die nichts über die Pariser 20-Jahres-Grenze sagen (SAP 8.4); Treibhausgasemissionen = ohne Landnutzung, als UBA-Vorjahresschätzung. Alle als „geplant“ kennzeichnen.

**A12. Z. 4: „Viele Vorhersagen werden hinterher zurechtgebogen.“** (Nr. 1) Neutralisieren, z. B. „Vorhersagen lassen sich hinterher zurechtbiegen“, oder belegen.

**A13. Z. 16: Erklärung des Intervalls.** (Nr. 10) Präzisieren: „Ein 95-Prozent-Prognoseintervall heißt: Wenn das Modell stimmt und sich nichts Grundlegendes ändert, liegt der Wert in 19 von 20 Fällen darin. Sprünge wie ein Vulkanausbruch oder eine Energiekrise sind in diesem Bereich nicht enthalten.“ („nicht enthalten“ nach SAP 5.4.)

**A14. Z. 62: „Analysepläne, Daten und Programme liegen unter `Analysen/`.“** (Nr. 50) Ändern in „Analysepläne, Programme und Ergebnisse liegen unter `Analysen/`; die Rohdaten für das Register 2027 kommen mit dem Registrierungs-Commit dazu.“ Dazu Abgleich mit Kap. 7 Frage 9 (A2 im Faktencheck Kap. 7).

## 5. Empfehlungen (nicht bindend)

- **E1.** Wortwahl vereinheitlichen: Kapitel nennt „lag im / außerhalb des registrierten Intervalls“ (Z. 16) und „getroffen / nicht getroffen“ (Z. 33). Der SAP verwendet beides; einen Satz zur Beziehung ergänzen („getroffen heißt: lag im Intervall“).
- **E2.** Zu Eintrag #1 ausdrücklich sagen, dass er aus zwei Teilvorhersagen besteht (V1 maßgeblich), sonst steht „Eine Vorhersage“ in Spannung zu V1 und V2.
- **E3.** Hinweis für Daniel Saure und die Top-Level-Session (nicht Kapitelinhalt): Die Freigabe-Zeile in `Prognose-Register/01_gasspeicher-winter-2026-27.md` beruht auf „1. ja“ auf die Frage, ob registriert werden soll. Der SAP Register 2027 verlangt für die Einträge #2–#5 ausdrücklich die Freigabe des konkreten Eintrags (SAP 11) und CLAUDE.md die Volltextlektüre. Ob das für #1 nachgeholt wurde, ist nicht dokumentiert.
- **E4.** Wenn sich das Erscheinungsdatum (1.12.2026) auf einen Termin nach dem 15.12.2026/15.01.2027 verschiebt, entfallen die Aussagen „Das Buch erscheint früher“ und „keine Zahlen“. Dann Kapitel neu prüfen.
- **E5.** Ausdrücklich erwähnen, dass die Registrierung der 2027er Vorhersagen auch in einem gemeinsamen Substack-Beitrag (spätestens 31.01.2027) erscheint; der Zeitstempel bleibt der Commit.
- **E6.** Beim Datenstand des SAP (23.10.2026) zum Satz neu prüfen: Teilfreigabe → Einfrieren der übrigen Teile; V2-Variante (a)/(b); mögliche Umstellung auf Stationsliste, falls die DWD-Reihe fehlt (SAP 3.2).
- **E7.** Das Kapitel nennt die Zielgröße „Hitzetage“; DWD nennt „Heiße Tage“. Einmal gleichsetzen („Hitzetage, in der DWD-Sprache ‚Heiße Tage‘“).

## 6. Nicht geprüft / Vorbehalte

- **Git:** Reflog gelesen, aber kein `git diff`/`git show`; ob `Prognose-Register/01_…md` und der SAP seit den genannten Commits unverändert sind, wurde nicht per Diff geprüft. Git-Status zu Sitzungsbeginn war gekürzt, nicht committete Dateien zum Prognose-Check sind daher nicht ausgeschlossen.
- **SAP Register 2027:** Abschnitte 0–3, 5–12 gelesen; Abschnitt 13 (Rohdateien) und das Ende von 12 nicht. **SAP Prognose-Check:** nur Zeilen 1–150.
- **Gas-Analyse:** SAP nur im Kopf (Zeilen 1–60), Analysebericht und Validierungsbericht vollständig. Skript `gasspeicher-winter-2026.py`, Rohdaten, Eurostat- und DWD-Originale nicht geöffnet. Ob die offene Auflage im Validierungsbericht in einer weiteren Datei erledigt ist, konnte ohne Dateiliste nicht ausgeschlossen werden (drei Dateien der Gas-Analyse gelesen).
- **Kapitel 4 und 8:** nur auf die Verweise geprüft (Kap. 4 Entwurf).
- **Stil, Wortzahl (Ziel 1.000–1.400), Leseniveau, Rechtschreibung** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A14 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. Zum Stichtag 15.11.2026: SAP-Stand (Einfrieren V1/V2/V4, V2-Variante), Stand des Prognose-Checks (`run_log.txt`, Validierungsbericht) und Erscheinungstermin neu abgleichen; Kapitelkopf (Fristen nicht verschärfen, kein Zahlenwert für 2027) erneut kontrollieren.
3. Abstimmung mit Kap. 4 (Zirkelverweis, Aussage zum Prognose-Check) und Kap. 7 (Rohdaten-Aussage).
4. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (14 Auflagen, 7 Empfehlungen). Kein Punkt ist „kritisch“. Zur Prüffrage des Auftrags: (1) Alle Angaben zu Eintrag #1 stimmen mit Registerdatei und Analysebericht überein (V1, V2, 69–230 TWh, rund 150 TWh, 4,21 °C, 3,75–6,18 °C, 22.10.2026, Mai/Juni 2027, 60,5 %). Die als „geplant“ gekennzeichneten Angaben zum Register 2027 stimmen mit dem SAP (Stand 23.10.2026) überein in: vier Zielgrößen, Daten bis Ende 2026, Sperre für 2027er Beobachtungen einschließlich Copernicus, Registrierungsfristen 15.01./31.01.2027, „nur zum Teil eingefroren“; sie weichen ab oder sind unvollständig bei: fehlender Sperre 2 b (Prognose-Check, A3), „ab September 2027 bis März 2028“ (A4), „Ergebnis auf Substack“ (A5), fehlenden Pflichthinweisen des SAP (A11). (2) Fristen sind nicht verschärft; die einzige mögliche Verschärfung ist „bis März 2028“ bei den Auswertungsterminen. (3) Es steht kein Zahlenwert für 2027 im Text. (4) Die Erklärung „95-Prozent-Intervall“ ist als Definition richtig, aber ohne die im SAP genannten Einschränkungen (A13). (5) „Kein validiertes Ergebnis zum Redaktionsschluss“ ist für den Stand 22./24.10.2026 durch `run_log.txt` und Git-Reflog belegt, als Aussage über den 15.11.2026 aber nicht (A2). Gewichtigste weitere Befunde: Rahmung des Prognose-Checks als Maßstab der eigenen Vorhersagen im Widerspruch zu SAP Sperre 3 (A1); „zu eng oder zu optimistisch“ im Widerspruch zum SAP und zum Kapitel selbst (A6); „validierte Analyse“ trotz offener Auflage im Validierungsbericht (A10); Git-Zeitstempel überzeichnet (A9). Keine neue Berechnung im Kapitel.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*

---

## Nachtrag 1: Differenzprüfung der eingearbeiteten Auflagen (26.10.2026)

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/10-prognose-register.md` in der Fassung nach Commit 3045f3f (Auflagen A1–A14 laut Commit-Meldung eingearbeitet; Datei am 26.10.2026 vollständig neu gelesen). Zeilenangaben „Z.“ beziehen sich auf diese neue Fassung. Kapitel nicht verändert.
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Kapitels). **Dieser Nachtrag enthält keinen Freigabevermerk.**
**Dafür neu gelesen:** `Analysen/2026-10-prognose-register-2027/SAP_prognose-register-2027.md` (Kopf, Abschnitt 0, 0.1 mit Fristentabelle, Sperren 1 bis 3, Registrierung, 2.1 bis 2.4, 1); `Analysen/2026-10-prognose-check-projektionsberichte/SAP_…md` (Kopf, 1, 5.1.1, 8.1); `…/run_log.txt` (Abschnitt 5, Laufprotokoll); `Analysen/2026-09-gasspeicher-winter/Validierungsbericht_gasspeicher-winter-2026.md` (vollständig); Reflog `.git/logs/HEAD` Zeilen 96–155; Kapitel 2 (Kopfzeile), 4 und 7 (aktuelle Fassungen).
**Grenzen:** Keine Shell; `git diff` für Eintrag #1 nicht ausführbar. SAP Register 2027 Abschnitte 8.3 und 8.4 (Pflichthinweise) wurden diesmal nicht erneut gelesen; sie stützen sich auf Nr. 30 und 31 der Erstprüfung.
**Skala:** umgesetzt / teilweise / nicht umgesetzt. Spalte „Neue unbelegte Aussage?“: ja oder nein, mit Begründung.

### N.1 Auflagen A1 bis A14

| Auflage | Ergebnis | Befund an der neuen Fassung | Neue unbelegte Aussage? |
|---|---|---|---|
| A1 (Z. 56–58, Prognose-Check als verwandter Check) | umgesetzt | Überschrift „Ein verwandter Check: der Prognose-Check“; „Ein verwandter Evidenzcheck schaut zurück … Seine Ergebnisse fließen nicht in die Methoden des Registers ein, er muss aber abgeschlossen sein, bevor drei der vier Vorhersagen für 2027 berechnet werden dürfen.“ Deckt sich mit SAP Register 2027 Sperre 2 (b) (V1, V2, V4 ohne Ausnahme; V3 mit Ausnahme) und Sperre 3 („keine Rückkopplung“). | nein |
| A2 (Z. 58, Stand des Prognose-Checks, Zirkelverweis) | teilweise | „Stand 24. Oktober 2026 liegt kein validiertes Ergebnis vor“ ✓ (run_log Abschnitt 5: Lauf 22.10., 19:23, STOPP nach SAP 3.5.5, keine Fehlermaße; Reflog 96–155: kein späterer Prognose-Check-Commit; kein Validierungsbericht unter dem erwarteten Namen auffindbar). Der Verweis „Wo der Stand weiter ist, findest du in Kapitel 4“ ist entfernt, Kapitel 4 Z. 67 ist angepasst. Die Klammer „[Am 15.11.2026 gegen Laufprotokoll, Validierungsbericht und Freigabe neu prüfen.]“ steht im Buchtext (Entwurfsrest). Offen: Kapitel 4 formuliert weiter „zum Redaktionsschluss dieses Buchs“ (Z. 54) und stellt den Prognose-Check mit „Ob solche Fortschreibungen taugen …“ als Maßstab für die Trendrechnung dar (Z. 52–53; siehe `faktencheck_kap04.md`, Nachtrag 1, N3 und N4). | nein |
| A3 (Z. 50, Sperre 2 vollständig) | umgesetzt | „Der Plan sperrt die Berechnung, bis er eingefroren ist, bis der Prognose-Check abgeschlossen ist und bis die Daten bis Ende 2026 vorliegen. Beim globalen Temperaturwert gilt für den Prognose-Check eine vorab festgelegte Ausnahme.“ SAP Sperre 2: (a), (b), (c); Ausnahme nur für V3 (Rückfrage 8, Option a). Fristen unverändert. | nein |
| A4 (Z. 50, Auswertungstermine) | umgesetzt | „Die Stichtage der Auswertung liegen zwischen dem 15. September 2027 und dem 31. März 2028.“ SAP Fristentabelle: Stichtag der Auswertung V1 15.09.2027, V2 und V3 31.01.2028, V4 31.03.2028. | nein |
| A5 (Z. 52, Kanal) | umgesetzt | „Die Registrierung erscheint spätestens am 31. Januar 2027 in einem gemeinsamen Beitrag auf Substack. Die Auswertung veröffentlichen wir unabhängig vom Ausgang.“ SAP: gemeinsamer Substack-Beitrag spätestens 31.01.2027 (Rückfrage 19). Für die Auswertung legt der SAP den Kanal nicht fest; das Kapitel legt ihn nicht fest. | nein |
| A6 (Z. 71, „zu eng oder zu optimistisch“) | umgesetzt | „Ein einzelner Fehltreffer sagt noch nicht, ob das Modell schlecht ist; das lässt sich erst über mehrere Jahrgänge beurteilen.“ (SAP 1 Nr. 3, 7). | nein |
| A7 (Z. 69, „nie widerlegen“) | umgesetzt | „Eine Vorhersage ohne Bewertungsregel und ohne Stichtag lässt sich nicht prüfen. Misstraue ihr.“ | nein |
| A8 (Stichtag, Termin bei Eintrag #1) | teilweise | Z. 4 „Zeitpunkt der Auswertung“ ✓; Z. 13 „den Stichtag der Auswertung (bei Eintrag #1: sobald Eurostat die Werte liefert)“ ✓; Z. 75 „voraussichtlich im Mai oder Juni 2027, sobald Eurostat die Werte bis März 2027 veröffentlicht“ ✓ (Register #1). Z. 18 behält „mit festem Stichtag“, was für Eintrag #1 nicht gilt und Z. 13 widerspricht. Das Glossar nennt „Stichtag“ ohne diese Einschränkung. | nein |
| A9 (Z. 14, Git-Commit) | umgesetzt (Text), Vorprüfung offen | „Der Git-Commit hält fest, wann der Eintrag angelegt wurde. Spätere Änderungen wären in der öffentlichen Versionsgeschichte sichtbar.“ Die geforderte Vorprüfung `git diff 93a0d3f -- Prognose-Register/01_gasspeicher-winter-2026-27.md` konnte ich ohne Shell nicht ausführen; sie bleibt vor Satz offen. | nein |
| A10 (Z. 24 und Z. 79, „Validierung“) | teilweise | Z. 24: „mit eingefrorenem Analyseplan und unabhängiger Prüfung [1][2]. Bei der Prüfung stand ein Abgleich der Temperaturwerte mit den Originaldateien noch aus. [Entscheidung Daniel Saure: Erledigung als Datei nachweisen oder so stehen lassen.]“ ✓ (Validierungsbericht, Abschnitt „Offene Auflage vor Veröffentlichung“). Z. 79 sagt weiter „aus der Registerdatei und der validierten Analyse“. Der Validierungsbericht enthält weiterhin keinen Nachtrag zur Erledigung; Kapitel 2 hält fest: „DWD-Abgleich … nicht als erledigt dokumentiert“. | ja (Z. 79 „validierten Analyse“ trotz offener Auflage, siehe N.2, N1) |
| A11 (Z. 54, Pflichthinweise) | umgesetzt (mit Hinweis) | „Bei den Hitzetagen zählt das Flächenmittel für Deutschland, keine einzelne Messstation. Bei den Monaten über 1,5 °C sagen Monatswerte nichts über die Pariser 20-Jahres-Grenze. Bei den Treibhausgasemissionen geht es um die Zahl ohne Landnutzung (laut UBA-Vorjahresschätzung). Alles ist geplant.“ Inhaltlich nach SAP 8.3, 8.4 und 2.4; Einschränkungen siehe N.2, N2 und N3. | ja (N2: „sagen nichts“ stärker als SAP 8.4) |
| A12 (Z. 4, „Viele“) | umgesetzt | „Vorhersagen lassen sich hinterher zurechtbiegen.“ | nein |
| A13 (Z. 16, Intervall) | umgesetzt | „Ein 95-Prozent-Prognoseintervall heißt: Wenn das Modell stimmt und sich nichts Grundlegendes ändert, liegt der Wert in 19 von 20 Fällen darin. Sprünge wie ein Vulkanausbruch oder eine Energiekrise sind in diesem Bereich nicht enthalten.“ (SAP 5.4, 8.1; wörtlich nach Änderungsvorschlag.) | nein |
| A14 (Z. 64, „Daten“) | umgesetzt | „Analysepläne, Programme und Ergebnisse liegen unter `Analysen/`; die Rohdaten für das Register 2027 kommen mit dem Registrierungs-Commit dazu.“ SAP: Rohdaten erst mit dem Registrierungs-Commit (Commit-Regel, Rückfrage 21). Mit Kap. 7 Z. 82 abgestimmt (dort ohne Rohdaten). | nein |

Empfehlungen E1 bis E7: E2 (Eintrag #1 besteht aus zwei Teilvorhersagen) ist teilweise erfüllt (Z. 4 „Eine Vorhersage ist registriert“ bleibt; im Eintragsabschnitt V1 und V2 getrennt); die übrigen unverändert offen.

### N.2 Neue und fortbestehende Befunde

| Nr. | Befund | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| N1 | Z. 79: „Die Angaben zu Eintrag #1 stammen aus der Registerdatei und der validierten Analyse.“ Z. 24 benennt die offene Auflage, Z. 79 nicht. | Validierungsbericht Gas (offene Auflage); Kap. 2 Kopfzeile | Abweichung (gering) | Z. 79 an Z. 24 angleichen („der Analyse mit unabhängiger Prüfung“) oder die Erledigung der Auflage als Datei nachweisen. |
| N2 | Z. 54: „Bei den Monaten über 1,5 °C sagen Monatswerte nichts über die Pariser 20-Jahres-Grenze.“ SAP 8.4 verlangt (laut Erstprüfung Nr. 31) den Hinweis, dass einzelne Monate oder deren Anzahl nicht bedeuten, dass die Pariser Grenze überschritten ist. Kap. 6 und Kap. 7 (Frage 2) sagen: ein Monat sagt viel darüber, wie warm es gerade ist. | SAP Register 2027 8.4; Kap. 6, Kap. 7 | Abweichung (gering) | „sagen nichts“ ist stärker als der SAP. Vorschlag: „sagen für sich allein nicht, ob die Pariser 20-Jahres-Grenze überschritten ist“. |
| N3 | Z. 54: Zielgröße 4 „ohne Landnutzung (laut UBA-Vorjahresschätzung)“. SAP 2.4: gesamt ohne LULUCF, ohne internationalen Luft- und Seeverkehr, wie in der UBA-Vorjahresschätzung ausgewiesen. | SAP Register 2027 2.4 | Abweichung (gering) | „ohne internationalen Luft- und Seeverkehr“ fehlt; „laut UBA-Vorjahresschätzung“ liest sich wie Quelle der Zahl, nicht als Definition. Zielgrößen 1, 2 und 4 sind weiter Entwurf (draft). |
| N4 | Z. 50: Die Ausnahme für den Prognose-Check wird ohne ihre Bedingung genannt (V3 darf gerechnet werden, wenn der Prognose-Check am 12.01.2027 nicht abgeschlossen ist). Außerdem steht „Beim globalen Temperaturwert“ zweimal direkt hintereinander. | SAP Register 2027 0.1 | Abweichung (gering) | Kein Fristenfehler (15.01./31.01.2027 stimmen); Verkürzung und Redundanz. |
| N5 | Z. 18 „mit festem Stichtag“ gilt nicht für Eintrag #1 (siehe A8). | Register #1; SAP 0.1 | Abweichung (gering) | Streichen oder „mit festem Stichtag (bei #1: Eurostat-Veröffentlichung)“. |
| N6 | Z. 2 (Kopfzeile) und Quelle [4]: SAP Register 2027 „Stand 23.10.2026, Teilfreigabe V3“. Im Reflog bis 26.10. folgt kein weiterer SAP-Commit (letzter: 0ee0b6e, 23.10.). | Reflog Zeile 120 | bestätigt | Am Stichtag 15.11. erneut abgleichen. |
| N7 | Z. 79 und Z. 24: Aussage „… eingefrorenem Analyseplan und unabhängiger Prüfung“ ist gedeckt (zwei Prüfrunden, beide zunächst „nicht veröffentlichungsreif“). | Validierungsbericht Gas | bestätigt | |

### N.3 Neue Berechnung, Zahlen für 2027 und Fristen

Kein Zahlenwert für 2027 im Text; keine neue Berechnung; Fristen (15.01./31.01.2027; Stichtage 15.09.2027 bis 31.03.2028) nicht verschärft und gegen die SAP-Fristentabelle bestätigt. Alle Angaben zu 2027 sind weiter als „geplant“ gekennzeichnet („nur zum Teil eingefroren“, „Alles ist geplant“).

### N.4 Gesamturteil zum Nachtrag

**ok mit Auflagen, unverändert.** Von 14 Auflagen sind 11 umgesetzt (A1, A3 bis A7, A9 [Text], A11, A12, A13, A14), 3 teilweise (A2, A8, A10). Kein Punkt ist „kritisch“. Fristen, „geplant“-Angaben und das Fehlen von 2027-Werten sind bestätigt; das Verhältnis Prognose-Check / Register ist jetzt SAP-konform. Vor Freigabe zu klären: A10 und N1 (offene Auflage im Gas-Validierungsbericht, Z. 79), A2 (Abstimmung mit Kapitel 4, Z. 52–54), A8 und N5 (Stichtag bei #1), N2 und N3 (Pflichthinweise nach SAP), die Vorprüfung per `git diff` (A9), die Entwurfsklammern in Z. 24 und Z. 58 sowie die Stichtagsprüfung am 15.11.2026. Kein Freigabevermerk; die Freigabe bleibt Sache von Daniel Saure.
