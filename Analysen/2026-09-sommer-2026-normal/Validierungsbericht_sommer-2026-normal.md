# Validierungsbericht – Schnellcheck "Sommer 2026 – ganz normal?"

**Datum:** 11.09.2026
**Rolle:** validator (unabhängiger Agent)
**Maßstab:** SAP v1.0 final (eingefroren 11.09.2026)
**Gesamturteil (Erstprüfung):** **freigabefähig mit Auflagen** (Details in Abschnitt 9)
**Aktualisiert nach Revision 1:** freigabefähig mit Auflagen, offen nur noch AV9 und AV11 (siehe "Nachtrag: Nachkontrolle Revision 1" am Ende)
**Aktualisiert nach Revision 1a:** freigabefähig mit Auflagen, offen AV9 und ein redaktioneller Rest von AV11 (Funktionsangabe) (siehe "Nachtrag 2" am Ende)
**Aktualisiert nach Nachtrag 3 (Kanal-Entwürfe):** Analyse freigabefähig mit Auflagen, offen nur AV9 (AV11 erledigt); Kanal-Entwürfe numerisch korrekt, vor Veröffentlichung Änderungswünsche Ä1–Ä5 umsetzen (siehe "Nachtrag 3" am Ende)

Dieser Bericht enthält keine Freigabe. Ob und wann veröffentlicht wird, entscheidet der Mensch.

---

## 1. Vorgehen und Unabhängigkeit

1. Zuerst habe ich nur den SAP und die CSV gelesen. Code, Output und Bericht des Analysten habe ich in dieser Phase nicht angesehen.
2. Danach habe ich eigenen Code neu geschrieben und ausgeführt: `validierung/validierung.py`, Ergebnisse in `validierung/validierung_ergebnisse.json`. Verwendet: Python 3.11.15, numpy 2.4.4, scipy 1.17.1, pandas 3.0.2.
3. Erst dann habe ich die Zahlen mit `output/` verglichen und den Code des Analysten gelesen. Das Analystenskript lief zusätzlich in einer Kopie im Scratchpad. Ergebnis: `ergebnisse.json`, `tabelle1_E1.csv`, `tabelle2_E2.csv` und `run_log.txt` sind byte-identisch mit den abgelegten Dateien. Die Originaldateien habe ich nicht verändert.
4. Zum Schluss habe ich den Bericht, das Abweichungsprotokoll und die Grafiken geprüft.

**Grenzen der Unabhängigkeit:**
- Analyst und Validator nutzen denselben Software-Stack (Python/numpy/scipy). Siehe dazu A1.
- Wegen A1 ist das keine softwareunabhängige Prüfung, zum Beispiel beim Shapiro-Wilk-Test aus scipy.
- Für den Bootstrap habe ich unabhängig denselben datumsbasierten Seed (20260911) und denselben Generator gewählt. Die S6-Ergebnisse sind deshalb bitgleich.
- Deshalb habe ich S6 zusätzlich mit anderen Seeds gerechnet (Abschnitt 3.6).

## 2. Geprüfte Dateien

| Datei | geprüft |
|---|---|
| `SAP_sommer-2026-normal.md` | vollständig |
| `rohdaten/dwd_sommer_deutschland.csv` (SHA-256 `d1c7a120…04a7ca`) | vollständig. Ein Abgleich mit der DWD-Originaldatei war **nicht möglich** (siehe A2). |
| `sommer_2026_normal.py` | vollständig, Code-Review und Re-Run |
| `grafiken.py` | Code gelesen, **nicht neu ausgeführt** |
| `output/ergebnisse.json`, `tabelle1_E1.csv`, `tabelle2_E2.csv`, `run_log.txt` | vollständig |
| `output/grafik1_sommer_2026.png`, `output/diagnostik_primaermodell.png` | visuell geprüft. Die SVG-Datei habe ich nicht geprüft. |
| `Analysebericht_sommer-2026-normal.md` | vollständig |
| `Abweichungsprotokoll_sommer-2026-normal.md` | vollständig |

## 3. Vergleich eigene Zahlen vs. Analyst

Unter "Abweichung" steht die Differenz Validator − Analyst (ungerundet).

### 3.1 Integritätscheck (SAP 3)

| Größe | Validator | Analyst | Abweichung |
|---|---|---|---|
| Datensätze / lückenlos / Fehlwerte | 146 / ja / 0 | 146 / ja (assert) | – |
| Wert 2026 (gerundet) | 19,55 (19,6) | 19,55 (19,6) | 0 |
| Wert 2003 (gerundet) | 19,67 (19,7) | 19,67 (19,7) | 0 |
| Mittel 1961–1990 / Abweichung 2026 | 16,267 / +3,283 K | 16,267 / +3,283 K | 0 |
| Mittel 1991–2020 / Abweichung 2026 | 17,553 / +1,997 K | 17,553 / +1,997 K | 0 |
| Rang 2026 seit 1881 | 2 | 2 | 0 |
| Prüfsummen CSV: n / Σ Wert / Σ Jahr·Wert | 146 / 2426,71 / 4 744 075,36 | laut Bericht identisch | 0 (nur CSV-seitig) |
| Check (a) und (b) bestanden | ja | ja | – |

### 3.2 E1

| Größe | Validator | Analyst | Abweichung |
|---|---|---|---|
| **R1** SD | 0,79337 | 0,79337 | 0 |
| R1 z / Rang / Wiederkehr | 4,1380 / 1 von 31 / 57 092 J. | 4,1380 / 1 / 57 092 | 0 |
| R1 Einstufung / S5 (P10–P90) | extrem außergewöhnlich / außerhalb (15,41–17,28) | identisch | – |
| **R2** SD | 0,89844 | 0,89844 | 0 |
| R2 z / Rang / Wiederkehr | 2,2228 / 2 von 31 / 76,2 J. | 2,2228 / 2 / 76,2 | 0 |
| R2 Einstufung / S5 (P10–P90) | außergewöhnlich warm / außerhalb (16,62–18,46) | identisch | – |
| **R3** ŷ₂₀₂₆ / Abweichung | 18,4716 / +1,0784 K | 18,4716 / +1,0784 | 0 |
| R3 SD Prognosefehler (h₂₀₂₆ = 0,0747) | 0,85654 | 0,85654 | 0 |
| R3 95 %-PI / 19,55 darin | 16,754–20,190 / ja | 16,754–20,190 / ja | 0 |
| R3 z / Wiederkehr / Einstufung | 1,2590 / 9,61 J. / ungewöhnlich warm | identisch | 0 |
| R3 S5: P10 / P90 der Residuen / innerhalb 80 % | −0,912 / +1,165 / ja | identisch | 0 |
| Grenznähe nach SAP 8.6 (R1–R3) | keine | keine | – |

### 3.3 Primärmodell und Diagnostik

| Größe | Validator | Analyst | Abweichung |
|---|---|---|---|
| n / df | 55 / 53 | 55 / 53 | – |
| Steigung (K/Jahrzehnt) | 0,45518 | 0,45518 | 0 |
| 95 %-KI Steigung | 0,3144–0,5959 | 0,3144–0,5959 | 0 |
| Residual-SD σ̂ | 0,82622 | 0,82622 | 0 |
| Durbin-Watson | 1,9151 | 1,9151 | 0 |
| DW-p einseitig (Monte Carlo) | 0,3237 (200 000 Sim.) | 0,3241 (100 000 Sim.) | −0,0004 (MC-Rauschen) |
| DW-p zweiseitig | 0,647 | nicht berichtet | – |
| Shapiro-Wilk W / p | 0,94527 / 0,01429 | 0,94527 / 0,01429 | 0 |
| Schiefe / Exzess der Residuen | +0,70 / −0,20 | nicht berichtet | – |
| ACF Lag 1–5 | 0,037 / −0,094 / 0,049 / −0,142 / −0,163 | identisch | 0 |
| AIC linear / quadratisch | 139,047 / 139,710 | 139,047 / 139,710 | 0 |
| Cook's D > 4/n | 1976, 1983, 2003 (D ≤ 0,089) | identisch | 0 |

### 3.4 E2 Primär und S1, S2, S5, S6

Die Werte sind ungerundete Kalenderjahre, das KI ist ein 95 %-KI nach Fieller.

| Modell | Größe | Validator | Analyst | Abweichung |
|---|---|---|---|---|
| **Primär OLS 1971–2025** | E2a t\* [KI] | 2050,79 [2037,60; 2075,15] | 2050,79 [2037,60; 2075,15] | 0 |
| | E2b t\*\* [KI] | 2032,64 [2023,38; 2049,22] | 2032,64 [2023,38; 2049,22] | 0 |
| S1 OLS 1961–2025 | Steigung / E2a | 0,4095 / 2055,73 [2042,13; 2078,31] | identisch | 0 |
| | E2b | 2036,16 [2026,29; 2052,22] | identisch | 0 |
| | R3-z | 1,413 | 1,413 | 0 |
| S1 OLS 1991–2025 | Steigung / E2a | 0,4552 / 2050,05 [2033,71; 2111,69] | identisch | 0 |
| | E2b | 2032,67 [2022,31; 2069,62] | identisch | 0 |
| | R3-z | 1,248 | 1,248 | 0 |
| S2 OLS 1971–2026 | Steigung / E2a | 0,4755 / 2048,16 [2036,26; 2069,14] | identisch | 0 |
| | E2b | 2030,68 [2022,34; 2044,92] | identisch | 0 |
| S5 E2b (Trend ≥ 19,6 − P90 der Residuen) | t\*\* [KI] | 2025,19 [2017,43; 2038,69] | identisch | 0 |
| S6 Bootstrap, Seed 20260911 | E2a Median [Perzentil-KI] | 2050,67 [2037,38; 2073,21] | identisch | 0 (gleicher Seed) |
| | E2b Median [Perzentil-KI] | 2032,92 [2022,44; 2049,22] | identisch | 0 |
| Post-hoc Schwelle 19,55 (A7) | E2a / E2b | 2049,69 / 2031,54 | 2049,69 / 2031,54 | 0 |
| Abgleich 2056 | im KI E2a / E2b | ja / nein (nach dem KI) | ja / nein | – |

