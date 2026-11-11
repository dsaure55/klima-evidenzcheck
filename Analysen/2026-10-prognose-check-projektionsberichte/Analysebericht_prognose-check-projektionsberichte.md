# Analysebericht – Prognose-Check #1: Projektionsberichte der Bundesregierung 2015–2023

SAP: v1.2 final (inkl. Amendment 1 und 2). Skript: `02_auswertung.R` (lief fehlerfrei, Exit-Code 0, 11.11.2026).
Autor: analyst-Subagent (Claude). Dies ist ein Ergebnisbericht für den validator, **kein** Artikeltext. Er bewertet nicht, ob das Ergebnis „gut“ für die Story ist.
Alle Zahlen: Mt CO2e bzw. %, Primärskala = basisjahrbereinigt (P\*), positiv = Emissionen überschätzt. Quellen: `output/` (Dateinamen jeweils genannt). Offene Festlegungen: `Abweichungsprotokoll_prognose-check-projektionsberichte.md` (H1–H17).

## 1. Einordnung (SAP 1, 8)

Projektionen sind bedingte Szenarien (MMS: Maßnahmen bis Berichtszeitpunkt). Die Abweichung zum Inventar vermischt Modellfehler, abweichende Rahmenannahmen, spätere Maßnahmen und Schocks; es wird keine Ursache zugeschrieben. Beide Seiten folgen der territorialen Produktionsperspektive (UNFCCC); „Ist niedriger als Projektion“ bedeutet nicht, dass weniger Emissionen im Konsumsinn verursacht wurden. Die Analyse ist rein deskriptiv: keine Tests, keine p-Werte, keine Konfidenzintervalle, kein α (SAP 5.1.1, 5.5). Die Paare sind nicht unabhängig (gemeinsame Zieljahre, verkettete Pfade). Die Primärzahl beschreibt die Treffsicherheit des **Verlaufs** ab dem Ausgangsjahr J_b, nicht des absoluten Niveaus.

## 2. Daten und Prüfungen

- Rohdaten: 68/68 SHA-256 identisch mit `run_log.txt` (`02_pruefsummen_vor_auswertung.csv`).
- Ist-Werte: UBA-Inventar Submission 2026 (1990–2024), Gesamt ohne LULUCF: A(2020) = 731,0; A(2024) = 649,8. Summe der sechs KSG-Sektoren = Gesamt (Differenz 0,000).
- J_b: 2015 → 2012, 2017 → 2014, 2019 → 2016, 2021 → 2018, 2023 → 2019 (Amendment 1). P(b,s,J_b,gesamt) liegt für alle Berichte und Szenarien vor (`verfuegbarkeit_PJb_final.csv`); kein Bericht fällt nach Regel 2.1 Nr. 3 aus der Primärpopulation. Amendment 2: PB2021-Wert für 2020 (739,5 Mt, Vorjahresschätzung) ist kein Paar.
- Primärpopulation Gesamt/MMS: **10 Paare** (PB2015: 2015, 2020; PB2017: 2020; PB2019: 2020; PB2021: 2021–2024; PB2023: 2023, 2024). MWMS-Paare: 5 (PB2015: 2; PB2017: 1; PB2023: 2). PB2019 und PB2021 weisen kein MWMS aus.
- Das Zieljahr 2020 ist für die Berichte 2021 und 2023 nicht verfügbar (kein Auswertungspaar); E1 stützt sich daher auf drei Berichte.
- Kein Stopp ausgelöst.

## 3. Umskalierungsfaktoren (SAP 2.1, 5.2 Nr. 5; `umskalierungsfaktoren.csv`)

