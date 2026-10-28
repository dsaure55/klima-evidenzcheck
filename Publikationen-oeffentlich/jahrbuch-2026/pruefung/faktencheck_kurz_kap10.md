# Differenz-Faktencheck Kurzfassung Kapitel 10 (Das Prognose-Register)

**Geprüft:** `kurz/10-prognose-register.md` (KURZFASSUNG-ENTWURF v0.1, 28.10.2026) gegen `kapitel/10-prognose-register.md` (Langfassung) und `pruefung/faktencheck_kap10.md` mit Nachtrag 1 (26.10.2026). Kapiteltexte nicht verändert.
**Prüfdatum:** 28.10.2026 · **Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). **Dieses Dokument enthält keinen Freigabevermerk.**
**Schwerpunkt laut Auftrag:** Eintrag #1 (Zahlen, Daten) und Fristen des Registers 2027 exakt.
**Grenze:** Differenzprüfung; SAP, Registerdatei und Eurostat nicht erneut geöffnet (Belege aus `faktencheck_kap10.md`). Es wurde nicht geprüft, ob der SAP „Prognose-Register 2027“ seit dem Stand 23.10.2026 weiter eingefroren wurde.

## Kurzurteil: **ok** (mit geringen Hinweisen; offene Auflagen der Langfassung bleiben bestehen)

Eintrag #1 und die Fristen des Registers 2027 sind Wort für Wort mit der Langfassung identisch. Keine Zahl, kein Datum und keine Frist ist verändert oder verschärft; kein Zahlenwert für 2027 im Text. Alle Angaben zu 2027 tragen weiter den Vorbehalt „geplant“, „nur zum Teil eingefroren“, „Alles ist geplant“. Querverweis (Kapitel 7, alt 8) ist richtig, Platzhalter und Entwurfsklammern sind übernommen. Die Kürzung betrifft nur Erklärsätze. Kein mittlerer oder kritischer Befund.

## Befunde

