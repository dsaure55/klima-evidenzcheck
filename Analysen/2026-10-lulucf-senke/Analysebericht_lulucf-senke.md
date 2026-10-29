# Analysebericht LULUCF-Senke (Analyst, Lauf vom 29.10.2026)

**Freigabe der Ergebnisse:** Freigegeben durch Daniel Saure am 29.10.2026 (siehe `Freigabe_Ergebnisse_Daniel_Saure_2026-10-29.md`; Aussagegrenzen und offene Punkte K2-Rest, K4-Rest, K13 gelten weiter).

Grundlage: SAP v1.0 (final) plus Amendment 1 (final). Skript `lulucf-senke.R`, Konsolenlauf `run_log.txt`, Tabellen und Grafiken in `output/`. Dieser Bericht ist eine reine Ergebnisdarstellung, noch ohne Validierung. Er enthaelt keine Bewertung fuer eine Story. Das Skript lief fehlerfrei durch (Exit-Code 0).

Alle Zahlen: Mt CO2-Aequivalent, positiv = Quelle, negativ = Senke. "Trendfortschreibung" ist keine Prognose: sie beschreibt nur, was herauskaeme, wenn die lineare Entwicklung des Fensters unveraendert weiterliefe. Alle Aussagen gelten fuer die Reihe der Quelle 1 (UBA Trendtabellen THG, Dateikopf: Dessau, 15.01.2026, 1990-2024), inventarisierte Werte.

## 0. Vorgehen, Daten, Aussagegrenzen

