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
