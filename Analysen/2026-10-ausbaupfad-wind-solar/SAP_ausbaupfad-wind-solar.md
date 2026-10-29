# Statistischer Analyseplan (SAP) – Ausbaupfad Wind an Land und Solar

**Titel:** Wann werden die gesetzlichen Ausbauziele für Windenergie an Land und
Solar (§ 4 EEG) erreicht, wenn der Zubau der letzten Monate anhält? Fortschreibung
des installierten Bestands laut Marktstammdatenregister, brutto und netto,
mit drei vorab festgelegten Fenstern (12, 24 und 60 Monate).

**Format:** Klima Kompass · Evidenzcheck (neue SAP-Analyse; Gate: Validierungsbericht ohne "kritisch").
**Version:** 1.0 (eingefroren; Inhalt entspricht v0.3, ergänzt um den Freigabevermerk)
**Datum:** 29.10.2026
**Autor:in:** Claude (sap-autor-Subagent)
**Status: final (eingefroren am 29.10.2026).** Der analyst-Subagent darf jetzt gestartet werden. Änderungen nur noch per Amendment.
**Freigabe:** Freigegeben durch Daniel Saure am 29.10.2026 (Volltext der Version 0.3 gelesen; Wortlaut der Bestätigung im Chat: „ja habe ich“, auf die Rückfrage, ob der vollständige Text gelesen wurde; zuvor „freigabe erteilt“).
**Einstufung der Präregistrierung:** prospektiv, mit offengelegtem Vorwissen (Entscheidung Daniel Saure, 29.10.2026, Chat: „Ja, prospektiv“; Abschnitt 0). Diese Entscheidung ist keine Freigabe des SAP.

**Geplanter Ordner:** `Analysen/2026-10-ausbaupfad-wind-solar/`

**Versionshistorie:**
- **v0.1 draft (29.10.2026):** Erstentwurf auf Grundlage des Auftrags vom 29.10.2026. Keine Daten gesichtet, kein Code ausgeführt.
- **v0.2 draft (29.10.2026):** Einarbeitung des Klärungsstands vom 29.10.2026 (Nachträge aus v0.1 in den Haupttext übernommen und gelöscht). Wesentliche Änderungen: (a) K1 beantwortet: Einstufung prospektiv mit offengelegtem Vorwissen (Abschnitt 0); (b) K8 beantwortet: **Primärfenster endet drei Monate vor dem Exportdatum** (Regel in 2.1; Endmonat Juli 2026 für den Export vom 29.10.2026), die Variante mit allen Monaten ist jetzt Sensitivität S1 (vorher umgekehrt); (c) K4: Zustimmung von Daniel Saure zu Dateiname und Größe des MaStR-Gesamtdatenexports liegt vor, der Bezug der Datei war aber offen, weil der Download am 29.10.2026 zweimal fehlgeschlagen ist; (d) K3: WindSeeG-Ziele als Primärbeleg aufgenommen, Wind auf See als Vorschlag für einen Sekundärendpunkt E5; (e) K2 teilweise belegt; (f) K5: Zweitquelle nur zur Plausibilisierung (Vorschlag); (g) K6, K7, K9, K10 mit Standardwerten als "Vorschlag, von Daniel zu bestätigen" markiert; (h) Zeitplan und Validierungsbogen angepasst. Es wurden keine Dateiinhalte des Exports gesichtet.
- **v0.3 draft (29.10.2026):** Einarbeitung der Entscheidungen von Daniel Saure vom 29.10.2026 (Chat: „ja einverstanden alles wie vorgeschlagen“). Änderungen: (a) **K2:** Zielwerte § 4 EEG und Bezug 31.12. des Zieljahres übernommen; am 29.10.2026 erneut abgerufen (gesetze-im-internet.de/eeg_2014/__4.html), Zahlen identisch, Seite nennt keinen Fassungsstand; das bleibt als Limitation (9) stehen, blockiert das Einfrieren nicht, bei Abweichung Amendment (2.2). (b) **K3:** E5 Wind auf See (30 GW bis 2030, § 1 Abs. 2 WindSeeG, Abruf 29.10.2026, ebenfalls ohne Fassungsstand) aufgenommen, nicht in Kernzahlen (2.2, 2.3). (c) **K4 erledigt:** Daniel Saure hat den Export `Gesamtdatenexport_20261029_26.2` am 29.10.2026 selbst im Browser geladen und in `rohdaten/` entpackt (Option a); 40 GB nicht benötigte XML-Dateien wurden auf seine Anweisung gelöscht; Provenienz in `rohdaten/PROVENIENZ.txt`, `geloeschte_dateien_2026-10-29.txt`, `PRUEFSUMMEN_xml_2026-10-29.txt`; ZIP-Prüfsumme unbekannt; Dateien nicht geöffnet; T = Juli 2026 und T_S1 = September 2026 bleiben (3.1, 2.1). Die Optionen (b) und (c) zum Bezug sind entfallen. (d) **K5:** Zweitquelle nur Plausibilisierung, blockiert nichts; S3 entfällt mit Begründung, falls keine monatliche Reihe vorliegt (3.2). (e) **K6:** Bruttoleistung primär, Nettonennleistung S6 bestätigt; die Felddokumentation wurde gelesen (PDF, 146 Seiten, Revision 26.2) und 3.3 sowie 3.5 Nr. 9 wurden daran abgeglichen; die Begründung in 3.3 ist ersetzt, und die Dokumentation definiert Brutto- und Nettonennleistung nicht (**wörtlich belegt versus nicht gefunden: neuer Abschnitt 3.6**). (f) **K7, K9, K10 bestätigt** (Standardwerte, Netto = Brutto-Zubau minus endgültige Stilllegungen ohne Repowering-Herausrechnen, E1b nur als Fortschreibung). (g) **Neu: Gelöschte und deaktivierte Einheiten** (`GeloeschteUndDeaktivierteEinheiten_1` bis `_3`) müssen vom Analysten ausdrücklich berücksichtigt werden: neue Regel 3.5 Nr. 12 mit Pflichtprüfung und Stopp-Regel, neue Sensitivität S9, Anpassung von Tabelle 1 und Validierungsbogen. (h) Der v0.2-Nachtrag zur Felddokumentation ist durch 3.6 ersetzt und gelöscht. (i) Zeitplan (15), Klärungstabelle (16) und Validierungsbogen (14) aktualisiert. **Abschnitt 0 ist unverändert** (Stand v0.2); sein Satz, ein Datenexport liege nicht vor, ist durch K4 überholt, maßgeblich für den Datenstand ist 3.1.

**Hinweis zur Vorlage:** Gerüst ist `SAP-Vorlage/SAP-Template.md` (Abschnitte 0–11 in
derselben Nummerierung). Projektspezifische Ergänzungen über das Template hinaus:
Abschnitt 12 (Entscheidungsregeln), 13 (Abweichungsprotokoll), 14 (Validierungsbogen),
15 (Zeitplan), 16 (Klärung vor Einfrieren). Format und Methodik orientieren sich an
`SAP_DE-Emissionen-Trendprojektion-2040.md` (OLS-Trend, 95-%-Prognoseintervall,
mehrere vorab festgelegte Fenster, Durbin-Watson) und
`SAP_prognose-check-projektionsberichte.md` (Aufbau, Sensitivitäten, Integritäts-Checks).

---

## 0. Status dieser Analyse

[x] Präregistriert (SAP vor Datenzugriff verfasst; Einfrieren steht noch aus)
[ ] Exploratorisch

- **Prospektiv.** Dieser SAP ist vor jeder Auswertung und vor jedem Code
  geschrieben. Es wurden keine Inhalte eines MaStR-Exports, keine Energy-Charts-
  Zeitreihen und keine Zubauzahlen der Bundesnetzagentur gesichtet. Es wurde kein
  Code ausgeführt. Ein Datenexport liegt zum Zeitpunkt dieses Entwurfs **nicht**
  vor (Download fehlgeschlagen, Abschnitt 3.1); vorhanden ist nur die
  Felddokumentation. Wird der Export später bezogen, wird er **nicht geöffnet**,
  bevor Daniel Saure den SAP eingefroren hat. Bis dahin werden nur Metadaten
  festgehalten (Dateiname, Größe, SHA-256, Exportdatum).
- **Offengelegtes Vorwissen (Pflichtangabe).** Dem SAP-Autor wurde im Auftrag eine
  Zahl zum Gegenstand der Analyse mitgeliefert: Aus einem Suchergebnis (pv
  magazine zum DIW-Monitor, Februar 2026, **nicht geprüft**, Originalquelle nicht
  gelesen) liegt Wind an Land bei rund 68 GW, und Photovoltaik liegt deutlich
  näher am Pfad als Wind. Die Zeitreihen selbst wurden nicht gesichtet. Diese
  Angabe berührt den Estimand E1 (Abstand des Bestands zum Zwischenziel 2024).
  Nach der Regel des SAP-Autors macht eine mitgelieferte Zahl zum Ergebnis die
  Präregistrierung grundsätzlich ungültig. **Daniel Saure hat am 29.10.2026
  entschieden, die Analyse dennoch als prospektiv mit offengelegtem Vorwissen
  zu führen** (Chat: „Ja, prospektiv“). Begründung: Die Zahl stammt aus einer
  ungeprüften Sekundärquelle, ist kein Ergebnis dieser Analyse, und alle Fenster,
  Modelle und Regeln wurden unabhängig davon festgelegt. Die Offenlegung gehört
  in jeden Ergebnisbericht (Abschnitt 11).
- **Keine Erwartung.** Dieser SAP enthält keine Aussage darüber, welches Ergebnis
  erwartet wird. Jeder Ausgang (Ziel im Intervall, oberhalb, unterhalb, je
  Technologie und Fenster verschieden) wird veröffentlicht.
- **Inhaltsstufe:** Evidenzcheck. Die frühere Regel "eine Analyse zur Zeit" ist
  seit 23.10.2026 gestrichen; Sperren aus anderen SAPs betreffen diesen SAP nicht.

## 1. Hintergrund / Rationale

§ 4 EEG legt für Windenergie an Land und Solar (Photovoltaik) Zielwerte für die
installierte Leistung bis 2040 fest (Abschnitt 2.2). Öffentliche Darstellungen
vergleichen meist den Bestand eines Stichtags mit dem Zielwert. Selten wird
gezeigt, in welchem Jahr das Ziel erreicht würde, wenn der zuletzt beobachtete Zubau
anhielte, mit Unsicherheitsangabe, und wie stark Stilllegungen den Bruttozubau
mindern.

**Mehrwert:** (a) Abstand des Bestands zum Zwischenziel 2024, (b) Fortschreibung
des Netto-Zubaus auf das Ziel 2030 mit 95-%-Prognoseintervall für drei
vorab festgelegte Fenster, (c) der dafür nötige durchschnittliche jährliche
Netto-Zubau im Vergleich, (d) der Anteil der Stilllegungen am Bruttozubau.

**Begriffliche Einordnung (gilt für den gesamten SAP und den Bericht):**
Eine **Fortschreibung ist keine Prognose.** Sie beantwortet die Bedingungsfrage
"Wann wäre das Ziel erreicht, wenn der Zubau des Fensters konstant bliebe?".
Sie enthält ausdrücklich keine Annahmen über Politik, Förderung, Genehmigungen,
Netzausbau, Lieferketten oder Marktlage. Eine Abweichung zwischen Fortschreibung
und Ziel ist keine Bewertung von Politik.

