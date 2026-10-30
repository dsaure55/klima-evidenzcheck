# Nachprüfung 2 (Anhang zu `faktencheck.md`)

**Geprüfter Text:** `Reports/2026-10-30-ausbaupfad/kanal-entwuerfe/substack.md`, Fassung „ENTWURF v3 (30.10.2026)". Zeilenangaben (Z. n) beziehen sich auf diese v3-Datei.
**Geprüft von:** faktenpruefer-Subagent, unabhängig, 30.10.2026. Der Artikel wurde nicht verändert. Dieser Abschnitt enthält keinen Freigabevermerk.
**Hinweis zur Ablage:** Dem Prüfer stand kein Anfüge-Werkzeug zur Verfügung. Ein Überschreiben der 414 Zeilen von `faktencheck.md` hätte das Risiko von Abschreibfehlern in einem Prüfnachweis erzeugt. Dieser Abschnitt steht deshalb als eigene Datei neben `faktencheck.md` und gehört inhaltlich als „Nachprüfung 2" dorthin.
**Gelesen bzw. geöffnet:** v3-Artikel, `faktencheck.md` (inkl. Nachprüfung 1, R-1 bis R-24), `Analysen/2026-10-ausbaupfad-wind-solar/output/tabelle4_sensitivitaeten_S1_S2_S6_S7.csv`, `Nachtrag_Zweitquelle_ausbaupfad-wind-solar.md`, `Abweichungsprotokoll_ausbaupfad-wind-solar.md`, GitHub-Verzeichnis (30.10.2026, erneut).
**Nicht erneut geöffnet:** Analysebericht, `diagnostik_*.csv`, `voll_tabelle3_primaer.csv`, Grafikdateien, Energy-Charts-API, gesetze-im-internet.de. Werte daraus stützen sich auf die Bestätigungen in Erstprüfung und Nachprüfung 1 (jeweils genannt).

## 5.1 Gesamturteil Nachprüfung 2

**Abweichungen, inhaltlich nahe an der Veröffentlichungsreife; offen sind vor allem drei bewusst vermerkte Aufgaben und ein Block niedriger Textreste. 0 kritisch, 1 hoch (Aufgabe R-1), 3 mittel (davon 2 vermerkte Aufgaben), 15 niedrig.**

