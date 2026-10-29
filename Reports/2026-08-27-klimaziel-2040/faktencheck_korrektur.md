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

## Nachtrag 1 (Nachprüfung, 29.10.2026)

- **Geprüft:** überarbeiteter Entwurf `Reports/2026-08-27-klimaziel-2040/korrektur_entwurf.md` (nicht verändert)
- **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs), 29.10.2026
- **Belege:** wie Erstprüfung (run_log, SAP, R-Skript, Kap. 8); zusätzlich zwei neue Web-Abrufe des Live-Artikels (29.10.2026, Methodik-Abschnitt und Stellen 2, 4, 5 in Fragmenten), Web-Abruf des GitHub-Ordners `Analysen/2026-08-emissionen`, Sichtung der lokalen Datei `Analysen/2026-08-emissionen/output/emissionen_trendprojektion_2040.png`.
- **Nicht selbst eingesehen:** Inhalt von Commit `ef3d8d9` (kein Git-Zugriff). Grundlage ist nur die Commit-Nachricht, wie sie im Auftrag und im Entwurf steht. Ebenso nicht eingesehen: eine Ausgabedatei zur R-Nachrechnung der Hauptsession (406,61–565,451). Mir lag nur die Angabe im Auftrag vor.

### Gesamturteil Nachtrag 1: **Abweichung**

A1 bis A8 sind im Entwurf selbst umgesetzt oder ausreichend begründet offen. Dabei bleiben zwei Restpunkte: Kap. 8 des Jahrbuchs steht noch auf „566“, und der zeichengenaue Browserabgleich ist nur behauptet. Neu ist ein inhaltlicher Fehler. Der Folgesatz, der laut Zeile 4a stehen bleiben soll, ist in einem Teil falsch: „das ist konservativer als ursprünglich geplant“. Beim 10-Jahres-Trend ist es umgekehrt. Nur dort macht die Abweichung vom Plan überhaupt einen Unterschied. Ein Korrekturhinweis darf einen bekannten Fehler nicht ausdrücklich stehen lassen. Deshalb kann der Entwurf so noch nicht gesetzt werden. Die Kernaussage ist davon nicht betroffen, deshalb nicht „kritisch“.

### N-1. Erfüllung der Auflagen A1–A8

