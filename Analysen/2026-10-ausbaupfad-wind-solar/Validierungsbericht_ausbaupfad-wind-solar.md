# Validierungsbericht - Ausbaupfad Wind an Land und Solar

**Geprueft gegen:** SAP_ausbaupfad-wind-solar.md v1.0 final (Abschnitt 14)
**Rolle:** unabhaengiger Validator. Keine Analyse-Datei wurde veraendert.
**Datum:** 30.10.2026 (Erstpruefung). Vollstaendig.

## Gesamturteil

Freigabe mit Auflagen, kein "kritisch". Alle berichteten Zahlen wurden unabhaengig reproduziert. 0 kritisch, 2 hoch, 5 mittel, 5 gering.

## Ampel je Pruefpunkt (SAP 14)

| Pruefpunkt | Ampel |
|---|---|
| SAP-Version/Status in Header und Log zitiert | bestanden |
| Rohdateien unveraendert (SHA-256), T und T_S1 | bestanden |
| Zielwerte wie SAP 2.2, Limitation Fassungsstand im Bericht | bestanden |
| Typen, Lagefilter, Statuslogik, Rechenprobe, Dateien vollstaendig | bestanden |
| 3.5 Nr. 1-9, Listen, Zuordnungstabelle, Groessenordnungs-Sperre | bestanden (M-3) |
| Nr. 12 geloeschte/deaktivierte Einheiten | bestanden, Hinweis M-2 |
| Leistungsgroesse Brutto/Netto, Limitation | bestanden |
| Regression n, x, PI, Inversion, Horizont, Sonderfaelle | bestanden |
| Alle Fenster, beide Technologien, Kernzahlen | bestanden |
| E3, E4 | bestanden |
| Diagnostik, NW-Lag, Bootstrap | Durchfuehrung bestanden; Interpretation Abweichung (H-1) |
| Sensitivitaeten S1-S9 | bestanden (S3, S9 zulaessig begruendet) |
| E5 | bestanden |
| Zweitquelle | Abweichung (zulaessig, aber H-2) |
| Unabhaengige Stichprobennachrechnung | bestanden (durch mich) |
| Post-hoc-Kennzeichnung, Sprache | bestanden (M-1, M-4) |
| Vorwissen offengelegt | bestanden |
| Rundung/Darstellung | Abweichung gering (G-2) |

## Nachrechnung

1. SHA-256: sha256sum -c gegen PRUEFSUMMEN_xml_2026-10-29.txt, alle 80 Zeilen (79 Dateien) OK.
2. Direkt aus den XML (eigene Auslese mit iconv und gawk, alle 67 Solar-Dateien und EinheitenWind, anderer Weg als das R-Skript): Datensatzzahlen (gesamt 6 657 421), Einheiten ohne Inbetriebnahmedatum (Wind an Land 8 750 mit 54,004 GW; See 91; Solar 66 137), Monatsbestaende brutto und netto fuer 2024-12, 2025-07, 2026-06, 2026-07, 2026-09, Monats-Z und -S fuer 2025-08 und 2026-07, Fenstersummen Z/S fuer 12/24/60: stimmen auf 6-7 Stellen mit den Monatsreihen ueberein (Wind C Dez 2024 63,51361 GW; Solar 100,80767, netto 90,05040; Solar C(T) 128,08959). Keine doppelten MaStR-Nummern (6 657 421 gleich 6 657 421 eindeutig). Wind Brutto gleich Netto bestaetigt.
3. Modell aus den Monatsreihen (eigener R-Code, manuelle OLS, PI, Newey-West, DW): E1, E1b, E2, E3, E4, E5, S1, S2, S4, S6, interpolierte Hilfsgroesse (80,875 und 119,67), DW, Shapiro-Wilk, NW-Standardfehler: alle identisch mit Tabellen und Log. Block-Bootstrap mit eigener Implementierung und anderem Seed: Intervalle innerhalb Monte-Carlo-Rauschen (Wind F60 Zeitpunkt 11/2040-03/2043 gegen 10/2040-04/2043).
4. Rechenprobe C(m)-C(m-1)=Z-S: Abweichung kleiner 1e-12 GW.

## Befunde

### Kritisch
Keine.

