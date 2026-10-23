# Faktencheck Kapitel 5 (Jahrbuch 2026): „Ist Deutschland ‚zu klein, um zu zählen‘?“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/05-zu-klein.md` (Entwurf v0.1, 23.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 80 ist nicht Buchtext).
**Geprüfte Grafiken:** `grafiken/kap05_grafik1_konzentrationskurve.png`, `grafiken/kap05_grafik2_varianten.png` (als Bilder gelesen) und `grafiken/kap05_grafiken.R`.
**Prüfdatum:** 23.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5: volle Faktencheck-Datei für „Kurz gesagt“, „Was heißt das für dich?“, „Lagen wir richtig?“; Differenzprüfung für den Haupttext. Regel: keine neue Berechnung, keine neue Inferenz; der Stil darf nichts verändern, verstärken oder abschwächen (`stilregeln.md`).
**Stufe der Ausgangsstücke:** [1] ist ein Evidenzcheck (SAP v1.0 eingefroren 31.08.2026, Validierung mit Nachkontrolle „FREIGABE“), [2] eine Einordnung (Faktencheck `Reports/2026-10-19-cop31-trittbrettfahrer/faktencheck.md`, Endstand „ok, keine Restauflagen“).

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| [1] „Die Trittbrettfahrer-Rechnung …“, Referenzfassung `quellen-artikel/2026-08-31_die-trittbrettfahrer-rechnung-was.html` (Abruf 22.10.2026) | gelesen (vollständig) | Abgleich vollständig; keine Korrektur- oder Aktualisierungsnotiz in der Referenzfassung |
| [2] „COP31: Ist Deutschland ‚zu klein, um zu zählen‘?“, Referenzfassung `quellen-artikel/2026-10-19_cop31-ist-deutschland-zu-klein-um.html` | gelesen (vollständig) | Abgleich vollständig |
| `Analysen/2026-08-trittbrettfahrer-rechnung/output/`: `estimand1a_konzentrationskurve_edgar_2024.csv` (Zeilen 1–30 und 200–210), `estimand2_kernzahlen.csv`, `estimand3_pro_kopf.csv`, `sensitivitaeten_1_2_3.csv`, `sensitivitaet4_rank_sensitivity.csv` | gelesen | 208 Länder (Rang 208, kumuliert 1); Rang 12 = DEU, Anteil 1,3007 %, kumuliert 69,64 %; kumuliert bis Rang 11 = 68,34 %; Kernzahlen 1,3/12/208/31,7 und 5,3/4/214/53,1; Pro-Kopf 14,2 % (Welt), 21,0 % (Teilmenge, Rang 8 von 58); S1 1,5/30,1; S2 2,1/40,5; S3 3,5/54,0; Rangplatz-Tabelle 30,0/41,4/69,6/79,5/86,0 und 24,2/24,2/52,1/75,4/85,1 |
| `run_log.txt` (Analyselauf 31.08.2026) | gelesen (vollständig) | 1,3007 %, Rang 12 von 208, 197 von 208 Ländern ≤ DE; OWID-Abweichung 0,089 Punkte; Pro-Kopf 8,07/6,36, 58 von 195; Weltsumme = Summe der 208 Länder, ohne internationalen Luft- und Seeverkehr (2,62 % der Ländersumme) |
| `Validierungsbericht.md` (Erstprüfung) und `Validierungsbericht_Nachkontrolle.md` | gelesen (vollständig) | Konverter-Fehler betraf 2b, S2, S3, S4 (2b-Teil); Nachkontrolle „FREIGABE“; 35,3 % (falsch), 59,1 % (Teilkorrektur), 53,1 % (final) |
| `rohdaten/DATENAUFBEREITUNG_LOG.txt` (Zeilen 1–80) | gelesen (Anfang) | Konverter-Korrektur dokumentiert; EDGAR „2025 GHG booklet“ mit URL |
| `Reports/2026-10-19-cop31-trittbrettfahrer/faktencheck.md` | gelesen (vollständig) | Frühere Prüfung von [2]; entfernte Inferenzen („vor allem …“, „bliebe unberührt“, „kaum“, „häufig“, „meist“) |
| GitHub `Analysen/2026-08-trittbrettfahrer-rechnung` (Commit-Liste) | WebFetch 23.10.2026 | letzter Commit 31.08.2026 („Substack-Entwurf überarbeitet“); danach keine Änderung |
| Quelle [3] Helmholtz-Klima-Initiative | WebFetch 23.10.2026 | Titel stimmt; „zuletzt aktualisiert: April 2021“; „Alle CO2-Angaben … beziehen sich … auf das Jahr 2017“; Zwei-Prozent-Rechnung formuliert über Treibhausgas-Emissionen (Welt: „deutlich über 35 Milliarden Tonnen“), Datenjahr dort nicht angegeben |
| Quelle [4] WirtschaftsWoche | WebFetch 23.10.2026 | Titel und Datum 24.02.2026 stimmen; CO₂ 2024: „Anteil von 1,46 Prozent“ (579,9 Mt, EDGAR); THG 2024: „globalen Anteil von 1,27 Prozent“ (0,67 Gt CO₂-Äq.) |
| Quelle [6] UNFCCC Overview Schedule (PDF) | WebFetch 23.10.2026 | „UN Climate Change Conference - Antalya“, sessional period 9.–20.11.2026, pre-sessional 2.–8.11.2026; Stand 7.10.2026; Zeitplan laut Dokument vorläufig |
| EDGAR, Global Carbon Project, Weltbank, OWID (Primärdaten) | nicht direkt geöffnet | nur über CSV, run_log und Validierungsberichte abgedeckt |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4, E-Nummern auf die Empfehlungen in Abschnitt 5.