| Auflage | Stelle im Entwurf | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| A1: 565 statt 566 (Hinweis) | Hinweis Abs. „Falsche Bereiche“: „407 bis 565 und 86 bis 328“ | run_log Z. 21; eigene Nachrechnung der Erstprüfung (565,45) | bestätigt | |
| A1: 565 (Tabelle) | Tabelle Stelle 1: „407–565 Mt“ (Rechenlauf 406,61–565,45; nachgerechnet 29.10.2026) | wie oben | bestätigt, mit Hinweis | Die Werte 406,61 und 565,45 stimmen mit meiner unabhängigen Handrechnung überein. Die Formulierung „Rechenlauf 406,61–565,45“ ist aber ungenau. Der dateibasierte Rechenlauf (run_log) zeigt 406.6–565.5. Die zweistelligen Werte stammen aus einer Nachrechnung in der Hauptsession, für die mir keine Datei vorliegt. Empfehlung: „Rechenlauf 406,6–565,5; nachgerechnet 29.10.2026: 406,61–565,45“ und die R-Ausgabe als Datei ablegen (Verifikationspflicht). |
| A1: Jahrbuch Kap. 8, Fall 6 | `kapitel/08-korrekturen.md` Z. 86: „407 bis 566“ | Datei gelesen 29.10.2026 | **Abweichung (offen)** | Dort ist A1 noch nicht umgesetzt. Kap. 4 habe ich nicht geprüft. Betrifft nicht den Substack-Hinweis, aber dieselbe Zahl. |
| A2: drittes Zeitfenster | Absatz „Ein Zeitfenster fehlte“ | SAP 5.1, 7; run_log Z. 31–35; Live (2020–2025, „Kurzfrist“, „287“ kommen laut Abruf nicht vor) | bestätigt | Einzelprüfung siehe N-3 (b). |
| A3: zusammenhängende Abweichungen | „Hängen die Abweichungen vom Trend von Jahr zu Jahr zusammen, … Beim Langfrist-Trend ist das der Fall.“ | SAP 5.4; run_log Z. 16 (DW p = 0.000), Z. 24 (p = 0.308) | bestätigt | Das „das“ im letzten Satz bezieht sich sprachlich auf den Zusammenhang der Abweichungen. Das ist richtig. Dass das Intervall beim Langfrist-Trend tatsächlich zu eng ist, behauptet der Satz nicht. Gut so. Optional: Kap. 8, Fall 7 (Z. 98) spricht noch von „zusammenhängenden Jahreswerten“. Dort sollte die Formulierung angeglichen werden. |
| A4: Link „offenem Code“ | Tabelle Stelle 2, Link auf `…/tree/main/Analysen/2026-08-emissionen` | Web-Abruf 29.10.2026 | bestätigt | Der Ordner ist ohne Anmeldung erreichbar. Er enthält `DE-Emissionen-Trendprojektion-2040.R`, den SAP, `run_log_2026-10-24.txt` und `output/`. Ob die Datei im Repo mit der lokalen Fassung übereinstimmt, habe ich nicht abgeglichen. |
| A5: „entsprechen den Grenzen“, Begriff ARIMA | Hinweis: „entsprechen den Grenzen der zweiten Rechnung mit einem ARIMA-Modell (… zur Kontrolle gerechnet …)“; Zeile 3a: „als zweite Rechnung zur Kontrolle“; Zeile 2: „zwei statistischen Methoden“ | run_log Z. 39, 41; Live-Methodik („unabhängige Sensitivitätsanalyse“) | bestätigt | Hinweistext und Artikel verwenden nach Änderung 3a denselben Begriff. Das Wort „unabhängig“ wird an beiden Stellen gestrichen (siehe aber N-2, Punkt 2). |
| A6: Grafik | Absatz unter der Tabelle | lokale PNG gesichtet; R-Skript Z. 101–125 | bestätigt (lokale Datei), Live offen | Die Beschreibung im Entwurf trifft auf die lokale Datei zu. Sie zeigt zwei OLS-Linien und nur für den 10-Jahres-Trend ein unbeschriftetes grünes Band. Dessen Ende 2040 liegt sichtbar etwa bei 90 bis 325. Es gibt keine Zahlenangaben zu Bereichen, nur den Punkt „Zielpfad -88%“. Offen ist, ob die Live-Grafik dieselbe Datei ist. Der Entwurf benennt das selbst. Die Bildunterschrift im Artikel („Historische THG-Emissionen und Trendprojektionen bis 2040…“) weicht vom Titel im Bild ab. Das kann ein Alternativtext sein. Hinweis: Auch die Grafik zeigt das Fenster C nicht. SAP 10 sah „3 Trendlinien“ vor. Das passt zu A2. Eine Änderung ist nicht nötig, solange der Hinweis das fehlende Fenster nennt. |
| A7: Prüfschritt | Zeile 4a | Commit-Nachricht ef3d8d9 (nur Text) | nicht prüfbar | Einzelprüfung siehe N-3 (c). |
| A8: zeichengenauer Abgleich | Kopf: „Live-Text am 29.10.2026 im Browser gelesen“ | zwei Web-Abrufe 29.10.2026 | teilweise bestätigt | Meine Abrufe bestätigen die Fragmente der Stellen 1, 2, 3, 3a, 4, 4a und 5 wörtlich, einschließlich Gedankenstrich in Stelle 2 und Klammerinhalt in Stelle 4 („welche Zeitfenster, welche Methoden, wie mit mehreren Zeitfenstern umgegangen wird“). Die Browserlektüre selbst ist eine Angabe im Entwurf, die ich nicht nachprüfen kann. Ein zeichengenauer Volltextabgleich bleibt beim Setzen nötig. |

### N-2. Neue Befunde

