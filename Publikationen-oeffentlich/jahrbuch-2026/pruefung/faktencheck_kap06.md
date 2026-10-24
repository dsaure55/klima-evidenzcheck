# Faktencheck Kapitel 6 (Jahrbuch 2026): „Wo steht die Welt beim 1,5-Grad-Ziel, und kann man CO₂ einfach wieder aus der Luft holen?“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/06-welt.md` (Entwurf v0.1, 24.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 119 ist nicht Buchtext).
**Geprüfte Grafiken:** `grafiken/kap06_grafik1_erwaermung.png`, `kap06_grafik2_unep_minderung.png`, `kap06_grafik3_cdr_luecke.png` (als Bilder gelesen) und `grafiken/kap06_grafiken.R` (Zahlen fest eingetragen).
**Prüfdatum:** 24.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5: volle Faktencheck-Datei für „Kurz gesagt“, „Was heißt das für dich?“, „Lagen wir richtig?“; Differenzprüfung für den Haupttext. Regel: keine neue Berechnung, keine neue Inferenz; der Stil darf nichts verändern, verstärken oder abschwächen (`stilregeln.md`). Neu gegenüber den Artikeln: die Ergänzungen aus der UNEP-Executive-Summary [14] (Entscheidung Daniel Saure, Gliederung Kap. 6, Entscheidung 3). Sie werden hier einzeln gegen die Textdatei geprüft.
**Stufen der Ausgangsstücke:** [16] und [17] sind Wissensstücke, [18] ist eine Einordnung; alle drei haben eigene Faktencheck-Dateien (Endstand „ok“).

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| [16] „Monate über 1,5 Grad …“, Referenzfassung `quellen-artikel/2026-10-16_monate-uber-15-grad-ist-das-pariser.html` (Abruf 22.10.2026, Korrektur 16.10. eingearbeitet) | gelesen (vollständig) | Abgleich vollständig |
| [17] „Kann man CO₂ einfach wieder aus der Luft holen?“, Referenzfassung `quellen-artikel/2026-10-18_kann-man-co-einfach-wieder-aus-der.html` | gelesen (vollständig) | Abgleich vollständig |
| [18] „Zurück auf 1,5 Grad …“, Referenzfassung `quellen-artikel/2026-10-21_zuruck-auf-15-grad-was-der-neue-un.html` | gelesen (vollständig) | Abgleich vollständig |
| UNEP Executive Summary [14], Textdatei `Reports/2026-10-21-emissions-gap-2026/ES_EmissionsGapReport2026_text.txt` (extrahiert am 24.10.2026, nicht committed) | gelesen (vollständig, 817 Zeilen) | Alle ES-Zahlen des Kapitels einzeln abgeglichen (Tabelle in Abschn. 2.3). Die Datei ist kein gültiges UTF-8 („°C“ erscheint als Ersatzzeichen), die Zahlen sind aber eindeutig lesbar. Das PDF selbst und der Volltext des Berichts wurden nicht gesehen. |
| UNEP-Pressemitteilung [13] | WebFetch 24.10.2026: HTTP 403; Wortlaut-Auszüge aus dem privaten Abrufprotokoll `Redaktion/ideen/2026-10-21-unep-pressemitteilung-abruf.md` (Session-Protokoll vom 21.10.2026, kein eigener Abruf) | Pressemitteilungs-Zitate (320 Gt = „around eight years of 2024’s global CO2 emissions“, 220 Evaluationen, 9 %, 5–13 %, 3×/7×) nur über dieses Protokoll belegt |
| Faktenchecks zu den drei Artikeln: `Reports/2026-10-16-el-nino-1-5-grad/faktencheck.md` (mit Nachtrag und `korrektur_2026-10-16.md`), `Reports/2026-10-18-co2-entnahme/faktencheck.md` (Nachträge 1–2), `Reports/2026-10-21-emissions-gap-2026/faktencheck.md` (mit Nachprüfung) | gelesen | Endstände „ok“; offen blieben dort: IPCC-Original (ipcc.ch 403), Primärabruf der UNEP-Pressemitteilung |
| State of CDR, lokaler Textauszug `Reports/2026-10-18-co2-entnahme/quellen/State-of-CDR-Edition-3_June2026.txt` | gelesen (Executive Summary Z. 322–498, 610–640; Deutschland Z. 2820–2829) | 2,2 Gt; 5 %; 99,9 %; 0,002 Gt; 40 %; 0,008 Gt/20 %; 2,5/2,9, Lücke 0,3/1,2/5,2; ≥ 80 %; Kosten; 82 %; 85 %; 98/11,5/320 Mio. Euro bestätigt. Weitere Stellen über den Faktencheck zu [17] |
| Copernicus, DWD, WMO, NOAA, IPCC (Primärquellen von [16]) | nicht erneut geöffnet | nur über [16] und dessen Faktencheck abgedeckt |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4, E-Nummern auf die Empfehlungen in Abschnitt 5.

### 2.1 Kurz gesagt (Z. 5)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Ein einzelner Monat über 1,5 Grad bedeutet nicht, dass das Pariser Ziel gerissen ist. Maßgeblich ist die Erwärmung über Jahrzehnte (beim Weltklimarat IPCC das 20-Jahres-Mittel).“ | [16] (Kurzantwort), WMO „decades“, IPCC AR6 | bestätigt | „über Jahrzehnte“ plus IPCC-20-Jahres-Mittel entspricht der Korrektur E3 im Faktencheck zu [16]. |
| 2 | „UNEP geht inzwischen davon aus, dass die Welt die 1,5 Grad überschreitet, und rechnet einen Weg zurück“ | [18]; ES (Überschrift: „exceedance of 1.5°C unavoidable“) | bestätigt | ES: „larger exceedance … based on multidecadal averages is now imminent and unavoidable“. |
| 3 | „Dafür müssten die Emissionen bis 2030 um 18 Prozent sinken (gegenüber 2025).“ | ES (18 % by 2030, Basis 2025) | bestätigt | |
| 4 | „Die Klimazusagen der Staaten bringen 5 bis 8 Prozent.“ | ES („full implementation of the new NDCs submitted by around two thirds of all countries … 5–8 per cent by 2030“) | Abweichung (gering) | ES bezieht sich auf die **neuen** NDCs, die bis 1.9.2026 von 124 Parteien (rund 76 % der Emissionen, ES Punkt 2) eingereicht wurden. „Klimazusagen der Staaten“ ist weiter gefasst. A4. |
| 5 | „CO₂ aus der Luft zu holen, ist keine Abkürzung: Heute geschieht das fast nur über Wälder und Böden, und es ergänzt die Minderung, ersetzt sie aber nicht.“ | [17], State of CDR ES (Punkte 1, 3) | bestätigt | „keine Abkürzung“ ist ein Bild; durch „smaller role than emissions reductions“ (Faktencheck [17], F5) gedeckt. E3. |