- Von R-1 bis R-9 sind **R-2, R-7, R-8, R-9 umgesetzt**, **R-3 und R-4 teilweise**, **R-5 offen**, **R-1 und R-6 sind als Aufgabe im Kopf vermerkt** (nicht erledigt). Die KI-Offenlegung (Teil von R-4) ist ebenfalls als Entscheidung vermerkt.
- **Keine falsche Zahl** gefunden. Eine Rundungsabweichung bei „64 %" (niedrig, N2-1).
- **Keine neue Methode.** Eine abgeleitete Prozentangabe (Netto-Zeile „etwa 65 / 64 / 56 %") ist neu, rechnerisch von der gleichen Art wie die bereits akzeptierte Brutto-Zeile; sie steht nicht in der CSV und ist im Text nicht als abgeleitet gekennzeichnet.
- Der Aufgabenvermerk im Kopf ist vollständig und passt zum Befund (Push, PNG, KI). Der Kopf nennt „Nachprüfung 2 steht aus" und ist nach dieser Prüfung vor Veröffentlichung ohnehin zu entfernen.

## 5.2 Status R-1 bis R-24

| Rest | Schwere (vorher) | Status v3 | Fundstelle v3 | Anmerkung |
|---|---|---|---|---|
| R-1 Push von Nachtrag und Freigabe | hoch | **offen, als Aufgabe vermerkt** | Kopf Punkt (1), Z. 103 | GitHub-Verzeichnis (30.10.2026): SAP, Analysebericht, Abweichungsprotokoll, Validierungsbericht, Skript, Log, `output`, `rohdaten`, `.gitignore`. Weder Nachtrag noch Freigabe-Datei sichtbar (Seite zeigt „View all files"). Ohne Push läuft [5] für den Nachtrag ins Leere. Nach dem Push Link öffnen und gegenlesen. |
| R-2 Solar brutto/netto nebeneinander | mittel | **umgesetzt** (Rest niedrig) | Z. 57 bis 61, 67 | Tabelle hat jetzt Zeile „Solar, netto" (23,0; 14,9 / 14,8 / 12,8). Z. 67 sagt „Solar (brutto)". Grafik 2: Unterschrift nennt Bruttoleistung und „rund 11 Prozent tiefer". Z. 43 „bei Solar" ohne Größe; die Aussage gilt in der CSV auch für netto (alle S6-Zeilen „oberhalb"), ist also nicht falsch. |
| R-3 Felddokumentation | mittel | **teilweise** | Z. 27 | Neu: „Welche Größe näher am Begriff … liegt, haben wir nicht geprüft." Weiter „Felddokumentation des Registers" (gemeint: des Datenexports); die externe Hilfeseite (SAP 3.3) wird nicht als ungeprüft genannt. |
| R-4 Testlauf, KI | mittel | **teilweise** | Z. 95, Kopf (3) | Ergänzt: „Logtexte", „Protokoll des Testlaufs … überschrieben", „kein Commit davor". Fehlt nur der Begriff `unname`-Aufrufe (bedeutungslos für Leser). „Nach den Angaben der Bearbeitung" bleibt unscharf; KI-Offenlegung als Entscheidung vermerkt. |
| R-5 Lücken der Zweitquelle | mittel | **offen** | Z. 87 bis 89 | Nicht gesagt: Energy-Charts ist die einzige Zweitquelle (BNetzA und OWID nicht abgeglichen); DC/AC-Zuordnung nicht im Original geprüft; Energy-Charts schreibt rückwirkend fort. Siehe N2-5. |
| R-6 Grafiken (PNG, Prüfvermerk) | mittel | **offen, als Aufgabe vermerkt**; Prüfvermerk in der Unterschrift **entfernt** | Kopf (2), Z. 47, 51 | Der Redaktionssatz fehlt jetzt in Z. 47. Die PNG-Dateien (Titel „Paragraf 4 EEG", „Verlaengerung", „Prognoseband", „T_S1") sind nicht neu erzeugt (Abweichungsprotokoll 6 und 7 bestätigt: Neulauf nötig). Hinweis „Bänder bei 24/60 Monaten zu eng" fehlt in den Unterschriften. |
| R-7 „Gegenprobe" doppelt, 23,0 | mittel | **umgesetzt** | Z. 14, 27, 61, 85 bis 89 | „Gegenprobe" steht nur noch für Energy-Charts (Überschrift Z. 85, Z. 89). Die Netto-Rechnung heißt „zweite Rechnung" (Z. 27). **Korrektur zu Nachprüfung 1:** 23,0 GW steht nicht nur im Nachtrag, sondern auch in `tabelle4_…S6…csv` (Spalte `R_GW_jahr` = 23, alle drei Fenster). Ob der Validierungsbericht S6-R abdeckt, habe ich in dieser Nachprüfung nicht erneut geprüft. |
| R-8 „Netto" doppelt belegt | mittel | **umgesetzt** | Z. 63 | Formulierung jetzt „Zieht man vom Zubau die Stilllegungen ab … bei Solar (brutto) 17,9 / 17,3 / 14,0". Das Wort „Netto-Zubau" kommt nicht mehr vor. Zahlen gegen `tabelle4` (S7b, `N_GW_jahr`) bestätigt. |
| R-9 „rund fünf Monate früher" | mittel | **umgesetzt** | Z. 87 | Monatsdifferenz gestrichen. Ersatz siehe N2-6. |
| R-10 „Bestand steht" / „standen im Register" | niedrig | offen | Z. 7, 11 | unverändert; Z. 29 erklärt den Endmonat. |
| R-11 „bis 2060" unerklärt | niedrig | offen | Z. 71 | unverändert. |
| R-12 Titel „der letzten Monate" | niedrig | offen | Z. 5, 7 | unverändert; passt nicht zum 60-Monats-Fenster. |
| R-13 Vorwissen („näher am Pfad als Wind", Quelle) | niedrig | offen | Z. 95 | unverändert. |
| R-14 Richtung der Unsicherheit | niedrig | offen | Z. 81 | unverändert („verändern"). |
| R-15 Lizenzform, Bearbeitungsvermerk | niedrig | offen | Quelle [3] | unverändert („Datenlizenz Deutschland, Namensnennung, Version 2.0"). |
| R-16 „Datenformat" | niedrig | offen | Z. 93 | unverändert („neun Hinweise zum Datenformat"). |
| R-17 „oft/noch nicht vollständig gemeldet" | niedrig | **teilweise** | Z. 29 | „oft" ist jetzt „teils" (wie SAP). „Die letzten drei Monate sind noch nicht vollständig gemeldet" bleibt als Befundton; die Einschränkung, dass auch Juli unterzählt sein kann, steht nur sinngemäß in Z. 81. |
| R-18 „robusteren Verfahren" | niedrig | **umgesetzt** | Z. 79 | „Zusatzrechnungen (Newey-West und Block-Bootstrap)". |
| R-19 Z. 14 „Zubau" | niedrig | **umgesetzt** | Z. 14 | „Die Geraden der Fenster ergeben bei Wind 3,0 bis 4,7 GW pro Jahr …". |
| R-20 Wind auf See „zu eng" | niedrig | **umgesetzt** | Z. 71 | „zu eng" ist ersetzt durch den Messwert (Durbin-Watson 0,11 bis 0,81). Jahre je Fenster bleiben; „bis 2060" siehe R-11. |
| R-21 Solar 2026 Größe und Werte | niedrig | **teilweise** | Z. 67 | Größe „(brutto)" ergänzt. Werte der Geraden (130,5 bis 135,0 GW) fehlen weiter. |
| R-22 Intervall-Erklärung, Werte 2030 | niedrig | offen | Z. 35, 43 | unverändert; „95-Prozent" unerklärt, Werte am 31.12.2030 fehlen. |
| R-23 „darunter", „2,7", Nachtragsvorbehalt | niedrig | offen | Z. 87 | unverändert; siehe N2-5. |
| R-24 wie R-3 | niedrig | teilweise | Z. 27 | siehe R-3. |

Zählung: umgesetzt 7 (R-2, R-7, R-8, R-9, R-18, R-19, R-20), als Aufgabe vermerkt 2 (R-1, R-6), teilweise 5 (R-3, R-4, R-17, R-21, R-24), offen 10 (R-5, R-10 bis R-16, R-22, R-23).

## 5.3 Prüfung der neuen und geänderten Aussagen in v3

| # | Behauptung in v3 (Z.) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Solar, netto: 23,0 GW; 14,9 / 14,8 / 12,8 GW" (Z. 61) | `tabelle4`, S6 Solar: `R_GW_jahr` 23; `b_GW_jahr` 14,9 / 14,8 / 12,8 | bestätigt | Gleiche Werte im Nachtrag (R 23,0; Steigungen 14,85 / 14,84 / 12,83). |
| 2 | „etwa 65 / 64 / 56 %" (Z. 61) | berechnet; CSV führt nur `anteil_sW_an_R` = 0,6 (gerundet) | **Abweichung (niedrig)** | Mit den gerundeten CSV-Werten: 14,9/23,0 = 64,8; 14,8/23,0 = 64,3; 12,8/23,0 = 55,7, also 65 / 64 / 56. Mit den ungerundeten Nachtragswerten (Steigung 14,85 / 14,84 / 12,83, R = (215 − 113,534) / (53/12) = 22,97): 64,6 / 64,6 / 55,9, also **65 / 65 / 56**. Die mittlere Zahl hängt von der Rundung ab. Die Prozentwerte stehen in keiner Quelle, sie sind abgeleitet; der Artikel kennzeichnet das nur durch „etwa". Brutto-Zeile (87 / 87 / 75) stammt aus `anteil_sW_an_R` des Berichts und ist anders gestellt. Vorschlag: „etwa 65 / 65 / 56 %" und in einem Halbsatz sagen, dass die Prozente aus Steigung und Bedarf berechnet sind. |
| 3 | „12,8 bis 14,9 GW (netto)" (Z. 14) | `tabelle4` S6 `b_GW_jahr` | bestätigt | |
| 4 | Brutto im selben Satz „14,8 bis 17,2 GW" (Z. 14) | `tabelle4` S7b `b_GW_jahr` 17,2 / 17,2 / 14,8 | bestätigt | |
| 5 | „23,0 GW (netto)" nötig pro Jahr (Z. 14, 55) | `tabelle4` S6 `R_GW_jahr` | bestätigt | siehe R-7. |
| 6 | Zubau nach Abzug der Stilllegungen, Solar brutto 17,9 / 17,3 / 14,0 (Z. 63) | `tabelle4` S7b `N_GW_jahr` | bestätigt | |
| 7 | „Durbin-Watson-Wert 0,11 bis 0,81" (Wind auf See, Z. 71) | Bericht Abschn. 5 und 7 (E5: 0,81 / 0,13 / 0,11), bestätigt in Nachprüfung 1 (4.3 Nr. 16) | bestätigt (nicht erneut geöffnet) | „Auch hier hängen die Abweichungen von der Geraden stark zusammen" ist die Lesart der Werte, bei 0,81 (12 Monate) schwächer als bei 0,11. Die Aussage ist im Bericht für E5 nicht ausdrücklich getroffen; sie folgt aus dem Messwert. Niedrig. |
| 8 | „Werte weit unter 2 zeigen starke Abhängigkeit" (Z. 79) | allgemeines statistisches Wissen (Durbin-Watson ≈ 2: keine Autokorrelation erster Ordnung; Werte deutlich unter 2: positive Autokorrelation) | bestätigt (nicht quellengebunden) | Sachlich richtig, steht aber weder in Bericht noch SAP. „Abhängigkeit" meint Abhängigkeit aufeinanderfolgender Abweichungen, im Satz davor steht „hängen eng zusammen". Solar F24 (1,09) ist nicht „weit unter 2"; der Artikel nennt sie in der Klammer getrennt. Keine neue Inferenz. |
| 9 | „Durbin-Watson … zwischen 0,02 und 0,47 (bei Solar mit 24 Monaten bei 1,09)" (Z. 79) | Bericht Abschn. 7; Nachprüfung 1 | bestätigt | |
| 10 | „Energy-Charts führt Solar in zwei Größen, als Gleichstromleistung (DC) und als Wechselstromleistung (AC)." (Z. 87) | Nachtrag Abschn. 2 (Schema: „Solar DC", „Solar AC") | bestätigt | Neutral formuliert: keine Definition behauptet, keine Zuordnung zu Modul- oder Wechselrichterleistung. Das ist die richtige Vorsicht (Definition laut Nachtrag Abschn. 2 und 6 nicht aus Originaldokumentation belegt). |
| 11 | „Bei der Bruttoleistung stimmen die Zeitpunkte mit unseren überein." (Z. 87) | Nachtrag Abschn. 5: Solar DC gegen MaStR brutto 08/2031, 08/2031, 09/2032, beide gleich | bestätigt (Zahl), **Abweichung (niedrig, Form)** | Energy-Charts hat keine „Bruttoleistung"; gemeint ist DC. Der Satz setzt DC = Brutto stillschweigend voraus. Der Nachtrag nennt das „Muster in den Zahlen, keine dokumentierte Definition". Der Nachsatz fehlt. Außerdem „Zeitpunkte … überein" suggeriert Monatsgleichheit; sie gilt für Solar DC in allen drei Fenstern. |
| 12 | „Bei der Wechselstromleistung liegen sie ebenfalls zwischen 2033 und 2034, wie bei unserer Nettonennleistung." (Z. 87) | Nachtrag Abschn. 5: AC 01/2033, 01/2033, 04/2034; MaStR netto (S6) 06/2033, 06/2033, 09/2034 | bestätigt | Beide Reihen liegen in den Jahren 2033 bis 2034. Die Monate unterscheiden sich um je 5 Monate; der Artikel nennt das nicht mehr. Die Körnung wechselt aber: der Satz davor (Brutto) meint Monatsgleichheit, dieser Satz nur das Jahr. Zusammen ergibt das keinen Fehler, aber ein Leser kann „ebenfalls" als „ebenfalls monatsgleich" lesen. Vorschlag: „Bei der Gleichstromleistung stimmen die Erreichungsjahre mit unserer Bruttoleistung überein (2031 bis 2032), bei der Wechselstromleistung mit unserer Nettonennleistung (2033 bis 2034)." |
| 13 | „Wechselstromleistung liegt 8 bis 9 Prozent darunter und 2,7 Prozent über unserer Nettonennleistung" (Z. 87) | Nachtrag Abschn. 4: AC −8,25 bis −9,07 % (gegen brutto), +2,71 bis +2,75 % (gegen netto) | bestätigt | „darunter" ohne Bezugsgröße (gegen die Bruttoleistung); „2,7" gilt für zwei von vier Monaten, die anderen 2,74 / 2,75 (also rund 2,7 bis 2,8). Niedrig (R-23 bleibt). |
| 14 | „Das ist vermutlich keine unabhängige Bestätigung … Belegt haben wir das nicht." (Z. 89) | Nachtrag Abschn. 3 („Indiz, kein Beleg") | bestätigt | |
| 15 | „Die Gegenprobe haben wir nach der unabhängigen Prüfung nachgeholt, sie ist daher nicht Teil dieser Prüfung." (Z. 89) | Nachtrag Kopf („Post-hoc, nach Validierung") | bestätigt | Gilt für Energy-Charts. Die Netto-Rechnung (S6) ist Teil des Berichts. |
| 16 | „Das Protokoll des Testlaufs wurde beim Endlauf überschrieben, und vor dem Testlauf gibt es keinen Commit." (Z. 95) | Abweichungsprotokoll Abschn. 6 („Skriptversion … und das Log des Testlaufs sind nicht erhalten. Der Endlauf hat `run_log.txt` und `output/` überschrieben, und vor dem Testlauf gibt es keinen Commit.") | bestätigt | Wortlaut deckt sich. Das Abweichungsprotokoll sagt „Log des Testlaufs nicht erhalten" und „Endlauf hat run_log.txt überschrieben"; die Gleichsetzung „Protokoll des Testlaufs = überschriebenes run_log.txt" ist eine leichte Zusammenziehung, im Sinn aber gedeckt. |
| 17 | „Nach den Angaben der Bearbeitung wurden nach Sichtung der Zwischenergebnisse nur Darstellung, Beschriftungen und Logtexte geändert." (Z. 95) | Abweichungsprotokoll Abschn. 4 und 6 („Darstellung, Logtexte, Beschriftungen und `unname`-Aufrufe", „nicht verifizierbar") | bestätigt (Kern), teilweise | `unname`-Aufrufe fehlen, für den Leser belanglos. „Bearbeitung" ist ein unklarer Sammelbegriff für den analyst-Subagenten (KI). Die Entscheidung über die Offenlegung liegt bei Daniel Saure (Kopf Punkt 3). |
| 18 | „Außerdem gab es vor dem Endlauf einen Testlauf, dessen Skriptversion nicht erhalten ist." (Z. 95) | Abweichungsprotokoll Abschn. 6 | bestätigt | |
| 19 | „Die Intervalle bei den langen Fenstern zu eng … Werte nennen wir nur als Spanne" (Z. 15, 43) | Erst- und Nachprüfung 1 | bestätigt | |
| 20 | Quelle [5] nennt „… und Nachtrag Zweitquelle" (Z. 103) | GitHub-Verzeichnis | **Abweichung (hoch, Aufgabe R-1)** | siehe R-1. Im Kopf als Aufgabe vermerkt, solange nicht gepusht, bleibt der Verweis unbelegbar. |

## 5.4 Neue Aussagen ohne Beleg oder als Folgerung

Keine neue Berechnung im Sinn einer neuen Methode. Abgeleitet und so in keiner Quelle stehend:
1. „etwa 65 / 64 / 56 %" (Z. 61): Quotient aus Steigung und Bedarf (N2-1, Zeile 2 oben).
2. „Werte weit unter 2 zeigen starke Abhängigkeit" (Z. 79): Lehrbuchwissen, keine Inferenz über die Daten.
3. „Auch hier hängen die Abweichungen von der Geraden stark zusammen" (Z. 71): Lesart der DW-Werte bei Wind auf See; im Bericht nicht ausdrücklich.

Alle drei bleiben unter der Schwelle „neue Inferenz" (Stufe Einordnung); Punkt 1 ist die Grenzfall-Rechnung (reine Division zweier berichteter Zahlen).

## 5.5 Bewertung der Formulierung zu DC und AC

Die Formulierung „Energy-Charts führt Solar in zwei Größen, als Gleichstromleistung (DC) und als Wechselstromleistung (AC)" ist **neutral genug**: sie benennt nur die zwei Reihen und behauptet keine Definition. Die Neutralität wird aber durch zwei Nachbarsätze wieder untergraben:
- „Bei der Bruttoleistung stimmen die Zeitpunkte mit unseren überein" und „ebenfalls … wie bei unserer Nettonennleistung" ordnen DC der Brutto- und AC der Nettonennleistung zu, ohne den Vorbehalt des Nachtrags („Muster in den Zahlen, keine dokumentierte Definition").
- Vorschlag (kein Eingriff in den Artikel): „Welche Leistungsgröße hinter den beiden Reihen steckt, haben wir nicht im Original geprüft. Die Zahlen passen aber zu unserer Bruttoleistung (Gleichstrom) und, mit 2,7 Prozent Abstand, zu unserer Nettonennleistung (Wechselstrom)."

## 5.6 Was bleibt offen (nach Schwere)

**Hoch (Aufgabe, bewusst vermerkt):**
- R-1: Analyseordner inklusive Nachtrag Zweitquelle und Freigabedatei auf GitHub pushen, dann [5] öffnen. Stand 30.10.2026: nicht im Verzeichnis sichtbar.

**Mittel:**
- R-6 (Aufgabe, vermerkt): PNG-Grafiken neu erzeugen („§ 4 EEG", Umlaute, „Prognoseband" ersetzen, „T_S1" entfernen); Hinweis auf zu enge Bänder (24/60 Monate) in den Grafiken ergänzen.
- KI-Offenlegung (Aufgabe, vermerkt): Entscheidung Daniel Saure; bis dahin lesen sich „Bearbeitung", „Prüfung", „unabhängig" wie menschliche Akteure.
- R-5 (Text, offen): einzige Zweitquelle Energy-Charts; BNetzA/OWID nicht verglichen; DC/AC-Zuordnung ungeprüft; Energy-Charts schreibt rückwirkend fort.

**Niedrig (15):**
- Teil- und Restpunkte: R-3 / R-24 (Hilfeseite ungeprüft), R-17 (Juli-Vorbehalt), R-21 (Solar-2026-Werte).
- Offen: R-10, R-11, R-12, R-13, R-14, R-15, R-16, R-22, R-23.
- Neu: N2-1 (Rundung „64 %" statt 65), N2-5 (DC = Brutto, AC = Netto implizit), N2-6 (wechselnde Körnung Monat/Jahr bei „stimmen überein" und „ebenfalls zwischen 2033 und 2034").

**Weitere Hinweise, keine Faktenfehler:**
- Kopf (Z. 1) ist vor Veröffentlichung zu entfernen; Reihenzeile (Z. 3) trägt keine Nummer „#n" (nicht prüfbar, Skill/CLAUDE.md fordert „Evidenzcheck #n").
- Stil: Fachwörter „Newey-West", „Block-Bootstrap", „95-Prozent-Prognoseintervall" unerklärt; viele Satzanfänge „Wir"; Pflichtvorbehalte als Gegensatzformeln. Siehe 4.6.

## 5.7 Nicht geprüft in Nachprüfung 2

- Analysebericht, `diagnostik_*.csv`, `voll_tabelle3_primaer.csv` und Grafikdateien wurden nicht neu geöffnet; DW-Werte (Wind auf See und lange Fenster) und die Brutto-Anteile stützen sich auf die Bestätigung in Nachprüfung 1.
- Energy-Charts-API und gesetze-im-internet.de wurden nicht erneut abgerufen.
- Ob der Validierungsbericht S6-R (23,0) abdeckt.
- Inhalt der Unterordner `output/` und `rohdaten/` auf GitHub; „View all files" bleibt unklar.
- Lizenztext dl-de/by-2-0 und Energy-Charts-Lizenz.

**Gesamturteil Nachprüfung 2: Abweichungen. 0 kritisch, 1 hoch (Aufgabe), 3 mittel (2 Aufgaben), 15 niedrig.** Dieses Dokument enthält keinen Freigabevermerk. Die Freigabe liegt bei Daniel Saure nach Volltextlektüre des endgültigen Textes.
