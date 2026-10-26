# Abweichungsprotokoll: Expertenrat-Budgetabgleich 2030

**SAP:** `SAP_Expertenrat-Budgetabgleich-2030.md`, v1.1 (nicht veraendert)
**Skript:** `expertenrat-budgetabgleich.R`, Lauf 23.10.2026
**Legende:** RF = "Abweichung vom SAP - Rueckfrage an Mensch" (Analyst hat nicht eigenmaechtig entschieden, sondern die beschriebene Umsetzung gewaehlt und meldet sie). POST-HOC = nicht im SAP vorgesehen, zusaetzlich gerechnet und so gekennzeichnet.

| Nr. | Art | Betrifft SAP | Was | Umsetzung / Folge | Entscheidung noetig? |
|---|---|---|---|---|---|
| RF-1 | SAP-Inkonsistenz | Header, Abschnitt 0, "Offene Punkte" | Header: "final, eingefroren 29.08.2026". Abschnitt 0 sagt aber weiter "Status: draft - noch NICHT eingefroren"; "Offene Punkte" Nr. 6 steht als "NOCH OFFEN"; Zeilen 9-11 des Headers sind textlich abgeschnitten (offene Klammer). Git-Historie: Commit d9215cb "eingefroren ... vollstaendig gelesen und freigegeben". | Gearbeitet wird nach Header und Commit (final). Tabellenzeile 5 (Bundesregierung) wurde wie im SAP-Text stehend umgesetzt (Kontextgroesse, kein Modellinput). | Ja: Bitte bestaetigen, dass Version 1.1 gilt und Nr. 6a/6b so beantwortet sind. |
| RF-2 | Sachfehler/Annahme im SAP | 1, 4a.1, 4a.2, 6.3 | Der SAP nimmt an, 625 Mt sei ein 2025-Gesamtemissionswert. Agora (28.08.2026) nennt 625 Mt als gesetzliche Emissionshoechstgrenze fuer 2026. Es gibt keinen alternativen 2025-Emissionswert. | Estimand 1 und Estimand 2 primaer mit 648,83. Weil 6.3/4a.2 die Parallelrechnung mit dem Alternativwert vorschreiben und keine Sensitivitaet ausgelassen werden soll, wurde Estimand 2 formal zusaetzlich mit 2025 = 625 gerechnet (Variante "sens625") und im Bericht als inhaltlich nicht belastbar gekennzeichnet. | Ja: Soll die 625-Variante im Bericht bleiben oder entfallen? |
| RF-3 | Methodisches Problem | 5.4 Verfahren 1 und 2 | Die Varianz aus der Koeffizienten-Kovarianz (Verf. 1) und der residuale MBB (Verf. 2) liefern Intervalle fuer die Erwartungswert-Summe (nur Parameterunsicherheit). Sie enthalten nicht die Streuung kuenftiger Jahreswerte. ARIMA (Verf. 3) enthaelt Prognoseunsicherheit. Die drei Intervalle sind daher nicht gleichartig; die analytischen/Bootstrap-Intervalle sind enger als ein Prognoseintervall. | Exakt wie im SAP umgesetzt, keine zusaetzliche Prognoseintervall-Variante (Regel 2). Hinweis im Bericht. | Ja (fuer Validator/Mensch): Ob ein Prognoseintervall der Summe ergaenzt werden soll, waere eine SAP-Aenderung. |
| RF-4 | SAP-Luecke | 5.4 Verfahren 2 | Blocklaenge und Seed des MBB sind im SAP nicht festgelegt. | Uebernommen aus dem Amendment v1.1 (THG-Laendervergleich): block_len = 2, set.seed(20260827), B = 2000. Bei n = 36 und starker Autokorrelation (Fenster A) ist Laenge 2 knapp. | Ja: Bitte Blocklaenge bestaetigen oder vorgeben. |
| RF-5 | Operationalisierung + POST-HOC | 2 (Rate_H1) | Agora nennt 327 Mt und "rund 7 Mt bzw. zwei Prozent weniger"; H1 2025 wird nicht direkt genannt. | Primaer: H1_2025 = 327 + 7 = 334, Rate = -7/334 = -2,096 %. POST-HOC (nicht im SAP): Variante mit der von Agora genannten gerundeten Rate -2,0 %. Ergebnis: Einordnung identisch (naeher an A), robust gegenueber beiden Toleranzschwellen. Agora schreibt zudem "bis zu 7 Mt". | Nein (informativ). |
| RF-6 | POST-HOC-Operationalisierung | 2 (Einordnung bei Uneinigkeit), 8c | "Numerisch naeher an Expertenrat bzw. Bundesregierung" ist im SAP nicht definiert. | Distanz zum Expertenrat = 0 im Korridor 60-100, sonst Abstand zum naechsten Rand; Distanz zur Bundesregierung = Abstand zu Overshoot -4,5 (Puffer). Nur deskriptiv im Bericht (Abschnitt 2.4), keine Wertung. | Ja: Operationalisierung bestaetigen. |
| RF-7 | Quellenzugriff | 3 Quellen 3 und 5 | Quelle 3 (FAZ): Artikel nicht abrufbar (dynamische Suche/Paywall, Versuche in `rohdaten/suchprotokoll/faz/`); die dem Artikel zugeschriebenen Zahlen wurden in den Primaerquellen Agora und Expertenrat direkt gefunden. Quelle 5 (UBA-Projektionsdaten 2026, Datacube): nicht direkt abgerufen; die 4,5 Mt (Summe 6194 vs. Budget 6199) sind im Expertenrat-Pruefbericht belegt (Primaerquelle Quelle 4, Zitat der Projektionsdaten). | Quelle 5 ist im Bericht als sekundaer ueber Quelle 4 gekennzeichnet. | Optional: Direktabruf Quelle 5 / FAZ durch Mensch. |
| RF-8 | Zugriffsdatum | 3 Quelle 1 | SAP: Zugriff 27.08.2026 (bestehende Analyse). Die Reihe wurde zusaetzlich am 23.10.2026 erneut abgerufen (HTML-Seite und API) und gegen die 36 Werte im alten Skript verglichen: identisch (max. 0,0000 Mt zur HTML-Tabelle, 0,0047 Mt zur API-Summe, Rundung). | Als Modellinput werden die 36 Werte aus dem archivierten Skript verwendet (SAP 4, unveraendert). | Nein. |
| RF-9 | Umsetzungsdetail | 5.1.2, 6.1, 11 | Fenster C (n = 6) ist laut SAP rein deskriptiv, soll aber in allen Tabellen erscheinen. | Fuer C: Punktschaetzung, OLS-Kovarianz (keine HAC), Intervalle berechnet, aber ausdruecklich "nicht inferenziell". | Nein. |
| RF-10 | Dateiname | 10 | SAP nennt `Expertenrat-Budgetabgleich-2030.R`. Auftrag nannte `expertenrat-budgetabgleich.R`. | Auftragsname verwendet. | Nein. |
| RF-11 | SAP-Fall "entfaellt" | 2, 6.4 | Saisonal gewichtete Jahreshochrechnung: Voraussetzung (>= 5 vollstaendige H1/H2-Paare oeffentlich) nicht erfuellt. | Entfaellt ersatzlos, keine Verdopplung (Suchprotokoll: Agora-Sitemap mit 1129 URLs und Pressemitteilungsliste). | Nein. |

