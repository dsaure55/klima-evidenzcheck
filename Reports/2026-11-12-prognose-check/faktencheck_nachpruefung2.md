# Faktencheck Nachpruefung 2: Prognose-Check #1, Artikelentwurf v0.3 (Substack)

Gepruefter Text: `Reports/2026-11-12-prognose-check/kanal-entwuerfe/substack.md` (v0.3, 12.11.2026). Der Artikel wurde nicht veraendert.
Gegenstand: nur die seit `faktencheck_nachpruefung1.md` geaenderten Stellen (N1 bis N5), Quellenliste [1], Kopfvermerk, Grafik 3 (H27) und Analysebericht-E1-Tabelle (H26). Unveraenderte Stellen wurden nicht neu geprueft.
Pruefer: faktenpruefer-Subagent (unabhaengig), Stand 12.11.2026.
Geprueft gegen (unter `Analysen/2026-10-prognose-check-projektionsberichte/`): `output/e3_einzelwerte.csv`, `output/e3_kennzahlen.csv`, `output/e5_zerlegung.csv`, `output/grafik3_E5_zerlegung_2020.png` (angesehen), `04_grafik3_beschriftung.R`, `Analysebericht_...md` (Abschnitte 3, 4, 5, 7), `Abweichungsprotokoll_...md` (H19, H26, H27, H5, H20, H21), `SAP_...md` (8.1, 8.2), `run_log.txt` (Dateitabelle, Spalte url, Zugriff 22.10.2026), `Freigabe_Ergebnisse_Daniel_Saure_2026-11-11.md`, `Validierungsbericht_...md`, `faktencheck.md`. Zusaetzlich wurden fuenf der sechs URLs von [1] online abgerufen.

## Gesamturteil

**Bestaetigt mit Hinweisen: 0 kritisch, 0 hoch, 0 mittel, 4 gering (neu).** Alle in v0.3 geaenderten Saetze (N1 bis N5) sind jetzt von den Quellen gedeckt; die Ursachenzuschreibung beim Ausgangsjahrwert (frueher H2/N1) ist entfernt, D ist korrekt als Differenz absoluter Abweichungen definiert, "deshalb"/"denn" bei der Modellqualitaet sind durch die Begruendung des Analyseberichts ersetzt. Die sechs URLs in [1] stimmen buchstabengenau mit der Spalte url der Rohdatei-Liste in `run_log.txt` ueberein. Grafik 3 und die E1-Tabelle des Analyseberichts entsprechen dem Befund. Es verbleiben nur Kleinigkeiten (N7 bis N10, siehe unten). Bekannt offen und nicht als Fehler gewertet: GitHub-Link [3], G1/G2/G4/G5, H4. Dieser Faktencheck ist keine Freigabe; ein Freigabevermerk wurde nicht geschrieben.

## Status der Befunde aus Nachpruefung 1

