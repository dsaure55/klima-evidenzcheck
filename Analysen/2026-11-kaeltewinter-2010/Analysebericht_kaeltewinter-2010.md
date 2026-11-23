# Analysebericht – Kältewinter wie 2010

**Status: Validierung bestanden mit Auflagen** (`Validierungsbericht_kaeltewinter-2010.md`,
23.11.2026: 0 kritisch, 0 hoch, 3 mittel). Auflagen V-1, V-2, V-3 und V-5 durch den
analyst umgesetzt (siehe Abschnitt 10). **Nachtrag 1** (Nachprüfung der Auflagen
durch den validator) liegt im Validierungsbericht vor: V-1, V-2, V-4, V-5 erfüllt,
V-3 für Grafik 2 offen (N-1, mittel), 0 kritisch, 0 hoch. **N-1 in Umsetzung**
(Spanne im Untertitel von Grafik 2, zusammen mit N-2, N-3, N-5; A15, Abschnitt
10.1); die Nachprüfung von N-1 durch den validator (Nachtrag 2) steht aus.
Bestätigungen Daniel Saure vom 23.11.2026 zu A1b, A9 und S9b liegen vor (siehe
Abschnitt 10.1 und Abweichungsprotokoll, Abschnitt „Bestätigungen Daniel
Saure“). Dieser Bericht dokumentiert die Umsetzung des SAP und
die Rechenergebnisse. Kernaussagen für eine Veröffentlichung werden nach SAP 11
erst nach dem Validierungsbericht formuliert. Keine Kanaltexte.

- **SAP:** `SAP_kaeltewinter-2010.md`, v1.0 final, eingefroren durch Daniel Saure
  am 23.11.2026 (Commit 2a2353e)
- **Skript:** `kaeltewinter-2010.R`; Lauf 23.11.2026, 21:11 MEZ, R 4.6.1,
  fehlerfrei (Exit-Code 0); Seed 20261123, B = 10 000. Neuläufe nach reinen
  Beschriftungsänderungen: 21:29 MEZ (A14, V-5) und 21:40 MEZ (A15, N-1/N-2),
  jeweils Exit-Code 0; alle Tabellen, CSV und `ergebnisse.json` per sha256
  bitidentisch, geändert nur die PNG-Dateien von Grafik 1 und 2 (`run_log.txt`)
- **Daten:** DWD CDC, Gebietsmittel Deutschland, Monatsmitteltemperatur (Dateien
  01, 02, 03, 10, 11, 12; Dateikopf „erstellt am 20261102“) und Winterdatei
  („erstellt am 20260302“); Zugriff 23.11.2026; SHA-256 geprüft, alle OK.
  Quelle: Deutscher Wetterdienst.
- **Datenschnitt März 2026:** angewendet direkt nach dem Einlesen. Monatswerte
  ab Oktober 2026 sind in keiner Ausgabe, keiner Grafik und keiner Logzeile
  enthalten; U₂₀₂₇ wurde nicht berechnet.
- **Abweichungen:** siehe `Abweichungsprotokoll_kaeltewinter-2010.md` (A1–A15;
  keine betrifft Primärgröße, Fenster, Referenz oder Umschaltregel; A14 und A15
  sind reine Darstellungsänderungen nach Auflage V-5 bzw. Nachtrag 1, N-1/N-2).

## 1. Integritäts-Checks (SAP 3.5)

| Check | Ergebnis |
|---|---|
| 1 Vollständigkeit Jan. 1881–März 2026, keine Fehlwerte, Bereich −15…15 °C | bestanden (0 fehlend, 0 NA, 0 außerhalb) |
| 2 DJF aus Monatswerten (tagesgewichtet) vs. DWD-Winterdatei, Toleranz 0,05 K | **nicht bestanden**: 52 von 145 Wintern > 0,05 K, max. 0,19 K. Zusatz (A9): Gegen das ungewichtete Monatsmittel max. 0,003 K, 0 Überschreitungen; die Winterdatei ist demnach ungewichtet. Dokumentiert, keine Rechnung geändert. |
| 3 Abgleich Okt. 2013–März 2026 mit Gasspeicher-Datei | bestanden: 78 Monate, 0 fehlend, 0 Abweichungen |
| 4 kein Monatswert nach März 2026 im Arbeitsdatensatz | bestanden |

