# Analysebericht – Ausbaupfad Wind an Land und Solar (Fortschreibung des MaStR-Bestands)

**Status:** Ergebnisbericht des analyst-Subagenten, **vor der Validierung**. Keine Kernaussage ist freigegeben.
**SAP:** `SAP_ausbaupfad-wind-solar.md`, Version 1.0, Status final (eingefroren 29.10.2026, Freigabe Daniel Saure).
**Skript / Log:** `ausbaupfad-wind-solar.R`, `run_log.txt`; Abweichungen: `Abweichungsprotokoll_ausbaupfad-wind-solar.md`.
**Datenstand:** Marktstammdatenregister, Gesamtdatenexport 20261029_26.2 (Stand 29.10.2026, 00:00 Uhr). SHA-256 aller 79 verschiedenen Dateien der Prüfsummenliste stimmen überein (`output/pruefsummen_abgleich.csv`).
**Läuft ein Stopp?** Nein. Keine Stopp-Regel des SAP wurde ausgelöst.

## Zusammenfassung (Nachtrag nach Validierungsbericht vom 30.10.2026, Auflagen H-1, H-2, M-4)

- **E1 hängt an der Leistungsgröße.** Bestand Dezember 2024 brutto / netto: Wind an Land 63,5 / 63,5 GW (Abstand zum Ziel 69 GW: −5,5 / −5,5 GW); **Solar 100,8 / 90,1 GW (Abstand zum Ziel 88 GW: +12,8 / +2,1 GW)**. Die Wahl zwischen Brutto- und Nettonennleistung verschiebt die Aussage bei Solar deutlich (Abschnitt 2, 6). Eine Zweitquelle zur Plausibilisierung liegt **nicht** vor (S3 nicht durchgeführt); welche Größe näher am Gesetzesbegriff liegt, ist ungeprüft.
- **E2 (Punktzeitpunkt Ziel 2030, Spanne über die drei Fenster):** Wind an Land 2036 bis 2041; Solar 2031 bis 2032. Das Ergebnis hängt vom Fenster ab.
- **Autokorrelation (Aussagegrenze):** Die Residuen sind bei F24 und F60 stark autokorreliert und systematisch gekrümmt (U-förmig). Durbin-Watson: Wind an Land F24 0,47 und F60 0,04; Solar F60 0,02 (schwächer, aber ebenfalls auffällig: Solar F24 1,09, Wind F12 1,12). **Die klassischen Prognoseintervalle sind bei F24 und F60 zu eng, die invertierten Intervalle "frühestens/spätestens" dort nicht belastbar.** Auch die Zusatzrechnungen S5 (Newey-West mit Lag 2 bis 3, Block-Bootstrap mit Blocklänge 3 bis 4) beheben das nicht: Bei einer Autokorrelation erster Ordnung von etwa 0,9 bilden so kurze Lags und Blöcke die Abhängigkeit nicht ab, und das Bootstrap-Intervall des Zeitpunkts ist praktisch so schmal wie das klassische. S5 ist deshalb **keine** Absicherung gegen dieses Problem. Zeitpunkte sind nur als Spanne über die Fenster zu zitieren.

## 0. Wichtige Vorbemerkungen (laut SAP Pflicht im Bericht)

- **Fortschreibung ist keine Prognose.** Die Rechnung beantwortet nur: "Wann wäre das Ziel erreicht, wenn der Netto-Zubau des Fensters konstant bliebe?" Sie enthält keine Annahmen zu Politik, Förderung, Genehmigungen, Netzausbau, Lieferketten oder Marktlage. Ein Abstand zwischen Fortschreibung und Ziel ist keine Bewertung von Politik oder Maßnahmen; Ursachen werden nicht untersucht.
- **Endmonat T = Juli 2026** (drei Kalendermonate vor dem Exportmonat Oktober 2026, Regel SAP 2.1). August, September und Oktober 2026 gehen in die Primäranalyse nicht ein (Nachmeldungen, SAP 3.5 Nr.1). Die Variante mit allen Monaten bis September 2026 ist Sensitivität S1.
- **Offengelegtes Vorwissen (SAP Abschnitt 0):** Dem SAP-Autor wurde vorab aus einem ungeprüften Suchergebnis (pv magazine zum DIW-Monitor, Februar 2026) mitgeteilt, Wind an Land liege bei rund 68 GW und Photovoltaik liege näher am Pfad als Wind. Die Analyse wurde dennoch als prospektiv mit offengelegtem Vorwissen geführt (Entscheidung Daniel Saure, 29.10.2026). Alle Fenster, Modelle und Regeln wurden unabhängig davon festgelegt.
- **Leistungsgröße:** Primär Bruttoleistung der Einheit laut MaStR (Setzung, SAP 3.3). Die Felddokumentation definiert Brutto- und Nettonennleistung nicht; bei EEG-Anlagen nennt das Register die Nettonennleistung "installierte Leistung". S6 zeigt den Einfluss (Abschnitt 6).
- **Zielwerte:** § 4 EEG (Wind an Land, Solar) und § 1 Abs. 2 WindSeeG (Wind auf See) wie in SAP 2.2. Der amtliche Fassungsstand ist nicht belegt (Limitation).
- **Kein Hypothesentest über Ziele.** Die Wörter "signifikant", "Prognose", "Verfehlung" werden nicht verwendet.

