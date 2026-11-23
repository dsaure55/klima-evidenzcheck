# Validierungsbericht – Kältewinter wie 2010

**Bezug:** SAP_kaeltewinter-2010.md v1.0 final (Commit 2a2353e, 23.11.2026 20:52 MEZ)
**Geprüfter Analysestand:** Commit e168266 (23.11.2026 21:14 MEZ): `kaeltewinter-2010.R`,
`output/`, `run_log.txt`, `rohdaten/`, `Analysebericht_kaeltewinter-2010.md`,
`Abweichungsprotokoll_kaeltewinter-2010.md`
**Prüfer:** Claude (validator-Subagent), unabhängig; hat weder SAP noch Skript verfasst
**Datum:** 23.11.2026
**Arbeitsweise:** Eigene Nachrechnung in R 4.6.1 mit eigenem Code (eigener Parser der
DWD-Rohdateien, OLS per Matrixalgebra, eigene Parametersimulation). Zusätzlich das
Analyse-Skript in einer Scratch-Kopie neu ausgeführt (`KW_NO_RUNLOG=1`). Im Analyseordner
wurde nichts verändert außer dem Anlegen dieser Datei. Kein Commit, kein Freigabevermerk.

Befundklassen: **kritisch** (Gate gesperrt) / **hoch** / **mittel** (beide = „wesentlich“
im Sinne von SAP 12 Nr. 13) / **gering**.

---

## 1. Gesamturteil

**Bestanden mit Auflagen. Kein Befund „kritisch“, kein Befund „hoch“.**

Alle Primärzahlen (E1, E2), S14 und die Diagnostik habe ich unabhängig exakt
nachgerechnet. Der Analyselauf ist bitidentisch reproduzierbar. Datenschnitt und Trennung
vom Prognose-Register sind eingehalten. Die Umschaltregel 5.3 ist korrekt angewendet.
Die Auflagen betreffen die Vollständigkeit der Pflichtinhalte im späteren Bericht, die
Transparenz einer Auslegung (S9b), die die Spannbreiten-Aussage bestimmt, und
Dokumentationslücken (Lizenzfeld). Keine Auflage verlangt eine neue Rechnung.

Das Gate „Validierungsbericht ohne kritisch“ (SAP 11) ist formal erfüllt. Ich empfehle
trotzdem, Auflagen V-1 bis V-3 vor der Formulierung der Kernaussagen umzusetzen und dies
in einem Nachtrag zu dieser Datei nachzuprüfen (CLAUDE.md, Dokumentationspflicht).

## 2. Ampel je Prüfpunkt (Validator-Checkliste)

| Nr. | Prüfpunkt | Ampel |
|---|---|---|
| 1 | SAP-Konformität | Abweichung (nur gering, alle gekennzeichnet; S9b-Auslegung mittel) |
| 2 | Diagnostik | bestanden |
| 3 | Mehrfachtestung / Cherry-Picking | bestanden (Hinweis zu S9b/Spannbreite, V-2) |
| 4 | Rechenprüfung | bestanden (exakte Übereinstimmung) |
| 5 | Limitationen im Bericht sichtbar | Abweichung (mittel, V-1) |
| 6 | Rundung / Darstellung | Abweichung (gering, V-5) |

## 3. Validierungsplan SAP 12, Punkt für Punkt

| SAP 12 | Prüfung | Ergebnis |
|---|---|---|
| 1 SAP-Status | SAP-final-Commit 2a2353e 20:52:02 MEZ; DWD-Download 21:02:42 MEZ (20:02:42Z), OWID-Download 21:04:15 MEZ, Analyselauf 21:11:07 MEZ, Analyse-Commit 21:14:45 MEZ. SAP zwischen 2a2353e und e168266 unverändert (`git diff` leer). | bestanden |
| 2 INES-Definition | 3.3 im eingefrorenen Text mit Fundstelle und Wortlaut; `quellen/INES_PM_2026-11-10.html` und `quellen/INES_Dokumentation_November-Update_2026.pdf` mit dem Freeze-Commit 2a2353e eingecheckt, also vor dem Datenzugriff. JFM primär und S14 passen zur Einordnung in 3.3. | bestanden |
| 3 Rohdaten | SHA-256 aller 7 DWD-Dateien und beider OWID-Dateien von mir neu berechnet: alle identisch mit `run_log.txt`. Download 23.11.2026, also vor dem 31.12.2026 (R6). Download durch Top-Level-Session statt Daniel Saure: siehe A1b. | bestanden (Hinweis A1b) |
| 4 Datenschnitt | Filter im Skript direkt nach dem Einlesen (Z. 109, 127, 140), vor der ersten Ausgabe; Abbruch per `stop()`, falls verletzt (Z. 240). Geprüft: `arbeitsdaten_…csv` endet mit 2026-03; alle Jahres-CSV und `owid_vergleich_jfm.csv` enden mit 2026 (= Jan.–Mär. 2026 bzw. Winter bis Mär. 2026); `check_3-5-3` endet 2026-03. Volltextsuche in allen CSV/JSON, `console_log.txt`, `run_log.txt`, Bericht, Abweichungsprotokoll nach Okt.–Dez. 2026 und 2027: Treffer nur Zeitstempel und OWID-`lastUpdated` (2026-11-11), keine Messwerte. Kein U₂₀₂₇ berechnet. Grafiken gesichtet: Grafik 1 endet mit 2026, für 2027 nur das Trendniveau (Kreuz, als „kein Messwert“ beschriftet). Die rohe OWID-Datei enthält wie erwartet spätere Werte (für DEU 7 Zeilen Apr.–Okt. 2026 verworfen); sie gelangen in keine Ausgabe. | bestanden |
| 5 Nachrechnung E1/E2 | siehe Abschnitt 4 | bestanden |
| 6 Nachrechnung S14 | siehe Abschnitt 4 | bestanden |
| 7 Diagnostik, Umschaltregel | Ljung-Box(5) Q = 5,149, p = 0,398; Shapiro-Wilk W = 0,9679, p = 0,141 (unabhängig reproduziert). Beide ≥ 0,05 → laut Tabelle 5.3 **M1**. Skript wählt M1. | bestanden |
| 8 Simulationen | `set.seed(20261123)` einmal am Skriptanfang (Z. 78), B = 10 000, RNG-Art fixiert. Mittel der P*_b 0,03281 vs. t-prädiktiv 0,03305 (Differenz 0,02 Pp, ≤ 0,5). Eigene, unabhängig implementierte Simulation: Seed 20261123 [0,00479; 0,10131], Seed 1 [0,00513; 0,10067], Seed 987654 [0,00474; 0,09843] gegenüber gemeldet [0,00481; 0,09948]: max. Abweichung der Grenzen 0,18 Pp (≤ 1 Pp). S14 mit Seed 42: [0,00013; 0,01699] gegenüber [0,00013; 0,01729]. Erneuter Lauf des Analyse-Skripts: alle 10 CSV/JSON-Ergebnisdateien bitidentisch. | bestanden |
| 9 Vollständigkeit | S1, S2, S6–S10, S12–S14 berichtet; S3, S4, S5, S11 mit Vermerk „entfallen per SAP v0.2“ und Grund in Tabelle 2 und im Bericht. Keine Tagesdaten im Analyseordner. Alle fünf E1-Teilzeiträume berichtet. | bestanden |
| 10 Integritäts-Checks | 3.5-1 bis 3.5-4 durchgeführt, Ergebnisse im `run_log.txt`. 3.5-2 nicht bestanden, siehe A9. 3.5-3 (Abgleich Gasspeicher-Datei, 78 Monate, 0 Abweichungen) bestanden. | bestanden (A9 dokumentiert) |
| 11 Trennung Register | `git diff 2a2353e e168266 --stat`: alle 29 geänderten Dateien liegen in `Analysen/2026-11-kaeltewinter-2010/`. Keine Änderung in `Prognose-Register/`, `Analysen/2026-10-prognose-register-2027/`, `Analysen/2026-09-gasspeicher-winter/`, `SAP-Vorlage/`; auch keine uncommitteten Änderungen dort. Bericht nennt Eintrag #1 nicht. R7-Bestätigung: im Freigabevermerk des SAP-Kopfs dokumentiert (die Einfrierfrage nannte R7 ausdrücklich, Antwort „Gelesen, einfrieren“). Daher habe ich den Registereintrag nicht gelesen. | bestanden (Hinweis G-6) |
| 12 Formulierungen | Pflichtformulierungen aus SAP 11 vorhanden (8.1 einschließlich S14-Hinweis, 8.2, 8.3, INES-Fundstelle, Kombinationszeitraum). Keine ausgeschlossene Formulierung aus 8.2, keine Gasbilanzaussage. S14 ausdrücklich als Sensitivität, nicht als Hauptergebnis. Es fehlen aber Inhalte, die SAP 8 und 9 für „den Bericht“ vorschreiben: siehe V-1. | Abweichung (mittel) |
| 13 Abweichungen | A1–A13 sind als Post-hoc oder Auslegung gekennzeichnet und begründet; Bewertung in Abschnitt 5. | bestanden |

