# Offene Downloads – Prognose-Check Projektionsberichte

Stand: 22.10.2026, erstellt vom analyst-Subagenten (Beschaffung auf Auftrag von
Daniel Saure vom 22.10.2026, siehe `run_log.txt`). Hier steht nur, was **nicht**
geladen werden konnte oder bewusst noch nicht geladen wurde. Es wurden keine
Ersatzquellen verwendet und keine Werte aus dem Gedächtnis eingetragen.

## 1. Global Carbon Project – National Fossil Carbon Emissions 2025 v1.0 (SAP 3.3 / 13.7)

- Versuchte URL: `https://data.icos-cp.eu/objects/loCXyssaalv6DPdO6Qdj90qQ`
  (Metadaten: `https://meta.icos-cp.eu/objects/loCXyssaalv6DPdO6Qdj90qQ`,
  Dateiname laut Metadaten `National_Fossil_Carbon_Emissions_2025_v1.0.xlsx`,
  Sammlung „Supplemental data of Global Carbon Budget 2025“,
  `https://meta.icos-cp.eu/collections/-TwFl0_tH_grFHT5PZitvI6b`).
- Ergebnis: HTTP 200, aber Weiterleitung auf die Lizenzseite
  `https://data.icos-cp.eu/licence?ids=["loCXyssaalv6DPdO6Qdj90qQ"]`.
  Der Download erfordert das aktive Akzeptieren der ICOS-CC-BY-4.0-Lizenz im
  Browser (Klick-Formular). Das habe ich nicht stellvertretend getan.
- Manuell holen: Seite `https://www.icos-cp.eu/science-and-impact/global-carbon-budget/2025`
  öffnen → „National Fossil Carbon Emissions 2025 v1.0“ → Lizenz akzeptieren →
  Datei unverändert nach `rohdaten/gcp/` legen und in `run_log.txt` nachtragen.
- Hinweis: Die OWID-Datei `rohdaten/owid/owid-co2-data.csv` enthält in der
  Spalte `co2` laut Codebook die GCB-2025-Reihe. Sie ersetzt die GCP-Primärdatei
  **nicht** (SAP 3.3 nennt GCP als eigene Quelle), sie wurde nur mitgeladen.
- Auswirkung: Check 3.5.4 betrifft laut SAP nur UBA gegen OWID (THG gesamt) und
  ist deshalb durchführbar. Der GCP-Abgleich (fossiles CO2) bleibt offen.

## 2. Frühere Inventarsubmissionen für S2 (SAP 13.4) – bewusst noch nicht geladen

Laut Auftrag nur als Vorschlag. Die Liste steht im Zwischenbericht
(`output/zwischenbericht_daten_integritaet.md`, Abschnitt „Vorschlag 13.4“).
Sie kann erst endgültig werden, wenn die Rückfragen zu J_b (Berichte 2021 und
2023) beantwortet sind.

## 3. Reportnet 3 – nationale Tabellen der Projektionsmeldung 2023 (optional, SAP 13.6)

- Für die Meldung 2021 wurden die deutschen Reportnet-3-Tabellen geladen
  (Dataflow 113, `rohdaten/eea_reportnet3_df113_2021/`).
- Für die Meldung 2023 konnte ich die Dataflow-ID über die öffentliche API nicht
  ermitteln (`https://api.reportnet.europa.eu/dataflow/getPublicDataflows` →
  HTTP 400; ein POST-Versuch auf
  `https://api.reportnet.europa.eu/dataflow/public/country/DE` lieferte
  HTTP 500 mit der Meldung „TIMEOUT“). Die UBA-Seite verlinkt nur die Dataflows
  113 (2021) und 1478 (2025).
- Für die Übertragungskontrolle ist das **nicht** zwingend: Der EEA-Datensatz
  `rohdaten/eea_projektionen/ds2023/`
  enthält die deutschen Meldedaten 2023 (geprüft im Skript).
- Manuell holen (optional): `https://reportnet.europa.eu/public/country/DE` →
  „GovReg: National projections of anthropogenic greenhouse gas emissions [2023]“
  → Tabelle 1a herunterladen → nach `rohdaten/eea_reportnet3_2023/` legen.

## 4. Reportnet 3 – Dataflow 113, Datei `DE-Attachments.zip`

- URL: `https://api.reportnet.europa.eu/dataset/exportPublicFile/dataflow/113/dataProvider/58?fileName=DE-Attachments.zip`
- Ergebnis: Antwort mit `Content-Length: 0` (leere Datei). Nicht abgelegt.
  Inhaltlich für den Check nicht erforderlich (der Bericht 2021 liegt als PDF vor).

## 5. Nicht benötigt / bewusst nicht geladen

- Projektionsbericht 2013 (SAP 3.1: ausgeschlossen).
- Access-Datenbanken (`.mdb`, `.accdb`) der EEA-Datensätze 2016–2019: Inhalt
  ist identisch als CSV/XLSX vorhanden; Datenbankdateien wurden nicht geladen.