- Vorwissen (SAP 0, 8.5): SAP vor Auswertung der Zeitreihe verfasst, mit offengelegtem Vorwissen ueber Aggregatwerte und Methodik. Im Einzelnen: (a) Die UBA-PDF-Tabelle wurde vor der Auswertung heruntergeladen, aber nicht geoeffnet; beim ersten Oeffnen durch den Analysten (pdftotext, Stopp, Abweichungsprotokoll Eintrag 1) sah dieser Spaltenkoepfe, Kategoriezeilen und Fussnote; die beiden xlsx-Dateien hat der Analyst als Erster geoeffnet (Zeitstempel im Run-Log). (b) Der Inventarbericht 2026 wurde heruntergeladen und nur per Stichwortsuche zu GWP, Neuberechnung und Bundeswaldinventur gelesen, ohne Zeitreihenwerte. (c) Die Aggregatwerte der UBA-Seite (Gesamtsektor 1990 und 2024, Kategorienwerte 2024) wurden vom Orchestrator gesehen; die Jahre 1991-2023 nicht. Hinzu kommen Sekundaerquellen zum Bruchjahr (2017/2018, ungeprueft) und die Pressemitteilung zum Schaetzwert 2025. Das Vorwissen hat keine Behandlung von Kategorie, Fenster oder Bruchjahr gegenueber dem SAP veraendert.
- Primaerreihe: Zeile "4. Land Use, Land Use Change and Forestry" (Quelle 1, Blatt GHG_CO2eq), inkl. Holzprodukten (HWP als eigene Zeile). n = 35 (1990-2024), lueckenlos. Einheit kt, durch 1.000 geteilt; Vorzeichen deckt sich mit der SAP-Konvention.
- Amendment-Fall 1 (Quelle 1 lueckenlos): alle drei Fenster A, B, C sind durchfuehrbar.
- Summenpruefung (Kategorien inkl. HWP gegen Gesamt): maximale Differenz praktisch 0 (Toleranz 0,5 Mt erfuellt).
- Kontrollen: Quelle 2 (alle 35 gemeinsamen Jahre, Gesamt und alle sechs Kategorien): keine Differenz ueber der Schwelle 0,5 Mt (maximale Differenz in der Groessenordnung 1e-14, also identische Werte). PDF-Stichprobe 1990, 2000, 2010, 2020, 2024 (Gesamt und sechs Kategorien, 35 Zellen): doppelte Uebertragung (Sichtablesung der Seite als Bild gegen maschinelle Positionsauslese): 0 Differenzen; PDF gegen Quelle 1: 0 Abweichungen ueber 0,5 Mt (nur Rundungsunterschiede unter 0,0001 Mt). Auch alle weiteren PDF-Gesamtwerte 1990-2024 stimmen. Hinweis zur Fussnote der PDF ("Inventare 1990 bis 2022, Stand 03/2024"): nach dem Abgleich erscheint sie veraltet; die PDF-Werte entsprechen der Quelle 1. Das ist ein Hinweis, die Fassungsbezeichnung "Submission 2026" steht in den Dateikoepfen der Quelle 1 jedoch nicht woertlich (Hinweis, kein Wechsel der Referenz).
- GWP: Quelle 2 weist GWP CH4 = 28, N2O = 265 aus (konsistent mit AR5, wie im Inventarbericht); Quelle 1 nennt die Basis nicht.
- **Einordnung (SAP 8.2, 8.3, 8.4):** Ein im Trend sichtbarer Verlauf kann zum Teil ein Methodik- oder Modelleffekt sein (jaehrliche vollstaendige Neuberechnung, grundlegende Methodenaenderungen mit der Submission 2026, Modellfortschreibung 2023/2024, Bruchjahr-Kandidaten 2017/2018); dieser Anteil wird nicht herausgerechnet, sondern ueber S3, S4 (nicht durchgefuehrt) und S6 sichtbar gemacht. Die LULUCF-Bilanz ist nicht Teil der Gesamtemissionen ohne LULUCF; beide Groessen werden nicht vermischt, und das Senkenziel ist kein Beitrag zur Reduktion der uebrigen Emissionen. Biologische Senken sind nicht dauerhaft garantiert (Stoerungen, Umkehrbarkeit); das wird ohne Bewertung festgehalten.
- **Lizenz (SAP 3.1, 11, K13, noch offen):** Fuer die UBA-PDF-Tabelle, die beiden UBA-xlsx-Dateien und den Data Cube ist die Lizenz nicht bestaetigt. Nach einem Suchergebnis stehen UBA-eigene Texte und Grafiken unter CC BY-NC-ND 4.0, viele UBA-Datensaetze unter Datenlizenz Deutschland - Namensnennung 2.0 (DL-DE-BY-2.0). Zahlen und eigene Auswertungen mit Quellenangabe sind voraussichtlich unkritisch; vor dem Abdruck von UBA-Grafiken oder -Tabellen im Wortlaut ist die Lizenz zu klaeren.
- **Tabellenzuschnitt (Hinweis):** Die Tabellen des Reporting-Plans (SAP 11) liegen verteilt vor: DW und Diagnostik in `tab_diagnostik.csv`, ARIMA in `tab_S1_arima.csv`, S2 in `tab_S2_Q_HAC.csv` und `tab3_fenster_A_B_C.csv`, S6c/S6d in `tab_S6c_niveausprung.csv`/`tab_S6d_fenster_D.csv`; `tab5_...csv` enthaelt S3, S5, S6a und S7.
- **Aussagegrenzen (SAP 4.3):** (1) 2023 und 2024 sind laut Inventarbericht Modellfortschreibungen, keine Messungen. M(2024) und alle Fenster enthalten sie; die Gegenprobe ist S3b. (2) Die Reihe wird jaehrlich vollstaendig neu berechnet; die Aussagen gelten nur fuer diese Fassung (S4 nicht durchgefuehrt). (3) Es sind inventarbasierte Rechenwerte, keine Messreihe. (4) Das 95-%-Intervall enthaelt nur die Streuung im linearen Modell, nicht Modell-, Methoden- oder Strukturunsicherheit, keine kuenftigen Massnahmen oder Stoerungen. (5) Territoriale Inventarbilanz; keine Ursachenzuschreibung, kein Urteil ueber Massnahmen oder Regierungen. (6) Die Fenster ueberlappen und sind nicht unabhaengig; drei 95-%-Intervalle sind nicht simultan 95 %-sicher. (7) Ob die Zielwerte (-25/-35/-40) und das Mittel "Zieljahr plus drei Vorjahre" dem Volltext von § 3a KSG entsprechen, wurde vom Analysten nicht geprueft (SAP K2 offen).

