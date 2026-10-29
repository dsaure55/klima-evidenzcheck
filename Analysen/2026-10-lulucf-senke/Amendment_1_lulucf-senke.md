# Amendment (Erratum) 1 zum SAP LULUCF-Senke

**Bezug:** `Analysen/2026-10-lulucf-senke/SAP_lulucf-senke.md`, Version 1.0 (final, eingefroren und freigegeben am 29.10.2026). Der SAP selbst wird durch diese Datei **nicht** verändert.
**Titel:** Datenquellen neu geordnet, Prüfregeln beim ersten Öffnen und vorab festgelegter Rückfall bei Lücken in der UBA-PDF-Tabelle.
**Amendment-Version:** 1.0 (freigegeben)
**Datum:** 29.10.2026
**Autor:in:** Claude (sap-autor-Subagent). Volltext von Daniel Saure gelesen und freigegeben am 29.10.2026.
**Status: final (freigegeben am 29.10.2026).** Das Amendment ist wirksam; der analyst darf mit den Festlegungen unten fortsetzen.
**Freigabe:** Freigegeben durch Daniel Saure am 29.10.2026 (Volltext gelesen; Wortlaut im Chat: „Gelesen, freigeben“; damit bestätigt: Schwelle 0,5 Mt je Jahr, Stichprobenjahre 1990, 2000, 2010, 2020, 2024, Rückfall, Zusatzregeln zu Quelle 2 und zur Summe der Kategorien).

Alle Festlegungen unten sind **Vorschläge für Daniel Saure** und wurden **vor dem Öffnen** der beiden Excel-Dateien getroffen. Niemand hat deren Inhalt gesehen.

---

## 1. Grund

Der analyst hat die Analyse nach SAP 2.1 gestoppt (Dokumentation: `Abweichungsprotokoll_lulucf-senke.md`, 29.10.2026). Befunde beim ersten Öffnen der UBA-PDF-Tabelle `rohdaten/2_Tab_Emi-Senken-LULUCF_2026-07-02.pdf`:

1. **Jahre fehlen.** Die Spalten lauten 1990 bis 1995, 2000, 2005 und 2006 bis 2025. Die Jahre **1996 bis 1999 und 2001 bis 2004 sind nicht enthalten.** SAP 3.5 Nr. 2 verlangt eine lückenlose Reihe 1990 bis 2024 und verbietet Auffüllen und Interpolation. Fenster A (1990 bis 2024, n = 35) ist mit dieser Datei nicht durchführbar. Fenster B (2010 bis 2024), C, D und der Messwert M(2024) sind nach den Spaltenköpfen vollständig.
2. **Fußnote zur Fassung.** Die Quellenzeile nennt „Inventare 1990 bis 2022, Stand 03/2024", was nicht zu Submission 2026 (SAP 2.1, 3.2) passt, obwohl die Datei Spalten für 2024 und 2025 enthält. Ob die Fußnote veraltet ist oder die Datei eine ältere Fassung ist, ist nicht entscheidbar, ohne zu raten.
3. **Extraktionsqualität.** Die Textebene der PDF ist zerstückelt; eine verlässliche Zuordnung von Jahr und Wert braucht Sichtprüfung der Seite als Bild.