## 4. Unabhängige Nachrechnung (eigener Code)

Eigener Parser (Feld 19 = „Deutschland“, Kopfzeile geprüft), Datenschnitt ≤ 2026-03 vor
jeder Ausgabe. 873 Monatswerte, 0 NA, Bereich −9,62 bis 12,52 °C.

| Größe | Validator | Analyse | Übereinstimmung |
|---|---|---|---|
| T_ref (JFM 2010) | 0,033889 °C | 0,0339 | ja |
| E1 k₁ / n | 35 / 145 | 35 / 145 | ja |
| h₁, Clopper-Pearson | 0,2414 [0,1743; 0,3194] | identisch | ja |
| Jahresliste, letztes vor / erstes nach 2010 | identisch; 2006 / 2013 | identisch | ja |
| Rang 2010 | 35 von 146 | 35 | ja |
| Teilzeiträume | 16/50, 8/30, 8/30, 3/29, 2/29, CP identisch | identisch | ja |
| M1 b̂₀ / b̂₁ | −73,90951 / 0,038076 | identisch | ja |
| σ̂ (n−2), h₂₀₂₇, ŷ₂₀₂₇ | 1,6657 / 0,07338 / 3,2709 | identisch | ja |
| **P̂₂₀₂₇ (M1)** | **0,03305**, Wiederkehr 30,3 Jahre | 0,03305 | ja |
| z-Residuum 2010, Rang | −1,555, Rang 7 | identisch | ja |
| M1-AR φ̂, σ_e, ŷ₂₀₂₇, P (eigener gls-Fit) | 0,2211 / 1,5940 / 3,1650 / 0,03186 | identisch | ja |
| M1-Boot Punktwert | 3/56 = 0,05357 | identisch | ja |
| T_ref^S14 (30/31/31/28/31, /151) | 0,214503 °C | 0,2145 | ja |
| S14 E1 n = 145 | k = 21, [0,0919; 0,2128] | identisch | ja |
| S14 E1 ohne 2010/2011 (n = 143) | k = 21, [0,0933; 0,2157] | identisch | ja |
| S14 Rang T_ref^S14 | 22 von 146 | 22 | ja |
| **S14 E2 (Schätzer M1, Fenster 1971–2026)** | **P = 0,00363**, Wiederkehr 275 Jahre | identisch | ja |
| 3.5-2 gewichtet / ungewichtet | max. 0,1878 K, 52 > 0,05 / max. 0,0033 K, 0 > 0,05 | identisch | ja |
| OWID: Zeitraum, n, r, Rang 2010 | 1940–2026, 87, 0,9959, DWD 19 / OWID 19 | identisch | ja |

S14-Details geprüft: U_t nutzt Nov./Dez. des Vorjahres; Februar-Gewicht 29 in
Schaltjahren (im Skript Funktion `dfeb`, bei mir eigene Funktion, beide mit 400er-Regel);
T_ref^S14 mit 28 (2010 kein Schaltjahr); E1 ohne Ausschluss plus Zusatzwert ohne
2010/2011; E2 mit dem Primärschätzer M1 ohne eigene Umschaltung. Wie SAP 2.5 verlangt.

Wiederkehrzeit-Rundung geprüft (z. B. 207,8 → 210; 7869,9 → 7870; 18,7 → 19): korrekt
nach SAP 11.

## 5. Bewertung der Abweichungen A1–A13

