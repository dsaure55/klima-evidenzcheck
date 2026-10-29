# Statistischer Analyseplan (SAP) – Ausbaupfad Wind an Land und Solar

**Titel:** Wann werden die gesetzlichen Ausbauziele für Windenergie an Land und
Solar (§ 4 EEG) erreicht, wenn der Zubau der letzten Monate anhält? Fortschreibung
des installierten Bestands laut Marktstammdatenregister, brutto und netto,
mit drei vorab festgelegten Fenstern (12, 24 und 60 Monate).

**Format:** Klima Kompass · Evidenzcheck (neue SAP-Analyse; Gate: Validierungsbericht ohne "kritisch").
**Version:** 0.1 (**draft**)
**Datum:** 29.10.2026
**Autor:in:** Claude (sap-autor-Subagent)
**Status: draft. Nicht eingefroren. Nicht freigegeben.**
**Freigabe:** _(leer; wird ausschließlich von Daniel Saure nach Lektüre des Volltextes eingetragen)_
**Einstufung der Präregistrierung (vorläufig):** exploratory (retrospektiv), solange Daniel Saure nicht anders entscheidet. Begründung in Abschnitt 0 und Klärungspunkt K1.

**Geplanter Ordner:** `Analysen/2026-10-ausbaupfad-wind-solar/`

**Versionshistorie:**
- **v0.1 draft (29.10.2026):** Erstentwurf auf Grundlage des Auftrags vom 29.10.2026. Keine Daten gesichtet, kein Code ausgeführt.

**Hinweis zur Vorlage:** Gerüst ist `SAP-Vorlage/SAP-Template.md` (Abschnitte 0–11 in
derselben Nummerierung). Projektspezifische Ergänzungen über das Template hinaus:
Abschnitt 12 (Entscheidungsregeln), 13 (Abweichungsprotokoll), 14 (Validierungsbogen),
15 (Zeitplan), 16 (Klärung vor Einfrieren). Format und Methodik orientieren sich an
`SAP_DE-Emissionen-Trendprojektion-2040.md` (OLS-Trend, 95-%-Prognoseintervall,
mehrere vorab festgelegte Fenster, Durbin-Watson) und
`SAP_prognose-check-projektionsberichte.md` (Aufbau, Sensitivitäten, Integritäts-Checks).

---

## 0. Status dieser Analyse

[ ] Präregistriert (SAP vor Datenzugriff verfasst und eingefroren)
[x] Exploratorisch (vorläufige Einstufung, siehe unten)

- **Ablauf prospektiv.** Dieser SAP ist vor jedem Datenzugriff und vor jedem Code
  geschrieben. Es wurden keine MaStR-Daten, keine Energy-Charts-Zeitreihen und
  keine Zubauzahlen der Bundesnetzagentur gesichtet. Es wurde kein Code ausgeführt.
- **Hinweis auf mitgeliefertes Vorwissen (Pflichtangabe).** Dem SAP-Autor wurde im
  Auftrag eine Zahl zum Gegenstand der Analyse mitgeliefert: Aus einem
  Suchergebnis (pv magazine zum DIW-Monitor, Februar 2026, **nicht geprüft**,
  Originalquelle nicht gelesen) soll Wind an Land bei rund 68 GW liegen, und
  Photovoltaik soll deutlich näher am Pfad liegen als Wind. Die Zeitreihen
  selbst wurden nicht gesichtet. Diese Angabe berührt den Estimand E1
  (Abstand des Bestands zum Zwischenziel 2024). Nach der Regel des SAP-Autors
  macht mitgelieferte Zahl zum Ergebnis die Präregistrierung ungültig; der SAP
  wird deshalb vorläufig als **"Status: exploratory (retrospektiv)"** geführt.
  Gegenargument, das Daniel Saure abwägen kann: Die Zahl stammt aus einer
  ungeprüften Sekundärquelle, ist kein Ergebnis dieser Analyse, und alle Fenster,
  Modelle und Regeln unten wurden unabhängig davon festgelegt. Die Entscheidung
  (prospektiv mit offengelegtem Vorwissen oder exploratorisch) liegt bei Daniel
  Saure vor dem Einfrieren (K1). Die Angabe gehört in jedem Fall in den
  Ergebnisbericht.
- **Keine Erwartung.** Dieser SAP enthält keine Aussage darüber, welches Ergebnis
  erwartet wird. Jeder Ausgang (Ziel im Intervall, oberhalb, unterhalb, je
  Technologie und Fenster verschieden) wird veröffentlicht.
