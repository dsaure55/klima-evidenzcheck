# Abweichungsprotokoll – Ausbaupfad Wind an Land und Solar

**SAP:** `SAP_ausbaupfad-wind-solar.md`, Version 1.0, Status final (eingefroren 29.10.2026).
**Skript:** `ausbaupfad-wind-solar.R`; Lauf vom 29.10.2026 (Log: `run_log.txt`).
**Erstellt von:** analyst-Subagent, 29.10.2026.

Dieses Protokoll nennt jede Stelle, an der der SAP etwas offen ließ, an der die
Umsetzung eine Festlegung treffen musste oder an der etwas vom Wortlaut des SAP
abweicht, auch kleine. Eine Entscheidung durch einen Menschen liegt für keinen Punkt
vor; alle Punkte sind deshalb **zur Kenntnisnahme / Bestätigung durch Daniel Saure**
vermerkt. "Post-hoc" heißt hier: nach dem Einfrieren festgelegt, im SAP nicht
vorgegeben.

## 1. Stopp-Regeln des SAP

Keine Stopp-Regel wurde ausgelöst. Geprüft und bestanden (Zahlen in `run_log.txt`,
Abschnitte "SAP 3.3 Größenordnungs-Sperre" und "SAP 3.5 Nr.12"):

| Regel | Ergebnis |
|---|---|
| SHA-256 aller XML-Dateien der Prüfsummenliste (3.1) | 79 von 79 verschiedenen Dateien stimmen überein |
| Statuscode-Auflösung (3.5 Nr.9) | Betriebsstatus 31/35/37/38 und Lage 888/889 aufgelöst, passen in die Kategorien; Systemstatus in den Einheitendateien ausschließlich "Aktiviert" (472) |
| Größenordnungs-Sperre (3.3) | C(Dez 2024) Wind an Land 63,5 GW (0,92 × Ziel 69); Solar 100,8 GW (1,15 × Ziel 88); beide innerhalb 0,5 bis 2 |
| 1-%-Schwelle ohne Stilllegungsdatum (3.5 Nr.2) | Wind an Land 0 Einheiten; Solar 1 Einheit, 0,00001 GW (0,00001 % von C(T)) |
| 0,5-%-Schwelle Überlappung G (3.5 Nr.12 d) | Überlappung: 0 Nummern (Wind und Solar), 0,0 GW |
| Rechenprobe C(m) − C(m−1) = Z − S (3.4) | erfüllt (größte Abweichung 1,4·10⁻⁸ kW; Direktberechnung 7,4·10⁻⁶ kW) |

## 2. Post-hoc-Festlegungen (SAP offen oder mehrdeutig)