## Kein Abweichungsfall (zur Klarheit)

- Quelle 4 wurde gefunden; der Fallback (nur Randwerte 60/100 Mt) kam NICHT zur Anwendung (SAP 3, 6.5). Budget 6199 Mt stammt aus der Primaerquelle.
- Die Fenster, Methoden, Signifikanzniveau (0,05), Toleranzschwellen (0,05 und 0,1 pp), Bootstrap-Zahl (B = 2000), Diagnosetests (Durbin-Watson, Shapiro-Wilk, ACF, Residuen-vs-Fitted) und Newey-West-Regel (bei signifikantem DW) wurden wie im SAP umgesetzt.
- Die Steigungstests wurden sowohl klassisch als auch mit Newey-West berichtet (wie in der bestehenden Analyse). Die analytische Summe verwendet HAC nur, wenn DW signifikant ist (Fenster A).
- Datenabgleich 4a bestanden; kein Stopp.

## Hinweise auf Auffaelligkeiten (keine Abweichungen)

- Expertenrat-Wert fuer UBA 2025: 648,9 Mt, klimadashboard: 648,83 Mt; 2024: 649,8 vs. 649,74 Mt. Differenz unter 0,1 Mt, Ursache nicht untersucht.
- Die Klassifikation haengt stark von Fenster und Methode ab (Overshoot A: 266 bis 584 Mt, B: 25 bis 151 Mt primaer). Das wurde ungekuerzt berichtet (SAP 7).

