# Faktencheck Nachpruefung 1: Prognose-Check #1, Artikelentwurf v0.2 (Substack)

Gepruefter Text: `Reports/2026-11-12-prognose-check/kanal-entwuerfe/substack.md` (v0.2, Kopfzeile traegt noch die Aufschrift "ENTWURF v0.1"). Der Artikel wurde nicht veraendert.
Gegenstand: Umsetzung der Befunde aus `Reports/2026-11-12-prognose-check/faktencheck.md` (H1-H4, M1-M8, G1-G6) und Deckung der neuen/geaenderten Saetze.
Pruefer: faktenpruefer-Subagent (unabhaengig), Stand 12.11.2026. Nicht neu geprueft wurde, was im Erstcheck ohne Beanstandung bestaetigt ist.
Geprueft gegen (unter `Analysen/2026-10-prognose-check-projektionsberichte/`): `Analysebericht_...md`, `Abweichungsprotokoll_...md`, `Validierungsbericht_...md` (inkl. Nachpruefung 1 und 2), `output/e1_ergebnisse.csv`, `e1_ist_im_sensitivitaetsband.csv`, `e1_sensitivitaetswerte_berichte_2020.csv`, `diag_leave_one_report_out.csv`, `e3_einzelwerte.csv`, `e3_kennzahlen.csv`. Quell-PDFs wurden nicht geoeffnet.

## Gesamturteil

**Bedingt: 0 kritisch, 1 hoch (Restbefund H2), 2 mittel (neu bzw. Rest), mehrere gering.** v0.2 hat die Zahlenfehler behoben (810 Mt, Band 2017, Spanne 9,5-12,2 %, MWMS-Medianwerte, Pruefsummen/EEA-Satz) und die meisten Formulierungsbefunde sauber umgesetzt. Nicht vollstaendig behoben ist die Ursachenzuschreibung zum Ausgangsjahrwert (H2): Der Satz enthaelt weiter "deshalb". Neu ist eine unpraezise Definition der MWMS-Differenz D. Beide sind Ein-Satz-Korrekturen. Vor Freigabe zur Veroeffentlichung: N1 und N2 beheben; H4 bleibt (wie angekuendigt) bis zur Textfreigabe durch Daniel Saure offen. Dieser Faktencheck ist keine Freigabe.

## Status der Befunde aus dem Erstcheck