| Nr. | Bewertung | Begründung |
|---|---|---|
| A1 | zulässig | Reine Ablage; Prüfsummen gültig. |
| A1b | zulässig, Post-hoc korrekt gekennzeichnet | Prozedurale Abweichung von SAP 3.1/13. Die Entscheidung von Daniel Saure ist im run_log mit Wortlaut zitiert und liegt zeitlich nach dem Einfrieren und vor dem Datenzugriff. Den Chat kann ich nicht einsehen; **Daniel Saure sollte den Wortlaut „Du lädst sie“ bestätigen** (Verifikationspflicht CLAUDE.md). |
| A2 | zulässig | Vergleichsdatei existiert nur dort; Gasspeicher-Ordner nachweislich unverändert. |
| A3 | Post-hoc korrekt gekennzeichnet; **gering** | (a) Download durch den analyst statt Daniel Saure, im Auftrag der Top-Level-Session; R9 regelt nur „aufnehmen, falls vorhanden“, nicht die Person. Prozedural, ohne Wirkung auf Ergebnisse. (b) Konsolen-Anzeige eines OWID-Werts Afghanistan Okt. 2026: SAP 2.4 b (ii) verbietet Werte ab Okt. 2026 in **Ausgabedatei, Grafik oder Logzeile**; eine Arbeitskonsole beim Download ist keine davon. Zweck der Regel ist, den deutschen Winter 2026/27 nicht zu sichten und Sperre 1 nicht zu berühren. Ein Wert für Afghanistan trägt dazu keine Information bei. Kein solcher Wert steht in einer Datei (von mir geprüft). Dass kein Deutschland-Wert angezeigt wurde, ist eine Aussage des analyst, die ich nicht prüfen kann. (c) Die beiden Fehlabrufe wurden gelöscht, nicht archiviert. Das ist vertretbar, weil sie nicht verwendet wurden, aber nicht mehr nachprüfbar. Handlungsbedarf besteht nicht, die Transparenz ist gegeben. |
| A4 | Post-hoc korrekt gekennzeichnet; S9a zulässig; **S9b mittel** (V-2) | S9a: Parametersimulation analog 5.4, plausibel. S9b: Der empirische Anteil 1997–2026 zählt das Referenzjahr 2010 selbst mit. Es erfüllt T ≤ T_ref zwangsläufig und hebt den Anteil von 2/29 (6,9 %) auf 3/30 (10 %). Das widerspricht der Logik, mit der dieselbe Analyse 2010 aus E1 (2.1) und bei S1/S2 (A6) ausschließt. Ergebnisrelevant: S9b bestimmt das Maximum der vorab festgelegten Spannbreiten-Aussage (10 % statt 9 % bei S6). Die Aussage „vor Sichtung der Ergebnisse festgelegt“ ist nicht prüfbar. Der Wert 2/29 steht bereits in Tabelle 1 (Teilzeitraum 1997–2026); A11 legt den Effekt offen. |
| A5 | zulässig (Auslegung) | SAP 2.0: „T_y wird ungerundet weiterverwendet“, gerundet wird nur für den Vergleich „mindestens so kalt“. Effekt auf P̂ < 0,02 Pp. |
| A6 | zulässig (Auslegung) | Der Ausschluss des Referenzwerts folgt 2.1. SAP 2.5 begründet den Nicht-Ausschluss bei S14 gerade damit, dass dort kein identischer Zeitraum existiert. Für S1/S2 existiert er. Konsistent. |
| A7 | zulässig (Auslegung) | Delta-Methode geprüft: dφ/dθ = (1−φ²)/2, d log σ_e/dθ = −φ/2, d log σ_e/d log σ_u = 1, korrekt für die nlme-Parametrisierung. Punktschätzer wörtlich nach 5.3, von mir reproduziert. Betrifft nur S10. |
| A8 | zulässig, ohne Wirkung | Primärschätzer ist M1; die Auslegung greift nicht. |
| A9 | Post-hoc korrekt gekennzeichnet; **zulässig, gering** | SAP 3.5 Nr. 2 verlangt bei Überschreitung „dokumentieren“, keinen Stopp; einen Stopp gibt es nur bei 3.5 Nr. 1. Beide Vergleiche habe ich unabhängig reproduziert: tagesgewichtet max. 0,188 K (52 Winter > 0,05 K), ungewichtet max. 0,0033 K (0 Überschreitungen). Die Abweichung entsteht also vollständig durch eine Annahme in der SAP-Prüfvorschrift (sie setzt stillschweigend eine gewichtete DWD-Winterdatei voraus). Ein Datenfehler liegt nicht vor. Der Zweck des Checks ist erfüllt: Der ungewichtete Vergleich schließt Übertragungs- oder Lesefehler der Monatswerte aus. Richtig ist, dass der Status „nicht bestanden“ nicht umetikettiert wurde und S1 nach SAP tagesgewichtet bleibt. Aus Validator-Sicht genügt die Dokumentation. Die erbetene Bestätigung durch Daniel Saure ist sinnvoll, aber keine Voraussetzung. Folge für die Kommunikation: Die S1-Werte (DJF tagesgewichtet) weichen um bis zu 0,2 K von den Wintermitteln ab, die der DWD veröffentlicht. Wird S1 zitiert, nicht mit DWD-Winterwerten mischen (G-2). |
| A10 | zulässig | Reine Transparenz; 1883 ist auch ungerundet kälter (0,0336 < 0,0339) und zählt ohnehin. |
| A11 | Auslegung zulässig; zusammen mit A4 **mittel** (V-2) | „Alle durchgeführten E2-Sensitivitäten“ schließt S9b dem Wortlaut nach ein. Der Zusatz „ohne S9b wäre das Maximum 9 %“ ist transparent. Im Bericht darf er aber nicht als alternative, „passendere“ Spannbreite erscheinen (SAP 7). |
| A12 | zulässig, gering | `lowess` statt `loess`, nur in der Diagnostikgrafik. |
| A13 | zulässig | `stats::binom.test` und die eigene MBB-Funktion erlaubt SAP 10 ausdrücklich. MBB geprüft: Startpunkte 1…54, Blocklänge 3, 19 Blöcke, auf 56 gekürzt. Korrekt. |

## 6. Befunde

### kritisch
keine

### hoch
keine

### mittel

**M-1 Pflichtinhalte aus SAP 8 und 9 fehlen im Analysebericht.** SAP 8 schreibt für „den
Bericht“ vor: INES vertritt Speicherbetreiber (sachlich, ohne Motivzuschreibung); ein
Kälteszenario ist in einer Risikorechnung methodisch üblich, unabhängig von seiner
Wahrscheinlichkeit; der Kombinationscharakter ist keine Kritik. Von den Limitationen in
SAP 9 nennt Abschnitt 7 des Berichts nur Monatsmittel und Tagesdaten und verweist im
Übrigen pauschal mit „gelten unverändert“. Folgende Limitationen sind nicht sichtbar:
geringere Stationsdichte vor 1951, die begrenzte Grundlage n = 56 für die linke Flanke,
das Referenzjahr als Punktdefinition und dass die INES-Einordnung nur von der
Top-Level-Session geprüft wurde. Fundstelle: `Analysebericht_kaeltewinter-2010.md`,
Abschnitt 7. → Auflage V-1.

**M-2 S9b zählt das Referenzjahr mit und bestimmt damit das Maximum der Spannbreite.**
Details siehe A4/A11. Das ist kein Rechenfehler und als Auslegung offengelegt. Es ist
aber inkonsistent mit 2.1/A6 und ergebnisrelevant für eine vorab festgelegte Aussage.
Fundstelle: `kaeltewinter-2010.R` Z. 596 (`e1_count(y9, series$year[w9], T_ref)` ohne
`exclude`), Z. 620 (Spannbreite). → Auflage V-2.

**M-3 Linke Flanke weicht sichtbar von der Normalverteilung ab (Hinweis zur Darstellung,
keine SAP-Abweichung).** Shapiro-Wilk p = 0,14 liegt korrekt über der Umschaltschwelle;
nach der Regel bleibt M1 primär. Der Q-Q-Plot (`output/diagnostik_M1.png`) zeigt aber die
etwa 6 bis 8 kältesten Residuen deutlich unter der Normallinie, die Schiefe beträgt
−0,51. Genau diese Flanke bestimmt P̂. Die Bootstrap-Schätzer (S10) liefern 5 % statt
3 %. SAP 5.2 nennt diese Möglichkeit ausdrücklich als fachlich relevant. Das
Primärergebnis bleibt nach SAP gültig. Der Text darf die 3 % aber nicht ohne Spannbreite
stehen lassen und muss sagen, dass das Normalmodell kalte Extreme eher knapp schätzen
kann. → Auflage V-3.

### gering

**G-1 Lizenzfeld DWD fehlt in `run_log.txt`** (offene Rückfrage des analyst). SAP 3
verlangt, die Lizenz beim Download nach aktueller DWD-Nutzungsbedingung zu bestätigen und
in `run_log.txt` zu spiegeln. Zugriffsdatum und Datenstand („erstellt am“) sind
vorhanden, die Lizenzangabe fehlt. Keine Wirkung auf Ergebnisse. → Auflage V-4.

**G-2 A9 / Vergleichbarkeit von S1:** siehe Abschnitt 5. Hinweis für die Kommunikation.

**G-3 Rundung im Analysebericht.** SAP 11 verlangt Temperaturen auf 0,1 °C. Davon weicht
der Bericht ab: σ̂ „1,67 K“ (4.1), Residual-SD „1,86 / 1,44 K“ (4.2), „SD 1,65 K“ (S8),
„SD 1,47 K“ (S9a). Wahrscheinlichkeiten und Wiederkehrzeiten sind korrekt gerundet. Die
CSV-Dateien dürfen ungerundet bleiben. → Auflage V-5.

