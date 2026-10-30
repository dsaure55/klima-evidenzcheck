# Nachtrag Zweitquelle – Ausbaupfad Wind an Land und Solar

**Kennzeichnung: Post-hoc, nach Validierung, gemäß SAP 3.2 Plausibilisierung; blockiert nichts.**
SAP v1.0 (eingefroren), Abschnitte 3.2 und 3.3. Beauftragt nach Chat-Freigabe von Daniel Saure („Passt, Zweitquelle nachholen“). SAP, Skript, `output/`, `run_log.txt`, Analysebericht und Abweichungsprotokoll wurden nicht verändert.

## 1. Tatsächlich abgerufene Quellen

| Quelle | Abruf | Ergebnis |
|---|---|---|
| Fraunhofer ISE Energy-Charts API, `https://api.energy-charts.info/installed_power?country=de&time_step=monthly&installation_decommission=false` | 30.10.2026, 13:04:44 UTC (curl, HTTP 200, 16 345 Byte, SHA-256 beginnt mit e23b739837881e73) | verwendet |
| `https://api.energy-charts.info/openapi.json` | 30.10.2026 (curl, 200) | nur zur Schemaprüfung |
| `https://energy-charts.info/publishing-notes.html`, `https://api.energy-charts.info/` (WebFetch) | 30.10.2026 | lieferten **keinen** Lizenztext (Seite lieferte nur Titel bzw. Impressum-Kopf) |
| Websuche zur Datenquelle von Energy-Charts | 30.10.2026 | keine Primärbelege, nur Hinweise (siehe 3) |

