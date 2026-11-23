# Abweichungsprotokoll – Kältewinter wie 2010

**Bezug:** SAP_kaeltewinter-2010.md, Version 1.0, Status final, eingefroren durch
Daniel Saure am 23.11.2026 (Commit 2a2353e)
**Skript:** `kaeltewinter-2010.R` (Lauf 23.11.2026, 21:11 MEZ, R 4.6.1; Neuläufe nach Beschriftungsänderungen 21:29 MEZ (A14) und 21:40 MEZ (A15), Ergebnisdateien bitidentisch)
**Erstellt durch:** Claude (analyst-Subagent), 23.11.2026

Alle Punkte sind als **Post-hoc** (nach dem Einfrieren festgelegt) oder als
**Auslegung** (Präzisierung einer im SAP nicht eindeutig geregelten Stelle, vor
Sichtung der Ergebnisse festgelegt) gekennzeichnet. Keine Abweichung ändert
Primärgröße, Fenster, Referenz, Signifikanzniveau oder die Umschaltregel. Keine
Abweichung wurde nach der Höhe eines Ergebnisses gewählt.

| Nr. | Art | SAP-Stelle | Abweichung / Festlegung | Begründung | Auswirkung |
|---|---|---|---|---|---|
| A1 | Post-hoc (Ablage) | 3.1, 13 | DWD-Rohdateien liegen unter `rohdaten/` statt `rohdaten/dwd/`. | So von der Top-Level-Session abgelegt; nicht verschoben, damit Pfade und Prüfsummen in `run_log.txt` gültig bleiben. | keine auf Ergebnisse |
| A1b | Post-hoc (Beschaffung, nicht durch analyst) | 3.1, 13 | Download der DWD-Dateien durch die Top-Level-Session statt durch Daniel Saure im Browser. | Laut `run_log.txt` Entscheidung Daniel Saure im Chat vom 23.11.2026 („Du lädst sie“), vor Datenzugriff. Downloaddatum 23.11.2026 liegt vor dem 31.12.2026 (R6). SHA-256 aller 7 Dateien vom analyst nachgeprüft: alle OK. | keine |
| A2 | Post-hoc (Pfad) | 3.5 Nr. 3 | Vergleichsdatei liegt unter `Analysen/2026-09-gasspeicher-winter/rohdaten/dwd_gebietsmittel_deutschland_wintermonate.csv`, nicht unter `.../rohdaten/dwd/`. | Datei existiert nur dort. Nur gelesen, nicht verändert. | keine |
| A3 | Post-hoc (Beschaffung) | 3.4, 13 Nr. 5 | OWID-Datensatz vom analyst heruntergeladen (SAP 13: Download durch Daniel Saure). Datensatz „average-monthly-surface-temperature“ (ERA5), alle Länder, Ablage `rohdaten/owid/`, SHA-256 und URL in `run_log.txt`. | Ausdrücklicher Auftrag der Top-Level-Session („nur, wenn der Datensatz existiert und du ihn herunterladen kannst“). Zwei vorherige Abrufe mit Länderfilter lieferten nur Querschnitte aller Länder (falscher Filter) und wurden ungenutzt gelöscht. **Transparenzhinweis:** Beim ersten Fehlabruf erschien in der Konsole des analyst ein einzelner OWID-Wert für **Afghanistan, Oktober 2026** (Strukturprüfung der Kopfzeilen). Kein Wert für Deutschland ab Oktober 2026 wurde angezeigt; der Wert steht in keiner Datei des Analyseordners. | keine auf Ergebnisse; Datenschnitt der Ausgaben eingehalten |
| A4 | Post-hoc (Verfahren) | 6, S9 | Für S9 nennt der SAP kein Spannenverfahren. Festgelegt: (a) t-prädiktiv mit Spanne aus derselben Parametersimulation wie M1 (5.4), angewendet auf das Modell ohne Trend (σ*² aus χ²₂₉, μ* ~ N(Mittel, σ*²/30)); (b) empirischer Anteil 1997–2026 **einschließlich 2010** (das Jahr liegt im Schätzfenster) mit Clopper-Pearson. | Analog zum Primärverfahren; vor Sichtung der Ergebnisse festgelegt. | S9 erscheint als zwei Zeilen (S9a, S9b) |
| A5 | Auslegung | 2.0, 2.2, 11 | E2 und alle E2-Sensitivitäten rechnen mit **ungerundetem** T_ref (0,0339 °C); die 0,01-°C-Rundung beider Seiten gilt für die Zählvergleiche in E1, S1, S2, S14 und S9b. | SAP 11: „Rechnung ungerundet, Vergleich auf 0,01 °C“; bei stetigen Verteilungen ist der Unterschied < 0,005 °C. | vernachlässigbar |
| A6 | Auslegung | 6 (S1, S2), 4 | E1 für S1 und S2: Grundgesamtheit 1882–2026 **ohne 2010** (n = 144), analog zu 2.1, weil das Referenzjahr selbst in der Reihe liegt. S14 ohne Ausschluss (2.5 ausdrücklich), zusätzlich ohne 2010/2011 (n = 143). | SAP 6 nennt nur „1882–2026“; Ausschluss des Referenzwerts entspricht der Logik von 2.1. | E1 S1/S2 mit n = 144 |
| A7 | Auslegung | 5.4 (M1-AR) | Ziehung von (b₀, b₁, φ, log σ_e): b aus `vcov(gls)`, (φ, log σ_e) aus der asymptotischen Kovarianz von `nlme::gls` (`apVar`, Parameter θ = log((1+φ)/(1−φ)) und log σ_u), per Delta-Methode transformiert; Blöcke unabhängig (asymptotisch block-diagonale Information). σ_e = σ_u·√(1−φ²). P*_b = Φ((T_ref − ŷ*₂₀₂₇)/σ*_e) mit ŷ*₂₀₂₇ = b₀* + b₁*·2027 + φ*·(T₂₀₂₆ − b₀* − b₁*·2026). Punktschätzer wörtlich nach 5.3 (Prognosevarianz σ̂²_e + x₂₀₂₇'Var(b̂)x₂₀₂₇). | SAP legt Ziehung „aus der asymptotischen Normalverteilung der ML-Schätzer“ fest, aber nicht die Parametrisierung. Verworfene φ-Ziehungen: 0. | betrifft nur S10 (M1-AR nicht primär) |
| A8 | Auslegung | 6 (S6, S7, S12, S13) | S6, S7, S12, S13 mit M1 (t-prädiktiv, Spanne Parametersimulation 5.4). | SAP 6 bindet nur S1, S2, S14 an den Primärschätzer; S12 nennt M1 ausdrücklich. Da nach 5.3 **M1 primär** wurde, ist die Auslegung ohne Wirkung. | keine |
| A9 | Post-hoc (Zusatzinformation) | 3.5 Nr. 2 | Check 3.5-2 **nicht bestanden** (52 von 145 Wintern > 0,05 K, max. 0,19 K). Zusätzlich ausgegeben: Vergleich mit dem **ungewichteten** Mittel der drei Monate (max. 0,003 K, 0 Überschreitungen). | Erklärt die Abweichung: Die DWD-Winterdatei ist offenbar das ungewichtete Monatsmittel; der SAP schreibt für S1 Tagesgewichtung vor. Keine Rechnung geändert; S1 bleibt tagesgewichtet aus Monatswerten. **Hinweis an Mensch:** SAP 3.5 Nr. 2 verlangt „dokumentieren“, keinen Stopp; bitte bestätigen, dass dies ausreicht. | keine auf Ergebnisse |
| A10 | Post-hoc (Zusatzinformation) | 2.1 | Gleichstand nach 0,01-Rundung im Log genannt: 1883 (ungerundet 0,0336 °C) vs. 2010 (0,0339 °C); zählt nach 2.0 als „mindestens so kalt“. | Transparenz; 1883 ist auch ungerundet kälter. | keine |
| A11 | Auslegung | 6 (Spannbreiten-Aussage) | Min./Max. von P̂ über alle E2-Sensitivitätszeilen einschließlich S9a, S9b und aller drei S10-Schätzer. | SAP: „über alle durchgeführten E2-Sensitivitäten“. Ohne S9b läge das Maximum bei S6 (9 %). | Spannbreite 0,4 % (S14) bis 10 % (S9b) |
| A12 | gering | 5.2 (Linearität) | Glättung in der Grafik „Residuen gegen angepasste Werte“ mit `lowess` statt `loess`. | Nur grafisch, keine Rechnung. | keine |
| A13 | Hinweis | 10 | Pakete `binom` und `tseries` nicht installiert; verwendet wurden die im SAP zugelassenen Alternativen `stats::binom.test` (Clopper-Pearson) und eine eigene, im Skript dokumentierte Moving-Block-Bootstrap-Funktion (`mbb_index`, Blocklänge 3, Startpunkte gleichverteilt auf 1…54, 19 Blöcke, auf 56 gekürzt). | Keine Abweichung, nur Dokumentation. | keine |
| A14 | Post-hoc (Darstellung, Validierungsauflage V-5, 23.11.2026) | 11 | Umlaute in den Beschriftungen von Grafik 1 und Grafik 2 korrigiert (Maerz → März, waermer → wärmer, Flaeche → Fläche, Verlaengerung → Verlängerung, fuer → für). Nur Beschriftungsstrings und Kommentare in `kaeltewinter-2010.R` geändert; Skript neu ausgeführt (Exit-Code 0). | Validierungsbericht G-5/V-5; Freigabe Daniel Saure im Chat 23.11.2026 („Ja, umsetzen“). | keine auf Ergebnisse: sha256 vorher/nachher in `run_log.txt`; alle Tabellen, `ergebnisse.json`, alle CSV, `diagnostik_M1.png`, `session_info.txt` bitidentisch; geändert nur die PNG-Dateien von Grafik 1 und 2 |

## Offene Punkte / Rückfragen an Mensch

1. **A9 (3.5 Nr. 2):** Check formal nicht bestanden; Ursache vollständig durch die
   Gewichtungskonvention erklärt. Bestätigung erbeten, dass Dokumentation genügt.
2. **Lizenzfeld DWD (SAP 3, Template-Pflichtfeld):** Die Bestätigung der aktuellen
   DWD-Nutzungsbedingung ist in `run_log.txt` nicht eingetragen; der analyst hat
   keinen Netzzugriff auf die DWD-Seite für diese Prüfung genutzt.
3. Keine SAP-Vorgabe war technisch nicht umsetzbar. Keine „Abweichung vom SAP –
   Rückfrage an Mensch“ im Sinne einer nicht umsetzbaren Vorgabe.

## Nachtrag: Umsetzung der Validierungsauflagen (23.11.2026)

*Durch: Claude (analyst-Subagent). Grundlage: `Validierungsbericht_kaeltewinter-2010.md`,
Abschnitt 7. Freigabe: Daniel Saure im Chat 23.11.2026, „Ja, umsetzen“ (V-1 bis V-5,
S9b nur offengelegt). SAP v1.0 final unverändert. Die Tabelle oben (A1–A13) bleibt im
ursprünglichen Wortlaut stehen; neu ist nur A14.*

| Auflage | Art | Änderung | Datei(en) | Wirkung auf Zahlen |
|---|---|---|---|---|
| V-1 | Bericht (Text) | SAP-8-Pflichtinhalte und alle sieben SAP-9-Limitationen einzeln ausgeschrieben | Analysebericht, Abschnitt 7.1/7.2 | keine |
| V-2 | Bericht (Offenlegung zu A4(b)/A11) | Offengelegt: S9b zählt das Referenzjahr 2010 selbst mit (3/30 = 10 %); ohne 2010 2/29 = 7 % (Tabelle 1, Teilzeitraum 1997–2026); S9b bildet das Maximum der Spannbreite 0,4 % bis 10 %. **Nicht neu gerechnet**, Tabelle 2, `ergebnisse.json` und Spannbreite unverändert. Auslegung A4(b) bleibt bis zur Entscheidung durch Daniel Saure bestehen. | Analysebericht, Abschnitt 5 und 10 | keine |
| V-3 | Bericht (Text) | Lesehinweis: 3 % nur mit Spanne 0,5 % bis 10 %; Modellabhängigkeit (Schiefe −0,51, Bootstrap-Schätzer 5 %). Primärschätzer M1 unverändert (Regel 5.3). | Analysebericht, Abschnitt 4.3 | keine |
| V-4 | – | nicht vom analyst bearbeitet (Adressat Top-Level-Session). Stand 23.11.2026: Nachtrag „Lizenz (V-4)“ der Top-Level-Session steht in `run_log.txt`; damit betrifft offener Punkt 2 oben diesen Nachtrag (vom analyst nicht geprüft). | `run_log.txt` (nicht vom analyst) | keine |
| V-5 | Bericht (Rundung) | Temperaturangaben auf 0,1: σ̂ 1,7 K; Residual-SD 1,9 / 1,4 K; S8 SD 1,6 K; S9a SD 1,5 K; Trend 0,4 K pro Dekade. Ausnahmen mit Begründung im Analysebericht, Abschnitt 10. | Analysebericht, 4.1, 4.2, 5 | keine |
| V-5 | Skript (Darstellung), A14 | Umlaute in Grafik 1 und 2; Neulauf; sha256-Vergleich aller `output/`-Dateien in `run_log.txt` | `kaeltewinter-2010.R`, `output/grafik1_zeitreihe_jfm.png`, `output/grafik2_praediktive_verteilung_2027.png`, `run_log.txt` | keine (Ergebnisdateien bitidentisch) |

**Neuer offener Punkt (V-2):** Entscheidung Daniel Saure, ob die Auslegung A4(b)
(empirischer Anteil S9b einschließlich 2010) bestehen bleibt. Jede Änderung wäre
Post-hoc zu kennzeichnen; beide Varianten wären zu berichten.

## Bestätigungen Daniel Saure (23.11.2026, Chat)

Wortlaut: „Ja, alle drei“ auf die Frage, ob er A1b und A9 bestätigt und S9b so stehen lässt wie offengelegt.

- A1b (Rohdaten-Download durch die Top-Level-Session statt durch Daniel Saure): bestätigt.
- A9 (Integritätscheck 3.5-2 nicht bestanden, Ursache ungewichtetes DWD-Wintermittel, nur dokumentiert): bestätigt.
- S9b / A4(b): Auslegung bleibt wie gerechnet und offengelegt (2010 zählt im empirischen Anteil mit); Spannbreite bleibt 0,4 % bis 10 %. Keine Neuberechnung.

## Nachtrag 2: Darstellungsänderung nach Validierungsbericht Nachtrag 1 (23.11.2026)

*Durch: Claude (analyst-Subagent). Grundlage: `Validierungsbericht_kaeltewinter-2010.md`,
Nachtrag 1 (N-1, N-2, N-3, N-5) und Auftrag der Top-Level-Session nach den Bestätigungen
Daniel Saure (Abschnitt oben). SAP v1.0 final unverändert. Tabelle A1–A13 und A14 bleiben
im Wortlaut stehen; neu ist nur A15.*

| Nr. | Art | SAP-Stelle | Abweichung / Festlegung | Begründung | Auswirkung |
|---|---|---|---|---|---|
| A15 | Post-hoc (Darstellung, Validierungsbericht Nachtrag 1, N-1/N-2, 23.11.2026) | 11 | (a) Untertitel Grafik 2 von „(3 %)“ auf „(3 %, Spanne 0,5 % bis 10 %)“ geändert. Die Spanne wird nicht neu gerechnet, sondern aus dem vorhandenen Objekt `prim_q` (= Tabelle 2, `Spanne_fmt`; `ergebnisse.json`, `E2.span`) mit demselben Formatierer `fmt_p` formatiert. (b) Quellenangabe in Grafik 1 („Daten: Deutscher Wetterdienst (DWD)“) und Grafik 2 („Daten: DWD“) auf „Quelle: Deutscher Wetterdienst“ angeglichen. Nur Beschriftungsstrings und Kommentare in `kaeltewinter-2010.R` geändert; Neulauf 21:40:55 MEZ, Exit-Code 0. | N-1 (V-3 für Grafik 2: Kernzahl nur mit Spanne); N-2 (Namensnennung nach Lizenz-Nachtrag V-4, CC BY 4.0). | keine auf Ergebnisse: sha256 vorher/nachher in `run_log.txt`; alle Tabellen, `ergebnisse.json`, alle CSV, `diagnostik_M1.png`, `session_info.txt`, `console_log.txt` bitidentisch; geändert nur die PNG-Dateien von Grafik 1 und 2 |

Zusätzlich (nur Bericht, kein Skript): N-3 Ortsangabe zu V-2 im Analysebericht, Abschnitt 10,
verweist jetzt auf den Nachtrag dieses Protokolls; N-5 Berichtskopf nennt die Neuläufe
21:29 MEZ (A14) und 21:40 MEZ (A15) und den aktualisierten Validierungsstatus; die
Bestätigungen Daniel Saure (A1b, A9, S9b) sind im Analysebericht, Abschnitt 10.1, mit Verweis
auf dieses Protokoll vermerkt.

`diagnostik_M1.png` (interne Diagnosegrafik nach SAP 5.2, Basis-R) trägt keine Quellenzeile
und wurde nicht geändert; N-2 betrifft nur die beiden Veröffentlichungsgrafiken.

## Status (23.11.2026, eingetragen durch die Top-Level-Session)

- Der Abschnitt „Bestätigungen Daniel Saure (23.11.2026, Chat)“ wurde von der Top-Level-Session eingetragen, mit Daniel Saures Wortlaut aus dem Chat (Hinweis validator N-7).
- Erledigt: A9 (bestätigt), Lizenzfeld (V-4, Nachtrag in run_log.txt), V-2/S9b (bestätigt, keine Neuberechnung), N-1/N-2 (A15). Validierungsbericht mit Nachtrag 1 und Nachtrag 2: kein Befund kritisch, hoch oder offen mittel.