- **Kein Sichten der Rohdaten vor dem Einfrieren.** Zwischen Download und
  Einfrieren (Abschnitt 15) werden nur Metadaten festgehalten (Dateiname, Größe,
  Prüfsumme, Exportdatum der Quelle, Download-Datum). Die Dateiinhalte werden
  nicht geöffnet und nicht ausgewertet.
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
  ausgewertet; es wird nie über Technologien summiert.**
- Monat m: Kalendermonat; Monatsende-Bestand C(τ,m) = installierte Leistung in GW
  (Definition 3.4) am letzten Tag des Monats m.
- T: letzter **vollständige Kalendermonat vor dem Exportdatum** des
  Gesamtdatenexports (Stichtag der Daten). Das Exportdatum wird beim Download
  festgehalten; T wird nach dieser Regel bestimmt, nicht nach Sichtung der Daten.
- Fenster W ∈ {12, 24, 60} Monate. Das Fenster W umfasst die **n = W + 1**
  Monatsende-Bestände C(τ,T−W), …, C(τ,T), also genau W Monatsinkremente.
- Zubau (brutto) Z(τ,m): Summe der Leistung der Einheiten mit Inbetriebnahmedatum
  im Monat m. Stilllegung S(τ,m): Summe der Leistung der Einheiten mit Datum der
  endgültigen Stilllegung im Monat m. Netto-Zubau N(τ,m) = Z(τ,m) − S(τ,m).
- Ziele Y_τ(j) laut 2.2 für Jahr j. Bezugszeitpunkt: **Bestand am 31.12. des
  Zieljahres** (Annahme des SAP; Klärungspunkt K2).
- x: Zeitachse in Monaten ab T (x = 0 am Monatsende T; x = −W … 0 im Fenster).
  x(j) = Anzahl Monate von T bis zum 31.12.j.

### 2.2 Gesetzliche Ziele (installierte Leistung in GW)

Quelle: gesetze-im-internet.de, § 4 EEG, Seite "nichtamtliches Inhaltsverzeichnis",
abgerufen am 29.10.2026 vom Auftraggeber; **Fassungsstand nicht angegeben.
Vor dem Einfrieren gegen die amtliche Fassung und mögliche Novellen prüfen (K2).**

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

**Windenergie auf See:** folgt dem WindSeeG. Ein Zielwert von 30 GW bis 2030 ist
nur ein **Suchergebnis, nicht belegt**. Wind auf See ist **kein** Gegenstand dieses
SAP. Er wird nur dann als Sekundärendpunkt aufgenommen, wenn vor dem Einfrieren
ein Primärbeleg (WindSeeG im amtlichen Wortlaut) gefunden und als Amendment
eingetragen wird. Sonst ausgeschlossen (K3). Einheiten "auf See" werden aus der
Windpopulation ausgeschlossen (3.3).

### 2.3 Estimands

Alle Estimands werden für jede Technologie τ getrennt definiert und berichtet.

**E1 (primär) – Abstand des Bestands zum Zwischenziel 2024.**
Δ₂₀₂₄(τ) = C(τ, Dezember 2024) − Y_τ(2024), in GW und in % von Y_τ(2024)
(Vorzeichen: negativ = Bestand unter dem Ziel). Bestand aus dem Gesamtdatenexport
mit dem Datenstand des Exports (rückwirkend vervollständigt, 3.5).

**E1b (sekundär) – Zwischenziel 2026.** Der Stichtag 31.12.2026 liegt nach dem
Exportdatum; ein Vergleich Ist gegen Ziel ist daher für 2026 **nicht möglich**
und wird nicht vorgetäuscht. Stattdessen: Fortschreibung bis 31.12.2026 nach E2
(gleiche Methode, drei Fenster), Wert mit 95-%-Prognoseintervall gegen Y_τ(2026),
Einordnung nach Abschnitt 12. Zusätzlich deskriptiv: Abstand von C(τ,T) zum
linear zwischen den Zielwerten 2024 und 2026 interpolierten Zielwert für den
Monat T (Hilfsgröße; das Gesetz legt nur Jahreswerte fest).

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
R(τ) = (Y_τ(2030) − C(τ,T)) / ((x(2030)) / 12) in GW pro Jahr. Verglichen wird R
mit dem Zubau der drei Fenster: s_W = 12·b_W (OLS-Steigung, GW pro Jahr, mit
klassischem 95-%-Konfidenzintervall) als Modellgröße; zusätzlich als deskriptive
Kontrollgröße der arithmetische Mittelwert ā_W = 12·(C(τ,T) − C(τ,T−W))/W.
Kennzahl: Verhältnis s_W / R (Anteil des nötigen Zubaus, den das Fenster
liefert) und Differenz R − s_W. Ist R ≤ 0 (Ziel bereits erreicht), steht
"Ziel erreicht".

