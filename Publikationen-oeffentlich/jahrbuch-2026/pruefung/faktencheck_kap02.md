# Faktencheck Kapitel 2 (Jahrbuch 2026): „Reicht die Energie: Gas im Winter, Strom bei Dunkelflaute?“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/02-energie.md` (Entwurf v0.1, 23.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung.
**Geprüfte Grafiken:** `grafiken/kap02_grafik1_gas_entnahme.png`, `grafiken/kap02_grafik2_dunkelflaute_batterie.png` (als Bilder gelesen) und `grafiken/kap02_grafiken.R`.
**Prüfdatum:** 23.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5: volle Faktencheck-Datei für „Kurz gesagt“, „Was heißt das für dich?“, „Lagen wir richtig?“; Differenzprüfung für den Haupttext. Regel: keine neue Berechnung, keine neue Inferenz; der Stil darf nichts verändern, verstärken oder abschwächen (`stilregeln.md`).

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| [1] Evidenzcheck 14.9. („Reichen 136 Terawattstunden?“), Referenzfassung `quellen-artikel/2026-09-14_...html` | gelesen (vollständig) | Abgleich vollständig |
| [2] Einordnung 17.10. („Gasspeicher bei 60 Prozent“), Referenzfassung `quellen-artikel/2026-10-17_...html` | gelesen (vollständig) | Abgleich vollständig |
| [3] Evidenzcheck 31.8. („Batteriespeicher und Dunkelflauten“), Referenzfassung `quellen-artikel/2026-08-31_...html`; zusätzlich Live-Abruf der Substack-Seite (Fußnote 1) | gelesen; Fußnote 1 live geprüft | Abgleich vollständig |
| `Analysen/2026-09-gasspeicher-winter/`: Analysebericht, Validierungsbericht, `output/tabelle1_winter.csv` | gelesen | Zahlen 133,7; 42–178; Median 122,1; 4 von 10 (95-%-KI 12–74 %); −49,1 TWh/°C (KI −81,0 bis −17,2); R² 0,61; 150 TWh [69; 230]; 4,21 °C; 4,49-°C-Schwelle; 60 %; 19 %; 612 bestätigt. Offene Auflage: DWD-Originaldateien (siehe Abschnitt 6) |
| `Analysen/2026-08-batteriespeicher-dunkelflaute/`: `run_log.txt`, `Validierungsbericht_Nachkontrolle.md`, `output/pflicht_disclaimer.txt`, `output/tabelle1_episodenliste.csv` | gelesen (Erstvalidierungsbericht nicht gelesen; Nachkontrolle „FREIGABE“) | 50 Episoden; Median 4.301,35; IQR 3.921,05–5.994,37; min 2.997,67; max 14.784,41; 31,472 GWh bereinigt; 50 von 2.724.033; 97,25 %; Sensitivitäten S1–S7, S9 (S8 ausstehend); IWR 35 GWh Median 0,60 % bestätigt |
| `Prognose-Register/01_gasspeicher-winter-2026-27.md` | gelesen; Datei auf GitHub sichtbar (Ordner `Prognose-Register`) | 22.10.2026; V1 (Kernvorhersage) und V2 (69–230, rund 150); Auswertung Mai/Juni 2027; Offenlegung drei Wochen bestätigt |
| `Reports/2026-10-16-gasspeicher-60prozent/faktencheck.md` | gelesen | Frühere Prüfung von [2] (Gesamturteil „ok“ nach Nachtrag 2) |
| Bundesnetzagentur „Aktuelle Lage Gasversorgung“ (Quelle [4]) | WebFetch 23.10.2026 | Seite zeigt jetzt die **Lagebewertung vom 23.10.2026** (61,1 %, 151,1 TWh), nicht mehr die vom 16.10.; Aussagen „nicht zwingend“, „vergleichsweise niedriger Speicherfüllstand am Ende des Winters ist wahrscheinlich“, „deutlich niedriger als in den Vergleichszeiträumen vergangener Jahre“ stehen weiter dort; die Füllstandsziele erschienen im abgerufenen Text nicht (abgeschnitten) |
| Bundesnetzagentur „Verlauf der Speicherfüllstände in Prozent“ (Quelle [5]) | WebFetch 23.10.2026 | 80 % für alle Speicher als Standard, 45 % für Bad Lauchstädt, Frankenthal, Hähnlein, Rehden, Stockstadt, Uelsen zum 1. November; Daten können sich „rückwirkend ändern“; Seite aktualisiert 23.10.2026 09:02 |
| Eurostat, DWD, SMARD, MaStR (Primärquellen) | nicht direkt geöffnet | nur über Analysebericht, CSV und run_log abgedeckt |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4.

### 2.1 Kurz gesagt

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Ein Füllstand in Prozent sagt wenig darüber, ob das Gas für den Winter reicht.“ | [2] („an einer Prozentzahl nicht ablesen“) | bestätigt | |
| 2 | „Entscheidend sind die Menge, die Temperatur und die laufenden Lieferungen.“ | [1], [2] | Abweichung (gering) | [1]: „Ob es eng wird, entscheidet sich an Importmengen, Preisen und Kältewellen“; [2]: „Das Risiko bleibt ein kalter Winter, daneben kommt es auf die laufenden Importe an.“ „Entscheidend“ und die Aufzählung (Menge statt Preise) sind eine Neuordnung; „die Menge“ wird in [1] nicht als entscheidend bezeichnet. A11. |
| 3 | „Am 16. Oktober 2026 lagen rund 150 TWh in den deutschen Speichern.“ | [2], Quelle [4] (149,62 TWh am 16.10.) | bestätigt | Quellseite zeigt inzwischen 23.10.: 61,1 % / 151,1 TWh; der Text bleibt mit Datum richtig. A10. |
| 4 | „Das ist ungefähr so viel, wie in einem durchschnittlich kalten Winter entnommen wird.“ | [2] („etwa so viel, wie ein durchschnittlich kalter Winter an Entnahme erwarten lässt“), [1] | Abweichung (gering bis mittel) | [2] spricht von einer **Erwartung** (Prognoseintervall 69–230 TWh), das Kapitel von einer festgestellten Menge. Auch fehlt, dass „durchschnittlich kalt“ die Norm der letzten dreißig Winter meint („kälter als der Schnitt des letzten Jahrzehnts“, [1]); die Zehn-Jahres-Median-Entnahme beträgt 122 TWh. A6. |
| 5 | „Ein kalter Winter bleibt das Risiko.“ | [2] | bestätigt | In [2] folgt „daneben kommt es auf die laufenden Importe an“; im Kapitel steht der Hinweis auf Lieferungen im Satz davor. |
| 6 | „Beim Strom hätten die heute installierten Batteriespeicher die Dunkelflauten der letzten Jahre nur zu etwa einem Prozent abdecken können.“ | [3], run_log, Pflicht-Disclaimer | Abweichung (mittel) | Median 1 % ist die ganzzahlige Berichtsrundung des Medianwerts von rund 0,5 % (31,47 GWh × 0,8 × 0,92 ÷ 4.301 GWh ≈ 0,54 %, eigene Plausibilitätsrechnung aus Werten des run_log, nicht im Kapitel). Der Satz nennt weder die nachträgliche Bereinigung der Kapazität (Pflicht-Disclaimer „prominent“) noch „ohne Nachladung, ohne Importe“. „nur“ ist eine Wertung. A2. |

