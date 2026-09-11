# Statistischer Analyseplan (SAP) – Kurz-SAP / Format "Schnellcheck"

**Titel:** War der Sommer 2026 "ganz normal" – und könnte er in 30 Jahren normal
sein? Einordnung der deutschen Sommermitteltemperatur 2026 in die DWD-Messreihe
unter drei vorab festgelegten Bezugsrahmen sowie statistische Trendfortschreibung.

**Version:** 1.0 (final)
**Status:** final
**Datum (Entwurf v1.0):** 11.09.2026
**Autor:in:** Claude (Cowork-Session "Money"), Entwurf zur Prüfung durch Daniel Saure
**Freigabe/Einfrieren:** Daniel Saure   Datum: 11.09.2026
*(Freigabe im Chat mit dem Wortlaut "Volltext gelesen, einfrieren", nachdem der
vollständige Text v1.0 inkl. eingearbeiteter Rückfragen vorlag; siehe CLAUDE.md,
Verifikationspflicht)*

**Geplanter Ordner:** `Analysen/2026-09-sommer-2026-normal/`

**Versionshistorie:**
- **v1.0 draft (11.09.2026):** Erstentwurf, präregistriert vor Datenzugriff.
- **v1.0 draft, Ergänzung 11.09.2026:** Rückfragen 1–3 durch Daniel Saure
  beantwortet (Abschnitt 12); Folgeanpassungen in Abschnitt 1 (Beleglage
  Aussage B1) und Abschnitt 11 (neutrale Nennung). Keine Änderung an Estimands,
  Methoden oder Sensitivitäten. Kein Datenzugriff.
- **v1.0 final (11.09.2026):** Volltext von Daniel Saure gelesen und eingefroren.
  Rückfragen 4 und 5 beantwortet. Keine inhaltliche Änderung gegenüber dem
  Entwurf. Datenzugriff erst ab diesem Stand.

---

## 0. Status dieser Analyse

- Erster Check im neuen Format **Schnellcheck** (Anlass: laufende Mediendebatte,
  Ziel: Veröffentlichung innerhalb weniger Tage). Schmaler Umfang, aber gleiche
  Regeln: SAP vor Datenzugriff, Einfrieren durch den Menschen, unabhängige
  Validierung vor Veröffentlichung.
- **Präregistriert vor Datenzugriff:** Die DWD-Zeitreihe wurde für diesen SAP
  nicht gesichtet, kein Code ausgeführt.
- **Transparenz über Vorwissen:** Aus der DWD-Pressemitteilung vom 31.08.2026
  (über Sekundärberichte) sind bekannt: Sommermittel 2026 = 19,6 °C (vorläufig),
  +3,3 K ggü. 1961–1990, +2,0 K ggü. 1991–2020, Rang 2 seit 1881 hinter 2003
  (19,7 °C). Diese Werte sind öffentlich; daraus folgt, dass die Ergebnisse für
  R1/R2 (Abschnitt 2) teilweise absehbar sind. Offen und nicht vorab bekannt sind
  die Streuungsmaße, die Trenderwartung (R3) und alle Ergebnisse zu E2.
- **Abgrenzung:** Die Analyse "Hitzesommer 2026" vom 29.08.2026 betrifft
  hitzebedingte Sterbefälle (RKI) – andere Zielgröße, andere Daten, keine
  Überschneidung.

## 1. Hintergrund / Rationale

Nach dem Sommer 2026 stehen sich in der öffentlichen Debatte zwei Aussagen gegenüber:

- **B1 – Tino Chrupalla (AfD-Co-Vorsitzender), ARD-Sommerinterview, 23.08.2026:**
  Die Hitzewochen seien ein "ganz normaler Sommer" gewesen, es gebe "viel
  Panikmache". *(Beleglage 11.09.2026: übereinstimmend in mehreren voneinander
  unabhängigen Sekundärquellen – dts-Agenturmeldung: "Für mich war das ein ganz
  normaler Sommer"; t-online: "Ich habe auch für diesen Sommer nicht gesehen,
  dass wir einen exorbitant unterschiedlichen Sommer hatten". Kein Abgleich mit
  dem ARD-Video erfolgt. Im Bericht wird die Aussage ohne Namensnennung
  wiedergegeben, siehe Abschnitt 11 und 12.)*
