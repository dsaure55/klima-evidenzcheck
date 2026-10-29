**ENTWURF – nicht veröffentlicht. Freigabe durch Daniel Saure erforderlich vor Publikation.**

# Korrekturvermerk – „Erreicht Deutschland sein Klimaziel 2040? Die Antwort hängt vom Blickwinkel ab“ (27.08.2026)

- **Artikel:** https://klimaevidenzcheck.substack.com/p/erreicht-deutschland-sein-klimaziel (Live-Text am 29.10.2026 im Browser gelesen)
- **Grundlage:** Jahrbuch-Entwurf Kapitel 8, Fälle 6 und 7 (`Publikationen-oeffentlich/jahrbuch-2026/kapitel/08-korrekturen.md`); Rechenlauf `Analysen/2026-08-emissionen/run_log_2026-10-24.txt` (Zeilen 21, 29, 39, 41, 43–46); SAP `Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md` (Kopf: „Version 1.0 (retrospektiv erstellt)“, Abschnitt 0 und 5.4); früherer Entwurf `Redaktion/korrekturhinweise_entwurf_2026-10-26.md` (privat), hier erweitert um die Stellen in Einleitung, Methodik und Schlusssatz.
- **Anlass für den Zeitpunkt:** Der geplante Evidenzcheck zum Expertenrat-Budgetabgleich nutzt die Trendmodelle dieses Artikels. Der Hinweis soll vorher stehen.
- **Ursache der Fehler:** noch nicht aufgearbeitet (Jahrbuch Kap. 8). Der Hinweis nennt deshalb keine Ursache.

## Betroffene Stellen im Live-Text (wörtlich)

1. Kernzahl: „Langfrist-Trend (1990–2025): Projektion 486 Mt, Bereich 407–598 Mt“ und „10-Jahres-Trend (2015–2025): Projektion 207 Mt, Bereich 16–328 Mt“
2. Einleitung: „Wir haben das nachgerechnet – mit einem vorab festgelegten Analyseplan, offenem Code und zwei unabhängigen statistischen Methoden.“
3. Methodik, Verfahren: „lineare Trendregression mit Newey-West-korrigierten Standardfehlern (robust gegenüber der Autokorrelation, die in Jahreszeitreihen typisch ist)“
4. Methodik, Vorgehen: „Der Analyseplan (…) wurde vor der Modellierung festgelegt, um nachträgliches Auswählen des günstigsten Ergebnisses auszuschließen“
5. Schluss: „Diese Analyse ist die erste einer Serie, die öffentliche Klimadaten mit transparenter, vorab festgelegter Methodik auswertet.“

## Text für den Korrekturhinweis oben im Artikel

**Korrigiert am [Datum]:** Bei einer erneuten Prüfung haben wir Fehler in diesem Artikel gefunden.

*Falsche Bereiche.* Für die Fortschreibungen standen hier „407–598 Mt“ (Langfrist-Trend) und „16–328 Mt“ (10-Jahres-Trend). Nach dem Hauptverfahren der Analyse, der linearen Trendregression, sind es 407 bis 565 und 86 bis 328 Millionen Tonnen. Die Werte 598 und 16 entsprechen den Grenzen der zweiten Rechnung mit einem ARIMA-Modell (einem Zeitreihenmodell, das wir zur Kontrolle gerechnet haben); dort lauten die Bereiche 182 bis 598 und 16 bis 532. Die Projektionen (486 und 207 Millionen Tonnen) und die Aussagen bleiben gleich: Beim Langfrist-Trend liegt das Ziel von 150 Millionen Tonnen außerhalb der Bereiche beider Rechnungen, beim 10-Jahres-Trend innerhalb.

*Arbeitsweise falsch beschrieben.* Wir schrieben, der Analyseplan sei vor der Modellierung festgelegt worden. Tatsächlich haben wir ihn nach einer ersten Sichtung der Daten erstellt; im Plan ist er als „retrospektiv“ gekennzeichnet. Die Analyse ist deshalb explorativ und nicht vorab festgelegt. Außerdem gilt die Korrektur für Autokorrelation (Newey-West) nur für den Test, ob der Trend wirklich fällt. Die Bereiche für 2040 sind klassische Prognoseintervalle. Hängen die Abweichungen vom Trend von Jahr zu Jahr zusammen, fallen solche Intervalle eher zu eng aus. Beim Langfrist-Trend ist das der Fall.