### 2.2 Gas: Die Aussage und ihr Bezugsrahmen

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 7 | „Mitte September 2026 ... rund 55 Prozent gefüllt, vor einem Jahr waren es 74 Prozent.“ | [1] | bestätigt (nach [1]), Primärquelle nicht geprüft | In [1] ohne eigene Quellenangabe (Speicherstatistik). |
| 8 | INES „warnte vor historisch niedrigen Ständen. In einem kalten Winter, gerechnet mit dem Wetterjahr 2010, könnten im Januar und Februar bis zu zwei Terawattstunden pro Monat fehlen.“ | [1], Analysebericht („INES-Szenarien vom 08.09.2026“) | bestätigt (nach [1]), Herkunft nicht prüfbar | Der Hinweis „aus Medienberichten, keine Primärquelle“ steht in [1] und im Kapitel nur beim Müller-Zitat. Für die INES-Aussage nennen weder [1] noch das Kapitel eine Quelle; Primärquelle (INES-Szenarien) nicht geöffnet. „Fehlen“ ist die Wortwahl von [1] („Unterdeckung“ im Analysebericht). A8. |
| 9 | Müller (12. September): In den Speichern lägen „rund 136 Terawattstunden, etwas mehr, als im gesamten letzten Winterhalbjahr entnommen worden sei. Entnommen wurden damals knapp 134“ | [1], Analysebericht (133,7; „mehrere übereinstimmende Medienberichte“) | bestätigt | Im Kapitel indirekte Rede statt des wörtlichen Zitats aus [1] („etwas mehr Gas, als wir ...“); das ist zulässig. |
| 10 | „(Das Zitat stammt aus mehreren übereinstimmenden Medienberichten vom 12. und 13. September. Eine Primärquelle der Bundesnetzagentur lag uns nicht vor.)“ | [1] | bestätigt, mit Hinweis | Inhalt wörtlich wie [1]. Das Kapitel enthält jetzt kein wörtliches Zitat mehr („Das Zitat“ ohne Zitat), und die Kennzeichnung gilt nur für Müller. A8. |
| 11 | „Beide Seiten haben Interessen. Die Bundesnetzagentur ist für die Versorgungssicherheit verantwortlich, INES vertritt die Speicherbetreiber. Uns interessiert deshalb etwas anderes“ | [1], SAP 8.6 (laut Validierungsbericht V8) | Abweichung (gering) | Rollen stimmen mit [1]. „Beide Seiten haben Interessen“ und „deshalb“ sind neu; [1] bleibt bei der Rollenbeschreibung. Der Pflicht-Disclaimer der Strom-Analyse verbietet Motivzuschreibungen gegenüber Medien (dort nicht einschlägig), für Gas verlangt SAP 8.6 die Nennung der Interessenlage. Als Wertung („haben Interessen“) vermeidbar. A9. |
| 12 | „Müller vergleicht mit genau einem Winter.“ | [1] | bestätigt | |

### 2.3 Was die Winter zeigen

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 13 | Netto-Entnahme je Winterhalbjahr (Oktober bis März) aus Eurostat-Monatsdaten; 2025/26 = 133,7 TWh; „Damit ist die Entnahmezahl unabhängig bestätigt“; Speicherstand 136 nicht nachgerechnet | [1], Analysebericht (133,654), Validierungsbericht | bestätigt | |
| 14 | „Mit 4,41 °C lag das Winterhalbjahr 2025/26 fast genau im Mittel der letzten dreißig Winter.“ | [1] (53. Perzentil), CSV (4,41) | bestätigt | DWD-Werte wurden laut Analysebericht aus eingefügtem Dateitext übernommen; Abgleich mit Originaldateien stand aus (Abschnitt 6). |
| 15 | „Wer Müller vorwirft, sich einen warmen Winter ausgesucht zu haben, liegt falsch.“ | [1] | bestätigt, mit Hinweis | Wörtlich aus [1]; Wertung über nicht benannte Kritiker. Empfehlung E1. |
| 16 | „Die Entnahmen der letzten zehn Winter reichen von 42 bis 178 Terawattstunden, der Median liegt bei 122.“ | [1], CSV (42,0 bis 178,0; Median der zehn Werte 122,15) | bestätigt | Zehn Winter 2016/17–2025/26. |
| 17 | „In vier von zehn Wintern lag die Entnahme über 136.“ | [1], CSV | bestätigt (Zahl), Abweichung (Einschränkung fehlt) | CSV: 155,0; 161,5; 178,0; 163,2 = vier (133,7 liegt darunter). [1] ergänzt: „95-%-Konfidenzintervall dieser Quote 12 bis 74 Prozent ... taugt als Größenordnung, nicht als Prognose“; ebenso 5 von 12 / 4 von 9. Im Kapitel entfällt das. A7. |
| 18 | „Pro Grad kälter ... etwa 49 TWh mehr entnommen (95-Prozent-Konfidenzintervall: 17 bis 81). 61 Prozent der Schwankung gehen mit der Wintertemperatur einher.“ | [1], Analysebericht (−49,1; −81,0 bis −17,2; R² 0,61) | bestätigt | Formulierung „gehen ... einher“ wie [1] (Validierung V12). |
| 19 | „Rechnerisch wird die Marke von 136 TWh ab einem Winterhalbjahr unter 4,5 °C erreicht. Kälter waren 60 Prozent der letzten dreißig Winter.“ | [1], Analysebericht (Schwelle 4,49 °C, deskriptiv) | bestätigt | „Marke 136“ meint hier die Entnahme, die Grafik/Medien nutzen 136 als Speicherstand; im Text nicht verwechselt. |
| 20 | „Für einen durchschnittlich kalten Winter (4,21 °C) erwarten wir rund 150 TWh Entnahme. Das Prognoseintervall reicht von 69 bis 230 TWh und schließt die 136 ein. Ein belastbares ‚reicht nicht‘ ... ‚reicht‘ allerdings auch nicht.“ | [1], Analysebericht | bestätigt, mit Hinweis | Der Zusatz in [1] „(kälter als der Schnitt des letzten Jahrzehnts)“ entfällt. A6. |
| 21 | „Die Speicher deckten im Median nur 19 Prozent des deutschen Gasverbrauchs (zuletzt 612 TWh im Winterhalbjahr).“ | [1], Analysebericht (19 %; 612), CSV (612; Median der zehn Anteile liegt rechnerisch bei 19,5 %) | bestätigt | Zahl wie in [1]. |
| 22 | „Der größere Teil wird laufend geliefert. Ob es eng wird, entscheiden also auch Importmengen, Preise und Kältewellen“ | [1], [2] | bestätigt, mit Hinweis | „laufend geliefert“ steht in [2] („weitaus größere Teil“), im Kapitel mit [1] belegt. Verweis [2] ergänzen (E2). |

