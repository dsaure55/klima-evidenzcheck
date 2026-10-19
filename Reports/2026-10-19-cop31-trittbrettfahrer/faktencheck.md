# Faktencheck – „COP31: Ist Deutschland ‚zu klein, um zu zählen‘?“ (Stufe Einordnung)

**Geprüfter Entwurf:** `Reports/2026-10-19-cop31-trittbrettfahrer/kanal-entwuerfe/substack.md` (unverändert gelassen)
**Prüfdatum:** 19.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dies ist kein Freigabevermerk.** Freigabe erfolgt ausschließlich durch Daniel Saure nach eigener Lektüre des Volltexts.

## Geprüfte Quellen (tatsächlich aufgerufen)

| Kürzel | Quelle | Zugriff |
|---|---|---|
| Q1-web | Veröffentlichter Evidenzcheck „Die Trittbrettfahrer-Rechnung: Was, wenn "zu klein, um zu zählen" für alle gelten würde?“, Substack, 31.08.2026: https://klimaevidenzcheck.substack.com/p/die-trittbrettfahrer-rechnung-was | WebFetch 19.10.2026; Titel und Datum passen, **Linkziel korrekt** |
| Q1-lok | `Reports/2026-08-trittbrettfahrer-rechnung/kanal-entwuerfe/substack.md` (freigegebene Fassung) | gelesen |
| Q1-log | `Analysen/2026-08-trittbrettfahrer-rechnung/run_log.txt` (Analyselauf 31.08.2026) | gelesen |
| Q1-val | `Analysen/2026-08-trittbrettfahrer-rechnung/Validierungsbericht_Nachkontrolle.md` (Ergebnis: FREIGABE, keine kritischen Befunde) | gelesen |
| Q1-gh | https://github.com/dsaure55/klima-evidenzcheck/tree/main/Analysen/2026-08-trittbrettfahrer-rechnung (öffentlich; SAP, R-Skript, beide Validierungsberichte sichtbar) | WebFetch 19.10.2026 |
| Q2-unccd | https://www.unccd.int/index%2Ephp/events/other/2026-un-climate-change-conference-cop31 (im Entwurf verlinkt): „Antalya, Türkiye“, „09 - 20 November 2026“ | WebFetch 19.10.2026 |
| Q2-unfccc | UNFCCC, COP 31 Overview Schedule (PDF): https://unfccc.int/sites/default/files/resource/COP_31_Overview_Schedule.pdf: „UN Climate Change Conference - Antalya“, „9 - 20 November 2026 (sessional period)“ (Vorsitzungsphase 2.–8.11.) | WebFetch 19.10.2026, Inhalt bestätigt |
| Q2-unfccc-html | https://unfccc.int/cop31 sowie /cop31/about und /event/cop-31 | per Websuche als UNFCCC-Seiten „UN Climate Change Conference - Antalya, November 2026“ gefunden; WebFetch lieferte leeren Inhalt (vermutlich per JavaScript gerendert), **Inhalt nicht direkt verifiziert** |
| M1 | Helmholtz-Klima-Initiative / klimafakten.de: „Behauptung: ‚Deutschland verursacht nur rund zwei Prozent des weltweiten CO2-Ausstoßes. Was wir tun, ist deshalb praktisch irrelevant.‘“: https://www.helmholtz-klima.de/klimafakten/behauptung-deutschland-verursacht-nur-rund-zwei-prozent-des-weltweiten-co2-ausstosses-was-wir-tun | WebFetch 19.10.2026; Zahlen auf Basis 2017 (EDGAR), zuletzt aktualisiert April 2021, Gasbasis im Text gemischt (Überschrift CO₂, Rechnung mit THG) |
| M2 | WirtschaftsWoche, „CO2-Ausstoß Deutschlands, der EU & weltweit im Ländervergleich 2026“, 24.02.2026: https://www.wiwo.de/politik/ausland/co2-ausstoss-deutschlands-der-eu-weltweit-im-laendervergleich-2026/29263872.html | WebFetch 19.10.2026; CO₂ 2024: „Anteil von 1,46 Prozent an den weltweiten Emissionen“ (EDGAR); THG 2024: „globalen Anteil von 1,27 Prozent“ |

## Prüftabelle