### 3.5 Plausibilitätsprüfung S3 und S4 (nicht vollständig nachgebaut)

| Größe | Validator (vereinfachter Nachbau) | Analyst | Bewertung |
|---|---|---|---|
| S3 Bruchpunkt | 1985,5 (Raster 0,25 J.) | 1985,4 (Raster 0,1 J.) | plausibel |
| S3 Steigung vor / nach Bruch (K/Jz.) | 0,036 / 0,535 | 0,036 / 0,533 | plausibel |
| S3 E2a / E2b (Punkt) | 2044,5 / 2030,1 | 2044,6 / 2030,2 | plausibel. Die KI von S3 habe ich nicht nachgerechnet. |
| S4 Modell | ARIMA(0,1,1) mit Drift, CSS (nur Kontrolle) | ARIMA(1,1,2) mit Drift, CSS, AICc | ΔAICc zu (0,1,1) nur 0,37, Modellwahl praktisch unentschieden |
| S4 Drift (K/Jz.) | 0,381 | 0,375 | plausibel |
| S4 Prognose 2026 [95 %-PI] | 18,44 [16,72; 20,16] | 18,33 [16,68; 19,98] | plausibel, 19,55 in beiden PI |
| S4 Jahr, in dem 19,6 °C erreicht wird | 2056,4 | 2058 (erstes ganzes Jahr ≥ 19,6) | plausibel, Abstand zum Primärmodell < 10 J. |

Den Prognosepfad des Analysten habe ich in der Kopie ausgelesen: 2056: 19,53, 2057: 19,57, 2058: 19,61. Der Wert 2058 ist damit korrekt aus dem gewählten Modell abgeleitet.

### 3.6 Zusätzliche Robustheitsläufe des Validators (nicht im SAP)

| Variante | E2a-KI | E2b-KI |
|---|---|---|
| S6, Seed 1 | 2038,1–2073,4 | 2022,9–2049,5 |
| S6, Seed 987654 | 2037,9–2073,9 | 2022,8–2050,3 |
| S6, Seed 1, Residuen reskaliert mit √(n/(n−2)) | 2038,0–2074,0 | 2022,5–2049,4 |
| Newey-West (Bartlett, Lag 1/3/4, zur Info, nicht ausgelöst) | ca. 2038–2073 | ca. 2024–2047 |

Die Bootstrap-KI sind gegenüber dem Seed und der Reskalierung stabil. Die Abweichungen betragen höchstens etwa 1 Jahr.

**Fazit Abschnitt 3:**
- Alle nachgerechneten Zahlen stimmen mit dem Analysten überein, bis auf Rundungs- und Monte-Carlo-Rauschen.
- S3 und S4 sind in plausibler Größenordnung.
- Rechenfehler habe ich nicht gefunden.

## 4. Code-Review `sommer_2026_normal.py`

**Korrekt umgesetzt:**
- **Formeln und Freiheitsgrade:** OLS, df = n − 2, t-Quantil mit df 53, Prognosefehler-SD √(σ̂²(1+h)).
- **Fieller:** Die quadratische Ungleichung ist korrekt hergeleitet, einschließlich Kovarianzterm. Beschränktheit gilt nur, wenn a > 0 und die Diskriminante > 0 ist. Die Zentrierung auf 2000 ist korrekt zurückgerechnet.
- **Einstufung:** Grenzen inklusive, wie im SAP ("≤ 1", "> 1 bis ≤ 2" usw.).
- **Grenznah-Regel:** ±0,1 um 1, 2 und 3.
- **Rang:** unter 31 Werten.
- **Weitere Punkte:** Integritätsstopp, Cook's D mit k = 2, AIC wie `stats::AIC`, PACF nach Durbin-Levinson.
- **Bootstrap:** Residuen-Bootstrap mit neuem σ̂ je Replikat für t\*\*.
- **Schwelle:** 19,6 wie im SAP. Die Rechnung mit 19,55 ist sauber als post-hoc gekennzeichnet.

**Auffälligkeiten im Code** (Einstufung der Schwere in Abschnitt 6):
1. **`tabelle2_E2.csv` ohne S5-Zeile.** Das S5-Ergebnis zu E2b wird nur in `E2[0]["S5_E2b_p90"]` gespeichert und nicht als Tabellenzeile ausgegeben. SAP 11 verlangt "Primär + S1–S6". Im Analysebericht steht S5 dagegen in der Tabelle.
2. **`tabelle2_E2.csv`, Spalte E2b als Kommazahl ("2033.0").** Ursache: Die S4-Zeile hat kein E2b, pandas füllt NaN auf und macht die Spalte zu float. SAP 11 verlangt ganzzahlige Jahre.
3. **Steigung in Tabelle 2 auf 0,1 K/Jz. gerundet.** 0,41 und 0,46 erscheinen dann als 0,4 und 0,5 und wirken wie ein doppelt so großer Unterschied. Der Bericht selbst nennt 0,46.
4. **Multiplizitäts-Check (SAP 7) vergleicht nur Punktschätzer.**
   - S5 fehlt in der Schleife, weil es nicht als eigene Zeile in `E2` steht. Folgen hat das nicht: S5 liegt 7,5 Jahre neben dem Primärwert.
   - Die KI-Grenzen weichen teils deutlich stärker ab (Tabelle unten).

   | Sensitivität | Größe | Abweichung vom Primärergebnis |
   |---|---|---|
   | S1 1991–2025 | E2a obere KI-Grenze | +36,5 J. (2112 statt 2075) |
   | S1 1991–2025 | E2b obere KI-Grenze | +20,4 J. |
   | S3 | E2a obere KI-Grenze | −13,2 J. |
   | S5 | E2b obere KI-Grenze | −10,5 J. |
5. **`newey_west_vcov`:** Der Kommentar "vgl. sandwich adjust=TRUE" stimmt nicht. `sandwich::NeweyWest` arbeitet standardmäßig mit adjust = FALSE, Prewhitening und automatischer Bandbreite. Die Funktion wird nicht ausgelöst, daher ohne Auswirkung.
6. **Durbin-Watson nur einseitig getestet** (H1: positive Autokorrelation). SAP 5.5 nennt "α = 0,05 zweiseitig für Diagnostiktests". Zweiseitig ist p = 0,65. Das ändert nichts, fehlt aber im Protokoll bei A3.
7. **S4-Jahr = erstes ganzes Jahr mit Prognose ≥ 19,6** (entspricht Aufrunden). Die übrigen Modelle runden den stetigen Schnittpunkt. Das ist bis zu 1 Jahr inkonsistent.
8. **S6-Residuen nicht reskaliert** (Faktor 1,019). Die Auswirkung auf die KI liegt unter 1 Jahr (3.6).
9. **SAP 3 verlangt Zugriffsdatum und Dateistand in Skript-Header und `run_log.txt`.** Beides fehlt dort und steht nur im Bericht ("erstellt am 20260902", abgerufen 11.09.2026). Diese Abweichung ist nicht protokolliert.
10. **Kosmetik:** `run_log.txt` zeigt `"ok_abw_6190": 1.0` statt `true` (`json.dumps(default=float)` auf numpy-bool).
11. **`tabelle1_E1.csv`:** Die S1-Zeilen fehlen (im JSON und im Bericht vorhanden), ebenso die S5-Spalte. Der SAP verlangt beides nicht zwingend.

## 5. Prüfung des Analyseberichts

### 5.1 Zahlen
- Alle Zahlen im Bericht habe ich gegen meine Rechnung geprüft: Abschnitte 1–4, Tabellen, Diagnostik, Sensitivitäten, Post-hoc-Werte und Abgleich 2056.
- **Numerisch falsche Zahlen habe ich nicht gefunden.** Die Rundung entspricht SAP 11.
- Redaktionell widersprüchlich ist Zeile 36: "innerhalb … bis auf PACF Lag 10 (… knapp innerhalb)". Tatsächlich liegen alle Werte innerhalb.
- Zeile 81 "Keine Sensitivität weicht um mehr als 10 Jahre vom Primärergebnis ab" gilt nur für Punktschätzer (4.4).

### 5.2 Interpretationsrahmen (SAP 8) und Kernaussagen-Entwürfe