**E4 (primär) – Anteil der Stilllegungen am Bruttozubau (Brutto/Netto).**
Q_W(τ) = ΣS(τ,m) / ΣZ(τ,m), summiert über die W Monate x = −W+1 … 0 des
Fensters, in %. Berichtet zusätzlich Brutto-Zubau, Stilllegung und Netto-Zubau in
GW pro Jahr je Fenster. Ist ΣZ = 0, steht "nicht definiert".

**Ausdrücklich nicht Gegenstand:** Aussagen über Ursachen (Genehmigungen, Förderung,
Netzanschluss, Flächen), Stromerzeugung (installierte Leistung ist nicht
Erzeugung), Wind auf See (sofern nicht per Amendment, 2.2), Bewertung der Ziele
oder von Politik, Prognose künftiger Politik, Fortschreibung auf 2028, 2035, 2040,
Summe Wind plus Solar.

## 3. Datenquelle

**Template-Pflichtfelder (werden beim Datenzugriff ausgefüllt, im `run_log.txt` gespiegelt):**
- Quelle(n): siehe 3.1 bis 3.2
- Zugriffsdatum: [TT.MM.JJJJ – beim Download eintragen]
- Datenstand laut Quelle / Exportdatum: [beim Download eintragen]
- Lizenz/Nutzungsbedingungen: [je Quelle beim Download eintragen]

### 3.1 Primärquelle: Marktstammdatenregister (MaStR), Bundesnetzagentur
- **Einheitentypen:** Windenergie (nur Lage "an Land") und Solar (alle
  Solareinheiten, einschließlich Freiflächen-, Dach- und steckerfertiger
  Anlagen; keine Unterteilung nach Lage in der Primäranalyse).
- **Felder (Bezeichnungen im Export beim Download zu verifizieren, 3.5):**
  eindeutige Einheitennummer (MaStR-Nummer), Einheitentyp/Technologie, Lage
  (an Land / auf See, nur Wind), Inbetriebnahmedatum, Betriebsstatus, Datum der
  endgültigen Stilllegung, Bruttoleistung, Nettonennleistung, Datum der letzten
  Aktualisierung (falls vorhanden), Standortangaben (nur für optionale
  deskriptive Repowering-Abschätzung, 3.5).
- **Zugang:** Gesamtdatenexport (große Datei) oder Webservice. Primär ist der
  **Gesamtdatenexport**, weil nur er einen festen, nachvollziehbaren Datenstand liefert.
- **Download nur nach ausdrücklicher Zustimmung von Daniel Saure (K4).**
  Vor dem Download werden Daniel Saure **Dateiname** (voraussichtlich nach dem
  Muster `Gesamtdatenexport_<Datum>_<Version>.zip`, aus dem Gedächtnis; an der
  Download-Seite zu verifizieren), **Quelle (URL der Bundesnetzagentur/MaStR)**
  und **Größe** genannt. Ohne Zustimmung erfolgt kein Download und kein
  Webservice-Abruf.
- Ablage unverändert unter `rohdaten/`, Prüfsumme im `run_log.txt`.

### 3.2 Zweitquelle (Plausibilisierung und Fallback), nur offene Quellen
1. **Fraunhofer ISE Energy-Charts**, installierte Netto-Leistung, monatliche Werte
   für Windenergie an Land und Solar (Download durch Daniel Saure).
2. **Bundesnetzagentur Zubauzahlen** (veröffentlichte Statistik zu Zubau Wind an Land und Solar).
3. **Our World in Data** (jährliche installierte Leistung Wind und Solar
   Deutschland) nur, falls einschlägig, nur als grober Größenordnungs-Abgleich
   des Jahresend-Bestands; Wind dort möglicherweise nur als Summe an Land plus
   auf See (nicht geprüft), dann nicht vergleichbar mit Wind an Land.

**Verwendung:**
- Als **Kontrollrechnung (Sensitivität S3)**: gleiche Fortschreibung auf Basis
  der Energy-Charts-Reihe (nur Bestand, daher nur E1, E2, E3; kein E4).
- Als **Plausibilisierung**: Abweichung des Jahresend-Bestands 2024 (und
  des letzten gemeinsamen Monats) zwischen MaStR-Rekonstruktion und Zweitquelle.
  Relative Abweichungen über **3 %** werden im Bericht ausgewiesen und erläutert,
  ändern aber die Primärquelle nicht. Zusätzlich werden die Erreichungszeitpunkte
  (Punktschätzung) beider Quellen nebeneinander berichtet.
- Als **Fallback** nur, wenn die Zustimmung zum MaStR-Download nicht erteilt wird
  oder der Zugriff nachweislich scheitert. Das erfordert vor der Auswertung ein
  Amendment (neue Estimand-Beschreibung: E4 entfällt, E1 bis E3 mit Bestandsreihe
  der Zweitquelle). Bei Abweichung hat die Primärquelle Vorrang.
