# Analysebericht – Prognose-Check #1: Projektionsberichte der Bundesregierung 2015–2023

SAP: v1.2 final (inkl. Amendment 1 und 2). Skript: `02_auswertung.R` (lief fehlerfrei, Exit-Code 0, 11.11.2026).
Autor: analyst-Subagent (Claude). Dies ist ein Ergebnisbericht für den validator, **kein** Artikeltext. Er bewertet nicht, ob das Ergebnis „gut“ für die Story ist.
Alle Zahlen: Mt CO2e bzw. %, Primärskala = basisjahrbereinigt (P\*), positiv = Emissionen überschätzt. Quellen: `output/` (Dateinamen jeweils genannt). Offene Festlegungen: `Abweichungsprotokoll_prognose-check-projektionsberichte.md` (H1–H17).

## 1. Einordnung (SAP 1, 8)

Projektionen sind bedingte Szenarien (MMS: Maßnahmen bis Berichtszeitpunkt). Die Abweichung zum Inventar vermischt Modellfehler, abweichende Rahmenannahmen, spätere Maßnahmen und Schocks; es wird keine Ursache zugeschrieben. Beide Seiten folgen der territorialen Produktionsperspektive (UNFCCC); „Ist niedriger als Projektion“ bedeutet nicht, dass weniger Emissionen im Konsumsinn verursacht wurden. Die Analyse ist rein deskriptiv: keine Tests, keine p-Werte, keine Konfidenzintervalle, kein α (SAP 5.1.1, 5.5). Die Paare sind nicht unabhängig (gemeinsame Zieljahre, verkettete Pfade). Die Primärzahl beschreibt die Treffsicherheit des **Verlaufs** ab dem Ausgangsjahr J_b, nicht des absoluten Niveaus.

## 2. Daten und Prüfungen

- Rohdaten: 68/68 SHA-256 identisch mit `run_log.txt` (`02_pruefsummen_vor_auswertung.csv`).
- Ist-Werte: UBA-Inventar Submission 2026 (1990–2024), Gesamt ohne LULUCF: A(2020) = 731 Mt; A(2024) = 650 Mt. Summe der sechs KSG-Sektoren = Gesamt (Differenz 0,000).
- J_b: 2015 → 2012, 2017 → 2014, 2019 → 2016, 2021 → 2018, 2023 → 2019 (Amendment 1). P(b,s,J_b,gesamt) liegt für alle Berichte und Szenarien vor (`verfuegbarkeit_PJb_final.csv`); kein Bericht fällt nach Regel 2.1 Nr. 3 aus der Primärpopulation. Amendment 2: PB2021-Wert für 2020 (740 Mt, Vorjahresschätzung) ist kein Paar.
- Primärpopulation Gesamt/MMS: **10 Paare** (PB2015: 2015, 2020; PB2017: 2020; PB2019: 2020; PB2021: 2021–2024; PB2023: 2023, 2024). MWMS-Paare: 5 (PB2015: 2; PB2017: 1; PB2023: 2). PB2019 und PB2021 weisen kein MWMS aus.
- Das Zieljahr 2020 ist für die Berichte 2021 und 2023 nicht verfügbar (kein Auswertungspaar); E1 stützt sich daher auf drei Berichte.
- Kein Stopp ausgelöst.

## 3. Umskalierungsfaktoren (SAP 2.1, 5.2 Nr. 5; `umskalierungsfaktoren.csv`)

