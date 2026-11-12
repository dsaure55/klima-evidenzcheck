# Faktencheck: Prognose-Check #1, Artikelentwurf v0.1 (Substack)

Gepruefter Text: `Reports/2026-11-12-prognose-check/kanal-entwuerfe/substack.md` (Entwurf v0.1, 12.11.2026). Der Artikel wurde nicht veraendert.
Pruefer: faktenpruefer-Subagent (unabhaengig, hat den Text nicht geschrieben), Stand 12.11.2026.
Geprueft gegen (alles unter `Analysen/2026-10-prognose-check-projektionsberichte/`): Analysebericht, Abweichungsprotokoll, Validierungsbericht inkl. Nachpruefung 1 und 2, SAP v1.2 (Abschnitte 0, 1, 5, 6, 8, 14), `Freigabe_Ergebnisse_Daniel_Saure_2026-11-11.md`, `run_log.txt`, output-CSV (e1_ergebnisse, e1_ist_im_sensitivitaetsband, e1_sensitivitaetswerte_berichte_2020, e2_kennzahlen, e2_einzelwerte_horizont, e3_einzelwerte, e3_kennzahlen, e5_zerlegung, tabelle1_berichte, tabelle2_paare_gesamt, tabelle3_sensitivitaeten_E1/E2, tabelle3b_sensitivitaeten_E3, umskalierungsfaktoren, diag_leave_one_report_out, plausibilisierung_uba_owid) sowie Grafik 1 bis 3 (PNG).

## Gesamturteil

**Bedingt: 0 kritisch, 4 hoch, 8 mittel, 6 gering.** Die Zahlen stimmen fast durchgehend mit den Ergebnisdateien ueberein (mehr als 60 Zahlenangaben geprueft, eine Abweichung: 811 statt 810 Mt). Der Artikel haelt die Auflagen der Freigabedatei im Kern ein (S2 und S6 als nicht durchgefuehrt mit Grund, Paarzahl n = 10 mit 6 aus PB2021/PB2023 als Limitation, keine Sektoren im Haupttext, Hinweis zur Modellqualitaet beim Sensitivitaetsband). Vor einer Freigabe zur Veroeffentlichung sollten die vier hohen Befunde behoben werden:

1. H1: Falsche Zahl in der Haupttabelle (PB2017: 811 Mt, richtig 810 Mt; Tabelle rechnet intern nicht auf).
2. H2: Ursachenaussage zur Inventarrevision ("deshalb") geht ueber die Ergebnisdateien hinaus und widerspricht dem Limitationsabsatz.
3. H3: Formulierung "Auflagen ... umgesetzt" gibt den Validierungsstand zu gut wieder.
4. H4: Der Satz "Die Redaktion hat ... diesen Text ... gelesen und freigegeben" ist zum jetzigen Zeitpunkt nicht belegt (keine Textfreigabe vorhanden). Es wird hier kein Freigabevermerk geschrieben.

Nicht pruefbar bzw. offen (bekannt): Quellenlinks [1] und [3] (Platzhalter), Chat-Zitat zur Entscheidung vom 12.11.2026, Inhalt der Quell-PDFs (nur ueber Validierungsbericht, nicht selbst gelesen), Ist-Wert 731 Mt (UBA-xlsx nicht lesbar; Wert ist aber in `plausibilisierung_uba_owid.csv` mit 730,97 gefuehrt und vom validator nicht gegen die UBA-Excel geprueft).

## Befunde nach Schweregrad

### Hoch