| SAP-Regel | Befund |
|---|---|
| 8.1 Trendfortschreibung ≠ Klimaprojektion | Formulierung "Setzt sich der Messtrend … fort" ist SAP-konform. Der Hinweis, dass die Intervalle **keine Szenario-Unsicherheit** abbilden, fehlt im Bericht. "Statistisch **gut** vereinbar" (Kernaussage 3) ist bei einem KI von 2038–2075 stärker formuliert als gedeckt. |
| 8.2 "Normal" als Definitionsfrage / 7 alle Rahmen gleichrangig | Abschnitt 3 "Einordnung" ist gut. **Die Kernaussagen nennen aber nur R1 und R3. R2** (aktuelle WMO-Normalperiode: +2,0 K, z = 2,2, Rang 2 von 31, "außergewöhnlich warm") **fehlt.** Kernaussage 3 nennt nur E2a und lässt das zweite präregistrierte Primärergebnis E2b (2033, KI 2023–2049) weg. |
| SAP 2: Einstufung als Konvention kenntlich machen | Bericht und Grafik kennzeichnen die Schwellen \|z\| 1/2/3 **nicht** als Konvention dieses Checks. Die Grafik beschriftet die ±1-SD-Bänder als "Normalbereich". Das wiegt schwer, weil das Wort "normal" selbst Gegenstand der Debatte ist. |
| 8.3 Nur Temperaturdimension | Wird im Bericht nicht erwähnt. Kernaussage 2 bewertet "Ganz normal" ohne den Hinweis, dass B1 sich auf mehr als die Mitteltemperatur beziehen kann. |
| 8.4 Keine Attribution | eingehalten |
| 8.5 Homogenität bei S3 | nicht erwähnt (SAP verlangt die Nennung bei S3) |
| 8.6 Vorläufigkeit | Nur im Grafik-Untertitel, im Bericht nicht erwähnt. Zur Grenznähe von S5 siehe 5.3. |
| 8.7 Neutralität | B1 im Bericht ohne Namen: eingehalten. **"'unerklärlich' auch nicht"** (Kernaussage 2) weist eine Position zurück, die in SAP Abschnitt 1 niemand vertritt. Das erzeugt ein Scheingleichgewicht und sollte gestrichen werden. |
| 9 Limitationen | Kein Limitationsabschnitt: n = 30 und damit unsichere SD, Normalannahme vs. GEV, Extrapolation, regionale Unterschiede. |

### 5.3 Auslegung A8 und die Formulierung "etwa jedes zehnte Jahr"

**Ist A8 vertretbar?** Ja.
- SAP 5.4 lässt "deutliche Nicht-Normalität" undefiniert. SAP 5.5 legt aber α = 0,05 für Diagnostiktests fest, und p < 0,05 als Auslöser ist damit sogar die naheliegende SAP-konforme Lesart.
- Shapiro-Wilk ergibt W = 0,945, p = 0,014.
- Der Q-Q-Plot zeigt eine klare Rechtsschiefe (Schiefe +0,70): Positive Abweichungen vom Trend sind größer und häufiger, als die Normalverteilung erwarten lässt.

**Ist A8 konsequent umgesetzt?** Nein. A8 legt fest: "Wiederkehrzeiten nur Größenordnung, S5-Perzentile in den Vordergrund". Dagegen verstoßen drei Stellen:

1. **Kernaussage 2 stellt die normalverteilungsbasierte Wiederkehrzeit in den Vordergrund** ("etwa jedes zehnte Jahr", aus z = 1,26 → 9,6 J.). Die Perzentil-Sicht fehlt dort. Empirisch gilt:
   - 1971–2025 lagen **8 von 55 Sommern** mindestens so weit über dem Trend wie 2026 (1975, 1976, 1983, 1992, 1994, 2003, 2018, 2019).
   - Das sind 14,5 %, also **etwa jedes siebte Jahr**.
   - Die Normalannahme unterschätzt hier die Häufigkeit, und genau diese Verzerrung ist nach der Rechtsschiefe zu erwarten.
   - "Etwa jedes zehnte Jahr" liegt in derselben Größenordnung, ist als Einzelzahl aber zu präzise und verzerrt in Richtung "seltener".
   - **Die Formulierung ist in dieser Form nicht vertretbar.** Vertretbar wäre z. B. "grob alle sieben bis zehn Jahre", ergänzt um "seit 1971 in 8 von 55 Sommern".
2. **"'Ganz normal' trifft das nicht" ist nur unter dem z-Kriterium gedeckt.** Unter dem Perzentil-Kriterium, das A8 in den Vordergrund stellt, liegt 2026 im Trendrahmen **innerhalb** der zentralen 80 %: +1,08 K gegenüber einem P90 von +1,17 K.
   - Dieses S5-Ergebnis ist selbst **grenznah**: Der Abstand beträgt 0,09 K und liegt damit innerhalb der möglichen Nachkorrektur von "wenigen Zehntel" (SAP 8.6).
   - Unter Normalannahme wäre das 90 %-Quantil 1,06 K, und 2026 läge knapp außerhalb.
   - Dass sich S5 und das z-Kriterium unterscheiden, ist überwiegend eine **Definitionsfrage**: Die zentralen 80 % entsprechen etwa ±1,28 SD, das z-Kriterium ±1 SD (zentrale 68 %). Die Nicht-Normalität erklärt den Unterschied nur zum kleineren Teil.
   - Beides sollte so im Text stehen.
3. **Die Wiederkehrzeiten für R1 und R2 sind trotz A8 als scheinbar präzise Werte angegeben:** Tabelle 1 "ca. 60000" bzw. "ca. 80", Bericht "zehntausende Jahre".
   - Schon die Stichprobenunsicherheit der SD aus n = 30 (95 %-KI nach χ²) spannt ohne jede Nicht-Normalität folgende Bereiche auf:
     - R1: z = 3,1–5,2, also Wiederkehrzeit etwa 1 000 bis etwa 10 Mio. Jahre
     - R2: z = 1,65–2,8, also etwa 20 bis etwa 380 Jahre
   - Für R1 ist daher nur eine Aussage wie "wärmer als jeder der 30 Referenzsommer, unter Normalannahme sehr selten (nicht belastbar bezifferbar)" gedeckt.
   - Für R2 z. B. "nur 2003 war wärmer; grob einige Jahrzehnte bis Jahrhunderte".

## 6. Gefundene Fehler und Auffälligkeiten nach Schwere

### Kritisch
- **Keine.** Ich habe keine Rechenfehler, falsche Formeln, falschen Freiheitsgrade oder Fehlklassifikationen gefunden. Alle präregistrierten Ergebnisse sind unabhängig reproduziert.

### Auflage vor Veröffentlichung
| Nr. | Befund | Konkret |
|---|---|---|
| AV1 | Kernaussage 2 ist nicht konsistent mit A8/SAP 5.4 und nicht vollständig gedeckt | "etwa jedes zehnte Jahr" ersetzen (empirisch 8 von 55 Sommern ≈ jedes siebte Jahr; normal-basiert 9,6 J.). Das S5-Ergebnis "innerhalb der zentralen 80 %" (grenznah, 0,09 K) gleichrangig nennen. "Ganz normal trifft das nicht" auf das z-Kriterium und die Temperaturdimension (8.3) einschränken. "'unerklärlich' auch nicht" streichen (8.7). |
| AV2 | Kernaussagen ohne R2 (SAP 7, 8.2) | R2 aufnehmen: +2,0 K ggü. 1991–2020, z = 2,2, Rang 2 von 31, "außergewöhnlich warm" (Konvention). |
| AV3 | Kernaussage 3 unvollständig bzw. zu stark (SAP 5.2, 7, 8.1) | E2b ergänzen: 2033, KI 2023–2049; 2056 liegt danach. "Statistisch gut vereinbar" durch "vereinbar" ersetzen. Hinweis ergänzen, dass die Intervalle keine Szenario-Unsicherheit enthalten. |
| AV4 | Einstufung nicht als Konvention gekennzeichnet (SAP 2) | Im Bericht, in der Publikation und in der Grafik: "Normalbereich (±1 SD, Konvention dieses Checks)". |
| AV5 | Wiederkehrzeiten nicht A8-konform | Tabelle 1 "ca. 60000" / "ca. 80" und Bericht "zehntausende Jahre" nur als grobe Größenordnung mit Unsicherheitshinweis (R1: etwa 1 000 bis etwa 10 Mio. J.; R2: etwa 20–380 J., allein wegen der SD-Unsicherheit bei n = 30). |
| AV6 | Pflicht-Limitationen fehlen (SAP 8.3, 8.5, 8.6, 9) | Ergänzen: nur Temperaturdimension; Homogenität der frühen Reihe bei S3; Werte 2025/26 vorläufig; n = 30; Normal- statt GEV-Annahme; Extrapolation über etwa 30 Jahre; Gebietsmittel verdeckt regionale Unterschiede. |
| AV7 | Multiplizitätsaussage zu pauschal (SAP 7) | "Keine Sensitivität weicht um > 10 Jahre ab" auf Punktschätzer einschränken. Die breiten KI von S1 1991–2025 (E2a bis 2112, E2b bis 2070) ausdrücklich als Modellunsicherheit benennen. |
| AV8 | `tabelle2_E2.csv` nicht SAP-11-konform | S5-Zeile ergänzen (E2b 2025, KI 2017–2039). Jahre ganzzahlig ausgeben ("2033" statt "2033.0"). |
| AV9 | Rohdatei nicht unverändert abgelegt (SAP 3, A2) | Die DWD-Originaldatei `regional_averages_tm_summer.txt` unverändert im Ordner ablegen, oder ein Mensch bestätigt den Prüfsummenabgleich mit dem Original. Die CSV-seitigen Prüfsummen stimmen mit den im Bericht genannten überein. Den Abgleich mit dem Original konnte ich **nicht** prüfen. |
| AV10 | Quellenangabe (SAP 3, Lizenz) | In Grafik und Publikation "Deutscher Wetterdienst" ausschreiben (bisher "DWD Climate Data Center"). |