### Hoch

**H-1 Aussagegrenze Autokorrelation nicht klar benannt (Analysebericht Abschn. 3, 6 S5, 7).** DW 0,47 (Wind F24), 0,04 (Wind F60), 0,02 (Solar F60); Residuen stark U-foermig (Diagnostik-Grafik). Klassisches PI und das invertierte Intervall frueh/spaet sind dort nicht belastbar. Die Korrektur wurde angewendet (NW, Bootstrap, SAP-konform), aber: (a) NW-Lag 3 und Blocklaenge 4 bei ACF(1) ca. 0,91 bilden die Abhaengigkeit nicht ab; das Bootstrap-Zeitpunktsintervall ist praktisch so schmal wie das klassische (Wind F60 10/2040-04/2043 gegen 02/2041-10/2042). (b) Der Bericht nennt S5 "autokorrelationsrobust" und sagt nur, das klassische PI sei tendenziell zu eng; er sagt nicht, dass S5 das Problem bei F24/F60 nicht behebt. Behebung: Satz ergaenzen, dass die Intervalle bei F24/F60 wegen DW weit unter 1 und Kruemmung zu eng sind, auch unter S5; Zeitpunkte nur als Spanne ueber die Fenster zitieren.

**H-2 Keine Zweitquelle, Niveau Brutto/Netto ungeprueft (Bericht Abschn. 6, 8 Nr. 4, 9; Protokoll A-16).** Entfall ist nach SAP 3.2 zulaessig. Aber E1 Solar haengt stark an der Leistungsgroesse (Dez 2024: 100,8 GW brutto, 90,1 netto; Delta +12,8 gegen +2,1 GW). Ohne Zweitquelle bleibt offen, welche Groesse naeher am Gesetzesbegriff liegt. Behebung: bei der Kernzahl E1 Solar beide Werte nebeneinander nennen; Zweitquellenabgleich (3-%-Toleranz) vor Veroeffentlichung nachholen oder die Luecke in jedem Kanaltext nennen.

### Mittel

**M-1 Post-hoc-Festlegungen A-01 bis A-17, H-01 bis H-09.** Alle 26 gegen den Code geprueft. Ohne Wirkung auf Zahlen: A-01 bis A-06, A-10, A-12 bis A-15, A-17, H-01, H-03 bis H-09 (A-05 unter 0,00002 GW). Methodenrelevant nur fuer Sensitivitaeten und Hilfsgroessen: A-07 (S2 bezieht R und Erreichung auf B(T) statt C(T), Alternative nicht gerechnet, daher Wind-S2 nicht direkt mit Primaer vergleichbar), A-08 (Bootstrap-Details, Seed je Kombination neu gesetzt, Quantiltyp 1/7), A-11 (Interpolationsstuetzpunkte), A-16 (Verzicht Zweitquelle, siehe H-2). Keine Festlegung veraendert E1-E4 der Primaeranalyse. Auflage: Daniel Saure bestaetigt A-01, A-07, A-08, A-11, A-14, A-16, H-02 ausdruecklich; SAP 13 verlangt "Entscheidung durch (Name)", das Protokoll hat diese Spalte nicht, alle Entscheidungen sind offen.

**M-2 Geloeschte/deaktivierte Einheiten, Limitation zu eng (Bericht Abschn. 1, 8 Nr. 3).** Der Bericht nennt nur den nicht erfassten Stilllegungsanteil. Wind 1 121 und Solar 142 845 G-Einheiten haben Status "In Betrieb" ohne Leistung und Datum (davon nur "deaktiviert": Wind 128, Solar 62 447). Wirkung auf das Bestandsniveau (Richtung unbekannt) fehlt im Bericht. Die SAP-Regel (keine Schaetzung, Ueberlappung 0, Schwelle 0,5 % geprueft) wurde eingehalten. Behebung: Limitation ergaenzen.

**M-3 Fuenf XML-Dateien ohne Pruefsumme (H-02):** Bilanzierungsgebiete, Lokationstypen, Marktfunktionen, Marktrollen, Netze; nicht verwendet, ohne Wirkung. Offen gelegt; nur Bestaetigung noetig.

