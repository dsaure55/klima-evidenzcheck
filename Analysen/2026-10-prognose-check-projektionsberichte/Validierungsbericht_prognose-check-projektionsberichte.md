# Validierungsbericht – Prognose-Check #1 (Projektionsberichte 2015–2023)

Prüfer: validator-Subagent (unabhängiges Statistik-Review), Stand 11.11.2026.
Geprüft gegen: `SAP_prognose-check-projektionsberichte.md`, v1.2 final (inkl. Amendment 1 und 2).
Geprüfte Artefakte: `02_auswertung.R` (nur Kopfkommentar, Struktur und die Stellen zu S2/S6 gelesen, nicht Zeile für Zeile), `01_integritaet.R` (nicht gelesen, nur Ausgaben), `run_log.txt`, `Abweichungsprotokoll_...md` (H1–H17), `Analysebericht_...md`, `output/`.
Es wurde nichts an den Analysedateien geändert. Prüfskripte liegen im Scratchpad, nicht im Projekt.

Hinweis zum Auftrag: Der Auftrag nennt einen "SAP-Abschnitt Validierungsbogen". Im SAP v1.2 gibt es keinen Abschnitt dieses Namens (Suche nach "Validierungsbogen" in allen .md/.R-Dateien des Ordners: 0 Treffer). Ich habe stattdessen die Checkliste und die im SAP an den validator adressierten Stellen abgearbeitet (4.4 Zuordnungstabelle "Teil der Prüfrunde des validators"; 11 "Kernaussagen erst nach Validierung").

## Gesamturteil

**Bedingt freigabefähig. Keine kritischen Befunde, aber 3 Befunde mit Schweregrad "hoch" (B1/B2 als Entscheidung für Daniel, B3, B4), die vor einer Veröffentlichung entschieden bzw. nachgearbeitet werden müssen.** Das Gate nach CLAUDE.md ("Validierungsbericht ohne kritisch") ist formal erfüllt. Die Rechnung selbst ist korrekt und reproduzierbar (E1–E5 und S1, S3, S4, S7 unabhängig nachgerechnet, Abweichung kleiner 1e-9). Die Schwächen liegen bei Datenabgrenzung und Entscheidungen, die der SAP offenließ (H3, H4), bei zwei nicht durchgeführten Sensitivitäten (S2, S6) mit schwacher Begründung, bei der nicht inhaltlich geprüften Berichts-Sensitivitätsrechnung (SAP 5.4) und bei einer Textaussage im Analysebericht, die die Zahlen nicht tragen ("gemeinsamer Ausschlag in 2020").

| Nr. | Prüfpunkt | Ampel |
|---|---|---|
| 1 | SAP-Konformität | Abweichung (hoch) |
| 2 | Diagnostik | bestanden (1 mittlerer Hinweis zur Interpretation) |
| 3 | Mehrfachtestung/Cherry-Picking | bestanden |
| 4 | Rechenprüfung | bestanden (Prüfgrenze siehe Abschnitt 8) |
| 5 | Limitationen sichtbar | Abweichung (mittel) |
| 6 | Rundung/Darstellung | Abweichung (gering) |

## 1. SAP-Konformität

Bestätigt konform: Primärskala P* mit Umskalierung je Reihe (Regel 2.1 Nr. 1, 2); J_b nach Amendment 1 (2012/2014/2016/2018/2019); Amendment 2 (2020-Wert in Tab. 126 von PB2021 = 739,5 Mt ist im Datensatz Typ "hist", in keiner Kennzahl enthalten, getrennt als Post-hoc-Info; geprüft in `reihen_P_verwendet.csv` und `paare_alle_voll.csv`); Referenzinventar Submission 2026; Gesamt ohne LULUCF; keine Tests, keine p-Werte; Horizontklassen 1–3/4–6/≥7; Mindestzellgröße 3; Leave-one-report-out; Faktor-Tabelle; Summe bereinigter Sektoren vs. Gesamt; E5 additiv/unbereinigt; S1+S3a; S3a/S3b/S4/S5/S7/S8/S9 vorhanden. Paarzahlen (10 Gesamt/MMS; 5 E3-Paare; 16 Zusatzpaare S5) stimmen mit den Quelltabellen überein.

### Befunde

**B1 (hoch) – H3: EU-Templates/EEA-Jahreswerte nicht als "amtlicher Datenanhang" gewertet.**
Fundstelle: Abweichungsprotokoll H3; Skriptkopf (H3); SAP 3.1 ("amtliche Daten- bzw. Tabellenanhänge", "Datenanhang hat Vorrang") und 4.2 ("explizit einen Jahreswert ausweist").
Wirkung: Die Primärpopulation schrumpft auf 10 Paare; Horizontklassen "1–3 J." (n = 2) und "≥ 7 J." (n = 1) bleiben ohne Kennzahl; Zieljahre 2016–2019 der Berichte 2015/2017/2019 erscheinen nur interpoliert (S5, 16 Paare). Das ist die wichtigste Stellschraube der Auswertung und methodenrelevant, nicht harmlos. Der SAP regelt die Frage nicht ausdrücklich; die Lesart des analyst ist vertretbar, aber nicht zwingend. Entscheidung Daniel: "offen".
Vorschlag: Daniel entscheidet vor Berichtserstellung ausdrücklich (Amendment 3 oder Bestätigung der Lesart). Falls Templates zählen sollen: neu rechnen. Im Bericht mindestens ein Satz, dass die Primärpopulation durch diese Festlegung klein ist und welche Alternative es gäbe.

