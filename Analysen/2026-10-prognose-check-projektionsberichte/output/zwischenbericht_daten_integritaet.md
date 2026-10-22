# Zwischenbericht Datenbeschaffung und Integritäts-Checks (SAP 3.5)

**Prognose-Check #1 – Projektionsberichte der Bundesregierung 2015–2023**
SAP: `SAP_prognose-check-projektionsberichte.md`, v1.0 final (eingefroren 22.10.2026)
Erstellt: 22.10.2026, analyst-Subagent (Claude). Nicht committet.
Skript: `01_integritaet.R` (lief fehlerfrei, Exit-Code 0; Konsole in
`output/01_integritaet_konsole.txt`). Beschaffungsprotokoll: `run_log.txt`.

> **Stand: STOPP nach SAP 3.5.5.** J_b ist für die Berichte 2021 und 2023
> nicht eindeutig. Laut SAP endet die Arbeit hier mit einer Rückfrage an Daniel
> (Abschnitt 5). Es wurden **keine** Fehlermaße, **keine** Estimands E1–E5,
> **keine** Umskalierung P → P\* und **keine** Sensitivitäten berechnet.
> Projektionen und Ist-Werte wurden nicht miteinander verglichen.

---

## 1. Was beschafft wurde (Phase A)

Die Dateien wurden auf Daniels Auftrag vom 22.10.2026 vom analyst per curl
geladen. Das weicht nur im Beschaffungsweg vom Wortlaut von SAP 3.4 ab,
nicht in den Quellen (Post-hoc P1, im `run_log.txt` vermerkt). Quellen sind
ausschließlich UBA, EEA (SDI Datashare, Reportnet CDR, Reportnet 3) und OWID
(GitHub/Grapher). 68 Dateien, alle mit SHA-256 im `run_log.txt`. Das Skript
prüft beim Lauf alle Prüfsummen erneut: **68/68 identisch**.

Überblick nach SAP 13:

| SAP 13 | Inhalt | Status |
|---|---|---|
| 1 | PB2015 (April 2015, nur MMS; Sept. 2016 „ergänzt durch MWMS“, beide aus Reportnet CDR), PB2017, PB2019 (+ KSP-Teilbericht CC 33/2019), PB2021, PB2023 + amtlicher Datenanhang (xlsx). PB2017/PB2019 zusätzlich als CDR-Fassung (Textebene identisch mit UBA-Fassung). | geladen |
| 2 | S6: UBA-Projektionen 2024 (Kernindikatoren xlsx, „Ergebnisse kompakt“) und 2025 (Projektionsbericht 2025, Datentabelle xlsx, „Ergebnisse kompakt“) | geladen; Hauptbericht 2024 auf UBA-Seite nicht als ein Dokument gefunden (nur Rahmendaten/Instrumente/Technischer Anhang), nicht geladen |
| 3 | Referenzinventar Submission 2026: Trendtabellen 1990–2024 (15.01.2026), KSG-Übersicht 1990–2025 (15.03.2026), NIR 2026 (CC 30/2026) | geladen, Submission festgelegt (Abschnitt 1.1) |
| 4 | S2: frühere Submissionen | bewusst nicht geladen, Vorschlag in Abschnitt 6 |
| 5 | S7: UBA-Vorjahresschätzung 2025 (Hintergrundpapier PDF, Begleitbericht CC 36/2026; Werte auch in KSG-Übersicht) | geladen |
| 6 | EEA-Projektionsdatenbank, alle Jahrgänge 2016–2025 (enthalten die Meldungen 2015–2025), deutsche MMR-Templates 2015/2016/2017/2019 (CDR), Reportnet-3-Tabellen 2021 | geladen |
| 7 | OWID co2-data (Commit 382ee6c, 02.06.2026) und Grapher-CSV THG ohne LULUCF | geladen |
| 7 | GCP National Fossil Carbon Emissions 2025 | **offen** (Lizenz-Klickformular bei ICOS) |

### 1.1 Festgelegtes Referenzinventar (SAP 3.2)

Submission 2026, Inventarjahre 1990–2024. Gesamtemissionen aus
`uba_inventar/2026_EM_Entwicklung_in_D_Trendtabelle_THG.xlsx` (UBA, Dessau,
15.01.2026), KSG-Sektoren aus `uba_inventar/Emissionsuebersichten_KSG-Sektoren_1990-2025.xlsx`
(15.03.2026). Geprüft: Die Gesamtemissionen ohne LULUCF beider Dateien sind
für 1990–2024 identisch (35/35 Jahre, Abweichung ≤ 0,5 kt). Der NIR 2026
(PDF-Seite 117) weist für 2024 „National Total (ohne LULUCF)“ 649.770 kt aus,
die Trendtabelle 649.769,5 kt. Diese Festlegung gilt ab jetzt unverändert.

### 1.2 Offene Downloads

Details mit URLs und Fehlermeldungen: `rohdaten/download_offen.md`.
1. GCP National Fossil Carbon Emissions 2025 v1.0: ICOS verlangt das
   Akzeptieren der Lizenz im Browser. Das habe ich nicht stellvertretend getan.
   Daniel kann die Datei manuell holen. Das betrifft nur den Größenordnungs-
   abgleich fossiles CO2; Check 3.5.4 (UBA gegen OWID) ist davon nicht berührt.
2. S2-Submissionen (SAP 13.4): bewusst nicht geladen, siehe Abschnitt 6.
3. Reportnet-3-Tabellen der Meldung 2023 (optional): Dataflow-ID über die API
   nicht ermittelbar (HTTP 400 bzw. HTTP 500 „TIMEOUT“). Die EEA-Datenbank 2023
   liegt vor und genügt für den Abgleich.