- **Unabhängigkeitsvorbehalt:** Es ist zu prüfen (K5), ob Energy-Charts und die
  Zubauzahlen der Bundesnetzagentur ihrerseits auf dem MaStR beruhen. Falls ja, ist
  der Abgleich eine Kontrolle der Aufbereitung, kein unabhängiger Beleg; das wird im
  Bericht so benannt.

### 3.3 Festlegung der Leistungsgröße

**Primär: Bruttoleistung der Einheit** (MaStR-Feld). **Sensitivität S6:
Nettonennleistung.**

Begründung: Die Zielzahlen des § 4 EEG gelten für die **installierte Leistung**.
Als Maß für installierte Leistung eignet sich die Leistung des Erzeugers
(bei Solar die Modulleistung, bei Wind die Generator-Nennleistung), nicht die
am Netzanschluss begrenzte Leistung. Die Nettonennleistung kann durch
Wechselrichter oder Netzanschluss begrenzt sein und läge dann unter der
installierten Modulleistung. Der Autor stützt das auf allgemeine Kenntnis der
MaStR-Felder, **nicht auf eine geprüfte Quelle**. Vor dem Einfrieren zu prüfen
gegen die Definition der installierten Leistung im EEG (§ 3) und die Felddokumentation
des MaStR (K6). Kommt die Prüfung zu einem anderen Ergebnis, wird die Primärgröße
vor dem Einfrieren geändert, nicht danach.

- **Einheit:** MaStR-Leistungen in kW (laut Export zu verifizieren). Umrechnung
  in GW: kW / 1 000 000. Größenordnungs-Sperre: Liegt C(τ, Dez 2024) nicht
  zwischen dem 0,5-Fachen und dem 2-Fachen von Y_τ(2024), wird die Analyse gestoppt
  und Daniel Saure gefragt (Hinweis auf Einheiten- oder Importfehler; die Sperre
  sagt nichts über ein erwartetes Ergebnis).
- **Wind an Land:** Einheiten mit Lage "auf See" werden ausgeschlossen. Fehlt die Lage,
  siehe 3.5 Punkt 5.

### 3.4 Definition Bestand und Flüsse

Eine Einheit zählt am Monatsende m zum Bestand, wenn (a) das Inbetriebnahmedatum
≤ Monatsende m liegt und (b) sie nicht bis einschließlich Monatsende m endgültig
stillgelegt ist (Datum der endgültigen Stilllegung ≤ Monatsende m **und**
Betriebsstatus "endgültig stillgelegt"). **Vorübergehend stillgelegte Einheiten
bleiben im Bestand.** Einheiten "in Planung" oder ohne Inbetriebnahmedatum zählen
nicht. Zubau Z(τ,m) und Stilllegung S(τ,m) werden aus denselben Einheiten und denselben
Datumsfeldern gebildet, sodass C(τ,m) − C(τ,m−1) = Z(τ,m) − S(τ,m) exakt gilt
(Rechenprobe im Output).

### 3.5 Bekannte MaStR-Eigenheiten und vorab festgelegte Behandlung

1. **Nachmeldungen / Rechtszensierung.** Einheiten werden teils nachträglich
   registriert. Die jüngsten Monate sind im Export deshalb systematisch
   unterzählt; der Bestand wird aus dem aktuellen Stand rekonstruiert, nicht aus
   früheren Momentaufnahmen. Behandlung: Das Primärfenster endet bei T
   (alle Monate bis zum letzten vollständigen Monat). **Sensitivität S1** schneidet
   die letzten 3 Monate ab (Fenster enden bei T−3, E3 nutzt dann ebenfalls
   C(τ,T−3) und x(2030) ab T−3). Eine Nachmeldekorrektur (Hochrechnung) wird
   **nicht** vorgenommen.
2. **Stilllegungsmeldungen.** Auch Stilllegungen können verspätet oder gar nicht
   gemeldet sein. Eine Korrektur erfolgt nicht; das wird als Limitation berichtet.
   Einheiten mit Status "endgültig stillgelegt" **ohne Stilllegungsdatum** werden
   im Bestand belassen (kein Netto-Abzug) und mit Anzahl und Leistung ausgewiesen.
   Übersteigt ihre Leistung 1 % des Bestands C(τ,T) einer Technologie, wird gestoppt
   und Daniel Saure gefragt (K7). Einheiten mit Stilllegungsdatum, aber Status
   ungleich "endgültig stillgelegt", gelten als nicht stillgelegt und werden gelistet.
   Einheiten mit Stilllegungsdatum vor dem Inbetriebnahmedatum werden gelistet
   und als nicht stillgelegt behandelt.