**Abgrenzung der Wörter "brutto" und "netto":** In diesem SAP bezeichnen
"Brutto-Zubau" und "Netto-Zubau" **Bilanzgrößen** (Brutto-Zubau = Leistung der in
Betrieb genommenen Einheiten; Netto-Zubau = Brutto-Zubau minus Leistung der
endgültig stillgelegten Einheiten). Davon zu unterscheiden sind die MaStR-Felder
**"Bruttoleistung"** und **"Nettonennleistung"** der einzelnen Einheit (Abschnitt 3.3).
Im Bericht werden diese Begriffe getrennt verwendet.

## 2. Fragestellung (Estimand)

### 2.1 Notation (verbindlich)

- Technologie τ ∈ {Wind an Land, Solar}. **Beide Technologien werden getrennt
  ausgewertet; es wird nie über Technologien summiert.** (Wind auf See nur als
  Sekundärendpunkt E5, 2.3.)
- Monat m: Kalendermonat; Monatsende-Bestand C(τ,m) = installierte Leistung in GW
  (Definition 3.4) am letzten Tag des Monats m.
- **Exportdatum:** Datum des tatsächlich bezogenen Datenstands laut Quelle. Für den
  bezogenen Export `Gesamtdatenexport_20261029_26.2` ist es der 29.10.2026
  (Stand 00:00 Uhr); Exportmonat = Oktober 2026. Ein Wechsel auf einen anderen
  Export ist ausgeschlossen; sollte er dennoch nötig werden, ist ein Amendment
  vor der Auswertung erforderlich, und alle daran gebundenen Monatsangaben (T,
  T_S1, x(2026), x(2030)) werden dann nach den Regeln unten neu festgeschrieben.
- **T (Primär-Endmonat, Regel):** T = der Kalendermonat, der **drei Kalendermonate
  vor dem Exportmonat** liegt. Der Monat ist damit stets vollständig. Für den
  Export vom 29.10.2026 ist **T = Juli 2026** (Monatsende 31.07.2026). Die Monate
  August, September und Oktober 2026 gehen in die Primäranalyse nicht ein. Der
  Endmonat wird nach dieser Regel bestimmt, nicht nach Sichtung der Daten
  (Entscheidung Daniel Saure, 29.10.2026, Chat: „2. ja bis 3 monate“).
- **T_S1 (Endmonat der Sensitivität S1, "mit allen Monaten"):** der letzte
  vollständige Kalendermonat vor dem Exportdatum; für den Export vom 29.10.2026 ist
  **T_S1 = September 2026**.
- Fenster W ∈ {12, 24, 60} Monate. Das Fenster W umfasst die **n = W + 1**
  Monatsende-Bestände C(τ,T−W), …, C(τ,T), also genau W Monatsinkremente
  (n = 13, 25, 61). Für T = Juli 2026 reichen die Fenster vom Monatsende Juli 2025
  (F12), Juli 2024 (F24) bzw. Juli 2021 (F60) bis Juli 2026.
- Zubau (brutto) Z(τ,m): Summe der Leistung der Einheiten mit Inbetriebnahmedatum
  im Monat m. Stilllegung S(τ,m): Summe der Leistung der Einheiten mit Datum der
  endgültigen Stilllegung im Monat m. Netto-Zubau N(τ,m) = Z(τ,m) − S(τ,m)
  (Definition bestätigt von Daniel Saure, 29.10.2026, K9; Repowering wird nicht
  herausgerechnet).
- Ziele Y_τ(j) laut 2.2 für Jahr j. Bezugszeitpunkt: **Bestand am 31.12. des
  Zieljahres** (Entscheidung Daniel Saure, 29.10.2026, K2).
- x: Zeitachse in Monaten ab T (x = 0 am Monatsende T; x = −W … 0 im Fenster).
  x(j) = Anzahl Monate von T bis zum 31.12.j. Für T = Juli 2026 ist x(2026) = 5
  und x(2030) = 53.

### 2.2 Gesetzliche Ziele (installierte Leistung in GW)

Quelle: gesetze-im-internet.de, § 4 EEG (Seite eeg_2014/__4.html). Erstabruf am
29.10.2026 (Seite "nichtamtliches Inhaltsverzeichnis"), **erneuter Abruf am
29.10.2026: Zahlen identisch, die Seite nennt keinen Fassungsstand.** Dieselben
Zahlen standen in einem weiteren Abruf am 29.10.2026 (lxgesetze.de, Vermerk
"zuletzt geändert 18.12.2025"). Ob die Änderung vom 18.12.2025 § 4 berührt hat, ist
nicht geklärt. **Entscheidung Daniel Saure, 29.10.2026 (K2): Zielwerte und Bezug
31.12. des Zieljahres sind übernommen.** Der amtliche Fassungsstand ist nicht
belegbar; das steht als Limitation (9) und blockiert das Einfrieren nicht. Weicht
eine später gefundene amtliche Fassung ab, wird vor der Auswertung ein Amendment
(Abschnitt 13) geschrieben.

| Jahr | Windenergie an Land (GW) | Solar (GW) |
|---|---|---|
| 2024 | 69 | 88 |
| 2026 | 84 | 128 |
| 2028 | 99 | 172 |
| 2030 | 115 | 215 |
| 2035 | 157 | 309 |
| 2040 | 160 | 400 |

Die Zielwerte 2028, 2035 und 2040 dienen nur der Darstellung des Zielpfads
(Grafik, Abschnitt 11). Für sie wird **keine** Fortschreibung bewertet.