Daniel Saure hat am 29.10.2026 (Chat: „ja") dem Herunterladen zweier Excel-Dateien zugestimmt. Sie liegen unter `rohdaten/` (Herkunft und Größe in `PROVENIENZ.txt`, SHA-256 in `PRUEFSUMMEN.txt`):

- **Quelle 1:** `2026_EM_Entwicklung_in_D_Trendtabelle_THG.xlsx` („Nationale THG-Trendtabellen 1990–2024", UBA, 15.01.2026, 303.891 Bytes, SHA-256 `779fb78d…89a7`).
- **Quelle 2:** `Emissionsuebersichten_KSG-Sektoren_1990-2025.xlsx` (UBA, Eintrag vom 15.03.2026, 776.757 Bytes, SHA-256 `bbbb49cb…853a`).

Ob eine der beiden Dateien die Landnutzung (LULUCF) als vollständige Jahresreihe nach Kategorien oder als Gesamtsektor führt, ist **unbekannt**. Das Amendment legt deshalb jetzt fest, wie mit jedem möglichen Befund umzugehen ist, damit die Analyse nicht ein weiteres Mal stoppen muss.

## 2. Änderung (Vorschläge)

### 2.1 Datenquellen neu geordnet

| Rolle | Datei | Verwendung |
|---|---|---|
| **Primärquelle der Jahreswerte** | Quelle 1 (Trendtabelle THG, Submission 2026, 1990–2024) | Alle Jahreswerte E(y) der Primärreihe (LULUCF inkl. HWP), sofern die Prüfregeln 2.2 erfüllt sind |
| Kontrollquelle | UBA-PDF-Tabelle (Jahre 1990–1995, 2000, 2005, 2006–2025) | Abgleich der überlappenden Jahre (2.3) |
| Kontrollquelle und Quelle der 2025-Schätzung | Quelle 2 (KSG-Sektoren, 1990–2025) | Abgleich der überlappenden Jahre (2.3); Wert für 2025 in S7 (laut UBA „unsichere" Schätzung, kein Inventarwert) |

**Zusatzregel (Ergänzung des Autors, im Auftrag nicht ausdrücklich genannt, von Daniel zu bestätigen):** Enthält Quelle 1 die Landnutzung **nicht** lückenlos 1990–2024, Quelle 2 aber doch (Gesamtsektor inkl. HWP, Submission 2026 laut Dateikopf oder Eintrag, Jahre 1990–2024), wird Quelle 2 an Stelle von Quelle 1 zur Primärquelle, und Quelle 1 sowie die PDF dienen der Kontrolle. Das Vorgehen ist sonst identisch.

Für S7 gilt: der Wert für 2025 wird aus Quelle 2 genommen; fehlt er dort, aus der PDF-Tabelle. Weichen beide ab, wird die Abweichung berichtet; S7 wird nur mit **einem** Wert gerechnet (Quelle 2).

Fenster A ist **wieder durchführbar**, wenn die gewählte Primärquelle 1990 bis 2024 lückenlos enthält.

### 2.2 Prüfregeln beim ersten Öffnen (vorab festgelegt)

Der analyst prüft in dieser Reihenfolge und dokumentiert jede Antwort im Run-Log, **bevor** irgendein Wert ausgewertet wird:

1. **Integrität der Eingaben:** SHA-256 und Größe beider Excel-Dateien und der PDF gegen `PRUEFSUMMEN.txt` bzw. `PROVENIENZ.txt`.
2. **Fassung:** Welche Submission und welcher Stand sind im Dateikopf, auf den Blättern oder in Fußnoten angegeben? Wortlaut dokumentieren. Nicht „Submission 2026" ist ein Hinweis, kein stillschweigender Wechsel der Referenz.
3. **Jahresreihe vollständig 1990–2024?** Jedes Jahr einzeln, ohne Lücke. Fehlt ein Jahr, ist die Reihe unvollständig (kein Auffüllen, **keine Interpolation**).
4. **Kategorien:** Ist der **Gesamtsektor LULUCF** ausgewiesen? Ist **HWP** (Holzprodukte) als eigene Zeile ausgewiesen (für S5)? Ist Gesamtsektor inkl. HWP eindeutig erkennbar? Fehlt eine ausgewiesene Gesamtzeile, aber alle Kategorien inkl. HWP sind lückenlos vorhanden, ist der Gesamtwert die Summe der Kategorien (dokumentierte Rechenregel; Vorschlag, von Daniel zu bestätigen); sonst gilt die Reihe als nicht vorhanden.
5. **Einheit und Vorzeichen:** Einheit (Mt oder kt CO2-Äq.; bei kt Umrechnung durch 1.000, dokumentiert) und Vorzeichenkonvention der Quelle (SAP-Konvention: positiv = Quelle, negativ = Senke) festhalten; eine Umkehr wird dokumentiert.
6. **Kein Auffüllen, keine Interpolation, keine Ersetzung fehlender Jahre durch Werte aus einer anderen Quelle.** Jahre aus verschiedenen Quellen werden nicht zu einer Reihe zusammengesetzt (kein „Splicing"), es sei denn, die Quellen sind nach 2.3 übereinstimmend und die Primärreihe stammt vollständig aus **einer** Datei.
7. **Import:** maschinenlesbar aus den Excel-Dateien (kein Verfahren der doppelten Übertragung nötig). Der Import verändert die Rohdateien nicht.

### 2.3 Abgleich überlappender Jahre (Kontrolle)

- **Stichprobe:** Mindestens **5 Jahre** der Primärreihe werden gegen die PDF-Tabelle abgeglichen. Vorab festgelegt: **1990, 2000, 2010, 2020 und 2024**; alle liegen als Spalten in der PDF. Weitere Jahre dürfen zusätzlich abgeglichen werden, ersetzen aber keines der fünf. Da die Textebene der PDF zerstückelt ist, werden die PDF-Werte **per Sichtprüfung der Seite als Bild** abgelesen und doppelt übertragen (SAP 3.5 Nr. 4, nur für diese Stichprobe).
- Zusätzlich Abgleich aller überlappenden Jahre gegen Quelle 2, soweit deren Landnutzung ausgewiesen ist (maschinell, alle Jahre).
- **Regel:** Die Primärquelle gilt. Die Kontrollquellen verändern keinen Wert der Primärreihe.
- **Schwelle (Vorschlag, von Daniel zu bestätigen): 0,5 Mt CO2-Äq. je Jahr** (absolut). Dieselbe Toleranz wie die Summenprüfung in SAP 3.5 Nr. 5 (Rundung; eine relative Toleranz ist bei Werten nahe null ungeeignet). Eine Abweichung ≤ 0,5 Mt gilt als übereinstimmend. Eine Abweichung > 0,5 Mt wird mit Jahr, beiden Werten, Differenz und Quellen dokumentiert, löst aber keine Änderung der Primärreihe aus.
- **Systematische Abweichung:** Weichen mindestens 3 der abgeglichenen Jahre um mehr als die Schwelle ab, lautet der Berichtshinweis „Die Kontrollquelle gehört vermutlich zu einer anderen Fassung (vgl. Fußnote „Stand 03/2024")". Das wird berichtet, ändert weder die Primärreihe noch die Fensterdefinitionen. Die Fußnotenfrage (ist sie veraltet oder die Datei eine ältere Fassung?) wird **nach dem Öffnen am Abgleich der überlappenden Jahre** beantwortet und bleibt bis dahin ein Hinweis.
- Ein Abgleich PDF gegen Quelle 1 ist **kein Ersatz für S4** (frühere Submissions); Unterschiede werden nur beschreibend im Revisionshinweis genannt. S4 bleibt wie im SAP.

### 2.4 Vorab festgelegter Rückfall

Der Rückfall wird nur nach den Prüfregeln in 2.2 ausgelöst, nicht nach Sicht der Werte oder der Ergebnisse.

1. **Quelle 1 oder Quelle 2 enthält die Landnutzung lückenlos 1990–2024** (nach 2.1/2.2): Alles läuft wie im SAP, mit der gewählten Primärquelle. Fenster A ist durchführbar.
2. **Weder Quelle 1 noch Quelle 2 enthält die Landnutzung als lückenlose Jahresreihe 1990–2024:** Fenster A entfällt als **„nicht durchführbar, Datenlücke"** (kein Auffüllen, keine Interpolation). Fenster **B, C, D**, der Messwert **M(2024)** und die Sensitivitäten laufen mit der **PDF-Tabelle** (Jahre 2006 bis 2025) weiter, soweit die jeweils benötigten Jahre vollständig sind. Die Werte werden per Sichtprüfung als Bild doppelt übertragen (SAP 3.5 Nr. 4). Bei Abweichungen zwischen Fassungen gilt Quelle 1, soweit Quelle 1 den betreffenden Wert enthält. Im Bericht wird gekennzeichnet, dass die Fassung der PDF nicht eindeutig belegt ist (Fußnote „Stand 03/2024").
3. **Wenn für die Jahre 2010 bis 2024 (Fenster B) in keiner Quelle eine lückenlose Reihe vorliegt:** Stopp und Rückfrage an Daniel, kein Weiterrechnen.

Diese Entscheidung wird **vorab** getroffen und von Daniel mitfreigegeben. Der Ausfall von Fenster A in Fall 2 ist keine Auswahl nach Ergebnissen, sondern eine Folge der Datenlücke.

## 3. Auswirkung auf die Estimands

| Estimand / Größe | Fall 1 (lückenlose Reihe) | Fall 2 (Rückfall) |
|---|---|---|
| E1 (D30 mit M(2024)) | unverändert | unverändert (2021–2024 sind in der PDF vorhanden) |
| E2 (Trendfortschreibung) | unverändert, drei Fenster A, B, C | nur Fenster B (primär) und C; Fenster A „nicht durchführbar, Datenlücke" |
| E3 (nötige und beobachtete Rate) | unverändert | r_obs(A) entfällt; r_obs(B), r_obs(C), r_obs5, r_obs10 und Q unverändert (r_obs10 benötigt M(2014), Jahre 2011–2014 liegen in der PDF vor) |
| E4 (Abstand 2045, D40) | unverändert | unverändert |
| Primärfenster B (2010–2024) | unverändert | unverändert (Quelle: PDF) |

Folgen im Fall 2 für die abhängigen Regeln, ohne weitere Entscheidung: Die Gesamtaussage nach SAP 5.6 und die Holm-Anpassung nach 5.5 beziehen sich auf die **durchführbaren** Fenster (B und C). Die ARIMA-Kontrolle S1 läuft nur für Fenster B (n ≥ 10). S6c (Niveausprung) läuft nur in Fenster B. Der Bericht nennt ausdrücklich den Grund „Datenlücke in der Quelle" und führt keine Ersatzrechnung für Fenster A ein.

## 4. Betroffene SAP-Abschnitte

Betroffen: 3.1 (Bezugsdateien), 3.4 (Beschaffung: zwei Excel-Dateien mit Zustimmung vom 29.10.2026), 3.5 Nr. 2 und Nr. 4 (Vollständigkeit, Extraktion: maschinenlesbarer Import statt Doppelübertragung, Stichprobenabgleich), 3.5 Nr. 6 (Übertragungskontrolle), 4.1 und 4.2 (Fenster A bedingt), 5.1, 5.5 und 5.6 (Gesamtaussage und Holm bei Ausfall von A), 6 (S1, S6c bei Ausfall von A; S7: Quelle der 2025-Schätzung), 7 Nr. 1 („alle drei Fenster" gilt für alle durchführbaren), 11 (Tabellen und Grafiken ohne Fenster A im Fall 2), 12 (K7), 13 (Rohdateien), 14 (Validierungsbogen V2, V4, V6, V11), 16 (Abweichungsprotokoll).

**Unverändert bleiben:** der Messwert M(T) als 4-Jahres-Mittel, das Primärfenster B (2010–2024), Y = 2024, die Primärreihe (LULUCF inkl. HWP), das Modell und die Intervallformel (2.2), die Entscheidungsregeln 5.6, die Methodenparameter 5.7, die Kernzahlen, die Sensitivitäten S2, S3, S4 und S5 (S5 nur, wenn HWP als eigene Jahreswerte vorliegt), und die Festlegung **keine Extrapolation auf 2040/2045**.

Der SAP wird erst nach Freigabe dieses Amendments im Abschnitt 17 (Amendments) durch den Menschen auf dieses Dokument verwiesen; der analyst arbeitet bis dahin nicht weiter.

## 5. Offenlegung

- **Die beiden Excel-Dateien wurden nicht geöffnet.** Geprüft wurden nur Dateityp (ZIP-Container) und Größe. Niemand kennt ihren Inhalt, auch nicht, ob sie die Landnutzung enthalten.
- **Die PDF-Tabelle** wurde vom analyst mit pdftotext geöffnet (Spaltenköpfe, Fußnote, Kategoriezeilen) und vom Orchestrator nur auf Spaltenköpfe und Quellenzeile geprüft. Das Abweichungsprotokoll nennt keine Datenwerte. Ob einzelne Werte der Textebene wahrgenommen wurden, ist nicht dokumentiert. **Datenwerte der Jahre 1996 bis 1999 und 2001 bis 2004 sind niemandem bekannt**, weil sie in der Datei nicht enthalten sind.
- Alle Festlegungen in diesem Amendment sind unabhängig von Datenwerten getroffen; es wurden keine Ergebnisse berechnet.
- Das bisherige Vorwissen (Abschnitt 0 des SAP) bleibt unverändert und gilt weiter.
- Die Fußnotenfrage („Inventare 1990 bis 2022, Stand 03/2024") ist nicht beantwortet, sondern ein offener Hinweis.

## 6. Offen für Daniel Saure (vor der Freigabe)

1. **Volltext des Amendments lesen.**
2. **Schwelle** für den Abgleich der überlappenden Jahre bestätigen oder ändern (Vorschlag: 0,5 Mt je Jahr; Abschnitt 2.3), ebenso die Stichprobenjahre 1990, 2000, 2010, 2020, 2024 und die Regel „mindestens 3 abweichende Jahre = vermutlich andere Fassung".
3. **Rückfall** bestätigen (Abschnitt 2.4): Fenster A entfällt bei Datenlücke, die Fenster B, C, D, M(2024) und die Sensitivitäten laufen mit der PDF-Tabelle weiter, bei Abweichung gilt Quelle 1.
4. **Zusatzregel** zu Quelle 2 als Primärquelle (Abschnitt 2.1) und die **Rechenregel „Gesamtsektor = Summe der Kategorien"** (Abschnitt 2.2 Nr. 4) bestätigen oder streichen.

## 7. Freigabe

**Freigabe:** Freigegeben durch Daniel Saure am 29.10.2026 (siehe Kopf).

(Leer. Die Freigabe schreibt ausschließlich Daniel Saure, nachdem er den vollständigen Text dieses Amendments gelesen hat. Erst danach wird der SAP im Abschnitt 17 auf dieses Amendment verwiesen.)