**M-4 SAP 7 Nr. 4 bei E1b:** Bei Solar fallen die Fenster in verschiedene Kategorien (F12/F24 Ziel unterhalb, F60 im Intervall). SAP 7.4 verlangt dann ausdruecklich "Das Ergebnis haengt vom Fenster ab"; Bericht Abschn. 4 sagt das nicht. Behebung: Satz ergaenzen.

**M-5 Testlauf-Aussage nicht beweisbar (Protokoll Abschn. 4).** Die Aussage, nach Sichtung der Zwischenergebnisse seien nur Darstellung, Logtexte, Beschriftungen und unname-Aufrufe geaendert worden, ist per Code-Review plausibel, aber nicht verifizierbar. Der Schaetzteil des Endskripts (Zeilen 706-1060) ist zeilengleich mit der Arbeitsdatei partB.R (Scratchpad, 21:16); die Testlauf-Version (dev.R 21:15 mit stateA.RData) und das Testlauf-Log sind nicht erhalten, der Endlauf (21:16:39 bis 21:37:38) hat Log und Outputs ueberschrieben, es gibt keinen Commit vor dem Testlauf. Inhaltlich zeigt der Code keine ergebnisabhaengige Wahl: Fenster, Schwellen, NW-Lag, Blocklaenge, B, Seed, Horizont, Kategorien entsprechen dem SAP, die Stopp-Regeln werden vor dem Schaetzteil geprueft. Auflage: Skript kuenftig vor jedem Testlauf committen; die Offenlegung des Analysten zur Kenntnis nehmen.

### Gering

- **G-1** Bericht Abschn. 6: "rund ein bis zwei Jahre" Verschiebung durch Netto bei Solar; tatsaechlich 22 bis 24 Monate (08/2031 nach 06/2033; 09/2032 nach 09/2034), also rund zwei Jahre.
- **G-2** Rundung: CSV tabelle3 rundet s_W/R auf eine Nachkommastelle (0,9 fuer 0,87), Bericht zwei Stellen; Solar F12 Brutto 18,0, Stilllegung 0,2, Netto 17,9 (Rundungsartefakt). SAP regelt Verhaeltnisse nicht; A-14 offen gelegt.
- **G-3** Bericht Abschn. 6 nennt zu S1 nur Punktzeitpunkte; E1b/E3/E4 unter S1 stehen nur in tabelle4_sensitivitaeten_S1_S2_S6_S7.csv. Auf die Datei verweisen.
- **G-4** Cook-Markierungen bei F60 (Wind 8, Solar 4) gehen auf die systematische Kruemmung zurueck, nicht auf Ausreisser; Deutung fehlt.
- **G-5** Grafiken: Beschriftung "Paragraf 4 EEG" statt Paragraphenzeichen. Kosmetisch.

## Befunde je Pruefpunkt im Detail

1. SAP-Konformitaet: n = 13/25/61, T = Juli 2026, T_S1 = September 2026, x(2026) = 5, x(2030) = 53, Horizont 2060, Zielwerte (69/84/99/115/157/160, 88/128/172/215/309/400, See 30/40/70) im Skript identisch. Population, Hart-/Weichschwellen, Stilllegungslogik (nur Status endgueltig und Datum nicht vor Inbetriebnahme), Dubletten, Nr. 12 a-d umgesetzt. Abweichungen nur A-01 bis A-17, keine verdeckte gefunden.
2. Diagnostik: DW (zweiseitig), ACF, Shapiro-Wilk, Cook, Residuenplots, QQ, Saisonalitaet und Monatsinkremente vorhanden fuer alle Kombinationen. NW und Bootstrap tatsaechlich angewendet und reproduziert. Interpretation siehe H-1.
3. Cherry-Picking: alle Fenster, beide Technologien, S1/S2/S4/S5/S6/S7, E5 berichtet; ungeuenstige Befunde (DW, Fensterabhaengigkeit Wind 2036 bis 2041) im Bericht; kein Fenster hervorgehoben.
4. Rechenpruefung: keine Abweichung.
5. Limitationen: Fassungsstand, Brutto/Netto, Zweitquelle, Rechtszensierung, Repowering, keine Prognose, Vorwissen sichtbar; Luecken H-1, M-2.
6. Rundung: weitgehend SAP 11, siehe G-2.