### 2.2 Was gemessen wurde / Wie das Ziel gemessen wird (Z. 9–27) und Grafik 1

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 6 | „Copernicus meldete am 12. Oktober 2026: Der September 2026 war weltweit der zweitwärmste September seit Beginn der Datenreihe. Er lag 1,63 Grad über dem Mittel von 1850 bis 1900 … Es war der zweite Monat in Folge über 1,5 Grad [1].“ | [16]; Faktencheck [16] Nr. 1–4 | bestätigt | Primärquelle [1] nicht erneut geöffnet. |
| 7 | „Laut vorläufiger Bilanz des DWD lag das Monatsmittel bei 15,9 °C, 2,1 Grad über dem Mittel von 1991 bis 2020 [2].“ | [16]; Faktencheck [16] Nr. 6–7 | bestätigt | Die letzten zwei Tage beruhen laut DWD auf Prognosen. |
| 8 | „Das Pariser Abkommen legt selbst nicht fest, wie die Erwärmung gemessen wird. Nach Angaben der WMO … typischerweise über Jahrzehnte [3].“ | [16]; Faktencheck [16] Nr. 9–10 | bestätigt | |
| 9 | „Der IPCC gibt die globale Erwärmung … als gleitendes 20-Jahres-Mittel … Er stellt ausdrücklich fest, dass einzelne Jahre über 1,5 Grad nicht bedeuten, dass diese Erwärmungsstufe erreicht ist [4].“ | [16]; SPM B.1.4/Fußnote 24 | bestätigt (mit Vorbehalt) | Wortlaut nur über den Textspiegel plaintextipcc.com geprüft (ipcc.ch: 403), siehe Faktencheck [16], E7 (offen). Nicht-Geprüftes, Abschn. 6. |
| 10 | „In seinem Sonderbericht von 2018 hatte er noch einen 30-Jahres-Zeitraum zugrunde gelegt [5].“ | [16]; Faktencheck [16] Nr. 13 | nicht prüfbar (direkt) | Nur über Suchergebnisse inhaltlich gestützt. |
| 11 | „Die Idee dahinter ist in beiden Fällen dieselbe: Natürliche Schwankungen … sollen den langfristigen Trend nicht verdecken.“ | [16]; Faktencheck [16] Nr. 14 | bestätigt | |
| 12 | „2024 lag nach WMO-Angaben bei etwa 1,55 Grad und war damit wahrscheinlich das erste Kalenderjahr über 1,5 Grad [7].“ | [16]; Faktencheck [16] Nr. 21 | bestätigt | |
| 13 | „2025 war mit etwa 1,43 Grad kühler [9], unter anderem wegen La Niña. … eines der drei wärmsten Jahre seit Messbeginn [8].“ | [16] (korrigierte Fassung: 1,43 aus State of the Global Climate 2025); Faktencheck [16] Nr. 22–24, Nachtrag A3 | bestätigt | Der ältere Wert 1,44 (Januar 2026) ist im Kapitel nicht verwendet. |
| 14 | „Beide Werte haben eine Unsicherheit von ±0,13 Grad [7][9].“ | [16] ([7][11]); Faktencheck [16] Nachtrag A2 | bestätigt | |
| 15 | „Die langfristige Erwärmung schätzte die WMO für 2024 auf 1,34 bis 1,41 Grad [7].“ | [16]; Faktencheck [16] Nr. 27 | bestätigt | Eine neuere Langfristschätzung (WMO-No. 1391, Volltext) blieb dort ungeprüft; „für 2024“ stellt den Stand klar. |
| 16 | „Nach IPCC-Bewertung erreicht das 20-Jahres-Mittel die 1,5 Grad in den meisten betrachteten Szenarien nach zentraler Schätzung Anfang der 2030er-Jahre. Im Szenario mit sehr hohen Emissionen geschieht das noch früher [10].“ | [16] ([13] dort = Technical Summary, Cross-Section Box TS.1); Faktencheck [16] Nr. 28, Nachtrag A5 | bestätigt (mit Vorbehalt) | Nur über Textspiegel verifiziert (Nicht-Geprüftes). |
| 17 | „Zur Schwankung gehört auch El Niño, die warme Phase eines wiederkehrenden Musters im tropischen Pazifik. Der aktuelle El Niño ist ungewöhnlich stark: … NOAA meldete am 8. Oktober für den vergangenen Monat eine Anomalie von +2,1 Grad … 83 Prozent … [11].“ | [16]; Faktencheck [16] Nr. 15–18 | bestätigt | |
| 18 | „Seit Februar 2026 nutzt die NOAA einen neuen Index (RONI) … nicht ohne Weiteres vergleichen [12].“ | [16]; Faktencheck [16] Nr. 19–20 | bestätigt | |
| 19 | „Copernicus rechnet damit, dass dieser El Niño einer der stärksten seit Beginn der Aufzeichnungen wird [1].“ | [16] („dürfte einer der stärksten … werden“); Faktencheck [16] A1 (C3S: „likely resulting in one of the strongest“) | Abweichung (gering) | Das Wahrscheinlichkeitswort „dürfte“/„likely“ ist weggefallen („rechnet damit … wird“). A8. |
| 20 | „Zwei Sätze liest man oft falsch.“ | [16] („Häufiger Irrtum vs. Befund“) | Abweichung (gering) | „oft“ ist eine Häufigkeitsbehauptung ohne Beleg (Faktencheck [16] Nr. 31 und Kap. 5 A2 beanstanden dasselbe Muster). A9. |
| 21 | „„Über 1,5 Grad, also ist das Pariser Ziel gescheitert“ stimmt so nicht: Einzelne Monate und Jahre … nicht, dass das Ziel verfehlt ist [3][4][7].“ | [16] (Irrtum 1) | bestätigt | |
| 22 | „„Dann ist ja noch reichlich Luft“ stimmt auch nicht: Die Schwelle ist nah, und die Monate über 1,5 Grad, zuletzt August und September 2026 [1], zeigen das.“ | [16] (Irrtum 2: „Sie zeigen aber deutlich, wie nah die Schwelle ist“) | bestätigt | „August“ ist aus „second consecutive month“ abgeleitet (Faktencheck [16], E4). |

#### Grafik 1

| Nr. | Punkt | Befund | Ergebnis | Hinweis |
|---|---|---|---|---|
| G1 | Werte | Sept. 2026 1,63; 2024 1,55 (±0,13); 2025 1,43 (±0,13); langfristig (für 2024) 1,34–1,41; Marke 1,5 | bestätigt | Alle Werte stimmen mit [16], Faktencheck [16] und Skript überein. |
| G2 | Streubalken ±0,13 | Linien von 1,42 bis 1,68 (2024) und 1,30 bis 1,56 (2025) | bestätigt | Korrekt als Wert ± 0,13 gezeichnet. Die Bedeutung („Unsicherheit laut WMO“) steht nur in der Quellenzeile; welches Konfidenzniveau ±0,13 hat, geben die Quellen im Kapitel nicht an (E7). |
| G3 | Beschriftung der Achse und Zeilen | „Grad über dem vorindustriellen Niveau (1850–1900)“; „Monat: September 2026“, „Kalenderjahr 2024/2025“, „Langfristige Erwärmung (für 2024)“ | bestätigt | Referenzperiode 1850–1900 wird als „vorindustriell“ bezeichnet, wie in [16] („Näherung“) und der Quellenzeile; in der Achsenbeschriftung ohne „Näherung“. |
| G4 | Titel „Ein Monat über 1,5 Grad ist nicht dasselbe wie das Pariser Ziel“ | Aussage inhaltlich gedeckt (Nr. 1, 21) | Abweichung (gering) | Missverständlicher Wortlaut („nicht dasselbe wie das Pariser Ziel“), [16]: „Ob das Pariser Ziel verfehlt ist, lässt sich an ihm allein nicht ablesen.“ A7. |
| G5 | Darstellung Monat, Jahr und langfristig auf einer Achse | Drei verschiedene Größen (Copernicus-Monatswert aus ERA5; WMO-Jahreswerte aus mehreren Datensätzen; WMO-Langfristschätzung) werden nebeneinander gezeigt | Abweichung | Der Faktencheck zu [16] („Stufen-Check“) hält fest: Monatswert (C3S/ERA5) und Langfristschätzung (WMO, mehrere Datensätze) stammen aus verschiedenen Produkten; „eine Differenz sollte daraus nicht gerechnet werden“. Die Grafik lädt zu genau diesem Vergleich ein und sagt es nicht. Der IPCC-Maßstab (20-Jahres-Mittel) wird nicht gezeigt; „Langfristige Erwärmung“ ist WMO-Schätzung für 2024, nicht das IPCC-20-Jahres-Mittel. A7. |
| G6 | Quellenzeile | „Quellen: Copernicus … (12.10.2026), WMO … Zusammenstellung: Klima Kompass.“ | bestätigt (mit Hinweis) | Titel, Einheit, Datenstand, Quelle vorhanden. Der Datensatzunterschied (G5) fehlt. |

