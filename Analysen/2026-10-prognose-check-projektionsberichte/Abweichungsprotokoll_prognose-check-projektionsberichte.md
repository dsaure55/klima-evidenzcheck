# Abweichungsprotokoll – Prognose-Check #1 (Projektionsberichte 2015–2023)

SAP: `SAP_prognose-check-projektionsberichte.md`, v1.2 final (inkl. Amendment 1 vom 22.10.2026 und Amendment 2 vom 09.11.2026)
Stand: 11.11.2026, analyst-Subagent (Claude). Skript: `02_auswertung.R` (Auswertung), `01_integritaet.R` (Integrität, 22.10.2026).
Nicht committet.

Alle Punkte sind **Post-hoc** oder **Rückfrage an Mensch**. Die Spalte „Entscheidung Daniel Saure“ ist bewusst überall „offen“.
„Wirkung“ nennt, soweit gerechnet, den Einfluss auf Kennzahlen. Kein Punkt wurde als Stopp gewertet, weil jeweils eine
SAP-konforme Lesart oder eine SAP-Regel („entfällt“, „nicht durchgeführt, Grund“) zur Verfügung stand; ob Daniel das anders sieht, ist offen.

## A. Festlegungen für Punkte, die der SAP offenlässt (Rückfragen R2–R6 aus dem Zwischenbericht vom 22.10.2026)

| Nr. | SAP-Stelle | Was der SAP regelt / offenlässt | Was ich festgelegt habe | Wirkung | Entscheidung Daniel Saure |
|---|---|---|---|---|---|
| H1 (R2a/b) | 3.1, 4.2 | PB2015 existiert in zwei Fassungen (April 2015 nur MMS; Sept. 2016 „ergänzt durch MWMS“). Welche gilt, ist nicht geregelt. | MMS aus Fassung April 2015; MWMS aus Fassung Sept. 2016 (einzige amtliche Quelle für MWMS 2015, enthält aber das MWMS erst seit Sept. 2016, also nach dem Berichtsjahr). Gesamt und die verwendeten Sektoren (Industrie, Übrige) sind in beiden Fassungen identisch (`abgleich_berichtsintern.csv`). | Keine Wirkung auf MMS-Gesamt. E3-Paare für PB2015 (2) hängen an der MWMS-Fassung 2016. | offen |
| H2 (R2c) | 2.1, 3.5.3 | PB2015 weist Haupttabellen in IPCC SAR und eine „angenäherte“ AR4-Umrechnung (Anhang A6) aus. | Als P gilt die Haupttabelle (SAR), „wie im Bericht ausgewiesen“. AR4-Variante als Post-hoc-Vergleich (`posthoc_pb2015_gwp_sar_vs_ar4.csv`). | RE* 2020 (MMS): 12,3 % (SAR) vs. 12,0 % (AR4); RE* 2015: −1,4 % vs. −1,5 %. Faktor 0,976 vs. 0,983. | offen |
| H3 (R3) | 3.1, 4.2 | Zählen die deutschen EU-Templates (MMR Tabelle 1, Reportnet CDR) als „amtlicher Datenanhang“ mit Vorrang? | Nein; nur im Bericht bzw. im amtlichen Datenanhang (PB2023 xlsx) explizit ausgewiesene Jahre (SAP 4.2). Templates/EEA-Datenbank nur Kreuzprüfung (Skript 01). | Zieljahre 2016–2019 (die nur in EEA/Templates stehen) erscheinen nur in S5 (Interpolation), nicht als echte Werte. | offen |
| H4 (R4) | 4.4 | Zuordnungstabelle CRF → KSG-Sektoren; PB2015 liefert nur Quellbereiche und BMUB-Zuschnitt (Fassungen unterscheiden sich). | Zuordnung in `output/zuordnungstabelle_sektoren.csv`. PB2017/2019: KSP-2050-Sektoren = KSG-Sektoren (CRF-Zuordnung laut PB2017 Tab. A-5-2, PDF-S. 291/292, und CC 33/2019 Tab. 1 gelesen; 1.A.3.e → Energiewirtschaft, 1.A.4.c → Landwirtschaft, wie KSG). PB2021/2023: Namensgleichheit mit KSG-Sektoren, Definition nicht neu gegen KSG-Anlage 1 geprüft. **PB2015: nur Industrie und Abfallwirtschaft/Sonstiges zugeordnet**; Energiewirtschaft, Gebäude, Verkehr, Landwirtschaft entfallen für PB2015 (1.A.4.c im Bericht in GHD, 1.A.3.e im Verkehr; nicht separat ausgewiesen). Die Zuordnung „Übrige = Abfall/Sonstiges“ stützt sich auf identische Zahlen mit dem Quellbereich Abfallwirtschaft; Restunschärfe 5.C nicht prüfbar. | Sektor-E4 enthält PB2015 nur für zwei Sektoren. | offen |
| H5 (R5) | 6 (S2), 3.2, 13.4 | „Erste Submission, die t enthält“: EU-Submission Januar t+2 oder UNFCCC April t+2? Dateien nicht beschafft. | **S2 nicht durchgeführt**, Grund: frühere Inventarsubmissionen nicht beschafft; Definition offen. Keine Ersatzrechnung. | E1/E2 ohne S2-Zeile. Revisionswirkung nur indirekt über Faktoren (Tab. Umskalierungsfaktoren) und E5/S1 sichtbar. | offen |
| H6 (R6) | 3.5.1 | Zweite unabhängige Übertragung der Sektorwerte ohne EEA-Gegenstück (Sichtprüfung des analyst ist keine unabhängige Zweitübertragung). | Nicht behebbar im analyst-Lauf; bleibt offen. Betroffen: Sektorwerte KSP/KSG 2017–2023, MWMS 2015, BMUB-Zuschnitt. Gesamtwerte sind gegen EEA abgeglichen (außer PB2015 MWMS). | Unsicherheit bei E4 und MWMS 2015 (E3); Gesamt-MMS-Kernzahlen nicht betroffen. | offen |