Gesamt: 2015: 0,976; 2017: 0,993; 2019: 0,989; 2021: 0,990; 2023: 0,995 (MMS und MWMS jeweils gleich). Alle Gesamtfaktoren liegen innerhalb 0,90–1,10, die Bereinigung ist für Gesamt klein (≤ 2,4 %). Außerhalb 0,90–1,10: nur der Sektor Abfallwirtschaft und Sonstiges in allen Berichten (0,654–0,781; 8 von 48 Reihen). Laut SAP wird das erläutert, ändert aber nichts an der Primärskala. Ursache: nicht verifiziert; der Sektor ist klein (5–14 Mt), und Inventarrevisionen bzw. GWP-Wechsel (AR4 → AR5) sind plausible, aber nicht zerlegte Kandidaten. Die Summe der bereinigten Sektoren weicht vom bereinigten Gesamtwert um höchstens 0,63 Mt (0,08 %) ab (`summe_bereinigte_sektoren_vs_gesamt.csv`), wird nicht korrigiert.

## 4. Ergebnisse

### E1 – Zieljahr 2020, Gesamt, MMS, basisjahrbereinigt (`e1_ergebnisse.csv`)

| Bericht | J_b | h | P\* (Mt) | A 2020 (Mt) | E\* (Mt) | RE\* (%) |
|---|---|---|---|---|---|---|
| 2015 | 2012 | 8 | 821 | 731 | 90 | 12,3 |
| 2017 | 2014 | 6 | 811 | 731 | 79 | 10,9 |
| 2019 | 2016 | 4 | 826 | 731 | 95 | 13,0 |
| 2021 | 2018 | – | – | – | – | kein Auswertungspaar (Amendment 2) |
| 2023 | 2019 | – | – | – | – | kein Auswertungspaar (kein Projektionswert für 2020) |

Aussage im Sinne von SAP 5.1.1: In 3 von 3 auswertbaren Berichten lag die basisjahrbereinigte MMS-Projektion für 2020 über dem Ist-Wert; die Abweichungen reichten von 10,9 bis 13,0 %. Dieses Zieljahr ist von der Corona-Pandemie geprägt (die Berichte 2015–2019 konnten sie nicht kennen); S3a/S3b adressieren das für E2. Ein Band-Vergleich nach SAP 5.4 war nicht möglich (H13).

### E2 – alle Paare, Gesamt, MMS (`e2_kennzahlen.csv`, `e2_einzelwerte_horizont.csv`)

| Zelle | n | k/n (RE\*>0) | MRE | MdRE | MAPE | Min / Max |
|---|---|---|---|---|---|---|
| alle Paare | 10 | 9/10 | 10,9 % | 12,6 % | 11,2 % | −1,4 / 18,6 % |
| h 1–3 | 2 | nur Einzelwerte: −1,4 % (PB2015, 2015), 2,9 % (PB2021, 2021) | | | | |
| h 4–6 | 7 | 7/7 | 13,6 % | 13,9 % | 13,6 % | 5,0 / 18,6 % |
| h ≥ 7 | 1 | nur Einzelwert: 12,3 % (PB2015, 2020) | | | | |

Das einzige Paar mit negativer Abweichung ist PB2015 für 2015 (h = 3). Die Abweichungen sind in Horizonten 4–6 durchgängig positiv. Eine Verbesserung über die Berichte oder eine Zunahme mit dem Horizont lässt sich aus diesen Zahlen nicht ablesen (es gibt keine Regression, SAP 5.1.3; Regression zur Mitte nicht deutbar, SAP 8.0). Die Werte der Berichte 2021 und 2023 für 2023/2024 liegen zwischen 13,9 und 18,6 %; die Berichte 2021 und 2023 teilen sich die Zieljahre 2023 und 2024 (gemeinsamer Zieljahr-Effekt möglich, `diag_RE_star_ueber_zieljahr.png`).

### E3 – MMS vs. MWMS (`e3_einzelwerte.csv`, `e3_kennzahlen.csv`)