- **B2 – Tobias Fuchs (DWD, Leiter Geschäftsbereich Klima und Umwelt),
  Interview klimareporter°, 08.09.2026:**
  - "Vor 30 oder 40 Jahren wäre ein solcher Sommer extrem ungewöhnlich gewesen."
  - "Wenn wir in 30 Jahren zurückblicken, könnte es allerdings sein, dass wir ihn
    eher als normal betrachten."
  - "In der zweiten Jahrhunderthälfte könnte in Abhängigkeit von unseren Erfolgen
    beim Klimaschutz ein Sommer wie 2026 sogar als kühl gelten."

Beide Aussagen drehen sich um das Wort **"normal"**, das ohne Bezugsrahmen nicht
prüfbar ist. Mehrwert dieses Checks: den Bezugsrahmen explizit machen und für
jeden Rahmen quantifizieren, wie ungewöhnlich 2026 war (mit Unsicherheit) – und
prüfen, ob "in 30 Jahren normal" mit der Fortschreibung des bisherigen Messtrends
vereinbar ist.

## 2. Fragestellung (Estimands)

### E1 – Wie ungewöhnlich war die Sommermitteltemperatur 2026?

Beantwortet für **drei gleichrangige, vorab festgelegte Bezugsrahmen** (alle werden
berichtet, keiner wird als "der richtige" ausgewählt):

| Rahmen | Referenz | Bezug zur Debatte |
|---|---|---|
| R1 | Klimanormalperiode 1961–1990 (WMO-Referenz) | "vor 30 oder 40 Jahren" |
| R2 | Klimanormalperiode 1991–2020 (aktuelle WMO-Referenz) | heutiges offizielles "Normal" |
| R3 | Trenderwartung für 2026 aus der Messreihe 1971–2025 | "heutiges Klima" inkl. Erwärmung |

Kenngrößen je Rahmen:
- Abweichung 2026 in K
- standardisierte Abweichung z (R1/R2: Stichproben-SD der Referenzjahre;
  R3: Standardabweichung des Prognosefehlers für 2026)
- empirischer Rang von 2026 innerhalb der Referenzjahre (R1, R2)
- für R3: 95 %-Prognoseintervall für 2026 und Angabe, ob 19,6 °C darin liegt
- approximative Wiederkehrzeit (Normalverteilungsannahme): 1 / (1 − Φ(z))

**Vorab festgelegte Einstufung** (Konvention dieses Checks, im Bericht als solche
kenntlich gemacht):

| |z| | Einstufung |
|---|---|
| ≤ 1 | im Normalbereich |
| > 1 bis ≤ 2 | ungewöhnlich warm |
| > 2 bis ≤ 3 | außergewöhnlich warm |
| > 3 | extrem außergewöhnlich |

### E2 – Ab wann wäre ein Sommer wie 2026 bei Fortschreibung des Messtrends "normal"?

Reine **statistische Trendfortschreibung, keine Klimaprojektion** (siehe 8.1).

- **E2a ("typischer Sommer"):** Jahr t\*, in dem die lineare Trenderwartung
  19,6 °C erreicht, mit 95 %-Konfidenzintervall.
- **E2b ("nicht mehr ungewöhnlich"):** Jahr t\*\*, ab dem 19,6 °C innerhalb des
  Normalbereichs (|z| ≤ 1) um die Trenderwartung liegt, d. h. Trenderwartung
  ≥ 19,6 °C − σ̂ (σ̂ = Residual-SD), mit 95 %-Konfidenzintervall.
- **Abgleich mit B2:** Liegt "in 30 Jahren" (≈ 2056) innerhalb der
  Konfidenzintervalle von t\* bzw. t\*\*, davor oder danach?

**Ausdrücklich nicht Gegenstand:** die Aussage "in der zweiten Jahrhunderthälfte
sogar kühl" – sie ist laut Sprecher selbst szenarioabhängig und erfordert
Klimamodelle (fachfremd, vgl. RCP8.5-Fall). Im Bericht nur als nicht geprüft
kenntlich machen.

