# Statistischer Analyseplan (SAP)

**Titel:** Vergleich der Pro-Kopf-Treibhausgasemissionen zwischen Saarland und
Berlin mittels indirektem (Netzwerk-)Vergleich über Bayern als
Brückenkomparator

**Version:** 1.1 (Amendment zu Version 1.0)
**Status:** draft (Amendment — noch nicht freigegeben/eingefroren; siehe
Abschnitt "Amendment-Historie" unten)
**Datum (Entwurf v1.1):** 28.08.2026
**Datum (Freigabe/Einfrieren v1.1):** [ausstehend]
**Autor:in (v1.1):** sap-autor-Subagent
**Freigabe (v1.1):** [ausstehend — Freigabe/Einfrieren durch Mensch
erforderlich, siehe Abschnitt "Was noch entschieden werden muss" am Ende
dieses Dokuments]

**Historischer Stand v1.0 (unverändert, nicht überschrieben):** Version 1.0,
Status final, Datum (Entwurf) 27.08.2026, Datum (Freigabe/Einfrieren)
27.08.2026, Freigabe: Daniel Saure, Datum: 27.08.2026.

**Wichtiger Hinweis:** Alle vier inhaltlichen Änderungen dieser Version 1.1
beruhen ausschließlich auf dokumentierten methodischen Befunden des
unabhängigen Validierungsberichts zur v1.0-Analyse
(`Analysen/2026-08-thg-laendervergleich/Validierungsbericht_THG-Laendervergleich.md`,
Gesamteinschätzung "Freigegeben mit Auflagen") — **nicht** auf Kenntnis der
Analyseergebnisse oder nachträglicher Präferenz für eine günstigere
Ergebnisdarstellung. Es handelt sich um eine Reaktion auf dokumentierte
statistische Schwächen der ursprünglichen Primärspezifikation (insbesondere
HAC bei sehr kleinem T), nicht um Cherry-Picking. Details siehe unten.

---

## Amendment-Historie

### Version 1.1 (28.08.2026) — Status: draft

**Anlass:** Der unabhängige Validierungsbericht zur v1.0-Analyse
(Gesamteinschätzung "Freigegeben mit Auflagen") identifiziert vier Punkte, bei
denen die in v1.0 festgelegte Methodik entweder statistisch nicht mehr
sinnvoll trägt (HAC bei T=5), auf einer nicht eskalierten
Interpretationsentscheidung mit erheblicher methodischer Konsequenz beruht
(Zeitfenster-Wahl), zu einer bei dieser Fallzahl irreführenden Sprache
verleiten könnte (Signifikanzsprache), oder eine Dokumentationslücke bei einer
SAP-Abweichung aufweist (unbelegte Behauptung eines gescheiterten
Datenzugriffs). Dieses Amendment setzt die vier zugehörigen Auflagen/
Empfehlungen des Validierungsberichts methodisch in den SAP um, **bevor**
ein Ergebnisbericht erstellt wird. Es handelt sich ausdrücklich nicht um eine
neue Forschungsfrage und nicht um eine nachträgliche Auswahl des günstigeren
Ergebnisses — die Punktschätzungen selbst werden durch dieses Amendment nicht
verändert, nur die primäre Unsicherheitsquantifizierung, das primäre
Zeitfenster-Set, die Sprachregelung und eine Dokumentationsanforderung.

**Änderung 1 — Primäre Unsicherheitsquantifizierung: HAC → Bootstrap**
(betroffene Abschnitte: 2, 5.3, 5.4, 10, 11)

Bisher (v1.0, Abschnitt 5.4): HAC-Konfidenzintervalle (Newey-West) primär,
Moving-Block-Bootstrap-Konfidenzintervalle sensitivitätsanalytisch.

