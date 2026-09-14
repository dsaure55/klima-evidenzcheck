# Statistischer Analyseplan (SAP) – Kurz-SAP / Format "Schnellcheck"

**Titel:** Reichen 136 Terawattstunden? Einordnung der Aussage der Bundesnetzagentur
zum Gasspeicherstand vor dem Winter 2026/27 – Verteilung der winterlichen
Speicherentnahmen und ihr Zusammenhang mit der Wintertemperatur.

**Version:** 1.0 (final, **eingefroren**)
**Datum:** 14.09.2026
**Autor:in:** Claude (Cowork-Session "Money"), Entwurf zur Prüfung durch Daniel Saure
**Freigabe/Einfrieren:** Daniel Saure, 14.09.2026, im Chat mit dem Wortlaut
"Volltext gelesen, einfrieren" – nach Vorlage der Fassung 0.95 inklusive
Quellenwechsel auf Eurostat (Abschnitt 3.1) und optionalem Estimand E4.
Datenzugriff erst ab diesem Stand.

**Geplanter Ordner:** `Analysen/2026-09-gasspeicher-winter/`

**Versionshistorie:**
- **v0.9 draft (14.09.2026):** Erstentwurf, präregistriert vor Datenzugriff.
- **v0.95 draft (14.09.2026):** Rückfragen 1–4 durch Daniel Saure beantwortet
  (Abschnitt 12). Änderung der Primärdatenquelle für die Speicherzahlen von AGSI+
  auf Eurostat, weil die Cloud-Session keinen Netzzugang zu agsi.gie.eu,
  ec.europa.eu, opendata.dwd.de und vergleichbaren Servern hat (am 14.09.2026
  geprüft: Gateway antwortet auf alle diese Hosts mit 403). Ein API-Key ändert
  daran nichts. Datenbeschaffung deshalb wie am 11.09. über Downloads durch
  Daniel. Kein Datenzugriff erfolgt.
- **v1.0 final (14.09.2026):** Von Daniel Saure gelesen und eingefroren
  ("Volltext gelesen, einfrieren"). Inhaltlich unverändert gegenüber v0.95;
  damit sind der Quellenwechsel auf Eurostat (Rückfrage 5) und E4 als optionaler
  Zusatz mitfreigegeben. Ab diesem Stand Datenzugriff.
- **Hinweis zur Datenbeschaffung (14.09.2026):** Die DWD-Monatsdateien wurden von
  Daniel als Text in den Chat eingefügt, nicht als Datei. Die für den Check
  benötigten Deutschland-Werte 2013–2026 liegen daraus als
  `rohdaten/dwd/dwd_gebietsmittel_deutschland_wintermonate.csv` vor
  (Herkunft im Dateikopf dokumentiert). **Auflage:** Die sechs Originaldateien
  sind für den Analyseordner nachzureichen, und die übernommenen Werte werden in
  der Prüfrunde gegen das Original abgeglichen (Übertragungsfehler möglich).

---

## 0. Status dieser Analyse

- Zweiter Check im Format **Schnellcheck**. Zielumfang 2–3 Arbeitstage
  (Lernpunkt 11.09.: Umfang kleiner halten, eine Prüfrunde für Zahlen und Text).
- **Präregistriert vor Datenzugriff:** Weder AGSI+/GIE-Daten noch DWD- oder
  Eurostat-Zeitreihen wurden für diesen SAP gesichtet, kein Code ausgeführt.
- **Transparenz über Vorwissen:** Aus der Berichterstattung sind bekannt:
  Füllstand ca. 55–55,6 %, rund 136 TWh eingespeichert (Stand 12.–14.09.2026),
  Entnahme Winterhalbjahr 2025/26 knapp 134 TWh, Vorjahresfüllstand 74 %,
  LNG-Terminalauslastung ca. 45 %. Die Verteilung der Entnahmen über frühere
  Winter ist **nicht** bekannt – das ist der offene Teil.