4. Reportnet 3, Dataflow 113, `DE-Attachments.zip`: leere Antwort, nicht nötig.

Technischer Hinweis: Die EEA-Ordner mussten wegen der Windows-Pfadlängen-
grenze in `eea_projektionen/dsJJJJ` umbenannt werden. Dateinamen und Inhalte
sind unverändert (im `run_log.txt` dokumentiert).

---

## 2. Ergebnisse der Checks nach SAP 3.5

### 3.5.1 Doppelte Extraktion – **bestanden mit Einschränkung**

- **Extraktionstabelle:** `output/extraktionstabelle_projektionen.csv`, 2.052
  Zeilen aus 19 PDF-Tabellen und dem PB2023-Datenanhang. Je Wert sind Datei,
  PDF-Seite (Seitenindex der Datei, nicht die gedruckte Seitenzahl), Tabelle,
  Szenario, Sektor laut Bericht, GWP, Kennzeichnung historisch/Projektion laut
  Bericht und der Abgleichstatus vermerkt.
- **Methode (Post-hoc P2):** Ich habe die PDF-Tabellen nicht von Hand
  übertragen, sondern reproduzierbar über die Wortkoordinaten der Textebene
  (`pdftools::pdf_data`) ausgelesen. Zahlen, die in der Textebene abgeschnitten
  sind (z. B. „1.245,“), werden nicht übernommen und als Hinweis markiert
  (nur 1990/2005-Werte in Nachrichtlich-Zeilen bzw. 1990-Gesamt der
  AR4-Tabellen 2015, für die Analyse nicht relevant). Ein Wert ist im Original
  mit Punkt statt Komma gedruckt (PB2021 Tab. 126, Gebäude 2018: „116.6“);
  er wurde als 116,6 gelesen und markiert.
- **Abgleich gegen die EEA-Datenbank (Gesamtemissionen),**
  `output/abgleich_eea_gesamt.csv`:
  - PB2017, PB2019, PB2021, PB2023: alle von Deutschland gemeldeten Jahre
    stimmen auf ±0,05 Mt überein (2017: 5/5 je Szenario; 2019: 5/5; 2021:
    T1 5/5 und T126 14/14; 2023: T1 und T17 je 12/12, Datenanhang 56/56).
  - PB2015: Die Haupttabellen (GWP IPCC SAR) liegen 6,1–8,5 Mt über den
    EEA-Werten. Die AR4-Umrechnung im Anhang des Berichts (Tab. A-7 bzw.
    A-5-12) stimmt dagegen exakt mit der EEA überein (6/6). Die Differenz ist
    also durch die GWP-Fassung erklärt, kein Übertragungsfehler. Welche Fassung
    gilt, ist Rückfrage R2.
  - PB2015 MWMS: In der EEA-Datenbank ist für die Meldung 2015 kein MWMS
    gemeldet (nur Lückenfüllung). Das MWMS kam erst mit der Ergänzung vom
    September 2016. Für die MWMS-Werte 2015 gibt es deshalb keinen EEA-Abgleich.
  - Jahre, die die EEA nicht als Meldewert führt (z. B. 1990, 2005, 2010),
    sind als „kein EEA-Meldewert“ markiert.
- **Sektorabgleich mit EEA (Quellbereiche 2015/2017/2019 gegen CRF),**
  `output/abgleich_eea_sektoren_quellbereiche.csv`: PB2017 und PB2019 je 35/35
  vergleichbare Werte identisch. PB2015 AR4-Tabellen 30/30 identisch (wenn
  Industrieprozesse und Produktverwendung zusammengezählt werden, wie in
  CRF 2). PB2015 SAR-Tabellen: 19 Abweichungen, wieder durch die GWP-Fassung
  erklärt.
- **Berichtsinterne Doppelangaben,** `output/abgleich_berichtsintern.csv`:
  alle identisch (PB2015 April vs. Sept. 2016 MMS 88/88; AR4 April vs. Sept.
  87/87; PB2017 Quellbereiche vs. KSP-Tabelle, Gesamt und Abfall/Sonstige 16/16
  je Szenario; PB2019 Hauptbericht vs. KSP-Teilbericht 16/16; PB2021 Tab. 1 vs.
  Tab. 126 35/35; PB2023 Tab. 17 vs. Tab. 1 14/14; PB2023 Tab. 17 vs.
  Datenanhang 84/84). **Eine Ausnahme:** Der „Sektorzuschnitt des BMUB“ im
  PB2015 unterscheidet sich zwischen der Fassung April 2015 (Tab. A-5) und der
  Fassung Sept. 2016 (Tab. A-5-9) bei Energiewirtschaft (−1,1 bis −1,5 Mt),
  Verkehr (+3,8 bis +4,3), GHD (+0,7 bis +2,1) und Landwirtschaft (−3,5 bis
  −4,8). Gesamt ist identisch. Ich habe beide Seitenbilder geprüft: Die
  Unterschiede stehen so in den Dokumenten und sind kein Extraktionsfehler.
  Die Fassung von 2016 enthält dazu Fußnote 125 zur Zuordnung der
  Landwirtschafts-Energie. Relevant für die Zuordnungstabelle 4.4
  (Rückfrage R4).
- **Sichtprüfung:** 15 Tabellenseiten habe ich als Bild gerendert und Zelle für
  Zelle mit der Extraktion verglichen. Ich habe keine Abweichung gefunden
  (Spalte `sichtpruefung` in der Extraktionstabelle).