| Befund | Status | Begruendung (Fundstelle v0.2 / Quelle) |
|---|---|---|
| H1 (810 statt 811) | behoben | Tabelle "Das Zieljahr 2020": 810 / 731 / 79 / 10,9 %. `e1_ergebnisse.csv`: P* = 810, E* = 79, RE* = 10,9. Hinweis: Die E1-Tabelle im Analysebericht (Abschnitt 4) nennt weiterhin 811 und weicht von ihrer eigenen CSV ab; Artikel ist korrekt, der Analysebericht sollte korrigiert werden (Rueckmeldung an analyst). |
| H2 (Ursachenzuschreibung Inventarrevision) | **nicht vollstaendig behoben** | Die Beispielzahlen (939/917) und die Grafik-Zuschreibung im Fliesstext sind weg, aber der Satz lautet weiter: "Das Umweltbundesamt rechnet die Inventarreihe jedes Jahr neu. Der Wert ... weicht deshalb vom heutigen Inventarwert desselben Jahres ab." "deshalb" ist eine Kausalaussage (Revision als Ursache). Belegt ist nur, dass die Werte im Ausgangsjahr abweichen (Faktoren 0,976-0,995, `umskalierungsfaktoren.csv`). Analysebericht Abschnitt 7: GWP-Basis der Berichte unterscheidet sich (SAR/AR4/AR5); S2 (Revisionswirkung) wurde nicht gerechnet; Abschnitt 3: Ursache fuer die Abfall-Abweichung ausdruecklich "nicht belegt". Widerspruch zum eigenen Limitationsabsatz bleibt bestehen. Siehe N1. |
| H3 (Auflagen "umgesetzt") | behoben | v0.2: "Auflagen, die wir umgesetzt oder mit Begruendung zurueckgestellt haben". Entspricht dem Wortlaut der Nachpruefung 1 des validators ("umgesetzt oder begruendet zurueckgestellt"). Der optionale Hinweis auf die vier hohen Befunde der Erstpruefung fehlt weiterhin (gering, siehe G-Tabelle). |
| H4 (Freigabevorwegnahme) | bekannt offen | Satz "Die Redaktion hat ... gelesen und freigegeben" steht weiter; im Kopf als erst nach Daniels Freigabe zutreffend vermerkt. Nicht als Fehler gewertet. Vor Veroeffentlichung muss die Textfreigabe als Datei vorliegen. |
| M1 (Pruefsummen/EEA) | behoben | Neu: "Die Rohdateien sind mit Pruefsummen gesichert" (68/68, Analysebericht Abschnitt 2) und "Gesamtwerte aus den PDF-Tabellen ... gegen die EEA-Datenbank abgeglichen. Das gilt nicht fuer das MWMS von 2015 und nicht fuer die von Hand uebertragenen Sensitivitaetswerte, die nicht doppelt uebertragen wurden." Gedeckt: Protokoll H6/H18 und Abschnitt D (Ausnahme MWMS 2015), Validierungsbericht Abschnitt 4 (EEA-Abgleich PB2017/2019/2021/2023 uebereinstimmend). Hinweise (gering): Beim PB2015 weichen 24 EEA-Zellen ab (SAR statt AR4, Validierung B8, 0,3 Prozentpunkte); "abgeglichen" darf nicht als "uebereinstimmend" gelesen werden. Der validator hat die Sensitivitaetsmengen in Nachpruefung 1 unabhaengig aus den PDFs bestaetigt (nur Wertemengen, nicht jede Namenszuordnung), der Satz "nicht doppelt uebertragen" ist daher wortwoertlich richtig, gibt aber den Stand eher zu schwach wieder. |
| M2 (Bullet 4 ohne Hinweis) | behoben | Bullet 4: "Das sagt nichts ueber die Qualitaet der Modelle, denn diese Rechnungen enthalten keine Krisen." Entspricht Analysebericht Abschnitt 4 (kein Pandemie- oder Krisenszenario, SAP 8.1). Hinweis: "denn" ist eine Begruendung, die der Analysebericht so nicht gibt (siehe M4). |
| M3 (Band 2017, Stromexport) | behoben | Siehe Pruefung unten (781 / 817 / 811; "je nach Bericht"). |
| M4 ("Energiekrise", "deshalb") | teilweise behoben | "Energiekrise" gestrichen; Wortlaut jetzt "Eine Pandemie war in diesen Rechnungen nicht vorgesehen" (gedeckt: Analysebericht Abschnitt 4 "kein Pandemie- oder Krisenszenario"). Aber "Dass der tatsaechliche Wert unter dem Band liegt, sagt deshalb nichts ueber die Qualitaet der Modelle" behaelt "deshalb" statt des SAP-Grundes (bedingte Rechnung; steht im Artikel bereits im Vorspann). Gering. |
| M5 (Zieljahre "nach Corona/Energiekrise") | behoben bzw. akzeptabel | v0.2: "mit Zieljahren von 2021 bis 2024, also aus der Zeit der Pandemiefolgen und der Energiekrise". "nach Corona" ist weg. Die Zeitzuordnung ist Aussenwissen, deckt sich aber mit Analysebericht Abschnitt 7 ("Phase nach Corona und Energiekrise") und Validierung L1(b). Gering: Zieljahr 2021 ist nach SAP 8.4 noch Corona-Zeit; neutrale Fassung ("2021 bis 2024") waere sicherer. |
| M6 (Kenntnis/"stark mitgepraegt") | behoben | "Kenntnis der Folgejahre" und "stark mitgepraegt" entfernt; Spanne 9,5-12,2 % genannt (gedeckt, siehe unten). |
| M7 (Ueberschrift/Legende Grafik 3) | Ueberschrift behoben; Legende bekannt offen | Neue Ueberschrift "Wie sich der Abstand aufbaut" ist neutral. Legende in der PNG-Datei: vereinbart offen, nicht als Fehler gewertet. |
| M8 (MWMS-Absatz) | teilweise behoben, neuer Befund | Satz "Das ist keine Rangfolge der Szenarien, nur ein Vergleich dieser fuenf Paare" ergaenzt; D definiert, aber unpraezise (siehe N2). Hinweis auf SAP 8.2 ("sagt nicht, ob die zusaetzlichen Massnahmen umgesetzt wurden", Analysebericht Abschnitt 4 E3) fehlt weiterhin (gering). |
| G1 (Amendments vor Fehlerberechnung) | nicht behoben | Weiterhin nur "bevor wir Daten ausgewertet haben ... danach zweimal ... ergaenzt". Gering. |
| G2 (PB2021 2020-Wert: RE* +0,2 %) | nicht behoben | Satz sagt nur "zaehlt nicht". Gering (Transparenz). |
| G3 (Zusatzrechnungen) | teilweise behoben | "16 zusaetzliche Vergleiche" statt "Zieljahre" korrigiert. S7 (MRE 12,9 %, n = 15), MdRE-Spalte fehlen weiter; "aendern das Bild nicht" bleibt eine Wertung. Gering. |
| G4 (Median bei Weglassen 2020) | nicht behoben | Median steigt von 12,6 auf 13,9 % (Analysebericht Abschnitt 6 Nr. 4); nicht im Artikel, "nur" bleibt. Gering. |
| G5 (Festlegungen H2, GCP) | nicht behoben | Gering, optional. |
| G6 (Kopf/Reihenname) | bekannt offen | Kopf nennt Namen und Chat-Zitat; vor Veroeffentlichung entfernen. |