### 2.1 Kurz gesagt (Z. 5)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Deutschland verursachte 2024 rund 1,3 Prozent der weltweiten Treibhausgasemissionen (Rang 12 von 208).“ | [1], [2], CSV (1,3007 %), run_log | bestätigt | Die „Weltsumme“ ist die Summe der 208 Länder ohne internationalen Luft- und Seeverkehr (run_log: zusammen 2,62 % der Ländersumme). Das steht in [1] nicht. E1. |
| 2 | „alle Länder, deren Anteil so klein oder kleiner ist, kommen zusammen auf fast ein Drittel der weltweiten Emissionen (31,7 Prozent).“ | [1], [2], CSV (1 − 0,6834 = 31,7 %), run_log (197 von 208) | bestätigt | „fast ein Drittel“ ist reine Rundung von 31,7 %. |
| 3 | „Würden sie alle sagen „wir sind zu klein, um zu zählen“, fiele dieses Drittel gemeinsam darunter.“ | [2] (wörtlich) | bestätigt | Gedecktes Gedankenexperiment; keine Wirkungsbehauptung. |
| 4 | „Das ist ein Gedankenexperiment und keine Schuldfrage.“ | [1], [2] („Keine Schuldfrage“, „Gedankenexperiment“) | bestätigt | |

### 2.2 Das Argument (Z. 9–11)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 5 | „In der deutschen Klimadebatte taucht immer wieder dasselbe Argument auf …“ | [1] („taucht immer wieder ein bestimmtes Argumentmuster auf“), [2] | bestätigt | „dasselbe“ statt „ein bestimmtes Argumentmuster“ ist unkritisch. Häufigkeit wird in [1] ausdrücklich nicht untersucht; „immer wieder“ steht wortgleich in [1]/[2]. |
| 6 | „Wer das wann sagt, haben wir nicht untersucht. Wir nennen weder Personen noch Parteien.“ | [1] („dazu wurden keine Daten erhoben, … keine Personen, Parteien oder Organisationen benannt“) | bestätigt | Das Kapitel nennt später Organisationen (Helmholtz, WiWo) als Quellen, nicht als Urheber des Arguments; kein Widerspruch. |
| 7 | „Wenn ein kleiner Anteil ein Grund ist, nichts zu tun: Was passiert, wenn alle Länder … dieselbe Logik anwenden? Wie viel der weltweiten Emissionen fiele dann gemeinsam unter „zu klein, um zu zählen“?“ | [1], [2] („Die Frage dahinter“) | bestätigt | |

### 2.3 Die Rechnung (Z. 15–26)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 8 | „… in der „Trittbrettfahrer-Rechnung“ vom 31. August 2026 durchgerechnet, mit vorab festgelegtem Analyseplan und unabhängiger Validierung [1].“ | [1], [2], run_log (SAP v1.0 eingefroren 31.08.2026), Validierungsberichte, GitHub-Commits | bestätigt | |
| 9 | „… zwei Zeithorizonte getrennt betrachtet. Beide sind gleichrangig“ | [1] | bestätigt | |
| 10 | „Heute: … Treibhausgasemissionen des Jahres 2024 liegt Deutschland laut der EU-Datenbank EDGAR bei 1,3 Prozent, auf Rang 12 von 208 Ländern.“ | [1], CSV `estimand2_kernzahlen.csv` | bestätigt | |
| 11 | „Alle Länder mit einem Anteil von höchstens 1,3 Prozent kommen zusammen auf 31,7 Prozent der weltweiten Jahresemissionen.“ | [1], [2], CSV | bestätigt | Schwelle ist der ungerundete deutsche Anteil (1,3007 %); Mexiko (Rang 11, 1,325 %) rundet ebenfalls auf 1,3 und ist nicht enthalten. Die Kurzform „höchstens 1,3 Prozent“ steht so in [1] und [2]. E2. |
| 12 | „Historisch: … seit 1850 aufsummierten CO₂-Emissionen aus fossilen Brennstoffen und Zement (Global Carbon Project), liegt Deutschland mit 5,3 Prozent auf Rang 4 von 214. Alle Länder bis zu diesem Anteil kommen zusammen auf 53,1 Prozent.“ | [1], [2], CSV (5,3 / 4 / 214 / 53,1), Nachkontrolle | bestätigt | 53,1 % ist der nach dem Konverter-Fix validierte Wert (nicht 35,3 % oder 59,1 %). |
| 13 | „Die beiden Zahlen … sind nicht direkt vergleichbar … (alle Treibhausgase gegen nur CO₂ aus fossilen Quellen und Zement) und verschiedenen Zeiträumen (ein Jahr gegen 175 Jahre). Keine von beiden ist „die“ Kernzahl.“ | [1] (Hinweis zur Vergleichbarkeit) | bestätigt | |
| 14 | Grafik-1-Bildunterschrift: „Alle 208 Länder, absteigend nach Emissionsanteil sortiert, mit dem kumulierten Anteil. Deutschland (Rang 12) ist markiert.“ | CSV (208 Zeilen, Rang 12 = DEU), Skript `stopifnot` | bestätigt | Siehe Grafikprüfung G1–G6. |
| 15 | „Die eigentliche Hauptaussage der Analyse ist nicht eine einzelne Prozentzahl, sondern diese Kurve. Deutschlands Position ist darin markiert, aber nicht besonders behandelt.“ | [1] („nicht methodisch privilegiert“) | bestätigt | |
| 16 | „Dass wir die Grenze genau bei Deutschland ziehen, ergibt sich aus der Debatte, nicht aus einem statistischen Kriterium.“ | [1], [2] | bestätigt | |

