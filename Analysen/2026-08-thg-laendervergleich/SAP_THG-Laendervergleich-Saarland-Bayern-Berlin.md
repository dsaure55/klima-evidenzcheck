# Statistischer Analyseplan (SAP)

**Titel:** Vergleich der Pro-Kopf-Treibhausgasemissionen zwischen Saarland und
Berlin mittels indirektem (Netzwerk-)Vergleich über Bayern als
Brückenkomparator

**Version:** 1.0
**Status:** final (eingefroren)
**Datum (Entwurf):** 27.08.2026
**Datum (Freigabe/Einfrieren):** 27.08.2026
**Autor:in:** sap-autor-Subagent
**Freigabe:** Daniel Saure Datum: 27.08.2026

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

Hinweis: Dieser SAP wurde ohne Sichtung von Rohdaten, Zwischenergebnissen oder
Grafiken verfasst. Sollte sich beim Freigabeprozess herausstellen, dass bereits
Analyseergebnisse vorlagen oder in den Auftrag eingeflossen sind, ist der Status
zwingend auf "Exploratorisch (retrospektiv)" zu ändern und die Präregistrierung
als ungültig zu kennzeichnen.

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

**Präzise Formulierung des primären Estimands:** "Wie groß ist die Differenz
der modellbasierten Pro-Kopf-THG- (bzw. ersatzweise CO2-) Emissionsniveaus
zwischen Saarland und Berlin im neuesten gemeinsamen Beobachtungsjahr, geschätzt
aus bundeslandspezifischen linearen Trendmodellen über das primäre 10-Jahres-
Fenster (siehe 5.1), mit HAC-robuster Unsicherheitsquantifizierung — sowie,
ergänzend und methodisch untergeordnet, die Zerlegung dieser Differenz in die
Teilkontraste Saarland–Bayern und Bayern–Berlin?"

Diese Formulierung ist so gewählt, dass zwei unabhängige Analyst:innen mit
diesem SAP zu identischer Modellspezifikation, identischem Zeitfenster und
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

## 4. Analysepopulation

- **Einheiten:** Saarland, Bayern, Berlin (bewusste, forschungsfrageninduzierte
  Auswahl von drei strukturell möglichst unterschiedlichen Ländern; keine
  Zufallsstichprobe, keine Generalisierbarkeit auf andere Bundesländer oder
  -paare).
- **Primäres Zeitfenster (Trendmodell):** Die letzten 10 verfügbaren Jahre bis
  einschließlich des Zieljahres (neuestes gemeinsames Jahr, siehe Abschnitt 2).
- **Sensitivitäts-Zeitfenster:** siehe Abschnitt 6 (5-Jahres-Fenster,
  gesamte verfügbare Zeitreihe, reiner Einzeljahreswert ohne Trendmodell).
- **Ausschlusskriterien:** Keine inhaltlich motivierten Ausschlüsse einzelner
  Jahre. Bekannte Strukturbrüche werden vorab benannt, aber nicht automatisch
  ausgeschlossen, sondern deskriptiv dokumentiert und ggf. in einer separaten
  Sensitivitätsanalyse mit verkürztem Fenster berücksichtigt:
  - Berlin: Zusammenführung Ost-/West-Berliner Statistiken um 1990/1991
    (potenzieller Strukturbruch in der Zeitreihe).
  - Methodische Revisionen der UBA-Emissionsberichterstattung (z. B.
    Aktualisierungen der Emissionsfaktoren/Berichtspflichten), sofern von der
    Quelle selbst als Bruch gekennzeichnet.
- **Fehlende Werte:** Fehlt für ein Land/Jahr im primären 10-Jahres-Fenster ein
  Wert, wird das Fenster für alle drei Länder auf den längsten gemeinsam
  vollständig verfügbaren Zeitraum innerhalb der letzten 10 Jahre reduziert;
  dies wird dokumentiert, nicht stillschweigend anders gewählt.

## 5. Statistische Methoden

### 5.1 Primäranalyse

Für jedes der drei Bundesländer wird separat ein lineares Trendmodell geschätzt:

Emission_t = β0 + β1 · Jahr_t + ε_t

geschätzt per OLS über das primäre 10-Jahres-Fenster (Abschnitt 4). Aus jedem
Modell wird der angepasste ("fitted") Wert für das Zieljahr (neuestes
gemeinsames Jahr) mit 95 %-Konfidenzintervall extrahiert. Diese drei
Landeswerte (SL, BY, BE) bilden die Grundlage für die Kontraste E1, E2a, E2b und
E1' aus Abschnitt 2.

Primär vs. sensitivitätsanalytisch (siehe auch Abschnitt 6):

- **Primär:** THG-Gesamt- bzw. Fallback-CO2-Reihe (Abschnitt 2), 10-Jahres-
  Trendfenster, Zieljahr = neuestes gemeinsames Jahr, Bevölkerungsstand 31.12.
- Alle übrigen Varianten (anderes Fenster, andere Zielgröße, andere
  Bevölkerungskonvention, anderer Brückenkomparator, robuste
  Trendschätzung) sind explizit sensitivitätsanalytisch (Abschnitt 6) und
  ersetzen die Primäranalyse nicht.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Für jedes der drei bundeslandspezifischen Trendmodelle wird geprüft:

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
  signifikant, α = 0,05): Newey-West-HAC-robuste Standardfehler (automatische
  Bandbreiten-/Lag-Wahl nach Newey & West 1994) für alle berichteten
  Konfidenzintervalle und Tests — angewendet unabhängig davon, ob die
  Diagnostik für alle drei Länder oder nur einzelne auffällig ist (einheitliche
  Anwendung über alle drei Modelle, um Vergleichbarkeit zu wahren).