- **Einschränkung (Post-hoc P3):** Für Sektorwerte, die die EEA nicht in
  derselben Abgrenzung führt (KSG-/KSP-Sektoren 2017–2023, einzelne
  Quellbereiche wie GHD/Haushalte, BMUB-Zuschnitt, MWMS 2015), stützt sich die
  Absicherung auf berichtsinterne Doppelangaben, die Summenprüfung und meine
  Sichtprüfung. Meine Sichtprüfung ist **keine von mir unabhängige zweite
  Übertragung** im Sinne von SAP 3.5.1. Rückfrage R6.
- Verworfene Zahlenzeilen ohne Beschriftung (Einheitenzeilen, JEM-Werte 2030 in
  PB2023 Tab. 17, abgeschnittene Zahlfragmente):
  `output/extraktion_verworfene_zeilen.csv` (34 Zeilen, alle geprüft).

### 3.5.2 Summenprüfung – **bestanden**

`output/summenpruefung.csv`: 206 prüfbare Zellen (Tabelle × Szenario × Jahr),
alle mit |Summe Sektoren − Gesamt| ≤ 1 %. Die größte Abweichung beträgt
0,056 % (Rundung). Nicht prüfbar: 14 Zellen in PB2023 Tab. 1 (nur Gesamtwerte
in der Tabelle) und 3 Zellen (1990 in den AR4-Tabellen 2015, Gesamtwert in der
Textebene abgeschnitten). Zeilen „Teilsumme“ und Nachrichtlich-Zeilen
(LULUCF, internationaler Verkehr, „Paket vom 1./2. Juli 2015“,
Sensitivität, Jahresemissionsmengen) gehen nicht in die Summe ein.

### 3.5.3 Einheiten und GWP-Metrik – **dokumentiert, mit Auffälligkeit**

`output/gwp_metrik.csv` (Fundstellen per Volltextsuche im PDF):

| Objekt | GWP | Fundstelle (PDF-Seite) |
|---|---|---|
| PB2015 Haupttabellen (April 2015 und Sept. 2016) | IPCC SAR | S. 28 (2015) / S. 30 (2016) |
| PB2015 Anhang A6 (Tab. A-7 / A-5-12 / A-5-14) | IPCC AR4, laut Bericht „angenäherte Umrechnung“ | S. 6, 217 (2015) |
| PB2017 | IPCC AR4 | S. 40 |
| PB2019 | „gemäß aktuellen Inventar-Berichterstattungsrichtlinien (UNFCCC 2013)“. Dass das AR4 ist, ist meine Ableitung, im Bericht steht nicht wörtlich „AR4“ | S. 30 |
| PB2021 | AR4 (Aussage in PB2023 S. 63; Selbstaussage PB2021 S. 37 wie PB2019) | S. 63 / 37 |
| PB2023 | IPCC AR5 | S. 63 |
| Referenzinventar Submission 2026 | IPCC AR5 | NIR S. 20, 38, … |
| OWID `total_ghg_excluding_lucf` (Jones et al. 2025) | IPCC AR6 | OWID-Metadaten |

Auffälligkeit: Die Berichte 2015–2021 und das Referenzinventar nutzen
verschiedene GWP-Sätze (SAR/AR4 gegenüber AR5). Der SAP fängt das über die
Basisjahrbereinigung ab (SAP 8.3). Für PB2015 ist zusätzlich offen, welche
GWP-Fassung als P gilt (R2).

### 3.5.4 Plausibilisierung Ist-Reihe UBA gegen OWID – **Auffälligkeit, im Bericht zu erläutern**

`output/plausibilisierung_uba_owid.csv`. OWID liegt in **allen** Jahren
2015–2024 um 5,7 % bis 6,6 % (39,7 bis 58,8 Mt) unter der UBA-Reihe. Die
5-%-Schwelle ist damit in jedem Jahr überschritten.

| Jahr | UBA (Mt) | OWID (Mt) | Diff. % |
|---|---|---|---|
| 2015 | 898,6 | 845,3 | −5,93 |
| 2016 | 899,0 | 841,2 | −6,44 |
| 2017 | 886,3 | 827,5 | −6,63 |
| 2018 | 850,1 | 800,7 | −5,82 |
| 2019 | 798,0 | 748,9 | −6,16 |
| 2020 | 731,0 | 685,8 | −6,17 |
| 2021 | 762,8 | 717,6 | −5,92 |
| 2022 | 749,3 | 706,3 | −5,74 |
| 2023 | 669,6 | 629,9 | −5,93 |
| 2024 | 649,8 | 608,4 | −6,37 |

Nach SAP 3.5.4 löst das keine Änderung der Primärquelle aus. Es muss aber im
Bericht erläutert werden. Gesichert ist: Die OWID-Reihe stammt aus Jones et al.
(2025) und nutzt AR6-GWP, das UBA AR5 (laut Metadaten bzw. NIR). Mögliche
weitere Gründe sind Unterschiede in der Gasabdeckung (z. B. F-Gase) und in den
Datengrundlagen für CH4/N2O. Das habe ich **nicht** verifiziert, es ist eine
Hypothese, die vor dem Bericht geprüft werden muss.

### 3.5.5 Bestimmung von J_b – **nicht eindeutig für 2021 und 2023 → STOPP**

`output/jb_bestimmung.csv`, Belege mit PDF-Seiten in `output/jb_belege.csv`:

| Bericht | J_b | eindeutig | Begründung / Fundstellen |
|---|---|---|---|
| 2015 | 2012 | ja | letzte historische Tabellenspalte 2012; Inventar Berichtsjahr 2014 (S. 28); „Ausgangsjahr der Modellierung ist das Jahr 2012“ (S. 81) |
| 2017 | 2014 | ja | historische Jahre 1990/2005/2010/2014 aus Resubmission Nov. 2016 (S. 226–229); Ausgangsjahr 2014 (S. 168) |
| 2019 | 2016 | ja | historische Jahre 1990/2005/2010/2016 aus Submission 2018 (S. 183); Ausgangsjahr 2016 (S. 141) |
| 2021 | **2018 oder 2020** | **nein** | Basisjahr 2018 aus Inventar Stand 18.03.2020 (S. 35), Ausgangsjahr 2018 (S. 71). Tab. 126 (S. 325/326) weist aber 2020 als historischen Wert aus, laut Anmerkung „der Vorjahresschätzung … entnommen“ (S. 326), also kein Inventarwert. SAP 2.1 („historische Inventarwerte“) spricht für 2018, SAP 3.5.5 („letzter als historisch gekennzeichneter Wert“) für 2020. |
| 2023 | **2019 oder 2020** | **nein** | In allen Ergebnistabellen ist 2019 die einzige historische Spalte (Tab. 1–3 S. 24–26, Tab. 17 S. 74); S. 24 nennt 2019 ausdrücklich „Basisjahr“; Ausgangsjahr der Modellierung 2019 (S. 254). Laut S. 63 wurden aber Inventardaten 1990–**2020** (Submission 2022) verwendet. Ein Wert für 2020 steht weder in den Tabellen noch im Datenanhang (der beginnt 2023). |

### 3.5.6 Verfügbarkeit von P(b,s,J_b,k) – **dokumentiert (je J_b-Kandidat)**

`output/verfuegbarkeit_P_Jb.csv` (je Bericht, Tabelle, Szenario, Sektor):

- **PB2015 (J_b 2012):** vorhanden für Gesamt und alle Quellbereiche bzw.
  BMUB-Sektoren, MMS und MWMS, SAR- und AR4-Fassung.
- **PB2017 (J_b 2014):** vorhanden für Gesamt, alle Quellbereiche und alle
  KSP-Sektoren (Tab. A-5-3/A-5-4), MMS und MWMS.
- **PB2019 (J_b 2016):** vorhanden für Gesamt, Quellbereiche und KSP-Sektoren
  (CC 33/2019 Tab. 4), nur MMS.
- **PB2021:** bei J_b = 2018 für Gesamt und alle KSG-Sektoren vorhanden
  (Tab. 1, Tab. 126). Bei J_b = 2020 nur in Tab. 126 (Wert =
  Vorjahresschätzung). Nur MMS.
- **PB2023:** bei J_b = 2019 für Gesamt und alle KSG-Sektoren vorhanden, MMS
  und MWMS (Tab. 17; Datenanhang ohne 2019). Bei **J_b = 2020 nirgends
  vorhanden.** Nach Regel 2.1 Nr. 3 würde PB2023 dann vollständig aus der
  Primärpopulation herausfallen (nur S1).

Ergänzend dokumentiert (rein beschreibend, keine Auswertung):
- Szenarien (`output/szenarien_je_bericht.csv`): **PB2019 und PB2021 enthalten
  kein MWMS.** PB2019 sagt ausdrücklich, auf das MWMS sei verzichtet worden
  (PDF-Seite 20: „wurde auf die Modellierung eines Mit-Weiteren-Maßnahmen-
  Szenarios (MWMS) verzichtet“). Beide fallen nach SAP 4.2 aus E3 heraus. Das MWMS
  2015 gibt es nur in der Fassung vom Sept. 2016.
- Explizit ausgewiesene projizierte Jahre 2015–2024 (`output/explizite_zieljahre.csv`):
  PB2015: 2015, 2020; PB2017: 2020; PB2019: 2020; PB2021: 2021–2024 (2020 ist
  Vorjahresschätzung, keine Projektion); PB2023: 2023, 2024 (nur im
  Datenanhang). Weitere Jahre (2016–2019 usw.) stehen nur in der EEA-Datenbank
  bzw. in den EU-Templates, nicht im nationalen Bericht. Nach SAP 3.1/4.2
  werden sie nicht verwendet.

---

## 3. Abweichungen vom SAP (Post-hoc gekennzeichnet)

- **P1** Beschaffungsweg: analyst statt Daniel (auf Daniels Auftrag). Die
  Quellen sind unverändert.
- **P2** Erst-Extraktion über Wortkoordinaten der PDF-Textebene statt von Hand.
- **P3** Zweite Übertragung für einen Teil der Sektorwerte nur über interne
  Doppelangaben und Sichtprüfung durch den analyst, nicht durch eine
  unabhängige Person.
- Umbenennung der EEA-Ordner wegen der Pfadlänge (nur Ordnernamen).

## 4. Nicht erledigt in diesem Durchlauf

- 3.5-Checks für die **S6-Berichte** (UBA-Projektionen 2024/2025, inklusive
  J_b) habe ich noch nicht durchgeführt. Die Dateien liegen vor.
- **Sektor-Zuordnungstabelle nach SAP 4.4** ist noch nicht erstellt. Die
  Berichte liefern eigene Zuordnungstabellen (PB2017 Tab. A-5-2, PB2019
  CC 33/2019 Tab. 1, PB2021 Tab. 2, PB2023 Tab. 15). Für PB2015 gibt es nur
  Quellbereiche und den BMUB-Zuschnitt.
- GCP-Abgleich (Datei offen, siehe 1.2).
- Die EU-Templates (`.xlsm`/`.xml` aus Reportnet CDR) habe ich nur abgelegt,
  nicht ausgewertet.