### 2.3 Der Weg zurück auf 1,5 Grad (Z. 31–51) und Grafik 2: Abgleich mit der Executive Summary

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 23 | „Am 21. Oktober 2026 hat UNEP den „Emissions Gap Report 2026“ veröffentlicht, Titel: „The Point of Return“ [13][14].“ | [18]; ES (Titelseite „The point of return“, 17. Report); PM-Protokoll (21.10.2026) | bestätigt | Datum nur über das PM-Protokoll belegt (nicht in der ES-Textdatei). |
| 24 | „Laut UNEP lässt sich nicht mehr verhindern, dass die Erwärmung 1,5 Grad um mehr als 0,1 Grad überschreitet.“ | ES („it is now inevitable that warming will exceed 1.5°C by more than 0.1°C“) | bestätigt | Gilt laut ES für Mehrjahresmittel („based on multidecadal averages“). Das Kapitel sagt „die Erwärmung“; die Einschränkung auf Mehrjahresmittel fehlt (kein Fehler, passt aber zum Kapitelthema, siehe E6). |
| 25 | „Der Bericht rechnet deshalb ein Szenario mit dem „kleinstmöglichen“ Überschießen durch, auf Englisch „overshoot“.“ | ES („lowest possible 1.5°C overshoot scenario“) | bestätigt | |
| 26 | „Wir haben die Zahlen aus der Pressemitteilung mit der Zusammenfassung des Berichts (Executive Summary) abgeglichen [13][14].“ | ES-Textdatei; Abgleich Nr. 27–45 | Abweichung | Beim Abgleich hat sich ein Unterschied ergeben (Nr. 42): Er ist im Kapitel nicht benannt. A1, A6. |
| 27 | „Mit sofort einsetzenden, sehr strengen Minderungen hat die Erwärmung mit 66 Prozent Wahrscheinlichkeit um die Jahrhundertmitte ihren Höhepunkt bei 1,7 bis 1,8 Grad.“ | ES („limiting peak warming to 1.7–1.8°C with 66 per cent chance“; Tabelle ES.1: 66 %-Wahrscheinlichkeit, Spitze 1,8 (1,7–1,8)) | Abweichung (gering) | ES: 66 % Wahrscheinlichkeit, dass die Spitze **auf** 1,7–1,8 Grad **begrenzt** bleibt (Tabelle: 50 % → 1,7; 66 % → 1,8; 90 % → 2,1). „hat … ihren Höhepunkt bei 1,7 bis 1,8“ liest sich wie eine Punktaussage. „Um die Jahrhundertmitte“ steht in PM und ES. A2. |
| 28 | „Bis 2100 sinkt sie dann mit etwa 50 Prozent Wahrscheinlichkeit wieder auf 1,5 Grad oder darunter [13][14].“ | ES („returning … to or below 1.5°C by 2100 with around a 50 per cent chance“) | bestätigt | |
| 29 | Tabelle 2030: „−18 % (Spanne 15 bis 36)“ | ES Punkt 6 („18 per cent (range: 15–36) … by 2030“) | bestätigt | |
| 30 | Tabelle 2035: „−45 % (Spanne 30 bis 60)“ | ES Punkt 6 („45 per cent (range: 30–60) by 2035“) | bestätigt | |
| 31 | Tabelle 2040: „−69 % (Spanne 60 bis 76)“ | ES Punkt 6 („69 per cent (range: 60–76) by 2040“) | bestätigt | Alle drei Werte relativ zu 2025. |
| 32 | NDC-Spalte: „−5 bis −8 %“ (2030), „−11 bis −15 %“ (2035), „−20 bis −27 %“ (2040) | ES Punkt 6 („5–8 per cent by 2030, 11–15 per cent by 2035 and 20–27 per cent by 2040, depending on the conditionality of NDCs“) | bestätigt (Werte) / Abweichung (Überschrift) | Die Werte stimmen. Überschrift „bei voller Umsetzung der Klimazusagen (NDCs)“: ES nennt die **neuen** NDCs von rund zwei Dritteln der Staaten, und die Spanne ergibt sich aus der Bedingtheit (unconditional/conditional). Beides fehlt (A4). Der 2040-Wert steht in [18] nicht („–“) und ist die eigentliche Ergänzung aus ES. |
| 33 | „Das entspricht laut UNEP einer durchschnittlichen Minderung von 5,7 Prozent pro Jahr zwischen 2025 und 2035 (Spanne 3,4 bis 8,7).“ | ES („average annual rate of 5.7 per cent (range: 3.4–8.7) between 2025 and 2035“) | bestätigt | Die Spanne ist neu gegenüber [18]. |
| 34 | „Die älteren Pfade aus dem Sechsten Sachstandsbericht des IPCC verlangten etwa 5 Prozent pro Jahr [14].“ | ES („the previous benchmark of cutting emissions to 43 per cent below 2019 levels by 2030 required an average reduction rate of 5.0 per cent per year“, für 1,5 °C mit höchstens 0,1 °C Überschießen, Start 2019); PM („old AR6 pathways … about 5 per cent“) | Abweichung | ES gibt den Kontext, den das Kapitel weglässt: Der Vergleichswert (5,0 %) gilt für ein anderes Ziel (≤ 0,1 °C Überschießen) und einen anderen Start (2019, −43 % bis 2030 gegenüber 2019). Der Faktencheck zu [18] (Empfehlung 6) wollte diesen Zusatz; er war damals mangels Quelle nicht übernommen worden und ist jetzt belegbar. Die Zuordnung „Sechster Sachstandsbericht“ steht in der PM; die ES nennt „previous benchmark“ und im Punkt 5 „outdated scenarios from IPCC AR6“. A3. |
| 35 | „Wo die Welt heute hinsteuert: Läuft die aktuelle Politik weiter, ist es mit 66 Prozent Wahrscheinlichkeit so, dass die Erwärmung bis 2100 auf 2,8 Grad begrenzt bleibt, danach steigt sie weiter.“ | ES Punkt 7 („66 per cent chance that warming will be limited to 2.8°C by 2100, while continuing to increase thereafter“) | bestätigt | Präziser als [18] („könnte … 2,8 Grad erreichen“, PM: „could reach 2.8°C“). [18] bleibt unkorrigiert; Verweis Kapitel 8 (E4). |
| 36 | „Werden alle Zusagen eingehalten, sind es 2,6 Grad.“ | ES („If all NDCs are delivered and similar efforts continue, there is a 66 per cent chance that warming will be limited to 2.6°C by 2100“) | Abweichung | Der 66-%-Vorbehalt und „ähnliche Anstrengungen halten an“ fehlen in diesem Satz; er liest sich wie eine Punktschätzung. Der Vorbehalt steht nur im vorigen Satz. A2. |
| 37 | „Im optimistischsten Fall, mit allen Zusagen und zusätzlichen Netto-null-Zielen, sind es 2,1 Grad.“ | ES („where all NDCs and net-zero targets are achieved, and similar efforts are maintained thereafter, … 66 per cent chance … limited to 2.1°C this century“) | Abweichung | Wie Nr. 36. A2. |
| 38 | „Diese Werte sind schlechter als im Vorjahresbericht.“ | ES Punkt 7 (Überschrift: „… only the scenario based on current policies remains unchanged“); PM („These outcomes are worse than last year’s projections“) | **Abweichung** | ES: Nur das Szenario „aktuelle Politik“ (2,8 Grad) ist **unverändert**. Schlechter als im Vorjahr sind 2,6 und 2,1 Grad. „Diese Werte“ umfasst auch die 2,8 Grad. Die Fehlzuordnung stammt aus [18]/PM, ist durch den Abgleich mit der ES aufgefallen und nicht korrigiert. A1. |
| 39 | „Als Gründe nennt UNEP den formalen Austritt der USA aus dem Pariser Abkommen und neu geschätzte historische Emissionen.“ | ES Punkt 7 („formal withdrawal of the United States …, revised estimates of historical emissions“) | bestätigt | Gilt laut ES für 2,6 und 2,1 Grad (siehe Nr. 38). |
| 40 | „Die neuen Zusagen, die seit dem letzten Bericht eingereicht wurden, haben laut UNEP kaum etwas verändert [13][14].“ | ES („near-zero impact on expected emissions and warming“) | bestätigt | |
| 41 | „Die gute Nachricht: Seit dem Pariser Abkommen ist die weltweite Kapazität erneuerbarer Stromerzeugung dreimal schneller gewachsen als erwartet, die Solarenergie siebenmal schneller [14].“ | ES Punkt 8 („grew three times faster than current policies scenarios anticipated in 2015 … solar photovoltaics build-out increasing seven times faster than anticipated“); PM („The good news is …“) | Abweichung (gering) | Bezugsgröße fehlt: Erwartung der Current-Policies-Szenarien von 2015. „Die gute Nachricht“ ist Wortlaut der PM. A13. |
| 42 | „Mehr als 220 Auswertungen von Politikmaßnahmen zeigen, dass Klimapolitik wirkt. Im Stromsektor senkten die untersuchten Maßnahmen die Emissionen im Schnitt um 9 Prozent, CO₂-Preise und Emissionshandel um 5 bis 13 Prozent [13][14].“ | ES Punkt 9 („More than 220 policy evaluations …“; „average emission reductions of 9 per cent over the evaluation periods relative to a no-policy baseline“; „economic instruments, including carbon cap-and-trade schemes and carbon taxes … 5–13 per cent across sectors over the evaluation period relative to a no-policy baseline“) | Abweichung (gering) | Zahlen stimmen. Es fehlt die Bezugsgröße (Evaluationszeitraum, gegenüber einer Entwicklung ohne die Maßnahme); „CO₂-Preise und Emissionshandel“ ist enger als „economic instruments, including …“. A13. |
| 43 | „Diese Erfolge konzentrieren sich laut UNEP aber auf einzelne Sektoren, Länder und Zeiträume.“ | ES Punkt 9 („concentrated in specific sectors, countries and periods“) | bestätigt | |
| 44 | „Eine Faustregel aus dem Bericht: Jeweils fünf Jahre CO₂-Emissionen auf heutigem Niveau heben die Spitzenerwärmung um etwa 0,1 Grad [14].“ | ES Punkt 5 („Every five years of emissions at current levels adds around 200 GtCO2 to the atmosphere, and pushes the peak warming up by around 0.1°C“) | bestätigt | Die 200 Gt je fünf Jahre stehen im Kapitel nicht (die Herkunftstabelle nennt sie, der Text nicht). In der ES gilt der Satz für die Spitzenerwärmung im Zusammenhang mit der Verzögerung strenger Minderung. |
| 45 | Grafik-2-Bildunterschrift: „Nötige Emissionsminderung gegenüber 2025 im UNEP-Szenario „kleinstmögliches Überschießen“ und Minderung bei voller Umsetzung der Klimazusagen (NDCs, Spanne). Quelle: UNEP, … Executive Summary und Pressemitteilung vom 21.10.2026 [13][14].“ | ES, PM | Abweichung (gering) | Wie Nr. 32 (neue NDCs, „bedingt/unbedingt“). |