Gesamt: 2015: 0,976; 2017: 0,993; 2019: 0,989; 2021: 0,990; 2023: 0,995 (MMS und MWMS jeweils gleich). Alle Gesamtfaktoren liegen innerhalb 0,90–1,10, die Bereinigung ist für Gesamt klein (≤ 2,4 %). Außerhalb 0,90–1,10: nur der Sektor Abfallwirtschaft und Sonstiges in allen Berichten (0,654–0,781; 8 von 48 Reihen). Laut SAP 5.2 Nr. 5 wird das erläutert; es ändert nichts an der Primärskala. **Beschreibung (Nachtrag nach Validierung, `abfall_faktoren_beschreibung.csv`, `faktorbereich_je_sektor.csv`):** Der im Bericht für das Ausgangsjahr ausgewiesene Wert liegt für den Sektor Abfallwirtschaft und Sonstiges um 28 bis 53 % über dem heutigen Inventarwert desselben Jahres (Bericht / Inventar in Mt: 2015: 13,6 / 10,5; 2017: 11,6 / 9,1; 2019: 10,5 / 7,9; 2021: 9,7 / 7,1; 2023: 10,1 / 6,6); der Faktor sinkt von 0,771 über 0,781, 0,753 und 0,735 auf 0,654. Alle anderen Sektoren liegen mit 0,948 bis 1,026 deutlich enger (Gesamt 0,976–0,995). **Die Ursache ist nicht belegt.** Hypothesen, die nicht geprüft wurden: (1) abweichende Sektor- bzw. Quellgruppenabgrenzung zwischen Bericht und KSG-Sektor „Abfallwirtschaft und Sonstiges“; (2) methodische Neuberechnung im Inventar seit dem jeweiligen Berichtsstand. Ein reiner Wechsel der Treibhauspotenziale (CH4: SAR 21, AR4 25, AR5 28) würde für einen methanlastigen Sektor eher einen höheren als den beobachteten niedrigeren Inventarwert erwarten lassen; als alleinige Erklärung passt er daher nicht zur Richtung. Die proportionale Umskalierung (SAP 9) ist für diesen Sektor nur tragfähig, wenn die Abweichung eine proportionale Niveauverschiebung ist; das ist offen. **Die Sektorergebnisse für Abfallwirtschaft und Sonstiges sind deshalb als nicht belastbar zu behandeln.** Die Summe der bereinigten Sektoren weicht vom bereinigten Gesamtwert um weniger als 1 Mt (0,08 %) ab (`summe_bereinigte_sektoren_vs_gesamt.csv`), wird nicht korrigiert.

## 4. Ergebnisse

### E1 – Zieljahr 2020, Gesamt, MMS, basisjahrbereinigt (`e1_ergebnisse.csv`)

| Bericht | J_b | h | P\* (Mt) | A 2020 (Mt) | E\* (Mt) | RE\* (%) |
|---|---|---|---|---|---|---|
| 2015 | 2012 | 8 | 821 | 731 | 90 | 12,3 |
| 2017 | 2014 | 6 | 810 | 731 | 79 | 10,9 |
| 2019 | 2016 | 4 | 826 | 731 | 95 | 13,0 |
| 2021 | 2018 | – | – | – | – | kein Auswertungspaar (Amendment 2) |
| 2023 | 2019 | – | – | – | – | kein Auswertungspaar (kein Projektionswert für 2020) |

Aussage im Sinne von SAP 5.1.1: In 3 von 3 auswertbaren Berichten lag die basisjahrbereinigte MMS-Projektion für 2020 über dem Ist-Wert; die Abweichungen reichten von 10,9 bis 13,0 %. Dieses Zieljahr ist von der Corona-Pandemie geprägt (die Berichte 2015–2019 konnten sie nicht kennen); S3a/S3b adressieren das für E2.