## Pruefung der neuen/geaenderten Saetze

| Behauptung (Artikel v0.2) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| PB2017: Projektion 2020 (bereinigt) 810 Mt, Abstand 79 Mt, 10,9 % | `e1_ergebnisse.csv` (P_star 810, E_star 79, RE 10,9) | bestaetigt | Zeile rechnet intern auf (810 - 731 = 79). |
| Satz zum Ausgangsjahrwert: UBA rechnet jedes Jahr neu, Berichtswert weicht "deshalb" ab; Beispiel 2012 beim Bericht 2015 | `umskalierungsfaktoren.csv`, Analysebericht Abschnitt 3, 7, Protokoll H19 | **Abweichung** | Abweichung der Werte belegt (Faktor 0,976 fuer PB2015), Ursache nicht. "jedes Jahr neu" ist allgemeines Wissen, nicht in den Ergebnisdateien (nicht pruefbar). Siehe N1. |
| Faktor zwischen 0,976 und 0,995 fuer Gesamtemissionen | Analysebericht Abschnitt 3 (0,976 / 0,993 / 0,989 / 0,990 / 0,995) | bestaetigt | |
| Ohne Bereinigung im Mittel 12,1 % | Analysebericht Abschnitt 5 (S1) | bestaetigt | |
| "Auflagen, die wir umgesetzt oder mit Begruendung zurueckgestellt haben" | Validierungsbericht Nachpruefung 1, Abschnitt 4 ("umgesetzt oder begruendet zurueckgestellt") | bestaetigt | Auflagen mit "bewusst unveraendert" (B1/B2, Entscheidung Daniel 11.11.) und S2 (B5, nicht nachgeholt, als Unterlassung benannt) fallen unter "zurueckgestellt". |
| Beispiel 1: "zweite, unabhaengige Uebertragung der Sektorwerte" zurueckgestellt | Validierung B2(d), Nachpruefung 1 (B2: "bewusst unveraendert"), Protokoll H6 ("nicht behebbar im analyst-Lauf", Daniel 11.11. bestaetigt) | bestaetigt | Gering: Der Artikel erklaert nicht, was "Sektorwerte" sind (Sektoren kommen im Artikel sonst nicht vor, nur "Verzicht auf Sektoranhang" im Kopf) und nennt fuer dieses Beispiel keine Begruendung im selben Absatz. Streng genommen war H6 eine zu entscheidende Festlegung, keine blosse Auflage; die Lesart "zurueckgestellt" ist vertretbar. |
| Beispiel 2: "Rechnung mit der ersten Inventarversion" zurueckgestellt | Validierung B5, Nachpruefung 1 (B5 "teilweise: Begruendung korrigiert, S2 nicht nachgeholt", "vertretbar"), Protokoll H5/H21 | bestaetigt | Begruendung (Versionen nicht beschafft, "erste" nicht eindeutig) steht im Abschnitt "Was diese Analyse nicht sagt" und entspricht H21. Der validator nennt den Grund eine Unterlassung; der Artikel sagt offen "nicht beschafft". |
| PB2017-Band: niedrigster Wert 781 Mt unbereinigt aus Stromexport-Rechnung, vom Bericht fuers MMS aus dem MWMS uebernommen | `e1_sensitivitaetswerte_berichte_2020.csv` (780,6, Zeile "fuer MMS aus MWMS uebernommen, Fussnote 3 Tab. 1-4"), Analysebericht Abschnitt 4 | bestaetigt | Fussnote 3 selbst nicht geprueft (auch nicht vom validator, Nachpruefung 1 Abschnitt 4); Aussage beruht auf dem Analysebericht. |
| Ohne ihn Minimum 817 Mt unbereinigt (bereinigt 811 Mt), Aussage gleich | CSV (verbleibende Sensitivitaeten 829,1 / 826,9 / 816,9), Faktor 0,993: 816,9 x 0,993 = 811,2; Analysebericht ("816,9, bereinigt 811") | bestaetigt | Die Referenzzeile MMS (816,4) ist laut `e1_ist_im_sensitivitaetsband.csv` (anzahl_sensitivitaeten = 4) nicht Teil des Bandes; konsistent mit dem Analysebericht. |
| Band 775-823 (2017) bereinigt; Abstaende 74/44/83 | `e1_ist_im_sensitivitaetsband.csv` (775,1-823,3; 74,3/44,2/82,8) | bestaetigt | Unveraendert zum Erstcheck. |
| Sensitivitaeten variieren "Wirtschaftswachstum, Bevoelkerung, Preise und, je nach Bericht, den Stromexport" | `e1_sensitivitaetswerte_berichte_2020.csv` | bestaetigt | Stromexport nur PB2015 und PB2017; PB2019 hat drei Sensitivitaeten ohne Stromexport. Namenszuordnung laut validator nicht lueckenlos pruefbar, Wertemengen bestaetigt. |
| "Eine Pandemie war in diesen Rechnungen nicht vorgesehen" | Analysebericht Abschnitt 4 | bestaetigt | "deshalb"-Satz siehe M4. |
| "Beide Berichte entstanden nach Beginn der Pandemie, die Berichte von 2015 bis 2019 davor" | Analysebericht Abschnitt 7 ("mit Kenntnis der Pandemie (PB2021) bzw. ihrer Folgejahre (PB2023)"), PB2021 weist 2020-Schaetzwert aus (Amendment 2) | bestaetigt | Erscheinungsdaten selbst nicht aus den Ergebnisdateien; PB2023 = Dezember 2023 (Analysebericht Abschnitt 7). Der Satz sagt nur "nach Beginn", nicht "mit Kenntnis" und ist damit enger als die Quelle. |
| "Sechs der zehn Vergleiche aus nur zwei Berichten (2021, 2023), Zieljahre 2021-2024" | Analysebericht Abschnitt 7 (PB2021: 4, PB2023: 2) | bestaetigt | |
| Weglassen eines der fuenf Berichte: mittlere Abweichung 9,5 bis 12,2 % | `diag_leave_one_report_out.csv` (MRE: ohne 2015: 12,2; 2017: 10,9; 2019: 10,6; 2021: 11,2; 2023: 9,5) | bestaetigt | "einen der fuenf Berichte" passt zur Datei (je ein Bericht weggelassen). Vorzeichen: nie umgekehrt (Spalten FALSE). |
| MWMS: drei Berichte (2015, 2017, 2023), fuenf Vergleiche, vier mit MWMS naeher | `e3_einzelwerte.csv`, `e3_kennzahlen.csv` (n = 5, 4 negativ, Median -1,467) | bestaetigt | |
| D = "Abweichung des MWMS minus Abweichung des MMS"; Gegenbeispiel 2015/2015 mit +0,1 | `e3_einzelwerte.csv`: D = ARE(MWMS) - ARE(MMS), also Differenz der **absoluten** Abweichungen; fuer 2015/2015 ist D = +0,1, die vorzeichenbehaftete Differenz dRE aber -0,1 | **Abweichung** | Der Artikel sagt nicht "absolute". Bei vorzeichenbehafteter Lesart (RE -1,4 fuer MMS, -1,5 fuer MWMS) waere das Ergebnis -0,1, nicht +0,1. Siehe N2. |
| Median minus 1,5 Prozentpunkte | `e3_kennzahlen.csv` (-1,4667) | bestaetigt | |
| "keine Rangfolge der Szenarien, nur ein Vergleich dieser fuenf Paare" | SAP 8.2, Analysebericht Abschnitt 4 (E3) | bestaetigt | Zusatz "sagt nicht, ob die Massnahmen umgesetzt wurden" fehlt (gering). |
| MWMS 2015 stammt aus Fassung von 2016, "also aus der Zeit nach dem Berichtsjahr" | Protokoll H1, Analysebericht Abschnitt 4 | bestaetigt | |
| Ohne 2015 drei von drei, Median -1,5; ohne 2017 -1,6; ohne 2023 -1,5 | Nachpruefung 2 (ungerundet -1,4667 / -1,5657 / -1,4667; 3/3) | bestaetigt | Konsistent mit Analysebericht ("etwa -1,5 bis -1,6"). |
| Median -1,5/-1,6/-1,5 "je Variante" (ohne 2015 / 2017 / 2023) | Nachpruefung 2, Tabelle | bestaetigt | Reihenfolge im Artikel: "ohne 2015 ... -1,5", "2017 oder 2023 weg: -1,6 beziehungsweise -1,5": korrekt zugeordnet. |
| Satz zu Pruefsummen/EEA-Abgleich | siehe M1 | bestaetigt | Hinweise gering (PB2015-Differenzen nicht erwaehnt). |
| Kopf: "H1, H2, H3 und mehrere mittlere sind in v0.2 eingearbeitet" | siehe oben | teilweise zutreffend | H2 ist nicht vollstaendig eingearbeitet (N1). Kopf nennt ausserdem noch "ENTWURF v0.1". |