3. **Dubletten.** Maßgeblich ist die MaStR-Nummer. Mehrfach vorkommende Nummern
   (zum Beispiel über mehrere Exportdateien) werden auf einen Datensatz reduziert
   (der mit dem jüngsten Aktualisierungsdatum, falls vorhanden, sonst der erste in
   fester Dateireihenfolge). Verschiedene Nummern mit identischen Standort-,
   Datums- und Leistungsangaben werden **nicht** entfernt (können echte
   Parallel-Einheiten sein), aber gezählt und gelistet.
4. **Plausibilität der Leistungswerte.** Harte Schwellen (technisch):
   fehlende oder ≤ 0 Bruttoleistung; Wind an Land Bruttoleistung > 20 000 kW;
   Solar Bruttoleistung > 1 000 000 kW. Harte Fälle werden ausgeschlossen und mit
   Nummer, Leistung und Grund gelistet. **Weiche Schwellen** (nur Markierung, bleiben
   im Datensatz): Wind > 10 000 kW; Solar > 300 000 kW; Nettonennleistung größer
   als Bruttoleistung. Die Schwellen sind Setzungen des SAP-Autors (K7), keine
   Quellenangabe.
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
   Sonderbehandlung: Stilllegung und Neubau sind getrennte Ereignisse in S und Z; im
   Netto-Zubau gleichen sie sich rechnerisch aus. Der Brutto-Zubau enthält die
   Leistung der Ersatzanlage, E4 den ersetzten Teil. Optional und rein deskriptiv:
   Abschätzung des Anteils von Stilllegungen mit Neubau im gleichen Standort (nur,
   wenn die Standortfelder eine eindeutige Zuordnung erlauben; keine Kennzahl für
   Überschrift oder Teaser, kein Eingang in E1 bis E4).
8. **Stichtag und Exportdatum.** Exportdatum (laut Quelle), Download-Datum und
   T werden im `run_log.txt` festgehalten. Ein später erscheinender neuerer Export
   wird während der Analyse **nicht** eingemischt.
9. **Feldnamen.** Die tatsächlichen Feldnamen und Statuswerte des Exports werden vor
   der Auswertung gegen die Felddokumentation abgeglichen und in einer Zuordnungstabelle
   im Analyseordner festgehalten. Passt ein Statuswert in keine der obigen
   Kategorien, wird gestoppt und gefragt.
10. **Unbekannte Eigenheiten.** Zeigt sich nach dem Einfrieren eine bisher nicht
    beschriebene Eigenheit, die Ergebnisse berühren könnte, gilt die
    Regel: Stopp, Rückfrage, Eintrag im Abweichungsprotokoll (Abschnitt 13), keine
    stillschweigende Behandlung.

## 4. Analysepopulation

- **Einheiten:** alle MaStR-Einheiten der Typen Wind an Land und Solar mit
  Inbetriebnahmedatum bis zum Exportdatum, nach den Regeln 3.4 und 3.5.
- **Zeitraum der Bestandsreihe:** Monatsenden ab Januar 2019 bis T (damit alle Fenster
  mit W ≤ 60 sowie der Bestand Dezember 2024 abgedeckt sind). Der Bestand
  zu jedem Monatsende umfasst alle Einheiten seit Beginn der Registrierung.
- **Regressionspopulation:** je Technologie und Fenster die n = W + 1 Monatsende-
  Bestände (n = 13, 25, 61).
- **Ausschlüsse:** nur nach 3.5 (harte Plausibilität, fehlende Daten, Wind auf See). Keine
  Beobachtung der Bestandsreihe wird aus inhaltlichen Gründen ausgeschlossen
  (insbesondere nicht Monate mit auffälligem Zubau).

## 5. Statistische Methoden

### 5.1 Primäranalyse