**B2 (hoch) – H4/H6: Sektorzuordnung und E4.**
Fundstelle: `output/zuordnungstabelle_sektoren.csv`; Protokoll H4, H6; SAP 4.4 ("Teil der Prüfrunde des validators").
(a) Für PB2015 sind nur 2 von 6 Sektoren zugeordnet. Das ist nach SAP 4.4 zulässig ("entfällt"), führt aber zu ungleicher Berichtsbasis je Sektor (Energiewirtschaft/Gebäude/Verkehr/Landwirtschaft n = 8, Industrie/Abfall n = 10); die Sektor-MRE sind nicht direkt vergleichbar. Der Analysebericht nennt n je Sektor (gut), warnt aber nicht ausdrücklich vor dem Sektorvergleich.
(b) Für PB2021 und PB2023 gilt als Zuordnung nur Namensgleichheit ("Definition nicht erneut gegen KSG-Anlage 1 geprüft"). Das ist eine unbelegte Annahme in einer Tabelle, die laut SAP vom validator zu prüfen ist. Ich habe die KSG-Definitionen selbst nicht gegengelesen (siehe Abschnitt 8). Die Zuordnung PB2017/2019 stützt sich auf zitierte Fundstellen (Tab. A-5-2, CC 33/2019 Tab. 1), die ich nicht gegengelesen habe.
(c) PB2015 "Übrige = Abfallwirtschaft und Sonstiges" stützt sich nur auf identische Zahlen mit CRF 5; "Restunschärfe 5.C nicht prüfbar".
(d) H6: Sektorwerte ohne EEA-Gegenstück (KSP/KSG-Sektoren PB2017–2023, MWMS 2015) sind nicht doppelt unabhängig extrahiert (SAP 3.5.1). Stichprobe von mir: PB2023 Energiewirtschaft und Industrie 2023 (287,876 / 177,598) stimmen mit dem xlsx-Datenanhang überein; mehr nicht.
Vorschlag: E4 als "eingeschränkt abgesichert" kennzeichnen, bis die KSG-Definitionen für PB2021/2023 geprüft und eine zweite Übertragung vorliegt. Kein Sektorergebnis in Überschrift, Teaser oder Grafik 1 (SAP 7 erlaubt das ohnehin nicht).

**B3 (hoch) – Sektor Abfallwirtschaft und Sonstiges: Faktoren 0,654–0,781 nicht erklärt; möglicherweise Zuordnungsproblem statt Revision.**
Fundstelle: `umskalierungsfaktoren.csv`; Analysebericht Abschnitte 3 und 5; SAP 5.2 Nr. 5 ("werden erläutert (Ursache laut Bericht/Inventar)").
Befund: In allen fünf Berichten (8 von 48 Reihen) liegt der Faktor außerhalb 0,90–1,10 und sinkt systematisch von 0,771 (PB2015) über 0,781, 0,753, 0,735 auf 0,654 (PB2023). Die Berichtswerte im Ausgangsjahr (13,6 / 11,6 / 10,5 / 9,7 / 10,1 Mt) liegen 23–35 % über dem heutigen Inventarwert für dasselbe Jahr (10,5 / 9,1 / 7,9 / 7,1 / 6,6 Mt). Das ist mit "Inventarrevision/GWP-Wechsel" nicht belegt; eine abweichende Sektordefinition (z. B. Abfallverbrennung, 5.C, Abgrenzung KSG "Sonstiges") ist mindestens ebenso plausibel. Der analyst schreibt "Ursache: nicht verifiziert" und erfüllt damit die SAP-Pflicht zur Erläuterung nicht. Zusätzlich steht im Analysebericht Abschnitt 5, die S1-Differenz zeige, "wie stark die unbereinigte Skala von Inventarrevisionen in kleinen Sektoren abhängt". Das ist eine unbelegte Ursachenzuschreibung (SAP 8.0).
Wirkung: Die proportionale Umskalierung (SAP 9) ist ungeeignet, falls es Definitionsunterschiede sind. Sektor-MRE bereinigt 2,8 %, unbereinigt 40,6 %.
Vorschlag: (1) Ursache in Berichten/Inventarmetadaten nachschlagen und belegt erläutern; (2) sonst Sektorergebnis Abfall ausdrücklich als nicht belastbar kennzeichnen; (3) Formulierung zu "Inventarrevisionen" streichen oder als Hypothese kennzeichnen.

**B4 (hoch) – SAP 5.4: Prüfung "Ist-Wert im Band der Berichte" nicht durchgeführt, Begründung unzureichend.**
Fundstelle: Protokoll H13; `output/unsicherheitsband_textsuche.csv`.
SAP: "Falls die Berichte selbst Unsicherheitsbänder oder Sensitivitätsrechnungen zu ihren Projektionen ausweisen, wird für E1 zusätzlich berichtet, ob der Ist-Wert innerhalb dieses Bandes lag." Die Textsuche nach Band-Begriffen ergab 0 Treffer, aber "Sensitivit…" kommt in allen fünf Berichten auf 19–25 Seiten vor (u. a. PB2015 S. 189–196, PB2017 S. 270–276, PB2019 S. 212–216, PB2021 S. 335–343). Diese Seiten wurden nicht inhaltlich ausgewertet. Die Bedingung des SAP ist damit voraussichtlich erfüllt, die Prüfung bleibt aber offen. Das ist keine zulässige "entfällt"-Begründung.
Vorschlag: Sensitivitätsabschnitte der drei E1-Berichte (PB2015/2017/2019) auf ausgewiesene Szenario-Bänder für 2020 sichten (Wert, Fundstelle) und für E1 deskriptiv berichten, ob der Ist-Wert im Band lag, oder belegt feststellen, dass keine für 2020 ausgewiesen sind.