Details: `output/check_3-5-2_djf_vs_winterdatei.csv`,
`output/check_3-5-3_abgleich_gasspeicher.csv`, `run_log.txt`.

## 2. Referenzwerte (SAP 2.0, 2.5, 6)

| Größe | Wert (ungerundet) | Bericht (0,1 °C) |
|---|---|---|
| T_ref = JFM 2010 | 0,0339 °C | 0,0 °C |
| DJF Dez. 2009–Feb. 2010 (S1) | −1,3026 °C | −1,3 °C |
| Okt. 2009–März 2010 (S2) | 2,6793 °C | 2,7 °C |
| T_ref^S14 (Nov./Dez. 2010 + Jan.–März 2010, /151) | 0,2145 °C | 0,2 °C |

## 3. E1 – Historische Häufigkeit (SAP 2.1), Tabelle 1

Vergleich T_y ≤ T_ref nach Rundung auf 0,01 °C; 2010 ausgeschlossen.

| Zeitraum | k | n | Anteil | Clopper-Pearson 95 % |
|---|---|---|---|---|
| **1881–2026 (primär)** | **35** | **145** | **24 %** | **17 % bis 32 %** |
| 1881–1930 | 16 | 50 | 32 % | 20 % bis 47 % |
| 1931–1960 | 8 | 30 | 27 % | 12 % bis 46 % |
| 1961–1990 | 8 | 30 | 27 % | 12 % bis 46 % |
| 1991–2020 | 3 | 29 | 10 % | 2 % bis 27 % |
| 1997–2026 | 2 | 29 | 7 % | 0,8 % bis 23 % |

- Rang von JFM 2010 unter 146 Jahren: **35** (1 = kältestes; Gleichstand mit 1883
  nach 0,01-Rundung, 1883 ungerundet 0,0336 °C, siehe A10).
- Jahre mit T_y ≤ T_ref: 1881 1883 1886 1887 1888 1889 1891 1892 1893 1895 1901
  1909 1917 1922 1924 1929 1931 1940 1941 1942 1947 1954 1955 1956 1963 1964
  1969 1970 1979 1985 1986 1987 1996 2006 2013.
- Letztes Jahr vor 2010: **2006**; erstes Jahr nach 2010: **2013**.
- E1 ist nicht trendbereinigt (SAP 2.1).

## 4. E2 – Wahrscheinlichkeit unter Klimabedingungen von 2027 (SAP 2.2)

### 4.1 Modell M1 (OLS, 1971–2026, n = 56)

| Kenngröße | Wert |
|---|---|
| b̂₀ / b̂₁ | −73,910 / 0,0381 K pro Jahr (Modellkoeffizienten; gerundet 0,4 K pro Dekade) |
| σ̂ (Divisor n − 2) | 1,7 K |
| h₂₀₂₇ | 0,0734 |
| ŷ₂₀₂₇ (95-%-KI) | 3,3 °C (2,4 bis 4,2 °C) |
| ŷ₂₀₁₀ (95-%-KI) | 2,6 °C (2,1 bis 3,2 °C) |
| Residuum 2010 | z = −1,56; Rang 7 von 56 (1 = negativstes) |

Hinweis nach SAP 8: Das Referenzjahr wurde wegen seiner Kälte ausgewählt; Rang und
Residuum sind eine Beschreibung, keine unabhängige Bestätigung seiner
Außergewöhnlichkeit.

### 4.2 Diagnostik (SAP 5.2) und Umschaltregel (SAP 5.3), Tabelle 3

