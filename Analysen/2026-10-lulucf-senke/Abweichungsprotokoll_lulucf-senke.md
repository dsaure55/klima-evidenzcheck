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
