# Statistischer Analyseplan (SAP)

**Titel:** Ist der Hitzesommer 2026 statistisch außergewöhnlich im Vergleich zur
jüngeren deutschen Historie hitzebedingter Sterbefälle, oder liegt er innerhalb
der bekannten Schwankungsbreite (metaanalytisch geschätztes
Prädiktionsintervall über die historischen Jahresschätzungen)?

**Version:** 1.1 (final)
**Status:** final
**Datum (Entwurf v1.0):** 28.08.2026
**Datum (Überarbeitung v1.1):** 28.08.2026
**Autor:in:** sap-autor-Subagent
**Freigabe/Einfrieren:** Daniel Saure   Datum: 28.08.2026

**Versionshistorie:**
- **v1.0 (28.08.2026):** Erstentwurf, präregistriert vor Datenzugriff. Vier
  offene Rückfragen an den Menschen formuliert (u. a. zur Zielgröße/
  Altersstandardisierung und zu bekannten Methodikbrüchen).
- **v1.1 (28.08.2026):** Rückfragen 3 und 4 durch den Menschen beantwortet.
  Änderungen ausschließlich in Abschnitt 8.1 (konkreter Hinweis auf eine
  bekannte Abweichung der 2018er-Schätzung zwischen Quellen; präzisierte
  Trigger-Bedingung für Sensitivitätsfenster S1c), Abschnitt 8.2
  (Alterungs-Confounder von "theoretische Möglichkeit" zu "wahrscheinlich
  real relevant" gestärkt, da die RKI-Zielgröße nach aktuellem Kenntnisstand
  eine absolute, nicht altersstandardisierte Fallzahl ist) sowie
  entsprechenden Folgeanpassungen in Abschnitt 3 (Struktur-Check), Abschnitt 4
  (S1c-Trigger) und Abschnitt 9 (Limitationen). Kein Datenzugriff, keine
  Ergebnisse gesichtet — Status bleibt **draft**, SAP ist noch **nicht**
  eingefroren.
- **v1.1, finale Überarbeitung vor Einfrieren (28.08.2026):** Rückfragen 1 und
  2 durch den Menschen beantwortet. **Rückfrage 1:** Für 2026 liegt eine
  vorläufige, unterjährige RKI-Schätzung vor — das RKI veröffentlicht während
  der Sommermonate (Juni–September) wöchentlich einen "Wochenbericht zur
  hitzebedingten Mortalität"; als Datengrundlage ist der zum Analysezeitpunkt
  aktuellste verfügbare Wochenbericht zu verwenden, mit zwingender
  Dokumentation von Kalenderwoche und Berichtsdatum sowie explizitem
  Vorläufigkeits-Hinweis. **Rückfrage 2:** als vorab festgelegte, bedingte
  Entscheidungsregel formuliert (kein weiterhin offener Punkt) — primär wird
  Sicherheitsniveau/Form des RKI-Unsicherheitsintervalls im Struktur-Check
  ausschließlich anhand der RKI-Primärquelle (PDF-Wochenbericht, Tabelle 1
  bzw. Methodik-Anhang, edoc.rki.de) bestimmt; falls das RKI für die
  wöchentliche 2026-Schätzung kein formales Unsicherheitsintervall publiziert
  (Fallback), wird SE₂₀₂₆ ersatzweise aus der empirischen Standardabweichung
  der historischen Punktschätzer θ̂ᵢ abgeleitet und im Ergebnisbericht
  explizit als schwächere Evidenzgrundlage gekennzeichnet. Änderungen in
  Abschnitt 0 (ergänzender Hinweis), Abschnitt 2 (Vergleichbarkeitshinweis
  vorläufig vs. final), Abschnitt 3 (Schritt 3 und Schritt 4), Abschnitt 5.1
  (SE₂₀₂₆-Anmerkung), Abschnitt 5.4 (Fallback-Bullet), Abschnitt 8 (neuer
  Unterpunkt 8.5), Abschnitt 9 (konkretisierte/ergänzte Limitationen) und
  Abschnitt 11 (Pflichtangabe zu Kalenderwoche/Berichtsdatum). Alle vier
  ursprünglich offenen Rückfragen (Abschnitt 12) sind damit inhaltlich
  beantwortet — kein Datenzugriff, keine Ergebnisse gesichtet. Diese
  inhaltliche Überarbeitung wurde vom sap-autor-Subagenten vorgenommen.
- **Einfrieren (28.08.2026):** SAP von Daniel Saure geprüft und freigegeben.
  Status draft → **final**. Version bleibt 1.1. Keine weiteren inhaltlichen
  Änderungen gegenüber der finalen Überarbeitung oben.

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

**Ausdrücklicher Hinweis zur Auftragsprüfung:** Der Auftrag für diesen SAP
enthielt keine Analyseergebnisse, Zahlen, Tabellen oder Grafiken aus den
RKI-Hitzesterblichkeitsdaten selbst — lediglich eine methodische Vorgabe
("wie eine Metaanalyse behandeln") sowie drei zwingend zu berücksichtigende
Diskussionspunkte (Methodikbrüche, Bevölkerungsalterung, keine
Politikbewertung). Diese methodischen Vorgaben sind keine Ergebnissichtung im
Sinne von Abschnitt 0 und entwerten die Präregistrierung nicht. Dieser SAP
wurde ohne Sichtung von Rohdaten, Punktschätzern, Konfidenzintervallen oder
Grafiken der RKI-Reihe verfasst. Auch die in v1.1 ergänzten Antworten auf
Rückfrage 3 (Zielgrößen-Charakteristik laut RKI-Berichtsmethodik) und
Rückfrage 4 (bekannte Quellenabweichung für 2018) sind methodische bzw.
quellenkritische Hinweise, keine Sichtung der hier zu analysierenden
Punktschätzer/Konfidenzintervalle der historischen Reihe oder von 2026 — sie
entwerten die Präregistrierung ebenfalls nicht. Gleiches gilt für die in der
finalen Überarbeitung von v1.1 ergänzten Antworten auf Rückfrage 1
(Publikationspraxis des RKI-Wochenberichts als struktureller/prozeduraler
Fakt) und Rückfrage 2 (eine vorab festgelegte, bedingte Entscheidungsregel für
den Struktur-Check, nicht das Ergebnis dieses Struktur-Checks selbst): Beides
sind methodische bzw. prozedurale Klärungen, keine Sichtung der eigentlichen
Punktschätzer, Konfidenzintervalle oder Berichtsinhalte der RKI-Reihe.

Sollte sich beim Freigabeprozess herausstellen, dass entgegen dieser
Einschätzung doch bereits Zahlen oder Grafiken vorlagen oder in den Auftrag
eingeflossen sind, ist der Status zwingend auf "Exploratorisch (retrospektiv)"
zu ändern und die Präregistrierung als ungültig zu kennzeichnen.

---

## 1. Hintergrund / Rationale

Nach ungewöhnlich heißen Sommermonaten entsteht in der öffentlichen
Debatte regelmäßig schnell die Zuspitzung "das war der heißeste/tödlichste
Sommer aller Zeiten" oder umgekehrt "das war doch nichts Besonderes" — beides
oft auf Basis eines einzelnen Punktschätzers ohne Einordnung in die
natürliche Jahr-zu-Jahr-Schwankungsbreite. Das Robert Koch-Institut (RKI)
veröffentlicht jährliche Schätzungen hitzebedingter Sterbefälle (Punktschätzer
plus Unsicherheitsintervall), die u. a. über klimadashboard.de öffentlich
zugänglich sind. Diese Reihe erlaubt eine deutlich präzisere Einordnung als
der bloße Vergleich von Punktschätzern.

Die Lücke gegenüber gängigen Darstellungen: (a) eine explizite, vorab
festgelegte Definition von "außergewöhnlich" statt einer intuitiven,
nachträglichen Einschätzung; (b) eine Berücksichtigung der Unsicherheit jeder
einzelnen Jahresschätzung (nicht nur der Punktschätzer) bei der Bestimmung der
"typischen" Schwankungsbreite; (c) eine explizite Prüfung, ob die historischen
Jahre überhaupt als austauschbare Ziehungen aus derselben Verteilung
behandelt werden dürfen (Heterogenitätsprüfung) oder ob ein Trend vorliegt,
der eine statische Schwankungsbreite verzerren würde; (d) eine vorab
festgelegte, strikt statistische (nicht kausale/politische) Interpretation des
Ergebnisses.