## 1. Datenfluss (Tabelle 1; Datei `output/tabelle1_datenfluss.csv`)

| Schritt | Wind an Land | Solar | Wind auf See (E5) |
|---|---|---|---|
| Rohdatensätze in den Einheitendateien (Wind alle Lagen / Solar) | 44 340 (alle Lagen) | 6 613 081 | (in Wind enthalten) |
| Dubletten (gleiche MaStR-Nummer) entfernt | 0 | 0 | 0 |
| Population nach Bereinigung | 42 431 (129,3 GW) | 6 613 081 (142,1 GW) | 1 909 (13,0 GW) |
| harte Ausschlüsse (Brutto fehlt, ≤ 0, über harter Schwelle) | 0 | 0 | 0 |
| ohne Inbetriebnahmedatum (alle: Status "in Planung") | 8 750 (54,0 GW) | 66 137 (9,6 GW) | 91 (1,4 GW) |
| Inbetriebnahmedatum nach Exportdatum | 0 | 0 | 0 |
| im Datensatz für Bestand und Zubau | 33 681 (75,3 GW) | 6 546 944 (132,6 GW) | 1 818 (11,6 GW) |
| davon mit gültigem Datum endgültiger Stilllegung (S) | 3 166 (3,75 GW) | 91 155 (0,44 GW) | 0 |
| "endgültig stillgelegt" ohne Stilllegungsdatum | 0 | 1 (0,00001 GW) | 0 |
| Stilllegungsdatum vor Inbetriebnahme / Datum bei Status nicht endgültig | 0 / 0 | 1 / 2 | 0 / 0 |
| weiche Markierungen (Leistung / Netto > Brutto) | 0 / 0 | 0 / 0 | 0 / 0 |

Windeinheiten ohne Lage: 0. Verschiedene Nummern mit identischer Lokation, Datum und Bruttoleistung (nicht entfernt, Operationalisierung siehe Abweichungsprotokoll A-01): Wind 9 040 Einheiten in 3 508 Gruppen, Solar 27 843 in 12 163 Gruppen.

**Gelöschte und deaktivierte Einheiten (SAP 3.5 Nr.12):** Alle drei Dateien wurden gelesen (257 967 Datensätze, 247 807 eindeutige Nummern). Vom Typ Windeinheit: 1 724, vom Typ Solareinheit: 176 646 (Systemstatus "Deaktiviert" oder "Gelöscht"; Betriebsstatus bei den meisten "In Betrieb"; häufigster Löschgrund bei gelöschten Einheiten "Duplikat/Doppelte Registrierung"; Aufschlüsselung je Typ, Löschgrund und Betriebsstatus: `output/tabelle1_geloeschte_deaktivierte_je_typ_grund_status.csv`). **Überlappung mit den Einheitendateien: 0 Nummern (0,0 GW)**; alle 1 724 Wind- und 176 646 Solar-Nummern haben keinen Datensatz in den Einheitendateien. Nach der SAP-Regel gehen sie nicht in Bestand, Z oder S ein und werden nicht als Stilllegung gezählt. Mit Betriebsstatus "endgültig stillgelegt" ohne Überlappung: Wind 26, Solar 3 221 (Hinweis auf einen nicht erfassten Stilllegungsanteil, keine Quantifizierung möglich, keine Leistung in G). S9 entfällt (keine Überlappung).

Rechenprobe C(m) − C(m−1) = Z − S: erfüllt (Abweichung ≤ 1,4·10⁻⁸ kW); zusätzliche Direktberechnung des Bestands je Monatsende Januar 2019 bis September 2026: Abweichung ≤ 7,4·10⁻⁶ kW.

