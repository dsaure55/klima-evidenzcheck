**ENTWURF – nicht veröffentlicht. Freigabe durch Daniel Saure erforderlich vor Publikation.**

---

# Saarland, Bayern, Berlin: Was die CO2-Pro-Kopf-Zahlen zeigen – und was sie nicht zeigen

## Der Blick, der zu kurz greift

Bundesländer-Rankings zu Pro-Kopf-Emissionen tauchen regelmäßig in Dashboards und Medienberichten auf – oft als simple Balkendiagramme, die auf den ersten Blick wie eine Bestenliste klimapolitischer Leistung wirken. Wir haben uns die Zahlen für drei besonders unterschiedliche Länder genauer angesehen: Saarland, Bayern und Berlin. Das Ergebnis bestätigt einen deutlichen Zahlenunterschied – aber es zeigt vor allem, wie leicht dieser Unterschied fehlgelesen werden kann, wenn man ihn nicht sorgfältig einordnet. Genau darum geht es in diesem Artikel: nicht nur um die Zahl, sondern darum, was sie bedeutet – und was nicht.

## Die Kernzahl

Datengrundlage ist die Reihe "CO2-Emissionen je Einwohner" des Länderarbeitskreises Energiebilanzen (LAK) – dieselbe Quellenbilanz, auf der auch die UBA-/klimadashboard.de-Länderzahlen aufbauen. Eine harmonisierte Gesamt-Treibhausgasreihe (alle Kyoto-Gase) existiert auf Bundesländerebene nicht öffentlich; berichtet wird daher die energiebedingte CO2-Emission pro Kopf, wie im Analyseplan vorab für genau diesen Fall festgelegt.

Für das Zieljahr 2023 (das neueste Jahr mit Werten für alle drei Länder) ergeben sich, aus länderspezifischen Trendmodellen geschätzt, folgende Niveaus (Punktschätzung, primäres 95-%-Bootstrap-Konfidenzintervall):

| Land | 5-Jahres-Fenster (2019–2023) | 8-Jahres-Fenster (2014–2016 + 2019–2023) |
|---|---|---|
| Saarland | 13,1 t [12,0; 14,2] | 11,1 t [8,5; 13,1] |
| Bayern | 5,2 t [5,0; 5,4] | 5,4 t [5,3; 5,7] |
| Berlin | 3,4 t [3,2; 3,5] | 3,3 t [3,2; 3,4] |

Warum zwei Zeitfenster? Für das Saarland fehlen in den amtlichen Daten die Jahre 2017 und 2018. Statt eine Variante auszuwählen, werden beide methodisch gleichrangigen Varianten – ein durchgehendes 5-Jahres-Fenster und ein 8-Jahres-Fenster mit einzeln herausgenommenen Lückenjahren – parallel berichtet, wie im vorab eingefrorenen Analyseplan festgelegt.

Der direkte Unterschied zwischen Saarland und Berlin liegt damit, je nach Fenster, zwischen 7,8 Tonnen [Bootstrap-KI 5,1; 9,7] und 9,7 Tonnen [Bootstrap-KI 8,6; 10,8] CO2 pro Kopf und Jahr. Wir verzichten hier bewusst auf Formulierungen wie "statistisch signifikant": Bei nur drei Bundesländern und fünf bis acht Beobachtungsjahren ist eine klassische Signifikanzsprache irreführend. Punktschätzung und Konfidenzintervall sprechen für sich.

## Drei Dinge, die diese Zahl NICHT bedeutet

**1. Es ist keine Aussage über Lebensstil oder Konsum.** Die UBA-/LAK-Zahlen sind territoriale Produktionsbilanzen: Emissionen werden dort gezählt, wo sie physisch entstehen – am Kraftwerks- oder Industriestandort –, nicht dort, wo die damit hergestellten Güter oder erzeugte Energie am Ende verbraucht werden. Das hohe Saarland-Niveau spiegelt in erster Linie die Standortfunktion für energieintensive Industrie (Stahl, Kraftwerke) wider, nicht den Konsum der dort lebenden Menschen. Umgekehrt erscheint Berlin als Stadtstaat ohne Schwerindustrie und mit importiertem Strom strukturell niedrig – unabhängig vom tatsächlichen Konsumniveau der Berliner Bevölkerung.

**2. Es ist kein Ranking klimapolitischer Leistung.** Diese Analyse trifft keine Kausalaussage über Landesklimapolitik. Der Unterschied zwischen Saarland und Berlin wird primär auf strukturelle Faktoren zurückgeführt – Industriestruktur, Kraftwerksstandorte, die geringe Bevölkerungszahl des Saarlandes als Nenner der Pro-Kopf-Rechnung –, nicht auf unterschiedlich ambitionierte Politik. Ein niedriger Wert für Berlin ist entsprechend kein Beleg für ambitioniertere Klimapolitik.

