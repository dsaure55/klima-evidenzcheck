---
name: blog-artikel
description: Substack-Artikel fuer Klima Kompass schreiben (Stufen Evidenzcheck, Einordnung, Wissen) mit Quellenpflicht und Freigabevermerk. Ausloeser: Blog, Artikel, Substack-Text, Beitrag schreiben.
---

# Blog-Artikel (Substack)

## Vorbedingungen
- Stufe steht in `Redaktion/redaktion.md` fest.
- Evidenzcheck: Validierungsbericht ohne „kritisch“ liegt als Datei vor. Sonst abbrechen.
- Einordnung: Nur Zahlen aus (a) veroeffentlichten eigenen Reports in `Reports/` oder (b) woertlich belegbaren Quellen. Braucht es mehr → abbrechen, als Evidenzcheck-Idee vorschlagen.
- Vor dem Volltext: Gliederung (Titel + Zwischenueberschriften + Kernzahl) zur Abstimmung vorlegen.

## Kopf (immer)
`**ENTWURF – nicht veröffentlicht. Freigabe durch Daniel Saure erforderlich vor Publikation.**`
Darunter die Reihenzeile: `Klima Kompass · Evidenzcheck #n` bzw. `Klima Kompass · Einordnung` bzw. `Klima Kompass · Wissen`.

## Struktur Evidenzcheck (bewaehrtes Format)
Titel als pruefbare Frage → Einleitung (Anlass mit Quelle) → Die Ergebnisse auf einen Blick (3–5 Punkte) → Hauptteil (Tabelle/Grafik) → Was diese Analyse nicht sagt → Methodik-Box (SAP-Link, Repo, Zenodo) → Quellen → Mehr erfahren.

## Struktur Einordnung (600–1000 Woerter)
Anlass (wer hat was behauptet, Link, Datum) → Die Frage dahinter → Was unsere Daten zeigen (Verweis auf eigenen Evidenzcheck mit Link) → Was die Daten nicht zeigen → Fazit in 2–3 Saetzen → Quellen.
Hinweiszeile: „Diese Einordnung nutzt bereits veroeffentlichte Ergebnisse; es wurde keine neue Analyse durchgefuehrt.“

## Struktur Wissen (500–900 Woerter)
Alltagsfrage als Titel → kurze Antwort vorweg → Erklaerung in 3–4 Abschnitten → haeufiger Irrtum vs. Befund → Quellen.

## Regeln
- Jede Zahl mit Quelle im Text oder in der Quellenliste. Unsicherheiten nennen, wo sie zentral sind.
- Zitate unter 15 Woertern, sonst paraphrasieren.
- Sachlich, keine Superlative ohne Beleg. Korrelation ≠ Kausalitaet benennen.
- Speichern: `Reports/<datum>-<slug>/kanal-entwuerfe/substack.md`. Danach Status in `Redaktion/redaktion.md` auf `entwurf`.
- Nach dem Entwurf: Gate ausloesen (validator bzw. faktenpruefer). Erst danach Daniel zur Freigabe vorlegen.