Für jede Technologie τ und jedes Fenster W ∈ {12, 24, 60}: OLS-Regression
C(τ,x) = a + b·x + ε nach 2.3 (E2). Daraus: Fortschreibung, Punktschätzung des
Erreichungszeitpunkts, invertiertes 95-%-Prognoseintervall (klassische OLS, t-Verteilung,
Freiheitsgrade n−2), Wert und Intervall am 31.12.2030 (und am 31.12.2026 für E1b).
Die Konfidenzintervalle für b (klassisch OLS) gehen in E3.

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
(Bruttoleistung, Netto-Bilanz, Fenster F12/F24/F60 enden bei T, klassisches OLS-
Prognoseintervall, MaStR). Alle folgenden Varianten sind vorab festgelegt, werden
**vollständig** berichtet und ersetzen das Primärergebnis nicht. Ein nachträglicher
Tausch von Primär und Sensitivität ist ausgeschlossen. Kombinationen von
Sensitivitäten werden nicht gebildet.

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | **Ohne die letzten 3 Monate** (Nachmeldeproblem): alle Fenster enden bei T−3; E1 unverändert; R und x(2030) beziehen sich auf T−3 | E2, E3, E4, E1b |
| S2 | **Brutto statt Netto:** Reihe B(x) = C(T−W) + kumulierter Brutto-Zubau, Stilllegungen ignoriert; gleiche OLS-Fortschreibung | E2, E3 |
| S3 | **Kontrollrechnung mit Zweitquelle:** gleiche OLS-Fortschreibung auf der Energy-Charts-Bestandsreihe (gleiche T und Fenster, soweit die Reihe reicht) | E1, E2, E3 |
| S4 | **Flussmodell (Anker am letzten Bestand, saisonneutral):** C(x) = C(T) + ā_W·x/12 mit ā_W aus 2.3; nur Punktschätzung, kein Intervall | E2 |
| S5 | **Autokorrelationsrobust:** Newey-West-KI für b und Block-Bootstrap-Intervalle (5.3) | E2, E3 |
| S6 | **Nettonennleistung** statt Bruttoleistung | E1, E2, E3, E4 |
| S7 | **Plausibilitätsfälle:** (a) harte Fälle ausgeschlossen (Primär) gegenüber (b) weiche Fälle ebenfalls ausgeschlossen; Einfluss auf C(Dez 2024) und b | E1, E2 |
| S8 | **Saisonalität (deskriptiv):** Tabelle und Grafik nach 5.2 Nr. 4; als Modellvariante dient S4 | E2 |

Ist eine Sensitivität mangels Daten undurchführbar (zum Beispiel S3 bei zu kurzer
Zweitquellen-Reihe), wird sie als "nicht durchgeführt, Grund: …" berichtet.

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
   (E2), (c) R und s_W (E3), (d) Q_W (E4).
3. Sensitivitäten S1 bis S8 sind sekundär und werden unabhängig vom Ausgang vollständig in
   einer Tabelle berichtet. Eine Sensitivität darf nicht in der Überschrift stehen.
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
Netto-Zubau ist Brutto-Zubau minus endgültige Stilllegungen. Unvollständige
Stilllegungsmeldungen (3.5 Nr. 2) würden den Netto-Zubau tendenziell überzeichnen; das wird
nicht korrigiert, sondern berichtet (Limitation).

### 8.3 Nachmeldungen
Siehe 3.5 Nr. 1 und Sensitivität S1. Die jüngsten Monate sind rechtszensiert; Fenster F12 ist
davon relativ am stärksten betroffen.

### 8.4 Neutralität
Abweichungen in beide Richtungen werden mit demselben Wortlaut beschrieben.

## 9. Limitationen

- Fortschreibung unterstellt konstanten Netto-Zubau; Politik-, Markt- und Netzänderungen
  sind nicht modelliert. Extrapolation bis 2030 (und 2026) liegt außerhalb der Daten.
- Kurze Fenster (F12, n = 13) liefern breite Intervalle und sind anfällig für
  Einzelmonate; F60 kann strukturelle Änderungen im Zeitraum verwischen.
- Bestand wird aus dem aktuellen Registerstand rekonstruiert (kein historischer
  Schnappschuss); nachträgliche Korrekturen, Nachmeldungen und fehlende oder verspätete
  Stilllegungsmeldungen beeinflussen Bestand und Flüsse (3.5).
- Das klassische Prognoseintervall unterschätzt bei Autokorrelation die Unsicherheit;
  Newey-West und Bootstrap sind Zusatzangaben (5.3), das Intervall ist punktweise.
- Lage der Leistungsgröße: Bruttoleistung als installierte Leistung ist nicht abschließend
  gegen die Rechtsdefinition geprüft (K6).
- Zielwerte stammen aus einem "nichtamtlichen Inhaltsverzeichnis" ohne Fassungsstand;
  Novellen oder abweichende Bezugszeitpunkte (K2) können die Zielwerte oder ihre
  Bedeutung ändern.
- Zielvergleich 2026 ist nur als Fortschreibung möglich (Stichtag nach Export).
- Zweitquellen sind möglicherweise vom MaStR abgeleitet (3.2); der Abgleich ist
  dann keine unabhängige Bestätigung.
- Repowering wird nicht herausgerechnet (3.5 Nr. 7).
- Keine Aussage zu Wind auf See (2.2), zu Erzeugung oder zu Ursachen.
- Ergebnisse gelten für den dokumentierten Datenstand des Exports.

## 10. Software

