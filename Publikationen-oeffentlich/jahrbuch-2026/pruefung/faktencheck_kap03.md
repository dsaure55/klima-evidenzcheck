# Faktencheck Kapitel 3 (Jahrbuch 2026): „Was kostet Klimapolitik, und wer zahlt?“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/03-kosten.md` (Entwurf v0.1, 23.10.2026). Nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Fassung (Herkunftstabelle ab Z. 100 ist nicht Buchtext und wurde nur als Orientierung gelesen).
**Geprüfte Grafiken:** `grafiken/kap03_grafik1_co2_preis_tankrabatt.png`, `grafiken/kap03_grafik2_kfw_investitionen.png` (als Bilder gelesen) und `grafiken/kap03_grafiken.R` (Zahlen fest eingetragen).
**Prüfdatum:** 23.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5: volle Faktencheck-Datei für „Kurz gesagt“, „Was heißt das für dich?“, „Lagen wir richtig?“; Differenzprüfung für den Haupttext. Regel: keine neue Berechnung, keine neue Inferenz; der Stil darf nichts verändern, verstärken oder abschwächen (`stilregeln.md`).
**Einordnung der drei Ausgangsstücke:** „65 Euro rein, 59 Euro raus“ ist ein **Rechenkommentar** (kein Evidenzcheck, keine präregistrierte Analyse, kein SAP, keine Validierung). Der CO₂-Preis-Artikel ist eine Einordnung, der KfW-Artikel ein Wissensstück. Das Kapitel kennzeichnet das für „65 Euro rein“ im Haupttext korrekt (Z. 22, Z. 40, Grafik-1-Quellenzeile), nicht aber in „Kurz gesagt“ (siehe E1).

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| [1] „65 Euro rein, 59 Euro raus“, Referenzfassung `quellen-artikel/2026-09-18_65-euro-rein-59-euro-raus.html` (Abruf 22.10.2026, enthält Korrekturhinweis vom 17.10. und Nachtrag) | gelesen (vollständig) | Abgleich vollständig |
| [2] „Bundestag friert CO₂-Preis 2027 ein …“, Referenzfassung `quellen-artikel/2026-10-17_co-preis-2027-eingefroren-was-das.html` (Abruf 22.10.2026, mit „Aktualisiert am 22.10.2026“) | gelesen (vollständig) | Abgleich vollständig |
| [8] „KfW-Studie: 6 Billionen Euro …“, Referenzfassung `quellen-artikel/2026-10-20_kfw-studie-...html` | gelesen (vollständig) | Abgleich vollständig |
| `Reports/2026-09-65-euro-rein/` (`faktencheck.md` mit Nachtrag 17.10., `korrektur_2026-10-17.md`, korrigierte Artikelfassung) | gelesen | Rechenschritte R1–R9, N1–N7 nachvollzogen; Skript fehlt (siehe Abschnitt 3 dort). Öffentliches GitHub am 23.10.2026: in `Analysen/` weiterhin kein Ordner zum Tankrabatt, Skript weiterhin nicht veröffentlicht |
| `Reports/2026-10-17-co2-preis-2027/` (`faktencheck.md`, `faktencheck_zweitpruefung_2026-10-22.md`, `korrektur_2026-10-22.md`) | gelesen | Zweitprüfung vom 22.10. lautete wegen Bundesrat-Status „kritisch“; IWH-Details dort nicht direkt prüfbar; eine dokumentierte Nachprüfung der korrigierten Fassung habe ich in den gelesenen Dateien nicht gefunden (siehe Abschnitt 6) |
| `Reports/2026-10-20-kfw-6-billionen/` (`faktencheck.md`, `quellen/KfW_Fokus_561.txt`) | gelesen (Textauszug der Studie: Zeilen 10–60 und 145–204) | 6 Bio., 5,7–6,4, 290, 110, 80, 145, 65, 1,5 % BIP, 12 % öffentliche Hand, 81 Mrd., Zitat „substanzielle, aber zugleich darstellbare Aufgabe“ im lokalen Studientext bestätigt |
| Bundestag Textarchiv KW 42/2026 (Quelle [5]) | WebFetch 23.10.2026 | Namentliche Abstimmung 303 / 210 / 52 bestätigt; 71 und 73 Euro je Tonne bestätigt; ETS 2 ab 2028 bestätigt |
| Bundesrat Drs. 462/26 (B) (Quelle [6]) | WebFetch (Binärdatei, nicht lesbar); WebSearch zum Verfahrensstand | **nicht prüfbar**; ein Beschluss zur abschließenden Befassung (zweiter Durchgang) war nicht auffindbar |
| IWH PM 10/2025 Tabelle K2 (Quelle [3]) | WebFetch (PDF, Binärdatei, nicht lesbar) | **nicht direkt prüfbar**; Werte nur über [2] |
| KfW Research 23.10.2025 (Quelle [4]) | WebFetch (PDF, Binärdatei, nicht lesbar) | **nicht direkt prüfbar**; Werte nur über [2] |
| KfW Fokus Nr. 561 (Quelle [7]) | lokaler Textauszug im Report-Ordner; PDF selbst nicht lesbar | Zahlen über den Auszug bestätigt; Auszug nicht vollständig gelesen (siehe Abschnitt 6) |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 4, E-Nummern auf die Empfehlungen in Abschnitt 5.

### 2.1 Kurz gesagt (Z. 5)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Der Tankrabatt vom Mai und Juni 2026 hat 91 bis 95 Prozent des CO₂-Preises auf Benzin wieder aufgehoben.“ | [1], Faktencheck 65-Euro | bestätigt | Rechenkommentar-Ergebnis, im Satz nicht als solches gekennzeichnet (E1). Die Spanne hängt am Emissionsfaktor 2,28–2,37 kg/l ([1]: „empfindlichste Stellschraube“). |
| 2 | „Der CO₂-Preis soll 2027 im selben Rahmen bleiben wie 2026, zwischen 55 und 65 Euro pro Tonne.“ | [2], [5] | bestätigt | „soll“ ist korrekt gesetzt; nichts als in Kraft dargestellt. |
| 3 | „An der Zapfsäule sind das etwa 16 bis 19 Cent pro Liter Benzin (mit Mehrwertsteuer).“ | [2] („16 bis 19 Cent … jeweils mit Mehrwertsteuer und gegenüber 2020“); IWH-Tabelle 15,7–18,6 | Abweichung (gering) | Rundung 15,7 auf 16 und 18,6 auf 19 ist die Rundung von [2]. Es fehlt „gegenüber 2020“ bzw. der Hinweis, dass die Werte einen Aufschlag gegenüber der Zeit vor dem CO₂-Preis meinen. Die Zahl steht in Spannung zu 17,6–18,3 Cent für denselben Korridor im Tankrabatt-Abschnitt (A7). |
| 4 | „Die „6 Billionen Euro“ … sind Bruttoinvestitionen.“ | [7], [8] | bestätigt | |
| 5 | „Zusätzlich nötig sind laut KfW rund 65 Milliarden Euro pro Jahr, etwa 1,5 Prozent der Wirtschaftsleistung.“ | [7] (lokaler Auszug: 65 Mrd., 1,5 % des BIP 2024) | bestätigt | Hinweis: Das ist die Aussage der Autorinnen und Autoren von KfW Research mit Berechnungen von Prognos; „laut KfW“ ist akzeptabel, „Wirtschaftsleistung“ statt „BIP 2024“ lässt das Bezugsjahr weg (E6). |