**B5 (mittel) – S2 "nicht durchgeführt": Grund ist Beschaffungsunterlassung, keine Datenlage.**
Fundstelle: Protokoll H5/C; SAP 6 ("mangels Daten undurchführbar"), SAP 13 Nr. 4.
Der SAP sieht vor, die früheren Submissionen zu beschaffen. Das ist nicht geschehen. Die Definition "erste Submission, die t enthält" ist zwar mehrdeutig (EU-Submission Januar t+2 vs. UNFCCC April t+2), hätte aber als Rückfrage vor der Auswertung gestellt werden können. Formal erfüllt (SAP 6 verlangt "nicht durchgeführt, Grund"), der Grund trägt nur schwach. Folge: Wirkung der Inventarrevision auf Ist-Werte unbekannt (als Limitation genannt, gut).
Vorschlag: Daniel entscheidet, ob S2 nachgeholt (Submissionen beschaffen, Definition per Amendment) oder bewusst als nicht durchgeführt berichtet wird.

**B6 (mittel) – S6 "nicht durchgeführt": Begründung nicht belegt.**
Fundstelle: Protokoll H-Teil C; `tabelle3_sensitivitaeten_E2.csv`.
Begründung des analyst: Datenblätter ohne historischen Wert (Zeitreihen beginnen 2024 bzw. 2025); "3.5-Checks für S6 wurden nicht gemacht". Das PDF `thg-projektionen_2024_ergebnisse_kompakt.pdf` nennt jedoch "Die Emissionsdaten 2023 und die Inventare der Jahre 2021 bis 2022 … sowie die Projektionsdaten 2024 für die projizierten Jahre 2024 bis 2030"; J_b ist für die Projektionsdaten 2024 also sehr wahrscheinlich 2023, historische Werte stehen im Begleitdokument. Das xlsx weist für 2024 einen MMS-Gesamtwert von 677,4 Mt aus. Ob ein P(b,s,J_b) auffindbar ist, wurde nicht ausgeschöpft; Regel 2.1 Nr. 3 ist damit nicht belegt.
Vorschlag: J_b und Verfügbarkeit von P(b,s,J_b,k) für Projektionsdaten 2024/2025 nach 3.5 Pkt. 5/6 nachholen, dann S6 rechnen oder mit Fundstelle begründen. Betrifft nur eine Sensitivität.

**B7 (mittel) – H1 (PB2015-Fassung) und E3.**
MMS aus Fassung April 2015, MWMS aus Fassung September 2016 (nach dem Berichtsjahr veröffentlicht; kein EEA-Gegenwert). Das PB2015-Paar 2020 liefert den größten Einzelwert D = −6,9 Prozentpunkte. Nachgerechnet: Ohne beide PB2015-Paare bleibt der Median von D bei −1,5 (−1,5, −1,4, −1,7), 3 von 3 mit D negativ. Der Median ist stabil, "4 von 5" hängt an PB2015. Gesamt-MMS-Kernzahlen nicht betroffen (Gesamt/Industrie/Übrige in beiden Fassungen identisch).
Vorschlag: Herkunft der PB2015-MWMS-Werte im Bericht nennen (steht im Analysebericht) und einen LORO-Satz für E3 ergänzen.

**B8 (gering) – H2 (PB2015 GWP: SAR-Haupttabelle als P).**
RE* 2020: 12,3 % (SAR) vs. 12,0 % (AR4-Anhang A6), `posthoc_pb2015_gwp_sar_vs_ar4.csv`. Der AR4-Anhang stimmt exakt mit der EEA-Datenbank überein (6/6); die SAR-Haupttabelle liegt 6,1–8,5 Mt (0,7–1,0 %) darüber. Das erklärt die 24 EEA-"DIFFERENZ"-Zellen von PB2015 in `abgleich_eea_gesamt.csv`; dokumentiert im Zwischenbericht (3.5.1). Methodisch harmlos (0,3 Prozentpunkte). Die Alternative (AR4-Datenanhang mit "Vorrang") ist vertretbar und in einem Satz zu nennen.

**B9 (gering) – H7–H12, H14–H17.** Jeweils ohne Wirkung auf die Primärergebnisse:
- H7 (S5-Stützjahre nur Projektionsjahre): plausibel; 16 Zusatzpaare nachgezählt (8 + 4 + 4).
- H8 (Klasse h_alt ≤ 0 in S8): sinnvoll, sichtbar.
- H9 (S9): n = 2, nur Einzelwerte.
- H10 (Amendment 2): korrekt umgesetzt; RE_unb +1,2 %, RE* +0,2 % nachgerechnet.
- H11 (Mindestzellgröße auch für Min/Max und Median D): strenger als SAP, unproblematisch.
- H12: SAP-konform (keine DW/Shapiro/Ljung-Box, keine HAC, SAP 5.3).
- H14 (OWID 5,7–6,6 % unter UBA): in `plausibilisierung_uba_owid.csv` bestätigt (alle 10 Jahre −5,7 bis −6,6 %). Hypothesen sind als "nicht verifiziert" markiert; im Bericht als Abgrenzungshinweis, nicht als Erklärung.
- H15, H16 (PB2023 J_b-Wert 2019 = 802,0 aus PDF-Tabelle 17, gerundet): Rundungseffekt auf den Faktor unter 0,0001, keine Wirkung auf RE* bei einer Nachkommastelle.
- H17: nur 1990/2005-Werte betroffen.