## B. Weitere Post-hoc-Festlegungen bei der Umsetzung

| Nr. | SAP-Stelle | Festlegung | Wirkung | Entscheidung Daniel Saure |
|---|---|---|---|---|
| H7 | 6 (S5) | Stützjahre der Interpolation = ausschließlich explizit ausgewiesene **Projektions**jahre; der historische J_b-Wert ist keine Stützstelle. Endpunkte außerhalb des Fensters (z. B. 2025) dürfen Stützjahr sein (Interpolation, keine Extrapolation). 16 Zusatzpaare (PB2015: 2016–19, 2021–24; PB2017: 2021–24; PB2019: 2021–24). | S5: n = 26 statt 10. | offen |
| H8 | 5.1.3, 6 (S8) | Bei h' = t − Berichtsjahr tritt h' = 0 auf (t = Berichtsjahr). Horizontklasse „≤ 0“ ergänzt. | S8-Tabelle enthält Klasse „h' ≤ 0“ (n = 3). | offen |
| H9 | 6 (S9) | „Gesamt mit LULUCF“ = Gesamt + Zeile LULUCF des Berichts (ohne internationalen Verkehr); Referenz: Zeile „mit LULUCF“ der KSG-Übersicht. Berechenbar nur, wo der Bericht LULUCF für J_b und t ausweist: PB2017 und PB2019 (t = 2020). | n = 2 (< 3), nur Einzelwerte. | offen |
| H10 | Amendment 2 | 2020-Wert in Tab. 126 (PB2021) ist **kein** Auswertungspaar und in keiner Kennzahl enthalten. Er wird getrennt als Post-hoc-Information gezeigt (`posthoc_pb2021_2020_wert_info.csv`). Skript bricht ab, falls der Wert nicht als „hist“ geführt wäre. | Information: RE_unb +1,2 %, RE* +0,2 %. Kein Einfluss auf E1–E5, Tabelle 3. | offen |
| H11 | 4.3, 5.1.3 | Mindestzellgröße 3 wird auf MRE, MdRE, MAPE, k/n, Min/Max und den Median von D (E3) angewandt; bei n < 3 nur Einzelwerte (Tabelle 2). | Horizontzellen „1–3 J.“ (n = 2) und „≥ 7 J.“ (n = 1) ohne Kennzahl. | offen |
| H12 | 5.2 | Der SAP schließt Durbin-Watson/Ljung-Box/Shapiro-Wilk ausdrücklich aus (5.2). Sie wurden **nicht** gerechnet (Vorgabe des SAP geht der allgemeinen Diagnoseregel des analyst vor). | – | offen |
| H13 | 5.4 | Unsicherheitsbänder der Berichte: keine Treffer für Band-Begriffe (Unsicherheitsband, Bandbreite, Konfidenz …) in den fünf PDF-Texten; „Sensitivit…“ kommt in allen Berichten vor, wurde **nicht** inhaltlich ausgewertet. In den extrahierten Gesamttabellen für 2020 ist kein Band ausgewiesen; Prüfung „Ist-Wert im Band“ daher nicht durchgeführt. Das ist eine Textsuche, keine vollständige inhaltliche Prüfung. | E1 ohne Bandvergleich. | offen |
| H14 | 3.5.4 | OWID liegt in allen Jahren 2015–2024 um 5,7–6,6 % unter dem UBA-Inventar (Zwischenbericht). Erläuterung (AR6- vs. AR5-GWP, Gasabdeckung) ist Hypothese, nicht verifiziert; GCP-Datei fehlt (Lizenzformular). Keine Änderung der Primärquelle (SAP). | Keine Wirkung auf Kennzahlen. | offen |
| H15 | 3.2 | Für „Gesamt“ 1990–2024 wird die Trendtabelle verwendet, für Sektoren die KSG-Übersicht; beide sind für Gesamt identisch (Differenz 0,000 Mt), Summe der sechs KSG-Sektoren = Gesamt (Differenz 0,000 Mt). | – | offen |
| H16 | 2.1 / 3.5.6 | PB2023: Zieljahr-Werte 2023/2024 aus dem amtlichen Datenanhang (Vorrang, SAP 3.1); der historische J_b-Wert 2019 (Datenanhang enthält 2019 nicht) aus PDF-Tabelle 17 (auf 0,1 Mt gerundet). | Gerundeter Nenner des Faktors (802,0). | offen |
| H17 | 3.5 Pkt. 1 | Die Extraktion der PDF-Tabellen erfolgte über Wortkoordinaten (P2 aus Skript 01); einzelne PB2015-Zahlen wurden nicht übernommen, wenn die Textebene sie abschnitt (nur 1990/2005-Werte, nicht analyserelevant). | – | offen |

