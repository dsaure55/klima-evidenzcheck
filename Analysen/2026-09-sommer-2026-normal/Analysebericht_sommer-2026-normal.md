# Analysebericht – Schnellcheck "Sommer 2026 – ganz normal?"

**Grundlage:** SAP v1.0 final (eingefroren 11.09.2026, Daniel Saure)
**Analyse durchgeführt:** 11.09.2026, Cowork-Session (Claude)
**Freigabe Ergebnisse:** Daniel Saure, 11.09.2026 (im Chat, Wortlaut: "Freigabe"; erteilt
nach Übergabe von Analysebericht Rev. 1a und Validierungsbericht inkl. Nachträgen 1–2).
**Auflage 9 erledigt (11.09.2026, nachmittags):** DWD-Originaldatei liegt als
`rohdaten/regional_averages_tm_summer.txt` im Ordner (Details Abschnitt 1).
**Veröffentlicht:** Substack, 11.09.2026 (https://klimaevidenzcheck.substack.com/p/war-der-sommer-2026-ganz-normal).

**Status:** Revision 1 (11.09.2026) nach Validierung ("freigabefähig mit Auflagen",
siehe `Validierungsbericht_sommer-2026-normal.md`). Auflagen 1–8 und 10 umgesetzt,
Auflage 9 (Originaldatei DWD) offen. Nach Nachkontrolle: Auflage 11 (wörtliches Zitat
mit Quelle in Kernaussage 4) und nicht blockierende Formulierungsempfehlungen umgesetzt
(Revision 1a). Funktionsbezeichnung Fuchs an Quelltext angeglichen ("Leiter des
Geschäftsbereichs Klima und Umwelt"), Hinweis aus Nachtrag 2. Fokussierte Nachkontrolle des Validators: siehe
Nachtrag im Validierungsbericht. Freigabe durch den Menschen ausstehend.

Reproduktion: `python3 sommer_2026_normal.py && python3 grafiken.py` im Analyseordner
(zweimaliger Lauf ergab byte-identische `ergebnisse.json`).

---

## 1. Datenbeschaffung und Integritätscheck (SAP 3)

- Quelle: DWD CDC, `regional_averages_tm_summer.txt`, Kopfzeile "erstellt am: 20260902",
  abgerufen 11.09.2026 über den Browser auf Daniels Rechner.
- Deutschland-Spalte 1881–2026 (n = 146) nach `rohdaten/dwd_sommer_deutschland.csv`
  übertragen. **Transkriptionsprüfung:** Prüfsummen direkt auf der Originalseite per
  JavaScript berechnet und mit der CSV verglichen – identisch
  (n = 146; Summe = 2426,71; Σ Jahr·Wert = 4 744 075,36; erster/letzter Wert
  1881 = 16,53 / 2026 = 19,55).
- **Nachtrag Auflage 9 (11.09.2026):** Originaldatei `rohdaten/regional_averages_tm_summer.txt`
  abgelegt. Da aus der Cloud-Umgebung kein direkter Download möglich war, wurde die Datei im
  Browser auf Daniels Rechner per `fetch` byteweise gelesen (Last-Modified 02.09.2026
  05:20 GMT; CRLF-Zeilenenden; festes Format `%9.2f;` je Wert, per Regex für alle 146
  Datenzeilen bestätigt), alle 17 Spalten übertragen und die Datei daraus neu geschrieben.
  **Byte-Vergleich mit dem Original: Länge 27 253 Bytes und Prüfsumme über alle Bytes
  (Polynom-Hash mod 1 000 000 007) identisch.** Deutschland-Spalte stimmt mit
  `dwd_sommer_deutschland.csv` für alle 146 Jahre überein.
- Integritätscheck bestanden:

| Prüfpunkt | Datei | DWD-Pressemitteilung | ok |
|---|---|---|---|
| Sommer 2026 | 19,55 °C | 19,6 °C | ✅ |
| Sommer 2003 | 19,67 °C | 19,7 °C | ✅ |
| Abweichung ggü. 1961–1990 (Mittel 16,27 °C) | +3,28 K | +3,3 K | ✅ |
| Abweichung ggü. 1991–2020 (Mittel 17,55 °C) | +2,00 K | +2,0 K | ✅ |
| Rang 2026 seit 1881 | 2 | 2 | ✅ |

## 2. Diagnostik Primärmodell (OLS 1971–2025, n = 55)

- Trend: **+0,46 K pro Jahrzehnt** (95 %-KI 0,31–0,60)
- Durbin-Watson 1,92, p = 0,65 (zweiseitig, wie SAP 5.5; Rev. 1 – vorher einseitig 0,32 berichtet) → keine relevante Autokorrelation;
  ACF/PACF Lag 1–10 innerhalb ±1,96/√n bis auf PACF Lag 10 (−0,24; Grenze 0,26: knapp innerhalb).
  → HAC-Korrektur nach SAP 5.4 **nicht ausgelöst**.
- Linearität: AIC linear 139,0 vs. quadratisch 139,7 → kein Hinweis auf Krümmung im Fenster.
- **Normalität: Shapiro-Wilk W = 0,945, p = 0,014 → Nicht-Normalität.** Gemäß SAP 5.4:
  Wiederkehrzeiten nur als grobe Größenordnung; empirische Perzentile (S5) in den
  Vordergrund. (Auslegung: SAP definiert "deutlich" nicht; p < 0,05 wurde konservativ
  als Auslöser gewertet.)
- Cook's Distance > 4/n: 1976, 1983, 2003 (D ≤ 0,09) – gekennzeichnet, kein Ausschluss.

## 3. E1 – Wie ungewöhnlich war der Sommer 2026 (19,55 °C)?

*Einstufung nach |z| ist eine vorab festgelegte Konvention dieses Checks (SAP 2), keine
meteorologische Norm.*

| Rahmen | Referenz | Abweichung | z | empirisch | Einstufung (z-Konvention) | S5: außerhalb zentraler 80 %? |
|---|---|---|---|---|---|---|
| R1 1961–1990 | 16,3 °C | +3,3 K | 4,1 | wärmer als alle 30 Referenzsommer | extrem außergewöhnlich | ja |
| R2 1991–2020 | 17,6 °C | +2,0 K | 2,2 | nur 2003 wärmer (Rang 2 von 31) | außergewöhnlich warm | ja |
| R3 Trend 1971–2025 | 18,5 °C | +1,1 K | 1,3 | 8 von 55 Sommern seit 1971 lagen mind. so weit über dem Trend | ungewöhnlich warm | **nein, knapp** (+1,08 K vs. 90.-Perzentil +1,17 K; Abstand 0,09 K) |

- R3: 19,55 °C liegt im 95 %-Prognoseintervall für 2026 (16,8–20,2 °C).
- Wiederkehrzeiten unter Normalannahme sind **nicht belastbar** (Nicht-Normalität, SD aus
  n = 30 geschätzt; laut Validator reicht allein die SD-Unsicherheit bei R1 von ~10³ bis
  ~10⁷ Jahren, bei R2 von ~20 bis ~380 Jahren). Sie werden nur als grobe Klasse
  intern berichtet und **nicht kommuniziert**. Für R3 wird stattdessen die empirische
  Häufigkeit genannt: 8 von 55 Sommern (≈ jeder siebte). Die Trendabweichungen sind
  rechtsschief (Schiefe 0,72), die Normalannahme würde die Häufigkeit unterschätzen.
- Der S5-Befund für R3 ist grenznah: 0,09 K Abstand zum 90.-Perzentil liegt in der
  Größenordnung möglicher Nachkorrekturen des vorläufigen 2026-Werts.
- Kein Ergebnis grenznah (|z| nicht innerhalb ±0,1 einer Schwelle).
- Sensitivitäten R3: S1 1961–2025 z = 1,4; S1 1991–2025 z = 1,2; S2 (2026 im Fit) z = 1,2;
  S3 segmentiert z = 1,2; S4 ARIMA(1,1,2) mit Drift z = 1,5 → alle "ungewöhnlich warm",
  alle innerhalb 95 %-PI.

**Einordnung:** Die Einstufung hängt vollständig vom Bezugsrahmen ab. Gemessen am Klima
von 1961–1990 war 2026 extrem außergewöhnlich; gemessen am aktuellen offiziellen Normal
(1991–2020) außergewöhnlich warm; gemessen am heutigen Trendklima deutlich warm, aber in
einer Größenordnung, die seit 1971 etwa jeder siebte Sommer erreicht hat (nach
z-Konvention "ungewöhnlich warm", nach Perzentil-Variante knapp innerhalb der
zentralen 80 %).

## 4. E2 – Ab wann wäre ein Sommer wie 2026 bei Fortschreibung des Messtrends "normal"?

| Modell | E2a: Trend erreicht 19,6 °C | 95 %-KI | E2b: 19,6 °C ≤ 1 SD über Trend | 95 %-KI |
|---|---|---|---|---|
| **Primär: OLS 1971–2025, Fieller** | **2051** | **2038–2075** | **2033** | **2023–2049** |
| S1: OLS 1961–2025 | 2056 | 2042–2078 | 2036 | 2026–2052 |
| S1: OLS 1991–2025 | 2050 | 2034–2112 | 2033 | 2022–2070 |
| S2: OLS 1971–2026 | 2048 | 2036–2069 | 2031 | 2022–2045 |
| S3: segmentiert 1881–2025 (Bruch 1985,4; letztes Segment +0,53 K/Jz.) | 2045 | 2034–2062 | 2030 | 2023–2043 |
| S4: ARIMA(1,1,2) mit Drift | 2058 (Punktprognose) | – | – | – |
| S6: Residuen-Bootstrap | 2051 (Median) | 2037–2073 | 2033 (Median) | 2022–2049 |
| S5: Perzentil-Definition E2b (19,6 °C ≤ 90.-Perzentil über Trend) | – | – | 2025 | 2017–2039 |

- SAP 7: Keine **Punktschätzung** einer Sensitivität weicht um mehr als 10 Jahre vom
  Primärergebnis ab (Spanne E2a 2045–2058, E2b 2030–2036). **Die KI-Grenzen weichen
  teilweise deutlich ab:** S1 1991–2025 obere Grenze E2a 2112 (+37 Jahre), E2b 2070
  (+20 Jahre); S3 obere Grenze E2a 2062 (−13 Jahre). → Modellunsicherheit bei der oberen
  Grenze wird im Beitrag benannt.
- **Abgleich mit "in 30 Jahren" (≈ 2056):** liegt im 95 %-KI von E2a (2038–2075) →
  nicht im Widerspruch zur Aussage, wenn "normal" = "typischer Sommer" gemeint ist. Für
  E2b ("nicht mehr ungewöhnlich", Konvention ≤ 1 SD) liegt 2056 nach dem KI (2023–2049):
  nach dieser Definition wäre ein Sommer wie 2026 bei anhaltendem Trend schon deutlich
  früher im Normalbereich; nach der Perzentil-Variante (S5) sogar schon heute (2025,
  KI 2017–2039).
- Post-hoc (nicht präregistriert): Mit dem Dateiwert 19,55 °C statt 19,6 °C verschieben
  sich E2a/E2b um je rund 1 Jahr (2050 / 2032). Keine Auswirkung auf die Aussagen.

**Nicht geprüft (SAP 2):** "In der zweiten Jahrhunderthälfte sogar kühl" – szenarioabhängig.

## 5. Kernaussagen-Entwurf (Rev. 1 nach Validierung; Freigabe durch Menschen ausstehend)

1. Ob der Sommer 2026 "normal" war, hängt davon ab, womit man vergleicht – und bezieht
   sich hier nur auf die Mitteltemperatur Juni–August.
2. Gegenüber dem Klima von 1961–1990 lag er 3,3 K darüber – wärmer als jeder der 30
   Sommer dieser Periode. Gegenüber dem aktuellen offiziellen Klimanormal 1991–2020 lag
   er 2,0 K darüber; nur 2003 war in dieser Zeit wärmer.
3. Gegenüber dem Erwärmungstrend seit 1971 lag er rund 1,1 K über dem erwarteten Wert.
   So weit über dem Trend lagen seit 1971 8 von 55 Sommern – etwa jeder siebte. Nach
   unserer vorab festgelegten Konvention (Schwellen bei 1, 2 und 3 Standardabweichungen
   über dem jeweiligen Vergleichswert) heißt das: gemessen an 1961–1990 "extrem außergewöhnlich",
   an 1991–2020 "außergewöhnlich warm", am Trend seit 1971 "ungewöhnlich warm"; nach
   einer Perzentil-Betrachtung liegt er gegenüber dem Trend knapp im oberen
   Normalbereich (0,09 K unter der Grenze). Als "ganz normal" lässt er sich gemessen an
   1961–1990 und 1991–2020 nicht bezeichnen.
4. Setzt sich der Messtrend seit 1971 (+0,46 K pro Jahrzehnt, 95 %-KI 0,31–0,60) linear
   fort, wäre ein Sommer wie 2026 um 2051 ein typischer Sommer (95 %-KI 2038–2075; je nach
   Trendfenster reicht die obere Grenze bis 2112) und bereits ab etwa 2033 nicht mehr
   ungewöhnlich (≤ 1 SD über Trend; KI 2023–2049, je nach Trendfenster obere Grenze bis
   2070). Nach der Perzentil-Variante wäre das schon um 2025 der Fall (KI 2017–2039).
   Tobias Fuchs, Leiter des Geschäftsbereichs Klima und Umwelt beim DWD, sagte im Interview mit klimareporter° (08.09.2026):
   "Wenn wir in 30 Jahren zurückblicken, könnte es allerdings sein, dass wir ihn eher als
   normal betrachten." Diese Einschätzung steht nicht im Widerspruch zum Messtrend. Die
   Intervalle bilden nur statistische Unsicherheit ab, nicht, wie sich künftige
   Emissionen entwickeln.

## 6. Limitationen (Pflichtangaben für den Beitrag)

- Nur Mitteltemperatur Juni–August; Hitzewellen, Höchstwerte, Tropennächte und
  Trockenheit nicht abgebildet (SAP 8.3)
- Trendfortschreibung ist keine Klimaprojektion; keine Szenario-Unsicherheit (SAP 8.1)
- Keine Attribution (SAP 8.4)
- Werte 2025 und 2026 vorläufig; R3-Perzentilbefund liegt nur 0,09 K von der Grenze (SAP 8.6)
- Referenzperioden mit n = 30; Normal- statt Extremwertverteilung; Wiederkehrzeiten
  nicht belastbar und nicht kommuniziert (SAP 9)
- Extrapolation über ~30 Jahre; ein Deutschland-Mittel verdeckt regionale Unterschiede (SAP 9)
- Frühe Messreihe vor 1900 weniger homogen – betrifft nur S3 (SAP 8.5)
- Umsetzung in Python statt R; Rohdatei transkribiert und per Prüfsummen verifiziert
  (Abweichungsprotokoll A1–A2)

## 7. Kanal-Entwürfe (11.09.2026)

- Entwürfe: `Reports/2026-09-sommer-2026-normal/kanal-entwuerfe/substack.md` (≈ 780 Wörter
  inkl. Methodik und Quellen, 1 Grafik) und `linkedin.md`.
- Prüfung durch Validator: Nachtrag 3 im Validierungsbericht. Änderungswünsche Ä1–Ä4 und
  Ä6–Ä11 umgesetzt. Ä5: klimareporter°-URL und Überschrift "In 30 Jahren könnte dieser
  Sommer normal sein" vom Analysten am 11.09.2026 im Browser gegen das Original geprüft
  (wörtlich). GitHub-Link funktioniert erst nach Push des Analyseordners.
- Status: Entwurf, Freigabe der Texte durch Daniel Saure ausstehend.