**Band-Prüfung nach SAP 5.4 (Nachtrag nach Validierung, `e1_ist_im_sensitivitaetsband.csv`, `e1_sensitivitaetswerte_berichte_2020.csv`):** Die Berichte 2015, 2017 und 2019 weisen Sensitivitätsrechnungen für die Gesamtemissionen 2020 aus (Wirtschaftswachstum, Bevölkerung, Preise, Stromexport; PB2015 Tab. 3-77, PB2017 Tab. 3-133, PB2019 Tab. 106; Werte von Hand aus den PDF-Tabellen übertragen, MMS-Referenzzeile gegen die Extraktionstabelle kontrolliert). Das sind Sensitivitäts-, keine statistischen Unsicherheitsbänder. Spannweite der Einzelsensitivitäten für 2020 (unbereinigt / mit Faktor wie P\* umskaliert): PB2015 825–849 / 805–828 Mt; PB2017 781–829 / 775–823 Mt; PB2019 823–834 / 814–825 Mt. Der Ist-Wert 2020 (731 Mt) lag in allen drei Berichten **unterhalb** der gesamten Spannweite, bereinigt um 44 bis 83 Mt (PB2015: 74, PB2017: 44, PB2019: 83), unbereinigt um 50 bis 94 Mt. Für PB2015 nennt der Bericht zusätzlich einen kombinierten Korridor (−31,9 % bis −35,0 % gegenüber 1990, PDF-S. 22); in Mt nur näherungsweise ableitbar (ca. 812–851 Mt unbereinigt, Rundung der Prozentangabe). Bei PB2017 stammt das Bandminimum 780,6 Mt („weniger Stromexport“) aus einer Übernahme des MWMS-Werts für das MMS (Fußnote 3, Tab. 1-4); ohne diesen Wert läge das Minimum bei 816,9 Mt (bereinigt 811 Mt), der Ist-Wert (731 Mt) läge weiter unterhalb, die Aussage bleibt unverändert. Die berichtseigenen Sensitivitäten variieren nur Wachstum, Bevölkerung, Preise und Stromexport und enthalten kein Pandemie- oder Krisenszenario; „Ist-Wert liegt unterhalb aller Sensitivitäten“ ist keine Aussage über die Modellierungsqualität (SAP 8.1). Für PB2021 und PB2023 entfällt die Prüfung für E1, da kein 2020-Paar existiert; PB2021 weist Sensitivitäten erst ab 2025 aus (Tab. 135 und Tab. 1). Die Treffer „Sensitivit…“ in den Berichten außerhalb dieser Tabellen betreffen Teilsektoren (z. B. Stromsektor) und sind für die Gesamtemissionen 2020 nicht relevant (nicht vollständig gelesen; Fundstellen `unsicherheitsband_textsuche.csv`).

### E2 – alle Paare, Gesamt, MMS (`e2_kennzahlen.csv`, `e2_einzelwerte_horizont.csv`)

| Zelle | n | k/n (RE\*>0) | MRE | MdRE | MAPE | Min / Max |
|---|---|---|---|---|---|---|
| alle Paare | 10 | 9/10 | 10,9 % | 12,6 % | 11,2 % | −1,4 / 18,6 % |
| h 1–3 | 2 | nur Einzelwerte: −1,4 % (PB2015, 2015), 2,9 % (PB2021, 2021) | | | | |
| h 4–6 | 7 | 7/7 | 13,6 % | 13,9 % | 13,6 % | 5,0 / 18,6 % |
| h ≥ 7 | 1 | nur Einzelwert: 12,3 % (PB2015, 2020) | | | | |

Das einzige Paar mit negativer Abweichung ist PB2015 für 2015 (h = 3). Die Abweichungen sind in Horizonten 4–6 durchgängig positiv. Eine Verbesserung über die Berichte oder eine Zunahme mit dem Horizont lässt sich aus diesen Zahlen nicht ablesen (es gibt keine Regression, SAP 5.1.3; Regression zur Mitte nicht deutbar, SAP 8.0). Die Werte der Berichte 2021 und 2023 für 2023/2024 liegen zwischen 13,9 und 18,6 %; die Berichte 2021 und 2023 teilen sich die Zieljahre 2023 und 2024 (gemeinsamer Zieljahr-Effekt möglich, `diag_RE_star_ueber_zieljahr.png`).

### E3 – MMS vs. MWMS (`e3_einzelwerte.csv`, `e3_kennzahlen.csv`)