| Prüfung | Statistik | p | Hinweis |
|---|---|---|---|
| Ljung-Box, Lag 5, fitdf = 0 | Q = 5,149 | 0,398 | Umschaltregel |
| Shapiro-Wilk | W = 0,968 | 0,141 | Umschaltregel |
| Durbin-Watson | DW = 1,547 | 0,031 | nur Information (p < 0,05) |
| Schiefe g₁ (Momentenschiefe) | −0,505 | – | nur Information |
| Breusch-Pagan gegen Jahr | BP = 1,015 | 0,314 | nur Information |
| Residual-SD 1971–1998 / 1999–2026 | 1,9 / 1,4 K | – | beschreibend |
| Cook's D > 4/56 | 1974, 1985, 1987 | – | kein Ausschluss |

- ACF/PACF bis Lag 10 und Q-Q-Plot: `output/diagnostik_M1.png`,
  `output/M1_acf_pacf.csv`. Der Q-Q-Plot zeigt im unteren Bereich mehrere Punkte
  unterhalb der Normalverteilungslinie (Beschreibung, keine Umschaltwirkung).
- **Angewendete Regel 5.3:** Ljung-Box p ≥ 0,05 und Shapiro-Wilk p ≥ 0,05
  → **Primärschätzer M1** (t-prädiktiv).

### 4.3 Primärergebnis E2

| | Wert |
|---|---|
| **P̂₂₀₂₇ (M1, t-prädiktiv)** | **3 %** (0,0331) |
| **Unsicherheitsspanne 95 %** (Parametersimulation, B = 10 000) | **0,5 % bis 10 %** (0,0048 bis 0,0995) |
| Wiederkehrzeit | etwa einmal in **30 Jahren** (Spanne 10 bis 210 Jahre) |
| Rechenkontrolle 5.4 | Mittel der P*_b = 0,0328; Differenz −0,02 Prozentpunkte (≤ 0,5, ok) |

Die Spanne bildet nur die statistische Unsicherheit von M1 ab, nicht die
Modellwahl (dafür Abschnitt 5).

**Lesehinweis zur Primärzahl (Auflage V-3):** Die 3 % werden nur zusammen mit
der Unsicherheitsspanne **0,5 % bis 10 %** genannt, nicht als alleinstehende
Zahl. Die Primärzahl ist modellabhängig: M1 nimmt normalverteilte Residuen an.
Die Residuen sind linksschief (Schiefe g₁ = −0,51); im Q-Q-Plot liegen die
kältesten Residuen unter der Normalverteilungslinie. Shapiro-Wilk (p = 0,14)
löst die Umschaltregel 5.3 nicht aus, M1 bleibt daher nach SAP Primärschätzer.
Das Normalmodell kann kalte Extreme aber eher knapp schätzen: Die
Bootstrap-Schätzer, die keine Normalverteilung annehmen (S10, M1-Boot und
M1-Block-Boot), liefern 5 % statt 3 %. Die Modellabhängigkeit über alle
Rechenwege zeigt die Spannbreite in Abschnitt 5.

## 5. Sensitivitäten (SAP 6), Tabelle 2