**B10 (gering) – Dokumentationsmängel.**
(a) Skriptkopf nummeriert Post-hoc-Punkte anders als das Protokoll (Skript: H6 = S6, H10 = Amendment 2, H11 = R6; Protokoll: H6 = zweite Übertragung, H11 = Mindestzellgröße); H12–H17 fehlen im Skriptkopf; `run_log.txt` Abschnitt 6 spricht von "H1–H11". (b) `run_log.txt` nennt im Kopf SAP "Version 1.0", der Lauf erfolgte nach v1.2. (c) Alle "Entscheidung Daniel Saure" stehen auf "offen".
Vorschlag: Nummerierung vereinheitlichen; Entscheidungsspalte durch Daniel füllen lassen, bevor der Bericht entsteht.

**B11 (mittel) – Zuordnung PB2021/PB2023 nur über Namensgleichheit.** Siehe B2(b); wegen ausdrücklicher Nennung im Auftrag separat geführt.

## 2. Diagnostik (SAP 5.2, 5.3)

Bestanden. Der SAP schließt formale Tests und eine HAC-Korrektur aus; sie wurden nicht gerechnet (H12), das ist konform. Verbindliche Maßnahmen umgesetzt: Abhängigkeitsstruktur (`diag_abhaengigkeitsstruktur.csv`), Punktdiagramm, Leave-one-report-out (von mir nachgerechnet: identisch, kein Vorzeichenwechsel, MAPE-Änderung −11,5 % bis +9,7 %, nie über 25 %, nicht meldepflichtig), Verlauf über Zieljahre, Faktorentabelle.

**D1 (mittel) – Unbelegte Interpretation.** Analysebericht Abschnitt 6 Nr. 4 spricht von einem "gemeinsamen Ausschlag in 2020 … (konsistent mit Corona-Prägung)". Die Zahlen tragen das nicht: RE* 2020 liegt bei 10,9–13,0 %, die Werte für 2023/2024 liegen mit 13,9–18,6 % höher, und der Wegfall von 2020 (S3a) senkt die MRE nur von 10,9 auf 10,4 % (Median steigt von 12,6 auf 13,9 %). Ein gemeinsamer Ausschlag ist nicht erkennbar; die Formulierung nähert sich zudem einer Ursachenaussage (SAP 8.0, 8.5). Vorschlag: ersetzen durch "Zieljahr 2020 ist pandemiegeprägt; S3a/S3b verändern die E2-Kennzahlen nur wenig (MRE 10,4 bzw. 11,6 % statt 10,9 %)".

## 3. Mehrfachtestung / Cherry-Picking

Bestanden. Alle SAP-Fenster, Skalen und durchgeführten Sensitivitäten sind tabelliert (Tabelle 3 mit S1+S3a). Ungünstige/auffällige Befunde werden berichtet: Energiewirtschaft MRE 28,4 % (8/8 positiv), Abfall unbereinigt 40,6 %, in Horizont 4–6 durchgängig positive Abweichungen, k/n 9/10 bzw. 10/10 unbereinigt. Kein "signifikant", kein "Fehlprognose" (Volltextsuche in Analysebericht und Skript: nur die Verbotsangabe selbst). Teaser-/Überschriftsformulierungen existieren noch nicht und wurden nicht geprüft.

## 4. Rechenprüfung (selbst nachgerechnet)

Methode: R 4.6.1, eigener Code im Scratchpad, Eingabe `output/paare_alle_voll.csv`, `reihen_P_verwendet.csv`, `referenzinventar_A_verwendet.csv`.

- Für alle Zeilen von `paare_alle_voll.csv`: P* = P · A_Jb / P_Jb, RE*, RE_unb, E5-Terme, h = t − J_b; maximale Abweichung zur Datei 1e-12; Startpunkt + Verlauf = E_unb exakt.
- Eingangswerte: für jede Zeile (alle Sektoren, Szenarien) P, P_Jb aus `reihen_P_verwendet.csv` und A, A_Jb aus `referenzinventar_A_verwendet.csv` abgeglichen: 0 Abweichungen.
- E1: RE* 2020 = 12,27 / 10,87 / 13,01 % (PB2015/2017/2019) = berichtet 12,3 / 10,9 / 13,0 %.
- E2: n = 10, MRE 10,87, MdRE 12,64, MAPE 11,15, k/n 9/10; h 4–6: n = 7, 13,6 / 13,9 / 13,6, 7/7. Entspricht dem Bericht.
- E3: n = 5, D = +0,1, −6,9, −1,5, −1,4, −1,7, Median −1,47, 4 von 5 negativ. Entspricht dem Bericht.
- E4: n, k/n, MRE, MdRE, MAPE, Min, Max je Sektor (MMS) identisch mit dem Analysebericht.
- Sensitivitäten: S1 (12,1 / 14,4 / 12,1 / 10/10), S3a, S3b, S4, S7 (n 15: 12,90 / 13,91 / 13,09 / 14/15; mit selbst gebildeten 2025-Paaren aus Berichtswerten, Faktoren und A(2025) = 648,87) identisch. S5 nur über die Datei, nicht neu interpoliert.
- Abfall-Faktoren und S1-MRE 40,6 % bestätigt; Leave-one-report-out identisch.
- Projektionswerte gegen Quellen (Stichprobe, alle fünf Berichte): Zeile "Gesamt" direkt aus den PDFs gelesen (pdftotext): PB2015 S. 20 (939,1 / 907,4 / 840,5), PB2017 S. 29 (901,8 / 816,4), PB2019 S. 22 (909,4 / 835,6), PB2021 S. 326 (858,3 / 739,5 / 792,5 / 794,6 / 783,6 / 771,2), PB2023 PDF S. 74 (802,0 für 2019) und xlsx-Datenanhang (MMS 798,429 / 743,861; MWMS 789,047 / 732,518; Energiewirtschaft und Industrie MMS 2023). Alle stimmen mit `reihen_P_verwendet.csv` überein.
- EEA-Abgleich: nur die Ergebnisdatei `abgleich_eea_gesamt.csv` gesichtet (PB2017/2019/2021/2023 übereinstimmend; PB2015 siehe B8). Keine eigene Neuberechnung aus den EEA-Dateien.

