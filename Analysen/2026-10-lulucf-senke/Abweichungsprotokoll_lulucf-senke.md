# Abweichungsprotokoll LULUCF-Senke (Analyst, 29.10.2026)

**Status: Analyse GESTOPPT, keine Auswertung durchgefuehrt, kein Skript, keine Ergebnisse.**

## Durchgefuehrt
- SHA-256 der UBA-Tabelle geprueft: f8cf4f382e4e7557de4307d2055d7f6c6ad4b46b9b83c1ef64b0542cc6af4b4b = PROVENIENZ.txt (erfuellt).
- Tabelle mit pdftotext geoeffnet (erstes Oeffnen am 29.10.2026). 1 Seite. Die Kategoriezeilen
  (Waelder, Ackerland, Gruenland, Feuchtgebiete, Siedlungen, Holzprodukte, Gesamt) sind vorhanden,
  HWP wird als eigene Zeile ausgewiesen.

## Stopp-Grund (SAP-Annahme durch PDF-Aufbau widerlegt; Rueckfrage an Mensch)
1. **Jahre fehlen in der Tabelle.** Die Spaltenkoepfe lauten: 1990, 1991, 1992, 1993, 1994, 1995,
   2000, 2005, 2006, 2007 ... 2025. Die Jahre **1996-1999 und 2001-2004 sind nicht enthalten**
   (auch nicht im Rohtext). SAP 3.5 Nr. 2 verlangt Jahreswerte 1990-2024 ohne Luecke und verbietet
   Auffuellen/Interpolation; Fenster A (1990-2024, n = 35) ist damit mit dieser Datei nicht
   umsetzbar. Fenster B (2010-2024), C, D und M(2024) waeren nach den Spaltenkoepfen vollstaendig.
2. **Fussnote nennt eine andere Fassung.** Die Quellenzeile lautet: "Nationale Treibhausgas-Inventare
   1990 bis 2022 (Stand 03/2024), fuer 2023 vorlaeufige Daten (Stand 15.03.2024)". Das passt nicht
   zu "Submission 2026, Y = 2024" (SAP 2.1, 3.2). Die Datei enthaelt aber Spalten 2024 und 2025;
   wahrscheinlich ist die Fussnote veraltet. Das ist nicht entscheidbar, ohne zu raten. SAP 2.1:
   "Weicht die Datei beim Zugriff davon ab: Stopp und Rueckfrage."
3. **Extraktionsqualitaet.** Die Textebene der PDF ist stark zerstueckelt (Summenzeilen ueber mehrere
   Zeilen verteilt, Leerstellen, deutsch/englisches Zahlenformat gemischt, Spaltenzuordnung der
   Gesamt-Zeilen nicht eindeutig). Eine verlaessliche Zuordnung Jahr/Wert braucht Sichtpruefung
   der PDF-Seite als Bild. Die doppelte Uebertragung wurde nicht begonnen.
4. Data-Cube-Abgleich waere die vorgesehene Kontrolle: nicht durchgefuehrt (keine Zustimmung).
   S4 (fruehere Submissions): nicht durchgefuehrt, nicht ohne Download beschaffbar.

## Noch nicht entschieden (Rueckfrage an Daniel Saure)
- Wie wird mit den fehlenden Jahren 1996-1999 und 2001-2004 umgegangen (Fenster A nicht durchfuehrbar,
  oder zusaetzliche Quelle/Zustimmung zum Data Cube)? Jede Loesung ist ein Amendment.
- Gilt die Datei trotz Fussnote "Stand 03/2024" als Submission 2026?

Keine dieser Fragen wurde eigenmaechtig geloest.

---

# Fortsetzung nach Amendment 1 (Analyst, 29.10.2026)

Der Stopp oben (Eintrag 1) wurde durch Amendment 1 (final, freigegeben durch Daniel Saure am 29.10.2026) aufgeloest. Die Analyse lief danach vollstaendig durch (`lulucf-senke.R`, `run_log.txt`).

| Nr. | Punkt | Kennzeichnung | Begruendung / Auswirkung |
|---|---|---|---|
| 1 | Stopp wegen fehlender PDF-Jahre | siehe oben | durch Amendment geloest, keine Post-hoc-Abweichung |
| 2 | Primaerquelle ist Quelle 1 statt PDF | Amendment 1, keine Post-hoc-Abweichung | Quelle 1 enthaelt LULUCF 1990-2024 lueckenlos, Fall 1 nach 2.4; Fenster A durchgefuehrt |
| 3 | UBA Data Cube | nicht durchgefuehrt (keine Zustimmung) | Abgleich ersetzt durch Quelle 2 (35 Jahre) und PDF-Stichprobe, keine Abweichung ueber 0,5 Mt |
| 4 | S4 fruehere Submissions | nicht durchgefuehrt | nicht ohne Download beschaffbar, so im SAP vereinbart (K9); keine Teilmenge |
| 5 | Interpretation Divisor r_req in S3a/S3b | Interpretationsnotiz, keine inhaltliche Abweichung | SAP nennt fuer S3 keinen Divisor; verwendet wurde Zieljahr minus Fensterende (7 bzw. 8), analog zu 6 (E3) und 5 (S7). Beruehrt keine Kategorie. |
| 6 | Doppelte Uebertragung der PDF-Stichprobe | Umsetzungsdetail | Uebertragung 1: Sichtablesung der Seite als Bild (Read-Werkzeug auf gerenderte PNG, hart im Skript kodiert); Uebertragung 2: maschinelle Positionsauslese (pdftools::pdf_data). 0 Differenzen. |
| 7 | Fassungsbezeichnung | Hinweis | Quelle 1 nennt im Dateikopf "Trendtabellen 1990-2024, Dessau 15.01.2026", nicht woertlich "Submission 2026"; PDF-Fussnote "Stand 03/2024" nach Abgleich vermutlich veraltet. Kein Wechsel der Referenz. |
| 8 | Newey-West-Konfidenzintervall | Umsetzungsdetail | HAC-Standardfehler (sandwich::NeweyWest, Lag floor(4(n/100)^(2/9)), prewhite = FALSE, adjust = FALSE), KI mit t(n-2); p-Werte HAC ebenfalls mit t(n-2). SAP nennt die Verteilung nicht. |
| 9 | S1-Simulation | Umsetzungsdetail | Seed 20261029 wird vor jedem der beiden Fenster neu gesetzt; simulate(..., future = TRUE) ohne Parameterunsicherheit, wie im SAP (parametrische Simulation). |
| 10 | Anhang-Grafik OWID/GCP und Thuenen/klimadashboard-Kontrolle | nicht erstellt / nicht beschafft | keine Downloads erlaubt; keine Auswirkung auf Kernzahlen |

Offene Punkte aus dem SAP, vom Analysten nicht bearbeitbar: K2 (Volltext § 3a KSG durch Daniel Saure nicht ausdruecklich bestaetigt), K4 Rest (Verordnung nach § 3a Abs. 3), K13 (Lizenzen).
