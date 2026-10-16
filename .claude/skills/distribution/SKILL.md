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

## Gemeinsame Regeln
- Keine neuen Zahlen, keine Aussage, die nicht im Artikel steht. Vereinfachen ja, verzerren nie.
- Unsicherheit mitnehmen, wenn sie im Artikel zentral ist.
- Reihenzeile beibehalten (Klima Kompass · Evidenzcheck/Einordnung/Wissen).
- Nichts veroeffentlichen. Posten erfolgt nur nach ausdruecklichem OK pro Post.