- **Ergebnisoffenheit:** Der Check kann die Aussage der Bundesnetzagentur stützen
  (falls 136 TWh in den meisten Wintern gereicht hätten) oder relativieren.
  Beide Ausgänge werden veröffentlicht.

## 1. Hintergrund / Rationale

Zwei Aussagen stehen sich gegenüber:

- **B1 – Klaus Müller (Präsident der Bundesnetzagentur), 12./13.09.2026:**
  "Wir haben jetzt schon etwas mehr Gas in den Speichern, als wir im gesamten
  letzten Winterhalbjahr aus den Speichern entnommen haben" (136 TWh vs. knapp
  134 TWh); zusätzlich seien LNG-Terminals nur zu 45 % ausgelastet, es gebe also
  Importreserven. Quellen: ZDFheute 12.09.2026, t-online 13.09.2026 (beides
  Sekundärquellen; Primärbeleg siehe 3.4).
- **B2 – INES (Initiative Energien Speichern), Szenario-Update 08.09.2026:**
  historisch niedrige Füllstände; bei einem kalten Winter (EU-Wetterjahr 2010)
  Unterdeckungen von bis zu 2 TWh pro Monat im Januar/Februar 2027.

**Mehrwert dieses Checks:** B1 vergleicht den heutigen Speicherstand mit **einem
einzigen** Winter. Der Einwand "der letzte Winter war mild" kursiert bereits
qualitativ (u. a. kettner-edelmetalle.de, 13.09.2026), aber ohne Zahlen. Wir
machen den Bezugsrahmen explizit: Wie sieht die **Verteilung** der winterlichen
Speicherentnahmen über alle verfügbaren Winter aus, und wie hängt sie von der
Wintertemperatur ab – mit Unsicherheit.

## 2. Fragestellung (Estimands)

### E1 (primär) – Wie typisch war der Winter 2025/26 als Vergleichsmaßstab?
Netto-Entnahme aus deutschen Gasspeichern je Winterhalbjahr (Okt.–Mär.), für alle
verfügbaren Winter. Kenngrößen:
- Verteilung: Median, Spannweite, Quartile
- **Kernzahl:** Anzahl und Anteil der Winter mit Netto-Entnahme > 136 TWh
- Rang und z-Wert des Winters 2025/26 innerhalb der Verteilung

### E2 (primär) – Zusammenhang Entnahme und Wintertemperatur
Regression der Netto-Winterentnahme auf die Wintermitteltemperatur (Gebietsmittel
Deutschland, Okt.–Mär.). Berichtet werden:
- Steigung in TWh pro Grad Celsius mit 95 %-Konfidenzintervall
- erwartete Entnahme für einen **durchschnittlich kalten** Winter und für einen
  **kalten** Winter (10. Perzentil der Wintertemperatur der letzten 30 Jahre),
  je mit 95 %-Prognoseintervall
- Anteil der Temperaturverteilung, bei dem die erwartete Entnahme 136 TWh
  überschreitet (deskriptiv, mit Prognoseintervall, **nicht** als
  Mangellagen-Wahrscheinlichkeit formuliert – siehe 8.1)

### E3 (sekundär) – Gesamter Gasverbrauch statt nur Speicherentnahme
Dieselbe Betrachtung für den **gesamten deutschen Gasverbrauch** im Winterhalbjahr
(Eurostat-Monatsdaten, ab 2014): Verteilung je Winter, Regression auf die
Wintertemperatur, Einordnung des Winters 2025/26. Zweck: zeigen, wie viel vom
Verbrauch temperaturgetrieben ist und wie stark der Verbrauch seit 2022
strukturell gesunken ist. E3 ist ausdrücklich **Kontext**, nicht die Kernaussage;
fällt E3 aus Zeit- oder Datengründen aus, bleiben E1 und E2 die Analyse.

### E4 (sekundär, optional – Vorschlag Daniel 14.09.) – Gasverstromung im Winter
Aus derselben Eurostat-Datei: Gaseinsatz zur Strom- und Wärmeerzeugung
(`TI_EHG_MAP`) je Winterhalbjahr, absolut und als Anteil am Winterverbrauch.
Zweck: sichtbar machen, wie stark der Gaseinsatz im Stromsektor über die Jahre
gesunken oder gestiegen ist – dort wirkt sich der Ausbau von Wind und PV aus.