n = 5 Paare (PB2015: 2015, 2020; PB2017: 2020; PB2023: 2023, 2024). D = ARE\*(MWMS) − ARE\*(MMS): +0,1 (2015/2015), −6,9 (2015/2020), −1,5 (2017/2020), −1,4 (2023/2023), −1,7 (2023/2024); Median −1,5 Prozentpunkte; D < 0 in 4 von 5 Paaren. Das MWMS lag in 4 von 5 Paaren näher am Ist-Wert. Die Zahl „4 von 5“ hängt an PB2015: Leave-one-report-out (`diag_e3_leave_one_report_out.csv`) ergibt ohne PB2015 (n = 3) Median D −1,47 (gerundet −1,5) mit D < 0 in 3 von 3 Paaren, ohne PB2017 (n = 4) −1,57 (gerundet −1,6; 3 von 4), ohne PB2023 (n = 3) −1,47 (2 von 3); der Median ist mit etwa −1,5 bis −1,6 stabil, der größte Einzelwert (−6,9, PB2015/2020) trägt nur zur Spannweite bei. Das ist kein Ranking nach Güte (SAP 8.2): Es sagt nicht, ob die zusätzlichen Maßnahmen umgesetzt wurden. Die MWMS-Werte 2015 stammen aus der Fassung vom Sept. 2016 (H1); PB2019 und PB2021 fehlen in E3.

### E4 – Sektoren, MMS (`e4_sektoren_kennzahlen_MMS.csv`, `tabelle4_sektoren_paare_MMS.csv`, `e4_e1_sektoren_2020.csv`)

Alle Paare je Sektor (Reihenfolge KSG-Anlage 1; n = Paare; MRE/MdRE/MAPE in %; E\* in Mt je Einzelwerte in den Dateien):

| Sektor | n | k/n | MRE | MdRE | MAPE | Min / Max |
|---|---|---|---|---|---|---|
| Energiewirtschaft | 8 | 8/8 | 28,4 | 33,1 | 28,4 | 7,6 / 40,4 |
| Industrie | 10 | 7/10 | 4,4 | 1,1 | 6,9 | −9,4 / 16,2 |
| Gebäude | 8 | 5/8 | 3,5 | 6,4 | 7,6 | −8,5 / 11,3 |
| Verkehr | 8 | 8/8 | 7,5 | 7,0 | 7,5 | 3,9 / 15,4 |
| Landwirtschaft | 8 | 7/8 | 3,2 | 3,3 | 3,4 | −0,7 / 7,0 |
| Abfallwirtschaft und Sonstiges | 10 | 6/10 | 2,8 | 1,6 | 4,0 | −2,3 / 12,1 |

E1 je Sektor (2020; E\* in Mt / RE\* in %): Energiewirtschaft PB2017 76 / 34,5, PB2019 77 / 35,0; Industrie PB2015 1 / 0,7, PB2017 −3 / −2,0, PB2019 2 / 1,4; Gebäude PB2017 −9 / −7,1, PB2019 −10 / −8,5; Verkehr 10 / 6,6 und 22 / 15,4; Landwirtschaft 5 / 7,0 und 3 / 4,7; Abfall 1 / 12,1 (PB2015), 1 / 9,8, 0 / 5,8. Beim kleinen Sektor Abfallwirtschaft entspricht ein relativer Fehler von 5,8–12,1 % rund 0 bis 1 Mt; Sektorvergleiche dürfen sich nicht allein auf relative Werte stützen (SAP 8.0).

**E4 ist vorläufig** (offene, methodenrelevante Festlegungen, siehe Abschnitt 7): (a) PB2015 ist nur für 2 von 6 Sektoren zugeordnet (Industrie, Abfallwirtschaft/Sonstiges; H4), daher haben Energiewirtschaft, Gebäude, Verkehr und Landwirtschaft n = 8, Industrie und Abfall n = 10; die Sektor-MRE sind nicht direkt vergleichbar. (b) Für PB2021 und PB2023 beruht die Zuordnung zu den KSG-Sektoren auf Namensgleichheit; die Definitionen wurden nicht gegen KSG-Anlage 1 geprüft. (c) Die Sektorwerte ohne EEA-Gegenstück sind nur durch interne Abgleiche und Sichtprüfung abgesichert, nicht durch eine unabhängige Zweitübertragung (H6). (d) Der Sektor Abfallwirtschaft und Sonstiges ist wegen der Faktoren nicht belastbar (Abschnitt 3). Sektorergebnisse gehören nicht in Überschrift, Teaser oder Grafik 1 (SAP 7). MWMS-Sektoren: nur Anhang (`tabelle4_anhang_sektoren_paare_MWMS.csv`, `e4_sektoren_kennzahlen_MWMS_anhang.csv`; je Sektor n = 3 bzw. 5).

