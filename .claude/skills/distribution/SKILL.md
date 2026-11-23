---
name: distribution
description: Aus einem freigegebenen Substack-Artikel plattformgerechte Posts fuer WhatsApp, Instagram (inkl. Karussell) und Facebook erstellen, mit UTM-Links. Ausloeser: verteilen, Kanalposts, Social-Posts.
---

# Distribution

Eingang: freigegebener `substack.md` (Kopfvermerk FREIGEGEBEN) + Substack-URL (falls noch nicht da: Platzhalter `[BLOG-URL]`).

## Ablauf
1. Lies nur den Artikel. Waehle EINE Kernaussage + Kernzahl als gemeinsamen Hook.
2. Lies je Kanal die Referenzdatei in `references/` und erstelle in `Reports/<datum>-<slug>/kanal-entwuerfe/`:
   `whatsapp.md`, `instagram.md` (+ `assets/karussell.html`), `facebook.md`.
   Nur die Kanaele, die in `Redaktion/redaktion.md` fuer das Stueck vorgesehen sind (Standard: alle aktiven).
   LinkedIn ist seit 16.10.2026 eingestellt (Entscheidung Daniel Saure): keine `linkedin.md` mehr erstellen.
   `references/linkedin.md` bleibt nur als Archiv.
3. Links: `[BLOG-URL]?utm_source=<kanal>&utm_medium=social&utm_campaign=<slug>`.
4. Kopfvermerk in jeder Datei: `**ENTWURF – nicht veröffentlicht. Freigabe durch Daniel Saure erforderlich vor Publikation.**`
5. Antwort: je Kanal eine Zeile mit gewaehltem Hook.
6. PNG-Export (immer, durch die Hauptsession, weil der Subagent `kommunikation` keine Shell hat):
   `powershell -ExecutionPolicy Bypass -File .claude/skills/distribution/scripts/export_karussell.ps1 -Html <...>/assets/karussell.html`
   Das Skript erzeugt `assets/folie-1.png` bis `folie-N.png` (1080×1350). Folien brauchen dafür `id="folie-N"`.
   Danach jede PNG ansehen: Text darf nicht abgeschnitten sein und nicht ueber den Rand laufen. Bei Ueberlauf nur das Layout anpassen
   (z. B. Schriftgroesse), nie den Inhalt, dann neu exportieren. Facebook nutzt `folie-1.png`.

## Wissen (nur WhatsApp, seit 22.11.2026)
Die Stufe Wissen hat keinen Substack-Artikel und keine Instagram-/Facebook-Posts (Entscheidung Daniel Saure). Es entsteht nur `Reports/<datum>-<slug>/kanal-entwuerfe/whatsapp.md`:
- Der WhatsApp-Text ist hier das Original, nicht eine Kurzfassung. Alltagsfrage vorweg, kurze Antwort, 1–2 Erklaersaetze, Quellen-Link(s) (Primaerquelle) am Ende. Format nach `references/whatsapp.md` (Reihenzeile `*🌡️ Klima Kompass · Wissen:*`); da es keinen Artikel gibt, kein UTM-Link auf Substack, sondern Link zur Primaerquelle.
- Jede Zahl und Aussage muss einer serioesen Quelle zuordenbar sein; Quellen in einer Zeile oder in einer kurzen Begleitdatei `quellen.md` im selben Ordner (fuer den Faktencheck).
- Gate: `faktenpruefer` prueft `whatsapp.md` (statt `substack.md`) und schreibt `Faktencheck_<slug>.md`. Erst danach Freigabe durch Daniel, Posten nur nach OK.
- Themen, die mehr als ca. 80 Woerter brauchen, sind keine Wissen-Themen; dann als Einordnung/Evidenzcheck neu zuschneiden.

## Gemeinsame Regeln
- Keine neuen Zahlen, keine Aussage, die nicht im Artikel steht. Vereinfachen ja, verzerren nie.
- Unsicherheit mitnehmen, wenn sie im Artikel zentral ist.
- Reihenzeile beibehalten (Klima Kompass · Evidenzcheck/Einordnung/Wissen).
- Nichts veroeffentlichen. Posten erfolgt nur nach ausdruecklichem OK pro Post.