### 2.4 Wie empfindlich das Ergebnis ist (Z. 30–41)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 17 | „Verschiebt man die Grenze um wenige Ränge, ändert sich die Summe deutlich. Das Bild … ist deshalb kein festes Ergebnis. Es hängt davon ab, wo man die Linie zieht.“ | [1] (Rangplatz-Sensitivität), [2]; `sensitivitaet4_rank_sensitivity.csv` | bestätigt | Gedeckt: kumulierter Anteil der größten Emittenten bei Rang DE: 69,6 %, bei DE+10 (Rang 22): 79,5 %, bei DE+20 (Rang 32): 86,0 %; historisch 52,1 / 75,4 / 85,1 %. „Wenige Ränge“ meint in der Tabelle 10 bzw. 20 Ränge; die Untergrenzen DE−10/−20 sind durch Rang 1 abgeschnitten (2a: Rang 1 und 2; 2b: beide Rang 1). Die Tabelle zeigt den Anteil der **größten** Emittenten, die Übertragung auf die „Summe der kleinen Länder“ ist die von [1]. Das Kapitel nennt keine Zahlen (E3). |
| 18 | „Dazu kommen Varianten, die wir vorab festgelegt haben [1]“ | [1] („alle vorab im SAP festgelegt“); run_log | bestätigt | Die Pro-Kopf-Rechnung ist im SAP ein eigener Estimand (Abschn. 2), keine Sensitivität; „Variante“ ist unscharf, aber vorab festgelegt. |
| 19 | Grafik-2-Bildunterschrift: „Die Varianten sind nicht direkt vergleichbar (verschiedene Gase, Jahre, Zeiträume).“ | [1] | Abweichung (gering) | Die Grafik selbst nennt zusätzlich „Bezugsgruppen“; die Bildunterschrift im Buch nicht. Die Pro-Kopf-Variante hat eine andere Bezugsgruppe (A6). |
| 20 | „Nur CO₂ statt aller Treibhausgase (2024): Deutschlands Anteil liegt bei 1,5 Prozent, alle Länder bis dahin kommen auf 30,1 Prozent (statt 31,7).“ | [1], [2], CSV (S1: 1,5 / 30,1), run_log (1,5134 %, Rang 10) | bestätigt | |
| 21 | „Konsumbasiert statt produktionsbasiert (CO₂, 2023): … Deutschlands Anteil liegt dann bei 2,1 Prozent, alle Länder bis dahin kommen auf 40,5 Prozent. Diese Werte sind nicht direkt vergleichbar mit den 31,7 Prozent, weil Gase und Jahr abweichen.“ | [1], [2], CSV (S2: 2,1 / 40,5), run_log (OWID, 2023, 120 Länder) | bestätigt | Basis nur 120 Länder mit Wert (steht in [1] nicht; kein Fehler). Die Erklärung „Emissionen dort, wo die Güter verbraucht werden“ entspricht [1]/[2]. |
| 22 | „Historisch mit Landnutzung: … (Mittel dreier Modelle), liegt Deutschlands Anteil bei 3,5 Prozent und die Summe bei 54,0 Prozent (statt 53,1). Diese Teilkomponente ist modellunsicherer.“ | [1] („Mittel dreier GCP-Modelle … höhere Modellunsicherheit“), CSV (S3: 3,5 / 54,0) | bestätigt | Der automatisierte Plausibilitätscheck greift bei den LULUCF-Dateien nicht (Nachkontrolle, Punkt 2); die Zahl wurde unabhängig nachgerechnet. Nicht-Geprüftes, Abschnitt 6. |
| 23 | „Pro Kopf: Deutschland hat mit 8,07 Tonnen CO₂-Äquivalent pro Person (2024) einen höheren Pro-Kopf-Ausstoß als der weltweite Durchschnitt (6,36 Tonnen).“ | [1], [2], run_log | bestätigt | |
| 24 | „Um nicht mit einkommensschwachen Ländern zu vermischen, haben wir die Rechnung nur für die 58 Länder durchgeführt, die pro Kopf über dem Durchschnitt liegen.“ | [1] („zusätzlich auf die Teilmenge … beschränkt“; 58 von 195 mit Pro-Kopf-Wert) | bestätigt | „nur“ statt „zusätzlich“: Es ist eine zusätzliche Rechnung, nicht die einzige. Im Zusammenhang unkritisch; die Hauptrechnung steht oben. Die 195 (13 Länder ohne Bevölkerungswert, 0,74 % der Emissionen) sind im Kapitel nicht genannt. |
| 25 | „Dort steht Deutschland auf Rang 8.“ | [1], run_log (1,92 % der Teilmenge, Rang 8 von 58) | bestätigt | |
| 26 | „Die Länder dieser Gruppe mit einem Anteil bis zum deutschen kommen auf 14,2 Prozent der weltweiten Emissionen.“ | [1], [2], CSV (14,2 % der Weltsumme; 21,0 % der Teilmenge) | bestätigt | Korrekt als Anteil an der Weltsumme bezeichnet. Der Anteil an der Teilmenge (21,0 %) ist weggelassen (kein Fehler). Bezugsgruppe ≠ übrige Varianten (A6). |

### 2.5 Warum anderswo andere Zahlen stehen (Z. 45)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 27 | „Oft liest man „rund zwei Prozent“.“ | [3] nennt die Zahl in der Überschrift; keine Häufigkeitsbelege | Abweichung | „Oft“ ist eine Häufigkeitsbehauptung ohne Beleg. Der Faktencheck zu [2] hatte „häufig“/„meist“ beanstandet und beide Wörter wurden gestrichen; hier sind sie in anderer Form wieder da. A2. |
| 28 | „Die Helmholtz-Klima-Initiative prüft diese Behauptung auf Basis von Daten, die laut der Seite aus dem Jahr 2017 stammen (Stand April 2021) [2][3].“ | [3] (Abruf 23.10.2026); [2] | Abweichung (gering) | Stand April 2021 bestätigt. „2017“ nennt die Seite nur für die **CO₂-Angaben**; die Zwei-Prozent-Rechnung ist als Treibhausgas-Anteil formuliert, deren Datenjahr nicht angegeben ist (Faktencheck zu [2], Nachtrag 2: „überwiegend“ oder „laut Seite“). A2. |
| 29 | „Die WirtschaftsWoche nennt für 2024 einen CO₂-Anteil von 1,46 Prozent, für alle Treibhausgase dagegen 1,27 Prozent [4].“ | [4] (Abruf 23.10.2026), [2] | bestätigt | Beide Werte, Jahr und Titel/Datum stimmen. |
| 30 | „In unserer Rechnung liegt der deutsche Anteil bei reinem CO₂ bei 1,5 Prozent, mit allen Treibhausgasen bei 1,3.“ | [1], [2], CSV | bestätigt | |
| 31 | „Die Unterschiede kommen von verschiedenen Jahren und Gasen [1][2][3][4].“ | – (Herkunftstabelle: „Schluss aus den Quellenangaben, zu prüfen“) | Abweichung | Neue Ursachenzuschreibung, nicht in [1]–[4]. Gegenbefund: WiWo (1,46 / 1,27) und unsere Zahlen (1,5 / 1,3) beziehen sich auf **dasselbe Jahr (2024)**; die Werte stimmen nach Rundung überein (1,46 → 1,5; 1,27 → 1,3). Der Unterschied zu „rund zwei Prozent“ ist mit veröffentlichten Ergebnissen nicht zerlegbar (Datenjahr der THG-Basis bei Helmholtz unbekannt, Rechnung teils mit anderem Zähler). Genau diese Ursachengewichtung wurde im Faktencheck zu [2] (Nachtrag 1, N1) als neue Inferenz beanstandet und gestrichen. A1. |