R (Version im Skript-Header dokumentiert). Voraussichtliche Pakete: Pakete zum Einlesen
großer XML-/CSV-Dateien (zum Beispiel xml2 oder data.table, Wahl im Skript
dokumentiert), dplyr, lubridate, stats, lmtest (Durbin-Watson), sandwich
(Newey-West), ggplot2. Skript: `ausbaupfad-wind-solar.R` im Analyseordner.
Eingelesen werden nur unverändert abgelegte Rohdateien aus `rohdaten/`; kein
Netzzugriff aus dem Skript. Der Bootstrap nutzt den Seed 20261029 (5.3).
Sitzungsinformationen (Paketversionen) werden in `output/` gespeichert. Dieser SAP
enthält keinen R-Code; die Umsetzung erfolgt erst durch den analyst-Subagenten nach dem Einfrieren.

## 11. Reporting-Plan

- **Grafik 1 (Wind an Land) und Grafik 2 (Solar):** je Technologie Monatsende-Bestand
  (MaStR, GW) bis T, **Zielpfad** (Zielwerte 2024, 2026, 2028, 2030, 2035, 2040 als
  Punkte, durch Linien verbunden, Linie nur zur Orientierung) und die
  **Fortschreibung der drei Fenster** (drei Linien, deutlich unterscheidbar) mit
  den 95-%-Prognosebändern. Zielwert 2030 markiert. Gleiche Gestaltung für beide Technologien;
  getrennte Achsen.
- **Tabelle 1 (Datenfluss):** Anzahl Einheiten und Leistung: Rohdatensatz, nach Duplikat-Bereinigung,
  harte Ausschlüsse, weiche Markierungen, ohne Datum, Wind auf See ausgeschlossen. Exportdatum, T.
- **Tabelle 2 (E1, E1b):** Bestand Dez 2024, Ziel 2024, Δ in GW und %; Fortschreibung bis
  Dez 2026 je Fenster mit Intervall und Einordnung; deskriptive Hilfsgröße.
- **Tabelle 3 (je Technologie und Fenster, E2 bis E4):** Brutto-Zubau, Stilllegung,
  Netto-Zubau (GW/Jahr), Q_W, Steigung s_W mit 95-%-KI, Punktjahr (Monat/Jahr),
  invertiertes Intervall, Wert am 31.12.2030 mit [L, U], Kategorie, R, s_W/R, Diagnostik
  (DW, Shapiro-Wilk).
- **Tabelle 4 (Sensitivitäten S1 bis S8)** und **Diagnostik-Anhang** (Residuenplots, ACF, QQ, Saisonalität).
- **Rundung:** GW mit einer Nachkommastelle; GW/Jahr mit einer Nachkommastelle; Prozent
  mit einer Nachkommastelle; Erreichungszeitpunkt als Monat/Jahr; Steigung pro Monat in GW
  mit drei Nachkommastellen im Anhang.
- **Wortwahl:** "Wenn der Netto-Zubau der letzten W Monate anhielte, würde das Ziel
  2030 im Jahr … erreicht (95-%-Intervall: … bis …)". Nicht "Prognose", nicht "Versagen",
  nicht "Verfehlung", nicht "signifikant". Der Satz "Fortschreibung ist keine Prognose"
  steht im Bericht. Das mitgelieferte Vorwissen (Abschnitt 0) wird offengelegt.
- Kernaussagen erst nach Validierung formulieren. Kanalfassungen nur über den
  Klima-Kompass-Ablauf (Substack, Instagram, Facebook, WhatsApp).

## 12. Hypothesen / Entscheidungsregeln

Es gibt keine statistischen Nullhypothesen. Vorab festgelegte Einordnungsregeln für
je Technologie τ, Fenster W und Zieljahr J ∈ {2030 (E2), 2026 (E1b)}; [L, U] ist das
klassische 95-%-Prognoseintervall der Geraden am 31.12.J:

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
- [ ] Rohdateien unverändert (Prüfsumme), Exportdatum, T nach Regel 2.1 bestimmt.
- [ ] Zielwerte im Skript identisch mit 2.2 (bzw. mit Amendment nach Prüfung K2).
- [ ] Einheitentypen, Lage-Filter (Wind an Land), Statuslogik 3.4 korrekt umgesetzt; Rechenprobe C(m) − C(m−1) = Z − S erfüllt.
- [ ] Behandlung 3.5 Nr. 1 bis 9 umgesetzt, Listen der Ausschlüsse/Markierungen vorhanden, Größenordnungs-Sperre geprüft.
- [ ] Leistungsgröße Bruttoleistung (primär) und Nettonennleistung (S6) korrekt, kW zu GW umgerechnet.
- [ ] Regression: n = 13/25/61, OLS, x-Achse Monate, Prognoseintervall mit t(n−2); Inversion nach 2.3, Horizont 2060, Sonderfälle (b ≤ 0, Ziel erreicht).
- [ ] Alle drei Fenster, beide Technologien berichtet; keine Auswahl; Kernzahlen nach Abschnitt 7.
- [ ] E3: R aus C(T) und x(2030); s_W und ā_W beide ausgewiesen. E4: Q_W-Fenstersummen korrekt.
- [ ] Diagnostik 5.2 vollständig; Newey-West-Lag, Bootstrap (Blocklänge, B, Seed) wie festgelegt.
- [ ] Sensitivitäten S1 bis S8 vollständig, auch unauffällige; keine Kombinationen.
- [ ] Zweitquelle: Abgleich, Toleranz 3 %, Unabhängigkeitsvermerk.
- [ ] Unabhängige Stichprobennachrechnung (Bestand Dez 2024, ein Fenster) per Hand/zweitem Weg.
- [ ] Alle Abweichungen im Protokoll als "Post-hoc" gekennzeichnet; keine Kausal-/Politikaussagen, keine Prognose-Sprache im Bericht.
- [ ] Offenlegung des Vorwissens (Abschnitt 0) im Bericht vorhanden.