## 2. E1: Abstand des Bestands zum Zwischenziel 2024 (Kernzahl; `output/tabelle2_E1_abstand_zwischenziel_2024.csv`)

| Technologie | Bestand Dez 2024 | Ziel 2024 | Δ (GW) | Δ (% des Ziels) | Einordnung (SAP 12) |
|---|---|---|---|---|---|
| Wind an Land (brutto, primär) | 63,5 GW | 69 GW | −5,5 | −8,0 % | Bestand unter dem Zwischenziel |
| Wind an Land (netto, S6; identisch, Netto = Brutto in den Daten) | 63,5 GW | 69 GW | −5,5 | −8,0 % | Bestand unter dem Zwischenziel |
| Solar (**brutto**, primär) | 100,8 GW | 88 GW | +12,8 | +14,6 % | Bestand auf oder über dem Zwischenziel |
| Solar (**netto**, S6) | 90,1 GW | 88 GW | +2,1 | +2,3 % | Bestand auf oder über dem Zwischenziel |

**Die Leistungsgröße verschiebt die Aussage bei Solar:** Abstand zum Ziel 2024 +12,8 GW (brutto) gegenüber +2,1 GW (netto). Die Felddokumentation definiert beide Größen nicht; eine Zweitquelle zum Abgleich liegt nicht vor (S3 nicht durchgeführt). Welche Größe näher am Gesetzesbegriff der installierten Leistung liegt, ist ungeprüft.

Der Bestand ist aus dem Registerstand vom 29.10.2026 rekonstruiert (rückwirkend vervollständigt, SAP 3.5 Nr.1). Unter S6 (Nettonennleistung) beträgt der Solar-Bestand Dez 2024 90,1 GW (Δ +2,1 GW); Wind an Land ist unverändert (Nettonennleistung = Bruttoleistung in den Daten, siehe Abschnitt 6).

## 3. E2 bis E4: Fortschreibung auf das Ziel 2030, Fenster 12, 24, 60 Monate (Kernzahlen; `output/tabelle3_E2_E3_E4_je_technologie_und_fenster.csv`)

Bestand am Ende T (Juli 2026): Wind an Land C(T) = 70,4 GW (Ziel 2030: 115 GW), Solar C(T) = 128,1 GW (Ziel 2030: 215 GW). x(2030) = 53 Monate. **Alle drei Fenster nebeneinander, kein Fenster ist hervorgehoben.**

**Wenn der Netto-Zubau der letzten W Monate anhielte, würde das Ziel 2030 erreicht im …** (Monatsendpunkt; "früh" und "spät" = invertiertes klassisches 95-%-Prognoseintervall):

| Technologie | Fenster | Punkt | frühestens | spätestens | Wert am 31.12.2030 [95-%-PI] (GW) | Einordnung des Ziels (SAP 12) |
|---|---|---|---|---|---|---|
| Wind an Land | 12 Mon. (n = 13) | 01/2036 | 06/2035 | 09/2036 | 91,2 [89,7; 92,7] | Das Ziel liegt oberhalb des 95-%-Prognoseintervalls der Fortschreibung. |
| Wind an Land | 24 Mon. (n = 25) | 12/2036 | 07/2036 | 04/2037 | 89,3 [88,5; 90,2] | oberhalb |
| Wind an Land | 60 Mon. (n = 61) | 12/2041 | 02/2041 | 10/2042 | 82,1 [80,6; 83,7] | oberhalb |
| Solar | 12 Mon. | 08/2031 | 06/2031 | 10/2031 | 203,8 [201,1; 206,5] | oberhalb |
| Solar | 24 Mon. | 08/2031 | 07/2031 | 09/2031 | 203,8 [202,4; 205,2] | oberhalb |
| Solar | 60 Mon. | 09/2032 | 03/2032 | 03/2033 | 189,7 [182,8; 196,6] | oberhalb |

Zusammenfassung nach SAP 12: bei Wind an Land liegt das Ziel 2030 in **3 von 3** Fenstern oberhalb des 95-%-Prognoseintervalls (0 von 3 im Intervall, 0 von 3 unterhalb); bei Solar ebenso in **3 von 3** Fenstern oberhalb. Bei beiden Technologien variiert der Punktzeitpunkt zwischen den Fenstern (Wind an Land 2036 bis 2041; Solar 2031 bis 2032); **das Ergebnis hängt vom Fenster ab.** Das Intervall deckt nur die Streuung um die Gerade ab, nicht die Annahme konstanten Zubaus.