| Befund | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| **1. Folgesatz im Artikel, der laut Zeile 4a stehen bleibt:** „Dabei wurde eine Präzisierung nötig: Die Korrektur der Standardfehler wird unabhängig vom Testergebnis auf Autokorrelation angewendet, nicht nur bei nachgewiesener Autokorrelation – das ist konservativer als ursprünglich geplant und wurde entsprechend dokumentiert.“ | R-Skript Z. 47–50; SAP 5.3; run_log Z. 16, 24, 27–29 | **Abweichung** | Siehe N-3 (a). Der Teil „unabhängig vom Testergebnis“ stimmt. Der Teil „konservativer“ ist beim 10-Jahres-Trend falsch, beim Langfrist-Trend ohne Wirkung. Der Teil „dokumentiert“ ist nicht prüfbar. |
| **2. Stille Änderung einer Prüfaussage** | Zeile 4a vs. Hinweistext | Abweichung | Zeile 4a ersetzt „Unabhängige Prüfung: Ein zweiter, vom eigentlichen Analyse-Code getrennter Prüfschritt hat den Code gegen den Plan abgeglichen“ durch eine deutlich schwächere Aussage. Damit wird eine veröffentlichte Aussage zur Arbeitsweise zurückgenommen. Der Hinweistext („Arbeitsweise falsch beschrieben“) erwähnt das nicht. Er nennt nur den Zeitpunkt des Plans und Newey-West. Nach dem Grundsatz in Kap. 8 („was falsch war“) gehört das in den Hinweis. Dasselbe gilt für den Folgesatz aus Befund 1, falls er geändert wird. Die Streichung von „unabhängigen“ in Stelle 2 und 3a ist sprachlich und braucht keine eigene Erwähnung. |
| 3. Keine neue Berechnung im Entwurf | gesamter Entwurf | bestätigt | Alle Zahlen im Hinweis stehen im run_log (486, 207, 407/406,6, 565/565,5 mit Rundungsnachweis, 86, 328, 182, 598, 16, 532, 150, 287). Die zweistelligen Werte in der Tabelle sind Prüfangaben und nicht für den Artikeltext bestimmt. Meine Rechnung in N-3 (a) dient nur der Prüfung und darf nicht als Zahl in den Artikel. |

### N-3. Prüffragen des Auftrags

**(a) Folgesatz „… konservativer als ursprünglich geplant …“ – mit Code und SAP vereinbar?**

Nein, nur teilweise.

- *„unabhängig vom Testergebnis angewendet“*: **bestätigt.** Das Skript wendet Newey-West bei Fenster A und B immer an (`if (inferenz)`, Z. 47–50), ohne Abfrage des DW-Tests. SAP 5.3 sieht es nur bei signifikantem DW-Test vor.
- *Wo macht das einen Unterschied?* Beim Langfrist-Trend ist der DW-Test signifikant (p = 0.000, run_log Z. 16). Der Plan hätte dort Newey-West ebenfalls verlangt, hier gibt es also keinen Unterschied. Nur beim 10-Jahres-Trend (DW p = 0.308, Z. 24) hätte der Plan klassische Standardfehler verlangt.
- *„konservativer“*: **Abweichung, sachlich falsch für Fenster B.** Der Newey-West-Standardfehler der Steigung beträgt dort 1,254 (run_log Z. 28). Zur Prüfung habe ich den klassischen OLS-Standardfehler aus den Skriptdaten (2015–2025) von Hand nachgerechnet: Residuenquadratsumme ≈ 5.424, s ≈ 24,55, Sxx = 110, SE ≈ 24,55/√110 ≈ **2,34**. Die Gegenkontrolle über die Breite des Prognoseintervalls im Log (86,3–327,8, Halbbreite 120,75 = t(0,975; 9) · s · √(1 + 1/11 + 400/110)) ergibt ebenfalls s ≈ 24,55. Der Newey-West-Fehler ist damit nur etwa halb so groß wie der klassische. Der tatsächlich angewendete Test ist beim 10-Jahres-Trend also **weniger** vorsichtig als der geplante, nicht vorsichtiger. Am Testergebnis ändert das hier nichts, denn die Steigung ist in beiden Fällen weit von null entfernt. Das ist aber eine Aussage aus meiner Prüfrechnung. Sie steht in keinem Rechenlauf und darf so nicht in den Artikel (Einordnung: keine neue Berechnung).
- *„wurde entsprechend dokumentiert“*: **nicht prüfbar.** Der einzige Hinweis ist die Commit-Nachricht „HAC-Abweichung dokumentiert“. Eine Datei dazu liegt in den Belegen nicht vor.
- **Folge (Auflage N1):** Der Folgesatz muss geändert werden und kann nicht bleiben. Vorschlag ohne neue Zahl: „Dabei fiel eine Abweichung vom Plan auf: Die Korrektur der Standardfehler wird immer angewendet, nicht nur bei nachgewiesener Autokorrelation, wie im Plan vorgesehen.“ Den Halbsatz „konservativer“ ersatzlos streichen. Soll der Artikel die Richtung oder den klassischen Standardfehler nennen, muss das zuerst in einem dokumentierten Rechenlauf stehen (Post-hoc, eigene Datei). Die Änderung gehört in den Hinweistext (siehe N-2, Punkt 2). Entscheidung Daniel Saure.

