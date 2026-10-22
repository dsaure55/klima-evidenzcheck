# Statistischer Analyseplan (SAP) – Vorlage

**Titel:** [Fragestellung als vollständiger Satz]

**Version:** [1.0]
**Datum:** [TT.MM.JJJJ]
**Autor:in / Freigabe:** _________________________ Datum: __________

---

## 0. Status dieser Analyse

[ ] Präregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

---

## 1. Hintergrund / Rationale

[Warum ist diese Frage relevant? Welche Lücke füllt sie gegenüber bestehenden
öffentlichen Darstellungen?]

## 2. Fragestellung (Estimand)

[Präzise Formulierung, sodass zwei unabhängige Analyst:innen mit demselben SAP
zum selben statistischen Test/Modell kämen.]

## 3. Datenquelle

- Quelle: [z. B. Umweltbundesamt via klimadashboard.de, CC BY 4.0]
- Zugriffsdatum: [TT.MM.JJJJ]
- Datenstand laut Quelle: [Jahr/Version]

## 4. Analysepopulation

[Zeitraum, Einheiten (z. B. Regionen, Jahre), Ein-/Ausschlusskriterien]

## 5. Statistische Methoden

### 5.1 Primäranalyse
[Modellspezifikation, alle Zeitfenster/Gruppen vorab festgelegt]

### 5.2 Modellannahmen-Prüfung
[z. B. Autokorrelation, Normalität, bei Netzwerkvergleichen: Transitivitäts-
annahme der Brückenkomparatoren]

### 5.3 Korrektur bei Annahmenverletzung
[z. B. Newey-West-HAC bei Autokorrelation]

### 5.4 Unsicherheitsquantifizierung
[Primäres und sensitivitätsanalytisches Verfahren]

### 5.5 Signifikanzniveau
[α = 0,05, zweiseitig, sofern zutreffend]

## 6. Sensitivitätsanalysen

[Alternative Modelle/Methoden, die zusätzlich zur Primäranalyse berichtet werden]

## 7. Umgang mit Mehrfachtestung / Multiplizität

[Welche Vergleiche/Fenster werden ALLE berichtet? Ausschluss von
Ergebnis-Cherry-Picking explizit festhalten.]

## 8. Interpretationsrahmen / Confounder

*Fester Abschnitt für alle vergleichenden Analysen (Regionen, Länder, Gruppen) –
vor der Analyse ausfüllen, nicht erst beim Schreiben des Ergebnistexts.*

- **Produktions- vs. Konsum-Perspektive:** Werden Emissionen dort gezählt, wo sie
  entstehen, oder dort, wo das Ergebnis konsumiert wird? Welche Fehlinterpretation
  droht, wenn das nicht unterschieden wird?
- **Keine implizite Politik-/Verhaltensbewertung:** Ist der beobachtete
  Unterschied überwiegend strukturell/historisch bedingt, oder tatsächlich auf
  unterschiedlich ambitionierte Maßnahmen zurückzuführen? Vorab festlegen, wie
  das Ergebnis eingeordnet wird – nicht erst nach Sichtung der Zahlen.
- **Transitivitätsannahme bei indirekten/Netzwerk-Vergleichen:** Liegt der
  Brückenkomparator auf der relevanten Dimension tatsächlich zwischen den zu
  vergleichenden Einheiten? Falls nicht: Vergleich ungültig, alternative Brücke
  oder größeres Netzwerk nötig.
- **Regression-zur-Mitte bei Trendvergleichen:** Einheiten mit hohem
  Ausgangsniveau zeigen leichter große relative Rückgänge. Bei Trend- statt
  Niveau-Vergleichen explizit gegenprüfen.

## 9. Limitationen

[Weitere allgemeine Einschränkungen über Abschnitt 8 hinaus]

## 10. Software

- [R-Version, Pakete, Skript-Dateiname]

## 11. Reporting

- Darstellung: [Grafik-/Tabellenformat]
- Rundung: [z. B. eine Nachkommastelle]