**Windenergie auf See (aufgenommen als Sekundärendpunkt E5, Entscheidung Daniel Saure,
29.10.2026, K3):** § 1 Abs. 2 WindSeeG nennt laut Abruf von gesetze-im-internet.de
(29.10.2026, Seite ohne Fassungsstand; ein Suchergebnis nennt "zuletzt geändert
29.03.2026", nicht geprüft) mindestens **30 GW bis 2030, 40 GW bis 2035 und
70 GW bis 2045**. E5 gilt nur für das Ziel 2030 (2.3); die Ziele 2035 und 2045
dienen nur der Darstellung. Einheiten "auf See" werden aus der Population Wind an
Land ausgeschlossen (3.3). Bezugszeitpunkt wie oben (Bestand am 31.12.). Die
Zielzahlen stehen im Gesetz als "mindestens"; der Vergleich nutzt sie als
Zielwert. Der fehlende Fassungsstand ist wie bei § 4 EEG eine Limitation (9);
bei Abweichung Amendment.

### 2.3 Estimands

Alle Estimands werden für jede Technologie τ getrennt definiert und berichtet.

**E1 (primär) – Abstand des Bestands zum Zwischenziel 2024.**
Δ₂₀₂₄(τ) = C(τ, Dezember 2024) − Y_τ(2024), in GW und in % von Y_τ(2024)
(Vorzeichen: negativ = Bestand unter dem Ziel). Bestand aus dem Gesamtdatenexport
mit dem Datenstand des Exports (rückwirkend vervollständigt, 3.5).

**E1b (sekundär) – Zwischenziel 2026 (nur als Fortschreibung, bestätigt von Daniel
Saure, 29.10.2026, K10).** Der Stichtag 31.12.2026 liegt nach dem
Exportdatum; ein Vergleich Ist gegen Ziel ist daher für 2026 **nicht möglich**
und wird nicht vorgetäuscht. Stattdessen: Fortschreibung bis 31.12.2026 nach E2
(gleiche Methode, drei Fenster, x(2026) = 5 bei T = Juli 2026), Wert mit
95-%-Prognoseintervall gegen Y_τ(2026), Einordnung nach Abschnitt 12. Zusätzlich
deskriptiv: Abstand von C(τ,T) zum linear zwischen den Zielwerten 2024 und 2026
interpolierten Zielwert für den Monat T (Hilfsgröße; das Gesetz legt nur Jahreswerte
fest).

**E2 (primär) – Erreichungszeitpunkt des Ziels 2030 bei konstantem Netto-Zubau.**
Für jedes Fenster W ∈ {12, 24, 60}: Das Modell ist die lineare OLS-Regression
des Monatsende-Bestands (GW) auf die Zeit,

C(τ, x) = a + b·x + ε, x = −W, …, 0 (n = W + 1 Beobachtungen),

wobei **b der geschätzte konstante Netto-Zubau in GW pro Monat** ist. Die
Fortschreibung ist die Verlängerung der angepassten Geraden (x > 0). Berichtet:
1. **Punktschätzung** des Erreichungszeitpunkts x* = (Y_τ(2030) − a)/b, in den
   ersten Monatsendpunkt x ≥ 0 mit angepasstem Wert ≥ Y_τ(2030) überführt,
   angegeben als Monat und Kalenderjahr.
2. **Invertiertes 95-%-Prognoseintervall:** Mit den zweiseitigen 95-%-Prognosegrenzen
   L(x) und U(x) der klassischen OLS für eine neue Beobachtung (t-Verteilung,
   n−2 Freiheitsgrade) ist "frühestens" der erste Monatsendpunkt x ≥ 0 mit
   U(x) ≥ Y_τ(2030), "spätestens" der erste Monatsendpunkt x ≥ 0 mit
   L(x) ≥ Y_τ(2030). Wird der Wert bis zum **Suchhorizont 31.12.2060** nicht
   erreicht, steht "nicht bis 2060 erreicht". Ist b ≤ 0, steht "mit dieser
   Fortschreibung nicht erreicht" (keine Jahreszahl).
3. **Wert der Geraden am 31.12.2030** mit 95-%-Prognoseintervall [L, U],
   Einordnung des Ziels nach Abschnitt 12 (dies ist die formale Entscheidungsregel).
4. Ist der Bestand C(τ,T) bereits ≥ Y_τ(2030), steht "Ziel bereits erreicht" und
   der Monat, in dem der Bestand erstmals ≥ Y_τ(2030) lag.

Alle drei Fenster werden berichtet. **Keines ist "das beste".** Das Fenster mit
dem günstigsten oder ungünstigsten Ergebnis darf nicht hervorgehoben oder
allein genannt werden (Abschnitt 7).

**E3 (primär) – Erforderlicher jährlicher Netto-Zubau.**
R(τ) = (Y_τ(2030) − C(τ,T)) / (x(2030) / 12) in GW pro Jahr (Zähler: Lücke
zwischen Ziel und Bestand am Monatsende T; Nenner: Jahre von T bis 31.12.2030).
Verglichen wird R mit dem Zubau der drei Fenster: s_W = 12·b_W (OLS-Steigung,
GW pro Jahr, mit klassischem 95-%-Konfidenzintervall) als Modellgröße; zusätzlich
als deskriptive Kontrollgröße der arithmetische Mittelwert
ā_W = 12·(C(τ,T) − C(τ,T−W))/W. Kennzahl: Verhältnis s_W / R (Anteil des nötigen
Zubaus, den das Fenster liefert) und Differenz R − s_W. Ist R ≤ 0 (Ziel
erreicht), steht "Ziel erreicht".

**E4 (primär) – Anteil der Stilllegungen am Bruttozubau (Brutto/Netto).**
Q_W(τ) = ΣS(τ,m) / ΣZ(τ,m), summiert über die W Monate x = −W+1 … 0 des
Fensters, in %. Berichtet zusätzlich Brutto-Zubau, Stilllegung und Netto-Zubau in
GW pro Jahr je Fenster. Ist ΣZ = 0, steht "nicht definiert".

**E5 (sekundär, aufgenommen nach K3) – Wind auf See, Ziel 2030.**
Dieselben Definitionen wie E2 bis E4 (Fenster, OLS, invertiertes Intervall, Wert am
31.12.2030, R, s_W, Q_W), Zielwert 30 GW (2.2). Kein Zwischenziel 2024, daher kein
E1-Analogon. E5 steht nicht in den Kernzahlen (Abschnitt 7) und nicht in
Überschrift oder Teaser. Hinweis: Der Zubau auf See erfolgt in wenigen großen
Schritten; die Annahme eines gleichmäßigen linearen Zubaus ist dort besonders
grob (Limitation, Abschnitt 9).

**Ausdrücklich nicht Gegenstand:** Aussagen über Ursachen (Genehmigungen, Förderung,
Netzanschluss, Flächen), Stromerzeugung (installierte Leistung ist nicht
Erzeugung), Bewertung der Ziele oder von Politik, Prognose künftiger Politik,
Fortschreibung auf 2028, 2035, 2040 (und 2045 auf See), Summe Wind plus Solar,
Summe Wind an Land plus auf See.

## 3. Datenquelle

**Template-Pflichtfelder (werden im `run_log.txt` und in der Datei `PROVENIENZ`
im Analyseordner festgehalten):**
- Quelle(n): siehe 3.1 bis 3.2
- Zugriffsdatum: 29.10.2026 (Download durch Daniel Saure im Browser, Entpacken
  ebenfalls durch ihn; Eintrag in `rohdaten/PROVENIENZ.txt`)
- Datenstand laut Quelle / Exportdatum: 29.10.2026, 00:00 Uhr (laut Dateiname und
  Download-Seite)
- Lizenz/Nutzungsbedingungen: MaStR-Gesamtdatenexport: Datenlizenz Deutschland –
  Namensnennung – Version 2.0; Lizenzen der Zweitquellen beim Beschaffen eintragen.

### 3.1 Primärquelle: Marktstammdatenregister (MaStR), Bundesnetzagentur
- **Bezogener Export:** `Gesamtdatenexport_20261029_26.2` (Format XML, Stand
  29.10.2026 00:00 Uhr, laut Download-Seite 3.184.934 KB, rund 3,2 GB als ZIP).
  Download-Seite: https://www.marktstammdatenregister.de/MaStR/Datendownload.
  Ein automatischer Download war am 29.10.2026 zweimal gescheitert (curl:
  Verbindung vom Server sofort zurückgesetzt, Exit 56) und wurde nicht umgangen.
  **K4 erledigt (Option a):** Daniel Saure hat die Datei am 29.10.2026 selbst im
  Browser geladen und in `rohdaten/` entpackt (Chat: „download ist extrahiert am
  bekannten ort“). Die **ZIP-Datei liegt nicht im Ordner; ihre Prüfsumme ist
  unbekannt.** Die Optionen (b) Webservice und (c) anderer Stichtagsexport sind
  entfallen. Fremde Umgehungen (inoffizielle Spiegel, Zenodo-Spiegel älterer
  Stände) bleiben ausgeschlossen.
- **Aufräumen:** Auf ausdrückliche Anweisung von Daniel Saure (Chat: „lösch du
  bitte“) wurden am 29.10.2026 364 nicht benötigte XML-Dateien (rund 40 GB:
  Anlagen*, Lokationen*, Netzanschlusspunkte*, Marktakteure*, Einheiten für
  Speicher, Biomasse, Wasser, Verbrennung, Kernkraft, Geothermie, Gas,
  Genehmigung) gelöscht, nachdem die Festplatte auf 12 GB frei gefallen war.
  Liste mit Dateigrößen: `rohdaten/geloeschte_dateien_2026-10-29.txt`.
  **Behalten und für die Analyse vorgesehen** (laut `PRUEFSUMMEN_xml_2026-10-29.txt`,
  80 Einträge, davon `Einheitentypen.xml` zweimal mit identischer Summe):
  `EinheitenWind.xml` (eine Datei), `EinheitenSolar_1.xml` bis `EinheitenSolar_67.xml`,
  `Katalogkategorien.xml`, `Katalogwerte.xml`, `Einheitentypen.xml`,
  `GeloeschteUndDeaktivierteEinheiten_1.xml` bis `_3.xml`, `Ertuechtigungen.xml`
  sowie kleine weitere Dateien (`EinheitenAenderungNetzbetreiberzuordnungen_1` bis
  `_3`, `EinheitenGasverbraucher.xml`), die nicht verwendet werden.
- **Stand der Sichtung:** Die XML-Dateien sind **nicht geöffnet** (Status in
  `PROVENIENZ.txt`: NICHT GEOEFFNET). Der SAP-Autor hat nur Dateilisten, Größen und
  Prüfsummen gelesen. Die XML-Dateien werden erst nach dem Einfrieren vom
  analyst geöffnet.
- **Ablage und Integrität:** unverändert im Ordner `rohdaten/` des Analyseordners;
  **nicht in Git** (nicht committen). Maßgeblich für die Unversehrtheit sind die
  SHA-256-Werte je XML-Datei in `PRUEFSUMMEN_xml_2026-10-29.txt`; der Analyst
  prüft sie vor dem Einlesen und trägt das Ergebnis im `run_log.txt` ein.
- **Tagesdatei:** Die Bundesnetzagentur ersetzt die Datei täglich. Die Analyse
  arbeitet ausschließlich mit dem bezogenen Stand (Dateien und SHA-256 in
  `PRUEFSUMMEN_xml_2026-10-29.txt`). Ein später erscheinender neuerer Export wird nicht
  eingemischt.
- **Verarbeitung:** Das Entpacken ist bereits erfolgt. Die Verarbeitung erfolgt
  datei- bzw. stückweise (Streaming), nicht durch Laden einer gesamten XML-Datei in
  den Arbeitsspeicher. Zeichensatz laut Dokumentation UTF-16 (3.6). Die Rohdateien
  werden nicht verändert.
- **Felddokumentation:** `rohdaten/doku/Dokumentation MaStR Gesamtdatenexport/
  Dokumentation MaStR Gesamtdatenexport.pdf` (Revision 26.2, Datum 01.10.2026,
  146 Seiten; keine Daten). Sie wurde am 29.10.2026 vom SAP-Autor gelesen; die
  Belege und das, was nicht gefunden wurde, stehen in **3.6**.
- **Einheitentypen:** Windenergie (Lage "an Land") und Solar (alle
  Solareinheiten, einschließlich Freiflächen-, Dach- und steckerfertiger
  Anlagen; keine Unterteilung nach Lage in der Primäranalyse). Wind auf See nur für
  E5 (laut Dokumentation Feld `WindAnLandOderAufSee` in `EinheitenWind`, 3.6).
- **Felder:** Feldnamen laut Felddokumentation siehe 3.6; die tatsächlichen
  Bezeichnungen und Zahlencodes im Export werden nach 3.5 Nr. 9 gegen die
  Dokumentation und die Katalogdateien abgeglichen.

### 3.2 Zweitquelle (Plausibilisierung), nur offene Quellen
1. **Fraunhofer ISE Energy-Charts**, installierte Leistung nach Energieträger
   (Wind an Land, Solar). Lizenz, API-Zugang und monatliche Auflösung sind **nicht
   bestätigt** (direkt auf energy-charts.info zu prüfen).
2. **Bundesnetzagentur:** monatliche "EE-Statistik" (nach der MaStR-Seite der
   Bundesnetzagentur); Inhalt und Lizenz **nicht geprüft**.
3. **Our World in Data** (jährliche installierte Leistung Wind und Solar
   Deutschland), nur falls einschlägig, nur als grober Größenordnungs-Abgleich
   des Jahresend-Bestands; Wind dort möglicherweise nur als Summe an Land plus
   auf See (nicht geprüft), dann nicht mit Wind an Land vergleichbar. Bei
   Abweichung hat die Primärquelle Vorrang.

**Verwendung (bestätigt von Daniel Saure, 29.10.2026, K5):** Die Zweitquelle
dient **nur zur Plausibilisierung** und **blockiert nichts**, auch nicht das
Einfrieren.
- Als **Kontrollrechnung (Sensitivität S3)**: gleiche Fortschreibung auf der
  Zweitquellen-Bestandsreihe, soweit sie monatlich vorliegt (nur Bestand, daher nur
  E1, E2, E3; kein E4). Liegt bis zur Auswertung keine verwendbare monatliche Reihe
  vor, **entfällt S3 mit Begründung** und wird als "nicht durchgeführt, Grund:
  Zweitquelle nicht beschafft bzw. nicht monatlich" berichtet; dafür ist kein
  Amendment nötig.
- Als **Plausibilisierung**: Abweichung des Jahresend-Bestands 2024 und des letzten
  gemeinsamen Monats zwischen MaStR-Rekonstruktion und Zweitquelle. Relative
  Abweichungen über **3 %** werden im Bericht ausgewiesen und erläutert, ändern aber
  die Primärquelle nicht. Zusätzlich werden die Erreichungszeitpunkte
  (Punktschätzung) beider Quellen nebeneinander berichtet.
- **Fallback:** Ein Fallback auf die Zweitquelle als Hauptquelle ist nach K4
  gegenstandslos (Primärdaten liegen vor).
- **Unabhängigkeitsvorbehalt:** Es ist zu prüfen, ob Energy-Charts und die
  Statistik der Bundesnetzagentur ihrerseits auf dem MaStR beruhen. Falls ja, ist
  der Abgleich eine Kontrolle der Aufbereitung, kein unabhängiger Beleg; das wird im
  Bericht so benannt.

### 3.3 Festlegung der Leistungsgröße (bestätigt von Daniel Saure, 29.10.2026, K6)

**Primär: Bruttoleistung der Einheit** (MaStR-Feld `Bruttoleistung`, laut
Dokumentation "Bruttoleistung in kW"). **Sensitivität S6: Nettonennleistung**
(Feld `Nettonennleistung`, laut Dokumentation "Nettonennleistung in kW").

Stand der Begründung nach Abgleich mit der Felddokumentation (Details und
Seitenangaben in 3.6): Die Dokumentation **definiert weder Bruttoleistung noch
Nettonennleistung**; sie nennt nur die Bezeichnung und die Einheit kW und verweist
für Felddefinitionen auf eine externe Hilfeseite, die nicht Teil des Pakets ist
(Dokumentation Abschnitt 6.1). Die im v0.2 genannte Begründung (Bruttoleistung als
Modulleistung bzw. Generator-Nennleistung, Nettonennleistung durch Wechselrichter
oder Netzanschluss begrenzt) ist in der Dokumentation **nicht belegt** und wird als
Begründung gestrichen. **Gegenläufiger Hinweis (wörtlich belegt):** Bei den
EEG-Anlagen heißt das Feld `InstallierteLeistung` laut Dokumentation "Installierte
Nettonennleistung der EEG-Anlage" (`AnlagenEegWind`, `AnlagenEegSolar`; diese
Dateien liegen nicht vor, und das Feld liegt auf Anlagen-, nicht auf Einheitenebene).
Das Register selbst bezeichnet also an dieser Stelle die Nettonennleistung als
"installierte Leistung". Die Entscheidung von Daniel Saure (Bruttoleistung primär)
bleibt unverändert; dieser Befund steht zur Kenntnisnahme beim Lesen des Volltextes
(Klärungstabelle K6). Die Wahl der Primärgröße ist eine Setzung, keine aus der
Dokumentation abgeleitete Tatsache; S6 zeigt den Einfluss. Ändert Daniel Saure die
Primärgröße, geschieht das vor dem Einfrieren, nicht danach.