| Nr. | Variation | Verfahren | P̂ | Spanne 95 % | Wiederkehr (Jahre) | E1 (k/n, Anteil, CP) |
|---|---|---|---|---|---|---|
| Primär | JFM, Ref. JFM 2010 | M1 | 3 % | 0,5–10 % | 30 [10; 210] | 35/145, 24 % [17; 32 %] |
| S1 | DJF, Ref. Dez. 2009–Feb. 2010 | M1 (Primärschätzer) | 2 % | 0,2–6 % | 60 [17; 590] | 26/144, 18 % [12; 25 %] |
| S2 | Okt.–März, Ref. 2009/10 | M1 (Primärschätzer) | 2 % | 0,3–7 % | 45 [14; 350] | 52/144, 36 % [28; 45 %] |
| S3 | Gradtagzahl | entfallen per SAP v0.2, Grund: keine geeigneten Tagesdaten ohne unverhältnismäßigen Aufwand (3.2) | – | – | – | – |
| S4 | kälteste 14-Tage-Phase | entfallen per SAP v0.2, Grund wie S3 | – | – | – | – |
| S5 | kälteste 30-Tage-Phase | entfallen per SAP v0.2, Grund wie S3 | – | – | – | – |
| S6 | Trendfenster 1881–2026 | M1 | 9 % | 4–16 % | 11 [6; 25] | – |
| S7 | Trendfenster 1961–2026 | M1 | 3 % | 0,5–9 % | 30 [11; 185] | – |
| S8 | LOESS 1881–2026, Niveau 2026 (3,6 °C), SD 1,6 K | Normal-prädiktiv, Residuen-Bootstrap | 2 % | 0,1–12 % | 65 [9; 905] | – |
| S9a | ohne Trend, 1997–2026, t-prädiktiv (Mittel 2,7 °C, SD 1,5 K) | Parametersimulation (A4, Post-hoc) | 4 % | 0,8–11 % | 25 [9; 125] | – |
| S9b | ohne Trend, 1997–2026, empirischer Anteil inkl. 2010 (3/30: 2006, 2010, 2013) | Clopper-Pearson (A4, Post-hoc) | 10 % | 2–27 % | 10 [4; 45] | – |
| S10 | M1-AR (φ̂ = 0,22) | GLS AR(1), ML | 3 % | 0,4–9 % | 30 [11; 255] | – |
| S10 | M1-Boot | Residuen-Bootstrap | 5 % | 0–14 % | 19 [7; nicht begrenzt] | – |
| S10 | M1-Block-Boot | Moving-Block, l = 3 | 5 % | 0–16 % | 19 [6; nicht begrenzt] | – |
| S11 | GEV Tagesdaten | entfallen per SAP v0.2, Grund wie S3 | – | – | – | – |
| S12 | M1 ohne 2010 (n = 55) | M1 | 3 % | 0,4–8 % | 35 [12; 280] | – |
| S13 | Trendniveau 2026 | M1 | 3 % | 0,5–10 % | 30 [10; 180] | – |
| S14 | INES-Zeitraum Nov.–März, Ref. Nov./Dez. 2010 + Jan.–März 2010 | M1 (Primärschätzer) | 0,4 % | 0,01–2 % | 275 [60; 7870] | 21/145, 14 % [9; 21 %]; ohne 2010/2011: 21/143, 15 % [9; 22 %] |

Exakte Werte: `output/tabelle2_E2_sensitivitaeten.csv`. Wiederkehrzeiten nach
SAP 11 gerundet (ganze Jahre, ab 20 auf 5 Jahre).

**Spannbreite (SAP 6):** Je nach Rechenweg liegt P̂ zwischen **0,4 % (S14)** und
**10 % (S9b)** (Auslegung A11: alle Zeilen einschließlich S9b; ohne S9b wäre das
Maximum 9 % bei S6).

**Offenlegung zu S9b (Auflage V-2):** Das Maximum der Spannbreite (10 %) stammt
genau aus S9b. Der empirische Anteil in S9b zählt das Referenzjahr 2010 selbst
mit (3/30: 2006, 2010, 2013). 2010 erfüllt „mindestens so kalt wie 2010“
zwangsläufig. In E1 (2.1) und bei S1/S2 (A6) wird das Referenzjahr dagegen
ausgeschlossen. Ohne 2010 ergäbe der empirische Anteil 1997–2026 **2/29 = 7 %**
(dieser Wert steht bereits in Tabelle 1, Teilzeitraum 1997–2026). Die Auslegung
A4(b) wurde nicht geändert und nicht neu gerechnet; Zahlen und Tabellen
bleiben unverändert. Ob die Auslegung A4(b) bestehen bleibt, entscheidet
Daniel Saure (**offener Punkt**, siehe Abschnitt 10). Bis dahin gilt die
Spannbreite 0,4 % bis 10 % wie vorab festgelegt; der Wert 7 % ist eine
Offenlegung, keine alternative Spannbreite.

**S14 im Detail (SAP 2.5):** Rang von T_ref^S14 unter 146 Werten: 22. Jahre mit
U_t ≤ T_ref^S14: 1886 1888 1889 1891 1893 1895 1909 1917 1922 1924 1929 1940
1941 1942 1947 1956 1963 1969 1970 1985 1996. Die teilweise überlappenden Jahre
2010 und 2011 sind nicht darunter. S14 ist eine Sensitivität, kein
Hauptergebnis; es ist die Rechnung mit dem INES-Zeitraum November bis März.