### 2.2 Von der Tonne zum Cent (Z. 9–18)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 6 | „Das Leibniz-Institut für Wirtschaftsforschung Halle (IWH) hat die Umrechnung für den Korridor gemacht.“ | [2], [3] | nicht prüfbar (direkt); über [2] bestätigt | IWH-PDF nicht lesbar. A7. |
| 7 | „Die Werte beziehen sich auf die Preise vor Einführung des CO₂-Preises (Basisjahr 2020), und für Benzin und Diesel sind es Bruttowerte, also mit Mehrwertsteuer.“ | [2] („Zeit vor dem CO₂-Preis, also das Basisjahr 2020“; „für Benzin und Diesel … Bruttowerte“) | nicht prüfbar (direkt); Wiedergabe von [2] bestätigt | Die Zweitprüfung vom 22.10. konnte Basisjahr, brutto und die Daten-Herkunft (ADAC, Verbraucherzentrale NRW) ebenfalls nicht am Original belegen. Das Kapitel nennt die Datenherkunft nicht (kein Fehler). A7. |
| 8 | Tabelle: Benzin 15,7–18,6; Diesel 17,3–20,5; Heizöl 17,5–20,6 Cent je Liter; Erdgas 1,3–1,6 Cent je kWh | [2] | bestätigt (Wiedergabe) / nicht prüfbar (Original) | Alle Werte stimmen mit [2] überein. Interne Plausibilität: Die Werte sind zwischen 55 und 65 Euro/t etwa proportional. Das Original (K2) wurde nicht gesehen. A7. |
| 9 | „Die Förderbank KfW nennt für 55 Euro pro Tonne Nettowerte: rund 13 Cent pro Liter Benzin und 15 Cent pro Liter Diesel oder Heizöl.“ | [2] (Quelle [3] dort = KfW 23.10.2025) | nicht prüfbar (direkt); Wiedergabe von [2] bestätigt | Die KfW-PDF war nicht lesbar. Im Kapitel ist die KfW-Quelle richtig [4]. |
| 10 | „Brutto und netto lassen sich nicht direkt vergleichen.“ | [2] | bestätigt | Wortnah zu [2]. |
| 11 | „Das ist eine häufige Stolperstelle (mehr dazu in Kapitel 7).“ | keine | Abweichung | „häufig“ ist nirgends belegt; der Verweis auf Kapitel 7 ist laut Herkunftstabelle neu und konnte nicht gegen Kapitel 7 geprüft werden (E4). |

### 2.3 Der Tankrabatt: ein Rechenkommentar (Z. 22–40)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 12 | „… „65 Euro rein, 59 Euro raus“ vom 18. September ist kein Evidenzcheck. Es ist ein Rechenkommentar ohne vorab festgelegten Analyseplan.“ | [1] („Rechenkommentar, keine präregistrierte Analyse“); Faktencheck 65-Euro, Abschn. 3; Gliederung (Entscheidung 22.10.) | bestätigt | Kennzeichnung wie beauftragt. |
| 13 | „Die Eingangswerte stammen aus veröffentlichten Quellen, gerechnet haben wir Umrechnungen und Sensitivitäten, keine eigene Schätzung.“ | [1] („keine eigene Schätzung“) | Abweichung | Wörtlich aus [1] übernommen, aber der Faktencheck zu [1] (Abschn. 3) stellt fest, der Beitrag enthalte „eigene Modellrechnungen“ (elastizitätsbasierter Mehrverbrauch, Kosten je Tonne). Der Satz ist als Selbstbeschreibung wiedergegeben, im Buch steht er ohne diese Einschränkung. A6. |
| 14 | „Das Stück wurde am 17. Oktober korrigiert (siehe unten und Kapitel 8).“ | [1] („Korrigiert am 17.10.2026“) | bestätigt | Verweis auf Kapitel 8 nicht gegen Kapitel 8 prüfbar (E4). |
| 15 | „Seit 2026 wird der nationale CO₂-Preis versteigert, in einem Korridor von 55 bis 65 Euro pro Tonne.“ | [1] | bestätigt | |
| 16 | „Bei der ersten Auktion am 1. Juli sprang der Preis sofort an die Obergrenze: 101 Teilnehmer boten auf rund 292 Millionen Zertifikate, zugeteilt wurden 21,3 Millionen (13,7-fach überzeichnet).“ | [1]; Faktencheck 65-Euro | bestätigt | DEHSt-Seite nicht erneut geöffnet; Faktencheck zu [1] bestätigt die Werte. |
| 17 | „Der Preis für 2026 steht damit bei 65 Euro je Tonne.“ | [1] („steht bei 65 Euro je Tonne, Restmengen gehen zum Festpreis von 68 Euro“) | Abweichung (gering) | Die Restmengen zu 68 Euro (außerhalb des 55–65-Korridors) sind weggelassen. Der Satz ist die Aussage von [1], aber unvollständig. E3. |
| 18 | „Ein Liter Benzin setzt bei der Verbrennung zwischen 2,28 und 2,37 Kilogramm CO₂ frei. Die Spanne gibt es, weil der Emissionshandel nur den fossilen Anteil bepreist und nicht die Biokraftstoff-Beimischung.“ | [1]; Faktencheck 65-Euro #Emissionsfaktor | bestätigt (Wiedergabe) | Faktencheck zu [1] empfahl, die UBA-Quelle genauer zu benennen; im Kapitel steht nur „Emissionsfaktoren des Umweltbundesamts“ (Z. 83). A10. |
| 19 | „Bei 65 Euro pro Tonne sind das 17,6 bis 18,3 Cent je Liter Benzin (mit Mehrwertsteuer), bei Diesel rund 20 Cent.“ | [1]; Faktencheck N7 (65 × 2,28 × 1,19 = 17,64; × 2,37 = 18,33; Diesel 19,7–20,5) | bestätigt | Diesel: Der Wert „rund 20“ beruht auf einem rückgerechneten Faktor 2,55–2,65 kg/l, für den es keinen direkt zitierbaren UBA-Literwert gibt (Faktencheck N7); „rund 20“ ist vertretbar. Spannung zu IWH 18,6 (A7). |
| 20 | „Der Tankrabatt im Mai und Juni betrug 14,04 Cent Energiesteuer, mit Mehrwertsteuer 16,7 Cent.“ | [1]; Faktencheck (14,04 × 1,19 = 16,71) | bestätigt | |
| 21 | „Umgerechnet in Euro pro Tonne sind das 59 bis 62.“ | [1]; Faktencheck | bestätigt | |
| 22 | „Der Tankrabatt hat damit 91 bis 95 Prozent des CO₂-Preises auf Benzin aufgehoben und 82 bis 85 Prozent auf Diesel.“ | [1]; Faktencheck N3, Z. 23 | bestätigt | Dieselwert liegt an der Rundungsgrenze (81,5 % bei 20,5 Cent, Faktencheck Z. 23: „kann bleiben“). Es sind rechnerische Verhältnisse; die Weitergabe bei Diesel (72 %) wirkt nicht darauf (A9, A8). |
| 23 | „Der Preis stand im Gesetz. An der Säule war er für zwei Monate fast weg.“ | [1] („Der Preis blieb im Gesetz stehen. An der Säule war er fast weg.“) | bestätigt | Für Benzin rechnerisch zutreffend, für Diesel (82–85 %, tatsächlich weitergereicht rund 72 %) schwächer. A8. |
| 24 | „Eine Metaanalyse zur Preiselastizität der Benzinnachfrage findet nach Korrektur für Publikationsbias einen kurzfristigen Wert von −0,09: zehn Prozent billigerer Sprit bedeuten knapp ein Prozent mehr Verbrauch. Langfristig liegt der Wert bei −0,31.“ | [1] (Havránek/Iršová/Janda, Energy Economics 2012) | bestätigt (Wiedergabe) | Studie selbst nicht geöffnet. Beachte: Die Studie betrifft **Benzin**, das Kapitel rechnet im nächsten Satz mit Benzin und Diesel zusammen (A6). |
| 25 | „Daraus ergibt sich für die zwei Monate ein Mehrverbrauch von rund 0,18 bis 0,37 Millionen Tonnen CO₂, bei einer Absatzbasis von rund 62 Milliarden Litern im Jahr.“ | [1] (korrigiert); Faktencheck Nachtrag N1/N2 | bestätigt (Wert) / Abweichung (Herleitung) | Wert und Absatzbasis wie in [1]: 62 Mrd. l durch zwei Wege bestätigt (62,0–62,2). Der Wert 0,18–0,37 Mt ist eine **lineare Skalierung** (×62/42) des ursprünglichen Ergebnisses durch den Faktenprüfer, nicht das Ergebnis eines neu gelaufenen Skripts; das Skript existiert nicht. Die Obergrenze beruht auf doppelter Elastizität, das steht im Kapitel nicht. „Daraus ergibt sich“ lässt die Annahmen (Weitergabe, Obergrenze) weg. A6. |
| 26 | „Das sind 0,7 bis 1,5 Prozent der Verkehrsemissionen dieser zwei Monate.“ | [1]; Faktencheck N2 (0,74 und 1,52 %) | bestätigt | |
| 27 | „Auf die zusätzliche Tonne gerechnet hat der Staat damit zwischen rund 4.300 und 8.700 Euro ausgegeben.“ | [1]; Faktencheck N2 | bestätigt | **8.700, nicht 8.900:** Die Abschnitte 1–4 des Faktenchecks zu [1] nennen noch 8.900; der Nachtrag vom 17.10. (N2) ersetzt das ausdrücklich durch 8.700 („Rundungsartefakt“), und die veröffentlichte Fassung [1] sowie das Kapitel haben 8.700. Der Kostenbezug (1,6 Mrd. €, hib 295/2026) fehlt im Kapitel (A6). N2 empfahl wegen Scheingenauigkeit „rund 4.000 bis 9.000“ als vertretbar (E2). |
| 28 | „Wer im Jahr 35.000 Kilometer mit einem Benziner fährt, bekam in den zwei Monaten rund 88 Euro, wer 8.000 Kilometer fährt, rund 14 Euro (bei 9,0 und 6,5 Litern auf 100 Kilometer).“ | [1]; Faktencheck R8 | bestätigt | Nachgerechnet wurde nicht neu; die Faktenprüfung zu [1] fand 9,03 l/100 km (35.000 km) und 6,29 l/100 km (8.000 km) als implizite Werte (Abweichung gegenüber 6,5 gering, Rundung) und empfahl einen einheitlichen Verbrauch. [1] blieb unverändert, das Kapitel gibt [1] wieder. Die Beträge beruhen auf zwei verschiedenen Verbrauchsannahmen; das steht im Kapitel. |
| 29 | „Der Rabatt zahlt proportional zum Verbrauch.“ | [1] („Sie zahlt proportional zum Verbrauch“) | bestätigt | |
| 30 | „Bei Diesel kam ein Teil gar nicht an: Das ifo-Institut fand eine Weitergabe von rund 12 der 16,7 Cent, etwa 72 Prozent.“ | [1]; Faktencheck N5 (12 / 16,7 = 71,9 %) | bestätigt (Wert) / Abweichung (Vollständigkeit) | [1] sagt: „bei Superbenzin eine nahezu vollständige, bei Diesel … rund 12 der 16,7 Cent“ und nennt den Preisvergleich mit Frankreich. Das Kapitel lässt Superbenzin und die Methode weg. A9. |
| 31 | „Der Staat zahlt in beiden Fällen 100 Prozent.“ | [1] („Der Fiskus zahlt in beiden Fällen 100 Prozent.“) | bestätigt | „Fiskus“ zu „Staat“ ist unkritisch. Kein Prozentbeleg nötig (Steuersenkung gilt für die gesamte Menge). |
| 32 | „Das Deutschlandticket ist als Klimapolitik kein Schnäppchen.“ | [1] (wörtlich) | Abweichung (Wertung) | Wertung aus [1] übernommen; im Buch ohne Kennzeichnung als Wertung. A8. |
| 33 | „Je nach Studie kostet es (Zuschuss von Bund und Ländern zusammen) zwischen 450 und 1.200 Euro je vermiedener Tonne, der Emissionshandel bepreist dieselbe Tonne mit 65 Euro.“ | [1]; Faktencheck N6 (3,0 Mrd. / 6,7 Mt = 448; / 2,5 Mt = 1.200) | bestätigt | Bezugsbasis „Bund und Länder zusammen“ korrekt (Nachtrag 17.10.). Die beiden Studien (Evaluation 2,5 Mt, Ariadne 6,7 Mt) werden nicht genannt, aber der Satz danach kennzeichnet die Unterschiede. |
| 34 | „Die beiden Studien messen aber nicht dasselbe: Ihre Zeiträume, Preise und Bezugsgrößen unterscheiden sich.“ | [1] | bestätigt | |
| 35 | „Das Ticket ist ohnehin vor allem Sozial- und Verkehrspolitik mit einem Klima-Nebeneffekt.“ | [1] | bestätigt | Wertung aus [1]; als Meinung des Rechenkommentars zu lesen (A8). |
| 36 | „Der Emissionsfaktor und der Mehrverbrauch sind die unsichersten Größen.“ | [1] („Emissionsfaktor … empfindlichste Stellschraube“, „Mehrverbrauch … unsicherste Größe“) | Abweichung (gering) | [1] nennt den Emissionsfaktor die **empfindlichste Stellschraube** und nur den Mehrverbrauch die **unsicherste Größe**. Das Kapitel verschmilzt beide zu „unsichersten Größen“. A6. |
| 37 | „Wir vergleichen Kosten des Staates, keine volkswirtschaftlichen Kosten.“ | [1] („viertens“) | bestätigt | |
| 38 | „Und es ist unklar, ob die Ariadne-Zahl zum Deutschlandticket den zusätzlichen Energieverbrauch der verlagerten Fahrten gegenrechnet.“ | [1] („fünftens“) | bestätigt | |
| 39 | „Ein Skript haben wir entgegen unserer ursprünglichen Ankündigung nicht veröffentlicht, die Rechenschritte stehen im Faktencheck.“ | [1] (Schlussnotiz); Faktencheck Abschn. 3; GitHub am 23.10.2026 | bestätigt | Im öffentlichen Repo kein Ordner zum Tankrabatt; `Reports/2026-09-65-euro-rein/` ist vorhanden. Die Rechenschritte im Faktencheck sind die des Prüfers, nicht des Autors (siehe Nr. 25). |

