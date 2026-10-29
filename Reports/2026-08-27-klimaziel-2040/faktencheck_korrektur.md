# Faktencheck – Korrekturvermerk (Entwurf) zu „Erreicht Deutschland sein Klimaziel 2040?“ (27.08.2026)

- **Geprüft:** `Reports/2026-08-27-klimaziel-2040/korrektur_entwurf.md` (Entwurf, nicht verändert)
- **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs), 29.10.2026
- **Belege:** Live-Artikel https://klimaevidenzcheck.substack.com/p/erreicht-deutschland-sein-klimaziel (abgerufen 29.10.2026 per Web-Abruf); `Analysen/2026-08-emissionen/run_log_2026-10-24.txt`; `Analysen/2026-08-emissionen/SAP_DE-Emissionen-Trendprojektion-2040.md`; `Analysen/2026-08-emissionen/DE-Emissionen-Trendprojektion-2040.R`; `Publikationen-oeffentlich/jahrbuch-2026/kapitel/08-korrekturen.md` (Fälle 6, 7)
- **Einschränkung beim Live-Abgleich:** Das Abruf-Werkzeug gibt den Artikel nicht vollständig wörtlich wieder. Die fünf Stellen wurden über gezielte Ja/Nein-Abfragen mit Satzfragmenten bestätigt. Ein zeichengenauer Abgleich (Gedankenstriche, Klammern, Fettdruck) und eine Sichtprüfung der Grafik stehen noch aus.

## Gesamturteil: **Abweichung**

Der Entwurf ist inhaltlich weitgehend gedeckt, und er rechnet nichts Neues. Alle Zahlen stammen aus dem Rechenlauf. Es gibt aber einen Rundungsfehler bei einer Zahl, die neu in den Text kommen soll (566 statt richtig 565). Außerdem übersieht der Entwurf mindestens eine weitere Abweichung des Artikels vom Analyseplan: Das dritte Zeitfenster 2020–2025 fehlt im Artikel. Nichts davon ist „kritisch“ für die Kernaussage. Der Hinweis soll aber gerade Zahlen korrigieren. Deshalb sollte er vor dem Setzen selbst fehlerfrei sein.

## 1. Zahlen im Hinweistext und in der Änderungstabelle

| Behauptung (Entwurf) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Live: „407–598 Mt“ (Langfrist), „16–328 Mt“ (10 Jahre) | Live-Artikel, Abschnitt „Die Kernzahl“ | bestätigt | Beide Zeilen vorhanden (eigene Absätze, Trendname fett, Pfeil mit Ergebnis zum Ziel). |
| Projektion 486 Mt (Langfrist) | run_log Z. 21: 486.0 | bestätigt | |
| Projektion 207 Mt (10 Jahre) | run_log Z. 29: 207.0 | bestätigt | |
| OLS Langfrist untere Grenze 407 | run_log Z. 21: 406.6 | bestätigt | |
| **OLS Langfrist obere Grenze 566** | run_log Z. 21: 565.5 | **Abweichung** | Das Log zeigt nur eine Nachkommastelle, und 565.5 ist ein Grenzfall. Ich habe den Wert mit den Daten aus dem Skript nachgerechnet: ȳ = 958,885; b = −14,54937; Fit 2040 = 486,030; SSR ≈ 39.954,6; s ≈ 34,280; t(0,975; 34) = 2,0322; Faktor √(1 + 1/36 + 32,5²/3885) = 1,1400; Halbbreite ≈ 79,42. Daraus ergibt sich eine obere Grenze von **≈ 565,45**, gerundet also **565**. „566“ entsteht durch doppeltes Runden (565,45 → 565,5 → 566). Das passt auch zur unteren Grenze im Log: 486,03 − 79,42 = 406,61, also 406.6. Auflage A1. Dieselbe Zahl steht im Jahrbuch-Entwurf Kap. 8, Fall 6 („407 bis 566“). Kap. 4 sollte ebenfalls geprüft werden. |
| OLS 10 Jahre 86 bis 328 | run_log Z. 29: 86.3 – 327.8 | bestätigt | Rundung eindeutig. |
| ARIMA Langfrist 182 bis 598 | run_log Z. 39: 181.5 – 598.3 | bestätigt | 181.5 ist ein Grenzfall. Die Nachrechnung ergibt aber > 181,5: Bei ARIMA(0,1,0) mit Drift ist die Punktschätzung 648,83 + 15·(−604,11/35) = 389,926. Aus dem symmetrischen Intervall und der gedruckten Obergrenze 598.3 folgt eine Untergrenze ∈ (181,50; 181,55), gerundet also 182. |
| ARIMA 10 Jahre 16 bis 532 | run_log Z. 41: 16.4 – 532.1 | bestätigt | |
| Zielwert 150 Mt | run_log Z. 13: 150.4 | bestätigt | |
| Zeilenverweise im Kopf „Zeilen 21, 29, 39, 41, 43–46“ | run_log | bestätigt | |
| Tabelle Stelle 1: „407–566“ | wie oben | **Abweichung** | richtig: „407–565“ (A1) |
| Tabelle Stelle 1: „86–328“ | run_log Z. 29 | bestätigt | |