| Nr. | SAP-Abschnitt | Festlegung / Abweichung | Grund | Wirkung | Entscheidung Daniel Saure |
|---|---|---|---|---|---|
| A-01 | 3.5 Nr.3 | **Post-hoc.** "Identische Standort-, Datums- und Leistungsangaben" bei verschiedenen Nummern wurde operationalisiert als gleiche `LokationMaStRNummer` + gleiches Inbetriebnahmedatum + gleiche Bruttoleistung + gleiche Technologie. Der SAP definiert "Standort" nicht. Ergebnis: Wind 9 040 Einheiten in 3 508 Gruppen (22,9 GW), Solar 27 843 Einheiten in 12 163 Gruppen (0,9 GW). Nichts wurde entfernt (wie im SAP). Liste: `output/listen/liste_identische_angaben_verschiedene_nummern.csv.gz`. | SAP-Wortlaut nicht eindeutig | keine Wirkung auf Bestand, Z, S | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-02 | 3.5 Nr.3 | **Post-hoc (Auslegung).** Die Duplikatbereinigung erfolgt über Wind und Solar gemeinsam (eine MaStR-Nummer = ein Datensatz). Es wurden keine Dubletten gefunden (0 in Wind, 0 in Solar, 0 über Technologien hinweg). | SAP: "über mehrere Exportdateien" | keine | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-03 | 3.5 Nr.4 | **Post-hoc (Auslegung).** Für Wind auf See (E5) gelten keine harten Leistungsschwellen; die allgemeinen harten Ausschlüsse (Bruttoleistung fehlt oder ≤ 0) wurden auch dort angewendet, die weiche Markierung ab 20 000 kW ebenfalls. Betroffen: 0 Einheiten. | SAP 3.5 Nr.4 letzter Satz | keine | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-04 | 3.5 Nr.1/Nr.5/3.4 | **Post-hoc (Auslegung).** Einheiten mit Betriebsstatus "In Planung" zählen auch dann nicht zum Bestand, wenn ein Inbetriebnahmedatum vorläge (3.4 "in Planung ... zählen nicht"); dieser Fall trat nicht auf (0). Die Einheiten ohne Inbetriebnahmedatum (Wind an Land 8 750 mit 54,0 GW; Solar 66 137 mit 9,6 GW; Wind auf See 91 mit 1,4 GW) haben alle Betriebsstatus "In Planung" (Wind: 8 841 Einheiten mit Status 31 = 8 750 + 91; Solar: 66 137). | SAP 3.4 | keine zusätzliche | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-05 | 3.5 Nr.2 | **Post-hoc (Auslegung).** Stilllegung S zählt nur bei Betriebsstatus "Endgültig stillgelegt" **und** vorhandenem Datum **und** Datum ≥ Inbetriebnahmedatum. "Vorübergehend stillgelegt" bleibt im Bestand. Randfälle: Solar 1 Einheit "endgültig" ohne Datum (im Bestand belassen), 1 Einheit Stilllegung vor Inbetriebnahme, 2 Einheiten mit Datum, aber Status nicht endgültig (jeweils als nicht stillgelegt behandelt, Listen in `output/listen/`). | SAP 3.4, 3.5 Nr.2 | vernachlässigbar (< 0,00002 GW) | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-06 | 3.3, S6 | **Post-hoc (Auslegung).** Für S6 (Nettonennleistung) gilt dieselbe Einheitenmenge wie primär (Filter über Bruttoleistung); eine Einheit mit Nettonennleistung ≤ 0 zählt dort mit 0 (Solar: 1 Einheit). Fehlende Nettonennleistung kam nicht vor (0). Harte/weiche Schwellen wurden nur auf die Bruttoleistung angewendet. | SAP legt Filter für S6 nicht fest | vernachlässigbar | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-07 | 6 S2 | **[methodenrelevant]** **Post-hoc (Auslegung).** In S2 ("Brutto statt Netto") ist die Reihe B(x) = C(T−W) + kumulierter Brutto-Zubau. R, E3 und die Erreichungszeitpunkte in S2 beziehen sich auf B(T) (nicht auf C(T)), da die gesamte Rechnung auf der Brutto-Reihe läuft. B(T) liegt je Fenster verschieden (Wind F12 71,2 / F24 71,9 / F60 73,4 GW; Solar 128,3 / 128,4 / 128,5 GW). Alternative (R aus C(T)) wurde nicht gerechnet. | SAP 6 S2 "gleiche OLS-Fortschreibung" lässt offen, welcher Bestand in R eingeht | betrifft nur S2 | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-08 | 5.3 | **[methodenrelevant]** **Post-hoc (Umsetzung).** Newey-West: `sandwich::NeweyWest(lag = l, prewhite = FALSE, adjust = FALSE)` (Bartlett-Kernel, Gewichte 1 − j/(l+1)), l = ⌊4·(n/100)^(2/9)⌋ = 2, 2, 3 (vom Skript bestätigt). Konfidenzintervall mit t(n−2). Bootstrap: Moving-Block, überlappende Blöcke, Blocklänge ⌈n^(1/3)⌉ = 3, 3, 4 (bestätigt), B = 10 000, `set.seed(20261029)` **unmittelbar vor jeder Technologie-Fenster-Kombination** (nicht einmal global), Residuen der neuen Beobachtung aus den OLS-Residuen gezogen, Perzentilintervalle (Zeitpunkt: Quantil Typ 1 wegen unendlicher Werte, Wert 2030: Typ 7). Zeitpunkt je Wiederholung: erster ganzzahliger Monat x ≥ 0 mit a\* + b\*·x ≥ Ziel (b\* ≤ 0 oder nach 2060: "nicht erreicht", gezählt als obere Grenze). | SAP nennt Parameter, aber nicht alle Implementierungsdetails | betrifft nur S5 | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-09 | 5.2 / 5.3 / E5 | **Post-hoc (Auslegung).** Für E5 (Wind auf See) wurden Diagnostik (DW, Shapiro-Wilk, ACF, QQ, Cook) und Diagnose-Grafiken ebenfalls erstellt (SAP 5.2 nennt "je Technologie"; E5 hat "dieselben Definitionen"). **Nicht** durchgeführt für E5: S5 (Newey-West, Bootstrap) und S1, S2, S4, S6, S7 (SAP sieht sie für E2/E3 der beiden Technologien vor; für E5 nicht ausdrücklich). | SAP E5 knapp | nur zusätzliche Information | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-10 | 2.3 E2 | **Post-hoc (Auslegung).** Ist b ≤ 0, steht für Punkt, "frühestens" und "spätestens" einheitlich "mit dieser Fortschreibung nicht erreicht". Der Fall trat nicht auf (alle b > 0). Ist C(T) ≥ Ziel, steht "Ziel bereits erreicht" (trat nicht auf). | SAP 2.3 | keine | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-11 | 2.3 E1b | **[methodenrelevant]** **Post-hoc (Operationalisierung).** Die Hilfsgröße "linear zwischen den Zielwerten 2024 und 2026 interpolierter Zielwert für den Monat T" wurde zwischen den Stichtagen 31.12.2024 und 31.12.2026 interpoliert: Y(T) = Y₂₀₂₄ + (Y₂₀₂₆ − Y₂₀₂₄)·(T − Dez 2024)/24 Monate (Wind an Land 80,9 GW, Solar 119,7 GW für T = Juli 2026). | SAP legt Interpolationsstützpunkte nicht fest | nur deskriptive Hilfsgröße | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-12 | 2.3 E3 | **Post-hoc (Auslegung).** Für die Kontrollgröße ā_W wird kein Verhältnis zu R gebildet (SAP verlangt s_W/R und R − s_W nur für s_W). Ergebnis ā_W steht in Tabelle 3. | SAP wörtlich | keine | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-13 | 11 | **Post-hoc (Gestaltung).** Grafiken 1 bis 3: Fortschreibungslinien und Bänder enden am 31.12.2030 (SAP verlangt Fortschreibung, nennt keinen Endpunkt der Darstellung); die Fenster sind zusätzlich durch Linientyp unterscheidbar (F12 durchgezogen, F24 lang gestrichelt, F60 punktgestrichelt), weil F12 und F24 bei Solar nahezu zusammenfallen. Zielpfad-Punkte stehen am 31.12. des Zieljahres. | Lesbarkeit | keine Wirkung auf Zahlen | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-14 | 11 Rundung | Tabellen in `output/tabelle*.csv` sind nach SAP gerundet (GW und GW/Jahr: eine Nachkommastelle; Prozent: eine Nachkommastelle; Steigung je Monat: drei Nachkommastellen). Verhältnisse und p-Werte sind mit 3 bzw. 4 Nachkommastellen gerundet, **nicht** mit einer: Spalte `anteil_sW_an_R` erscheint daher in den gerundeten Tabellen mit einer Stelle (zum Beispiel 0,5); der Wert mit voller Genauigkeit steht in `output/zwischen/voll_tabelle3_primaer.csv`. | Rundungsregel des SAP nennt Verhältnisse nicht | Anzeige | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-15 | 3.5 Nr.7 | Die optionale Repowering-Abschätzung wurde **nicht** durchgeführt (SAP: optional, nur bei eindeutiger Standortzuordnung). Es wurden keine Standortfelder (außer `LokationMaStRNummer` für A-01) ausgewertet. | optional | keine | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-16 | 3.2 / S3 | **[methodenrelevant]** Zweitquelle nicht beschafft; Plausibilisierung (3 %-Toleranz, Erreichungszeitpunkte nebeneinander) und **S3 nicht durchgeführt**, Grund: kein Netzzugriff im Analyselauf, im Ordner `rohdaten/` liegt keine Zweitquellen-Reihe. Laut SAP 3.2 ohne Amendment zulässig und blockiert nichts. | SAP 3.2 | S3 und Plausibilisierung fehlen | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| A-17 | 6 S9 | S9 **nicht durchgeführt**, Grund laut SAP: keine Überlappung (0 Nummern). | SAP 6 S9 | keine | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |

## 3. Hinweise zu Daten und Dokumentation (kein SAP-Verstoß, zur Kenntnis)

| Nr. | Befund | Entscheidung Daniel Saure |
|---|---|---|
| H-01 | **Katalognamen:** Die Felddokumentation nennt die Katalogkategorien `Anlagenbetriebsstatus` und `AnlagenSystemStatus`; im Export heißen sie `Betriebsstatus` (Id 4) und `Systemstatus` (Id 19); die Lage-Kategorie heißt `Wind an Land oder auf See` (Id 87). Die Auflösung erfolgte über die Id der Werte (global eindeutig); die Werte passen zu den erwarteten Kategorien. Zuordnung: `output/zuordnungstabelle_codes.csv`. | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-02 | **Prüfsummenliste:** `PRUEFSUMMEN_xml_2026-10-29.txt` enthält 80 Hash-Zeilen (79 verschiedene Dateien; `Einheitentypen.xml` doppelt, identisch) und eine Schlusszeile "fertig 2026-10-29 10:37:56 UTC" ohne Hash (ignoriert). Im Ordner `rohdaten/` liegen 84 XML-Dateien; **fünf nicht geprüft und nicht verwendet**: `Bilanzierungsgebiete.xml`, `Lokationstypen.xml`, `Marktfunktionen.xml`, `Marktrollen.xml`, `Netze.xml` (nicht in der Prüfsummenliste, nicht in der SAP-Aufzählung der behaltenen Dateien). | offen (Bestätigung Daniel offen) |
| H-03 | **Pakete:** `data.table` und `lubridate` sind nicht installiert (SAP 10: "voraussichtlich"). Es wurden Base R, `xml2` (nur Kataloge), `parallel`, `digest`, `lmtest`, `sandwich`, `ggplot2` und `dplyr` (nur `bind_rows`) verwendet. Die Wahl ist im Skript dokumentiert. | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-04 | **Einlesen:** Die Dateien sind UTF-16LE mit BOM; Einlesen chunk-weise (48 MB) mit Zerlegung an den Schluss-Tags und Regex-Feldextraktion, nicht über einen XML-Parser. Zählprobe je Datei (jeder Datensatz genau ein Öffnungs-Tag). Datensätze: Wind 44 340, Solar 6 613 081 (67 Dateien), Geloeschte/Deaktivierte 257 967. Die Dateien wurden nicht verändert. | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-05 | **Schlanke Extrakte:** Pro Datei wurde ein schlankes Extrakt (Nummer, Lokation, Datumsfelder, Statuscodes, Leistungen als Zahlen) in einen Cache-Ordner **außerhalb des Projekts** geschrieben (Scratchpad der Session; Pfad im `run_log.txt`), nicht in `output/zwischen/`. Grund: Die Duplikat- und Überlappungsprüfung braucht Einheitenebene; der Auftrag wollte keine Rohdatensätze in `output/`. Im **Endlauf** wurde der Cache neu aufgebaut (Cache zu Beginn leer, 71 Dateien frisch eingelesen, 15,6 Minuten); er ist für die Reproduktion nicht nötig (das Skript baut ihn selbst). | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-06 | **Listen:** Als `.csv.gz` im Ordner `output/listen/` (komprimiert wegen Größe; zum Beispiel 735 KB für 74 978 Einheiten ohne Inbetriebnahmedatum). | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-07 | **Inbetriebnahmejahre:** Eingeschlossene Einheiten mit Inbetriebnahmejahr ≤ 1990: Wind an Land 46 (0,007 GW), Solar 955 (0,007 GW); davon Jahr 1900: Solar 26 Einheiten (0,0003 GW). Keine Jahre außerhalb 1900 bis 2026. Wirkung auf die Bestandsreihe ab 2019: Anfangsbestand, vernachlässigbar. | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-08 | **Warnungen im Lauf:** R meldet beim Erstellen der Monatsreihen-Tabelle drei Warnungen "Zeilennamen ... verworfen" (benannter Vektor beim Bau eines data.frame). Folgenlos; Zahlen unverändert. | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |
| H-09 | **G-Nummern:** 10 161 G-Datensätze (Einheittypen Gas, Speicher, Verbrauch; keine Wind- oder Solareinheiten) haben Nummern ohne Präfix "SEE" und sind für die Wind/Solar-Prüfung nicht relevant. | bestätigt (Daniel Saure, 30.10.2026, "ja, so") |