### 2.6 Was die Zahlen nicht sagen (Z. 49–51)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 32 | „Keine Schuldfrage. Die Rechnung ist ein Gedankenexperiment. Sie sagt nichts darüber, welches Land wie viel Verantwortung trägt oder was fair wäre. Sie bewertet auch nicht, ob ein hoher oder niedriger Anteil an Klimapolitik, Wirtschaftsstruktur, Bevölkerungszahl oder am Zufall der Ländergrenzen liegt [1].“ | [1] („Was diese Zahlen nicht bedeuten“), [2] | bestätigt | |
| 33 | „Produktion, nicht Konsum. Die Hauptzahlen zählen Emissionen dort, wo sie entstehen.“ | [1], [2] | bestätigt | |
| 34 | „Für Länder mit hohen Importen emissionsintensiver Güter kann die konsumbasierte Zahl spürbar höher liegen, wie die Variante oben zeigt [1].“ | [1] („kann … spürbar höher liegen (siehe Sensitivität unten)“) | Abweichung | [1] verweist auf die Sensitivität, sagt aber nicht, dass sie es „zeigt“. Die Variante ist laut dem Kapitel selbst „nicht direkt vergleichbar“ (andere Gase, anderes Jahr, 120 Länder, OWID); ein Beleg für „spürbar höher“ ist sie damit nicht. A7. |
| 35 | „Nichts zur COP31. Vom 9. bis 20. November 2026 findet im türkischen Antalya die UN-Klimakonferenz COP31 statt [6].“ | [6] (geöffnet), [2] | bestätigt (Stand 7.10.2026) | Der Zeitplan ist laut Dokument vorläufig. Das Buch erscheint am 1.12.2026, nach dem Konferenzende: Zeitform und Stand (A8, E5). |
| 36 | „Was dort verhandelt wird und welche Zusagen die Staaten machen, beantwortet diese Rechnung nicht [2].“ | [2] („Nichts zur COP31 selbst“) | bestätigt | |