#### Grafik 2

| Nr. | Punkt | Befund | Ergebnis | Hinweis |
|---|---|---|---|---|
| G7 | Werte | Blau 18/45/69; Orange 5–8, 11–15, 20–27, jeweils Basis 2025 | bestätigt | Alle Werte stimmen mit ES und Skript überein. |
| G8 | Darstellung der NDC-Spanne | Die Spanne wird als schwebender Balken (von Untergrenze bis Obergrenze) gezeichnet, nicht vom Nullpunkt | bestätigt (mit Hinweis) | Mathematisch korrekt, aber leicht als „Wert der Zusagen“ missverständlich; die Legende nennt „Spanne“. Beschriftungen („−11 bis −15 %“, „−20 bis −27 %“) überdecken teilweise den Nachbarbalken (E1). |
| G9 | Titel „Die Zusagen der Staaten liegen weit unter dem, was nötig wäre“ | ES („large and expanding emissions gap“) | Abweichung (gering) | Das Wort „nötig“ bezieht sich auf **ein** UNEP-Szenario (kleinstmögliches Überschießen), nicht auf eine absolute Notwendigkeit. „Zusagen der Staaten“ bezeichnet nur die neuen NDCs. Der Titel behauptet in der Grafik, was der Text als UNEP-Szenario kennzeichnet. A4. |
| G10 | Untertitel, Einheit, Quelle | „Emissionsminderung … gegenüber 2025“, „%“, ES und PM, „Szenario- und Zusagenwerte, keine Messungen. Ein UNEP-Szenario ist keine Vorhersage.“ | bestätigt | Regel „Titel, Einheit, Datenstand, Quelle“ erfüllt; Datenstand 21.10.2026. |