### Hinweis
| Nr. | Befund |
|---|---|
| H1 | Analyse und Validierung laufen im selben Python/scipy-Stack (A1). Eine softwareunabhängige Reproduktion in R, wie im Protokoll empfohlen, steht aus. Bei geschlossenen Formeln (OLS, Fieller) ist das Risiko gering, bei Shapiro-Wilk, S3 und S4 besteht eine Restunsicherheit. |
| H2 | S6 ist mit dem Analysten bitgleich, weil der Seed zufällig übereinstimmt. Mit anderen Seeds bleibt das Ergebnis stabil (±1 Jahr, 3.6). |
| H3 | Steigung in Tabelle 2 besser auf 0,01 K/Jz. runden (4.3). |
| H4 | Code-Kommentar zu `sandwich` adjust=TRUE ist unzutreffend. HAC wurde nicht ausgelöst (4.5). |
| H5 | DW einseitig statt zweiseitig laut SAP 5.5 (p zweiseitig 0,65). Ohne Folgen, bei A3 ergänzen. |
| H6 | S4: Jahr als erstes ganzes Jahr statt gerundet (≤ 1 J.). Die Modellwahl ist fragil (ΔAICc < 0,4). Meine ARIMA(0,1,1)-Kontrolle ergibt 2056 statt 2058. |
| H7 | S6 ohne Reskalierung der Residuen, Auswirkung < 1 Jahr. |
| H8 | Zugriffsdatum und Dateistand fehlen in Skript-Header und `run_log.txt` (SAP 3), nicht protokolliert. Kosmetik: `run_log` zeigt "1.0" statt `true`. |
| H9 | Multiplizitäts-Check im Code ohne S5 (ohne Folgen). |
| H10 | A5: Die Formulierung "wie im SAP angekündigt" (Bruchpunkt-Unsicherheit nicht enthalten) ist ungenau. Der SAP kündigt das nicht an. |
| H11 | Bericht Z. 36: widersprüchliche Formulierung zu ACF/PACF. |
| H12 | `tabelle1_E1.csv` ohne S1-Zeilen und S5-Spalte (im Bericht vorhanden). |
| H13 | Grafik-Details: siehe Abschnitt 8. |

## 7. Bewertung der Abweichungen A1–A8

| Nr. | Bewertung | Kommentar |
|---|---|---|
| A1 Software Python statt R | **akzeptiert** | Korrekt dokumentiert und begründet. Die Auswirkung auf OLS, Fieller und Bootstrap ist nach unabhängiger Nachrechnung vernachlässigbar. Einschränkung: Die Validierung nutzt denselben Stack (H1). |
| A2 Transkription statt Originaldatei | **akzeptiert unter Auflage AV9** | Dokumentiert mit Prüfsummen. Summe und Σ Jahr·Wert decken jeden Einzelfehler und jede Vertauschung zweier Werte auf. Nicht aufgedeckt würden sich exakt kompensierende Mehrfachfehler (unwahrscheinlich). Integritätscheck (a) und (b) sowie Rang 2 stützen die Daten. Der SAP-3-Punkt "Rohdatei unverändert abgelegt" ist aber nicht erfüllt. |
| A3 DW per Monte Carlo | **akzeptiert** | p = 0,32 reproduziert (0,324). Die Einseitigkeit widerspricht formal SAP 5.5 und ist nicht vermerkt (H5). Ohne Auswirkung. |
| A4 HAC fester Lag | **akzeptiert** | Nicht ausgelöst, Einschätzung "keine" korrekt. Der Code-Kommentar ist ungenau (H4). |
| A5 S3 per Rastersuche | **akzeptiert** | Bruchpunkt, Steigung und E2a/E2b plausibel reproduziert. Formulierung korrigieren (H10). |
| A6 S4 als auto.arima-Nachbau | **akzeptiert** | Ehrlich als "mittel" eingestuft. Ergebnis plausibel (Kontrolle 2056 vs. 2058). Die Fragilität der Modellwahl ist korrekt benannt. |
| A7 Post-hoc-Schwelle 19,55 | **akzeptiert** | Transparent als post-hoc gekennzeichnet. Werte reproduziert (2049,7 / 2031,5). Die Aussage "±1 Jahr" stimmt. |
| A8 Shapiro-Wilk p < 0,05 als Auslöser | **Auslegung akzeptiert, Umsetzung unvollständig** | Die Auslegung ist durch SAP 5.5 gedeckt und durch die Rechtsschiefe im Q-Q-Plot sachlich gestützt. Bericht, Tabelle 1 und Kernaussage 2 wenden die selbst gesetzte Regel aber nicht konsequent an (AV1, AV5). Die Einschätzung im Protokoll ("beide werden berichtet") trifft auf Abschnitt 3 des Berichts zu, nicht auf die Kernaussagen. |

**Nicht protokollierte Abweichungen:**
- Zugriffsdatum und Dateistand fehlen in Skript-Header und Log (H8).
- DW einseitig statt zweiseitig (H5).
- `tabelle2_E2.csv` ohne S5 (AV8).

## 8. Grafik 1 (`output/grafik1_sommer_2026.png`)

**Elemente nach SAP 11:**

| Element | vorhanden? |
|---|---|
| Sommermittel 1881–2026 | ja |
| Bänder Mittel ± 1 SD für R1 und R2 | ja |
| Trendlinie 1971–2025 | ja |
| 95 %-Prognoseband bis 2080 | ja |
| Linie bei 19,6 °C | ja |
| t\* mit KI (2051, 2038–2075) | ja |
| t\*\* mit KI (2033, 2023–2049) | ja |
| 2026 hervorgehoben | ja |
| Untertitel "keine Klimaprojektion" und "vorläufig" | ja |

Alle Beschriftungszahlen stimmen mit den Ergebnissen überein. Die Grafik ist **SAP-konform**. Fehlerhafte Darstellungen habe ich nicht gefunden.

**Verbesserungsbedarf:**
- **(Auflage AV4)** "Normalbereich 1961–1990 / 1991–2020 (Mittel ± 1 SD)" und "liegt im Normalbereich" stellen die Konvention wie eine Tatsache dar. Der Zusatz "Konvention dieses Checks" fehlt.
- **(Auflage AV10)** Die Quelle sollte "Deutscher Wetterdienst" heißen.
- **(Hinweis)** Der t\*\*-Marker sitzt ohne y-Beschriftung bei 18,8 °C (= 19,6 − σ̂) auf der Trendlinie. Leser könnten das als relevanten Temperaturwert missverstehen. Vorschlag: σ̂-Bezug in der Beschriftung nennen oder ein ±1-SD-Band um den Trend zeigen.
- **(Hinweis)** "liegt im Normalbereich … ab 2033" liest sich als dauerhaft. Bei gleicher linearer Fortschreibung und zweiseitiger \|z\|≤1-Definition gilt das nur bis etwa 2069, danach läge 19,6 °C mehr als 1 SD *unter* dem Trend. Die Grafik reicht bis 2080. Das ist rein definitorisch und ausdrücklich keine Prüfung der nicht präregistrierten Aussage "sogar kühl". Vorschlag: "ab etwa 2033" ohne Dauerhaftigkeitsaussage, oder den Zeitraum nennen.
- **(Hinweis)** Das Prognoseband beginnt schon 1971, die Legende sagt "fortgeschrieben". Der Untertitel könnte ergänzen: "Intervalle ohne Szenario-Unsicherheit".
- **(Hinweis)** Die Beschriftungen der Referenzbänder unten ("→", "↑") stehen weit von den Bändern entfernt. Das ist lesbar, aber umständlich.

Die Diagnostikgrafik (`diagnostik_primaermodell.png`) ist konsistent mit den Zahlen (DW 1,92, p = 0,32; SW p = 0,014; ACF/PACF innerhalb ±0,264). Die Rechtsschiefe im Q-Q-Plot ist sichtbar.

## 9. Gesamturteil

**Freigabefähig mit Auflagen.**

**Statistik:**
- Die Rechnung ist korrekt: Integritätscheck, E1 (R1–R3), Primärmodell, Fieller-KI für E2a/E2b, S1, S2, S5 und S6 sind unabhängig reproduziert.
- S3 und S4 sind plausibel.
- Das Analystenskript ist deterministisch reproduzierbar.

**Offene Punkte:** Sie betreffen die Berichterstattung und die Interpretation, nicht die Zahlen.
- A8-konforme Darstellung von Wiederkehrzeit und Perzentil-Ergebnis ("etwa jedes zehnte Jahr" ist so nicht vertretbar)
- vollständige und gleichrangige Nennung aller Rahmen und beider E2-Estimands in den Kernaussagen
- Kennzeichnung der Einstufung als Konvention
- Pflicht-Limitationen
- Korrektur von Tabelle 2
- Ablage bzw. Bestätigung der Originaldatei

AV1–AV10 sind vor einer Veröffentlichung umzusetzen. Eine erneute numerische Validierung ist dafür nicht nötig, außer AV9 deckt Datenabweichungen auf. Die geänderten Kernaussagen sollte vor der Veröffentlichung jemand gegen diesen Bericht gegenlesen.

**Nicht geprüft:**
- Abgleich der CSV mit der DWD-Originaldatei
- Konfidenzintervalle von S3
- vollständiger auto.arima-Nachbau
- SVG-Version der Grafik
- erneute Ausführung von `grafiken.py`
- Reproduktion in R

---

## Nachtrag: Nachkontrolle Revision 1 (11.09.2026)

**Rolle:** validator (unabhängiger Agent)
**Umfang:** gezielte Nachkontrolle der Auflagen AV1–AV10 und der Hinweise zu DW zweiseitig (H5), Zugriffsdatum (H8) und t\*\*-Beschriftung (Abschnitt 8)

**Geprüfte Dateien (Stand Revision 1):**
- `sommer_2026_normal.py` und `grafiken.py`: per `diff` gegen die Kopie des Erstlaufs abgeglichen
- `output/ergebnisse.json`, `tabelle1_E1.csv`, `tabelle2_E2.csv`, `run_log.txt`
- `output/grafik1_sommer_2026.png`
- `Analysebericht_sommer-2026-normal.md`
- `Abweichungsprotokoll_sommer-2026-normal.md`

Zeilenangaben "Z." beziehen sich auf die Revision 1.

### N.1 Reproduzierbarkeit und Unverändertheit der Ergebnisse