## 3. Datenquelle

- **Primärquelle:** Deutscher Wetterdienst, Climate Data Center (CDC),
  Gebietsmittel Deutschland, Lufttemperatur Monats-/Jahreszeitenmittel,
  Jahreszeit Sommer (Juni–August):
  `https://opendata.dwd.de/climate_environment/CDC/regional_averages_DE/seasonal/air_temperature_mean/regional_averages_tm_summer.txt`
- Lizenz: DWD Open Data (Quellenangabe "Deutscher Wetterdienst" erforderlich)
- Zugriffsdatum und Dateistand werden im Skript-Header und `run_log.txt`
  dokumentiert; Rohdatei wird unverändert im Analyseordner abgelegt.
- **Datenintegritäts-Check (vor jeder Analyse):** (a) Wert 2026 = 19,6 °C und
  2003 = 19,7 °C laut Datei vs. DWD-Pressemitteilung 31.08.2026;
  (b) Mittelwerte 1961–1990 und 1991–2020 aus der Datei reproduzieren die
  kommunizierten Abweichungen (+3,3 K / +2,0 K) auf ±0,1 K. Bei Abweichung:
  Analyse stoppen, Rückfrage an den Menschen.
- **OWID-Prüfung (gemäß CLAUDE.md):** betrachtet und verworfen – OWID bietet keine
  saisonalen Gebietsmittel für Deutschland. Kein Sekundär-Fallback; bei
  Zugriffsproblemen auf DWD-CDC: Rückfrage.
- **Hinweis Zugriff:** Aus der Cloud-Session heraus war opendata.dwd.de am
  11.09.2026 nicht direkt erreichbar (Proxy); Abruf der unveränderten Textdatei
  über den Browser auf Daniels Rechner, Ablage als Rohdatei im Analyseordner.

## 4. Analysepopulation

- Einheit: Sommer (JJA) eines Jahres, Deutschland-Gebietsmittel, °C
- Verfügbarer Zeitraum: 1881–2026
- **Primäres Trendfenster (R3, E2): 1971–2025 (n = 55)**; 2026 ist nicht im Fit
  (out-of-sample-Bewertung des Ereignisses selbst)
- R1: 1961–1990 (n = 30); R2: 1991–2020 (n = 30)
- Kein Ausschluss einzelner Jahre (auch 2003, 2018 bleiben drin)
- Werte 2025 und 2026 gelten als vorläufig (siehe 8.6)

## 5. Statistische Methoden

### 5.1 Primäranalyse E1
- R1/R2: arithmetisches Mittel und Stichproben-SD der 30 Referenzjahre;
  z = (T₂₀₂₆ − Mittel) / SD; Rang von 2026 unter den 31 Werten (Referenz + 2026).
- R3: OLS-Regression T ~ Jahr auf 1971–2025; Prognose ŷ₂₀₂₆ mit 95 %-
  Prognoseintervall; z = (T₂₀₂₆ − ŷ₂₀₂₆) / √(σ̂²·(1 + h₂₀₂₆)).

### 5.2 Primäranalyse E2
- Aus dem OLS-Fit (5.1, R3): t\* = (19,6 − b₀) / b₁ und
  t\*\* = (19,6 − σ̂ − b₀) / b₁.
- 95 %-KI für t\* und t\*\* über **Fieller-Methode** (Quotient zweier geschätzter
  Größen, primär). Ist die Steigung nicht signifikant von 0 verschieden
  (KI enthält 0), ist das Fieller-Intervall unbeschränkt → so berichten, kein
  Punktwert als Kernaussage.
- σ̂ wird für t\*\* als fest behandelt; die zusätzliche Unsicherheit wird über den
  Bootstrap in S6 abgebildet.

### 5.3 Modellannahmen-Prüfung (Diagnostik)
- Linearität: Residuen-vs-Fitted-Plot; ergänzend AIC-Vergleich linear vs.
  quadratisch im Primärfenster (nur berichtet, kein automatischer Modellwechsel)
