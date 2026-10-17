# Faktencheck: „65 Euro rein, 59 Euro raus“

| Feld | Wert |
|---|---|
| Datum des Faktenchecks | 17.10.2026 |
| Artikel-URL | https://klimaevidenzcheck.substack.com/p/65-euro-rein-59-euro-raus |
| Veröffentlicht | 18.09.2026 |
| Art | Nachträglicher Faktencheck eines bereits veröffentlichten Beitrags |
| Prüfer | Subagent `faktenpruefer` (unabhängig, nicht Autor) |
| Selbstbezeichnung des Beitrags | „Rechenkommentar, keine präregistrierte Analyse“ |
| **Gesamturteil** | **ok mit Auflagen** |

**Kurzbegründung des Urteils:** Die Primärdaten stimmen (Auktion, Tankrabatt-Gesetz, Kosten 1,6 Mrd. €, Havránek-Elastizitäten, D-Ticket-Studien, Regionalisierungsgesetz). Auch die Kernaussage hält: 59–62 €/t bzw. 91–95 % des CO₂-Preises auf Benzin wurden aufgehoben. Dagegen gibt es mehrere Abweichungen bei abgeleiteten Werten:
- Die Absatzbasis von 42 Mrd. l/Jahr ist zu niedrig. Primärdaten ergeben etwa 62 Mrd. l. Das betrifft die eigene 1,2-Mrd.-Überschlagsrechnung, den Mehrverbrauch und die 6.400–12.800 €/t.
- Die Verteilungsbeispiele beruhen auf uneinheitlichen Verbrauchsannahmen.
- Die Untergrenze 21 ct/l im MwSt-Modell ist in den Quellen nicht belegt.
- Die D-Ticket-Kennzahlen nutzen eine gemischte Bezugsbasis (Bund gegenüber Bund+Länder).
- Das im Artikel angekündigte Skript existiert nicht.

Keiner der Punkte kehrt die Kernaussage um. Die Transparenzzusage ist aber öffentlich nicht eingelöst.

Hinweis zur Methode: Der Artikeltext wurde über WebFetch von der Substack-Seite gelesen. Eine lokale Fassung des Artikels lag im Repo nicht vor. Alle Nachrechnungen stehen unten Schritt für Schritt. Wo Eingangswerte im Artikel fehlen, steht das ausdrücklich da. Zwei Links wurden nicht abgerufen, sondern als Standardadressen eingesetzt: EnergieStG § 2 (gesetze-im-internet.de) und die BAFA-Übersichtsseite. Der Steuersatz 65,45 ct/l stammt aus dem Gesetzestext und wurde in dieser Prüfung nicht erneut online abgeglichen.

---

## 1. Tabelle der Behauptungen

### 1a. Primärdaten (Auktion, Gesetz, Studien)