**(b) 287 Mt korrekt gerundet, „Bei nur sechs Jahreswerten … nicht belastbar“ durch SAP gedeckt?**

- 287,2 (run_log Z. 35) → 287: **bestätigt.**
- „sechs Jahreswerte“: run_log Z. 31 (n = 6), SAP 5.1: **bestätigt.**
- „nicht belastbar“: SAP 5.1 („rein deskriptiv, keine Inferenz - n zu klein“), SAP 7 („ausschließlich der Einordnung, nicht der Inferenz (n = 6 zu klein für valide Konfidenzaussagen)“), run_log Z. 34: **bestätigt.** Das Prognoseintervall (−69,9 bis 644,4) zeigt das ebenfalls. Der Entwurf muss es nicht nennen.
- „nur zur Beschreibung“: SAP 5.1/7: **bestätigt.**
- „Es fehlte im Artikel“: Laut Abruf vom 29.10.2026 kommen „2020–2025“, „Kurzfrist“ und „287“ im Live-Text nicht vor: **bestätigt.**
- Hinweis: SAP 7 verlangte, die drei Fenster „unkommentiert“ nebeneinander zu berichten. Dass der Hinweis Fenster C mit „nicht belastbar“ einordnet, deckt sich aber mit SAP 7, Satz 3. Kein Widerspruch.

**(c) A7-Formulierung durch Commit gedeckt?**

- Zeile 4a: „Prüfung: Ein zweiter Prüfschritt hat die Ergebnisse gegen Referenzwerte abgeglichen.“
- Commit-Nachricht ef3d8d9: „Pilot validiert: R-Ergebnisse matchen Referenzwerte, HAC-Abweichung dokumentiert“.
- **Ergebnis: nicht prüfbar (Wortlaut gedeckt, Inhalt nicht belegt).** Der Satz gibt die Commit-Nachricht sinngemäß wieder und behauptet nicht mehr als sie. Er spricht nicht mehr von „unabhängig“ oder „Code gegen Plan“. Das ist richtig. Unbelegt bleibt Folgendes: was die Referenzwerte waren, ob es ein eigener, „zweiter“ Schritt war und ob er die Bereichsangaben im Artikel umfasste. Der Commit-Inhalt und eine Prüfdatei lagen mir nicht vor.
- Präzisierungsvorschlag: „die R-Ergebnisse“ statt „die Ergebnisse“, wie im Commit. Sonst könnten Leser annehmen, auch die veröffentlichten Bereiche seien geprüft worden. Genau diese waren aber falsch.
- Der Folgesatz „Dabei wurde eine Präzisierung nötig“ passt zur Commit-Nachricht („HAC-Abweichung dokumentiert“). Inhaltlich gilt aber (a). Außerdem ist „Präzisierung“ beschönigend, es war eine Abweichung vom Plan.

### Auflagen aus Nachtrag 1

- **N1 (Pflicht vor Setzen):** Den Folgesatz in Zeile 4a ändern, „konservativer als ursprünglich geplant“ streichen. „wurde entsprechend dokumentiert“ nur behalten, wenn eine Datei dazu vorliegt. Die Änderung im Hinweistext unter „Arbeitsweise falsch beschrieben“ nennen. Keine neue Zahl zum klassischen Standardfehler ohne dokumentierten Rechenlauf.
- **N2:** Die Rücknahme der Aussage „Unabhängige Prüfung … Code gegen den Plan abgeglichen“ im Hinweistext offenlegen (ein Satz).
- **N3:** Zeile 4a: „die R-Ergebnisse“ statt „die Ergebnisse“ (empfohlen).
- **N4:** Tabelle Stelle 1: Log-Werte (406,6–565,5) und Nachrechnung (406,61–565,45) getrennt angeben. Die R-Ausgabe der Nachrechnung als Datei ablegen.
- **N5 (Rest A1):** Jahrbuch Kap. 8, Fall 6: „566“ → „565“. Kap. 4 prüfen. Optional bei Fall 7: „zusammenhängenden Jahreswerten“ angleichen (A3).
- **Rest A6/A8:** Live-Grafik und zeichengenauen Wortlaut beim Setzen im Browser abgleichen.