**Aussagegrenze Autokorrelation (Auflage H-1):** Die Durbin-Watson-Werte (Wind an Land F24 0,47, F60 0,04; Solar F60 0,02; Abschnitt 7) und die U-förmigen Residuen zeigen, dass die lineare Gerade bei F24 und F60 den Verlauf des kumulierten Bestands nicht trifft. Das klassische Prognoseintervall und das daraus invertierte Intervall "frühestens/spätestens" sind bei F24 und F60 (Wind an Land und Solar) **zu eng** und dort nicht belastbar; auch unter S5 bleiben sie zu eng (Abschnitt 6). Zeitpunkte werden nur als Spanne über die drei Fenster genannt.

**E3: erforderlicher jährlicher Netto-Zubau (R) gegenüber dem Zubau der Fenster** (R = (Ziel 2030 − C(T)) / (53/12 Jahre)):

| Technologie | R (GW/Jahr) | Fenster | s_W = 12·b (GW/Jahr) [95-%-KI] | ā_W (GW/Jahr) | s_W / R | R − s_W (GW/Jahr) |
|---|---|---|---|---|---|---|
| Wind an Land | 10,1 | 12 | 4,7 [4,4; 5,0] | 4,7 | 0,46 | 5,4 |
| | | 24 | 4,3 [4,2; 4,5] | 4,2 | 0,43 | 5,8 |
| | | 60 | 3,0 [2,9; 3,1] | 3,0 | 0,30 | 7,1 |
| Solar | 19,7 | 12 | 17,2 [16,7; 17,7] | 17,9 | 0,87 | 2,5 |
| | | 24 | 17,2 [17,0; 17,4] | 17,3 | 0,87 | 2,5 |
| | | 60 | 14,8 [14,3; 15,3] | 14,0 | 0,75 | 4,9 |

(Rundung, G-2: Die gerundete CSV `tabelle3_E2_E3_E4_...csv` zeigt s_W/R mit einer Nachkommastelle, der Bericht mit zwei; bei Solar F12 ergeben die gerundeten Werte Brutto 18,0, Stilllegung 0,2, Netto 17,9 ein Rundungsartefakt. Volle Genauigkeit: `output/zwischen/voll_tabelle3_primaer.csv`.) (Steigung je Monat b in GW: Wind 0,391 / 0,360 / 0,250; Solar 1,434 / 1,435 / 1,232.)

**E4: Anteil der Stilllegungen am Brutto-Zubau (Q_W)** und Jahreswerte (GW/Jahr, Summe über die W Monate des Fensters):

| Technologie | Fenster | Brutto-Zubau | Stilllegung | Netto-Zubau | Q_W |
|---|---|---|---|---|---|
| Wind an Land | 12 | 5,5 | 0,9 | 4,7 | 15,7 % |
| | 24 | 4,9 | 0,8 | 4,2 | 15,3 % |
| | 60 | 3,6 | 0,6 | 3,0 | 16,8 % |
| Solar | 12 | 18,0 | 0,2 | 17,9 | 0,9 % |
| | 24 | 17,5 | 0,1 | 17,3 | 0,8 % |
| | 60 | 14,1 | 0,1 | 14,0 | 0,5 % |

Hinweis: In den Stilllegungen sind Repowering-Fälle enthalten und werden nicht herausgerechnet (Brutto-Zubau enthält die Ersatzanlage; SAP 3.5 Nr.7). Verspätete oder fehlende Stilllegungsmeldungen würden den Netto-Zubau tendenziell überzeichnen (nicht korrigiert).

## 4. E1b: Zwischenziel 2026 als Fortschreibung (sekundär; `output/tabelle2_E1b_fortschreibung_2026.csv`)

Der Stichtag 31.12.2026 liegt nach dem Exportdatum; ein Vergleich von Ist und Ziel ist nicht möglich. Fortschreibung bis x(2026) = 5 Monate nach T:

| Technologie | Fenster | Wert 31.12.2026 [95-%-PI] (GW) | Ziel 2026 | Einordnung |
|---|---|---|---|---|
| Wind an Land | 12 | 72,4 [72,0; 72,9] | 84 | Ziel oberhalb des Intervalls |
| | 24 | 72,1 [71,6; 72,5] | 84 | oberhalb |
| | 60 | 70,1 [68,7; 71,6] | 84 | oberhalb |
| Solar | 12 | 135,0 [134,2; 135,7] | 128 | Ziel unterhalb des Intervalls |
| | 24 | 135,0 [134,2; 135,7] | 128 | unterhalb |
| | 60 | 130,5 [124,4; 136,6] | 128 | Ziel im Intervall |