### 2.4 Der CO₂-Preis 2027 (Z. 44–50)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 40 | „Am 15. Oktober 2026 hat der Bundestag eine Änderung des Brennstoffemissionshandelsgesetzes beschlossen (303 Ja-Stimmen, 210 Nein-Stimmen, 52 Enthaltungen).“ | [2]; Bundestag Textarchiv KW 42 (direkt geöffnet) | bestätigt | Drucksachen 21/7869 und 21/8626 nach [2]. |
| 41 | „Danach soll der CO₂-Preis … 2027 im Korridor von 55 bis 65 Euro pro Tonne bleiben, wie schon 2026.“ | [2], [5] | bestätigt | |
| 42 | „Abschließend muss sich noch der Bundesrat damit befassen.“ | [2] („abschließend muss sich aber noch der Bundesrat damit befassen“) | bestätigt (Stand 22.10.) / nicht prüfbar (Stand heute) | Der Verfahrensstand am Prüfdatum (23.10.) und zum Redaktionsschluss (15.11.) konnte nicht belegt werden. A3. |
| 43 | „Zum Entwurf hatte er am 25. September keine Einwendungen erhoben [5][6].“ | [2] (Quelle [5] dort = Bundesrat Drs. 462/26 B) | Abweichung | Das Kapitel nennt [5][6]: [5] ist die Bundestagsseite, [6] der Bundesrats-Beschluss. Der Bundesrats-Beschluss konnte nicht gelesen werden (PDF binär). Auf der Bundestagsseite wird zudem eine **Stellungnahme** des Bundesrats erwähnt (Drs. 21/8252; ob sie zu diesem Gesetz gehört, ist offen). Ob „keine Einwendungen“ korrekt ist, ist daher nicht aufgelöst. A3. |
| 44 | „Der Grund: Der europäische Emissionshandel für Gebäude und Verkehr (ETS 2) startet erst 2028.“ | [2]; Bundestag Textarchiv | bestätigt | |
| 45 | „Ohne die Gesetzesänderung hätte sich der deutsche CO₂-Preis 2027 aus dem schwankenden Durchschnitt der Versteigerungen im bestehenden europäischen Emissionshandel ergeben.“ | [2] (Quelle [1] dort = Bundestag) | bestätigt (über [2]) | Als Konditionalsatz korrekt. |
| 46 | „Wer nach den Versteigerungen noch Zertifikate für 2027 braucht, zahlt feste Preise: 71 Euro pro Tonne für zusätzliche Mengen und 73 Euro pro Tonne bei einem späteren Nachkauf ab 2028.“ | [2]; Bundestag Textarchiv (71 / 73 bestätigt) | Abweichung | Zahlen stimmen. Der Satz steht im Indikativ Präsens und liest sich, als sei das schon geltendes Recht. Das Gesetz ist noch nicht abschließend beschlossen. Notwendig: „nach dem beschlossenen Gesetz sollen … gelten“. A3. |
| 47 | „Offen ist 2028. Die KfW hielt im Oktober 2025 für den Start des europäischen Systems Preise von 50 bis 75 Euro pro Tonne für realistisch und schloss bis zu 120 Euro nicht aus. Für 2030 reichten die Prognosen von 51 bis 391 Euro.“ | [2] (Quelle [3] dort = KfW 23.10.2025) | nicht prüfbar (direkt); Wiedergabe von [2] bestätigt | KfW-PDF nicht lesbar. „realistisch“/„nicht aus“ stammen von [2]. |
| 48 | „Diese Einschätzung entstand, bevor der Start auf 2028 verschoben wurde, und ist ausdrücklich unsicher.“ | [2] | bestätigt (Wiedergabe) | |
| 49 | „Was diese Einordnung nicht zeigt: wie stark ein CO₂-Preis in dieser Höhe den Verbrauch senkt, wer wie stark belastet wird und ob die Einnahmen zurückfließen … Auch der ganze Spritpreis hängt von Öl- und anderen Preisen ab. Die Tabelle zeigt nur den Anteil des CO₂-Preises.“ | [2] („Was die Zahlen nicht zeigen“) | bestätigt | Hinweis: Das Kapitel beantwortet „wie stark ein CO₂-Preis den Verbrauch senkt“ im Tankrabatt-Abschnitt mit Elastizitäten (Rabatt-Seite). Das ist kein Widerspruch, aber ein Leser könnte Unstimmigkeit sehen (E5). |