### 2.4 Der Stand im Oktober

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 23 | „Am 16. Oktober ... zu 60,5 Prozent gefüllt ... 149,62 TWh, und nach Angaben der Behörde deutlich weniger als in den Vorjahren [2][4]“ | [2], BNetzA-Seite | bestätigt (Quelle [2]); Linkziel verändert | Die BNetzA-Seite zeigt am 23.10. die Lagebewertung vom 23.10.2026 (61,1 %, 151,1 TWh); der 16.10.-Stand ist über den Link nicht mehr abrufbar. „deutlich niedriger als in den Vergleichszeiträumen vergangener Jahre“ steht weiter dort. A10. |
| 24 | „Die Werte sind um einen Datenfehler auf der Plattform AGSI bereinigt und können sich durch Nachmeldungen noch ändern [2][4][5].“ | [2], Quelle [5] („rückwirkend ändern“) | bestätigt | Aktuelle Seite [4]: Datenübermittlung „aktuell unvollständig“; [5] bestätigt Nachmeldungen. |
| 25 | „Bis zum 1. November sollen die meisten Speicher zu 80 Prozent gefüllt sein, sechs Speicher (darunter Rehden) zu 45 Prozent. Die Ziele gelten je Speicher.“ | [2], [5] | bestätigt | [5] live: 80 % für alle als Standard; 45 % für Bad Lauchstädt, Frankenthal, Hähnlein, Rehden, Stockstadt, Uelsen. |
| 26 | „Das Erreichen der Füllstandsziele sei ... ‚nicht zwingend‘, die Versorgungssicherheit sei gewährleistet. Sie rechnet allerdings mit einem vergleichsweise niedrigen Füllstand am Ende des Winters.“ | [2], BNetzA-Seite live | bestätigt | Seite: „nicht zwingend“; „Ein vergleichsweise niedriger Speicherfüllstand am Ende des Winters ist wahrscheinlich.“ „Versorgungssicherheit gewährleistet“ in der abgerufenen Seitenfassung nicht erneut gesehen (nur über [2]/frühere Prüfung). |
| 27 | „Mit knapp 150 TWh liegt der Speicherinhalt über dem Median der Winterentnahmen und in der Größenordnung der erwarteten Entnahme eines durchschnittlich kalten Winters. Das ist ein Vergleich mit schon veröffentlichten Werten, keine neue Rechnung und keine Prognose. Er hat Grenzen: Bestand an einem Stichtag, Entnahme eine Menge über den ganzen Winter ...“ | [2] | bestätigt | Wörtlich nach [2]; Bestand-/Fluss-Einschränkung vorhanden. „Größenordnung“ statt „Erwartung gleich“ ist hier korrekt (vgl. Nr. 4). |
| 28 | „Für einen sehr kalten Winter (2,69 °C, das 10. Perzentil der letzten dreißig Jahre) geben wir bewusst keine Erwartung an ... Monatsdaten glätten außerdem kurze Kältewellen ... Zu Importen und Preisen haben wir nichts untersucht.“ | [1], [2], Analysebericht | bestätigt | Fit-Bereich 3,75–6,18 °C. |