**Bei Solar fallen die Fenster in verschiedene Kategorien (F12 und F24: Ziel unterhalb des Intervalls; F60: Ziel im Intervall). Das Ergebnis hängt vom Fenster ab** (SAP 7 Nr. 4). Zusammenfassung "k von 3": Wind an Land 3 von 3 Fenstern Ziel oberhalb; Solar 2 von 3 unterhalb, 1 von 3 im Intervall.

Deskriptive Hilfsgröße (linear zwischen den Zielen 2024 und 2026 interpolierter Zielwert für Juli 2026, Operationalisierung siehe Abweichungsprotokoll A-11): Wind an Land 80,9 GW, C(T) 70,4 GW, Abstand −10,5 GW (−13,0 %); Solar 119,7 GW, C(T) 128,1 GW, Abstand +8,4 GW (+7,0 %).

## 5. E5 (sekundär): Wind auf See, Ziel 30 GW bis 2030 (WindSeeG; nicht Kernzahl; `output/tabelle3_E5_wind_auf_see.csv`)

Bestand Juli 2026: 10,9 GW. R = 4,3 GW/Jahr. Der Zubau erfolgt in wenigen großen Schritten (Grafik 3, `output/grafiken/grafik3_wind_auf_see_E5.png`); die lineare Fortschreibung ist hier besonders grob.

| Fenster | Punkt | frühestens | spätestens | Wert 31.12.2030 [95-%-PI] | s_W (GW/Jahr) | s_W / R | Q_W |
|---|---|---|---|---|---|---|---|
| 12 | 05/2036 | 11/2034 | 04/2038 | 19,5 [18,0; 21,1] | 2,0 | 0,45 | 0 % |
| 24 | 03/2051 | 06/2045 | nicht bis 2060 erreicht | 13,9 [12,4; 15,3] | 0,8 | 0,18 | 0 % |
| 60 | nicht bis 2060 erreicht | nicht bis 2060 erreicht | nicht bis 2060 erreicht | 12,3 [11,6; 12,9] | 0,5 | 0,12 | 0 % |

Das Ziel liegt in allen drei Fenstern oberhalb des 95-%-Prognoseintervalls (3 von 3). Keine Stilllegungen im Datensatz (Q_W = 0).

## 6. Sensitivitäten (vollständig; `output/tabelle4_*.csv`; keine Kombinationen)

Punktzeitpunkt für das Ziel 2030 (Fenster 12 / 24 / 60), in Klammern frühestens bis spätestens:

| Variante | Wind an Land | Solar |
|---|---|---|
| Primär (Brutto, Ende Juli 2026) | 01/2036 / 12/2036 / 12/2041 | 08/2031 / 08/2031 / 09/2032 |
| **S1** alle Monate, Ende September 2026 (C(T_S1) Wind 71,3 GW, Solar 131,1 GW; x(2030) = 51) | 04/2036 (09/2035–11/2036) / 08/2036 (04/2036–11/2036) / 04/2041 (07/2040–02/2042) | 07/2031 (05/2031–09/2031) / 08/2031 (07/2031–09/2031) / 06/2032 (01/2032–11/2032) |
| **S2** Brutto-Zubau (Stilllegungen ignoriert) | 06/2034 / 02/2035 / 07/2038 | 08/2031 / 08/2031 / 08/2032 |
| **S4** Flussmodell (Anker C(T), ā_W) | 02/2036 / 04/2037 / 04/2041 | 06/2031 / 08/2031 / 10/2032 |
| **S6** Nettonennleistung (C(T) Wind 70,4 GW, Solar 113,5 GW) | 01/2036 / 12/2036 / 12/2041 | 06/2033 / 06/2033 / 09/2034 |
| **S7** weiche Fälle ausgeschlossen | wie primär (0 weiche Fälle) | wie primär (0 weiche Fälle) |