### 2.5 Die Zahl 6 Billionen (Z. 54–66)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 50 | „Am 12. Oktober 2026 hat KfW Research eine Studie vorgelegt: Rund 6 Billionen Euro müsse Deutschland bis 2045 investieren, um klimaneutral zu werden.“ | [7], [8] | bestätigt | |
| 51 | „Gerechnet hat das Beratungsunternehmen Prognos, auf Basis von vier bekannten Szenarien.“ | [8]; Studie („Berechnungen: Prognos AG“) | bestätigt | |
| 52 | „Je nach Szenario kommen 5,7 bis 6,4 Billionen Euro heraus (2025 bis 2045, in Preisen von 2024), im Schnitt etwa 290 Milliarden Euro pro Jahr.“ | [8]; KfW-Auszug | bestätigt | |
| 53 | „Als Klimaschutzinvestition zählt dabei der volle Preis einer klimafreundlichen Anlage, etwa einer Wärmepumpe oder eines Elektroautos.“ | [8] | Abweichung (gering) | Wärmepumpe-Beispiel in [8] (nicht im gelesenen Studienauszug gefunden); „Elektroauto“ steht in [8] ebenfalls. Beide sind Veranschaulichungen aus [8], im Kapitel aber [7] zugeordnet. A5, A10. |
| 54 | „Wer seine alte Heizung ohnehin ersetzen muss, gibt sowieso Geld aus. Zusätzlich ist nur der Aufpreis gegenüber einer neuen Gasheizung.“ | [8] | Abweichung (gering) | Veranschaulichung aus [8], zugeordnet [7]. A5, A10. |
| 55 | „Die Studie nennt das „Nettoinvestitionen“: Rechnet man so, bleiben im Schnitt rund 145 Milliarden Euro pro Jahr, also knapp die Hälfte.“ | [8]; KfW-Auszug (145 Mrd.) | bestätigt | 145 von 290 ist die Hälfte; „knapp“ stammt aus [8] (E6). |
| 56 | „Zwischen 2018 und 2023 flossen im Schnitt rund 110 Milliarden Euro pro Jahr in Klimaschutz, davon waren rund 80 Milliarden solche Mehrkosten.“ | [8]; KfW-Auszug | bestätigt | |
| 57 | „Zusätzlich aufzubringen sind damit im Mittel etwa 65 Milliarden Euro pro Jahr, das sind rund 1,5 Prozent des Bruttoinlandsprodukts 2024.“ | [8]; KfW-Auszug | bestätigt | |
| 58 | „Die Autorinnen und Autoren nennen das eine „substanzielle, aber zugleich darstellbare Aufgabe““ | [8]; KfW-Auszug (wörtlich) | bestätigt | Hinweis im Studienauszug: Meinung der Autoren, nicht Position der KfW insgesamt (E7). |
| 59 | „Fast die Hälfte der Investitionen entfällt auf den Verkehr (45 Prozent, rund 2,7 Billionen Euro), etwa ein Viertel auf den Energiesektor (25 Prozent, rund 1,5 Billionen).“ | [8]; KfW-Auszug | bestätigt | Gebäude 22 % und Industrie 8 % fehlen im Kapitel (kein Fehler). |
| 60 | „Den größten Teil müssen private Haushalte und Unternehmen tragen, auf die öffentliche Hand entfallen rund 12 Prozent.“ | [8]; KfW-Auszug (12 %) | Abweichung (gering) | [8]: „Die beiden Anteile (öffentliche Hand und Unternehmen) überschneiden sich, weil öffentliche Unternehmen (Stadtwerke, DB) zu den Unternehmen zählen.“ Der Hinweis fehlt; „Privathaushalte und Unternehmen tragen den größten Teil“ ist eine zulässige Verdichtung, aber die 12 % sind kein Rest-Komplement. E7. |
| 61 | „Ein häufiger Irrtum lautet: „Klimaschutz kostet uns 6 Billionen Euro.““ | [8] (Zwischenüberschrift) | Abweichung | „häufig“ nicht belegt (nur Überschrift in [8]). A5, E4. |
| 62 | „Die 6 Billionen sind Investitionen, keine verlorenen Kosten. Ein großer Teil ersetzt Ausgaben, die ohnehin anfallen würden.“ | [8] („Befund“) | bestätigt (Wiedergabe) | |
| 63 | „Dazu kommt ein Nutzen, den die Studie hervorhebt: weniger Abhängigkeit von importiertem Öl, Gas und Kohle, wofür Deutschland zuletzt im Schnitt rund 81 Milliarden Euro pro Jahr ausgegeben hat.“ | [8]; KfW-Auszug (81 Mrd.) | bestätigt | |
| 64 | „Ob sich die Investitionen am Ende vollständig rechnen, beantwortet die Studie nicht mit einer einzelnen Zahl.“ | [8] | bestätigt (Wiedergabe) | |
| 65 | „Wer die 6 Billionen pauschal „Kosten“ nennt, vermischt Bruttoinvestitionen und Mehrkosten. Die Studie selbst trennt beides ausdrücklich.“ | [8] („Unsere Lesart: …“) | Abweichung | In [8] steht der erste Satz ausdrücklich als „Unsere Lesart“. Im Kapitel fehlt die Kennzeichnung, und der Satz steht als Aussage über [7]. Der zweite Teil („Die Studie selbst trennt beides“) ist durch [8] und den Studienauszug gedeckt. A5. |