**Reproduzierbarkeit:** Das revidierte Skript lief in einer frischen Kopie. `ergebnisse.json`, beide Tabellen und `run_log.txt` sind **byte-identisch** mit `output/`.

**Strukturvergleich `ergebnisse.json` Erstlauf ↔ Revision 1:**
- Kein bisheriger Wert wurde geändert.
- Neu hinzugekommen sind nur `dw_p_zweiseitig_mc`, `dw_p_einseitig_pos_mc` (ersetzt `dw_p_einseitig_mc`), `S5_abstand_zu_p90_K`, `empirisch_jahre_mind_so_weit_ueber_trend`, `empirisch_n`, `residuen_schiefe` und `multiplizitaet_ki_grenzen_gt_10J`.

Die Aussage im Protokoll, Estimands, Modelle und Primärergebnisse seien unverändert, ist damit bestätigt.

**Neue Zahlen, selbst nachgerechnet:**

| Größe | Analyst Rev. 1 | Validator | Status |
|---|---|---|---|
| DW-p zweiseitig | 0,648 (100 000 Sim.) | 0,647 (200 000 Sim.) | ✓ |
| Sommer 1971–2025 mit Trendabweichung ≥ +1,078 K | 8 von 55 | 8 von 55 (1975, 1976, 1983, 1992, 1994, 2003, 2018, 2019) | ✓ |
| Abstand zu P90 der Residuen | 0,087 K ("0,09 K") | 0,087 K | ✓ |
| Schiefe der Residuen | 0,72 (bias-korrigiert) | 0,723 bias-korrigiert (0,703 unkorrigiert, so im Erstbericht) | ✓ |
| Jahre 1991–2020 wärmer als 19,55 °C | "nur 2003" | nur 2003 | ✓ |
| KI-Grenzen > 10 J. neben dem Primärergebnis | S1 1991–2025 E2a hi +36,5; E2b hi +20,4; S3 E2a hi −13,2 | identisch (3.4 und Abschnitt 4, Punkt 4) | ✓ |
| Obere Grenze "bis 2112" | 2112 | 2111,69 (S1 1991–2025, E2a) | ✓ |

### N.2 Status der Auflagen

| Nr. | Status | Beleg | Anmerkung |
|---|---|---|---|
| **AV1** Kernaussage zur Seltenheit / A8-Konsistenz | **umgesetzt** | Bericht Z. 115–121 (Kernaussage 3). "Etwa jedes zehnte Jahr" ist ersetzt durch "8 von 55 Sommern – etwa jeder siebte" (nachgerechnet). Das Perzentil-Ergebnis steht gleichrangig daneben ("knapp im oberen Normalbereich", 0,087 K). "'unerklärlich'" ist gestrichen (grep: kein Treffer). Einschränkung auf die Temperaturdimension in Kernaussage 1 (Z. 110–111). | Formulierungshinweise siehe N.4 (H-R1, H-R2) |
| **AV2** R2 in den Kernaussagen | **umgesetzt** | Kernaussage 2, Z. 113–114: +2,0 K (1,997), nur 2003 wärmer (nachgerechnet) | – |
| **AV3** E2b, "gut vereinbar", Szenario-Unsicherheit | **umgesetzt** | Kernaussage 4, Z. 122–127: E2b 2033 (KI 2023–2049); "nicht im Widerspruch" statt "gut vereinbar"; Satz zu Emissionen; obere Grenze bis 2112 | Der Vergleich mit 2056 ist nach beiden Estimands gedeckt: 2056 liegt im E2a-KI. Nach E2b liegt 19,6 °C im Jahr 2056 innerhalb von Trend ± 1 SD (Trend 2056 = 19,84 °C). **Neu:** Zitat-Problem, siehe N.3 (AV11) |
| **AV4** Einstufung als Konvention | **umgesetzt** | Bericht Z. 49–50 und Tabellenkopf Z. 52 ("z-Konvention"); Kernaussage 3 Z. 116–117; Grafik: Bänder heißen "Mittel ± 1 SD", Untertitel "±1 SD: Konvention dieses Checks"; Tabelle 1 Spalte `Einstufung_z_Konvention` | – |
| **AV5** Wiederkehrzeiten | **umgesetzt** | Tabelle 1 zeigt nur noch Klassen mit "(nicht belastbar)". Bericht Z. 59–64: "nicht kommuniziert", Spannen ~10³–10⁷ bzw. ~20–380 J. korrekt übernommen. "Zehntausende", "ca. 60000" und "ca. 80" kommen nicht mehr vor (grep). | Kleinigkeit: Die R1-Klasse "über 1000 Jahre" liegt knapp über der unteren Spanne (~960 J.). "Größenordnung 1000 Jahre oder mehr" wäre genauer. Nicht blockierend. |
| **AV6** Pflicht-Limitationen | **umgesetzt** | Bericht Z. 129–141: 8.3, 8.1, 8.4, 8.6 (einschließlich Grenznähe S5), 9 (n = 30, Normal- vs. Extremwertverteilung, Extrapolation, regional), 8.5 (S3), A1/A2 | – |
| **AV7** Multiplizitätsaussage | **umgesetzt** | Bericht Z. 92–96 (Punktschätzer vs. KI-Grenzen, Werte nachgerechnet). Code: neue KI-Grenzen-Prüfung (`flags_ki`, `run_log.txt` letzte Zeile). | Rest-Hinweis H-R4 (S5 nicht in der Prüfung) |
| **AV8** Tabelle 2 | **umgesetzt** | `tabelle2_E2.csv`: S5-Zeile "2025, 2017–2039" vorhanden; alle Jahre ganzzahlig ("2033") | – |
| **AV9** DWD-Originaldatei | **nicht umgesetzt (bewusst offen, als offen markiert)** | Bericht Z. 7, Protokoll Z. 25; `rohdaten/` enthält weiter nur die CSV | Bleibt Auflage. Den Hinweis in Limitationen Z. 140 ("per Prüfsummen verifiziert") kann ich nicht bestätigen, denn das Original liegt mir nicht vor. |
| **AV10** Quellenangabe | **umgesetzt (Grafik)** | Untertitel der Grafik: "Quelle: Deutscher Wetterdienst (DWD), Climate Data Center …" | Für den Beitrag selbst nicht prüfbar (Text existiert noch nicht), dort ebenfalls ausschreiben |

**Hinweise aus der Erstprüfung:**

| Hinweis | Status | Beleg |
|---|---|---|
| H5 DW zweiseitig | **umgesetzt** | Code Z. 179–180 (verdoppelter kleinerer Tail, Obergrenze 1); `ergebnisse.json` 0,648 (nachgerechnet 0,647); Bericht Z. 37; Protokoll A3; Titel der Diagnostikgrafik über `grafiken.py` Z. 73. Die neue Diagnostik-PNG habe ich nicht erneut angesehen. |
| H8 Zugriffsdatum im Log | **umgesetzt** | `run_log.txt` Z. 3 (Datei, Kopfzeile 20260902, Zugriff 11.09.2026, Browser); Skript Z. 22 (Log-Aufruf am Skriptanfang, nicht im Docstring – ausreichend) |
| t\*\*-Beschriftung (Abschnitt 8) | **umgesetzt** | Grafik: "Trend + 1 SD erreicht 19,6 °C: 2033 (KI 2023–2049; Marker auf Trendlinie)". Die Aussage ist mathematisch äquivalent zu E2b (Trend ≥ 19,6 − σ̂). Die Beschriftung erklärt die Markerposition bei 18,8 °C. Sie beschreibt jetzt einen Zeitpunkt statt eines Dauerzustands, damit ist auch der "ab 2033"-Hinweis in der Grafik erledigt. |
| H3 Steigung auf 0,1 gerundet | nicht umgesetzt | Tabelle 2 weiter 0,4/0,5; nicht blockierend |
| H4 Code-Kommentar `adjust=TRUE` | nicht umgesetzt | `sommer_2026_normal.py` Z. 70; ohne Auswirkung |
| H10 A5 "wie im SAP angekündigt" | nicht umgesetzt | Protokoll Z. 12; redaktionell |
| H11 ACF/PACF-Formulierung | nicht umgesetzt | Bericht Z. 38; redaktionell |
| H12 Tabelle 1 | teilweise | S5-Spalte und empirische Spalte ergänzt, S1-Zeilen fehlen weiter; nicht blockierend |
| `run_log` "1.0" statt `true` | nicht umgesetzt | kosmetisch |

### N.3 Neue Kernaussagen 1–4: Deckung und SAP Abschnitt 8

| Kernaussage | durch Zahlen gedeckt? | SAP 8 |
|---|---|---|
| 1 (Bezugsrahmen, nur Mitteltemperatur) | ja | 8.2 ✓, 8.3 ✓ |
| 2 (R1 +3,3 K, wärmer als alle 30; R2 +2,0 K, nur 2003 wärmer) | ja (nachgerechnet: 3,283 K, Maximum 1961–1990 18,26 °C; 1,997 K, nur 2003 > 19,55 °C) | 8.2 ✓, neutral formuliert |
| 3 (R3 +1,1 K; 8 von 55; z-Konvention "ungewöhnlich warm"; Perzentil knapp im Normalbereich; "ganz normal" im langjährigen Klima nicht, im heutigen Klima kein Ausnahmeereignis) | ja (1,078 K; 8/55; z = 1,26; Abstand zu P90 0,087 K) | 8.2 ✓, 8.3 ✓ (über Kernaussage 1), 8.6 ✓ ("knapp"; Limitationen Z. 135), 8.7 ✓. Beide Richtungen werden mit denselben Maßstäben bewertet, B1 ohne Namen. Formulierungshinweise H-R1/H-R2. |
| 4 (Trend +0,46 K/Jz., KI 0,31–0,60; E2a 2051 [2038–2075]; E2b ab etwa 2033 [2023–2049]; "nicht im Widerspruch"; keine Emissionsszenarien; obere Grenze bis 2112) | ja (alle Werte nachgerechnet) | 8.1 ✓ ("setzt sich … linear fort", Szenario-Satz), 8.4 ✓ (keine Ursachenaussage). **Zitierweise B2 nicht SAP-11-konform → Auflage AV11** |