**Ausdrücklich nicht Gegenstand:** eine Verrechnung der Art "Erneuerbare sparen
X TWh Gas im Winter 2026/27". Dafür bräuchte es ein Strommarkt-/Dispatch-Modell
(Merit Order, Im-/Exporte, Kraftwerksverfügbarkeit) – fachfremd, siehe
RCP8.5-Lehre. E4 zeigt eine beobachtete Entwicklung, keine kausale Einsparung.
Der Ausbaueffekt der Vergangenheit steckt außerdem bereits in den Verbrauchs-
und Entnahmedaten früherer Winter und wird über den Zeittrend (S4) mit erfasst.

## 3. Datenquellen

### 3.1 Speicherdaten (primär, geändert am 14.09.2026)
**Eurostat `nrg_cb_gasm`** (Supply, transformation and consumption of gas –
monthly data), Deutschland, alle Bilanzpositionen, Monatswerte ab Januar 2014,
Einheit Terajoule (Brennwert) – Umrechnung in TWh im Skript dokumentiert.
Zielgröße: monatliche Bestandsveränderung der Gasspeicher; Winterentnahme =
Summe der Bestandsabnahmen Okt.–Mär.
*Begründung für den Wechsel:* Die Cloud-Session hat keinen Netzzugang zu
agsi.gie.eu; ein API-Key würde daran nichts ändern. Eurostat ist ohne Konto
zugänglich, amtlich und enthält im selben Datensatz auch den Verbrauch für E3.
**Beschaffung:** Download durch Daniel (CSV-Export Deutschland, gesamter
Zeitraum), Ablage als unveränderte Rohdatei im Analyseordner.

**Falls die Bestandsveränderungen in `nrg_cb_gasm` für Deutschland nicht oder
nur lückenhaft ausgewiesen sind** (vor dem Download nicht abschließend geprüft):
Rückfall auf AGSI+/GIE (tägliche `withdrawal`/`injection`, ab 2011, kostenloser
API-Key, Download ebenfalls durch Daniel). Der Wechsel wird im Bericht offengelegt.

**Optionaler Gegencheck:** AGSI+-Tagesdaten, falls verfügbar – Abweichungen
zwischen beiden Quellen werden berichtet, nicht verrechnet.

### 3.2 Temperatur (primär)
DWD Climate Data Center, Gebietsmittel Deutschland, Monatsmitteltemperatur:
`opendata.dwd.de/climate_environment/CDC/regional_averages_DE/monthly/air_temperature_mean/`
(Dateien für die Monate 10, 11, 12, 01, 02, 03).
Wintermittel = mit Monatslängen gewichtetes Mittel Okt.–Mär.
*Begründung:* dieselbe Datenfamilie wie im Check vom 11.09., Format bekannt.
**Sensitivität S5:** Gradtagzahlen nach VDI 3807 (DWD CDC, `heating_degreedays`) –
nur, wenn ohne Zusatzaufwand beschaffbar; sonst entfällt S5 und wird im Bericht
als nicht durchgeführt gekennzeichnet.
*Hinweis:* opendata.dwd.de ist aus der Cloud-Session gesperrt (geprüft 11.09. und
14.09.). Download durch Daniel, Rohdateien unverändert ablegen.

### 3.3 Gasverbrauch (für E3)
Dieselbe Eurostat-Datei wie 3.1, Position Inlandsverbrauch (bzw. Endverbrauch),
Deutschland, Monatsdaten ab Januar 2014 – **kein zusätzlicher Download nötig**.
**Gegencheck, nicht additiv:** Lagebericht/Dashboard der Bundesnetzagentur
(wöchentlicher Gasverbrauch ab 2018, dort bereits temperaturbereinigt) und
Trading Hub Europe (aggregierte Tagesverbräuche, ab Okt. 2021). Abweichungen
zwischen Quellen werden berichtet, nicht verrechnet.