| Nr. | Stelle | Befund | Schweregrad | Vorschlag |
|---|---|---|---|---|
| K1 | „Was das nicht ist“ | Gestrichen: „Eine Klimaprojektion beschreibt, was unter bestimmten Annahmen über Emissionen passiert.“ Verbleibend: „Eine Vorhersage im Register ist keine Wette und keine Klimaprojektion.“ Der Begriff „Klimaprojektion“ ist nun unerklärt (Stilregel 2, Fachwort einmal erklären). Außerdem übernommen: „mit festem Stichtag“ gilt nicht für Eintrag #1 (Faktencheck Nachtrag 1, N5; widerspricht der Aufzählung „bei Eintrag #1: sobald Eurostat die Werte liefert“). | gering | Begriff in einem Halbsatz erklären; „mit festem Stichtag (bei #1: Eurostat-Veröffentlichung)“. |
| K2 | „Warum es im Buch keine Zahlen gibt“ | Wortgleich zur Langfassung, daher auch die dort offenen Befunde N4: Die Ausnahme für den Prognose-Check wird ohne Bedingung genannt (V3 darf gerechnet werden, wenn der Prognose-Check am 12.01.2027 nicht abgeschlossen ist), und „Beim globalen Temperaturwert“ steht zweimal direkt hintereinander. Fristen (15.01./31.01.2027) sind richtig. | gering | Zweiten Satz streichen, Bedingung nennen. |
| K3 | „Hinweise zu den Zielgrößen“ | Wortgleich zur Langfassung, daher offen: N2 („sagen nichts über die Pariser 20-Jahres-Grenze“ ist stärker als SAP 8.4: „sagen für sich allein nicht, ob … überschritten ist“) und N3 („ohne Landnutzung (laut UBA-Vorjahresschätzung)“ lässt „ohne internationalen Luft- und Seeverkehr“ aus und liest sich wie die Quelle statt als Definition). Zielgrößen 1, 2 und 4 sind im SAP noch Entwurf. | gering | Wie in Nachtrag 1 vorgeschlagen. |
| K4 | „Woher wir das wissen“ | „Die Angaben zu Eintrag #1 stammen aus der Registerdatei und der **validierten** Analyse“ (Langfassung N1): Der Validierungsbericht der Gas-Analyse hat die offene Auflage zum DWD-Abgleich; die Erledigung als Datei fehlt. Im Eintrag #1 selbst ist der Vorbehalt dagegen richtig genannt („Bei der Prüfung stand ein Abgleich … noch aus“). Neu: „Einzelheiten stehen in der Langfassung und im **Methodenanhang**“; Existenz nicht prüfbar. | gering | „der Analyse mit unabhängiger Prüfung“; Methodenanhang klären. |
| K5 | „Das Prinzip“, Absatz zum 95-Prozent-Intervall | Satz „Genau das sehen die Leserinnen und Leser nur, wenn alle Ergebnisse veröffentlicht werden, unabhängig vom Ausgang“ ist zu „Das sieht man nur, wenn alle Ergebnisse veröffentlicht werden“ verkürzt. Der Zusatz „unabhängig vom Ausgang“ entfällt hier; er steht weiterhin in „Kurz gesagt“, im Abschnitt „Was als Nächstes kommt“ und in „Lagen wir richtig?“. Aussage unverändert. Gestrichen in „Wie du mitprüfen kannst“: „Er zeigt …, ob er danach verändert wurde“. Das entschärft die in der Erstprüfung als überzogen beanstandete Aussage (Nr. 8) und ist unkritisch. | gering | Keine Änderung nötig. |
| K6 | Eintrag #1, Entwurfsklammer; Kopfzeile | Die Klammer „[Entscheidung Daniel Saure: Erledigung als Datei nachweisen oder so stehen lassen.]“ und „[Am 15.11.2026 gegen Laufprotokoll, Validierungsbericht und Freigabe neu prüfen.]“ stehen noch im Text (korrekt übernommen, vor Satz zu entfernen). Die Kopfzeile des Kurztexts verweist nicht auf die offene Vorprüfung per `git diff 93a0d3f -- Prognose-Register/01_gasspeicher-winter-2026-27.md` (Auflage A9 der Langfassung, ohne Shell nicht ausführbar) und auf den veralteten Satz „Faktencheck des Originalkapitels offen“ gibt es keinen Hinweis; die Kopfzeile nennt nur Stand SAP und Prognose-Check. | gering | Vorprüfung per `git diff` und Neuabgleich am 15.11.2026 in die Kopfzeile aufnehmen. |
| K7 | Stil | Abschnitt „Wie du mitprüfen kannst“ wurde aus Aufzählung in Fließtext überführt, Inhalt gleich. Satzbau „Hinweise zu den Zielgrößen: Bei den Hitzetagen …“ ist sachlich und verständlich. Regel 8 (Zahlen/Daten unverändert) eingehalten. Keine Behördenfloskeln neu. | gering | – |

## Eintrag #1 (Zahlen, Daten): Abgleich Kurz gegen Lang

| Angabe | Kurzfassung | Langfassung | Ergebnis |
|---|---|---|---|
| Registriert am | 22. Oktober 2026 | 22. Oktober 2026 | gleich |
| Grundlage | „Reichen 136 Terawattstunden?“ vom 14. September, eingefrorener Plan, unabhängige Prüfung [1][2] | gleich | gleich |
| Offene Auflage | „Abgleich der Temperaturwerte mit den Originaldateien noch aus“ + Klammer Daniel Saure | gleich | gleich |
| Zielgröße | Netto-Entnahme Oktober 2026 bis März 2027, Eurostat-Monatsdaten, TWh [2] | gleich | gleich |
| V1 Fitbereich | 3,75 bis 6,18 °C, sonst nicht bewertet | gleich | gleich |
| V2 | 69 bis 230 TWh, 4,21 °C, rund 150 TWh, „Maßgeblich ist deshalb V1“ | gleich | gleich |
| Auswertung | Eurostat-Werte bis März 2027, voraussichtlich Mai oder Juni 2027 | gleich | gleich |
| Offenlegung | Winter drei Wochen alt; 60,5 Prozent am 16. Oktober [3]; Bestand, keine Entnahme | gleich | gleich |
| „Nicht vorhersagen“ | Versorgungssicherheit, Preise, kurze Kältewellen | gleich | gleich |
| Neu gerechnet | „Neu gerechnet wurde für den Eintrag nichts.“ | gleich | gleich |