## 6. OWID-Plausibilisierung (SAP 3.4)

Datensatz vorhanden: OWID „average-monthly-surface-temperature“ (Copernicus ERA5,
Stand laut Metadaten 11.11.2026), Deutschland ab Januar 1940; Datenschnitt
März 2026 angewendet. Gemeinsamer Zeitraum JFM 1940–2026 (n = 87):

- Rang JFM 2010: DWD 19, OWID 19 (1 = kältestes)
- Pearson-Korrelation der JFM-Mittel: r = 0,996

Keine Verrechnung; maßgeblich ist der DWD. Für S14 keine OWID-Prüfung (SAP 3.4).
Daten: `output/owid_vergleich_jfm.csv`.

## 7. Pflichthinweise (SAP 11)

- **Grundrate, keine Prognose (8.1):** P̂₂₀₂₇ ist eine klimatologische
  Wahrscheinlichkeit unter dem statistischen Klimazustand 2027, ohne Kenntnis der
  aktuellen Wetterlage. Für S14 gilt zusätzlich: Ein Teil des Zeitraums November
  2026–März 2027 ist bereits beobachtet; diese Beobachtungen ab Oktober 2026
  fließen bewusst nicht ein (Datenschnitt März 2026).
- **Temperatur ist nicht Gasbedarf (8.2):** Aus P̂₂₀₂₇ folgt keine
  Wahrscheinlichkeit einer Versorgungslücke.
- **Deutschland ist nicht Europa (8.3):** INES nutzt das „EU-Wetterjahr 2010“;
  diese Analyse misst nur das Deutschland-Gebietsmittel.
- **INES-Primärquelle (3.3):** INES, Pressemitteilung vom 10.11.2026
  („INES-Gas-Szenarien: Niedrige Speicherfüllstände gefährden
  Versorgungssicherheit bei extremer Kälte“) und Dokumentation zum
  November-Update, Abschnitt 3.3, S. 13–15; abgelegt unter `quellen/`.
- **Kombinationszeitraum (2.5, 9):** Das INES-Szenario kombiniert November–
  Dezember 2010 mit Januar–März 2010; so ist es nie als ein zusammenhängender
  Winter aufgetreten.

### 7.1 Interpretationsrahmen (SAP 8; ergänzt nach Auflage V-1)

- **Kontext INES:** INES vertritt Speicherbetreiber. Das wird hier sachlich als
  Kontext genannt; die Analyse schreibt INES keine Motive zu und bewertet weder
  INES noch Bundesregierung noch Bundesnetzagentur.
- **Kälteszenario ist methodisch üblich:** Ein Kälteszenario in einer
  Risikorechnung ist methodisch üblich, unabhängig davon, wie wahrscheinlich es
  ist. Eine niedrige oder hohe Wahrscheinlichkeit P̂₂₀₂₇ ist deshalb kein Urteil
  über die Szenariowahl von INES.
- **Kombinationscharakter ist keine Kritik:** Dass das INES-Szenario
  November–Dezember 2010 mit Januar–März 2010 kombiniert (2.5, S14), wird
  sachlich beschrieben, nicht als Kritik.
- **Auswahleffekt:** Das Referenzjahr wurde wegen seiner Kälte ausgewählt; Rang
  und Residuum von 2010 sind eine Beschreibung, keine unabhängige Bestätigung
  seiner Außergewöhnlichkeit (siehe auch 4.1).

### 7.2 Limitationen (SAP 9, einzeln; ergänzt nach Auflage V-1)

1. **Monatsmittel glätten kurze Kältewellen**, die für die Gasspitzenlast
   entscheidend sind. Die Tagesdaten-Sensitivitäten (Gradtage, Kältephasen,
   Extremwertansatz; S3–S5, S11) entfallen mangels täglichem
   DWD-Gebietsmittel und wegen des Aufwands und des späteren Beginns (1951) der
   HYRAS-Raster (3.2). Kurze Kältewellen werden daher nicht abgebildet.