### 2.4 CO₂ aus der Luft holen (Z. 55–71) und Grafik 3

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 46 | „Unter „CO₂-Entnahme“ … verstehen Fachleute menschliche Aktivitäten, die CO₂ aus der Atmosphäre holen und dauerhaft speichern, in Gestein, an Land (Boden, Pflanzen), im Ozean oder in Produkten.“ | [17]; State of CDR ES Z. 328–329 („geological, terrestrial or ocean reservoirs, or in products“) | bestätigt | |
| 47 | „Nicht gemeint ist das Abscheiden von CO₂ am Schornstein eines Kraftwerks. Das verhindert Emissionen, holt aber kein CO₂ zurück, das schon in der Luft ist.“ | [17] („am Schornstein eines Kohle- oder Gaskraftwerks“); Faktencheck [17] A6 (Box 1.1: nur fossile Punktquellen; BECCS ist CDR) | Abweichung | Rückfall hinter die geprüfte Fassung: „eines Kraftwerks“ statt „eines Kohle- oder Gaskraftwerks“. Im selben Absatz steht BECCS (Kraftwerks-Abscheidung bei Biomasse) als CDR; die Aussage ist so missverständlich. A10. |
| 48 | Konventionelle Verfahren (Aufforstung, Wiederbewaldung, Boden) und neuartige Verfahren (Pflanzenkohle, Gesteinsverwitterung, BECCS, direkte Abscheidung) | [17]; ES Z. 349–351 | bestätigt | |
| 49 | „Der Bericht … (3. Ausgabe, Juni 2026) eines internationalen Forschungsteams“, DOI 10.17605/OSF.IO/ZRD65 | [17]; Faktencheck [17] A3, G1–G2 | bestätigt | |
| 50 | „Weltweit werden laut Bericht rund 2,2 Milliarden Tonnen CO₂ pro Jahr entnommen, etwa 5 Prozent der Brutto-CO₂-Emissionen.“ | State of CDR ES Z. 373 („2.2 GtCO2 per year, equivalent to 5% of gross CO2 emissions“) | bestätigt | |
| 51 | „Davon entfallen 99,9 Prozent auf konventionelle Verfahren, also auf Wälder und Böden.“ | ES Z. 374 | bestätigt | |
| 52 | „Die neuartigen Verfahren kommen zusammen auf rund 2 Millionen Tonnen pro Jahr.“ | ES Z. 375 („0.002 GtCO2 per year“) | bestätigt | Einheitenumrechnung 0,002 Gt = 2 Mt steht so in der Quelle (Faktencheck [17] B4). |
| 53 | „Sie wachsen um rund 40 Prozent pro Jahr, nach Einschätzung der Autorinnen und Autoren reicht das aber nicht für das, was die Pariser Klimaziele erfordern.“ | ES Z. 376–378 | bestätigt | |
| 54 | „In den vergangenen Jahren wurden nur etwa 20 Prozent der geplanten Kapazität tatsächlich gebaut.“ | ES Z. 379–380 („only 20% of planned capacity has been built in recent years“) | bestätigt | |
| 55 | Grafik 3: Werte 0,3 / 1,2 / 5,2 Mrd. t CO₂ pro Jahr (2030, 2035, 2050); Beschriftung „heute rund 2,2 Mrd. t, davon neuartig rund 2 Mio. t“ | ES Punkt 4 (Z. 436–441), Grafik Z. 452–471 (2,54/2,85; 2,66/3,91; 3,60/8,75) | bestätigt | Skript und Bild stimmen überein. |
| 56 | „Für 2030 summieren sich die Zusagen auf 2,5 Milliarden Tonnen pro Jahr, der Median der ehrgeizigsten Paris-kompatiblen Szenarien liegt bei 2,9. Daraus ergibt sich eine Lücke von 0,3 Milliarden Tonnen, die mit der Zeit wächst: 1,2 (2035) und 5,2 (2050) [15].“ | ES Z. 436–441 | Abweichung (gering) | Alle Werte stimmen mit der Quelle. „Daraus ergibt sich“ lädt zur Subtraktion ein: 2,9 − 2,5 = 0,4. Die Quelle nennt 0,3 (ungerundet 2,85 − 2,54 = 0,31). A12. |
| 57 | „In kostengünstigen Paris-kompatiblen Szenarien tragen Emissionsminderungen mindestens 80 Prozent zum Erreichen von netto null CO₂ bei, die CO₂-Entnahme leistet den Rest [15].“ | ES Z. 331–333 | bestätigt | |
| 58 | „Die erwarteten Kosten reichen je nach Verfahren von unter 10 bis über 1.000 US-Dollar pro Tonne, bei den meisten Verfahren liegen die oberen Schätzungen über 200 Dollar.“ | ES Z. 351–353 | bestätigt | „deutlich über heutigen CO₂-Preisen“ ([17]) ist weggelassen; kein Fehler. |
| 59 | „Wie viel jedes Verfahren langfristig leisten kann, ist unsicher.“ | ES Z. 354–356 | bestätigt | |
| 60 | „Mit zunehmendem Einsatz wachsen die Folgen für Flächen, Wasser, Artenvielfalt und Nahrungsmittelproduktion.“ | ES Z. 491–493 („typically increase with scale and include consequences for biodiversity, resource consumption, energy use and food production“); Z. 634–636 (land, water, ecosystems) | Abweichung (gering) | „typischerweise“ ist weggefallen (Zuspitzung, Faktencheck [17] D-N1), „Energieverbrauch“ fehlt. A12. |
| 61 | „Wälder können ihr CO₂ zudem wieder verlieren, etwa durch Brände.“ | [17]; Faktencheck [17] D-N3 (Kap. 1, S. 22) | bestätigt | Beleg liegt im Kap. 1, S. 22, nicht in der ES; [15] nennt Kapitel 1 (S. 20–22). |
| 62 | „Von den Zertifikaten aus neuartigen Verfahren, die 2024 und 2025 gekauft wurden, entfielen gemessen in Tonnen 82 Prozent auf ein einziges Unternehmen, Microsoft [15].“ | ES Z. 614–621 („82% Microsoft“); Kap. 4 S. 102; Faktencheck [17] Nachtrag 2 R1 | bestätigt | |
| 63 | „Deutschland: Der Bundeshaushalt 2026 enthält laut Bericht 98 Millionen Euro für CO₂-Entnahme-Projekte und weitere 11,5 Millionen Euro für den Kauf von Entnahme-Zertifikaten. Für 2027 bis 2033 sind zusätzlich 320 Millionen Euro vorgesehen [15].“ | State of CDR Kap. 3, Z. 2824–2827 („€98 million … €11.5 million … €320 million … from 2027 to 2033“) | bestätigt | Euro-Zeichen im UTF-8-Auszug belegt. Der Bericht ergänzt, es sei unklar, wie viel davon in Demonstrationsprojekte geht (nicht im Kapitel, kein Fehler). |
| 64 | „Und der UNEP-Weg zurück? Er braucht laut UNEP in diesem Jahrhundert rund 320 Milliarden Tonnen CO₂, die aus der Atmosphäre geholt und dauerhaft gespeichert werden, etwa acht Jahre der weltweiten CO₂-Emissionen von 2024. UNEP nennt selbst unsicher, ob das gelingt [13][14].“ | ES Punkt 5 („roughly 320 GtCO2 over the course of this century … Our ability to remove such large amounts … is uncertain“); PM („equivalent to around eight years of 2024’s global CO2 emissions“) | bestätigt | Die 320 Gt und die Unsicherheit stehen in der ES. „Etwa acht Jahre“ steht **nicht** in der ES-Textdatei, nur in der PM (über das PM-Protokoll belegt; kein eigener Abruf). Das Kapitel zitiert [13][14] gemeinsam; der Vergleich ist UNEPs, keine eigene Rechnung. |
| 65 | „Ein verbreiteter Satz lautet: „Später holen wir das CO₂ einfach wieder raus.““ | [17] („Häufiger Irrtum“) | Abweichung (gering) | „verbreitet“ ist eine unbelegte Häufigkeitsangabe wie „häufig“. A9. |
| 66 | „Der State-of-CDR-Bericht zeigt das Gegenteil. Wer Emissionen später senkt, braucht mehr CO₂-Entnahme, vor allem aus den teuren neuartigen Verfahren. Eine Verzögerung … um zehn Jahre würde … Spitzentemperatur erhöhen und den Entnahmebedarf deutlich steigern. … Grenzen der Nachhaltigkeit … Land und Wasser. Die Jahre 2026 bis 2030 nennt der Bericht entscheidend … [15]“ | ES Z. 626–636; Faktencheck [17] F1–F5 | bestätigt | „teuren“ ist durch Kap. 4/Tab. 4.3 gedeckt (Faktencheck [17] F1). |
| 67 | „Auch UNEP schreibt: Ohne strenge Minderung ab 2025 rücken die günstigsten Wege zurück auf 1,5 Grad außer Reichweite [14].“ | ES Punkt 5 („without stringent mitigation action from 2025, the lowest 1.5°C overshoot pathways available today will also slip away“) | Abweichung (gering) | „lowest overshoot pathways“ = Wege mit dem **geringsten Überschießen**, nicht „günstigste“ (kostengünstigste). E8. |
| 68 | Grafik-3-Titel „Die Lücke bei der CO2-Entnahme wächst mit der Zeit“ | ES Punkt 4 („A large and growing gap“) | bestätigt | Untertitel „Zusagen der Staaten und Paris-kompatiblen Szenarien“: Als Vergleichsgröße dienen laut ES-Grafik die „1.5°C Highest Ambition scenarios“ (Median); die Quellenzeile nennt das nur für 2030 (E2). „CO2“ statt „CO₂“ (E2). |