## 1. E1: Abstand des juengsten Messwerts zum Ziel 2030 (deskriptiv)

| Groesse | Wert (Mt) |
|---|---|
| E(2021) | 44,9 |
| E(2022) | 57,6 |
| E(2023), Modellfortschreibung | 73,3 |
| E(2024), Modellfortschreibung | 57,8 |
| **M(2024)** = Mittel 2021-2024 | **58,4** |
| Z30 | -25,0 |
| **D30 = M(2024) - Z30** | **83,4** (ueber dem Zielwert; F1: nicht im Zielbereich) |

Kontext E4: D40 = 93,4 Mt, **D45 = 98,4 Mt** (Z40 = -35, Z45 = -40). Ohne Annahmen ueber CO2-Entnahme, keine Trendfortschreibung auf 2040/2045.

Hinweis zu 8.0 SAP: M(2023) = 55,9 und M(2022) = 47,8 (siehe S3); das Mittel 2021-2024 ist durch den Jahreswert 2023 (73,3) stark mitbestimmt, der Sprung gegenueber M(2023) wird nicht als Trendwende gedeutet.

## 2. E2: Trendfortschreibung des 4-Jahres-Mittels 2030 (alle drei Fenster gleichrangig; Primaerfenster B zuerst)

Wuerde der lineare Trend des jeweiligen Fensters unveraendert weiterlaufen, laege der gesetzliche Messwert 2030 (Mittel 2027-2030) bei:

| Fenster | n | Steigung beta (Mt/Jahr) [95-%-KI klassisch] | [95-%-KI Newey-West] | M-Dach(2030) | 95-%-Prognoseintervall | Kategorie (5.6) | M-Dach - Z30 |
|---|---|---|---|---|---|---|---|
| **B 2010-2024 (primaer)** | 15 | 4,94 [3,38; 6,49] | [3,63; 6,24] | **86,8** | [63,6; 109,9] | K-ueber | 111,8 |
| A 1990-2024 | 35 | 1,96 [1,38; 2,54] | [1,11; 2,80] | 53,7 | [31,5; 75,9] | K-ueber | 78,7 |
| C 2018-2024 (geringe Belastbarkeit, n < 10) | 7 | 2,62 [-2,30; 7,53] | [-0,57; 5,80] | 74,0 | [33,7; 114,3] | K-ueber | 99,0 |

**Gesamtaussage (5.6):** Die drei Fenster liefern dieselbe Kategorie K-ueber: das gesamte Intervall liegt in jedem Fenster ueber dem Zielwert Z30 = -25. F2: Z30 liegt in keinem Fenster im Intervall. Das gilt fuer die lineare Fortschreibung innerhalb des Modells; es ist keine Aussage ueber die tatsaechliche Zielerreichung.

Steigungstests (sekundaer, H0: beta = 0, zweiseitig, alpha = 0,05; unadjustiert / Holm ueber A, B, C): B < 0,001 / < 0,001; A < 0,001 / < 0,001; C 0,230 / 0,230. Mit Newey-West: B < 0,001 / < 0,001; A < 0,001 / < 0,001; C 0,088 / 0,088. (Genaue Werte in `output/tab3_fenster_A_B_C.csv`.) Alle Steigungen sind positiv, das heisst die Netto-Emission der Reihe steigt in allen Fenstern (in Fenster C ist das KI klassisch nicht von null verschieden).

## 3. E3: Noetige und beobachtete jaehrliche Veraenderung