- **Einheit:** MaStR-Leistungen in kW (laut Dokumentation, Typ decimal; Beispiel
  "150.112" mit Punkt als Dezimaltrenner; im Export zu verifizieren). Umrechnung
  in GW: kW / 1 000 000. Größenordnungs-Sperre: Liegt C(τ, Dez 2024) nicht
  zwischen dem 0,5-Fachen und dem 2-Fachen von Y_τ(2024), wird die Analyse gestoppt
  und Daniel Saure gefragt (Hinweis auf Einheiten- oder Importfehler; die Sperre
  sagt nichts über ein erwartetes Ergebnis).
- **Wind an Land:** Einheiten mit Lage "auf See" werden ausgeschlossen. Fehlt die
  Lage, siehe 3.5 Nr. 5.

### 3.4 Definition Bestand und Flüsse

Eine Einheit zählt am Monatsende m zum Bestand, wenn (a) das Inbetriebnahmedatum
≤ Monatsende m liegt und (b) sie nicht bis einschließlich Monatsende m endgültig
stillgelegt ist (Datum der endgültigen Stilllegung ≤ Monatsende m **und**
Betriebsstatus "endgültig stillgelegt"). **Vorübergehend stillgelegte Einheiten
bleiben im Bestand.** Einheiten "in Planung" oder ohne Inbetriebnahmedatum zählen
nicht. Zubau Z(τ,m) und Stilllegung S(τ,m) werden aus denselben Einheiten und denselben
Datumsfeldern gebildet, sodass C(τ,m) − C(τ,m−1) = Z(τ,m) − S(τ,m) exakt gilt
(Rechenprobe im Output). Die Bestandsreihe wird bis T_S1 berechnet (für S1); die
Primäranalyse verwendet sie nur bis T. Bestand, Z und S werden **ausschließlich** aus
den Einheitendateien (`EinheitenWind`, `EinheitenSolar_*`) gebildet; die Dateien
`GeloeschteUndDeaktivierteEinheiten_*` gehen nach der Regel 3.5 Nr. 12 ein.

### 3.5 Bekannte MaStR-Eigenheiten und vorab festgelegte Behandlung

1. **Nachmeldungen / Rechtszensierung.** Einheiten werden teils nachträglich
   registriert. Die jüngsten Monate sind im Export deshalb systematisch
   unterzählt; der Bestand wird aus dem aktuellen Stand rekonstruiert, nicht aus
   früheren Momentaufnahmen. Behandlung: Das Primärfenster endet **drei Monate vor
   dem Exportmonat** (T = Juli 2026 beim Export vom 29.10.2026, Regel 2.1).
   **Sensitivität S1** ("mit allen Monaten") lässt die Fenster bei T_S1 (September
   2026) enden; E3 und x(2030) beziehen sich dann auf T_S1. Eine Nachmeldekorrektur
   (Hochrechnung) wird **nicht** vorgenommen. Auch die Monate bis T können noch
   unterzählt sein; das ist eine Limitation.
2. **Stilllegungsmeldungen.** Auch Stilllegungen können verspätet oder gar nicht
   gemeldet sein. Eine Korrektur erfolgt nicht; das wird als Limitation berichtet.
   Einheiten mit Status "endgültig stillgelegt" **ohne Stilllegungsdatum** werden
   im Bestand belassen (kein Netto-Abzug) und mit Anzahl und Leistung ausgewiesen.
   (Die Dokumentation führt `DatumEndgueltigeStilllegung` als nicht verpflichtend,
   3.6; wie solche Einheiten im Export erscheinen, steht dort nicht.)
   Übersteigt ihre Leistung 1 % des Bestands C(τ,T) einer Technologie, wird gestoppt
   und Daniel Saure gefragt (Schwelle bestätigt, K7). Einheiten mit Stilllegungsdatum, aber Status
   ungleich "endgültig stillgelegt", gelten als nicht stillgelegt und werden gelistet.
   Einheiten mit Stilllegungsdatum vor dem Inbetriebnahmedatum werden gelistet
   und als nicht stillgelegt behandelt.
3. **Dubletten.** Maßgeblich ist die MaStR-Nummer (`EinheitMastrNummer`). Mehrfach
   vorkommende Nummern (zum Beispiel über mehrere Exportdateien) werden auf einen
   Datensatz reduziert (der mit dem jüngsten `DatumLetzteAktualisierung`, das laut
   Dokumentation ein Pflichtfeld ist; bei Gleichstand der erste in fester
   Dateireihenfolge). Verschiedene Nummern mit identischen Standort-,
   Datums- und Leistungsangaben werden **nicht** entfernt (können echte
   Parallel-Einheiten sein), aber gezählt und gelistet.
4. **Plausibilität der Leistungswerte.** Harte Schwellen (technisch):
   fehlende oder ≤ 0 Bruttoleistung; Wind an Land Bruttoleistung > 20 000 kW;
   Solar Bruttoleistung > 1 000 000 kW. Harte Fälle werden ausgeschlossen und mit
   Nummer, Leistung und Grund gelistet. **Weiche Schwellen** (nur Markierung, bleiben
   im Datensatz): Wind > 10 000 kW; Solar > 300 000 kW; Nettonennleistung größer
   als Bruttoleistung. Die Schwellen sind Setzungen des SAP-Autors, von Daniel
   Saure am 29.10.2026 bestätigt (K7), keine Quellenangabe. Für Wind auf See (E5) gelten keine eigenen Schwellen; Wind-Schwellen
   werden dort nicht angewendet, sondern nur weiche Markierung ab 20 000 kW.
5. **Fehlende Angaben.** Einheiten ohne Inbetriebnahmedatum zählen nicht zum
   Bestand, werden aber mit Anzahl und Leistung ausgewiesen. Einheiten mit
   Inbetriebnahmedatum nach dem Exportdatum werden ausgeschlossen und gelistet.
   Windeinheiten ohne Angabe der Lage werden ausgeschlossen und gelistet.
6. **kW versus MW.** Alle Leistungswerte werden einheitlich in kW geführt. Ein
   Wert, der um den Faktor 1000 offenkundig falsch erfasst ist (über der harten
   Schwelle und durch 1000 geteilt plausibel), wird **nicht korrigiert**,
   sondern nach Punkt 4 ausgeschlossen und gelistet. Der Einfluss der
   ausgeschlossenen und weich markierten Einheiten wird in **S7** gezeigt.
7. **Repowering (Stilllegung und Neubau am selben Standort).** Keine
   Sonderbehandlung (bestätigt, K9): Stilllegung und Neubau sind getrennte Ereignisse in S und Z; im
   Netto-Zubau gleichen sie sich rechnerisch aus. Der Brutto-Zubau enthält die
   Leistung der Ersatzanlage, E4 den ersetzten Teil. Optional und rein deskriptiv:
   Abschätzung des Anteils von Stilllegungen mit Neubau im gleichen Standort (nur,
   wenn die Standortfelder eine eindeutige Zuordnung erlauben; keine Kennzahl für
   Überschrift oder Teaser, kein Eingang in E1 bis E4).
8. **Stichtag und Exportdatum.** Exportdatum, Download-Datum, Dateinamen, Größen,
   SHA-256, T und T_S1 werden in `PROVENIENZ` und im `run_log.txt` festgehalten
   (2.1, 3.1).
9. **Feldnamen und Statuswerte.** Die Feldnamen sind in 3.6 aus der Dokumentation
   belegt. **Nicht belegt sind die Zahlencodes der Statuswerte und der Lage**
   (Katalogkategorien `Anlagenbetriebsstatus`, `AnlagenSystemStatus`,
   `WindAnLandOderAufSee`; die Zahlen in den Beispielspalten der Dokumentation, zum
   Beispiel 977 oder 89212, sind Platzhalter ohne Bedeutung). Die Codes werden vor
   der Auswertung über `Katalogwerte.xml` und `Katalogkategorien.xml` aufgelöst und
   in einer Zuordnungstabelle im Analyseordner festgehalten. Passt ein aufgelöster
   Statuswert in keine der obigen Kategorien, wird gestoppt und gefragt.
   `EinheitSystemstatus` wird gelesen und in der Zuordnungstabelle ausgewiesen, aber
   nicht zur Filterung verwendet; zeigt die Tabelle Werte, die auf nicht
   registrierte oder nicht aktive Einheiten hindeuten, wird gestoppt und gefragt.
10. **Unbekannte Eigenheiten.** Zeigt sich nach dem Einfrieren eine bisher nicht
    beschriebene Eigenheit, die Ergebnisse berühren könnte, gilt die
    Regel: Stopp, Rückfrage, Eintrag im Abweichungsprotokoll (Abschnitt 13), keine
    stillschweigende Behandlung.
11. **Bestehendes MaStR-Material aus anderen Analysen** (zum Beispiel im Ordner
    "batteriespeicher-dunkelflaute") wird nicht verwendet; der Datenstand ist nicht
    identisch.
12. **Gelöschte und deaktivierte Einheiten** (Dateien
    `GeloeschteUndDeaktivierteEinheiten_1.xml` bis `_3.xml`; Dokumentation 5.5.24).
    **Der Analyst muss diese Dateien ausdrücklich einlesen und auswerten; das
    Auslassen ist eine Abweichung.** Die Dokumentation gibt (3.6) nur Folgendes her:
    Die Datei enthält "Alle öffentlichen Daten der GeloeschteUndDeaktivierteEinheiten von
    nicht migrierten Einheiten" mit den Feldern `EinheitMastrNummer`, `Einheittyp`,
    `EinheitSystemstatus`, `EinheitBetriebsstatus`, `DatumDerLoeschung` und
    `EinheitLoeschgrund` (Beispielwert "DuplikatDoppelteRegistrierung"). Sie enthält
    **keine Leistung, kein Inbetriebnahmedatum und kein Stilllegungsdatum.** Nicht in
    der Dokumentation: was "deaktiviert" bedeutet, welche Löschgründe es gibt und ob
    diese Einheiten zusätzlich in `EinheitenWind` oder `EinheitenSolar` stehen. Daraus
    folgt die vorab festgelegte Regel:
    - **a) Einlesen und Filtern:** Alle drei Dateien werden gelesen. Der Einheitentyp
      wird über `Einheitentypen.xml` aufgelöst; es werden die Einheiten vom Typ Wind
      und Solar weiterverarbeitet (die Auflösung steht in der Zuordnungstabelle nach
      Nr. 9).
    - **b) Pflichtprüfung vor jeder Auswertung, Ergebnis in Tabelle 1 (Abschnitt 11):**
      (i) Anzahl der Wind- und Solareinheiten in G je Typ, je Löschgrund (Katalog
      aufgelöst) und je Betriebsstatus (aufgelöst); (ii) **Überlappung:** Anzahl und
      Bruttoleistung der G-Nummern, die auch in `EinheitenWind` bzw. `EinheitenSolar_*`
      vorkommen; (iii) Anzahl der G-Nummern ohne Datensatz in den Einheitendateien.
    - **c) Keine Überlappung (Normalfall):** Eine G-Einheit ohne Datensatz in den
      Einheitendateien trägt keine Leistung und kein Datum und geht daher **nicht** in
      Bestand, Z und S ein; es wird nichts geschätzt. G-Einheiten dürfen nicht als
      Stilllegung gezählt werden, weil G weder ein Stilllegungsdatum noch eine
      Leistung enthält und "Datum der Löschung" kein Stilllegungsdatum ist. S wird
      weiterhin nur aus `DatumEndgueltigeStilllegung` und Betriebsstatus der
      Einheitendateien nach 3.4 gebildet. Gehören G-Einheiten ohne Überlappung dem
      Betriebsstatus nach zur Kategorie "endgültig stillgelegt", werden Anzahl und
      Typ berichtet (Hinweis auf nicht erfassten Stilllegungsanteil, Limitation); das
      ist kein Stopp.
    - **d) Überlappung:** Der Datensatz der Einheitendatei bleibt in der Primäranalyse
      maßgeblich nach 3.4 (nur er enthält Leistung und Daten). Übersteigt die
      Bruttoleistung der Überlappungseinheiten **0,5 % von C(τ,T)** einer Technologie
      (Setzung des SAP-Autors, von Daniel Saure beim Lesen zu bestätigen), wird
      **gestoppt** und Daniel Saure gefragt; die Überlappung ist dann nicht aus der
      Dokumentation interpretierbar (mögliche Doppelzählung). Unterhalb der Schwelle
      läuft die Analyse weiter; der Einfluss wird in **S9** gezeigt.
    - **e) Formatfehler:** Sind die Dateien nicht lesbar oder weichen die Felder von 3.6
      ab, wird gestoppt und gefragt.