| Befund | Status | Begruendung (Fundstelle v0.3 / Quelle) |
|---|---|---|
| N1 (Ursachenzuschreibung Ausgangsjahrwert) | behoben (Rest gering, siehe N8) | v0.3, "Was wir verglichen haben", Absatz 2: "weicht ... ab, beim Bericht von 2015 etwa fuer 2012. Das Umweltbundesamt rechnet die Reihe jedes Jahr neu. Ob das die Abweichung erklaert, haben wir nicht untersucht." "deshalb" ist weg, die Ursache wird ausdruecklich offen gelassen. Entspricht Analysebericht Abschnitt 3 ("Die Ursache ist nicht belegt"), Protokoll H19 und der Limitation (S2 nicht durchgefuehrt). Ausgangsjahr 2012 fuer PB2015 und Faktor 0,976 bis 0,995 gedeckt (Analysebericht Abschnitt 2/3). |
| N2 (Definition D) | behoben | v0.3: "absolute Abweichung (ohne Vorzeichen) des MWMS minus absolute Abweichung des MMS ... Negativ heisst: Das MWMS lag naeher am tatsaechlichen Wert." `e3_einzelwerte.csv`: D = ARE_MWMS minus ARE_MMS; Zeile 2015/2015: ARE 1,4 (MMS), 1,5 (MWMS), D = +0,1 (dRE = -0,1, nicht massgeblich); alle anderen D negativ. Vorzeichenregel stimmt (kleinerer Betrag = naeher). Siehe Tabelle unten. |
| N3 (deshalb/denn bei Modellqualitaet) | behoben | Bullet 4: "Eine Aussage ueber die Qualitaet der Modelle ist das nicht, denn diese Rechnungen variieren nur einzelne Annahmen." Absatz Sensitivitaetsband: "Eine Pandemie war in diesen Rechnungen nicht vorgesehen. Dass der tatsaechliche Wert unter dem Band liegt, ist keine Aussage ueber die Qualitaet der Modelle." Gedeckt durch Analysebericht Abschnitt 4 ("variieren nur Wachstum, Bevoelkerung, Preise und Stromexport und enthalten kein Pandemie- oder Krisenszenario; ... keine Aussage ueber die Modellierungsqualitaet (SAP 8.1)") und Freigabeauflage (letzter Punkt). "deshalb" ist gestrichen. |
| N4 ("Wegen der ersten Rechnung ...") | behoben | v0.3, Absatz zu den nicht durchgefuehrten Rechnungen: "Wegen der ersten Rechnung wissen wir nicht, wie stark die spaeteren Korrekturen am Inventar die Ergebnisse verschieben." Bezug eindeutig auf S2. Analysebericht Abschnitt 5 (S2): "Folge: Die Wirkung der Revision der Ist-Werte auf E1/E2 ist unbekannt." Beschreibung S2 (nicht beschafft, "erste" nicht eindeutig) = Protokoll H5/H21; S6 (kein Ausgangswert in den Dateien fuer 2024; 2025 ohne Zieljahr im Fenster) = Analysebericht Abschnitt 5 / Protokoll H20. |
| N5 (Entwurfskopf) | behoben (Rest gering, N9) | Kopf nennt jetzt "ENTWURF v0.3 (12.11.2026)", nennt Faktencheck, Nachpruefung 1 und v0.3-Aenderungen. Kopf nennt weiter Namen und Chat-Zitat (G6): bekannt, vor Veroeffentlichung zu entfernen. |
| N6 (Analysebericht 811 vs. 810) | behoben | Analysebericht Abschnitt 4, E1-Tabelle: PB2017 P* = 810, A = 731, E* = 79, RE* = 10,9. Die uebrigen "811" im Bericht (Bandminimum 816,9 x 0,993 bereinigt) sind richtig (816,9 x 0,993 = 811,2). Protokoll H26 beschreibt das korrekt. |

## Pruefung der geaenderten Saetze

