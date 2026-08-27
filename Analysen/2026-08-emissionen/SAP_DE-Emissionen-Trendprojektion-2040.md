# Statistischer Analyseplan (SAP)

**Titel:** Ist die aktuelle Trendfortschreibung der deutschen THG-Emissionen mit dem
gesetzlichen 2040-Ziel (-88 % ggü. 1990) statistisch vereinbar?

**Version:** 1.0 (retrospektiv erstellt)
**Datum:** 2026-08-27
**Autor:in / Freigabe:** _________________________ Datum: __________

---

## 0. Status dieser Analyse

Wichtiger Transparenzhinweis: Dieser SAP wurde nach einer explorativen
Sichtung der Daten erstellt (Pilotanalyse vom 27.08.2026, drei Zeitfenster wurden
informell verglichen). Die Analyse gilt daher als exploratorisch, nicht als
praeregistriert-konfirmatorisch.

Fuer alle kuenftigen Analysen gilt das Vorgehen umgekehrt: SAP wird vor Datenzugriff
und Code-Ausfuehrung verfasst, mit Versionsnummer und Datum eingefroren, erst danach wird
der Code ausgefuehrt. Abweichungen vom eingefrorenen Plan werden im Ergebnisbericht als
"Post-hoc-Abweichung" gekennzeichnet und begruendet.

---

## 1. Hintergrund / Rationale

Oeffentliche Klimadashboards (z. B. klimadashboard.de) stellen deskriptive Kennzahlen
bereit (z. B. "-48 % Emissionen seit 1990", "2040-Ziel: -88 %"), ohne eine
Trendfortschreibung mit Unsicherheitsquantifizierung. Fuer Journalismus, NGO-Arbeit und
Politikberatung ist jedoch relevant, ob der aktuelle Reduktionspfad das gesetzliche Ziel
statistisch plausibel erreichen kann.

## 2. Fragestellung (Estimand)

Primaerfrage: Liegt der projizierte Emissionswert fuer 2040 (Punktschaetzung + 95 %-
Prognoseintervall) unterhalb, oberhalb oder im Bereich des Zielwerts (150,4 Mt CO2-Aeq.)?

Diese Frage wird fuer drei vorab festgelegte Zeitfenster beantwortet (siehe 6.2) -
alle drei werden berichtet, keine Auswahl des "guenstigsten" Fensters (Multiplizitaets-
Statement, siehe 8).

## 3. Datenquelle

- Quelle: Umweltbundesamt (UBA), bereitgestellt ueber klimadashboard.de (CC BY 4.0)
- Zugriffsdatum: 27.08.2026
- Datenstand laut Quelle: 2025 (vorlaeufig fuer 2024/2025)
- Zielwert-Referenz: Klimaschutzgesetz, 2040-Ziel = -88 % ggue. 1990

## 4. Analysepopulation

- Zeitraum: 1990-2025 (n = 36 Jahresbeobachtungen)
- Variable: Gesamt-THG-Emissionen Deutschland, Mt CO2-Aequivalent, alle Sektoren summiert
- Kein Ausschluss von Beobachtungen; 2020 (Corona-Effekt) wird nicht ausgeschlossen,
  aber als potenzieller Strukturbruch in den Limitationen diskutiert

## 5. Statistische Methoden

### 5.1 Primaeranalyse
Lineare OLS-Regression Emissionen ~ Jahr, getrennt fuer drei vorab festgelegte
Zeitfenster:

| Fenster | Zeitraum | n | Zweck |
|---|---|---|---|
| A | 1990-2025 | 36 | Langfrist-Trend |
| B | 2015-2025 | 11 | Trend seit Beschleunigung der Transformation |
| C | 2020-2025 | 6 | Kurzfrist-Trend (rein deskriptiv, keine Inferenz - n zu klein) |

### 5.2 Modellannahmen-Pruefung
- Linearitaet: Residuen-vs-Fitted-Plot
- Autokorrelation: Durbin-Watson-Test, ACF der Residuen
- Normalitaet: Shapiro-Wilk-Test der Residuen

### 5.3 Korrektur bei Autokorrelation
Bei signifikanter Autokorrelation (DW-Test, alpha = 0,05): Newey-West-HAC-korrigierte
Standardfehler fuer den Steigungskoeffizienten (sandwich::NeweyWest).

### 5.4 Prognoseintervall fuer 2040
- Primaer: klassisches OLS-Prognoseintervall (95 %) - bekannte Limitation: bei
  autokorrelierten Residuen tendenziell zu eng
- Sensitivitaet: ARIMA-Prognoseintervall (forecast::auto.arima) als
  autokorrelationsrobuste Alternative

### 5.5 Signifikanzniveau
alpha = 0,05, zweiseitig, fuer den Steigungstest (H0: Steigung = 0)

## 6. Sensitivitaetsanalysen

1. Vergleich OLS-PI vs. ARIMA-PI (Fenster A und B)
2. Berichterstattung aller drei Zeitfenster nebeneinander (kein Cherry-Picking)

## 7. Umgang mit Mehrfachtestung / Multiplizitaet

Es werden drei Zeitfenster berechnet und alle drei unkommentiert nebeneinander
berichtet. Es erfolgt keine Selektion des Fensters mit dem "guenstigsten" Ergebnis fuer
eine bestimmte Erzaehlung. Fenster C dient ausschliesslich der Einordnung, nicht der
Inferenz (n = 6 zu klein fuer valide Konfidenzaussagen).

## 8. Limitationen

- Kleine Stichprobe bei kurzen Zeitfenstern (B, C) -> breite Unsicherheitsintervalle
- Lineare Trendannahme kann durch Politik- oder Strukturbrueche verletzt sein
  (z. B. Corona-Effekt 2020, Energiepreiskrise 2022)
- Keine Kausalaussage - reine Trendfortschreibung, keine Politik-Wirkungsanalyse
- Extrapolation ueber 15 Jahre (bis 2040) hinaus ist mit hoher struktureller
  Unsicherheit behaftet, die kein statistisches Modell vollstaendig einfangen kann

## 9. Software

- R (Version wird im Skript-Header dokumentiert)
- Pakete: stats, sandwich, lmtest, forecast, ggplot2
- Skript: DE-Emissionen-Trendprojektion-2040.R

## 10. Reporting

- Ergebnisdarstellung: eine Grafik (historische Daten + 3 Trendlinien + Zielpfad) +
  eine Ergebnistabelle (Punktschaetzung, 95 %-PI, je Fenster und Methode)
- Rundung: eine Nachkommastelle (Mt CO2-Aeq.)