### 2.6 Was heißt das für dich? (Z. 70–72)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 66 | „Cent pro Liter und Euro pro Tonne lassen sich ineinander umrechnen. Dabei kommt es darauf an, ob Mehrwertsteuer drin ist oder nicht.“ | [2] sinngemäß; Faktencheck N7 | bestätigt | |
| 67 | „IWH und KfW nennen für denselben CO₂-Preis verschiedene Werte, weil das eine brutto und das andere netto ist.“ | [2] („lassen sich die Zahlen nicht direkt vergleichen“) | Abweichung | [2] sagt nur, die Zahlen seien wegen brutto/netto nicht direkt vergleichbar. Das Kapitel führt den Unterschied kausal („weil“) allein auf brutto/netto zurück. Ob Basisjahr, Datenbasis oder Methode ebenfalls beitragen, ist ungeprüft (IWH-Original nicht gesehen). Eine grobe Rückrechnung stützt es (15,7 / 1,19 ≈ 13), ist aber nicht belegt. A7. |
| 68 | „Eine riesige Summe sagt wenig, solange unklar ist, ob Investitionen oder Mehrkosten gemeint sind. Bei den 6 Billionen sind es Investitionen.“ | [7], [8] | bestätigt | |
| 69 | „Mehrkosten sind die rund 65 Milliarden Euro pro Jahr.“ | [7], [8]; Kapitel selbst (Z. 56–58, Grafik 2) | **kritisch** (behebbar) | Falsch bzw. widersprüchlich: Die Mehrkosten sind rund 145 Mrd. €/Jahr (nötig) bzw. 80 (bisher). Die 65 Mrd. sind der **zusätzlich** aufzubringende Betrag (145 minus 80). Der Satz widerspricht dem Kapitel selbst (Z. 56–58) und Grafik 2. A1. |
| 70 | „Der Tankrabatt war ein Eingriff in den Preis, den der CO₂-Preis setzt.“ | keine (neue Formulierung, Herkunftstabelle: „neu“) | Abweichung | Der CO₂-Preis wurde nicht verändert („Der Preis stand im Gesetz“, Z. 28); der Rabatt senkte die Energiesteuer. „Eingriff in den Preis“ widerspricht dem Satz im Haupttext und ist eine neue Wertung. A2. |
| 71 | „Wie sich der CO₂-Preis 2027 auf deine Rechnung auswirkt, hängt vom Gesetz ab, das noch durch den Bundesrat muss.“ | [2] | Abweichung | „hängt vom Gesetz ab“ ist plausibel ([2]: ohne Gesetz bestimmte der EU-Handelsdurchschnitt), aber es ist eine neue Folgerung. „durch den Bundesrat muss“ suggeriert Zustimmungsbedürftigkeit; [2] sagt „abschließend befassen“. Der Bundesrats-Stand ist nicht belegt. A2, A3. |

### 2.7 Lagen wir richtig? (Z. 76–79)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 72 | „Die Kernaussage hat gehalten: Der Tankrabatt hat 91 bis 95 Prozent des CO₂-Preises auf Benzin aufgehoben.“ | [1]; Faktencheck | bestätigt | „hat gehalten“ ist Eigenbewertung; durch den Faktencheck zu [1] gedeckt (R-Nachrechnung). |
| 73 | „Falsch war die Absatzbasis (42 statt rund 62 Milliarden Liter). Daraus wurden Mehrverbrauch und Kosten je Tonne falsch angegeben.“ | [1] (Korrekturhinweis); `korrektur_2026-10-17.md` | bestätigt | |
| 74 | Die Korrekturliste nennt als Fehler **nur** die Absatzbasis. | [1] (Korrekturhinweis): zusätzlich „Spanne für das Mehrwertsteuermodell lag bei 21 statt 23 Cent“, ergänzte Kennzeichnungen (brutto, Bezugsbasis Deutschlandticket), 73 → 72 % in der Grafik | Abweichung | Die Auslassung ist sachlich nicht falsch, aber unvollständig: [1] nennt zwei Fehler. Das Kapitel enthält weder das MwSt-Modell noch die 73 %. A4. |
| 75 | „Wir haben das am 17. Oktober korrigiert, mit Hinweis im Artikel. Die Grafiken zeigen dort noch den alten Stand, das steht am Ende des Artikels.“ | [1] („Zu den Grafiken“) | bestätigt | |
| 76 | „Das angekündigte Skript haben wir nicht veröffentlicht. Ausführlich in Kapitel 8.“ | [1]; GitHub | bestätigt | Kapitel 8 nicht prüfbar (E4). |
| 77 | „Nachtrag im Artikel: Nach Erscheinen wurde am 25. September 2026 eine erneute Senkung der Energiesteuer für Oktober bis Dezember beschlossen, veranschlagt mit rund 2,5 Milliarden Euro.“ | [1] (Nachtrag, Quelle DATEV-Bericht); Faktencheck 65-Euro | bestätigt (Wiedergabe) | DATEV-Quelle steht nicht in der Quellenliste des Kapitels (A10). |
| 78 | „Dass Entlastungen in Serie kommen, haben wir im Artikel ausdrücklich nur als Hypothese formuliert. Ein Beleg dafür ist es nicht.“ | [1] | Abweichung | In [1] ist nur der **Mechanismus** („Referenzpunkt verschiebt sich“, ob das der Mechanismus ist, aus dem Tankrabatte in Serie entstehen) als Hypothese/Vermutung formuliert. Dass es 2026 zwei Senkungen gab (Mai/Juni und Oktober–Dezember), ist dagegen Tatsache (Nachtrag). Das Kapitel setzt beides gleich. A4. |
| 79 | „CO₂-Preis 2027: Unsere erste Fassung vom 17. Oktober klang, als sei die Änderung schon in Kraft. Das war sie nicht. Wir haben den Artikel am 22. Oktober korrigiert: neuer Titel, Hinweis „Aktualisiert am 22.10.2026“, Bundesrat ergänzt.“ | [2] (Hinweis „Aktualisiert am 22.10.2026“); `korrektur_2026-10-22.md` | bestätigt | „neuer Titel“: Der Abruf zeigt den Titel „Bundestag friert CO₂-Preis 2027 ein …“ (laut Korrekturvermerk der neue). Der Slug `…eingefroren…` ist unverändert. |
| 80 | „Wie es weitergeht, entscheidet der Bundesrat. Den Stand zum Redaktionsschluss belegen wir aus dem Bundesrats-Beschluss oder schreiben „noch offen“.“ | – | Abweichung | Zweiter Satz ist ein redaktioneller Platzhalter (Arbeitsanweisung aus der Gliederung), kein Buchtext. Erster Satz: „entscheidet“ ist stärker als „abschließend befassen“ und prüft den Verfahrensweg nicht. A3. |
| 81 | „KfW-Studie: Hier haben wir keine eigene Analyse gemacht, es gibt also nichts, was sich als richtig oder falsch erweisen könnte. Wir haben die Wiedergabe gegen die Studie geprüft.“ | [8] („Hinweis: … keine eigene Analyse“); Faktencheck 20.10. (ok) | Abweichung | „keine eigene Analyse“ stimmt ([8], Gliederung). Der Folgesatz ist aber logisch falsch: Die Wiedergabe kann richtig oder falsch sein, und die Modellrechnung der Studie selbst ist ungeprüft. Der Satz „Wiedergabe geprüft“ ist durch den Faktencheck vom 20.10. gedeckt (Nachtrag 2: ok). A5. |