- **S3** (Zweitquelle) und die Zweitquellen-Plausibilisierung: **nicht durchgeführt**, Grund: Zweitquelle nicht beschafft, kein Netzzugriff im Analyselauf (SAP 3.2: blockiert nichts). Ein Abgleich mit Energy-Charts, Bundesnetzagentur oder OWID liegt damit nicht vor.
- **S5** (Zusatzrechnung mit Newey-West und Block-Bootstrap nach SAP 5.3; **nicht** als "robust" zu lesen, Auflage H-1): Newey-West-Lag 2, 2, 3 (Soll nach SAP geprüft); Block-Bootstrap mit Blocklänge 3, 3, 4, B = 10 000, Seed 20261029. Beispiele (95-%-Perzentilintervall des Erreichungszeitpunkts / Wert 2030): Wind an Land F12 06/2035 bis 10/2036 / 89,7 bis 92,7; F24 07/2036 bis 05/2037 / 88,3 bis 90,3; F60 10/2040 bis 04/2043 / 80,3 bis 84,1; Solar F12 07/2031 bis 10/2031 / 201,6 bis 206,0; F24 07/2031 bis 09/2031 / 202,3 bis 205,4; F60 03/2032 bis 04/2033 / 181,6 bis 197,9. In keiner Wiederholung wurde das Ziel "nicht erreicht" (Anteil 0). Newey-West-Standardfehler von b weichen vom klassischen ab (zum Beispiel Wind F60: 0,011 statt 0,005 GW/Monat; Solar F60: 0,046 statt 0,021), das Konfidenzintervall von s_W wird bei F60 breiter (Wind 2,7 bis 3,3 statt 2,9 bis 3,1; Solar 13,7 bis 15,9 statt 14,3 bis 15,3). Volle Tabelle: `output/tabelle4_S5_autokorrelationsrobust.csv` (Dateiname historisch). **Einschränkung:** Bei F24 und F60 (Residuen-ACF Lag 1 bei F60 etwa 0,9, bei F24 0,65 bei Wind und 0,44 bei Solar; Durbin-Watson unter 1; gekrümmte Residuen) bilden Lag 2 bis 3 und Blocklänge 3 bis 4 die Abhängigkeit nicht ab; das Bootstrap-Intervall des Zeitpunkts ist dort praktisch so schmal wie das klassische (Wind an Land F60: Bootstrap 10/2040 bis 04/2043 gegenüber invertiertem klassischem Intervall 02/2041 bis 10/2042). **Die Intervalle bei F24 und F60 sind auch unter S5 zu eng.**
- **S6:** Für Wind an Land sind Brutto- und Nettonennleistung in den Daten identisch; bei Solar liegt die Nettonennleistung deutlich unter der Bruttoleistung (C(Dez 2024): 90,1 statt 100,8 GW; C(T): 113,5 statt 128,1 GW). Die Wahl der Leistungsgröße verschiebt bei Solar den Erreichungszeitpunkt um 22 bis 24 Monate, also rund zwei Jahre (Punkt: F12 und F24 08/2031 nach 06/2033, F60 09/2032 nach 09/2034; Korrektur G-1).
- **S1, weitere Kennzahlen:** E1b, E3 und E4 unter S1 stehen in `output/tabelle4_sensitivitaeten_S1_S2_S6_S7.csv` (Zeilen mit "S1"), nicht im Berichtstext (G-3).
- **S7:** keine weich markierten Einheiten; Ergebnis identisch mit primär. **S8:** deskriptiv (Abschnitt 7). **S9:** nicht durchgeführt, Grund: keine Überlappung.

## 7. Diagnostik (SAP 5.2; `output/diagnostik_je_technologie_und_fenster.csv`, `output/grafiken/diagnostik_*.png`)

Durbin-Watson (zweiseitig, α = 0,05) und Shapiro-Wilk (α = 0,05) der OLS-Residuen, alle Kombinationen (auch ungünstige):

| Technologie | Fenster | DW (p) | ACF Lag 1 | Shapiro-Wilk W (p) | Cook > 4/n (Anzahl) |
|---|---|---|---|---|---|
| Wind an Land | 12 | 1,12 (0,033) | 0,41 | 0,876 (0,062) | 0 |
| | 24 | 0,47 (< 0,0001) | 0,65 | 0,958 (0,382) | 1 (Juli 2024) |
| | 60 | 0,04 (< 0,0001) | 0,91 | 0,915 (0,0004) | 8 |
| Solar | 12 | 1,70 (0,358) | 0,02 | 0,856 (0,034) | 2 |
| | 24 | 1,09 (0,007) | 0,44 | 0,932 (0,098) | 1 |
| | 60 | 0,02 (< 0,0001) | 0,92 | 0,953 (0,021) | 4 |
| Wind auf See (E5) | 12 / 24 / 60 | 0,81 (0,003) / 0,13 (< 0,0001) / 0,11 (< 0,0001) | 0,44 / 0,85 / 0,84 | 0,929 (0,334) / 0,977 (0,809) / 0,924 (0,001) | 1 / 2 / 5 |