### 2.7 Was heißt das für dich? (Z. 55–57)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 37 | „Ein Anteil in Prozent lässt sich erst einordnen, wenn klar ist, worauf er sich bezieht: auf welches Jahr, auf welche Gase und darauf, ob Emissionen dort gezählt werden, wo sie entstehen, oder dort, wo die Güter verbraucht werden.“ | [1] (Vergleichbarkeitshinweise), Gliederung | bestätigt | Beschreibend, in den Quellen angelegt (Jahr, Gasbasis, produktions-/konsumbasiert). |
| 38 | „Wer Prozentzahlen aus verschiedenen Quellen vergleicht, sollte prüfen, ob sie auf derselben Basis stehen.“ | [1] | bestätigt | |
| 39 | „Hinter „zwei Prozent“, „1,5 Prozent“ und „1,3 Prozent“ stecken keine Widersprüche, sondern verschiedene Maßstäbe.“ | – | Abweichung | Neue Feststellung. „Zwei Prozent“ (Helmholtz) und „1,5 Prozent“ (nur CO₂, 2024, unsere Variante bzw. WiWo-CO₂-Wert) sind nach den Quellen nicht auf Maßstabsunterschiede zurückgeführt (Nr. 31). „Keine Widersprüche“ ist eine Wertung, die kein Beleg trägt (zum Beispiel ist die Gasbasis bei Helmholtz uneinheitlich). A1. |
| 40 | „„Zu klein, um zu zählen“ funktioniert als Argument nur, solange es nicht alle sagen. Ob ein einzelner Anteil zählt, hängt auch davon ab, wie viele andere in derselben Lage sind. Ob daraus eine Pflicht zum Handeln folgt, beantwortet die Rechnung nicht.“ | [2] (Fazit: „Unser Gedankenexperiment legt nahe: ‚Zu klein, um zu zählen‘ funktioniert nur, solange es nicht alle sagen. … Ob ein einzelner Anteil zählt, ist deshalb auch eine Frage danach, wie viele andere in derselben Lage sind.“) | Abweichung | Gegenüber [2] fehlt die Kennzeichnung als Deutung („Unser Gedankenexperiment legt nahe:“); der Faktencheck zu [2] (#24) hatte genau diese Kennzeichnung verlangt. Zusätzlich neu: „als Argument“ und „Pflicht zum Handeln“ (in [1]/[2] nicht vorhanden, [1] bewertet kein Handeln und keine Verantwortung). Der Satz bewertet in „Was heißt das für dich?“ ein politisches Argument. A3. |

### 2.8 Lagen wir richtig? (Z. 61–63)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 41 | „Seit der Veröffentlichung am 31. August haben wir keine Änderungen an den Kernzahlen vorgenommen.“ | GitHub-Commit-Liste (letzter Commit im Ordner 31.08.2026), Referenzfassung [1] vom 22.10. ohne Korrekturhinweis, CSV | bestätigt | Belegt über die öffentliche Commit-Liste des Analyseordners und den unveränderten Artikeltext (WebFetch-Zusammenfassung, kein `git diff`). |
| 42 | „Neuere EDGAR- oder GCP-Daten nennen wir nur mit Quelle und Datum und rechnen sie nicht neu.“ | Gliederung, Kapitelplan Abschn. 4 | bestätigt | Selbstverpflichtung; ob neuere EDGAR-/GCP-Veröffentlichungen vorliegen, wurde nicht geprüft (Abschnitt 6). |
| 43 | „Die unabhängige Validierung fand in der ersten Prüfrunde einen kritischen Fehler in einem Datenkonverter.“ | [1] (Methodik-Box), `Validierungsbericht.md` | bestätigt | |
| 44 | „Er führte zu einem falschen Zwischenwert für die historische Kernzahl.“ | [1] („führte zu einem falschen Zwischenwert für die historische Kernzahl“); `Validierungsbericht.md`, `DATENAUFBEREITUNG_LOG.txt` | Abweichung (gering) | Wortgleich zu [1], aber unvollständig: Laut Validierungsbericht und Provenienz-Log waren **auch** die konsumbasierte Variante, die Landnutzungsvariante und der historische Teil der Rangplatz-Rechnung betroffen. Der falsche Wert 35,3 % wurde nie veröffentlicht (Nachkontrolle: 59,1 % war nur Zwischenschätzung des Validators). A4. |
| 45 | „Nach der Korrektur wurden alle Kernzahlen unabhängig neu berechnet und bestätigt.“ | [1] (wortgleich); Nachkontrolle | Abweichung (gering) | Nachkontrolle: 2b (53,1 %) und S3 (54,0 %) und der 2b-Teil von S4 unabhängig aus den Roh-CSV nachgerechnet; S2 (konsumbasiert) reproduziert; 1a/2a, Estimand 3, S1, S6 waren bereits in der Erstprüfung unabhängig validiert und unverändert. „Alle … nach der Korrektur neu berechnet“ trifft nur für die betroffenen Werte zu. A4. |
| 46 | „Das ist keine nachträgliche Korrektur, zeigt aber, was die Prüfung leistet (mehr dazu in Kapitel 8).“ | – (Herkunftstabelle: „neu“) | Abweichung | „keine nachträgliche Korrektur“ ist richtig (Fund vor Veröffentlichung). „zeigt, was die Prüfung leistet“ ist eine Selbstbewertung ohne Beleg; Verweis auf Kapitel 8 nicht gegen Kapitel 8 prüfbar. A4. |
| 47 | „COP31: Unsere Stücke machen keine Vorhersage zur Konferenz.“ | [1], [2] | bestätigt | |
| 48 | „Einen Ergebnisblock nehmen wir nur auf, wenn bis zum 15. November eine belastbare Primärquelle vorliegt und der Text die Faktenprüfung besteht.“ | Gliederung Kap. 5, Entscheidung 2 (22.10.) | Abweichung | Interne Redaktionsregel, kein Buchtext. Außerdem sachlich schwer haltbar: Der 15.11. liegt mitten in der Konferenz (9.–20.11., [6]); ein Ergebnis kann dann nicht vorliegen. A8. |

### 2.9 Woher wir das wissen und Quellenliste (Z. 67–76)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 49 | „Aktuelle Jahresemissionen: EDGAR (… EU JRC), 2024, alle Treibhausgase in CO₂-Äquivalenten, 208 Länder.“ | [1] (Methodik-Box), run_log | bestätigt | |
| 50 | „Kumulierte historische Emissionen: Global Carbon Project / Global Carbon Budget, territoriale fossile CO₂-Emissionen inklusive Zement, 1850–2024, 214 Länder.“ | [1], run_log | bestätigt | |
| 51 | „Bevölkerung: Weltbank (World Development Indicators), 2024.“ | [1] | bestätigt | |
| 52 | „Our World in Data nur als Sekundärquelle zur Kreuzprüfung des EDGAR-Ausgangswerts (Abweichung 0,089 Prozentpunkte) und für die konsumbasierte Variante.“ | [1], run_log (OWID 1,2119 % gegen EDGAR 1,3007 %) | bestätigt | |
| 53 | „Zugriffsdatum aller Rohdaten: 31. August 2026.“ | [1], run_log, Provenienz-Log | bestätigt | |
| 54 | „Die Analyse ist deskriptiv: keine p-Werte, keine Konfidenzintervalle. Sie deckt nahezu alle Länder ab. Die Robustheit zeigen die Varianten oben.“ | [1] | bestätigt | |
| 55 | „Analyseplan, R-Skript, Rohdaten-Aufbereitungslog, alle Tabellen und Grafiken sowie beide Validierungsberichte liegen offen im Repository: `Analysen/2026-08-trittbrettfahrer-rechnung/` auf github.com/dsaure55/klima-evidenzcheck.“ | [1], GitHub (Commit-Liste: SAP, Analyse, Validierung, Nachkontrolle sichtbar) | bestätigt | |
| 56 | Quelle [1]: Titel, Datum 31.08.2026, URL | [1] Referenzfassung (Titel, Slug) | bestätigt | Linkziel anhand der Referenzfassung (Abruf 22.10.2026, Titel und post_date) abgeglichen. |
| 57 | Quelle [2]: „COP31: Ist Deutschland ‚zu klein, um zu zählen‘?“, 19.10.2026, URL | [2] Referenzfassung | bestätigt | |
| 58 | Quelle [3]: Helmholtz-Klima-Initiative / klimafakten, Titel der Behauptung, „laut Seite Daten 2017, Stand April 2021“, URL | [3] geöffnet | bestätigt (mit Vorbehalt) | Titel und Stand stimmen; „Daten 2017“ gilt nur für die CO₂-Angaben (siehe Nr. 28). |
| 59 | Quelle [4]: WirtschaftsWoche, Titel, 24.02.2026, URL | [4] geöffnet | bestätigt | |
| 60 | Quelle [5]: Sammelzeile „EDGAR …; Global Carbon Project …; Weltbank …; Our World in Data (Zugriff 31.08.2026, wie in [1])“ | Provenienz-Log (z. B. EDGAR 2025 GHG booklet, URL) | Abweichung | Keine Ausgabe/Edition, keine Links. Das Provenienz-Log nennt Edition und URL (z. B. „EDGAR 2025 GHG booklet“, https://edgar.jrc.ec.europa.eu/booklet/EDGAR_2025_GHG_booklet_2025.xlsx). Als Verweis „wie in [1]“ nachvollziehbar, als eigenständige Quelle nicht ausreichend. A9. |
| 61 | Quelle [6]: UNFCCC, COP 31 Overview Schedule, Antalya, 9.–20.11.2026, URL | [6] geöffnet | bestätigt | Dokumentstand 7.10.2026, vorläufig. E5. |

## 3. Grafiken

Geprüft: beide PNG als Bild, das R-Skript und die zugehörigen CSV. Grafik 1 liest die CSV direkt (208 Zeilen, `stopifnot(nrow == 208, code[12] == "DEU")`), Grafik 2 hat die sechs Werte fest eingetragen. Das Skript enthält keine Rechnung außer `cum11 = cum_share[11] × 100`.

| Nr. | Punkt | Befund | Ergebnis | Hinweis |
|---|---|---|---|---|
| G1 | Grafik 1: Daten | Alle 208 Länder, absteigend; Kurve beginnt bei etwa 30 % (China 29,97 %) und endet bei 100 % (Rang 208 = 1) | bestätigt | Gegen CSV geprüft (erste und letzte Zeilen, Zeilenzahl). |
| G2 | Grafik 1: „Deutschland: Rang 12, Anteil 1,3 %“ | Rang 12 = DEU, 1,3007 %, kumuliert 69,64 % (Punkt liegt bei ~69,6 %) | bestätigt | Die Aussage ist korrekt. |
| G3 | Grafik 1: Linie „Die 11 größten Länder: 68,3 %. Deutschland und alle kleineren zusammen: 31,7 %“ | kumuliert bis Rang 11: 68,34 %; 100 − 68,34 = 31,66 → 31,7 %, identisch mit der Kernzahl 2a (Summe aller Länder mit Anteil ≤ DE, inkl. DE; 197 von 208 Ländern) | Abweichung (gering) | Rechnerisch richtig (das Ergebnis ist 1 − Kumulation bis Rang 11 = Kernzahl). Aber: (a) **68,3 %** steht weder in [1] noch in [2] (in [1] steht 69,6 % für Rang 12 inkl. Deutschland); die Bildunterschrift sagt „keine neue Rechnung“, die Zahl ist eine neue Darstellung einer CSV-Spalte. (b) Der Punkt Deutschland liegt bei ~69,6 %, die gestrichelte Linie bei 68,3 %, also sichtbar darunter, ohne Erklärung; Leser könnten einen Fehler oder die falsche Linie vermuten. A5. |
| G4 | Grafik 1: Titel „Länder so klein wie Deutschland oder kleiner: fast ein Drittel“ | 31,7 % | bestätigt | Rundung „fast ein Drittel“ wie in [2]. |
| G5 | Grafik 1: Achse „Kumulierter Anteil an den weltweiten Emissionen (%)“, Jahr, Gase, Quelle, Hinweis „Produktionsbasiert“, „Gedankenexperiment, keine Schuldfrage“ | Titel, Einheit, Datenstand (2024), Quelle vorhanden | bestätigt | Regel „Titel, Einheit, Datenstand, Quelle“ erfüllt. „weltweit“ = Summe der 208 Länder ohne Luft-/Seeverkehr (E1). „CO2“ statt „CO₂“ (E6). |
| G6 | Grafik 2: Werte | 31,7 / 30,1 / 40,5 / 14,2 / 53,1 / 54,0 | bestätigt | Alle sechs Werte stimmen mit CSV, [1] und Kapitel überein. Balkenlängen proportional (Achse 0–60 %). |
| G7 | Grafik 2: Beschriftung „Heute, nur Länder mit überdurchschnittlichem Pro-Kopf-Ausstoß“ = 14,2 % | 14,2 % ist der Anteil an den **weltweiten** Emissionen (Teilmenge: Länder mit Anteil ≤ DE **innerhalb** der 58 Länder); Anteil an der Teilmenge: 21,0 % | Abweichung | Die Zahl ist richtig (14,2 % der Welt), die Balkenbeschriftung nennt aber nur die Gruppe, nicht dass nur Länder aus dieser Gruppe mit höchstens deutschem Anteil gezählt sind. Untertitel „aller Länder mit höchstens deutschem Anteil“ stimmt für diesen Balken nicht ohne Zusatz (die Länder außerhalb der Gruppe sind ausgeschlossen). A6. |
| G8 | Grafik 2: Farben | Blau = Hauptvariante „heute“, Orange = Hauptvariante „historisch“, Grau = weitere Varianten; erklärt nur über den Zusatz „(Hauptvariante)“ in den Zeilenbeschriftungen | bestätigt (mit Hinweis) | Verständlich genug über die Beschriftung; kein Legendeneintrag. In Grafik 1 haben Blau und Orange eine andere Bedeutung (Deutschland, Grenze). E6. |
| G9 | Grafik 2: Titel „Je nach Maßstab zwischen 14 und 54 Prozent“ | Spannweite aus sechs Werten mit verschiedenen Gasen, Jahren, Zeiträumen und Bezugsgruppen | Abweichung | Der Titel suggeriert eine Spannweite derselben Größe („je nach Maßstab“). [1] weist ausdrücklich darauf hin, dass die Werte nicht direkt vergleichbar sind und keine der Zahlen „die“ Kernzahl ist; die Pro-Kopf-Zahl beantwortet eine andere Frage (Teilmenge). Der Hinweis steht nur im Kleingedruckten der Quellenzeile. 14 und 54 sind außerdem Randwerte einer Auswahl, keine in [1] genannte Spanne. A6. |
| G10 | Grafik 2: Einheit, Datenstand, Quelle | „Prozent der weltweiten Emissionen“; Quelle [1] 31.08.2026; „Konsumbasiert: nach OWID“; Landnutzung „Mittel dreier Modelle“ | bestätigt | |

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Z. 45 und Z. 56: Ursachenzuschreibung für die Unterschiede („Die Unterschiede kommen von verschiedenen Jahren und Gasen“; „stecken keine Widersprüche, sondern verschiedene Maßstäbe“).** (Nr. 31, 39) Neue Inferenz. Gegenbefund: WiWo (2024: 1,46 % CO₂, 1,27 % THG) und die eigene Rechnung (2024: 1,5 % CO₂, 1,3 % THG) beziehen sich auf dasselbe Jahr und stimmen nach Rundung überein. Für „rund zwei Prozent“ (Helmholtz) ist die Ursache mit veröffentlichten Ergebnissen nicht belegbar. Der Faktencheck zu [2] hat dieselbe Gewichtung bereits beanstandet.
Änderungsvorschlag Z. 45 (letzter Satz): streichen, Absatz endet nach „… mit allen Treibhausgasen bei 1,3.“ Alternativ: „Die Zahlen unterscheiden sich in Gasen und Jahren der Quellen; wie groß der Einfluss je Faktor ist, haben wir nicht untersucht.“
Änderungsvorschlag Z. 56: „Die Zahlen „zwei Prozent“, „1,5 Prozent“ und „1,3 Prozent“ beziehen sich auf verschiedene Quellen, Gase und Jahre. Vergleichbar sind nur Zahlen mit derselben Basis.“ (kein „keine Widersprüche“).

**A2. Z. 45 („Oft liest man „rund zwei Prozent“. Die Helmholtz-Klima-Initiative prüft … auf Basis von Daten, die laut der Seite aus dem Jahr 2017 stammen“).** (Nr. 27, 28) „Oft“ ist eine unbelegte Häufigkeitsbehauptung; die Datierung 2017 gilt laut Seite nur für die CO₂-Angaben, die Zwei-Prozent-Rechnung nennt Treibhausgas-Emissionen ohne Datenjahr.
Änderungsvorschlag: „Die Helmholtz-Klima-Initiative nennt „rund zwei Prozent“ und prüft diese Behauptung. Ihre CO₂-Angaben beziehen sich laut Seite auf 2017 (Stand April 2021) [3].“

**A3. Z. 57 (Was heißt das für dich, Punkt 3).** (Nr. 40) Gegenüber [2] fehlt die Kennzeichnung als Deutung, es kommen „als Argument“ und „Pflicht zum Handeln“ hinzu.
Änderungsvorschlag: „Unser Gedankenexperiment legt nahe: „Zu klein, um zu zählen“ funktioniert nur, solange es nicht alle sagen. Ob ein einzelner Anteil zählt, ist auch eine Frage danach, wie viele andere in derselben Lage sind. Was daraus für das Handeln folgt, beantwortet die Rechnung nicht.“ (Letzter Satz optional, wenn „Pflicht“ entfällt.)

**A4. Z. 62 (Lagen wir richtig?, Konverter-Fehler).** (Nr. 44–46)
- Betroffene Werte vollständig nennen: Laut Validierungsbericht und Provenienz-Log waren die historische Kernzahl, die konsumbasierte Variante, die Landnutzungsvariante und der historische Teil der Rangplatz-Rechnung betroffen. Der falsche Wert (35,3 %) wurde nie veröffentlicht.
- „alle Kernzahlen unabhängig neu berechnet“ präzisieren: nach der Korrektur wurden die betroffenen Werte unabhängig nachgerechnet bzw. reproduziert, die übrigen waren in der Erstprüfung bereits unabhängig validiert und unverändert.
- „zeigt, was die Prüfung leistet“ streichen oder neutral fassen.
Änderungsvorschlag: „Die unabhängige Validierung fand in der ersten Prüfrunde vor der Veröffentlichung einen kritischen Fehler in einem Datenkonverter. Er verfälschte die historische Kernzahl sowie die konsumbasierte und die Landnutzungsvariante. Der falsche Wert wurde nie veröffentlicht. Nach der Korrektur wurden die betroffenen Werte unabhängig nachgerechnet und bestätigt, die übrigen waren bereits geprüft (mehr dazu in Kapitel 8) [1].“

**A5. Grafik 1: Linie und Beschriftung „Die 11 größten Länder: 68,3 %. …“.** (G3) Die Zahl 68,3 % steht nicht in [1]/[2], die Linie liegt sichtbar unter dem Deutschland-Punkt (69,6 %). Entweder die Linie auf die Kernzahl-Aussage reduzieren („Deutschland und alle kleineren Länder zusammen: 31,7 %“, mit Klammer über der Fläche unter/über der Kurve) oder die Beschriftung ergänzen: „Bis Rang 11 (vor Deutschland): 68,3 %. Mit Deutschland (Rang 12): 69,6 %. Rest: 31,7 %.“ Die Bildunterschrift „keine neue Rechnung“ gilt sonst nur eingeschränkt (Darstellung einer CSV-Spalte).

**A6. Grafik 2: Titel, Untertitel, Pro-Kopf-Balken.** (G7, G9, Nr. 19) „Je nach Maßstab zwischen 14 und 54 Prozent“ legt eine Spannweite derselben Größe nahe. Änderungsvorschlag Titel: „Sechs Rechnungen mit verschiedenen Maßstäben“ (ohne Zahlenspanne) oder „Der Anteil hängt vom Maßstab ab“. Untertitel: „Summe der Emissionsanteile aller Länder mit höchstens deutschem Anteil, nach Variante; Pro-Kopf-Variante nur innerhalb der Länder mit überdurchschnittlichem Pro-Kopf-Ausstoß“. Zeilenbeschriftung: „Heute, 58 Länder mit überdurchschnittlichem Pro-Kopf-Ausstoß (Anteil an der Welt)“. Quellenzeile um „Blau und Orange: Hauptvarianten“ ergänzen. Bildunterschrift im Buch um „Bezugsgruppen“ ergänzen.

**A7. Z. 50 („… wie die Variante oben zeigt [1]“).** (Nr. 34) [1] sagt nur „kann … spürbar höher liegen (siehe Sensitivität unten)“. Die Variante ist laut Kapitel selbst nicht direkt vergleichbar.
Änderungsvorschlag: „… kann die konsumbasierte Zahl spürbar höher liegen (siehe die konsumbasierte Variante oben, die allerdings nicht direkt vergleichbar ist) [1].“

**A8. COP31: Zeitform und interne Redaktionsregel (Z. 51, Z. 63).** (Nr. 35, 48) Das Buch erscheint am 1.12.2026, nach dem Ende der Konferenz (20.11.). Präsens und Futur („findet … statt“, „was dort verhandelt wird“) sind dann falsch; der Satz zum „Ergebnisblock bis 15. November“ ist eine interne Regel und widerspricht dem Konferenzzeitplan (15.11. liegt mitten in der Konferenz).
Änderungsvorschlag: Zeitform auf den Stand zum Redaktionsschluss ausrichten, z. B. „Anlass war die UN-Klimakonferenz COP31 (9. bis 20. November 2026 in Antalya, laut UNFCCC-Zeitplan, Stand 7.10.2026) [6].“ Z. 63: „COP31: Unsere Stücke machen keine Vorhersage zur Konferenz. Was dort beschlossen wurde, beantwortet diese Rechnung nicht und ist hier nicht ausgewertet.“ Der Satz zum Ergebnisblock entfällt als Buchtext; falls ein Ergebnisblock aufgenommen wird, ist er ein neuer Text mit Primärquelle (UNFCCC) und eigener Faktenprüfung.

**A9. Quelle [5] (Sammelzeile) und Datenstände.** (Nr. 60) Als eigenständige Quelle nicht ausreichend. Änderungsvorschlag: Einzelne Einträge mit Edition, Datenstand und Link, aus dem Provenienz-Log `Analysen/2026-08-trittbrettfahrer-rechnung/rohdaten/DATENAUFBEREITUNG_LOG.txt` übernehmen (z. B. EDGAR 2025 GHG booklet, https://edgar.jrc.ec.europa.eu/booklet/EDGAR_2025_GHG_booklet_2025.xlsx; analog Global Carbon Budget, Weltbank WDI, OWID). Dort ist auch die Quelle aller Zugriffe (31.08.2026) belegt.

## 5. Empfehlungen (nicht bindend)

- **E1.** „Weltsumme“ präzisieren: Die Rechnung bezieht sich auf die Summe der 208 Länder, ohne internationalen Luft- und Seeverkehr (zusammen 2,62 % der Ländersumme, run_log). Mit der EDGAR-Gesamtzeile wäre der deutsche Anteil etwas kleiner (der WiWo-Wert 1,27 % für alle Treibhausgase passt dazu; das ist eine Beobachtung, keine Berechnung für das Buch). Ein Satz in „Woher wir das wissen“ wäre transparent: „Weltsumme = Summe der 208 Länder, ohne internationalen Luft- und Seeverkehr.“ Er steht in [1] nicht, aber im veröffentlichten run_log.
- **E2.** „höchstens 1,3 Prozent“ (Z. 17, Z. 5) als „höchstens so viel wie Deutschland (1,3 Prozent)“ formulieren, denn die Schwelle ist der ungerundete deutsche Anteil (Mexiko mit 1,32 % rundet ebenfalls auf 1,3 und zählt nicht dazu).
- **E3.** Rangplatz-Sensitivität mit einem veröffentlichten Beispiel belegen, z. B. „Zehn Ränge weiter liegt der kumulierte Anteil der größten Emittenten bei 79,5 statt 69,6 Prozent [1]“ (Tabelle in [1] bzw. `sensitivitaet4_rank_sensitivity.csv`), und „wenige Ränge“ durch „zehn Ränge“ ersetzen.
- **E4.** Z. 24: „nur für die 58 Länder“ durch „zusätzlich nur für die 58 Länder“ ersetzen (wie in [1]/[2]); optional die 195 Länder mit Bevölkerungswert nennen.
- **E5.** COP31-Termin mit „laut UNFCCC-Zeitplan (Stand 7.10.2026, vorläufig)“ versehen.
- **E6.** Grafiken: „CO2“ als „CO₂“ darstellen; Farbbedeutung in beiden Grafiken konsistent halten (Blau/Orange haben in Grafik 1 und 2 verschiedene Bedeutung).
- **E7.** Z. 49: „Sie bewertet auch nicht …“ passt zu [1]; „oder am Zufall der Ländergrenzen“ ist wörtlich aus [1] (Zufall) und unproblematisch. Keine Änderung nötig; für die Stilprüfung lesbarer in zwei Sätze teilen.
- **E8.** Z. 62: Hinweis auf Kapitel 8 gegen den fertigen Kapitel-8-Text prüfen (Konverter-Fehler dort ebenfalls aufführen).

## 6. Nicht geprüft / Vorbehalte

- **Primärdaten** (EDGAR 2025-Booklet, Global Carbon Budget, Weltbank WDI, OWID) nicht direkt geöffnet; Prüfung über CSV-Ausgaben, run_log, Provenienz-Log und beide Validierungsberichte. Ob inzwischen neuere EDGAR- oder GCP-Ausgaben vorliegen, wurde nicht geprüft.
- **Die Rechnung selbst** (R-Skript, Konverter) wurde nicht neu ausgeführt; Grundlage ist der validierte Stand (Nachkontrolle: FREIGABE).
- **LULUCF-Plausibilitätscheck:** Laut Nachkontrolle (Punkt 2) greift der automatisierte Check bei den drei LULUCF-Dateien nicht; die Zahl 54,0 % wurde unabhängig nachgerechnet. Das ist eine offene Transparenzlücke im Analyseordner, keine Abweichung im Kapitel.
- **„Keine Änderungen seit 31.08.“:** Belegt über die Commit-Liste im öffentlichen Repo (WebFetch-Zusammenfassung) und den unveränderten Artikeltext; kein lokaler `git log`/`git diff`.
- **Kapitel 8** (Verweis in Z. 62) nicht geprüft.
- **Stil, Wortzahl (Ziel 1.200–1.600), Leseniveau, Rechtschreibung** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A9 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. Grafiken nach A5/A6/E6 anpassen, neu erzeugen und erneut als Bild prüfen.
3. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (9 Auflagen, 8 Empfehlungen). Alle Kernzahlen (1,3 %, Rang 12 von 208, 31,7 %; 5,3 %, Rang 4 von 214, 53,1 %; 8,07/6,36 t; 58 Länder, Rang 8, 14,2 %; 30,1 %, 40,5 %, 54,0 % mit den zugehörigen deutschen Anteilen; OWID-Abweichung 0,089 Punkte; Zugriffsdatum 31.08.2026) stimmen mit [1], [2], den CSV-Dateien und dem run_log überein; beide Grafiken geben die Werte korrekt wieder. Kein Punkt ist „kritisch“. Die wesentlichen Mängel sind (1) die wieder eingeführte Ursachenzuschreibung zu den abweichenden Prozentzahlen (A1, A2), (2) die fehlende Deutungskennzeichnung in „Was heißt das für dich?“ (A3), (3) die unvollständige Darstellung des Konverter-Fehlers (A4), (4) die Grafiken: neue Zahl 68,3 % und der irreführende Titel „zwischen 14 und 54 Prozent“ (A5, A6) und (5) COP31-Zeitform und interne Redaktionsregel (A8). Keine neue Berechnung im Kapitel; neue Inferenzen: Nr. 31, 34, 39, 40, 46.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