- Noetige Rate: r_req = (Z30 - M(2024)) / 6 = **-13,90 Mt pro Jahr** (Verbesserung des 4-Jahres-Mittels).
- Beobachtet: r_obs(B) = +4,94; r_obs(A) = +1,96; r_obs(C) = +2,62 Mt/Jahr; r_obs5 = [M(2024) - M(2019)]/5 = +5,46; r_obs10 = [M(2024) - M(2014)]/10 = +5,19 Mt/Jahr.
- Alle beobachteten Raten sind groesser null (keine Verbesserung im Sinne der SAP-Konvention). Nach SAP 2.2 wird deshalb kein Quotient Q gebildet: "In diesem Fenster/Zeitraum ist keine Verbesserung zu beobachten, die Rate ist nicht vergleichbar." Dies gilt fuer A, B, C, r_obs5 und r_obs10. Q fuer die Grenzen der Konfidenzintervalle entfaellt, weil kein Intervall unter null liegt.

## 4. Diagnostik (SAP 5.2; ohne Konsequenz fuer die Primaeranalyse, kein Jahr ausgeschlossen)

| Fenster | Durbin-Watson (einseitig, positiv) | Breusch-Pagan p | Shapiro-Wilk p | Cook-Distanz > 4/n | Residuum 2023 / 2024 (Mt) |
|---|---|---|---|---|---|
| B (n = 15) | DW = 1,69, p = 0,174 | 0,612 | 0,595 | 2010 | +13,7 / -6,7 |
| A (n = 35) | DW = 1,14, p = 0,002 | 0,542 | 0,009 | 1990, 2023 | +30,3 / +12,9 |
| C (n = 7) | DW = 2,01, p = 0,289 (n = 7: kaum trennscharf, nicht zur Entscheidung herangezogen) | 0,717 | n < 8: nur Q-Q | 2018 | +13,7 / -4,4 |

Fuer Fenster A zeigt der Durbin-Watson-Test positive Autokorrelation (p = 0,002), die Residuen sind nicht normalverteilt (Shapiro p = 0,009); das klassische Intervall von A ist deshalb vermutlich zu eng. ACF-Werte, Hebelwerte und Q-Q-Plots: `run_log.txt`, `output/anhang_diagnostik.png`, `output/tab_diagnostik.csv`. Die Jahre 2023 und 2024 haben in B Hebelwerte 0,195 und 0,242 (unterhalb von 4/n = 0,267); in C sind es 0,286 und 0,464.

## 5. Sensitivitaeten (alle vorab festgelegten, vollstaendig; Tabelle `output/tab5_sensitivitaeten_S3_S5_S6a_S7.csv`)

**S1 ARIMA-Kontrolle (nur A, B; 10.000 Pfade, Seed 20261029, AICc):**
B: gewaehlte Ordnung (0,0,0), M-Dach = 86,8, simuliertes 95-%-Intervall [74,5; 98,4], K-ueber. A: Ordnung (1,0,0), M-Dach = 52,4, Intervall [28,3; 75,4], K-ueber. C: nicht durchgefuehrt, Grund n < 10. (Das Intervall in B ist enger als das klassische, weil die Simulation die Parameterunsicherheit nicht enthaelt; SAP 5.4.)

**S2 Newey-West/DW:** siehe Abschnitt 2 (HAC-Intervalle, Lag 2/3/2) und 4 (DW). Das HAC-Intervall von C schliesst null ein (-0,57; 5,80); in B und A nicht.

**S3a (Fensterende 2023):** M(2023) = 55,9, D30 = 80,9, r_req = -11,55 (Divisor 7).
A: beta 1,89, M-Dach 51,8 [28,9; 74,7], K-ueber. B: beta 5,16, 89,9 [63,6; 116,2], K-ueber. C (n = 6): beta 3,49, 81,7 [20,5; 142,9], K-ueber.

**S3b (Fensterende 2022, ohne beide Modelljahre):** M(2022) = 47,8, D30 = 72,8, r_req = -9,10 (Divisor 8).
A: beta 1,71, 46,8 [24,4; 69,2], K-ueber. B: beta 4,71, 83,3 [54,0; 112,7], K-ueber. C (n = 5): beta 0,27, 52,2 [-25,7; 130,1], **K-im**.
=> **Ergebnis nicht robust gegenueber dem Weglassen der Jahre 2023 und 2024 im Fenster C** (Kategorie K-im statt K-ueber; das Intervall ist mit n = 5 sehr breit, geringe Belastbarkeit). In A und B bleibt die Kategorie K-ueber.