### 2.5 Was die Daten nicht zeigen (Z. 75–79)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 69 | „Keine Länderzahlen. Die Prozentwerte von UNEP gelten weltweit. Der Bericht übersetzt sie nicht auf einzelne Länder wie Deutschland, und wir haben das nicht nachgerechnet [13][14].“ | [18] („Die Pressemitteilung übersetzt sie nicht auf einzelne Länder“); ES (Abb. ES.2/ES.3: G20-Mitglieder mit Länder-/EU-Werten zu den NDCs); Faktencheck [18] #33/Empfehlung 9 | Abweichung | Im Kapitel wurde aus „die Pressemitteilung“ (in [18]) „der Bericht“. Der Bericht (und schon die ES) nennt Länderwerte für G20-Mitglieder (zu NDCs und Politik), allerdings keine Aufteilung der globalen Pfadwerte 18/45/69 % auf Länder. Den Volltext haben die Autoren des Kapitels nicht gelesen. A5. |
| 70 | „Rückkehr heißt nicht Rückgängigmachen. … Laut UNEP erhöht jeder zusätzliche Bruchteil eines Grades und jedes zusätzliche Jahr über 1,5 Grad die Klimafolgen und -risiken [13].“ | PM (Andersen); ES („raises the risk of irreversible changes including in ice sheets, permafrost carbon, ocean circulation and coral systems“) | bestätigt | Der Satz „treten die Folgen der wärmeren Jahrzehnte trotzdem ein“ ist Deutung von [18] (Faktencheck [18] #35). Die ES gibt einen stärkeren Beleg (unumkehrbare Veränderungen) als die PM; E6. |
| 71 | „50 Prozent sind kein Versprechen. Selbst im günstigsten berechneten Weg liegt die Chance … bei etwa der Hälfte [14].“ | ES | bestätigt | |
| 72 | „Modelle, keine Messungen. Alle Temperaturwerte aus dem UNEP-Bericht sind Projektionen unter Annahmen [14].“ | ES | bestätigt | |
| 73 | „Fremde Zahlen. Die Zahlen zur CO₂-Entnahme stammen aus dem State-of-CDR-Bericht, es sind Schätzungen mit teils großen Unsicherheiten. Wir haben keine eigene Analyse gemacht [15].“ | [17] (Hinweis) | bestätigt | |

### 2.6 Was heißt das für dich? (Z. 83–85)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 74 | „Ein warmer Monat und ein verfehltes Ziel sind zwei verschiedene Aussagen. Beim Pariser Ziel zählt die Erwärmung über Jahrzehnte.“ | [16] | bestätigt | Beschreibend. |
| 75 | „Die Zusagen der Staaten und die Szenarien der Wissenschaft liegen weit auseinander: für 2030 minus 5 bis 8 Prozent gegen minus 18 Prozent. Szenarien sind keine Vorhersagen. Sie zeigen, was nötig wäre, um ein bestimmtes Ziel zu erreichen.“ | ES; Gliederung | Abweichung (gering) | Zahlen stimmen (ES). „die Szenarien der Wissenschaft“ (Plural) bezeichnet **ein** UNEP-Szenario; „Zusagen der Staaten“ s. Nr. 4. „weit auseinander“ entspricht ES („large and expanding emissions gap“). Der Satz „Szenarien sind keine Vorhersagen … was nötig wäre“ ist beschreibend und mit ES vereinbar. A4, E7. |
| 76 | „CO₂-Entnahme findet heute fast ausschließlich in Wäldern und Böden statt. Neuartige Verfahren sind winzig, teuer und wachsen schnell, aber nicht schnell genug für die Pariser Ziele.“ | ES State of CDR (tiny fraction; Kosten bis > 1.000 $/t; 40 %/Jahr; „insufficient“) | bestätigt | „winzig“ = „tiny fraction“; „teuer“ ist generalisierend (Kosten < 10 bis > 1.000 $/t), aber durch „upper limits exceeding $200, well above current carbon prices“ gedeckt. Wertungsworte aus der Quelle, siehe E3. |

### 2.7 Lagen wir richtig? (Z. 89–91)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 77 | „Am 16. Oktober schrieben wir, der El Niño dürfte einer der stärksten seit Beginn der Aufzeichnungen werden, und die NOAA gebe 83 Prozent für ein historisch starkes Ereignis von Oktober bis Dezember an [11].“ | [16] | bestätigt | |
| 78 | „Das lässt sich noch nicht sagen: Der Winter dauert an, und der Copernicus-Bericht für Oktober erscheint erfahrungsgemäß erst Anfang November.“ | – (Gliederung: „Bericht Anfang November“) | Abweichung | „Der Winter dauert an“ ist sachlich nicht nachvollziehbar (24.10.: das Ereignis läuft, der Zeitraum Oktober–Dezember ist noch nicht abgeschlossen). „erfahrungsgemäß erst Anfang November“ ist unbelegt; der September-Bericht erschien nach [16] am 12.10. Neue Behauptung ohne Quelle. A8. |
| 79 | „Neuere Werte nehmen wir nur mit Primärquelle und Datum auf.“ | Gliederung | bestätigt | Redaktionsregel, hier als Selbstverpflichtung formuliert. |
| 80 | „Unser Stück vom 21. Oktober stützte sich auf die Pressemitteilung und nicht auf den vollständigen Bericht.“ | [18] („Diese Einordnung stützt sich auf die Pressemitteilung …, nicht auf den vollständigen Bericht“) | bestätigt | |
| 81 | „Für das Buch haben wir die Zahlen mit der Zusammenfassung des Berichts abgeglichen. Sie stimmen.“ | ES-Textdatei; Nr. 29–45 | Abweichung | Die in Abschn. 2.3 geprüften Zahlen stimmen mit der ES überein (18/45/69, Spannen, NDC, 5,7, 66 %, 2,8/2,6/2,1). **Nicht** übereinstimmend ist die Aussage „Diese Werte sind schlechter als im Vorjahresbericht“ (Nr. 38). Außerdem sind „etwa acht Jahre CO₂-Emissionen 2024“ und die Veröffentlichungsdaten nicht in der ES. „Sie stimmen“ ist daher zu pauschal. A6. |
| 82 | „Die Zusammenfassung ergänzt: die Wahrscheinlichkeit von 66 Prozent für den Höhepunkt bei 1,7 bis 1,8 Grad, die Spannen der nötigen Minderung, die Minderung durch die Zusagen bis 2040 (20 bis 27 Prozent) und die Einordnung, dass die Erwärmung 1,5 Grad um mehr als 0,1 Grad überschreiten wird.“ | ES | Abweichung | Die Liste ist unvollständig: Die ES ergänzt außerdem die Spanne 3,4–8,7 beim 5,7-%-Wert, den Kontext der 5,0 % (2019, ≤ 0,1 °C), den 66-%-Bezug der Werte 2,8/2,6/2,1 („begrenzt“), die Bezugsgröße der 3×/7×, die Evaluationszeiträume und die Aussage, dass der Wert 2,8 unverändert ist. Zudem ist „…wird überschreiten“ nur „um mehr als 0,1 Grad“ in ES gestützt, nicht „1,5 Grad überschreiten“ allein (siehe Nr. 24). A6. |
| 83 | „Den Volltext des Berichts haben wir nicht gelesen.“ | Auftrag; ES-Textdatei ist nur die Zusammenfassung | bestätigt | Das stimmt laut Auftrag. Folge: Aussagen über „den Bericht“ (z. B. Nr. 69) tragen nur die ES. |
| 84 | „Offen: Ob der Weg zurück auf 1,5 Grad gelingt, ist offen (UNEP: etwa 50 Prozent im günstigsten Weg).“ | ES | bestätigt | |

### 2.8 Woher wir das wissen und Quellenliste (Z. 95–115)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 85 | Fließtext „Woher wir das wissen“ (Copernicus 12.10.2026, DWD 29.09.2026, WMO, IPCC AR6, SR 1,5 Grad 2018, NOAA 08.10.2026, UNEP 21.10.2026, State of CDR Juni 2026, DOI, eigene Stücke 16./18./21.10.2026) | Quellenlisten von [16], [17], [18] | bestätigt | Datumsangaben stimmen. Die RONI-Quelle [12] fehlt im Fließtext (kein Fehler). |
| 86 | Quelle [1]–[5], [7]–[12]: Titel, Daten, URLs | Quellenliste von [16] | bestätigt | Gegen [16] abgeglichen (Nummerierung geändert: [11] hier = NOAA, [9] = WMO 23.03.2026). [7] enthält zwei WMO-Dokumente in einer Zeile (wie in [16]). |
| 87 | Quelle [6] „(frei)“ | – | Abweichung | Platzhalter im Quellenverzeichnis; für Leserinnen und Leser eine Lücke. A11. |
| 88 | Quelle [13]: UNEP-Pressemitteilung, 21.10.2026, URL | [18]; PM-Protokoll | nicht prüfbar (direkt) | Die Seite lieferte HTTP 403; Titel, Datum und URL stimmen mit [18] und dem Protokoll überein. |
| 89 | Quelle [14]: „UNEP: Emissions Gap Report 2026: The Point of Return, 21.10.2026, Executive Summary (abgerufen 24.10.2026). https://wedocs.unep.org/handle/20.500.11822/50038 · DOI 10.59117/20.500.11822/50038“ | ES-Textdatei (Zitiervorschlag: „Executive summary. In Emissions Gap Report 2026 …, DOI https://doi.org/10.59117/20.500.11822/50038“) | bestätigt (mit Hinweis) | DOI und Titel stimmen mit der ES überein. Die Textdatei liegt nicht im Repo; Nachvollziehbarkeit nur über das wedocs-Handle (E5). Herausgeber/Autoren (Olhoff et al.) fehlen im Eintrag. |
| 90 | Quelle [15]: State of CDR, Autoren, Seitenangaben | [17]; Faktencheck [17] G1 | bestätigt | |
| 91 | Quellen [16]–[18]: Titel, Daten, Links der eigenen Stücke | Referenzfassungen (Titel, Datum, URL) | bestätigt | Linkziele anhand der Referenzfassungen geprüft (Titel und post_date stimmen). |
| 92 | Alle Quellen im Text zitiert? | Textdurchsicht | bestätigt (außer [6]) | [1]–[5], [7]–[18] werden im Text oder in „Woher wir das wissen“ zitiert. Nummern erscheinen nicht in Reihenfolge der Ersterwähnung ([11] vor [12], [13][14] gemeinsam); kosmetisch (E9). |

## 3. Zusatzprüfung: neue Inferenz und Wertung

- **Neue Berechnung:** keine gefunden. „Etwa acht Jahre“ (320 Gt) ist UNEPs Vergleich. Die Lücken 0,3/1,2/5,2 sind Quellenwerte (Nr. 56).
- **Neue Zuspitzungen/Inferenzen:** Nr. 27 (Punktaussage zur Spitzenerwärmung), Nr. 36–37 (fehlender Wahrscheinlichkeitsbezug), Nr. 38 (2,8 Grad „schlechter als Vorjahr“), Nr. 69 („der Bericht“), Nr. 78 („erfahrungsgemäß erst Anfang November“).
- **Wertende Formulierungen (Frage j):** „Die gute Nachricht“ (Nr. 41) ist Wortlaut der PM („The good news is“); „winzig, teuer“ (Nr. 76) ist durch ES (tiny fraction; > 200 $/t) gedeckt; „keine Abkürzung“ (Nr. 5) ist ein erklärendes Bild mit Quellenbasis. Keine davon ist beanstandet, aber alle drei sind Wertungen; siehe E3.
- **Sensible Sprache:** keine Todesfälle im Kapitel. Hinweis „hinter den Zahlen stehen Menschen“ ist nicht erforderlich.

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Z. 47: „Diese Werte sind schlechter als im Vorjahresbericht.“** (Nr. 38) Laut ES Punkt 7 ist nur das Szenario „aktuelle Politik“ (2,8 Grad) unverändert; schlechter als im Vorjahr sind 2,6 und 2,1 Grad.
Änderungsvorschlag: „Die Werte für 2,6 und 2,1 Grad sind schlechter als im Vorjahresbericht, der Wert für die aktuelle Politik (2,8 Grad) ist unverändert. Als Gründe für die Verschlechterung nennt UNEP …“.

**A2. Z. 33 und Z. 47: Wahrscheinlichkeitsangaben.** (Nr. 27, 36, 37)
- Z. 33: „… hat die Erwärmung mit 66 Prozent Wahrscheinlichkeit um die Jahrhundertmitte ihren Höhepunkt bei 1,7 bis 1,8 Grad“ ändern in „… ist die Spitzenerwärmung um die Jahrhundertmitte mit 66 Prozent Wahrscheinlichkeit auf 1,7 bis 1,8 Grad begrenzt“.
- Z. 47: Den 66-%-Bezug auf alle drei Werte ausdehnen: „Mit 66 Prozent Wahrscheinlichkeit bleibt die Erwärmung bis 2100 unter folgenden Werten: bei aktueller Politik 2,8 Grad (danach steigt sie weiter); wenn alle Zusagen eingehalten werden und ähnliche Anstrengungen anhalten, 2,6 Grad; im optimistischsten Fall, mit allen Zusagen und zusätzlichen Netto-null-Zielen, 2,1 Grad.“

**A3. Z. 41: „Die älteren Pfade aus dem Sechsten Sachstandsbericht des IPCC verlangten etwa 5 Prozent pro Jahr [14].“** (Nr. 34) Die ES gibt den Kontext: 5,0 % pro Jahr galten für das Ziel „höchstens 0,1 Grad Überschießen“ bei Minderung ab 2019 (−43 % bis 2030 gegenüber 2019).
Änderungsvorschlag: „Der frühere Vergleichswert, ein Pfad ohne nennenswertes Überschießen (höchstens 0,1 Grad) mit Minderung ab 2019, verlangte etwa 5,0 Prozent pro Jahr [14].“ Die Zuordnung „Sechster Sachstandsbericht“ nur beibehalten, wenn mit der PM [13] belegt.

**A4. Zusagen der Staaten: Geltungsbereich (Z. 5, Tabelle Z. 35–39, Grafik-2-Titel und -Bildunterschrift, Z. 84).** (Nr. 4, 32, 45, G9, 75) Die ES bezieht 5–8/11–15/20–27 % auf die **neuen NDCs** (bis 1.9.2026 von 124 Parteien eingereicht, rund 76 % der Emissionen), die Spanne ergibt sich aus der Bedingtheit der NDCs. „Nötig“ bezieht sich auf **ein** UNEP-Szenario.
Änderungsvorschläge: Tabellenüberschrift: „bei voller Umsetzung der neuen Klimazusagen (NDCs; Spanne je nach Bedingtheit)“; Z. 5 und Z. 84: „die neuen Klimazusagen“ bzw. „die Klimazusagen“ mit Verweis auf die Tabelle; Grafik-2-Titel: „Die neuen Klimazusagen liegen weit unter dem UNEP-Weg zurück auf 1,5 Grad“.

**A5. Z. 75: „Der Bericht übersetzt sie nicht auf einzelne Länder wie Deutschland.“** (Nr. 69) In [18] stand „die Pressemitteilung“. Die ES enthält Werte für G20-Mitglieder (zu NDCs und Politik); den Volltext haben wir nicht gelesen.
Änderungsvorschlag: „Die Prozentwerte von UNEP gelten weltweit. Die Zusammenfassung verteilt sie nicht auf einzelne Länder wie Deutschland, und wir haben das nicht nachgerechnet [14].“

**A6. Z. 90 („Lagen wir richtig?“, Abgleich mit der Executive Summary).** (Nr. 26, 81, 82) „Sie stimmen“ ist nicht korrekt, die Liste der Ergänzungen unvollständig.
Änderungsvorschlag: „Für das Buch haben wir die Zahlen mit der Zusammenfassung des Berichts abgeglichen. Fast alles stimmt. Eine Angabe in unserem Stück stimmt nicht: Der Wert von 2,8 Grad bei aktueller Politik ist gegenüber dem Vorjahr unverändert; wir hatten ihn als verschlechtert wiedergegeben (siehe Kapitel 8). Die Zusammenfassung ergänzt: [vollständige Liste: 66 Prozent für die Spitzenerwärmung, Spannen der nötigen Minderung, Spanne von 3,4 bis 8,7 Prozent pro Jahr, Minderung durch die neuen Zusagen bis 2040 (20 bis 27 Prozent), den Kontext der früheren 5 Prozent, den 66-Prozent-Bezug der Temperaturwerte und die Einordnung, dass die Erwärmung 1,5 Grad um mehr als 0,1 Grad überschreiten wird]. Den Volltext des Berichts haben wir nicht gelesen.“ Gleichzeitig Kapitel 8 (Korrekturen) um diesen Punkt ergänzen oder bewusst darauf verzichten (Entscheidung Daniel Saure); der Artikel [18] auf Substack ist unverändert.

**A7. Grafik 1: Titel und Vergleichbarkeit.** (G4, G5, G6) Titel ändern, z. B. „Ein Monat über 1,5 Grad heißt nicht, dass das Pariser Ziel verfehlt ist“. Quellenzeile um den Hinweis ergänzen: „Monats-, Jahres- und Langfristwerte stammen aus verschiedenen Datensätzen und Methoden und sind nicht direkt vergleichbar; für das Pariser Ziel zählt das 20-Jahres-Mittel (IPCC).“ Bildunterschrift im Kapitel (Z. 21) entsprechend ergänzen.

**A8. El Niño (Z. 25) und „Lagen wir richtig?“ (Z. 89).** (Nr. 19, 78) Z. 25: „Copernicus rechnet damit, dass dieser El Niño einer der stärksten … wird“ ändern in „Nach Einschätzung von Copernicus dürfte dieser El Niño einer der stärksten seit Beginn der Aufzeichnungen werden [1].“ Z. 89: Den Satz „Der Winter dauert an, und der Copernicus-Bericht für Oktober erscheint erfahrungsgemäß erst Anfang November“ ersetzen durch „Der Zeitraum von Oktober bis Dezember ist noch nicht abgeschlossen. Den Copernicus-Bericht für Oktober nehmen wir erst auf, wenn er vorliegt.“

**A9. Häufigkeitsangaben (Z. 27, Z. 71).** (Nr. 20, 65) „Zwei Sätze liest man oft falsch“ und „Ein verbreiteter Satz lautet“ sind nicht belegt. Änderungsvorschlag: „Zwei Sätze stimmen so nicht:“ bzw. „Ein Satz, der in Debatten vorkommt, lautet:“ (oder ohne Häufigkeitsangabe: „Der Satz „Später holen wir das CO₂ einfach wieder raus“ stimmt so nicht.“).

**A10. Z. 55: „Nicht gemeint ist das Abscheiden von CO₂ am Schornstein eines Kraftwerks.“** (Nr. 47) Rückfall hinter die geprüfte Fassung von [17]. Änderungsvorschlag: „… am Schornstein eines Kohle- oder Gaskraftwerks.“ (Quelle: Box 1.1, fossile Punktquellen; BECCS bleibt CDR.)

**A11. Quellenverzeichnis: Nummer [6] „(frei)“ (Z. 103).** (Nr. 87) Im Buch nicht stehen lassen. Änderungsvorschlag: Quellen [7]–[18] um eins nach vorn nummerieren und alle Verweise im Text und in den Bildunterschriften anpassen; alternativ Nummer [6] mit der RONI- oder einer weiteren Quelle belegen, wenn dort bereits ein Beleg fehlt.

**A12. CDR-Zahlen: Rundung und Zuspitzung (Z. 63, Z. 65).** (Nr. 56, 60) Z. 63: „Daraus ergibt sich eine Lücke von 0,3 Milliarden Tonnen“ ändern in „Der Bericht beziffert die Lücke auf 0,3 Milliarden Tonnen (gerundete Werte)“; sonst zeigt die Subtraktion 0,4. Z. 65: „Mit zunehmendem Einsatz wachsen die Folgen …“ ändern in „Mit zunehmendem Einsatz nehmen die Folgen typischerweise zu, etwa für Flächen, Wasser, Artenvielfalt, Energieverbrauch und Nahrungsmittelproduktion.“

**A13. UNEP-Angaben: Bezugsgrößen (Z. 49).** (Nr. 41, 42) Ergänzen: „dreimal schneller gewachsen, als die Szenarien mit damaliger Politik 2015 erwartet hatten“; Strom −9 %: „im Schnitt über den jeweils untersuchten Zeitraum, gegenüber einer Entwicklung ohne die Maßnahme“; „CO₂-Preise und Emissionshandel“ durch „wirtschaftliche Instrumente wie CO₂-Preise und Emissionshandel“ ersetzen.

## 5. Empfehlungen (nicht bindend)

- **E1.** Grafik 2: Beschriftungen der NDC-Spannen so setzen, dass sie die blauen Balken nicht überlappen; die schwebenden Spannenbalken in der Legende als „Spanne (Untergrenze bis Obergrenze)“ erklären.
- **E2.** Grafik 3: Untertitel präzisieren („Median der ehrgeizigsten Paris-kompatiblen 1,5-Grad-Szenarien“ gilt für alle drei Jahre laut ES-Grafik); „CO2“ als „CO₂“ darstellen; in Grafik 1 und 3 „Langfristig“ und die Bezugsgruppen konsistent benennen.
- **E3.** „Die gute Nachricht“ (Z. 49) als Wortlaut der PM kennzeichnen oder neutral formulieren („Es gibt auch Fortschritte“); „winzig, teuer“ (Z. 85) durch zahlenbasierte Formulierung ersetzen („rund 2 Millionen Tonnen pro Jahr, Kosten bis über 1.000 Dollar je Tonne“), „keine Abkürzung“ (Z. 5) optional neutraler.
- **E4.** Der Artikel [18] auf Substack enthält die Aussage „schlechter als im Vorjahresbericht“ unverändert (A1) und die Formulierung „könnte 2,8 Grad erreichen“ (die ES-Fassung ist „66 Prozent Wahrscheinlichkeit, dass … begrenzt bleibt“). Kapitel 8 und Daniel Saure über den Korrekturbedarf informieren; kein Eingriff in dieses Kapitel nötig.
- **E5.** Die extrahierte ES-Textdatei ist nicht im Repo, kein gültiges UTF-8 und nicht prüfbar außer über das wedocs-Handle. Als Nachweis wenigstens Abrufdatum und Hash der Datei notieren oder die Textdatei (UTF-8) im Report-Ordner ablegen (UNEP erlaubt Wiedergabe mit Quellenangabe für nicht-kommerzielle Zwecke, siehe Rechtehinweis der ES). Entscheidung: Daniel Saure.
- **E6.** Z. 24 und Z. 76: ES-Aussage „based on multidecadal averages“ ergänzen („über Jahrzehnte gemittelt“); Z. 76: [14] zusätzlich zitieren, denn die ES nennt „irreversible changes“ (Eisschilde, Permafrost, Ozeanzirkulation, Korallen).
- **E7.** Z. 84: „die Szenarien der Wissenschaft“ durch „das UNEP-Szenario“ ersetzen.
- **E8.** Z. 71: „die günstigsten Wege zurück auf 1,5 Grad“ durch „die Wege mit dem geringsten Überschießen“ ersetzen (ES: „lowest 1.5°C overshoot pathways“).
- **E9.** Quellennummern in der Reihenfolge der Ersterwähnung vergeben (kosmetisch).
- **E10.** Grafik 1: Konfidenzniveau von ±0,13 (WMO) in der Quellenzeile nennen oder „Unsicherheit laut WMO“ schreiben.

## 6. Nicht geprüft / Vorbehalte

- **UNEP-Pressemitteilung [13]:** HTTP 403; Werte nur über das private Session-Protokoll vom 21.10.2026 belegt (kein eigener Abruf). Betrifft besonders die Sätze „etwa acht Jahre der weltweiten CO₂-Emissionen von 2024“ und das Veröffentlichungsdatum.
- **UNEP-Volltext und PDF der Executive Summary:** nicht gelesen; die Prüfung stützt sich auf die vom Auftraggeber am 24.10.2026 extrahierte Textdatei (nicht im Repo, nicht UTF-8). Ob die Textdatei exakt dem PDF entspricht, konnte ich nicht prüfen.
- **IPCC-Wortlaut** (SPM B.1.4, Fußnote 24, TS Cross-Section Box TS.1, SR1.5): wie in den Faktenchecks zu [16] nur über Textspiegel bzw. Suchergebnisse bestätigt; Original auf ipcc.ch (HTTP 403) nicht eingesehen.
- **Primärquellen von [16]** (Copernicus, DWD, WMO, NOAA) wurden nicht erneut geöffnet; die Prüfung stützt sich auf den Faktencheck zu [16] (16.10.2026). Ob WMO eine neuere Langfristschätzung (WMO-No. 1391) veröffentlicht hat, ist offen.
- **State of CDR:** nur über den lokalen Textauszug geprüft (Executive Summary und die im Faktencheck zu [17] benannten Fundstellen); das PDF und die Seitenangaben wurden nicht visuell geprüft.
- **Kapitel 8:** nicht geprüft (Verweis in A6).
- **Stil, Wortzahl (Ziel 1.400–1.800), Leseniveau, Rechtschreibung** nicht Teil dieser Prüfung.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A13 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei (Dokumentationspflicht CLAUDE.md).
2. UNEP-Pressemitteilung [13] bei der Volltextlektüre kurz im Browser öffnen (Empfehlung aus dem Faktencheck zu [18], weiterhin offen).
3. Grafiken nach A4/A7 anpassen, neu erzeugen und erneut als Bild prüfen.
4. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (13 Auflagen, 10 Empfehlungen). Kein Punkt ist „kritisch“. Die Zahlen aus den drei Artikeln und die Ergänzungen aus der UNEP-Executive-Summary stimmen im Kern: 18/45/69 % mit Spannen 15–36, 30–60, 60–76; NDC 5–8, 11–15, 20–27 %; 5,7 % pro Jahr (3,4–8,7); 66 % für die Spitzenerwärmung; „mehr als 0,1 Grad“ Überschießen; 2,8/2,6/2,1 Grad mit 66 %-Wahrscheinlichkeit; 200 Gt je fünf Jahre ↔ 0,1 Grad (Faustregel); 220 Evaluationen; 3×/7×; 320 Gt. Der CDR-Teil (2,2 Gt, 5 %, 99,9 %, 2 Mio. t, 40 %, 20 %, Lücke 0,3/1,2/5,2, 80 %, 82 %, 98/11,5/320 Mio. Euro) und die Temperaturwerte (1,63; 1,55/1,43 ±0,13; 1,34–1,41; NOAA +2,1/83 %) sind quellengedeckt; die Grafikwerte stimmen mit den Quellen überein. Der gewichtigste Befund: Die ES widerlegt eine Aussage aus [18] („Diese Werte sind schlechter als im Vorjahresbericht“ gilt nicht für 2,8 Grad), das Kapitel gibt sie unverändert weiter und behauptet zugleich, der Abgleich mit der ES zeige keine Abweichung (A1, A6). Weitere wesentliche Mängel: Wahrscheinlichkeitsbezug der Temperaturwerte (A2), fehlender Kontext der 5,0 % (A3), Geltungsbereich der Klimazusagen (A4), „der Bericht“ statt „die Zusammenfassung“ (A5), Grafik 1 (A7), Rückfall bei der Kraftwerks-Formulierung (A10) und die Platzhalter-Quelle [6] (A11). Keine neue Berechnung im Kapitel.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