### E5 – Zerlegung der unbereinigten Abweichung (`e5_zerlegung.csv`, Grafik 3)

Für 2020 (Gesamt, MMS), ohne Bereinigung um spätere Inventarrevisionen: E_unb = Startpunkt + Verlauf: PB2015 110 = 22 + 87 (Startpunktanteil 20 %); PB2017 85 = 7 + 79 (8 %); PB2019 105 = 10 + 94 (10 %). Die multiplikative Bereinigung (E\*: 90 / 79 / 95 Mt) und der additive Verlaufsterm (87 / 79 / 94 Mt) sind nicht identisch, aber nahe beieinander. Bei kleinem |E_unb| (PB2015 für 2015: 9 Mt) sind Anteile > 100 % rechnerisch, aber nicht aussagekräftig. Die Zerlegung ist keine Ursachenanalyse.

## 5. Sensitivitäten (`tabelle3_sensitivitaeten_E2.csv`, `…_E1.csv`, `tabelle3b_…_E3.csv`, `tabelle4b_…`)

| Spezifikation | n | MRE | MdRE | MAPE | k/n |
|---|---|---|---|---|---|
| Primär | 10 | 10,9 | 12,6 | 11,2 | 9/10 |
| S1 unbereinigt (ohne Bereinigung um spätere Inventarrevisionen) | 10 | 12,1 | 14,4 | 12,1 | 10/10 |
| S1 + S3a (unbereinigt, ohne 2020) | 7 | 11,5 | 14,5 | 11,5 | 7/7 |
| S2 Inventarrevision | nicht durchgeführt (Unterlassung, s. u.) | | | | |
| S3a ohne 2020 | 7 | 10,4 | 13,9 | 10,8 | 6/7 |
| S3b ohne 2020, 2021 | 6 | 11,6 | 14,9 | 12,1 | 5/6 |
| S4 ohne 2022 | 9 | 11,5 | 13,0 | 11,8 | 8/9 |
| S5 Interpolation (16 zusätzliche Paare) | 26 | 10,4 | 9,6 | 11,0 | 22/26 |
| S6 erweiterte Berichtsmenge | nicht berechenbar (belegt, s. u.; `s6_pruefung.csv`) | | | | |
| S7 mit Zieljahr 2025 (Vorjahresschätzung) | 15 | 12,9 | 13,9 | 13,1 | 14/15 |
| S8 alt. Horizont h' | 10 (Klassen: h' ≤ 0: n=3, MRE 6,7; h' 1–3: n=6, MRE 12,7; 4–6 und ≥ 7: n < 3) | | | | |
| S9 mit LULUCF | n = 2: PB2017 11,3 %, PB2019 13,0 % (RE\*, t = 2020), nur Einzelwerte | | | | |

E1 unter S1 (unbereinigt): 15,0 / 11,7 / 14,3 % (PB2015 / 2017 / 2019); unter S9: 11,3 % (2017), 13,0 % (2019). E3 unter den Sensitivitäten: Median D −1,5 (S1, S4), −1,4 (S3a, S3b, jeweils n = 3), −2,6 (S5, n = 17), −1,8 (S7, n = 8). Vorzeichen von MRE und MdRE sind in allen berechneten Sensitivitäten positiv. Sektoren unter S1/S3a/S3b/S4: `tabelle4b_sektoren_sensitivitaeten.csv`. **Ungünstig/auffällig:** Bei Abfallwirtschaft und Sonstiges ist der Unterschied bereinigt/unbereinigt groß (MRE 2,8 % vs. 40,6 %), weil der Sektor-Faktor 0,65–0,78 beträgt; unter S1 ist k/n dort 10/10. Der Unterschied folgt aus dem Faktor 0,65–0,78 dieses Sektors, dessen Ursache nicht belegt ist (siehe Abschnitt 3); eine Zuschreibung zu Inventarrevisionen ist nicht belegt.