## Einordnungs-Check (keine neue Berechnung/Inferenz)

Alle neuen oder geaenderten Zahlen (810, 781, 817, 811, 9,5 bis 12,2, -1,5/-1,6/-1,5) stehen in den CSV-Dateien bzw. im Analysebericht; die Rundungen sind korrekt. Eine eigene neue Berechnung enthaelt der Artikel nicht. Verbleibende Inferenzen ueber die Quellen hinaus: "deshalb" beim Ausgangsjahrwert (N1), "deshalb"/"denn" bei der Modellqualitaet (gering), Zeitzuordnung "Pandemiefolgen und Energiekrise" (Aussenwissen, im Analysebericht gedeckt).

## Neue und verbleibende Befunde mit Schweregrad

| Nr. | Fundstelle (v0.2) | Befund | Schweregrad | Vorschlag |
|---|---|---|---|---|
| N1 | "Was wir verglichen haben", Absatz 2: "... weicht deshalb ... ab" (Rest von H2) | Kausalaussage (Neuberechnung des Inventars als Ursache) nicht belegt; Analysebericht fuehrt Revision und GWP-Basis nur als nicht untersuchte Moeglichkeiten; widerspricht Limitationsabsatz ("wir wissen nicht, wie stark die spaeteren Korrekturen ... verschieben"). | hoch (Restbefund, Ein-Wort-Korrektur) | Beschreibend formulieren: "Der Wert, den ein Bericht fuer sein Ausgangsjahr ausweist, weicht vom heutigen Inventarwert desselben Jahres ab. Moegliche Gruende sind Neuberechnungen und andere Treibhauspotenziale; die Ursache haben wir nicht untersucht." Auch Kopfvermerk "H2 eingearbeitet" erst dann zutreffend. |
| N2 | "Mit und ohne weitere Massnahmen": "Abweichung des MWMS minus Abweichung des MMS" | D ist die Differenz der Betraege (absolute Abweichungen). Mit vorzeichenbehafteten Abweichungen waere das 2015er Paar -0,1 statt +0,1 und der Satz "einziges Gegenbeispiel mit plus 0,1" nicht nachvollziehbar. | mittel | "Betrag der Abweichung des MWMS minus Betrag der Abweichung des MMS" (oder "absolute Abweichung"). |
| N3 | Band-Absatz: "sagt deshalb nichts ueber die Qualitaet" (Rest von M4); Bullet 4 "denn" | Begruendung stammt nicht aus den Quellen (dort: bedingte Szenarien, SAP 8.1). | gering | "deshalb" streichen oder durch den SAP-Grund ersetzen. |
| N4 | Limitationsabsatz: "Deshalb wissen wir nicht, wie stark die spaeteren Korrekturen am Inventar die Ergebnisse verschieben." | Folgt nach der Beschreibung von S2 und S6; "deshalb" bezieht sich logisch nur auf S2 (S6 betrifft die UBA-Projektionsdaten). Unveraendert aus v0.1 (Erstcheck gering). | gering | "Die erste Rechnung fehlt, deshalb wissen wir ..." bzw. Satz an S2 anhaengen. |
| N5 | Kopfzeile | Aufschrift "ENTWURF v0.1" trotz v0.2-Inhalt; nennt Namen und Chat-Zitat (G6). | gering | Vor Veroeffentlichung Banner entfernen, Version angleichen. |
| N6 | Analysebericht Abschnitt 4, E1-Tabelle (ausserhalb des Artikels) | Nennt weiterhin P* 2017 = 811 statt 810 (Quelle des H1-Fehlers). | gering | Analyst korrigieren lassen, damit das Repository nicht dem Artikel widerspricht. |
| Rest G1, G2, G4, G5, optional G3 | siehe Tabelle oben | Unveraenderte Vollstaendigkeitsluecken, keine Falschaussagen. | gering | Optional ergaenzen. |

## Bekannt offen, nicht als Fehler gewertet

- Quellenlinks [1] und [3] (Platzhalter).
- Grafik 3: Legende der PNG nennt noch "Inventarrevision/GWP"; Datei bewusst nicht neu erzeugt. Vor Veroeffentlichung muss die Datei neu erzeugt und die Legende neutral sein, sonst widerspricht sie dem Text ("Buchhaltung, keine Ursachenanalyse").
- H4 (Freigabevorwegnahme), im Kopf vermerkt.

## Nicht geprueft

- Inhalt der Quell-PDFs (insbesondere Fussnote 3 Tab. 1-4 des PB2017) und der UBA-xlsx; Grafiken 1-3 wurden in dieser Nachpruefung nicht erneut angesehen.
- Links, GitHub-Pfad, Chat-Zitat im Kopf.
- Keine Freigabevermerke geschrieben.