| Behauptung (Artikel v0.3) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Ausgangsjahrwert des Berichts weicht vom heutigen Inventarwert desselben Jahres ab, beim Bericht 2015 fuer 2012 | `umskalierungsfaktoren.csv` laut Analysebericht Abschnitt 3 (0,976); J_b 2015 = 2012 (Abschnitt 2, Amendment 1) | bestaetigt | Faktor 0,976 bedeutet, dass der Berichtswert um 2,4 % ueber dem heutigen Inventarwert liegt. |
| "Das Umweltbundesamt rechnet die Reihe jedes Jahr neu" | keine Projektquelle (Analysebericht nennt "methodische Neuberechnung im Inventar" nur als ungeprueft Hypothese) | nicht pruefbar | Allgemeinwissen (jaehrliche Neuberechnung im Nationalen Inventarbericht ueblich), im Projekt nicht belegt; Beleg koennte im NIR 2026 (`uba_inventar/30_2026_CC.pdf`) gesucht werden. Gering, siehe N8. |
| "Ob das die Abweichung erklaert, haben wir nicht untersucht" | Analysebericht Abschnitt 3/5, Protokoll H19/H21 | bestaetigt | Keine Kausalbehauptung mehr. |
| Faktor zwischen 0,976 und 0,995 (Gesamtemissionen) | Analysebericht Abschnitt 3 | bestaetigt | Unveraendert. |
| D = absolute Abweichung MWMS minus absolute Abweichung MMS; negativ = MWMS naeher | `e3_einzelwerte.csv` (Spalten ARE_star_MWMS, ARE_star_MMS, D), SAP 2.3 | bestaetigt | |
| 5 Vergleiche, 4 mit MWMS naeher | `e3_kennzahlen.csv` (n = 5, n_D_neg = 4) | bestaetigt | |
| Median minus 1,5 Prozentpunkte | `e3_kennzahlen.csv` (-1,4667) | bestaetigt | |
| Einziges Gegenbeispiel: Bericht 2015 fuer 2015, plus 0,1 Prozentpunkte | `e3_einzelwerte.csv` (D = 0,1) | bestaetigt | |
| Ohne Bericht 2015: 3 von 3, Median minus 1,5 | Werte -1,5 / -1,4 / -1,7 aus `e3_einzelwerte.csv`: Median -1,5 (ungerundet -1,4667); Analysebericht Abschnitt 4 | bestaetigt | Nachrechnung der Rundung nur aus den CSV-Werten, keine neue Aussage im Artikel. |
| Ohne 2017: Median minus 1,6; ohne 2023: minus 1,5 | Analysebericht Abschnitt 4 (-1,57 / -1,47) | bestaetigt | Zuordnung in der Reihenfolge korrekt. |
| MWMS 2015 stammt aus einer Fassung von 2016, "also aus der Zeit nach dem Berichtsjahr" | Protokoll H1, Analysebericht Abschnitt 4 | bestaetigt | |
| Bullet 4: Ist-Wert 2020 unter der gesamten Spannweite der berichtseigenen Sensitivitaeten; "variieren nur einzelne Annahmen" | Analysebericht Abschnitt 4 (Band-Pruefung), Freigabe Auflage 4 | bestaetigt | Begruendung "denn ..." entspricht dem Analysebericht, nicht wortgleich SAP 8.1 (dort: bedingte Szenarien); beides vereinbar. |
| "Eine Pandemie war in diesen Rechnungen nicht vorgesehen" | Analysebericht Abschnitt 4 ("kein Pandemie- oder Krisenszenario") | bestaetigt | |
| Nicht durchgefuehrt: erste Rechnung (erste Inventarversion mit dem Jahr), nicht beschafft, "erste" im Plan nicht eindeutig | Protokoll H5/H21, Analysebericht Abschnitt 5 (S2) | bestaetigt | |
| Zweite nicht durchgefuehrte Rechnung: UBA-Projektionsdaten 2024 und 2025, fehlender Ausgangswert, Bericht 2025 ohne Zieljahr im untersuchten Zeitraum | Protokoll H20, Analysebericht Abschnitt 5 (S6), `s6_pruefung.csv` laut Bericht | bestaetigt | "Ausgangswert fehlt" gilt fuer 2024; fuer 2025 liegt der Grund beim fehlenden Zieljahr. Der Satz fasst beides zusammen, vertretbar. |
| "Wegen der ersten Rechnung wissen wir nicht, wie stark die spaeteren Korrekturen ... verschieben" | Analysebericht Abschnitt 5 (S2, "Folge") | bestaetigt | |
| Kopf: Gate-Dateien (Validierungsbericht inkl. Nachpruefung 1 und 2, 0 kritisch; Freigabe der Ergebnisse 11.11.2026) liegen vor | `Validierungsbericht_...md`; `Freigabe_Ergebnisse_Daniel_Saure_2026-11-11.md` (nennt "inklusive Nachpruefung 1 und 2 (0 kritisch)") | bestaetigt | Beide Dateien gelesen (Kopfzeilen); Gesamturteil des Validators: "Keine kritischen Befunde". |
| Kopf: Faktencheck bedingt, 0 kritisch, 4 hoch, 8 mittel, 6 gering | `faktencheck.md` (Gesamturteil) | bestaetigt | |
| Kopf: Nachpruefung 1 bedingt, 0 kritisch; Rest N1 und N2 | `faktencheck_nachpruefung1.md` | bestaetigt | N1 war "hoch", N2 "mittel"; N3 bis N6 gering. Formulierung "als Rest" ist zutreffend. |
| Kopf: N1 bis N5 in v0.3 geaendert, Pruefung dieser Aenderungen steht aus | dieser Faktencheck | bestaetigt (wahrheitsgemaess) | Zum Zeitpunkt der Pruefung stimmt der Satz. Nach Vorliegen dieser Datei muss er vom Autor aktualisiert werden (siehe N9). |
| Kopf: GitHub-Link [3], G1/G2/G4/G5, H4 offen | Nachpruefung 1; Auftrag | bestaetigt | Als bekannt offen gefuehrt. |
| Kopf: Quellenlinks [1] eingetragen und geprueft (200); Links am 12.11.2026 geprueft | eigener Abruf von 5 von 6 URLs (PDF-Inhalt erhalten); 6. URL (PB2023, ca. 11 MB) ueberschritt das Abruflimit des Werkzeugs, was zur Dateigroesse in `run_log.txt` passt (11.167.873 Bytes) | bestaetigt (erreichbar) | HTTP-Statuscode "200" selbst nicht beobachtet (Werkzeug zeigt ihn nicht), ein Linkpruefprotokoll liegt nicht als Datei vor. Siehe N9. |
| Kopf: H26 (Analysebericht auf 810) und H27 (Grafik 3 neu) | Analysebericht Abschnitt 4; Protokoll G (H26, H27); Skript `04_grafik3_beschriftung.R`; PNG | bestaetigt | Siehe Abschnitt Grafik 3. |