## 4. Entwicklungsverlauf (zur Nachvollziehbarkeit)

Das Skript wurde in mehreren Läufen entwickelt (Einlesen, dann Vorprüfungen, dann
Schätzteil). Vor dem Endlauf wurde der Schätzteil einmal gegen den gesicherten Zustand
der Vorprüfungen getestet; dabei sah der Analyst Zwischenergebnisse. **Nach der Sichtung
wurden nach Angabe des Analysten nur Darstellung und Logtexte geändert (nicht verifizierbar, siehe unten)** (Linientyp der Grafiken, Rundung/Beschriftung
einer Logzeile, `unname`-Aufrufe); Methoden, Fenster, Schwellen, Parameter und Populationen
wurden nach Sichtung der Zwischenergebnisse **nicht** verändert. Der dokumentierte Endlauf
(`run_log.txt`) ist ein vollständiger Neulauf von den XML-Dateien (kein Cache).

## 5. Offene Fragen an den Menschen

Keine Stopp-Frage. Zur Bestätigung vorgeschlagen: A-01, A-07, A-08 und A-11 (Festlegungen
mit Einfluss auf berichtete Zahlen in Sensitivitäten bzw. Hilfsgrößen), A-14 (Rundung der
Verhältnisse), A-16 (Verzicht auf Zweitquelle) und H-02 (fünf nicht geprüfte Dateien).