**S2 (nicht durchgeführt):** Das ist eine Unterlassung, keine Datenlage: Die früheren Inventarsubmissionen (SAP 13 Nr. 4) wurden nicht beschafft. Die Definition „erste Submission, die t enthält“ ist zudem nicht eindeutig (EU-Submission Januar t+2 oder UNFCCC-Submission April t+2; Rückfrage R5 unbeantwortet), und für t = 2022 ist keine Januar-Fassung 2024 gefunden worden. Ein Nachholen ohne Entscheidung von Daniel wäre eine eigene Festlegung; es wurde nicht versucht. Folge: Die Wirkung der Revision der Ist-Werte auf E1/E2 ist unbekannt (indirekt nur über Faktoren, S1 und E5 sichtbar).

**S6 (nicht berechenbar, belegt; Nachtrag nach Validierung, `s6_pruefung.csv`):** Projektionsdaten 2025: Basisjahr der Modellierung 2023, 2024 ist Vorjahresschätzung (kein Projektionswert), das Datenblatt beginnt 2025; es gibt kein Zieljahr im Fenster 2015–2024. Projektionsdaten 2024: Die Daten beruhen auf dem Inventar 2024 „einschließlich der Zeitreihe bis 2022“, die Vorjahresschätzung 2023 „flossen nicht in die Modellierung ein“ (Ergebnisse kompakt 2024, PDF-S. 8 und 11). J_b wäre damit 2022 (nicht 2023, entgegen der zunächst vermuteten Lesart). Das Datenblatt beginnt bei 2024; der historische Wert 2022 steht in den beschafften Dateien nur in Abbildungen, nicht als Zahl (der Hauptbericht 2024 wurde nicht beschafft). Damit liegt kein P(b,s,2022,k) vor (Regel 2.1 Nr. 3; die EEA-Datenbank ist nur Kreuzprüfquelle, kein Ersatzwert). Höchstens ein Zieljahr (2024) läge im Fenster. Die Festlegung J_b = 2022 für diesen Bericht wäre ohnehin von Daniel zu bestätigen (analog Amendment 1). Zur Information (nicht S6, in keiner Kennzahl): MMS-Wert 2024 der Projektionsdaten 2024 = 677 Mt (MWMS 677 Mt) gegenüber Ist 650 Mt, unbereinigt +4,2 % bzw. +4,1 % (`posthoc_pb2024_wert_2024_info.csv`).

Post-hoc (nur Information, keine Entscheidungswirkung): PB2021, 2020-Wert aus Tab. 126 (Vorjahresschätzung, kein Paar): RE_unb +1,2 %, RE\* +0,2 %. PB2015 mit AR4-Umrechnung statt SAR: RE\* 2020 12,0 % statt 12,3 %.

## 6. Diagnostik (SAP 5.2)

1. Abhängigkeitsstruktur (`diag_abhaengigkeitsstruktur.csv`): Zieljahr 2020 wird von den Berichten 2015, 2017, 2019 geteilt; 2023 und 2024 von den Berichten 2021 und 2023; die vier PB2021-Paare gehören zu einem Pfad. Die 10 Paare sind **nicht unabhängig**.
2. Punktdiagramm aller RE\*-Werte: `diag_punktdiagramm_RE_star.png`; keine einzelnen dominierenden Werte erkennbar (Maximum 18,6 %, MdRE 12,6 % ≈ MRE 10,9 %); eine Ausnahme nach unten ist PB2015/2015 (−1,4 %).
3. Leave-one-report-out (`diag_leave_one_report_out.csv`): Kein Weglassen eines Berichts kehrt das Vorzeichen von MRE oder MdRE um; MAPE ändert sich um −11,5 % bis +9,7 % (relativ), also nie um mehr als 25 %. Meldepflichtig nach SAP: keiner. MRE ohne Einzelberichte: 9,5–12,2 %.
4. Zieljahr-Schocks (`diag_RE_star_ueber_zieljahr.png`): Für 2020 liegen alle drei Berichte zwischen 10,9 und 13,0 %; das Zieljahr 2020 ist pandemiegeprägt. Ein gemeinsamer Ausschlag in 2020 ist aus den Zahlen nicht ablesbar: Die Werte für 2023/2024 (13,9–18,6 %) liegen höher als die für 2020, und der Wegfall von 2020 (S3a) senkt die MRE nur von 10,9 auf 10,4 % (MdRE steigt von 12,6 auf 13,9 %); S3b: MRE 11,6 %. Es wird keine Ursache zugeschrieben. Die Berichte 2021 und 2023 teilen sich die Zieljahre 2023 und 2024; ob dort ein gemeinsamer Zieljahr-Effekt vorliegt, ist aus zwei Berichten nicht zu entscheiden.
5. Faktoren: siehe Abschnitt 3.
Formale Tests (Durbin-Watson, Shapiro-Wilk, Ljung-Box) wurden gemäß SAP 5.2 **nicht** gerechnet (H12).