| Nr. | Fundstelle (Artikel) | Befund | Vorschlag |
|---|---|---|---|
| H1 | Tabelle "Das Zieljahr 2020", Zeile 2017: "811 Mt" | `e1_ergebnisse.csv` und `tabelle2_paare_gesamt.csv`: P* (2017) = 810 Mt (816,4 mal 0,9927 = 810,45). Der Analysebericht (Abschnitt 4, E1-Tabelle) nennt ebenfalls 811 und weicht damit von seiner eigenen CSV ab. 811 minus 731 ergibt 80, die Tabelle nennt 79 Mt Abstand: die Zeile rechnet nicht auf. Gleiche Zahl vermutlich in Grafik-Beschriftung pruefen (Grafik 1 zeigt keinen Zahlenwert). | Auf 810 Mt korrigieren; zugleich Analysebericht E1-Tabelle korrigieren lassen (Rueckmeldung an analyst, Ursache vermutlich Verwechslung mit 811 aus dem Band-Absatz, 816,9 mal Faktor). |
| H2 | Abschnitt "Was wir verglichen haben": "Das Umweltbundesamt rechnet die Inventarreihe jedes Jahr neu. Ein Bericht von 2015 hatte ... deshalb einen anderen Wert als das heutige Inventar." | Die Ergebnisdateien belegen nur, dass Bericht- und Inventarwert im Ausgangsjahr verschieden sind (Faktor 0,976 bis 0,995). Die Ursache ist nicht untersucht: S2 (Inventarrevision) wurde nicht durchgefuehrt (Protokoll H5/H21), die GWP-Basis der Berichte unterscheidet sich (SAR/AR4/AR5, Analysebericht Abschnitt 7), und der Analysebericht hat die Zuschreibung "Inventarrevision/GWP-Wechsel" ausdruecklich als unbelegt gestrichen (Protokoll H19; Analysebericht Abschnitt 5, letzter Satz). Der Artikel widerspricht sich zudem selbst: Im Limitationsabsatz steht, man wisse nicht, wie stark spaetere Inventarkorrekturen die Ergebnisse verschieben. Gleiches gilt fuer die Grafik-3-Legende ("Inventarrevision/GWP des Ausgangsjahres"), siehe M7. | Formulieren als Beschreibung: "Der Bericht von 2015 wies fuer das Ausgangsjahr 2012 einen anderen Wert aus als das heutige Inventar (939 gegen 917 Mt). Moegliche Gruende sind Neuberechnungen des Inventars und andere Treibhauspotenziale; die Ursache haben wir nicht untersucht." |
| H3 | Abschnitt "Wie wir gerechnet haben": "Sie stellte Auflagen, die wir umgesetzt haben" | Validierungsbericht und Nachpruefung 1: Auflagen B3, B4, D1, L1, B7, B8, B10 umgesetzt; B1/B2 bewusst unveraendert (Entscheidung Daniel), B5 (S2) nicht nachgeholt, B6 (S6) nur belegt statt gerechnet, KSG-Definitionen und Zweituebertragung (H6) nicht erledigt. Wortlaut des validators: "umgesetzt oder begruendet zurueckgestellt". Ausserdem nennt der Artikel nicht, dass die erste Pruefung vier Befunde der Stufe "hoch" hatte (Gate nur formal erfuellt, 0 kritisch). | "Sie stellte Auflagen; die meisten haben wir umgesetzt, einige bewusst zurueckgestellt (siehe oben: zwei nicht durchgefuehrte Rechnungen, Sektoren)." Hinweis auf die vier hohen Befunde der Erstpruefung erwaegen. |
| H4 | Abschnitt "Offenlegung zu KI": "Die Redaktion hat den Analyseplan, die Ergebnisse und diesen Text vor der Veroeffentlichung gelesen und freigegeben" | Freigabe liegt nur fuer SAP (22.10., 09.11.) und Ergebnisse (11.11., `Freigabe_Ergebnisse_...md`) vor. Fuer den Text existiert keine Freigabe (Header des Entwurfs: "Freigabe durch Daniel Saure erforderlich"; Faktencheck steht erst jetzt an). Der Satz nimmt etwas vorweg. Dieser Faktencheck ist keine Freigabe. | Satz erst in die Endfassung uebernehmen, wenn die Textfreigabe durch Daniel Saure als Datei vorliegt. Bis dahin als Platzhalter markieren. |

### Mittel