Validator-Befund (Validierungsbericht, Abschnitt 1 "HAC bei n=5 - eigenständige
Bewertung"): Bei n=5 (df_resid=3) verlangt `sandwich::NeweyWest()` mehr Lags
als Beobachtungen vorhanden sind ("more weights than observations, only first
n used") — die HAC-Kernannahme (Bandbreite wächst langsamer als T gegen
unendlich) ist bei T=5 nicht mehr sinnvoll operationalisierbar. Der Validator
weist zudem empirisch nach, dass die berichteten Bootstrap-Konfidenzintervalle
3- bis 7-mal breiter sind als die HAC-Konfidenzintervalle bei identischen
Fitted-Werten (Beispiele: Bayern HAC [5,1; 5,3] vs. Bootstrap [5,3; 6,0];
Saarland HAC [12,2; 14,0] vs. Bootstrap [11,5; 14,1]) — ein starkes Indiz für
anti-konservative (zu enge) HAC-Standardfehler bei dieser Stichprobengröße.

Neue Regelung: Bootstrap-Konfidenzintervalle (Moving-Block-Bootstrap, wie
bisher spezifiziert, unverändert in der Methodik selbst) werden primär
berichtet; Newey-West-HAC-Konfidenzintervalle werden zur Sensitivitätsanalyse
degradiert (nicht umgekehrt wie in v1.0). Die Rollen sind damit vertauscht,
nicht die zugrundeliegenden Berechnungsverfahren selbst verändert.

**Änderung 2 — Zusätzliches Analysefenster n=8 als gleichrangige primäre
Variante** (betroffene Abschnitte: 4, 5.1, 6, 11)

Bisher (v1.0, Abschnitt 4): Bei Lücken wird auf den "längsten gemeinsam
vollständig verfügbaren Zeitraum" reduziert. Der Analyst legte dies als
zusammenhängendes Fenster aus (n=5, 2019–2023) statt der einzelnen
Lückenjahre 2017/2018 (was ein n=8-Fenster ergäbe: 2014–2016 + 2019–2023).

Validator-Befund (Validierungsbericht, Abschnitt 4 "Wahl 'zusammenhängendes'
10-Jahres-Fenster"): Diese Interpretationsentscheidung ist die direkte
Ursache des unter Änderung 1 diskutierten HAC/T=5-Problems; die
n=8-Alternative wäre technisch trivial gewesen (im selben Skript für S2b
bereits so umgesetzt) und wurde — anders als andere Abweichungen — nicht dem
Menschen zur Entscheidung vorgelegt, obwohl sie mindestens ebenso
konsequenzreich ist. Der Validator empfiehlt ausdrücklich, dies dem Menschen
vorzulegen und als zusätzlichen Robustheitscheck zu rechnen (siehe auch
Auflage 4 der Zusammenfassung des Validierungsberichts).

Neue Regelung: Beide Fenster — n=5 (zusammenhängendes 5-Jahres-Fenster
2019–2023) und n=8 (Lückenjahre 2017/2018 einzeln entfernt, 2014–2016 +
2019–2023) — werden als **gleichrangige primäre Varianten** geführt, nicht als
Primär- vs. Sensitivitätsanalyse. Beide werden mit vollständigem Kontrast-Set
(E2a, E2b, E1, E1') und beiden CI-Typen (Bootstrap primär, HAC
sensitivitätsanalytisch gemäß Änderung 1) parallel berechnet und transparent
gegenübergestellt; es wird nicht nachträglich die "günstigere" Variante als
Hauptaussage ausgewählt. Das vormalige S2a ("5-Jahres-Fenster") aus Abschnitt
6 ist damit Teil der Primäranalyse geworden und wird dort nicht mehr separat
als Sensitivitätsanalyse geführt (keine Doppelführung derselben Berechnung).

**Änderung 3 — Sprachregelung: kein "signifikant", keine
p-Wert-Schwellensprache** (betroffene Abschnitte: 5.5, 7, 11)

Validator-Befund (Validierungsbericht, Abschnitt 1, Auflage 1 der
Zusammenfassung): "Statistisch signifikant" sollte für die primären Kontraste
bei dieser kleinen Stichprobe (n=3 Länder je Zeitpunkt, T=5 bzw. T=8
Zeitpunkte) nicht unrelativiert verwendet werden — Konfidenzintervalle sollen
für sich stehen.

Neue Regelung: Im Ergebnisbericht wird für die primären Kontraste (E1, E2a,
E2b, E1') auf "signifikant"/"nicht signifikant" und auf p-Wert-Schwellen-
formulierungen als Bedeutsamkeitsaussage verzichtet; Punktschätzung und
Konfidenzintervall (primär: Bootstrap) werden berichtet und sprechen für sich.
Falls Holm-korrigierte p-Werte weiterhin tabellarisch im Anhang erscheinen,
sind sie rein deskriptiv zu kennzeichnen, nicht als Signifikanzaussage zu
interpretieren.

**Änderung 4 — Datenquellen-Dokumentation der Abweichung (C)** (betroffener
Abschnitt: 3)

Validator-Befund (Validierungsbericht, Abschnitt 2(C) "S3 nicht durchführbar -
kritisch, Dokumentationslücke", sowie Auflage 2 der Zusammenfassung): Die
Behauptung im Analysten-Skript-Header, automatisierte Zugriffsversuche auf
Destatis GENESIS-Online/Regionalstatistik.de seien gescheitert, ist im
Repository nicht belegt (kein HTTP-Log, kein Zeitstempel, kein Code-Pfad, der
überhaupt einen Netzwerkzugriff versucht).

Neue Regelung (Abschnitt 3, verbindlich für künftige/erneute
Zugriffsversuche): Ein behaupteter fehlgeschlagener externer Datenzugriff muss
entweder mit Log/Zeitstempel/Fehlerartefakt belegt werden oder ehrlich als
"nicht versucht, da kein Netzwerkzugriff in der Analyseumgebung verfügbar"
umformuliert werden. Dies gilt rückwirkend auch für die bestehende
S3-Abweichung im aktuellen Analyseskript; die Korrektur des Skripts selbst ist
Aufgabe des analyst-Subagenten in einem Folgeschritt und **nicht** Gegenstand
dieses SAP-Amendments.

**Nicht Gegenstand dieses Amendments:** Der Validierungsbericht enthält
weitere Auflagen/Anmerkungen (z. B. fehlende E1'-Spalte in
`tabelle_kontraste_primaer.csv`, unvollständige Neuberechnung von E2a/E2b/E1
unter S6), die reine Umsetzungs-/Vollständigkeitskorrekturen am bestehenden
R-Skript betreffen, keine SAP-methodischen Festlegungen. Diese sind vom
analyst-Subagenten im nächsten Schritt zu beheben und erfordern keine
SAP-Änderung.

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

Hinweis: Dieser SAP wurde ohne Sichtung von Rohdaten, Zwischenergebnissen oder
Grafiken verfasst. Sollte sich beim Freigabeprozess herausstellen, dass bereits
Analyseergebnisse vorlagen oder in den Auftrag eingeflossen sind, ist der Status
zwingend auf "Exploratorisch (retrospektiv)" zu ändern und die Präregistrierung
als ungültig zu kennzeichnen.

Ergänzung zu Version 1.1: Dieses Amendment wurde ausschließlich auf Basis des
Textes des unabhängigen Validierungsberichts erstellt (Diagnostik-/
Konsistenzbefunde zu HAC-Eignung bei kleinem T, Zeitfenster-Interpretation,
Sprachregelung, Dokumentationsstandard), nicht auf Basis gesichteter
inhaltlicher Analyseergebnisse (Punktschätzungen, Rangfolgen der Länder). Der
Validierungsbericht selbst bestätigt, dass die Punktschätzungen über mehrere
unabhängige Sensitivitätsanalysen hinweg robust sind; diese inhaltliche
Information wurde für die hier vorgenommenen methodischen Festlegungen nicht
herangezogen und beeinflusst keine der vier Änderungen.

---

## 1. Hintergrund / Rationale

Öffentliche Klimadashboards (u. a. klimadashboard.de) und Medienberichte stellen
Pro-Kopf-Treibhausgasemissionen von Bundesländern häufig als einfache Rankings
oder Balkendiagramme dar. Solche Darstellungen verleiten leicht zu impliziten
Politikbewertungen ("Land X ist klimapolitisch schlechter als Land Y"), obwohl
Bundesländer sich strukturell fundamental unterscheiden (Industriedichte,
Energieerzeugungsstandorte, Bevölkerungsdichte, Wirtschaftsstruktur).

Saarland und Berlin sind ein besonders extremes Beispiel: Saarland ist ein
kleines, historisch stark von Montanindustrie (Stahl, Kohle/Kraftwerke) geprägtes
Flächenland; Berlin ist ein Stadtstaat mit dominierender Dienstleistungswirtschaft
und ohne nennenswerte Schwerindustrie. Ein direkter Vergleich beider Länder birgt
das Risiko, strukturelle Unvergleichbarkeit ("Äpfel mit Birnen") als politische
Leistungsdifferenz misszuverstehen.

Dieses Projekt prüft daher zusätzlich zum direkten Vergleich einen indirekten
(netzwerkartigen) Vergleich über Bayern als gemeinsamen Referenzpunkt
("Brückenkomparator"), wie er aus der Methodik indirekter Vergleiche (z. B.
Bucher-Methode in Netzwerk-Metaanalysen) bekannt ist. Die Lücke gegenüber
bestehenden Dashboard-Darstellungen: (a) explizite Unsicherheitsquantifizierung
statt Punktschätzer ohne Fehlerbalken, (b) eine vorab dokumentierte Prüfung, ob
der gewählte Brückenkomparator methodisch überhaupt sinnvoll ist (Transitivität),
und (c) eine vorab fixierte Interpretationsleitplanke, die eine unzulässige
Politikbewertung struktureller Unterschiede verhindert.

## 2. Fragestellung (Estimand)

**Zielgrößen (Outcome):** Pro-Kopf-Treibhausgasemissionen (t CO2-Äquivalente pro
Kopf und Jahr) je Bundesland, wie vom Umweltbundesamt (UBA) bzw. über
klimadashboard.de bereitgestellt.

**Primäre Zielgröße (pre-spezifizierte Fallback-Regel, siehe Abschnitt 3):**
Falls auf Bundeslandebene eine harmonisierte Reihe für die Gesamt-THG-Emissionen
(alle Kyoto-Gase in CO2-Äquivalenten) verfügbar ist, wird diese verwendet. Ist
auf Bundeslandebene ausschließlich die energiebedingte CO2-Emission (UBA-Reihe
"Kohlendioxid-Emissionen nach Bundesländern") verfügbar, wird diese als primäre
Zielgröße verwendet. Welche der beiden Varianten tatsächlich vorliegt, wird beim
Datenzugriff dokumentiert (Meta-Entscheidung, keine inhaltliche Ergebniswahl).
Liegen beide vor, wird die THG-Gesamtreihe primär und die CO2-Reihe
sensitivitätsanalytisch verwendet (siehe Abschnitt 6).

**Analyseeinheiten:** Die drei Bundesländer Saarland (SL), Bayern (BY) und
Berlin (BE). Dies ist eine Vollerhebung der drei für die Fragestellung gewählten
Einheiten, keine Stichprobe aus einer größeren Grundgesamtheit von
Bundesländern — Ergebnisse sind ausschließlich für dieses Trio zu interpretieren,
nicht auf andere Länderpaare zu verallgemeinern.

**Zieljahr:** Das aktuellste Kalenderjahr, für das zum Zeitpunkt des
Datenzugriffs für alle drei Bundesländer Werte vorliegen ("neuestes gemeinsames
Jahr"). Dieses Jahr wird vom Analyst-Subagenten beim Datenzugriff dokumentiert,
bevor irgendeine Modellschätzung erfolgt — die Wahl darf nicht von den
resultierenden Werten abhängen.

**Formal spezifizierte Kontraste (alle drei werden immer gemeinsam berichtet,
siehe Abschnitt 7):**

- **E1 (direkter Vergleich, gleichrangig mit E2 primär):**
  Δ(SL, BE) = geschätztes Pro-Kopf-Emissionsniveau Saarland im Zieljahr −
  geschätztes Pro-Kopf-Emissionsniveau Berlin im Zieljahr (aus je
  bundeslandspezifischem Trendmodell, siehe 5.1).
- **E2a (Brücken-Kontrast 1):** Δ(SL, BY) = Saarland − Bayern im Zieljahr.
- **E2b (Brücken-Kontrast 2):** Δ(BY, BE) = Bayern − Berlin im Zieljahr.
- **E1' (indirekte Schätzung, Konsistenzprüfung, kein zusätzlicher
  Hypothesentest):** E1' = E2a + E2b. Da für alle drei Länder direkte
  Beobachtungsdaten aus derselben Quelle und demselben Zeitfenster vorliegen,
  ist algebraisch E1' = E1 exakt identisch (Bayern kürzt sich heraus), sofern
  dasselbe Analysefenster für alle drei Trendmodelle verwendet wird. E1' wird
  dennoch explizit berechnet und berichtet, weil (a) es als
  Rechen-/Konsistenzprüfung dient und (b) die Zerlegung in E2a/E2b die für die
  Interpretation wichtige Frage beantwortet, **wie viel** des
  Gesamtunterschieds auf der "industrie-/energiegeprägten" Seite (SL↔BY) bzw.
  auf der "Stadtstaat-Seite" (BY↔BE) liegt. E1' ersetzt E1 nicht und wird nicht
  als unabhängige zusätzliche Evidenz gezählt (siehe Abschnitt 7).

**Präzise Formulierung des primären Estimands (angepasst durch Amendment
v1.1, siehe Amendment-Historie Änderungen 1 und 2):** "Wie groß ist die
Differenz der modellbasierten Pro-Kopf-THG- (bzw. ersatzweise CO2-)
Emissionsniveaus zwischen Saarland und Berlin im neuesten gemeinsamen
Beobachtungsjahr, geschätzt aus bundeslandspezifischen linearen Trendmodellen
über die primären Analysefenster (siehe Abschnitt 4 und 5.1 — im Regelfall ein
durchgehendes 10-Jahres-Fenster; bei Datenlücken, wie im vorliegenden
Datenstand, zwei gleichrangige primäre Varianten n=5 und n=8), mit
Moving-Block-Bootstrap-basierter Unsicherheitsquantifizierung als primärer
Inferenzgrundlage (siehe 5.4 — Newey-West-HAC-Konfidenzintervalle sind
sensitivitätsanalytisch) — sowie, ergänzend und methodisch untergeordnet, die
Zerlegung dieser Differenz in die Teilkontraste Saarland–Bayern und
Bayern–Berlin?"

Diese Formulierung ist so gewählt, dass zwei unabhängige Analyst:innen mit
diesem SAP zu identischer Modellspezifikation, identischem Zeitfenster-Set und
identischem Zieljahr gelangen.

## 3. Datenquelle

- Quelle: Umweltbundesamt (UBA), bereitgestellt über klimadashboard.de
  (CC BY 4.0), analog zu den Datenzugriffs-Konventionen aus dem Referenzprojekt
  `Analysen/2026-08-emissionen/`.
- Ergänzende Quelle (nur falls UBA-Reihe nicht bereits als Pro-Kopf-Wert
  vorliegt): Statistisches Bundesamt (Destatis), Bevölkerungsfortschreibung
  (Bevölkerungsstand 31.12. des jeweiligen Jahres) als einheitlicher Nenner für
  alle drei Länder und alle Jahre — Wahl der Bevölkerungskonvention (31.12. vs.
  Jahresdurchschnitt) wird sensitivitätsanalytisch geprüft (Abschnitt 6).
- Zugriffsdatum: [wird vom Analyst-Subagenten beim tatsächlichen Datenzugriff
  eingetragen]
- Datenstand laut Quelle: [wird beim Datenzugriff dokumentiert; UBA-Reihen zu
  Bundesländer-Emissionen werden erfahrungsgemäß mit mehrjähriger Verzögerung
  und rückwirkenden Revisionen veröffentlicht — die zum Zugriffszeitpunkt
  aktuellste verfügbare Revision ist zu verwenden und im Analyseskript exakt zu
  dokumentieren]
- Endpunkt-/Variablendefinition (THG-Gesamt vs. energiebedingtes CO2) und exakte
  Datei-/Tabellenbezeichnung: analog zum Referenzprojekt beim Datenzugriff zu
  dokumentieren, bevor Modelle geschätzt werden. **Diese Klärung ist als erster
  dokumentierter Schritt des analyst-Subagenten durchzuführen** (Metadaten-/
  Struktur-Check der Datenquelle, keine Ergebnissichtung), bevor Modelle
  geschätzt werden; das Ergebnis dieses Checks bestimmt gemäß der oben
  festgelegten Fallback-Regel, welche Zielgröße primär verwendet wird.
- **Dokumentationsanforderung für behauptete fehlgeschlagene externe
  Datenzugriffe (ergänzt durch Amendment v1.1, siehe Amendment-Historie
  Änderung 4):** Wird im Analyseskript oder Skript-Header behauptet, ein
  automatisierter Zugriffsversuch auf eine externe Datenquelle (z. B. Destatis
  GENESIS-Online, Regionalstatistik.de) sei fehlgeschlagen, muss dies
  verbindlich ENTWEDER (a) mit einem nachprüfbaren Artefakt belegt werden
  (HTTP-Log, Fehlermeldung/Statuscode, Zeitstempel, Code-Pfad im Repository,
  der tatsächlich einen Netzwerkzugriff unternimmt), ODER (b) ehrlich
  umformuliert werden als "nicht versucht, da kein Netzwerkzugriff in der
  Analyseumgebung verfügbar" bzw. sinngemäß zutreffend. Eine unbelegte
  Behauptung eines tatsächlich unternommenen, aber gescheiterten
  Zugriffsversuchs ist nicht zulässig. Dies gilt rückwirkend auch für die
  bestehende S3-Abweichung im bereits vorliegenden Analyseskript
  `thg-laendervergleich.R`; die Korrektur ist vom analyst-Subagenten im
  nächsten Analyseschritt vorzunehmen und ist nicht Gegenstand dieses
  SAP-Dokuments.

## 4. Analysepopulation

- **Einheiten:** Saarland, Bayern, Berlin (bewusste, forschungsfrageninduzierte
  Auswahl von drei strukturell möglichst unterschiedlichen Ländern; keine
  Zufallsstichprobe, keine Generalisierbarkeit auf andere Bundesländer oder
  -paare).
- **Primäres Zeitfenster (Trendmodell) — angepasst durch Amendment v1.1,
  siehe Amendment-Historie Änderung 2:** Grundsätzlich die letzten 10
  verfügbaren Jahre bis einschließlich des Zieljahres (neuestes gemeinsames
  Jahr, siehe Abschnitt 2), sofern für alle drei Länder im gesamten Zeitraum
  vollständig verfügbar. Bestehen innerhalb dieser 10 Jahre für mindestens ein
  Land fehlende Werte (siehe Bullet "Fehlende Werte" unten), werden **zwei
  gleichrangige primäre Fenstervarianten** parallel geführt, statt eine davon
  auszuwählen:
  - **Variante n=5 (zusammenhängendes Fenster):** das längste zusammenhängende
    Teilfenster innerhalb der letzten 10 Jahre, das für alle drei Länder
    vollständig vorliegt.
  - **Variante n=8 (Lückenjahre einzeln entfernt):** alle Jahre der letzten 10,
    für die alle drei Länder Werte haben, wobei nur die einzelnen fehlenden
    Jahre herausgenommen werden (ein nicht-zusammenhängendes Fenster ist
    zulässig).
  Für den bereits vorliegenden Datenstand (Saarland fehlt für 2017/2018)
  bedeutet dies konkret: n=5 = 2019–2023; n=8 = 2014–2016 + 2019–2023. Beide
  Varianten sind gleichrangig primär (siehe 5.1) — es wird nicht nachträglich
  eine der beiden Varianten als "die" Primäranalyse ausgewählt.
- **Sensitivitäts-Zeitfenster:** siehe Abschnitt 6 (S2: gesamte verfügbare
  Zeitreihe sowie reiner Einzeljahreswert ohne Trendmodell). Das vormalige
  S2a ("5-Jahres-Fenster") ist durch Amendment v1.1 in die Primäranalyse als
  Variante n=5 aufgegangen und wird nicht mehr separat als
  Sensitivitätsanalyse geführt, um eine Doppelführung derselben Berechnung zu
  vermeiden (siehe Abschnitt 6).
- **Ausschlusskriterien:** Keine inhaltlich motivierten Ausschlüsse einzelner
  Jahre. Bekannte Strukturbrüche werden vorab benannt, aber nicht automatisch
  ausgeschlossen, sondern deskriptiv dokumentiert und ggf. in einer separaten
  Sensitivitätsanalyse mit verkürztem Fenster berücksichtigt:
  - Berlin: Zusammenführung Ost-/West-Berliner Statistiken um 1990/1991
    (potenzieller Strukturbruch in der Zeitreihe).
  - Methodische Revisionen der UBA-Emissionsberichterstattung (z. B.
    Aktualisierungen der Emissionsfaktoren/Berichtspflichten), sofern von der
    Quelle selbst als Bruch gekennzeichnet.
- **Fehlende Werte (angepasst durch Amendment v1.1, siehe Amendment-Historie
  Änderung 2):** Fehlt für ein Land/Jahr im primären 10-Jahres-Fenster ein
  Wert, werden beide oben spezifizierten primären Fenstervarianten (n=5
  zusammenhängend, n=8 Lückenjahre einzeln entfernt) berechnet und
  dokumentiert. Die frühere Formulierung in Version 1.0 ("Reduktion auf den
  längsten gemeinsam vollständig verfügbaren Zeitraum") wurde präzisiert, da
  sie in der Praxis unterschiedlich (zusammenhängend vs. nicht-zusammenhängend)
  ausgelegt werden konnte und diese Auslegungsentscheidung nicht ergebnis-
  neutral ist (siehe Amendment-Historie Änderung 2 sowie 5.4 zur HAC/T=5-
  Konsequenz).

## 5. Statistische Methoden

### 5.1 Primäranalyse

Für jedes der drei Bundesländer wird separat ein lineares Trendmodell
geschätzt:

Emission_t = β0 + β1 · Jahr_t + ε_t

geschätzt per OLS. Liegt kein Datenlücken-Fall vor, wird ein einziges
primäres 10-Jahres-Fenster verwendet (siehe Abschnitt 4). Liegt ein
Datenlücken-Fall vor (wie im bereits vorliegenden Datenstand), werden —
angepasst durch Amendment v1.1, siehe Amendment-Historie Änderung 2 —
**beide** in Abschnitt 4 spezifizierten primären Fenstervarianten (n=5
zusammenhängend; n=8 Lückenjahre einzeln entfernt) vollständig und parallel
geschätzt. Aus jedem Modell (je Land, je Fenstervariante) wird der angepasste
("fitted") Wert für das Zieljahr (neuestes gemeinsames Jahr) mit
95 %-Konfidenzintervall extrahiert. Diese Landeswerte bilden je
Fenstervariante die Grundlage für die Kontraste E1, E2a, E2b und E1' aus
Abschnitt 2. Beide Fenstervarianten werden mit dem vollständigen Kontrast-Set
(E2a, E2b, E1, E1') und beiden CI-Typen (Bootstrap primär, HAC
sensitivitätsanalytisch, siehe 5.4) parallel berechnet und im
Ergebnisbericht transparent gegenübergestellt (siehe Abschnitt 11); es wird
nicht nachträglich eine der beiden Varianten als "die" Hauptaussage
ausgewählt.

Primär vs. sensitivitätsanalytisch (siehe auch Abschnitt 6):

- **Primär:** THG-Gesamt- bzw. Fallback-CO2-Reihe (Abschnitt 2), primäre(s)
  Trendfenster gemäß Abschnitt 4 (im Regelfall ein 10-Jahres-Fenster; bei
  Datenlücken beide gleichrangigen Varianten n=5 und n=8), Zieljahr =
  neuestes gemeinsames Jahr, Bevölkerungsstand 31.12. Primäre
  Unsicherheitsquantifizierung: Moving-Block-Bootstrap (siehe 5.4, geändert
  durch Amendment v1.1).
- Alle übrigen Varianten (andere Zielgröße, andere Bevölkerungskonvention,
  anderer Brückenkomparator, robuste Trendschätzung, sowie
  Newey-West-HAC-Konfidenzintervalle) sind explizit sensitivitätsanalytisch
  (Abschnitt 6 bzw. 5.4) und ersetzen die Primäranalyse nicht.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Für jedes der drei bundeslandspezifischen Trendmodelle (je Fenstervariante,
siehe 5.1) wird geprüft:

- **Autokorrelation der Residuen:** Durbin-Watson-Test und Breusch-Godfrey-Test
  (höhere Ordnung, da Emissionsreihen typischerweise mehrjährige
  Konjunktur-/Wetterzyklen zeigen). Ergebnis wird für alle drei Länder
  berichtet, unabhängig vom Signifikanzergebnis.
- **Normalität der Residuen:** Shapiro-Wilk-Test sowie visuelle QQ-Plot-Prüfung.
- **Linearität des Trends:** visuelle Residuen-vs-Jahr-Plots; bei erkennbarer
  Nichtlinearität (z. B. Strukturbruch, Sättigung) wird dies dokumentiert und
  fließt in Abschnitt 9 (Limitationen) ein — es begründet keine nachträgliche
  Änderung der primären Modellspezifikation.
- **Einflussreiche Beobachtungen:** Cook's Distance; auffällige Jahre werden
  benannt, aber nicht ohne inhaltlich dokumentierte, vorab nicht vorgesehene
  Begründung ausgeschlossen.

**Transitivitäts-Diagnostik für den Brückenkomparator (Bayern):** zusätzlich zur
inhaltlichen Vorab-Einschätzung in Abschnitt 8 wird numerisch/deskriptiv
geprüft, ob der geschätzte Bayern-Wert im Zieljahr tatsächlich zwischen den
Werten für Saarland und Berlin liegt (Ordering-Check). Ein Verstoß gegen diese
Ordnung (Bayern liegt nicht dazwischen) wird nicht verschwiegen, sondern als
Warnhinweis in den Ergebnisbericht aufgenommen und relativiert die Aussagekraft
der Brücken-Interpretation zusätzlich zur bereits in Abschnitt 8 dokumentierten
strukturellen Vorsicht.

### 5.3 Korrektur bei Annahmenverletzung

- **Bei nachgewiesener Autokorrelation** (Durbin-Watson oder Breusch-Godfrey
  signifikant, α = 0,05): angepasst durch Amendment v1.1 (siehe
  Amendment-Historie Änderung 1) — da die primäre Unsicherheitsquantifizierung
  ohnehin per Moving-Block-Bootstrap erfolgt (Abschnitt 5.4), der die
  Autokorrelationsstruktur bereits durch das blockweise Resampling
  berücksichtigt, wird bei nachgewiesener Autokorrelation zusätzlich weiterhin
  Newey-West-HAC (automatische Bandbreiten-/Lag-Wahl nach Newey & West 1994)
  berechnet und berichtet, jedoch **nicht mehr als primäre**, sondern als
  **sensitivitätsanalytische** Ergänzung zu den primären
  Bootstrap-Konfidenzintervallen — einheitlich über alle drei Modelle
  angewendet, um Vergleichbarkeit zu wahren.
- **Bei nachgewiesener Abweichung von der Normalität:** zusätzliche Berichterstattung
  eines nichtparametrischen Trendschätzers (Theil-Sen) als Sensitivitätsanalyse
  (Abschnitt 6); die OLS-Schätzung bleibt primär, wird aber im Bericht explizit
  als möglicherweise verzerrungsanfällig gekennzeichnet.
- **Bei Hinweisen auf Strukturbruch/Nichtlinearität:** keine automatische
  Fenster-Verkürzung der Primäranalyse; stattdessen zusätzliche
  Sensitivitätsanalyse mit verkürztem, bruchbereinigtem Fenster (Abschnitt 6).

### 5.4 Unsicherheitsquantifizierung

**Geändert durch Amendment v1.1 (28.08.2026) — siehe Amendment-Historie
Änderung 1.** In Version 1.0 waren HAC-Konfidenzintervalle primär und
Bootstrap-Konfidenzintervalle sensitivitätsanalytisch; mit Version 1.1 werden
diese Rollen vertauscht. Die zugrundeliegenden Berechnungsverfahren selbst
bleiben unverändert.

- **Primär:** Moving-Block-Bootstrap-Konfidenzintervalle (blockweises
  Resampling der Jahre je Land, um Autokorrelation zu erhalten) für die
  Trendmodell-Fitted-Values im Zieljahr sowie für deren Differenzen (E1, E2a,
  E2b, E1'). Begründung für die Umstufung zu primär: Bei den hier
  vorliegenden kurzen Zeitreihen (T=5 bzw. T=8, siehe Abschnitt 4) ist die
  Kernannahme der Newey-West-HAC-Schätzer (Bandbreite wächst langsamer als T
  gegen unendlich) nicht mehr sinnvoll operationalisierbar; der
  Validierungsbericht dokumentiert zudem eine 3- bis 7-fache Diskrepanz
  zwischen HAC- und Bootstrap-Intervallbreite bei identischen Fitted-Werten
  als Indiz für anti-konservative HAC-Standardfehler bei dieser Fallzahl.
- **Sensitivitätsanalytisch:** 95 %-Konfidenzintervalle aus HAC-robusten
  (Newey-West) Standardfehlern der Trendmodell-Fitted-Values bzw. deren
  Differenzen (Delta-Standardfehler unter Annahme unabhängiger
  Länder-Zeitreihen: SE(Δ) = √(SE₁² + SE₂²)) werden weiterhin berechnet und im
  Ergebnisbericht gleichrangig neben den primären Bootstrap-Konfidenzintervallen
  dargestellt (nicht nur als Fußnote), jedoch nicht mehr als primäre
  Inferenzgrundlage interpretiert oder für Signifikanzaussagen herangezogen
  (siehe 5.5, Sprachregelung).

### 5.5 Signifikanzniveau

α = 0,05, zweiseitig, für alle Tests. Anpassung für Mehrfachtestung siehe
Abschnitt 7. Angesichts dessen, dass es sich bei den drei Bundesländern nicht um
eine Zufallsstichprobe, sondern um administrative Vollerhebungsdaten handelt,
wird im Ergebnisbericht explizit klargestellt, dass sich die Unsicherheit auf
Jahr-zu-Jahr-Variabilität (Konjunktur, Witterung, Messrevisionen) bezieht und
nicht auf eine Stichprobenziehung aus einer Grundgesamtheit von Bundesländern.

**Sprachregelung (ergänzt durch Amendment v1.1, siehe Amendment-Historie
Änderung 3):** Im Ergebnisbericht wird für die primären Kontraste (E1, E2a,
E2b) sowie für die Konsistenzangabe E1' auf die Formulierungen "statistisch
signifikant" / "nicht signifikant" sowie auf p-Wert-Schwellenformulierungen
als Aussage über Bedeutsamkeit (z. B. "p < 0,05" im Sinne von "der
Unterschied ist real/bedeutsam") verzichtet. Stattdessen werden
Punktschätzung und Konfidenzintervall (primär: Bootstrap gemäß 5.4) berichtet
und für sich sprechen gelassen. Grund: Bei n=3 Bundesländern und T=5 bzw. T=8
Zeitpunkten ist eine unrelativierte Signifikanzsprache methodisch nicht
angemessen (Validierungsbericht, Abschnitt 1, Auflage 1; siehe auch Abschnitt
9, Limitationen zur Fallzahl, und Abschnitt 11, Reporting).

## 6. Sensitivitätsanalysen

Alle folgenden Varianten werden vorab festgelegt, vollständig durchgeführt und
im Ergebnisbericht **zusätzlich** zur Primäranalyse dargestellt — unabhängig
davon, ob sie das primäre Ergebnis bestätigen oder nicht:

1. **S1 – Alternative Zielgröße:** Falls sowohl THG-Gesamt- als auch
   reine-CO2-Reihe verfügbar sind, wird die jeweils nicht-primäre Reihe als
   Sensitivitätsanalyse gerechnet.
2. **S2 – Alternatives Trendfenster (angepasst durch Amendment v1.1, siehe
   Amendment-Historie Änderung 2):** (a) gesamte verfügbare Zeitreihe ab dem
   frühesten Jahr mit Daten für alle drei Länder, (b) reiner Einzeljahreswert
   im Zieljahr ohne Trendmodell (kein Extrapolations-/Glättungseffekt). Das
   vormalige S2a ("5-Jahres-Fenster") ist mit Version 1.1 nicht mehr Teil
   dieser Sensitivitätsanalyse: Es entspricht numerisch der primären
   Fenstervariante n=5 aus Abschnitt 4/5.1 und wird dort bereits als
   gleichrangige Primäranalyse geführt — eine separate sensitivitäts-
   analytische Wiederholung derselben Berechnung würde eine unzulässige
   Doppelführung darstellen.
3. **S3 – Alternative Bevölkerungskonvention:** Bevölkerungsstand als
   Jahresdurchschnitt statt 31.12., falls die UBA-Daten nicht bereits
   pro Kopf vorliegen.
4. **S4 – Robuste Trendschätzung:** Theil-Sen-Schätzer statt OLS (Auslösung
   siehe 5.3, aber ungeachtet des Diagnostik-Ergebnisses zusätzlich berichtet).
5. **S5 – Alternativer/erweiterter Brückenkomparator:** Wiederholung des
   indirekten Vergleichs mit (a) einem zweiten Stadtstaat (Hamburg oder Bremen)
   als zusätzlicher Brücke und (b) einem weiteren "gemischten" Flächenland
   (z. B. Hessen oder Rheinland-Pfalz) anstelle von bzw. zusätzlich zu Bayern,
   um die in Abschnitt 8 diskutierte Transitivitätsunsicherheit empirisch zu
   flankieren. Diese Analyse ist explizit sensitivitätsanalytisch und
   verändert nicht die primäre Schlussfolgerung.
6. **S6 – Bruchbereinigtes Fenster für Berlin:** Trendmodell für Berlin
   zusätzlich nur mit Jahren ab 1991 (bzw. dem in Abschnitt 4 dokumentierten
   Bruchjahr), um den Ost-West-Zusammenführungseffekt auszuschließen.

## 7. Umgang mit Mehrfachtestung / Multiplizität

**Primäre Test-Familie (immer vollständig berichtet, α_familywise = 0,05,
Holm-Bonferroni-Korrektur):**

1. Δ(SL, BY) = E2a
2. Δ(BY, BE) = E2b
3. Δ(SL, BE) = E1 (direkter Vergleich)

E1' (die aus E2a + E2b rekonstruierte indirekte Schätzung von SL–BE) wird
berichtet, ist aber **kein zusätzlicher, separat korrigierter Test** — sie ist
algebraisch eine Linearkombination der bereits getesteten Kontraste und würde
bei zusätzlicher Testung die Fehlerrate künstlich verzerren (Doppelzählung).

Alle Sensitivitätsanalysen (Abschnitt 6) werden für alle drei primären
Kontraste vollständig berichtet, nicht selektiv. Es wird explizit
ausgeschlossen, im Ergebnisbericht nur die günstigste/signifikanteste
Kombination aus Zeitfenster, Zielgröße und Bevölkerungskonvention
herauszugreifen ("kein Cherry-Picking"). Der primäre Kontrast-Satz aus
Abschnitt 5.1/6 ist bindend für die Hauptaussage des Reports; alle
Sensitivitätsergebnisse werden tabellarisch im Anhang vollständig
gegenübergestellt.

**Ergänzung durch Amendment v1.1 (siehe Amendment-Historie Änderung 3):** Die
im Rahmen dieser Test-Familie berichteten Holm-korrigierten p-Werte (siehe
Abschnitt 11) sind, sofern sie tabellarisch im Anhang erscheinen, rein
deskriptiv zu kennzeichnen und nicht als Signifikanzaussage im Sinne von
"statistisch (nicht) signifikant" zu interpretieren (siehe 5.5,
Sprachregelung).

## 8. Interpretationsrahmen / Confounder

### 8.1 Produktions- vs. Konsum-Perspektive

Die UBA-Emissionsbilanzen (auch die nach Bundesländern aufgeschlüsselten) sind
**territoriale (Produktions-)Bilanzen**: Emissionen werden dort verbucht, wo sie
physisch entstehen (Kraftwerksstandort, Industrieanlage, Straßenverkehr auf dem
Landesgebiet), **nicht** dort, wo die damit hergestellten Güter oder erzeugte
Energie letztlich konsumiert werden. Das hat für die drei betrachteten Länder
erhebliche Konsequenzen für die Interpretation:

- **Saarland:** Ein hoher Anteil der territorialen Emissionen kann auf
  Stahl-/Schwerindustrie und ggf. Kraftwerksstandorte zurückgehen, deren
  Produkte (Stahl, Strom) zu erheblichen Teilen außerhalb des Saarlandes
  konsumiert bzw. weiterverarbeitet werden. Eine hohe Pro-Kopf-Emission
  spiegelt also primär die **Standortfunktion für energieintensive
  Industrie/Erzeugung**, nicht den Konsum- oder Lebensstil der dort lebenden
  Bevölkerung wider.
- **Berlin:** Als Stadtstaat ohne nennenswerte Schwerindustrie oder große
  Kraftwerkskapazität am eigenen Konsum vorbei erscheint die
  Pro-Kopf-Bilanz strukturell niedrig — unabhängig vom tatsächlichen
  Konsumniveau der Bevölkerung (importierter Strom, in anderen Ländern
  produzierte Güter, Flugreisen ab externen Flughäfen etc. schlagen in der
  Produktionsbilanz nicht oder nur teilweise zu Buche).
- **Bayern:** Gemischtes Bild: energieintensive Industrie (u. a. Automobil-,
  Chemie-, Zulieferindustrie) und relevante Landwirtschaft (Methan-/Lachgas-
  Emissionen aus Tierhaltung) einerseits, aber kein bedeutender
  Braunkohle-/Steinkohle-Kraftwerkspark andererseits.

**Konsequenz für die Interpretation:** Unterschiede in den Pro-Kopf-Werten
werden im Ergebnisbericht ausdrücklich als **Standort-/Produktionseffekte**,
nicht als Aussage über den Konsum, Lebensstil oder das "klimafreundliche
Verhalten" der jeweiligen Landesbevölkerung gerahmt. Dieser Hinweis wird als
Standardformulierung in jede Ergebnisdarstellung (Text, Tabellen, Grafiken)
aufgenommen.

### 8.2 Keine implizite Politikbewertung

Es wird **vorab** festgelegt, wie mit dem plausiblen Befund umgegangen wird,
dass Saarland deutlich höhere Pro-Kopf-Emissionen als Bayern und/oder Berlin
aufweist:

- Ein solcher Befund wird primär auf **strukturelle Faktoren** zurückgeführt
  (Industriestruktur — insbesondere Stahlerzeugung —, Kraftwerksstandorte,
  geringe Bevölkerungszahl als Nenner, historisch gewachsene
  Wirtschaftsstruktur des Montanreviers), **nicht** auf unterschiedlich
  ambitionierte Landesklimapolitik.
- Umgekehrt wird ein niedriger Wert für Berlin **nicht** als Beleg für
  ambitioniertere Klimapolitik interpretiert, sondern zunächst auf die
  Stadtstaat-Struktur (keine Schwerindustrie, keine große eigene
  Stromerzeugung, Grenzen des Verwaltungsgebiets) zurückgeführt.
- Der Ergebnisbericht wird explizit formulieren, dass diese Analyse **keine
  Kausalaussage über Landespolitik** trifft und keine Rangliste
  "klimapolitischer Leistung" der drei Länder darstellt. Sollten Leser:innen
  eine politische Bewertung wünschen, wäre dafür eine gesonderte, auf
  politik-/maßnahmenbezogene Indikatoren gestützte Analyse nötig, die nicht
  Gegenstand dieses SAP ist.

### 8.3 Transitivitätsannahme für Bayern als Brückenkomparator

**Dies ist eine Grundvoraussetzung für die Sinnhaftigkeit des gesamten
indirekten Vergleichsansatzes, nicht nur ein Rechenschritt.** Die folgende
Einschätzung basiert ausschließlich auf allgemeinem Vorwissen über die
Wirtschafts- und Energiestruktur der drei Länder (u. a. bekannter Charakter
Saarlands als Montan-/Stahlstandort, Berlins als Stadtstaat ohne Schwerindustrie,
Bayerns als großes, wirtschaftlich diversifiziertes Flächenland) — **nicht**
auf gesichteten Daten dieser Analyse.

**Numerische Plausibilität (Niveau-Ordering):** Es ist aus allgemeinem
Vorwissen plausibel, dass Bayern beim Pro-Kopf-THG-/CO2-Niveau **zahlenmäßig
zwischen** Saarland (typischerweise eines der höchsten Länder wegen
Stahlindustrie und Kraftwerksstandorten) und Berlin (typischerweise eines der
niedrigsten Länder als Stadtstaat) liegt, da Bayern keinen bedeutenden
Braunkohle-/Schwerindustrie-Schwerpunkt wie das Saarland, aber auch keine
reine Stadtstaat-Struktur wie Berlin hat. Diese Ordering-Erwartung wird in 5.2
als Diagnostik-Check formal geprüft.

**Strukturelle Vergleichbarkeit (eigentliche Transitivitätsbedingung):** Hier
ist die Einschätzung **kritisch/eingeschränkt**, nicht uneingeschränkt positiv:

- Eine belastbare Transitivitätsannahme würde voraussetzen, dass Bayern nicht
  nur zahlenmäßig "in der Mitte" liegt, sondern dass die **Treiber** des
  Bayern–Saarland-Unterschieds und des Bayern–Berlin-Unterschieds
  vergleichbarer Natur sind (z. B. graduelle Unterschiede im selben
  Wirkmechanismus: Industrieanteil, Energiemix).
- Tatsächlich ist Bayern jedoch **kein "Mittelding" aus Saarland- und
  Berlin-Eigenschaften**, sondern ein drittes, strukturell eigenständiges
  Setting: großflächig, wirtschaftlich sehr heterogen (Automobil-/
  Zulieferindustrie, Chemie, Tourismus, ausgeprägte Landwirtschaft mit
  entsprechenden Methan-/Lachgas-Emissionen aus der Tierhaltung), ohne
  bedeutenden Kohlekraftwerkspark, mit gemischtem ländlich-großstädtischem
  Charakter. Weder die Industriestruktur des Saarlandes (Stahl/Montan) noch
  die Stadtstaat-Logik Berlins treffen auf Bayern in vergleichbarer Form zu.
- Der Bayern–Saarland-Kontrast wird daher überwiegend von
  Industrie-/Energieerzeugungs-Unterschieden getrieben sein, der
  Bayern–Berlin-Kontrast dagegen überwiegend von Stadtstaat- vs.
  Flächenland-Effekten (Bevölkerungsdichte, Pendlerverkehr, fehlende eigene
  Schwerindustrie/Erzeugung) — zwei **unterschiedliche** Wirkmechanismen, nicht
  zwei Ausprägungen desselben Mechanismus.

**Begründete Gesamteinschätzung:** Die Transitivitätsannahme ist **plausibel
genug, um eine numerische Zerlegung (E2a/E2b) und einen Ordering-Check
sinnvoll zu machen**, aber **nicht stark genug, um die indirekte Schätzung als
belastbaren, mechanistisch interpretierbaren "Brücken-Beweis"** zu behandeln.
Der indirekte Vergleich wird deshalb wie folgt eingeordnet:

1. Der **direkte** Vergleich Saarland–Berlin (E1) bleibt der primäre,
   belastbarste Schätzer, da er ohnehin aus denselben Daten direkt
   berechenbar ist (siehe Abschnitt 2, E1' = E1 algebraisch).
2. Die Bayern-Brücke dient vorrangig als **Zerlegungs-/Interpretationshilfe**
   (wie viel des Gesamtunterschieds liegt "auf der Industrieseite" vs. "auf
   der Stadtstaat-Seite"), nicht als eigenständige zusätzliche statistische
   Evidenzquelle.
3. Jede Aussage, die aus dem indirekten Vergleich abgeleitet wird, wird im
   Ergebnisbericht explizit als **hypothesengenerierend / mit Vorsicht zu
   interpretieren** gekennzeichnet, nicht als bestätigte kausale Rangfolge.
4. Als Robustheitsprüfung dieser eingeschränkten Einschätzung werden
   alternative Brückenkomparatoren vorab als Sensitivitätsanalyse festgelegt
   (S5, Abschnitt 6: zweiter Stadtstaat, weiteres Flächenland) statt sich
   allein auf Bayern zu verlassen.
5. Sollte der in 5.2 vorab spezifizierte Ordering-Check (Bayern-Wert liegt
   nicht zwischen Saarland und Berlin) fehlschlagen, wird dies **nicht**
   verschwiegen, sondern als zusätzliches, eigenständiges Argument gegen die
   Tragfähigkeit der Brücken-Interpretation im Ergebnisbericht benannt — die
   direkte Schätzung E1 bleibt davon unberührt gültig.

**Alternative Optionen, die bei Bedarf (z. B. auf Wunsch der Freigabe-Person)
anstelle des Bayern-Brücken-Ansatzes gewählt werden könnten:** (a) ein anderer
einzelner Brückenkomparator mit klarerer struktureller Zwischenposition,
(b) ein größeres Ländernetzwerk mit mehreren Brücken und formaler
Netzwerk-Metaanalyse-Konsistenzprüfung, oder (c) vollständiger Verzicht auf
den Transitivitätsanspruch zugunsten einer rein deskriptiven
Parallel-Darstellung aller Länder ohne Ableitung einer "indirekten Schätzung".
Diese Alternativen werden hier benannt, aber nicht als Ersatz für den in diesem
SAP primär festgelegten Ansatz umgesetzt, es sei denn, die Freigabe-Person
entscheidet dies vor dem Einfrieren des SAP.

### 8.4 Regression zur Mitte bei Trendvergleichen

Da die Primäranalyse ein **Niveau-**, kein Trend-/Veränderungsvergleich ist,
ist Regression zur Mitte für den primären Kontrast nachrangig. Sie ist jedoch
relevant für ergänzende Trendbetrachtungen (z. B. falls im Ergebnisbericht auch
die Steigung β1 der drei Länder verglichen wird): Länder mit hohem
Ausgangsniveau (Saarland) können strukturell leichter absolute Rückgänge
zeigen als Länder mit bereits niedrigem Niveau (Berlin). Falls Trend-
/Steigungsvergleiche zusätzlich berichtet werden, wird dieser Effekt im
Text explizit benannt, um eine Fehlinterpretation ("Saarland verbessert sich
schneller") als Politikbewertung zu vermeiden.

## 9. Limitationen

- **Sehr kleine Fallzahl (n = 3 Länder):** Es handelt sich um administrative
  Vollerhebungsdaten dreier bewusst gewählter, extremer Einheiten, nicht um
  eine Zufallsstichprobe aus der Grundgesamtheit der 16 Bundesländer.
  Klassische Inferenzstatistik (p-Werte, CIs) quantifiziert hier
  Jahr-zu-Jahr-Variabilität, nicht Stichprobenunsicherheit im eigentlichen
  Sinn — dieser Unterschied wird im Bericht erläutert.
- **Keine Kausalinterpretation:** Die Analyse beschreibt Unterschiede in
  Emissionsniveaus, keine Wirkung von Politikmaßnahmen.
- **Kurze/lückenhafte Zeitreihen möglich:** UBA-Länderdaten werden mit
  mehrjähriger Verzögerung veröffentlicht und ggf. rückwirkend revidiert;
  die tatsächlich verfügbare Reihenlänge ist erst beim Datenzugriff bekannt.
  Bei sehr kurzen primären Fenstern (T=5) ist, wie in Version 1.1 berücksichtigt
  (siehe Abschnitt 5.4), auch die Eignung klassischer HAC-Schätzer
  eingeschränkt; dies wird methodisch durch die primäre Verwendung von
  Bootstrap-Konfidenzintervallen adressiert, bleibt aber eine grundsätzliche
  Limitation kleiner Stichprobenumfänge.
- **Keine Anpassung für Witterung/Konjunktur:** Heizgradtage, konjunkturelle
  Industrieauslastung u. Ä. werden nicht separat herausgerechnet und können
  Jahr-zu-Jahr-Schwankungen erklären, die fälschlich als Trend interpretiert
  werden könnten.
- **Nicht generalisierbar:** Ergebnisse gelten ausschließlich für dieses
  Länder-Trio und sind nicht auf andere Bundesländer oder -paare übertragbar.
- **Datenrevisionen:** Historische Werte können sich durch UBA-Methodik-
  Updates rückwirkend ändern; das Analyseskript dokumentiert exakt Zugriffsdatum
  und Datenstand, damit spätere Abweichungen nachvollziehbar sind.
- **Transitivitätsvorbehalt:** Wie in Abschnitt 8.3 begründet, wird die
  indirekte (Brücken-)Schätzung als methodisch schwächer eingestuft als der
  direkte Vergleich; dies ist keine nachträgliche Abwertung, sondern vorab
  begründete Einschränkung.

## 10. Software

- R (Version wird im Analyseskript dokumentiert, ≥ 4.x)
- Pakete (voraussichtlich, endgültige Liste im Analyseskript): `dplyr`/`tidyr`
  (Datenaufbereitung), `boot` (Moving-Block-Bootstrap — **primäre**
  Unsicherheitsquantifizierung gemäß Abschnitt 5.4, geändert durch Amendment
  v1.1), `lmtest` und `sandwich` (HAC-/Newey-West-robuste Standardfehler —
  **sensitivitätsanalytisch** gemäß Abschnitt 5.4, geändert durch Amendment
  v1.1; konsistent mit dem Referenzprojekt `Analysen/2026-08-emissionen/`),
  `car` oder `lmtest` (Breusch-Godfrey, Durbin-Watson), `mblm` oder
  vergleichbar (Theil-Sen-Schätzer), `ggplot2` (Grafiken).
- Skript-Dateiname (vom analyst-Subagenten zu erstellen, nicht Teil dieses
  SAP): `Analysen/2026-08-thg-laendervergleich/thg-laendervergleich.R`

## 11. Reporting

- **Darstellung (angepasst durch Amendment v1.1, siehe Amendment-Historie
  Änderungen 1–2):** (a) Tabelle mit Pro-Kopf-Emissionsniveau je Land im
  Zieljahr ± 95 %-CI, getrennt je primärer Fenstervariante (n=5 und n=8,
  siehe Abschnitt 4/5.1), jeweils mit **primär: Bootstrap-CI** und
  **sensitivitätsanalytisch: HAC-CI** gleichrangig nebeneinander dargestellt
  (Bootstrap nicht nur als Fußnote); (b) Punkt-/Balkendiagramm mit
  Fehlerbalken (primär: Bootstrap-CI) für alle drei Länder, je
  Fenstervariante getrennt dargestellt; (c) Tabelle aller primären Kontraste
  (E2a, E2b, E1, E1' als Konsistenzangabe) je Fenstervariante (n=5 und n=8)
  mit Bootstrap- und HAC-Konfidenzintervallen sowie Holm-korrigierten
  p-Werten (rein deskriptiv gekennzeichnet, siehe 5.5/7); (d) vollständige
  Anhangstabelle aller Sensitivitätsanalysen (S1, S2 [angepasst, siehe
  Abschnitt 6], S3–S6) für alle drei Kontraste.
- **Sprachregelung für primäre Kontraste (ergänzt durch Amendment v1.1,
  siehe Abschnitt 5.5 und Amendment-Historie Änderung 3):** Keine Verwendung
  von "signifikant"/"nicht signifikant" oder p-Wert-Schwellenaussagen für E1,
  E2a, E2b, E1' im Fließtext; Punktschätzung und (primär: Bootstrap-)
  Konfidenzintervall stehen für sich.
- **Verpflichtender Interpretationstext:** Jede Ergebnisdarstellung enthält den
  in Abschnitt 8.1/8.2 festgelegten Hinweis auf Produktionsbilanz-Charakter und
  den ausdrücklichen Verzicht auf eine politische Bewertung, sowie den in 8.3
  festgelegten Vorsichtshinweis zur eingeschränkten Belastbarkeit der
  Bayern-Brücke.
- **Rundung:** Eine Nachkommastelle für t CO2-Äq. pro Kopf; zwei
  Nachkommastellen für p-Werte < 0,10, sonst "p ≥ 0,10" ohne weitere
  Präzisierung, um Scheingenauigkeit zu vermeiden.