**Neue Auflage:**

**AV11 (Auflage vor Veröffentlichung, redaktionell).** Kernaussage 4 (Z. 125) setzt eine Paraphrase in Anführungszeichen: "in 30 Jahren könnte er normal sein".
- Der in SAP Abschnitt 1 dokumentierte Wortlaut lautet: "Wenn wir in 30 Jahren zurückblicken, könnte es allerdings sein, dass wir ihn eher als normal betrachten."
- In einem Evidenzcheck darf eine Paraphrase nicht als wörtliches Zitat erscheinen.
- SAP 11 verlangt außerdem, B2 mit Name, Funktion und Quelle zu nennen (Tobias Fuchs, DWD, klimareporter°, 08.09.2026).
- Umsetzung: entweder wörtlich zitieren mit Quelle oder als indirekte Rede ohne Anführungszeichen.
- Das inhaltliche Urteil "nicht im Widerspruch" bleibt davon unberührt: Es gilt auch für den genauen Wortlaut ("eher als normal").

### N.4 Verbleibende Hinweise aus Revision 1 (nicht blockierend)

| Nr. | Hinweis |
|---|---|
| H-R1 | **"Im Sinne des langjährigen Klimas" ist unscharf** (Kernaussage 3, Z. 119). Auch der Trend 1971–2025 beruht auf einer langen Reihe. Genauer: "gemessen an den Klimanormalperioden 1961–1990 und 1991–2020". |
| H-R2 | **"Kein Ausnahmeereignis" ist keine vorab definierte Kategorie** (Kernaussage 3, Z. 120–121). Die Aussage ist durch die Zahlen gedeckt (z = 1,26 < 2, innerhalb des 95 %-PI, 8 von 55), sollte aber an die Definition gebunden werden, z. B. "nach Konvention nicht 'außergewöhnlich'". Außerdem stehen in den Kernaussagen Einstufungsbegriffe nur für R3, nicht für R1/R2 ("extrem außergewöhnlich" / "außergewöhnlich warm" nach Konvention). Für die gleiche Behandlung nach 8.7 empfehle ich, die Begriffe entweder für alle drei Rahmen zu nennen oder für keinen. |
| H-R3 | **Kernaussage 4: "je nach Trendfenster reicht die obere Grenze bis 2112"** gilt nur für E2a ("typischer Sommer"). Für E2b liegt die höchste obere Grenze bei 2070. Das bitte präzisieren. Außerdem ist "ab etwa 2033 nicht mehr ungewöhnlich" bei zweiseitiger \|z\|≤1-Definition und gleicher linearer Fortschreibung nur bis etwa 2069 gültig. Das ist rein definitorisch, keine Prüfung der Aussage "sogar kühl". Keine Änderung zwingend, aber die Aussage nicht als Dauerzustand zuspitzen. |
| H-R4 | **S5 fehlt weiterhin in der Multiplizitätsprüfung im Code.** Die obere KI-Grenze von S5 für E2b liegt −10,5 J. neben dem Primärergebnis und wird im Bericht nicht genannt. "Spanne E2b 2030–2036" (Z. 93) klammert den S5-Punkt 2025 (−7,5 J.) stillschweigend aus. Da S5 eine andere Definition verwendet, ist das vertretbar, sollte aber so benannt werden. |
| H-R5 | **Bericht Z. 101: "nach der Perzentil-Variante (S5) sogar schon heute (2025 …)".** Der Punktwert ist 2025,2, das KI reicht bis 2039. "Sogar schon heute" nur zusammen mit dem KI in den Beitrag übernehmen. |

### N.5 Grafik 1 (Revision 1) erneut geprüft

Alle Elemente aus SAP 11 sind weiter vorhanden. Die Zahlen in den Beschriftungen stimmen: 2051 (2038–2075), 2033 (2023–2049), 2026: 19,6 °C.

**Umgesetzt:**
- Quelle "Deutscher Wetterdienst" ausgeschrieben
- Szenario-Hinweis ergänzt
- Konventionshinweis ergänzt
- "Normalbereich" durch "Mittel ± 1 SD" ersetzt
- t\*\*-Beschriftung korrekt und als Zeitpunkt formuliert

Es gibt nichts sachlich Falsches oder Irreführendes.

**Kleinigkeiten (nicht blockierend):**
- Das Prognoseband beginnt schon 1971, während die Legende "fortgeschrieben" sagt.
- Der t\*\*-Marker bei 18,8 °C ist nur über die Beschriftung "Marker auf Trendlinie" erklärt. Eine gestrichelte Linie "Trend + 1 SD" wäre intuitiver.
- Der Titel verwendet "normal" ohne Anführungszeichen. Der Untertitel relativiert das ausreichend.

### N.6 Aktualisiertes Gesamturteil

**Freigabefähig mit Auflagen.** Offen sind nur noch zwei Auflagen:

1. **AV9:** DWD-Originaldatei unverändert im Ordner ablegen, oder ein Mensch bestätigt den Prüfsummenabgleich mit dem Original. Die Auflage ist bewusst offen und so gekennzeichnet.
2. **AV11:** B2 in Kernaussage 4 wörtlich und mit Name, Funktion und Quelle zitieren, oder als indirekte Rede ohne Anführungszeichen (SAP 11).

**Erledigt und belegt:** AV1–AV8 und AV10 (Grafik) sind umgesetzt. Die neuen Zahlen habe ich nachgerechnet, sie stimmen. Die Primärergebnisse sind unverändert und reproduzierbar. Die Kernaussagen 1–4 sind durch die Ergebnisse gedeckt und halten SAP 8.1–8.4, 8.6 und 8.7 ein. Für die offenen Auflagen ist keine neue numerische Validierung nötig, außer AV9 deckt Abweichungen in den Daten auf. Die Hinweise H-R1 bis H-R5 werden empfohlen, blockieren aber nicht.

**Nicht geprüft in dieser Nachkontrolle:**
- neue Diagnostik-PNG und SVG (nur der Code dazu ist geprüft)
- Beitragstext für Substack/LinkedIn (liegt nicht vor)
- Abgleich mit der DWD-Originaldatei

Dieser Nachtrag enthält keine Freigabe. Die Entscheidung über die Veröffentlichung liegt beim Menschen.

---

## Nachtrag 2: Nachkontrolle Revision 1a (11.09.2026)

**Rolle:** validator (unabhängiger Agent)
**Umfang:** nur `Analysebericht_sommer-2026-normal.md`, Statuszeile (Z. 5–10) und Abschnitt 5 (Kernaussagen 3 und 4)

**Unverändert:** `sommer_2026_normal.py`, `grafiken.py`, `ergebnisse.json`, `tabelle1_E1.csv`, `tabelle2_E2.csv` und `run_log.txt` sind byte-identisch mit dem in Nachtrag 1 geprüften Stand (per `cmp`).

### (a) Auflage 11 – Fuchs-Zitat

| Kriterium | Befund |
|---|---|
| Wortlaut | **wortgleich** mit SAP Abschnitt 1, maschinell verglichen (Leerzeichen normalisiert): "Wenn wir in 30 Jahren zurückblicken, könnte es allerdings sein, dass wir ihn eher als normal betrachten." |
| Name | ✓ Tobias Fuchs |
| Medium / Datum | ✓ klimareporter°, 08.09.2026 |
| Funktion | **abweichend:** Der Bericht schreibt "DWD-Klimavorstand". SAP Abschnitt 1 dokumentiert "Leiter Geschäftsbereich Klima und Umwelt" beim DWD. "Klimavorstand" ist im SAP nicht belegt. Ob die Bezeichnung trotzdem zutrifft, konnte ich ohne Zugriff auf die Quelle **nicht prüfen**. |

**Status AV11: weitgehend umgesetzt.** Offen bleibt ein redaktioneller Rest: entweder die im SAP dokumentierte Funktion übernehmen ("Leiter des Geschäftsbereichs Klima und Umwelt beim Deutschen Wetterdienst") oder die Bezeichnung "Klimavorstand" an der Quelle belegen.

### (b) Zahlen in Kernaussage 3 und 4

Abgleich gegen `output/ergebnisse.json` und `tabelle2_E2.csv`:

| Aussage | Bericht | ergebnisse.json / Tabelle 2 | ok |
|---|---|---|---|
| KA3: Abweichung vom Trend | rund 1,1 K | 1,078 | ✓ |
| KA3: empirische Häufigkeit | 8 von 55, etwa jeder siebte | 8 / 55 (1 : 6,9) | ✓ |
| KA3: R1 / R2 / R3 Einstufung | extrem außergewöhnlich / außergewöhnlich warm / ungewöhnlich warm | z 4,138 / 2,223 / 1,259, gleiche Einstufungen | ✓ |
| KA3: Perzentil-Abstand | 0,09 K unter der Grenze | 0,087 | ✓ |
| KA4: Steigung und KI | +0,46 K/Jz. (0,31–0,60) | 0,455 (0,314–0,596) | ✓ |
| KA4: E2a | um 2051 (2038–2075) | 2050,79 (2037,60–2075,15); Tabelle 2: 2051, 2038–2075 | ✓ |
| KA4: höchste obere Grenze E2a | bis 2112 | 2111,69 (S1 1991–2025); übrige ≤ 2078 | ✓ |
| KA4: E2b | ab etwa 2033 (2023–2049) | 2032,64 (2023,38–2049,22); Tabelle 2: 2033, 2023–2049 | ✓ |
| KA4: höchste obere Grenze E2b | bis 2070 | 2069,62 (S1 1991–2025); übrige ≤ 2052 | ✓ |
| KA4: S5 | um 2025 (KI 2017–2039) | 2025,19 (2017,43–2038,69); Tabelle 2: 2025, 2017–2039 | ✓ |