| Nr. | Fundstelle | Befund | Vorschlag |
|---|---|---|---|
| M1 | "Wie wir gerechnet haben", letzter Absatz: "Die Zahlen aus den PDF-Tabellen wurden mit Pruefsummen und Abgleichen gegen die EEA-Datenbank abgesichert" | Die SHA-256-Pruefsummen (68/68, `02_pruefsummen_vor_auswertung.csv`) sichern nur die Unveraendertheit der Rohdateien, nicht die Richtigkeit uebertragener Tabellenwerte. EEA-Abgleich: Gesamtwerte ja, aber PB2015-MWMS hat kein EEA-Gegenstueck (Protokoll H6), PB2015-Haupttabelle (SAR) weicht in 24 EEA-Zellen ab (Validierung B8). Der validator hat PB2015-MWMS nicht geprueft (Validierungsbericht Abschnitt 8). Die vier E3-Paare mit PB2015-MWMS-Wert (darunter D = minus 6,9) und damit "4 von 5" beruhen teils auf nur einer Uebertragung. Auch das Sensitivitaetsband wurde von Hand uebertragen (Protokoll H18). | "Mit Pruefsummen" streichen oder praezisieren ("Dateien per Pruefsumme gesichert"); ergaenzen: MWMS 2015 und die Sensitivitaetswerte stammen aus einer einzelnen Handuebertragung. |
| M2 | Bullet 4 ("Ergebnisse auf einen Blick"): "lag unter der gesamten Spannweite der Sensitivitaetsrechnungen" | Freigabeauflage: Lage unter der Spannweite ist keine Aussage ueber die Modellqualitaet. Der Hinweis steht nur weiter unten im Abschnitt "Das Zieljahr 2020", nicht im Bullet, das fuer sich stehen kann. | Halbsatz ergaenzen: "Das ist keine Aussage ueber die Qualitaet der Modelle." |
| M3 | Abschnitt "Das Zieljahr 2020", Band-Absatz: "775 bis 823 Mt (2017)" | Validierung N3: Das Bandminimum 780,6 Mt (bereinigt 775) stammt aus einer MWMS-Uebernahme fuer das MMS (Fussnote 3, Tab. 1-4, vom validator nicht geprueft). Ohne diesen Wert 816,9 Mt (bereinigt 811). Der validator wollte das bei Nennung des Bandes im Artikel erwaehnt sehen. Aussage "darunter" bleibt unveraendert. Dazu: PB2019 weist nur drei Sensitivitaeten aus (ohne Stromexport, `e1_sensitivitaetswerte_berichte_2020.csv`); der Artikel schreibt pauschal "variieren ... Stromexport". Die Zuordnung der Werte zu Sensitivitaetsnamen ist laut validator aus der Textebene nicht lueckenlos pruefbar. | Fussnote zu 2017 ergaenzen; "je nach Bericht" bei den variierten Groessen. |
| M4 | Abschnitt "Das Zieljahr 2020", Band-Absatz: "Eine Pandemie oder Energiekrise kam darin nicht vor. ... sagt deshalb nichts ueber die Qualitaet" | Analysebericht: "kein Pandemie- oder Krisenszenario"; der Begriff "Energiekrise" und das Wort "deshalb" (Begruendung der Modellqualitaetsaussage) sind Zusatz des Artikels. Die SAP-Begruendung (8.1) ist eine andere: Projektionen sind bedingte Szenarien. | "Kein Pandemie- oder Krisenszenario" uebernehmen; "deshalb" ersetzen durch den SAP-Grund (bedingte Rechnung). |
| M5 | Abschnitt "Alle Zieljahre zusammen": "Zieljahren in der Zeit nach Corona und waehrend der Energiekrise" | Analysebericht Abschnitt 7: "Phase nach Corona und Energiekrise". SAP 8.4 rechnet Corona zu "2020/21"; Zieljahr 2021 (4 der 6 Paare von PB2021: 2021 bis 2024) liegt also nicht "nach Corona". Zuordnung der Jahre zu Ereignissen ist Aussenwissen, nicht aus den Ergebnisdateien. | Neutral: "mit Zieljahren 2021 bis 2024". |
| M6 | gleicher Absatz: "Der Bericht von 2023 [entstand] auch mit Kenntnis ihrer Folgejahre"; "von ihnen stark mitgepraegt" | (a) Kenntnis: Analysebericht Abschnitt 7 behauptet es ohne Beleg. Nach Amendment 1 nutzt PB2023 Inventardaten 1990 bis 2020 und Modellbasisjahr 2019; ob Folgejahre (2021/22) eingegangen sind, ist nicht belegt. PB2021 weist einen 2020-Schaetzwert aus (Tab. 126), das stuetzt dort die Kenntnis. (b) "stark mitgepraegt": nicht quantifiziert; Leave-one-report-out nennt MRE-Spanne 9,5 bis 12,2 % (`diag_leave_one_report_out.csv`: ohne PB2021 11,2; ohne PB2023 9,5). | (a) "PB2021 enthaelt bereits einen Schaetzwert fuer 2020; PB2023 erschien im Dezember 2023" oder streichen. (b) "praegen die Kennzahl mit" und die Spanne 9,5 bis 12,2 % nennen. |
| M7 | Grafik 3 (Platzhalter [GRAFIK 3], Datei `grafik3_E5_zerlegung_2020.png`) und Abschnitt "Woher der Abstand kommt" (Ueberschrift) | Die Legende der Grafik nennt den Startpunkt "Inventarrevision/GWP des Ausgangsjahres": Ursachenzuschreibung, die der Text selbst ausschliesst ("Buchhaltung, keine Ursachenanalyse"). Die Ueberschrift "Woher der Abstand kommt" suggeriert Ursachen. | Legende neutral ("Abweichung im Ausgangsjahr") ; Ueberschrift z. B. "Wo der Abstand sichtbar wird". |
| M8 | Abschnitt "Mit und ohne weitere Massnahmen" | SAP 8.2: E3 ist kein Ranking nach Gueite und sagt nicht, ob die zusaetzlichen Massnahmen umgesetzt wurden. Der Hinweis fehlt im Abschnitt und im Bullet 3. Der "Median (mittlerer Unterschied) minus 1,5 Prozentpunkte" ist nicht erklaert (D = Differenz der absoluten Abweichungen MWMS minus MMS). Der Text enthaelt zudem nicht, dass PB2019/PB2021 kein MWMS haben (nur indirekt). Zahlen selbst stimmen. | Satz zu SAP 8.2 ergaenzen; D in einem Halbsatz definieren. |

