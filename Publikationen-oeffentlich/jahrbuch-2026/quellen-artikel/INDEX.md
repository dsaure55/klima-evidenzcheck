# Artikelsicherung Jahrbuch 2026

**Abruf:** 22.10.2026, lesend, öffentliche Substack-API (`/api/v1/archive`, `/api/v1/posts/<slug>`). Auf Substack wurde nichts geändert.
**Inhalt:** 16 Posts als HTML (`body_html`) mit Metadaten-Kommentar am Dateianfang. Alle `audience: everyone`, kein Paywall-Abbruch.
**Referenz:** Diese Dateien sind die veröffentlichte Fassung. Die Repo-Entwürfe in `Reports/` sind nur Arbeitsgrundlage.

## Abgleich Substack ↔ Repo

Methode: Wort-4-Gramme (Kleinschreibung, ohne HTML/Markdown-Syntax). „Sub in Repo“ = Anteil der Substack-Passagen, die auch in der Repo-Datei stehen. „Repo in Sub“ ist niedriger, weil die Repo-Dateien Kopfzeilen, Hinweise und Quellenblöcke enthalten, die nicht im Artikel stehen. Es ist ein Textvergleich, **keine** inhaltliche Prüfung. Unterschiede in Tabellen sind Formatierung (Zahlen kleben im HTML-Text aneinander).

| Post | Repo-Quelle | Sub in Repo | Befund |
|---|---|---|---|
| 27.8. THG-Trend 2040 | keine | – | **nur hier vorhanden** (vorher kein Artikeltext im Repo) |
| 29.8. Hitzesommer 2026 | keine | – | **nur hier vorhanden**; Untertitel auf Substack sagt „15.800“, Einordnung vom 17.10. nennt 16.000 (RKI-Stand KW37) – im Kapitel klären |
| 31.8. Trittbrettfahrer-Rechnung | `Reports/2026-08-trittbrettfahrer-rechnung/…/substack.md` | 98 % | deckungsgleich; Repo-Datei ist länger (interne Abschnitte) |
| 31.8. Batteriespeicher | `Reports/2026-08-batteriespeicher-dunkelflaute/…/substack.md` | 99 % | deckungsgleich; **Titel weicht ab** („eine Auswertung“ statt „eine eigene Auswertung“) |
| 11.9. Sommer 2026 normal | `Reports/2026-09-sommer-2026-normal/…/substack.md` | 94 % | Textkern gleich; Differenz = Tabellenformat |
| 14.9. 136 TWh | keine | – | **nur hier vorhanden** |
| 18.9. 65 Euro | `artikel_korrigiert_2026-10-17.html` | 100 % / 100 % | **identisch** zur korrigierten Fassung |
| 16.10. Monate über 1,5 Grad | `Reports/2026-10-16-el-nino-1-5-grad/…/substack.md` | 100 % | gleich |
| 16.10. Vorstellung | `Reports/2026-10-16-vorstellung/…/substack.md` | 100 % | gleich (Impressum-Zeile im Substack-Text prüfen) |
| 17.10. Gasspeicher 60 % | `Reports/2026-10-16-gasspeicher-60prozent/…/substack.md` | 100 % | gleich |
| 17.10. Hitze/Medien | `Reports/2026-10-17-klimaberichterstattung-hitze/…/substack.md` | 98 % | gleich; Differenz = Tabellenformat |
| 17.10. CO₂-Preis 2027 | `Reports/2026-10-17-co2-preis-2027/…/substack.md` | 93 % | **Korrektur ist auf Substack umgesetzt** (Titel „Bundestag friert … ein“, Hinweis „Aktualisiert am 22.10.2026“, Bundesrat); Differenz = Hinweisblock + Tabellenformat. Damit ist die offene Gegenprüfung aus `korrektur_2026-10-22.md` für Titel und Hinweis erledigt; Satz-für-Satz-Vergleich der Änderungen steht noch aus |
| 18.10. CO₂-Entnahme | `Reports/2026-10-18-co2-entnahme/…/substack.md` | 98 % | gleich |
| 19.10. COP31 | `Reports/2026-10-19-cop31-trittbrettfahrer/…/substack.md` | 100 % | gleich |
| 20.10. KfW 6 Billionen | `Reports/2026-10-20-kfw-6-billionen/…/substack.md` | 100 % | gleich; Substack-Untertitel = erster Absatz des Textes (abgeschnitten, vgl. Pipeline-Notiz) |
| 21.10. Emissions Gap | `Reports/2026-10-21-emissions-gap-2026/…/substack.md` | 100 % | gleich |

## Grafiken im Post (Bilder auf Substack)

Nur 6 Posts enthalten Bilder: THG-Trend 2040 (1), Batteriespeicher (1), Trittbrettfahrer (3), Sommer 2026 (1), 136 TWh (1), 65 Euro (3). Die Einordnungs- und Wissensstücke vom Oktober haben keine eingebetteten Bilder. Bilddateien wurden nicht heruntergeladen; Bildquelle je Kapitel klären (`Analysen/*/output/` oder Substack-CDN).

## Offen

- Satz-für-Satz-Abgleich der 22.10.-Änderungen im CO₂-Preis-Post gegen `korrektur_2026-10-22.md` (bei der Differenzprüfung Kapitel 3).
- Batteriespeicher: Titelabweichung Repo/Substack im Kapitel mit dem Substack-Titel führen.
- Hitzesommer 29.8.: Zahlenbasis 15.800 gegen 16.000 in Kapitel 1 klären (vermutlich anderer RKI-Stand, nicht geprüft).