Abweichungen zwischen Bericht und Rechnung: keine.

## 5. Limitationen und Aussagegrenzen

**L1 (mittel).** Im Analysebericht (Abschnitt 7) stehen die SAP-Limitationen weitgehend: kleine Zahl abhängiger Paare, Zieljahr 2020 und Corona, proportionale Bereinigung, Sektor-Zuordnung PB2015, S2/S6 nicht durchgeführt, keine Verallgemeinerung, Inventarstand, Produktionsperspektive (Abschnitt 1). Es fehlt oder ist abgeschwächt:
(a) Dass die Primärpopulation durch H3 klein ist und die Horizontklassen 1–3 und ≥7 nicht berichtbar sind, steht nur im Protokoll bzw. in der Tabelle, nicht als Limitation.
(b) 6 von 10 E2-Paaren stammen aus PB2021/PB2023 (Zieljahre 2021–2024, Nach-Corona-/Energiekrisenphase, nur zwei Berichte); MRE 10,9 % ist davon stark mitgeprägt. Dass der Corona-Gedanke aus SAP 5.1.1 (gemeinsamer Schock) für diese beiden Berichte gar nicht greift, wird nicht erklärt.
(c) PB2023 (Dezember 2023, J_b = 2019) hat Zieljahre im Berichtsjahr bzw. dem Folgejahr (h = 4/5, aber h_alt = 0/1); nur über S8 sichtbar.
(d) Ursachenaussage zu Abfall (B3).
Vorschlag: diese Punkte in Abschnitt 7 des Analyseberichts (und später im Artikel) aufnehmen.

## 6. Rundung/Darstellung (SAP 11)

**R1 (gering).** SAP: Mt ganzzahlig, relative Fehler eine Nachkommastelle, Anteile ohne Nachkommastelle, Faktoren drei Nachkommastellen. Eingehalten in E1-Tabelle, E5-Text, Faktorentabelle und Prozentwerten. Abweichungen: Mt-Werte mit Nachkommastellen im Analysebericht (A(2020) = 731,0; A(2024) = 649,8; 739,5 Mt; E* je Sektor "76,0"; "0,63 Mt"); `summe_bereinigte_sektoren_vs_gesamt.csv` mit zwei Nachkommastellen. Für den späteren Artikel muss die SAP-Rundung gelten.
**R2 (gering).** Grafik 1: Legende überlagert die Pfade rechts oben, Jahresbeschriftungen "2021"/"2023" liegen auf Linien; Pfade starten wie vorgeschrieben in J_b auf der Ist-Linie, 2020 markiert. Nur diese Grafik angesehen.
**R3 (gering).** `tabelle2_paare_gesamt.csv` existiert; auf Rundung nicht geprüft. `paare_alle_voll.csv` enthält ungerundete Rohwerte (als Datenfile zulässig).

## 7. Nicht berechnete Teile (S2, S6, Unsicherheitsband, GCP): zulässig entfallen?

| Teil | Beurteilung |
|---|---|
| S2 | Formal als "nicht durchgeführt, Grund" zulässig, Grund ist aber Unterlassung (B5). Mittel. |
| S6 | Begründung nicht belegt, Prüfung nicht gemacht (B6). Mittel. |
| Ist-Wert im Berichtsband (SAP 5.4) | Nicht zulässig entfallen, da "Sensitivit…" in allen Berichten vorkommt und nicht ausgewertet wurde (B4). Hoch. |
| GCP-Abgleich (SAP 3.3) | Zulässig: Datei wegen Lizenzformular nicht beschafft (`rohdaten/download_offen.md`), GCP geht in keine Kennzahl ein; der Pflicht-Abgleich 3.5 Nr. 4 (OWID) ist erfolgt. Gering. |

## 8. Nicht geprüft (wörtlich)

- `02_auswertung.R` habe ich nicht vollständig gelesen und nicht von den Rohdateien aus neu ausgeführt. Meine Nachrechnung geht von den Zwischendateien in `output/` aus (`paare_alle_voll.csv`, `reihen_P_verwendet.csv`, `referenzinventar_A_verwendet.csv`). Die Schritte von der Rohdatei zu `reihen_P_verwendet.csv` und zu `referenzinventar_A_verwendet.csv` habe ich nur stichprobenhaft bestätigt (Gesamtzeile der fünf Berichte; PB2023-Datenanhang Energiewirtschaft/Industrie). Die Ist-Werte A(t,k) habe ich nicht gegen die UBA-Excel-Dateien in `rohdaten/uba_inventar/` verglichen.
- `01_integritaet.R` habe ich nicht gelesen; seine Ausgaben (`01_integritaet_konsole.txt`, `zwischenbericht_daten_integritaet.md`, `abgleich_*.csv`) nur teilweise.
- Sektorwerte (außer PB2023-Energiewirtschaft/Industrie) habe ich nicht mit den Quellen verglichen: PB2015-Sektortabellen, KSP-Tabellen PB2017/2019, PB2021-Sektoren, MWMS 2015 nicht geprüft.
- KSG-Anlage-1-Definitionen und die CRF-zu-KSG-Zuordnung habe ich nicht gegengelesen.
- EEA-Abgleich nur über die Ergebnisdateien gesichtet, nicht aus den EEA-Dateien neu gerechnet.
- Lineare Interpolation (S5) und LULUCF-Rechnung (S9) nicht neu berechnet.
- Die Sensitivitätsabschnitte der Berichte (SAP 5.4) nicht gelesen.
- Grafiken 1b, 2, 3 und die beiden `diag_*.png` nicht angesehen; nur Grafik 1.
- `tabelle1b_ausgefallen.csv`, `tabelle2_paare_gesamt.csv`, `tabelle4*.csv` nicht im Einzelnen gelesen.
- Inhalt des Inventars (Submission 2026) und der OWID-Daten nicht inhaltlich geprüft.
- Den SAP-"Validierungsbogen" konnte ich nicht anwenden, weil dieser Abschnitt im SAP nicht existiert.

