# Analysebericht – Schnellcheck „Reichen 136 TWh?" (Gasspeicher Winter 2026/27)

**Stand:** 14.09.2026 · **SAP:** v1.0, eingefroren 14.09.2026 vor Datenzugriff
**Status:** Analyse und zwei Prüfrunden abgeschlossen; Veröffentlichung zum Zeitpunkt
dieses Berichts noch nicht erfolgt.

## 1. Geprüfte Aussage

Klaus Müller, Präsident der Bundesnetzagentur, am 12.09.2026 (mehrere übereinstimmende
Medienberichte, keine Primärquelle vorliegend): In den deutschen Gasspeichern lägen rund
136 TWh – „etwas mehr Gas, als wir im gesamten letzten Winterhalbjahr aus den Speichern
entnommen haben" (knapp 134 TWh). Gegenposition: INES-Szenarien vom 08.09.2026 (kalter
Winter, Wetterjahr 2010: Unterdeckung bis 2 TWh/Monat im Januar und Februar 2027).

Geprüft wird **der Bezugsrahmen**, nicht die Versorgungssicherheit.

## 2. Daten

| Quelle | Inhalt | Stand |
|---|---|---|
| Eurostat `nrg_cb_gasm` | Monatliche Gasbilanz Deutschland, TJ (Brennwert) | LAST UPDATE 08.09.2026, 2008-01 bis 2026-07 |
| DWD CDC | Gebietsmittel Monatsmitteltemperatur Deutschland | Dateikopf 02.09.2026 |

Netto-Winterentnahme = −Σ `STK_CHG_MG` über Oktober bis März. Umrechnung TJ → TWh: /3600.

**Integritätscheck (SAP 3.5):** berechnete Entnahme 2025/26 = **133,7 TWh** gegenüber
kommunizierten „knapp 134 TWh" – Abweichung 0,3 %, bestanden. Jahresverbrauch 2025
865 TWh, plausibel.

## 3. Ergebnisse

### E1 – Verteilung der Winterentnahmen (Primärfenster 2016/17–2025/26, n = 10)

| Kennzahl | Wert |
|---|---|
| Median | 122,1 TWh |
| Mittel / SD | 116,2 / 48,6 TWh |
| Spanne | 42,0 – 178,0 TWh |
| **Winter mit Entnahme > 136 TWh** | **4 von 10 (40 %), 95%-KI 12–74 %** |
| Winter 2025/26 | 133,7 TWh, Rang 5 von 10, z = +0,36 |

Sensitivitäten: S2 (ab 2014/15, n = 12) 5 von 12; S3 (ohne 2022/23, n = 9) 4 von 9;
S1 (Nov–Mär) 4 von 10; S6 (Bruttoentnahme) 4 von 10.

### E2 – Entnahme und Wintertemperatur

- Steigung **−49,1 TWh pro °C**, 95%-KI −81,0 bis −17,2; R² = 0,61; Residual-SD 32,1 TWh
- Erwartete Entnahme bei 4,21 °C (Mittel der Winter 1996/97–2025/26): **150 TWh**,
  95%-Prognoseintervall **69–230 TWh** – enthält 136 TWh
- Schwelle: erwartete Entnahme = 136 TWh bei 4,49 °C; 60 % der 30 Referenzwinter waren
  kälter (deskriptiv, ohne Unsicherheit)
- Winter 2025/26: 4,41 °C = 53. Perzentil der 30 Referenzwinter – **durchschnittlich, nicht mild**
- Sensitivitäten: S2 −50,1 (KI −80,5 bis −19,6); S3 −48,5; S1 −47,8; S6 −46,5;
  S4 (mit Zeittrend) Temperatur −58,5, Trend +5,9 TWh/Jahr (KI −2,4 bis +14,2)
- **Nicht berichtet:** Prognose für 2,69 °C (10. Perzentil). Der Wert liegt unter dem
  Fitbereich (3,75–6,18 °C); jede Aussage dazu wäre Extrapolation.

### Diagnostik

Keine Leave-one-out-Änderung der Steigung über 25 % (größte: −17,9 % ohne 2023/24),
keine auffälligen Einflusspunkte (max. Cook's D = 0,27), Residuen unauffällig
(Shapiro-Wilk p = 0,37, nur beschreibend).

### E3 / E4 – Verbrauch und Gasverstromung

- Winterverbrauch 2025/26: 612 TWh; Speicherentnahme deckt im Median **19 %** des
  Winterverbrauchs (Spanne 7–27 %)
- Verbrauch ~ Temperatur: −21,5 TWh/°C (KI −41,5 bis −1,4); mit Zeittrend: Temperatur
  −38,0, Trend +5,1 TWh/Jahr (KI −0,1 bis +10,3)
- Gaseinsatz Strom und Wärme (`TI_EHG_MAP`): 90 TWh im Winter 2017/18 (erster vollständig
  gemeldeter Winter) gegenüber 113 TWh in 2025/26; Anteil am Winterverbrauch 14 → 18 %.
  Ein Rückgang ist nicht erkennbar; über Ursachen sagen die Daten nichts.

## 4. Einordnung

Die Aussage ist für den Winter 2025/26 korrekt, und der Vergleichswinter war
temperaturmäßig durchschnittlich. Der Bezugsrahmen ist trotzdem schwach: Die Zielgröße
schwankt zwischen 42 und 178 TWh, ein einzelner Winter trägt entsprechend wenig
Information. In 4 von 10 Wintern lag die Entnahme über dem heutigen Speicherstand.

Die 136 TWh sind eine **untere** Vergleichsgröße: Stand Mitte September, Einspeicherung
läuft bis November weiter, und im Winter decken Importe den größten Teil des Verbrauchs.
Der Check ist keine Prognose einer Mangellage.

## 5. Limitationen

Kleine Fallzahl (n = 10), breite Intervalle. Monatsdaten glätten Kältewellen. Die
Speicherkapazität je Winter ist in den verwendeten Daten nicht enthalten (SAP Tabelle 1
insoweit unvollständig). Sensitivität mit Gradtagzahlen (S5) nicht durchgeführt.
Die DWD-Werte wurden aus in den Chat eingefügtem Dateitext übernommen; der Abgleich mit
den Originaldateien steht aus.