### 2.8 Woher wir das wissen und Quellenliste (Z. 83–96)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 82 | Quellenliste [1]–[7] mit Titeln, Daten und URLs | Abgleich mit Referenzfassungen und den Quellenlisten in [1], [2], [8] | bestätigt | Titel, Daten (18.09., 17.10., 22.10., 25.09., 23.10.2025, 12.10.2026) und URLs stimmen mit den Referenzfassungen überein. Bundestag-Link [5] und KfW-Links geöffnet bzw. gegen die Artikel verglichen; IWH- und Bundesrats-URL nicht lesbar (nur gegen [2] verglichen). |
| 83 | Quelle [8] (Klima-Kompass-Wissen-Artikel, 20.10.) | – | Abweichung | [8] steht in der Liste, wird im Text aber **nirgends** zitiert; die dem Artikel [8] eigenen Passagen (Beispiele, „Unsere Lesart“, „häufiger Irrtum“) sind [7] zugeordnet. A10. |
| 84 | „Tankrabatt: Deutsche Emissionshandelsstelle (erste Versteigerung, 01.07.2026), Bundestag (hib 295/2026 …), ifo Tankrabatt-Tracker, Evaluation des Deutschlandtickets …, Ariadne D-Ticket Impact Tracker, Havránek/Iršová/Janda …, Kraftstoffabsatz en2x/AGEB, Emissionsfaktoren des Umweltbundesamts.“ | [1] (Quellenzeile) | bestätigt (Wiedergabe) | Alle genannten Quellen stehen in [1]. Sie sind im Kapitel nicht einzeln verlinkt (nur über [1]); der Nachtrag-Beleg (DATEV) fehlt. A10. |
| 85 | „CO₂-Preis 2027: … IWH (Pressemitteilung 10/2025), KfW Research (23.10.2025), Umweltbundesamt (Pressemitteilung 35/2025) [3][4][5][6].“ | [2] | Abweichung (gering) | UBA-PM 35/2025 steht im Kapitel nicht in der Quellenliste. [2] zitiert sie als Quelle [4]. A10. |
| 86 | „Faktenchecks im Repository: `Reports/2026-09-65-euro-rein/`, `Reports/2026-10-17-co2-preis-2027/`, `Reports/2026-10-20-kfw-6-billionen/`.“ | GitHub (Reports) | bestätigt | Alle drei Ordner sind im öffentlichen Repository sichtbar. Hinweis: Für [2] liegt eine Zweitprüfung mit Urteil „kritisch“ vom 22.10. vor, die zitierte Fassung ist die danach korrigierte (Abschnitt 6). |

## 3. Grafiken

Geprüft: `kap03_grafik1_co2_preis_tankrabatt.png`, `kap03_grafik2_kfw_investitionen.png`, `kap03_grafiken.R`. Grafik und Skript stimmen überein; die Zahlen sind fest eingetragen und stammen aus den Artikeln. Kein Hinweis auf neue Berechnung im Skript außer Darstellung.

| Nr. | Punkt | Befund | Ergebnis | Hinweis |
|---|---|---|---|---|
| G1 | Grafik 1: Werte | Benzin: Balken 17,6–18,3, Punkt Tankrabatt 16,7. Diesel: Punkt CO₂-Preis 20 („rund 20 ct“), Tankrabatt 16,7. Alle Werte wie [1] (korrigierte Fassung) und Kapitel Z. 26–28 | bestätigt | Diesel wird als Punktwert dargestellt, im Text als „rund 20“; die Spanne 19,7–20,5 aus [1]/Faktencheck wird nicht gezeigt (E5). |
| G2 | Grafik 1: Titel „Der Tankrabatt glich den CO2-Preis fast aus“ | Titel gilt für beide Zeilen. Benzin: 91–95 % (passt). Diesel: 82–85 % rechnerisch, nach ifo-Weitergabe (72 %) kamen nur rund 12 von 16,7 Cent an; die Quellenzeile nennt die 72 % nur im Kleingedruckten | Abweichung | „fast ausgeglichen“ ist für Benzin gedeckt, für Diesel schwächer und wird nicht eingeschränkt. Zugleich verwendet die Grafik „CO2“ statt „CO₂“ (R-Darstellung). A8, E8. |
| G3 | Grafik 1: Quellenzeile | „Quelle: Klima Kompass, Rechenkommentar … (18.09.2026, Fassung nach Korrektur vom 17.10.2026) … Kein Evidenzcheck, keine präregistrierte Analyse.“ | bestätigt | Erfüllt die Kennzeichnungsregel und die Regel zu Titel/Einheit/Datenstand/Quelle (Einheit „Cent je Liter (mit Mehrwertsteuer)“). |
| G4 | Grafik 2: Werte | Bisher 110 / 80, nötig 290 / 145 Mrd. € je Jahr; Beschriftung „Zusätzlich nötig: rund 65 Mrd. € pro Jahr (etwa 1,5 % des BIP 2024)“ über der Gruppe „Mehrkosten“ | bestätigt | Alle Zahlen stimmen mit [7]/[8] und dem lokalen Studienauszug überein. Die Beschriftung ist richtig der Gruppe „Mehrkosten“ zugeordnet (nicht den Bruttobalken) und widerspricht damit dem Kapitel-Satz Z. 71 (A1). |
| G5 | Grafik 2: Einheiten und Zeitraum | Achse „Milliarden Euro pro Jahr (Preise 2024)“; Legende „Durchschnitt 2018–2023 (bisher)“ und „nötiger Durchschnitt 2025–2045“ | bestätigt (mit Vorbehalt) | Das Preisjahr 2024 ist im Studienauszug für 290 (Preise 2024) bestätigt; für die Vergangenheitswerte 110/80 habe ich das Preisjahr nicht gesondert gefunden. E6. |
| G6 | Grafik 2: Titel „6 Billionen sind Investitionen, die Mehrkosten sind kleiner“ | Die Balken zeigen Jahresdurchschnitte (290, 145), nicht die 6 Billionen | Abweichung (gering) | Der Titel verbindet die Gesamtsumme (6 Bio.) mit Jahreswerten; die Quellenzeile klärt das („6 Billionen Euro = Summe …“). E8. |
| G7 | Grafik 2: Quellenzeile | „… Modellrechnung auf Basis von Szenarien (Mittel der vier Szenarien), keine eigene Analyse. 6 Billionen Euro = Summe der Bruttoinvestitionen 2025–2045 (je nach Szenario 5,7 bis 6,4).“ | bestätigt | |

## 4. Auflagen (vor Freigabe zu erfüllen)

**A1. Z. 71 (Was heißt das für dich, Punkt 2): „Mehrkosten sind die rund 65 Milliarden Euro pro Jahr.“** Falsch (Nr. 69). Die Mehrkosten betragen nach [7] rund 145 Mrd. € pro Jahr (nötig) bzw. 80 (bisher); 65 Mrd. ist der zusätzlich aufzubringende Betrag. Änderungsvorschlag: „Bei den 6 Billionen sind es Investitionen. Die Mehrkosten sind kleiner (rund 145 Milliarden Euro pro Jahr), und zusätzlich zu heute aufzubringen sind rund 65 Milliarden Euro pro Jahr.“

**A2. Z. 72 (Punkt 3): „Der Tankrabatt war ein Eingriff in den Preis, den der CO₂-Preis setzt. Wie sich der CO₂-Preis 2027 … hängt vom Gesetz ab, das noch durch den Bundesrat muss.“** (Nr. 70, 71) Der CO₂-Preis wurde nicht verändert (Z. 28: „Der Preis stand im Gesetz“); der Rabatt senkte die Energiesteuer. „Eingriff in den Preis“ ist neu und widerspricht dem Haupttext. Änderungsvorschlag: „Der Tankrabatt hat an der Zapfsäule rechnerisch fast aufgehoben, was der CO₂-Preis auf Benzin aufschlug. Der CO₂-Preis selbst blieb unverändert. Wie sich der CO₂-Preis 2027 auf deine Rechnung auswirkt, hängt davon ab, wo im Korridor von 55 bis 65 Euro er landet; das Gesetz, das den Korridor beibehält, ist vom Bundestag beschlossen, der Bundesrat muss sich noch damit befassen [Stand 22.10.2026 laut Quelle, am Stichtag prüfen].“ Der Satz zur Auswirkung auf „deine Rechnung“ soll nur die Quellenaussage tragen (A3).