## 5. Offene Rückfragen an Daniel

- **R1 (blockierend, SAP 3.5.5) – J_b für PB2021 und PB2023.**
  (a) PB2021: Gilt J_b = 2018 (letztes Inventarjahr, „Basisjahr“) oder 2020
  (Vorjahresschätzung, im Bericht als historischer Wert ausgewiesen)? Folge
  von 2018: projizierte Zieljahre 2021–2024 mit h = 3–6; der 2020-Wert ist
  keine Projektion und kein Auswertungspaar. Folge von 2020: h = 1–4,
  Umskalierungsbasis wäre eine Vorjahresschätzung.
  (b) PB2023: Gilt J_b = 2019 („Basisjahr“ aller Tabellen) oder 2020 (letztes
  verwendetes Inventarjahr)? Bei 2020 fehlt P(b,s,J_b,k) überall, und PB2023
  fiele nach Regel 2.1 Nr. 3 komplett aus der Primärpopulation.
- **R2 – Fassung PB2015.** (a) Gilt für das MMS die Fassung April 2015 oder
  Sept. 2016? Gesamt und Quellbereiche sind identisch, der BMUB-Zuschnitt
  nicht. (b) Darf das MWMS aus der Fassung Sept. 2016 für E3 verwendet werden?
  (c) Gilt als P die SAR-Haupttabelle oder die AR4-Umrechnung des Anhangs A6,
  die mit der EU-Meldung übereinstimmt?
- **R3 – „Amtlicher Datenanhang“.** Zählen die deutschen EU-Templates
  (MMR Tabelle 1, Reportnet CDR) als amtlicher Datenanhang mit Vorrang
  (SAP 3.1) oder als EEA/Reportnet-Kreuzprüfquelle? Sie enthalten u. a.
  Jahreswerte, die im Bericht nicht stehen. Nach SAP 4.2 sind nur explizit
  ausgewiesene Jahreswerte zulässig.
- **R4 – PB2015 Sektorzuschnitt.** Die BMUB-Tabellen der zwei Fassungen
  unterscheiden sich (siehe 3.5.1). Für die Zuordnungstabelle 4.4: Soll für
  2015 von den Quellbereichen (CRF-nah) ausgegangen werden statt vom
  BMUB-Zuschnitt?
- **R5 – S2-Erstveröffentlichung.** Ist mit „erste Submission, die t enthält“
  die EU-Submission im Januar t+2 gemeint (frühester Termin) oder die
  UNFCCC-Submission im April t+2?
- **R6 – Zweite unabhängige Übertragung.** Soll für die Sektorwerte ohne
  EEA-Gegenstück (siehe 3.5.1) noch eine unabhängige Zweitübertragung durch
  eine Person (oder den validator) erfolgen, bevor ausgewertet wird?

## 6. Vorschlag für die Liste unter SAP 13.4 (S2, nicht geladen)

S2 betrifft E1 und E2, also nur die Gesamtemissionen. Benötigt wird je
Zieljahr t der Primärpopulation die erste Submission, die t enthält. Aus
derselben Submission kommt auch A(J_b) (Regel D). Jahre nach dem aktuellen
Stand (vorbehaltlich R1 und R5):

| Zieljahr t | Berichte | erste Submission mit t | Datei-Kandidat (auf der UBA-Seite verlinkt, gesehen 22.10.2026, **nicht** geladen, Erreichbarkeit nicht geprüft) |
|---|---|---|---|
| 2015 | PB2015 | 2017 (Jan. 2017) | `/system/files/medien/361/dokumente/2017_01_23_em_entwicklung_in_d_trendtabelle_thg_v1.0.xlsx` |
| 2020 | PB2015, PB2017, PB2019 | 2022 (Jan. 2022) | `/system/files/medien/361/dokumente/2022_01_12_em_entwicklung_in_d_trendtabelle_thg_v1.0.xlsx` |
| 2021 | PB2021 | 2023 (Jan. 2023) | `/system/files/medien/361/dokumente/2023_01_16_em_entwicklung_in_d_trendtabelle_thg_v1.0.xlsx` |
| 2022 | PB2021 | 2024 | auf der Seite nur `2024_04_15_em_entwicklung_in_d_trendtabelle_thg_v1.0.xlsx` (April) bzw. `2024_03_13_em_entwicklung_in_d_ksg-sektoren_thg_v1.0.xlsx` gesehen; eine Januar-Fassung 2024 habe ich nicht gefunden → hängt an R5 |
| 2023 | PB2021, PB2023 | 2025 (Jan. 2025) | `/system/files/medien/11867/dokumente/2025_01_14_em_entwicklung_in_d_trendtabelle_thg_v1.0.xlsx` |
| 2024 | PB2021, PB2023 | 2026 = Referenzinventar | bereits vorhanden |

Basis-URL jeweils `https://www.umweltbundesamt.de`. Für J_b selbst
(2012, 2014, 2016, 2018/2019) sind keine eigenen Dateien nötig, weil A(J_b) in
S2 aus derselben Erstveröffentlichung von t stammt.

---

## 7. Erzeugte Dateien

- `run_log.txt` (Beschaffung, Template-Pflichtfelder, Festlegung Submission,
  Dateitabelle mit SHA-256, Laufprotokoll)