## Quellenliste [1]: URL-Abgleich mit `run_log.txt`

Abgleich gegen die Dateitabelle (Spalte url, Zugriff jeweils 2026-10-22, 16:37 bis 16:47 UTC).

| Eintrag in [1] | URL im Artikel = URL in run_log? | Name/Jahr/Fassung | Ergebnis |
|---|---|---|---|
| 2015, Fassung April 2015 (MMS), Eionet CDR | identisch (Zeile "eea_reportnet_cdr/2015_envvqlq8w_projektionsbericht/150422_Projektionsbericht_2015_final.pdf", envvqlq8w) | run_log Abschnitt 3.1: "Fassung April 2015 (nur MMS)", Umschlag envvqlq8w | bestaetigt; online erreichbar (PDF) |
| 2015, Fassung September 2016 (MWMS), Eionet CDR | identisch (projections/envv_vp1a/160928_PB2015_MWMS.final.pdf) | run_log: "Fassung 'ergaenzt durch MWMS'", hochgeladen 28.09.2016 | bestaetigt; online erreichbar (PDF) |
| 2017 (UBA) | identisch (`.../372/dokumente/projektionsbericht_2017_uba_website.pdf`) | run_log 3.1 PB2017 | bestaetigt; online erreichbar (PDF) |
| 2019 (UBA) | identisch (`.../projektionsbericht-2019_uba_website.pdf`) | run_log 3.1 PB2019 | bestaetigt; online erreichbar (PDF) |
| 2021 (UBA) | identisch (`.../projektionsbericht_2021_uba_website.pdf`) | run_log 3.1 PB2021 | bestaetigt; online erreichbar (PDF) |
| 2023 (Climate Change 39/2023) | identisch (`.../11850/publikationen/39_2023_cc_projektionsbericht_12_23.pdf`) | run_log 3.1: "UBA Climate Change 39/2023" | bestaetigt (URL); Online-Abruf wegen Dateigroesse nicht durchgefuehrt |