## 9. Auflagenliste an den analyst

1. (hoch) B4: Sensitivitätsabschnitte der Berichte für E1 auswerten (Band-Prüfung SAP 5.4) oder belegt "nicht ausgewiesen" dokumentieren.
2. (hoch) B3: Ursache der Abfall-Faktoren belegen oder Sektorergebnis als nicht belastbar kennzeichnen; Ursachenformulierung im Analysebericht Abschnitt 5 streichen.
3. (hoch, Entscheidung Daniel) B1/B2: H3 und H4/H6 entscheiden lassen; KSG-Definitionen für PB2021/2023 prüfen.
4. (mittel) B5/B6: S2 und S6 nachholen oder Nicht-Durchführung belegt begründen.
5. (mittel) D1: Satz zum "gemeinsamen Ausschlag in 2020" ersetzen.
6. (mittel) L1: Limitationen im Analysebericht um (a)–(c) ergänzen.
7. (gering) B10, R1–R3: Nummerierung H1–H17 vereinheitlichen; Rundung nach SAP 11 im Artikeltext.

Nach Umsetzung der Auflagen 1–3 ist eine fokussierte Nachprüfung durch den validator vorgesehen; sie muss gemäß CLAUDE.md als Nachtrag in dieser Datei festgehalten werden, nicht nur im Chat.

---

# Nachprüfung 1 (validator, 11.11.2026)

Gegenstand: Umsetzung der Auflagen aus diesem Bericht durch den analyst, Commit 7341f98 (Texte, neues Skript `03_ergaenzungen.R`, neue Outputs). Geprüft: `git diff 7341f98~1 7341f98` für `02_auswertung.R`, Analysebericht, Abweichungsprotokoll und `run_log.txt`; die neuen Output-Dateien; die Handübertragungen aus den PDFs. Am Analysematerial wurde nichts geändert.

## Ergebnis in Kürze

**Gesamturteil nach Nachprüfung: bedingt freigabefähig, weiterhin keine kritischen Befunde.** Von den vier Befunden mit Schweregrad hoch sind B3 und B4 umgesetzt, B1 und B2 sind bewusst unverändert und im Analysebericht jetzt klar als offen benannt. Offen bleiben B1/B2 (Entscheidung Daniel Saure), B5/S2 (nicht nachgeholt, jetzt ehrlich als Unterlassung benannt) und die Entscheidungsspalte aller Post-hoc-Punkte H1–H25 (überall "offen"). Neu gefunden: ein Rundungsfehler in der E3-Leave-one-report-out-Tabelle (gering, N1) und drei Textpunkte, die vor Veröffentlichung zu präzisieren sind (N2–N4).

Die Skript-Diff-Prüfung bestätigt: In `02_auswertung.R` wurden ausschließlich Kommentarzeilen (H-Nummerierung im Kopf) geändert; Rechnung und Ausgaben von 02 sind unverändert (`run_log.txt` Abschnitt 7 sagt dasselbe).

## 1. Auflagen einzeln