**Nicht abgerufen:** Bundesnetzagentur-EE-Statistik, Our World in Data (nicht versucht; eine Zweitquelle genügt laut Auftrag, SAP 3.2 Nr. 2 und 3 bleiben offen). Arbeitsdaten: `C:\Users\dsaur\AppData\Local\Temp\claude\C--Users-dsaur-klima-evidenzcheck\038b169d-9c7d-406e-9a67-c060d7a5b6a6\scratchpad\zweitquelle\` (`ec.json`, `ec_reihe.csv`, `vergleich.csv`, `s3_fortschreibung.csv`, `zq2.R`). Auswertung mit R 4.6.1 (Base R, `lm`, `predict`).

## 2. Schema, Einheiten, Datenstand, Lizenz

- Antwort: `time` (Format `MM.JJJJ`, 298 Monate, 01.2002 bis 10.2026), `production_types` (Biomass, Wind offshore, Wind onshore, Solar DC, Solar AC, Battery storage power/capacity), `last_update`, `deprecated=false`.
- Einheit laut OpenAPI-Beschreibung: GW; die Zeitangabe bezeichnet laut Beschreibung den Monat, die Werte die installierte Leistung am **Ende** des Monats.
- Datenstand: `last_update` = 1793349361 = 30.10.2026 08:36:01 UTC. Der Oktober 2026 ist damit ein laufender Monat (wie bei der MaStR-Rekonstruktion).
- Hinweis: Die Reihe „Wind offshore“ enthält nicht-numerische Einträge (91 Fehlwerte über alle Reihen, nach Konversion); für Wind an Land und Solar nicht relevant, nicht weiter geprüft.
- **Lizenz: nicht bestätigt.** Die OpenAPI-Beschreibung verweist auf „Publishing notes“ (energy-charts.info/publishing-notes.html), der Text war per Abruf nicht lesbar. In der OpenAPI-Beschreibung steht an anderer Stelle (anderer Endpunkt) „CC BY 4.0, attribution: energy-charts.info“; das ist **keine** Bestätigung für `installed_power`. Für eine Veröffentlichung der Zahlen sollte Daniel die Nutzungshinweise auf energy-charts.info selbst lesen. Quellenangabe in jedem Fall: Fraunhofer ISE, Energy-Charts.
- **Solar:** Energy-Charts weist „Solar DC“ (Modulleistung) und „Solar AC“ (Wechselrichterleistung) getrennt aus; die genaue Definition wurde nicht dokumentarisch belegt, die Zuordnung DC = Modulleistung und AC = Wechselrichterleistung entspricht der Bezeichnung und Angaben des Fraunhofer ISE in einer Presseinformation (per Suche, nicht im Original geprüft).

## 3. Unabhängigkeitsvorbehalt (SAP 3.2)

- **Dokumentarisch belegt:** keine Aussage von Energy-Charts selbst, die den Ursprung der Monatsreihe benennt (Methodik-Seite nicht abgerufen). Die Websuche fand nur, dass das Fraunhofer ISE die EEG-Anlagenstammdaten aus dem MaStR für PV-Auswertungen nutzt.
- **Empirischer Befund:** Energy-Charts „Wind onshore“ weicht von der MaStR-Rekonstruktion in allen verglichenen Monaten um nur 0,12 % ab, „Solar DC“ um 0,01 bis 0,04 % von der MaStR-**Brutto**-Rekonstruktion. Eine so enge Übereinstimmung auf Monatsebene spricht stark dafür, dass die Reihen auf demselben Register (MaStR) beruhen. Das ist ein Indiz, kein Beleg.
- **Folgerung nach SAP 3.2:** Der Abgleich ist als **Kontrolle der Aufbereitung** (Import, Einheiten, Bestandsdefinition) zu lesen, **nicht als unabhängiger Beleg** für die Höhe des Bestands. Die Bundesnetzagentur-Statistik wurde weder abgerufen noch auf ihren Ursprung geprüft; eine Aussage zu ihrer Unabhängigkeit vom MaStR ist hier nicht möglich.

## 4. Vergleich Bestand (GW), Toleranz 3 %

Spalten der MaStR-Datei `output/monatsreihen_bestand_zubau_stilllegung_ab2015.csv`: `C_GW_brutto` (primär) und `C_GW_netto` (S6). Relative Abweichung = (Energy-Charts − MaStR) / MaStR.

| Monat | Größe | MaStR brutto | MaStR netto | Energy-Charts | Abw. vs. brutto | Abw. vs. netto |
|---|---|---|---|---|---|---|
| 2024-12 | Wind an Land (onshore) | 63,514 | 63,514 | 63,589 | +0,12 % | +0,12 % |
| 2024-12 | Solar DC | 100,808 | 90,050 | 100,800 | −0,01 % | **+11,94 %** |
| 2024-12 | Solar AC | 100,808 | 90,050 | 92,493 | **−8,25 %** | +2,71 % |
| 2026-07 (T) | Wind an Land | 70,369 | 70,369 | 70,452 | +0,12 % | +0,12 % |
| 2026-07 (T) | Solar DC | 128,090 | 113,534 | 128,075 | −0,01 % | **+12,81 %** |
| 2026-07 (T) | Solar AC | 128,090 | 113,534 | 116,649 | **−8,93 %** | +2,74 % |
| 2026-09 (letzter vollständiger Monat) | Wind an Land | 71,271 | 71,271 | 71,355 | +0,12 % | +0,12 % |
| 2026-09 | Solar DC | 131,053 | 116,055 | 131,037 | −0,01 % | **+12,91 %** |
| 2026-09 | Solar AC | 131,053 | 116,055 | 119,248 | **−9,01 %** | +2,75 % |
| 2026-10 (laufender Monat, beide Quellen) | Wind an Land | 71,533 | 71,533 | 71,618 | +0,12 % | +0,12 % |
| 2026-10 | Solar DC | 132,139 | 116,938 | 132,082 | −0,04 % | **+12,95 %** |
| 2026-10 | Solar AC | 132,139 | 116,938 | 120,153 | **−9,07 %** | +2,75 % |

Fett = Abweichung über 3 %. Vollständig: `scratchpad\zweitquelle\vergleich.csv`.

**Auswertung der Abweichungen über 3 %**
- Alle Abweichungen über 3 % betreffen Solar und folgen der **Größendefinition**, nicht einem Datenfehler: Energy-Charts Solar DC entspricht (auf 0,01 bis 0,04 %) der MaStR-Bruttoleistung; Solar AC liegt 8 bis 9 % darunter und nähert sich mit +2,7 % der MaStR-Nettonennleistung (S6), ohne sie zu treffen. Die Zuordnung ist ein Muster in den Zahlen, keine dokumentierte Definition (SAP 3.3 weist selbst darauf hin, dass die MaStR-Felddokumentation Brutto und Netto nicht definiert).
- **Wind an Land:** Abweichung 0,12 %, innerhalb der Toleranz. Beobachtung: In der MaStR-Rekonstruktion sind Wind-Brutto und -Netto identisch (63,514 und 70,369 GW in beiden Spalten); das wurde hier nicht weiter untersucht, es betrifft aber S6 für Wind.
- Der Vergleich mit Zeitpunkt, Nachmeldungen und Definition „installierte Leistung“ erklärt die 0,12 % bei Wind nicht abschließend (denkbar: Zeitpunkt, Nachmeldungen oder Aufbereitung in Energy-Charts); ungeklärt, geringfügig.
- Hinweis: Die Presseinformation des Fraunhofer ISE (Jahreszahlen 2025, per Suche) nannte für Ende 2025 116,8 GW Solar (DC), die abgerufene Reihe zeigt für 12.2025 118,111 GW DC (und 107,835 GW AC). Energy-Charts schreibt rückwirkend fort; nicht weiter verfolgt.

## 5. Kontrollrechnung S3: Erreichungszeitpunkte (Punktschätzung)

Methode wie SAP 2.3/E2: OLS-Gerade über den Monatsendbestand der letzten W ∈ {12, 24, 60} Monate bis T = Juli 2026 (n = W + 1), Schnittpunkt mit dem Ziel 2030 (Wind 115 GW, Solar 215 GW), erster Monatsendpunkt x ≥ 0 mit angepasstem Wert ≥ Ziel. Zusätzlich frühestens/spätestens aus dem invertierten 95-%-Prognoseintervall (klassische OLS, wie SAP) und der Wert der Geraden am 31.12.2030 (x = 53). S3 gilt nach SAP nur für E1, E2, E3; kein E4.

| Reihe | W | C(T) GW | Steigung GW/Jahr | Punkt | frühestens | spätestens | Wert 31.12.2030 [95 %-PI] | R GW/Jahr (E3) |
|---|---|---|---|---|---|---|---|---|
| MaStR Wind (brutto = netto) | 12 | 70,37 | 4,70 | 01/2036 | 06/2035 | 09/2036 | 91,2 [89,7; 92,7] | 10,1 |
| | 24 | | 4,32 | 12/2036 | 07/2036 | 04/2037 | 89,3 [88,5; 90,2] | |
| | 60 | | 3,00 | 12/2041 | 02/2041 | 10/2042 | 82,1 [80,6; 83,7] | |
| Energy-Charts Wind onshore | 12 | 70,45 | 4,70 | 01/2036 | 06/2035 | 09/2036 | 91,3 [89,8; 92,8] | 10,1 |
| | 24 | | 4,33 | 11/2036 | 07/2036 | 04/2037 | 89,5 [88,6; 90,3] | |
| | 60 | | 2,99 | 12/2041 | 02/2041 | 11/2042 | 82,1 [80,5; 83,8] | |
| MaStR Solar brutto | 12 | 128,09 | 17,21 | 08/2031 | 06/2031 | 10/2031 | 203,8 [201,1; 206,5] | 19,7 |
| | 24 | | 17,22 | 08/2031 | 07/2031 | 09/2031 | 203,8 [202,4; 205,2] | |
| | 60 | | 14,79 | 09/2032 | 03/2032 | 03/2033 | 189,7 [182,8; 196,6] | |
| Energy-Charts Solar DC | 12 | 128,07 | 17,21 | 08/2031 | 06/2031 | 11/2031 | 203,8 [201,1; 206,5] | 19,7 |
| | 24 | | 17,21 | 08/2031 | 07/2031 | 09/2031 | 203,8 [202,4; 205,2] | |
| | 60 | | 14,78 | 09/2032 | 03/2032 | 03/2033 | 189,7 [182,8; 196,6] | |
| MaStR Solar netto (S6) | 12 | 113,53 | 14,85 | 06/2033 | 03/2033 | 09/2033 | 178,9 [176,6; 181,2] | 23,0 |
| | 24 | | 14,84 | 06/2033 | 04/2033 | 07/2033 | 178,9 [177,6; 180,1] | |
| | 60 | | 12,83 | 09/2034 | 03/2034 | 04/2035 | 167,1 [161,3; 173,0] | |
| Energy-Charts Solar AC | 12 | 116,65 | 15,26 | 01/2033 | 10/2032 | 04/2033 | 183,8 [181,4; 186,2] | 22,3 |
| | 24 | | 15,26 | 01/2033 | 12/2032 | 02/2033 | 183,8 [182,5; 185,1] | |
| | 60 | | 13,21 | 04/2034 | 10/2033 | 10/2034 | 171,8 [165,8; 177,9] | |

Lesart: Alle drei Fenster werden nebeneinander berichtet, keines ist hervorgehoben (SAP 2.3). Die MaStR-Werte für Wind stimmen mit `tabelle3_E2_E3_E4_je_technologie_und_fenster.csv` überein (Punkt 01/2036, 12/2036, 12/2041; 24-Monats-Steigung dort 4,3 GW/Jahr); für Solar wurden die MaStR-Werte hier mit dem Nachtrags-Skript neu gerechnet und nicht mit der Primärtabelle abgeglichen. Das Prognoseintervall berücksichtigt keine Autokorrelation (SAP 5.3 / S5), es ist hier nur zur Vergleichbarkeit mit dem Primärverfahren angegeben.

**Befund S3:** Bei Wind an Land und bei Solar DC (gegen MaStR brutto) liegen die Punktschätzungen der Erreichung in 5 von 6 Fällen im selben Monat und sonst innerhalb eines Monats (Wind 24 Monate: 11/2036 gegenüber 12/2036). Das Ziel 2030 wird in allen Reihen und Fenstern bei konstantem Zubau verfehlt (Wind frühestens 2035, Solar frühestens 2031); die Aussage ändert sich durch die Zweitquelle nicht. Bei Solar hängt der Erreichungszeitpunkt von der Größendefinition ab: MaStR-brutto/Energy-Charts DC 2031/2032 gegenüber MaStR-netto/Energy-Charts AC 2033/2034. Das ist ein Definitionsunterschied, kein Widerspruch der Quellen.

## 6. Grenzen und was nicht ging

- Nur eine Zweitquelle (Energy-Charts) abgerufen; BNetzA-EE-Statistik und OWID nicht.
- Lizenz für `installed_power` nicht bestätigt (Text nicht abrufbar).
- Ursprung der Energy-Charts-Reihe (MaStR oder anderes) nicht dokumentarisch belegt; Unabhängigkeit daher nicht gegeben bzw. nicht belegbar, empirisch spricht die Übereinstimmung für denselben Ursprung.
- Definition von Solar DC und AC bei Energy-Charts nicht aus Originaldokumentation belegt.
- Keine Änderung der Primärergebnisse; keine Bewertung, welche Solar-Größe „richtig“ ist (Setzung nach SAP 3.3 bleibt bei Daniel Saure).