**G-4 Durbin-Watson p = 0,031.** Er ist korrekt als „nur Information“ geführt und nicht
umschaltrelevant (5.3 knüpft nur an Ljung-Box an). Er deutet auf eine schwache
Lag-1-Autokorrelation hin (ACF₁ = 0,22, φ̂ = 0,22). Das ist unkritisch, weil M1-AR (S10)
praktisch dasselbe liefert (3,2 % vs. 3,3 %). Empfehlung: Diesen Satz in den Bericht
aufnehmen, damit der signifikante DW-Wert nicht unkommentiert bleibt.

**G-5 Grafiken:** Umlaute sind ersetzt („Maerz“, „waermer“, „Flaeche“). Für die
Veröffentlichung korrigieren. Inhaltlich entsprechen die Grafiken SAP 11 (Grafik 1:
Trend bis 2027, T_ref-Linie, Hervorhebung; Grafik 2: Fläche ≤ T_ref,
Pflichtbeschriftung).

**G-6 Veraltete Textstellen im eingefrorenen SAP (nicht vom analyst zu verantworten).**
Abschnitt 0 („Einfrieren steht noch aus“), 2.4 b samt Fazit („Durch Daniel Saure zu
bestätigen beim Einfrieren“), 14 (R7/R11) und 14.3 führen R7 und R11 noch als offen. Der
Freigabevermerk im Kopf dokumentiert beide als erledigt. Ein Amendment ist nicht nötig,
maßgeblich ist der Vermerk. In einer künftigen Version sollte das bereinigt werden.

**G-7 Transparenz in eigener Sache (validator).** Beim Prüfen der Dateistruktur
(`tail regional_averages_tm_10.txt`, auf 60 Zeichen gekürzt) wurden mir die Werte für
Oktober 2026 von fünf Bundesländern angezeigt (Brandenburg/Berlin, Brandenburg,
Baden-Württemberg, Bayern, Hessen). Die Spalte „Deutschland“ war nicht sichtbar. Die
Werte wurden nicht verwendet und stehen in keiner Datei. Meine Nachrechnung filtert vor
jeder Ausgabe auf ≤ März 2026.

## 7. Auflagen (an analyst bzw. Top-Level-Session; Umsetzung nicht durch den validator)

| Nr. | Auflage | Adressat | Bezug |
|---|---|---|---|
| V-1 | Analysebericht und später den Veröffentlichungstext um die SAP-8-Pflichtinhalte ergänzen (INES als Verband der Speicherbetreiber, sachlich; Kälteszenario methodisch üblich; Kombination nicht als Kritik) und alle Limitationen aus SAP 9 einzeln ausschreiben statt pauschal verweisen. | analyst / blog-artikel | M-1 |
| V-2 | Keine Neuberechnung und keine nachträgliche Änderung der Spannbreite durch den analyst. In Bericht und Spannbreiten-Satz offenlegen, dass das Maximum (10 %, S9b) das Referenzjahr 2010 selbst mitzählt; ohne 2010 sind es 2/29 = 7 % (steht bereits in Tabelle 1). Ob die Auslegung A4(b) bestehen bleibt, entscheidet Daniel Saure. Jede Änderung als Post-hoc kennzeichnen und beide Varianten berichten. | analyst, Entscheidung Daniel Saure | M-2, A4, A11 |
| V-3 | Kernaussage zu E2 immer mit Unsicherheitsspanne (0,5 bis 10 %) und mit der Spannbreite über die Rechenwege formulieren. Einen Satz zur linkslastigen Residuenverteilung aufnehmen (Bootstrap 5 %), ohne den Primärschätzer zu wechseln. | analyst / blog-artikel | M-3 |
| V-4 | Lizenzangabe DWD nach Prüfung der aktuellen DWD-Nutzungsbedingungen als datierten Nachtrag an `run_log.txt` anhängen (nicht überschreiben). | Top-Level-Session / Daniel Saure | G-1 |
| V-5 | Temperaturangaben im Bericht auf 0,1 °C runden; Umlaute in den Grafiken korrigieren. Reine Beschriftung, keine Rechenänderung: Skript-Änderung als Darstellungsänderung kennzeichnen und neu laufen lassen; die Ergebnisdateien müssen bitidentisch bleiben. | analyst | G-3, G-5 |
| V-6 | Bestätigung durch Daniel Saure zu A1b (Wortlaut „Du lädst sie“) und zu A9 (Dokumentation genügt) im Abweichungsprotokoll vermerken. | Daniel Saure | A1b, A9 |

Nach der Umsetzung: fokussierte Nachprüfung als Nachtrag zu dieser Datei (CLAUDE.md).

## 8. Geprüfte Dateien und Reproduktion

- Eigene Prüfskripte liegen außerhalb des Repos im Scratchpad der Session: unabhängige
  Nachrechnung E1/E2/S14/Diagnostik/3.5-2/Simulation sowie Zusatzprüfung
  M1-AR/Boot/OWID.
- Reproduktion: Skript, `rohdaten/` und Gasspeicher-Vergleichsdatei in ein
  Scratch-Verzeichnis kopiert, dort `KW_NO_RUNLOG=1 Rscript kaeltewinter-2010.R .`
  ausgeführt, Exit-Code 0. Vergleich per `cmp`: `tabelle1_E1.csv`,
  `tabelle2_E2_sensitivitaeten.csv`, `tabelle3_diagnostik.csv`, `ergebnisse.json`,
  `zielgroessen_jahreswerte_1881-2026.csv`, `arbeitsdaten_monatswerte_bis_2026-03.csv`,
  `owid_vergleich_jfm.csv`, `M1_residuen_cooksD.csv`, `check_3-5-2_…csv` und
  `check_3-5-3_…csv` sind bitidentisch. Die Konsolenausgabe ist bis auf den Zeitstempel
  identisch.
- Hinweis: `output/console_log.txt` erzeugt nicht das Skript, sondern die Umleitung der
  Konsole beim Aufruf. Inhaltlich deckt sie sich mit dem run_log-Block.

---

## Nachtrag 1: Nachprüfung der Auflagen (23.11.2026)

**Gegenstand:** Umsetzung der Auflagen V-1 bis V-5 aus Abschnitt 7 dieses Berichts.
**Geprüfter Stand:** Commit a60b58d (HEAD) gegen 5c15e79, Grundlage
`git diff 5c15e79 HEAD -- Analysen/2026-11-kaeltewinter-2010`. Der Commit ändert genau
6 Dateien, alle in diesem Ordner: Analysebericht, Abweichungsprotokoll, Skript,
`run_log.txt`, Grafik 1, Grafik 2. SAP und dieser Validierungsbericht sind unverändert.
**Prüfer:** Claude (validator-Subagent), unabhängig.
**Arbeitsweise:** Diff gelesen, sha256 aller 16 Dateien in `output/` selbst berechnet,
Skript in einer Scratch-Kopie neu ausgeführt (`KW_NO_RUNLOG=1`, R 4.6.1), beide Grafiken
gesichtet, Textstellen 7.1/7.2 wörtlich gegen SAP 8 und 9 abgeglichen,
DWD-Nutzungsbedingungen selbst abgerufen. Außer dem Anhängen dieses Nachtrags habe ich
nichts verändert. Kein Commit, kein Freigabevermerk.

### N1.1 Auflagen im Einzelnen