**A3. Bundesrats-Stand und Gesetzeslage (Z. 44–46, 72, 78).** (Nr. 42, 43, 46, 71, 80)
- Z. 78 enthält die Arbeitsanweisung „Den Stand zum Redaktionsschluss belegen wir aus dem Bundesrats-Beschluss oder schreiben „noch offen“.“ Das ist keine Buchaussage. Streichen oder ersetzen. Variante: „Stand 22.10.2026: Der Bundesrat hat sich noch nicht abschließend damit befasst. [Stand zum Redaktionsschluss am … mit Bundesrats-Beschluss belegen oder „noch offen“]“. Der Redaktionsschluss-Stand muss mit Beleg (Bundesrat, Datum des Beschlusses) eingetragen werden, sonst „noch offen“.
- „Wie es weitergeht, entscheidet der Bundesrat“ ersetzen durch „Abschließend muss sich noch der Bundesrat damit befassen“ (so [2]).
- Z. 46: „zahlt feste Preise: 71 Euro … 73 Euro …“ im Konjunktiv bzw. mit „nach dem beschlossenen Gesetz“ („sollen … gelten“), da das Gesetz noch nicht abschließend beschlossen ist.
- Z. 44: „Zum Entwurf hatte er am 25. September keine Einwendungen erhoben [5][6].“ Vor Freigabe Bundesrats-Beschluss Drs. 462/26 (B) direkt öffnen (PDF) und mit der auf der Bundestagsseite erwähnten Bundesrats-Stellungnahme abgleichen (Drs. 21/8252). Falls dort eine Stellungnahme statt „keine Einwendungen“ steht, ist der Satz zu korrigieren. Die Zitation [5][6] ist so zu setzen, dass die Aussage zum Bundesrat nur an [6] hängt.

**A4. Z. 76–77 („Lagen wir richtig?“: 65 Euro rein, Nachtrag).** (Nr. 74, 78)
- Die Korrektur vom 17.10. betraf nach [1] zwei Fehler (Absatzbasis; Untergrenze MwSt-Modell 21 statt 23 Cent) sowie ergänzte Kennzeichnungen und 73 → 72 % in der Grafik. Das Kapitel nennt nur die Absatzbasis. Ergänzung: „Außerdem lag die Untergrenze für das diskutierte Mehrwertsteuermodell bei 21 statt 23 Cent, und wir haben Kennzeichnungen (brutto, Bezugsbasis Deutschlandticket) ergänzt.“ Das MwSt-Modell ist im Kapitel nicht erklärt; entweder mit Halbsatz erklären („die damals diskutierte Senkung der Mehrwertsteuer auf Sprit“) oder die Auslassung ausdrücklich benennen.
- „Dass Entlastungen in Serie kommen, haben wir im Artikel ausdrücklich nur als Hypothese formuliert“: nicht korrekt gewichtet. Änderungsvorschlag: „Im Artikel haben wir als Vermutung geschrieben, dass eine befristete Entlastung den Referenzpunkt verschiebt und so weitere Entlastungen begünstigen könnte. Belegt ist das nicht. Tatsache ist: Nach Erscheinen wurde am 25. September 2026 eine weitere Senkung der Energiesteuer für Oktober bis Dezember beschlossen (rund 2,5 Milliarden Euro).“

**A5. KfW-Teile (Z. 53–54, 65–66, 79).** (Nr. 53, 54, 61, 65, 81)
- Z. 79: „… es gibt also nichts, was sich als richtig oder falsch erweisen könnte“ ist logisch falsch. Änderungsvorschlag: „KfW-Studie: Hier haben wir keine eigene Analyse gemacht, sondern die Zahlen der Studie wiedergegeben. Ob die Modellrechnung die Zukunft trifft, können wir nicht beurteilen. Wir haben die Wiedergabe gegen die Studie geprüft.“
- Z. 66: „Wer die 6 Billionen pauschal „Kosten“ nennt, vermischt …“ ist in [8] als „Unsere Lesart“ gekennzeichnet. Im Buch kennzeichnen: „Unsere Lesart: …“. Der Satz „Die Studie selbst trennt beides ausdrücklich“ bleibt mit [7].
- Beispiele (Wärmepumpe, Elektroauto, Gasheizung, Z. 56) stammen aus [8], nicht aus [7]; entweder als Veranschaulichung kennzeichnen („Ein Beispiel:“) und [8] zitieren, oder im Studienvolltext belegen (A10).
- Z. 64: „Ein häufiger Irrtum lautet“: „häufig“ ist nicht belegt. Änderungsvorschlag: „Ein verbreiteter Satz lautet“ ohne Häufigkeitsangabe, oder Beleg nennen.

**A6. Mehrverbrauch und Kosten je Tonne (Z. 22, 34, 40).** (Nr. 13, 25, 27, 36)
- Z. 22 „… gerechnet haben wir Umrechnungen und Sensitivitäten, keine eigene Schätzung“: Der Faktencheck zu [1] (Abschn. 3) stuft die elastizitätsbasierte Berechnung des Mehrverbrauchs und der Kosten je Tonne als eigene Modellrechnung ein. Änderungsvorschlag: „… gerechnet haben wir Umrechnungen und eine Modellrechnung zum Mehrverbrauch auf Basis einer Elastizität aus der Literatur.“
- Z. 34: Annahmen ergänzen, die in [1] stehen: Preisweitergabe berücksichtigt; Obergrenze entspricht der doppelten Elastizität ([1]: „publizierte Schätzungen etwa doppelt so groß“); Absatzbasis gilt für Benzin und Diesel zusammen, die Elastizität stammt aus einer Studie zu Benzin. Ergänzen: „… und dass die Gesamtkosten für den Staat rund 1,6 Milliarden Euro betrugen (hib 295/2026)“, damit die 4.300–8.700 Euro nachvollziehbar sind.
- Ergänzen: Die korrigierten Werte entstanden durch Umrechnung der Absatzbasis (62 statt 42 Mrd. Liter), nicht durch ein neu gelaufenes Skript; das Skript liegt nicht vor. Der Satz in Z. 40 („Die Rechenschritte stehen im Faktencheck“) soll sagen, dass der Faktencheck die Umrechnung nachvollzieht, nicht das ursprüngliche Skript ersetzt.
- Z. 40: „Der Emissionsfaktor und der Mehrverbrauch sind die unsichersten Größen“ gemäß [1] ändern: „Der Emissionsfaktor ist die empfindlichste Stellschraube, der Mehrverbrauch die unsicherste Größe.“

**A7. IWH-/KfW-Umrechnung (Z. 9–18, 70).** (Nr. 3, 6–9, 19, 67)
- Direkte Prüfung am IWH-Original (Tabelle K2 in PM 10/2025) und am KfW-Papier vom 23.10.2025 steht aus: Werte, brutto/netto, Basisjahr 2020, ADAC/Verbraucherzentrale NRW-Datenbasis. Die Zweitprüfung vom 22.10. konnte das ebenfalls nicht leisten. Bis dahin sind die Werte „nach Angaben von [2]“ zu kennzeichnen, oder die Prüfung ist nachzuholen und hier als Nachtrag zu dokumentieren.
- Das Kapitel nennt für denselben Korridor zwei Benzin-Werte (IWH 15,7–18,6 gegenüber eigener Rechnung 17,6–18,3 bei 65 Euro). Erklärung ergänzen, dass es zwei Rechenwege sind (IWH-Tabelle: Aufschlag gegenüber Preisen vor dem CO₂-Preis; Rechenkommentar: Emissionsfaktor × Preis × 1,19) und dass die Werte deshalb leicht abweichen. Vor der Formulierung die IWH-Methode am Original prüfen.
- Z. 70: „weil das eine brutto und das andere netto ist“ ersetzen durch „und zwar nicht direkt vergleichbar, weil das eine brutto und das andere netto ist“ (wortnah zu [2]) oder die weiteren Gründe ungeprüft lassen.

**A8. Wertungen (Z. 38, Grafik 1).** (Nr. 23, 32, 35; G2)
- Z. 38 „Das Deutschlandticket ist als Klimapolitik kein Schnäppchen“ ist eine Wertung aus [1]. Entweder als Wertung des Rechenkommentars kennzeichnen („Unsere Gegenrechnung:“) oder neutral: „Je vermiedener Tonne CO₂ ist das Ticket nach diesen Zahlen deutlich teurer als der CO₂-Preis.“
- Grafik 1, Titel: „Der Tankrabatt glich den CO2-Preis fast aus“ gilt nur für Benzin. Änderungsvorschlag: „Der Tankrabatt entsprach bei Benzin fast dem CO₂-Aufschlag“ oder Diesel mit eigenem Hinweis („bei Diesel kamen nach ifo rund 72 % an“) in die Grafik. Z. 28 „fast weg“ gilt für Benzin; Diesel einschränken.