Die Residuen sind in den meisten Kombinationen positiv autokorreliert (stark bei F24 und F60) und bei F24/F60 sichtbar U-förmig gekrümmt (`output/grafiken/diagnostik_*.png`). **Das klassische Prognoseintervall ist bei F24 und F60 zu eng; S5 behebt das nicht** (Abschnitt 6; Auflage H-1). Bei n = 13 und n = 25 ist die Aussagekraft der Tests begrenzt, bei n = 13 hat Shapiro-Wilk sehr geringe Trennschärfe. Die Diagnostik ändert die Primärspezifikation nicht und wählt kein Fenster aus. Cook-Markierungen sind nur Markierungen (`output/diagnostik_cook_markierungen.csv`); es wurde nichts ausgeschlossen. Laut Validierungsbericht (G-4) gehen die Cook-Markierungen bei F60 (Wind an Land 8, Solar 4) auf die systematische Krümmung der Residuen zurück, nicht auf einzelne Ausreißer; die Markierungen liegen überwiegend an den Fensterrändern.

Saisonalität des Monats-Nettozubaus (60 Monate bis Juli 2026, deskriptiv, keine Tests; `output/saisonalitaet_monatszubau_60m_je_kalendermonat.csv`, `output/grafiken/diagnostik_saisonalitaet.png`): Der mittlere Monats-Nettozubau je Kalendermonat liegt bei Wind an Land zwischen 0,13 GW (Januar) und 0,41 GW (Dezember), bei Solar zwischen 0,98 GW (September) und 1,45 GW (Juli); je Kalendermonat liegen nur fünf Beobachtungen vor, die Spannweite der Einzelwerte ist groß (Solar zum Beispiel Dezember 0,47 bis 2,02 GW).

## 8. Limitationen und Aussagegrenzen