## 6. Nachtrag nach Validierungsbericht vom 30.10.2026 (Auflagen)

- **Spalte "Entscheidung Daniel Saure" (Auflage M-1, SAP 13):** In den Tabellen A-01 bis A-17 und H-01 bis H-09 wurde die Spalte ergänzt. **Alle Einträge stehen auf "offen"; nichts ist als bestätigt eingetragen.** Als **methodenrelevant** markiert (Wirkung auf Sensitivitäten bzw. Hilfsgrößen, nicht auf E1 bis E4 der Primäranalyse): **A-07, A-08, A-11, A-16**. Der Validierungsbericht verlangt die ausdrückliche Bestätigung von A-01, A-07, A-08, A-11, A-14, A-16 und H-02 durch Daniel Saure.
- **Testlauf nicht verifizierbar (Auflage M-5):** Die Skriptversion des Testlaufs (Entwicklungsdatei mit Zwischenzustand im Scratchpad der Session) und das Log des Testlaufs sind **nicht erhalten**. Der Endlauf hat `run_log.txt` und `output/` überschrieben, und vor dem Testlauf gibt es keinen Commit. Die Aussage in Abschnitt 4, nach Sichtung der Zwischenergebnisse seien nur Darstellung, Logtexte, Beschriftungen und `unname`-Aufrufe geändert worden, ist daher **nicht verifizierbar**. Laut Validierungsbericht ist der Schätzteil des Endskripts zeilengleich mit der Arbeitsdatei und zeigt keine ergebnisabhängige Wahl. Künftig ist das Skript vor jedem Testlauf zu committen.
- **G-5 nicht umgesetzt:** Die Grafiktitel enthalten "Paragraf 4 EEG" statt "§ 4 EEG". Eine Änderung erfordert einen Neulauf zur Neuerstellung der PNG-Dateien; dieser war für den Nachtrag ausdrücklich nicht vorgesehen. Skript und Grafiken blieben unverändert.

## 7. Entscheidungen von Daniel Saure (30.10.2026)

Daniel Saure hat Analysebericht und Abweichungsprotokoll gelesen (Chat: „Lesen, dann entscheiden“, dann „Freigabe alle 5 Dateien. Alles gut so, weiter bitte“; auf meine Rückfrage zur genauen Bedeutung: „ja, so“). Gemeint und eingetragen sind: (1) die fünf nicht geprüften XML-Dateien (H-02) sind in Ordnung, sie wurden nicht verwendet; (2) alle Festlegungen A-01 bis A-17 und Hinweise H-01 bis H-09, darunter die methodenrelevanten A-07, A-08, A-11 und A-16, sind bestätigt; (3) die Ergebnisse sind freigegeben, siehe `Freigabe_Ergebnisse_Daniel_Saure_2026-10-30.md`. Bestehen bleiben: G-5 (Grafiktitel „Paragraf“, beim nächsten Neulauf), die fehlende Zweitquelle (in jedem Text zu nennen, Abgleich nachholen oder Lücke ausweisen) und die nicht verifizierbare Testlauf-Version (M-5).