### 2.5 Strom: Dunkelflaute und Batterien

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 29 | Fremdzahlen: „2 Prozent des Tagesverbrauchs“, „durchschnittlich 2,3 Stunden Speicherdauer“, Studie mit 300 GWh bis 2050 = 1 Prozent des Bedarfs, Fraunhofer: 20 GW zusätzliche Flexibilität entlasten um 5,6 Mrd. €, „rund drei Millionen Zwei-Personen-Haushalte einen Tag lang“ | [3] Einleitung | bestätigt | Alle fünf Zahlen wie in [3]; Spiegel nicht genannt (zulässig). |
| 30 | „Die erste dieser Zahlen („2 Prozent“) konnten wir keinem Artikel eindeutig zuordnen und kennzeichnen sie deshalb als nicht belegt [3].“ | [3] Fußnote 1 (live geprüft 23.10.) | **Abweichung (gewichtig)** | Fußnote 1 in [3] hängt an der Zahl **„300 GWh Speicherkapazität bis 2050 / 1 %“**, nicht an „2 %“. „2 % des Tagesverbrauchs“ ist in [3] mit einem Link (edison.media) belegt, „2,3 Stunden“ mit blackout-news.de. Der Fehler steht dreifach im Kapitel (Z. 45, Z. 69) und in `gliederung_kap01-06.md` (Z. 73). A1. |
| 31 | „Wir haben deshalb selbst gerechnet, aus amtlichen Rohdaten und mit vorab festgelegtem Analyseplan. Aus den SMARD-Zeitreihen ... alle Dunkelflauten seit 2015“ | [3] | bestätigt | Dunkelflaute: unter dem 10. Perzentil, mindestens drei Tage (run_log). |
| 32 | „Dann haben wir ausgerechnet, wie viel Energie in jeder dieser Phasen gefehlt hat“ | [3] („Energiedefizit ... Summe aus Verbrauch minus Wind- und Solarerzeugung“) | Abweichung (mittel) | „gefehlt“ legt eine nicht gedeckte Nachfrage nahe. Das Defizit ist Verbrauch minus Wind und Solar; es wurde in Wirklichkeit durch andere Quellen und Importe gedeckt. [3] sagt das selbst („ein Teil ... faktisch importiert“). Gleiche Formulierung in Z. 49 („fehlende Energiemenge“) und Grafik 2 (Achse „Fehlende Energie“). A3. |
| 33 | „mit realistischen Annahmen zu Ladezustand und Wirkungsgrad“ | [3], run_log/Disclaimer (80 % Anfangsladezustand, 92 % Entlade-, 85 % Rundtrip-Wirkungsgrad) | bestätigt | |
| 34 | „Zwischen Januar 2015 und Juli 2026 haben wir 50 solcher Episoden gefunden.“ | [3], run_log (Zeitraum 2015-01-01 bis 2026-07-31; 50) | bestätigt | Letzte Episode laut CSV im Dezember 2025; in 2026 keine. |
| 35 | Median 4.301 GWh; „Interquartilsabstand 3.921 bis 5.994 GWh“; kleinste „rund 3.000“, größte „rund 14.800“ | [3], run_log (4301,35; 3921,05–5994,37; 2997,67; 14784,41), CSV | bestätigt | „Interquartilsabstand“ bezeichnet hier die Quartilsgrenzen (wie in [3]). |
| 36 | „Die installierte Batteriekapazität liegt bei 31,5 GWh.“ | [3] („bereinigte Kapazität 31,5 GWh“), run_log (31,472) | Abweichung (gering) | Das Kapitel nennt hier „installierte“ ohne „bereinigt“; die Bereinigung folgt erst in Z. 55. Die Zahl ist ein nachträglich bereinigter Wert aus dem MaStR (Stand 31.08.2026). A2. |
| 37 | „Damit hätte sie im Median etwa 1 Prozent des Defizits decken können (ungerundet rund 0,5 Prozent, über alle 50 Episoden zwischen 0 und 1 Prozent).“ | [3], run_log | bestätigt | Gleichlautend mit [3]. Plausibilitätsrechnung: 0,5 % Median stimmt (siehe Nr. 6). „zwischen 0 und 1 Prozent“ ist die ganzzahlige Rundung (Einzelwerte liegen nach eigener Überschlagsrechnung etwa zwischen 0,2 und 0,8 %). |
| 38 | „Für die Ende 2026 erwartete Kapazität (rund 35 GWh, eine Schätzung des Branchendienstes IWR und keine amtliche Zahl) ergibt sich dieselbe Größenordnung.“ | [3] („ähnliche Größenordnung (Median rund 0,6 %)“), run_log (0,60) | bestätigt, mit Hinweis | [3] sagt „ähnliche“; „dieselbe“ ist etwas stärker. Median 0,60 %, min 0,17, max 0,86 laut run_log. Vorschlag „ähnliche“ (A12). |
| 39 | „Erstens ... 50 von 2,72 Millionen Anlagen verursachten 97,25 Prozent einer sonst 46-fach überhöhten Summe. Wir haben Einzelanlagen über 100 MWh entfernt. ... nicht im Analyseplan vorgesehen und so gewählt, dass sie nahe an zwei unabhängigen Quellen liegt (BVES: 24 GWh, IWR: rund 35 GWh). Das ist ein Risiko für eine Verzerrung“ | [3] Blockzitat, run_log (2.724.033; 97,25 %; 31,472 GWh), Pflicht-Disclaimer | bestätigt, mit Hinweis | Zahlen stimmen. Der Pflicht-Disclaimer nennt das ausdrücklich „Confirmation-Bias-Risiko“ und „nicht technisch/unabhängig begründet, sondern gezielt so gewählt“; das Kapitel schwächt zu „Risiko für eine Verzerrung“ ab. Nicht genannt: Entscheidung durch Daniel Saure am 31.08.2026 (in [3] genannt). E3. |
| 40 | „Zweitens liegt das Ergebnis über acht Sensitivitätsanalysen zwischen 0 und 1 Prozent, die Größenordnung ist also stabil.“ | [3] („In praktisch allen Varianten ... zwischen 0 % und 1 %“), run_log (S1–S7, S9 alle 0–1 %) | Abweichung (gering) | „praktisch“ aus [3] fehlt; „stabil“ ist [3]-nah („bemerkenswert stabil“). Dass die acht Analysen die Definition, die Mindestdauer, Systemgrenzen, Leistungskappung, Ladezustand und Wirkungsgrad variieren, aber nicht die Post-hoc-Kapazität (S9 ist nur eine Kreuzprüfung), bleibt offen. A12. |
| 41 | „Importe sind im Energiedefizit nicht berücksichtigt. Ein Teil des historischen Defizits wurde in Wirklichkeit eingeführt.“ | [3] | bestätigt | |
| 42 | „Eine Nachlade-Simulation ... haben wir angekündigt, aber bisher nicht abgeschlossen. Bis dahin ist der Deckungsgrad eher eine zu niedrige Näherung.“ | [3], run_log (S8 „noch ausstehend“) | bestätigt | Im Repo kein S8-Ergebnis (run_log SAP 6, S8). |
| 43 | „Für 2030 fanden wir keine amtliche Zahl ... Wir haben auch keine Fremdzahl als Ersatz genommen. Und die Rechnung bewertet nicht, ob Batterien die richtige Antwort ... auch nicht im Vergleich zu Gaskraftwerken, Importen oder Wasserstoff.“ | [3], run_log (3c), Pflicht-Disclaimer | bestätigt | |
| 44 | Fehlt: Pflicht-Disclaimer Nr. 3 („Dunkelflaute-Definition ist eine methodische Festlegung mit Ermessensspielraum“) und Nr. 2 (keine Motivzuschreibung) | `pflicht_disclaimer.txt`, [3] | Abweichung (gering) | Nr. 3 steht in [3], im Kapitel fehlt der Hinweis. A12. |

### 2.6 Was heißt das für dich? (neu)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 45 | „Ein Füllstand in Prozent ist nur eine Zahl von vielen. Wichtiger sind die Menge in Terawattstunden, die Temperatur im Winter und die laufenden Lieferungen. Und der Stichtag, denn die Zahlen ändern sich ständig.“ | [2], [5] | Abweichung (gering) | „Wichtiger“ ist ein Vergleich, den [2] so nicht trifft („zählt aber etwas anderes“); „ständig“ ist stärker als „können sich durch Nachmeldungen rückwirkend ändern“ ([5]). Keine Handlungsempfehlung enthalten (Gliederungsregel erfüllt). A11. |
| 46 | „Ein einzelner Winter ist ein schwacher Vergleichsmaßstab. Die Entnahme schwankt zwischen 42 und 178 Terawattstunden.“ | [1] („der schwächst mögliche Maßstab“) | bestätigt | |
| 47 | „Aus unserer Rechnung folgt weder ‚Batterien lösen die Dunkelflaute‘ noch ‚Batterien sind nutzlos‘. Sie zeigt nur: Die heute installierte Kapazität hätte vergangene Dunkelflauten nur zu rund einem Prozent abdecken können.“ | [3] („Der berechnete Deckungsgrad ist eine rein deskriptive Kennzahl“, „bewertet nicht, ob ... richtige Antwort“), Pflicht-Disclaimer | bestätigt, mit Hinweis | Die Abgrenzung ist durch [3] und den Disclaimer gedeckt. Zahl wie Nr. 6 (ohne Einschränkungen „Median“, „bereinigte Kapazität“, „ohne Nachladung“). A2. |