## C. Nicht durchgeführte Teile (laut SAP 6 „nicht durchgeführt, Grund: …“)

| Teil | Grund | Entscheidung Daniel Saure |
|---|---|---|
| S2 Inventarrevision | **[H21: Unterlassung, nicht Datenlage]** frühere Inventarsubmissionen nicht beschafft; „Erstveröffentlichung“ nicht eindeutig (H5) | offen |
| S6 erweiterte Berichtsmenge (UBA-Projektionsdaten 2024/2025) | **[Begründung in H20 präzisiert und belegt: J_b PB2024 = 2022, kein P(b,s,J_b) in den beschafften Dateien; PB2025 ohne Zieljahr im Fenster]** Ursprünglich: Die beschafften Datenblätter enthalten keinen historischen Wert (Zeitreihen beginnen 2024 bzw. 2025), also kein P(b,s,J_b,k) (Regel 2.1 Nr. 3); J_b für diese Berichte ist nicht bestimmt (3.5-Checks für S6 wurden in Skript 01 nicht gemacht; Hauptbericht 2024 nicht beschafft). Der 2025er Bericht hat kein Zieljahr ≤ 2024. | offen |
| Ist-Wert im Unsicherheitsband (5.4) | **[nachgeholt in H18]** ursprünglich: siehe H13 | offen |
| GCP-Abgleich fossiles CO2 (3.3) | Datei fehlt (Lizenzformular, `rohdaten/download_offen.md`) | offen |

## D. Einordnung der Stopp-Regeln