## 7. Limitationen und Aussagegrenzen (SAP 9, 5.1.1)

- Zehn abhängige Paare aus fünf Berichten; Kennzahlen instabil. Keine Verallgemeinerung auf künftige Projektionen; die Berichte sind keine Stichprobe. Wörter wie „signifikant“ sind nicht zulässig und werden nicht verwendet.
- Das Zieljahr 2020 trägt drei der zehn Paare und ist pandemiegeprägt; E1 beruht auf drei Berichten (2021 und 2023 ohne 2020-Paar).
- Die Basisjahrbereinigung setzt proportionale Niveauverschiebungen voraus; ein untypischer Wert in J_b würde auf den ganzen Pfad übertragen (z. B. J_b = 2019 für PB2023, J_b = 2018 für PB2021). Die Primärzahl misst den Verlauf, nicht das Niveau.
- Nur explizit ausgewiesene Zieljahre; Interpolation nur in S5.
- S2 nicht durchgeführt (Unterlassung, Abschnitt 5) und S6 nicht berechenbar (Abschnitt 5): keine Aussage zur Wirkung der Inventarrevision der Ist-Werte (S2) und zu den UBA-Projektionen 2024/2025.
- **Offene, methodenrelevante Festlegungen (Entscheidung Daniel Saure steht aus):** (H3) Die Jahreswerte der EU-Templates/EEA-Datenbank zählen nicht als „amtlicher Datenanhang“ (SAP 3.1, 4.2). Die Primärpopulation ist dadurch klein (n = 10); die Horizontklassen „1–3 Jahre“ (n = 2) und „≥ 7 Jahre“ (n = 1) haben keine Kennzahl; die Zieljahre 2016–2019 der Berichte 2015/2017/2019 erscheinen nur interpoliert (S5, 16 Paare). Würden die Templates zählen, müsste die Auswertung wiederholt werden. (H4/H6) Sektorzuordnung und Zweitübertragung, siehe E4 (vorläufig): PB2015 nur 2 von 6 Sektoren, PB2021/PB2023 nur über Namensgleichheit zugeordnet.
- **Zusammensetzung der Primärpopulation:** 6 von 10 E2-Paaren stammen aus nur zwei Berichten (PB2021: 4, PB2023: 2; Zieljahre 2021–2024, Phase nach Corona und Energiekrise). Die MRE von 10,9 % ist davon stark mitgeprägt. Der gemeinsame Schock „Corona 2020“ betrifft diese beiden Berichte nicht in derselben Weise wie die Berichte 2015–2019; sie wurden mit Kenntnis der Pandemie (PB2021) bzw. ihrer Folgejahre (PB2023) erstellt.
- **Horizont und Berichtsjahr:** PB2023 (Dezember 2023, J_b = 2019) hat Zieljahre 2023 und 2024, also im Berichtsjahr bzw. im Folgejahr (h = 4 und 5, aber h' = t − Berichtsjahr = 0 und 1); das wird nur in S8 sichtbar. Auch bei PB2021 liegt das erste Zieljahr 2021 im Berichtsjahr (h' = 0).
- **Sektor Abfallwirtschaft und Sonstiges:** Faktor 0,654–0,781, Ursache nicht belegt; Sektorergebnisse nicht belastbar (Abschnitt 3).
- Sektoren: KSG-Zuordnung für PB2015 nur teilweise; Sektorwerte ohne EEA-Gegenstück nur eingeschränkt gegen eine unabhängige Übertragung abgesichert (H6). Kleine Sektoren haben große relative Fehler bei kleinen absoluten (SAP 8.0).
- PB2015 MWMS stammt aus der Fassung 2016 (H1). Die GWP-Basis der Berichte unterscheidet sich (SAR/AR4/AR5); die Bereinigung fängt das nur proportional ab.
- Referenzinventar wird künftig revidiert; Ergebnisse gelten für Submission 2026.
- UBA-Inventar liegt in jedem Jahr 2015–2024 um 5,7–6,6 % über der OWID-Reihe (SAP 3.5.4 verlangt Erläuterung): als Ursache kommen AR6- vs. AR5-GWP und Gasabdeckung in Frage, **nicht verifiziert**; ohne Wirkung auf die Primärquelle.
- Keine Ursachenzerlegung; keine Bewertung von Klimapolitik oder Modellierung; keine Aussage zu Zielerreichung künftiger Jahre. Der Bericht 2013 ist nicht enthalten.

