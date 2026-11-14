# Differenzprüfung Stilpass, Kurzfassung Kapitel 4 (Energie), v0.2, 14.11.2026

Geprüft: `kurz/03-energie.md` (v0.2) gegen Wortdiff `pruefung/diff_kap04_v02_2026-11-14.diff.txt` (Git-Gegenprüfung durch Auftraggeber). Zusätzlich gelesen: `Prognose-Register/01_gasspeicher-winter-2026-27.md`, `kurz/REIHENFOLGE.md`. Der Diff enthält genau die sechs gemeldeten Änderungen (a bis f), keine weiteren Textänderungen. Offene Punkte im Kopfvermerk sind nicht Gegenstand.

| # | Änderung | Prüfung | Ergebnis | Schwere |
|---|---|---|---|---|
| a | "(statistische Unsicherheitsspanne, 95-Prozent-Konfidenzintervall: 12 bis 74 Prozent)" | Zahlen unverändert, Fachwort bleibt, Erklärung sachlich korrekt für ein Konfidenzintervall. Keine Bedeutungsverschiebung. | ok | - |
| b | "Das Prognoseintervall" zu "Die Prognosespanne" (69 bis 230 TWh) | Zahlen identisch mit Register V2 (69 bis 230, 4,21 °C, rund 150). Nur Wortwahl. | ok | - |
| c | "im zugehörigen 95-Prozent-Prognoseintervall" zu "in der zugehörigen 95-Prozent-Prognosespanne" | Bewertungsregel V1 im Register: tatsächliche Entnahme liegt innerhalb des zugehörigen 95-%-Prognoseintervalls bei tatsächlicher Temperatur; Ausnahme außerhalb 3,75 bis 6,18 °C keine Bewertung. Im Kapitel inhaltlich unverändert: Bezug zur tatsächlichen Temperatur, 95 Prozent, zugehörig, Ausnahmebereich und Zahlen identisch. Regel nicht verschoben. | ok | gering (siehe G1) |
| d | "Interquartilsabstand 3.921 bis 5.994 GWh" zu "die mittlere Hälfte der Episoden liegt zwischen 3.921 und 5.994 GWh" | Fachlich: Ein Interquartilsabstand ist eine Differenz (hier rund 2.073), keine Spanne von-bis; die alte Formulierung war streng genommen unsauber, die neue ist korrekt, sofern 3.921 und 5.994 das 25. und 75. Perzentil sind (dann liegt die mittlere Hälfte der Episoden dazwischen). Bedeutung gleich, Genauigkeit besser. Die Werte selbst sind unverändert; ihre Eigenschaft als Quartile habe ich in dieser Kurzprüfung nicht gegen die Rohauswertung nachgeprüft (kein Zugriff auf die Auswertungsausgabe im Rahmen dieses Laufs). Keine neue Berechnung enthalten. | ok, Quartil-Eigenschaft nicht gegen Rohausgabe geprüft | gering (siehe G2) |
| e | "acht Varianten-Rechnungen, sogenannte Sensitivitätsanalysen" | Zahl acht und Ergebnis 0 bis 1 Prozent unverändert, Erklärung korrekt. | ok | - |
| f | Kopfvermerk (v0.2, Klammer, "vom 28.10.2026") | Nur Vermerk, wird vor Satz entfernt. Keine inhaltliche Aussage im Lesetext betroffen. | ok | - |
| - | Verweis "siehe Kapitel 8" (Prognose-Register) | REIHENFOLGE.md: Kapitel 8 = 10-prognose-register.md. Verweis korrekt. | ok | - |

## Befunde

- G1 (gering): Das Register nennt die Regel weiterhin "95-%-Prognoseintervall". Die Kurzfassung sagt jetzt "Prognosespanne". Inhaltlich identisch; wer beide Dokumente vergleicht, sieht zwei Wörter für dasselbe. Kein Handlungszwang, ggf. beim Register-Abgleich im Hinterkopf behalten. Das Register selbst bleibt unangetastet (festgelegt am 22.10.2026).
- G2 (gering): Der Konfidenzintervall-Zusatz (a) steht nur an der ersten Stelle. Der zweite Satz mit "95-Prozent-Konfidenzintervall: 17 bis 81" (Temperatureffekt) bleibt ohne Erklärung; Leser müssen den Begriff aus dem ersten Vorkommen mitnehmen. Stilfrage, keine Sachabweichung. Zusätzlich offener Hinweis zu (d): Quartil-Eigenschaft der Werte 3.921 und 5.994 nicht gegen die Rohausgabe nachgeprüft (Verifikationsrest, kein Fund).

## Gesamturteil

ok. Zählung: 0 kritisch, 0 hoch, 0 mittel, 2 gering (G1, G2). Keine Bedeutungsverschiebung, keine neue Berechnung oder Inferenz, Prognose-Register-Bewertungsregel inhaltlich unverändert, Querverweis Kapitel 8 korrekt. Diese Datei ist keine Freigabe.