| Auflage | Ergebnis | Befund |
|---|---|---|
| V-1 (M-1) | **erfüllt** (für den Analysebericht) | 7.1 gibt die SAP-8-Pflichtinhalte fast wörtlich wieder: INES vertritt Speicherbetreiber, ohne Motivzuschreibung; Kälteszenario methodisch üblich, kein Urteil über die Szenariowahl; Kombinationscharakter keine Kritik; Auswahleffekt. 7.2 enthält alle sieben Spiegelstriche aus SAP 9 einzeln und inhaltlich deckungsgleich, auch die vier, die ich in M-1 vermisst hatte. Einzige Ergänzung gegenüber dem SAP-Wortlaut steht in Limitation 2: „Das betrifft vor allem E1 (1881–2026) und S6/S8“. Sachlich richtig, weil diese Rechnungen Werte vor 1951 nutzen, aber nicht vollständig: Auch die E1-Teilzeiträume vor 1951 und die E1-Angaben zu S1, S2 und S14 sind betroffen (gering, N-4). Der zweite Adressat von V-1 („später den Veröffentlichungstext“) bleibt offen, bis ein Artikelentwurf existiert. |
| V-2 (M-2) | **erfüllt** | Abschnitt 5 legt offen, dass S9b das Referenzjahr mitzählt, dass genau S9b das Maximum der Spannbreite bildet, und nennt 2/29 = 7 % mit Verweis auf Tabelle 1 (2/29 = 6,9 %, richtig gerundet). Es wird ausdrücklich gesagt, dass 7 % keine alternative Spannbreite ist. Es gab keine Neuberechnung: Tabelle 2, `ergebnisse.json` und die Spannbreite sind bitidentisch. Die Entscheidung von Daniel Saure zu A4(b) ist korrekt als offener Punkt geführt. Redaktionelle Unstimmigkeit: In Abschnitt 10 des Analyseberichts steht als Ort „Abweichungsprotokoll A4/A11“, die Zeilen A4 und A11 sind aber unverändert (0 gelöschte Zeilen im Protokoll). Die Offenlegung steht nur im Nachtrag des Protokolls. A4 nennt „einschließlich 2010“ schon im Original, die Transparenz leidet also nicht (gering, N-3). |
| V-3 (M-3) | **im Analysebericht erfüllt; für die Veröffentlichungsgrafik offen** (N-1) | Der Lesehinweis in 4.3 nennt die 3 % nur mit der Spanne 0,5 % bis 10 %, erwähnt die Linksschiefe (g₁ = −0,51), den Q-Q-Befund und die Bootstrap-Schätzer (5 %) und verweist auf die Spannbreite über die Rechenwege. Der Primärschätzer wird nicht gewechselt. Formulierung „kann … eher knapp schätzen“, nicht „unterschätzt“: angemessen. Grafik 2: siehe N1.4. |
| V-4 (G-1) | **erfüllt** | `run_log.txt` hat 77 neue Zeilen und 0 gelöschte, wurde also nur ergänzt. Den Lizenz-Nachtrag habe ich gegengeprüft: `Nutzungsbedingungen_German.txt` am 23.11.2026 selbst abgerufen, Wortlaut („Creative Commons BY 4.0 … Stand: Mai 2024“) identisch. Hinweis: Die OWID-Lizenz ist als „zu prüfen“ vermerkt. V-4 hat das nicht verlangt, und OWID-Werte werden nicht veröffentlicht. Vor einer Veröffentlichung, die OWID nennt, trotzdem klären (gering). |
| V-5 (G-3) | **erfüllt** | Rundungen gegen die ungerundeten Werte im run_log geprüft: σ̂ 1,6657 → 1,7; Residual-SD 1,863 / 1,442 → 1,9 / 1,4; S8-SD 1,649 → 1,6; S9a-SD 1,47 → 1,5; Trend 0,381 → 0,4 K/Dekade. Alle korrekt. Ausnahmen: siehe N1.3. |
| V-5 (G-5) | **erfüllt** | Beide Grafiken gesichtet: „März“, „wärmer“, „Fläche“, „Verlängerung“, „für“ werden richtig dargestellt (Skript UTF-8). A14 ist korrekt als Post-hoc-Darstellungsänderung gekennzeichnet. Die Zeilen A1–A13 sind unverändert. |
| V-6 | nicht Gegenstand | Liegt bei Daniel Saure, weiterhin offen (Analysebericht Abschnitt 10, Punkt 2). |

### N1.2 Ergebnisdateien unverändert, Skript-Diff

- `git diff 5c15e79 HEAD -- output/`: geändert sind nur `grafik1_zeitreihe_jfm.png` und
  `grafik2_praediktive_verteilung_2027.png`. Alle Tabellen, `ergebnisse.json`, alle CSV,
  `diagnostik_M1.png`, `session_info.txt` und `console_log.txt` sind im Git unverändert.
- sha256 aller 16 Dateien in `output/` selbst berechnet: Alle stimmen mit der Spalte
  „nachher“ im run_log überein. Bei den 14 nicht geänderten Dateien ist „vorher“ =
  „nachher“.
- **Eigener Neulauf** (Scratch-Kopie mit Skript HEAD, `rohdaten/` und
  Gasspeicher-Vergleichsdatei, Exit-Code 0): Alle 15 vom Skript erzeugten Dateien sind
  per `cmp` **bitidentisch** mit HEAD, **auch die beiden neuen PNG-Dateien**. Die
  eingecheckten Grafiken stammen also nachweislich aus dem eingecheckten Skript. Die
  Konsolenausgabe ist identisch bis auf den Zeitstempel und die Dateiliste
  (`console_log.txt` fehlt in der Scratch-Kopie, weil diese Datei durch Umleitung
  entsteht).
- **Skript-Diff:** 5 Kommentarzeilen im Kopf (A14), 2 Kommentarzeilen vor `labs()` und 7
  geänderte Beschriftungsstrings (Legende, Titel, Untertitel, Achse, Caption von Grafik
  1 und 2). Keine Rechenzeile, kein Filter, kein Seed und keine Reihenfolge der
  Zufallsziehungen sind betroffen. **Bestanden.**
- Gering (N-5): Der Kopf des Analyseberichts nennt weiterhin nur den Lauf „21:11 MEZ“.
  Der Neulauf 21:29:39 MEZ steht nur in Abschnitt 10 und im run_log. Da die Ergebnisse
  bitidentisch sind, ist das inhaltlich folgenlos. Ein Halbsatz im Kopf wäre trotzdem
  sauberer.

### N1.3 Rundungsausnahmen (Analysebericht Abschnitt 10)

SAP 11 legt fest: „Temperaturen 0,1 °C (Rechnung ungerundet, Vergleich auf 0,01 °C …)“.

| Ausnahme | Bewertung |
|---|---|
| (a) Spalte „Wert (ungerundet)“ in Abschnitt 2 | **vertretbar.** Sie ist als ungerundet gekennzeichnet, die gerundete Spalte steht daneben, und der Analysebericht ist ein Prüfdokument, kein Veröffentlichungstext. Nicht in den Artikel übernehmen. |
| (b) 1883 mit 0,0336 °C gegenüber 0,0339 °C | **vertretbar und nötig.** Der Gleichstand entsteht erst durch den Vergleich auf 0,01 °C nach SAP 2.0. Bei 0,1 °C wäre er nicht nachvollziehbar. |
| (c) 3.5-2: 0,19 K / 0,003 K | **vertretbar.** Die Toleranz in SAP 3.5 (0,05 K) ist feiner als 0,1 K. Bei Rundung auf 0,1 K stünde dort 0,0 K und der Check wäre nicht mehr lesbar. |
| (d) b̂₀ / b̂₁ (0,0381 K pro Jahr) | **vertretbar.** Das sind Modellparameter bzw. eine Rate, keine Temperatur. Auf 0,1 K/Jahr gerundet ergäbe sich 0,0, also eine Falschaussage. Die Dekadenrate 0,4 K steht daneben. |