### 2.7 Lagen wir richtig? (neu)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 48 | „Wir haben unsere Erwartung am 22. Oktober 2026 im Prognose-Register festgelegt (Eintrag #1): rund 150 TWh Entnahme in einem durchschnittlich kalten Winter, mit einem Intervall von 69 bis 230.“ | Register #1 (V2) | Abweichung (mittel) | Datum, 150 TWh und 69–230 stimmen mit V2. Die **maßgebliche** Registrierung ist aber V1 (temperaturbereinigt: tatsächliche Entnahme liegt bei der tatsächlichen Wintertemperatur im zugehörigen 95-%-Prognoseintervall; nicht bewertet, wenn die Temperatur außerhalb 3,75–6,18 °C liegt). Das Register sagt: „Maßgeblich für die Bewertung ist deshalb V1.“ Das Kapitel nennt nur V2, wodurch der Leser „Entnahme zwischen 69 und 230“ als Bewertungsmaßstab versteht. A4. |
| 49 | „Die Auswertung kommt, sobald Eurostat die Werte bis März 2027 veröffentlicht, voraussichtlich im Mai oder Juni 2027. Einen Zwischenstand zur Entnahme gibt es nicht.“ | Register #1 | bestätigt | |
| 50 | „Bei der Registrierung war der Winter schon drei Wochen alt, der Füllstand von 60,5 Prozent war bekannt (siehe Kapitel 10).“ | Register #1 (Offenlegung) | bestätigt | Register: Entnahmedaten seit Oktober nicht ausgewertet; Füllstand ein Bestand, keine Entnahme. |
| 51 | „Gas, Stand Oktober: Die Zahlen ... stammen vom 16. Oktober. Einen neueren Füllstand nehmen wir nur mit Quelle und Datum auf.“ | Gliederung (Redaktionsregel) | nicht prüfbar / redaktionell | Keine Tatsachenaussage zu 2026, sondern eine Absichtserklärung der Redaktion; in „Lagen wir richtig?“ wirkungslos. Die Quellseite zeigt inzwischen 61,1 % / 151,1 TWh (23.10.). E4. |
| 52 | „Strom, offen: Die Nachlade-Simulation fehlt noch. Die nachträgliche Datenbereinigung bleibt ein Risiko für eine Verzerrung. Und die „2 Prozent“ aus der Debatte konnten wir nicht belegen.“ | [3], run_log | Abweichung (gewichtig) | Die ersten zwei Sätze stimmen. Der dritte gibt dieselbe Fehlzuordnung wie Nr. 30 wieder (nicht belegt ist „300 GWh / 1 %“). A1. |

### 2.8 Woher wir das wissen und Quellenliste

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 53 | Gas: Eurostat nrg_cb_gasm, DWD Gebietsmittel, Winter 2016/17–2025/26, Oktober–März; Plan vor Datenzugriff eingefroren; Abweichungen (Python statt R, Gradtagzahlen nicht durchgeführt, Speicherkapazität je Winter nicht in den Daten) | [1] Fußzeile, Analysebericht, Validierungsbericht | bestätigt | Offene Validierungsauflage zu DWD-Originaldateien (Abschnitt 6) wird im Kapitel nicht erwähnt. |
| 54 | Strom: SMARD (Viertelstundenwerte seit 2015), MaStR Stand 31.08.2026, IWR und BVES als Sekundärquellen | [3] | bestätigt | |
| 55 | Repo-Ordner `Analysen/2026-09-gasspeicher-winter/` und `Analysen/2026-08-batteriespeicher-dunkelflaute/` mit Plänen, Code, Tabellen, Validierungsberichten | GitHub live | bestätigt | Batterie-Ordner: SAP, `Validierungsbericht.md`, `Validierungsbericht_Nachkontrolle.md`, R-Code, `output/`, `rohdaten/` sichtbar. Gas-Ordner: Analyse- und Validierungsbericht lokal bestätigt; nicht auf GitHub geöffnet. |
| 56 | Quellen [1], [2], [3]: Titel, Datum, URL | Referenzfassungen | bestätigt | Titel und Datum stimmen. |
| 57 | Quelle [4]: „Aktuelle Lage der Gasversorgung in Deutschland, Lagebewertung vom 16.10.2026“, https://www.bundesnetzagentur.de/gasversorgung | BNetzA live | Abweichung (gering) | Die URL zeigt heute die Lagebewertung vom 23.10.2026. Wer dem Link folgt, findet nicht die zitierte Fassung. A10. |
| 58 | Quelle [5]: „Verlauf der Speicherfüllstände in Prozent (mit Füllstandsvorgaben ...)“ | BNetzA live | bestätigt | Seitentitel stimmt; Seite laufend aktualisiert. |
| 59 | Quelle [6]: Eurostat nrg_cb_gasm; DWD CDC | – | Abweichung (gering) | Keine URL, kein Abrufdatum. A10. |
| 60 | Quelle [7]: Prognose-Register Eintrag #1, `Prognose-Register/01_gasspeicher-winter-2026-27.md` | Repo, GitHub | bestätigt | Datei im öffentlichen Repo sichtbar. |
| 61 | Quellen [8], [9]: SMARD-Download, MaStR | [3] | bestätigt | Gleiche URLs wie in [3] (SMARD ohne Schrägstrich am Ende). |

## 3. Grafiken

### 3.1 Grafik 1: `kap02_grafik1_gas_entnahme.png` („Die Winter-Entnahme schwankt stark“)

