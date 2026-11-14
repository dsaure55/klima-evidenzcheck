# Faktencheck Differenzprüfung Kurzfassung Kapitel 3 (Datei 02-zu-klein.md), v0.1 -> v0.2, 14.11.2026

Grundlage: Wortdiff `pruefung/diff_kap03_v02_2026-11-14.diff.txt` und aktuelle Datei `kurz/02-zu-klein.md`. Die Git-Gegenprüfung hat der Auftraggeber gemacht; ich habe keine Shell genutzt. Die Kapitel-Datei wurde nicht geändert. Platzhalter und offene Punkte im Kopfvermerk sind nicht Gegenstand.

Der Diff enthält genau vier Änderungsstellen (Kopfvermerk, Landnutzung, Datenkonverter, Methodenzeile). Es gibt keine geänderten Zahlen, Quellen, Verweise oder Grafiken. Neue Berechnung oder Inferenz: keine.

| Nr. | Änderung | Prüfung | Ergebnis | Schweregrad |
|---|---|---|---|---|
| a | "deskriptiv (keine p-Werte, keine Konfidenzintervalle)" -> "beschreibt nur (deskriptiv): keine p-Werte (Signifikanztests) und keine Konfidenzintervalle (statistische Unsicherheitsspannen)" | Bedeutung unverändert. Fachlich vereinfachend: Ein p-Wert ist das Ergebnis eines Signifikanztests, nicht der Test selbst. "Unsicherheitsspanne" ist für Konfidenzintervall eine übliche Laienformulierung. "beschreibt nur" betont das Fehlen von Schlussfolgerungen, was inhaltlich zu "deskriptiv" passt. | Abweichung (Formulierung, keine Bedeutungsverschiebung) | gering |
| b | "Diese Teilkomponente ist modellunsicherer" -> "Dieser Teil ist unsicherer, weil er auf Modellen beruht" | Fachlich richtig: Die Landnutzungsemissionen stammen aus Modellen (Mittel dreier Modelle, so im Satz davor). Der Bezug von "Dieser Teil" ist nicht ganz eindeutig (Landnutzungsanteil oder die ganze Summe 54,0 Prozent), im alten Text galt dasselbe. Der Vergleichsmaßstab ("unsicherer als die fossile Zahl") bleibt implizit, wie zuvor. | Abweichung (Bezug uneindeutig, Bedeutung gleich) | gering |
| c | "in einem Datenkonverter" -> "in einem Programmschritt zum Umwandeln der Daten (Datenkonverter)" | Erklärung passt zur Funktion eines Konverters. Der Rest des Absatzes ist unverändert (kritischer Fehler, verfälschte drei Werte, nie veröffentlicht, unabhängig nachgerechnet, keine nachträgliche Korrektur). Die Einzelheiten dieses Absatzes wurden in dieser Differenzprüfung nicht neu gegen die Quelle [1] geprüft, weil sie nicht geändert sind. | bestätigt | keine |
| d | Kopfvermerk (v0.2-Angabe, "vom 28.10.2026") | Nur Vermerk, wird vor Satz entfernt. Datum und Stilpass-Angabe sind konsistent mit der Änderung. | bestätigt | keine |
| e | Verweis "mehr dazu in Kapitel 10" gegen `kurz/REIHENFOLGE.md` | Kapitel 10 = `07-korrekturen.md` (Teil 2, Fehlerliste/Korrekturen). Das passt inhaltlich zum Satz zu Fehler und Korrektur. Die REIHENFOLGE.md weist selbst darauf hin, dass die Umstellung der Querverweise noch nicht gegengeprüft war. Mit dieser Prüfung ist nur das Ziel gegen die Reihenfolgetabelle abgeglichen, nicht gegen den Text des Kapitels 10. | bestätigt (gegen Tabelle) | keine |

## Gesamturteil

Ok. Gezählt über alle 5 geprüften Punkte (a bis e): 0 kritisch, 0 hoch, 0 mittel, 2 gering (a, b), 3 ohne Befund (c, d, e). Keine Bedeutungsverschiebung festgestellt.

Optionale Hinweise ohne Pflicht: bei (a) "p-Werte (Ergebnisse von Signifikanztests)" wäre präziser; bei (b) "Dieser Teil" zu "Der Landnutzungsanteil" machen.

Kein Freigabevermerk. Die Freigabe durch Daniel Saure steht aus.