Weitere Angaben in [1]: "abgerufen 22.10.2026" stimmt mit dem Zugriffsdatum aller Dateien ueberein. "Datenablage der Europaeischen Umweltagentur (Eionet CDR)" entspricht dem Host cdr.eionet.europa.eu (run_log: "EEA Reportnet CDR"). Quelle [2] (Trendtabelle, 15.01.2026, Dateiname und URL; KSG-Uebersicht 15.03.2026) ebenfalls mit run_log Abschnitt 3 und Dateitabelle identisch (nicht Gegenstand der Aenderung, nebenbei bestaetigt).

## Grafik 3 und Analysebericht E1 (H27, H26)

| Pruefpunkt | Ergebnis | Hinweis |
|---|---|---|
| PNG `output/grafik3_E5_zerlegung_2020.png` angesehen. Legende: "Startpunktabweichung (Abstand im Ausgangsjahr)", "additive Verlaufsabweichung", "E_unb gesamt"; keine Nennung "Inventarrevision/GWP" in der Legende | bestaetigt | Die frueher beanstandete Ursachenzuschreibung in der Legende ist weg. |
| Balken und Beschriftung gegen `e5_zerlegung.csv` (MMS, 2020): 2015: 22 + 87 (E_unb 110); 2017: 7 + 79 (85); 2019: 10 + 94 (105); Faktoren 0,976 / 0,993 / 0,989 | bestaetigt | Im Bild: Startpunktbalken ca. 22, 7, 10; Raute 110, 85, 105; Faktoren korrekt. Die Artikelzahlen (22 von 110, 7 von 85, 10 von 105; 20 / 8 / 10 %) stimmen mit CSV und Grafik. |
| Skript `04_grafik3_beschriftung.R` zeichnet aus `e5_zerlegung.csv`, keine Rechnung | bestaetigt | Gerundete Mt-Werte als Eingabe, daher Stapelhoehen 109 / 86 / 104 statt 110 / 85 / 105 (im Skriptkopf und Protokoll H27 offen genannt); in der Grafik sichtbar als Abstand von bis zu 1 Mt zwischen Balkenoberkante und Raute. Siehe N10. |
| Untertitel der Grafik: "Ohne Bereinigung um spaetere Inventarrevisionen; Zerlegung ist keine Ursachenanalyse" | Hinweis (gering) | Siehe N7. |
| Analysebericht Abschnitt 4, E1-Tabelle PB2017 = 810 (H26) | bestaetigt | 810 - 731 = 79; `e1_ergebnisse.csv` laut Nachpruefung 1: 810. Die restlichen 811 im Bericht (Band bereinigt) sind richtig. |
| Protokoll H26/H27 beschreiben die Aenderung wahrheitsgemaess (nur Beschriftung/Rundung, keine Methode, keine Kennzahl) | bestaetigt | Eintraege in Abschnitt G des Abweichungsprotokolls, Entscheidungsspalte "offen". |

## Einordnungs-Check (keine neue Berechnung/Inferenz)

Die geaenderten Saetze enthalten keine neue Berechnung. Alle Zahlen (0,976 bis 0,995, 0,1, minus 1,5 / minus 1,6 / minus 1,5, 4 von 5, 3 von 3, 22/110, 7/85, 10/105) stehen in den CSV-Dateien oder im Analysebericht. Die Rundungen (-1,4667 zu -1,5; -1,5657 zu -1,6) sind korrekt und im Analysebericht gedeckt. Die im Artikel neu gesetzte Begruendung bei Bullet 4 ("variieren nur einzelne Annahmen") ist eine Paraphrase des Analyseberichts, keine eigene Inferenz. Verbleibende Aussage ohne Projektquelle: "Das Umweltbundesamt rechnet die Reihe jedes Jahr neu" (Allgemeinwissen, N8).

## Neue Befunde mit Schweregrad