### Gering

| Nr. | Fundstelle | Befund | Vorschlag |
|---|---|---|---|
| G1 | "Wie wir gerechnet haben", Absatz 1 | Beide Amendments (22.10., 09.11.) wurden nach Sichtung der Rohdaten (Integritaetspruefung), aber vor Berechnung der Fehlermasse entschieden (SAP Abschnitt 14, "Zeitpunkt"). Der Artikel sagt nur "bevor wir Daten ausgewertet haben" (richtig, aber unvollstaendig). | Ergaenzen: "Beide Ergaenzungen entstanden vor jeder Fehlerberechnung." |
| G2 | Abschnitt "Was wir verglichen haben": 2020-Wert PB2021 "zaehlt nicht" | Analysebericht (Post-hoc) nennt: waere er gezaehlt worden, laege RE* bei plus 0,2 % (RE_unb plus 1,2 %). Das waere der einzige 2020-Wert nahe Null, es handelt sich aber um eine Vorjahresschaetzung. Fuer Transparenz sollte die Information im Artikel stehen, sonst wirkt "in allen drei Berichten" ausgewaehlt. | Satz ergaenzen mit Kennzeichnung als Zusatzinformation. |
| G3 | "Alle Zieljahre zusammen", Absatz "Weitere Zusatzrechnungen": "In allen berechneten Varianten" | Nicht genannt: S7 (MRE 12,9 %, n = 15), S1 bereits genannt, S8 (Gesamtkennzahl gleich), S9 (n = 2). SAP 7 verlangt vollstaendige Berichterstattung im Bericht; fuer den Artikel genuegt ein Verweis. Die Aussage "aendern das Bild nicht" ist eine Wertung (MdRE sinkt bei S5 auf 9,6, steigt bei S3a auf 13,9). "16 zusaetzliche ... Zieljahre" sind 16 Paare, nicht Zieljahre. Der Median (MdRE 12,6 %), laut SAP Kernzahl, fehlt in Tabelle "Alle Zieljahre zusammen". | S7 und Verweis auf Analysebericht ergaenzen; "Paare" statt "Zieljahre"; MdRE-Spalte ergaenzen. |
| G4 | "Das Zieljahr 2020": "sinkt die mittlere Abweichung nur von 10,9 auf 10,4" | Zahl stimmt. Der Median steigt gleichzeitig von 12,6 auf 13,9 % (Analysebericht Abschnitt 6 Nr. 4). Die Auslassung macht den Satz einseitiger als die Quelle. | Median nennen. |
| G5 | Abschnitt "Wie wir gerechnet haben", Festlegungen | "die uebrigen Festlegungen ... nicht einzeln bestaetigt": H4/H6 wurden ebenfalls bestaetigt (nur fuer Sektoren, nicht im Artikel relevant). H2 (PB2015: SAR-Haupttabelle statt AR4, RE* 12,3 gegen 12,0 %) und GCP-Abgleich (nicht durchgefuehrt, Lizenzformular) fehlen im Artikel. | Optional ergaenzen. Aussage ueber H3 ("bestaetigt am 11.11.2026") ist korrekt. |
| G6 | Header und Reihe | Der Entwurfskopf nennt "Daniel Saure" und Chat-Zitate; vor Veroeffentlichung entfernen (CLAUDE.md: Name nur im Impressum). Reihentitel "Prognose-Check #1" weicht von CLAUDE.md ("Evidenzcheck #n" als Reihenname) ab; laut Header Entscheidung Daniel (12.11.), CLAUDE.md nicht angepasst. | Banner entfernen; CLAUDE.md bei Gelegenheit abgleichen lassen. |