## 15. Zeitplan

| Schritt | Frist | Verantwortlich |
|---|---|---|
| Datenbeschaffung (MaStR-Gesamtdatenexport nach Zustimmung K4; Zweitquellen), nur Metadaten festhalten, Dateien nicht öffnen | bis 02.11.2026 | Daniel Saure (Zustimmung und Download) |
| Klärung offener Punkte (Abschnitt 16), Prüfung und Einfrieren (Status `draft` zu `final`, Version, Datum) | bis 03.11.2026 | Daniel Saure |
| Implementierung in R und Auswertung (analyst) | bis 09.11.2026 | analyst-Subagent |
| Validierung (validator), Validierungsbericht als Datei | bis 12.11.2026 | validator-Subagent |

Der analyst-Subagent wird erst nach dem Einfrieren aufgerufen. Fristüberschreitungen
werden im Abweichungsprotokoll vermerkt, nicht stillschweigend aufgefangen.

## 16. Klärung vor Einfrieren

| Nr. | Punkt | Entscheidung |
|---|---|---|
| K1 | Einstufung: prospektiv mit offengelegtem Vorwissen oder "exploratory (retrospektiv)" wegen der mitgelieferten Zahl (ca. 68 GW, Wind an Land; Quelle pv magazine/DIW-Monitor, ungeprüft) | offen |
| K2 | Zielwerte § 4 EEG: Abgleich mit amtlicher Fassung und möglichen Novellen; Fassungsstand; Bezugszeitpunkt (Jahresende?) und Wortlaut ("Windenergie an Land", "Solar") | offen |
| K3 | Windenergie auf See: Primärbeleg (WindSeeG) vor Einfrieren gefunden? Sonst ausgeschlossen | offen |
| K4 | Ausdrückliche Zustimmung zum MaStR-Download (Dateiname, Quelle, Größe werden vorab genannt); Wiederverwendung eines eventuell schon vorhandenen MaStR-Materials im Ordner der Analyse "batteriespeicher-dunkelflaute" (Datenstand, Einheitentypen; wurde nicht geöffnet) | offen |
| K5 | Zweitquellen: Beschaffung der Dateien (Energy-Charts, Bundesnetzagentur Zubauzahlen), Lizenz, Prüfung der Unabhängigkeit vom MaStR | offen |
| K6 | Leistungsgröße: Bruttoleistung primär bestätigen (Prüfung gegen EEG-Definition und MaStR-Felddokumentation) | offen |
| K7 | Technische Setzungen: Plausibilitätsschwellen (3.5 Nr. 4), 1-%-Schwelle ohne Stilllegungsdatum (3.5 Nr. 2), Toleranz 3 % (3.2), Größenordnungs-Sperre 0,5- bis 2-fach (3.3), Bootstrap-Parameter und Seed, Suchhorizont 2060 | offen |
| K8 | Primärfenster endet bei T (inkl. der jüngsten, unterzählten Monate), Abschneiden der letzten 3 Monate nur als S1: bestätigen oder umkehren (Entscheidung jetzt, nicht nach Sichtung) | offen |
| K9 | Definition Netto = Brutto-Zubau minus endgültige Stilllegungen (vorübergehend stillgelegt bleibt im Bestand), kein Herausrechnen von Repowering: bestätigen | offen |
| K10 | Behandlung des Zwischenziels 2026 als Fortschreibung (E1b) statt Ist-Vergleich: bestätigen | offen |

**Freigabe:** _(leer; wird nur von Daniel Saure nach Lektüre des Volltextes eingetragen)_