2. **Weniger Stationen vor 1951:** Die DWD-Gebietsmittel vor 1951 beruhen auf
   weniger Stationen; die Unsicherheit früher Werte ist größer, wird aber nicht
   modelliert. Das betrifft vor allem E1 (1881–2026) und S6/S8.
3. **Begrenzte Grundlage für die linke Flanke:** E2 beruht mit n = 56
   (1971–2026) auf einer begrenzten Grundlage für Aussagen über die kalte
   Flanke der Verteilung; die Spanne ist deshalb Teil der Kernaussage (siehe
   auch Lesehinweis in 4.3).
4. **Referenzjahr als Punktdefinition:** Ein einzelnes Referenzjahr ist eine
   Punktdefinition von „Kälte“; die Wahl stammt von INES und wurde nicht
   optimiert.
5. **Kombiniertes Szenario:** Das INES-Szenario kombiniert November–Dezember
   2010 mit Januar–März 2010 (3.3). Die Primärgröße (JFM) bildet nur den
   zweiten Teil ab; S14 bildet die Kombination ab, vergleicht sie aber mit
   zusammenhängenden historischen Zeiträumen. Beides ist eine Näherung an ein
   Szenario, das so nie als ein Winter aufgetreten ist.
6. **Keine Aussage zum laufenden Winter:** Die Analyse sagt nichts zu den
   Monaten Oktober–Dezember 2026 und nichts darüber, wie der Winter 2026/27
   bisher verlaufen ist (Datenschnitt März 2026), auch nicht in S14.
7. **INES-Einordnung nicht vom sap-autor geprüft:** Die INES-Primärquelle
   wurde von der Top-Level-Session gesichert und in SAP 3.3 eingetragen; der
   sap-autor hat die Dokumente nicht selbst gelesen. Die INES-Einordnung in
   SAP 3.3 ist als „nicht vom sap-autor geprüft“ gekennzeichnet.

## 8. Grafiken

- `output/grafik1_zeitreihe_jfm.png` – Hauptgrafik: JFM 1881–2026, Trend M1
  1971–2026 mit Trendniveau 2027, Linie bei T_ref, Jahre ≤ T_ref hervorgehoben.
- `output/grafik2_praediktive_verteilung_2027.png` – prädiktive Verteilung 2027
  (M1), Fläche ≤ T_ref, Beschriftung „klimatologische Wahrscheinlichkeit, keine
  Wettervorhersage“; Untertitel nennt die Primärzahl mit Spanne „(3 %, Spanne
  0,5 % bis 10 %)“ (A15, N-1).
- Quellenangabe in Grafik 1 und 2: „Quelle: Deutscher Wetterdienst“ (Lizenz
  CC BY 4.0, `run_log.txt` Nachtrag V-4; A15, N-2).
- `output/diagnostik_M1.png` – ACF, PACF, Q-Q, Residuen gegen Jahr und gegen
  angepasste Werte, Cook's Distance.

## 9. Reproduktion

`Rscript kaeltewinter-2010.R <Analyseordner>`; Laufzeit ca. 1 Minute. Testläufe
ohne Anhang an `run_log.txt` mit Umgebungsvariable `KW_NO_RUNLOG=1`.
Paketversionen: `output/session_info.txt`. Reihenfolge der Zufallsziehungen im
Skriptkopf (SAP 10).

## 10. Umsetzung der Validierungsauflagen (23.11.2026)

Grundlage: `Validierungsbericht_kaeltewinter-2010.md` (23.11.2026), Abschnitt 7.
Freigabe der Umsetzung: Daniel Saure im Chat am 23.11.2026, „Ja, umsetzen“, auf
die Frage der Top-Level-Session, ob V-1 bis V-5 umgesetzt werden (S9b nur
offengelegt). Umsetzung durch den analyst-Subagenten. SAP v1.0 final bleibt
maßgeblich und wurde nicht geändert. Keine Zahl, keine Tabelle und keine
Ergebnisdatei wurde neu gerechnet oder verändert.