[OPTIONAL, Entscheidung Daniel – A2:] *Ein Zeitfenster fehlte.* Der Plan sah ein drittes, kurzes Zeitfenster vor (2020–2025), nur zur Beschreibung. Es fehlte im Artikel. Die Fortschreibung ergibt dort 287 Millionen Tonnen für 2040. Bei nur sechs Jahreswerten ist das nicht belastbar.

Die Kernaussage bleibt: Das gewählte Zeitfenster entscheidet über die Schlagzeile.

## Vorgeschlagene Änderungen im Text (zusätzlich zum Hinweis)

| Stelle | bisher | neu |
|---|---|---|
| 1 | „Bereich 407–598 Mt“ | „Bereich 407–565 Mt“ (Rechenlauf 406,61–565,45; nachgerechnet 29.10.2026) |
| 1 | „Bereich 16–328 Mt“ | „Bereich 86–328 Mt“ |
| 2 | „mit einem vorab festgelegten Analyseplan, offenem Code und zwei unabhängigen statistischen Methoden“ | „mit einem schriftlichen Analyseplan, offenem Code [Link, A4] und zwei statistischen Methoden“ |
| 3 | „lineare Trendregression mit Newey-West-korrigierten Standardfehlern (robust gegenüber der Autokorrelation, die in Jahreszeitreihen typisch ist)“ | „lineare Trendregression; der Test der Trendsteigung mit Newey-West-korrigierten Standardfehlern (robust gegenüber Autokorrelation), die Bereiche für 2040 als klassische Prognoseintervalle“ |
| 3a | „ein ARIMA-Modell als unabhängige Sensitivitätsanalyse“ | „ein ARIMA-Modell als zweite Rechnung zur Kontrolle“ |
| 4 | „Der Analyseplan (…) wurde vor der Modellierung festgelegt, um nachträgliches Auswählen des günstigsten Ergebnisses auszuschließen“ | „Der Analyseplan (…) wurde nach einer ersten Sichtung der Daten schriftlich festgelegt (retrospektiv). Die Analyse ist deshalb explorativ.“ |
| 5 | „mit transparenter, vorab festgelegter Methodik“ | „mit transparenter, schriftlich festgelegter Methodik“ |

Die Grafik im Artikel wird nicht geändert. Geprüft an `Analysen/2026-08-emissionen/output/emissionen_trendprojektion_2040.png` (29.10.2026): Sie zeigt die beiden OLS-Linien und nur für den 10-Jahres-Trend ein unbeschriftetes Band mit den richtigen Werten (etwa 86–328), keine Zahlenangaben zu den Bereichen. Ob die Live-Grafik dieselbe Datei ist, vor dem Setzen kurz ansehen.

## Offene Entscheidungen (Daniel)

- **A2 – drittes Zeitfenster:** Absatz „Ein Zeitfenster fehlte“ in den Hinweis aufnehmen oder weglassen. SAP 7 verlangte, alle drei Fenster zu berichten (Rechenlauf: 287,2 Mt, Intervall −69,9 bis 644,4, rein beschreibend).
- **A4 – „offenem Code“:** Das Repo ist öffentlich (https://github.com/dsaure55/klima-evidenzcheck), der Artikel verlinkt es aber nicht. Vorschlag: Link auf `https://github.com/dsaure55/klima-evidenzcheck/tree/main/Analysen/2026-08-emissionen` setzen, sonst „offenem Code“ streichen.
- **A7 – „Unabhängige Prüfung“ (Methodik):** Für den beschriebenen zweiten Prüfschritt gibt es keine Prüfdatei im Analyseordner. Einziger Hinweis ist die Commit-Nachricht `ef3d8d9` „Pilot validiert: R-Ergebnisse matchen Referenzwerte, HAC-Abweichung dokumentiert“ (27.08.2026). Falls es keinen weiteren Nachweis gibt, Vorschlag: Satz belassen, aber nichts Weitergehendes behaupten; oder „Ein zweiter Prüfschritt hat die Ergebnisse gegen Referenzwerte abgeglichen“ (näher am Commit). Daniel weiß, was damals geprüft wurde.

## Kanalposts

Der Artikel stammt aus der Zeit vor den Klima-Kompass-Kanälen (Start 16.10.2026). Ob es Posts mit den falschen Bereichen gibt, vor dem Setzen in `Redaktion/redaktion.md` prüfen.