---

# Nachtrag Fassung 2 (nach Validierung), 23.10.2026

Grundlage: `Validierungsbericht_expertenrat-budgetabgleich.md`. Fassung 1 (Commit 78250e3) bleibt im Git-Verlauf; nichts wurde still ueberschrieben. Die Tabelle oben (RF-1 bis RF-11) ist der Stand von Fassung 1; Aenderungen dazu stehen hier.

## Fehler in Fassung 1 und Korrektur (K1)

- **Fehler:** In `arima_summe()` wurde `convolve(ar_poly, c(1, -1), type = "open")` verwendet. R's `convolve()` kehrt das zweite Argument um (korrekt waere `convolve(x, rev(y), type = "open")`), dadurch wurde der Differenzierungsterm mit falschem Vorzeichen gelesen, die psi-Gewichte alternierten (+1, -1, ...) statt konstant 1 zu sein, und die Varianz der 5-Jahres-Summe war bei Random-Walk-Modellen um den Faktor ca. 4 zu klein. Die Kontrolle "Diagonale gegen forecast()" war blind dafuer.
- **Korrektur:** eigene Polynommultiplikation `polymul()` mit Unit-Test; neue Kontrollen (Random-Walk-Formel sigma^2 * h(h+1)(2h+1)/6 = 55 sigma^2 bei h = 5, die Skript-Abbruch ausloest, und Monte-Carlo mit 10000 Pfaden, Abbruch bei mehr als 5 % Abweichung). Ergebnisse: sd der Summe analytisch = Formel (A 203,6; B 251,9; C 295,5), Monte-Carlo 0,8 % darueber.
- **Auswirkung (Overshoot-Intervalle, ARIMA, primaer):** A 173,1-359,5 -> **-132,7 bis 665,4**; B 35,3-265,9 -> **-343,1 bis 644,3**; C 390,0-660,5 -> **-53,9 bis 1104,4**. Punktwerte und Klassifikation unveraendert. Anhang (625): A -284,1 bis 510,4, B -506,4 bis 450,3, C -218,8 bis 983,3.
- Die Fassung-1-Aussagen "ARIMA-Intervall A schliesst Korridor und Null aus" und "B nur knapp ueber Null" waren falsch.

## Aenderungen zu den Rueckfragen aus Fassung 1

