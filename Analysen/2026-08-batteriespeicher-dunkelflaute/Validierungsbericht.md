# Validierungsbericht: Batteriespeicher & Dunkelflauten

**Datum:** 31.08.2026
**Geprüft gegen:** SAP_batteriespeicher-dunkelflaute.md (final, v1.0) und
Entscheidung_Estimand3a.md

**Gesamtempfehlung: ZURÜCK AN ANALYST — überwiegend kleine, aber wichtige Konsistenz-Auflagen.
Keine grundsätzliche Neuberechnung nötig, die zugrundeliegende Analyse ist rechnerisch korrekt
und SAP-treu.**

Top-Level-Session hat die wichtigsten Befunde unabhängig gegenverifiziert (MaStR-
Summary-CSV direkt nachgerechnet, tabelle3/tabelle4 direkt eingesehen) – Befunde bestätigt.

## Bestanden (eigene Nachrechnung, nicht nur Codelesen)

- Estimand-Definitionen/Formeln (Dunkelflaute-Identifikation, Energiedefizit, Deckungsgrad
  inkl. SOC 80 %/Wirkungsgrad 85 %) — Episode 5 und Episode 1 unabhängig aus SMARD-Rohdaten
  nachgerechnet, exakte Übereinstimmung.
- SMARD/MaStR tatsächlich als Primärquelle verwendet; Ende-zu-Ende-Verifikation der
  Perl-Pipeline für einen Stichtag (2015-10-28) erfolgreich.
- Estimand 3(c)-Suchprotokoll: Zitate direkt in den heruntergeladenen BNetzA-Dokumenten
  gegengeprüft, Schlussfolgerung "nicht mit Primärqualität durchführbar" gut belegt.
- Sensitivitäten S1–S9 vollständig, kein Cherry-Picking; S8 korrekt als zeitlich flexibel
  zurückgestellt dokumentiert.
- Diagnostik (Ljung-Box, Shapiro-Wilk) korrekt durchgeführt und interpretiert.
- Interpretationsrahmen (SAP Abschnitt 8) vollständig eingehalten.

## Abweichungen

1. **Zahlendreher 97,5 % statt korrekt 97,25 %** (Top-50-Ausreißer-Anteil an der
   MaStR-Rohsumme). Eigene Nachrechnung: 1.113.355,13 / 1.144.827,53 = 97,25 %. Wiederholt
   an vier Stellen falsch übernommen (Skriptkopf, run_log.txt, pflicht_disclaimer.txt,
   Entscheidung_Estimand3a.md).
2. **KRITISCH für Report-Erstellung:** `tabelle3_sensitivitaetsmatrix.csv` und
   `tabelle4_einordnung_fremdzahlen.csv` verwenden weiterhin die MaStR-**ROH**-Kapazität
   (Median 19,6 %, Sensitivitätsbereich 17–33 %), nicht die inzwischen von Daniel Saure
   festgelegte **BEREINIGT**-Kapazität (Median 0,5 %). Unverändert in einen Report übernommen,
   entstünde ein Bericht mit einer Headline-Zahl (~0,5 %) und einer dazu inkonsistenten
   Sensitivitäts-/Einordnungstabelle (17–33 %) – Faktor ~40 auseinander, ohne Erklärung. Das
   ist kein Fehler der bisherigen Analyse (Entscheidung kam zeitlich nach dem Analyse-Lauf),
   aber ein zwingender nächster Schritt vor jeder Report-Verwendung.
3. Die geforderte prominente Post-hoc-Kennzeichnung aus Entscheidung_Estimand3a.md ist im
   aktuellen Output noch nicht umgesetzt (gleicher Grund: zeitliche Reihenfolge).
4. **100-MWh-Ausschlussschwelle:** im Code selbst als "am plausibelsten nah an
   BVES/IWR" begründet, nicht durch ein unabhängiges technisches Kriterium. Bei 200/300/500 MWh
   ergäben sich 32,6/33,3/33,3 GWh statt 31,5 GWh – die gewählte Schwelle liegt an der Stelle,
   die am nächsten an der Sekundärquelle IWR liegt. Reales, offen zugegebenes
   Confirmation-Bias-Risiko (keine verdeckte Manipulation) – im Bericht transparent zu machen,
   nicht als Bestätigung der Schwelle zu verwenden.
5. Rundung: SAP Abschnitt 11 schreibt ganzzahlige Prozentwerte vor; tabelle2/2b nutzen 1,
   tabelle3 sogar 2 Nachkommastellen. Unbegründete Abweichung.
6. Behauptung "Perl-Parser eigens gegen Referenzwerte/DST-Termine getestet" ist in
   run_log.txt **nicht** durch ein Testprotokoll belegt (nur der finale erfolgreiche Lauf ist
   dort protokolliert). Durch eigene Stichprobe (ein Tag, ein Filter) entkräftet, aber keine
   systematische Testdokumentation vorhanden – für künftige Analysen ein echtes Testprotokoll
   statt bloßer Behauptung ablegen.
7. MaStR-XML-Rohdaten (11 GB) wurden nach Verarbeitung gelöscht – Validator konnte nur die
   abgeleiteten Summen-CSV prüfen, nicht die Originaldaten selbst. Empfehlung für künftige
   Analysen: kleine Stichprobe der Top-Ausreißer im Originalformat vor dem Löschen archivieren.

## Auflagen für den Analysten

1. 97,5 % → 97,25 % an allen vier Fundstellen korrigieren.
2. Klären/umsetzen: tabelle2b, tabelle3, tabelle4 und pflicht_disclaimer.txt auf die
   offizielle BEREINIGT-Kapazität (31,5 GWh) umstellen, inkl. des in
   Entscheidung_Estimand3a.md vorgeschriebenen prominenten Post-hoc-Blockzitats überall,
   wo die Zahl auftaucht.
3. Prozent-Rundung auf ganzzahlig gemäß SAP 11 vereinheitlichen (oder Abweichung explizit
   begründen).
4. Confirmation-Bias-Hinweis zur 100-MWh-Schwelle explizit in Disclaimer/Bericht aufnehmen.
5. Optional: Testprotokoll für Perl-Parser nachreichen.

Estimand 1a/1b/2/3(b)/3(c), alle Sensitivitäten (inhaltlich) und der Interpretationsrahmen
sind validiert. Vor Report-Erstellung müssen jedoch Auflage 1–4 umgesetzt sein, damit keine
intern widersprüchlichen Zahlen (ROH vs. BEREINIGT) in einen Entwurf gelangen.
