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