| # | Behauptung im Entwurf | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | DE verursacht „rund 1,3 Prozent der weltweiten Treibhausgasemissionen“ (Kurz gesagt) | Q1-web, Q1-log (1,3007 %, EDGAR THG 2024) | bestätigt | Im Kurz-gesagt-Absatz fehlen Jahr und Datenbasis (2024, EDGAR). Empfehlung: „(2024)“ ergänzen. |
| 2 | Alle Länder mit gleichem oder kleinerem Anteil kommen auf „fast ein Drittel“ | Q1-web/Q1-log: 31,7 % | bestätigt | Rundung „fast ein Drittel“ für 31,7 % ist zulässig. |
| 3 | „Würden sie alle sagen ‚wir sind zu klein, um zu zählen‘, bliebe dieses Drittel unberührt.“ | Q1-web: Gedankenexperiment, *welcher Anteil wäre dann gemeinsam „zu klein, um zu zählen“* | Abweichung | „bliebe unberührt“ ist eine kontrafaktische Folgerung (keine Minderung), die der Ursprungsartikel so nicht formuliert. Der Artikel beschreibt nur, welcher Anteil unter die Logik fiele. Empfehlung: „… fiele dieses Drittel gemeinsam unter ‚zu klein, um zu zählen‘.“ |
| 4 | COP31 vom 9. bis 20. November 2026 im türkischen Antalya | Q2-unccd, Q2-unfccc | bestätigt | Ort und Datum stimmen. Die verlinkte Quelle [2] liegt aber bei der UNCCD (Wüstenkonvention), nicht beim ausrichtenden UNFCCC. Die URL mit `index%2Ephp` ist ungewöhnlich und könnte fragil sein. **Empfehlung:** [2] durch UNFCCC ersetzen, z. B. die aufgerufene und bestätigte PDF https://unfccc.int/sites/default/files/resource/COP_31_Overview_Schedule.pdf oder (nicht direkt verifiziert, vor Übernahme manuell im Browser öffnen) https://unfccc.int/cop31. |
| 5 | Das Argument „taucht in der deutschen Debatte regelmäßig auf“ | keine Quelle im Entwurf | Abweichung | Häufigkeitsbehauptung ohne Beleg (der Ursprungsartikel sagt ausdrücklich, dass dazu keine Daten erhoben wurden). Die Skill-Struktur Einordnung verlangt im Anlass „wer hat was behauptet, Link, Datum“. Empfehlung: „regelmäßig“ abschwächen („taucht immer wieder auf“, wie im Ursprungsartikel) und M1 als Beleg anführen, dass das Argument öffentlich diskutiert wird. Der Verzicht auf Namen ist mit dem Ursprungsartikel konsistent. |
| 6 | Evidenzcheck vom 31.08.2026, „mit vorab festgelegtem Analyseplan und unabhängiger Validierung“; Link | Q1-web (Datum 31.08.2026), Q1-log (SAP final v1.0, eingefroren 31.08.2026), Q1-val, Q1-gh | bestätigt | **Linkziel geprüft:** Die URL führt zum richtigen Artikel. Titel und Datum stimmen. |
| 7 | THG 2024, EDGAR: DE 1,3 %, Rang 12 von 208 Ländern | Q1-web, Q1-log | bestätigt | Hinweis (nicht zwingend): Die Weltsumme ist die Summe der Länder ohne internationalen Luft- und Seeverkehr (Q1-log). |
| 8 | Alle Länder mit höchstens 1,3 % zusammen: 31,7 % | Q1-web, Q1-log (197 von 208 Ländern), Q1-val | bestätigt | – |
| 9 | Historisch, seit 1850, fossiles CO₂ + Zement (GCP): DE 5,3 %, Rang 4 von 214; Summe 53,1 % | Q1-web, Q1-log, Q1-val | bestätigt | Zeitraum im Ursprung 1850–2024. 53,1 % ist der nach dem Bugfix validierte Wert. |
| 10 | 53,1 % nicht direkt vergleichbar mit 31,7 %, weil Gase und Zeiträume verschieden | Q1-web | bestätigt | Entspricht dem Vergleichbarkeitshinweis im Ursprungsartikel. |
| 11 | Pro Kopf 2024: DE 8,07 t CO₂-Äq., Weltdurchschnitt 6,36 t | Q1-web, Q1-log | bestätigt | – |
| 12 | Begründung der Teilmenge: „Damit niemand einkommensschwache Länder mit sehr geringem Ausstoß mitzählt“ | Q1-web: „Um eine unangemessene Vermischung mit einkommensschwachen Ländern zu vermeiden“ | Abweichung | Das Wort „mit sehr geringem Ausstoß“ ist eine Ergänzung, die im Ursprung nicht steht. Das Auswahlkriterium ist der Pro-Kopf-Ausstoß über dem Durchschnitt, nicht das Einkommen. „Damit niemand … mitzählt“ verschiebt außerdem den Sinn. Empfehlung: nah am Original bleiben, z. B. „Um eine Vermischung mit einkommensschwachen Ländern zu vermeiden, …“. |
| 13 | 58 Länder mit überdurchschnittlichem Pro-Kopf-Ausstoß; DE dort Rang 8; Summe „immer noch“ 14,2 % der weltweiten Emissionen | Q1-web, Q1-log (58 von 195 mit Bevölkerungswert; Rang 8 von 58; 14,2 % der Weltsumme) | bestätigt | Zahlen korrekt. „immer noch“ ist eine leichte Wertung, aber vertretbar. Der Ursprung nennt zusätzlich 21,0 % (Anteil an der Teilmenge). Die Auswahl „der weltweiten Emissionen“ ist korrekt bezeichnet. |
| 14 | Medien: „Häufig ist von ‚rund zwei Prozent‘ oder 1,5 Prozent die Rede.“ | im Entwurf **kein Beleg**; geprüft: M1, M2 | Abweichung | Beide Werte sind belegbar: „rund zwei Prozent“ in M1 (CO₂, Daten 2017, Stand 2021), 1,46 % ≈ 1,5 % in M2 (CO₂ 2024, EDGAR). Die Häufigkeitsangabe „häufig“ ist aber nicht belegt (keine systematische Medienauswertung). **Auflage:** M1 und M2 als Quellen [3]/[4] aufnehmen und „häufig“ durch „zum Beispiel“ bzw. „etwa“ ersetzen. |
| 15 | „Solche Angaben beziehen sich meist nur auf CO₂ … oder auf andere Jahre.“ | M1, M2 | Abweichung | Für die zwei geprüften Beispiele stimmt die Aussage: M1 (CO₂-Überschrift, Jahr 2017), M2 (CO₂, 2024). „meist“ ist eine Verallgemeinerung ohne Datengrundlage. M1 rechnet im Text zudem teils mit THG. Bemerkenswert: M2 nennt für THG 2024 selbst 1,27 % und stützt damit die 1,3 % des Entwurfs. Empfehlung: „meist“ streichen und die beiden belegten Beispiele konkret benennen. |
| 16 | Eigene Rechnung, reines CO₂: DE 1,5 %; Summe 30,1 % | Q1-web, Q1-log (1,5134 %, Rang 10; 30,1 %) | bestätigt | – |
| 17 | „Die Summe der kleineren Länder ändert sich dadurch kaum“ | Q1-web (Sensitivität ohne Wertung berichtet) | Abweichung | „kaum“ ist eine Bewertung, die im Ursprung nicht steht (31,7 → 30,1 %, also −1,6 Prozentpunkte). Sie ist nicht falsch, aber neu. Empfehlung: neutral formulieren („Sie liegt dann bei 30,1 statt 31,7 Prozent“). Das ist keine neue Berechnung, denn beide Werte sind veröffentlicht. |
| 18 | „Keine Schuldfrage … sagt nichts über Verantwortung oder Fairness“ | Q1-web („keine Aussage über historische oder moralische Verantwortung …“) | bestätigt | – |
| 19 | Konsumbasiert: DE 2,1 % (CO₂, 2023), Summe 40,5 % | Q1-web, Q1-log (2,1389 %, Rang 6 von 120 Ländern, OWID), Q1-val | bestätigt | Der Ursprung vermerkt: „Nicht direkt vergleichbar mit 2a (andere Gasbasis, anderes Jahr)“. Der Entwurf nennt nur „(CO₂, 2023)“. Empfehlung: „nicht direkt vergleichbar“ ergänzen. Basis sind nur 120 Länder mit Wert (Q1-log). Das wird im Ursprungsartikel nicht genannt und muss auch hier nicht stehen. |
| 20 | Grenze „ergibt sich aus der Debatte, nicht aus einem statistischen Kriterium“ | Q1-web („… nicht aus einem statistischen Kriterium“) | bestätigt | – |
| 21 | „Verschiebt man die Grenze um wenige Ränge, ändert sich die Summe deutlich.“ | Q1-web: „Schon eine Verschiebung um wenige Ränge verändert diesen kumulierten Wert deutlich“ und Bild „die kleinen Länder summieren sich auf X %“ … „hängt sichtbar davon ab, wo genau man die Grenze zieht“ | bestätigt | Deckt sich inhaltlich mit dem Ursprung. Präzisierung: Die Rangtabelle im Ursprung zeigt den kumulierten Anteil der *größten* Emittenten (Estimand 1a, Rang 12: 69,6 %), nicht direkt die Summe der kleineren. Der Ursprungsartikel überträgt die Aussage aber selbst ausdrücklich auf das Bild der kleinen Länder. Das ist keine neue Inferenz im Entwurf. |
| 22 | „Nichts zur COP31 selbst“ | – (Abgrenzung) | bestätigt | Korrekte Selbstbeschränkung. |
| 23 | Fazit: „Fast ein Drittel der weltweiten Emissionen stammt aus Ländern, deren Anteil nicht größer ist als der deutsche.“ | Q1-web (31,7 %) | bestätigt | Keine neue Zahl. Implizit gilt der Bezug 2024/THG/EDGAR. |
| 24 | Fazit: „‚Zu klein, um zu zählen‘ funktioniert nur, solange es nicht alle sagen.“ / „Ob ein einzelner Anteil zählt, ist deshalb auch eine Frage danach, wie viele andere in derselben Lage sind.“ | – | Abweichung | Keine neue Berechnung, aber eine argumentative Schlussfolgerung über die Zahlen hinaus. Der Ursprungsartikel bezeichnet sich als „rein deskriptiv“ und bewertet das Argument nicht. Für eine Einordnung als Fazit vertretbar, wenn als Deutung erkennbar. Der zweite Satz ist als Gedankenführung formuliert und unkritisch. Beim ersten Satz („funktioniert nur, solange …“) empfehle ich, ihn als Schluss aus dem Gedankenexperiment zu kennzeichnen (z. B. „Das Gedankenexperiment zeigt: …“). Die Entscheidung liegt bei der Redaktion. |
| 25 | Quelle [1]: Titel, Datum, Datenbasis EDGAR/GCP/Weltbank/OWID, Analyseplan/Code/Validierungsberichte auf GitHub | Q1-web, Q1-lok (Methodik-Box), Q1-gh | bestätigt | Das Repo ist öffentlich, der Ordner enthält SAP, R-Skript und beide Validierungsberichte. |
| 26 | Quelle [2]: „Veranstaltungsseite im UN-System“ | Q2-unccd | Abweichung | Formal zutreffend (UNCCD gehört zum UN-System), aber nicht die Primärquelle des Veranstalters (UNFCCC). Siehe #4. |
| 27 | Schlusszeile: Instagram, Facebook, WhatsApp-Kanal, Über/Impressum | CLAUDE.md (Abschnitt Kanäle), Skill `blog-artikel` | bestätigt | Alle vier URLs stimmen zeichengenau mit CLAUDE.md überein, ohne Tracking-Parameter. Kein LinkedIn-Link (korrekt). |