## Nachtrag 2 (Sichtprüfung N1–N4, 29.10.2026)

- **Geprüft:** Entwurf `Reports/2026-08-27-klimaziel-2040/korrektur_entwurf.md` (nicht verändert), nur die Stellen zu N1–N4: Absatz „Prüfung ungenau beschrieben“, Tabellenzeilen 1 (Langfrist), 4a, 4b, Entscheidungsvermerk Z. 52.
- **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs), 29.10.2026
- **Belege:** `Analysen/2026-08-emissionen/nachrechnung_2026-10-29.R` und `nachrechnung_2026-10-29.txt` (beide gelesen); `DE-Emissionen-Trendprojektion-2040.R`; `run_log_2026-10-24.txt`; `SAP_DE-Emissionen-Trendprojektion-2040.md` (Abschnitt 5.3, 5.5).
- **Einschränkung:** Ich konnte R nicht selbst ausführen. Dass die `.txt` die Ausgabe genau dieser `.R` ist, prüfe ich nur indirekt: Alle Werte, die auch im run_log stehen, stimmen überein (siehe N2-1). N5 ist laut Auftrag bewusst nicht Gegenstand.

### Gesamturteil Nachtrag 2: **Abweichung** (gering, nicht kritisch)

N1 bis N4 sind umgesetzt. Die Nachrechnungsdatei ist zum Skript und zum run_log stimmig. Die beiden Kernsätze („weniger vorsichtig, nicht vorsichtiger“ und „gilt mit beiden Verfahren“) sind sachlich richtig und durch die Dateien gedeckt. Zwei Formulierungen im neuen Absatz bleiben aber ungenau: „Belegt ist nur …“ sagt mehr, als ein Commit-Text belegen kann, und „mit beiden Verfahren“ ist mehrdeutig, weil der Hinweis vorher zwei *andere* Verfahren (lineare Regression und ARIMA) eingeführt hat. Beides lässt sich mit wenigen Wörtern beheben. Die Kernaussage ist nicht betroffen.

### N2-1. Nachrechnungsdatei (N4)

| Prüfpunkt | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| Daten identisch mit Analyseskript | `.R` Z. 5 vs. Skript Z. 16–20 | bestätigt | Alle 36 Werte 1990–2025 in gleicher Reihenfolge gleich. |
| Verfahren identisch | `.R` Z. 8–13 vs. Skript Z. 38, 42, 48, 56 | bestätigt | gleiches `lm`, `predict(…, interval = "prediction", level = 0.95)`, `sandwich::NeweyWest` mit Standardeinstellungen, `lmtest::dwtest`. Neu ist nur die Ausgabe von `sqrt(vcov(m))` (klassischer SE). Keine neue Methode. |
| A: 486.030; PI 406.610–565.451 | `.txt` Z. 10; run_log Z. 21 (486.0; 406.6–565.5) | bestätigt | Rundet auf die Log-Werte. Bestätigt meine Handrechnung der Erstprüfung (565,45 → 565). |
| A: NW-SE 1.8891, DW p 0.000 | `.txt` Z. 11; run_log Z. 16, 20 (1.889090) | bestätigt | |
| B: 207.040; PI 86.302–327.778 | `.txt` Z. 13; run_log Z. 29 | bestätigt | |
| B: Steigung −28.4792; NW-SE 1.2544; DW p 0.308 | `.txt` Z. 14; run_log Z. 24, 28 (−28.47918; 1.254364) | bestätigt | |
| B: SE klassisch 2.3406 | `.txt` Z. 14 | bestätigt (nur in Nachrechnung) | Deckt sich mit meiner Handrechnung in Nachtrag 1 (≈ 2,34). Steht nicht im run_log; der Entwurf trennt das richtig. |
| C: 287.240 | `.txt` Z. 16; run_log Z. 35 (287.2) | bestätigt | |
| Tabelle Stelle 1: „run_log 24.10.: 406.6–565.5; Nachrechnung 29.10.: 406,610–565,451, Datei …“ | wie oben | bestätigt | N4 erfüllt. Kosmetisch: Dezimalpunkt und Dezimalkomma gemischt (Log-Schreibweise vs. deutsche Schreibweise); in einer internen Tabelle unproblematisch. |
| Entscheidungsvermerk Z. 52: „SE klassisch 2,3406, Newey-West 1,2544“ | `.txt` Z. 14 | bestätigt | |