- Autokorrelation: Durbin-Watson-Test, ACF/PACF der Residuen
- Normalität: Shapiro-Wilk, Q-Q-Plot (relevant für z-basierte Wiederkehrzeiten)
- Einfluss: Cook's Distance (Kennzeichnung auffälliger Jahre, kein Ausschluss)

### 5.4 Korrektur bei Annahmenverletzung
- Signifikante Autokorrelation (DW, α = 0,05): Newey-West-HAC-Standardfehler für
  b₁; Fieller-Intervall mit HAC-Kovarianzmatrix; ARIMA-Sensitivität (S4) wird
  dann für die Interpretation mitgewichtet.
- Deutliche Nicht-Normalität: Wiederkehrzeiten nur als grobe Größenordnung
  berichten, empirische Perzentile (S5) in den Vordergrund.

### 5.5 Unsicherheit / Signifikanzniveau
- Schätzfokus, keine Entscheidungstests als Kernaussage
- 95 %-Intervalle; α = 0,05 zweiseitig für Diagnostiktests und Steigungstest

## 6. Sensitivitätsanalysen

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | Trendfenster 1961–2025 und 1991–2025 | R3, E2 |
| S2 | 2026 in den Fit eingeschlossen (1971–2026) | R3, E2 |
| S3 | Segmentierte Regression 1881–2025 mit einem geschätzten Bruchpunkt (Paket `segmented`); Fortschreibung des letzten Segments | R3, E2 |
| S4 | ARIMA mit Drift (`forecast::auto.arima`) auf 1971–2025: Prognoseintervall 2026 und Jahr, in dem die Prognose 19,6 °C erreicht | R3, E2 |
| S5 | Perzentil-Definition von "normal": 2026 innerhalb der zentralen 80 % (10.–90. Perzentil) statt |z| ≤ 1 | E1, E2b |
| S6 | Residuen-Bootstrap (B = 10.000, fester Seed) für KI von t\* und t\*\* inkl. Unsicherheit von σ̂ | E2 |

## 7. Umgang mit Mehrfachtestung / Multiplizität

- Alle drei Bezugsrahmen (E1) und alle Trendfenster/Methoden (E2, S1–S6) werden
  vollständig nebeneinander berichtet. Keine Auswahl des Rahmens oder Fensters,
  das eine der beiden Aussagen (B1, B2) am besten stützt.
- Primäres Ergebnis für E2 ist vorab festgelegt (OLS 1971–2025, Fieller-KI).
  Weichen Sensitivitäten um mehr als 10 Jahre vom Primärergebnis ab, wird das im
  Bericht ausdrücklich als Modellunsicherheit benannt.

## 8. Interpretationsrahmen / Confounder

### 8.1 Trendfortschreibung ist keine Klimaprojektion
Die künftige Erwärmung hängt von künftigen Emissionen ab (so auch B2). Eine lineare
Fortschreibung unterstellt eine gleichbleibende Erwärmungsrate. Ergebnisse zu E2
werden ausschließlich als "Wenn der bisherige Messtrend anhält, ..." formuliert.
Die statistischen Intervalle bilden die Szenario-Unsicherheit **nicht** ab.
Physikalische Projektionen (u. a. neuer DWD-Datensatz regionaler
Klimaprojektionen, angekündigt für Ende Oktober 2026) werden nicht selbst
ausgewertet; möglicher Folgecheck.

### 8.2 "Normal" ist eine Definitionsfrage
Deshalb drei gleichrangige Rahmen. Der Bericht bewertet nicht, welcher Rahmen der
"richtige" ist, benennt aber die WMO-Klimanormalperioden als fachliche Konvention.

### 8.3 Sommermittel erfasst nur eine Dimension
Die Jahreszeiten-Mitteltemperatur bildet Hitzewellen-Intensität, Höchstwerte,
Tropennächte und Trockenheit nicht ab. Aussage B1 kann sich auf mehr als die
Mitteltemperatur beziehen; geprüft wird nur die Temperaturdimension. Keine
Spekulation über Absichten der Sprecher.

### 8.4 Keine Attribution
Der Check quantifiziert, wie ungewöhnlich 2026 war, nicht warum. Die
DWD-Attributionsaussage ("etwa drei Grad niedriger") wird nicht geprüft und
höchstens als Zitat mit Quelle genannt.