- 3.5 Pkt. 5 (J_b nicht eindeutig): war am 22.10.2026 ausgelöst und ist durch Amendment 1 aufgelöst. Kein erneuter Stopp.
- 3.5 Pkt. 6 / Regel 2.1 Nr. 3: P(b,s,J_b,gesamt) liegt für alle fünf Berichte und alle ausgewiesenen Szenarien vor; auch für alle 48 Berichts-Szenario-Sektor-Reihen. Kein Bericht fällt aus der Primärpopulation. Es gibt keinen Fall von Regel 2.1 Nr. 3 in der Primärpopulation.
- 3.5 Schlusssatz („Unstimmigkeiten, die sich nicht auflösen lassen“): Die Rückfragen R2–R6 hätten als solche gelesen werden können. Ich habe sie nicht als Stopp gewertet, sondern mit den Festlegungen H1–H6 ausgewertet und die Wirkung dort benannt. Wenn Daniel dies anders sieht (insbesondere H4 oder H6), muss die betroffene Auswertung (E4 bzw. MWMS 2015) wiederholt werden.

## E. Ergänzungen nach Validierung (Post-hoc / nach Validierung, 11.11.2026)

Anlass: `Validierungsbericht_prognose-check-projektionsberichte.md` (bedingt freigabefähig, 0 kritisch). Umsetzung in `03_ergaenzungen.R` (Skript 02 unverändert in Rechnung und Ausgaben; im Kopfkommentar wurde nur die H-Nummerierung an dieses Protokoll angeglichen, B10). B1 (H3) und B2 (H4/H6) bleiben **unverändert** und sind im Analysebericht als offene, methodenrelevante Festlegungen mit Wirkung benannt (Abschnitt 7, E4 als vorläufig gekennzeichnet).

| Nr. | Auflage | Was ergänzt wurde | Wirkung | Entscheidung Daniel Saure |
|---|---|---|---|---|
| H18 | B4 (SAP 5.4) | **Ergänzung der Auswertung.** Die Prüfung „Ist-Wert im Band der Berichte“ wurde nachgeholt: Sensitivitätstabellen für Gesamt 2020 in PB2015 (Tab. 3-77, PDF-S. 196), PB2017 (Tab. 3-133, S. 274), PB2019 (Tab. 106, S. 216) von Hand aus der PDF-Textebene übertragen (keine Doppelübertragung; MMS-Referenzzeile gegen Extraktionstabelle kontrolliert). Das „Band“ ist die Spannweite der Einzel-Sensitivitäten (keine statistischen Unsicherheitsbänder). Bereinigung mit demselben Faktor wie P\*, unbereinigt zusätzlich. PB2015-Korridor (−31,9 % bis −35,0 % ggü. 1990) nur näherungsweise in Mt. PB2017 „weniger Stromexport“ für MMS aus MWMS übernommen (Bericht Fußn. 3). PB2021/2023: für E1 entfällt (kein 2020-Paar). | Ist 2020 lag in allen drei Berichten unterhalb der gesamten Spannweite (bereinigt: PB2015 805–828, PB2017 775–823, PB2019 814–825 Mt; Ist 731 Mt). Keine Änderung der Kernzahlen. | offen |
| H19 | B3 | Abfall-Faktoren beschreibend erläutert (Bericht-/Inventarwerte, Spannweite je Sektor); unbelegte Zuschreibung „Inventarrevision/GWP-Wechsel“ gestrichen. Hypothesen (Abgrenzung; methodische Neuberechnung) ausdrücklich als nicht geprüft markiert; GWP-Wechsel allein passt nicht zur Richtung. Sektorergebnis Abfall als nicht belastbar gekennzeichnet. Ursache nicht belegt (nicht nachgeschlagen in NIR/Berichtsmetadaten). | Keine Änderung der Zahlen. | offen |
| H20 | B6 (S6) | S6 geprüft: PB2025: Basisjahr 2023, 2024 = Vorjahresschätzung, Daten ab 2025, kein Zieljahr im Fenster. PB2024: J_b = 2022 (Inventar bis 2022; Vorjahresschätzung 2023 floss nicht in die Modellierung; Ergebnisse kompakt 2024 PDF-S. 8, 11), **nicht** 2023. Historischer Wert 2022 in beschafften Dateien nur grafisch, Hauptbericht 2024 nicht beschafft → kein P(b,s,J_b). S6 bleibt „nicht berechenbar“, nun belegt. J_b = 2022 für PB2024 wäre von Daniel zu bestätigen (analog Amendment 1). Zusatzinfo (kein S6, in keiner Kennzahl): 2024-Wert der Projektionsdaten 2024: MMS 677,4, MWMS 676,7 Mt, RE_unb +4,2 % / +4,1 %. | Keine. | offen |
| H21 | B5 (S2) | Begründung korrigiert: Unterlassung (früheren Submissionen nicht beschafft), nicht Datenlage. Nicht nachgeholt, weil „erste Submission mit t“ nicht eindeutig (EU Januar vs. UNFCCC April, R5 unbeantwortet; Januar-Fassung 2024 nicht gefunden) und eine Festlegung Daniel zusteht. Kein Netzzugriff versucht. | S2 fehlt weiter. | offen |
| H22 | D1 | Satz „gemeinsamer Ausschlag in 2020, konsistent mit Corona“ ersetzt durch zahlengedeckte Aussage (MRE 10,9 → 10,4 % ohne 2020; 2023/2024 höher als 2020); keine Ursachenzuschreibung. | Nur Text. | offen |
| H23 | L1 | Limitationen ergänzt: kleine Primärpopulation (H3), 6 von 10 Paaren aus PB2021/PB2023, Corona-Schock gilt dort nicht gleich, h' = 0/1 bei PB2023/PB2021, Abfall-Sektor. | Nur Text. | offen |
| H24 | B7 | Leave-one-report-out für E3 ergänzt (`diag_e3_leave_one_report_out.csv`): Median D etwa −1,5 bis −1,6 (ungerundet −1,47 / −1,47 / −1,57 / −1,47); „4 von 5“ hängt an PB2015 (ohne PB2015: 3 von 3). Herkunft PB2015-MWMS (Fassung Sept. 2016) im Bericht genannt. | Nur Ergänzung. | offen |
| H25 | B10, R1, R2, G* | H-Nummerierung im Skriptkopf 02 an dieses Protokoll angeglichen (nur Kommentar); `run_log.txt` auf „H1–H25“ und SAP v1.2 korrigiert; Mt-Rundung im Analysebericht nach SAP 11 (ganzzahlig); Prüfdateien (`summe_bereinigte_sektoren_vs_gesamt.csv`, `paare_alle_voll.csv`) behalten bewusst Nachkommastellen (keine Artikeltabellen). Grafik 1: Legende nach unten links, Jahresbeschriftungen versetzt (Datenbasis unverändert, in 03 neu erzeugt). B8 (PB2015 SAR/AR4 in einem Satz): im Analysebericht genannt. | Keine auf Zahlen. | offen |