## 8. Dateien

`output/`: 02_auswertung_konsole.txt, 02_lauf_stdout.log, sessionInfo_02_auswertung.txt, 02_pruefsummen_vor_auswertung.csv, referenzinventar_A_verwendet.csv, plausi_vorjahresschaetzung_2025.csv, reihen_P_verwendet.csv, verfuegbarkeit_PJb_final.csv, umskalierungsfaktoren.csv, paare_alle_voll.csv, tabelle1_berichte.csv, tabelle1b_ausgefallen.csv, tabelle2_paare_gesamt.csv, tabelle3_sensitivitaeten_E1.csv, tabelle3_sensitivitaeten_E2.csv, tabelle3b_sensitivitaeten_E3.csv, tabelle4_sektoren_paare_MMS.csv, tabelle4_anhang_sektoren_paare_MWMS.csv, tabelle4b_sektoren_sensitivitaeten.csv, e1_ergebnisse.csv, e2_kennzahlen.csv, e2_einzelwerte_horizont.csv, e3_einzelwerte.csv, e3_kennzahlen.csv, e4_*.csv, e5_zerlegung.csv, s8_horizont.csv, summe_bereinigte_sektoren_vs_gesamt.csv, zuordnungstabelle_sektoren.csv, diag_*.csv/png, posthoc_*.csv, unsicherheitsband_textsuche.csv, grafik1_kerngrafik_bereinigt.png, grafik1b_unbereinigt.png, grafik2_RE_gegen_horizont.png, grafik3_E5_zerlegung_2020.png.

Nachträge nach Validierung (11.11.2026, Skript `03_ergaenzungen.R`, Log `output/03_ergaenzungen_konsole.txt`, `03_lauf_stdout.log`): `e1_ist_im_sensitivitaetsband.csv`, `e1_sensitivitaetswerte_berichte_2020.csv`, `e1_pb2015_korridor_naeherung.csv`, `abfall_faktoren_beschreibung.csv`, `faktorbereich_je_sektor.csv`, `diag_e3_leave_one_report_out.csv`, `s6_pruefung.csv`, `posthoc_pb2024_wert_2024_info.csv`, `sessionInfo_03_ergaenzungen.txt`; `grafik1_kerngrafik_bereinigt.png` neu gezeichnet (nur Legende/Beschriftung verschoben, gleiche Daten).

Hinweis zur Rundung (SAP 11): Mt-Werte in diesem Bericht ganzzahlig, relative Fehler eine Nachkommastelle. Ausnahme: Bänder und Abstände in Abschnitt 4 (E1-Band) sind auf ganze Mt gerundet genannt; Prüf- und Zwischendateien (`summe_bereinigte_sektoren_vs_gesamt.csv`, `paare_alle_voll.csv`, `e1_ist_im_sensitivitaetsband.csv`) enthalten bewusst mehr Nachkommastellen und sind keine Artikeltabellen.
