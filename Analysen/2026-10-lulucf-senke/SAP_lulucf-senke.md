# Statistischer Analyseplan (SAP) – Evidenzcheck LULUCF-Senke

**Titel:** Wie weit ist der deutsche Sektor Landnutzung, Landnutzungsänderung und
Forstwirtschaft (LULUCF) von den Senkenzielen des § 3a Klimaschutzgesetz
entfernt, und wo läge der gesetzliche 4-Jahres-Mittelwert 2030, wenn der Trend der
Vergangenheit unverändert fortgeschrieben würde?

**Format:** Klima Kompass · Evidenzcheck (neue SAP-Analyse; Gate: Validierungsbericht
ohne „kritisch").
**Version:** 0.2
**Datum:** 29.10.2026
**Autor:in:** Claude (sap-autor-Subagent). Entwurf, noch nicht von einem Menschen als Volltext geprüft.
**Status: draft.** Nicht eingefroren. Der Analyst-Subagent darf erst nach Einfrieren
(Status `final`) gestartet werden.
**Freigabe:** _________________________ Datum: __________ (leer; steht aus)

**Geplanter Ordner:** `Analysen/2026-10-lulucf-senke/`

**Versionshistorie:**
- **v0.1 draft (29.10.2026):** Erstentwurf, verfasst vor Datenzugriff und vor Code.
  Zu diesem Zeitpunkt war nur der Einzelwert 26,9 Mt (2025) aus einer
  Pressemitteilung als Vorwissen bekannt.
- **v0.2 draft (29.10.2026):** Einarbeitung des Klärungsstands vom 29.10.2026 (Antworten
  von Daniel Saure zu K1 und K5; Belege aus der Quellenrecherche zu K2–K4, K6–K8, K12;
  siehe Abschnitt 12) und des **erweiterten, offengelegten Vorwissens** (Abschnitt 0).
  Änderungen im Text: (a) Abschnitt 0 neu gefasst (erweiterte Offenlegung); (b) Y = 2024
  festgelegt, Primärreihe **mit Holzprodukten (HWP)**, Datenquellen UBA-Tabelle (PDF)
  und UBA Data Cube (Abschnitt 3); (c) Fenster D (ab 2022) als rein deskriptiv
  definiert, Bruchjahr-Kandidat B\* ∈ {2017, 2018} eingeführt, Sensitivität S6
  entsprechend umgebaut (Abschnitt 4.2, 6); (d) S4 und S5 als bedingt
  durchführbar formuliert; (e) neuer Abschnitt 5.7 mit Methodenparametern als
  **Vorschlag, von Daniel zu bestätigen**; (f) Abschnitt 12 aktualisiert
  (beantwortet/belegt vs. offen); die Anhänge „Klärungsstand" und „Ergänzung
  29.10.2026" der Datei v0.1 sind in die Abschnitte 0 und 12 integriert.
  **Unverändert gegenüber v0.1 sind:** die drei Kernfenster A, B, C, das
  Primärfenster B, das Modell (OLS auf Jahreswerten), die Intervallformel, die
  Entscheidungsregeln 5.6 und die Kernzahlen (Abschnitt 7). Die unter (c)–(e)
  genannten Änderungen wurden **nach** Kenntnis des erweiterten Vorwissens
  vorgenommen (siehe Abschnitt 0, Punkt „Wirkung auf den SAP").

**Hinweis zur Vorlage:** Gerüst ist `SAP-Vorlage/SAP-Template.md`. Alle Abschnitte 0–11
der Vorlage sind vorhanden und in derselben Nummerierung belegt (zusätzlich 5.6
„Entscheidungsregeln" und 5.7 „Methodenparameter"). Die Abschnitte 12–17 sind
projektspezifische Ergänzungen (Klärung vor Einfrieren, Rohdateien, Validierungsbogen,
Zeitplan, Abweichungsprotokoll, Amendments). Formatvorbilder: SAP Prognose-Check
Projektionsberichte (Struktur, Sensitivitäten, Multiplizität) und SAP
DE-Emissionen-Trendprojektion-2040 (OLS-Trend, 95-%-Prognoseintervall, drei Fenster,
ARIMA-Kontrolle, Durbin-Watson).

---

## 0. Status dieser Analyse

[x] Präregistriert, **prospektiv mit offengelegtem Vorwissen** (SAP vor Datenzugriff auf die Zeitreihe und vor Code verfasst; Einfrieren steht noch aus)
[ ] Exploratorisch

**Entscheidung zum Status:** Daniel Saure hat am 29.10.2026 (Chat, „Ja, prospektiv", und
erneut nach Offenlegung des erweiterten Vorwissens unten) entschieden, die Analyse als
„prospektiv mit offengelegtem Vorwissen" zu führen (Klärung K1, beantwortet). Nach der
strengen Regel des SAP-Autors („mitgelieferte Zahlen zu Ergebnissen machen die
Präregistrierung ungültig") wäre „exploratory (retrospektiv)" die Alternative gewesen; sie
wurde ausdrücklich nicht gewählt. Diese Spannung bleibt im Dokument sichtbar.

- **Kein Datenzugriff auf die Zeitreihe.** Für diesen SAP wurde die Zeitreihe E(y)
  (Jahreswerte 1990 bis 2024) nicht eingesehen, es wurde nichts heruntergeladen, kein
  Code geschrieben oder ausgeführt. Es wurden keine Analyseergebnisse und keine Grafiken
  mitgeliefert.
- **Offengelegtes Vorwissen (vollständig):**
  1. *Pressemitteilung Thünen/UBA vom 14.03.2026* (Suchergebnis, nicht geprüft; die
     Pressemitteilung selbst ließ sich bei der Recherche nicht abrufen, zu viele
     Weiterleitungen): Der Sektor Landnutzung war **2025 mit rund 26,9 Mt CO2-Äq. eine
     Quelle**. Laut UBA-Seite ist das eine als „unsicher" eingestufte Schätzung, kein
     Inventarwert (Klärung K3).
  2. *Aggregatwerte der UBA-Seite „Emissionen der Landnutzung, -änderung und
     Forstwirtschaft"* (Stand „zuletzt aktualisiert am 02.07.2026"). Diese Seite hat nicht
     der sap-autor, sondern der **Orchestrator (Claude, Top-Level-Session)** bei der
     Quellenrecherche am 29.10.2026 mit einem Zusammenfassungswerkzeug abgerufen
     (nicht wörtlich geprüft) und dabei folgende Werte gesehen: Gesamtsektor rund
     **+36 Mt (1990)** und rund **+58 Mt (2024)** (laut Seite 59 Prozent über 1990);
     Kategorienwerte 2024: **Wald 2,1 Mt** (Quelle), **Ackerland 17,5**,
     **Grünland 24,2**, **Moore 52,2**, **Feuchtgebiete 9,0** (Mt; Abgrenzung der
     Kategorien, insbesondere Moore gegenüber Feuchtgebieten, ungeprüft).
     **Die Jahreswerte 1991 bis 2023 wurden nicht gesehen.**
  3. *Sekundärquellen zum Zeitpunkt des Übergangs* (Öko-Institut, Spektrum, DUH,
     WKO; Suchergebnisse vom 29.10.2026, nicht geprüft): Sie nennen 2017/2018 als Jahr, ab
     dem die lebende Waldbiomasse zur Quelle wurde (Bundeswaldinventur 2022 deckt 2012
     bis 2022). Das ist Vorwissen über die Form der Reihe (siehe 4.2, Bruchjahr-Kandidat).
- **Wirkung auf den SAP (ehrlich):** Das Vorwissen unter Punkt 2 erlaubt dem Auftraggeber
  eine Erwartung über den Ausgang von E1 und E2. Dieser SAP trifft selbst keine Aussage über
  erwartete Ergebnisse. Die Kernfestlegungen (Fenster A, B, C und Primärfenster B, Modell,
  Intervallformel, Entscheidungsregeln 5.6, Kernzahlen) wurden in v0.1 **vor** Kenntnis
  der Punkte 2 und 3 getroffen und in v0.2 nicht verändert. Die Entscheidungsregeln sind
  symmetrisch (Erreichen, Verfehlen, unentschieden) und nicht auf eine Richtung
  zugeschnitten. **Nach** Kenntnis wurden in v0.2 festgelegt: Y = 2024, Primärreihe mit HWP,
  Bruchjahr-Kandidat B\* und die Struktur von S6, die Fensterdefinition D sowie die
  Vorschläge in 5.7. Der Validator prüft das (Validierungsbogen V1, V6).
  Bestätigung des Primärfensters B (K5) durch Daniel am 29.10.2026; die Wahl
  stammt aus v0.1. Der Zeitpunkt dieser Bestätigung relativ zur erweiterten Offenlegung
  ist nicht dokumentiert.
- **Ergebnisoffenheit:** Die Analyse kann ein Verfehlen, ein Erreichen oder keine
  eindeutige Aussage zeigen. Jeder Ausgang wird veröffentlicht, unabhängig vom Vorwissen.
- **Inhaltsstufe:** Evidenzcheck (neue Analyse). Parallele Evidenzchecks sind seit
  23.10.2026 zulässig. Sperren aus dem SAP Prognose-Register 2027 (Sperren 1 bis 3)
  berühren diese Analyse laut Prüfung vom 29.10.2026 nicht (Klärung K12, beantwortet).

## 1. Hintergrund / Rationale

Der Sektor LULUCF (Wald, Acker, Grünland, Feuchtgebiete, Siedlungen, Holzprodukte)
ist der einzige Sektor, der nach dem Klimaschutzgesetz (KSG) von einer Quelle zur
**Netto-Senke** werden soll. § 3a KSG legt dafür Zielwerte fest. Laut Abruf von
gesetze-im-internet.de am 29.10.2026 (Zusammenfassungswerkzeug, nicht wörtlich geprüft;
Fassung: Ausfertigung 12.12.2019, zuletzt geändert durch Art. 1 G v. 15.7.2024, BGBl. 2024 I
Nr. 235; **Volltext vor Einfrieren zu lesen, Klärung K2**) gilt nach § 3a Abs. 1:

> Der **Mittelwert der jährlichen Emissionsbilanzen aus dem Zieljahr und den drei
> vorhergehenden Kalenderjahren** soll **bis 2030 mindestens −25 Mt CO2-Äq.**, **bis
> 2040 mindestens −35 Mt** und **bis 2045 mindestens −40 Mt** betragen
> (Datengrundlage nach § 5 Abs. 2 Nr. 3 KSG).

Öffentliche Darstellungen (Dashboards, Pressemitteilungen) nennen meist den Einzeljahreswert
des letzten Inventarjahres. Der gesetzliche Maßstab ist aber ein **gleitender
4-Jahres-Mittelwert**. Für Journalismus, Politikberatung und Öffentlichkeit ist
relevant:

1. Wie weit ist der **jüngste gesetzliche Messwert** (4-Jahres-Mittel 2021 bis 2024) vom
   Ziel 2030 entfernt?
2. Wo läge der gesetzliche Messwert 2030, wenn der **Trend der Vergangenheit**
   fortgeschrieben würde, und wie unsicher ist diese Fortschreibung?
3. Wie groß müsste die jährliche Verbesserung sein, verglichen mit dem, was in den
   letzten Jahren zu beobachten war?
4. Wie groß ist der Abstand zum Ziel 2045 (Ziel Netto-Null-Jahr), ohne Annahmen über
   technische CO2-Entnahme?

**Begriffliche Einordnung (gilt für SAP und Bericht):** Eine Trendfortschreibung ist
**keine Prognose**. Sie beantwortet nur: „Was käme heraus, wenn die lineare
Entwicklung des Fensters unverändert weiterliefe?" Sie enthält keine Annahmen über
Maßnahmen, Waldzustand, Holzernte, Witterung oder Störungen. Die Zeitreihe ist
inventarbasiert und wird rückwirkend revidiert (u. a. durch neue Stichprobeninventuren
wie die Bundeswaldinventur und Methodenwechsel im Inventar). Ein Teil des
„Trends" kann deshalb Messmethodik statt Landnutzung abbilden (Abschnitt 6, 8, 9).

**Vorzeichen- und Wortkonvention (verbindlich):** E(y) = jährliche Netto-Emissionsbilanz
des Sektors in Mt CO2-Äq. **Positiv = Quelle, negativ = Senke.** „Verbesserung" bedeutet
eine Verringerung der Netto-Emission (E bzw. M wird kleiner, also negativer). Ein
„Abstand zum Ziel" ist positiv, wenn der Messwert über (also schlechter als) dem
Zielwert liegt.

## 2. Fragestellung (Estimand)

### 2.1 Notation

- y = Kalenderjahr; s = Submission der Treibhausgasinventare (Berichtsjahr der
  Meldung); Referenz-Submission s\* = Submission 2026 (Abschnitt 3.2).
- E(y) = Netto-Emissionsbilanz des Sektors LULUCF im Jahr y in Mt CO2-Äq.,
  Reihe der **Primärgröße: Sektor LULUCF einschließlich Holzprodukten (HWP)**
  (Abschnitt 3.1, Klärung K4).
- **Y = 2024** = letztes Berichtsjahr mit Inventarwert in der Referenz-Submission 2026
  (laut UBA-Seite, Stand 02.07.2026; Klärung K3). Weicht die Datei beim Zugriff davon ab:
  Stopp und Rückfrage.
- **M(T) = [E(T) + E(T−1) + E(T−2) + E(T−3)] / 4** = gesetzlicher Messwert
  (4-Jahres-Mittel) für das Zieljahr T. M(T) ist nur definiert, wenn alle vier
  Jahreswerte vorliegen; die erste auswertbare Stelle ist M(1993). **Der jüngste
  gesetzliche Messwert ist M(2024)** = Mittel der Jahre 2021 bis 2024 (Inventarwerte).
  Ein Messwert M(2025) (Jahre 2022 bis 2025) existiert nur mit dem Schätzwert für 2025
  und ist ausschließlich Sensitivität S7.
- Z30 = −25, Z40 = −35, Z45 = −40 (Mt CO2-Äq.), vorbehaltlich Volltext-Prüfung (K2).
- „Zielbereich" für Zieljahr T: M(T) ≤ Z(T).
- **Abstand D(T) = M(Y) − Z(T)** (Mt). D > 0: der jüngste Messwert liegt über dem
  Zielwert (Ziel nicht erreicht); D ≤ 0: Messwert im Zielbereich.
- Fenster W(a): Beobachtungsjahre a, a+1, …, Y. n(W) = Y − a + 1.

### 2.2 Estimands

**E1 (primär) – Abstand des jüngsten Messwerts zum Ziel 2030.**
D30 = M(2024) − Z30 in Mt, zusammen mit M(2024) selbst und den vier zugrunde liegenden
Jahreswerten E(2021) … E(2024). Rein deskriptiv, keine Unsicherheitsangabe
(Messwert der Referenz-Submission; Revisionsspanne siehe S4).
Ergänzend (deskriptiv, gleiche Formel): D40 und D45 als Kontext (E4).

**E2 (primär) – Trendfortschreibung des 4-Jahres-Mittels 2030 mit 95-%-Prognoseintervall.**
Für jedes der drei Fenster A, B, C (Abschnitt 4.2) wird das Modell
E(y) = α + β·y + ε(y), geschätzt mit OLS über y ∈ W, angepasst. Zielgröße ist das
Mittel der vier künftigen Jahreswerte 2027, 2028, 2029, 2030:

M̂(2030) = α̂ + β̂ · 2028,5

(2028,5 ist der Mittelwert der Jahre 2027–2030; wegen der Linearität ist das
Mittel der vier Modellwerte gleich dem Modellwert bei 2028,5. Alle vier Jahre liegen
nach Y = 2024, daher werden für 2027–2030 keine Beobachtungswerte verwendet.)

**95-%-Prognoseintervall für das Mittel von vier künftigen Jahreswerten (primär,
klassisch):**

M̂(2030) ± t(0,975; n−2) · s · √( 1/4 + 1/n + (2028,5 − ȳ)² / Sxx )

mit s = Residual-Standardabweichung (n−2 Freiheitsgrade), ȳ = Mittel der
Beobachtungsjahre des Fensters, Sxx = Summe der quadrierten Abweichungen der Jahre von
ȳ. Der Term 1/4 behandelt die vier künftigen Fehler als unabhängig; bei positiv
autokorrelierten Residuen ist das Intervall tendenziell zu eng (siehe 5.3, S1).

Berichtet werden je Fenster: n, β̂ (Mt pro Jahr), M̂(2030), Untergrenze L und Obergrenze
U des Intervalls, Kategorie nach 5.6, Abstand M̂(2030) − Z30.

**E3 (primär) – Nötige jährliche Verbesserung im Vergleich zur beobachteten.**
- **Nötige Rate:** r_req = (Z30 − M(2024)) / 6 in Mt pro Jahr (Veränderung des
  4-Jahres-Mittels pro Jahr zwischen dem letzten Messwert und dem Zieljahr; 2030 − 2024 = 6).
  r_req < 0 bedeutet nötige Verbesserung. Ist M(2024) ≤ Z30 (D30 ≤ 0), ist
  r_req ≥ 0 und der Vergleich entfällt („Zielbereich bereits im jüngsten Messwert
  erreicht", ausdrücklich ohne Aussage über 2030).
- **Beobachtete Rate (drei Varianten, alle berichtet):**
  (i) r_obs(W) = OLS-Steigung β̂ der Jahreswerte E(y) in Fenster W (A, B, C); die
  Steigung eines linearen Trends der Jahreswerte ist zugleich die Veränderung des
  4-Jahres-Mittels pro Jahr; mit 95-%-Konfidenzintervall (klassisch) und
  Newey-West-Intervall (S2);
  (ii) r_obs5 = [M(2024) − M(2019)] / 5 (beobachtete Veränderung des 4-Jahres-Mittels in
  den letzten 5 Jahren);
  (iii) r_obs10 = [M(2024) − M(2014)] / 10.
- **Verhältnis Q = r_req / r_obs**, nur berechnet, wenn r_req < 0 und r_obs < 0
  (Verbesserungen in beide Richtungen). Ist r_obs ≥ 0, wird kein Quotient gebildet;
  berichtet wird: „In diesem Fenster/Zeitraum ist keine Verbesserung zu beobachten,
  die Rate ist nicht vergleichbar." Q für die Grenzen des Konfidenzintervalls von β̂
  nur, wenn das gesamte Intervall < 0 liegt.

**E4 (primär) – Einordnung Netto-Null 2045.**
D45 = M(2024) − Z45 in Mt, ergänzt um D40 = M(2024) − Z40. Rein deskriptiv, **ohne
Annahmen über CO2-Entnahme** (CDR, technische Senken). **Keine Trendfortschreibung auf
2040 oder 2045**, auch nicht als Sensitivität (Extrapolationshorizont ≥ 15 Jahre; vorab
ausgeschlossen).

**Ausdrücklich nicht Gegenstand:** Wirkungsanalyse von Maßnahmen (z. B. Wiedervernässung,
Waldumbau), Ursachenzuschreibung für Veränderungen der Senke, Prognose der
tatsächlichen Zielerreichung, Bewertung der Ziele selbst, Aussagen über Netto-Null
für die Gesamtemissionen.

### 2.3 Eindeutigkeit (Zwei-Analysten-Regel)

Aus den Angaben in 2.1–2.2 und 5.1 folgt eindeutig: gleiche Daten (Referenz-Submission 2026,
Primärreihe mit HWP, Y = 2024), gleiche drei Fenster, OLS auf Jahreswerte,
Prognoseintervall nach der Formel in 2.2 (t-Verteilung, n−2 Freiheitsgrade, 1/4-Term),
gleiche Kategorien nach 5.6. Abweichende Rundung ändert keine Kategorie (Entscheidung auf
ungerundeten Werten).

## 3. Datenquelle

**Template-Pflichtfelder (beim Datenzugriff ausgefüllt, im `run_log.txt` gespiegelt):**
- Quelle(n): siehe 3.1–3.3
- Zugriffsdatum: [TT.MM.JJJJ – beim Datenzugriff eintragen]
- Datenstand laut Quelle: Submission 2026 (Inventarjahre 1990–2024), UBA-Seite und
  UBA-Tabelle mit Stand 02.07.2026; Inventarbericht 2026 (UBA Climate Change 30/2026) –
  Dateiname, Größe und Veröffentlichungsdatum beim Zugriff eintragen
- Lizenz/Nutzungsbedingungen: [je Quelle beim Datenzugriff eintragen; Lizenz der UBA-Daten
  und des Data Cube ist nicht geprüft (K13); klimadashboard.de laut Auftrag CC BY 4.0]

### 3.1 Primärquelle

**UBA – Nationale Treibhausgasinventare / Nationaler Inventarbericht (NIR), Submission
2026:** Sektor LULUCF, jährliche Netto-Emissionsbilanz in Mt CO2-Äq., 1990 bis 2024, soweit
vorhanden nach Kategorien (Wald, Acker, Grünland, Feuchtgebiete, Siedlungen,
Holzprodukte (HWP)). Konkrete Bezugsdateien (Klärung K7, geklärt):
1. **UBA-Tabelle (PDF):**
   `https://www.umweltbundesamt.de/system/files/medien/384/bilder/dateien/2_Tab_Emi-Senken-LULUCF_2026-07-02.pdf`
2. **UBA Data Cube (interaktiv):**
   `https://datacube.uba.de/vis?lc=de&df%5bid%5d=DF_CLIMATE_EMISSIONS_GHG_TRENDS_KSG`
   (ein CSV-Download ist auf der UBA-Seite nicht genannt; Entnahme aus dem Data Cube nur
   nach Zustimmung, siehe 3.4).
3. **Inventarbericht 2026** (UBA Climate Change 30/2026) für die Belege zu GWP-Basis (K10),
   Strukturbruch/Neuberechnungen (K6) und Abgrenzung.

Die Pressemitteilung Thünen/UBA vom 14.03.2026 ist **keine** Datenquelle der Analyse.
klimadashboard.de (CC BY 4.0) und Thünen-Institut-Daten dienen, falls verfügbar und mit
Zustimmung beschafft, nur der Übertragungskontrolle. Bei Abweichung > 0,1 Mt gilt die
UBA-/NIR-Fassung; die Abweichung wird dokumentiert.

**Definition der Primärreihe E(y) (Klärung K4, weitgehend belegt):**
Die **Primärreihe schließt Holzprodukte (HWP) ein.** Grundlage (Abruf vom 29.10.2026,
Zusammenfassungswerkzeug, nicht wörtlich geprüft): Die UBA-Seite führt HWP unter den
Kohlenstoffpools des Sektors; Anlage 1 Nr. 7 KSG nennt „Holzprodukte" ausdrücklich als Teil
des Sektors; § 5 Abs. 2 Nr. 3 KSG erwähnt sie nicht. **Rest-Klärung vor Einfrieren:**
Anlage 1 KSG im Volltext (und gegebenenfalls eine Verordnung zu § 3a KSG) prüfen. Ergibt
die Prüfung das Gegenteil, wird die Primärreihe vor Einfrieren geändert; nach Datensicht
nicht mehr.
Sensitivität „ohne HWP" (S5) nur, wenn HWP als eigene Jahreswerte in den beschafften
Dateien ausgewiesen ist; sonst „nicht durchgeführt, Grund: …".

### 3.2 Version der Zeitreihe und Umgang mit Revisionen

- **Referenz-Submission s\*:** Submission **2026** (veröffentlicht, UBA-Seite Stand
  02.07.2026; Klärung K8, geklärt), Inventarjahre 1990 bis **Y = 2024**. Wird bis zum
  Zugriff eine neuere vollständige Fassung veröffentlicht, wird das vor dem Zugriff an
  Daniel gemeldet; es wird nicht stillschweigend gewechselt.
- Die Version wird beim Datenzugriff mit Bezeichnung, Veröffentlichungsdatum und
  Dateiname im `run_log.txt` festgehalten und **danach nicht mehr gewechselt**, auch wenn
  während der Analyse eine neuere Fassung erscheint. Eine spätere Revision führt höchstens zu
  einem gekennzeichneten Amendment/Nachtrag, nicht zu einer Änderung der Primärauswertung.
- **Revisionen früherer Submissions (bekanntes Problem):** Alle Primärergebnisse stützen
  sich ausschließlich auf die Referenz-Submission. **Ob** deren gesamte Reihe 1990–2024
  mit derselben Methodik (insbesondere mit den Daten der Bundeswaldinventur 2022) rückwirkend
  neu berechnet wurde, ist **nicht geklärt**; Beleg am Inventarbericht (K6). Frühere
  Submissions (**2025, 2024, 2023**) werden nur in Sensitivität S4 und in der
  Revisionstabelle verwendet, **nur wenn ohne großen Aufwand beschaffbar** (K9); sonst
  dokumentiert als „nicht durchgeführt". Reihen verschiedener Submissions werden nie zu
  einer Reihe zusammengesetzt (kein „Splicing").

### 3.3 Sekundärquelle (nur Plausibilisierung, siehe CLAUDE.md)

**Our World in Data / Global Carbon Project (Landnutzungsänderung, CO2).** Andere
Definition (Bookkeeping-Modelle, andere Systemgrenze, nur CO2, keine
KSG-/UNFCCC-Abgrenzung). **Nicht gleichsetzen** und nicht in Kennzahlen verwenden;
Verwendung nur für einen groben Größenordnungs- und Vorzeichenvergleich (Grafik im
Anhang, ohne Schwellenwert). Bei Abweichung hat die UBA-Reihe Vorrang. Fallback auf OWID
nur bei dokumentiertem Zugriffsproblem auf die Primärquelle und nur nach Amendment.

### 3.4 Beschaffung

Der Netzzugang der Cloud-Session zu Behördenservern ist voraussichtlich eingeschränkt.
**Das Herunterladen der PDF-Tabelle und jede Datenentnahme aus dem Data Cube braucht vorab die
ausdrückliche Zustimmung von Daniel Saure**; dabei werden Dateiname, Quelle und Größe
genannt (Klärung K7, offener Rest). Ablage **unverändert** unter `rohdaten/` im
Analyseordner, Zugriffsdatum und Quelle im `run_log.txt`. Liste in Abschnitt 13.
**Für diesen SAP wurde nichts heruntergeladen.**

### 3.5 Datenqualität und Integritäts-Checks (vor jeder Auswertung)

1. **Vollständigkeit:** Jahreswerte für jedes Jahr 1990–2024 ohne Lücke; fehlende Werte →
   Stopp und Rückfrage (kein Auffüllen, keine Interpolation).
2. **Vorzeichen, Einheit, Gase, GWP:** Einheit Mt CO2-Äq.; Vorzeichen Quelle positiv /
   Senke negativ (Konvention der Quelle gegen die Konvention dieses SAP abgleichen, ggf.
   Umkehr dokumentieren); enthaltene Gase (CO2, CH4, N2O) festhalten. Die
   **GWP-Basis (AR4/AR5)** ist auf der UBA-Seite nicht genannt und aus Suchergebnissen
   nicht belegt; sie wird dem Inventarbericht 2026 entnommen (K10) und hier eingetragen:
   GWP-Basis = [____]. Es wird nichts angenommen.
3. **Extraktion aus der PDF-Tabelle:** Ist die Tabelle nicht maschinenlesbar, werden die
   Werte in eine Extraktionstabelle übertragen (Fundstelle: Seite, Zeile/Spalte), mit
   **doppelter unabhängiger Übertragung**; jede Differenz wird vor der Auswertung aufgelöst.
   Zusätzlich Abgleich der Jahreswerte gegen den UBA Data Cube (stichprobenartig alle
   Jahre der Fenster C und der Randjahre 1990, 2010, 2024; bei Zugriff nach Zustimmung).
4. **Summenprüfung:** Summe der Kategorien (inkl. HWP, falls separat ausgewiesen) = Sektor-
   gesamt, absolute Toleranz 0,5 Mt (Rundung; relative Toleranz ist bei Werten nahe
   null ungeeignet). Abweichungen werden dokumentiert, nicht korrigiert.
5. **Übertragungskontrolle:** UBA-/NIR-Reihe gegen klimadashboard.de/Thünen-Reihe (falls
   beschafft), Toleranz 0,1 Mt je Jahr; Differenzen vor Auswertung auflösen und dokumentieren.
6. **Abgrenzungs-Check:** Es wird festgehalten, welche Zeile der Quelle als „Sektor LULUCF
   inkl. HWP" verwendet wird (Fundstelle: Datei, Seite/Blatt, Zeile) und ob HWP separat
   ausgewiesen ist.
7. **Vorläufige Werte:** Als vorläufig gekennzeichnete Jahreswerte werden markiert; sie
   bleiben in der Primäranalyse enthalten und werden in S3 ausgeschlossen.
8. **Plausibilisierung gegen OWID/GCP:** nur grafisch, Vorzeichen und Größenordnung.
9. **Erhebungsbruch-Dokumentation:** Es wird dokumentiert, ob und ab welchem Jahr neue
   Datengrundlagen (Bundeswaldinventur 2022, Methodenwechsel) in die Referenz-Submission
   eingegangen sind und ob die Reihe rückwirkend konsistent ist (K6). Der Check ändert die
   Primärauswertung nicht.

Bei Unstimmigkeiten, die sich nach diesen Regeln nicht auflösen lassen: Analyse
stoppen, Rückfrage an Daniel.

## 4. Analysepopulation

### 4.1 Einheit

Jahresbeobachtung E(y) der Primärreihe (LULUCF inkl. HWP) aus der Referenz-Submission 2026,
y = 1990, …, 2024 (**n = 35**). Kein Ausschluss von Jahren; kein Ausschluss von
Störungs-, Corona- oder Kalamitätsjahren. Der gesetzliche Messwert M(T) wird aus je vier
aufeinanderfolgenden Jahreswerten gebildet (Reihe M(1993) … M(2024)).

### 4.2 Fenster (alle vorab festgelegt)

Alle Fenster enden bei Y = 2024.

| Fenster | Zeitraum | n | Rolle | Begründung |
|---|---|---|---|---|
| **B** | **2010 bis 2024** | **15** | **PRIMÄR** (bestätigt von Daniel Saure, 29.10.2026, K5) | Mittellanges Fenster: genügend Freiheitsgrade (n−2 = 13) bei gleichzeitigem Bezug auf die jüngere Phase der Reihe. Rundes Startjahr, in v0.1 gewählt. |
| A | 1990 bis 2024 | 35 | Sensitivität (Langfristtrend), gleichrangig berichtet | Gesamte verfügbare Reihe; größtmögliche Datenbasis, aber anfällig für Bruch/Strukturwandel in der Reihe. |
| C | 2018 bis 2024 | 7 | Sensitivität (Kurzfrist), gleichrangig berichtet | Nur die jüngste Phase; n−2 = 5 Freiheitsgrade, breite Intervalle, geringe Belastbarkeit. |
| D | 2022 bis 2024 | 3 | **Nur deskriptiv** (Teil von S6c) | Zeitraum ab dem Referenzjahr der Bundeswaldinventur 2022. n < 5: nur Jahreswerte und Mittelwert, keine Regression mit Intervall, keine Kategorie. |

**Bruchjahr-Kandidat B\* (Klärung K6, Beleg am Inventarbericht vor Einfrieren):**
Sekundärquellen (Öko-Institut, Spektrum, DUH, WKO; Suche vom 29.10.2026, nicht geprüft) nennen
**2017/2018** als Jahr, ab dem die lebende Waldbiomasse zur Quelle wurde. Daher gilt
vorab: **B\* ∈ {2017, 2018}**. Das genaue Jahr (und ob die Reihe der Submission 2026
rückwirkend konsistent neu berechnet wurde oder einen Niveausprung enthält) wird vor dem
Einfrieren aus dem Inventarbericht belegt und hier eingetragen: B\* = [____]; Reihe
rückwirkend konsistent: [ja / nein / nicht belegbar]. Wie die Zeitreihe in den Submissions
rückwirkend revidiert wurde, ist **nicht geklärt**. Der Kandidat B\* ist ein Kandidat für einen
Verlaufsbruch (inhaltlich) und/oder einen Methodenbruch; welcher von beiden vorliegt, wird
nicht vorab entschieden, beide Lesarten werden in S6 abgedeckt.

**Konsistenz der Fenster (geprüft):**
- Fenster C (ab 2018) liegt vollständig im Zeitraum ab dem Kandidaten B\*
  (bei B\* = 2018 beginnt es genau bei B\*, bei B\* = 2017 danach). Die Primärfenster
  A und B enthalten den Kandidaten und schließen damit einen etwaigen Bruch ein; dafür
  gibt es S6.
- Ist B\* = 2018, ist das „Fenster ab B\*" (S6b) identisch mit Fenster C und wird nicht
  doppelt gerechnet. Ist B\* = 2017, ist S6b ein zusätzliches Fenster 2017–2024 (n = 8).
- Fenster D (2022–2024) liegt in C und in S6b; es ist rein deskriptiv und ersetzt
  keines der Kernfenster. Es gibt dafür keine Entscheidungskategorie. Damit entsteht
  kein Widerspruch zu C oder B\*.
- Wird B\* anders als 2017/2018 belegt, wird der SAP vor dem Einfrieren angepasst, nicht
  nach Datensicht.

**Mindestzellgröße (Vorschlag, K11):** Ein 95-%-Prognoseintervall wird für n ≥ 5 berechnet.
Bei n < 10 wird es als „Orientierung, geringe Belastbarkeit" gekennzeichnet. Bei n < 5 wird nur
Mittelwert/Steigung ohne Intervall berichtet.

**Primärfenster-Festlegung:** Fenster B bestimmt, welche Zahl zuerst genannt wird.
Ergebnisse der Fenster A und C stehen im Bericht in derselben Tabelle und
Überschriftsebene (Abschnitt 7). Das Primärfenster darf nach Datenzugriff nicht
gewechselt werden.

## 5. Statistische Methoden

*Alle numerischen Parameter in 4.2 und Abschnitt 5 (Mindestzellgrößen, ARIMA-Grenzen,
Newey-West-Bandbreite, Seed, Holm, Rundung) sind in 5.7 gebündelt und gelten als
**Vorschlag, von Daniel zu bestätigen** (K11).*

### 5.1 Primäranalyse

1. Bildung von M(T) für T = 1993 … 2024 (Mittelwert über vier Jahre, E1).
2. Berechnung von D30, D40, D45 (E1, E4).
3. Je Fenster A, B, C: OLS-Regression E(y) ~ Jahr (kalendarisch kodiert), mit
   Punktschätzung M̂(2030) und 95-%-Prognoseintervall nach 2.2 (E2). Es wird auf
   **Jahreswerten** geschätzt, nicht auf dem gleitenden 4-Jahres-Mittel (dessen
   überlappende Fenster würden künstliche Autokorrelation erzeugen). Die M-Reihe wird
   nur beschreibend dargestellt.
4. r_req, r_obs(W), r_obs5, r_obs10 und gegebenenfalls Q nach 2.2 (E3).
5. Zuordnung der Entscheidungskategorie nach 5.6.
6. Fenster D: Jahreswerte 2022–2024 und deren Mittelwert, rein deskriptiv.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Je Fenster A, B, C (bei n ≥ 5), auf den OLS-Residuen:
- **Linearität/Varianz:** Residuen-gegen-Fitted-Plot; Breusch-Pagan-Test (nur
  deskriptiv; bei erkennbarer Heteroskedastie wird sie berichtet, die Primäranalyse
  bleibt unverändert; Robustheit über S1, S2).
- **Autokorrelation:** Durbin-Watson-Test auf positive Autokorrelation erster Ordnung
  (einseitig, α = 0,05) und Autokorrelationsfunktion (ACF) der Residuen bis Lag 5 bzw.
  n/3, je nachdem, was kleiner ist. Bei n = 7 (Fenster C) ist der DW-Test kaum
  trennscharf; er wird berichtet, aber nicht zur Entscheidung herangezogen.
- **Normalität:** Q-Q-Plot und Shapiro-Wilk-Test der Residuen (nur deskriptiv; bei
  n < 8 nur Q-Q-Plot).
- **Ausreißer/Hebelpunkte:** Cook-Distanz (Markierung bei > 4/n) und Hebelwerte. Es wird
  **kein Wert ausgeschlossen**; markierte Jahre werden berichtet.
- **Strukturbruch im Fenster:** Residuenverlauf über die Zeit; zusätzlich S6.

Die Ergebnisse der Diagnostik ändern die Primäranalyse nicht. Sie bestimmen nur die
Kennzeichnung im Bericht (z. B. „Intervall vermutlich zu eng") und stützen die
Interpretation der Sensitivitäten S1 und S2.

### 5.3 Korrektur bei Annahmenverletzung

Die Primärspezifikation wird **unabhängig vom Diagnostikergebnis** nicht verändert
(keine bedingte Verzweigung nach Datensicht). Stattdessen werden die autokorrelations-
robusten Verfahren **immer** als Sensitivität mitgerechnet und gleichberechtigt
berichtet:
- **Newey-West (HAC)** für β̂ in allen drei Fenstern (S2). Bandbreite: Lag
  = floor(4 · (n/100)^(2/9)), ohne Vorfilterung (prewhitening). Hinweis: HAC-Standardfehler
  korrigieren die Steigung, nicht automatisch das Prognoseintervall; für das Intervall dient
  S1 (ARIMA).
- **ARIMA-Fehlerstruktur** für das Prognoseintervall (S1).

### 5.4 Unsicherheitsquantifizierung

- **Primär:** Klassisches OLS-95-%-Prognoseintervall für das Mittel der vier künftigen
  Jahreswerte (2.2). Bekannte Limitation: bei autokorrelierten Residuen tendenziell zu eng;
  es enthält ausdrücklich nur die Streuung innerhalb des linearen Modells, nicht die
  Unsicherheit der Modellform oder künftiger Brüche.
- **Sensitivität S1 (ARIMA-Kontrolle):** Regression mit ARIMA-Fehlern. Linearer
  Trendregressor Jahr; Fehlerprozess ARIMA(p,0,q) mit p, q ≤ 2, Auswahl nach AICc
  (forecast::auto.arima, exhaustive Suche statt stepwise, d = 0 und D = 0 fest, ohne
  Saisonalität). Nur für Fenster A und B (n ≥ 10); für Fenster C wird sie als „nicht
  durchgeführt, Grund: n < 10" berichtet. Prognose für 2025–2030; das 95-%-Intervall des
  4-Jahres-Mittels 2027–2030 wird aus parametrischer Simulation des angepassten Modells
  gewonnen (10.000 Pfade, Seed 20261029, 2,5- und 97,5-%-Quantil des simulierten
  4-Jahres-Mittels). Die gewählte Ordnung wird berichtet, auch wenn sie (0,0,0) ist. Es
  gibt keine weiteren ARIMA-Varianten.
- **Konfidenzintervall für β̂:** klassisch (t, n−2) und Newey-West (S2).

### 5.5 Signifikanzniveau

- Prognoseintervalle: 95 % (α = 0,05, zweiseitig), je Fenster einzeln. Drei Intervalle
  sind **nicht** simultan 95 %-sicher; das wird im Bericht ausdrücklich vermerkt.
- Steigungstest H0: β = 0, zweiseitig, α = 0,05, je Fenster. Der Test ist **sekundär**
  und nicht entscheidungsrelevant. Berichtet werden unadjustierte p-Werte und
  zusätzlich Holm-adjustierte p-Werte über die drei Fenster.
- Durbin-Watson: einseitig, α = 0,05 (5.2). Shapiro-Wilk, Breusch-Pagan: deskriptiv,
  α = 0,05 nur zur Kennzeichnung, ohne Konsequenz für die Analyse.

### 5.6 Entscheidungsregeln und Hypothesen

**Deskriptive Fragen (Estimand-Ebene):**
- F1: „Der jüngste gesetzliche Messwert M(2024) liegt über/im Zielbereich von Z30."
  Entscheidung auf Basis von D30 > 0 bzw. D30 ≤ 0 (ungerundet).
- F2: „Das Ziel Z30 liegt im / außerhalb des 95-%-Prognoseintervalls [L, U] der
  Trendfortschreibung."

Das Prognoseintervall wird nicht als Test des Erwartungswerts gelesen, sondern als
Bereich, in dem die realisierte Größe bei Fortbestand des linearen Modells mit
95 % Wahrscheinlichkeit läge. Formal entspricht „Z liegt im Intervall" der
Nichtablehnung von H0: M(2030) = Z30 bei zweiseitigem α = 0,05 im Sinne eines
Prognoseintervall-Tests.

**Kategorien je Fenster (ungerundete Werte, vollständig und gleichberechtigt berichtet):**

| Kategorie | Bedingung | Neutrale Beschreibung |
|---|---|---|
| K-über | L > Z30 | Das gesamte Intervall liegt über dem Zielwert (außerhalb des Zielbereichs). Bei Fortschreibung des Trends wird das Ziel auch bei Ausschöpfung der Intervallgrenze nicht erreicht. |
| K-im | L ≤ Z30 ≤ U | Der Zielwert liegt im Intervall. Aus dem Trend allein lässt sich weder Erreichen noch Verfehlen ableiten. |
| K-unter | U < Z30 | Das gesamte Intervall liegt im Zielbereich (unter dem Zielwert). Bei Fortschreibung des Trends läge das Ergebnis innerhalb des Intervalls im Zielbereich. |

Randfall M̂ = Z30 oder L/U = Z30 exakt: gilt als „im Intervall". Rundung auf eine
Nachkommastelle erfolgt erst bei der Darstellung.

**Gesamtaussage:** Stimmen die drei Fenster in der Kategorie überein, wird das berichtet.
Stimmen sie nicht überein, lautet die Gesamtaussage ausdrücklich „Die Fenster liefern
unterschiedliche Kategorien", mit allen drei Werten. Es wird kein Fenster als „das
richtige" nachträglich ausgewählt. Das Primärfenster B wird zuerst genannt, die
Sensitivitäten ergänzen es.

**Konsequenz von Sensitivitäten:** Ergibt eine Sensitivität eine andere Kategorie als die
Primäranalyse, wird das als „Ergebnis nicht robust gegenüber …" berichtet und im Text
genannt. Die Primärkategorie wird nicht umdefiniert.

### 5.7 Methodenparameter (Vorschlag, von Daniel zu bestätigen – K11)

| Parameter | Vorgeschlagener Wert |
|---|---|
| Mindestgröße für Prognoseintervall | n ≥ 5; Kennzeichnung „geringe Belastbarkeit" bei n < 10; n < 5 nur deskriptiv |
| ARIMA-Kontrolle (S1) | nur n ≥ 10; Regressor Jahr; p, q ≤ 2; d = D = 0; Auswahl nach AICc |
| Simulation für ARIMA-Intervall | 10.000 Pfade; Seed 20261029 |
| Newey-West-Bandbreite | floor(4·(n/100)^(2/9)), ohne Vorfilterung |
| Durbin-Watson | einseitig (positive Autokorrelation), α = 0,05 |
| Cook-Distanz-Markierung | > 4/n |
| Mehrfachvergleich Steigungstests | Holm über die drei Fenster A, B, C (zusätzlich zu unadjustierten p-Werten) |
| Rundung | Mt CO2-Äq. eine Nachkommastelle; Steigungen zwei Nachkommastellen; p-Werte drei Nachkommastellen; Q zwei Nachkommastellen |

## 6. Sensitivitätsanalysen

Primär ist ausschließlich die Spezifikation aus 2–5: **Primärreihe LULUCF inkl. HWP,
Referenz-Submission 2026, Fenster B (2010–2024), klassisches OLS-Prognoseintervall.** Die
Fenster A und C sind gleichrangig berichtete Sensitivität (Abschnitt 7), nicht Teil der
Primärentscheidung. Alle folgenden Varianten sind vorab festgelegt, werden
**vollständig** berichtet und ersetzen das Primärergebnis nicht. Ein nachträglicher Tausch
von Primär- und Sensitivitätsspezifikation ist ausgeschlossen. Sofern nicht anders
genannt, gelten S1–S7 für alle drei Fenster (soweit n es zulässt).

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | **ARIMA-Kontrolle:** Regression mit ARIMA(p,0,q)-Fehlern (5.4), simuliertes 95-%-Intervall des 4-Jahres-Mittels 2027–2030 | E2 (Fenster A, B) |
| S2 | **Newey-West/Durbin-Watson:** HAC-Konfidenzintervall für β̂ (5.3), DW-Statistik und p-Wert je Fenster; r_obs und Q mit HAC-Intervall | E2, E3 |
| S3a | **Ohne letztes Jahr:** Fenster enden 2023 (Startjahre unverändert; C = 2018–2023, n = 6); M(2023) zusätzlich als Messwert | E1, E2, E3 |
| S3b | **Ohne die letzten zwei Jahre:** Fenster enden 2022 (C = 2018–2022, n = 5); M(2022) zusätzlich als Messwert (Begründung: die jüngsten Werte sind vorläufig bzw. noch von Revisionen bedroht) | E1, E2, E3 |
| S4 | **Frühere Submissions (Vintage), nur wenn ohne großen Aufwand beschaffbar (K9), sonst als „nicht durchgeführt, Grund: …" dokumentiert:** dieselbe Spezifikation für die Submissions 2025, 2024, 2023 (jeweils mit deren letztem Berichtsjahr als Fensterende, Startjahre gleich); Revisionstabelle: E\_s\*(y) − E\_s(y) und M\_s\*(T) − M\_s(T) für alle gemeinsamen Jahre. Es wird keine Teilmenge nach Ergebnis ausgewählt: Wird nur ein Teil beschafft, wird berichtet, welche Submissions fehlen und warum | E1, E2 |
| S5 | **Ohne Holzprodukte (HWP):** Primärreihe abzüglich HWP, nur wenn HWP als eigene Jahreswerte vorliegt (K7); sonst „nicht durchgeführt, Grund: …" | E1, E2, E3 |
| S6a | **Niveausprung (Methodenbruch):** Modell E(y) = α + β·y + γ·1(y ≥ B\*) + ε in den Fenstern A und B (gemeinsame Steigung); Prognose 2027–2030 mit γ̂ im Niveau. Nur, wenn K6 einen Niveausprung/eine nicht rückwirkend konsistente Reihe belegt; sonst „nicht durchgeführt, Grund: …" | E2 |
| S6b | **Fenster ab Bruchjahr-Kandidat B\* (Verlaufsbruch):** B\* bis 2024; bei B\* = 2018 identisch mit Fenster C (nicht doppelt gerechnet), bei B\* = 2017: 2017–2024 (n = 8) mit Intervall und Kategorie | E2 |
| S6c | **Fenster D deskriptiv:** 2022–2024, nur Jahreswerte und Mittel (4.2), ohne Intervall, ohne Kategorie | beschreibend |
| S7 | **Schätzwert für 2025** (als „unsicher" eingestufte Schätzung laut UBA-Seite, 26,9 Mt laut UBA-Seite; nur falls als dokumentierte Veröffentlichung mit Abgrenzung der Primärreihe vorliegt): Reihe um diesen Wert verlängert (Fensterende 2025), M(2025) = Mittel 2022–2025, r_req mit Divisor 5. Der Schätzwert ist kein Inventarwert und nur Sensitivität | E1, E2, E3 |

**Kombinationen von Sensitivitäten werden nicht gebildet.** Wird eine Sensitivität
mangels Daten undurchführbar, wird sie als „nicht durchgeführt, Grund: …" berichtet,
nicht stillschweigend weggelassen.

## 7. Umgang mit Mehrfachtestung / Multiplizität

Es gibt keine einzelne Entscheidungsgröße, die durch ein Mehrfachtest-Verfahren
kontrolliert werden müsste. Das eigentliche Risiko ist **selektive Berichterstattung**
aus Fenstern × Sensitivitäten × Zielwerten.

1. **Alle drei Fenster (A, B, C) werden immer vollständig nebeneinander berichtet**, mit
   n, β̂, M̂(2030), Intervall, Kategorie. Kein Fenster wird wegen eines „günstigeren"
   Ergebnisses hervorgehoben oder weggelassen. Fenster C (n = 7) wird als „geringe
   Belastbarkeit" gekennzeichnet, nicht ausgeschlossen.
2. **Vorab festgelegte Kernzahlen** (nur diese dürfen in Überschrift, Teaser und
   Grafik 1/2 verwendet werden):
   (a) D30 = M(2024) − Z30 (E1);
   (b) M̂(2030) mit 95-%-Intervall und Kategorie für **alle drei Fenster** (E2);
   (c) r_req und r_obs(A/B/C) (E3);
   (d) D45 (E4).
3. Sensitivitäten S1–S7 sind sekundär, werden vollständig in Tabellen berichtet und können
   die Kernzahlen nicht ersetzen. Die Zahl 26,9 Mt (Schätzung 2025) darf nur im
   Zusammenhang mit S7 und mit dem Hinweis „unsichere Schätzung, kein Inventarwert"
   genannt werden.
4. Keine nachträgliche Auswahl von Fenstern, Startjahren, Submissions, Reihen (mit/ohne
   HWP), Zielwerten oder Sensitivitäten, die eine bestimmte Aussage am besten stützt.
   Fenstergrenzen werden nach Datenzugriff nicht verschoben (weder „eigentlich besser
   2012" noch „ohne Jahr x"). Das Bruchjahr B\* ist vor Einfrieren festzulegen und wird
   nachher nicht geändert.
5. Steigungstests werden über die drei Fenster zusätzlich Holm-adjustiert berichtet (5.5).
6. Jede Abweichung vom SAP wird als „Post-hoc" gekennzeichnet (Abschnitt 16).

## 8. Interpretationsrahmen / Confounder

### 8.0 Feste Prüfpunkte des Master-Templates

- **Produktions- vs. Konsum-Perspektive:** Die LULUCF-Bilanz ist eine
  **territoriale** Inventarbilanz (UNFCCC-/KSG-Abgrenzung): sie zählt Kohlenstoffflüsse
  in deutschen Flächen und im Holzproduktspeicher (HWP). Sie sagt nichts
  über Importe (z. B. Holz, Futtermittel) oder Verlagerungseffekte im Ausland aus. Es
  droht die Fehldeutung, eine stärkere Senke im Inland bedeute eine geringere
  Gesamtbelastung durch den deutschen Konsum. Die Perspektive wird im Bericht genannt.
- **Keine implizite Politik-/Verhaltensbewertung:** Die Reihe wird durch Witterung,
  Störungen (z. B. Trockenheit, Borkenkäfer), Holzeinschlag, Waldalter und
  Inventurmethodik beeinflusst, nicht nur durch Politik. Vorab festgelegt: Eine
  Veränderung oder ein Abstand wird als Abstand zwischen Messwert bzw. Trend und
  Gesetzesziel beschrieben, **ohne Ursachenzuschreibung** und ohne Urteil über
  Wirksamkeit von Maßnahmen oder über einzelne Regierungen.
- **Transitivitätsannahme:** nicht anwendbar (kein indirekter oder Netzwerk-Vergleich;
  Vergleich ist direkt: Messwert/Trend gegen Zielwert).
- **Regression zur Mitte:** Der Sektor ist schwankungsanfällig. Nach außergewöhnlichen
  Jahren sind Rückbewegungen zu erwarten, die ein Trend als Richtungsänderung
  missdeuten kann. OLS-Steigungen sind von Randjahren abhängig; deshalb wirken die
  Fenstergrenzen (A/B/C), das Weglassen der letzten Jahre (S3) und die Cook-Distanz als
  Gegenprüfung. Das gesetzliche 4-Jahres-Mittel glättet nur teilweise. Ein Sprung in M(2024)
  gegenüber M(2023) wird nicht als Trendwende gedeutet, ohne die Jahreswerte zu
  betrachten.

### 8.1 Trendfortschreibung ist keine Prognose

Siehe Abschnitt 1. Bericht und Teaser formulieren im Konjunktiv: „Würde der lineare
Trend der Jahre 2010–2024 unverändert weiterlaufen, läge der gesetzliche Messwert 2030
bei …" Nicht: „Deutschland wird das Ziel verfehlen/erreichen." Das Intervall umfasst nur
die Streuung im Modell, nicht künftige Maßnahmen, Störungen oder Methodenwechsel.

### 8.2 Zeitreihenbruch und Revisionen

Bundeswaldinventur 2022 und Methodenwechsel im Inventar können Niveau und Verlauf der
Reihe verändern. Ein Teil der beobachteten Veränderung kann Messmethodik sein. Zusätzlich
gibt es einen inhaltlichen Bruchjahr-Kandidaten (2017/2018, Sekundärquellen, ungeprüft).
Bruch und Revision werden über S4 (frühere Submissions), S6a (Niveausprung) und S6b (Fenster
ab B\*) sichtbar gemacht, nicht „herausgerechnet". Der Bericht erläutert, dass ein im Trend
sichtbarer Verlauf teilweise ein Methodeneffekt sein kann.

### 8.3 Sektorgrenze und Zielgröße

Die LULUCF-Bilanz ist **nicht** Teil der Gesamtemissionen ohne LULUCF (im SAP
Prognose-Register 2027 ist die dortige Größe V4 THG „ohne LULUCF" definiert; andere SAPs im
Projekt verwenden ebenfalls „Gesamt ohne LULUCF"). Werte werden nicht vermischt. Das Ziel
ist ein Senkenziel für den Sektor, kein Beitrag zur Reduktion der übrigen Emissionen. Aussagen
zu Netto-Null (E4) betreffen ausschließlich den Abstand der LULUCF-Bilanz zum
Zielwert Z45 und enthalten **keine Annahme über CO2-Entnahme** (technische Senken) oder
über die Anrechnung auf Gesamt-Netto-Null.

### 8.4 Neutralität und Wortwahl

Abweichungen in beide Richtungen werden mit gleichem Wortlaut beschrieben. „Senke" ist
nicht automatisch „gut" im Sinne von dauerhaft: Biologische Senken sind nicht
dauerhaft garantiert (Störungen, Umkehrbarkeit). Das wird im Bericht erwähnt, ohne
Bewertung.

### 8.5 Vorwissen

Das offengelegte Vorwissen (Abschnitt 0) wird im Bericht erwähnt (Satz zum Vorgehen:
SAP vor Zeitreihenansicht, mit offengelegtem Vorwissen über Aggregatwerte). Es darf nicht
dazu führen, dass eine Kategorie oder ein Fenster nach Datensicht anders behandelt wird als
im SAP festgelegt.

## 9. Limitationen

- Lineares Trendmodell auf Jahreswerten; keine Kausal- oder Maßnahmenwirkung. Starker
  Einfluss einzelner Jahre auf Steigung und Intervall, besonders bei kurzen Fenstern.
- Extrapolation über 3–6 Jahre ab 2024 (2027–2030) ist unsicher; das Intervall bildet nur
  Modellstreuung ab, keine Modell- oder Strukturunsicherheit.
- Fenster C (n = 7), S3b-Fenster (n = 5) und Fenster D (n = 3, nur deskriptiv) sind sehr
  kurz; Intervalle sind breit und wenig belastbar. Die Fenster nutzen überlappende Daten und
  sind daher nicht unabhängig.
- Die Zeitreihe ist inventarbasiert und wird rückwirkend revidiert; das Ergebnis gilt für
  die dokumentierte Referenz-Submission 2026. Eine spätere Revision kann Kategorie und
  Abstand verändern (S4 zeigt das nur für bereits erfolgte Revisionen und nur, wenn die
  früheren Submissions beschaffbar sind).
- Zeitreihenbruch/Inventurwechsel (Bundeswaldinventur 2022, Methodenwechsel; Kandidat
  2017/2018): Wirkung auf den Trend unbekannt; Primärfenster B und Fenster A enthalten den
  Kandidaten; Abdeckung nur über S6a/S6b.
- Autokorrelation: der klassische OLS-Intervallansatz unterschätzt dann die Unsicherheit;
  ARIMA bei n ≥ 10 möglich, kleine Stichproben erlauben keine verlässliche
  Ordnungsauswahl.
- Abgrenzung der gesetzlichen Größe (HWP) ist weitgehend, aber noch nicht im Volltext
  belegt (K4). Gesetzestext und Fassung nur per Zusammenfassungswerkzeug gelesen (K2).
- GWP-Basis noch nicht belegt (K10); Lizenz der UBA-Daten ungeprüft (K13).
- Datenquelle PDF-Tabelle: Übertragungsfehler möglich (Gegenmaßnahme 3.5 Nr. 3).
- Vorjahresschätzung 2025 ist kein Inventarwert (S7).
- OWID/GCP-Definition ist verschieden; kein Gleichsetzen.
- Keine Aussage über Zielerreichung 2040/2045 (keine Extrapolation).
- Das Vorwissen des Auftraggebers (Abschnitt 0) kann unbewusst Erwartungen prägen; die
  Kernfestlegungen stammen aus v0.1 vor der erweiterten Kenntnis, die Änderungen in v0.2 sind
  offengelegt.

## 10. Software

R (Version im Skript-Header dokumentiert). Voraussichtliche Pakete: stats (lm, Prognose),
lmtest (Durbin-Watson, Breusch-Pagan), sandwich (Newey-West), forecast (ARIMA mit
Regressor, Simulation), readxl bzw. readr (bzw. eine dokumentierte Extraktionstabelle aus
der PDF), dplyr, tidyr, ggplot2. Skript `lulucf-senke.R` im Analyseordner. Eingelesen werden
ausschließlich unverändert abgelegte Rohdateien unter `rohdaten/` und die dokumentierte
Extraktionstabelle; kein Netzzugriff aus dem Skript. Zufallskomponente nur in S1
(Simulation), Seed 20261029 (Vorschlag, K11). Sitzungsinformation (Paketversionen) wird in
`output/` gespeichert.

## 11. Reporting-Plan

- **Format:** Evidenzcheck („Klima Kompass · Evidenzcheck #n"). Gate:
  Validierungsbericht ohne „kritisch". Kernaussagen erst nach Validierung. Kanalfassungen
  nur über den Klima-Kompass-Ablauf (Substack, Instagram, Facebook, WhatsApp; keine
  LinkedIn-Fassung).
- **Grafik 1 (Zeitreihe mit Fenstern und Ziel):** Jahreswerte E(y) 1990–2024 als
  Punkte/Linie; die drei Trendgeraden (A, B, C) jeweils über ihr Fenster und bis 2030
  verlängert (gestrichelt), Fenster B als primär gekennzeichnet; Nulllinie; Bruchjahr-
  Kandidat B\* als dünne senkrechte Markierung (sobald eingetragen); Zielwert Z30 als
  Markierung mit Hinweis, dass der Zielwert für das 4-Jahres-Mittel gilt.
- **Grafik 2 (4-Jahres-Mittel mit Intervall):** M(T) 1993–2024 als Linie; Z30, Z40, Z45 als
  Markierungen bei 2030, 2040, 2045; M̂(2030) mit 95-%-Prognoseintervall für alle drei
  Fenster nebeneinander (Fenster B zuerst). Keine Trendverlängerung auf 2040/2045.
- **Anhang-Grafiken:** Diagnostik (Residuen, ACF, Q-Q), Revisions-Vergleich der
  Submissions (S4, falls durchgeführt), Vergleich mit OWID/GCP (nur Größenordnung), ggf.
  S6a/S6b.
- **Tabelle 1:** Datenübersicht (Submission, Y, Primärreihe inkl. HWP, n, Quelle,
  Zugriffsdatum, GWP-Basis, Kontrollen).
- **Tabelle 2:** Kernergebnisse E1/E4: E(2021) … E(2024), M(2024), D30, D40, D45.
- **Tabelle 3:** je Fenster A/B/C: n, β̂ (95-%-KI klassisch und HAC), M̂(2030), L, U,
  Kategorie, Abstand M̂ − Z30, DW, ARIMA-Ordnung und -Intervall (S1), Holm-adjustierte
  p-Werte.
- **Tabelle 4:** E3: r_req, r_obs(A/B/C), r_obs5, r_obs10, Q (oder „nicht definiert,
  Grund").
- **Tabelle 5:** Sensitivitäten S1–S7, vollständig, mit Kategorie je Fenster; Revisions-
  tabelle (S4).
- **Rundung:** Mt CO2-Äq. eine Nachkommastelle; Steigungen zwei Nachkommastellen (Mt pro
  Jahr); p-Werte drei Nachkommastellen; Verhältnis Q zwei Nachkommastellen (Vorschlag, K11).
- **Wortwahl:** „Würde der Trend der Jahre … unverändert weiterlaufen …", „der
  gesetzliche Messwert (4-Jahres-Mittel 2021 bis 2024) lag zuletzt bei …", „Abstand zum
  Ziel". Nicht: „Prognose", „Deutschland verfehlt", „signifikant verfehlt". Jede Zahl mit
  Angabe von Submission und Fenster.

## 12. Klärung vor Einfrieren (Stand v0.2, 29.10.2026)

Der SAP darf erst eingefroren werden, wenn alle offenen Punkte beantwortet und im Dokument
eingetragen sind. Angaben, die aus Abrufen per Zusammenfassungswerkzeug stammen, sind nicht
wörtlich geprüft.

### 12.1 Beantwortet / belegt

| Nr. | Punkt | Stand, Quelle, Datum |
|---|---|---|
| K1 | Status trotz Vorwissen | **Beantwortet** (Daniel Saure, 29.10.2026, Chat „Ja, prospektiv", zweimal; zuletzt nach Offenlegung des erweiterten Vorwissens): prospektiv mit offengelegtem Vorwissen (Thünen-Pressemitteilung 26,9 Mt für 2025 plus Aggregatwerte der UBA-Seite). Offenlegung in Abschnitt 0. |
| K3 | Jüngster gesetzlicher Messwert | **Geklärt** (UBA-Seite, Stand 02.07.2026; Inventarbericht 2026 deckt 1990–2024, UBA Climate Change 30/2026; Abruf 29.10.2026): letztes Berichtsjahr mit Inventarwert 2024; 2025 ist unsichere Schätzung. Jüngster Messwert M(2024) = 2021–2024; M(2025) nur mit Schätzwert (S7). Offen bleibt nur, ob der 2025-Wert HWP enthält (siehe K4). |
| K5 | Primärfenster | **Beantwortet** (Daniel Saure, 29.10.2026, Chat „Ja, Fenster B"): B = 2010–2024 primär; A und C gleichrangig als Sensitivität. |
| K8 | Referenz-Submission | **Geklärt** (UBA-Seite, Stand 02.07.2026): Submission 2026 veröffentlicht. Zugriffsdatum und Dateiname folgen beim Zugriff. |
| K12 | Sperren aus anderen SAPs | **Geklärt** (Prüfung des Orchestrators, 29.10.2026, vom sap-autor nicht selbst geprüft): Im SAP Prognose-Register 2027 (Sperren 1 bis 3) gibt es keine Sperre, die diese Analyse berührt; dort ist V4 THG „ohne LULUCF" definiert; Sperre 3 betrifft nur die Rückkopplung aus dem Prognose-Check. |

### 12.2 Teilweise belegt, Rest offen

| Nr. | Punkt | Stand, Rest-Klärung |
|---|---|---|
| K2 | Gesetzestext | **Teilweise belegt:** § 3a Abs. 1 KSG (Fassung: Ausfertigung 12.12.2019, zuletzt geändert durch Art. 1 G v. 15.7.2024, BGBl. 2024 I Nr. 235) laut Abruf von gesetze-im-internet.de am 29.10.2026 (Zusammenfassungswerkzeug): Zielwerte −25/−35/−40 Mt, Mittel aus Zieljahr und drei Vorjahren. **Offen:** Volltext selbst lesen (Daniel). |
| K4 | Abgrenzung HWP | **Weitgehend belegt:** UBA-Seite führt HWP unter den Pools des Sektors; Anlage 1 Nr. 7 KSG nennt „Holzprodukte"; § 5 Abs. 2 Nr. 3 KSG erwähnt sie nicht. Primärreihe daher **mit HWP**. **Offen:** Anlage 1 KSG im Volltext (und ggf. Verordnung zu § 3a KSG) prüfen. |
| K6 | Strukturbruch | **Teilweise:** Bruchjahr-Kandidat B\* ∈ {2017, 2018} aus Sekundärquellen (Öko-Institut, Spektrum, DUH, WKO; Suche 29.10.2026, nicht geprüft); BWI 2022 deckt 2012–2022. Wie die Zeitreihe in den Submissions rückwirkend revidiert wurde, ist **nicht geklärt**. **Offen:** B\* und Konsistenz der Reihe am Inventarbericht 2026 belegen (nur Textkapitel zu Neuberechnungen/Methodik, nicht die Zeitreihenwerte) und in 4.2 eintragen. |
| K7 | Datenverfügbarkeit | **Geklärt:** Quellen sind die UBA-Tabelle (PDF) und der UBA Data Cube (Links in 3.1); kein CSV-Download genannt. **Offen:** Zustimmung von Daniel Saure zur Beschaffung (Dateiname, Quelle, Größe nennen; PDF-Download bzw. Data-Cube-Entnahme). Ob HWP und Kategorien als Jahreswerte enthalten sind (S5), zeigt sich erst beim Zugriff. |

### 12.3 Offen

| Nr. | Punkt | Was fehlt |
|---|---|---|
| K9 | Frühere Submissions 2023–2025 (S4) | Beschaffbarkeit nicht geprüft. S4 ist formuliert als „nur wenn ohne großen Aufwand beschaffbar, sonst als nicht durchgeführt dokumentiert". Keine Voraussetzung für das Einfrieren, wenn Daniel diese Formulierung akzeptiert. |
| K10 | GWP-Basis | Auf der UBA-Seite nicht genannt, aus Suchergebnissen nicht belegt. Im Inventarbericht 2026 (Kapitel zu GWP) nachlesen und in 3.5 eintragen. Nichts wird angenommen. |
| K11 | Methodenparameter | Standardwerte sind in 5.7 als **Vorschlag, von Daniel zu bestätigen** eingetragen (Mindestgrößen, ARIMA-Grenzen, Newey-West-Bandbreite, Seed 20261029, Holm, Rundung). Bestätigung oder Änderung durch Daniel steht aus. |
| K13 | Lizenzen | Lizenz der UBA-Daten und des Data Cube nicht geprüft; klimadashboard.de (CC BY 4.0 laut Auftrag), Thünen, OWID ebenfalls einzutragen. |

**Offene Punkte für das Einfrieren:** K2 (Rest), K4 (Rest), K6, K7 (Rest: Zustimmung zur
Beschaffung), K9, K10, K11, K13.

Erst danach: Statuswechsel `draft` → `final`, Versionsnummer und Datum durch den Menschen
(nach vollständiger Lektüre des aktuellen Dokumenttexts).

## 13. Benötigte Rohdateien (Download nur nach ausdrücklicher Zustimmung von Daniel; nichts bisher heruntergeladen)

1. UBA-Tabelle (PDF) `2_Tab_Emi-Senken-LULUCF_2026-07-02.pdf` (Link in 3.1): Sektor LULUCF
   1990–2024, ggf. Kategorien inkl. HWP. Größe beim Zugriff eintragen.
2. UBA Data Cube (Link in 3.1): Entnahme nur nach Zustimmung, als Kontrolle der
   PDF-Werte.
3. Inventarbericht 2026 (UBA Climate Change 30/2026), nur die Kapitel zu LULUCF-Methodik,
   Neuberechnungen und GWP (für K6, K10).
4. Gesetzestext: § 3a KSG, § 5 Abs. 2 Nr. 3 KSG und Anlage 1 KSG (Volltext, amtliche
   Fassung) (für K2, K4).
5. Für S4 (nur wenn ohne großen Aufwand beschaffbar): Submissions 2025, 2024, 2023
   (LULUCF-Zeitreihe).
6. Für S7 (nur falls als Veröffentlichung vorhanden): dokumentierte Schätzung 2025
   (UBA/Thünen).
7. Optional zur Übertragungskontrolle: klimadashboard.de-/Thünen-Export.
8. Für die Plausibilisierung: OWID-/GCP-Datensatz zu Landnutzungsänderung, Deutschland.

Alle Rohdateien unverändert unter `rohdaten/`, mit Quelle und Zugriffsdatum im
`run_log.txt`.

## 14. Validierungsbogen für den validator

Der validator prüft unabhängig; jede Zeile mit „erfüllt / nicht erfüllt / nicht prüfbar" und
Fundstelle.

| Nr. | Prüfpunkt | Ergebnis |
|---|---|---|
| V1 | SAP-Status `final`, Versionsnummer, Datum, Freigabe durch den Menschen dokumentiert; alle Klärungspunkte in Abschnitt 12 beantwortet; Offenlegung des Vorwissens (Abschnitt 0) vollständig und unverändert; Änderungen v0.1 → v0.2 in der Versionshistorie nachvollziehbar | |
| V2 | Referenz-Submission 2026, Zugriffsdatum, Dateiname im Run-Log; Version nicht gewechselt | |
| V3 | Primärreihe (LULUCF inkl. HWP, K4) verwendet; Zeile/Seite der Quelle dokumentiert; Vorzeichen korrekt; GWP-Basis eingetragen | |
| V4 | Integritätschecks 3.5 vollständig ausgeführt und dokumentiert (inkl. doppelter Übertragung aus der PDF) | |
| V5 | M(T) korrekt (vier Jahre, Zieljahr und drei Vorjahre); M(2024), D30, D40, D45 nachgerechnet | |
| V6 | Drei Fenster A, B, C genau wie in 4.2; n stimmt (35/15/7); Fenster D nur deskriptiv; B\* wie eingetragen; keine Verschiebung der Grenzen | |
| V7 | OLS auf Jahreswerten; M̂(2030) = α̂ + β̂·2028,5; Prognoseintervall nach Formel (1/4-Term, t mit n−2 Freiheitsgraden) unabhängig nachgerechnet | |
| V8 | Kategorien nach 5.6 korrekt zugeordnet; keine Auswahl eines Fensters | |
| V9 | E3: r_req (Divisor 6), r_obs(A/B/C), r_obs5, r_obs10 und Q nach Definition; Fälle „kein Quotient" korrekt behandelt | |
| V10 | Diagnostik 5.2 vollständig (DW, ACF, Q-Q, Shapiro, Breusch-Pagan, Cook) und berichtet; kein Ausschluss von Jahren | |
| V11 | Sensitivitäten S1–S7 (inkl. S6a–c) vollständig oder mit Grund „nicht durchgeführt"; ARIMA-Spezifikation und Seed wie 5.4/5.7 | |
| V12 | Newey-West-Bandbreite wie 5.3; Holm-adjustierte p-Werte | |
| V13 | Keine Trendfortschreibung auf 2040/2045; E4 ohne CO2-Entnahme-Annahmen | |
| V14 | Alle Kernzahlen und alle drei Fenster im Bericht gleichrangig; Wortwahl nach 11 und 8 (Trendfortschreibung, nicht Prognose; keine Ursachenzuschreibung); 26,9 Mt nur mit S7-Hinweis | |
| V15 | Abweichungsprotokoll (Abschnitt 16) geführt; Abweichungen als „Post-hoc" gekennzeichnet | |
| V16 | Sekundärquelle (OWID/GCP) nur zur Plausibilisierung, Definitionsunterschied benannt | |
| V17 | Grafiken 1–2 und Tabellen 1–5 vorhanden, Rundung wie 11 | |

## 15. Zeitplan

| Schritt | Termin |
|---|---|
| Entwurf SAP v0.1 | 29.10.2026 |
| SAP v0.2 (Klärungsstand eingearbeitet) | 29.10.2026 |
| Klärung der offenen Punkte (Abschnitt 12.3), Lektüre des Volltexts und Einfrieren durch Daniel Saure | bis 03.11.2026 |
| Datenbeschaffung (nach Zustimmung durch Daniel) und Analyst (R-Umsetzung, 1–2 Arbeitstage) | ab Einfrieren, voraussichtlich 04.–05.11.2026 |
| Validierung (validator) | bis 12.11.2026 |
| Freigabe und Berichtsentwurf | nach Validierung ohne „kritisch" |

Der Analyst startet nicht vor dem Einfrieren.

## 16. Abweichungsprotokoll

Jede Abweichung vom eingefrorenen SAP wird hier mit Datum, Beschreibung, Begründung und
Auswirkung festgehalten und im Bericht als „Post-hoc" gekennzeichnet.

| Nr. | Datum | Abweichung | Begründung | Betroffene Abschnitte | Entscheidung / Freigabe |
|---|---|---|---|---|---|
| – | – | (bisher keine; SAP noch nicht eingefroren) | – | – | – |

## 17. Amendments

Bisher keine. Änderungen nach dem Einfrieren nur als datiertes Amendment mit Anlass,
Entscheidung und Zeitpunkt (vor Berechnung der betroffenen Größen).

### Nachtrag 29.10.2026 (nach Version 0.2)

- **K7 (Beschaffung) erledigt:** Daniel Saure hat dem Herunterladen der UBA-Tabelle zugestimmt (Chat, 29.10.2026: „Ja, PDF laden“). Die Datei liegt unter `Analysen/2026-10-lulucf-senke/rohdaten/2_Tab_Emi-Senken-LULUCF_2026-07-02.pdf` (107.755 Bytes, SHA-256 `f8cf4f38…4b4b`, siehe `rohdaten/PROVENIENZ.txt`). Sie wurde **nicht geöffnet und nicht gelesen**; geprüft wurde nur, dass sie mit `%PDF` beginnt. Der Data Cube ist nicht abgerufen.
- **K6/K10 (Stand 29.10.2026, abends):** Der Inventarbericht 2026 (UBA Climate Change 30/2026, Mai 2026, 1.058 Seiten, Berichtsjahre 1990 bis 2024) liegt als PDF unter https://www.umweltbundesamt.de/system/files/medien/11850/publikationen/2026-05/30_2026_CC.pdf . Das Werkzeug zum Lesen konnte die Datei nicht verarbeiten (Größe über 10 MB). GWP-Basis (K10) und Revision der Waldreihe nach der Bundeswaldinventur (K6) bleiben deshalb offen, bis der Bericht gelesen ist. Dafür braucht es das Herunterladen der Datei (Größe über 10 MB, genaue Größe unbekannt) mit Zustimmung von Daniel Saure.

### Nachtrag 29.10.2026, abends: Inventarbericht 2026 gelesen (K10, K6)

Daniel Saure hat dem Herunterladen zugestimmt (Chat: „Ja, Bericht laden“, mit der Auflage, nur Stellen zur GWP-Basis und zur Revision der Waldreihe zu lesen). Datei: `rohdaten/30_2026_CC_Inventarbericht-2026.pdf` (50.870.104 Bytes, SHA-256 `707bbcd0…ba75a`, nicht in Git, siehe `rohdaten/PROVENIENZ.txt`). Gelesen wurde per Textsuche nach den Stichwörtern GWP, Neuberechnung und Bundeswaldinventur; es wurden keine Zeitreihenwerte gelesen. Seitenzahlen sind PDF-Seitenindex, nicht gedruckte Seitenzahlen.

- **K10 geklärt:** Der Inventarbericht 2026 verwendet die Treibhausgaspotentiale des **IPCC AR5** (PDF-S. 51: „Es werden die Treibhausgaspotentiale … des IPCC Assessment Report 5 (IPCC AR5) verwendet“; CH4 = 28, N2O = 265, GWP 100). In Abschnitt 3.5 einzutragen: GWP-Basis AR5.
- **K6 teilweise geklärt:** (a) Das LULUCF-Inventar wird laut Bericht jedes Jahr **vollständig neu berechnet**, was „zum Teil zu erheblichen Unterschieden in den Ergebnissen … zwischen einzelnen Jahren“ führt (PDF-S. 643); auch mit der Submission 2026 gab es grundlegende Methodenänderungen, die eine vollständige Neuberechnung des gesamten Berichtszeitraums nötig machten (PDF-S. 645). Die Reihe verändert sich also mit jeder Submission, nicht nur an einem einzelnen Bruchjahr; die Sensitivität S4 (frühere Submissions) gewinnt dadurch Gewicht. (b) Die Bundeswaldinventur 2022 (Erhebung 2021 bis 2022) ist Grundlage der Waldberechnung; **für die Jahre nach der letzten Inventur wird die Waldentwicklung mit einem Matrix-Modell (Rock et al., 2025) fortgeschrieben** (PDF-S. 675). Die jüngsten Berichtsjahre (2023, 2024) sind damit Modellfortschreibungen und keine Messungen. Das ist eine Einschränkung für die Aussage und gehört in Abschnitt 4 und 9. (c) Ein belegtes einzelnes Bruchjahr (2017 oder 2018) fand sich in den gelesenen Stellen nicht; B\* bleibt Kandidat aus Sekundärquellen.
- **K4 Hinweis:** Zur HWP-Abgrenzung wurde nichts gesucht; offen wie bisher.
- Offen weiterhin: K2 (Rest), K4 (Rest), K6 (B\*), K9, K11, K13. In Version 0.3 sind K10 und K6 (a), (b) in den Haupttext einzuarbeiten.

### Nachtrag 29.10.2026, spät: Gesetzesstellen und Lizenzen (K2, K4, K13)

Abrufe von gesetze-im-internet.de per Zusammenfassungswerkzeug (nicht wörtlich geprüft, Seiten ohne Fassungsstand):
- **K4 (Holzprodukte) weitgehend geklärt:** Anlage 1 Nr. 7 KSG („Landnutzung, Landnutzungsänderung und Forstwirtschaft“) umfasst laut Seite „Wald, Acker, Grünland, Feuchtgebiete, Siedlungen; Holzprodukte; Änderungen zwischen Landnutzungskategorien“ (CRT-Kategorie 4; Fundstelle BGBl. I 2019, 2519). Holzprodukte gehören damit ausdrücklich zum Sektor. § 5 Abs. 2 Nr. 3 KSG erwähnt sie nicht und nennt nur „auch Quellen und Senken von Treibhausgasen“. Im abgerufenen Auszug zu § 5 steht keine Rechtsverordnung nach § 3a Abs. 3; ob eine erlassen wurde, ist nicht geprüft. Primärreihe mit HWP bleibt begründet.
- **K13 (Lizenzen) teilweise:** Nach einem Suchergebnis zur UBA-Datenschutzseite stehen selbst erstellte UBA-Inhalte (Texte, Grafiken) unter CC BY-NC-ND 4.0, sofern nicht anders gekennzeichnet; viele UBA-Datensätze stehen unter Datenlizenz Deutschland – Namensnennung 2.0. Für die PDF-Tabelle und den Data Cube ist die Lizenz nicht bestätigt. Für Zahlen (Fakten) und eigene Auswertungen mit Quellenangabe ist das voraussichtlich unkritisch, vor Veröffentlichung von UBA-Grafiken oder -Tabellen im Wortlaut klären.