### 3.4 Belege für die geprüfte Aussage
Vor der Analyse wird nach einer Primärquelle für B1 gesucht (Pressemitteilung
oder Wortlaut der Bundesnetzagentur). Findet sich keine, wird B1 im Bericht
ausdrücklich als **in mehreren Medien übereinstimmend wiedergegebenes Zitat**
gekennzeichnet (Vorgehen analog Check vom 11.09.).

### 3.5 Datenintegritäts-Check (vor jeder Auswertung)
1. Die berechnete Winterentnahme 2025/26 reproduziert die kommunizierten
   "knapp 134 TWh" auf ±10 % (weitere Toleranz als bei Tagesdaten, weil
   Monatsbilanzen und Speicherbetreiber-Meldungen methodisch abweichen).
2. Das Verbrauchsniveau eines Winters liegt in plausibler Größenordnung
   (deutscher Jahresgasverbrauch zuletzt rund 800–900 TWh).
Bei Abweichung: Analyse stoppen, Rückfrage an Daniel. Weicht Punkt 1 deutlich ab,
ist das selbst ein Befund – dann ist zu klären, worauf sich die 134 TWh beziehen,
und der Bericht sagt das offen.

## 4. Analysepopulation

- Einheit: ein Winterhalbjahr (1. Oktober bis 31. März), Deutschland
- Primäres Fenster: **Winter 2016/17 bis 2025/26**, n = 10 (Entscheidung Daniel,
  14.09.2026)
- Erweitert (S2): ab Winter 2014/15, n = 12 (früheste Eurostat-Monatsdaten);
  bei Rückfall auf AGSI+ stattdessen ab 2011/12 mit Hinweis auf Meldelücken
- Kein Winter wird ausgeschlossen; 2022/23 (Ausfall russischer Lieferungen,
  Sparappelle) bleibt drin und wird in S3 gesondert betrachtet
- Winter 2025/26 ist der von B1 genutzte Vergleichswinter und bleibt im Datensatz

## 5. Statistische Methoden

### 5.1 E1
Deskriptive Verteilung der Netto-Winterentnahmen (Summe `withdrawal` minus Summe
`injection` im Winterfenster). Kernzahl: Anteil der Winter mit Entnahme > 136 TWh,
mit **Clopper-Pearson-95 %-Intervall** (kleine Fallzahl ehrlich abbilden).
z-Wert und Rang für 2025/26.

### 5.2 E2
OLS-Regression: Netto-Entnahme ~ Wintermitteltemperatur.
- Steigung mit 95 %-KI; R² und Residual-SD
- Prognose für zwei vorab festgelegte Temperaturwerte: (a) Mittel der
  Wintertemperatur 1996–2025, (b) 10. Perzentil derselben Verteilung – je mit
  95 %-Prognoseintervall
- Angabe, ob 136 TWh innerhalb der jeweiligen Prognoseintervalle liegen

### 5.3 E3
Analog 5.2 für den gesamten Winterverbrauch (Eurostat), zusätzlich mit linearem
Zeittrend als zweitem Regressor, um den strukturellen Rückgang seit 2022 von der
Temperatur zu trennen. Bei n ≈ 12 Wintern wird nur ein einfaches Modell
(Temperatur + Trend) geschätzt, keine weiteren Kovariaten.

### 5.4 Diagnostik
Residuen-vs-Fitted, Q-Q-Plot, Cook's Distance (Kennzeichnung auffälliger Winter,
kein Ausschluss), Leave-one-out: ändert das Weglassen eines einzelnen Winters die
Steigung um mehr als 25 %, wird das ausdrücklich berichtet.
Wegen n ≤ 15 werden **keine** Autokorrelations- oder Normalitätstests als
Entscheidungsgrundlage verwendet; Intervalle werden als approximativ bezeichnet.

### 5.5 Unsicherheit
Schätzfokus, keine Entscheidungstests als Kernaussage. 95 %-Intervalle.