Neue Berechnungen oder Schlüsse enthält der Entwurf nicht. Er gibt nur Werte aus dem vorhandenen Rechenlauf wieder. Meine Nachrechnung oben dient nur der Prüfung der Rundung. Sie ist keine neue Aussage für den Artikel.

## 2. Herkunft 598/16 und Lage des Ziels

| Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| „Die Werte 598 und 16 stammen aus der Kontrollrechnung mit ARIMA“ | run_log Z. 39, 41, 44, 46 | Abweichung (Formulierung) | Die Zahlen stimmen mit den ARIMA-Grenzen überein (598.3 und 16.4). Dass sie von dort *stammen*, ist plausibel, aber nicht belegt. Die Ursache ist laut Entwurf und Kap. 8 „noch nicht aufgearbeitet“. Kap. 8 formuliert vorsichtiger („stimmen … überein“). Empfehlung: „entsprechen den Grenzen der Kontrollrechnung“. Dazu kommt ein Begriffsproblem: Der Artikel nennt ARIMA „unabhängige Sensitivitätsanalyse“, das Wort „Kontrollrechnung“ kommt dort nicht vor. Eine Klammer würde die Zuordnung für Leser erleichtern (A5). |
| Langfrist: Ziel 150 außerhalb aller Bereiche | run_log Z. 43–44: FALSE/FALSE | bestätigt | 150,4 liegt unter 406,6 (OLS) und unter 181,5 (ARIMA). |
| 10 Jahre: Ziel innerhalb | run_log Z. 45–46: TRUE/TRUE | bestätigt | Es liegt in beiden Intervallen (86,3–327,8 und 16,4–532,1). |
| „Die Projektionen (486 und 207) … bleiben gleich“ | run_log | bestätigt | Hinweis: Die ARIMA-Punktschätzungen weichen ab (389,9 und 274,2). Der Artikel nennt sie nicht. Der Satz bezieht sich deshalb richtig nur auf OLS. |

## 3. Newey-West und Prognoseintervall

| Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Newey-West gilt nur für den Test der Trendsteigung | R-Skript Z. 47–50: `coeftest(modell, vcov = NeweyWest(modell))`, nur Zeile „jahr“ ausgegeben; SAP 5.3 | bestätigt | Newey-West fließt nicht ins Intervall ein. Im Code wird Newey-West bei Fenster A/B immer angewendet. Der SAP sieht das nur bei signifikantem DW-Test vor. Der Artikel nennt diese Abweichung selbst („konservativer als ursprünglich geplant“). Der neue Text zu Stelle 3 widerspricht dem nicht. |
| Bereiche 2040 sind klassische Prognoseintervalle | R-Skript Z. 56: `predict(modell, …, interval = "prediction", level = 0.95)`; SAP 5.4 „Primär: klassisches OLS-Prognoseintervall“ | bestätigt | |
| „Wenn Jahreswerte zusammenhängen, fallen solche Intervalle eher zu eng aus“ | SAP 5.4: „bei autokorrelierten Residuen tendenziell zu eng“ | bestätigt, mit Präzisierungswunsch | Die Formulierung ist vertretbar und deckt sich mit dem SAP. Genau genommen geht es um zusammenhängende *Abweichungen vom Trend* (Residuen), nicht um die Jahreswerte selbst. Bei einer Trendreihe hängen die Jahreswerte immer zusammen. Laut Log ist das beim Langfrist-Trend nachgewiesen (DW p = 0.000), beim 10-Jahres-Trend nicht (DW p = 0.308). Empfehlung A3. Die Aussage zur Lage des Ziels bleibt trotzdem gültig: Auch das breitere ARIMA-Intervall schließt 150 beim Langfrist-Trend aus. |
| Neuer Text Stelle 3 | SAP 5.3/5.4, Code | bestätigt | Fachlich korrekt. |