| Nr. | Element | Quelle / Befund | Ergebnis | Hinweis |
|---|---|---|---|---|
| G1 | Zehn Balken 2016/17 bis 2025/26 mit Beschriftung 155,0; 161,5; 42,0; 64,4; 178,0; 110,6; 78,9; 74,6; 163,2; 133,7 | `tabelle1_winter.csv` (Zeilen 2016/17–2025/26, identisch) | bestätigt | Das Skript liest die CSV direkt (`stopifnot(nrow == 10)`), keine Handeingabe. |
| G2 | Blauer Balken 2025/26 (133,7) | CSV, [1] | bestätigt | |
| G3 | Gestrichelte Linie „Median der zehn Winter, 122 TWh“ | [1] (122), CSV (122,15) | bestätigt | Im Skript fest bei 122 gezeichnet; keine neue Rechnung. |
| G4 | Orange Linie „136 TWh, Speicherstand Mitte September 2026 (laut Medienberichten)“ | [1] | bestätigt, mit Hinweis | Ein Bestand ist als Linie durch Entnahmebalken gezeichnet (Größenart wechselt). Gekennzeichnet in der Legende der Grafik („Speicherstand ... laut Medienberichten“), in der Quellenzeile („Die 136 TWh sind ein Speicherstand, keine Entnahme“) und in der Bildunterschrift (Z. 23). Das ist deutlich genug; ein Rest-Risiko bleibt, dass Betrachter die Linie als Entnahme-Schwelle lesen. E5. |
| G5 | Titel „Die Winter-Entnahme schwankt stark“ | CSV (42–178) | bestätigt | „stark“ durch die Spannweite gedeckt. |
| G6 | Achse, Einheit, Quelle, Datenstand | Bild, Skript | Abweichung (gering) | Einheit TWh, Quelle Eurostat vorhanden. Datenstand fehlt (Eurostat-Update 08.09.2026; `stilregeln.md`: „Datenstand“ je Grafik). A13. |
| G7 | Lesbarkeit | Bild | bestätigt, mit Hinweis | Die Beschriftung „133,7“ wird von der orangen Linie berührt; die beiden Legendezeilen oben liegen auf der 200er-Gitterlinie. Gestalterisch. |
| G8 | Bildunterschrift Z. 23 | Grafik, [1], [6] | bestätigt | „Dargestellt sind vorhandene Zahlen, keine neue Rechnung“ stimmt (Skript Z. 26–48). |

### 3.2 Grafik 2: `kap02_grafik2_dunkelflaute_batterie.png` („Gegen die Dunkelflauten wirkt die heutige Batteriekapazität klein“)

| Nr. | Element | Quelle / Befund | Ergebnis | Hinweis |
|---|---|---|---|---|
| G9 | 50 Balken, Höhe = Energiedefizit je Episode | `tabelle1_episodenliste.csv` (50 Zeilen), run_log | bestätigt | Skript liest die CSV (`stopifnot(nrow == 50)`). Im Bild stimmen Spitzen und Tiefstwerte (Episode 17 ≈ 14.800 im Januar 2017; Episode 47 ≈ 3.000 im Dezember 2024; erste Episoden ≈ 12.300/11.000/7.100). |
| G10 | Gestrichelte Linie „Median der Episoden, 4.301 GWh“ | run_log (4301,35) | bestätigt | |
| G11 | Blaue Linie „installierte Batteriekapazität (bereinigt), 31,5 GWh“ | run_log (31,472) | Abweichung (gering) | Zahl und Zusatz „bereinigt“ stimmen. Die Linie liegt bei 0,2 % der Achse und wirkt wie eine verdickte x-Achse; das Etikett steht weit oben rechts, ohne Pfeil oder Hinweis auf die Position der Linie. Die Proportion ist ehrlich, aber nicht ausreichend erklärt. A5. |
| G12 | Achsenbeschriftung „Fehlende Energie in der Episode (GWh)“ | [3] | Abweichung (mittel) | Siehe Nr. 32: Das Defizit ist Verbrauch minus Wind- und Solarerzeugung, nicht unversorgte Last. A3. |
| G13 | x-Achse „Jahr der Dunkelflaute (Beginn der Episode)“, Beschriftungen 2015, 2016, 2017, 2018, 2019, 2021, 2022, 2023, 2025 | CSV (Episoden auch 2020: 3, 2024: 3) | Abweichung (gering) | Die Jahre 2020 und 2024 fehlen als Beschriftung (überlappende Marken, vom Plot unterdrückt); Balken stehen im gleichen Abstand je Episode, die Achse ist also keine Zeitachse. Untertitel „2015–2026“, die letzte Episode liegt im Dezember 2025. A5. |
| G14 | Titel „... wirkt die heutige Batteriekapazität klein“ | [3] („rein deskriptive Kennzahl“) | Abweichung (gering) | „klein“ ist eine Wertung. Sie ist durch das Verhältnis (31,5 GWh gegenüber Median 4.301 GWh, etwa 0,7 %; im Deckungsgrad ≈ 0,5 %) gedeckt, aber das Kapitel sagt im Text ausdrücklich „keine Bewertung von Batterien“ (Disclaimer 1). Vorschlag: datengebunden, z. B. „Die heutige Batteriekapazität liegt weit unter dem Energiedefizit einer Dunkelflaute“. A5. |
| G15 | Quellenzeile „Quelle: SMARD ..., Marktstammdatenregister (Stand 31.08.2026, nachträglich bereinigt) ... Kapazität nicht eins zu eins nutzbar, Importe nicht berücksichtigt.“ | [3], Disclaimer | bestätigt | Die drei Einschränkungen stehen im Bild; „ohne Nachladung“ fehlt. |
| G16 | Neue Rechnung in der Grafik? | Skript Z. 50–73 | bestätigt (keine) | Feste Zahlen 4.301 und 31,5; sonst CSV. Es wird die Nennkapazität 31,5 GWh gezeichnet, nicht die nutzbare (80 % × 92 %); Bildunterschrift Z. 53 sagt das. |
| G17 | Bildunterschrift Z. 53 | Grafik, [3], [8], [9] | bestätigt, mit Hinweis | „Die Kapazität ist nicht eins zu eins nutzbar (Ladezustand, Wirkungsgrad), der Deckungsgrad im Text berücksichtigt das.“ ist durch [3] (Methodik-Box: 80 % × 92 %) gedeckt. Quellen [3][8][9] richtig. |

## 4. Auflagen (vor Freigabe zu erfüllen)

Reihenfolge nach Gewicht. Keine Änderung wurde in der Datei vorgenommen.