## Nicht geprueft / nicht verifizierbar

- Nicht geprueft: Inhalt der Dateien GeloeschteUndDeaktivierteEinheiten_* auf Nummernebene (Ueberlappung 0 und Typzuordnung nicht eigenstaendig nachvollzogen, nur Pruefsumme der Dateien); H-09 (10 161 G-Datensaetze ohne SEE-Praefix keine Wind/Solar-Einheiten).
- Nicht geprueft: Aufloesung der Katalogcodes (31/35/37/38, 888/889) selbst; aus dem Skript uebernommen und mit den Stilllegungssummen konsistent gefunden.
- Nicht geprueft: Zielwerte gegen den amtlichen Gesetzestext (kein Netzzugriff); MaStR-Zahlen gegen externe Statistiken; Vorwissen-Quelle (pv magazine).
- Nicht geprueft: einzelne Listen in output/listen (nur Zeilenzahlen im Log); die eine Solar-Einheit mit Nettonennleistung kleiner/gleich 0; Parallel-Einheiten-Gruppen A-01 (9 040 und 27 843 Einheiten); Cook-Distanzen und Hebelwerte einzeln; Ertuechtigungen.xml (unverwendet); optionale Repowering-Abschaetzung (nicht durchgefuehrt).
- Nicht verifizierbar: Aenderungen zwischen Testlauf und Endlauf (M-5).
- Freigabevermerk des SAP nur auf Vorhandensein und Zitierung im Skript und Log geprueft, nicht auf den Chat-Wortlaut.
- Grafiken: 1, 2, 3 und Diagnostik Wind angesehen (konsistent mit den Tabellen); Diagnostik Solar/See und Saisonalitaetsgrafik nicht angesehen.

## Auflagen vor Uebernahme in einen Report-Entwurf

1. H-1: Aussagegrenze Autokorrelation und Intervalle im Bericht (Pflicht).
2. H-2: E1 Solar mit Brutto und Netto nebeneinander; Zweitquellenabgleich nachholen oder Luecke benennen.
3. M-1: Bestaetigung der Post-hoc-Punkte durch Daniel Saure.
4. M-2, M-4, G-1: Textkorrekturen im Bericht.
5. Nach Behebung kurze Nachpruefung als Nachtrag zu dieser Datei (CLAUDE.md, Dokumentationspflicht).

## Nachprüfung 1 (30.10.2026)

Gegenstand: Einarbeitung der Auflagen aus diesem Bericht durch den analyst in `Analysebericht_ausbaupfad-wind-solar.md` und `Abweichungsprotokoll_ausbaupfad-wind-solar.md` (Diff gegen Commit 671ce61). Geprüft durch den validator-Subagenten, unabhängig, direkt an den Dateien und `output/`-Tabellen.

### Gesamturteil

**Freigabe zur Übernahme in einen Report-Entwurf unter Vorbehalt (0 kritisch, 0 hoch, 1 mittel offen, 2 gering).** Die beiden hohen Befunde (H-1, H-2) sind im Text sachlich korrekt und gut sichtbar umgesetzt. Offen bleiben die menschliche Bestätigung der Post-hoc-Punkte (M-1, M-3; nicht vom analyst erledigbar), die nachzuholende Zweitquelle (H-2, als Veröffentlichungsbedingung im Bericht benannt) und G-5 (bewusst nicht umgesetzt).

### 1. Auflagen einzeln