**3. Bayern als "Brücke" ist ein Hinweis, kein Beweis.** Um besser zu verstehen, wie sich der Saarland-Berlin-Unterschied zusammensetzt, haben wir zusätzlich Bayern als Vergleichspunkt herangezogen: Saarland minus Bayern (überwiegend die "Industrieseite" des Unterschieds) und Bayern minus Berlin (überwiegend die "Stadtstaat-Seite"). Im 5-Jahres-Fenster liegen rund 7,9 der 9,7 Tonnen Unterschied auf der Saarland-Bayern-Seite und rund 1,8 Tonnen auf der Bayern-Berlin-Seite; im 8-Jahres-Fenster verschiebt sich das Verhältnis leicht (5,7 zu 2,1 Tonnen). Wichtig: Bayern ist dabei kein "Mittelding" aus Saarland und Berlin, sondern ein drittes, eigenständiges Setting – großflächig, wirtschaftlich heterogen, ohne Saarlands Montanstruktur und ohne Berlins Stadtstaat-Logik. Der geprüfte Ordering-Check (liegt Bayern zahlenmäßig zwischen den beiden anderen Ländern?) bestätigt zwar die erwartete Reihenfolge in beiden Zeitfenstern – das macht die Zerlegung numerisch sinnvoll, aber die indirekte Schätzung bleibt hypothesengenerierend und ist mit Vorsicht zu interpretieren, nicht als bestätigte Rangfolge.

## Methodik-Box

- **Datenquelle:** Länderarbeitskreis Energiebilanzen (LAK), Indikator "CO2-Emissionen je Einwohner" (Quellenbilanz), Zugriffsdatum 27.08.2026. Primäre Zielgröße ist energiebedingtes CO2 statt THG-Gesamt, da keine harmonisierte Bundesländer-THG-Gesamtreihe öffentlich verfügbar ist (vorab im Analyseplan als Fallback-Fall vorgesehen).
- **Zwei gleichrangige primäre Zeitfenster:** 5 Jahre (2019–2023, durchgehend) und 8 Jahre (2014–2016 + 2019–2023, Lückenjahre 2017/2018 einzeln entfernt) – wegen fehlender Saarland-Daten für 2017/2018. Beide werden vollständig berichtet, keine nachträgliche Auswahl der "günstigeren" Variante.
- **Primäre Unsicherheitsquantifizierung:** Moving-Block-Bootstrap-Konfidenzintervalle (berücksichtigen Autokorrelation durch blockweises Resampling der Residuen). Newey-West-HAC-Konfidenzintervalle werden zusätzlich, aber nur sensitivitätsanalytisch berichtet.
- **Sprachregelung:** Für die zentralen Vergleichszahlen wird bewusst auf "statistisch signifikant" und p-Wert-Schwellenaussagen verzichtet; Konfidenzintervalle stehen für sich.
- **Robustheitsprüfung:** Der Unterschied Saarland–Berlin bleibt über sechs unabhängige Zusatzprüfungen hinweg in ähnlicher Größenordnung (7,8 bis 9,7 Tonnen) – u. a. bei Verwendung der gesamten verfügbaren Zeitreihe seit 2010 (8,5 t), eines robusten (nicht-linearen) Trendschätzers (9,5 t), zweier alternativer Brückenländer Hamburg und Rheinland-Pfalz (jeweils 9,7 t) sowie eines um den Berliner Ost-West-Strukturbruch bereinigten Fensters (9,5 t). Kein Vorzeichenwechsel, keine der Prüfungen stellt die Kernaussage infrage.
- **Offener Punkt:** Die verwendete LAK-Reihe nutzt die Jahresdurchschnittsbevölkerung als Nenner statt des im Analyseplan primär vorgesehenen Bevölkerungsstands zum 31.12. Ein direkter Test dieser Konvention (Sensitivitätsanalyse S3) konnte mangels Netzwerkzugriff in der Analyseumgebung nicht durchgeführt werden. Die Analyst:innen halten das Risiko einer Ergebnisumkehr angesichts der Größenordnung des Effekts für gering, betonen aber, dass dies eine ungeprüfte Plausibilitätsannahme bleibt – eine offene Rückfrage, die vor einer inhaltlichen Interpretation dieses Punkts geklärt werden sollte.
- **Validierungsstatus:** Analyseplan Version 1.1 (Amendment zu v1.0), Status final, freigegeben am 28.08.2026. Unabhängige Validierung: "Freigegeben mit einer geringfügigen, nicht blockierenden Auflage" (eine rein redaktionelle Dokumentationsergänzung, keine inhaltliche Einschränkung der berichteten Zahlen).

## Grenzen

Diese Analyse vergleicht drei bewusst gewählte, strukturell extreme Bundesländer – keine Zufallsstichprobe aus allen 16 Ländern, keine Übertragbarkeit auf andere Länderpaare. Sie trifft keine Kausalaussage über Politikmaßnahmen. Witterungs- und Konjunktureffekte (z. B. Heizgradtage, Industrieauslastung) werden nicht separat herausgerechnet und können Jahr-zu-Jahr-Schwankungen erklären, die fälschlich als Trend gelesen werden könnten. Für das Saarland im 8-Jahres-Fenster zeigen die Modell-Residuen zudem ein Muster, das auf einen möglichen lokalen Strukturunterschied rund um die Datenlücke 2017/2018 hindeutet – ein Hinweis auf mögliche Nichtlinearität, kein Grund, die Größenordnung des Ergebnisses infrage zu stellen.

---

*Vollständige Analyse, Code, Rohdaten und Validierungsbericht: [Link zum Repository – von der Redaktion vor Veröffentlichung zu ergänzen]*