1. **A1 (gewichtig), Z. 45 und Z. 69 (und `gliederung_kap01-06.md` Z. 73):** Die Kennzeichnung „nicht belegt“ hängt an der falschen Zahl. In [3] (Fußnote 1, live geprüft) gilt sie der Zahl „300 GWh bis 2050 = 1 Prozent“. Z. 45: „Die erste dieser Zahlen („2 Prozent“) konnten wir keinem Artikel eindeutig zuordnen und kennzeichnen sie deshalb als nicht belegt [3].“ ersetzen durch „Die Studie mit den 300 GWh bis 2050 konnten wir keinem Artikel mehr eindeutig zuordnen und kennzeichnen diese Zahl deshalb als nicht belegt; die anderen vier Zahlen stammen aus verlinkten Quellen [3].“ Z. 69: „Und die „2 Prozent“ aus der Debatte konnten wir nicht belegen.“ ersetzen durch „Und die Zahl zur Studie mit 300 GWh bis 2050 konnten wir keiner Quelle eindeutig zuordnen.“ Gliederung Z. 73 entsprechend korrigieren.
2. **A2 (mittel), Z. 5 („Kurz gesagt“), Z. 49, Z. 63:** Die Strom-Aussage trägt die Einschränkungen nicht, die der Pflicht-Disclaimer „prominent“ verlangt. Vorschlag Z. 5: „Beim Strom hätten die heute installierten Batteriespeicher in unserer Rechnung die Dunkelflauten seit 2015 nur zu rund 0,5 bis 1 Prozent abdecken können (mit nachträglich bereinigten Kapazitätsdaten, ohne Nachladung und ohne Importe).“ Z. 63 entsprechend („im Median“, „in unserer Rechnung“). Z. 49: „Die installierte Batteriekapazität liegt bei 31,5 GWh“ ersetzen durch „Die bereinigte Batteriekapazität liegt bei 31,5 GWh (Marktstammdatenregister, nach der Bereinigung, siehe unten)“.
3. **A3 (mittel), Z. 47, Z. 49, Grafik 2 (Achse und Alt-Text):** „wie viel Energie ... gefehlt hat“, „fehlende Energiemenge“, „Fehlende Energie in der Episode“ ersetzen durch „Energiedefizit“ mit Erklärung, z. B. Z. 47: „Dann haben wir ausgerechnet, wie viel Energie in jeder dieser Phasen nicht aus Wind und Sonne kam (Verbrauch minus Wind- und Solarerzeugung) und anderweitig gedeckt werden musste.“ Achse: „Energiedefizit je Episode (Verbrauch minus Wind und Solar, GWh)“.
4. **A4 (mittel), Z. 67:** Register-Eintrag vollständig wiedergeben: „Maßgeblich ist, ob die tatsächliche Entnahme bei der tatsächlichen Wintertemperatur im zugehörigen 95-Prozent-Prognoseintervall liegt (V1). Liegt die Temperatur außerhalb von 3,75 bis 6,18 °C, bewerten wir nicht. Die vereinfachte Lesart: rund 150 TWh bei einem durchschnittlich kalten Winter, Intervall 69 bis 230 (V2).“
5. **A5 (gering bis mittel), Grafik 2 (neu zu rendern):** (a) Blaue Linie direkt beschriften (Pfeil oder Etikett an der Linie: „Batteriekapazität 31,5 GWh (bereinigt) – Linie liegt knapp über der Nulllinie“). (b) Titel datengebunden statt „klein“ (siehe G14). (c) Alle Jahre mit Episoden auf der x-Achse beschriften (2020, 2024 fehlen) und die Achse als „Episode, nach Beginn sortiert“ kennzeichnen. (d) Untertitel „2015–2026“ durch „Januar 2015 bis Juli 2026 (letzte Episode Dezember 2025)“ präzisieren.
6. **A6 (gering bis mittel), Z. 5 und Z. 27:** Z. 5 „Das ist ungefähr so viel, wie in einem durchschnittlich kalten Winter entnommen wird.“ ersetzen durch „Das ist ungefähr so viel, wie man für einen durchschnittlich kalten Winter an Entnahme erwartet (mit einer großen Spanne, siehe unten).“ Z. 27 ergänzen: „durchschnittlich kalt“ bezieht sich auf die Norm der letzten dreißig Winter, die kälter ist als der Schnitt des letzten Jahrzehnts [1].
7. **A7 (gering bis mittel), Z. 19:** „In vier von zehn Wintern lag die Entnahme über 136 [1].“ ergänzen: „(95-Prozent-Konfidenzintervall dieser Quote: 12 bis 74 Prozent; bei zehn Wintern taugt die Zahl als Größenordnung, nicht als Prognose)“.
8. **A8 (gering), Z. 9–10:** Die INES-Aussage ebenfalls kennzeichnen: „(Die Angaben zu INES und das Zitat von Herrn Müller stammen aus Medienberichten bzw. aus unserem Evidenzcheck [1]; eine Primärquelle der Bundesnetzagentur oder von INES lag uns nicht vor.)“ und „Das Zitat“ durch „Die Aussage“ ersetzen, solange kein wörtliches Zitat im Text steht.
9. **A9 (gering), Z. 11:** „Beide Seiten haben Interessen. ... Uns interessiert deshalb etwas anderes“ ersetzen durch „Die Bundesnetzagentur ist für die Versorgungssicherheit verantwortlich, INES vertritt die Speicherbetreiber. Uns interessiert etwas anderes: Müller vergleicht mit genau einem Winter.“ (wie [1]).
10. **A10 (gering), Z. 33 und Quellen [4], [6]:** [4] mit Abrufdatum und Hinweis versehen: „Lagebewertung vom 16.10.2026; die Seite wird laufend aktualisiert, abgerufen am 16.10.2026“ (heute zeigt sie die Lagebewertung vom 23.10.2026). [6]: URLs und Abrufdatum für Eurostat (nrg_cb_gasm) und DWD ergänzen.
11. **A11 (gering), Z. 5 und Z. 61:** Z. 5: „Entscheidend sind die Menge, die Temperatur und die laufenden Lieferungen.“ → „Wichtig sind neben der Menge die Temperatur und die laufenden Lieferungen.“ Z. 61: „Wichtiger sind ...“ → „Zählen tut vor allem ...“ bzw. „Dazu zählen ...“; „denn die Zahlen ändern sich ständig“ → „denn die Zahlen werden laufend aktualisiert und können nachträglich korrigiert werden“ (nach [5]).
12. **A12 (gering), Z. 49 und Z. 55:** „dieselbe Größenordnung“ → „eine ähnliche Größenordnung“ ([3]); „über acht Sensitivitätsanalysen zwischen 0 und 1 Prozent“ → „in praktisch allen Varianten“ ([3]); im Block zu den Kapazitätsdaten ergänzen, dass die Schwelle „nicht technisch begründet“ ist („Confirmation-Bias-Risiko“, wie im Disclaimer) und dass die Dunkelflaute-Definition eine Festlegung mit Ermessensspielraum ist (Disclaimer 3, [3]).
13. **A13 (gering), Grafik 1:** Datenstand ergänzen („Eurostat-Daten, Stand 08.09.2026“); optional die 136-TWh-Linie auf der rechten Seite beschriften, damit sie nicht als Entnahme-Schwelle gelesen wird.

### Empfehlungen (nicht zwingend)