Alle Zahlen stimmen und sind nach SAP 11 korrekt gerundet.

**Empfehlungen aus Nachtrag 1, jetzt umgesetzt:**
- **H-R1:** "gemessen an 1961–1990 und 1991–2020" statt "langjähriges Klima"
- **H-R2:** Einstufungen für alle drei Rahmen genannt, "kein Ausnahmeereignis" gestrichen
- **H-R3:** obere Grenzen je Estimand getrennt angegeben
- **H-R5:** S5 nur zusammen mit dem KI genannt

Offen bleibt nur H-R4 (S5 im Multiplizitäts-Check und die Spannenangabe in Abschnitt 4). Der Punkt blockiert nicht und liegt außerhalb dieser Revision.

### (c) SAP Abschnitt 8

| Regel | Befund |
|---|---|
| 8.1 | ✓ "Setzt sich der Messtrend … linear fort". Hinweis ergänzt, dass die Intervalle Emissionsszenarien nicht abbilden. |
| 8.2 | ✓ Alle drei Rahmen mit Einstufung. Die Konvention ist ausdrücklich benannt, einschließlich der Schwellen. |
| 8.3 | ✓ über Kernaussage 1 (nur Mitteltemperatur Juni–August) |
| 8.4 | ✓ keine Ursachenaussage |
| 8.6 | ✓ Grenznähe des Perzentil-Befunds genannt (0,09 K) |
| 8.7 | ✓ B1 ohne Namen. B2 mit Name, Medium und Datum; die Funktionsangabe siehe (a). |

Die Schlussfolgerung "ganz normal" wird nur für die beiden Klimanormalperioden verneint. Für den Trendrahmen stehen die beiden unterschiedlichen Einstufungen (z- bzw. Perzentil-Kriterium) unmittelbar davor. Beide Aussagen werden mit denselben Maßstäben geprüft.

**Kosmetisch:** Die Überschrift von Abschnitt 5 lautet noch "Rev. 1", die Statuszeile nennt "Revision 1a".

### Aktualisiertes Gesamturteil (Revision 1a)

**Freigabefähig mit Auflagen.** Offen sind:

1. **AV9:** DWD-Originaldatei unverändert ablegen, oder ein Mensch bestätigt den Prüfsummenabgleich. Die Auflage ist bewusst offen.
2. **AV11 (redaktioneller Rest):** Funktionsangabe "DWD-Klimavorstand" durch die im SAP dokumentierte Funktion ersetzen oder an der Quelle belegen.

Die Kernaussagen 3 und 4 sind durch die Ergebnisse vollständig gedeckt und halten SAP Abschnitt 8 ein. Eine weitere numerische Validierung ist nicht nötig, außer AV9 deckt Datenabweichungen auf.

Dieser Nachtrag enthält keine Freigabe. Die Entscheidung über die Veröffentlichung liegt beim Menschen.

---

## Nachtrag 3: Prüfung Kanal-Entwürfe (11.09.2026)

**Rolle:** validator (unabhängiger Agent)

**Geprüft:**
- `Reports/2026-09-sommer-2026-normal/kanal-entwuerfe/substack.md`
- `Reports/2026-09-sommer-2026-normal/kanal-entwuerfe/linkedin.md`
- `assets/grafik1_sommer_2026.png` und `.svg`: per `cmp` byte-identisch mit `output/`

**Maßstab:**
- `output/ergebnisse.json`, `tabelle1_E1.csv`, `tabelle2_E2.csv`: unverändert seit Nachtrag 1
- Analysebericht Abschnitt 5 (Stand 09:03)
- SAP Abschnitte 1, 8 und 11

Die Entwürfe habe ich nicht verändert. Zeilenangaben "Z." beziehen sich auf die jeweilige Entwurfsdatei.

**Nebenbefunde zum Analysebericht (Stand 09:03):**
- **Funktionsangabe:** Kernaussage 4 nennt jetzt "Leiter des Geschäftsbereichs Klima und Umwelt beim DWD", wie in SAP Abschnitt 1. Der redaktionelle Rest von **AV11 ist damit erledigt**.
- **Freigabevermerk:** Der Kopf des Analyseberichts enthält jetzt einen Vermerk "Freigabe Ergebnisse: Daniel Saure, 11.09.2026 (im Chat …)". Diesen Vermerk hat nicht der Validator eingetragen. Ich kann ihn nicht überprüfen und übernehme ihn nicht.
- **AV9:** `rohdaten/` enthält weiterhin nur die CSV. Die Auflage ist offen.

### (a) Zahlen und Einstufungen

| Aussage (Substack Z. / LinkedIn Z.) | Entwurf | Validierte Ergebnisse | ok |
|---|---|---|---|
| Sommermittel 2026, Rang (S 15 / L 7) | 19,6 °C, zweitwärmster seit 1881 bzw. "seit Messbeginn" | 19,55 → 19,6; Rang 2 von 146 | ✓ |
| R1 (S 16, 27 / L 9) | +3,3 Grad, 4,1 SD, wärmer als jeder Sommer 1961–1990, Normalwert 16,3 °C, extrem außergewöhnlich | +3,283; z 4,138; Maximum 18,26; Mittel 16,267 | ✓ |
| R2 (S 17, 28 / L 10) | +2,0 Grad, 2,2 SD, nur 2003 wärmer, 17,6 °C, außergewöhnlich warm | +1,997; z 2,223; nur 2003 (19,67); Mittel 17,553 | ✓ |
| R3 (S 18, 29, 31 / L 11) | +1,1 Grad, 1,3 SD, 18,5 °C, ungewöhnlich warm, 8 der 55, etwa jeder siebte | +1,078; z 1,259; ŷ 18,472; 8/55 | ✓ |
| Perzentil-Variante (S 31) | knapp im oberen Normalbereich, 0,09 Grad unter der Grenze | Abstand 0,087 K; innerhalb der zentralen 80 % | ✓ |
| Einstufungsschwellen (S 23) | ≤ 1 / ≤ 2 / ≤ 3 / darüber | SAP 2 | ✓ |
| Trend (S 39 / L 13) | knapp 0,5 Grad/Jahrzehnt (0,3–0,6) | 0,455 (0,314–0,596) | ✓ |
| E2a (S 19, 41 / L 13) | um 2051 (2038–2075) | 2050,79 (2037,60–2075,15) | ✓ |
| E2b (S 42) | ab etwa 2033 (2023–2049) | 2032,64 (2023,38–2049,22) | ✓ |
| "in 30 Jahren" ≈ 2056 im Intervall (S 44) | ja | ja | ✓ |
| Spanne der Sensitivitäten E2a (S 44) | 2045–2058 | S3 2044,6 … S4 2058 | ✓ |
| Obere Grenze E2a (S 44) | bis 2112 | 2111,69 (S1 1991–2025) | ✓ |
| Datenstand / vorläufig (S 54) | Stand 02.09.2026, 2025/26 vorläufig | laut Bericht und Grafik | ✓ |

Alle Zahlen und Einstufungen stimmen und sind nach SAP 11 gerundet. Normalwert + Abstand ergibt jeweils 19,6 °C, die Angaben sind also in sich konsistent. Wiederkehrzeiten werden, wie vorgesehen, nicht genannt.

### (b) Zitate und Namensnennung

| Stelle | Befund |
|---|---|
| Substack Z. 9 (Fuchs, Zitat 2) | **wortgleich** mit SAP Abschnitt 1, maschinell verglichen. Name, Funktion (entspricht SAP), Medium und Datum vorhanden. ✓ |
| Substack Z. 9 (Fuchs, Zitat 1) | "vor 30 oder 40 Jahren wäre ein solcher Sommer 'extrem ungewöhnlich' gewesen": als indirekte Rede mit wörtlichem Teilzitat korrekt. ✓ |
| Substack Z. 46 ("sogar als kühl gelten") | Teilzitat wortgleich ✓, aber keiner Person zugeordnet (Ä10) |
| Substack Z. 9 / Z. 5, LinkedIn Z. 5 ("ganz normal") | ohne Namen und Partei, wie in SAP 11 entschieden ✓. Das Original lautet "ganz normaler Sommer". Das verkürzte Teilzitat entspricht dem Beispiel in SAP 11 und ist vertretbar. |
| **LinkedIn Z. 13** | **nicht SAP-11-konform:** "die Aussage des DWD, ein solcher Sommer könne in 30 Jahren als normal gelten". Die Aussage wird der Institution statt der Person zugeschrieben, Name, Funktion und Quelle fehlen, und die Paraphrase ist stärker als das Original ("könnte … sein, dass wir ihn **eher** als normal **betrachten**" → "könne … als normal **gelten**"). Siehe Ä2. |
| Substack Z. 63 (klimareporter°-Link und Überschrift „In 30 Jahren könnte dieser Sommer normal sein“) | **von mir nicht prüfbar**: Weder URL noch Artikelüberschrift sind im SAP dokumentiert, und ich habe keinen Quellenzugriff. Eine Überschrift in Anführungszeichen ist ein Zitat und muss am Original stimmen (Ä5). |

### (c) SAP Abschnitt 8 und 11