- **Bei nachgewiesener Abweichung von der Normalität:** zusätzliche Berichterstattung
  eines nichtparametrischen Trendschätzers (Theil-Sen) als Sensitivitätsanalyse
  (Abschnitt 6); die OLS-Schätzung bleibt primär, wird aber im Bericht explizit
  als möglicherweise verzerrungsanfällig gekennzeichnet.
- **Bei Hinweisen auf Strukturbruch/Nichtlinearität:** keine automatische
  Fenster-Verkürzung der Primäranalyse; stattdessen zusätzliche
  Sensitivitätsanalyse mit verkürztem, bruchbereinigtem Fenster (Abschnitt 6).

### 5.4 Unsicherheitsquantifizierung

- **Primär:** 95 %-Konfidenzintervalle aus HAC-robusten (Newey-West)
  Standardfehlern der Trendmodell-Fitted-Values bzw. deren Differenzen
  (Delta-Standardfehler unter Annahme unabhängiger Länder-Zeitreihen:
  SE(Δ) = √(SE₁² + SE₂²)).
- **Sensitivitätsanalytisch:** Moving-Block-Bootstrap-Konfidenzintervalle
  (blockweises Resampling der Jahre je Land, um Autokorrelation zu erhalten),
  da HAC-Standardfehler bei kurzen Zeitreihen (T ≈ 10) asymptotisch schwach
  abgesichert sind. Bootstrap-Ergebnisse werden neben den HAC-CIs berichtet,
  nicht anstelle.

### 5.5 Signifikanzniveau

α = 0,05, zweiseitig, für alle Tests. Anpassung für Mehrfachtestung siehe
Abschnitt 7. Angesichts dessen, dass es sich bei den drei Bundesländern nicht um
eine Zufallsstichprobe, sondern um administrative Vollerhebungsdaten handelt,
wird im Ergebnisbericht explizit klargestellt, dass sich die Unsicherheit auf
Jahr-zu-Jahr-Variabilität (Konjunktur, Witterung, Messrevisionen) bezieht und
nicht auf eine Stichprobenziehung aus einer Grundgesamtheit von Bundesländern.

## 6. Sensitivitätsanalysen

Alle folgenden Varianten werden vorab festgelegt, vollständig durchgeführt und
im Ergebnisbericht **zusätzlich** zur Primäranalyse dargestellt — unabhängig
davon, ob sie das primäre Ergebnis bestätigen oder nicht:

1. **S1 – Alternative Zielgröße:** Falls sowohl THG-Gesamt- als auch
   reine-CO2-Reihe verfügbar sind, wird die jeweils nicht-primäre Reihe als
   Sensitivitätsanalyse gerechnet.
2. **S2 – Alternatives Trendfenster:** (a) 5-Jahres-Fenster, (b) gesamte
   verfügbare Zeitreihe ab dem frühesten Jahr mit Daten für alle drei Länder,
   (c) reiner Einzeljahreswert im Zieljahr ohne Trendmodell (kein
   Extrapolations-/Glättungseffekt).
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

Alle sechs Sensitivitätsanalysen (Abschnitt 6) werden für alle drei primären
Kontraste vollständig berichtet, nicht selektiv. Es wird explizit
ausgeschlossen, im Ergebnisbericht nur die günstigste/signifikanteste
Kombination aus Zeitfenster, Zielgröße und Bevölkerungskonvention
herauszugreifen ("kein Cherry-Picking"). Der primäre Kontrast-Satz aus
Abschnitt 5.1/6 ist bindend für die Hauptaussage des Reports; alle
Sensitivitätsergebnisse werden tabellarisch im Anhang vollständig
gegenübergestellt.

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
  (Datenaufbereitung), `lmtest` und `sandwich` (HAC-/Newey-West-robuste
  Standardfehler, konsistent mit dem Referenzprojekt
  `Analysen/2026-08-emissionen/`), `car` oder `lmtest` (Breusch-Godfrey,
  Durbin-Watson), `boot` (Moving-Block-Bootstrap), `mblm` oder vergleichbar
  (Theil-Sen-Schätzer), `ggplot2` (Grafiken).
- Skript-Dateiname (vom analyst-Subagenten zu erstellen, nicht Teil dieses
  SAP): `Analysen/2026-08-thg-laendervergleich/thg-laendervergleich.R`

## 11. Reporting

- **Darstellung:** (a) Tabelle mit Pro-Kopf-Emissionsniveau je Land im Zieljahr
  ± 95 %-CI (primär: HAC; sensitivitätsanalytisch: Bootstrap); (b) Punkt-/
  Balkendiagramm mit Fehlerbalken für alle drei Länder; (c) Tabelle aller
  primären Kontraste (E2a, E2b, E1, E1' als Konsistenzangabe) mit
  Holm-korrigierten p-Werten und CIs; (d) vollständige Anhangstabelle aller
  Sensitivitätsanalysen (S1–S6) für alle drei Kontraste.
- **Verpflichtender Interpretationstext:** Jede Ergebnisdarstellung enthält den
  in Abschnitt 8.1/8.2 festgelegten Hinweis auf Produktionsbilanz-Charakter und
  den ausdrücklichen Verzicht auf eine politische Bewertung, sowie den in 8.3
  festgelegten Vorsichtshinweis zur eingeschränkten Belastbarkeit der
  Bayern-Brücke.
- **Rundung:** Eine Nachkommastelle für t CO2-Äq. pro Kopf; zwei
  Nachkommastellen für p-Werte < 0,10, sonst "p ≥ 0,10" ohne weitere
  Präzisierung, um Scheingenauigkeit zu vermeiden.