## Fristen und Angaben zum Register 2027: Abgleich Kurz gegen Lang

| Angabe | Kurzfassung | Langfassung | Ergebnis |
|---|---|---|---|
| Anzahl, Status | „vier weitere Einträge“; „Analyseplan liegt vor, ist aber nur zum Teil eingefroren“; „Daten, Zahlen und Termine können sich ändern“ | gleich | gleich |
| Zielgrößen 1–4 | Sommermitteltemperatur; Hitzetage; Monate über 1,5 °C (global, vorindustriell); deutsche Treibhausgasemissionen | gleich | gleich, Reihenfolge entspricht V1–V4 |
| Datenschnitt | „ausschließlich mit Daten bis Ende 2026“; keine 2027-Beobachtungen, auch nicht vorläufig/Tageswerte; Copernicus [4] | gleich | gleich |
| Registrierungsfristen | globaler Temperaturwert (3.): bis 15. Januar 2027; andere: bis 31. Januar 2027 | gleich | gleich, nicht verschärft („muss stehen“ = „spätestens“) |
| Stichtage der Auswertung | zwischen dem 15. September 2027 und dem 31. März 2028 | gleich | gleich (A4-Fassung, kein „bis März 2028“-Enddatum) |
| Sperre 2 | „bis er eingefroren ist, bis der Prognose-Check abgeschlossen ist und bis die Daten bis Ende 2026 vorliegen“ + Ausnahme globaler Temperaturwert | gleich | gleich (K2 für Redundanz) |
| Kanal | Registrierung „spätestens am 31. Januar 2027 in einem gemeinsamen Beitrag auf Substack“; Auswertung „unabhängig vom Ausgang“ | gleich | gleich, Kanal der Auswertung nicht festgelegt |
| Erscheinen | „Das Buch erscheint früher.“ | gleich | gleich; gilt nur, solange das Erscheinen vor den Einfrierterminen liegt (E4 der Langfassung) |
| Prognose-Check | eingefroren am 22. Oktober 2026 [5]; „Stand 24. Oktober 2026 liegt kein validiertes Ergebnis vor“; nötig vor drei von vier Vorhersagen | gleich | gleich; Entwurfsklammer übernommen |

Kein Zahlenwert und keine Richtungsaussage für 2027 im Kurztext (Schwellenwert 1,5 °C ist Teil der Zielgrößendefinition).

## Weitere Prüfpunkte

- **„Kurz gesagt“:** identisch zur Langfassung; vom Haupttext gedeckt. „Eine Vorhersage ist registriert“ (tatsächlich V1 und V2, E2 der Langfassung) bleibt wie dort.
- **Querverweise (alt→neu):** „Findest du einen Fehler …, sag uns Bescheid (Kapitel 7)“ (alt 8 → 7, Korrekturen/Fehlermeldung) richtig. Weitere Kapitelverweise enthält der Kurztext nicht.
- **Quellen:** [1] bis [5] identisch zur Langfassung (Titel, Daten, URLs); alle im Text zitiert.
- **Neue Aussagen/Zuspitzungen:** keine außer „Methodenanhang“ (K4). Keine neue Berechnung.

## Geprüfte Stichproben

- Absatzvergleich aller Abschnitte; Zahlen- und Datumsabgleich in den beiden Tabellen oben (alle gleich).
- Fristen „15. Januar 2027“, „31. Januar 2027“, „15. September 2027“, „31. März 2028“, „22. Oktober 2026“, „23. Oktober 2026“, „24. Oktober 2026“ gegen die Langfassung; laut `faktencheck_kap10.md` Nachtrag 1 gegen die SAP-Fristentabelle bestätigt.
- Entwurfsklammern, Stichtagsklammer („am 15.11.2026 neu prüfen“) und Vorbehalt „geplant“ in Kopfzeile und Text.
- Stilregeln: Zahlen, Einheiten, Quellenverweise unverändert; keine neuen Beispiele oder Wertungen.

*Kein Freigabevermerk. Die Freigabe bleibt Sache von Daniel Saure nach Volltextlektüre.*
