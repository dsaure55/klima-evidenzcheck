# Validierungsbericht – "Trittbrettfahrer-Rechnung"

**Datum:** 31.08.2026
**Geprüft gegen:** SAP_Trittbrettfahrer-Rechnung.md (final, v1.0)
**Empfehlung: ZURÜCK AN ANALYST — kritische Auflage vor Freigabe.**

Top-Level-Session hat den zentralen Befund unabhängig gegenverifiziert
(Code-Ausschnitt `xlsx_sheet_to_csv.pl` Zeile 91 sowie Zeile 12 der Datei
`rohdaten/csv/gcb_territorial_emissions.csv` direkt eingesehen) – Befund
bestätigt sich.

## Ergebnis

- **Estimand 1a/2a (EDGAR, aktuelles Jahr) und Estimand 3 (Pro-Kopf) sowie
  Sensitivitäten 1 und 6:** rechnerisch von unabhängiger Nachrechnung
  verifiziert, korrekt. Können vorbehaltlich kleinerer Auflagen (siehe unten)
  weiterverwendet werden.
- **Estimand 1b/2b (GCB, kumuliert 1850–2024) sowie Sensitivitäten 2, 3 und
  der 2b-Teil von Sensitivität 4: NICHT VALIDE.** Ursache: `xlsx_sheet_to_csv.pl`
  (Zeile 91) behandelt selbstschließende leere XML-Zellen (`<c .../>`) fehlerhaft
  und verschluckt dabei systematisch die jeweils nachfolgende Zelle. Nachweis:
  Zeile 12 der konvertierten Datei beginnt mit der Pseudo-Spalte "270" (verschluckter
  Shared-String-Index für "Albania") statt einer leeren Spalte A; alle
  Länderspalten sind dadurch um eine Position verschoben. Diese eine Pseudo-Zeile
  summiert über 175 Jahre die Jahreszahlen selbst auf (Rang 1 der ganzen Kurve).
  Systematische Zählung: 14.523 Bug-Treffer allein im Sheet "Territorial Emissions"
  (~39 % der Zellen), weitere Treffer in "Consumption Emissions" und den drei
  LULUCF-Sheets (BLUE/OSCAR/LUCE).
  - Effekt bei Korrektur nur des offensichtlichsten Artefakts: Kernzahl 2b
    verschiebt sich von gemeldeten 35,3 % auf 59,1 % – keine Rundungsdifferenz,
    und wegen der übrigen ~14.500 Bug-Treffer ist auch dieser Wert noch nicht
    vertrauenswürdig.
  - Die im Skriptkopf/`DATENAUFBEREITUNG_LOG.txt` getroffene Aussage, der
    Workaround sei "rein technisch, ohne inhaltliche Auswirkung", ist für die
    GCB-Dateien widerlegt (für die EDGAR-Dateien dagegen bestätigt zutreffend).

## Kleinere SAP-Konformitäts-Abweichungen (unabhängig vom kritischen Befund)

1. Sensitivität 2 (konsumbasiert) nutzt GCB-Eigendaten statt der im SAP-Wortlaut
   vorgesehenen OWID-Quelle – nicht als Post-hoc gekennzeichnet.
2. Tie-Break bei 1b/2b nach Ländernamen statt ISO3-Code (GCB liefert keine ISO3-Codes)
   – nicht als Post-hoc gekennzeichnet.
3. SAP 5.2 verlangt einen expliziten Vermerk zur Nichtanwendbarkeit von
   Autokorrelations-/Normalitätsprüfung – fehlt im Code/Log.
4. `de_anteil_pct`-Spalten in mehreren Audit-CSVs mit 2–4 statt der in SAP
   Abschnitt 11 vorgeschriebenen 1 Nachkommastelle für Berichtstabellen
   (Rohpräzision in Audit-Dateien selbst unproblematisch).

## Auflagen für den Analysten (Prioritätsreihenfolge)

1. **Kritisch:** Zell-Regex in `xlsx_sheet_to_csv.pl` reparieren (selbstschließende
   leere Zellen korrekt behandeln). Alle GCB-abgeleiteten CSVs neu erzeugen,
   Estimand 1b/2b sowie Sensitivitäten 2/3 und den 2b-Teil von Sensitivität 4
   komplett neu berechnen. Checkpoint verwerfen, Lauf wiederholen.
2. Plausibilitätscheck ergänzen: Länder-Summe je Jahr darf GCB-eigene
   "World"-Spalte nicht signifikant übersteigen (automatisierte Erkennung
   ähnlicher Korruption künftig).
3. Sensitivität 2 gemäß SAP-Wortlaut auf OWID umstellen ODER Abweichung
   explizit als begründete Post-hoc-Entscheidung kennzeichnen.
4. Expliziten Log-Vermerk zu SAP 5.2 (Diagnostik-Nichtanwendbarkeit) ergänzen.
5. Rundung der `de_anteil_pct`-Spalten in finalen Berichtstabellen auf 1
   Nachkommastelle gemäß SAP Abschnitt 11.
6. `DATENAUFBEREITUNG_LOG.txt`-Aussage "keine inhaltliche Auswirkung" korrigieren
   (durch diese Validierung widerlegt).

**Bis Auflage 1 erfüllt und neu geprüft ist, darf keine Zahl aus Estimand 1b/2b
oder Sensitivität 2/3 in einen Report-Entwurf übernommen werden.**