| Regel | Substack | LinkedIn |
|---|---|---|
| 8.1 Fortschreibung ≠ Projektion | ✓ Z. 19 "Wenn der bisherige Trend anhält", Z. 39 "linear fort", Z. 46 "keine Klimaprojektion", Intervalle ohne Emissionsunsicherheit | ✓ Z. 15; "linear" fehlt in Z. 13 (Ä12) |
| 8.2 / SAP 2 Bezugsrahmen, Konvention gekennzeichnet | ✓ Z. 11, 23 | ✓ ohne Einstufungsbegriffe, daher keine Kennzeichnung nötig |
| 8.3 nur Temperatur | ✓ Z. 50, aber mit Zusatz über die Ergebnisse hinaus (Ä3) | ✓ Z. 15 |
| 8.4 keine Attribution | ✓ Z. 50 | ✓ |
| 8.5 Homogenität (S3) | ✗ Das S3-Ergebnis fließt in die Spanne "2045" (Z. 44) ein, die Limitation fehlt (Ä11) | – (S3 nicht genannt) |
| 8.6 Vorläufigkeit | ✓ Z. 31 (Grenznähe), Z. 54 | ✗ nicht erwähnt (Ä8) |
| 8.7 Neutralität, nüchterne Wortwahl | ✗ Z. 9 "Der Deutsche Wetterdienst sieht das anders" (Ä1); Z. 31 "weniger dramatisch" (Ä6), "Einschätzung des DWD" (Ä4) | ✗ Z. 13 Zuschreibung an "den DWD" (Ä2) |
| 11 B1 ohne Namen, B2 mit Name/Funktion/Quelle | ✓ | ✗ (Ä2) |
| 11 Umfang | ✓ ca. 750 Wörter ohne Entwurfs- und Optionalzeile (ca. 770 mit Optional-CTA; Tabellen und Linktexte mitgezählt, Zählung approximativ), genau 1 Grafik | ✓ ca. 190 Wörter |
| 7 Vollständigkeit E2 | E2b nur im Hauptteil, nicht in "Auf einen Blick" (Ä7) | E2b fehlt (Ä7) |

### (d) Formulierungen, die über die Ergebnisse hinausgehen

- **Substack Z. 9 "Der Deutsche Wetterdienst sieht das anders."** Die Analyse belegt keine Stellungnahme des DWD zur politischen Aussage. Das Interview äußert sich laut SAP nicht zu B1. Der Satz baut außerdem einen Gegensatz "Politik vs. Fachbehörde" auf und macht die vorab entschiedene Asymmetrie der Nennung (SAP 11) zur Wertung.
- **Substack Z. 50 "…, die den Sommer 2026 ebenfalls geprägt haben."** Hitzewellen, Tropennächte und Trockenheit 2026 wurden nicht untersucht. Die Aussage ist durch die Analyse nicht gedeckt.
- **Substack Z. 31 "das deckt sich mit der Einschätzung des DWD".** Die Einschätzung stammt von einer Person, nicht von der Institution. Zudem wird die Konventionsbezeichnung "extrem außergewöhnlich" mit Fuchs' Wortwahl "extrem ungewöhnlich" gleichgesetzt, ohne die Konvention zu nennen.
- **LinkedIn Z. 13:** stärkere Paraphrase als das Original (siehe b).

### Änderungswünsche (alt → Vorschlag neu)

**Vor Veröffentlichung erforderlich:**

| Nr. | Datei, Z. | alt | Vorschlag neu | Grund |
|---|---|---|---|---|
| Ä1 | substack.md Z. 9 | „Der Deutsche Wetterdienst sieht das anders. Tobias Fuchs, beim DWD Leiter …, sagte …“ | „Tobias Fuchs, beim Deutschen Wetterdienst Leiter des Geschäftsbereichs Klima und Umwelt, sagte …“ (ersten Satz streichen) | 8.7, SAP 11; nicht durch die Analyse belegt |
| Ä2 | linkedin.md Z. 13 | „Und die Aussage des DWD, ein solcher Sommer könne in 30 Jahren als normal gelten? Setzt sich der Messtrend (knapp 0,5 Grad pro Jahrzehnt) fort, …“ | „Und die Einschätzung von Tobias Fuchs (DWD, Leiter Klima und Umwelt) im Interview mit klimareporter°: ‚Wenn wir in 30 Jahren zurückblicken, könnte es allerdings sein, dass wir ihn eher als normal betrachten.‘ Setzt sich der Messtrend (knapp 0,5 Grad pro Jahrzehnt) linear fort, …“ | SAP 11 (Name, Funktion, Quelle); Paraphrase stärker als Original; 8.7 |
| Ä3 | substack.md Z. 50 | „… nicht Hitzewellen, Höchstwerte, Tropennächte oder Trockenheit, die den Sommer 2026 ebenfalls geprägt haben.“ | „… nicht Hitzewellen, Höchstwerte, Tropennächte oder Trockenheit.“ | über die Ergebnisse hinaus |
| Ä4 | substack.md Z. 31 | „Gemessen an 1961–1990 war 2026 also extrem außergewöhnlich – das deckt sich mit der Einschätzung des DWD.“ | „Gemessen an 1961–1990 war 2026 nach unserer Konvention also ‚extrem außergewöhnlich‘ – das passt zur Einschätzung von Tobias Fuchs.“ | Zuschreibung an die Person; Konvention kennzeichnen |
| Ä5 | substack.md Z. 9, 63, 67 | klimareporter°-URL, Überschrift „In 30 Jahren könnte dieser Sommer normal sein“, GitHub-Link | Am Original prüfen: URL, wörtliche Überschrift, Erreichbarkeit des Repos nach dem Push. Falls die Überschrift nicht wörtlich stimmt, ohne Anführungszeichen „Interview mit Tobias Fuchs (DWD)“ | vom Validator nicht prüfbar; Überschrift in Anführungszeichen ist ein Zitat |

**Empfohlen (nicht blockierend):**

| Nr. | Datei, Z. | alt | Vorschlag neu | Grund |
|---|---|---|---|---|
| Ä6 | substack.md Z. 31 | „Gemessen am bereits erwärmten Klima von heute ist das Bild weniger dramatisch:“ | „Gemessen am bereits erwärmten Klima von heute fällt die Abweichung kleiner aus:“ | 8.7 nüchterne Wortwahl |
| Ä7 | substack.md Z. 19 | „… um das Jahr 2051 ein typischer Sommer (95-%-Intervall 2038–2075).“ | „… um das Jahr 2051 ein typischer Sommer (95-%-Intervall 2038–2075) und schon ab etwa 2033 nicht mehr ungewöhnlich (2023–2049).“ | SAP 5.2/7: beide Primär-Estimands |
| Ä7 | linkedin.md Z. 13 | „… um 2051 ein typischer Sommer (95-%-Intervall 2038–2075).“ | „… um 2051 ein typischer Sommer (95-%-Intervall 2038–2075), nicht mehr ungewöhnlich schon ab etwa 2033.“ | wie oben |
| Ä8 | linkedin.md Z. 7 | „Mit 19,6 °C im Mittel von Juni bis August war 2026 der zweitwärmste Sommer seit Messbeginn.“ | „Mit 19,6 °C (vorläufig) im Mittel von Juni bis August war 2026 der zweitwärmste Sommer seit 1881.“ | 8.6; Präzision |
| Ä9 | substack.md Z. 35 | Alt-Text „… mit Normalbereichen 1961–1990 und 1991–2020 …“; Datei `.svg` | „… mit Bändern Mittelwert ± 1 Standardabweichung für 1961–1990 und 1991–2020 …“; PNG statt SVG einbinden | Grafik sagt "Mittel ± 1 SD" (AV4); SVG wird von vielen Blog-Editoren nicht unterstützt, vor Upload prüfen |
| Ä10 | substack.md Z. 46 | „Die Aussage, ein Sommer wie 2026 könne …“ | „Fuchs' weitere Aussage, ein Sommer wie 2026 könne …“ | Zuordnung des Teilzitats |
| Ä11 | substack.md Z. 58 | „… Extrapolation über drei Jahrzehnte.“ | „… Extrapolation über drei Jahrzehnte; das Bruchpunkt-Modell nutzt die Reihe ab 1881, deren frühe Werte weniger vergleichbar sind.“ | SAP 8.5 |
| Ä12 | linkedin.md Z. 13 | „Setzt sich der Messtrend … fort“ | „Setzt sich der Messtrend … linear fort“ | 8.1 (in Ä2 enthalten) |

### Urteil Nachtrag 3

**Zahlen:** Beide Entwürfe sind **numerisch korrekt**. Alle Zahlen und Einstufungen stimmen mit den validierten Ergebnissen überein. Der Substack-Text hält den Umfang ein (≤ 800 Wörter, 1 Grafik).

**Vor Veröffentlichung umzusetzen:**
- **Ä1–Ä4:** Formulierungen zur Neutralität (8.7), zur Zitierweise (SAP 11) und eine Aussage über die Ergebnisse hinaus
- **Ä5:** Links und Überschrift am Original prüfen (von mir nicht prüfbar)
- **AV9:** DWD-Originaldatei ablegen, weiterhin offen

**Empfohlen:** Ä6–Ä12.

**Aktualisiertes Gesamturteil:**
- Die Analyse bleibt **freigabefähig mit Auflagen**. Offen ist nur noch AV9, AV11 ist erledigt.
- Die Kanal-Entwürfe sind **nach Umsetzung von Ä1–Ä5 veröffentlichungsfähig**.
- Nach der Umsetzung ist keine weitere numerische Prüfung nötig. Den geänderten LinkedIn-Satz (Ä2) sollte vor Veröffentlichung jemand am SAP-Wortlaut gegenlesen.

Dieser Nachtrag enthält keine Freigabe. Die Entscheidung über die Veröffentlichung liegt beim Menschen.