| Auflage | Status | Fundstelle / Befund |
|---|---|---|
| B1 (H3, Templates/EEA) | unverändert, bewusst offen; im Bericht klar genug benannt | Analysebericht Abschnitt 7, Punkt "Offene, methodenrelevante Festlegungen": nennt n = 10, leere Horizontklassen (n = 2 bzw. 1), nur interpolierte Zieljahre 2016–2019 (S5, 16 Paare) und dass bei Anerkennung der Templates neu gerechnet werden müsste. Protokoll Abschnitt E: "Nicht umgesetzt". Ausreichend. Entscheidung Daniel steht aus. |
| B2 (H4/H6, Sektoren) | unverändert, bewusst offen; im Bericht klar genug benannt | Analysebericht Abschnitt 4: Block "E4 ist vorläufig" mit (a) PB2015 nur 2 von 6 Sektoren, ungleiche n, MRE nicht direkt vergleichbar, (b) PB2021/2023 nur Namensgleichheit, (c) keine Zweitübertragung, (d) Abfall nicht belastbar; Hinweis, dass Sektorergebnisse nicht in Überschrift, Teaser, Grafik 1 gehören. Ausreichend. Die KSG-Definitionen für PB2021/2023 wurden weiterhin nicht geprüft (im Protokoll benannt). |
| B3 (Abfall-Faktoren) | umgesetzt, mit einer Einschränkung | Analysebericht Abschnitt 3 und 5, `abfall_faktoren_beschreibung.csv`, `faktorbereich_je_sektor.csv`. Die Zuschreibung "Inventarrevision/GWP-Wechsel" ist gestrichen; die Ursache wird als "nicht belegt" bezeichnet, Hypothesen als ungeprüft markiert, Sektor als nicht belastbar gekennzeichnet. Zahlen nachgeprüft: Bericht/Inventar 13,6/10,5; 11,6/9,1; 10,5/7,9; 9,7/7,1; 10,1/6,6 Mt; Überschuss 28–53 % bezogen auf den Inventarwert (mein früherer Wert 23–35 % war auf den Berichtswert bezogen; beides rechnerisch richtig); Faktorbereiche der anderen Sektoren 0,948–1,026. Einschränkung: Die SAP-Pflicht "Ursache laut Bericht/Inventar" ist weiterhin nicht erfüllt (nicht nachgeschlagen), dies ist offen benannt. Das Argument, ein GWP-Wechsel würde einen höheren Inventarwert erwarten lassen (CH4-GWP SAR 21, AR4 25, AR5 28), ist plausibel, aber nicht belegt; es steht als Hinweis, nicht als Befund. Akzeptabel. |
| B4 (Band, SAP 5.4) | umgesetzt (Prüfung nachgeholt), Handübertragung bestätigt | Siehe Abschnitt 2. |
| B5 (S2) | teilweise: Begründung korrigiert, S2 nicht nachgeholt | Analysebericht Abschnitt 5 ("S2 nicht durchgeführt: Das ist eine Unterlassung, keine Datenlage"), Protokoll H21. Angesichts der offenen Definitionsfrage R5 (EU Januar vs. UNFCCC April) vertretbar, die Entscheidung liegt bei Daniel. Offen. |
| B6 (S6) | umgesetzt, Begründung nachvollziehbar belegt, mit Vorbehalt | Siehe Abschnitt 2. |
| B7 (H1/E3) | umgesetzt, mit Rundungsfehler in einer Zelle | `diag_e3_leave_one_report_out.csv`, Analysebericht E3; Herkunft PB2015-MWMS genannt. Fehler siehe N1. |
| B8 (H2 in einem Satz) | umgesetzt | Protokoll H25 und Analysebericht. |
| B9 (H7–H17) | keine Auflage; unverändert in Ordnung | |
| B10 (Nummerierung, run_log) | umgesetzt | Skriptkopf 02 jetzt H1–H25-konform (H6 = R6, H10 = Amendment 2, H11 = Mindestzellgröße, H12–H17 ergänzt); `run_log.txt` nennt SAP v1.2 und H1–H17 plus H18–H25. Entscheidungsspalte weiterhin überall "offen" (Sache von Daniel). |
| B11 (PB2021/23 nur Namensgleichheit) | nicht behoben, aber im Bericht sichtbar | siehe B2. |
| D1 (Satz "gemeinsamer Ausschlag 2020") | umgesetzt | Analysebericht Abschnitt 6 Nr. 4: neue Formulierung durch die Zahlen gedeckt (MRE 10,9 auf 10,4 ohne 2020, Median 12,6 auf 13,9, S3b 11,6; keine Ursachenzuschreibung). |
| L1 (Limitationen) | umgesetzt | Analysebericht Abschnitt 7: kleine Primärpopulation (H3), 6 von 10 Paaren aus PB2021/PB2023, Corona-Schock gilt dort nicht gleich, h_alt = 0/1, Abfall. |
| G* (R1 Rundung, R2 Grafik, R3 Tabelle 2) | R1 umgesetzt, R2 teilweise, R3 nicht geprüft | R1: Mt im Analysebericht ganzzahlig, ausdrückliche Rundungsnotiz (Prüfdateien bewusst mit Nachkommastellen, zulässig). R2: Legende steht jetzt unten links ohne Überdeckung der Pfade, "Zieljahr 2020" beschriftet; die Jahresbeschriftungen "2017", "2021", "2023" liegen aber weiterhin auf Linien bzw. Markern (gering, optisch). |

## 2. `03_ergaenzungen.R` und neue Outputs

**Sensitivitätsband (B4).** Ich habe die drei Tabellen selbst per pdftotext gelesen:
- PB2015 Tab. 3-77 (PDF-S. 196), Gesamtemissionen 2020: MMS 840,5; 826,5; 842,2; 848,8; 825,1. Stimmt.
- PB2017 Tab. 3-133 (PDF-S. 274), Gesamtemissionen 2020: MMS 816,4; 829,1; 826,9; 816,9; 780,6. Stimmt.
- PB2019 Tab. 106 (PDF-S. 216), Gesamtemissionen 2020: MMS 835,6; 822,8; 833,7; 830,4. Stimmt.
Das Textlayout der PDFs ist verschachtelt; die Zuordnung der einzelnen Werte zu den Sensitivitätsnamen ist aus der Textebene nicht lückenlos nachprüfbar (die Werte stehen in Reihenfolge, meist knapp über dem Label). Das ändert nichts am Ergebnis: Das Band ist die Spannweite der Einzelwerte, und die Wertemengen sind bestätigt. Nicht geprüft habe ich die Fußnote 3 (Tab. 1-4) von PB2017, auf der die Übernahme des Wertes "weniger Stromexport" aus dem MWMS für das MMS beruht (780,6, zugleich das Bandminimum von PB2017).
Nachrechnung: Faktor mal Spannweite = 805,3–828,4 (PB2015), 775,1–823,3 (PB2017), 813,7–824,5 (PB2019); Abstand Ist (731) zum bereinigten Bandminimum −74,3 / −44,2 / −82,8 Mt. Stimmt mit `e1_ist_im_sensitivitaetsband.csv` und den Textangaben (74/44/83 Mt) überein. Der PB2015-Korridor (−31,9 % bis −35,0 % gegenüber 1990) lässt sich aus der MMS-Prozentangabe (−32,7 %) zurückrechnen (850 bzw. 812 Mt); der Hinweis im Analysebericht, er sei nur näherungsweise ableitbar, ist korrekt; PDF-S. 22 habe ich nicht gelesen.
Die Aussage "Ist-Wert 731 Mt unterhalb der gesamten Spannweite" ist durch die Zahlen gedeckt, auch unbereinigt. Der Bericht nennt die Sensitivitäten ausdrücklich keine statistischen Unsicherheitsbänder (gut); siehe N2.