- `rohdaten/download_offen.md`
- `01_integritaet.R`
- `output/`: `extraktionstabelle_projektionen.csv`, `extraktion_verworfene_zeilen.csv`,
  `abgleich_eea_gesamt.csv`, `abgleich_eea_sektoren_quellbereiche.csv`,
  `abgleich_berichtsintern.csv`, `summenpruefung.csv`, `gwp_metrik.csv`,
  `referenzinventar_konsistenz.csv`, `plausibilisierung_uba_owid.csv`,
  `jb_belege.csv`, `jb_bestimmung.csv`, `verfuegbarkeit_P_Jb.csv`,
  `szenarien_je_bericht.csv`, `explizite_zieljahre.csv`,
  `rohdaten_pruefsummen.csv`, `sessionInfo_01_integritaet.txt`,
  `01_integritaet_konsole.txt`, dieser Bericht.

## Anhang: Beschaffte Dateien mit SHA-256 (Pfade relativ zu `rohdaten/`)

| Datei | Bytes | SHA-256 |
|---|---|---|
| `eea_projektionen/ds2016/GHG_proj.csv` | 5037458 | `c9b8ffaf98754fa4a60a8be19e286576ebbd6f9960efc4477bdec67046d38e8d` |
| `eea_projektionen/ds2016/GovReg_National_projections_of_anthropogenic_greenhouse_gas_emissions__metadata_709cf3f9-f6fa-4ba6-a579-2ce6f3653893.xml` | 47580 | `2cc488a2dfac3eacede94f062fccf5b7e5245042a701e160d92a107c78193366` |
| `eea_projektionen/ds2016/README.md` | 930 | `c4c62bda1346c9af9080da27543214f67446ae8076a128684ca4f386cf435bc2` |
| `eea_projektionen/ds2017/GHG_projections_2017_EEA.csv` | 4609604 | `9fdc19b5aa1145971a2f2af02cb0a47d82dc585cb23d1f4ac2af21dd6b87f410` |
| `eea_projektionen/ds2017/GovReg_National_projections_of_anthropogenic_greenhouse_gas_emissions__metadata_36793cdd-e380-49ba-b519-7eee9dd4e46d.xml` | 49085 | `5d7c8f50678a673c091efdbe25bcfcd28a6235ec2296fdfac4478265c559dbcc` |
| `eea_projektionen/ds2017/README.md` | 930 | `f6a4a92b3f309217d33dc2e6210780b2919c6645165b93486d7115f1f1dca023` |
| `eea_projektionen/ds2018/GHG_projections_2018_EEA.csv` | 6747837 | `6eeec9296ea3d7bee56c192e471695840c5689dddf66b6db22148c9606c3995f` |
| `eea_projektionen/ds2018/README.md` | 930 | `33a68145af934bae684e1022936b10650a74aec3aaa30f10611bdd97af2d8498` |
| `eea_projektionen/ds2019/GHG_projections_2019_EEA.csv` | 8835698 | `77f9ea29332c755d071963155be5f68ddf9db6d87b491e76eab6db67682e7849` |
| `eea_projektionen/ds2019/GovReg_National_projections_of_anthropogenic_greenhouse_gas_emissions__metadata_c36239b1-48a1-4233-b0d2-32730bcc9660.xml` | 48171 | `6ca62bba77f62fa04fe2b05e49a18173d99f6a43ad3935f726331e582b96d34d` |
| `eea_projektionen/ds2019/README.md` | 930 | `00fbc5b68a33f53ae6b00b6b35e17333c9f9bc56287cfed3e64c7a0c24b03359` |
| `eea_projektionen/ds2020/GHG_projections_2020_EUMMR_EEA.csv` | 7056483 | `ecbcd3c340b5566ad8eae12d3c9e8a478f33d6d5da3d95dfcb985cc6a7f17d2c` |
| `eea_projektionen/ds2020/README.md` | 930 | `b41f409f907e848ddc261efc5dd568ebd12cc0de085e8c24831ca9386ebf765c` |
| `eea_projektionen/ds2021/GHG_projections_2021_EEA.csv` | 10985081 | `0517974b7d74ea14b8d19bb4e4ba3d56e36fd9533bbf60f610ed9af2c0a9e2df` |
| `eea_projektionen/ds2021/GovReg_National_projections_of_anthropogenic_greenhouse_gas_emissions__metadata_213d9a0f-ad40-487c-bc71-ded5fbb59572.xml` | 47129 | `34a338dc2e3ce1ced40cad13f24ee97e022e2e1daa0fd7d45d69eb4c045a225e` |
| `eea_projektionen/ds2021/README.md` | 930 | `6bbcf6dfb622a717909d7a63604f642d7c6e9c9b8c478d614f34044986c59a37` |
| `eea_projektionen/ds2022/GHG_projections_2022_EEA_csv.csv` | 7328195 | `3a93ebced86a8ad39f9b0e3fe210c5cdce5d1e7fbc66d239dd87831b11930df5` |
| `eea_projektionen/ds2022/README.md` | 1043 | `f32e20e9406dacc5ac1c77763b7ead164f7052fbd1c1ddc45dcec7cca57f8595` |
| `eea_projektionen/ds2023/GHG_projections_2023_EEA_incl_pivots.xlsx` | 14234936 | `5d63d1f27f49ebbdd5900e550383001229579816382571a65f967758c56c222e` |
| `eea_projektionen/ds2023/GovReg_National_projections_of_anthropogenic_greenhouse_gas_emissions__metadata_14ffb69b-9c55-49f3-8477-3460aca891c4.xml` | 43412 | `9d29a383e999ae00bc985d74c83ee3d528a29942985f89116b9c6d616dadde2f` |
| `eea_projektionen/ds2023/README.md` | 847 | `a8b2e39653441c864a543f1bedf3647c3a2320237603c159d201873999207b3d` |
| `eea_projektionen/ds2024/GHG_projections_2024_EEA_incl_pivots.xlsx` | 11223447 | `5e0184b5950d5672171e0b7afef157ce7d14017c8b464a26b707d862c967ea28` |
| `eea_projektionen/ds2024/README.md` | 972 | `3ff9e1d7330d807cc854ea69be15698845541f4c75e69ba83fa31e4270ec2796` |
| `eea_projektionen/ds2025/GHG_projections_2025_EEA_incl_pivots.xlsx` | 18595579 | `8ddfcd287290422a4ccb7b78a0916b5d428ff4896764f5de162fde74354fcdca` |
| `eea_projektionen/ds2025/GovReg_National_projections_of_anthropogenic_greenhouse_gas_emissions__metadata_d6938865-05e5-4016-a15c-a09bb898421d.xml` | 47841 | `2b39ac67dd1f2be534471bddd9c28cd957149a1616156c863b12f6ba574f4281` |
| `eea_projektionen/ds2025/README.md` | 972 | `aa45ec1ebe953ee511fc08427585e39d9983217b9a7db7131270163debca84c0` |
| `eea_reportnet3_df113_2021/DE-Table2.zip` | 8135 | `8c983e1a25164ef555d62f045881b43cfd04e6fa585b9b6240f3399d474b5abb` |
| `eea_reportnet3_df113_2021/DE-Table_1a1b5a5b.zip` | 406492 | `7babfad53d2b243ef2e08f44cbd5612ae6f9dd1f5d63913a4f73295506e4a655` |
| `eea_reportnet3_df113_2021/entpackt/DE-Table2/DE-Table2.xlsx` | 10220 | `80081a76aaf363cb084087daefdff810b58e35c4a18bfea58e59dd254362cb0e` |
| `eea_reportnet3_df113_2021/entpackt/DE-Table_1a1b5a5b/DE-Table 1a1b5a5b.xlsx` | 567708 | `a99e4cd4403823402cf2f3dfea6e6ea8eeb61cfe6e0348c9c6f5d7716f42a60b` |
| `eea_reportnet_cdr/2015_envvprkzq_projections/MMR_Template_IPArticle23_table1-final_Germany_AR4-GWPs.xlsm` | 261063 | `b83375f7ea63b631a581ed1931abae768dd38309cecb9091a21f0730b981c2c1` |
| `eea_reportnet_cdr/2015_envvprkzq_projections/Readme_projections.docx` | 10747 | `e956f6cf38ca639f05a441c08150405f7b2bc1a7fa749fa92c9afc6007665867` |
| `eea_reportnet_cdr/2015_envvqlq8w_projektionsbericht/150422_Projektionsbericht_2015_final.pdf` | 3991497 | `7584a112acbb4977d42f3017872b845c11abb86763c18bfecc48b0cd3d0bcb6b` |
| `eea_reportnet_cdr/2015_envvr0d1q_projections_xml/MMR_Template_IPArticle23_table1-final_Germany_AR4-GWP.xml` | 672409 | `17ec1f8c87a40d30ed89dcbb4f4858731cdab98d39bc813ee1b6568dd9fb02ce` |
| `eea_reportnet_cdr/2016_envv_vp1a_pb2015_mwms/160928_PB2015_MWMS.final.pdf` | 4641104 | `cc1c291bcba803a126739f593e219442081e70c5c754135d528db06f6879c576` |
| `eea_reportnet_cdr/2016_envv_vp1a_pb2015_mwms/MMR_Template_IPArticle23_table1-final_Germany_AR4-GWPs_inkl_MWMS.xlsm` | 285988 | `f4da1e387f28a9277d48fde79bd7cb9a5f07c31d224087dfeadbca0cfed2a3a0` |
| `eea_reportnet_cdr/2017_envwqc4_g_march/170426_PB_2017_-_final.pdf` | 6500290 | `70b2034e0c325a5c5cbfb461f1a41c4f6b7a7ccd11f71e243de4dcc6f1122a44` |
| `eea_reportnet_cdr/2017_envwqc4_g_march/DE_MMR_Template_IRArticle23_table1_March2017.xlsm` | 430811 | `e62b64cb17b3e5d093556182e13042253cc7814ae4f377fa91dc77008885aff1` |
| `eea_reportnet_cdr/2017_envwqc4_g_march/MMR_IRArticle23T1_DE_2017.xml` | 5676979 | `6aacf13793194178f14be0c7fe790a45033984b91c8e868bb797eafef889fabc` |
| `eea_reportnet_cdr/2017_envwqc4_g_march/Technical_notes_German_projection_data.pdf` | 135130 | `93e6cb1f6cc52daf2ca86f672a7c27a05c97f5ce0a5ed74c59b7ed2f3384b017` |
| `eea_reportnet_cdr/2017_envwsvzzg_may/DE_MMR_Template_IRArticle23_table1_May2017.xlsm` | 457763 | `97671d62f6e983821fb55342054846cd17763c237f1d16dc88abfe84ffe984af` |
| `eea_reportnet_cdr/2017_envwsvzzg_may/MMR_IRArticle23T1_DE_2017.xml` | 5551621 | `33ee222350051f4e686676e54a6ab01993b1efad8d2f7f4f17c4d89745ec24d5` |
| `eea_reportnet_cdr/2019_envxiqjbq/DE_MMR_Template_IRArticle23_table1_2019_fix_20190305.xlsx` | 277027 | `37b3b58d486e8ff8be9009cc08ec67e919e8739f8422f1384735b87e8e89f546` |
| `eea_reportnet_cdr/2019_envxiqjbq/DE_MMR_Template_IRArticle23_table1_2019_fix_20190305.xml` | 3341296 | `33ba400ffeba31ee8533ccf3ef714bc56a924a9961e8c2988e1f69cf83a8e669` |
| `eea_reportnet_cdr/2019_envxiqjbq/Technical_notes_German_projection_data_20190314.pdf` | 18733 | `ab5883e984405a3727172f20fd3f5f33e3700beb8b199ab844e80d419195c55f` |
| `eea_reportnet_cdr/2019_envxnw7wq_projektionsbericht/Projektionsbericht-der-Bundesregierung-2019.pdf` | 4820241 | `f4b4c2201741189e13c1087cbf8aa566ab39d3ff38189d6c7100882d63e4f637` |
| `owid/README_co2-data.md` | 11950 | `6c78052304913b07e0b38b60f4e8488427cc2fb62d341ce66c1bf7974d21c9ed` |
| `owid/owid-co2-codebook.csv` | 24149 | `33b4f5e00efd58c7b83863f736beba1af4df946b43642b0400c3ec38648e0e8e` |
| `owid/owid-co2-data.csv` | 14377942 | `7f78e2b218ce4bb8c538bbec04fdc9a7982e8d40bff972e650df603899edd5f6` |
| `owid/total-ghg-emissions-excluding-lufc.csv` | 1101898 | `5b5363af5c92188fb3cbf9c0bdb81a74fbdce07be2ccb236f90d3cedb2819ae5` |
| `owid/total-ghg-emissions-excluding-lufc.metadata.json` | 1976 | `21c02b99b880b3e1e0242d602ca895895106e53cf45816334905c11eba8e298d` |
| `uba_inventar/2026_EM_Entwicklung_in_D_Trendtabelle_THG.xlsx` | 303891 | `779fb78d4c963c107b7dd904cb7832f678eed25ad43c0a6aae933ee58d1289a7` |
| `uba_inventar/30_2026_CC.pdf` | 50870104 | `707bbcd09287a88c944b7971d2025806f3956d5589537fdf9a45f65c57fba75a` |
| `uba_inventar/Emissionsuebersichten_KSG-Sektoren_1990-2025.xlsx` | 776757 | `bbbb49cb8307ae0136e397e0a4ccb5e9e5d3ade1a72c96ed532c41aeb928853a` |
| `uba_projektionen/2018-01-11_climate-change_01-2018_politikszenarien-vii.pdf` | 6104559 | `925d39402af8b4c3701f2dc6ec7fab8ed13ffa5352455cfcfbdd00cd185fc7c9` |
| `uba_projektionen/2019-09-06_climate-change_33-2019_pb19-ksp2050_teilbericht-psz-ix.pdf` | 478489 | `823ed32f8451561837dd591abf05bc5f3150ef81406a6a17c6ffbc1400cf7350` |
| `uba_projektionen/39_2023_cc_projektionsbericht_12_23.pdf` | 11167873 | `491913a84f2f1eb8226abd91d3e503edf2e5798323158f91718c8716f5d886ff` |
| `uba_projektionen/deutscher_projektionsbericht2023_kernindikatoren_2.0_korrigiert_0.xlsx` | 786996 | `c2c5d65dbc77ebd6caeb520ff1bcd7ae47788a9db29c7494c0ef567516e52077` |
| `uba_projektionen/projektionsbericht-2019_uba_website.pdf` | 4814345 | `d0ae175de0df68de67a0d95fdef47640a03f130d785190b5a8688ba9d6c2b693` |
| `uba_projektionen/projektionsbericht_2017_uba_website.pdf` | 5720144 | `40416ab578cd193366798153c6fddd07b4b430fabff2d2903cc900a4b21bf345` |
| `uba_projektionen/projektionsbericht_2021_uba_website.pdf` | 6138675 | `41b96a8284e901fcec902bac7d977ff1171cf5000afa04054a30b34bfb1b66a4` |
| `uba_projektionsdaten_S6/ergebnisse_kompakt_2025_2_auflage.pdf` | 11897522 | `59ab1ec98076941b6a66da325b806a5b7a76cdf6d848664949150f6efc4e2a3b` |
| `uba_projektionsdaten_S6/projektionen-2024_kernindikatoren_20240624_uba_v2.xlsx` | 847268 | `5e1833ea61019341db7fc513f1113ab9df05d6c9735f8cb5c520320ec00099f4` |
| `uba_projektionsdaten_S6/projektionen-2025-kernindikatoren-ap1.master_20250527.xlsx` | 273970 | `bff542e93eef99e9d4d960aa6c9f48d9f457822a91a7388e0ed3f7bfe99fa30d` |
| `uba_projektionsdaten_S6/projektionsbericht_2025.pdf` | 12462385 | `a41aeecf1c74275a731d22be8e9b83fcdc4478cefe2109848985759ad6d7b73b` |
| `uba_projektionsdaten_S6/thg-projektionen_2024_ergebnisse_kompakt.pdf` | 17862163 | `a23ef1d98bd483847e6403de62eb80f67b175b247550577fc1a49c7009e6678e` |
| `uba_vorjahresschaetzung_S7/36_2026_CC_v2.pdf` | 7751397 | `631ed2bb409945fe58b91e86943e67c47fe9f6c8bc3605e4c527123bea59e10c` |
| `uba_vorjahresschaetzung_S7/UBA_Emissionsdaten_2025_Projektionsdaten_2026_Hintergrundpapier_0.pdf` | 1243289 | `5d24439110c70606a614acdf64e0faa35c250e85e891755424c2545d48bf7adc` |