| Auflage | Status | Fundstelle / Bemerkung |
|---|---|---|
| H-1 Aussagegrenze Autokorrelation | umgesetzt | Bericht: Zusammenfassung (Punkt Autokorrelation), Abschn. 3 ("Aussagegrenze Autokorrelation"), Abschn. 6 (S5, "Einschränkung ... auch unter S5 zu eng"), Abschn. 7. Klartext: klassisches PI und invertiertes Intervall bei F24/F60 zu eng, S5 behebt das nicht, Zeitpunkte nur als Spanne über die Fenster. Zahlen DW/Bootstrap-Vergleich stimmen mit `diagnostik_je_technologie_und_fenster.csv` und `tabelle4_S5_autokorrelationsrobust.csv`. |
| H-2 Zweitquelle / Brutto-Netto | umgesetzt (Zweitquellenabgleich selbst weiterhin offen) | Bericht: Zusammenfassung (E1), Abschn. 2 (Tabelle mit Brutto- und Netto-Zeile je Technologie, Fettdruck), Abschn. 8 Nr. 4, neue Nr. 10a (Abgleich vor Veröffentlichung nachholen oder Lücke in jedem Kanaltext nennen). Der Abgleich ist nicht nachgeholt; das war nach SAP 3.2 auch nicht gefordert. |
| M-1 Spalte "Entscheidung Daniel Saure" | umgesetzt (Spalte), Entscheidungen offen | Protokoll: Spalte in Tabellen A-01..A-17 und H-01..H-09, Abschn. 6 Nachtrag, methodenrelevante Punkte A-07, A-08, A-11, A-16 markiert. Die inhaltliche Bestätigung durch Daniel Saure steht aus (siehe 4). |
| M-2 Limitation gelöschte/deaktivierte Einheiten | umgesetzt | Bericht Abschn. 8 Nr. 3: 1 121 Wind, 142 845 Solar "In Betrieb" ohne Leistung/Datum, davon "Deaktiviert" 128 / 62 447; Richtung der Wirkung "unbekannt". Alle vier Zahlen stimmen mit `tabelle1_G_ohne_datensatz_je_typ_betriebsstatus.csv` und `tabelle1_geloeschte_deaktivierte_je_typ_grund_status.csv` überein. |
| M-3 Fünf XML-Dateien ohne Prüfsumme | umgesetzt | Bericht Abschn. 8 Nr. 10 nennt die fünf Dateien namentlich, "Bestätigung Daniel Saure: offen"; Protokoll H-02 "offen". |
| M-4 SAP 7 Nr. 4 bei E1b | umgesetzt | Bericht Abschn. 4: Satz "Das Ergebnis hängt vom Fenster ab" mit "k von 3" (Wind 3 von 3 oberhalb; Solar 2 unterhalb, 1 im Intervall); stimmt mit `tabelle2_E1b_fortschreibung_2026.csv`. |
| M-5 Testlauf nicht verifizierbar | umgesetzt (Offenlegung) | Bericht Abschn. 8 Nr. 10b, Protokoll Abschn. 6. Die Unverifizierbarkeit bleibt naturgemäß bestehen; Auflage "künftig vor Testlauf committen" ist vermerkt. |
| G-1 "22 bis 24 Monate" | umgesetzt | Bericht Abschn. 6 (S6): "22 bis 24 Monate, also rund zwei Jahre" (F12/F24 08/2031 -> 06/2033 = 22; F60 09/2032 -> 09/2034 = 24). Gegen `tabelle4_sensitivitaeten_S1_S2_S6_S7.csv` geprüft. |
| G-2 Rundung | umgesetzt | Bericht Abschn. 4: Rundungshinweis (Solar F12 18,0 / 0,2 / 17,9), Verweis auf `output/zwischen/voll_tabelle3_primaer.csv`. |
| G-3 S1-Kennzahlen | umgesetzt | Bericht Abschn. 6: Verweis auf `tabelle4_sensitivitaeten_S1_S2_S6_S7.csv`. |
| G-4 Cook-Deutung | umgesetzt | Bericht Abschn. 7; 8 bzw. 4 Markierungen bei F60 und Lage an den Fensterrändern stimmen mit `diagnostik_cook_markierungen.csv` (Wind 2021-07..09, 2026-03..07; Solar 2021-07..10). |
| G-5 Grafiktitel "Paragraf" | nicht umgesetzt (begründet) | Protokoll Abschn. 6: Neulauf nötig, nicht vorgesehen. Offen gelegt; kosmetisch, akzeptabel. Vor Veröffentlichung der Grafiken beim nächsten Lauf beheben. |

### 2. Skript, output/, run_log.txt unverändert

Bestanden. `git diff --stat 671ce61 -- ausbaupfad-wind-solar.R output run_log.txt` leer; `git status` im Analyseordner zeigt nur die beiden .md-Dateien als geändert. Zeitstempel: Skript 29.10. 21:16, run_log 29.10. 21:37, beide vor den Textänderungen (30.10. 12:44/12:45). Untracked sind nur `rohdaten/download_result.txt` und `download_start.txt` (Zeitstempel 29.10. 10:19, vor der Analyse, nicht Teil der Nachbesserung).