**Abfall-Beschreibung.** Zahlen siehe B3 oben, stimmen mit meiner früheren Nachrechnung überein.

**E3-LOO.** Nachgerechnet mit ungerundeten D-Werten: ohne PB2015 Median −1,47 (3 von 3 negativ); ohne PB2023 −1,47 (2 von 3); **ohne PB2017 Median −1,57, gerundet −1,6 (3 von 4)**; Datei und Analysebericht nennen −1,5 (N1).

**S6-Prüfung.** Ich habe `thg-projektionen_2024_ergebnisse_kompakt.pdf` gelesen: Die Daten beruhen auf dem Inventar "einschließlich der Zeitreihe bis 2022", die Vorjahresschätzung 2023 "flossen nicht in die Modellierung ein" (PDF-S. 8). J_b der Projektionsdaten 2024 ist damit 2022; meine Vermutung 2023 in B6 war falsch, der analyst hat sie zutreffend korrigiert. Für die Projektionsdaten 2025 steht im Projektionsbericht 2025 (S. 54) "Daten für die Jahre 1990 bis 2023"; Basisjahr 2023 und Datenblatt ab 2025 passen zur Aussage "kein Zieljahr im Fenster". Die Begründung ist tragfähig. Vorbehalt: "kein P(b,s,2022,k)" gilt nur für die beschafften Dateien (Hauptbericht 2024 nicht beschafft, historische Werte nur in Abbildungen); ob der Hauptbericht eine Tabelle mit dem Wert enthält, ist ungeprüft. Das ist eine Beschaffungsfrage wie bei S2, im Bericht aber offen so benannt. Die Zusatzinfo (2024-Wert 677,4 Mt gegenüber Ist 649,8 Mt) stimmt mit dem xlsx überein, ist als Post-hoc-Information gekennzeichnet und in keiner Kennzahl.

## 3. Neue Befunde der Nachprüfung

**N1 (gering) – Rundungsfehler E3-LOO ohne PB2017.** `diag_e3_leave_one_report_out.csv`, Zeile "2017": median_D = −1,5; richtig −1,6 (−1,57). Die Aussage "Median D −1,5 in allen Varianten" (Analysebericht, Protokoll H24) stimmt damit für diese Variante nicht ganz. Die Substanz (Median etwa −1,5 bis −1,6, Vorzeichen stabil) bleibt. Ursache vermutlich Rundung auf einer bereits gerundeten Eingabe (`e3_einzelwerte.csv`). Vorschlag: Median aus ungerundeten Werten bilden (03, Abschnitt C), Text und H24 anpassen.

**N2 (gering) – Interpretationsgrenze beim Band-Befund.** Der Analysebericht sollte ausdrücklich sagen, dass die berichtseigenen Sensitivitäten nur Wachstum, Bevölkerung, Preise und Stromexport variieren und kein Pandemie- oder Krisenszenario enthalten; "Ist lag unterhalb aller Sensitivitäten" ist keine Aussage über die Qualität der Modellierung (SAP 8.1). Die aktuelle Formulierung ist neutral, der Satz zur Interpretationsgrenze fehlt. Vor der Artikelfassung ergänzen.

**N3 (gering) – PB2017-Bandminimum.** Das Minimum 780,6 stammt aus einer MWMS-Übernahme (laut Bericht Fußnote 3; H18 nennt das). Bei Nennung des Bandes im Artikel erwähnen; ohne diesen Wert läge das Minimum bei 816,9, die Aussage "Ist unterhalb" bliebe unverändert.

**N4 (gering) – Grafik 1.** Jahresbeschriftungen "2017", "2021", "2023" liegen weiter auf Linien (siehe G*, R2).

## 4. Gesamturteil und offene Punkte

- Alle Auflagen, die der analyst umsetzen konnte, sind umgesetzt oder begründet zurückgestellt; kein neuer kritischer oder hoher Befund. Primärergebnisse E1 und E2 unverändert.
- Gate nach CLAUDE.md (Validierungsbericht ohne kritisch): erfüllt.
- **Offen, vor einer Veröffentlichung von Daniel zu entscheiden:** B1/H3 (Zählen der Templates); B2/H4 und H6 (Sektorzuordnung, Zweitübertragung, KSG-Definitionen PB2021/2023); S2 (nachholen oder bewusst weglassen, Definition "erste Submission mit t"); J_b = 2022 für PB2024 (nur falls S6 je gerechnet werden soll); Eintrag der Entscheidungen zu H1–H25 in der Protokollspalte.
- **Vor der Artikelfassung vom analyst zu erledigen:** N1 (Median −1,6 korrigieren), N2 und N3 (zwei Sätze), optisch N4.
- Nicht erneut geprüft in dieser Nachprüfung (soweit nicht oben ausdrücklich genannt): alles, was in Abschnitt 8 oben als nicht geprüft aufgeführt ist, insbesondere KSG-Definitionen, Sektorwerte der Berichte, Fußnote 3 von PB2017 Tab. 1-4, PDF-S. 22 von PB2015, Grafiken 1b, 2, 3 und `tabelle2_paare_gesamt.csv`. `03_ergaenzungen.R` habe ich in den Teilen Band, Abfall und LOO gelesen und die Ergebnisse unabhängig nachgerechnet; die Teile S6 und Grafik habe ich nur über Ausgaben bzw. Ansicht geprüft, das Skript nicht neu ausgeführt.