| Auflage | Umsetzung | Ort |
|---|---|---|
| V-1 (M-1) | SAP-8-Pflichtinhalte ergänzt (INES vertritt Speicherbetreiber, sachlich ohne Motivzuschreibung; Kälteszenario in Risikorechnung methodisch üblich; Kombinationscharakter keine Kritik; Auswahleffekt). Pauschalverweis „Limitationen gelten unverändert“ ersetzt durch alle sieben Limitationen aus SAP 9 einzeln. | Abschnitt 7.1, 7.2 |
| V-2 (M-2) | Offengelegt: S9b zählt 2010 selbst mit; ohne 2010 2/29 = 7 % (Tabelle 1); S9b bildet das Maximum der Spannbreite. Nicht neu gerechnet, Tabelle 2 und Spannbreite unverändert. | Abschnitt 5, nach dem Spannbreiten-Satz; Abweichungsprotokoll, Abschnitt „Nachtrag: Umsetzung der Validierungsauflagen“, Zeile V-2 (die Tabellenzeilen A4 und A11 selbst sind unverändert; korrigiert nach N-3) |
| V-3 (M-3) | Lesehinweis: 3 % nur mit Spanne 0,5 % bis 10 %; Modellabhängigkeit (Schiefe −0,51, kalte Residuen unter der Normallinie, Bootstrap-Schätzer 5 %). Primärschätzer M1 unverändert. | Abschnitt 4.3 |
| V-4 (G-1) | nicht durch den analyst bearbeitet (Adressat Top-Level-Session; Nachtrag Lizenz steht in `run_log.txt`) | – |
| V-5 (G-3) | Temperaturangaben auf 0,1 °C bzw. 0,1 K: σ̂ 1,67 → 1,7 K; Residual-SD 1,86 / 1,44 → 1,9 / 1,4 K; S8 SD 1,65 → 1,6 K (ungerundet 1,649); S9a SD 1,47 → 1,5 K; Trend 0,38 → 0,4 K pro Dekade. | Abschnitte 4.1, 4.2, 5 |
| V-5 (G-5) | Umlaute in Grafik 1 und Grafik 2 korrigiert (März, wärmer, Fläche, Verlängerung, für). Nur Beschriftungsstrings im Skript geändert (A14), Skript neu ausgeführt (Exit-Code 0). sha256 aller Dateien in `output/` vorher/nachher in `run_log.txt`: alle Tabellen, `ergebnisse.json`, alle CSV, `diagnostik_M1.png` und `session_info.txt` bitidentisch; geändert nur `grafik1_zeitreihe_jfm.png` und `grafik2_praediktive_verteilung_2027.png`. | `kaeltewinter-2010.R`, `output/`, `run_log.txt` |

**Bewusst nicht auf 0,1 gerundet (Auslegung zu V-5, zur Nachprüfung durch den
validator):** (a) die Spalte „Wert (ungerundet)“ in Abschnitt 2, die ausdrücklich
als ungerundet gekennzeichnet ist und neben der gerundeten Spalte steht; (b) der
Vergleich 1883 (0,0336 °C) mit 2010 (0,0339 °C) in Abschnitt 3, weil er den
Gleichstand nach 0,01-°C-Rundung erklärt; (c) die Differenzen im Integritäts-Check
3.5-2 (max. 0,19 K bzw. 0,003 K), weil sie gegen die Toleranz 0,05 K aus SAP 3.5
geprüft werden und bei 0,1-Rundung nicht mehr aussagekräftig wären; (d) die
Modellkoeffizienten b̂₀/b̂₁ in 4.1 (Parameter, keine Temperaturangabe).

**Offene Punkte für Daniel Saure (Stand der Erstumsetzung; Erledigung siehe 10.1):**