## 6. Sensitivitätsanalysen

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | Winterdefinition November–März statt Oktober–März | E1, E2 |
| S2 | Erweiterung auf alle verfügbaren Winter (Eurostat: ab 2014/15; AGSI+: ab 2011/12) | E1, E2 |
| S3 | Winter 2022/23 ausgeschlossen bzw. als Indikatorvariable | E1, E2 |
| S4 | Regression mit zusätzlichem linearem Zeittrend (struktureller Verbrauchsrückgang) | E2 |
| S5 | Gradtagzahlen (VDI 3807) statt Wintermitteltemperatur | E2, E3 |
| S6 | Brutto-Entnahme statt Netto-Entnahme (Wintereinspeicherungen nicht gegengerechnet) | E1, E2 |

Alle Sensitivitäten werden vollständig berichtet. Primär ist 5.1/5.2 im Fenster
nach 4.; kein Wechsel des Primärergebnisses nach Sichtung der Resultate.

## 7. Multiplizität

Es gibt eine vorab festgelegte Kernzahl (Anteil der Winter mit Entnahme
> 136 TWh) und eine vorab festgelegte Regressionssteigung. Alle weiteren Werte
sind beschreibend. Keine Auswahl des Fensters oder der Winterdefinition, die
B1 oder B2 am besten stützt.

## 8. Interpretationsrahmen / Confounder

### 8.1 Speicherentnahme ist keine Versorgungsbilanz
Der Check prüft **den Bezugsrahmen der Aussage B1**, nicht die Versorgungssicherheit.
Im Winter laufen Importe (Pipeline, LNG) weiter und decken den größten Teil des
Verbrauchs; die 136 TWh sind daher eine **untere** Vergleichsgröße. Formulierungen
wie "Mangellage droht mit Wahrscheinlichkeit X" sind ausgeschlossen. Ergebnis ist
eine Aussage der Form: "In x von y Wintern lag die Entnahme über dem heutigen
Speicherinhalt."

### 8.2 Die Entnahme hängt nicht nur an der Temperatur
Wie viel aus Speichern gezogen wird, hängt auch von Importverfügbarkeit, Preisen
und Speicherstrategie ab (2022/23 als Extremfall, 2026 Hormus-Blockade). Die
Streuung um die Regressionsgerade wird deshalb prominent gezeigt und R² explizit
genannt, statt die Temperatur als alleinige Erklärung darzustellen.

### 8.3 Strukturbruch im Verbrauchsniveau
Der deutsche Gasverbrauch liegt seit 2022 deutlich unter dem früheren Niveau.
Ältere Winter sind deshalb kein unveränderter Maßstab – abgebildet über S3, S4
und E3, im Bericht als Limitation benannt.

### 8.4 Speicherkapazität und Meldeumfang ändern sich
Arbeitsgasvolumen und meldende Betreiber sind über die Jahre nicht konstant
(u. a. REMIT ab 2016). Deshalb primär das kürzere, vollständige Fenster; die
Kapazität je Winter wird zur Einordnung mitberichtet.

### 8.5 Keine Prognose für 2026/27
Der Check sagt nicht vorher, wie kalt der kommende Winter wird und wie viel
eingespeichert sein wird. Die Vorgabe von 80 % zum 1. November wird nur als
Kontext genannt, nicht bewertet.

### 8.6 Neutralität
B1 (Behörde) und B2 (Branchenverband) werden mit demselben Maßstab eingeordnet.
Beide haben Interessen: Die Bundesnetzagentur ist für Versorgungssicherheit
zuständig, INES vertritt Speicherbetreiber, die von Füllstandsvorgaben
profitieren. Das wird sachlich benannt, ohne Motivzuschreibung.

## 9. Limitationen

- Sehr kleine Fallzahl (n = 10 primär, 15 erweitert) – Intervalle sind breit,
  Punkt­schätzer instabil; das ist Teil der Botschaft, nicht ein Makel