Nicht umgesetzt: Entscheidungen zu B1 (H3) und B2 (H4/H6) (liegen bei Daniel), Prüfung der KSG-Definitionen für PB2021/2023 und zweite Übertragung (H6), Nachholen von S2 (H21).

### E.2 Textkorrekturen nach Nachprüfung 1 des validators (Post-hoc nach Nachprüfung, 11.11.2026; nur Texte, keine Methodenänderung)

| Nr. | Befund | Änderung | Entscheidung Daniel Saure |
|---|---|---|---|
| N1 | E3-Leave-one-report-out war aus gerundeten D-Werten berechnet („−1,5 in allen Varianten“) | `03_ergaenzungen.R` rechnet jetzt aus ungerundeten Werten (`paare_alle_voll.csv`) und neu gelaufen: Median D −1,47 (alle), −1,47 (ohne PB2015), −1,57 (ohne PB2017), −1,47 (ohne PB2023); `output/diag_e3_leave_one_report_out.csv` neu (2 Nachkommastellen); Analysebericht und H24 auf „etwa −1,5 bis −1,6“ geändert. n_D<0 unverändert. | offen |
| N2 | Sensitivitätsband: Einordnung | Analysebericht: Sensitivitäten variieren nur Wachstum, Bevölkerung, Preise, Stromexport, kein Pandemie-/Krisenszenario; Lage des Ist-Werts unter dem Band ist keine Aussage über die Modellierungsqualität (SAP 8.1). | offen |
| N3 | PB2017-Bandminimum | Analysebericht: Minimum 780,6 Mt stammt aus MWMS-Übernahme (Fußn. 3); ohne diesen Wert 816,9 Mt (bereinigt 811 Mt), Aussage unverändert. | offen |