n = 5 Paare (PB2015: 2015, 2020; PB2017: 2020; PB2023: 2023, 2024). D = ARE\*(MWMS) − ARE\*(MMS): +0,1 (2015/2015), −6,9 (2015/2020), −1,5 (2017/2020), −1,4 (2023/2023), −1,7 (2023/2024); Median −1,5 Prozentpunkte; D < 0 in 4 von 5 Paaren. Das MWMS lag in 4 von 5 Paaren näher am Ist-Wert. Das ist kein Ranking nach Güte (SAP 8.2): Es sagt nicht, ob die zusätzlichen Maßnahmen umgesetzt wurden. Die MWMS-Werte 2015 stammen aus der Fassung vom Sept. 2016 (H1); PB2019 und PB2021 fehlen in E3.

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

E1 je Sektor (2020; E\* in Mt / RE\* in %): Energiewirtschaft PB2017 76,0 / 34,5, PB2019 77,1 / 35,0; Industrie PB2015 1,1 / 0,7, PB2017 −3,4 / −2,0, PB2019 2,3 / 1,4; Gebäude PB2017 −8,6 / −7,1, PB2019 −10,4 / −8,5; Verkehr 9,7 / 6,6 und 22,5 / 15,4; Landwirtschaft 4,6 / 7,0 und 3,1 / 4,7; Abfall 0,7 / 12,1 (PB2015), 0,6 / 9,8, 0,4 / 5,8. Beim kleinen Sektor Abfallwirtschaft entspricht ein relativer Fehler von 5,8–12,1 % nur 0,4–0,7 Mt; Sektorvergleiche dürfen sich nicht allein auf relative Werte stützen (SAP 8.0). Für PB2015 sind nur zwei Sektoren zuordenbar (H4). Die Sektorwerte ohne EEA-Gegenstück sind nur durch interne Abgleiche und Sichtprüfung abgesichert (H6, offen). MWMS-Sektoren: nur Anhang (`tabelle4_anhang_sektoren_paare_MWMS.csv`, `e4_sektoren_kennzahlen_MWMS_anhang.csv`; je Sektor n = 3 bzw. 5).

### E5 – Zerlegung der unbereinigten Abweichung (`e5_zerlegung.csv`, Grafik 3)

Für 2020 (Gesamt, MMS), ohne Bereinigung um spätere Inventarrevisionen: E_unb = Startpunkt + Verlauf: PB2015 110 = 22 + 87 (Startpunktanteil 20 %); PB2017 85 = 7 + 79 (8 %); PB2019 105 = 10 + 94 (10 %). Die multiplikative Bereinigung (E\*: 90 / 79 / 95 Mt) und der additive Verlaufsterm (87 / 79 / 94 Mt) sind nicht identisch, aber nahe beieinander. Bei kleinem |E_unb| (PB2015 für 2015: 9 Mt) sind Anteile > 100 % rechnerisch, aber nicht aussagekräftig. Die Zerlegung ist keine Ursachenanalyse.

## 5. Sensitivitäten (`tabelle3_sensitivitaeten_E2.csv`, `…_E1.csv`, `tabelle3b_…_E3.csv`, `tabelle4b_…`)

| Spezifikation | n | MRE | MdRE | MAPE | k/n |
|---|---|---|---|---|---|
| Primär | 10 | 10,9 | 12,6 | 11,2 | 9/10 |
| S1 unbereinigt (ohne Bereinigung um spätere Inventarrevisionen) | 10 | 12,1 | 14,4 | 12,1 | 10/10 |
| S1 + S3a (unbereinigt, ohne 2020) | 7 | 11,5 | 14,5 | 11,5 | 7/7 |
| S2 Inventarrevision | nicht durchgeführt (H5) | | | | |
| S3a ohne 2020 | 7 | 10,4 | 13,9 | 10,8 | 6/7 |
| S3b ohne 2020, 2021 | 6 | 11,6 | 14,9 | 12,1 | 5/6 |
| S4 ohne 2022 | 9 | 11,5 | 13,0 | 11,8 | 8/9 |
| S5 Interpolation (16 zusätzliche Paare) | 26 | 10,4 | 9,6 | 11,0 | 22/26 |
| S6 erweiterte Berichtsmenge | nicht durchgeführt (Grund s. Protokoll C) | | | | |
| S7 mit Zieljahr 2025 (Vorjahresschätzung) | 15 | 12,9 | 13,9 | 13,1 | 14/15 |
| S8 alt. Horizont h' | 10 (Klassen: h' ≤ 0: n=3, MRE 6,7; h' 1–3: n=6, MRE 12,7; 4–6 und ≥ 7: n < 3) | | | | |
| S9 mit LULUCF | n = 2: PB2017 11,3 %, PB2019 13,0 % (RE\*, t = 2020), nur Einzelwerte | | | | |