## Prüfung auf neue Inferenz (Stufe Einordnung)

- **Neue Berechnungen:** keine gefunden. Alle Zahlen (1,3 / 12/208 / 31,7 / 5,3 / 4/214 / 53,1 / 8,07 / 6,36 / 58 / Rang 8 / 14,2 / 1,5 / 30,1 / 2,1 / 40,5) stehen wörtlich im veröffentlichten Artikel und im validierten run_log. „Fast ein Drittel“ ist eine reine Rundung von 31,7 %.
- **Neue Deutungen ohne Rechnung:** „bliebe unberührt“ (#3), „kaum“ (#17), „mit sehr geringem Ausstoß“ (#12), Fazitsatz 1 (#24). Keine davon ist eine neue Rechnung. Sie gehen aber sprachlich über den deskriptiven Ursprung hinaus, daher jeweils „Abweichung“.
- **Externe, nicht eigene Zahlen:** „rund zwei Prozent“ und „1,5 Prozent“ in den Medien (#14/#15) sind derzeit unbelegt. Mit M1/M2 sind sie wörtlich belegbar und damit für die Stufe Einordnung zulässig.

## Weitere Prüfpunkte

- **Superlative:** keine gefunden.
- **Schuldzuweisungen:** keine. Personen, Parteien und Organisationen werden nicht benannt, die Schuldfrage wird ausdrücklich ausgeklammert (#18).
- **Zitate unter 15 Wörtern:** erfüllt. Zitiert werden nur „zu klein, um zu zählen“ (Eigenformel) und „rund zwei Prozent“ (3 Wörter, Beleg fehlt, siehe #14).
- **Struktur Einordnung (Skill `blog-artikel`):** Kopfzeile, Reihenzeile „Klima Kompass · Einordnung“ und Hinweiszeile sind vorhanden und wortgleich mit dem Skill. Die Reihenfolge Anlass → Frage dahinter → Was unsere Daten zeigen (mit Link) → Was die Daten nicht zeigen → Fazit (3 Sätze) → Quellen → Schlusszeile ist erfüllt. Abweichung: Der Anlass enthält nicht „wer hat was behauptet, Link, Datum“ (siehe #5), das wird bewusst ausgeklammert. Hinweis: Die Hinweiszeile („nutzt bereits veröffentlichte Ergebnisse“) deckt die externen Medienzahlen nicht ab. Wenn M1/M2 aufgenommen werden, wäre ein Zusatz wie „sowie die genannten Quellen“ sauberer (optional).
- **Umfang:** Die maschinelle Zählung des Auftraggebers (631 Wörter) habe ich übernommen und nur überschlägig nachgeprüft (ohne Shell, ca. 600–650 Wörter Fließtext). Damit liegt der Text innerhalb von 600–1000, aber nahe an der Untergrenze. Werden Quellenangaben ergänzt und Formulierungen gestrafft, sollte die Untergrenze nicht unterschritten werden.
- **Kein Freigabevermerk im Entwurf:** korrekt, nur der Standard-ENTWURF-Kopf.

## Gesamturteil: **ok mit Auflagen**

Kein Punkt ist „kritisch“. Alle Kernzahlen stimmen mit dem veröffentlichten Evidenzcheck und dem validierten Analyselauf überein, und der eigene Link führt zum richtigen Artikel.

**Auflagen (vor Vorlage zur Freigabe umzusetzen):**
1. **Medienzahlen belegen (#14/#15):** M1 (Helmholtz/klimafakten, „rund zwei Prozent“, CO₂, Daten 2017) und M2 (WiWo 24.02.2026, 1,46 % CO₂ 2024) als Quellen aufnehmen. „häufig“ und „meist“ durch konkrete Beispiele ersetzen.
2. **Quelle [2] auf UNFCCC umstellen (#4/#26):** empfohlen wird https://unfccc.int/sites/default/files/resource/COP_31_Overview_Schedule.pdf (geprüft). https://unfccc.int/cop31 vor Verwendung manuell im Browser öffnen, da hier nicht inhaltlich verifiziert.
3. **Begründung der Pro-Kopf-Teilmenge am Original ausrichten (#12):** „mit sehr geringem Ausstoß“ streichen, „Damit niemand … mitzählt“ umformulieren.
4. **Wertungen über den Ursprung hinaus neutralisieren (#3, #17):** „bliebe dieses Drittel unberührt“ und „ändert sich dadurch kaum“ umformulieren.

**Empfehlungen (nicht blockierend):** Jahr 2024 im Kurz-gesagt-Absatz ergänzen (#1). „regelmäßig“ abschwächen und M1 als Beleg im Anlass nutzen (#5). „nicht direkt vergleichbar“ bei der konsumbasierten Zahl ergänzen (#19). Ersten Fazitsatz als Schluss aus dem Gedankenexperiment kennzeichnen (#24). Hinweiszeile optional um externe Quellen ergänzen. Nach den Änderungen die Wortzahl erneut prüfen (Untergrenze 600).

## Nachtrag 1 (Nachprüfung, 19.10.2026)

**Geprüft:** überarbeiteter Entwurf `Reports/2026-10-19-cop31-trittbrettfahrer/kanal-entwuerfe/substack.md` (Stand 19.10.2026, unverändert gelassen). Zum Vergleich lag die Vorfassung vor (Scratchpad `cop31_v1.md`).
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs). **Dies ist kein Freigabevermerk.**

**Am 19.10.2026 erneut aufgerufen:**
- Q1-web: wörtlich „Um eine unangemessene Vermischung mit einkommensschwachen Ländern zu vermeiden“ und „zusätzlich auf die Teilmenge … beschränkt“. Sensitivität: „CO2-only … DE-Anteil 1,5 %, Kernzahl 30,1 % (Primärvariante 2a: 31,7 %)“. Konsum: „Nicht direkt vergleichbar mit 2a (andere Gasbasis, anderes Jahr)“. Argument: „taucht immer wieder … auf“. Der Ursprungsartikel erwähnt **keine** Medienzahlen und erklärt nicht, warum anderswo andere Prozentwerte stehen.
- Q2-unfccc (PDF): „UN Climate Change Conference - Antalya“, „9 - 20 November 2026 (sessional period)“. Der Dokumenttitel lautet „Overview Schedule“, der Dateiname „COP_31_Overview_Schedule“.
- M1 (Helmholtz/klimafakten, Autor Toralf Staud, „zuletzt aktualisiert: April 2021“): Die Seite ist als Faktencheck aufgebaut (Behauptung → „Fakt ist“ → Antwort). Die Behauptung in der Überschrift nennt CO₂. **Die Rechnung zu den „rund zwei Prozent“ ist aber ausdrücklich als Treibhausgas-Anteil formuliert:** Deutschland verursache „mehr als 700 Millionen Tonnen Kohlendioxid (und andere Treibhausgase wie Methan)“, und zwar „gemessen an den weltweiten Treibhausgas-Emissionen von deutlich über 35 Milliarden Tonnen“. Laut Fußnote beziehen sich die CO₂-Angaben auf 2017.
- M2 (WiWo, 24.02.2026): Titel und Datum stimmen. CO₂ 2024 mit „Anteil von 1,46 Prozent an den weltweiten Emissionen“ (EDGAR). THG 2024 mit „globalen Anteil von 1,27 Prozent“. Eine Erklärung für den Unterschied gibt der Artikel nicht.

### Status der Auflagen

| Auflage | Status | Belegsatz (Entwurf, Z. = Zeile) |
|---|---|---|
| 1 Medienzahlen belegen, „häufig“/„meist“ ersetzen | **teilweise erfüllt** | Z. 28: „Die Helmholtz-Klima-Initiative prüft die Behauptung ‚rund zwei Prozent‘, bezogen auf CO₂ und ältere Daten [3]. Die WirtschaftsWoche nennt für 2024 einen CO₂-Anteil von 1,46 Prozent [4].“ „häufig“ und „meist“ sind gestrichen, [3] und [4] stehen im Quellenteil. Die Werte stimmen, Titel/Datum/URL von [4] ebenso, URL von [3] ebenso. **Neu eingeführt** sind aber zwei Probleme in diesem Absatz: N1 (Erklärungssatz) und N2 (Gasbasis bei Helmholtz), siehe unten. |
| 2 Quelle [2] auf UNFCCC | **erfüllt** | Z. 47: „[2] UNFCCC: COP 31 Overview Schedule, Antalya, 9.–20.11.2026. https://unfccc.int/sites/default/files/resource/COP_31_Overview_Schedule.pdf“. Inhalt erneut bestätigt. Die Bezeichnung „COP 31 Overview Schedule“ folgt dem Dateinamen und ist unproblematisch. Die nicht verifizierte Seite unfccc.int/cop31 wird nicht verwendet. |
| 3 Pro-Kopf-Begründung am Original | **erfüllt** | Z. 26: „Um eine unangemessene Vermischung mit einkommensschwachen Ländern zu vermeiden, haben wir die Rechnung zusätzlich nur für die 58 Länder durchgeführt …“. Der Wortlaut entspricht Q1-web, „zusätzlich“ ebenso. |
| 4 Wertungen neutralisieren | **erfüllt** | Z. 8: „…, ginge es um dieses Drittel.“ Z. 28: „Die Summe der Länder bis zu diesem Anteil beträgt dann 30,1 Prozent statt 31,7 Prozent [1].“ Zu „ginge es um dieses Drittel“: Die Formulierung ist gedeckt. Sie benennt nur, welcher Anteil unter die Logik fiele, und behauptet keine kontrafaktische Wirkung mehr. Das entspricht der Fragestellung im Ursprung und Z. 16 des Entwurfs. Sie ist sprachlich etwas unbestimmt. Präziser und näher am Ursprung wäre „fiele dieses Drittel gemeinsam darunter“ (nicht blockierend). |

### Übernommene Empfehlungen

| Empfehlung | Status | Hinweis |
|---|---|---|
| Jahr 2024 im Kurz-gesagt (Z. 8) | erfüllt | „verursachte 2024 rund 1,3 Prozent“, gedeckt durch Q1-web/Q1-log. |
| „taucht immer wieder auf“ + M1 (Z. 12) | erfüllt, mit Hinweis | Die Formulierung entspricht Q1-web. „Faktencheck-Seiten wie die der Helmholtz-Klima-Initiative haben sich ausdrücklich damit beschäftigt [3]“: Für M1 ist das bestätigt. Der Plural „Faktencheck-Seiten“ ist nur mit einem Beispiel belegt (M1 erscheint inhaltsgleich auch bei klimafakten.de). **Abweichung, gering:** Empfehlung „Die Faktencheck-Seite der Helmholtz-Klima-Initiative hat sich ausdrücklich damit beschäftigt [3].“ |
| „nicht direkt vergleichbar“ Konsum (Z. 33) | erfüllt | Gedeckt durch Q1-web („andere Gasbasis, anderes Jahr“). |
| Fazit „Unser Gedankenexperiment legt nahe:“ (Z. 39) | erfüllt | Als Deutung gekennzeichnet. |
| Hinweiszeile „und die genannten Quellen“ (Z. 6) | erfüllt | – |
| Wortzahl | nicht unabhängig nachgezählt | Die Angabe von 679 Wörtern ist übernommen (keine Shell verfügbar). Überschlägig liegt der Text im Bereich 600–1000. |

### Neue Probleme

| # | Behauptung im Entwurf | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| N1 | Z. 28: „Der Unterschied zu unseren 1,3 Prozent liegt vor allem daran, ob nur CO₂ oder alle Treibhausgase gezählt werden, und an den Bezugsjahren.“ | Q1-web, M1, M2 | **Abweichung** (neue Inferenz, nicht kritisch) | Der Satz ist eine **kausale Zerlegung des Unterschieds („vor allem“)**, die weder im Ursprungsartikel noch in M1 oder M2 steht. Der Ursprung erwähnt Medienzahlen gar nicht. Zu den Teilen: (a) **WiWo (1,46 %):** Das Bezugsjahr ist 2024, also dasselbe wie bei uns. Der Unterschied ist hier nur die Gasbasis. Das ist belegbar: M2 nennt selbst für THG 2024 1,27 %, unsere CO₂-Variante ergibt 1,5 % [1]. „Bezugsjahre“ trifft für dieses Beispiel nicht zu. (b) **Helmholtz („rund zwei Prozent“):** M1 formuliert die Rechnung ausdrücklich als Treibhausgas-Anteil (siehe N2) mit Daten von 2017. Ob der Unterschied hier „vor allem“ an der Gasbasis oder am Jahr liegt (oder an grober Rundung bzw. anderer Datenquelle: M1 nennt für THG auch UNFCCC-Daten), ist mit veröffentlichten eigenen Ergebnissen nicht belegbar. Einen deutschen Anteil für 2017 haben wir nicht berechnet. Die Gewichtung „vor allem“ wäre eine neue Inferenz und ist in der Stufe Einordnung nicht zulässig. **Auflage N1:** Den Satz deskriptiv fassen, ohne Ursachengewichtung, z. B. „Die Angaben unterscheiden sich darin, ob nur CO₂ oder alle Treibhausgase gezählt werden, und im Bezugsjahr.“ Alternativ die WiWo-eigene THG-Zahl als Beleg nennen: „Für alle Treibhausgase nennt die WirtschaftsWoche selbst 1,27 Prozent [4].“ Dieser Satz wäre rein beschreibend und deckt den Gasbasis-Effekt sauber ab. |
| N2 | Z. 28: Helmholtz prüft „‚rund zwei Prozent‘, bezogen auf CO₂ und ältere Daten [3]“ | M1 | **Abweichung** | „ältere Daten“ ist gedeckt (CO₂-Angaben 2017, Stand April 2021). „bezogen auf CO₂“ trifft nur für die Überschrift der Behauptung zu. Die eigentliche Zwei-Prozent-Rechnung in M1 nennt ausdrücklich „Treibhausgas-Emissionen“ (Welt) und „Kohlendioxid (und andere Treibhausgase wie Methan)“ (Deutschland). Schon im Erstcheck war die Gasbasis von M1 als „gemischt“ vermerkt (Quellentabelle M1, #15). Der Entwurf stellt sie nun einseitig als CO₂ dar und stützt darauf die Erklärung in N1. **Auflage N2:** z. B. „Die Helmholtz-Klima-Initiative prüft die Behauptung ‚rund zwei Prozent‘ des CO₂-Ausstoßes; ihre Zahlen beruhen auf Daten von 2017 [3].“ Ohne eigene Zuordnung der Gasbasis. |
| N3 | Quelle [3] ohne Datum/Stand | M1 | Abweichung (gering) | Für die Einordnung als „ältere Daten“ sollte der Stand nachprüfbar sein. Empfehlung: In [3] „zuletzt aktualisiert April 2021; Daten 2017“ ergänzen (nicht blockierend). |

### Prüfung auf neue Inferenz (Nachtrag)

- **Neue Berechnungen:** keine. Neu hinzugekommen sind nur 1,46 % (M2, wörtlich) und „rund zwei Prozent“ (M1, wörtlich). Alle eigenen Zahlen sind unverändert und gedeckt (siehe Erstcheck).
- **Neue Inferenz ohne Rechnung:** N1 (Ursachengewichtung „vor allem … und an den Bezugsjahren“). Mittelbar betroffen ist N2, weil der Entwurf die Gasbasis von M1 einseitig als CO₂ darstellt.
- **Entfallene Inferenzen:** „bliebe unberührt“, „kaum“, „mit sehr geringem Ausstoß“, „häufig“, „meist“, „regelmäßig“. Der Fazitsatz ist jetzt als Deutung gekennzeichnet.

### Neues Gesamturteil: **ok mit Auflagen**

Kein Punkt ist „kritisch“. Die Auflagen 2, 3 und 4 sind erfüllt. Auflage 1 ist erfüllt, was Belege, Werte und die gestrichenen Häufigkeitswörter betrifft. Der neu formulierte Erklärungsteil des Medienabschnitts führt aber eine neue Inferenz ein und gibt eine Quelle verkürzt wieder.

**Restauflagen (vor Vorlage zur Freigabe umzusetzen):**
- **N1:** Den Satz „Der Unterschied zu unseren 1,3 Prozent liegt vor allem daran, … und an den Bezugsjahren“ ohne Ursachengewichtung rein beschreibend formulieren oder durch den wörtlichen WiWo-THG-Wert (1,27 % für 2024 [4]) ersetzen bzw. ergänzen.
- **N2:** „bezogen auf CO₂“ bei Helmholtz streichen oder korrigieren. M1 rechnet die zwei Prozent ausdrücklich als Treibhausgas-Anteil (Daten 2017).

**Empfehlungen (nicht blockierend):** „Faktencheck-Seiten wie die …“ in den Singular setzen. In [3] Stand und Datenjahr ergänzen (N3). „ginge es um dieses Drittel“ optional zu „fiele dieses Drittel gemeinsam darunter“ präzisieren. Die Wortzahl nach den Änderungen erneut maschinell prüfen.

## Nachtrag 2 (19.10.2026)

**Geprüft:** Entwurf `Reports/2026-10-19-cop31-trittbrettfahrer/kanal-entwuerfe/substack.md` (Stand 19.10.2026, unverändert gelassen). Verglichen wurden die geänderten Stellen und der übrige Text mit den Belegsätzen aus Nachtrag 1.
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs). **Dies ist kein Freigabevermerk.**

**Am 19.10.2026 erneut aufgerufen:**
- M1 (helmholtz-klima.de): „zuletzt aktualisiert: April 2021“ bestätigt. Laut Hinweis am Textende beziehen sich alle CO₂-Angaben auf „das Jahr 2017“ (EDGAR). Für Treibhausgasdaten verweist die Seite auf das UN-Klimasekretariat, **ohne Jahresangabe**. Die eigentliche Zwei-Prozent-Rechnung („mehr als 700 Millionen Tonnen Kohlendioxid (und andere Treibhausgase wie Methan)“ / „weltweiten Treibhausgas-Emissionen von deutlich über 35 Milliarden Tonnen“) ist selbst nicht datiert.
- M2 (wiwo.de, 24.02.2026): CO₂ 2024 „rund 579,9 Millionen Tonnen“, Anteil 1,46 Prozent (EDGAR). THG 2024 „0,67 Gigatonnen an CO2-Äquivalenten“, „globalen Anteil von 1,27 Prozent“. Beide Werte bestätigt.

### Status N1/N2/N3

| # | Neuer Wortlaut (Entwurf, Z. = Zeile) | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| N1 | Z. 28: Der Satz „Der Unterschied … liegt vor allem daran …“ ist gestrichen. Neu: „Die WirtschaftsWoche nennt für 2024 einen CO₂-Anteil von 1,46 Prozent, für alle Treibhausgase dagegen 1,27 Prozent [4].“ | M2 | **erfüllt / bestätigt** | Beide Werte, Jahr und Gasbasis stimmen wörtlich mit M2 überein. Die Ursachengewichtung ist entfallen. „dagegen“ markiert nur den Kontrast und ist keine Kausalaussage. |
| N1 (Folgesatz) | Z. 28: „In unserer Rechnung liegt der deutsche Anteil bei reinem CO₂ bei 1,5 Prozent. Die Summe der Länder bis zu diesem Anteil beträgt dann 30,1 Prozent statt 31,7 Prozent [1].“ | Q1-web, Q1-log (1,5134 %; 30,1 %; 31,7 %) | bestätigt | Unverändert gedeckt, siehe #16 und Auflage 4. |
| N2 | Z. 28: „Die Helmholtz-Klima-Initiative prüft die Behauptung ‚rund zwei Prozent‘ auf Basis von Daten aus dem Jahr 2017 [3].“ | M1 | **erfüllt**, mit Hinweis: Abweichung (gering, nicht blockierend) | Die falsche Zuordnung „bezogen auf CO₂“ ist entfernt, die Gasbasis wird nicht mehr zugeordnet. Damit ist die Auflage N2 erfüllt. „Daten aus dem Jahr 2017“ ist durch den Hinweis der Seite gedeckt, soweit es die CO₂-Angaben betrifft. Die Treibhausgasdaten, mit denen die Zwei-Prozent-Rechnung ausdrücklich formuliert ist, sind auf der Seite aber nicht datiert. Die Aussage ist daher etwas genauer, als die Quelle es hergibt. Präziser wäre z. B. „überwiegend auf Basis von Daten aus dem Jahr 2017“ oder „mit Daten, die sich laut Seite auf 2017 beziehen“. Optional, kein Sachfehler im engeren Sinn. |
| N3 | Z. 49: [3] „… (Daten 2017, Stand April 2021). https://www.helmholtz-klima.de/klimafakten/…“ | M1 | erfüllt | Stand April 2021 bestätigt. „Daten 2017“ wie bei N2 (CO₂-Angaben 2017, THG ohne Jahr). Titel und URL unverändert korrekt. |
| Empfehlung Singular | Z. 12: „Die Faktencheck-Seite der Helmholtz-Klima-Initiative hat sich ausdrücklich damit beschäftigt [3].“ | M1 | erfüllt / bestätigt | Wortgleich mit der Empfehlung aus Nachtrag 1. M1 ist als Faktencheck aufgebaut (Behauptung → „Fakt ist“). |

### Abgleich übriger Text mit den Belegsätzen aus Nachtrag 1

| Stelle | Ergebnis |
|---|---|
| Z. 6 Hinweiszeile „… und die genannten Quellen …“ | unverändert |
| Z. 8 „verursachte 2024 rund 1,3 Prozent …“ / „ginge es um dieses Drittel“ | unverändert (optionale Präzisierung „fiele dieses Drittel gemeinsam darunter“ nicht übernommen, nicht blockierend) |
| Z. 12 „taucht immer wieder ein Argument auf“ | unverändert, nur der Folgesatz ist in den Singular gesetzt (siehe oben) |
| Z. 20, 22, 24 (Link, 1,3 %/Rang 12 von 208/31,7 %; 5,3 %/Rang 4 von 214/53,1 %) | unverändert, weiterhin gedeckt (#6–#10) |
| Z. 26 Pro-Kopf-Absatz (8,07/6,36 t, 58 Länder, Rang 8, 14,2 %) | unverändert, wortgleich mit dem Belegsatz zu Auflage 3 |
| Z. 32–35 „Was die Daten nicht zeigen“ (2,1 %, 2023, 40,5 %, „nicht direkt vergleichbar“) | unverändert |
| Z. 39 Fazit „Unser Gedankenexperiment legt nahe: …“ | unverändert |
| Z. 45, 47, 51 Quellen [1], [2], [4] | unverändert, [2] und [4] wie in Nachtrag 1 bestätigt |
| Z. 54 Schlusszeile | unverändert, URLs zeichengenau wie in CLAUDE.md |

Sonst habe ich keine Änderungen festgestellt. Einschränkung: Der Abgleich erfolgte gegen die in Nachtrag 1 festgehaltenen Belegsätze und Prüfpunkte, nicht per `git diff` (keine Shell verfügbar).

### Prüfung auf neue Inferenz (Nachtrag 2)

- **Neue Berechnungen:** keine. Neu ist nur der Wert 1,27 % (M2, wörtlich). Eine Differenz oder ein eigener Abgleich (z. B. 1,27 % gegenüber 1,3 %) wird nicht berechnet und nicht behauptet.
- **Neue Inferenz ohne Rechnung:** keine. Die Ursachengewichtung aus N1 ist entfallen. Der Absatz stellt die Zahlen jetzt nebeneinander, ohne sie kausal zu erklären.

### Umfang

Die Angabe „ca. 660 Wörter, maschinell gezählt“ ist von der Hauptsession übernommen und hier nicht unabhängig nachgezählt (keine Shell). Überschlägig ist sie plausibel, der Text liegt im Bereich 600–1000.

### Neues Gesamturteil: **ok (ohne blockierende Auflagen)**

Kein Punkt ist „kritisch“. Die Restauflagen N1 und N2 aus Nachtrag 1 sind erfüllt, ebenso N3 und die Singular-Empfehlung. Alle Zahlen im Entwurf sind durch [1], [3] oder [4] wörtlich gedeckt. Es gibt keine neue Berechnung und keine neue Inferenz.

**Restauflagen:** keine.

**Empfehlungen (nicht blockierend):**
- „auf Basis von Daten aus dem Jahr 2017“ (Z. 28) bzw. „Daten 2017“ (Z. 49) optional abschwächen („überwiegend“ oder „laut Seite“), weil M1 nur die CO₂-Angaben ausdrücklich auf 2017 datiert.
- „ginge es um dieses Drittel“ optional präzisieren (siehe Nachtrag 1).
- Wortzahl und unveränderten Resttext vor der Freigabe per `git diff` bzw. Zählung in der Hauptsession bestätigen.