### 8.5 Homogenität der frühen Messreihe
Stationsdichte und Messbedingungen im 19. Jahrhundert unterscheiden sich von heute.
Betrifft nur S3 (1881–2025); im Bericht als Limitation bei S3 nennen.

### 8.6 Vorläufigkeit der Werte 2025/2026
Der 2026-Wert kann sich nachträglich um wenige Zehntel ändern. Liegt ein Ergebnis
nahe einer Einstufungsgrenze (|z| innerhalb ±0,1 um 1, 2 oder 3), wird das
ausdrücklich erwähnt.

### 8.7 Politische Neutralität
B1 und B2 werden mit denselben Maßstäben geprüft. Das Ergebnis kann beide, eine
oder keine Aussage stützen. Keine Bewertung von Parteien, Personen oder
Klimapolitik; Wortwahl im Bericht nüchtern.

## 9. Limitationen

- Normalverteilungsannahme für Wiederkehrzeiten; Extremwertverteilungen (GEV)
  wären angemessener, sind für den Schnellcheck-Umfang bewusst ausgeklammert
- n = 30 je Referenzperiode → SD-Schätzung selbst unsicher
- Extrapolation über ~30 Jahre: strukturelle Unsicherheit größer als die
  statistischen Intervalle
- Ein Deutschland-Gebietsmittel verdeckt regionale Unterschiede (Süden/Südwesten
  stärker betroffen laut DWD)

## 10. Software

- R (Version im Skript-Header)
- Pakete: stats, lmtest, sandwich, forecast, segmented, boot, ggplot2
- Skript: `sommer-2026-normal.R`; fester Seed für Bootstrap

## 11. Reporting

- **Grafik 1:** Sommermittel 1881–2026; Bänder Mittel ± 1 SD für R1 und R2;
  Trendlinie 1971–2025 mit 95 %-Prognoseband bis 2080; horizontale Linie bei
  19,6 °C; t\* und t\*\* mit KI markiert; 2026 hervorgehoben
- **Tabelle 1 (E1):** je Rahmen Abweichung, z, Rang, Wiederkehrzeit, Einstufung
- **Tabelle 2 (E2):** t\*, t\*\* mit KI je Methode/Fenster (Primär + S1–S6)
- Rundung: Temperaturen/Abweichungen 0,1 K; z auf 0,1; Jahre ganzzahlig;
  Wiederkehrzeiten als gerundete Größenordnung
- Kernaussagen werden erst nach Validierung formuliert
- **Nennung von B1 (Entscheidung 11.09.2026):** ohne Namen und Partei, z. B.
  "In der politischen Debatte wurde der Sommer als 'ganz normal' bezeichnet".
  B2 wird mit Name, Funktion und Quelle zitiert (Fachbehörde, öffentliches
  Interview). Diese Asymmetrie wird nicht als Wertung formuliert.
- Schnellcheck-Umfang: Substack ≤ 800 Wörter, 1 Grafik; LinkedIn-Kurzfassung

## 12. Offene Rückfragen (vor dem Einfrieren zu beantworten)

1. **Primäres Trendfenster 1971–2025** – ✅ beantwortet 11.09.2026: 1971–2025
   bleibt primär (1961–2025 und 1991–2025 als S1).
2. **Einstufungsschwellen |z| 1 / 2 / 3** – ✅ beantwortet 11.09.2026: so
   übernehmen (Perzentil-Variante bleibt S5).
3. **Zitat B1** – ✅ beantwortet 11.09.2026: neutral ohne Namen. Kein
   Video-Abgleich nötig; Beleglage aus Sekundärquellen dokumentiert (Abschnitt 1).
4. **Zeitplan** – ✅ beantwortet 11.09.2026: Veröffentlichung bis Dienstag,
   15.09.2026.
5. **Einfrieren** – ✅ 11.09.2026, Daniel Saure: "Volltext gelesen, einfrieren".
   Analyse läuft in der Cowork-Session (R), Validierung durch unabhängigen
   Agenten.