Der Auftraggeber hat explizit vorgegeben, die Jahresschätzungen wie
Einzelstudien in einer Metaanalyse zu behandeln. Dieser SAP setzt das um: ein
Random-Effects-Modell über die historischen Jahre liefert eine gepoolte
"typische" Schätzung sowie ein Prädiktionsintervall, in das 2026 eingeordnet
wird.

## 2. Fragestellung (Estimand)

**Zielgröße je Jahr *i*:** Vom RKI geschätzte Anzahl hitzebedingter
Sterbefälle in Deutschland im Jahr *i* (Punktschätzer θ̂ᵢ) mit zugehörigem
publiziertem Unsicherheitsintervall [Lᵢ, Uᵢ]. Welches Sicherheitsniveau (z. B.
95 %) und welche Definition (Kalenderjahr vs. Sommermonate Juni–August; welche
Attributionsmethodik) dem publizierten Intervall zugrunde liegt, wird als
**erster dokumentierter Schritt** (Struktur-Check der Datenquelle, Abschnitt 3)
festgestellt, bevor irgendeine Modellschätzung erfolgt.

**Zieljahr (zu bewertende Beobachtung):** 2026.

**Vergleichbarkeitshinweis 2026 vs. historische Reihe (finale Überarbeitung
vor Einfrieren):** Die für 2026 verwendete RKI-Schätzung stammt aus einem
**unterjährigen (in-season) Wochenbericht** zur hitzebedingten Mortalität —
das RKI veröffentlicht während der Sommermonate (Juni–September) wöchentlich
einen solchen Bericht, und als Datengrundlage ist der zum Analysezeitpunkt
aktuellste verfügbare Wochenbericht zu verwenden (siehe Abschnitt 3, Schritt
4). Diese 2026-Schätzung ist damit explizit **vorläufig** und wird im
Verlauf der Saison voraussichtlich noch revidiert. Die historischen
Referenzjahre (Reihe bis 2025, Abschnitt 4) sind demgegenüber nach aktuellem
Kenntnisstand **abgeschlossene, finale Jahresschätzungen**. Der Vergleich des
θ̂₂₀₂₆-Wertes (vorläufig, unterjährig) mit dem aus finalen Jahreswerten
geschätzten Prädiktionsintervall ist damit **kein Vergleich strikt
gleichartiger Größen** — dieser Unterschied ist keine bloße Nebensächlichkeit,
sondern eine eigenständige Vergleichbarkeits-Einschränkung, die in jeder
Ergebnisdarstellung explizit benannt werden muss (nicht implizit "Äpfel mit
Äpfeln" suggerieren; siehe Abschnitt 9 und Abschnitt 11).

**Historisches Referenzfenster (Primär, siehe Abschnitt 4):** alle Jahre der
RKI-Reihe mit vorliegendem Punktschätzer UND Unsicherheitsintervall, vom
frühesten verfügbaren Jahr bis einschließlich 2025 (jüngstes vollständig
abgeschlossenes Jahr vor dem Zieljahr). 2026 selbst geht **nicht** in die
Schätzung der "typischen" Schwankungsbreite ein (kein zirkuläres
Leave-2026-in-Design).

**Modellrahmen (metaanalytisch, wie vom Auftraggeber vorgegeben):** Die
historischen Jahresschätzungen θ̂ᵢ (i = 1…k, k = Anzahl historischer Jahre im
jeweiligen Fenster) werden als "Studien" eines Random-Effects-Modells
behandelt:

θ̂ᵢ = μ + uᵢ + eᵢ, uᵢ ~ N(0, τ²), eᵢ ~ N(0, SEᵢ²)

mit μ = gepoolter "typischer" Effekt, τ² = Zwischen-Jahres-Heterogenität, SEᵢ
= aus dem publizierten Unsicherheitsintervall zurückgerechneter Standardfehler
(Abschnitt 5.1). **Dies ist explizit eine Modellierungsanalogie, keine
Behauptung, dass Kalenderjahre im Sinne einer klassischen Metaanalyse
unabhängige Studien mit Zufallsstichprobenziehung sind** (siehe Limitationen,
Abschnitt 9).

**Primärer Estimand (präzise Formulierung für Reproduzierbarkeit):**
"Liegt der publizierte RKI-Punktschätzer der hitzebedingten Sterbefälle 2026
innerhalb oder außerhalb des 95 %-Prädiktionsintervalls, das aus einem
Random-Effects-Modell (REML-τ²-Schätzer, Hartung-Knapp-Sidik-Jonkman-adjustierte
Inferenz für μ̂, Higgins-Thompson-Spiegelhalter-Prädiktionsintervall-Formel)
über alle historischen RKI-Jahresschätzungen 2003(oder frühestes verfügbares
Jahr)–2025 geschätzt wird — und wie groß ist die standardisierte Abweichung
(z-Score) des 2026-Schätzers vom gepoolten historischen Mittel μ̂?"

**Sekundärer/ergänzender Estimand:** Heterogenitätsmaße der historischen
Jahresreihe selbst (Cochran's Q, I², τ̂², jeweils mit Konfidenzintervall) als
eigenständige, vorab benannte Ergebnisgröße — unabhängig davon, wie 2026
ausfällt, weil sie beschreibt, wie breit die "bekannte Schwankungsbreite"
überhaupt ist.

Diese Formulierung ist so gewählt, dass zwei unabhängige Analyst:innen mit
diesem SAP zu identischem Modell, identischem primären Zeitfenster und
identischer Klassifikationsregel gelangen.

## 3. Datenquelle

- Quelle: Robert Koch-Institut (RKI), Schätzungen hitzebedingter Sterbefälle,
  bereitgestellt/aggregiert u. a. über klimadashboard.de.
- Zugriffsdatum: [wird vom Analyst-Subagenten beim tatsächlichen Datenzugriff
  eingetragen]
- Datenstand laut Quelle: [wird beim Datenzugriff dokumentiert]
- **Erster dokumentierter Schritt vor jeder Modellschätzung (Struktur-Check,
  analog zum Vorgehen in den Referenzprojekten
  `Analysen/2026-08-thg-laendervergleich/` und `Analysen/2026-08-emissionen/`):**
  1. Frühestes und spätestes verfügbares Jahr der Reihe feststellen.
  2. Exakte Definition der Zielgröße feststellen (Kalenderjahr vs.
     Sommer-/Hitzeperiodendefinition; ob "hitzebedingte Sterbefälle" ein
     attributionsbasierter Modellschätzer ist, z. B. exzess-mortalitätsbasiert
     mit Temperatur-Kovariate) **und ob die Zielgröße eine absolute Fallzahl
     oder eine altersstandardisierte Größe ist** (siehe Abschnitt 8.2 —
     nach aktuellem Kenntnisstand: absolute, nicht altersstandardisierte
     Fallzahl; formale Bestätigung ist Teil dieses Schritts).
  3. Sicherheitsniveau und Art des publizierten Unsicherheitsintervalls
     feststellen (z. B. 95 %-Unsicherheitsintervall, symmetrisch/asymmetrisch
     um den Punktschätzer, Bootstrap- oder analytisch hergeleitet), **jeweils
     ausschließlich anhand der RKI-Primärquelle** (PDF-Wochenbericht bzw.
     Jahresbericht, Tabelle 1 bzw. Methodik-Anhang, publiziert unter
     edoc.rki.de) — **nicht** anhand von Sekundärquellen,
     Dashboard-Visualisierungen oder Zusammenfassungen Dritter. Dies bestimmt
     gemäß Abschnitt 5.1 den korrekten z-Faktor bzw. die CI-zu-SE-
     Rückrechnung; weicht das Sicherheitsniveau von 95 % ab, wird dies
     dokumentiert und der z-Faktor entsprechend angepasst (keine
     stillschweigende Annahme von 95 %).

     **Vorab festgelegte, bedingte Entscheidungsregel speziell für die
     2026-Schätzung (finale Überarbeitung, ersetzt die frühere offene
     Rückfrage 2):**
     - **Primärer Fall:** Publiziert das RKI im verwendeten Wochenbericht ein
       formales Unsicherheitsintervall für die 2026-Schätzung, werden
       Sicherheitsniveau und Form (symmetrisch/asymmetrisch) aus dieser
       Primärquelle dokumentiert; die CI-zu-SE-Rückrechnung für SE₂₀₂₆ erfolgt
       analog zu Abschnitt 5.1, Schritt 1 (ggf. mit angepasstem z bei
       abweichendem Sicherheitsniveau).
     - **Fallback-Fall:** Publiziert das RKI für die wöchentliche/vorläufige
       2026-Schätzung **kein** formales Unsicherheitsintervall, wird als
       vorab festgelegter Ersatz die empirische Standardabweichung der
       historischen Punktschätzer θ̂ᵢ (über das jeweils verwendete
       Analysefenster, primär: vollständige historische Reihe bis 2025) als
       Ersatz-Standardfehler verwendet: SE₂₀₂₆ = sd(θ̂ᵢ), i = 1…k historische
       Jahre im jeweiligen Fenster. Dieser Fallback wird im Ergebnisbericht
       **explizit und unübersehbar als schwächere Evidenzgrundlage**
       gekennzeichnet, da er die tatsächliche Schätzunsicherheit des
       RKI-Wochenberichts (z. B. saisonal-frühe Attributions-/
       Modellunsicherheit) nicht abbildet, sondern lediglich die
       Jahr-zu-Jahr-Streuung methodisch anders gearteter (finaler,
       jahresbasierter) historischer Schätzungen (siehe auch Abschnitt 5.1,
       5.4, 8.5 und 9).
  4. Prüfen, ob für 2026 zum Zugriffszeitpunkt eine RKI-Schätzung vorliegt und
     ob diese als vorläufig/endgültig gekennzeichnet ist.
     **Aktualisiert (finale Überarbeitung, ersetzt die frühere offene
     Rückfrage 1):** Es ist bereits jetzt bekannt, dass für 2026 eine
     vorläufige RKI-Schätzung aus dem laufenden Wochenbericht zur
     hitzebedingten Mortalität vorliegt; das RKI veröffentlicht während der
     Sommermonate (Juni–September) wöchentlich einen solchen Bericht. Zu
     verwenden ist der zum Analysezeitpunkt aktuellste verfügbare
     Wochenbericht. **Zwingende Dokumentationspflicht:** Das Analyseskript
     hält exakt fest, (a) welche Kalenderwoche (ISO-Woche) und (b) welches
     Berichtsdatum des RKI-Wochenberichts als Grundlage für θ̂₂₀₂₆ diente,
     sowie (c) einen expliziten Hinweis auf die Vorläufigkeit dieser Zahl
     (siehe Abschnitt 9 und Abschnitt 11 für die Konsequenzen im
     Ergebnisbericht).
  5. Prüfen und dokumentieren, ob die Quelle selbst Methodikänderungen/-brüche
     über die Zeitreihe hinweg explizit kennzeichnet (z. B. Wechsel des
     Attributionsmodells, geänderte Referenzperiode für "erwartete" Mortalität,
     überarbeitete Bevölkerungs-/Altersstandardisierung). Ergebnis dieses
     Schritts ist Grundlage für Abschnitt 8.1 und ggf. für das
     Sensitivitätsfenster S1c (Abschnitt 6). **Hinweis (Kontext, v1.1, siehe
     8.1):** Bereits vor Datenzugriff ist bekannt, dass für mindestens ein
     Jahr (2018) unterschiedliche Schätzwerte zwischen Quellen kursieren
     (aktuell zitiert: rund 9.400; frühere Quellen: rund 8.500); die Ursache
     ist ungeprüft. Dieser Einzelhinweis motiviert die in Schritt 5
     ohnehin vorgesehene Prüfung, ersetzt sie aber nicht: Die vollständige,
     systematische Prüfung **aller** Jahre der Reihe auf Methodikbrüche bzw.
     Quellenabweichungen bleibt der erste dokumentierte Schritt des
     Analyst-Subagenten (kein SAP-Bestandteil, kein hier vorweggenommenes
     Ergebnis).
- Dokumentationsanforderung bei behauptetem gescheitertem Zugriff auf externe
  Quellen (konsistent mit dem im Referenzprojekt
  `Analysen/2026-08-thg-laendervergleich/` etablierten Standard): Eine
  Behauptung eines gescheiterten automatisierten Zugriffsversuchs ist nur
  zulässig, wenn sie mit einem nachprüfbaren Artefakt (Log, Zeitstempel,
  Fehlermeldung, Code-Pfad) belegt wird; andernfalls ist ehrlich zu
  formulieren "nicht versucht, da kein Netzwerkzugriff verfügbar".

## 4. Analysepopulation

- **Analyseeinheit:** Kalenderjahr (bzw. die von der RKI-Reihe verwendete
  Jahresdefinition, siehe Struktur-Check Abschnitt 3), mit je einem
  Punktschätzer und einem Unsicherheitsintervall hitzebedingter Sterbefälle in
  Deutschland (Gesamtbevölkerung, keine Alters-/Regionsstratifizierung als
  primäre Zielgröße).
- **Zu bewertende Beobachtung:** 2026.
- **Primäres historisches Referenzfenster:** alle verfügbaren Jahre von
  Reihenbeginn bis einschließlich 2025 (vollständige historische RKI-Reihe,
  2026 ausgeschlossen). Begründung: maximale Präzision der τ²- und μ-Schätzung
  bei einer ohnehin kleinen Anzahl "Studien" (Jahre); entspricht der
  wörtlichen Auftragsvorgabe, die "bekannte Schwankungsbreite" zu schätzen.
- **Vorab festgelegte, gleichrangig zu berichtende Sensitivitäts-Fenster**
  (Abschnitt 6, S1): (a) nur die letzten 10 Jahre vor 2026 ("jüngere
  Historie" im engeren Sinn der Fragestellung), (b) nur die letzten 15 Jahre
  vor 2026, (c) nur Jahre ab dem ersten Jahr nach einem beim Struktur-Check
  (Abschnitt 3) dokumentierten Methodikbruch.
  **Präzisierte Trigger-Bedingung für (c) (v1.1):** Dieses Fenster wird
  aktiviert, wenn der Struktur-Check entweder (i) einen von der Quelle selbst
  explizit benannten Methodikbruch feststellt, **oder** (ii) im Rahmen der
  ohnehin vorgesehenen jahresweisen Prüfung (Abschnitt 3, Schritt 5) eine
  nicht durch bloße Rundung erklärbare Abweichung zwischen unabhängigen
  Quellen für denselben Jahreswert dokumentiert (Beispiel für eine solche
  bereits vor Datenzugriff bekannte Abweichung: 2018, siehe Abschnitt 8.1).
  In beiden Fällen wird als Bruchjahr das früheste Jahr verwendet, für das
  die Abweichung bzw. der Bruch dokumentiert ist. Diese Regel ist
  ergebnisunabhängig vorab festgelegt — sie wählt kein Fenster nachträglich
  nach Sichtung der 2026-Werte, sondern ausschließlich anhand der beim
  Struktur-Check festgestellten Quellenlage/-konsistenz.
- **Mindest-Fallzahl-Regel:** Random-Effects-Prädiktionsintervalle nach
  Higgins-Thompson-Spiegelhalter benötigen k ≥ 3 historische Jahre (df = k−2
  > 0) im jeweiligen Fenster, um überhaupt berechenbar zu sein; ab k < 5 gilt
  das Prädiktionsintervall als **statistisch wenig belastbar** und wird im
  Bericht explizit als solches gekennzeichnet (nicht unterdrückt). Ist k < 3
  in einem Fenster, entfällt das formale Prädiktionsintervall für dieses
  Fenster; stattdessen werden nur Punktschätzer, gepooltes μ̂ (falls
  berechenbar) und deskriptive Min-Max-Spanne berichtet, und die Einschränkung
  wird als offene Rückfrage an den Menschen eskaliert (siehe Ende des
  Dokuments), falls dies das primäre Fenster betrifft.
- **Ausschlusskriterien:** keine inhaltlich motivierten Jahres-Ausschlüsse.
  Einzelne auffällige Jahre (z. B. Extremsommer wie 2003, 2018, 2019, 2022,
  sofern in der Reihe enthalten) werden nicht aus der Primäranalyse entfernt,
  sondern über die in Abschnitt 5.2 spezifizierte Einfluss-/Diagnostik
  transparent gemacht.
- **Fehlende Werte:** Fehlt für ein Jahr innerhalb eines Fensters entweder der
  Punktschätzer oder das Unsicherheitsintervall, wird dieses Jahr für das
  betroffene Fenster ausgeschlossen (keine Imputation); die Anzahl
  ausgeschlossener Jahre wird im Bericht dokumentiert.

## 5. Statistische Methoden

### 5.1 Primäranalyse

**Schritt 1 — Rückrechnung von Unsicherheitsintervall auf Standardfehler
(primär):** Für jedes historische Jahr i wird der Standardfehler auf der
Originalskala (Anzahl Sterbefälle) linear aus dem publizierten
Unsicherheitsintervall zurückgerechnet:

SEᵢ = (Uᵢ − Lᵢ) / (2 · z), mit z = 1,959964 falls das Unsicherheitsintervall
laut Struktur-Check (Abschnitt 3) ein symmetrisches 95 %-Intervall ist;
andernfalls wird z gemäß dem tatsächlich dokumentierten Sicherheitsniveau
angepasst. Ist das Intervall erkennbar asymmetrisch um den Punktschätzer,
wird dies dokumentiert und in Abschnitt 6 (S3) zusätzlich eine
log-Skalen-Variante gerechnet.

**Anmerkung zu SE₂₀₂₆ (finale Überarbeitung):** Der Standardfehler des
2026-Schätzers selbst (benötigt für den z-Score in Schritt 5) folgt derselben
primär/Fallback-Logik, die in Abschnitt 3, Schritt 3, für die 2026-Schätzung
vorab festgelegt ist: **primär** wird SE₂₀₂₆ — analog zur SEᵢ-Formel oben —
aus dem im verwendeten RKI-Wochenbericht publizierten Unsicherheitsintervall
zurückgerechnet (ggf. mit angepasstem z bei abweichendem Sicherheitsniveau);
**falls** das RKI für die wöchentliche 2026-Schätzung kein formales
Unsicherheitsintervall publiziert, wird ersatzweise SE₂₀₂₆ = sd(θ̂ᵢ) der
historischen Punktschätzer im jeweiligen Analysefenster verwendet (Fallback,
explizit als schwächere Evidenzgrundlage gekennzeichnet; siehe Abschnitt 3,
5.4, 8.5 und 9).

**Schritt 2 — Random-Effects-Modell (primär: REML):** Über alle Jahre i des
jeweiligen Fensters (primär: vollständige historische Reihe bis 2025, siehe
Abschnitt 4) wird ein Random-Effects-Modell mit REML-Schätzer für τ² gefittet
(Standardverfahren, z. B. `metafor::rma(method="REML")`). Für die Inferenz
über μ̂ wird primär die Hartung-Knapp-Sidik-Jonkman-(HKSJ-)Anpassung
verwendet (empfohlen bei kleiner Studienzahl k, wie hier vorliegend).

**Schritt 3 — Heterogenitätsmaße (immer berichtet, unabhängig vom Ergebnis):**
Cochran's Q (mit p-Wert), I² (mit 95 %-CI, z. B. nach Higgins & Thompson),
τ̂² (mit CI).

**Schritt 4 — 95 %-Prädiktionsintervall (primäre Klassifikationsgrundlage):**
PI = μ̂ ± t_{k−2; 0,975} · √(τ̂² + SE(μ̂)²), nach Higgins, Thompson & Spiegelhalter
(2009). Dieses Intervall quantifiziert die aus der historischen Reihe
geschätzte "bekannte Schwankungsbreite" eines künftigen Einzeljahres.

**Schritt 5 — Klassifikation und Effektgröße für 2026 (primäres Ergebnis):**
- Deskriptive Klassifikation: Liegt der RKI-Punktschätzer 2026 (θ̂₂₀₂₆)
  innerhalb oder außerhalb von PI?
- Standardisierte Abweichung (kontinuierliches Maß, ergänzend zur
  binären Klassifikation, um Grenzfälle nicht allein binär zu behandeln):
  z₂₀₂₆ = (θ̂₂₀₂₆ − μ̂) / √(τ̂² + SE(μ̂)² + SE₂₀₂₆²)
  Dieses Maß berücksichtigt zusätzlich zur Prädiktionsintervall-Varianz die
  eigene Schätzunsicherheit des 2026-Werts (SE₂₀₂₆), da 2026 selbst eine mit
  Unsicherheit behaftete Schätzung und keine fehlerfreie Beobachtung ist.

**Primär vs. sensitivitätsanalytisch (siehe auch Abschnitt 6):**
- **Primär:** historisches Fenster = vollständige Reihe bis 2025; τ²-Schätzer
  = REML; Inferenz über μ̂ = HKSJ; SE-Rückrechnung = linear auf
  Originalskala; Modell = Random-Effects (kein Trend-Term).
- Alle übrigen Varianten (andere Fenster, andere τ²-Schätzer, log-Skala,
  Fixed-Effect-Modell, trend-adjustiertes Meta-Regressionsmodell) sind
  explizit sensitivitätsanalytisch (Abschnitt 6) und ersetzen die
  Primäranalyse nicht.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Das Random-Effects-Modell setzt voraus, dass die historischen
Jahresschätzungen austauschbare Ziehungen aus derselben zeitlich stabilen
Verteilung N(μ, τ²) sind ("Exchangeability"). Diese Annahme ist bei einer
Zeitreihe (im Gegensatz zu klassischen Metaanalyse-Studien aus
unterschiedlichen, zeitlich ungeordneten Settings) nicht selbstverständlich
und wird daher explizit geprüft:

- **Trendprüfung (zentrale Diagnostik, siehe auch 8.1/9):** Meta-Regression der
  historischen Jahresschätzungen auf das Kalenderjahr (θ̂ᵢ = β0 + β1·Jahrᵢ + uᵢ
  + eᵢ, gleiche Gewichtung wie im Random-Effects-Modell). Nullhypothese β1 = 0
  wird getestet (α = 0,05). Ein signifikanter Trend ist ein Hinweis darauf,
  dass die historischen Jahre NICHT als stationär-austauschbar behandelt
  werden dürfen — dies kann sowohl einen realen zeitlichen Trend (z. B.
  Erwärmung, siehe Abschnitt 8) als auch einen Methodik-/Erfassungsbruch
  widerspiegeln (Abschnitt 8.1); der Test selbst unterscheidet diese
  Ursachen nicht.
- **Autokorrelation der Jahres-zu-Jahr-Abweichungen:** Durbin-Watson-Test auf
  den Residuen des Trend-Meta-Regressionsmodells (Schritt oben), um zu
  prüfen, ob aufeinanderfolgende Jahre systematisch ähnlicher sind als durch
  Zufall erwartet (z. B. mehrjährige Hitzeperioden/Klimamuster), was die
  Unabhängigkeitsannahme des Random-Effects-Standardmodells zusätzlich zur
  reinen Trendfrage verletzen würde.
- **Normalität der (studentisierten) Residuen des Random-Effects-Modells:**
  Shapiro-Wilk-Test sowie visuelle QQ-Plot-Prüfung — relevant, weil die
  Prädiktionsintervall-Formel in Schritt 4 (5.1) Normalität der
  Zufallseffekte uᵢ voraussetzt.
- **Einfluss-/Ausreißerdiagnostik:** Leave-one-out-Neuschätzung von μ̂, τ̂² und
  I² (jedes historische Jahr einzeln ausgeschlossen) sowie
  standardisierte/studentisierte Residuen je Jahr, um zu prüfen, ob ein
  einzelnes historisches Jahr (z. B. ein bereits bekannter Extremsommer) die
  Heterogenitätsschätzung dominiert. Auffällige Jahre werden benannt, aber
  nicht automatisch aus der Primäranalyse entfernt.

### 5.3 Korrektur bei Annahmenverletzung

- **Bei signifikantem Trend (5.2, α = 0,05) oder visuell/statistisch
  erkennbarer Autokorrelation:** Das statische (trendfreie)
  Prädiktionsintervall aus 5.1 bleibt primär (dies entspricht wörtlich der
  Auftragsvorgabe, die "typische Schwankungsbreite" zu schätzen), wird aber im
  Bericht explizit als **potenziell verzerrt** gekennzeichnet (zu breit oder
  zu eng, je nach Trendrichtung — ein positiver Trend würde ein statisches PI
  tendenziell zu weit nach oben ausdehnen und 2026 dadurch fälschlich als
  "noch normal" erscheinen lassen). Als verpflichtende (nicht optionale)
  Sensitivitätsanalyse wird in diesem Fall zusätzlich das trend-adjustierte
  Meta-Regressions-Prädiktionsintervall (Abschnitt 6, S5) berechnet und
  **gleichrangig neben** dem primären Ergebnis dargestellt, nicht als dessen
  Ersatz.
- **Bei signifikanter Normalitätsabweichung der Residuen:** zusätzliche
  Berichterstattung eines verteilungsfreien Prädiktionsintervalls (z. B.
  empirisches Perzentil-Intervall der historischen Residuen oder
  Bootstrap-basiertes Prädiktionsintervall) als Sensitivitätsanalyse
  (Abschnitt 6, S6); die REML-basierte Normal-Approximation bleibt primär,
  wird aber als möglicherweise unpräzise gekennzeichnet.
- **Bei dominierendem Einzeljahr-Einfluss (Leave-one-out zeigt große
  Verschiebung von μ̂ oder I² bei Entfernen eines einzelnen Jahres):** keine
  automatische Entfernung; stattdessen wird die Leave-one-out-Tabelle
  vollständig im Anhang berichtet (Abschnitt 6, S7) und im Text explizit
  benannt.

### 5.4 Unsicherheitsquantifizierung

- **Primär:** 95 %-Prädiktionsintervall nach Higgins-Thompson-Spiegelhalter
  (Formel siehe 5.1, Schritt 4), auf Basis von REML-τ̂² und HKSJ-Inferenz für
  μ̂.
- **Sensitivitätsanalytisch:** (a) Prädiktionsintervall auf Basis
  alternativer τ²-Schätzer (DerSimonian-Laird, Paule-Mandel), (b)
  Wald-basierte Inferenz für μ̂ ohne HKSJ-Anpassung, (c) verteilungsfreies
  (Bootstrap-/Perzentil-)Prädiktionsintervall bei Normalitätsverletzung, (d)
  trend-adjustiertes Konfidenzband aus der Meta-Regression (5.3).
- **Fallback bei fehlendem RKI-Unsicherheitsintervall für 2026 (finale
  Überarbeitung, siehe Abschnitt 3, Schritt 3, und Abschnitt 5.1):** Ist für
  die verwendete 2026-Wochenbericht-Schätzung kein formales
  RKI-Unsicherheitsintervall verfügbar, wird SE₂₀₂₆ — ausschließlich für den
  z-Score in 5.1, Schritt 5, benötigt — ersatzweise aus der empirischen
  Standardabweichung der historischen Punktschätzer im jeweiligen Fenster
  abgeleitet (SE₂₀₂₆ = sd(θ̂ᵢ)). Dieser Ersatzwert wird im Bericht explizit als
  schwächere, nicht auf der tatsächlichen Schätzunsicherheit des
  Wochenberichts beruhende Evidenzgrundlage gekennzeichnet (siehe Abschnitt
  8.5 und 9). Das primäre 95 %-Prädiktionsintervall selbst (Klassifikations-
  grundlage) ist von diesem Fallback nicht betroffen, da es ausschließlich
  auf den historischen Jahresschätzungen basiert.

### 5.5 Signifikanzniveau

α = 0,05, zweiseitig, für die diagnostischen Tests (Trend-Test, Q-Test,
Durbin-Watson, Shapiro-Wilk). Für die primäre Klassifikation von 2026
("innerhalb/außerhalb PI") wird **keine** klassische Signifikanzsprache
verwendet, da es sich um die Einordnung einer einzelnen neuen Beobachtung in
ein Prädiktionsintervall handelt, nicht um einen klassischen
Hypothesentest mit kontrollierter Fehlerrate über wiederholte Stichproben.
Berichtet werden Punktschätzer, Prädiktionsintervall-Grenzen und der
z-Score (5.1, Schritt 5) deskriptiv; "statistisch signifikant
außergewöhnlich" wird nicht verwendet. Dies ist konsistent mit der im
Referenzprojekt `Analysen/2026-08-thg-laendervergleich/` (Amendment v1.1)
etablierten Sprachregelung bei kleinen Fallzahlen.

## 6. Sensitivitätsanalysen

Alle folgenden Varianten werden vorab festgelegt, vollständig durchgeführt und
zusätzlich zur Primäranalyse berichtet — unabhängig davon, ob sie das primäre
Ergebnis bestätigen:

1. **S1 — Alternative historische Zeitfenster:** (a) letzte 10 Jahre vor 2026,
   (b) letzte 15 Jahre vor 2026, (c) Jahre ab dem ersten Jahr nach einem beim
   Struktur-Check dokumentierten Methodikbruch bzw. einer dokumentierten
   Quellenabweichung (präzisierte Trigger-Bedingung siehe Abschnitt 4).
2. **S2 — Alternative τ²-Schätzer:** DerSimonian-Laird (klassischer
   Standardschätzer) und Paule-Mandel, jeweils anstelle von REML, mit
   identischer HKSJ-Inferenz für μ̂.
3. **S3 — Log-Skalen-SE-Konversion:** Rückrechnung von SEᵢ auf der
   natürlichen-Logarithmus-Skala (relevant bei rechtsschiefen,
   nicht-negativen Sterbefallzahlen und/oder erkennbar asymmetrischen
   Unsicherheitsintervallen), Rücktransformation von μ̂ und PI auf die
   Originalskala.
4. **S4 — Fixed-Effect-(Common-Effect-)Modell:** zum Vergleich, wie stark die
   Berücksichtigung von Heterogenität (τ²) das Ergebnis gegenüber einem
   naiven, varianzgewichteten Modell ohne Zwischen-Jahres-Streuung verändert.
5. **S5 — Trend-adjustierte Meta-Regression:** Jahr als Moderator (siehe
   5.2/5.3); bedingtes Prädiktionsintervall für 2026 unter Fortschreibung des
   geschätzten linearen Trends. Wird immer berechnet und berichtet, ist aber
   bei signifikantem Trend gemäß 5.3 als besonders zu beachten
   gekennzeichnet.
6. **S6 — Verteilungsfreies Prädiktionsintervall:** empirisches
   Perzentil-Intervall bzw. Bootstrap-basiertes Prädiktionsintervall der
   historischen Jahreswerte, unabhängig vom Ausgang des
   Shapiro-Wilk-Tests immer zusätzlich berichtet.
7. **S7 — Leave-one-out-Robustheit:** vollständige Tabelle von μ̂, τ̂², I² und PI
   bei jeweils einem ausgeschlossenen historischen Jahr.
8. **S8 — HKSJ vs. Standard-Wald-Inferenz für μ̂:** Vergleich der Präzision/
   Breite der Konfidenz- bzw. Prädiktionsintervalle mit und ohne
   HKSJ-Anpassung.

## 7. Umgang mit Mehrfachtestung / Multiplizität

Der primäre Estimand besteht aus **einer** Klassifikation (2026
innerhalb/außerhalb des primären 95 %-Prädiktionsintervalls) plus einem
ergänzenden kontinuierlichen z-Score — keine Familie multipler formaler
Hypothesentests im klassischen Sinn, daher ist keine
Holm-Bonferroni-Korrektur o. Ä. für die primäre Klassifikation selbst
anzuwenden. Die diagnostischen Tests aus 5.2 (Trend-Test, Q-Test,
Durbin-Watson, Shapiro-Wilk) sind Modellannahmen-Prüfungen, keine
inhaltlichen Hypothesentests, und werden ebenfalls ohne
Multiplizitätskorrektur, aber vollständig und unabhängig vom Ergebnis
berichtet.

Um Cherry-Picking über die in Abschnitt 6 aufgeführten acht
Sensitivitätsvarianten (S1–S8, teils mit mehreren Untervarianten) zu
verhindern: **alle** Varianten werden in einer vollständigen Anhangstabelle
mit Klassifikation und z-Score berichtet, unabhängig davon, welche Variante
die "auffälligste" oder "unauffälligste" Einordnung von 2026 ergibt. Die
Primärvariante aus Abschnitt 5.1 ist bindend für die Hauptaussage des
Ergebnisberichts; keine nachträgliche Umdeklarierung einer
Sensitivitätsvariante zur Hauptaussage nach Sichtung der Ergebnisse.

## 8. Interpretationsrahmen / Confounder

*Hinweis zur Anwendbarkeit der Standard-Unterpunkte dieses Abschnitts:* Diese
Analyse ist kein Regionen-/Länder-Vergleich, sondern ein Zeitreihen-/
Jahres-Vergleich innerhalb Deutschlands. Die Standardpunkte
"Produktions-vs.-Konsum-Perspektive" und "Transitivitätsannahme bei
Netzwerk-Vergleichen" aus der SAP-Vorlage sind hier **nicht anwendbar** (kein
regionaler Bilanzierungs-Unterschied, kein Brückenkomparator) und werden
daher nicht weiter ausgeführt. Stattdessen werden die drei vom Auftraggeber
zwingend vorgegebenen Diskussionspunkte hier vorab (nicht erst beim Schreiben
des Ergebnistexts) verbindlich festgelegt.

### 8.1 Methodikbrüche der RKI-Schätzung als Confounder

Die RKI-Schätzmethodik für hitzebedingte Sterbefälle kann sich über die Jahre
der historischen Reihe geändert haben (z. B. Änderungen am
Attributionsmodell, an der Referenzperiode für "erwartete" Mortalität, an der
Alters-/Bevölkerungsstandardisierung, oder an der Abgrenzung "hitzebedingt"
vs. "hitzeassoziiert"). Ein solcher Methodikbruch kann einen scheinbaren
Trend oder eine scheinbare Ausreißerposition erzeugen, die nicht das
tatsächliche Sterblichkeitsgeschehen widerspiegelt, sondern einen
Rechenverfahrenswechsel.

**Konkreter, bereits vor Datenzugriff bekannter Hinweis (v1.1 — reiner
Kontext, keine vorweggenommene Feststellung eines Befundes oder einer
Ursache):** Für das Jahr 2018 wird aktuell ein Schätzwert von rund 9.400
hitzebedingten Sterbefällen zitiert, während in früheren Quellen eine
niedrigere Zahl (rund 8.500) kursierte. Es liegt damit mindestens ein Jahr
mit einer bekannten nachträglichen Abweichung zwischen Quellen vor; die
Ursache (z. B. Methodenrevision, nachträgliche Korrektur, unterschiedliche
Attributionsmodelle oder schlicht unterschiedliche Rundung/Zitierweise
zwischen Sekundärquellen) ist zum Zeitpunkt der SAP-Erstellung **ungeprüft**
und wird hier **nicht** unterstellt. Dieser Hinweis legt keine
Analyseentscheidung vorab fest, mit einer Ausnahme: Er ist Teil der in
Abschnitt 4 präzisierten Trigger-Bedingung für das Sensitivitätsfenster S1c.
Die vollständige, systematische Prüfung **aller** Jahre der Reihe auf
Methodikbrüche bzw. Quellenabweichungen bleibt — wie in den bisherigen
Analysen dieses Projekts (siehe `Analysen/2026-08-thg-laendervergleich/` und
`Analysen/2026-08-emissionen/`) üblich — der erste dokumentierte Schritt des
Analyst-Subagenten im Struktur-Check (Abschnitt 3) **vor** jeder
Modellschätzung; dieser Schritt ist nicht Bestandteil dieses SAP und wird
hier nicht vorweggenommen.

**Vorab festgelegtes Vorgehen (nicht erst nach Ergebnis-Sichtung):**
- Der Struktur-Check (Abschnitt 3) dokumentiert explizit, ob die Quelle selbst
  Methodikbrüche kennzeichnet, sowie jahresweise Abweichungen zwischen
  unabhängigen Quellen (siehe konkreter Hinweis oben).
- Der Trend-Test (Abschnitt 5.2) kann einen Trend statistisch nachweisen, aber
  **nicht** zwischen "realer Erwärmungstrend" und "Methodikbruch" unterscheiden
  — diese Einschränkung wird im Ergebnisbericht explizit benannt, jedes Mal
  wenn der Trend-Test oder das trend-adjustierte Modell (S5) berichtet wird.
- Wird ein dokumentierter Methodikbruch bzw. eine dokumentierte
  Quellenabweichung gemäß der präzisierten Trigger-Bedingung (Abschnitt 4)
  identifiziert, wird zusätzlich das vorab spezifizierte Sensitivitätsfenster
  S1c (nur Jahre nach dem Bruch, Abschnitt 6) berichtet; ein Auseinanderfallen
  von Primär- und S1c-Klassifikation wird nicht verschwiegen, sondern als
  Hinweis auf Methodik-Sensitivität des Ergebnisses benannt.
- **Der Ergebnisbericht formuliert explizit, dass eine als "außergewöhnlich"
  klassifizierte 2026-Schätzung nicht automatisch auf einen realen
  Extremwert schließen lässt, solange ein Methodikbruch als alternative
  Erklärung nicht ausgeschlossen werden konnte.**

### 8.2 Bevölkerungsalterung als (wahrscheinlich real relevanter) Confounder

Die Anzahl bzw. Rate hitzebedingter Sterbefälle hängt nicht nur von der
Hitzebelastung (Temperatur, Dauer, Klimatrend) ab, sondern auch von der
Vulnerabilität der Bevölkerung — und diese verändert sich unabhängig vom
Klima allein durch die demografische Alterung (steigender Anteil älterer,
hitzevulnerabler Personen an der Gesamtbevölkerung über die Jahre der
historischen Reihe).

**Präzisierung (v1.1):** Nach aktuellem Kenntnisstand ist die RKI-Zielgröße
eine **absolute Fallzahl, nicht altersstandardisiert** — die publizierte
RKI-Berichtsmethodik beruht auf einem Vergleich der Sterbefallzahlen in
Hitze- vs. Nicht-Hitze-Wochen; eine Altersstandardisierung ist darin nicht
erkennbar. Dieser Umstand wird beim Struktur-Check (Abschnitt 3, Schritt 2)
formal bestätigt, ist aber bereits jetzt keine rein theoretische Möglichkeit
mehr, sondern ein **wahrscheinlich real relevanter Confounder**: Eine über
die Jahre der historischen Reihe alternde Bevölkerung würde absolute
Sterbefallzahlen mechanisch nach oben treiben — unabhängig davon, ob sich
die Hitzebelastung selbst (Klimatrend) verändert hat oder nicht. Ein über
die Jahre ansteigender Trend hitzebedingter Sterbefälle (absolute Zahl) kann
daher **teilweise oder vollständig** durch Bevölkerungsalterung erklärt sein.

**Vorab festgelegtes Vorgehen:**
- Der Struktur-Check (Abschnitt 3, Schritt 2) bestätigt formal, ob die
  primäre RKI-Zielgröße tatsächlich eine absolute, nicht altersstandardisierte
  Fallzahl ist (nach aktuellem Kenntnisstand: ja); das Ergebnis wird im
  Ergebnisbericht dokumentiert.
- Der Ergebnisbericht formuliert — mit gegenüber v1.0 erhöhter Betonung, nicht
  nur als beiläufige Einschränkung — explizit, dass ein signifikanter Trend
  (5.2/8.1) oder eine als außergewöhnlich klassifizierte 2026-Schätzung
  **nicht** ohne Weiteres als Beleg für eine Verschärfung der Hitzebelastung
  selbst interpretiert werden darf, da Bevölkerungsalterung eine plausible,
  vom Klimatrend unabhängige und nach aktuellem Kenntnisstand
  **wahrscheinlich mitwirkende** Alternativerklärung ist. Beide Erklärungen
  (Klimatrend, Alterung) sowie deren mögliches Zusammenwirken werden als
  gleichrangig mögliche, mit den hier verwendeten Daten allein **nicht**
  trennbare Erklärungen benannt — eine Zerlegung würde eine
  altersstandardisierte oder alterskohortenspezifische Zielgröße
  voraussetzen, die nicht Gegenstand dieses SAP ist.

### 8.3 Keine implizite Bewertung von Klimapolitik

Dieser SAP zielt **ausschließlich** auf eine rein statistische Einordnung der
Außergewöhnlichkeit von 2026 relativ zur historischen Schwankungsbreite ab.

**Vorab festgelegt, verbindlich für den Ergebnisbericht:**
- Es wird **keine** kausale Aussage über die Wirksamkeit oder
  Nicht-Wirksamkeit von Klimaschutz- oder Anpassungspolitik getroffen und
  keine solche Schlussfolgerung nahegelegt, unabhängig vom Ergebnis der
  Klassifikation.
- Eine Klassifikation "außerhalb des Prädiktionsintervalls" bedeutet
  ausschließlich: Der 2026-Schätzer liegt statistisch außerhalb der aus der
  historischen Reihe geschätzten Schwankungsbreite. Sie bedeutet **nicht**
  automatisch "menschengemachter Klimawandel äußert sich hier direkt" und
  **nicht** "Klimaanpassungsmaßnahmen haben versagt" — beides wären
  zusätzliche kausale Schritte, die dieser SAP nicht unternimmt und die
  gesonderte, hier nicht spezifizierte Analysen erfordern würden.
- Eine Klassifikation "innerhalb des Prädiktionsintervalls" bedeutet
  ausschließlich statistische Unauffälligkeit relativ zur historischen
  Schwankungsbreite, **nicht** "Hitzebelastung ist kein Problem" oder
  "Klimapolitik wirkt".
- Diese Klarstellung wird als Standardformulierung in jede
  Ergebnisdarstellung (Text, Tabellen, Grafiken) aufgenommen (siehe Abschnitt
  11).

### 8.4 Regression zur Mitte (ergänzend)

Sollte einem etwaig außergewöhnlichen Vorjahr (z. B. falls 2025 bereits
selbst eine auffällig hohe Schätzung aufwies) ein weiteres auffälliges Jahr
2026 folgen, ist dies nicht per se implausibel und nicht notwendigerweise auf
denselben zugrunde liegenden Mechanismus zurückzuführen wie ein etwaiger
langfristiger Trend — Jahr-zu-Jahr-Extremwerte unterliegen natürlicher
Schwankung. Der Ergebnisbericht vermeidet die Fehlinterpretation "zwei
auffällige Jahre in Folge beweisen einen neuen, dauerhaft höheren
Schwankungsbereich"; dafür wäre die in 5.3/S5 spezifizierte
Trend-Modellierung über mehrere Jahre heranzuziehen, nicht der bloße
Vergleich zweier aufeinanderfolgender Einzeljahre.

### 8.5 Vorläufigkeit der 2026-Schätzung als eigenständiger Interpretationsvorbehalt

*(Neu, finale Überarbeitung vor Einfrieren.)* Zusätzlich zu den Confoundern in
8.1–8.2 gilt für die 2026-Beobachtung selbst eine strukturelle Einschränkung,
die unabhängig vom Klassifikationsergebnis (innerhalb/außerhalb PI) immer zu
benennen ist: θ̂₂₀₂₆ stammt aus einem vorläufigen, unterjährigen
RKI-Wochenbericht (siehe Abschnitt 2, Vergleichbarkeitshinweis, und Abschnitt
3, Schritt 4), während die historische Referenzreihe aus finalen
Jahresschätzungen besteht.

**Vorab festgelegtes Vorgehen:**
- Eine Klassifikation "außerhalb des Prädiktionsintervalls" für 2026 kann
  teilweise oder vollständig auf der methodischen Unterjährigkeit/
  Vorläufigkeit der verwendeten Schätzung beruhen (z. B. unvollständige
  Erfassung, frühsaisonale Modellannahmen), nicht notwendigerweise auf einem
  tatsächlich außergewöhnlichen Sterblichkeitsgeschehen. Diese Möglichkeit
  wird im Ergebnisbericht immer explizit benannt, nicht nur im Fall eines
  auffälligen Ergebnisses.
- **Wie die Analyse überhaupt eine Unsicherheit für den 2026-Wert ableitet:**
  Primär aus dem im verwendeten RKI-Wochenbericht publizierten
  Unsicherheitsintervall (falls vorhanden); andernfalls über den in Abschnitt
  3, Schritt 3, und Abschnitt 5.1/5.4 vorab festgelegten Fallback (SE₂₀₂₆ =
  sd der historischen Punktschätzer). Kommt der Fallback zum Einsatz, wird
  dies im Ergebnisbericht **ausdrücklich** als Limitation benannt: Die
  z-Score-Berechnung (5.1, Schritt 5) unterstellt dann eine Unsicherheit für
  2026, die nicht aus der tatsächlichen (frühsaisonalen) Schätzunsicherheit
  des Wochenberichts abgeleitet ist, sondern aus der historischen
  Jahr-zu-Jahr-Streuung — zwei konzeptionell unterschiedliche
  Unsicherheitsquellen.

## 9. Limitationen

- **Analogie, keine klassische Metaanalyse:** Die Behandlung von Kalenderjahren
  als "Studien" eines Random-Effects-Modells ist eine vom Auftraggeber
  vorgegebene Modellierungsanalogie. Anders als bei klassischen
  Metaanalyse-Studien sind Kalenderjahre zeitlich geordnet und potenziell
  seriell korreliert (siehe 5.2) — die Standard-Metaanalyse-Annahme
  unabhängiger, austauschbarer Studien ist daher eine Vereinfachung, deren
  Verletzung durch die Diagnostik in 5.2 geprüft, aber nicht vollständig
  behoben werden kann.
- **Geringe Zahl historischer "Studien" (Jahre):** Die Präzision von τ̂², I²
  und dem Prädiktionsintervall ist bei einer überschaubaren Zahl historischer
  Jahre begrenzt (siehe Mindest-Fallzahl-Regel, Abschnitt 4); die
  Prädiktionsintervall-Breite kann entsprechend groß und wenig
  informativ sein.
- **RKI-Unsicherheitsintervalle bilden ggf. nicht die volle
  Modellunsicherheit ab:** "Hitzebedingte Sterbefälle" sind selbst ein
  modellierter Attributions-/Exzessmortalitätsschätzer (kein direkt gezähltes
  Merkmal); das publizierte Unsicherheitsintervall bildet möglicherweise nur
  einen Teil der tatsächlichen Schätzunsicherheit ab (z. B. keine
  Struktur-/Modellwahl-Unsicherheit). Die CI-zu-SE-Rückrechnung (5.1)
  übernimmt implizit die von der Quelle unterstellte Unsicherheitsstruktur.
- **Aktualität/Vorläufigkeit der 2026-Schätzung (konkretisiert, finale
  Überarbeitung):** Für 2026 wird eine vorläufige, unterjährige (in-season)
  Schätzung aus dem jeweils aktuellsten verfügbaren RKI-Wochenbericht zur
  hitzebedingten Mortalität verwendet (das RKI veröffentlicht während der
  Sommermonate Juni–September wöchentlich einen solchen Bericht). Diese Zahl
  ist explizit als unvollständig/vorläufig gekennzeichnet und wird im Verlauf
  der Saison weiter revidiert — bereits bekannt ist, dass eine solche
  Wochenschätzung im bisherigen Verlauf mindestens einmal deutlich nach oben
  korrigiert wurde. Im Gegensatz dazu sind die historischen Referenzjahre
  (bis 2025) nach aktuellem Kenntnisstand abgeschlossene, finale
  Jahresschätzungen (siehe Abschnitt 2, Vergleichbarkeitshinweis, und
  Abschnitt 8.5). Diese fehlende Gleichartigkeit zwischen dem 2026-Wert und
  der historischen Referenzreihe ist eine eigenständige Limitation,
  unabhängig vom Klassifikationsergebnis, und wird in jeder
  Ergebnisdarstellung benannt (Abschnitt 11).
- **Ersatz-Unsicherheit bei fehlendem RKI-Intervall für 2026 (Fallback,
  finale Überarbeitung; siehe Abschnitt 3, 5.1, 5.4, 8.5):** Sollte das RKI
  für die verwendete Wochenbericht-Schätzung kein formales
  Unsicherheitsintervall publizieren, wird SE₂₀₂₆ ersatzweise aus der
  historischen Streuung (Standardabweichung der historischen Punktschätzer)
  abgeleitet. Dies bildet die tatsächliche Schätzunsicherheit des
  Wochenberichts **nicht** ab, sondern nur die Jahr-zu-Jahr-Streuung
  historischer, methodisch anders gearteter (finaler, jahresbasierter)
  Schätzungen. Kommt dieser Fallback zum Einsatz, wird dies im
  Ergebnisbericht als eigenständige Einschränkung explizit benannt (Abschnitt
  11).
- **Methodikbrüche als Confounder** (siehe 8.1, inkl. eines konkreten,
  bereits vor Datenzugriff bekannten Hinweises auf eine Quellenabweichung
  für 2018 — Ursache ungeprüft) und **Bevölkerungsalterung als
  wahrscheinlich real relevanter, unabhängiger Treiber** (siehe 8.2, seit
  v1.1 gestärkt, da die RKI-Zielgröße nach aktuellem Kenntnisstand eine
  absolute, nicht altersstandardisierte Fallzahl ist) sind zentrale, nicht
  mit den hier verwendeten Daten allein auflösbare Limitationen.
- **Keine Kausalinterpretation** (siehe 8.3): Die Analyse beschreibt eine
  statistische Einordnung, keine Ursache-Wirkungs-Beziehung.
- **Datenrevisionen:** Historische RKI-Schätzungen können rückwirkend
  revidiert werden; das Analyseskript dokumentiert Zugriffsdatum und
  Datenstand exakt.

## 10. Software

- R (Version wird im Analyseskript dokumentiert, ≥ 4.x)
- Pakete (voraussichtlich, endgültige Liste im Analyseskript): `metafor`
  (Random-Effects-/Fixed-Effect-Modell, REML/DerSimonian-Laird/Paule-Mandel,
  Meta-Regression, Prädiktionsintervall, Leave-one-out) als primäres Paket;
  `meta` als Kreuzvalidierungs-/Vergleichspaket für die primäre Schätzung;
  `lmtest` (Durbin-Watson-Test auf Meta-Regressions-Residuen); `boot`
  (Bootstrap-Prädiktionsintervall, Sensitivitätsanalyse S6); `ggplot2`
  (Forest-Plot, Zeitreihen-/Diagnostik-Grafiken).
- Skript-Dateiname (vom analyst-Subagenten zu erstellen, nicht Teil dieses
  SAP): `Analysen/2026-08-hitzesommer-2026/hitzesommer-2026.R`

## 11. Reporting

- **Darstellung:**
  (a) Forest-Plot aller historischen Jahre (Punktschätzer ± 95 %-CI) mit
  gepooltem μ̂ (Raute) und primärem 95 %-Prädiktionsintervall (schattiertes
  Band), 2026 separat/hervorgehoben eingezeichnet, auch wenn 2026 nicht in
  die Modellschätzung eingeht.
  (b) Tabelle mit Modellzusammenfassung (μ̂, τ̂², I² mit CI, Q-Test) für die
  Primäranalyse und jede Sensitivitätsvariante (S1–S8) nebeneinander.
  (c) Tabelle mit 2026-Klassifikation (innerhalb/außerhalb PI) und z-Score je
  Primär- und Sensitivitätsvariante — vollständig, kein Cherry-Picking
  (Abschnitt 7).
  (d) Diagnostik-Grafiken: Meta-Regressions-Trendlinie mit Konfidenzband,
  QQ-Plot der studentisierten Residuen, Leave-one-out-Plot.
- **Sprachregelung (siehe 5.5 und 8.3):** Keine Verwendung von "statistisch
  signifikant außergewöhnlich" für die primäre Klassifikation; Punktschätzer,
  Prädiktionsintervall-Grenzen und z-Score stehen deskriptiv für sich. Keine
  kausalen oder politischen Formulierungen (8.3).
- **Verpflichtender Interpretationstext:** Jede Ergebnisdarstellung enthält
  die in 8.1–8.3 festgelegten Hinweise (Methodikbruch-Vorbehalt,
  Alterungs-Alternativerklärung — seit v1.1 mit erhöhter Betonung, kein
  Kausal-/Politik-Schluss) sowie den in 8.5 festgelegten Vorläufigkeits-
  Vorbehalt als Standardformulierung.
- **Pflichtangabe zur 2026-Datengrundlage (neu, finale Überarbeitung):** Jede
  Ergebnisdarstellung (Text, Tabellen, Grafiken), die den 2026-Wert zeigt
  oder referenziert, nennt explizit (a) die Kalenderwoche (ISO-Woche) und (b)
  das Berichtsdatum des verwendeten RKI-Wochenberichts sowie (c) einen
  Vorläufigkeits-Hinweis (die Zahl ist unvollständig und wird im
  Saisonverlauf revidiert; siehe Abschnitt 3, Schritt 4, Abschnitt 2 und
  Abschnitt 9). Wurde die Fallback-Regel für SE₂₀₂₆ (Abschnitt 3, Schritt 3;
  Abschnitt 5.1/5.4) angewendet, wird dies zusätzlich explizit als
  eigenständige Einschränkung benannt (Abschnitt 8.5).
- **Rundung:** Ganzzahlige Sterbefallzahlen ohne Nachkommastelle; τ̂², I² und
  z-Scores mit zwei Nachkommastellen; p-Werte der Diagnostik-Tests mit zwei
  Nachkommastellen, sofern p ≥ 0,01, sonst "p < 0,01", um Scheingenauigkeit zu
  vermeiden.

## 12. Offene Rückfragen

**Alle vier ursprünglich offenen Rückfragen sind inhaltlich beantwortet. Es
bestehen keine methodischen Rückfragen mehr, die einer Einfrierung dieses SAP
entgegenstehen.**

1. **Beantwortet (finale Überarbeitung):** Ist zum jetzigen Zeitpunkt
   (28.08.2026) überhaupt schon eine RKI-Schätzung für 2026 verfügbar, und
   ist sie als vorläufig oder final gekennzeichnet? → Ja: Es liegt eine
   vorläufige, unterjährige RKI-Schätzung aus dem laufenden "Wochenbericht
   zur hitzebedingten Mortalität" vor (RKI veröffentlicht Juni–September
   wöchentlich einen solchen Bericht). Zu verwenden ist der zum
   Analysezeitpunkt aktuellste verfügbare Wochenbericht. Zwingende
   Dokumentationspflicht im Analyseskript: exakte Kalenderwoche und
   Berichtsdatum des verwendeten Berichts sowie expliziter
   Vorläufigkeits-Hinweis (die Schätzung wird im Saisonverlauf revidiert;
   war bereits einmal deutlich nach oben korrigiert worden). Eingearbeitet in
   Abschnitt 2 (Vergleichbarkeitshinweis), Abschnitt 3 (Schritt 4), Abschnitt
   8.5, Abschnitt 9 und Abschnitt 11 (Pflichtangabe).
2. **Beantwortet (finale Überarbeitung, als vorab festgelegte, bedingte
   Entscheidungsregel — nicht als geratene Annahme):** Welches
   Sicherheitsniveau/welche Form (symmetrisch/asymmetrisch) hat das
   publizierte RKI-Unsicherheitsintervall für 2026 tatsächlich? → Wird im
   Struktur-Check ausschließlich anhand der RKI-**Primärquelle**
   (PDF-Wochenbericht, Tabelle 1 bzw. Methodik-Anhang, edoc.rki.de — **keine**
   Sekundärquellen oder Dashboard-Visualisierungen) festgestellt (Abschnitt
   3, Schritt 3). Bedingte Regel: **Primärer Fall** — RKI publiziert ein
   formales Intervall → Sicherheitsniveau/Form dokumentieren, CI-zu-SE-
   Rückrechnung für SE₂₀₂₆ wie in Abschnitt 5.1 spezifiziert. **Fallback-Fall**
   — RKI publiziert kein formales Intervall für die wöchentliche
   2026-Schätzung → SE₂₀₂₆ wird ersatzweise aus der empirischen
   Standardabweichung der historischen Punktschätzer θ̂ᵢ abgeleitet (SE₂₀₂₆ =
   sd(θ̂ᵢ) über das jeweilige Analysefenster), explizit als schwächere, die
   tatsächliche Wochenbericht-Unsicherheit nicht abbildende Evidenzgrundlage
   gekennzeichnet. Eingearbeitet in Abschnitt 3 (Schritt 3), Abschnitt 5.1,
   Abschnitt 5.4, Abschnitt 8.5, Abschnitt 9 und Abschnitt 11.

**Bereits in v1.1 beantwortet — zur Nachvollziehbarkeit weiterhin
dokumentiert:**

3. **Beantwortet:** Ist die RKI-Zielgröße eine absolute Fallzahl oder bereits
   altersstandardisiert? → Absolute, nicht altersstandardisierte Fallzahl
   (nach aktuellem Kenntnisstand; formale Bestätigung im Struktur-Check, siehe
   Abschnitt 3, Schritt 2). Auswirkung auf den Alterungs-Confounder in
   Abschnitt 8.2 entsprechend gestärkt dargestellt.
4. **Beantwortet:** Ist ein bekannter RKI-Methodikbruch bereits vorab
   bekannt? → Konkreter Hinweis auf eine Quellenabweichung für 2018 (aktuell
   zitiert: rund 9.400; frühere Quellen: rund 8.500; Ursache ungeprüft) in
   Abschnitt 8.1 aufgenommen und in die Trigger-Bedingung für
   Sensitivitätsfenster S1c (Abschnitt 4) eingearbeitet.

**Einfrieren:** Dieser SAP wurde am 28.08.2026 von Daniel Saure geprüft und
freigegeben. Status: **final**, Version 1.1 (siehe Kopfbereich). Ab diesem
Zeitpunkt gilt jede Abweichung vom hier festgelegten Vorgehen als Post-hoc
und muss im Analyseskript/Bericht explizit als solche gekennzeichnet werden;
inhaltliche Änderungen am Vorgehen erfordern ein SAP-Amendment.
