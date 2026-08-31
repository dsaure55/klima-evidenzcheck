# Validierungsbericht – Nachkontrolle nach Auflagen – Batteriespeicher & Dunkelflauten

**Datum:** 31.08.2026
**Bezug:** Ergänzt `Validierungsbericht.md` (Erstprüfung, "zurück an analyst"-Empfehlung
mit fünf Auflagen). Diese Nachkontrolle prüft gezielt, ob die fünf Auflagen tatsächlich
umgesetzt wurden (Commit ad7ac0b) – keine erneute Komplettprüfung der bereits validierten
Kernformeln/Episodenliste.

**Ergebnis: FREIGABE.** Alle fünf Auflagen nachweislich (nicht nur behauptet) umgesetzt,
keine neuen Abweichungen gefunden.

## Geprüfte Auflagen

1. **Zahlendreher 97,5 % → 97,25 %:** Grep über `run_log.txt`, `output/pflicht_disclaimer.txt`,
   `Entscheidung_Estimand3a.md`, `batteriespeicher-dunkelflaute.R` ergibt null Treffer für
   "97,5%"; "97,25%" korrekt an allen vier ursprünglichen Fundstellen vorhanden.
2. **BEREINIGT-Kapazität (31,5 GWh) konsistent in tabelle3/tabelle4:** Eigene Nachrechnung
   bestätigt die Umstellung. Skalierungsfaktor BEREINIGT/ROH = 31.472/1.144.828 = 0,027491,
   angewandt auf die alten ROH-basierten S1-Werte reproduziert exakt die neuen
   Tabellenwerte (z. B. S1 Median 17,83 → 0,49 → gerundet 0). Code-Grep bestätigt: S1–S7
   verwenden durchgängig die bereinigte Kapazitätsvariable; S9 nutzt weiterhin unverändert
   den eigenständigen BVES-Wert (24 GWh). Die ROH-Zeile und die S9-BVES-Zeile in `tabelle2b`
   sind wertmäßig unverändert (nur Prozentspalten neu ganzzahlig gerundet) – keine
   versehentliche Vermischung der Varianten.
3. **Prominenter Disclaimer:** Das Pflicht-Blockzitat aus `Entscheidung_Estimand3a.md` ist
   jetzt als Kommentarblock am Kopf aller vier betroffenen CSVs (`tabelle2`, `tabelle2b`,
   `tabelle3`, `tabelle4`) vorhanden sowie ausführlich im Fließtext von
   `output/pflicht_disclaimer.txt`.
4. **Confirmation-Bias-Hinweis zur 100-MWh-Schwelle:** Im Disclaimer und in allen vier
   CSV-Kommentarblöcken vorhanden, inkl. Alternativwerte bei 200/300/500 MWh
   (32,6/33,3/33,3 GWh).
5. **Rundung:** Prozentwerte durchgängig ganzzahlig in `tabelle2`, `tabelle2b`, `tabelle3`,
   `tabelle4`; GWh-Werte behalten sinnvoll ihre Dezimalstellen.

**Zusätzlich geprüft:** Sauberer Lauf (`run_log.txt`: Exit-Code 0, erfolgreich nach 1 von 40
möglichen Versuchen).

## Freigabeempfehlung

**Freigegeben.** Estimand 1/2/3(a)/3(b)/3(c) sowie alle Sensitivitäten (S1–S7, S9; S8
transparent als ausstehend gekennzeichnet) dürfen in einen Report-Entwurf übernommen werden –
vorausgesetzt, die Post-hoc-Kennzeichnung aus `Entscheidung_Estimand3a.md` wird dort ebenso
prominent übernommen wie in den Analyse-Outputs.