### 3. Deckung neuer Zahlen und Aussagen durch output/

Stichprobe, alle gedeckt: E1 Brutto/Netto (63,5 / 63,5; 100,8 / 90,1; Δ −5,5 / +12,8 / +2,1; `tabelle2_E1`, `tabelle4_S6_S7_E1`); E2-Spannen (Wind 01/2036, 12/2036, 12/2041 = "2036 bis 2041"; Solar 08/2031, 08/2031, 09/2032 = "2031 bis 2032"); DW 0,47 / 0,04 / 0,02 / 1,09 / 1,12; Wind-F60-Intervallvergleich (Bootstrap 10/2040-04/2043, klassisch invertiert 02/2041-10/2042); NW-SE 0,011 vs. 0,005 und 0,046 vs. 0,021; 1 121 / 142 845 / 128 / 62 447; 22 bis 24 Monate; C(T) 113,5 / 128,1.

Beanstandung (gering, **G-6**): Bericht Abschn. 6 (S5-Einschränkung) nennt "Residuen-ACF Lag 1 bis etwa 0,9" für "F24 und F60". Nach `diagnostik_je_technologie_und_fenster.csv` gilt ~0,91 nur für F60 (Wind 0,91, Solar 0,92); bei F24 liegt Lag-1-ACF bei 0,65 (Wind) bzw. 0,44 (Solar). Der Schluss (Lag 2-3 / Blocklänge 3-4 zu kurz) hält bei F60, bei F24 ist er schwächer begründet (Wind F24 DW 0,47 bleibt klar auffällig, Solar F24 DW 1,09 moderat). Behebung: Formulierung auf "F60: ACF etwa 0,9; F24: Wind 0,65, Solar 0,44" präzisieren. Dieselbe Zusammenfassung ("bei F24 und F60 ... zu eng") ist für Solar F24 etwas pauschal; vorsichtiger fassen oder Solar F24 gesondert benennen.

Weiterer Hinweis (gering, **G-7**): Die Zusammenfassung sagt "Wind F12 1,12" und "Solar F24 1,09" seien "ebenso" stark autokorreliert. Beide DW-Werte sind zweiseitig signifikant, aber nicht vergleichbar mit 0,02 bis 0,47; "ebenso" ist übertrieben. Behebung: "ebenfalls auffällig, aber schwächer".

Keine Aussage ohne Tabellenbeleg gefunden. Die Textteile "Richtung unbekannt" und "Duplikate" in Nr. 3 sind als Hypothese gekennzeichnet, nicht als Befund.

### 4. Spalte "Entscheidung Daniel Saure"

Bestanden. Alle 26 Einträge (A-01..A-17, H-01..H-09) lauten "offen" (H-02: "offen (Bestätigung Daniel offen)"). Nirgends ist etwas als bestätigt, freigegeben oder entschieden eingetragen. Im Bericht (Nr. 10) ebenfalls "Bestätigung Daniel Saure: offen".

### Schweregrade der Nachprüfung

- Kritisch: 0
- Hoch: 0 (H-1, H-2 geschlossen)
- Mittel: 1 offen (M-1 inhaltliche Bestätigung A-01, A-07, A-08, A-11, A-14, A-16, H-02 durch Daniel Saure; M-3 Bestätigung ebenfalls dort enthalten). Nicht vom analyst lösbar.
- Gering: G-5 offen (begründet), G-6 und G-7 neu (Formulierungsschärfe Autokorrelation)

### Verbleibende Auflagen vor Übernahme in Report-Entwurf

1. Daniel Saure bestätigt oder verwirft die Post-hoc-Punkte (Spalte "Entscheidung") nach Lesen des Protokolls.
2. H-2: Zweitquellenabgleich nachholen oder Lücke in jedem Kanaltext nennen (Bericht Nr. 10a).
3. G-6 und G-7 textlich glätten (optional vor Report; nicht blockierend).
4. G-5 beim nächsten Neulauf beheben, spätestens vor Veröffentlichung der Grafiken.
