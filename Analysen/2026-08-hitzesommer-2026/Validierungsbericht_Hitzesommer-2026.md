# Validierungsbericht: Hitzesommer 2026

**Geprüfter SAP:** SAP_hitzesommer-2026.md, Version 1.1, Status final, Freigabe Daniel Saure 28.08.2026
**Geprüfter Code:** hitzesommer-2026.R
**Geprüfte Rohdaten:** rki_hitzebedingte_sterbefaelle_rohdaten.csv
**Geprüfte Outputs:** output/*.csv, output/*.png, run_log.txt
**Geprüfte Primärquellen:** output/EB-19-2025_*.pdf (+ output/eb19.txt), output/EB-26-2023_*.pdf (+ eb26.txt), output/EB-42-2022_*.pdf (+ eb42.txt), output/RKI-Wochenbericht_KW33_2026.pdf (+ kw33.txt), output/RKI-Wochenbericht_KW38_2025.pdf (+ kw38.txt), output/Anhang_hitzebedingte_Sterbefaelle_1992_2024.xlsx (+ entpackt in output/anhang_extract/)
**Prüfmethode:** Unabhängige Lektüre von SAP, Code, Rohdaten und PDF-Primärquellen; eigenständige Nachrechnung zentraler Kennzahlen per awk (kein R auf dieser Maschine verfügbar); visuelle Prüfung der Diagnostik-Grafiken.

---

## Gesamturteil: Freigabe mit Auflagen

Die zentrale Schlussfolgerung der Analyse (2026-Schätzer liegt weit außerhalb des primären wie auch aller 12 klassifizierbaren Sensitivitätsvarianten, z ungefaehr 4,0 bis 21,4) ist rechnerisch korrekt und robust gegen alle geprüften Modellvarianten. SAP-Konformität ist über weite Strecken vorbildlich (vollständige, transparente Sensitivitätsanalysen ohne Cherry-Picking, korrekt hergeleitete und offengelegte Abweichungen A und B, sauber belegte, wörtlich zitierte Primärquellen-Recherche zum COVID-Methodikbruch). Die eigenständige Nachrechnung (Cochrans Q, DerSimonian-Laird-Tau-Quadrat, Fixed-Effect-Mu, SE-Rückrechnung, Higgins-Thompson-Spiegelhalter-PI, z-Score) reproduziert die berichteten Zahlen exakt bzw. bis auf Rundung.

Zur Freigabe sind folgende Auflagen vor Übernahme in einen Ergebnisbericht zu erfüllen (Details siehe unten):

1. Die durch den Shapiro-Wilk-Test (p < 0,01) nachgewiesene, in SAP 5.3 wörtlich geforderte Kennzeichnung des primären Prädiktionsintervalls als moeglicherweise unpraezise fehlt im Skript/Output vollständig und muss ergänzt werden.
2. Der Forest-Plot muss 2025 als vorläufigen/nicht-finalisierten Wert kennzeichnen (Abweichung A) - das Skript selbst verspricht dies in seinem Kopfkommentar (in JEDER Ergebnisdarstellung, die 2025 betrifft), hält es aber in der einzigen Grafik, die 2025 zeigt, nicht ein.
3. output/tabelle_modellzusammenfassung.csv verletzt die SAP-Rundungsvorgabe (5.5/11) für p-Werte (unformatierte Werte wie 1.30727340414206e-152 statt "p < 0,01").
4. Der SAP-Wert "ca. 9.400" für 2018 (Abschnitt 8.1) konnte in keiner der drei geprüften RKI-Primärquellen bestätigt werden - das ist bereits vom Analysten korrekt und transparent dokumentiert; siehe Priorität 5 für eine plausible Erklärung der Verwechslung, die in den Bericht aufgenommen werden sollte.

Keiner dieser Punkte stellt die primäre Schlussfolgerung infrage; sie betreffen Berichtsqualität, Vollständigkeit der SAP-Umsetzung und Transparenz von Limitationen.

---

## Prioritaet 1: Numerische Plausibilitaet des primaeren Praediktionsintervalls [-2.760; 8.671]

**Befund:** Primaermodell ist ein Random-Effects-Modell (metafor::rma(method="REML", test="knha")), das die Jahresschaetzungen als theta_i = mu + u_i + e_i mit u_i ~ N(0, tau^2) modelliert - exakt wie in SAP 2 und 5.1 vorgeschrieben. Das 95%-Praediktionsintervall nach Higgins-Thompson-Spiegelhalter ist symmetrisch um mu_hat = 2955,28 und wird auf der Originalskala (absolute, nicht-negative Sterbefallzahl) berechnet.

**Eigene Nachrechnung:**

- SE-Rueckrechnung Primaermodell laut run_log.txt: tau^2 = 7.637.037, SE(mu_hat) = 485,38, df = k-2 = 32, t(0,975; 32) ca. 2,0369.
- PI = 2955,28 +/- 2,0369 * sqrt(7.637.037 + 485,38^2) = 2955,28 +/- 2,0369 * 2805,82 = 2955,28 +/- 5715,98 -> [-2760,7; 8671,3] - reproduziert exakt das berichtete Intervall [-2760; 8671].
- z_2026 = (15800 - 2955,28) / sqrt(7.637.037 + 485,38^2 + 637,8^2) = 12844,72 / 2877,43 = 4,464 - reproduziert exakt den berichteten Wert 4,46.
- Kreuzvalidierung des Skripts selbst mit Paket "meta" (metagen) liefert praktisch identisches PI [-2759; 8670] - im Rundungsrahmen konsistent.
- Zusaetzliche eigenstaendige Verifikation ueber unabhaengigen awk-Nachbau (Fixed-Effect-mu_hat und DerSimonian-Laird-tau_hat^2/mu_hat direkt aus der Roh-CSV): FE-mu_hat = 2014,04 (Skript: 2014, bestaetigt); DL-tau_hat^2 = 5.802.368,69 (Skript: 5.802.368,69, exakt bestaetigt); DL-mu_hat = 2945,69 (Skript: 2946, bestaetigt); Cochrans Q = 827,7636 (Skript: 827,76, exakt bestaetigt). Diese unabhaengige Neuberechnung bestaetigt, dass die Kernpipeline (SE-Rueckrechnung, Gewichtung, Heterogenitaetsschaetzung) korrekt implementiert ist.

**Ist die negative untere Grenze rein kosmetisch oder Hinweis auf tiefere Fehlspezifikation?**

Beides trifft zu, aber die zweite, gravierendere Erklaerung ueberwiegt:

- Rein kosmetisch ist, dass die Normalverteilungsannahme keine Kenntnis von der Nichtnegativitaetsschranke der Zielgroesse hat - das ist ein bekanntes, generisches Merkmal additiver Random-Effects-Modelle mit unbeschraenktem Traeger und wird vom RKI selbst fuer seine eigenen (jahresbezogenen) Praediktionsintervalle explizit so kommentiert (kw33.txt, Fussnote Tabelle 1: "Negative Werte der unteren Praediktionsgrenze bedeuten, dass sich die Zahl der Todesfaelle nicht eindeutig von normalen Schwankungen abgrenzen laesst").
- Es liegt aber zusaetzlich eine tatsaechliche, statistisch nachgewiesene Verletzung der Normalitaetsannahme vor, die ueber dieses kosmetische Argument hinausgeht: Shapiro-Wilk auf den studentisierten Residuen des Primaermodells ergibt W = 0,814, p < 0,01 - signifikante Abweichung von Normalitaet. Der QQ-Plot (output/diagnostik_qqplot.png) zeigt visuell einen klaren rechtsschiefen oberen Ausreisserbereich (zwei Punkte bei ca. +2,85 studentisierten Residuen, deutlich ueber der Diagonalen, die bei ca. +1,3 verlaufen muesste) - konsistent mit den beiden Extremjahren 1994 und 2003 (je 10.200 Sterbefaelle, mehr als das Dreifache des gepoolten mu_hat). Die Leave-one-out-Analyse (output/diagnostik_leave_one_out.png, tabelle_leave_one_out.csv) bestaetigt: Ausschluss von 1994 oder 2003 senkt mu_hat am staerksten (auf 2732 bzw. 2734, gegenueber 2955 im Vollmodell) und ist zugleich das Jahr mit dem groessten Betrag des studentisierten Residuums (2,85).
- Damit ist die extreme, in beide Richtungen symmetrische Streuung (tau^2 = 7,6 Mio., I^2 = 96,9%) eine Modellreaktion auf eine rechtsschiefe, nicht-normalverteilte empirische Verteilung (die meisten Jahre liegen zwischen 100 und 2.000, wenige Jahre bei 7.000-10.200). Ein symmetrisches Normalmodell kann diese Schiefe nur durch eine sehr breite Varianz "einfangen", die sich zwangslaeufig auch weit ins Negative erstreckt. Die untere PI-Grenze -2.760 ist damit kein triviales Rundungsartefakt, sondern Ausdruck einer echten Verteilungsfehlspezifikation, die weiter reicht als die im SAP unter Abweichung B diskutierte (rein rechnerische) Log-Problematik.
- SAP-Konformitaet, hier abweichend: SAP 5.3 verlangt woertlich: "Bei signifikanter Normalitaetsabweichung der Residuen: zusaetzliche Berichterstattung eines verteilungsfreien Praediktionsintervalls ... die REML-basierte Normal-Approximation bleibt primaer, wird aber als moeglicherweise unpraezise gekennzeichnet." Das Skript erkennt den Trigger korrekt (normalitaet_verletzt <- TRUE, "Normalitaets-Trigger ausgeloest: S6 ... ist gemaess SAP als zusaetzlich zu beachtende Sensitivitaet zu werten") und berechnet S6 (empirisch: [150; 10.200]; Bootstrap: [-2.140; 8.539]) korrekt. Es fehlt aber im gesamten Skript und Run-Log die geforderte explizite Kennzeichnung des primaeren Ergebnisses selbst als "moeglicherweise unpraezise" (Stichwortsuche nach "unpraezise"/"implausibel"/"negativ" im Code und Log ergab keinen Treffer ausser der Erwaehnung des RKI-Zitats zu Abweichung B). Dies ist eine konkrete SAP-Abweichung, die vor Veroeffentlichung behoben werden muss.

**Bewertung: kritisch** (in Bezug auf fehlende SAP-konforme Kennzeichnung), **moderat** (in Bezug auf die inhaltliche Tragweite, da die Sensitivitaetsanalysen S3/S6 die Schlussfolgerung "2026 liegt weit ausserhalb" ohnehin bestaetigen - auch das schmalste Sensitivitaets-PI, S1c mit [556; 5430], schliesst 15.800 sicher aus).

---

## Prioritaet 2: Abweichung A - 2025 als nicht-finalisierte Jahresschaetzung

**Befund:** Die Roh-CSV weist fuer 2025 explizit status = "vorlaeufig_letzter_verfuegbarer_wert" aus (Zeile 35), mit Quellenangabe "RKI-Wochenbericht KW38/2025 ... vom RKI selbst als 'noch unvollstaendig' gekennzeichnet, KEINE finale Jahresschaetzung im Epid-Bull-Format verfuegbar". Dies ist in kw38.txt (Zeile 111-112) woertlich durch das RKI selbst bestaetigt: "Die Schaetzung fuer das Jahr 2025 ist noch unvollstaendig." Der SAP nahm hingegen an (Abschnitt 2, 4), dass die Reihe bis 2025 aus "abgeschlossenen, finalen Jahresschaetzungen" besteht - diese Annahme ist durch die Datenlage zum Zugriffszeitpunkt (29.08.2026) nachweislich falsch, da die letzte Epid-Bull-Publikation (EB-19-2025) nur bis 2024 reicht.

**Eigene Nachrechnung/Verifikationsschritte:**

- Bestaetigt: roh$status[roh$jahr==2025] = "vorlaeufig...", waehrend alle Jahre 1992-2024 status = "final" tragen (per direkter CSV-Inspektion).
- Die SE fuer 2025 (aus [1200; 3700] zurueckgerechnet) betraegt 1275,0 - deutlich breiter als die SE vergleichbarer, finaler Nachbarjahre (2023: 842,4; 2024: 816,3), was zumindest teilweise die hoehere Unsicherheit einer unterjaehrigen/unvollstaendigen Schaetzung abbildet und ihr im inversvarianzgewichteten Modell automatisch weniger Gewicht gibt.
- Eigene Sensitivitaetsrechnung (nicht im Skript enthalten): DerSimonian-Laird-mu_hat fuer das Fenster 1992-2024 (2025 ausgeschlossen) ergibt 2959,77 gegenueber 2945,69 im Fenster 1992-2025 (Skript) - eine Differenz von nur 14 Punkten bzw. unter 0,5 %. Der Einfluss von Abweichung A auf das Primaerergebnis ist damit empirisch vernachlaessigbar; die Klassifikation "2026 oberhalb PI" waere auch ohne den 2025-Wert identisch.
- Das Skript dokumentiert Abweichung A transparent im Kopfkommentar, im Struktur-Check (Schritt 1) und in der Abschlusszusammenfassung - konsistent mit der CLAUDE.md-Vorgabe, Abweichungen zu kennzeichnen statt eigenmaechtig zu aendern.

**Bewertung: moderat.** Die Verletzung der SAP-Annahme "2025 = final" ist real und korrekt erkannt/dokumentiert (gute Prozesskonformitaet), ihr quantitativer Effekt auf das Ergebnis ist nach eigener Nachrechnung aber klein. Kritischer ist die in Prioritaet 1 genannte Berichtsauflage: Der Forest-Plot (output/forest_plot_primaer.png) zeigt 2025 optisch identisch zu den 33 finalen historischen Jahren (gleiche schwarze Farbe, gleiches Symbol, keine Fussnote), obwohl das Skript selbst verspricht, dies in jeder 2025 betreffenden Darstellung als Limitation auszuweisen. Diese Zusage wird in der einzigen Grafik, die 2025 enthaelt, nicht eingehalten - das ist als eigenstaendige Abweichung zu werten.

---

## Prioritaet 3: Abweichung B - Delta-Methode statt direkter Intervallgrenzen-Rueckrechnung fuer S3

**Befund:** SAP 6/S3 verlangt eine "Rueckrechnung von SE_i auf der natuerlichen-Logarithmus-Skala" aus den publizierten Intervallgrenzen. Das Skript weicht hiervon ab, weil 7 von 34 historischen Jahren eine negative untere PI-Grenze aufweisen (log(negativ) undefiniert) und verwendet stattdessen die Delta-Methoden-Naeherung SE_log,i = SE_i / theta_i.

**Eigene Nachrechnung:**

- Die Delta-Methoden-Formel ist korrekt: Fuer Y = g(X) = log(X) gilt Var(Y) ungefaehr [g'(X)]^2 * Var(X) = Var(X)/X^2, also SE(Y) ungefaehr SE(X)/X - Standardnaeherung, korrekt hergeleitet und korrekt implementiert (d_s3$se_log <- d_s3$sei / d_s3$punktschaetzer).
- Nachrechnung Ruecktransformation: exp(7,838) = 2535,4 ungefaehr gleich berichtetem mu_hat = 2535 (bestaetigt).
- Nachrechnung PI-Ruecktransformation: log(534) = 6,280, log(12028) = 9,395; Abstand zu mu_hat_log = 7,838 betraegt beidseitig ca. 1,557-1,558 (symmetrisch auf Log-Skala, wie von der Higgins-Thompson-Spiegelhalter-Formel erwartet, bestaetigt).
- Zusaetzlich identifizierter, im Skript nicht diskutierter Kritikpunkt: Die Delta-Methode setzt eine kleine relative Unsicherheit (Variationskoeffizient CV = SE_i/theta_i deutlich kleiner als 1) voraus, um als lineare Naeherung gueltig zu sein. Eigene Berechnung des CV je historischem Jahr zeigt: 1996 CV = 2,49 (249 %), 1993 CV = 2,47 (247 %), 2011 CV = 1,34 (134 %), 2007 CV = 0,88, 2000 CV = 0,82 - bei sieben Jahren uebersteigt CV 0,4-0,5, bei zwei Jahren liegt CV weit ueber 200 %. Fuer diese Jahre ist die Delta-Naeherung nicht mehr verlaesslich (die Naeherung wird fuer CV > ca. 0,3-0,5 zunehmend ungenau); dies betrifft exakt die Jahre mit den negativen unteren PI-Grenzen, die den Anlass fuer Abweichung B liefern. Die Delta-Methode ist damit zwar rechnerisch korrekt umgesetzt, loest aber das zugrunde liegende Problem (schiefe, teils grenznahe Verteilungen) nur teilweise.

**Bewertung: moderat.** Die Rechnung selbst ist korrekt (bestaetigt durch eigene Nachrechnung) und die Abweichung vom SAP-Wortlaut ist sachlich gut begruendet und transparent gekennzeichnet ("Abweichung B" im Skriptkopf und in der Ergebnistabelle). Nicht diskutiert wird jedoch, dass die gewaehlte Ersatzmethode fuer einen Teil der Jahre (hohe CV) selbst nur eingeschraenkt belastbar ist - ein Hinweis hierauf sollte ergaenzt werden, aendert aber nichts an der Kernaussage (S3 klassifiziert 2026 ebenfalls "oberhalb PI", wenn auch mit dem im gesamten Sensitivitaetsspektrum niedrigsten z-Score von 2,39).

---

## Prioritaet 4: S1c-Trigger-Begruendung (Bruchjahr 2020, COVID)

**Befund:** Das Skript zitiert EB-19-2025 woertlich: "Da es in Folge der Coronavirus Disease 2019-(COVID-19-)Pandemie ... nicht nur zu deutlichen Uebersterblichkeiten in Deutschland kam, sondern sich auch das saisonale Sterblichkeitsmuster veraenderte, verwenden wir fuer die Zeit seit dem Jahr 2020 eine flexiblere Kurve zur Modellierung der Sterblichkeit."

**Eigene Verifikation:** Dieses Zitat wurde in output/eb19.txt (Zeilen 27-33 und erneut Zeilen 52-61, dort umformuliert: "zeigen sich nach 2020 in Folge der COVID-19-Pandemie veraenderte Muster. Dies wird durch eine Erhoehung der Anzahl der Freiheitsgrade des Spline-Trends fuer diesen Zeitraum im Modell beruecksichtigt") wortgleich bzw. sinngleich gefunden. Das Zitat ist korrekt und nicht sinnentstellend wiedergegeben. Es erfuellt exakt Trigger-Bedingung (i) aus SAP Abschnitt 4 ("von der Quelle selbst explizit benannter Methodikbruch") - kein post-hoc konstruiertes, sondern ein von der Primaerquelle selbst datiert benanntes Ereignis. Das Bruchjahr 2020 ist somit datenseitig gut gestuetzt, nicht nachtraeglich gerechtfertigt.

**Zusaetzliche, im Skript nicht erwaehnte Beobachtung:** In output/kw38.txt (Zeile 84-86) findet sich eine andere COVID-bezogene Methodikaussage des RKI, die das Jahr 2022 (nicht 2020) betrifft: "Im Zusammenhang mit der COVID-19-Pandemie war die Mortalitaet im Sommer 2022 ungewoehnlich hoch, daher wurde das Jahr 2022 bei der Bestimmung des langfristigen Trends der Mortalitaet ausgeschlossen." Dies bezieht sich auf die woechentliche Monitoring-Methodik (verwendet zur Erzeugung der 2025-/2026-Schaetzungen), nicht auf die retrospektive Jahresreihe aus EB-19-2025, und widerspricht der S1c-Begruendung daher nicht direkt. Es zeigt aber, dass es mindestens zwei unterschiedliche, nicht deckungsgleiche COVID-bedingte Methodikanpassungen in der RKI-Berichtslandschaft gibt (Bruch der historischen Trendmodellierung ab 2020 vs. Ausschluss von 2022 aus der Trendschaetzung fuer die Wochenberichts-Methodik). Diese Nuance fehlt im Analyseskript und sollte zumindest als ergaenzende Fussnote aufgenommen werden, da sie relevant fuer die Konstruktion der 2026-Schaetzung selbst ist (nicht nur fuer die historische Referenzreihe).

**Bewertung: unkritisch bis moderat.** Die S1c-Triggerbegruendung selbst ist sauber und woertlich belegt (bestanden). Die zusaetzliche, nicht erwaehnte 2022-Anpassung der Wochenbericht-Methodik ist ein kleiner Vollstaendigkeitsmangel (moderat), der die Gueltigkeit des S1c-Triggers nicht in Frage stellt.

---

## Prioritaet 5: "ca. 9.400" fuer 2018 - Reproduzierbarkeit anhand der RKI-Primaerquellen

**Befund:** Der SAP (Abschnitt 8.1, 4, 12) nennt als vor Datenzugriff bekannten Kontext-Hinweis: "aktuell zitiert: rund 9.400; fruehere Quellen: rund 8.500" fuer 2018. Die eigenstaendige Pruefung aller drei verfuegbaren RKI-Primaerquellen ergibt:

| Publikation | 2018-Wert (Punktschaetzer [95%-PI]) | Fundstelle |
|---|---|---|
| EB-42-2022 (Originaltabelle) | 8.300 [5.400; 11.100] | eb42.txt, Zeile 350 |
| EB-26-2023 (Neubestimmung PI) | 8.400 [7.100; 9.800] | eb26.txt, Zeile 45 |
| EB-19-2025, Haupttext Tab. 1 | 8.500 [7.200; 9.800] | eb19.txt, Zeile 375 |
| EB-19-2025, Anhang-Excel (Blatt "Deutschland", Zeile 28) | 8.500 [7.100; 10.100] | output/anhang_extract/xl/worksheets/sheet2.xml, Row 28 |

Der im SAP genannte Wert "ca. 9.400" konnte in keiner der drei geprueften Publikationen (EB-42-2022, EB-26-2023, EB-19-2025 - weder Haupttext noch Anhang-Excel) fuer 2018 reproduziert werden. Dies deckt sich mit der eigenen Feststellung des Analysten im Struktur-Check (Schritt 5c), die hiermit unabhaengig bestaetigt wird.

**Eigene zusaetzliche Recherche zur Herkunft des Werts:** Eine gezielte Volltextsuche nach "9.400"/"9400" in allen fuenf extrahierten RKI-Dokumenten ergab genau einen Treffer: eb42.txt, Zeile 352 - dort ist 9.400 die obere 95%-PI-Grenze fuer das Jahr 2019 (nicht 2018!): "2019 6.900 [4.000; 9.400]". Dies ist ein sehr plausibler Kandidat fuer die Herkunft der im SAP genannten Zahl: eine Verwechslung entweder zwischen Punktschaetzer und Intervallobergrenze, oder zwischen den benachbarten Jahren 2018 und 2019 (in Sekundaerquellen/Dashboards, die 2018 und 2019 als die beiden auffaelligen "Rekordsommer" oft gemeinsam nennen - vgl. auch eb19.txt Zeile 199: "...Hitzesommer 2018, in dem sogar durchschnittlich 7,5..." und Zeile 290: "stark betroffen waren die Sommer 1994, 2003, 2006, 2015, 2018 und 2019"). Diese Erklaerung ist plausibel, aber nicht abschliessend verifiziert - sie sollte im Ergebnisbericht als begruendete Vermutung, nicht als gesicherter Befund, dargestellt werden.

**Zusaetzlicher, kleinerer Befund (geringe Relevanz):** Innerhalb derselben Publikation EB-19-2025 weichen Haupttext-Tabelle (2018: [7.200; 9.800]) und Anhang-Excel (2018: [7.100; 10.100]) geringfuegig voneinander ab, obwohl beide denselben Punktschaetzer (8.500) nennen. Der Analyst hat korrekt die maschinenlesbare Anhang-Excel-Datei als Datenquelle fuer die Roh-CSV verwendet (SAP-konform, da SAP explizit die Primaerquelle mit vollstaendiger Zeitreihe verlangt); die eigene tab_2018-Vergleichstabelle im Skript zitiert fuer EB-19-2025 jedoch den Anhang-Wert [7.100;10.100], waehrend der Haupttext (auch Teil derselben Primaerquelle) [7.200;9.800] zeigt. Dies aendert nichts an der Kernfeststellung (ca. 9.400 nicht auffindbar), ist aber ein Beleg dafuer, dass selbst innerhalb einer einzigen RKI-Publikation Haupttext und Anhang nicht exakt deckungsgleich sind - ein Umstand, der die generelle Vorsicht bei Jahres-Einzelwerten (SAP 8.1) zusaetzlich unterstreicht.

**Bewertung: bestanden** (im Sinne der Aufgabenstellung: korrekt als Diskrepanz erkannt und transparent gemeldet), **mit Auflage:** Der plausible Erklaerungsansatz (Verwechslung mit der 2019-Intervallobergrenze) sollte im Ergebnisbericht ergaenzt werden, um die reine "nicht reproduzierbar"-Feststellung einzuordnen, statt implizit einen unaufgeklaerten Widerspruch stehen zu lassen.

---

## Ergaenzende Pruefpunkte (Checkliste, kurz)

| Nr. | Punkt | Ampel | Kurzbegruendung |
|---|---|---|---|
| 1 | SAP-Konformitaet (Fenster/Modelle/Methoden) | Abweichung | Grundmodell, Fenster, tau^2-Schaetzer, HKSJ, PI-Formel, alle S1-S8 SAP-treu umgesetzt; Abweichungen A und B korrekt als solche gekennzeichnet. Fehlend: SAP-5.3-Pflichtkennzeichnung "moeglicherweise unpraezise" fuer das Primaer-PI (siehe Prioritaet 1). |
| 2 | Diagnostik durchgefuehrt/korrekt interpretiert; Autokorrelationskorrektur | bestanden | Trend-Test (beta1=34,63, p=0,49, nicht signifikant), Durbin-Watson (DW=2,298, p=0,76, nicht signifikant, daher keine Korrektur noetig - SAP-konform keine Newey-West-Anwendung erforderlich), Shapiro-Wilk (p<0,01, korrekt als signifikant interpretiert und S6-Trigger korrekt ausgeloest). Alle Werte durch eigene Pruefung der Formeln/Gegenrechnung plausibilisiert. |
| 3 | Mehrfachtestung/Cherry-Picking | bestanden | Alle 8 Sensitivitaetsfamilien (S1-S8, 13 klassifizierbare Varianten) vollstaendig in tabelle_klassifikation_2026_alle_varianten.csv berichtet; 13/13 klassifizieren 2026 "oberhalb PI" - keine selektive Hervorhebung erkennbar, Primaerzeile bleibt bindend. |
| 4 | Rechenpruefung | bestanden | Eigenstaendige awk-Nachrechnung von SE-Rueckrechnung, Cochrans Q, DerSimonian-Laird-tau^2/mu_hat, Fixed-Effect-mu_hat/SE, Higgins-Thompson-Spiegelhalter-PI und z-Score reproduziert alle geprueften Werte exakt bzw. im Rundungsrahmen. CSV-Outputs stimmen mit run_log.txt ueberein (keine Post-Processing-Inkonsistenz). |
| 5 | Grenzen/Limitationen sichtbar? | Abweichung | Limitationen sind im Text (Run-Log-Zusammenfassung) vollstaendig genannt. Im Forest-Plot (der einzigen Grafik mit 2025) fehlt jedoch die vom Skript selbst zugesagte 2025-Vorlaeufigkeits-Kennzeichnung (Abweichung A). |
| 6 | Rundung/Darstellung | Abweichung | Konsolen-/Log-Ausgabe nutzt korrekt fmt_p() (z. B. "p < 0.01"); der CSV-Output tabelle_modellzusammenfassung.csv enthaelt jedoch unformatierte QEp-Werte in wissenschaftlicher Notation mit ueber 10 Nachkommastellen (z. B. 1.30727340414206e-152), was der SAP-Vorgabe (5.5/11: "p < 0,01" statt Scheingenauigkeit) widerspricht. |

---

## Zusammenfassung der Auflagen fuer Rueckgabe an den Analysten

1. Primaeres PI im Ergebnistext/Grafik explizit als "aufgrund signifikanter Normalitaetsabweichung (Shapiro-Wilk p<0,01) moeglicherweise unpraezise" kennzeichnen (SAP 5.3, woertliche Pflichtvorgabe).
2. Forest-Plot um eine visuelle/textliche Kennzeichnung von 2025 als vorlaeufig/nicht finalisiert ergaenzen (Abweichung A, vom Skript selbst zugesagt, aber nicht umgesetzt).
3. tabelle_modellzusammenfassung.csv (und ggf. weitere Output-Tabellen) auf SAP-konforme p-Wert-Rundung ("p < 0,01" statt Rohwert) umstellen.
4. Im Ergebnisbericht zur "ca. 9.400"-Diskrepanz (2018) den plausiblen Erklaerungsansatz (moegliche Verwechslung mit der oberen 95%-PI-Grenze von 2019 = 9.400 in EB-42-2022) als begruendete, nicht gesicherte Vermutung ergaenzen.
5. (Optional, geringe Prioritaet) Hinweis auf die eingeschraenkte Validitaet der Delta-Methode bei hohem Variationskoeffizienten (bis zu sieben Jahre mit CV > 0,4, zwei Jahre mit CV > 2,0) in der S3-Diskussion ergaenzen.
6. (Optional, geringe Prioritaet) Hinweis auf die zusaetzliche, in kw38.txt dokumentierte COVID-bedingte 2022-Anpassung der Wochenbericht-Trendmethodik (separat vom 2020-Bruch der Jahresreihe) ergaenzen.

Nach Umsetzung der Auflagen 1-4 ist aus statistischer Sicht nichts gegen eine Freigabe des Ergebnisberichts einzuwenden.

---

## Nachtrag: Fokussierte Nachpruefung der fuenf Auflagen (29.08.2026)

**Anlass:** Der Analyst meldet die Umsetzung der Auflagen 1-4 (plus optional 5) aus obigem Bericht und einen erneuten Skriptlauf (run_log.txt, Skriptlaufende 2026-08-29 12:51:23). Diese Nachpruefung ist bewusst fokussiert (nicht vollstaendig) und prueft ausschliesslich die fuenf unten genannten Punkte unabhaengig gegen SAP_hitzesommer-2026.md (v1.1, final) und die tatsaechlichen Output-Dateien (nicht gegen die Selbstmeldung des Analysten oder run_log.txt allein, wo Primaerdateien vorliegen).

### 1. SAP-5.3-Pflichtkennzeichnung des primaeren PI

**Soll (SAP 5.3):** "Bei signifikanter Normalitaetsabweichung der Residuen: ... die REML-basierte Normal-Approximation bleibt primaer, wird aber als moeglicherweise unpraezise gekennzeichnet."

**Ist:** hitzesommer-2026.R enthaelt eine bedingte Ausgabe (Zeilen 352-370, 516-539, 927-931), die bei signifikantem Shapiro-Wilk-Test (p<0,05) den Text "PFLICHTKENNZEICHNUNG (SAP 5.3, ...): Das oben berichtete PRIMAERE 95%-Praediktionsintervall ist aufgrund signifikanter Normalitaetsabweichung der Residuen (Shapiro-Wilk p < 0.01) MOEGLICHERWEISE UNPRAEZISE. Es bleibt gemaess SAP 5.3 dennoch primaer fuer die Hauptaussage; ..." ausgibt. Im aktuellen run_log.txt (Zeitstempel 12:51) erscheint dieser Text tatsaechlich zweimal: unmittelbar nach der Primaermodell-Schaetzung (Zeilen 178-181) und nochmals in der Abschlusszusammenfassung (Zeilen 462-465).

**Ampel: bestanden.**

### 2. Forest-Plot: visuelle Kennzeichnung von 2025 als vorlaeufig

**Soll (SAP 11a, Abweichung A, Skriptkopf-Zusage):** 2025 muss in jeder Ergebnisdarstellung, die 2025 zeigt, als vorlaeufig/nicht finalisiert erkennbar sein.

**Ist:** output/forest_plot_primaer.png (direkt visuell geprueft) zeigt 2025 als orangefarbenes Dreieck, optisch klar unterscheidbar von den 33 historischen Jahren (schwarzer Kreis) und von 2026 (rotes/dunkelrotes Dreieck). Eine Legende am unteren Bildrand ordnet die drei Symbole explizit zu ("2025: VORLAEUFIG, nicht finalisiert (Abweichung A, KW38/2025)"; "2026 (Zieljahr, unterjaehrig/vorlaeufig)"; "Historisches Jahr, final"). Zusaetzlich benennt ein Text-Annotationsblock oben im Plot dieselbe Kennzeichnung nochmals ausformuliert.

**Ampel: bestanden.**

### 3. output/s3_delta_methode_zuverlaessigkeit.csv: Kennzeichnung der Jahre 1993, 1996, 2011

**Soll (Selbstauskunft des Analysten in run_log.txt/Skriptkopf):** Delta-Approximation fuer die Jahre 1993, 1996 und 2011 als unzuverlaessig markieren; keine anderen Jahre faelschlich markieren, keines dieser drei Jahre auslassen.

**Ist:** Direkte Inspektion von output/s3_delta_methode_zuverlaessigkeit.csv (34 Datenzeilen) zeigt: Spalte `delta_warnung` ist nur fuer die Zeilen 1993, 1996 und 2011 nicht-leer ("Delta-Approximation fuer dieses Jahr unzuverlaessig, mit Vorsicht interpretieren"); alle uebrigen 31 Jahre haben eine leere Zeichenkette. Exakt diese drei Jahre und keine anderen. Im R-Code (Zeile 636) ist die Menge als fester Vektor `jahre_delta_unzuverlaessig <- c(1993, 1996, 2011)` hinterlegt, nicht ueber eine im Skript berechnete Schwellenwert-Regel.

**Randbemerkung (kein Fail-Grund fuer diesen engen Pruefpunkt, aber zur Transparenz):** Der urspruengliche Validierungsbericht (Prioritaet 3, Auflage 5, dort ausdruecklich "optional, geringe Prioritaet" markiert, nicht Teil der vier bindenden Auflagen 1-4) hatte auf bis zu sieben Jahre mit CV > 0,4 hingewiesen. Eigene Nachrechnung aus der aktuellen CSV (CV_Prozent-Spalte) bestaetigt: neben 1993 (247,5 %), 1996 (248,7 %) und 2011 (134,2 %) liegen auch 2007 (88,3 %), 2000 (82,0 %), 1999 (53,9 %) und 2009 (64,3 %) ueber 40 % CV, werden aber nicht markiert. Da Auflage 5 im Ursprungsbericht ausdruecklich optional war und die hier gepruefte Anforderung ("genau 1993/1996/2011") von der Selbstauskunft des Analysten im Skriptkopf/run_log woertlich so formuliert wurde, gilt der Punkt im engen Sinn als erfuellt. Es handelt sich aber um eine handverlesene statt regelbasierte Auswahl, die bei einer kuenftigen vollstaendigen Neuvalidierung nochmals aufgegriffen werden sollte.

**Ampel: bestanden** (mit dokumentierter Randbemerkung, s.o.).

### 4. 2018-Wert korrigiert (8.300-8.500) und Verwechslungs-Erklaerung als Vermutung gekennzeichnet

**Soll:** 2018-Wert im Bereich 8.300-8.500 (statt des im SAP als unbestaetigt referenzierten "ca. 9.400"); die Erklaerung fuer die vermutete Herkunft dieser Zahl als Vermutung/Hypothese, nicht als gesicherter Fakt.

**Ist:** output/aufbereitete_historische_reihe.csv, Zeile 2018: Punktschaetzer = 8.500 (Quelle "EB-19-2025 Anhang", Status "final") — liegt im geforderten Bereich 8.300-8.500 und entspricht dem in Prioritaet 5 des Ursprungsberichts als massgeblich identifizierten EB-19-2025-Anhangwert. In hitzesommer-2026.R (Zeilen 225-264) und identisch im run_log.txt (Zeilen 95-131) wird die Herkunftsvermutung explizit hypothetisch formuliert: "Der Wert 9.400 taucht tatsaechlich EIN einziges Mal auf -- ... fuer das Jahr 2019 (nicht 2018!) ... genannten Zahl: vermutlich eine Verwechslung entweder zwischen ..." sowie im Skriptkopf (Zeile 23-24): "begruendete, ausdruecklich unbestaetigte Vermutung zur Herkunft ergaenzt (Verwechslung mit oberer [PI-Grenze 2019])". Es wird an keiner Stelle als gesicherter Befund dargestellt; die Formulierung bleibt konsistent hypothetisch ("vermutlich", "unbestaetigt").

**Ampel: bestanden.**

### 5. p-Werte in tabelle_modellzusammenfassung.csv korrekt formatiert

**Soll (SAP 5.5/11):** p-Werte diagnostischer Tests (inkl. Q-Test) mit zwei Nachkommastellen, sofern p ≥ 0,01, sonst "p < 0,01" (keine Scheingenauigkeit, keine unformatierte wissenschaftliche Notation).

**Ist:** output/tabelle_modellzusammenfassung.csv enthaelt jetzt eine Spalte `QEp` mit formatierten Werten ("p < 0.01" fuer 8 von 9 Varianten, "p = 0.04" fuer S1c) sowie zusaetzlich eine separate Rohwert-Spalte `QEp_roh` (z. B. 1,307273e-152) zur Nachvollziehbarkeit. Die Formatierungsfunktion `fmt_p <- function(p) ifelse(p < 0.01, "p < 0.01", sprintf("p = %.2f", p))` (Zeile 109) implementiert die SAP-Rundungsregel exakt und wird korrekt auf die QEp-Spalte angewendet (Zeile 905: `modell_tabelle$QEp <- vapply(modell_tabelle$QEp_roh, fmt_p, character(1))`). Stichprobenpruefung: QEp_roh = 0,038657930559919 (S1c) -> "p = 0.04" (korrekt gerundet, zwei Nachkommastellen, da p ≥ 0,01); alle uebrigen acht Varianten mit QEp_roh weit unter 0,01 -> korrekt "p < 0.01", keine Scheingenauigkeit mehr sichtbar. Einzige Randnotiz (keine SAP-Verletzung, da der Ursprungsbericht dasselbe Format bereits fuer die Konsolenausgabe als "korrekt" bewertet hatte): Dezimalpunkt statt Dezimalkomma ("p < 0.01" statt "p < 0,01"), durchgaengig so im gesamten Skript/Log verwendet, keine neue Inkonsistenz gegenueber dem bereits akzeptierten Konsolenformat.

**Ampel: bestanden.**

### Gesamturteil dieses Nachtrags

Alle fuenf gepruefte Punkte sind in den tatsaechlichen Output-Dateien (nicht nur in der Analysten-Selbstauskunft) unabhaengig verifiziert und erfuellt. Fuer Punkt 3 gilt eine dokumentierte, aber nicht fail-relevante Randbemerkung (handverlesene statt schwellenwertbasierte Jahresauswahl; betrifft nur die im Ursprungsbericht ausdruecklich als optional/geringe Prioritaet eingestufte Auflage 5, nicht die vier bindenden Auflagen 1-4).

**Gesamturteil: final.**

Diese Bewertung deckt ausschliesslich die oben genannten fuenf Punkte ab und ersetzt keine vollstaendige Neuvalidierung des gesamten Skripts/aller Outputs.