## 3.6 Felddokumentation: was wörtlich belegt ist und was nicht gefunden wurde

Quelle: `rohdaten/doku/Dokumentation MaStR Gesamtdatenexport/Dokumentation MaStR
Gesamtdatenexport.pdf` (MaStR Gesamtdatenexport, Revision 26.2, 01.10.2026, 146 Seiten),
am 29.10.2026 vom SAP-Autor vollständig gelesen. Seitenzahlen sind die Seitenzahlen
des Dokuments. Das Dokument enthält keine Daten.

**Wörtlich belegt** (Typ und Pflicht laut Dokumentationstabellen; "Pflicht" bezieht sich
auf die Spalte der Dokumentation, nicht auf die tatsächliche Befüllung):

| Feld | Wortlaut der Dokumentation | Typ / Pflicht | Seite |
|---|---|---|---|
| `EinheitMastrNummer` | "MaStR-Nummer der Einheit" | String / Ja | 46, 54 |
| `DatumLetzteAktualisierung` | "Datum der letzten Aktualisierung an diesem Objekt" | dateTime / Ja | 46, 54 |
| `Inbetriebnahmedatum` | "Datum der Inbetriebnahme" | date / **Nein** | 48, 56 |
| `DatumEndgueltigeStilllegung` | "Datum der endgültigen Stilllegung der Einheit" | date / **Nein** | 48, 56 |
| `DatumBeginnVoruebergehendeStilllegung` | "Beginn der vorläufigen Stilllegung der Einheit" | date / Nein | 48, 56 |
| `DatumWiederaufnahmeBetrieb` | "Datum der Wiederaufnahme des Betriebs" | date / Nein | 48, 56 |
| `GeplantesInbetriebnahmedatum` | "Geplantes Inbetriebnahmedatum der Stromerzeugungsseinheit" | date / Nein | 48, 55 |
| `Registrierungsdatum` | "Registrierungsdatum der Einheit" | date / Ja | 48, 55 |
| `EinheitSystemstatus` | "Systemstatus der Einheit. Katalogkategorie: AnlagenSystemStatus" | int / Ja | 48, 56 |
| `EinheitBetriebsstatus` | "Betriebsstatus der Einheit. Katalogkategorie: Anlagenbetriebsstatus" | int / Ja | 48, 56 |
| `Bruttoleistung` | "Bruttoleistung in kW" | decimal / Ja | 50, 57 |
| `Nettonennleistung` | "Nettonennleistung in kW" | decimal / Ja (Wind, Solar) | 50, 57 |
| `WindAnLandOderAufSee` (nur Wind) | "Angabe, ob die Stromerzeugungseinheit an Land oder auf See errichtet wurde. Katalogkategorie: WindAnLandOderAufSee" | int / Ja | 50 |
| `Seelage` (nur Wind) | "Wird die Windenergieanlage in der Nordsee oder in der Ostsee betrieben? Katalogkategorie: Seelage" | int / Nein | 50 |
| `ArtDerSolaranlage` (nur Solar) | "Art der Solaranlage. Katalogkategorie: ArtDerSolaranlage" | int / Ja | 58 |
| `SolaranlagenKategorie` (nur Solar) | "Kategorie zum Errichtungsort der Stromerzeugungseinheit" (neu in Revision 26.2) | int / Nein | 60 |
| `ZugeordneteWirkleistungWechselrichter` (nur Solar) | "Wechselrichterleistung der Stromerzeugungseinheit" | decimal / Nein | 58 |
| `InbetriebnahmedatumAmAktuellenStandort` | "Datum der Inbetriebnahme am aktuellen Standort" | date / Nein | 53, 59 |
| `InstallierteLeistung` (`AnlagenEegWind`, `AnlagenEegSolar`; Dateien liegen nicht vor) | "Installierte Nettonennleistung der EEG-Anlage" | decimal / Nein | 124, 127 |