- Winter sind nicht unabhängig voneinander (Speicherstand des Vorjahres wirkt nach)
- Wintermitteltemperatur bildet Kältewellen nicht ab; gerade kurze Extremphasen
  sind für die Speicherentnahme entscheidend (INES rechnet auf Tagesbasis)
- Eurostat-Monatsdaten für E3 erst ab 2014; Quellen für den Verbrauch weichen
  methodisch voneinander ab

## 10. Software

R (Version im Skript-Header), Pakete: stats, ggplot2, binom (Clopper-Pearson).
Skript `gasspeicher-winter-2026.R`, fester Seed, wo nötig. Eingelesen werden
ausschließlich die von Daniel bereitgestellten Rohdateien; kein Netzzugriff aus
dem Skript.

## 11. Reporting

- **Grafik 1:** Streudiagramm Netto-Winterentnahme gegen Wintermitteltemperatur,
  Regressionsgerade mit 95 %-Prognoseband, horizontale Linie bei 136 TWh, Winter
  2025/26 hervorgehoben
- **Tabelle 1:** je Winter Netto-Entnahme, Wintermitteltemperatur, Speicherstand
  am 1. Oktober, Arbeitsgasvolumen
- **Tabelle 2:** Primärergebnis und alle Sensitivitäten (Anteil Winter > 136 TWh,
  Steigung mit KI)
- Rundung: TWh ganzzahlig, Temperaturen 0,1 °C, Anteile in Prozent ohne
  Nachkommastelle
- Kernaussagen erst nach der Prüfrunde formulieren
- Umfang: Substack ≤ 800 Wörter, 1 Grafik; LinkedIn-Kurzfassung

## 12. Rückfragen und Entscheidungen

1. **Primäres Fenster 2016/17–2025/26** – ✅ beantwortet 14.09.2026: ja,
   ältere Winter als S2.
2. **E3 (Gesamtverbrauch) im Umfang behalten?** – ✅ beantwortet 14.09.2026: ja.
   Durch die gemeinsame Datenquelle (3.1/3.3) entfällt der zusätzliche Download.
3. **Veröffentlichungsziel** – ✅ beantwortet 14.09.2026: so früh wie möglich,
   bevorzugt heute. Realistisch, sobald die Rohdateien vorliegen; die eine
   Prüfrunde für Zahlen und Text bleibt Pflicht (Entscheidung 11.09.).
4. **AGSI+-API-Key** – ✅ geklärt 14.09.2026: hinfällig. Die Cloud-Session hat
   keinen Netzzugang zu agsi.gie.eu, ec.europa.eu oder opendata.dwd.de (geprüft
   14.09., Gateway antwortet mit 403); ein Key würde daran nichts ändern. Claude
   legt außerdem keine Konten auf Daniels Namen an. Datenbeschaffung daher per
   Download durch Daniel, primär Eurostat (ohne Konto).
5. **Quellenwechsel bestätigen (neu, offen):** Speicherzahlen primär aus
   Eurostat-Monatsdaten statt AGSI+-Tagesdaten – einverstanden? Folge: gröbere
   Zeitauflösung (Monat statt Tag), dafür kein Konto nötig und Verbrauch aus
   derselben Datei.
6. **Einfrieren (offen):** Freigabe im Wortlaut "Volltext gelesen, einfrieren".

## 13. Benötigte Rohdateien (Download durch Daniel)

1. **Eurostat, Gas-Monatsdaten Deutschland:** Datensatz `nrg_cb_gasm` im
   Eurostat Data Browser, Filter Land = Deutschland, gesamter Zeitraum, alle
   Bilanzpositionen → Export als CSV.
2. **DWD-Gebietsmittel Monatsmitteltemperatur Deutschland:** aus
   `opendata.dwd.de/climate_environment/CDC/regional_averages_DE/monthly/air_temperature_mean/`
   die Dateien für die Monate 10, 11, 12, 01, 02 und 03.

Beide Rohdateien werden unverändert im Analyseordner abgelegt und mit
Zugriffsdatum im `run_log.txt` dokumentiert.