Nicht aufgeführt, aber gleich zu behandeln (gering, N-6): In 4.3 stehen in Klammern
Wahrscheinlichkeiten als Dezimalzahlen (0,0331; 0,0048 bis 0,0995; 0,0328). SAP 11
verlangt Prozent ohne Nachkommastelle. Für das Prüfdokument ist das vertretbar (gleiche
Logik wie (a)), es stand schon im Erstbericht. Nicht in den Artikel übernehmen. Gesamt:
**bestanden.**

### N1.4 Grafik 2: „(3 %)“ ohne Spanne

Der Untertitel lautet: „Fläche links der Linie: mindestens so kalt wie Jan.-März 2010
(3 %)“. Bewertung:

- **Keine SAP-Abweichung.** SAP 11 verlangt für Grafik 2 die prädiktive Verteilung, die
  schattierte Fläche und die Beschriftung „klimatologische Wahrscheinlichkeit, keine
  Wettervorhersage“. Alles drei ist vorhanden. Eine Spanne in der Grafik schreibt der SAP
  nicht vor.
- **V-3 ist für die Grafik aber nicht erfüllt.** V-3 verlangt, die Kernaussage zu E2
  *immer* mit Unsicherheitsspanne zu nennen. Der Untertitel ist genau diese Kernzahl.
  Grafiken werden erfahrungsgemäß ohne den Begleittext geteilt (Instagram, Facebook,
  Weiterverbreitung). Dort stünde die 3 % ohne Spanne, also in der Darstellung, die M-3
  verhindern sollte. Hinzu kommt: Die Grafik zeigt die Normalverteilung von M1. Gerade
  deren linke Flanke ist nach M-3 der unsichere Teil.
- **Einstufung: N-1, mittel, offene Auflage vor der Veröffentlichung.** Sie blockiert das
  Gate nicht, weil sie nicht kritisch ist, und betrifft den Analysebericht nicht. Bevor
  Grafik 2 in einem Artikel oder Kanalpost verwendet wird, ist sie umzusetzen.
  Vorschlag (Umsetzung durch analyst, nicht durch mich): Untertitel z. B. „… (3 %,
  Spanne 0,5 % bis 10 %; je nach Rechenweg 0,4 % bis 10 %)“ oder mindestens „(3 %,
  Spanne 0,5 % bis 10 %)“. Das ist eine reine Beschriftungsänderung wie A14: als
  Post-hoc-Darstellung kennzeichnen, neu laufen lassen, sha256 nachweisen.
  Unzureichend wäre, die Spanne nur in den Artikeltext zu schreiben und die Grafik
  unverändert zu lassen.
- **Nebenbefund (gering, N-2):** Die Caption von Grafik 2 lautet „Daten: DWD“. Der
  Lizenz-Nachtrag V-4 legt für Artikel und Grafiken die Namensnennung „Quelle: Deutscher
  Wetterdienst“ fest. Grafik 1 erfüllt das sinngemäß („Daten: Deutscher Wetterdienst
  (DWD)“), Grafik 2 nur mit Abkürzung. Mit N-1 zusammen angleichen.

### N1.5 Neue Probleme durch die Änderungen, insbesondere 7.1

- **7.1: keine neue Interpretation über den SAP hinaus.** Alle vier Spiegelstriche
  entsprechen SAP 8 („Keine implizite Politik-/Verhaltensbewertung“ und „Regression zur
  Mitte / Auswahleffekt“) inhaltlich und weitgehend wörtlich. Auch der Satz „Eine
  niedrige oder hohe Wahrscheinlichkeit P̂₂₀₂₇ ist deshalb kein Urteil über die
  Szenariowahl von INES“ steht so im SAP. Es gibt keine Wertung von INES, keine
  Gasbilanzaussage und keine ausgeschlossene Formulierung aus 8.2. **Bestanden.**
- 4.3 Lesehinweis: Die qualitative Aussage zur linken Flanke ist durch SAP 5.2, den
  Q-Q-Plot und S10 gedeckt und vorsichtig formuliert. Es wird keine Sensitivität als
  „eigentliches“ Ergebnis herausgestellt (SAP 7). **Bestanden.**
- Gering: N-3 (Ortsangabe A4/A11), N-4 (Limitation 2 unvollständig konkretisiert), N-5
  (Laufzeitpunkt im Kopf), N-6 (Dezimal-Wahrscheinlichkeiten in 4.3), jeweils oben
  beschrieben. Keiner dieser Punkte berührt Zahlen.
- Der Status im Kopf des Analyseberichts („Nachprüfung durch den validator steht aus“)
  und Punkt 3 in dessen Abschnitt 10 sind mit diesem Nachtrag überholt. Die
  Aktualisierung ist Sache des analyst bzw. der Top-Level-Session.

### N1.6 Ampel (Nachprüfung)

| Prüfpunkt | Ampel |
|---|---|
| V-1 | bestanden (Hinweis N-4; Veröffentlichungstext später erneut prüfen) |
| V-2 | bestanden (Hinweis N-3; Entscheidung A4(b) durch Daniel Saure offen) |
| V-3 | Abweichung: im Bericht erfüllt, Grafik 2 offen (N-1, mittel) |
| V-4 | bestanden (DWD-Wortlaut selbst verifiziert; Hinweis OWID-Lizenz) |
| V-5 | bestanden (Ausnahmen a bis d vertretbar; Hinweis N-6) |
| Ergebnisdateien / Skript-Diff | bestanden (eigener Neulauf bitidentisch, auch PNG) |
| Neue Interpretation (7.1, 4.3) | bestanden |

### N1.7 Gesamturteil Nachtrag 1

**Auflagen V-1, V-2, V-4 und V-5 erfüllt. V-3 ist im Analysebericht erfüllt, für Grafik 2
offen (N-1, mittel). Kein Befund „kritisch“, kein Befund „hoch“.** Alle Zahlen und
Ergebnisdateien sind unverändert und von mir bitidentisch reproduziert. Das Gate
„Validierungsbericht ohne kritisch“ (SAP 11) ist weiterhin formal erfüllt.

Vor einer Veröffentlichung offen:
1. **N-1:** Spanne in den Untertitel von Grafik 2 (mit N-2, Quellenangabe) als
   gekennzeichnete Darstellungsänderung mit sha256-Nachweis.
2. **V-2:** Entscheidung Daniel Saure zur Auslegung A4(b).
3. **V-6:** Bestätigungen Daniel Saure zu A1b und A9.
4. **V-1/V-3 im Artikeltext:** SAP-8-Inhalte, Limitationen und „3 % nur mit Spanne“ sind
   in den Veröffentlichungstext zu übernehmen. Das prüft der Faktencheck bzw. eine
   weitere Nachprüfung am Entwurf.

Die geringen Punkte N-2 bis N-6 können gesammelt mit N-1 erledigt werden. Eine erneute
Nachprüfung durch den validator ist nur für N-1 nötig (Grafik und sha256-Nachweis) und
kann als Nachtrag 2 zu dieser Datei erfolgen.

---

## Nachtrag 2: Nachprüfung N-1 (23.11.2026)