### N2-2. Absatz „Prüfung ungenau beschrieben“ und Zeilen 4a/4b (N1–N3)

| Behauptung (Entwurf) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|
| „Wir schrieben, ein zweiter Prüfschritt habe den Code gegen den Plan abgeglichen.“ | Live-Text Stelle 4a (Nachtrag 1, A8) | bestätigt | N2 erfüllt. |
| „Belegt ist nur, dass die R-Ergebnisse mit Referenzwerten abgeglichen wurden.“ | Commit-Nachricht ef3d8d9 (nur Text, kein Inhalt eingesehen); keine Prüfdatei | **Abweichung (Formulierung)** | Nachtrag 1 hat diese Aussage als „nicht prüfbar (Wortlaut gedeckt, Inhalt nicht belegt)“ eingestuft. Der einzige Nachweis ist eine Commit-Nachricht, also eine Selbstauskunft von damals. „Belegt ist“ klingt nach geprüftem Nachweis. Vorschlag: „Nachweisen können wir nur einen Vermerk von damals, dass die R-Ergebnisse mit Referenzwerten abgeglichen wurden.“ Alternativ: „Dokumentiert ist nur …“. |
| „Außerdem schrieben wir, die Korrektur für Autokorrelation sei immer angewendet worden und das sei ‚konservativer‘ als geplant.“ | Live-Text Folgesatz (Nachtrag 1, N-2 Befund 1) | bestätigt | Sinngemäß korrekt wiedergegeben („unabhängig vom Testergebnis … konservativer als ursprünglich geplant“). Das wörtliche Zitat „konservativer“ stimmt. |
| „Angewendet wurde sie tatsächlich immer, der Plan sah sie nur bei nachgewiesener Autokorrelation vor.“ | Skript Z. 47–50 (`if (inferenz)` ohne DW-Abfrage); SAP 5.3 („Bei signifikanter Autokorrelation (DW-Test, alpha = 0,05)“) | bestätigt, mit Hinweis | „immer“ gilt für jeden durchgeführten Trendtest (Fenster A und B). Für Fenster C gibt es planmäßig gar keinen Test (SAP 5.1/7). Das ist mit „immer“ vereinbar und muss im Hinweis nicht stehen. |
| „Beim 10-Jahres-Trend macht sie den Test aber weniger vorsichtig, nicht vorsichtiger.“ | `.txt` Z. 14: SE klassisch 2.3406 > SE Newey-West 1.2544; run_log Z. 24 (DW p = 0.308, Plan hätte klassisch verlangt) | bestätigt | Ein kleinerer Standardfehler ergibt einen betragsmäßig größeren t-Wert und einen kleineren p-Wert, der Test verwirft also leichter = weniger vorsichtig. Die Aussage ist richtig auf den 10-Jahres-Trend beschränkt: Beim Langfrist-Trend ist Newey-West zwar größer (1.8891 vs. 0.5500, also vorsichtiger), dort hätte der Plan es aber ebenfalls verlangt (DW p = 0.000). Keine Zahl im Text, nur die Richtung; die Richtung folgt direkt aus zwei dokumentierten Werten. Keine neue Inferenz im Sinne der Einordnungsregel. |
| „Dass der Trend dort deutlich fällt, gilt mit beiden Verfahren.“ | Newey-West: run_log Z. 28 (t = −22,70; p = 2,96·10⁻⁹); klassisch: aus `.txt` Z. 14 ableitbar | bestätigt (inhaltlich), **Abweichung (Formulierung)** | Prüfrechnung: klassischer t = −28,4792 / 2,3406 ≈ **−12,17** bei 9 Freiheitsgraden; kritischer Wert t(0,975; 9) ≈ 2,262; der p-Wert liegt damit weit unter 0,001 (SAP 5.5: alpha = 0,05). Die Aussage stimmt also. Zwei Einschränkungen: (1) Der klassische t- und p-Wert stehen in keiner Datei, sie folgen nur durch Division aus zwei dokumentierten Werten. Für einen vollständig dateibasierten Nachweis sollte die Nachrechnung sie mit ausgeben (z. B. `summary(m)$coefficients["jahr", ]`), ohne dass eine Zahl in den Artikel kommt. (2) „mit beiden Verfahren“ ist mehrdeutig. Der Hinweis hat im ersten Absatz „beide Rechnungen“ (lineare Regression und ARIMA) eingeführt. Leser können „beide Verfahren“ darauf beziehen. ARIMA enthält aber keinen Test der Trendsteigung. Gemeint ist „mit und ohne diese Korrektur“. „deutlich“ kann zudem als „steil“ statt „statistisch klar“ gelesen werden; beides trifft hier zu, deshalb unkritisch. |
| Zeile 4a neu: „Prüfung: Ein zweiter Prüfschritt hat die R-Ergebnisse gegen Referenzwerte abgeglichen.“ | Commit ef3d8d9 (Text) | bestätigt (Wortlaut), Inhalt weiterhin nicht prüfbar | N3 erfüllt. Behauptet nicht mehr als die Commit-Nachricht. |
| Zeile 4b neu: „Abweichend vom Plan wurde die Korrektur der Standardfehler (Newey-West) immer angewendet, nicht nur bei nachgewiesener Autokorrelation.“ | Skript Z. 47–50; SAP 5.3 | bestätigt | N1 erfüllt: „konservativer“ und das unbelegte „dokumentiert“ sind gestrichen; „Präzisierung“ ist durch „Abweichend vom Plan“ ersetzt. |
| Neue Berechnung im Artikeltext? | gesamter Hinweistext | bestätigt (keine) | Der Hinweistext enthält keine neue Zahl. Der klassische SE (2,3406) erscheint nur in der Tabelle und im Entscheidungsvermerk, mit Dateiverweis. Die Richtungsaussage stützt sich auf eine dokumentierte Nachrechnung (Post-hoc, gekennzeichnet). |