| Nr. | Aenderung in Fassung 2 |
|---|---|
| RF-1 | `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` liegt vor und ist im Bericht referenziert. [Stand Fassung 2; in Fassung 4 ueberholt:] Einschraenkung damals: Chat-Zitat nach 300 Zeichen abgeschnitten; keine ausdrueckliche Antwort zu 6a/6b. **Fassung 4:** Die Antworten zu den Offenen Punkten 6a ("Limitation reicht") und 6b (Datenquellen-Zeile 5 bestaetigt) liegen vor (Daniel Saure, 23.10.2026); das SAP-Erratum 1 (`SAP_Erratum_1_Expertenrat-Budgetabgleich-2030.md`) wurde freigegeben (Commit d20e448). Dokumentiert in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` (Abschnitt "Ergaenzung") und im Erratum. Der SAP, die Bestaetigungsdatei und das Erratum wurden nicht von mir geaendert. |
| RF-2 | Wortlaut korrigiert (Validierung W2): Agora nennt 625 Mt als gesetzliche Hoechstmenge 2026; Anlage 2 KSG (BGBl. 2024 I Nr. 235, abgerufen 23.10.2026, `rohdaten/ksg/`) nennt 604 Mt fuer 2026. Moeglicherweise ist 625 die nach Par. 4 Abs. 2 KSG angepasste Jahresmenge (Plausibilitaet: ERK-Anpassung 2030: 459,2 vs. 438 = +21,2; 604 + 21,2 = 625,2); in den Expertenrat-Dokumenten kommt 625 nicht vor, Agora ist die einzige Quelle, nicht belegt. Die 625-Variante ist auf Entscheidung Daniel Saure (23.10.2026) im Anhang A (POST-HOC, nicht SAP-erforderlich, ohne Aussagewert). Die Fassung-1-Aussage, SAP 6.3 schreibe die Parallelrechnung vor, ist zurueckgenommen: Die Bedingung (ungeklaerte Diskrepanz) ist nach der Klaerung nicht ausgeloest. |
| RF-3 | Spalten umbenannt in "Parameterintervall" (analytisch, Bootstrap) und "Prognoseintervall" (ARIMA). Zusaetzlich POST-HOC-Prognoseintervall fuer OLS unter der Annahme unabhaengiger Fehler (Var = Parametervarianz + 5 sigma^2): A 17,1-1151,3 (Annahme verletzt, zu optimistisch), B -234,4-284,4, C -459,6-737,1. Begruendung: Estimand 2 betrifft die tatsaechliche Summe. Nicht im SAP, nicht Teil der Hauptergebnisse. |
| RF-4 | Blocklaenge 2, Seed 20260827, B = 2000 bleiben primaer (Amendment-Praezedenz). POST-HOC: Blocklaenge 4 (A: 426-781 statt 429-737) und B = 10000 mit weiteren Seeds; Monte-Carlo-Fehler der Grenzen einige Mt; Bootstrap-Grenzen in ganzen Mt. Der Seed-Strom der Hauptlaeufe wurde nicht veraendert (Hauptergebnisse identisch zu Fassung 1). |
| RF-5 | Zusaetzlich Rundungsspanne der H1-Rate (Rueckgang 7 +/- 0,5 Mt): -1,95 % bis -2,24 %, Klassifikation unveraendert (POST-HOC). |
| RF-6 | Unveraendert; im Bericht um den Hinweis ergaenzt, dass die Operationalisierung zugunsten des breiten Korridors verzerrt ist und fuer A-Zeilen bedeutungslos ist. |
| RF-7 | Unveraendert. |
| RF-9 | Das Klammerlabel "(pessimistischer)" bei Fenster C wurde entfernt; C wird nicht klassifiziert (SAP 2). |
| RF-11 | UBA- und AGEB-Seiten durchsucht (`rohdaten/suchprotokoll/uba_agueb/`), keine Halbjahres-Gesamt-THG-Reihe; Grenze: keine Tiefensuche in PDF-Anhaengen. |

## Weitere Aenderungen (POST-HOC bzw. technisch)

- **POST-HOC (G3):** Standardfehler der 5-Jahres-Summe je Kovarianzschaetzer: Fenster A OLS 63,2; Newey-West mit Prewhitening (Voreinstellung) 268,3; ohne Prewhitening 134,9 Mt. Fenster B: OLS 100,7; NW 55,7 bzw. 31,5 (nicht verwendet).
- **Erratum-Hinweis zum SAP (SAP nicht geaendert, datiert 23.10.2026):** SAP Abschnitte 1, 3 (Zeile 3), 4a.1, 4a.2 und 6.3 nehmen "625 Mt" als 2025-Emissionswert an. Das trifft nach Agora nicht zu. Ob ein formales Erratum/Amendment im SAP-Ordner gefuehrt wird, entscheidet der Mensch.
- **Technisch:** `rohdaten/SHA256SUMS.txt` wird vom Skript nicht mehr ueberschrieben, sondern verglichen (bei Fassung 2 einmalig neu angelegt, da neue Rohdateien: `rohdaten/ksg/`, `rohdaten/suchprotokoll/uba_agueb/`; alle Hashes der Fassung-1-Dateien unveraendert). Diagnostik-/Tabellendateien der 625-Variante umbenannt in `anhang_625_*`; alte `diagnostik_sens625_*.png` entfernt. Grafiken neu erzeugt und visuell geprueft.
- Haeufigkeitszaehlung und Hauptgrafik enthalten nur noch die Primaervariante (Fenster A/B: 4 pessimistischer, 2 optimistischer).

## Offene Punkte (Fassung 2)

1. Fokussierte Nachpruefung durch den validator als eigene Datei (CLAUDE.md, Dokumentationspflicht).
2. [Erledigt, Fassung 4] Mensch: Soll ein formales SAP-Erratum zur 625-Annahme gefuehrt werden? -> Erratum 1 wurde gefuehrt und am 23.10.2026 freigegeben (`SAP_Erratum_1_Expertenrat-Budgetabgleich-2030.md`, Commit d20e448). Zu Anhang A: bleibt als Audit-Trail, nicht in Blog/Kapitel/Kanaltexte (Verwendungsvermerk im Bericht).
3. [Erledigt, Fassung 4] Antwort zu den SAP-Punkten 6a/6b: liegt vor (Daniel Saure, 23.10.2026; 6a: Limitation reicht, 6b: Datenquellen-Zeile 5 bestaetigt), dokumentiert im Erratum und in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md`.
4. Herkunft der 625 (angepasste Jahresmenge?) ist nicht durch ein UBA-Dokument belegt; Quelle waere die UBA-Berechnung der Emissionsdaten 2025 (UBA 2026g, Tabelle 3).
5. RF-3: Ob das POST-HOC-Prognoseintervall fuer OLS (bzw. eine GLS/AR(1)-Variante fuer Fenster A) ein SAP-Amendment braucht, entscheidet der Mensch.