**Gegenstand:** Umsetzung von N-1 (Spanne im Untertitel von Grafik 2), N-2
(Quellenzeile), N-3 und N-5 aus Nachtrag 1 (Abweichung A15) sowie die Dokumentation der
Bestätigungen Daniel Saure zu A1b, A9 und S9b.
**Geprüfter Stand:** Commit 02e46c3 gegen 378092b, Grundlage
`git diff 378092b 02e46c3 -- Analysen/2026-11-kaeltewinter-2010`. Der Commit ändert in
diesem Ordner genau 6 Dateien: Abweichungsprotokoll (+30/−1), Analysebericht, Skript
(+16/−4), `run_log.txt` (+72/−0, nur angehängt), Grafik 1, Grafik 2. SAP und dieser
Validierungsbericht sind unverändert. Arbeitsverzeichnis des Ordners vor diesem Nachtrag
ohne uncommittete Änderungen.
**Prüfer:** Claude (validator-Subagent), unabhängig.
**Arbeitsweise:** Diff gelesen; sha256 aller 16 Dateien in `output/` selbst berechnet und
mit der Spalte „nachher“ des A15-Blocks im run_log verglichen; Skript (Stand 02e46c3) in
einer Scratch-Kopie mit `rohdaten/` und der Gasspeicher-Vergleichsdatei neu ausgeführt
(`KW_NO_RUNLOG=1`, R 4.6.1, Exit-Code 0) und alle 15 erzeugten Dateien per `cmp`
verglichen; beide Grafiken gesichtet. Außer dem Anhängen dieses Nachtrags habe ich nichts
verändert. Kein Commit, kein Freigabevermerk.

### N2.1 N-1 und N-2 (Grafiken)

| Punkt | Ergebnis | Befund |
|---|---|---|
| N-1 (mittel) | **erfüllt** | Der Untertitel von Grafik 2 lautet jetzt: „Fläche links der Linie: mindestens so kalt wie Jan.-März 2010 (3 %, Spanne 0,5 % bis 10 %)“. Er entspricht damit der Mindestvariante aus N1.4. Die Werte stimmen überein: `ergebnisse.json` `E2.p` = 0,03305 und `E2.span` = [0,00481; 0,09948]; Tabelle 2, Zeile „Primaer“: `P_fmt` „3 %“, `Spanne_fmt` „0,5 % bis 10 %“; run_log „= 3 % (0,5 % bis 10 %)“. Im Skript kommt die Spanne aus `prim_q`. Das ist dasselbe Objekt, das in `ergebnisse.json` als `E2.span` geschrieben wird, und es wird mit demselben Formatierer `fmt_p` formatiert wie die Spalte `Spanne_fmt`. Neu gerechnet wird nichts. Die Zahl im Untertitel kann also nicht von der Tabelle abweichen. |
| N-2 (gering) | **erfüllt** | Die Caption lautet in Grafik 1 „Quelle: Deutscher Wetterdienst, Datenschnitt März 2026“ und in Grafik 2 „Quelle: Deutscher Wetterdienst; Modell: Trend 1971-2026. Grundrate, keine Prognose für den Winter 2026/27.“ Das entspricht der Namensnennung aus dem Lizenz-Nachtrag V-4. Dass `diagnostik_M1.png` keine Quellenzeile trägt, ist vertretbar: Es ist eine interne Diagnosegrafik und nicht zur Veröffentlichung bestimmt. Wird sie doch veröffentlicht, braucht auch sie die Quellenzeile. |
| Lesbarkeit | **bestanden** | Beide PNG gesichtet (9 × 5 Zoll, 150 dpi). Titel, Untertitel, Achsen, Legende und Caption sind vollständig und nicht abgeschnitten, Umlaute werden korrekt dargestellt. Die schattierte Fläche und die Beschriftung „Klimatologische Wahrscheinlichkeit, keine Wettervorhersage“ (SAP 11) sind weiterhin vorhanden. Grafik 1 zeigt T_ref als „0,0 °C“. Das ist SAP-konform (0,1 °C), siehe A10. |

### N2.2 Ergebnisdateien und Skript-Diff

- **Ergebnisdateien:** `git diff --stat` zeigt in `output/` nur die beiden Grafik-PNG als
  geändert. Meine eigenen sha256-Werte aller 16 Dateien stimmen mit der Spalte „nachher“
  des A15-Blocks im run_log überein. Bei den 14 nicht geänderten Dateien ist dort
  „vorher“ = „nachher“. Das gilt auch für `ergebnisse.json`, `tabelle1_E1.csv`,
  `tabelle2_E2_sensitivitaeten.csv`, `tabelle3_diagnostik.csv` und alle übrigen CSV.
  Die Hashwerte sind dieselben wie beim validierten Stand (Nachtrag 1, N1.2).
- **Eigener Neulauf:** Alle 15 vom Skript erzeugten Dateien sind per `cmp` **bitidentisch**
  mit 02e46c3, **auch beide neuen PNG**. Die eingecheckten Grafiken stammen damit
  nachweislich aus dem eingecheckten Skript. Die Konsolenausgabe stimmt bis auf den
  Zeitstempel und die Dateiliste mit `console_log.txt` überein. Die Dateiliste
  unterscheidet sich nur um `console_log.txt`, das durch Umleitung entsteht.
- **Skript-Diff (+16/−4):** Hinzugekommen sind 9 Kommentarzeilen im Kopf (A15) und 3
  Kommentarzeilen vor den geänderten `labs()`-Argumenten. Geändert sind die Caption von
  Grafik 1 sowie Untertitel und Caption von Grafik 2. Im Untertitel kommen nur zwei
  Formatierungsaufrufe auf ein bereits berechnetes Objekt hinzu (`fmt_p(prim_q[1])`,
  `fmt_p(prim_q[2])`). Keine Rechenzeile, kein Filter, kein Seed und keine Reihenfolge der
  Zufallsziehungen sind betroffen. Kosmetisch: Die `subtitle`-Zeile ist anders eingerückt
  als die übrigen `labs()`-Argumente, ohne Wirkung. **Bestanden.**
- A15 ist im Abweichungsprotokoll korrekt als Post-hoc-Darstellungsänderung
  gekennzeichnet. Die Zeilen A1–A14 sind im Wortlaut unverändert (im Protokoll wurde nur
  die Kopfzeile „Skript“ ergänzt, das ist die einzige gelöschte Zeile).

### N2.3 N-3 und N-5

| Punkt | Ergebnis | Befund |
|---|---|---|
| N-3 (gering) | **erfüllt** | Die Ortsangabe zu V-2 in Abschnitt 10 des Analyseberichts verweist jetzt auf den Abschnitt „Nachtrag: Umsetzung der Validierungsauflagen“, Zeile V-2, des Abweichungsprotokolls. Dazu steht der Hinweis, dass die Zeilen A4/A11 unverändert sind. Die Zeile V-2 ist dort tatsächlich vorhanden (Protokoll, Zeile 52). |
| N-5 (gering) | **erfüllt** | Im Kopf von Analysebericht und Abweichungsprotokoll stehen die Neuläufe 21:29 MEZ (A14) und 21:40 MEZ (A15) mit dem Hinweis „Ergebnisdateien bitidentisch“. Der Zeitstempel 21:40:55 stimmt mit dem run_log überein. |

### N2.4 Bestätigungen Daniel Saure (A1b, A9, S9b)

- **Inhaltlich konsistent.** Die neuen Abschnitte im Abweichungsprotokoll
  („Bestätigungen Daniel Saure“) und im Analysebericht (10.1) stimmen wörtlich überein.
  Beide geben den Wortlaut „Ja, alle drei“ an und nennen die Frage, auf die er sich
  bezieht. A1b passt zur Zeile A1b (Download durch die Top-Level-Session, „Du lädst
  sie“). A9 passt zur Zeile A9 und zu meiner Bewertung in Abschnitt 5 (Dokumentation
  genügt). Für S9b/A4(b) steht dort „Spannbreite bleibt 0,4 % bis 10 %“. Das stimmt
  überein mit A11, mit `ergebnisse.json` (`spannbreite` = [0,00363; 0,1]), mit
  Analysebericht Abschnitt 5 und mit Tabelle 2. Ich finde keinen Zahlenwiderspruch.