1. **S9b / Auslegung A4(b) (V-2):** Entscheidung, ob der empirische Anteil
   1997–2026 in S9b das Referenzjahr 2010 weiter mitzählt (3/30 = 10 %, derzeit,
   bildet das Maximum der Spannbreite) oder nicht (2/29 = 7 %). Jede Änderung
   wäre Post-hoc zu kennzeichnen, beide Varianten wären zu berichten
   (Validierungsbericht V-2). *Erledigt: bestätigt, siehe 10.1.*
2. **V-6** (Bestätigung A1b-Wortlaut „Du lädst sie“ und A9 „Dokumentation
   genügt“) liegt beim Menschen und ist hier nicht bearbeitet. *Erledigt:
   bestätigt, siehe 10.1.*
3. Fokussierte Nachprüfung dieser Umsetzung durch den validator als Nachtrag
   zum Validierungsbericht (CLAUDE.md, Dokumentationspflicht) steht aus.
   *Erledigt: Nachtrag 1 im Validierungsbericht liegt vor.*

### 10.1 Nachtrag 1 des Validierungsberichts und Bestätigungen (23.11.2026)

**Bestätigungen Daniel Saure** (Chat 23.11.2026, Wortlaut „Ja, alle drei“;
dokumentiert im Abweichungsprotokoll, Abschnitt „Bestätigungen Daniel Saure“):

- **A1b** (Rohdaten-Download durch die Top-Level-Session statt durch Daniel
  Saure): bestätigt.
- **A9** (Integritäts-Check 3.5-2 nicht bestanden, Ursache ungewichtetes
  DWD-Wintermittel, nur dokumentiert): bestätigt.
- **S9b / A4(b):** Auslegung bleibt wie gerechnet und offengelegt (2010 zählt im
  empirischen Anteil mit); Spannbreite bleibt 0,4 % bis 10 %. Keine
  Neuberechnung.

**Umsetzung der Punkte aus Nachtrag 1** (analyst-Subagent, A15; SAP v1.0 final
unverändert; keine Zahl neu gerechnet):

| Punkt | Umsetzung | Ort |
|---|---|---|
| N-1 (mittel) | Untertitel Grafik 2: „… mindestens so kalt wie Jan.-März 2010 (3 %, Spanne 0,5 % bis 10 %)“. Spanne aus dem vorhandenen Ergebnisobjekt (= Tabelle 2, Spalte `Spanne_fmt`, und `ergebnisse.json`, `E2.span` 0,00481 / 0,09948) mit demselben Formatierer; nicht neu gerechnet. | `kaeltewinter-2010.R`, `output/grafik2_praediktive_verteilung_2027.png` |
| N-2 (gering) | Quellenangabe in Grafik 1 und 2 einheitlich „Quelle: Deutscher Wetterdienst“ (Lizenz CC BY 4.0, `run_log.txt` Nachtrag V-4). | `kaeltewinter-2010.R`, beide Grafik-PNG |
| N-3 (gering) | Ortsangabe zu V-2 in der Tabelle oben korrigiert: verweist jetzt auf den Nachtrag im Abweichungsprotokoll statt auf A4/A11. | dieser Abschnitt |
| N-5 (gering) | Berichtskopf nennt die Neuläufe 21:29 MEZ (A14) und 21:40 MEZ (A15); Status aktualisiert. | Kopf dieses Berichts |

Neulauf A15: 23.11.2026, 21:40:55 MEZ, Exit-Code 0. sha256 aller 16 Dateien in
`output/` vorher/nachher in `run_log.txt`: alle Tabellen, alle CSV,
`ergebnisse.json`, `diagnostik_M1.png`, `session_info.txt` und
`console_log.txt` bitidentisch; geändert nur `grafik1_zeitreihe_jfm.png` und
`grafik2_praediktive_verteilung_2027.png`. Beide Grafiken gesichtet, Text
vollständig lesbar.

**Weiterhin offen:** Nachprüfung von N-1 (Grafik 2, sha256-Nachweis) durch den
validator als Nachtrag 2 zum Validierungsbericht. N-4 und N-6 (gering) waren
nicht Teil dieses Auftrags und sind unverändert. V-1/V-3 im späteren
Veröffentlichungstext prüft der Faktencheck bzw. eine weitere Nachprüfung.