## Pruefprotokoll (Behauptung, Quelle, Ergebnis)

Ampel: bestaetigt / Abweichung / nicht pruefbar / kritisch.

| Behauptung (Artikel) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Berichte 2015 bis 2023, Inventar UBA Stand 2026 | `run_log.txt` Abschn. 3 | bestaetigt | |
| Regierung berichtet alle zwei Jahre | SAP 0, 1 | bestaetigt | allgemein bekannt, SAP-Vorwissen |
| MMS "mit Massnahmen, die zum Berichtszeitpunkt schon beschlossen waren" | SAP 1 ("Massnahmen bis Berichtszeitpunkt"), Analysebericht 1 | nicht pruefbar | "beschlossen" steht nicht in den Ergebnisdateien; Definition aus [1] pruefen |
| Titel/Reihe "Prognose-Check #1" | Header (Chat) | nicht pruefbar | siehe G6 |
| Bullet 1: 2020 ueber Ist in allen drei Berichten, 10,9 bis 13,0 % | `e1_ergebnisse.csv` | bestaetigt | |
| 731 Mt (2020) | `e1_ergebnisse.csv`, `plausibilisierung_uba_owid.csv` (730,97) | bestaetigt (Datei) | UBA-xlsx selbst nicht geoeffnet; validator hat A nicht gegen UBA-Excel verglichen |
| 10 Vergleiche aus 5 Berichten, MRE 10,9 %, 9 von 10 | `e2_kennzahlen.csv` | bestaetigt | |
| MWMS naeher in 4 von 5; ohne 2015 3 von 3 | `e3_kennzahlen.csv`, `diag_e3_leave_one_report_out.csv` (Nachpruefung 2) | bestaetigt | |
| Spannweite der Sensitivitaeten, Ist darunter | `e1_ist_im_sensitivitaetsband.csv` | bestaetigt | siehe M2, M3 |
| Faktor 0,976 bis 0,995 | `umskalierungsfaktoren.csv` | bestaetigt | |
| Ohne Bereinigung im Mittel 12,1 % | `tabelle3_sensitivitaeten_E2.csv` (S1) | bestaetigt | |
| Tabelle Berichte/Ausgangsjahre/Zieljahre | `tabelle1_berichte.csv`, Amendment 1 | bestaetigt | |
| Nur ausdrueckliche Zieljahre; 2020 fuer PB2021/2023 kein Vergleich; Tab. 126 Vorjahresschaetzung | Amendment 2, `e1_ergebnisse.csv` Hinweisspalte | bestaetigt | PB2023: Grund ist fehlender 2020-Wert, nicht Amendment 2 |
| Tabelle 2020: 821/731/90/12,3 (2015) | `e1_ergebnisse.csv` | bestaetigt | |
| Tabelle 2020: 811/731/79/10,9 (2017) | `e1_ergebnisse.csv`, `tabelle2` | **Abweichung** | P* = 810, siehe H1 |
| Tabelle 2020: 826/731/95/13,0 (2019) | `e1_ergebnisse.csv` | bestaetigt | |
| 2020 corona-gepraegt, Berichte 2015 bis 2019 konnten sie nicht kennen | Analysebericht 4 (E1), SAP 8.4 | bestaetigt | |
| MRE ohne 2020: 10,4 % | `tabelle3_sensitivitaeten_E2.csv` (S3a) | bestaetigt | siehe G4 |
| 2023/2024-Werte 13,9 bis 18,6 % hoeher als 2020 | `e2_einzelwerte_horizont.csv` (13,9/18,6 PB2023; 15,9/17,6 PB2021) | bestaetigt | Werte von PB2021 fuer 2021 (2,9) und 2022 (5,0) liegen niedriger; Aussage gilt fuer 2023/2024 |
| Band: 805-828 (2015), 775-823 (2017), 814-825 (2019); Abstaende 74/44/83 | `e1_ist_im_sensitivitaetsband.csv` (805,3-828,4; 775,1-823,3; 813,7-824,5; 74,3/44,2/82,8) | bestaetigt | Rundung korrekt; siehe M3 |
| Keine statistischen Unsicherheitsbaender | Analysebericht 4 | bestaetigt | |
| Tabelle Gruppen: alle 10, 9/10, 10,9, 11,2; h 4-6: 7, 7/7, 13,6, 13,6 | `e2_kennzahlen.csv` | bestaetigt | |
| Einzelwerte -1,4; +2,9; +12,3 | `e2_einzelwerte_horizont.csv` | bestaetigt | |
| Einziges negatives Paar PB2015/2015, h = 3 | `e2_einzelwerte_horizont.csv` | bestaetigt | |
| Kein Trend ablesbar | Analysebericht 4 (E2) | bestaetigt | |
| 6 von 10 aus PB2021/PB2023; Paarzahl als Limitation | Freigabe, Analysebericht 7 | bestaetigt | Auflage erfuellt |
| Berichte teilen Zieljahre (2020; 2023/2024) | Analysebericht 6 Nr. 1 | bestaetigt | |
| LOO: Vorzeichen aendert sich nie | `diag_leave_one_report_out.csv` | bestaetigt | |
| S3a/S3b/S4/S5: 10,4 / 11,6 / 11,5 / 10,4 mit 22 von 26; "ohne 2020 und 2021: 11,6" | `tabelle3_sensitivitaeten_E2.csv` | bestaetigt | siehe G3 |
| 2020 und 2021 weg: 11,6 %; ohne 2022: 11,5 % | dto. | bestaetigt | |
| MWMS: 3 Berichte (2015, 2017, 2023), 5 Vergleiche; Median -1,5; Gegenbeispiel +0,1 | `e3_einzelwerte.csv`, `e3_kennzahlen.csv` | bestaetigt | |
| MWMS 2015 aus Fassung 2016; ohne 2017: -1,6; ohne 2023: -1,5 | Protokoll H1, N1, Nachpruefung 2 | bestaetigt | |
| E5: 22/110 (20 %), 7/85 (8 %), 10/105 (10 %) | `e5_zerlegung.csv` | bestaetigt | |
| "Der groessere Teil entsteht im Verlauf"; Zerlegung keine Ursachenanalyse; unbereinigte Basis | Analysebericht 4 (E5) | bestaetigt | |
| Produktionsperspektive, kein Konsum | SAP 8.0 | bestaetigt | |
| Kein "signifikant", nichts getestet | SAP 5.1.1, 5.5 | bestaetigt | |
| S2 nicht durchgefuehrt: Versionen nicht beschafft, "erste Version" nicht eindeutig | Analysebericht 5, Protokoll H5/H21 | bestaetigt | Auflage erfuellt |
| S6: Ausgangswert fehlt in beschafften Dateien, PB2025 ohne Zieljahr im Fenster | Analysebericht 5, Protokoll H20 | bestaetigt | Auflage erfuellt. "Deshalb wissen wir nicht ... Inventar" bezieht sich nur auf S2, nicht auf S6 (Logik), gering |
| OWID 5,7 bis 6,6 % unter Inventar, jedes Jahr 2015-2024 | `plausibilisierung_uba_owid.csv` (-5,74 bis -6,63 %) | bestaetigt | Der Analysebericht Abschn. 7 formuliert gegenlaeufig ("UBA ueber OWID"); der Artikel entspricht der CSV |
| OWID-Erklaerung als Hypothese ("kommen in Frage, nicht belegt") | Analysebericht 7, Protokoll H14 | bestaetigt | Als Hypothese gekennzeichnet. Die Praezisierung "Methan und Lachgas" geht ueber die Quellen hinaus (dort: "AR6- vs. AR5-GWP"), gering |
| Bericht 2013 nicht enthalten; Gueltigkeit fuer Inventar 2026 | SAP 3.1, 9 | bestaetigt | |
| Plan 22.10.2026 festgelegt/eingefroren; zweimal ergaenzt (22.10., 09.11.) | SAP Kopf, Abschn. 14 | bestaetigt | siehe G1 |
| "Eine unabhaengige Pruefung ... kein kritisches Problem gefunden" | Validierungsbericht | bestaetigt | siehe H3 |
| "zweimal gezielt wiederholt" | Nachpruefung 1, 2 | bestaetigt | Nachpruefung 2 betraf nur N1 |
| Abweichungsprotokoll im Repository [3] | Protokoll vorhanden | nicht pruefbar | Link/Push offen (bekannt) |
| Vorwissen-Absatz (MMS/MWMS, Corona; keine konkreten Werte nachgeschlagen) | SAP Abschn. 0 | bestaetigt | SAP nennt zusaetzlich den Zweijahresrhythmus (im Artikel-Intro enthalten). Der SAP nutzt weiteres Vorwissen (Energiekrise 2022 in S4, Ziel minus 40 % in E1-Begruendung), das der Absatz nicht nennt: gering |
| H3-Entscheidung "am 11.11.2026 bestaetigt" | Protokoll H3, Freigabe | bestaetigt | Nur H3/H4/H6 bestaetigt; Artikel erwaehnt nur H3, korrekt |
| MMS April 2015, MWMS September 2016 | Protokoll H1, `run_log.txt` | bestaetigt | H1 weiterhin "offen" im Protokoll; Artikel formuliert es als eigene Festlegung, korrekt |
| Sektoren nicht im Haupttext | Freigabe, SAP 7 | bestaetigt | Auflage erfuellt; Hinweis auf vorlaeufigen Sektoranhang im Analysebericht fehlt (gering) |
| Quelle [2]: URL, Datum 15.01.2026; KSG-Uebersicht 15.03.2026 | `run_log.txt`; WebFetch auf URL: Datei erreichbar | bestaetigt | Titel in `run_log` lautet "Nationale Trendtabellen fuer die deutsche Berichterstattung atmosphaerischer Emissionen 1990-2024"; Artikeltitel paraphrasiert (gering) |
| Quelle [1]: Berichte, Bericht 2015 MMS/MWMS-Fassungen | `run_log.txt` Abschn. 1/2 | bestaetigt (Inhalt), Links offen | Platzhalter bekannt. Datenanhang im Sinne des SAP liegt nur fuer PB2023 vor |
| Quelle [3]: SAP v1.2, Zeitraum 22.10. bis 11.11.2026 | SAP, Freigabedatei | bestaetigt | Link-Platzhalter bekannt |
| Mehr erfahren/Kanalzeile (URLs) | CLAUDE.md, Tabelle "Kanaele" | bestaetigt | |