- **Keine Zahl geändert.** Die Entscheidung zu A4(b) hält die vorab festgelegte
  Auslegung bei. Es gibt deshalb keine Post-hoc-Neuberechnung und keine zweite Variante,
  die berichtet werden müsste. Mein Sachbefund zu M-2 bleibt bestehen: S9b zählt 2010
  mit, entgegen der Logik von 2.1 und A6. Er ist aber offengelegt (Abschnitt 5 des
  Berichts), und die Entscheidung liegt beim Menschen. Das ist kein Widerspruch, sondern
  eine dokumentierte, bewusst getroffene Auslegung.
- **Nicht prüfbar (Hinweis, Verifikationspflicht CLAUDE.md):** Den Chat kann ich nicht
  einsehen. Ob Daniel Saure „Ja, alle drei“ so geschrieben hat, belegt allein der
  Protokolleintrag. Wer den Abschnitt „Bestätigungen“ geschrieben hat, steht dort nicht
  (anders als bei den Nachträgen, die „Durch: …“ nennen). Laut Nachtrag 2 des Protokolls
  lag er schon vor A15 vor. Es handelt sich ausdrücklich um keinen Freigabevermerk. Er
  betrifft nur Abweichungsbestätigungen. Empfehlung: Daniel Saure liest den Abschnitt
  einmal selbst gegen. Der Verfasser des Eintrags sollte bei nächster Gelegenheit
  ergänzt werden (gering, N-7).
- **Formale Restunstimmigkeit (gering, N-8):** Im Abweichungsprotokoll stehen weiter
  oben unverändert „Offene Punkte / Rückfragen an Mensch“ (Punkt 1 A9, Punkt 2
  Lizenzfeld DWD) und „Neuer offener Punkt (V-2)“, jeweils ohne Erledigungsvermerk. Das
  ist wegen der Regel „nur anhängen“ verständlich, und die Erledigung folgt weiter unten
  bzw. in `run_log.txt` (V-4). Wer nur den oberen Teil liest, hält diese Punkte aber
  für offen. Vorschlag: am Ende des Protokolls eine kurze Statuszeile anhängen, die
  diese Punkte als erledigt mit Fundstelle führt. Der Originaltext wird dabei nicht
  geändert.
- **Status im Analysebericht (gering, N-9):** Kopf und Abschnitt 10.1 („N-1 in
  Umsetzung“, „Nachprüfung … steht aus“) sind mit diesem Nachtrag überholt. Die
  Aktualisierung ist Sache des analyst bzw. der Top-Level-Session.

### N2.5 Was vor einer Veröffentlichung offen bleibt

| Punkt | Bewertung | blockierend? |
|---|---|---|
| N-4 (gering): Limitation 2 in 7.2 nennt die betroffenen Rechnungen vor 1951 nicht vollständig (E1-Teilzeiträume vor 1951, E1-Angaben zu S1/S2/S14). | Betrifft nur die Konkretisierung, die SAP-9-Limitation selbst steht vollständig da. | **nein.** Im Artikeltext darf die Einschränkung aber nicht auf „E1 und S6/S8“ verengt werden. Das prüft der Faktencheck. |
| N-6 (gering): In 4.3 stehen Wahrscheinlichkeiten als Dezimalzahlen. | Im Prüfdokument vertretbar. | **nein.** Nicht in den Artikel übernehmen; dort gilt SAP 11 (Prozent). |
| N-7 bis N-9 (gering): Verfasserangabe Bestätigungen, Statuszeile offene Punkte im Protokoll, Statuskopf Analysebericht. | Nur Dokumentation, keine Zahl berührt. | **nein** |
| OWID-Lizenz (Hinweis aus N1.1, V-4) | Nur relevant, wenn OWID im Artikel genannt wird. | **nein**, sonst vorher klären |
| V-1/V-3 im Veröffentlichungstext | Die SAP-8-Inhalte, alle SAP-9-Limitationen, „3 % nur mit Spanne“ und die Offenlegung zu S9b (Maximum 10 % zählt 2010 mit) müssen im Artikel stehen. | Offen bis zum Artikelentwurf. Prüfung durch den Faktencheck bzw. eine Nachprüfung am Entwurf. |
| Begriffsklarheit (Hinweis, neu) | Grafik 2 nennt die **Spanne** 0,5 % bis 10 % (95-%-Unsicherheit von M1). Der Bericht nennt die **Spannbreite** 0,4 % bis 10 % über die Rechenwege (SAP 6). Beide enden bei 10 %, haben aber verschiedene Quellen (9,948 % aus M1 bzw. 10,0 % aus S9b). | **nein.** Im Artikel beide Begriffe klar trennen und nicht vermischen. Die Grafik ist für sich korrekt beschriftet. |

### N2.6 Ampel (Nachprüfung 2)

| Prüfpunkt | Ampel |
|---|---|
| N-1 Spanne in Grafik 2, Werte = Tabelle 2 / `ergebnisse.json` | bestanden |
| N-2 Quellenzeile Grafik 1 und 2 | bestanden |
| Lesbarkeit der Grafiken | bestanden |
| Ergebnisdateien bitidentisch, Skript-Diff nur Beschriftung/Kommentar | bestanden (eigener Neulauf bitidentisch, auch PNG) |
| N-3, N-5 | bestanden |
| Bestätigungen A1b/A9/S9b | bestanden, mit Hinweis: Chat nicht prüfbar, Verfasser des Eintrags nicht genannt (N-7); formale Statusreste (N-8, N-9) |
| Offene Punkte vor Veröffentlichung | Abweichung (gering): N-4, N-6 bis N-9 nicht blockierend; Artikeltext noch ungeprüft |

### N2.7 Gesamturteil Nachtrag 2

**N-1 ist erfüllt.** V-3 ist damit auch für Grafik 2 erfüllt. N-2, N-3 und N-5 sind
ebenfalls erfüllt. Alle Zahlen und Ergebnisdateien sind gegenüber dem validierten Stand
unverändert und von mir bitidentisch reproduziert, die Grafiken eingeschlossen. Die
Bestätigungen zu A1b, A9 und S9b sind konsistent dokumentiert und erzeugen keinen
Zahlenwiderspruch. **Kein Befund „kritisch“, kein Befund „hoch“, kein offener Befund
„mittel“.** Das Gate „Validierungsbericht ohne kritisch“ (SAP 11) ist erfüllt.

Aus Validator-Sicht blockiert keiner der verbleibenden Punkte (N-4, N-6 bis N-9, alle
gering) eine Veröffentlichung. Sie betreffen den Analysebericht als Prüfdokument oder die
Dokumentation. Offen bleibt die Prüfung des späteren Veröffentlichungstextes auf V-1/V-3,
die Offenlegung zu S9b und die Begriffstrennung Spanne/Spannbreite. Das ist Sache des
Faktenchecks bzw. einer Nachprüfung am Entwurf. Eine weitere Nachprüfung des
Analyseordners durch den validator ist nicht erforderlich. Ausnahme: Es ändern sich
Skript, Ergebnisdateien oder Grafiken. Dieser Nachtrag ist kein Freigabevermerk. Die
Freigabe erteilt der Mensch.