| Nr. | Fundstelle | Befund | Schweregrad | Vorschlag |
|---|---|---|---|---|
| N7 | Grafik 3, Untertitel (`04_grafik3_beschriftung.R`, Zeile mtext): "Ohne Bereinigung um spaetere Inventarrevisionen" | Beschreibt die unbereinigte Skala, legt aber nahe, dass der Startpunktabstand eine Inventarrevision ist. Das ist im Projekt ausdruecklich nicht belegt (Analysebericht Abschnitt 3 und 5, H19; S2 nicht gerechnet) und steht im Gegensatz zum Artikeltext ("Ob das die Abweichung erklaert, haben wir nicht untersucht"). Dieselbe Formulierung steht in der S1-Zeile des Analyseberichts und im SAP (dort als Definition der Skala). | gering | Untertitel neutral: "Ohne Umrechnung auf das heutige Inventar des Ausgangsjahres; Zerlegung ist keine Ursachenanalyse". Wenn Grafik 3 ohnehin neu erzeugt wird, zugleich Achsen- und Legendenkuerzel ("E_unb", ASCII-Umlaute wie "fuer") lesbar machen. |
| N8 | Artikel, "Was wir verglichen haben", Absatz 2: "Das Umweltbundesamt rechnet die Reihe jedes Jahr neu." | Allgemeinwissen, in den Projektdateien nicht belegt (Analysebericht fuehrt methodische Neuberechnung als ungeprueft Hypothese). Neben dem Folgesatz ("Ob das die Abweichung erklaert ...") bleibt eine leichte Suggestion, die Neuberechnung sei der Grund. | gering | Entweder mit Fundstelle belegen (NIR 2026, Kapitel Neuberechnungen, oder UBA-Seite) oder streichen / relativieren ("Das Umweltbundesamt aktualisiert die Reihe regelmaessig"). |
| N9 | Kopf (Entwurfsbanner) | (a) Kopf sagt, die Pruefung der v0.3-Aenderungen "steht aus"; das ist jetzt zu aktualisieren (Verweis auf `../faktencheck_nachpruefung2.md`). (b) "geprueft (200)": ein Linkpruefprotokoll liegt nicht als Datei vor; HTTP-Code von mir nicht beobachtet, Erreichbarkeit fuer 5 von 6 URLs bestaetigt. (c) Name und Chat-Zitat im Banner (G6) weiter vorhanden. | gering | Kopf nach Vorliegen dieser Datei anpassen; Linkpruefung kurz als Datei festhalten oder Formulierung "erreichbar (am 12.11.2026 geprueft)" waehlen; Banner vor Veroeffentlichung entfernen. |
| N10 | Grafik 3, Stapelhoehen | Balken addieren gerundete Teilwerte (109 / 86 / 104), die Raute zeigt 110 / 85 / 105; Differenz bis 1 Mt sichtbar. Offengelegt im Skript und Protokoll, nicht im Artikel. | gering | Fussnote oder Beschriftung "Teilwerte gerundet, Summen koennen um 1 Mt abweichen"; oder Skript mit ungerundeten Werten aus `e5_zerlegung`-Quelle (paare_alle_voll.csv) laufen lassen. |

## Weiterhin offen, nicht als Fehler gewertet

- GitHub-Link [3] (erst nach Push und Pruefung auf 200).
- G1, G2, G4, G5 (bewusst nicht eingearbeitet); G3 teilweise.
- H4: Der Satz "Die Redaktion hat ... diesen Text ... gelesen und freigegeben" gilt erst nach Daniel Saures Textfreigabe als Datei.
- G6 (Name und Chat-Zitat im Kopf), Legende-Hinweis siehe oben erledigt.

## Nicht geprueft

- Inhalt der Quell-PDFs, UBA-xlsx; fuer die PB2023-URL kein Online-Abruf (Dateigroesse).
- Chat-Zitat zur Titelentscheidung im Kopf (nicht pruefbar).
- Unveraenderte Artikelstellen (siehe Nachpruefung 1 und Erstcheck).
- Grafik 1 und 2.
- Keine Freigabevermerke geschrieben, der Artikel wurde nicht veraendert.
