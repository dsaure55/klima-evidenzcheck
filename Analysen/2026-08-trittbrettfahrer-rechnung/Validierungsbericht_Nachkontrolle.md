# Validierungsbericht – Nachkontrolle nach Bugfix – "Trittbrettfahrer-Rechnung"

**Datum:** 31.08.2026
**Bezug:** Ergänzt `Validierungsbericht.md` (Erstprüfung, kritischer Fund im
xlsx→CSV-Konverter). Diese Nachkontrolle prüft gezielt die sechs Auflagen aus
diesem Erstbericht, nicht die bereits dort bestätigten Teile erneut komplett
(Estimand 1a/2a, Estimand 3, Sensitivitäten 1/6 waren bereits validiert und
unverändert).

**Ergebnis: FREIGABE.** Keine kritischen Befunde mehr offen.

## Klarstellung zum Zahlenverlauf (kein Widerspruch)

Im Erstbericht tauchen zwei unterschiedliche Zahlen zu Estimand 2b auf, die
leicht verwechselt werden können:

- **35,3 %** – ursprünglicher, fehlerhafter Wert (Bug nicht erkannt).
- **59,1 %** – vom Validator selbst grob überschlagene *Teilkorrektur*
  (nur das offensichtlichste Artefakt, die Pseudo-Zeile "270", manuell entfernt),
  ausdrücklich als "noch nicht vertrauenswürdig" gekennzeichnet, weil der
  zugrunde liegende Regex-Fehler ca. 14.523 weitere Zellen im selben Sheet
  betraf und nicht nur diese eine Zeile.
- **53,1 %** – Ergebnis NACH dem vollständigen Regex-Fix (alle betroffenen
  Zellen korrekt behandelt, nicht nur die eine Pseudo-Zeile) und kompletter
  Neuberechnung aus den neu erzeugten CSVs. Dies ist der finale, geprüfte Wert.

59,1 % war also nie ein Zielwert, sondern eine bewusst als unfertig markierte
Zwischenschätzung im Erstbericht. 53,1 % ersetzt sie nach vollständiger
Fehlerbehebung.

## Geprüfte Auflagen (aus Validierungsbericht.md)

1. **Regex-Fix (kritisch) – bestanden.** `rohdaten/xlsx_sheet_to_csv.pl`
   behandelt selbstschließende leere XML-Zellen jetzt in einem separaten
   Regex-Zweig statt sie zu verschlucken. Verifiziert gegen alle fünf
   GCB-abgeleiteten CSVs: kein "270"-Artefakt mehr, keine All-NA-Spalten,
   keine doppelten Ländernamen, konstante Länderzahl (214).
   Korrigierte Kernzahlen unabhängig aus den Roh-CSVs nachgerechnet, exakte
   Übereinstimmung mit `output/`:
   - Estimand 2b: DE-Anteil 5,3 % (Rang 4/214), **Kernzahl 53,1 %**.
   - Sensitivität 3 (+LULUCF): DE-Anteil 3,5 % (Rang 5/214), **Kernzahl 54,0 %**.
   - Sensitivität 4 (2b-Teil, Rank-Sensitivity): intern konsistent
     nachgerechnet (DE Rang 4 = 52,1 %, DE+20 = 85,1 % etc.).
2. **Automatisierter Plausibilitätscheck – bestanden, mit kleiner Einschränkung.**
   In `read_gcb_wide()` ergänzt (Länder-Summe je Jahr vs. GCB-"World"-Spalte,
   Toleranz 1 %, `stop()` bei Überschreitung); für `gcb_territorial_emissions.csv`
   bestätigt wirksam. Einschränkung: greift nicht bei den drei LULUCF-Dateien,
   da dort keine "World"-Aggregatspalte im Quellformat existiert – betrifft
   keine berichtete Zahl (Sensitivität 3 wurde unabhängig vollständig
   nachgerechnet), ist aber eine offene redaktionelle Transparenzlücke.
   **Empfehlung für den nächsten Analyse-Zyklus** (nicht blockierend für
   diesen Report): Log-Hinweis ergänzen, dass der Check bei LULUCF-Dateien
   mangels "World"-Spalte nicht greift.
3. **Sensitivität 2 auf OWID umgestellt – bestanden.** SAP-wortgetreu
   umgesetzt; `!is.na(iso_code)`-Filter unabhängig geprüft (alle 29
   ausgeschlossenen Zeilen sind Regional-/Einkommensgruppen-Aggregate oder
   "World" selbst, kein legitimes Land verloren). Ergebnis reproduziert:
   DE-Anteil 2,1 % (Rang 6/120), Kernzahl 40,5 %.
4. **SAP-5.2-Diagnostikvermerk – bestanden.** Inhaltlich sap-konform im
   Skript und im Run-Log vorhanden.
5. **Rundung gemäß SAP Abschnitt 11 – bestanden.** Finale Berichtstabellen
   durchgängig auf 1 Nachkommastelle für `de_anteil_pct`; Audit-CSVs behalten
   korrekt die Rohpräzision.
6. **Korrektur `DATENAUFBEREITUNG_LOG.txt` – bestanden.** Inhaltlich
   substantielle Korrektur, benennt Bug, betroffene/unbetroffene Dateien und
   Behebungsdatum.

## Neue Probleme durch den Fix

Keine gefunden. Keine All-NA-Spalten, keine doppelten Länder, keine
verbliebenen Pseudo-Index-Artefakte in den fünf neu erzeugten GCB-CSVs.

## Freigabeempfehlung

**Freigegeben.** Estimand 1a/2a, Estimand 1b/2b, Estimand 3 sowie alle sechs
Sensitivitäten sind validiert und dürfen in einen Report-Entwurf übernommen
werden. Die unter Punkt 2 genannte Kleinauflage (Log-Hinweis zur
LULUCF-Check-Lücke) ist redaktionell, blockiert die Freigabe nicht.