1. **Fortschreibung, nicht Prognose.** Konstanter Netto-Zubau je Fenster; keine Beschleunigung oder Verlangsamung; Extrapolation bis 2030 liegt außerhalb der Daten. Das Intervall ist punktweise und deckt nur die Streuung um die Gerade ab.
2. **Das Ergebnis hängt vom Fenster ab** (Wind an Land: Punktjahr 2036 bis 2041; Solar 2031 bis 2032). F12 ist anfällig für Einzelmonate, F60 kann strukturelle Änderungen verwischen. Kein Fenster ist "das beste".
3. **Rechtszensierung und Nachmeldungen:** Der Bestand ist aus dem Stand vom 29.10.2026 rekonstruiert; auch die Monate bis Juli 2026 können noch unterzählt sein. Keine Nachmeldekorrektur. Stilllegungen können verspätet oder gar nicht gemeldet sein (bei gelöschten/deaktivierten Einheiten ohne Leistung und Datum kann der Stilllegungsanteil nicht nachgebildet werden, SAP 3.5 Nr.12). **Zusätzlich (Auflage M-2):** In den Dateien der gelöschten und deaktivierten Einheiten haben 1 121 Windeinheiten und 142 845 Solareinheiten den Betriebsstatus "In Betrieb" (davon nur Systemstatus "Deaktiviert": Wind 128, Solar 62 447). Sie tragen in dieser Datei weder Leistung noch Datum und stehen nicht in den Einheitendateien; sie gehen laut SAP-Regel nicht in den Bestand ein. Ob sie in der Realität bestehende Anlagen darstellen (dann wäre der Bestand unterzählt) oder zu Recht gelöscht wurden (zum Beispiel Duplikate), ist aus den Daten nicht erkennbar; die Richtung der Wirkung auf das Bestandsniveau ist **unbekannt** und wurde nicht geschätzt.
4. **Leistungsgröße:** Bruttoleistung ist eine Setzung; bei Solar liegt die Nettonennleistung um rund 11 % darunter (S6), mit Folgen für E1 (Δ +12,8 gegenüber +2,1 GW) und E2 (Auflage H-2). Ohne Zweitquelle bleibt offen, welche Größe näher am Gesetzesbegriff liegt.
5. **Zielwerte:** Der amtliche Fassungsstand von § 4 EEG und § 1 WindSeeG ist nicht belegbar (Limitation des SAP); bei Abweichung Amendment.
6. **Installierte Leistung ist nicht Stromerzeugung**, nicht Anteil am Strommix und keine Emissionsminderung.
7. **Repowering** wird nicht herausgerechnet; die Leistung der Ersatzanlage steht im Brutto-Zubau, die ersetzte Leistung in den Stilllegungen.
8. **Zielvergleich 2026** nur als Fortschreibung möglich (Stichtag nach dem Export).
9. **Zweitquelle nicht herangezogen** (S3 und Plausibilisierung nicht durchgeführt). Es gibt keine unabhängige Bestätigung der MaStR-Rekonstruktion; die Bestandsreihe ist durch eine interne Rechenprobe geprüft, nicht gegen eine zweite Quelle.
10. **Datenintegrität:** Prüfsummen der XML-Dateien stimmen; die ZIP-Prüfsumme ist unbekannt; 364 nicht benötigte Dateien wurden vor der Analyse gelöscht (SAP 3.1). **Offenlegung (Auflage M-3):** Fünf XML-Dateien im Ordner `rohdaten/` (`Bilanzierungsgebiete.xml`, `Lokationstypen.xml`, `Marktfunktionen.xml`, `Marktrollen.xml`, `Netze.xml`) stehen nicht in der Prüfsummenliste, wurden nicht geprüft und nicht verwendet (Abweichungsprotokoll H-02). **Bestätigung Daniel Saure: offen.**
10a. **Zweitquelle und Veröffentlichung:** Eine Zweitquelle fehlt (Auflage H-2). Vor einer Veröffentlichung ist der Abgleich (Toleranz 3 %) nachzuholen, oder die Lücke ist in jedem Kanaltext zu nennen.
10b. **Testlauf (Auflage M-5):** Der Schätzteil wurde vor dem Endlauf in einem Testlauf ausgeführt, dessen Skriptversion (Entwicklungsdatei im Scratchpad) und Log **nicht erhalten** sind; der Endlauf hat Log und Outputs überschrieben, und es gibt keinen Commit vor dem Testlauf. Die Aussage des Analysten, nach Sichtung der Zwischenergebnisse seien nur Darstellung, Logtexte, Beschriftungen und `unname`-Aufrufe geändert worden, ist **nicht verifizierbar**. Der Validierungsbericht hält sie per Code-Review für plausibel (keine ergebnisabhängige Wahl erkennbar).
11. **Keine Ursachenaussagen:** Die Analyse sagt nichts über Genehmigungen, Förderung, Netz, Flächen, Lieferketten oder Politik und bewertet keine Maßnahmen.

## 9. Nicht durchgeführt (vollständige Liste)

- S3 (Zweitquelle) und Plausibilisierung gegen Zweitquelle (Grund: nicht beschafft/kein Netzzugriff).
- S9 (Grund: keine Überlappung mit gelöschten/deaktivierten Einheiten).
- Optionale Repowering-Abschätzung (SAP 3.5 Nr.7, optional).
- Für E5 (Wind auf See): S1, S2, S4, S5, S6, S7 (SAP sieht sie nicht ausdrücklich vor).
- Eine unabhängige Stichprobennachrechnung (SAP 14) ist Aufgabe des Validators; im Lauf sind lediglich die Rechenprobe (Direktberechnung des Bestands) und der Abgleich der OLS-Intervalle gegen `predict()` enthalten (`run_log.txt`).

## 10. Dateien (alle unter `Analysen/2026-10-ausbaupfad-wind-solar/`)

- `ausbaupfad-wind-solar.R`, `run_log.txt` (sessionInfo, Eingabedateien mit Größe, Prüfsummen-Abgleich, alle Befunde), `Abweichungsprotokoll_ausbaupfad-wind-solar.md`, dieser Bericht.
- `output/`: Tabelle 1 (`tabelle1_*.csv`), Tabelle 2 (`tabelle2_*.csv`), Tabelle 3 (`tabelle3_*.csv`), Tabelle 4 und Sensitivitäten (`tabelle4_*.csv`), Diagnostik (`diagnostik_*.csv`, `saisonalitaet_*.csv`), `zuordnungstabelle_codes.csv`, `pruefsummen_abgleich.csv`, `stopp_pruefungen_kennzahlen.csv`, `STOPP_befund.txt`, `sessionInfo.txt`, `listen/` (Listen der Ausschlüsse und Markierungen, gz), `grafiken/` (Grafik 1 bis 3, Diagnostik), `zwischen/` (Monatsreihen, Vollpräzisions-Tabellen `voll_*.csv`).
