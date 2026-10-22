# Verblindete Datensicherung PEGELONLINE (vor Einfrieren des SAP)

- **Erlaubt durch:** Daniel Saure, Chat 19.10.2026: „Ja, verblindete Sicherung der PEGELONLINE-Daten vor dem Einfrieren ist erlaubt (nur speichern + Prüfsumme, nicht öffnen).“
- **Anlass:** SAP Rhein-Niedrigwasser v0.1 (draft), Abschnitt 13, Frage 2. PEGELONLINE stellt nur ein begrenztes Zeitfenster bereit; die Werte um den 01.10.2026 könnten vor dem Einfrieren herausfallen.
- **Durchgeführt von:** Top-Level-Session (Claude), nicht vom analyst-Subagenten.
- **Abrufzeit (UTC):** siehe `ABRUFZEIT_UTC.txt` (2026-10-19T08:16:33Z)
- **API:** `https://www.pegelonline.wsv.de/webservices/rest-api/v2/stations/<uuid>/<Q|W>/measurements.json?start=2026-08-01T00:00:00+02:00` (geliefert wird nur, was im Fenster des Dienstes verfügbar ist)

| Datei | Station (uuid) | Zeitreihe | HTTP | Bytes |
|---|---|---|---|---|
| KAUB_Q_measurements.json | KAUB, km 546.23 (1d26e504-7f9e-480a-b52c-5932be6549ab) | Q, ABFLUSS_ROHDATEN, m³/s, 15 min | 200 | 222816 |
| KAUB_W_measurements.json | KAUB | W, WASSERSTAND ROHDATEN, cm | 200 | 218516 |
| KOELN_Q_measurements.json | KÖLN, km 688.0 (a6ee8177-107b-47dd-bcfd-30960ccc6e9c) | Q, ABFLUSS_ROHDATEN | 200 | 139788 |
| KOELN_W_measurements.json | KÖLN | W, WASSERSTAND ROHDATEN | 200 | 219951 |
| EMMERICH_Q_measurements.json | EMMERICH, km 851.9 (9598e4cb-0849-401e-bba0-689234b27644) | Q, ABFLUSS_ROHDATEN | 200 | 11694 |
| EMMERICH_W_measurements.json | EMMERICH | W, WASSERSTAND ROHDATEN | 200 | 217318 |

Prüfsummen: `SHA256SUMS.txt`.

**Verblindung:** Die Messdateien wurden nicht geöffnet, nicht gelesen und nicht ausgewertet. Eingesehen wurden nur Stationsmetadaten (uuid, Name, km, Liste der Zeitreihen mit Einheit), HTTP-Status und Dateigröße.

**Hinweise für analyst/validator (nach dem Einfrieren):**
- Unterschiedliche Dateigrößen (Köln Q, Emmerich Q deutlich kleiner) deuten auf kürzere Zeitfenster oder Lücken hin; erst nach dem Einfrieren prüfen.
- Lobith ist keine PEGELONLINE-Station; Emmerich (nahe Lobith) wurde zusätzlich gesichert. Ob Emmerich im SAP eine Rolle spielt, entscheidet der eingefrorene SAP.
- PEGELONLINE meldet km 546.23 für Kaub (SAP-Entwurf nennt 546,3 „nach Kenntnisstand“).
- Vor Nutzung Prüfsummen gegen `SHA256SUMS.txt` verifizieren.