| # | Behauptung im Artikel | Quelle (mit Link) | Befund | Anmerkung |
|---|---|---|---|---|
| 1 | Erste nEHS-Versteigerung am 1. Juli 2026 | [DEHSt: Erste Versteigerung im nEHS erfolgreich durchgeführt](https://www.dehst.de/SharedDocs/news/DE/nehs-erste-versteigerung.html) | bestätigt | DEHSt-Meldung vom 02.07.2026 zur Auktion vom 01.07.2026. |
| 2 | Gesetzlicher Preiskorridor 55–65 €/t | DEHSt (s. o.); [EEX/Windkraft-Journal 02.07.2026](https://www.windkraft-journal.de/2026/07/02/eex-fuehrt-erste-nehs-auktion-erfolgreich-durch/225692) | bestätigt | |
| 3 | Zuschlagspreis 65 €/t (Höchstwert) | DEHSt; EEX (s. o.) | bestätigt | |
| 4 | 101 Teilnehmer | DEHSt (s. o.) | bestätigt | |
| 5 | Gebote über rund 292 Mio. Zertifikate | DEHSt („knapp 292 Mio.“); [MEW: 291.711.834 nEZ](https://www.mew-verband.de/aktuelles/presse/mew-fordert-ueberarbeitung-der-nehs-versteigerungen-mittelstandsfeindlich-und-wenig-praxistauglich) | bestätigt | |
| 6 | Zugeteilt 21,3 Mio. | EEX: 21.341.599 nEZ (s. o.) | bestätigt | Verdopplung nach der 65-Euro-Regel (§ 12 BEHV), ursprünglich etwa 10,67 Mio. |
| 7 | 13,7-fache Überzeichnung | MEW (s. o.): Faktor 13,67 bezogen auf die zugeteilte Menge | bestätigt | Nachrechnung: 291,71 / 21,34 = 13,67. Bezogen auf die ursprüngliche Menge wäre es 27,3-fach. Der Artikel nennt die Bezugsgröße implizit richtig. |
| 8 | Restmengen zum Festpreis von 68 € | [Windkraft-Journal/EEX](https://www.windkraft-journal.de/2026/07/02/eex-fuehrt-erste-nehs-auktion-erfolgreich-durch/225692) | bestätigt | Laut EEX ab November 2026 „Überschussmengenpreis“ 68 €. Die DEHSt-Meldung selbst nennt den Wert nicht. |
| 9 | Erste Auktion brachte rund 1,4 Mrd. € ein | DEHSt („knapp 1,4 Mrd. Euro“) | bestätigt | Nachrechnung: 21.341.599 × 65 € = 1,387 Mrd. €. |
| 10 | Tankrabatt Mai/Juni 2026: 14,04 ct/l Energiesteuer | [hib 295/2026, Drucksache 21/5321](https://www.bundestag.de/presse/hib/kurzmeldungen-1165456); [Forvis Mazars](https://www.forvismazars.com/de/en/who-we-are/news/press-media/newsletters/newsletter-steuern/newsletter-steuern-2-2026/zweites-energiesteuersenkungsgesetz-beschlossen) | bestätigt | Zeitraum 01.05.–30.06.2026, gilt für Benzin und Diesel. |
| 11 | Mit MwSt 16,7 ct/l | wie #10 (dort „rund 17 ct“) | bestätigt | Nachrechnung: 14,04 × 1,19 = 16,71 ct/l. |
| 12 | Beschluss Bundestag und Bundesrat 24.04.2026 | [abgeordnetenwatch](https://www.abgeordnetenwatch.de/node/6495); [Ebner Stolz](https://www.ebnerstolz.de/de/unser-angebot/leistungen/steuerberatung/zollrecht-energiesteuer-aussenwirtschaft/tankrabatt-senkung-energiesteuer-mai-2026-106057.html) | bestätigt | Bundestag 24.04.2026 (451 Ja, 134 Nein). Bundesrat laut Ebner Stolz und Forvis Mazars am selben Tag in einer Sondersitzung. Eine Sekundärquelle nennt den 29.04. Nicht amtlich nachgeprüft. |
| 13 | Amtliche Kosten 1,6 Mrd. € | [hib 295/2026](https://www.bundestag.de/presse/hib/kurzmeldungen-1165456); [abgeordnetenwatch](https://www.abgeordnetenwatch.de/node/6495) | bestätigt | Aufteilung laut Gesetzentwurf: etwa 1,45 Mrd. € Energiesteuer plus Umsatzsteuer-Mindereinnahmen. Kreuzcheck: Die Folgemaßnahme 01.10.–31.12.2026 ist mit 2,5 Mrd. € für 3 Monate veranschlagt ([DATEV 25.09.2026](https://www.datev.de/web/de/berufsgruppenuebergreifend/nachrichten/ndsr/steuern/Tankrabatt-passiert-den-Bundesrat)), also 0,83 Mrd. €/Monat. Das passt zu 0,8 Mrd. €/Monat. |
| 14 | Energiesteuer auf Benzin ca. 65 ct/l | [EnergieStG § 2](https://www.gesetze-im-internet.de/energiestg/__2.html) | bestätigt | Regelsatz 65,45 ct/l (schwefelarmes Benzin). Diesel 47,04 ct/l. Minus 14,04 ct ergibt 33,00 ct, den EU-Mindestsatz. Link nicht abgerufen (siehe Methodenhinweis). |
| 15 | Emissionsfaktor Benzin 2,28–2,37 kg CO₂/l („UBA“, Spanne wegen Bio-Beimischung) | [UBA TEXTE 125/2025 (TREMOD 2024)](https://www.umweltbundesamt.de/system/files/medien/11850/publikationen/125_2025_texte.pdf); [UBA CC 28/2022](https://www.umweltbundesamt.de/system/files/medien/11850/publikationen/28_2022_cc.pdf) | nicht verifizierbar | Eine UBA-Tabelle mit genau dieser Spanne wurde nicht gefunden. Aus den UBA-Referenzdaten für E5 (0,746 kg/l × 42,335 MJ/kg × 73,325 kg/TJ) folgt etwa 2,32 kg/l. Das liegt in der Spanne, die Spanne ist also plausibel. ADAC-Werte (15,7 ct bei 55 €/t, 18,6 ct bei 65 €/t, brutto) entsprechen etwa 2,40 kg/l. Die Quellenangabe „Emissionsfaktoren nach UBA“ ohne Tabelle oder Link ist nicht nachprüfbar. |
| 16 | Dieselfaktor „höher“, ohne Zahl | – | nicht verifizierbar | Der Artikel nennt keinen Wert. Aus 19,7–20,5 ct/l zurückgerechnet ergeben sich 2,55–2,65 kg/l (siehe Rechenschritt R2). Der obere Wert entspricht dem gängigen fossilen Wert von 2,65 kg/l. Der ADAC nennt 20,5 ct bei 65 €/t ([leinetal24/ADAC](https://www.leinetal24.de/wirtschaft/benzin-und-diesel-2026-teurer-diese-preise-kommen-auf-autofahrer-zu-zr-94031889.html)). |
| 17 | ifo (29.06.2026): Weitergabe bei Super nahezu vollständig | [fundresearch/ifo 29.06.2026](https://www.fundresearch.de/nachrichten/2026/06/ifo-tankrabatt-wurde-bei-diesel-zu-wenig-weitergegeben-537491.php); [ifo Schnelldienst](https://www.ifo.de/en/publications/2026/article-journal/ergebnisse-des-ifo-tankrabatt-trackers) | bestätigt | E5 etwa 17 ct, E10 etwa 16 ct (bis 25.06.). Wörtlich bei ifo (Neumeier): „nahezu vollständig“. |
| 18 | ifo: Diesel 73 % weitergegeben | wie #17 | abweichend | ifo nennt 12 ct von 16,7 ct, keinen Prozentwert. 12 / 16,7 = 71,9 %, also etwa 72 %. Die 73 % sind eine eigene Umrechnung, die so nicht in der Quelle steht. Geringfügig. |
| 19 | Elastizität kurzfristig −0,09, langfristig −0,31; Literatur überzeichnet etwa um das Doppelte | [Havránek, Iršová, Janda 2012, Energy Economics 34(1), 201–207](https://core.ac.uk/works/2750203); [ASEP-Eintrag](https://asep.lib.cas.cz/arl-cav/en/detail-cav_un_epca-0389215-Demand-for-gasoline-is-more-priceinelastic-than-commonly-thought) | bestätigt | Bibliografie korrekt. Die Werte sind um Publication Bias korrigiert, die Überzeichnung beträgt etwa das Doppelte („exaggerated twofold“). |
| 20 | 10 % Preissenkung ergibt etwa 1 % Mehrverbrauch; lang/kurz etwa 3,5-fach | wie #19 | bestätigt | 0,09 × 10 % = 0,9 %. 0,31 / 0,09 = 3,44. |
| 21 | Evaluation D-Ticket (infas u. a., 14.04.2026): rund 2,5 Mio. t/Jahr, etwa 3 % der Pkw-Emissionen | [BMV-Pressemitteilung 14.04.2026](https://www.bmv.de/SharedDocs/DE/Pressemitteilungen/2026/027-schnieder-evaluation-deutschlandticket.html) | bestätigt | Laut BMV etwa 3 % des privaten Pkw-Verkehrs. Konsortium: infas, ISB RWTH Aachen, TU Dresden, mobilité. |
| 22 | 14,5 Mio. „Abonnentinnen und Abonnenten“, etwa ein Fünftel der Bevölkerung | BMV (s. o.) | bestätigt | Das BMV spricht von „Nutzern“ und nennt selbst „ein Fünftel“. Rechnerisch sind es 14,5 / 83,6 Mio. = 17 %, also eher ein Sechstel. Die Formulierung folgt der Quelle. |
| 23 | Ariadne: 6,7 Mio. t weniger CO₂ im Autoverkehr, Mai 2023–April 2024, Ticket 49 € | [Clean Energy Wire zur Ariadne-Analyse vom 07.10.2024](https://www.cleanenergywire.org/news/flat-rate-train-ticket-reduced-germanys-transport-emissions-5-first-year-analysis); [Ariadne-Kompakt Okt. 2024 (PDF)](https://www.kopernikus-projekte.de/lw_resource/datapool/systemfiles/cbox/4684/live/lw_datei/ariadnekompakt_dticketimpacttracker_oktober2024.pdf) | bestätigt | Das PDF war technisch nicht lesbar. Bestätigt über Clean Energy Wire und navit. Spätere Ariadne-Arbeiten nennen 6,5 Mt bzw. 4,2–6,5 Mt (Metastudie 2025). Ob die Zahl netto oder brutto ist, bleibt offen. Der Artikel benennt das selbst als Einschränkung. |
| 24 | Faktor 2,7 zwischen den Studien | eigene Nachrechnung | bestätigt | 6,7 / 2,5 = 2,68. |
| 25 | Regionalisierungsgesetz, Bundestagsbeschluss 07.11.2025 | [Bundestag kw45/2025](https://bundestag.de/dokumente/textarchiv/2025/kw45-de-regionalisierungsgesetz-1118560); [DATEV-Magazin](https://www.datev-magazin.de/nachrichten-steuern-recht/recht/zustimmung-zur-finanzierung-des-deutschlandtickets-bis-2030-143033) | bestätigt | Bund 1,5 Mrd. €/Jahr, Länder ebenfalls 1,5 Mrd. €, bis 2030. Bundesrat 21.11.2025. |
| 26 | Ticketpreise 49 € (erstes Jahr), 58 €, 63 € | wie #25; Ariadne (s. o.) | bestätigt | 63 € ab 01.01.2026. |
| 27 | MwSt-Modell 19 % → 7 %: 21–25 ct/l „nach Berichten dieser Woche“ | [auto motor und sport, 17.09.2026](https://www.auto-motor-und-sport.de/verkehr/mehrwertsteuer-auf-kraftstoffe-bis-zu-25-cent-weniger-pro-liter-waeren-moeglich/); [Reuters/MarketScreener 16.09.2026](https://de.marketscreener.com/boerse-nachrichten/mehrwertsteuersenkung-auf-benzin-und-diesel-wuerde-staat-milliarden-kosten-ce785bd2da8af62c) | abweichend | Die Quellen nennen 23–25 ct (E10 2,291 €/l ergibt 23 ct, Diesel 2,454 €/l ergibt 24,7 ct). Die Untergrenze 21 ct würde einen Literpreis von 2,08 € voraussetzen (Rechenschritt R4). Dafür wurde keine Quelle gefunden. |
| 28 | MwSt-Modell kostet 4–7 Mrd. €/Jahr | Reuters/MarketScreener (s. o.) | bestätigt | Das BMF nennt etwa 4 Mrd. €, Boysen-Hogrefe (IfW Kiel) 6–7 Mrd. €. |
| 29 | Erneute Energiesteuersenkung wie im Frühjahr, rund 17 ct | [DATEV 25.09.2026](https://www.datev.de/web/de/berufsgruppenuebergreifend/nachrichten/ndsr/steuern/Tankrabatt-passiert-den-Bundesrat) | bestätigt | Damals als Option diskutiert. Am 25.09.2026, nach Veröffentlichung, vom Bundesrat für 01.10.–31.12.2026 gebilligt (14,04 ct, etwa 2,5 Mrd. €). Der Artikel ist in diesem Punkt inzwischen überholt (siehe Korrekturvorschläge). |
| 30 | „Marktschätzung“ Kraftstoffabsatz rund 42 Mrd. l/Jahr auf Basis BAFA | [en2x/AGEB Präsentation Q1–Q4 2024](https://ag-energiebilanzen.de/wp-content/uploads/2024/10/Praesentation-en2x-Q1-Q4_2024.pdf); [UFOP 2025 vorläufig](https://www.ufop.de/index.php/download_file/view/14853/629/); [BAFA Mineralöl (Übersicht)](https://www.bafa.de/DE/Energie/Rohstoffe/Mineraloel/mineraloel_node.html) | abweichend | Urheber der „Marktschätzung“ nicht genannt. Primärwerte 2024: 17,8 Mt Ottokraftstoff und 31,9 Mt Diesel, umgerechnet etwa 62 Mrd. l (Rechenschritt R6). Der Gesetzentwurf führt unabhängig davon ebenfalls auf etwa 62 Mrd. l. 42 Mrd. l passen weder zu Benzin allein (etwa 24 Mrd. l) noch zu Diesel allein (etwa 38 Mrd. l) noch zur Summe. Das ist die folgenreichste Abweichung des Artikels. |

### 1b. Abgeleitete Rechnungen

| # | Behauptung im Artikel | Quelle (mit Link) | Befund | Anmerkung |
|---|---|---|---|---|
| 31 | CO₂-Preis-Anteil Benzin 17,6–18,3 ct/l | eigene Nachrechnung R1 | bestätigt mit Hinweis | Nachvollziehbar nur als Bruttowert inklusive 19 % MwSt: 65 × 2,28 × 1,19 = 17,64 und 65 × 2,37 × 1,19 = 18,33. Der Artikel sagt nicht, dass es Bruttowerte sind. Ohne Hinweis liest man 14,8–15,4 ct netto. Abweichung in der Darstellung. |
| 32 | CO₂-Preis-Anteil Diesel 19,7–20,5 ct/l | R2 | nicht verifizierbar | Arithmetisch nur nachvollziehbar mit einem nicht genannten Dieselfaktor von 2,55–2,65 kg/l (brutto). Der obere Wert passt zu ADAC und zum fossilen Standardwert. |
| 33 | Tankrabatt entspricht 59–62 €/t (Titel „59 Euro raus“) | R3 | bestätigt | 0,1404 €/l ÷ 0,00237 t/l = 59,2 €/t. 0,1404 ÷ 0,00228 = 61,6 €/t. |
| 34 | 91–95 % des CO₂-Preises auf Benzin aufgehoben | R3 | bestätigt | 14,04 / 15,41 = 91,1 %. 14,04 / 14,82 = 94,7 %. |
| 35 | 82–85 % auf Diesel | R2/R3 | bestätigt (Rundungsgrenze) | 14,04 / 17,23 = 81,5 %. 14,04 / 16,55 = 84,8 %. Die Untergrenze liegt genau auf der Rundungsschwelle, „81–85 %“ wäre ebenso korrekt. Hängt vom nicht genannten Dieselfaktor ab. |
| 36 | MwSt-Modell: 21–25 ct entsprechen 74–92 €/t | R4 | bestätigt (Arithmetik), abweichend (Eingangswert) | (21/1,19)/2,37 = 74,5 und (25/1,19)/2,28 = 92,1. Die Division durch 1,19 macht aus dem Bruttobetrag ein Netto-Äquivalent und ist konsistent mit #33. Mit den belegten 23–25 ct ergäben sich 81,6–92,1 €/t. |
| 37 | MwSt-Modell entspricht 115–142 % des CO₂-Preises | R4 | bestätigt (Arithmetik), abweichend (Eingangswert) | 21/18,33 = 114,6 % und 25/17,64 = 141,7 %. Mit belegten 23–25 ct: 125–142 %. Die Aussage „überkompensiert“ bleibt gültig. |
| 38 | Im Monatsvergleich war der Tankrabatt teurer als das MwSt-Modell | R5 | bestätigt | 1,6 / 2 = 0,80 Mrd. €/Monat gegenüber 4–7 / 12 = 0,33–0,58 Mrd. €/Monat. Gilt auch am oberen Rand der Spanne. |
| 39 | Tankrabatt je Monat etwa das 6,5-Fache des Bundesanteils am D-Ticket | R5 | bestätigt (gerundet) | 0,80 / (1,5 / 12 = 0,125) = 6,4. „Rund das Sechseinhalbfache“ ist großzügig gerundet, korrekt wäre „gut das Sechsfache“ oder „6,4-fach“. |
| 40 | Zwei Monate Tankrabatt entsprechen etwas mehr als einem Jahr Bundesanteil | R5 | bestätigt | 1,6 > 1,5 Mrd. €. |
| 41 | Eigene Überschlagsrechnung „Absatz mal Steuersatz“ ergibt etwa 1,2 Mrd. € für zwei Monate | R6 | abweichend | Arithmetisch: 42 / 6 × 0,167 = 1,17 Mrd. €. Die Basis von 42 Mrd. l ist aber falsch (#30). Mit etwa 62 Mrd. l ergibt sich 10,4 Mrd. l × 0,1404 = 1,45 Mrd. € Energiesteuer. Das ist exakt der Wert im Gesetzentwurf. Die vom Autor als ungeklärt bezeichnete Diskrepanz zur amtlichen Zahl erklärt sich vollständig durch die zu niedrige Absatzbasis. Dass der Artikel die amtliche Zahl verwendet, war richtig. |
| 42 | Mehrverbrauch 0,12–0,25 Mt CO₂ | R7 | nicht verifizierbar | Preisänderung in %, Kraftstoffmix und Emissionsfaktor sind nicht angegeben. Die Untergrenze lässt sich mit plausiblen Annahmen reproduzieren (7 Mrd. l × 0,09 × etwa 8 % × 2,37 kg ergibt 0,12 Mt), die Obergrenze mit doppelter Elastizität. Auf der korrekten Absatzbasis von etwa 62 Mrd. l läge die Spanne bei etwa 0,18–0,37 Mt. |
| 43 | 0,5–1,0 % der Verkehrsemissionen dieser zwei Monate | R7; [CLEW: Verkehr 146 Mt/Jahr](https://www.cleanenergywire.org/news/flat-rate-train-ticket-reduced-germanys-transport-emissions-5-first-year-analysis) | bestätigt (intern konsistent), Basis nicht genannt | 146 / 6 = 24,3 Mt. 0,12 / 24,3 = 0,49 %, 0,25 / 24,3 = 1,03 %. Mit korrigierter Absatzbasis wären es 0,7–1,5 %. |
| 44 | 6.400–12.800 € je zusätzlicher Tonne | R7 | abweichend | Arithmetisch: 1,6 Mrd. / 0,25 Mt = 6.400 und 1,6 Mrd. / 0,125 Mt = 12.800. Die Eingangsgröße Mehrverbrauch beruht aber auf der zu niedrigen Absatzbasis. Korrigiert ergeben sich etwa 4.300–8.900 €/t. Die Größenordnung (Tausende € je t) und die Aussage bleiben, die Zahl selbst ist zu hoch. |
| 45 | Vielfahrer (35.000 km/Jahr, Benziner) erhielt in zwei Monaten etwa 88 € | R8 | abweichend | Kein Verbrauch angegeben. 88 € / 0,167 €/l = 527 l auf 5.833 km entspricht 9,0 l/100 km. |
| 46 | Wenigfahrer (8.000 km) erhielt 14 € | R8 | abweichend | 14 € / 0,167 = 84 l auf 1.333 km entspricht 6,3 l/100 km. Die beiden Beispiele unterstellen unterschiedliche Verbräuche, ohne das zu sagen. Bei einheitlich 7 l/100 km: 68 € gegenüber 16 €. Der Verteilungsunterschied wird so überzeichnet (Faktor 6,3 statt 4,4 wie die Fahrleistungen). |
| 47 | D-Ticket-Abo im selben Zeitraum mit rund 34 € bezuschusst | R9 | bestätigt (Arithmetik), abweichend (Bezugsbasis) | (1,5 + 1,5 Mrd.) / 14,5 Mio. / 6 = 34,5 €. Das sind Bund und Länder zusammen. Der Vergleich in #39 nutzt nur den Bundesanteil, der pro Abo 17 € ergäbe. Die Bezugsbasis wechselt im Artikel ohne Kennzeichnung. |
| 48 | D-Ticket kostet 450–1.200 € je vermiedener Tonne | R9 | bestätigt (Arithmetik), mit Vorbehalt | 3 Mrd. / 6,7 Mt = 448 € und 3 Mrd. / 2,5 Mt = 1.200 €. Vorbehalte: Die 6,7 Mt gelten für das erste Jahr zu 49 €. Ariadne erwartete selbst etwa die Halbierung des Effekts bei 58 €. Mit Bundesanteil allein wären es 224–600 €/t. |

---

## 2. Rechenschritte (Nachrechnung mit Primärwerten)

**R1 – CO₂-Preis je Liter Benzin**
- netto: 65 €/t × 2,28 kg/l = 14,82 ct/l; 65 × 2,37 = 15,41 ct/l
- brutto (× 1,19): 17,64 ct/l bzw. 18,33 ct/l, entspricht den Artikelwerten 17,6–18,3. Die Artikelwerte sind also Bruttowerte.

**R2 – Dieselfaktor rückgerechnet**
- 19,7 / 1,19 = 16,55 ct netto, geteilt durch 65 €/t ergibt 2,547 kg/l
- 20,5 / 1,19 = 17,23 ct netto, geteilt durch 65 €/t ergibt 2,650 kg/l

**R3 – Tankrabatt in €/t und Aufhebungsanteil**
- 14,04 ct/l ÷ 2,37 kg/l = 59,2 €/t; ÷ 2,28 kg/l = 61,6 €/t
- Benzin: 14,04 / 15,41 = 91,1 %; 14,04 / 14,82 = 94,7 % (brutto gegen brutto: 16,71 / 18,33 bzw. 17,64, gleiches Ergebnis)
- Diesel: 14,04 / 17,23 = 81,5 %; 14,04 / 16,55 = 84,8 %

**R4 – MwSt-Modell 19 % → 7 %**
- Entlastung = Bruttopreis × (1 − 1,07/1,19) = Bruttopreis × 0,1008
- Belegte Preise (17.09.2026): E10 2,291 € ergibt 23,1 ct; Diesel 2,454 € ergibt 24,7 ct
- 21 ct würden einen Literpreis von 2,08 € voraussetzen (nicht belegt)
- €/t-Äquivalent: (21/1,19)/2,37 = 74,5; (25/1,19)/2,28 = 92,1
- Anteil am CO₂-Preis: 21/18,33 = 114,6 %; 25/17,64 = 141,7 %; mit 23 ct: 23/18,33 = 125,5 %

**R5 – Monatskosten**
- Tankrabatt: 1,6 Mrd. € / 2 = 0,80 Mrd. €/Monat
- MwSt-Modell: 4/12 = 0,33; 7/12 = 0,58 Mrd. €/Monat
- D-Ticket Bundesanteil: 1,5/12 = 0,125 Mrd. €/Monat; 0,80 / 0,125 = 6,4

**R6 – Absatzbasis**
- Artikel: 42 Mrd. l/Jahr, für 2 Monate 7,0 Mrd. l, × 0,167 € = 1,17 Mrd. €
- Primär (en2x/AGEB 2024): Ottokraftstoff 17,8 Mt / 0,745 kg/l = 23,9 Mrd. l; Diesel 31,9 Mt / 0,832 kg/l = 38,3 Mrd. l; Summe 62,2 Mrd. l/Jahr
- Gegenprobe amtlich: 1,45 Mrd. € Energiesteuer / 0,1404 €/l = 10,33 Mrd. l in 2 Monaten, also 62,0 Mrd. l/Jahr
- Mit 62 Mrd. l: 10,4 Mrd. l × 0,1404 = 1,45 Mrd. € Energiesteuer, plus MwSt-Anteil auf den weitergegebenen Teil, ergibt etwa 1,6 Mrd. €. Die Diskrepanz ist damit aufgeklärt.
- Dichten sind Standardwerte. Für 2025 lag keine vollständige Jahreszahl Ottokraftstoff vor (Q1 2025: 4,2 Mt; Diesel 2025 vorläufig 31,2 Mt fossil laut UFOP). Die Größenordnung ändert sich dadurch nicht.

**R7 – Mehrverbrauch und Kosten je Tonne** (Eingangswerte im Artikel nicht genannt, daher nur Plausibilisierung)
- Reproduktion der Untergrenze: 7,0 Mrd. l × 0,09 × 8 % (etwa 16,7 ct / 2,1 €) = 50 Mio. l, × 2,37 kg ergibt 0,12 Mt; Obergrenze bei doppelter Elastizität: 0,24–0,25 Mt
- Auf Basis von 62 Mrd. l (× 1,48): etwa 0,18–0,37 Mt
- Kosten je Tonne: Artikel 1,6 Mrd. / 0,25 Mt = 6.400 €; / 0,125 Mt = 12.800 €; korrigiert 1,6 Mrd. / 0,37 Mt = 4.300 € und / 0,18 Mt = 8.900 €
- Hinweis: Diesel hat einen höheren Faktor und wurde nur zu etwa 72 % weitergegeben. Beides verschiebt die Werte leicht in entgegengesetzte Richtungen. Ohne Skript ist das nicht genauer prüfbar.
- Anteil Verkehrsemissionen: 146 Mt / 6 = 24,3 Mt; 0,12 / 24,3 = 0,49 %; 0,25 / 24,3 = 1,03 %

**R8 – Verteilungsbeispiele** (volle Weitergabe 16,7 ct bei Benzin, laut ifo nahezu zutreffend)
- 35.000 km/Jahr × 2/12 = 5.833 km; 88 € / 0,167 = 527 l, also 9,03 l/100 km
- 8.000 km/Jahr × 2/12 = 1.333 km; 14 € / 0,167 = 83,8 l, also 6,29 l/100 km
- Einheitlich 7 l/100 km: 408 l × 0,167 = 68 € bzw. 93 l × 0,167 = 16 €

**R9 – Deutschlandticket**
- Zuschuss Bund + Länder 3,0 Mrd. €/Jahr / 14,5 Mio. = 207 €/Jahr, für 2 Monate 34,5 €
- Nur Bund: 1,5 Mrd. / 14,5 Mio. / 6 = 17,2 €
- 3,0 Mrd. / 6,7 Mt = 448 €/t; 3,0 Mrd. / 2,5 Mt = 1.200 €/t; nur Bund: 224–600 €/t

---

## 3. Fehlendes Skript

- Der Artikel sagt wörtlich: „Rechenweg und Skript werden im GitHub-Repository von Klima Evidenzcheck veröffentlicht.“ Einen Pfad oder Link nennt er nicht.
- Prüfung am 17.10.2026 auf https://github.com/dsaure55/klima-evidenzcheck/tree/main/Analysen: Es gibt die Ordner 2026-08-batteriespeicher-dunkelflaute, 2026-08-emissionen, 2026-08-expertenrat-budgetabgleich, 2026-08-hitzesommer-2026, 2026-08-ipcc-rcp85-abkehr, 2026-08-thg-laendervergleich, 2026-08-trittbrettfahrer-rechnung, 2026-09-gasspeicher-winter und 2026-09-sommer-2026-normal. Keiner davon gehört zu diesem Beitrag. Das deckt sich mit der Angabe des Auftraggebers, der auch lokal nichts gefunden hat. Zum Beitrag gibt es kein SAP, keine Validierung und keine Faktencheck-Datei vor diesem Dokument.
- Folge: Die Zusage ist öffentlich und auch einen Monat nach Veröffentlichung nicht eingelöst. Mehrere Werte lassen sich ohne das Skript nicht prüfen: Dieselfaktor, Mehrverbrauch, Herkunft der 42 Mrd. l, Verbrauchsannahmen der Verteilungsbeispiele.
- Einordnung nach heutigem Regelwerk (CLAUDE.md, Stand 16.10.2026): Der Beitrag enthält eigene Modellrechnungen, etwa den elastizitätsbasierten Mehrverbrauch und die Kosten je Tonne. Das ginge über die Stufe „Einordnung“ hinaus, die keine neue Inferenz erlaubt. Der Beitrag erschien vor Einführung dieser Regel. Für künftige Stücke dieser Art gilt: Stufe Evidenzcheck mit SAP oder Verzicht auf die Eigenmodellierung.

---

## 4. Empfohlene Korrekturen am veröffentlichten Artikel (nur Vorschläge, nicht umgesetzt)

1. **Skript-Zusage:** Entweder das Rechenskript mit allen Eingangswerten nachreichen und verlinken, oder den Satz durch eine ehrliche Korrekturnotiz ersetzen („Skript wurde nicht veröffentlicht; Rechenschritte siehe Faktencheck/Anhang“).
2. **Absatzbasis 42 Mrd. l korrigieren:** etwa 62 Mrd. l/Jahr (Benzin plus Diesel, en2x/BAFA 2024) mit Quelle. Dann den Absatz zur „Diskrepanz 1,2 gegenüber 1,6 Mrd. €“ streichen oder umformulieren. Die amtliche Zahl ist mit der korrigierten Basis konsistent.
3. **Mehrverbrauch und Kosten je Tonne neu ausweisen:** etwa 0,18–0,37 Mt bzw. etwa 4.300–8.900 € je zusätzlicher Tonne (bzw. 0,7–1,5 % der Verkehrsemissionen) und die Annahmen nennen (Preisänderung in %, Kraftstoffmix, Faktoren).
4. **CO₂-Preis je Liter als brutto kennzeichnen:** „17,6–18,3 ct/l inklusive Mehrwertsteuer (netto 14,8–15,4 ct)“. Den Dieselfaktor (2,55–2,65 kg/l) ausdrücklich nennen.
5. **Emissionsfaktor-Quelle präzisieren:** konkrete UBA-Publikation oder Tabelle verlinken, oder die Spanne als eigene Ableitung aus UBA-Referenzwerten kennzeichnen.
6. **MwSt-Modell:** Spanne entsprechend den Quellen auf 23–25 ct/l anpassen (bzw. Quelle für 21 ct nennen). Daraus folgen 82–92 €/t bzw. 125–142 %.
7. **ifo-Diesel:** „rund 12 von 16,7 Cent (etwa 72 %)“ statt „73 %“, mit Link auf die ifo-Auswertung.
8. **Verteilungsbeispiele:** Einen einheitlichen Verbrauch nennen und die Beträge neu rechnen (bei 7 l/100 km: etwa 68 € gegenüber etwa 16 €), oder die unterschiedlichen Fahrzeuge ausdrücklich benennen.
9. **D-Ticket-Bezugsbasis vereinheitlichen:** Kennzeichnen, dass 34 € und 450–1.200 €/t auf Bund+Länder (3 Mrd. €) beruhen, das 6,5-Fache (besser 6,4-Fache) dagegen auf dem Bundesanteil allein. Alternativ durchgängig eine Basis verwenden. Hinzufügen, dass 6,7 Mt für 49 € und das erste Jahr gelten.
10. **„Sechseinhalbfache“** zu „gut das Sechsfache“ bzw. „6,4-fach“ präzisieren.
11. **Quellenliste mit Links versehen** (DEHSt, Drucksache 21/5321, ifo, BMV-Evaluation, Ariadne, Havránek et al., en2x/BAFA, UBA).
12. **Aktualisierungshinweis:** Die am 25.09.2026 beschlossene erneute Energiesteuersenkung (01.10.–31.12.2026, etwa 2,5 Mrd. €) als Nachtrag erwähnen, da der Artikel die Optionen noch als offen darstellt.

---

## Nachtrag: Bestätigung der Korrekturwerte vom 17.10.2026

*Auftrag: Bestätigung der Ersatzwerte für Option A (sichtbarer Korrekturhinweis plus Korrektur im Text). Prüfgrundlage für Fundstellen: `Reports/2026-09-65-euro-rein/artikel_original_2026-10-17.txt`. Zeilenangaben „Z.“ beziehen sich auf diese Datei. Der Inhalt oberhalb dieses Nachtrags ist unverändert. Wo der Nachtrag einen Wert aus Abschnitt 1–4 präzisiert, gilt der Nachtrag.*

### Ergebnis je Punkt

| # | Ersatzwert (Vorschlag Hauptsession) | Ergebnis | Geprüfter Wert / Anmerkung |
|---|---|---|---|
| 1 | Absatzbasis Benzin+Diesel ≈ 62 Mrd. l/Jahr | **bestätigt** | 62,0–62,2 Mrd. l. Zwei unabhängige Wege stimmen überein (siehe N1). |
| 2 | Mehrverbrauch ≈ 0,18–0,37 Mt; Kosten ≈ 4.300–8.900 €/t | **angepasst** | Mehrverbrauch 0,18–0,37 Mt ist bestätigt. Die Kosten je Tonne werden auf **≈ 4.300–8.700 €/t** angepasst; der Wert 8.900 in Abschnitt 1/2/4 war ein Rundungsartefakt (siehe N2). Der Anteil an den Verkehrsemissionen ändert sich auf **≈ 0,7–1,5 %**. |
| 3 | MwSt-Modell 23–25 ct/l, 82–92 €/t, 125–142 % | **bestätigt (Methode des Artikels), Präzisierung empfohlen** | Bezugsgröße ist 65 €/t mit dem Benzin-Faktor 2,28–2,37. Dann gilt: 81,6–92,1 €/t und 125–142 %. Allerdings ist 25 ct ein Dieselwert (24,7 ct). Getrennt nach Kraftstoff ergibt sich: Benzin 23 ct → 82–85 €/t, 125–131 %; Diesel 24,7 ct → 78–81 €/t, 120–125 % (siehe N3). |
| 4 | Verteilung bei 7 l/100 km: 68 € / 16 € | **angepasst** | Für 7 l/100 km wurde kein Beleg gefunden. Belegbar ist **7,7 l/100 km** (UBA-Daten, Benzin-Pkw im Bestand, fahrleistungsgewichtet). Damit ergeben sich **≈ 75 €** bzw. **≈ 17 €** (siehe N4). |
| 5 | Diesel-Weitergabe „etwa 72 %“ | **bestätigt** | 12 / 16,7 = 71,9 %. ifo schreibt selbst „rund 12 Cent“; „etwa 72 %“ oder „gut 70 %“ sind beide korrekt. |
| 6 | D-Ticket „6,4-fach“ und Kennzeichnung der Bezugsbasis | **bestätigt** | 0,80 / 0,125 = 6,4 (nur Bundesanteil). Die 34 € und 450–1.200 €/t beruhen auf Bund+Länder (3 Mrd. €). Das muss im Text gekennzeichnet werden (siehe N6). |
| 7 | CO₂-Preis je Liter brutto 17,6–18,3 ct (Benzin), 19,7–20,5 ct (Diesel); Dieselfaktor 2,55–2,65 kg/l | **Benzin bestätigt; Diesel bestätigt als Rückrechnung; ein direkter UBA-Literwert für Diesel ist nicht belegbar** | Einen direkt zitierbaren UBA-Wert in kg CO₂/l Diesel habe ich nicht gefunden. Zitierbar ist der UBA-Faktor 74,0 t CO₂/TJ. Mit Heizwert und Dichte umgerechnet ergeben sich 2,63–2,68 kg/l (fossil), also 20,4–20,7 ct brutto (siehe N7). |

### Rechenschritte

**N1 – Absatzbasis**
- Weg A (en2x/AGEB 2024): 17,8 Mt / 0,745 kg/l = 23,89 Mrd. l; 31,9 Mt / 0,832 kg/l = 38,34 Mrd. l; Summe **62,2 Mrd. l**.
- Weg B (Gesetzentwurf, 1,45 Mrd. € Energiesteuer): 1,45 / 0,1404 = 10,33 Mrd. l für 2 Monate, × 6 = **62,0 Mrd. l**.
- Vorbehalt: Weg B umfasst den gesamten steuerbegünstigten Kraftstoff, also auch gewerblichen Diesel. Die Dichten sind Standardwerte. Die Abweichung zwischen beiden Wegen beträgt 0,3 %.
- Gegenprobe zur Überschlagsrechnung des Artikels: 62 / 6 × 0,1404 = 1,45 Mrd. € Energiesteuer. Brutto mit vollem MwSt-Anteil wären es 62 / 6 × 0,1671 = 1,73 Mrd. €. Die amtlichen 1,6 Mrd. € liegen dazwischen, weil gewerbliche Abnehmer die Vorsteuer abziehen. Die „offene Differenz“ (Z. 97) ist damit aufgeklärt.

**N2 – Mehrverbrauch und Kosten je zusätzlicher Tonne**
- Im Original genannte Annahmen:
  - kurzfristige Elastizität −0,09 (Z. 55)
  - Obergrenze: publizierte Schätzungen „etwa doppelt so groß“, also −0,18 (Z. 99)
  - Jahresabsatz „rund 42 Milliarden Liter“, „zwei Monate“, „tatsächliche Preisweitergabe berücksichtigt“ (Z. 57)
  - Kosten 1,6 Mrd. € (Z. 37, Z. 97)
- Im Original **nicht** genannt:
  - Ausgangspreis bzw. Preisänderung in %
  - die numerischen Weitergabequoten im Rechengang (73 % erscheinen nur in Z. 65 im Verteilungsabsatz)
  - Kraftstoffmix und Emissionsfaktor für den Mehrverbrauch
  - Bezugsgröße der Verkehrsemissionen
- Weil der Mehrverbrauch linear in der Absatzmenge ist, lässt er sich ohne diese unbekannten Werte korrigieren: Bleiben alle übrigen Annahmen gleich, skaliert er mit dem Faktor 62/42 = 1,476 (bzw. 62,2/42 = 1,481).
  - 0,12 Mt × 1,476 = 0,177 Mt. Ist 0,125 Mt der ungerundete Wert (er folgt aus 1,6 Mrd. / 12.800 €), ergeben sich 0,185 Mt. Beides wird zu **0,18 Mt**.
  - 0,25 Mt × 1,476 = **0,369 Mt**, gerundet 0,37 Mt.
  - Kosten je Tonne: 6.400 / 1,476 = 4.336 € und 12.800 / 1,476 = 8.672 €, also **≈ 4.300–8.700 €/t**. Der frühere Wert 8.900 €/t ergab sich aus 1,6 Mrd. / 0,18 Mt, also aus einer bereits gerundeten Untergrenze; der korrekt skalierte Wert ist 8.700.
  - Anteil an den Verkehrsemissionen (146 Mt / 6 = 24,3 Mt für zwei Monate): 0,18 / 24,3 = 0,74 % und 0,37 / 24,3 = 1,52 %, also **≈ 0,7–1,5 %**.
- Vorbehalt: Die lineare Skalierung setzt voraus, dass die zusätzlich erfasste Menge (überwiegend Diesel) mit denselben Annahmen behandelt wird wie die ursprüngliche Basis. Diesel hat einen höheren Emissionsfaktor, wurde schwächer weitergegeben (72 %), und gewerbliche Nachfrage reagiert vermutlich anders als die Benzinnachfrage, auf die sich Havránek et al. beziehen. Ohne Skript ist das nicht auflösbar. Um keine Scheingenauigkeit zu erzeugen, wäre als Formulierung vertretbar: „rund 0,2 bis 0,4 Millionen Tonnen“ und „rund 4.000 bis 9.000 Euro je zusätzlicher Tonne“.

**N3 – MwSt-Modell**
- Entlastung = Bruttopreis × 12/119. E10 2,291 € → 23,1 ct; Diesel 2,454 € → 24,7 ct (Quelle: auto motor und sport, 17.09.2026, siehe #27).
- Methode des Artikels (Z. 25): Bruttoentlastung / 1,19 / Benzin-Faktor, Bezugsgröße 65 €/t.
  - 23 ct: 19,33 ct netto / 2,37 = 81,6 €/t; das sind 125,5 % von 65 €/t.
  - 25 ct: 21,01 ct netto / 2,28 = 92,1 €/t; das sind 141,7 % von 65 €/t.
  - Ergebnis: **82–92 €/t bzw. 125–142 %**, bestätigt.
- Kraftstoffgerechte Variante (empfohlen, weil die Obergrenze von Diesel stammt):
  - Benzin 23,1 ct: 19,41 / 2,37 = 81,9 €/t (126 %); / 2,28 = 85,1 €/t (131 %).
  - Diesel 24,7 ct: 20,76 / 2,65 = 78,3 €/t (120 %); / 2,55 = 81,4 €/t (125 %).
  - Gesamtspanne: **≈ 78–85 €/t bzw. ≈ 120–131 %**. Die Aussage „überkompensiert“ (Z. 25) bleibt in jeder Variante gültig.

**N4 – Verteilungsbeispiele**
- 7 l/100 km: Dafür habe ich keine amtliche Quelle gefunden. Der Wert liegt unter dem belegten Bestandsdurchschnitt für Benzin-Pkw.
- Belegbar: 7,68 l/100 km, fahrleistungsgewichteter Durchschnittsverbrauch der Benzin-Pkw im Bestand. Quelle: UBA-Daten in der Antwort der Bundesregierung, [BT-Drs. 19/13944](https://dserver.bundestag.de/btd/19/139/1913944.pdf); Datenstand 2017, für 2016 7,80 und für 2010 8,09.
- Eine aktuellere Reihe gibt es: „Verkehr in Zahlen 2025/2026“, S. 309, als [UBA-Grafik](https://www.umweltbundesamt.de/system/files/medien/384/bilder/dateien/10_Abb_Durchschn-Kraftstoffverbrauch_2026-05-04.pdf) bzw. auf der [UBA-Bildseite](https://www.umweltbundesamt.de/bild/durchschnittlicher-kraftstoffverbrauch-von-pkw). Das PDF war technisch nicht auslesbar, der aktuelle Benzinwert ist deshalb **nicht bestätigt**. Vor Übernahme sollte er in der VIZ-Tabelle nachgeschlagen werden.
- Rechnung mit 7,7 l/100 km und 16,71 ct/l:
  - 35.000 km × 2/12 = 5.833 km; × 0,077 = 449 l; × 0,1671 = **75,1 € ≈ 75 €**
  - 8.000 km × 2/12 = 1.333 km; × 0,077 = 102,7 l; × 0,1671 = **17,2 € ≈ 17 €**
- Zum Vergleich mit 7,0 l/100 km: 408 l → 68,2 €; 93,3 l → 15,6 € ≈ 16 €. Die Arithmetik der Hauptsession ist also richtig, nur die Annahme ist nicht belegt.
- Die Aussage „Entlastung proportional zur Fahrleistung“ (Z. 85) bleibt gültig. Der Faktor zwischen Viel- und Wenigfahrer beträgt bei einheitlichem Verbrauch 4,4 (wie die Fahrleistungen) statt 6,3.

**N5 – Diesel-Weitergabe**
- 12 / 16,71 = 71,8 %; mit dem gerundeten Nenner 16,7 sind es 71,9 %. „etwa 72 %“ ist korrekt. Da ifo selbst „rund 12 Cent“ angibt, ist die Formulierung „rund 12 von 16,7 Cent“ am quellennächsten.

**N6 – D-Ticket**
- 1,6 Mrd. € / 2 Monate = 0,80 Mrd. €/Monat. Bundesanteil 1,5 Mrd. € / 12 = 0,125 Mrd. €/Monat. 0,80 / 0,125 = **6,40**.
- Bezugsbasen im Original:
  - Z. 35 („Sechseinhalbfache“, „vollen Jahr des Bundesanteils“): **nur Bund** (1,5 Mrd. €/Jahr).
  - Z. 45 (450–1.200 €/t) und Z. 65 (34 €): **Bund + Länder** (3,0 Mrd. €/Jahr). 3,0 Mrd. / 14,5 Mio. / 6 = 34,5 €; 3,0 Mrd. / 6,7 Mt = 448 €/t; 3,0 Mrd. / 2,5 Mt = 1.200 €/t.
- Vorschlag: In Z. 45 und Z. 65 „Zuschuss von Bund und Ländern (je 1,5 Mrd. € jährlich)“ ergänzen, in Z. 35 „Bundesanteil“ beibehalten.

**N7 – CO₂-Preis je Liter und Dieselfaktor**
- Benzin: 65 × 2,28 × 1,19 = 17,64 ct; 65 × 2,37 × 1,19 = 18,33 ct, also **17,6–18,3 ct brutto**, bestätigt (netto 14,8–15,4 ct).
- Diesel aus der Rückrechnung: 19,7 / 1,19 / 65 = 2,547 kg/l; 20,5 / 1,19 / 65 = 2,650 kg/l, also **2,55–2,65 kg/l**, rechnerisch bestätigt.
- UBA-Wert: Einen direkt zitierbaren UBA-Wert in **kg CO₂ je Liter Diesel** habe ich nicht gefunden. Zitierbar ist der Emissionsfaktor **74,0 t CO₂/TJ** für Dieselkraftstoff ([UBA Climate Change 28/2022, CO₂-Emissionsfaktoren für fossile Brennstoffe](https://www.umweltbundesamt.de/system/files/medien/11850/publikationen/28_2022_cc.pdf); laut Suchauszug gleicher Wert schon in [CC 27/2016](https://www.umweltbundesamt.de/system/files/medien/1968/publikationen/co2-emissionsfaktoren_fur_fossile_brennstoffe_korrektur.pdf)). Die PDFs selbst waren technisch nicht auslesbar; die Fundstelle (Tabellennummer) sollte vor einem Zitat im Dokument selbst nachgesehen werden.
- Eigene Umrechnung, nicht UBA-Angabe:
  - 74,0 kg/GJ × 42,8 GJ/t × 0,832 kg/l = 2,635 kg/l
  - mit Dichte 0,845 kg/l (EBeV-Wert, laut UBA CC 45/2022): 2,676 kg/l
  - CO₂-Preis brutto: 65 × 2,635 × 1,19 = 20,4 ct; 65 × 2,676 × 1,19 = 20,7 ct
- Die Obergrenze des Artikels (20,5 ct) liegt in diesem Bereich. Die Untergrenze 2,55 kg/l lässt sich mit einem Bioanteil von etwa 3–5 % (B7) plausibel erklären, ist aber nicht belegt.
- Empfohlene Formulierung: „Diesel: 2,55–2,65 kg CO₂/l fossiler Anteil, eigene Umrechnung aus UBA-Faktor 74,0 t CO₂/TJ“.

### Betroffene Originalsätze (Fundstellen in `artikel_original_2026-10-17.txt`)

| Z. | Originalzitat | Betroffen durch | Vorgeschlagene Korrektur |
|---|---|---|---|
| 7 | „eine Mehrwertsteuersenkung von 19 auf 7 Prozent, die nach Berichten dieser Woche 21 bis 25 Cent je Liter bringen würde“ | Punkt 3 | „23 bis 25 Cent“ |
| 7 | „Beschlossen ist nichts.“ | Aktualisierung (Abschnitt 4, Nr. 12) | Nachtrag: am 25.09.2026 erneute Energiesteuersenkung 01.10.–31.12.2026 beschlossen |
| 17 | „Ein Liter Benzin setzt bei der Verbrennung zwischen 2,28 und 2,37 Kilogramm CO₂ frei“ | Punkt 7 (Quelle) | Quelle präzisieren. Optional Dieselfaktor ergänzen. |
| 19 | „17,6 bis 18,3 Cent je Liter Benzin. Bei Diesel, der pro Liter mehr CO₂ enthält, sind es 19,7 bis 20,5 Cent.“ | Punkt 7 | „inklusive Mehrwertsteuer“ ergänzen, Dieselfaktor 2,55–2,65 kg/l nennen |
| 23 | „82 bis 85 Prozent auf Diesel“ | Punkt 7 (Rundungsgrenze) | kann bleiben (81,5 % liegt an der Rundungsschwelle) |
| 25 | „21 bis 25 Cent entsprechen 74 bis 92 Euro je Tonne — 115 bis 142 Prozent dessen, was der Emissionshandel kostet.“ | Punkt 3 | „23 bis 25 Cent entsprechen 82 bis 92 Euro je Tonne — 125 bis 142 Prozent“ (Methode des Artikels) bzw. kraftstoffgerecht „rund 78 bis 85 Euro je Tonne — 120 bis 131 Prozent“ |
| 31–33 | „Also alles auf denselben Nenner, Euro pro Monat:“, danach leere Zeilen | **ungeprüft** | In der TXT-Fassung fehlt der folgende Inhalt (vermutlich eine Tabelle oder Grafik). Er war in dieser Prüfung nicht sichtbar und muss separat gegen R5/N6 abgeglichen werden. |
| 35 | „Der Tankrabatt kostete je Monat rund das Sechseinhalbfache dessen, was der Bund für das Deutschlandticket ausgibt.“ | Punkt 6 | „rund das 6,4-Fache“ bzw. „gut das Sechsfache“ |
| 45 | „kostet das Ticket zwischen 450 und 1.200 Euro je vermiedener Tonne“ | Punkt 6 | Bezugsbasis „Zuschuss von Bund und Ländern, 3 Mrd. € jährlich“ ergänzen |
| 57 | „rund 42 Milliarden Liter Jahresabsatz“ | Punkt 1 | „rund 62 Milliarden Liter Jahresabsatz (Benzin und Diesel)“ |
| 57 | „ergibt sich ein Mehrverbrauch von 0,12 bis 0,25 Millionen Tonnen CO₂. Das sind 0,5 bis 1,0 Prozent der Verkehrsemissionen dieser zwei Monate.“ | Punkt 2 | „0,18 bis 0,37 Millionen Tonnen … 0,7 bis 1,5 Prozent“ (bzw. gerundet „rund 0,2 bis 0,4“) |
| 57 | „zwischen 6.400 und 12.800 Euro ausgegeben“ | Punkt 2 | „zwischen rund 4.300 und 8.700 Euro“ (bzw. gerundet „rund 4.000 bis 9.000“) |
| 65 | „bekam in den zwei Monaten rund 88 Euro. Wer 8.000 Kilometer fährt, bekam 14 Euro.“ | Punkt 4 | „rund 75 Euro … rund 17 Euro (bei 7,7 l/100 km)“ |
| 65 | „mit rund 34 Euro bezuschusst“ | Punkt 6 | Bezugsbasis Bund + Länder ergänzen |
| 65 | „bei Diesel eine 73-prozentige Weitergabe“ | Punkt 5 | „bei Diesel rund 12 von 16,7 Cent, also etwa 72 Prozent“ |
| 97 | „Zweitens konnte ich die amtliche Kostenangabe von 1,6 Milliarden Euro nicht mit einer eigenen Überschlagsrechnung zur Deckung bringen. Absatz mal Steuersatz ergibt für zwei Monate etwa 1,2 Milliarden. … die Differenz bleibt offen …“ | Punkt 1 | Neu fassen: Mit der korrigierten Absatzbasis (≈ 62 Mrd. l) ergibt die Überschlagsrechnung 1,45 Mrd. € Energiesteuer, was zur amtlichen Angabe passt. Die frühere Differenz beruhte auf einer zu niedrigen Absatzbasis. |
| 105 | „Kraftstoffabsatz 2025, Marktschätzung auf Basis der BAFA-Mineralölstatistik · Emissionsfaktoren nach UBA.“ | Punkte 1, 7 | Konkrete Quellen: en2x/AGEB bzw. BAFA-Amtliche Mineralöldaten 2024; UBA CC 28/2022 (Dieselfaktor 74,0 t CO₂/TJ). Links ergänzen. |
| 107 | „Rechenweg und Skript werden im GitHub-Repository von Klima Evidenzcheck veröffentlicht.“ | Abschnitt 3 | Skript nachreichen oder den Satz durch einen Korrekturhinweis ersetzen |

### Grenzen dieses Nachtrags
- Die UBA-PDFs (CC 28/2022, CC 45/2022, VIZ-Grafik 2026) waren mit den verfügbaren Werkzeugen nicht auslesbar. Die Werte 74,0 t CO₂/TJ, 42,8 GJ/t und 0,845 kg/l stammen aus Suchauszügen dieser Dokumente und sind vor einem Zitat mit Tabellennummer im Dokument selbst zu bestätigen.
- Der Verbrauchswert 7,68 l/100 km hat den Datenstand 2017. Ein aktuellerer VIZ-Wert konnte nicht abgelesen werden.
- Die Korrektur des Mehrverbrauchs ist eine lineare Skalierung mit unveränderten, im Original teils nicht genannten Annahmen. Sie ist keine neue Schätzung.