## Einordnungs-Check (keine neue Berechnung/Inferenz)

Gepruefter Massstab: Einordnung darf nur bereits veroeffentlichte Ergebnisse oder beschreibende Zahlen wiedergeben. Ergebnis: Keine neu berechnete Zahl gefunden. Alle Zahlen finden sich in den CSV-Dateien bzw. im Analysebericht. Die Rundung der Band-Abstaende (74/44/83) entspricht den Textangaben des Analyseberichts. Inferenzen ueber die Ergebnisdateien hinaus: H2 (Revision als Ursache), M4 ("deshalb" bei Modellqualitaet), M5/M6 (Ereigniszuordnung der Zieljahre, Kenntnis der Berichte), M7 (Ueberschrift/Legende). Diese sind oben mit Vorschlaegen aufgefuehrt.

## Nicht geprueft

- Inhalt der Quell-PDFs und der UBA-xlsx (nicht lesbar mit den vorhandenen Werkzeugen); Zahlen dort nur ueber Validierungsbericht (Stichproben) und CSV.
- Platzhalter-Links und GitHub-Pfad ([1], [3]); das Chat-Zitat vom 12.11.2026.
- Grafik 1 bis 3 nur als Dateien angesehen: Daten stimmen mit den CSV ueberein; Grafik 1 hat laut Validierung N4 ueberlappende Jahresbeschriftungen ("2017", "2021", "2023"), Grafik 1 zeigt auch interpolierte Pfade bis ca. 2027 und die Vorjahresschaetzung 2025, nicht im Artikeltext erklaert (gering). Grafik 2 enthaelt zusaetzlich MWMS-Dreiecke (Artikeltext nennt Grafik 2 "Abweichung gegen Abstand"; MWMS-Markierung ergaenzen).
- Keine Freigabevermerke geschrieben.