### N2-3. Verständlichkeit des neuen Absatzes für Laien

- **Gut:** Aufbau „Wir schrieben … Tatsächlich …“ ist klar und parallel zu den anderen Absätzen. Keine Zahlen, kurze Sätze.
- **Schwer verständlich:** „weniger vorsichtig“ bei einer *Korrektur* wirkt paradox. Laien erwarten, dass eine Korrektur Fehler verringert. Ein Halbsatz zur Erklärung würde helfen, z. B.: „Dort war keine Autokorrelation nachgewiesen, nach Plan hätte also die einfache Rechnung gegolten. Die Korrektur ergibt dort eine kleinere Unsicherheit, der Test wird dadurch weniger vorsichtig, nicht vorsichtiger.“ Ohne diesen Satz bleibt offen, warum nur der 10-Jahres-Trend genannt wird.
- **Mehrdeutig:** „mit beiden Verfahren“ (siehe N2-2). Vorschlag: „Dass der Trend dort deutlich fällt, gilt mit und ohne diese Korrektur.“
- **Fachbegriffe:** „R-Ergebnisse“ (Laien kennen R nicht; Vorschlag: „die Ergebnisse unseres Rechenprogramms (R)“), „Referenzwerte“ (unklar, welche; ehrlich wäre „mit Vergleichswerten“, da der Inhalt nicht bekannt ist), „Korrektur für Autokorrelation“ (wird im Absatz davor eingeführt, daher vertretbar).

### Auflagen aus Nachtrag 2

- **N6 (Formulierung, vor Setzen):** „Belegt ist nur, dass …“ ersetzen durch „Nachweisen können wir nur einen Vermerk von damals, dass …“ oder „Dokumentiert ist nur, dass …“.
- **N7 (Formulierung, vor Setzen):** „mit beiden Verfahren“ ersetzen durch „mit und ohne diese Korrektur“.
- **N8 (Dokumentation, empfohlen):** `nachrechnung_2026-10-29.R` um die Ausgabe des klassischen t- und p-Werts der Steigung ergänzen (z. B. `summary(m)$coefficients["jahr", ]`) und `.txt` neu erzeugen. Keine Zahl daraus in den Artikel.
- **N9 (Laienverständlichkeit, optional):** Brückensatz, warum nur der 10-Jahres-Trend betroffen ist (siehe N2-3); „R-Ergebnisse“ für Leser kurz erklären.
- Weiter offen aus früheren Runden: N5 (Jahrbuch, bewusst ausgelagert), Rest A6/A8 (Live-Grafik und zeichengenauer Wortlaut im Browser).