- **E1:** Z. 17 „Wer Müller vorwirft, ... liegt falsch“: wörtlich aus [1] übernommen; die Kritiker sind nicht benannt. Optional „Der Einwand, ... trägt nicht“.
- **E2:** Z. 29 „Der größere Teil wird laufend geliefert“ mit [2] statt nur [1] belegen.
- **E3:** Im Block zu den MaStR-Daten die Entscheidung vom 31.08.2026 (Daniel Saure) wie in [3] nennen.
- **E4:** Bullet „Gas, Stand Oktober“ (Z. 68) neu fassen oder streichen: Es ist keine Rückschau. Vorschlag: „Die BNetzA aktualisiert ihre Seite laufend; Stand dieses Kapitels ist der 16. Oktober.“ Neue Werte nur mit Quelle und Datum ergänzen und vor Druck (Stichtag 15.11.) prüfen.
- **E5:** Grafik 1: Orange Linie in anderer Linienart oder mit Rand zeichnen, um sie von den Entnahmebalken zu trennen.

## 5. Gesamturteil: **ok mit Auflagen**

Kein Punkt ist „kritisch“. Alle Kernzahlen des Gasteils (133,7; 42–178; 122; vier von zehn; 49 TWh/°C [17; 81]; 61 %; 4,5 °C; 60 %; 4,21 °C; 150 TWh [69; 230]; 19 %; 612; 60,5 %/149,62 TWh; 80 %/45 %) und des Stromteils (50 Episoden; 4.301; IQR; 3.000/14.800; 31,5; 50 von 2,72 Mio.; 97,25 %; 46-fach; 100 MWh; BVES 24, IWR 35) stimmen mit den Referenzfassungen, den Analyseunterlagen und, wo zugänglich, den Primärseiten überein. Die Gas-Zitate sind als Medienberichte gekennzeichnet, soweit es Müller betrifft. Es gibt keine neue Berechnung in Text oder Grafiken; die Grafikwerte stammen unverändert aus den CSV-Dateien.

Das Urteil lautet nicht „ok“, weil (1) die Kennzeichnung „nicht belegt“ an der falschen Fremdzahl hängt (A1, gewichtig, dreifach, auch in der Gliederung), (2) die Strom-Kernaussage in „Kurz gesagt“ und „Was heißt das“ ohne die vorgeschriebenen Einschränkungen (nachträgliche Bereinigung, ohne Nachladung, ohne Importe) und mit der gerundeten Zahl „etwa einem Prozent“ statt rund 0,5 % steht (A2), (3) „fehlende Energie“ eine nicht gedeckte Versorgungslücke nahelegt (A3), (4) der Registereintrag ohne die maßgebliche Bewertungsregel V1 wiedergegeben wird (A4) und (5) Grafik 2 Titel, Achse und Linie missverständlich beschriftet sind (A5).

Zahl der Auflagen: **13** (davon 1 gewichtig: A1; mittel: A2, A3, A4; A5, A6, A7 gering bis mittel; A8–A13 gering). Zusätzlich 5 Empfehlungen.

Eine Nachprüfung nach Einarbeitung ist als eigene Datei oder als „Nachtrag 1“ in dieser Datei festzuhalten (Dokumentationspflicht CLAUDE.md).

## 6. Was nicht geprüft werden konnte

- **DWD-Temperaturen (4,41; 4,21; 2,69; 30-Jahres-Perzentile):** Laut Analysebericht und Validierungsbericht wurden die DWD-Werte aus in den Chat eingefügtem Dateitext übernommen; der Abgleich mit den sechs Originaldateien war eine **offene Auflage** und ist in den vorliegenden Berichten nicht als erledigt dokumentiert. Ich habe die Werte nicht gegen den DWD-Server geprüft.
- **Eurostat-Rohdaten, SMARD, MaStR:** nicht direkt geöffnet; Prüfung über Analysebericht, run_log, CSV und Nachkontrolle des Validators.
- **Füllstände 55 % (Mitte September 2026) und 74 % (Vorjahr):** nur über [1]; kein Abgleich mit AGSI/BNetzA-Zeitreihe.
- **INES-Aussage (Szenario Wetterjahr 2010, zwei TWh pro Monat) und Müller-Zitat:** keine Primärquelle geöffnet (wie in [1]); nur die Kennzeichnung geprüft.
- **BNetzA-Seite [4]:** Aussage „Versorgungssicherheit gewährleistet“ und die Füllstandsziele im abgerufenen Seitentext nicht erneut gesehen (Textauszug abgeschnitten); die Füllstandsziele wurden über [5] bestätigt, die Versorgungssicherheit über [2] und den früheren Faktencheck (16.10.).
- **Erstvalidierungsbericht der Batterie-Analyse:** nur Nachkontrolle (FREIGABE) und Pflicht-Disclaimer gelesen; SAP, `Entscheidung_Estimand3a.md` und `Quellenexzerpte_Spiegel-Sieg-der-Sonne.md` nicht gelesen. Die Spiegel-Zahl („drei Millionen Haushalte“) wurde nur gegen [3] abgeglichen.
- **Gas-Ordner auf GitHub:** nicht geöffnet.
- **R-Skript `kap02_grafiken.R`** nicht ausgeführt (R nicht verfügbar): Die PNG-Dateien wurden visuell mit den Skript-Daten und CSV-Werten abgeglichen; dass das Skript genau diese Bilder erzeugt, ist nicht nachgewiesen. Alle 10 Balken (Grafik 1) wurden einzeln abgelesen; die 50 Balken in Grafik 2 stichprobenartig (Spitzen, Tiefstwert, erste Episoden), die Daten stammen unverändert aus der CSV.
- **Wortzahl und Umfang** (Gliederung: 1.300–1.700 Wörter): nicht gezählt.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A13 einarbeiten; Grafik 2 (A5, A3) und Grafik 1 (A13) neu rendern; Nachkontrolle als eigene Datei oder „Nachtrag 1“ festhalten.
2. `gliederung_kap01-06.md`, Kapitel 2, Z. 73 („2 %“-Zahl) korrigieren.
3. Kopfzeile (Z. 1), Herkunftstabelle (ab „## Herkunftstabelle“) und die Hinweise unter den Grafiken, soweit nicht Buchtext, vor Satz/Export entfernen; Wortzahl prüfen.
4. Offene Validierungsauflage der Gas-Analyse (DWD-Originaldateien) schließen und dateibasiert dokumentieren.
5. Stichtag 15.11.: BNetzA-Seite, Füllstand, Eurostat-Update, Prognose-Register-Eintrag #1 und Quelle [4] erneut abgleichen; entscheiden, ob ein neuerer Füllstand aufgenommen wird (nur mit Quelle und Datum).
6. Nachlade-Simulation (S8): Ergebnis liegt nicht vor; Kapitel bleibt bei „offen“, bis ein validiertes Ergebnis veröffentlicht ist.
7. Freigabevermerk erst nach Volltextlektüre durch Daniel Saure (`kapitelplan.md` Abschnitt 5, CLAUDE.md Verifikationspflicht). Diese Datei enthält keinen.