E1 unter S1 (unbereinigt): 15,0 / 11,7 / 14,3 % (PB2015 / 2017 / 2019); unter S9: 11,3 % (2017), 13,0 % (2019). E3 unter den Sensitivitäten: Median D −1,5 (S1, S4), −1,4 (S3a, S3b, jeweils n = 3), −2,6 (S5, n = 17), −1,8 (S7, n = 8). Vorzeichen von MRE und MdRE sind in allen berechneten Sensitivitäten positiv. Sektoren unter S1/S3a/S3b/S4: `tabelle4b_sektoren_sensitivitaeten.csv`. **Ungünstig/auffällig:** Bei Abfallwirtschaft und Sonstiges ist der Unterschied bereinigt/unbereinigt groß (MRE 2,8 % vs. 40,6 %), weil der Sektor-Faktor 0,65–0,78 beträgt; unter S1 ist k/n dort 10/10. Das zeigt, wie stark die unbereinigte Skala von Inventarrevisionen in kleinen Sektoren abhängt.

Post-hoc (nur Information, keine Entscheidungswirkung): PB2021, 2020-Wert aus Tab. 126 (Vorjahresschätzung, kein Paar): RE_unb +1,2 %, RE\* +0,2 %. PB2015 mit AR4-Umrechnung statt SAR: RE\* 2020 12,0 % statt 12,3 %.

## 6. Diagnostik (SAP 5.2)

1. Abhängigkeitsstruktur (`diag_abhaengigkeitsstruktur.csv`): Zieljahr 2020 wird von den Berichten 2015, 2017, 2019 geteilt; 2023 und 2024 von den Berichten 2021 und 2023; die vier PB2021-Paare gehören zu einem Pfad. Die 10 Paare sind **nicht unabhängig**.
2. Punktdiagramm aller RE\*-Werte: `diag_punktdiagramm_RE_star.png`; keine einzelnen dominierenden Werte erkennbar (Maximum 18,6 %, MdRE 12,6 % ≈ MRE 10,9 %); eine Ausnahme nach unten ist PB2015/2015 (−1,4 %).
3. Leave-one-report-out (`diag_leave_one_report_out.csv`): Kein Weglassen eines Berichts kehrt das Vorzeichen von MRE oder MdRE um; MAPE ändert sich um −11,5 % bis +9,7 % (relativ), also nie um mehr als 25 %. Meldepflichtig nach SAP: keiner. MRE ohne Einzelberichte: 9,5–12,2 %.
4. Zieljahr-Schocks (`diag_RE_star_ueber_zieljahr.png`): Für 2020 liegen alle drei Berichte zwischen 10,9 und 13,0 %; ein gemeinsamer Ausschlag in 2020 ist erkennbar (konsistent mit Corona-Prägung, aber nicht getrennt von anderen Einflüssen; S3a/S3b verändern MRE nur wenig). Für 2023/2024 liegen beide Berichte bei 13,9–18,6 %.
5. Faktoren: siehe Abschnitt 3.
Formale Tests (Durbin-Watson, Shapiro-Wilk, Ljung-Box) wurden gemäß SAP 5.2 **nicht** gerechnet (H12).