**A9. Z. 36 (ifo-Weitergabe).** (Nr. 30) [1] sagt: bei Superbenzin „nahezu vollständige“, bei Diesel „rund 12 der 16,7 Cent“ Weitergabe, per Preisvergleich zu Frankreich. Das Kapitel lässt Superbenzin und die Methode weg. Ergänzen: „Das ifo-Institut fand per Preisvergleich mit Frankreich bei Superbenzin eine nahezu vollständige Weitergabe, bei Diesel rund 12 der 16,7 Cent, etwa 72 Prozent.“

**A10. Quellenliste und Zuordnung (Z. 83–96).** (Nr. 18, 53, 54, 61, 77, 83–85)
- [8] steht in der Liste, ist aber im Text nicht zitiert. Entweder an den Stellen zitieren, die nur dort stehen (Beispiele Wärmepumpe/Elektroauto/Gasheizung, „Unsere Lesart“, „Irrtum“), oder aus der Liste streichen.
- Quellen, die im Text vorkommen, aber nicht in der Liste stehen: DATEV-Bericht (Nachtrag 25.09.), UBA-PM 35/2025, DEHSt, hib 295/2026, ifo, BMV/infas, Ariadne, Havránek et al., en2x/AGEB, UBA-Emissionsfaktoren. Entweder als Einträge mit Link aufnehmen (Links stehen in [1]) oder im Satz kennzeichnen, dass die Angaben über [1] nachzulesen sind. Mindestens DATEV und UBA-PM 35/2025 ergänzen, weil sie ohne [1] nicht auffindbar sind.
- Faktencheck zu [1] empfahl bereits, die UBA-Quelle der Emissionsfaktoren präziser zu benennen (Climate Change 28/2022).

## 5. Empfehlungen (nicht bindend)

- **E1.** „Kurz gesagt“, erster Satz: Die 91–95 % sind das Ergebnis des Rechenkommentars. Ergänzen: „nach unserer Rechnung“.
- **E2.** Faktencheck N2 (65-Euro) nennt „rund 0,2 bis 0,4 Millionen Tonnen“ und „rund 4.000 bis 9.000 Euro“ als Formulierung ohne Scheingenauigkeit. Das Kapitel gibt die Werte der Veröffentlichung wieder (zulässig); die gerundete Variante wäre ehrlicher, würde aber vom Artikel abweichen.
- **E3.** Z. 24: Restmengen zum Festpreis von 68 Euro (aus [1]) ergänzen oder „für 2026“ präzisieren, damit der Satz „Preis für 2026 steht bei 65 Euro“ nicht als vollständig gilt.
- **E4.** Verweise auf Kapitel 7 und 8 (Z. 18, 22, 76) gegen die fertigen Kapitel prüfen; „häufige Stolperstelle“ (Z. 18) ohne Häufigkeitsangabe formulieren.
- **E5.** Grafik 1: Diesel-Spanne 19,7–20,5 als Balken statt Punkt zeigen (wie bei Benzin); „CO2“ in den Grafiken als „CO₂“.
- **E6.** „Wirtschaftsleistung“ in „Kurz gesagt“ durch „Bruttoinlandsprodukt 2024“ ersetzen; Preisjahr der Vergangenheitswerte (110/80) in Grafik 2 am Original belegen; „knapp die Hälfte“ (Z. 56) durch „etwa die Hälfte“ ersetzen, weil 145 / 290 genau 50 % ergibt (Wert aus [8], keine neue Rechnung nötig).
- **E7.** Z. 64: den Hinweis aus [8] übernehmen, dass sich öffentliche Hand und Unternehmen überschneiden (öffentliche Unternehmen); Z. 58: „Die Autorinnen und Autoren“ ist richtig, an anderer Stelle „laut KfW“ als „laut den Autorinnen und Autoren von KfW Research“ präzisieren (Meinung der Autoren).
- **E8.** Grafik 2: Titel „6 Billionen sind Investitionen, die Mehrkosten sind kleiner“ um „pro Jahr“ ergänzen oder den Jahresbezug in den Untertitel ziehen.

## 6. Nicht geprüft / Vorbehalte

- **IWH-PDF, KfW-PDF vom 23.10.2025, Bundesrats-Beschluss Drs. 462/26 (B)** konnten nicht gelesen werden (PDF/Binär). Werte und Aussagen dazu sind nur über die Referenzfassung [2] belegt. Der Verfahrensstand im Bundesrat (zweiter Durchgang) ist nicht belegt.
- **KfW Fokus 561:** nur über den lokalen Textauszug im Report-Ordner (Zeilen 10–60, 145–204) geprüft; die Studie selbst und das Preisjahr der Vergangenheitswerte wurden nicht am Original gesehen. Das Beispiel Wärmepumpe/Gasheizung wurde im gelesenen Teil nicht gefunden.
- **Primärquellen von [1]** (DEHSt, hib 295/2026, ifo-Tracker, BMV/infas-Evaluation, Ariadne, Havránek et al., en2x/AGEB, UBA) nicht direkt geöffnet; gestützt auf den Faktencheck zu [1].
- **Skript fehlt.** Die korrigierten Zahlen (0,18–0,37 Mt, 4.300–8.700 €/t) sind Ergebnis einer linearen Skalierung (N2 des Faktenchecks zu [1]), nicht eines reproduzierten Skripts. Siehe A6.
- **Dokumentierter Prüfstand für [2]:** Die Zweitprüfung vom 22.10.2026 lautete „kritisch“. Ihre Pflichtauflagen (u. a. direkte Quellenprüfung IWH) sind in den gelesenen Dateien nicht als erledigt dokumentiert. Die Korrekturen wurden laut `korrektur_2026-10-22.md` umgesetzt und sind in der Referenzfassung sichtbar, eine dateibasierte Nachprüfung der korrigierten Fassung habe ich nicht gefunden (Regel CLAUDE.md: Nachkontrolle als Datei). Das ist vor Freigabe zu klären.
- **Kapitel 7 und 8** (Verweise) sowie **Stil, Wortzahl (Ziel 1.300–1.700), Leseniveau** nicht Teil dieser Prüfung.
- **Rechtschreibung/Typografie** nicht geprüft.

## 7. Was für die Freigabe noch zu erledigen ist

1. A1–A10 umsetzen; danach fokussierte Nachprüfung als Nachtrag in dieser Datei.
2. Bundesrats-Stand zum Redaktionsschluss mit Beleg eintragen oder „noch offen“.
3. IWH-/KfW-Originale und Bundesrats-Beschluss direkt öffnen (A3, A7); Prüfstand von [2] dokumentieren.
4. Grafiken nach A8/E5/E8 anpassen und neu erzeugen; danach erneut als Bild prüfen.
5. Freigabe durch Daniel Saure nach vollständiger Lektüre des aktuellen Textes (kein Freigabevermerk in dieser Datei).

## Gesamturteil

**ok mit Auflagen** (10 Auflagen, 8 Empfehlungen). Die Zahlen aus den drei Ausgangsstücken sind im Wesentlichen korrekt wiedergegeben; die korrigierten Werte der 17.10.-Fassung (62 Mrd. Liter, 0,18–0,37 Mt, 0,7–1,5 %, 4.300–8.700 €/t, 72 %) stimmen mit [1] und dem Nachtrag des Faktenchecks überein, und die KfW-Zahlen sind durch den lokalen Studienauszug gedeckt. Es wird nichts als bereits in Kraft dargestellt, mit Ausnahme der Preise 71/73 Euro (A3). Gravierend ist der falsche Satz in „Was heißt das für dich?“ Punkt 2 (A1: „kritisch“ auf Einzelpunktebene, behebbar), dazu der Satz „Eingriff in den Preis“ (A2) und die offene Bundesrats-/Gesetzeslage (A3). Solange A1 bis A3 nicht erfüllt sind, ist das Kapitel nicht freigabefähig. Keine neue Berechnung im Kapitel gefunden, die nicht aus den Quellen stammt; die neuen Bausteine („Was heißt das für dich?“, „Lagen wir richtig?“) enthalten aber drei neue Folgerungen bzw. Wertungen (Nr. 67, 70, 71), die in A2 und A7 behandelt sind.

*Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.*