---

# Nachtrag Fassung 3 (Behebung N2.1-N2.4), 23.10.2026

Grundlage: Nachtrag 1 des Validierungsberichts. Keine Kernzahl hat sich geaendert (Punktwerte, Overshoot-Intervalle, ARIMA-Intervalle, Diagnostik, Bootstrap-Hauptlaeufe identisch zu Fassung 2; Rohdaten-Pruefsummen alle unveraendert).

| Befund | Aenderung |
|---|---|
| N2.1 | Die Beschreibung des POST-HOC-Prognoseintervalls (RF-3 / Nachtrag Fassung 2 und Bericht 2.4) war unvollstaendig: "unabhaengige Fehler, Parametervarianz + 5 sigma^2" verschwieg, dass die Parametervarianz in Fenster A die Newey-West-Varianz (SE 268,3 Mt) ist. Die Rechnung selbst widersprach der Beschreibung nicht und blieb unveraendert; die Beschreibung wurde korrigiert (HAC-Parametervarianz in A, OLS in B/C, plus 5 sigma^2 OLS-Restvarianz, unabhaengige Restfehler angenommen). Zusaetzlich wird fuer A die Variante mit klassischer OLS-Parametervarianz ausgewiesen (382,3-786,1; neue CSV-Spalten `_OLSparam`, `Parametervarianz_Quelle`). Der Vermerk "zu optimistisch" gilt nur fuer die OLS-Variante; die HAC-Mischung in A ist inkonsistent (iid-Annahme verletzt). Beide Intervalle sind POST-HOC, deskriptiv und gehen nicht in Klassifikation oder Kernaussage ein. |
| N2.2 | `posthoc_bootstrap_sensitivitaet.csv`: Spalte `Seed` in `Seed_Neustart` umbenannt, Spalte `Hinweis` ergaenzt. Der Hauptlauf setzt den Seed einmal und verbraucht den Strom der Reihe nach (primaer A, B, C, Anhang); die Sensitivitaetszeilen starten den Strom neu. Nur Fenster A stimmt mit dem Hauptlauf ueberein; Abweichungen bei B (-153/199 vs. -159/201) sind Monte-Carlo-Fehler. |
| N2.3 | Grafiken ueberarbeitet und visuell geprueft: Bundesregierungs-Marker mit Beschriftung ueber der obersten Zeile (Skala nicht veraendert), Randabstand rechts, Annotation mit Pfeil am Niveausprung, Dezimalkomma in der Estimand-1-Grafik; Anhangsgrafik entsprechend. |
| N2.4 | Zusatzkontrollen fuer ARIMA(1,1,0), (0,1,1) und (0,1,0) an simulierten Reihen (eigene Seeds, 20000 MC-Pfade, geschlossene psi-Formeln); alle bestanden (MC-Abweichung <= 1,2 %, psi und Diagonale exakt). Hinweis zum identischen MC/analytisch-Verhaeltnis (gleicher Seed) im Bericht. Technisch: Der Zufallsstrom wird um die Zusatzkontrollen gesichert und wiederhergestellt; ein erster Entwurf ohne Sicherung hatte die Bootstrap-Hauptergebnisse veraendert (A 432 statt 429) und wurde vor dem Endlauf korrigiert, Endlauf identisch zu Fassung 2. |
| Anhang A | Verwendungsvermerk im Analysebericht: bleibt als Audit-Trail im Repo, geht nicht in Blog, Kapitel oder Kanaltexte (Entscheidung Daniel Saure). |