## 7. Limitationen und Aussagegrenzen (SAP 9, 5.1.1)

- Zehn abhängige Paare aus fünf Berichten; Kennzahlen instabil. Keine Verallgemeinerung auf künftige Projektionen; die Berichte sind keine Stichprobe. Wörter wie „signifikant“ sind nicht zulässig und werden nicht verwendet.
- Das Zieljahr 2020 trägt drei der zehn Paare und ist pandemiegeprägt; E1 beruht auf drei Berichten (2021 und 2023 ohne 2020-Paar).
- Die Basisjahrbereinigung setzt proportionale Niveauverschiebungen voraus; ein untypischer Wert in J_b würde auf den ganzen Pfad übertragen (z. B. J_b = 2019 für PB2023, J_b = 2018 für PB2021). Die Primärzahl misst den Verlauf, nicht das Niveau.
- Nur explizit ausgewiesene Zieljahre; Interpolation nur in S5.
- S2 und S6 nicht durchgeführt; keine Aussage zur Wirkung der Inventarrevision der Ist-Werte (S2) und zu den UBA-Projektionen 2024/2025.
- Sektoren: KSG-Zuordnung für PB2015 nur teilweise; Sektorwerte ohne EEA-Gegenstück nur eingeschränkt gegen eine unabhängige Übertragung abgesichert (H6). Kleine Sektoren haben große relative Fehler bei kleinen absoluten (SAP 8.0).
- PB2015 MWMS stammt aus der Fassung 2016 (H1). Die GWP-Basis der Berichte unterscheidet sich (SAR/AR4/AR5); die Bereinigung fängt das nur proportional ab.
- Referenzinventar wird künftig revidiert; Ergebnisse gelten für Submission 2026.
- UBA-Inventar liegt in jedem Jahr 2015–2024 um 5,7–6,6 % über der OWID-Reihe (SAP 3.5.4 verlangt Erläuterung): als Ursache kommen AR6- vs. AR5-GWP und Gasabdeckung in Frage, **nicht verifiziert**; ohne Wirkung auf die Primärquelle.
- Keine Ursachenzerlegung; keine Bewertung von Klimapolitik oder Modellierung; keine Aussage zu Zielerreichung künftiger Jahre. Der Bericht 2013 ist nicht enthalten.

## 8. Dateien

`output/`: 02_auswertung_konsole.txt, 02_lauf_stdout.log, sessionInfo_02_auswertung.txt, 02_pruefsummen_vor_auswertung.csv, referenzinventar_A_verwendet.csv, plausi_vorjahresschaetzung_2025.csv, reihen_P_verwendet.csv, verfuegbarkeit_PJb_final.csv, umskalierungsfaktoren.csv, paare_alle_voll.csv, tabelle1_berichte.csv, tabelle1b_ausgefallen.csv, tabelle2_paare_gesamt.csv, tabelle3_sensitivitaeten_E1.csv, tabelle3_sensitivitaeten_E2.csv, tabelle3b_sensitivitaeten_E3.csv, tabelle4_sektoren_paare_MMS.csv, tabelle4_anhang_sektoren_paare_MWMS.csv, tabelle4b_sektoren_sensitivitaeten.csv, e1_ergebnisse.csv, e2_kennzahlen.csv, e2_einzelwerte_horizont.csv, e3_einzelwerte.csv, e3_kennzahlen.csv, e4_*.csv, e5_zerlegung.csv, s8_horizont.csv, summe_bereinigte_sektoren_vs_gesamt.csv, zuordnungstabelle_sektoren.csv, diag_*.csv/png, posthoc_*.csv, unsicherheitsband_textsuche.csv, grafik1_kerngrafik_bereinigt.png, grafik1b_unbereinigt.png, grafik2_RE_gegen_horizont.png, grafik3_E5_zerlegung_2020.png.