## 4. Entstehung des Analyseplans

| Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| „nach einer ersten Sichtung der Daten erstellt“ | SAP Abschnitt 0: „nach einer explorativen Sichtung der Daten erstellt (Pilotanalyse vom 27.08.2026, drei Zeitfenster wurden informell verglichen)“ | bestätigt | |
| „im Plan als ‚retrospektiv‘ gekennzeichnet“ | SAP Kopf: „Version: 1.0 (retrospektiv erstellt)“ | bestätigt | |
| „explorativ und nicht vorab festgelegt“ | SAP Abschnitt 0: „exploratorisch, nicht als präregistriert-konfirmatorisch“ | bestätigt | Hinweis: Der SAP selbst spricht in Abschnitt 2 und 5.1 weiterhin von „drei vorab festgelegten Zeitfenstern“. Das widerspricht Abschnitt 0, betrifft aber nicht den Entwurf. Das Feld „Autor:in / Freigabe“ im SAP ist leer. Der Plan wurde also nie formal eingefroren. Das stützt den neuen Ausdruck „schriftlicher Analyseplan“ statt „eingefroren“ oder „vorab“. |
| Neue Texte Stelle 2, 4, 5 („schriftlich festgelegt“) | SAP | bestätigt | „schriftlich festgelegt“ ist zutreffend und neutral. |

## 5. Weitere betroffene Stellen im Live-Artikel (vom Entwurf nicht erfasst)

| Stelle | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Fünf zitierte Stellen vorhanden | Live-Artikel (Abfrage 29.10.2026) | bestätigt (vorbehaltlich Wortlaut) | Alle fünf Sätze sind laut Abruf vorhanden, an den genannten Orten (Kernzahl, Einleitung, „Methodik (kurz)“, Vorgehen, Schluss). Ein zeichengenauer Abgleich muss im Browser erfolgen. |
| **Drittes Zeitfenster 2020–2025 fehlt** | SAP 2, 5.1, 6.2, 7 („alle drei unkommentiert nebeneinander berichtet“); run_log Z. 31–35 (287,2 Mt; −69,9 bis 644,4; rein deskriptiv); Live: 2020–2025 und „Kurzfrist“ kommen nicht vor | **Abweichung** | Der Artikel berichtet nur zwei der drei im Plan vorgesehenen Fenster. Er betont zugleich, dass die Fensterwahl die Schlagzeile bestimmt, und schreibt, der Plan schließe „nachträgliches Auswählen“ aus. Zusammen mit der informellen Pilotsichtung von drei Fenstern (SAP 0) gehört das in den Hinweis oder muss begründet weggelassen werden. Entscheidung Daniel Saure (A2). |
| „offenem Code“ (Stelle 2, bleibt im neuen Text) | Live: kein Link auf Code oder Repository | Abweichung | Der Satz verspricht offenen Code, verlinkt ihn aber nicht. Ob das Skript im öffentlichen Repository liegt, wurde hier nicht geprüft. Bei Fall 1 (Kap. 8) war ein ähnliches Versprechen der Fehler. A4. |
| „zwei unabhängigen statistischen Methoden“ / „unabhängige Sensitivitätsanalyse“ | Code: OLS und ARIMA auf denselben Daten | nicht prüfbar / Hinweis | Statistisch sind die beiden Verfahren nicht „unabhängig“, sie stützen sich auf dieselbe Datenreihe. „Zwei verschiedene“ wäre genauer. Optional. |
| „Unabhängige Prüfung“: „Ein zweiter, vom eigentlichen Analyse-Code getrennter Prüfschritt hat den Code gegen den Plan abgeglichen“ | Keine Prüfdatei in den übergebenen Belegen | nicht prüfbar | Ob es dafür einen dateibasierten Nachweis gibt, sollte vor dem Setzen geklärt werden. Der Validator-Workflow ist laut CLAUDE.md erst ab 29.08.2026 dokumentiert. A7. |
| Grafik („Historische THG-Emissionen und Trendprojektionen bis 2040…“) | R-Skript Z. 112–115, 125 (1400×900 px, Bildgröße im Artikel ebenfalls 1400×900) | nicht prüfbar (Sichtprüfung offen) | Die Grafik stammt vermutlich aus dem Skript. Das Skript zeichnet ein **unbeschriftetes Band** für den 10-Jahres-Trend aus dem OLS-Intervall (86,3–327,8). Es zeigt also die *richtigen* Werte, nicht die falschen. Für den Langfrist-Trend gibt es kein Band. Die Aussage im Entwurf („keine der falschen Bereichsangaben“) ist damit plausibel, sollte aber am Bild geprüft werden (A6). |
| „→ Ziel nicht erreichbar“ (Langfrist) | Live; SAP 8 (keine Vorhersage) | Hinweis | Das ist eine starke Formulierung für eine reine Trendfortschreibung. Der Artikel sagt selbst, es sei keine Vorhersage. Sie ist nicht Gegenstand der Korrektur. Optional: „Ziel liegt außerhalb des Bereichs“. |
| Ergebnis 10 Jahre: „Ziel im Unsicherheitsbereich enthalten“ | run_log Z. 45–46 | bestätigt | Bleibt nach der Korrektur richtig. |