Weitere belegte Punkte:
- **Gelöschte und deaktivierte Einheiten** (Abschnitt 5.5.24, S. 140–141): Felder
  `DatumLetzteAktualisierung`, `EinheitMastrNummer`, `Einheittyp` ("Typ der Einheit:
  Objekt: Einheitentyp"), `EinheitSystemstatus`, `EinheitBetriebsstatus`,
  `DatumDerLoeschung` (Nein, neu in 26.2), `EinheitLoeschgrund` (Nein, neu in 26.2,
  Beispiel "DuplikatDoppelteRegistrierung"). Beschreibung: "Alle öffentlichen Daten
  der GeloeschteUndDeaktivierteEinheiten von nicht migrierten Einheiten". Die
  Feldbezeichnung der Nummer ist in der Überschriftenzeile als "EnheitMastrNummer"
  (Tippfehler), in der Tabelle als `EinheitMastrNummer` geschrieben; die tatsächliche
  Schreibweise im Export ist zu prüfen.
- **Ertüchtigungen** (5.5.25, S. 141–142): `EegMastrNummer`, `Ertuechtigungsart`,
  `ErtuechtigungIstZulassungspflichtig`, `Leistungserhoehung` ("Wert der
  Leistungserhöhung"), `WiederinbetriebnahmeDatum`. Die Datei liegt vor, wird in
  dieser Analyse aber nicht verwendet.
- **Kataloge:** `Katalogwerte.xml` mit `Id`, `Wert`, `KatalogKategorieId`;
  `Katalogkategorien.xml` mit `Id`, `Name`; `Einheitentypen.xml` mit `Id`,
  `Beschreibung` (Beispiel "Windeinheit") (S. 32, 35). Zahlencodes werden über die
  Katalogdateien aufgelöst (S. 14).
- **Zeichensatz:** UTF-16 (S. 14). **Dateiaufteilung:** Wird eine XML-Datei zu groß
  (Beispiel "100.000 Zeilen"), wird sie durchgehend nummeriert; die Dokumentation nennt
  als Beispiel "Solareinheiten_1.xml", als Dateiname "EinheitenSolar.xml" (S. 16, 53);
  im Export heißen die Dateien tatsächlich `EinheitenSolar_N.xml` (3.1).
- **Pflichtfelder:** "Nicht jedes Pflichtfeld, egal welcher Art, ist im
  Gesamtdatenexport enthalten" (S. 31); Felder "verpflichtend gemäß
  Marktstammdatenregisterverordnung" können leer sein (S. 30). Nicht-vorhanden-Felder
  erhalten ein Attribut mit Suffix `_nv` (S. 31); für `Bruttoleistung` und
  `Nettonennleistung` ist kein `_nv`-Attribut dokumentiert.
- **Quartalsexporte zu Stichtagen** (1.1., 1.4., 1.7., 1.10.) werden persistiert (S. 21).
  Sie werden in dieser Analyse nicht verwendet (Bestand wird aus dem aktuellen Stand
  rekonstruiert, 3.5 Nr. 1).

**Nicht gefunden** (nicht in der Dokumentation enthalten, deshalb im SAP nicht als
belegt geführt):
1. Eine Definition oder Abgrenzung von Bruttoleistung gegenüber Nettonennleistung
   (die Dokumentation verweist in 6.1 auf eine externe Hilfeseite "Datendefinitionen
   des Marktstammdatenregister", die nicht Teil des Pakets ist).
2. Die Aussage, dass Bruttoleistung der Modul- bzw. Generatorleistung entspricht.
3. Die Aussage, dass Nettonennleistung durch Wechselrichter oder Netzanschluss begrenzt
   ist.
4. Ein Bezug auf die Definition der installierten Leistung im EEG (§ 3).
5. Bedeutung und Wertelisten der Statuscodes (`Anlagenbetriebsstatus`,
   `AnlagenSystemStatus`) und der Lage-Codes; die Beispielzahlen sind Platzhalter.
6. Wie Einheiten mit Status "endgültig stillgelegt" ohne Stilllegungsdatum im Export
   erscheinen.
7. Was "deaktiviert" in der Datei der gelöschten und deaktivierten Einheiten bedeutet,
   welche Löschgründe es gibt und ob diese Einheiten zusätzlich in den
   Einheitendateien stehen.
8. Angaben zu Nachmeldefristen oder zur Vollständigkeit der jüngsten Monate.
9. Eine Aussage, ob bei Leistungserhöhungen (Ertüchtigungen) die Leistung der Einheit
   rückwirkend oder ab dem Änderungsdatum geführt wird.

## 4. Analysepopulation

- **Einheiten:** alle MaStR-Einheiten der Typen Wind an Land und Solar mit
  Inbetriebnahmedatum bis zum Exportdatum, nach den Regeln 3.4 und 3.5 (einschließlich
  Nr. 12). (Wind auf See als eigene Population nur für E5.)
- **Zeitraum der Bestandsreihe:** Monatsenden ab Januar 2019 bis T_S1. Der Bestand
  zu jedem Monatsende umfasst alle Einheiten seit Beginn der Registrierung. Die
  Primäranalyse nutzt die Monate bis T (Juli 2026 beim Export vom 29.10.2026).
- **Regressionspopulation:** je Technologie und Fenster die n = W + 1 Monatsende-
  Bestände (n = 13, 25, 61).
- **Ausschlüsse:** nur nach 3.5 (harte Plausibilität, fehlende Daten, Lage). Keine
  Beobachtung der Bestandsreihe wird aus inhaltlichen Gründen ausgeschlossen
  (insbesondere nicht Monate mit auffälligem Zubau).

## 5. Statistische Methoden

### 5.1 Primäranalyse

Für jede Technologie τ und jedes Fenster W ∈ {12, 24, 60}: OLS-Regression
C(τ,x) = a + b·x + ε nach 2.3 (E2), Fensterende T. Daraus: Fortschreibung,
Punktschätzung des Erreichungszeitpunkts, invertiertes 95-%-Prognoseintervall
(klassische OLS, t-Verteilung, Freiheitsgrade n−2), Wert und Intervall am
31.12.2030 (und am 31.12.2026 für E1b). Die Konfidenzintervalle für b (klassisch OLS)
gehen in E3.

| Fenster | Monate (Inkremente) | n (Bestände) | Zweck |
|---|---|---|---|
| F12 | 12 | 13 | aktueller Zubau, ein volles Saisonjahr |
| F24 | 24 | 25 | mittelfristiger Zubau, zwei Saisonjahre |
| F60 | 60 | 61 | Fünfjahresdurchschnitt, glättet Einmaleffekte |

Alle drei Fenster sind gleichrangig primär; es gibt kein bevorzugtes Fenster.
Alle Fenster umfassen ganze Kalenderjahre an Monatsinkrementen und neutralisieren
so Saisonalität im Jahresgang näherungsweise.

E1, E3 (R, ā_W) und E4 sind Berechnungen aus Bestand und Flüssen ohne
Regressionsschätzung (E3: s_W aus 5.1). Für E1 und E4 werden keine Intervalle berechnet;
sie sind Zählgrößen aus dem Register, nicht Stichprobenschätzungen.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Der Bestand ist eine kumulierte Größe; Autokorrelation der Residuen ist zu
erwarten und wird geprüft statt unterstellt. Je Technologie und Fenster werden
berichtet (alle drei Fenster, kein Weglassen):
1. **Linearität:** Residuen-gegen-Zeit-Grafik und Residuen-gegen-Fitted-Grafik.
2. **Autokorrelation:** Durbin-Watson-Statistik (und p-Wert, α = 0,05), ACF der
   Residuen. Bei n = 13 und n = 25 ist die Aussagekraft begrenzt; das Ergebnis wird
   mit diesem Vorbehalt berichtet. Eine Zusatzprüfung mit Breusch-Godfrey (Ordnung 1)
   wird nicht vorgenommen.
3. **Normalität der Residuen:** Shapiro-Wilk-Test (α = 0,05) und QQ-Plot.
   Bei n = 13 sehr geringe Trennschärfe; Hinweis im Bericht.
4. **Saisonalität des Monatszubaus (Solar, ebenso Wind deskriptiv):** Tabelle und Grafik
   des Monats-Nettozubaus N(τ,m) im 60-Monatsfenster nach Kalendermonat. Keine
   Hypothesentests.
5. **Strukturbruch / Einfluss:** Grafik der Monatsinkremente über die 60 Monate;
   Hebelwerte/Cook-Distanz je Fenster (nur Markierung von Werten mit
   Cook-Distanz > 4/n; kein Ausschluss).

**Entscheidungsregel:** Die Diagnostik ändert **nicht** die Primärspezifikation
und wählt kein Fenster aus. Sie bestimmt nur, welche Zusatzangaben im Bericht
hervorgehoben werden (5.3).

### 5.3 Korrektur bei Annahmenverletzung

Das Primärintervall bleibt das klassische OLS-Prognoseintervall (wie im Vorbild);
es ist bei autokorrelierten Residuen tendenziell zu eng. Vorab festgelegt und für
**alle** Technologie-Fenster-Kombinationen berichtet (nicht nur bei positivem Test):
- **Newey-West-HAC-Standardfehler** für b mit Lag-Wahl l = ⌊4·(n/100)^(2/9)⌋
  (ergibt l = 2, 2, 3 für n = 13, 25, 61; beim Rechnen zu verifizieren).
  Daraus ein 95-%-Konfidenzintervall für b (t-Verteilung, n−2 Freiheitsgrade),
  nebeneinander mit dem klassischen.
- **Residuen-Block-Bootstrap** (Moving-Block-Bootstrap der OLS-Residuen):
  Blocklänge ⌈n^(1/3)⌉ (= 3, 3, 4), B = 10 000 Wiederholungen, fester Seed
  20261029. Ergibt (i) ein 95-%-Perzentilintervall für den Erreichungszeitpunkt
  des Ziels 2030 (Wiederholungen mit b* ≤ 0 zählen als "nicht erreicht" und
  gehen in die obere Intervallgrenze ein) und (ii) ein 95-%-Perzentilintervall für den
  Wert am 31.12.2030 (Residuenziehung für die neue Beobachtung eingeschlossen).
Diese Ergebnisse stehen gleichberechtigt in Sensitivität S5, ersetzen das
Primärintervall aber nicht.

### 5.4 Unsicherheitsquantifizierung

- **Primär:** klassisches OLS-95-%-Prognoseintervall, invertiert nach 2.3.
- **Sensitivität:** Newey-West-Konfidenzintervall für b und Block-Bootstrap-Intervalle
  (5.3).
- Das Intervall ist **punktweise** (je Zeitpunkt) und deckt nur die Streuung um die lineare
  Gerade ab, nicht die Unsicherheit der Annahme "konstanter Zubau" (strukturelle
  Unsicherheit, 9).

### 5.5 Signifikanzniveau

Es wird kein Hypothesentest für einen Zielwert durchgeführt; das 95-%-Niveau ist
die Konvention für Prognoseintervalle (zweiseitig). Für die Diagnostiktests (Durbin-Watson,
Shapiro-Wilk) gilt α = 0,05, zweiseitig, nur zur Beschreibung. p-Werte werden nicht
für inhaltliche Aussagen über Ziele verwendet.

## 6. Sensitivitätsanalysen

**Primär** ist ausschließlich die Spezifikation der Abschnitte 2 bis 5
(Bruttoleistung, Netto-Bilanz, Fenster F12/F24/F60 enden bei T = drei Monate vor
dem Exportmonat, klassisches OLS-Prognoseintervall, MaStR). Alle folgenden
Varianten sind vorab festgelegt, werden **vollständig** berichtet und ersetzen das
Primärergebnis nicht. Ein nachträglicher Tausch von Primär und Sensitivität ist
ausgeschlossen. Kombinationen von Sensitivitäten werden nicht gebildet.

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | **Mit allen Monaten** (Nachmeldeproblem): alle Fenster enden bei T_S1 (letzter vollständiger Kalendermonat vor dem Exportdatum, September 2026 beim Export vom 29.10.2026) statt bei T; E1 unverändert; R und x(2030) beziehen sich auf T_S1 | E2, E3, E4, E1b |
| S2 | **Brutto statt Netto:** Reihe B(x) = C(T−W) + kumulierter Brutto-Zubau, Stilllegungen ignoriert; gleiche OLS-Fortschreibung | E2, E3 |
| S3 | **Kontrollrechnung mit Zweitquelle:** gleiche OLS-Fortschreibung auf der Zweitquellen-Bestandsreihe (gleiche T und Fenster, soweit die Reihe reicht und monatlich vorliegt); entfällt mit Begründung, wenn keine monatliche Reihe vorliegt | E1, E2, E3 |
| S4 | **Flussmodell (Anker am letzten Bestand, saisonneutral):** C(x) = C(T) + ā_W·x/12 mit ā_W aus 2.3; nur Punktschätzung, kein Intervall | E2 |
| S5 | **Autokorrelationsrobust:** Newey-West-KI für b und Block-Bootstrap-Intervalle (5.3) | E2, E3 |
| S6 | **Nettonennleistung** statt Bruttoleistung | E1, E2, E3, E4 |
| S7 | **Plausibilitätsfälle:** (a) harte Fälle ausgeschlossen (Primär) gegenüber (b) weiche Fälle ebenfalls ausgeschlossen; Einfluss auf C(Dez 2024) und b | E1, E2 |
| S8 | **Saisonalität (deskriptiv):** Tabelle und Grafik nach 5.2 Nr. 4; als Modellvariante dient S4 | E2 |
| S9 | **Überlappung mit gelöschten und deaktivierten Einheiten (3.5 Nr. 12):** Einheiten, deren MaStR-Nummer in `GeloeschteUndDeaktivierteEinheiten_*` und in den Einheitendateien vorkommt, werden zusätzlich aus Bestand, Z und S ausgeschlossen; Einfluss auf C(Dez 2024) und b. Besteht keine Überlappung, wird S9 als "nicht durchgeführt, Grund: keine Überlappung" berichtet | E1, E2 |

Ist eine Sensitivität mangels Daten undurchführbar (zum Beispiel S3 bei fehlender
monatlicher Zweitquellen-Reihe), wird sie als "nicht durchgeführt, Grund: …" berichtet.

**Interpretation:** Fortschreibung ist keine Prognose; keine Annahmen über Politik,
Netzausbau, Marktlage. Die Sensitivitäten prüfen nur die technische
Robustheit der Rechnung.

## 7. Umgang mit Mehrfachtestung / Multiplizität

Es gibt keine Familie von Hypothesentests gegen Nullhypothesen; formale
Adjustierung (Bonferroni, Holm) entfällt. Das Risiko ist die selektive Berichterstattung
aus den Zellen Technologie × Fenster × Estimand × Sensitivität.
1. **Alle 3 Fenster** werden für **beide** Technologien in einer Tabelle nebeneinander berichtet,
   ohne Auswahl des günstigsten oder ungünstigsten. Überschrift, Teaser und
   Grafik nennen stets die **Spanne über die drei Fenster** (frühestes bis
   spätestes Punktjahr) oder alle drei Werte; nie ein einzelnes Fenster allein.
2. **Vorab festgelegte Kernzahlen** (nur diese dürfen in Überschrift/Teaser stehen):
   (a) Δ₂₀₂₄ je Technologie (E1), (b) Punktjahr und invertiertes Intervall je Fenster
   (E2), (c) R und s_W (E3), (d) Q_W (E4), jeweils für Wind an Land und Solar.
3. Sensitivitäten S1 bis S9 sowie E1b und E5 sind sekundär und werden unabhängig vom
   Ausgang vollständig in Tabellen berichtet. Sie dürfen nicht in der Überschrift stehen.
4. Weichen Fenster oder Technologien in der Kategorie nach Abschnitt 12 ab, lautet die
   Kernaussage ausdrücklich: "Das Ergebnis hängt vom Fenster ab."
5. Jede Abweichung vom SAP wird als "Post-hoc" gekennzeichnet (Abschnitt 13).

## 8. Interpretationsrahmen / Confounder

### 8.0 Feste Prüfpunkte des Master-Templates
- **Produktions- vs. Konsum-Perspektive:** Nicht einschlägig im Emissionssinne. Die
  Analyse betrifft installierte Leistung im Inland (Standortprinzip). Eine
  Fehlinterpretation, die vermieden wird: installierte Leistung ist **nicht**
  Stromerzeugung, Anteil am Strommix oder Emissionsminderung.
- **Keine implizite Politik-/Verhaltensbewertung:** Vorab festgelegt: Der Abstand
  zwischen Fortschreibung und Ziel wird als Abstand einer mechanischen
  Fortschreibung zum Gesetzeswert beschrieben, ohne Ursachenzuschreibung und
  ohne Wertung ("Erfolg", "Versagen"). Ob der Zubau durch Politik, Märkte,
  Genehmigungen oder Netze bedingt ist, wird nicht analysiert. Die Formulierung
  bei Ziel oberhalb und unterhalb des Intervalls ist symmetrisch (Abschnitt 12).
- **Transitivitätsannahme:** nicht anwendbar (kein indirekter Vergleich).
- **Regression zur Mitte bei Trendvergleichen:** Bei Wind an Land (kleinerer Bestand)
  und Solar unterscheiden sich Niveau und Zubau stark; deshalb werden Technologien
  nur getrennt und in absoluten Größen (GW, GW pro Jahr) plus Prozent des Ziels
  berichtet, nicht gegeneinander gerankt. Ein einzelnes außergewöhnliches Jahr im
  Fenster F12 wird nicht als neuer Trend gedeutet (F24/F60 zeigen den Kontext).

### 8.1 Fortschreibung ist keine Prognose
Siehe Abschnitt 1. Die Gerade enthält keine Beschleunigung und keine
Verlangsamung. Das Ergebnis lautet "wenn der Zubau des Fensters anhält", nicht "so wird es kommen".

### 8.2 Brutto und Netto
Netto-Zubau ist Brutto-Zubau minus endgültige Stilllegungen (bestätigt, K9). Unvollständige
Stilllegungsmeldungen (3.5 Nr. 2) würden den Netto-Zubau tendenziell überzeichnen; das wird
nicht korrigiert, sondern berichtet (Limitation).

### 8.3 Nachmeldungen
Siehe 3.5 Nr. 1 und Sensitivität S1. Die jüngsten Monate sind rechtszensiert. Das
Primärfenster lässt die letzten drei Monate vor dem Export weg, um das zu mindern;
S1 zeigt die Variante mit allen Monaten. Fenster F12 ist von Unterzählung relativ
am stärksten betroffen.

### 8.4 Neutralität
Abweichungen in beide Richtungen werden mit demselben Wortlaut beschrieben.

## 9. Limitationen

- Fortschreibung unterstellt konstanten Netto-Zubau; Politik-, Markt- und Netzänderungen
  sind nicht modelliert. Extrapolation bis 2030 (und 2026) liegt außerhalb der Daten.
- Kurze Fenster (F12, n = 13) liefern breite Intervalle und sind anfällig für
  Einzelmonate; F60 kann strukturelle Änderungen im Zeitraum verwischen.
- Bestand wird aus dem aktuellen Registerstand rekonstruiert (kein historischer
  Schnappschuss); nachträgliche Korrekturen, Nachmeldungen und fehlende oder verspätete
  Stilllegungsmeldungen beeinflussen Bestand und Flüsse (3.5). Auch die Monate bis T
  können noch unterzählt sein; der Zubau der jüngsten Monate wird nicht
  berücksichtigt (T liegt drei Monate vor dem Exportmonat).
- Die aktuelle Leistung einer Einheit wird dem Inbetriebnahmemonat zugerechnet. Ob
  Leistungsänderungen bestehender Einheiten (zum Beispiel Ertüchtigungen, 3.6) in der
  Leistung rückwirkend geführt werden, ist in der Dokumentation nicht beschrieben; solche
  Änderungen werden nicht gesondert behandelt.
- Das klassische Prognoseintervall unterschätzt bei Autokorrelation die Unsicherheit;
  Newey-West und Bootstrap sind Zusatzangaben (5.3), das Intervall ist punktweise.
- Die Wahl der Bruttoleistung als Primärgröße ist eine Setzung (K6). Die
  Felddokumentation definiert Brutto- und Nettonennleistung nicht, und das Register
  nennt bei den EEG-Anlagen die Nettonennleistung "installierte Leistung" (3.3, 3.6);
  S6 zeigt den Einfluss.
- Zielwerte § 4 EEG: **amtlicher Fassungsstand nicht belegbar** (die Seite von
  gesetze-im-internet.de nennt keinen Fassungsstand); Novellen (zum Beispiel die
  Änderung vom 18.12.2025) können die Zielwerte oder ihre Bedeutung ändern; bei
  Abweichung Amendment (2.2). Gleiches gilt für die WindSeeG-Zielwerte (K3, 2.2).
- Zielvergleich 2026 ist nur als Fortschreibung möglich (Stichtag nach Export).
- Zweitquellen sind möglicherweise vom MaStR abgeleitet (3.2); der Abgleich ist
  dann keine unabhängige Bestätigung; Verfügbarkeit einer monatlichen Zweitquellen-
  Reihe ist offen.
- Repowering wird nicht herausgerechnet (3.5 Nr. 7).
- Gelöschte und deaktivierte Einheiten enthalten keine Leistung und keine Daten
  (3.5 Nr. 12); sie können in Bestand und Stilllegungen nicht nachgebildet werden. Ein
  eventuell nicht erfasster Stilllegungsanteil bleibt unberücksichtigt.
- Wind auf See (E5): Zubau in wenigen großen Schritten, lineare Fortschreibung besonders
  grob; keine Aussage zu Erzeugung oder Ursachen.
- Zahlencodes der Statuswerte sind bis zum Abgleich mit den Katalogdateien nicht belegt
  (3.5 Nr. 9).
- Datenintegrität: Für die XML-Dateien liegen SHA-256-Werte vor; die Prüfsumme der
  ZIP-Datei ist unbekannt, und 364 nicht benötigte Dateien wurden gelöscht (3.1).
  Ergebnisse gelten für den dokumentierten Datenstand des bezogenen Exports vom
  29.10.2026.

## 10. Software

R (Version im Skript-Header dokumentiert). Voraussichtliche Pakete: Pakete zum
stückweisen Einlesen großer XML-Dateien (zum Beispiel xml2 oder data.table, Wahl im
Skript dokumentiert; Zeichensatz UTF-16, 3.6), dplyr, lubridate, stats, lmtest
(Durbin-Watson), sandwich (Newey-West), ggplot2. Skript: `ausbaupfad-wind-solar.R` im
Analyseordner. Eingelesen werden nur unverändert abgelegte Rohdateien aus `rohdaten/`
(bereits entpackt, 3.1); kein Netzzugriff aus dem Skript. Der Bootstrap nutzt den Seed
20261029 (5.3). Sitzungsinformationen (Paketversionen) werden in `output/` gespeichert.
Dieser SAP enthält keinen R-Code; die Umsetzung erfolgt erst durch den analyst-Subagenten
nach dem Einfrieren.

## 11. Reporting-Plan

- **Grafik 1 (Wind an Land) und Grafik 2 (Solar):** je Technologie Monatsende-Bestand
  (MaStR, GW) bis T, die Monate nach T bis T_S1 abgesetzt gekennzeichnet (nicht in der
  Primär-Fortschreibung verwendet), **Zielpfad** (Zielwerte 2024, 2026, 2028, 2030, 2035,
  2040 als Punkte, durch Linien verbunden, Linie nur zur Orientierung) und die
  **Fortschreibung der drei Fenster** (drei Linien, deutlich unterscheidbar) mit
  den 95-%-Prognosebändern. Zielwert 2030 markiert. Gleiche Gestaltung für beide
  Technologien; getrennte Achsen.
- **Grafik 3 (Wind auf See, E5):** gleiche Gestaltung, Zielpfad 2030, 2035, 2045.
- **Tabelle 1 (Datenfluss):** Anzahl Einheiten und Leistung: Rohdatensatz, nach Duplikat-Bereinigung,
  harte Ausschlüsse, weiche Markierungen, ohne Datum, Lage. **Gelöschte und deaktivierte
  Einheiten (3.5 Nr. 12): Anzahl je Typ, Löschgrund und Betriebsstatus, Überlappung
  (Anzahl, Bruttoleistung), G-Nummern ohne Datensatz.** Exportdatum, T, T_S1,
  Dateinamen und SHA-256-Prüfung.
- **Tabelle 2 (E1, E1b):** Bestand Dez 2024, Ziel 2024, Δ in GW und %; Fortschreibung bis
  Dez 2026 je Fenster mit Intervall und Einordnung; deskriptive Hilfsgröße.
- **Tabelle 3 (je Technologie und Fenster, E2 bis E4):** Brutto-Zubau, Stilllegung,
  Netto-Zubau (GW/Jahr), Q_W, Steigung s_W mit 95-%-KI, Punktjahr (Monat/Jahr),
  invertiertes Intervall, Wert am 31.12.2030 mit [L, U], Kategorie, R, s_W/R, Diagnostik
  (DW, Shapiro-Wilk). E5 als eigene Tabelle.
- **Tabelle 4 (Sensitivitäten S1 bis S9)** und **Diagnostik-Anhang** (Residuenplots, ACF, QQ, Saisonalität).
- **Rundung:** GW mit einer Nachkommastelle; GW/Jahr mit einer Nachkommastelle; Prozent
  mit einer Nachkommastelle; Erreichungszeitpunkt als Monat/Jahr; Steigung pro Monat in GW
  mit drei Nachkommastellen im Anhang.
- **Wortwahl:** "Wenn der Netto-Zubau der letzten W Monate anhielte, würde das Ziel
  2030 im Jahr … erreicht (95-%-Intervall: … bis …)". Nicht "Prognose", nicht "Versagen",
  nicht "Verfehlung", nicht "signifikant". Der Satz "Fortschreibung ist keine Prognose"
  steht im Bericht. Das offengelegte Vorwissen (Abschnitt 0) und der Endmonat T
  (drei Monate vor dem Exportmonat) werden im Bericht genannt.
- Kernaussagen erst nach Validierung formulieren. Kanalfassungen nur über den
  Klima-Kompass-Ablauf (Substack, Instagram, Facebook, WhatsApp).

## 12. Hypothesen / Entscheidungsregeln

Es gibt keine statistischen Nullhypothesen. Vorab festgelegte Einordnungsregeln für
je Technologie τ, Fenster W und Zieljahr J ∈ {2030 (E2, E5), 2026 (E1b)}; [L, U] ist
das klassische 95-%-Prognoseintervall der Geraden am 31.12.J:

| Lage des Ziels Y_τ(J) | Einordnung (Wortlaut im Bericht) |
|---|---|
| L ≤ Y ≤ U | "Das Ziel liegt im 95-%-Prognoseintervall der Fortschreibung." |
| Y > U | "Das Ziel liegt oberhalb des 95-%-Prognoseintervalls der Fortschreibung." |
| Y < L | "Das Ziel liegt unterhalb des 95-%-Prognoseintervalls der Fortschreibung." |

Zusätzlich gilt:
- Für E1 gilt: Δ₂₀₂₄ < 0: "Bestand unter dem Zwischenziel", Δ₂₀₂₄ ≥ 0: "Bestand auf oder über dem
  Zwischenziel", jeweils mit GW und %.
- b ≤ 0: Einordnung "Zubau im Fenster nicht positiv; Ziel nicht erreicht".
- Die Einordnung wird je Fenster getrennt gemeldet. Zusammenfassung nur als "k von 3
  Fenstern".
- **Keine Gesamturteile** wie "Ziel wird erreicht/verfehlt". Zulässig: "Bei Fortschreibung des
  Fensters … liegt das Ziel …".
- Die Einordnung nach 12 (Wert am 31.12.2030) und das invertierte Intervall in 2.3
  sind zwei Darstellungen derselben Gerade, aber **nicht** immer deckungsgleich
  (punktweises Intervall, nicht monotone Grenzen möglich); beide werden berichtet, die
  Entscheidungsregel ist die Tabelle oben.

## 13. Abweichungsprotokoll

Jede Abweichung vom eingefrorenen SAP wird hier und im Ergebnisbericht als **"Post-hoc"**
gekennzeichnet, mit Datum, Grund, Wirkung auf die Ergebnisse und Entscheidung (Name).

| Nr. | Datum | Abschnitt | Abweichung | Grund | Entscheidung durch | Wirkung |
|---|---|---|---|---|---|---|
| _(leer)_ | | | | | | |

## 14. Validierungsbogen (für den validator-Subagenten)

Prüfung unabhängig gegen den **eingefrorenen** SAP (Rolle wie klinisches Statistik-Review):
- [ ] SAP-Version und Status "final" im Skript-Header und `run_log.txt` zitiert; Freigabevermerk durch Daniel Saure vorhanden und plausibel.
- [ ] Rohdateien unverändert: SHA-256 je XML-Datei wie in `PRUEFSUMMEN_xml_2026-10-29.txt`, Dateiliste wie in `PROVENIENZ.txt` (Bezugsart K4 Option a: Download und Entpacken durch Daniel Saure, ZIP-Prüfsumme unbekannt und deshalb nicht prüfbar, 364 Dateien gelöscht laut `geloeschte_dateien_2026-10-29.txt`), Exportdatum dokumentiert; T und T_S1 nach Regel 2.1 korrekt bestimmt (Juli 2026 bzw. September 2026).
- [ ] Zielwerte im Skript identisch mit 2.2 (bzw. mit Amendment nach Prüfung des Fassungsstands K2/K3); Limitation zum fehlenden Fassungsstand im Bericht genannt.
- [ ] Einheitentypen, Lage-Filter (Wind an Land), Statuslogik 3.4 korrekt umgesetzt; Rechenprobe C(m) − C(m−1) = Z − S erfüllt; Einheitendateien `EinheitenWind` und `EinheitenSolar_1` bis `_67` vollständig eingelesen (UTF-16).
- [ ] Behandlung 3.5 Nr. 1 bis 9 umgesetzt, Listen der Ausschlüsse/Markierungen vorhanden, Zuordnungstabelle Feldnamen/Statuswerte/Katalogcodes vorhanden, Größenordnungs-Sperre geprüft.
- [ ] **Gelöschte und deaktivierte Einheiten (3.5 Nr. 12):** alle drei Dateien `GeloeschteUndDeaktivierteEinheiten_1` bis `_3` eingelesen; Pflichtprüfung (Anzahlen, Überlappung, G-Nummern ohne Datensatz) in Tabelle 1; G-Einheiten nicht als Stilllegung gezählt; Stopp-Schwelle 0,5 % geprüft; S9 durchgeführt oder mit Begründung "keine Überlappung" berichtet.
- [ ] Leistungsgröße Bruttoleistung (primär) und Nettonennleistung (S6) korrekt, kW zu GW umgerechnet; Limitation zur ungeklärten Definition (3.3, 3.6) im Bericht genannt.
- [ ] Regression: n = 13/25/61, OLS, x-Achse Monate, Prognoseintervall mit t(n−2); x(2026) und x(2030) passend zu T (bei T = Juli 2026: 5 und 53); Inversion nach 2.3, Horizont 2060, Sonderfälle (b ≤ 0, Ziel erreicht).
- [ ] Alle drei Fenster, beide Technologien berichtet; keine Auswahl; Kernzahlen nach Abschnitt 7.
- [ ] E3: R aus C(T) und x(2030); s_W und ā_W beide ausgewiesen. E4: Q_W-Fenstersummen korrekt.
- [ ] Diagnostik 5.2 vollständig; Newey-West-Lag, Bootstrap (Blocklänge, B, Seed) wie festgelegt.
- [ ] Sensitivitäten S1 bis S9 vollständig (S1 = mit allen Monaten bis T_S1), auch unauffällige; keine Kombinationen.
- [ ] E5 (Wind auf See, Ziel 30 GW bis 2030) durchgeführt, nicht in Kernzahlen, nicht in Überschrift oder Teaser.
- [ ] Zweitquelle: Abgleich, Toleranz 3 %, Unabhängigkeitsvermerk, oder S3 mit Begründung "nicht durchgeführt" (blockiert nichts, K5).
- [ ] Unabhängige Stichprobennachrechnung (Bestand Dez 2024, ein Fenster) per Hand/zweitem Weg.
- [ ] Alle Abweichungen im Protokoll als "Post-hoc" gekennzeichnet; keine Kausal-/Politikaussagen, keine Prognose-Sprache im Bericht.
- [ ] Offenlegung des Vorwissens (Abschnitt 0) im Bericht vorhanden.

## 15. Zeitplan

| Schritt | Frist | Verantwortlich |
|---|---|---|
| Bezug des MaStR-Exports (K4 Option a), nur Metadaten festhalten, Dateien nicht öffnen | erledigt am 29.10.2026 | Daniel Saure |
| Zweitquellen beschaffen (optional, blockiert nichts) | bis 02.11.2026 | Daniel Saure |
| **Volltext lesen, offene Punkte aus Abschnitt 16 klären und einfrieren (Status `draft` zu `final`, Version, Datum)** | bis 03.11.2026 | Daniel Saure |
| Implementierung in R und Auswertung (analyst) | bis 09.11.2026 | analyst-Subagent |
| Validierung (validator), Validierungsbericht als Datei | bis 12.11.2026 | validator-Subagent |

Der analyst-Subagent wird erst nach dem Einfrieren aufgerufen. Fristüberschreitungen
werden im Abweichungsprotokoll vermerkt, nicht stillschweigend aufgefangen.

## 16. Klärung vor Einfrieren

| Nr. | Punkt | Stand |
|---|---|---|
| K1 | Einstufung der Präregistrierung | **beantwortet** (Daniel Saure, 29.10.2026, „Ja, prospektiv“): prospektiv mit offengelegtem Vorwissen (68 GW Wind an Land laut Suchergebnis DIW-Monitor, ungeprüft), Abschnitt 0 |
| K2 | Zielwerte § 4 EEG und Bezugszeitpunkt (31.12. des Zieljahres) | **beantwortet** (Daniel Saure, 29.10.2026, „ja einverstanden alles wie vorgeschlagen“): Zahlen und Bezug übernommen; am 29.10.2026 erneut abgerufen (gesetze-im-internet.de/eeg_2014/__4.html), Zahlen identisch, **Seite nennt keinen Fassungsstand**. Bleibt als Limitation (9) stehen: amtlicher Fassungsstand nicht belegbar, bei Abweichung Amendment; blockiert das Einfrieren nicht |
| K3 | Wind auf See als Sekundärendpunkt E5 | **beantwortet** (29.10.2026): E5 aufgenommen (30 GW bis 2030, § 1 Abs. 2 WindSeeG, Abruf 29.10.2026, ebenfalls ohne Fassungsstand), nicht in Kernzahlen (2.2, 2.3, 7) |
| K4 | Bezug der MaStR-Daten | **erledigt** (29.10.2026): Daniel Saure hat `Gesamtdatenexport_20261029_26.2` selbst im Browser geladen und in `rohdaten/` entpackt (Option a); 40 GB nicht benötigte XML-Dateien auf seine Anweisung gelöscht; Provenienz in `PROVENIENZ.txt`, `geloeschte_dateien_2026-10-29.txt`, `PRUEFSUMMEN_xml_2026-10-29.txt`; ZIP-Prüfsumme unbekannt; Dateien nicht geöffnet; T = Juli 2026 und T_S1 = September 2026 bleiben (3.1) |
| K5 | Zweitquelle (Energy-Charts, Bundesnetzagentur EE-Statistik, OWID): Lizenz, API, monatliche Auflösung, Unabhängigkeit vom MaStR | **beantwortet** (29.10.2026): nur Plausibilisierung, blockiert nichts; S3 entfällt mit Begründung, falls keine monatliche Reihe vorliegt (3.2). Beschaffung bleibt optional (Frist 02.11.2026) |
| K6 | Leistungsgröße | **beantwortet** (29.10.2026): Bruttoleistung primär, Nettonennleistung S6. **Doku-Abgleich erfolgt (3.6):** wörtlich belegt sind nur die Feldnamen "Bruttoleistung in kW" und "Nettonennleistung in kW" (Pflichtfelder bei Wind und Solar); **nicht gefunden** sind eine Definition beider Größen und die frühere Begründung (Modulleistung, Begrenzung durch Wechselrichter); die Dokumentation verweist auf eine externe Hilfeseite. **Gegenläufiger Hinweis:** `InstallierteLeistung` der EEG-Anlagen heißt laut Dokumentation "Installierte Nettonennleistung der EEG-Anlage". Entscheidung bleibt; **zur Kenntnisnahme von Daniel Saure beim Lesen des Volltextes** (3.3, 9) **Nachtrag 29.10.2026:** Daniel Saure lässt Brutto trotz des Hinweises zu `InstallierteLeistung` primär („Vorschläge so lassen“); die externe Seite „Datendefinitionen“ wird nicht geprüft. |
| K7 | Technische Setzungen: Plausibilitätsschwellen (3.5 Nr. 4), 1-%-Schwelle ohne Stilllegungsdatum (3.5 Nr. 2), Toleranz 3 % (3.2), Größenordnungs-Sperre 0,5- bis 2-fach (3.3), Bootstrap (Blocklänge ⌈n^(1/3)⌉, B = 10 000, Seed 20261029), Suchhorizont 2060 | **beantwortet** (29.10.2026): Standardwerte wie im Text bestätigt |
| K8 | Primärfenster-Ende | **beantwortet** (Daniel Saure, 29.10.2026, „2. ja bis 3 monate“): Primär endet drei Monate vor dem Exportmonat (T = Juli 2026 beim Export vom 29.10.2026); Variante mit allen Monaten ist S1 (T_S1 = September 2026); Datenstand liegt vor (K4), Endmonate damit festgeschrieben |
| K9 | Netto = Brutto-Zubau minus endgültige Stilllegungen, kein Herausrechnen von Repowering | **beantwortet** (29.10.2026): bestätigt |
| K10 | Zwischenziel 2026 als Fortschreibung (E1b) statt Ist-Vergleich | **beantwortet** (29.10.2026): E1b nur als Fortschreibung bestätigt |
| K11 | **Neu:** Behandlung der Dateien `GeloeschteUndDeaktivierteEinheiten_*` (3.5 Nr. 12), Stopp-Schwelle 0,5 % von C(τ,T), Sensitivität S9 | **Anweisung von Daniel Saure umgesetzt** (Analyst muss die Dateien berücksichtigen); die konkrete Regel einschließlich der Schwelle 0,5 % ist ein **Vorschlag des SAP-Autors, von Daniel Saure beim Lesen des Volltextes zu bestätigen**, weil die Dokumentation nur Felder, aber keine Leistung und keine Stilllegungsdaten für diese Einheiten nennt (3.6). **Nachtrag 29.10.2026:** Daniel Saure hat Regel, Schwelle 0,5 % und S9 im Chat bestätigt („Vorschläge so lassen“); das ersetzt nicht das Lesen des Volltextes. |

**Freigabe:** Freigegeben durch Daniel Saure am 29.10.2026 (siehe Kopf).