Offen: Fokussierte Pruefung der Fassung 3 durch den validator als eigene Datei (inzwischen als Nachtrag 2 erfolgt); [Fassung 4: Entscheidungen zu SAP-Erratum und zu 6a/6b liegen vor, siehe Nachtrag Fassung 4].

---

# Nachtrag Fassung 4 (Behebung N3.1-N3.3), 24.10.2026

Grundlage: Nachtrag 2 des Validierungsberichts. Keine Kernzahl hat sich geaendert; Skript erneut gelaufen (Exit 0), Pruefsummenvergleich der Rohdaten: alle 24 Dateien unveraendert.

| Befund | Aenderung |
|---|---|
| N3.1 | Bericht (Kopf, Tabelle W1), RF-1-Nachtrag, Offene Punkte 2 und 3 und die Schlusszeile von Nachtrag Fassung 3 angeglichen: Die Antworten zu den Offenen Punkten 6a ("Limitation reicht") und 6b (Datenquellen-Zeile 5 bestaetigt) liegen vor (Daniel Saure, 23.10.2026); das SAP-Erratum 1 (`SAP_Erratum_1_Expertenrat-Budgetabgleich-2030.md`) wurde freigegeben (Commit d20e448). Dokumentiert in `SAP_Bestaetigung_Daniel_Saure_2026-10-23.md` (Abschnitt "Ergaenzung") und im Erratum. Nicht geaendert: SAP, Validierungsbericht, Erratum, Bestaetigungsdatei. |
| N3.2 | Erklaerung zu Fenster C im Bericht korrigiert: Diskretisierungswirkung bei n = 6 (wenige moegliche Ziehungen, auch mit anderen Seeds dieselbe Untergrenze -115,6), kein Zufall. Der Hinweis in der CSV (`posthoc_bootstrap_sensitivitaet.csv`) wurde nicht geaendert; er nennt B und C als abweichend, was fuer C nur im Rahmen von Rundung zutrifft. |
| N3.3 | Achsenmarken der Hauptgrafik `estimand2_overshoot.png` (und Anhangsgrafik) alle 200 Mt, inkl. -400 und -200; visuell geprueft. |

Offen: Fokussierte Pruefung der Fassung 4 durch den validator (nur Dokumentations- und Grafikkorrekturen). Freigabe der Analyse beim Menschen.

# Nachtrag Fassung 5 (nur Dokumentation, N4.1/N4.2), 26.10.2026

Grundlage: Nachtrag 3 des Validierungsberichts (freigabefaehig mit Auflagen, 0 kritisch, 2 gering). Keine Zahl, Grafik oder Aussage geaendert; Skript und Ergebnisdateien nicht angefasst.

| Befund | Aenderung |
|---|---|
| N4.1 | Bericht 2.4: Ueberschrift "Zur Seed-Beschriftung" und die beiden Einleitungssaetze (Wortlaut Fassung 3) wiederhergestellt, Einrueckung unter dem Aufzaehlungspunkt, Fenster-C-Satz schliesst daran an. |
| N4.2 | **Bekannter, bewusst nicht behobener Widerspruch:** Die Spalte `Hinweis` in `output/posthoc_bootstrap_sensitivitaet.csv` sagt weiter "B und C weichen davon ab (Monte-Carlo-Fehler)"; der Bericht (2.4) erklaert C als Diskretisierungswirkung (nahezu gleiche Zeilen). Der Text ist im Skript fest verdrahtet (`Hinweis = ...`); eine Korrektur braeuchte eine Skriptaenderung und wurde nicht vorgenommen. Massgeblich ist der Bericht. Im Bericht (2.4) ebenfalls als bekannt vermerkt. |