## 6. Bleibt die Kernaussage unberührt?

**Bestätigt.** Die Kernaussage lautet: Das Zeitfenster entscheidet über die Schlagzeile. Sie gilt mit den korrigierten Bereichen weiter. Langfrist: Das Ziel liegt außerhalb beider Intervalle (OLS und ARIMA). 10 Jahre: Das Ziel liegt innerhalb beider. Auch wenn das OLS-Intervall zu eng sein sollte, ändert sich das nicht, denn das breitere ARIMA-Intervall führt zum selben Ergebnis. Zwei Einschränkungen gehören aber offen benannt: Die Fenster wurden nach einer Datensichtung gewählt, und ein drittes Fenster fehlt (Punkt 5). Das schwächt nicht die Aussage selbst, wohl aber den Anspruch, eine Auswahl sei ausgeschlossen gewesen.

## 7. Verständlichkeit für Laien (kurz)

- Gut: klare Zweiteilung („Falsche Bereiche“ / „Arbeitsweise falsch beschrieben“), konkrete alte und neue Zahlen, Schlusssatz zur Kernaussage.
- Schwer: „Hauptverfahren … lineare Regression“, „Kontrollrechnung mit ARIMA“, „Newey-West“, „Test der Trendsteigung“, „klassische Prognoseintervalle“. Vorschlag: einmal kurz erklären, z. B. „die Rechnung, die prüft, ob der Rückgang mehr als Zufall ist“ und „die Spanne, in der der Wert 2040 bei gleichem Trend liegen dürfte“.
- „Die Werte 598 und 16 stammen aus …“ setzt voraus, dass Leser verstehen, warum zwei Verfahren verschiedene Bereiche haben. Ein Halbsatz würde helfen („ein zweites Verfahren, das wir zur Kontrolle gerechnet haben“).

## Auflagen

- **A1 (Zahl):** „566“ durch **„565“** ersetzen, im Hinweistext und in der Tabelle (Stelle 1). Vorher den Rechenlauf mit mehr Nachkommastellen bestätigen (z. B. `sprintf("%.3f")` im Ausgabeteil, ohne Änderung der Methode). Dieselbe Korrektur gilt für den Jahrbuch-Entwurf Kap. 8, Fall 6 und gegebenenfalls Kap. 4.
- **A2 (übersehene Stelle):** Daniel Saure entscheidet, ob der Hinweis das fehlende dritte Zeitfenster 2020–2025 nennt. Der Plan sah vor, alle drei zu berichten. Die Werte stehen im Rechenlauf (287 Mt; rein beschreibend, Bereich zu breit für Aussagen).
- **A3 (Präzisierung):** „Wenn Jahreswerte zusammenhängen“ ersetzen durch etwa „Wenn die Abweichungen vom Trend von Jahr zu Jahr zusammenhängen (beim Langfrist-Trend ist das der Fall)“.
- **A4:** „offenem Code“ entweder mit Link auf das Skript im öffentlichen Repository belegen oder streichen. Vorher prüfen, ob das Skript dort liegt.
- **A5:** „stammen aus“ durch „entsprechen den Grenzen“ ersetzen, solange die Ursache nicht aufgearbeitet ist. Begriff an den Artikel angleichen („Kontrollrechnung (Sensitivitätsanalyse) mit ARIMA“).
- **A6:** Grafik am Live-Artikel sichten: Band vorhanden? Beschriftung? Sie sollte zu den korrigierten Werten passen.
- **A7:** Klären, ob es für den im Artikel genannten „zweiten Prüfschritt“ einen dateibasierten Nachweis gibt. Sonst ist auch dieser Satz zu prüfen.
- **A8:** Die fünf Stellen vor dem Setzen im Browser zeichengenau abgleichen. Der Web-Abruf hat sie nur sinngemäß bzw. in Fragmenten bestätigt.