**S4 (fruehere Submissions):** nicht durchgefuehrt. Grund: nicht ohne Download beschaffbar (keine weiteren Downloads); keine Teilmenge gerechnet; Revisionstabelle entfaellt. Der UBA Data Cube wurde nicht abgerufen (keine Zustimmung).

**S5 (ohne HWP; HWP liegt als eigene Zeile vor; Z30 unveraendert):** M(2024) ohne HWP = 61,9, D30 = 86,9, r_req = -14,48.
A: beta 1,99, 59,2 [35,2; 83,2], K-ueber. B: beta 5,05, 91,4 [66,3; 116,5], K-ueber. C: beta 1,64, 71,3 [36,2; 106,5], K-ueber.

**S6 Bruchjahr-Kandidaten 2017 und 2018 (beide gerechnet):**
- S6a Fenster 2017-2024 (n = 8, geringe Belastbarkeit): beta 5,13, M-Dach 90,3 [45,9; 134,8], K-ueber.
- S6b = Fenster C (keine eigene Rechnung).
- S6c Niveausprung-Modell, nur deskriptiv (gemeinsame Steigung; kein Prognosewert, keine Kategorie): Gamma-Dach mit 95-%-KI: Fenster B, B* = 2017: 17,4 [-8,7; 43,5]; B* = 2018: 34,8 [16,8; 52,8]. Fenster A, B* = 2017: 31,0 [13,5; 48,5]; B* = 2018: 36,9 [21,0; 52,8]. (Beschreibend; Ursachen werden nicht zugeschrieben. Ein Teil kann Methodik/Modell sein.)
- S6d Fenster D (2022-2024, deskriptiv): 57,6; 73,3; 57,8; Mittel 62,9.

**S7 (Schaetzwert 2025, nur Sensitivitaet):** Die Zahl 26,9 Mt fuer 2025 ist eine unsichere Schaetzung (Vorjahresschaetzung, Quelle 2; PDF identisch), kein Inventarwert. M(2025) = Mittel 2022-2025 = 53,9, D30 = 78,9, r_req = -15,78 (Divisor 5).
A (n = 36): beta 1,87, M-Dach 51,3 [29,5; 73,1], K-ueber. B (n = 16): beta 4,00, 73,7 [46,8; 100,7], K-ueber. C (n = 8): beta -0,55, 47,1 [1,4; 92,7], K-ueber; hier ist r_obs < 0 und r_req < 0, daher Q = 28,74 (nur in dieser Sensitivitaet, nur Fenster C mit n = 8 und dem Schaetzwert; die KI-Grenzen von beta schliessen null ein, Q fuer die Grenzen entfaellt).

**Robustheit der Kategorie (Primaer B: K-ueber):** Alle Sensitivitaeten (S1, S3a, S5, S6a, S7) ergeben ebenfalls K-ueber. Einzige Ausnahme: S3b Fenster C (K-im, n = 5).

## 6. Nicht durchgefuehrt / offen

- S4: nicht durchgefuehrt (Grund oben). Data-Cube-Abgleich: nicht durchgefuehrt (keine Zustimmung).
- Anhang-Grafik OWID/GCP: nicht erstellt (Daten nicht beschafft, keine Downloads).
- Klimadashboard/Thuenen-Uebertragungskontrolle (SAP 3.5 Nr. 6): nicht beschafft; ersetzt durch Quelle 2 und PDF (Amendment).

## 7. Dateien

Grafik 1: `output/grafik1_zeitreihe_fenster_ziel.png`; Grafik 2: `output/grafik2_4jahresmittel_intervall.png`; Anhang: `output/anhang_diagnostik.png`. Tabellen 1-5 und Kontrolltabellen als CSV in `output/`; Paketversionen: `output/sessionInfo.txt`.
