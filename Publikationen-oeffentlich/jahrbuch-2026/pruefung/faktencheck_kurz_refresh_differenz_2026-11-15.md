# Faktencheck Differenzpruefung Daten-Refresh 15.11.2026 (Jahrbuch-Kurzfassung v0.3 Kap. 4, 5, 6, 14)

Pruefer: unabhaengiger Faktenpruefer (nicht Autor). Pruefdatum: 15.11.2026.
Gegenstand: nur die Diff-Stellen aus `pruefung/diff_kap04_v03_refresh_2026-11-15.diff.txt`, `..._kap05_...`, `..._kap06_...`, `..._kap14_...`. Der unveraenderte Rest der Kapitel wurde nicht geprueft.
Methode: Originalquellen am 15.11.2026 abgerufen. Der Abruf lief ueber ein Abrufwerkzeug, das Seiten zusammenfasst und woertliche Zitate auf 125 Zeichen begrenzt. Die Werte unten sind daher Werte aus dem Abruf, keine Screenshots der Originale.
Ampel: bestaetigt / Abweichung / nicht pruefbar / kritisch. Im Zweifel Abweichung.

## Befundtabelle

| Nr. | Behauptung (Buch) | Quelle | Ergebnis | Schweregrad | Hinweis |
|---|---|---|---|---|---|
| 1 | Kap. 4: 16.10. steht inzwischen mit 60,7 Prozent in der Datenreihe | BNetzA-CSV (id=870304), Spalte 04/2026-03/2027: 16.10. = 60,72 | bestaetigt | - | Rundung korrekt. |
| 2 | Kap. 4: 1.11. = 61,0 Prozent | CSV: 61,02 | bestaetigt | - | |
| 3 | Kap. 4: 12.11. = 57,6 Prozent | CSV: 57,57 | bestaetigt | - | |
| 4 | Kap. 4: 12.11. des Vorjahres = 74,7 Prozent | CSV, Spalte 04/2025-03/2026: 12.11. = 74,71 | bestaetigt | - | Rundung korrekt. |
| 5 | Kap. 4: Neuere Werte lagen beim Abruf nicht vor | CSV: Spalte 2026/27 ab 13.11. leer, letzter Wert 12.11. (57,57); davor 11.11. = 57,68 | bestaetigt | - | |
| 6 | Kap. 4: Der Wert 60,7 stehe dort wegen "Nachmeldungen" | CSV nennt keine Ursache | Abweichung | gering | Die Ursache der Aenderung von 60,5 auf 60,72 steht in der Datenreihe nicht. Nachmeldungen sind nur als allgemeine BNetzA-Warnung belegt (Satz davor, Quellen [2][4][5]). Vorschlag: "Die Werte koennen sich durch Nachmeldungen aendern, der 16. Oktober steht inzwischen mit 60,7 Prozent in der Reihe." |
| 7 | Kap. 4, Quelle [5]: "Aktualisierung der Seite 14.11.2026" | BNetzA-Seite | nicht pruefbar | gering | Dieses Datum war im CSV-Abruf nicht zu sehen. Es kann nur der Autor am Original belegen. Der Abruf am 15.11.2026 ist durch die Daten gestuetzt. |
| 8 | Kap. 4: Der Absatz davor nennt weiter 60,5 Prozent und 149,62 TWh, der Nachtrag nennt 60,7 Prozent. | Buchtext | Abweichung | gering | Es entsteht ein sichtbarer Wert-Konflikt (60,5 gegen 60,7) in zwei Absaetzen. Der Nachtrag sagt "inzwischen", die TWh-Angabe bleibt aber beim alten Wert. Der Nachtrag erklaert, dass er keine TWh fuer November berechnet. Fuer den 16.10. liegt jedoch weiter nur der alte TWh-Wert vor. Erklaerung im Text empfohlen. |
| 9 | Kap. 4: Nachtrag enthaelt keine neue Rechnung | Buchtext | bestaetigt | - | Es stehen nur gerundete Quellwerte. Es gibt keine Differenz und keine Prognose. Der Satz "Terawattstunden ... nicht berechnet" ist zutreffend. |
| 10 | Kap. 4: Stand-Satz "16. Oktober, ergaenzt um den Nachtrag zum 12. November" | Buchtext | bestaetigt | - | Passt zum Nachtrag. |
| 11 | Kap. 5: RKI habe nach dem Bericht zu KW 37, dem letzten der Saison, keine neue Schaetzung veroeffentlicht | RKI-Seite (https://www.rki.de/...Bericht_Hitzemortalitaet.html) | nicht pruefbar | mittel | Die RKI-Seite lieferte 404. Sekundaer (PTA heute, 13.10.2026) steht: letzter Wochenbericht 2026 am 24.09., KW 15 bis KW 37, rund 16.000. Das stuetzt "KW 37, letzter Bericht" bis 13.10., aber nicht "bis 15.11. keine neuere Schaetzung". Eine Negativaussage braucht den Blick auf die RKI-Berichtsliste. Bitte Daniel oder Autor am Original belegen. |
| 12 | Kap. 5: DWD-Datei traegt weiter das Erstelldatum 2. September | DWD CDC `.../regional_averages_DE/seasonal/air_temperature_mean/regional_averages_tm_summer.txt`, Kopfzeile "erstellt am: 20260902" | bestaetigt | - | Der Pfad im Auftrag ohne Unterordner lieferte 404. Der volle CDC-Pfad lieferte die Datei. Letzte Zeile 2026: Deutschland 19,55. |
| 13 | Kap. 5: "Beide Werte sind damit unveraendert vorlaeufig" | Buchtext | Abweichung | gering | Aus fehlender Aenderung wird auf unveraenderten Status geschlossen. Bei DWD durch das Erstelldatum gestuetzt, bei RKI nur durch Punkt 11 begrenzt. Vorschlag: "Wir haben keine neue Schaetzung gefunden." |
| 14 | Kap. 6: Copernicus meldet den waermsten Oktober seit Beginn der Datenreihe | C3S, Bulletin Oktober 2026: "warmest October on record globally" | bestaetigt | - | |
| 15 | Kap. 6: 1,75 Grad ueber 1850-1900 | C3S: 1.75 C ueber dem geschaetzten Mittel 1850-1900 | bestaetigt | - | |
| 16 | Kap. 6: dritter Monat in Folge ueber 1,5 Grad | C3S: "third consecutive month above 1.5 C" | bestaetigt | - | |
| 17 | Kap. 6, Absatz nach dem Nachtrag: "die Monate ueber 1,5 Grad, zuletzt August und September 2026 [1]" | Buchtext gegen C3S | Abweichung | mittel | Der Satz ist nach dem Nachtrag veraltet, denn der Oktober ist der dritte Monat in Folge. Der Nachtrag steht zwei Absaetze weiter oben. Der Widerspruch ist im selben Kapitel sichtbar. Bitte "zuletzt August bis Oktober 2026" oder einen Vermerk ergaenzen. Das ist eine Lesart-Pruefung am Buchtext, keine neue Rechnung. |
| 18 | Kap. 6: NOAA hat am 12.11. neu bewertet, El Nino wird weiter staerker | CPC ENSO Diagnostic Discussion, Ausgabe 12 November 2026: "El Nino continues to strengthen" | bestaetigt | - | |
| 19 | Kap. 6: starkes bis sehr starkes Ereignis bis Januar bis Maerz 2027 mit mehr als 79 Prozent | CPC: "strong-to-very strong El Nino likely through January-March 2027", mehr als 79 % | bestaetigt | gering | Sachlich korrekt. Die Formulierung "bis Januar bis Maerz 2027" liest sich holprig, besser "bis Januar bis Maerz 2027" ersetzen durch "bis in das Quartal Januar bis Maerz 2027". Die Seite definiert die Schwellen "stark" und "sehr stark" nicht. Der Text tut das auch nicht. |
| 20 | Kap. 6: historisch = Dreimonatswert des Index +2,5 oder mehr, ueber allen El Ninos seit 1950; rund 60 Prozent fuer Okt-Dez und Nov-Jan | CPC: "3-month RONI >= +2.5", "exceeding El Ninos since 1950", "~60% for the October-December and November-January periods" | bestaetigt | - | Der Text sagt "Grad" beim Index. Der Index ist eine Anomalie in Grad Celsius, das passt. |
| 21 | Kap. 6: Abgrenzung zu den 83 Prozent vom 8.10.: "lasst sich nicht direkt vergleichen, weil wir die Abgrenzung nicht erneut geprueft haben" | CPC 12.11. und Buch (8.10.-Angabe nicht neu abgerufen) | Abweichung | mittel | Inhaltlich vorsichtig, aber die Begruendung ist unscharf. Sie sagt nicht, ob die Angaben dieselbe Schwelle meinen. Der Satz begruendet die Nicht-Vergleichbarkeit mit der eigenen Nicht-Pruefung, nicht mit einem Unterschied in der Sache. Die Reihenfolge 83 dann 60 legt trotzdem einen Rueckgang nahe. Im Abschnitt "Lagen wir richtig" steht die 60 direkt neben der 83 ohne diesen Vorbehalt. Vorschlag: "Ob die 83 Prozent vom 8. Oktober und die rund 60 Prozent vom 12. November dieselbe Schwelle meinen, haben wir nicht geprueft. Wir vergleichen sie deshalb nicht." Den Vorbehalt in der Rueckschau-Zeile wiederholen oder dorthin verweisen. Die 8.10.-Ausgabe wurde nicht erneut am Original geoeffnet (siehe Nicht geprueft). |
| 22 | Kap. 6: Nachtraege enthalten keine neue Rechnung oder Inferenz | Buchtext | bestaetigt | - | Nur Quellwerte und Datum. Keine Differenz 83 minus 60. Die Rueckschau-Zeile "Am 12. November nannte die NOAA ... rund 60 Prozent" ist beschreibend. Der implizite Vergleich ist unter Punkt 21 vermerkt. |
| 23 | Kap. 6: Quellennummern [18] = Copernicus Oktober 2026, [19] = NOAA 12.11.2026; Verweise passen | Buchtext | bestaetigt | - | Vorherige letzte Nummer war [17]. URLs und Titel stimmen mit den abgerufenen Seiten ueberein. |
| 24 | Kap. 14: Quelle [5] (Kap. 4) wortgleich mit Kap. 4 | Diffs 04 und 14 | bestaetigt | - | Gleicher Text "Datenreihe abgerufen am 15.11.2026, Aktualisierung der Seite 14.11.2026; mit ...". Verglichen wurden nur die beiden Diff-Zeilen. |
| 25 | Kap. 14: Quellen [18] und [19] (Kap. 6) wortgleich mit Kap. 6 | Diffs 06 und 14 | bestaetigt | - | Beide Zeichenketten sind identisch. Die Platzierung im Abschnitt Kapitel 6 ist korrekt. |

## Zaehlung

kritisch 0, hoch 0, mittel 3 (Punkte 11, 17, 21), gering 4 (Punkte 6, 8, 13, 7 als nicht pruefbar). Die Zahlen unter Punkt 19 sind bestaetigt, mit Stilhinweis.

## Gesamturteil

ok mit Auflagen. Alle Zahlen der Nachtraege (Gasspeicher, Copernicus, NOAA, DWD-Erstelldatum) stimmen mit den Originalen ueberein, und es steckt keine neue Rechnung darin. Vor einer erneuten Freigabe sollten drei mittlere Punkte erledigt werden.
1. Punkt 17: der veraltete Satz "zuletzt August und September 2026".
2. Punkt 21: die Abgrenzung zu den 83 Prozent klarer fassen und in der Rueckschau-Zeile wiederholen.
3. Punkt 11: die RKI-Negativaussage am Original belegen, oder abschwaechen ("uns ist keine neuere Schaetzung bekannt").

Freigabe ist nicht Teil dieser Pruefung.

## Nicht geprueft

- RKI-Originalseite (404). Nur Sekundaerquelle PTA heute, die Aussage nach dem 13.10. ist unbelegt.
- BNetzA-Seite selbst, "Aktualisierung 14.11.2026" (nur die CSV wurde abgerufen).
- Die 8.10.-Ausgabe der NOAA (83 Prozent, Anomalie +2,1) und die Schwellendefinition dahinter. Daher kein Urteil darueber, ob beide Angaben dieselbe Groesse meinen.
- Alle unveraenderten Teile der Kapitel 4, 5, 6 und 14 ausserhalb der Diffs, einschliesslich der Kopfzeilen-Vermerke (z. B. Dateinamen der Faktenchecks).
- Wortgleichheit Kap. 14 nur auf Diff-Ebene, nicht durch Volltextvergleich der Dateien.
- Das Abrufwerkzeug fasst Seiten zusammen. Fuer eine Revisionsakte sollten die Rohantworten (CSV, C3S-Seite, CPC-Seite) archiviert werden.
