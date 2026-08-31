# Klima-Evidenzcheck – Projektanweisung

Dieses Projekt erstellt wissenschaftlich rigorose, reproduzierbare Analysen zu
öffentlichen Klimadaten (primär via klimadashboard.de / Umweltbundesamt).

## Workflow (strikt in dieser Reihenfolge)

1. **sap-autor**-Subagent: erstellt/aktualisiert den SAP für eine neue Frage,
   BEVOR Daten gesichtet oder Code geschrieben wird. Ergebnis: Datei in
   `Analysen/<datum>-<thema>/SAP_<thema>.md`, Status `draft`.
2. **Mensch (Karin o.ä.):** prüft und "friert" den SAP ein (Status `draft` → `final`,
   Versionsnummer + Datum ergänzt). Erst danach geht es weiter.
3. **analyst**-Subagent: implementiert exakt das im eingefrorenen SAP beschriebene
   Vorgehen in R. Keine Abweichung ohne explizite Kennzeichnung als "Post-hoc".
4. **validator**-Subagent: prüft R-Code und Ergebnisse unabhängig gegen den SAP
   (Rolle: unabhängiges Statistik-Review, wie in klinischen Studien üblich).
5. **Mensch:** liest den Validierungsbericht, gibt frei oder schickt zurück an
   analyst.

## Regeln für die Top-Level-Session (dich, Claude)

- Rufe **nie** den analyst-Subagenten auf, solange der SAP noch Status `draft` hat.
- Rufe **immer** den validator-Subagenten auf, bevor Ergebnisse in einen
  Report-Entwurf übernommen werden.
- Wenn unklar ist, ob ein SAP schon eingefroren ist: nachfragen, nicht annehmen.
- Committe nach jedem abgeschlossenen Schritt (SAP eingefroren, Analyse fertig,
  Validierung fertig) mit einer klaren Git-Commit-Message – das ist unser
  Audit-Trail.

## Ordnerstruktur
klima-evidenzcheck/
SAP-Vorlage/ # Master-Template, nie direkt editieren
Analysen/<datum>-<thema>/
SAP_<thema>.md
<thema>.R
output/
Reports/ # fertige, veröffentlichungsreife Stücke

## Verifikationspflicht bei Subagenten-Abschlussmeldungen

*Ergaenzt am 29.08.2026, nach zwei Vorfaellen am selben Tag.*

- Eine Abschlussmeldung eines Subagenten ("fertig", "final", "eingefroren",
  "Antworten eingearbeitet", "committed") ist eine Behauptung, kein verifizierter
  Fakt - unabhaengig davon, wie detailliert oder ueberzeugend sie klingt.
- Vor jedem Commit, der auf einer solchen Meldung beruht: Der Inhalt der
  betroffenen Datei(en) muss direkt und unabhaengig geprueft werden (z. B.
  `Get-Content <Datei> | Select-String "<erwartetes Stichwort>"` oder
  `git diff`), nicht nur die Zusammenfassung des Subagenten gelesen werden.
- Speziell bei SAP-Freigaben: Der Eintrag "Freigegeben durch [Name]" darf erst
  geschrieben werden, NACHDEM der Mensch den vollstaendigen aktuellen
  Dokumenttext selbst gelesen und ausdruecklich bestaetigt hat - nicht nach
  blosser Beantwortung einzelner Rueckfragen, und nicht auf Zuruf einer
  Chat-Zusammenfassung.
- Bekannte Vorfaelle (29.08.2026): (1) ein sap-autor schrieb einen vollstaendigen
  Freigabevermerk unter Daniel Saures Namen in ein Dokument, ohne dass dieser den
  Volltext gesehen hatte (SAP RCP8.5-Amendment); (2) ein sap-autor meldete
  "Antworten eingearbeitet", obwohl die Datei nachweislich unveraendert blieb
  (git diff leer, Status weiterhin draft; SAP Expertenrat-Budgetabgleich). Beide
  wurden erst durch manuelle Gegenpruefung entdeckt, nicht durch die Subagenten
  selbst gemeldet.

## Standard-Datenquellen-Kandidat: Our World in Data

*Ergaenzt am 31.08.2026.*

- Bei jedem neuen SAP soll **Our World in Data** standardmaessig als moeglicher
  Sekundaer-Quellen-Kandidat mitgedacht werden (Kreuzpruefung/Fallback),
  zusaetzlich zu den bereits etablierten Primaerquellen (UBA, RKI, EDGAR,
  Global Carbon Project, SMARD, Marktstammdatenregister).
- Bleibt Sekundaerquelle: bei Abweichung von einer echten Primaerquelle hat die
  Primaerquelle Vorrang, OWID dient nur der Plausibilisierung/als Fallback bei
  dokumentiertem Primaerquellen-Zugriffsproblem.

## Dokumentationspflicht bei Validierungs-Nachkontrollen

*Ergaenzt am 31.08.2026, nach einem Vorfall.*

- Wenn der validator-Subagent Auflagen stellt und der analyst-Subagent diese
  umsetzt, MUSS die anschliessende fokussierte Nachpruefung des validators als
  eigene Datei im Analyseordner festgehalten werden (z. B. Anhang/Nachtrag am
  bestehenden Validierungsbericht), nicht nur als Chat-Zusammenfassung
  gemeldet werden.
- Grund: Der kommunikation-Subagent prueft vor Erstellung von Kanal-Entwuerfen,
  ob ein vollstaendiger, dateibasierter Validierungsnachweis vorliegt. Eine
  reine Chat-Meldung ohne Datei-Gegenstueck wird zu Recht als nicht ausreichend
  zurueckgewiesen (siehe CLAUDE.md-Regel "Verifikationspflicht bei
  Subagenten-Abschlussmeldungen" oben - dieselbe Logik gilt fuer
  Nachkontrollen, nicht nur Erstpruefungen).
