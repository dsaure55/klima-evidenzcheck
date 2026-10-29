# Statistischer Analyseplan (SAP) – Evidenzcheck LULUCF-Senke

**Titel:** Wie weit ist der deutsche Sektor Landnutzung, Landnutzungsänderung und
Forstwirtschaft (LULUCF) von den Senkenzielen des § 3a Klimaschutzgesetz
entfernt, und wo läge der gesetzliche 4-Jahres-Mittelwert 2030, wenn der Trend der
Vergangenheit unverändert fortgeschrieben würde?

**Format:** Klima Kompass · Evidenzcheck (neue SAP-Analyse; Gate: Validierungsbericht
ohne „kritisch").
**Version:** 0.1
**Datum:** 29.10.2026
**Autor:in:** Claude (sap-autor-Subagent). Entwurf, noch nicht von einem Menschen geprüft.
**Status: draft.** Nicht eingefroren. Der Analyst-Subagent darf erst nach Einfrieren
(Status `final`) gestartet werden.
**Freigabe:** _________________________ Datum: __________ (leer; steht aus)

**Geplanter Ordner:** `Analysen/2026-10-lulucf-senke/`

**Versionshistorie:**
- **v0.1 draft (29.10.2026):** Erstentwurf, verfasst vor Datenzugriff und vor
  Code. Es wurden keine Zeitreihen gesichtet.

**Hinweis zur Vorlage:** Gerüst ist `SAP-Vorlage/SAP-Template.md`. Alle Abschnitte 0–11
der Vorlage sind vorhanden und in derselben Nummerierung belegt (zusätzlich 5.6
„Entscheidungsregeln"). Die Abschnitte 12–17 sind projektspezifische Ergänzungen
(Klärung vor Einfrieren, Rohdateien, Validierungsbogen, Zeitplan,
Abweichungsprotokoll, Amendments). Formatvorbilder: SAP Prognose-Check
Projektionsberichte (Struktur, Sensitivitäten, Multiplizität) und SAP
DE-Emissionen-Trendprojektion-2040 (OLS-Trend, 95-%-Prognoseintervall, drei Fenster,
ARIMA-Kontrolle, Durbin-Watson).

---

## 0. Status dieser Analyse

[x] Präregistriert, **prospektiv** (SAP vor Datenzugriff und vor Code verfasst; Einfrieren steht noch aus)
[ ] Exploratorisch

- **Prospektiver SAP.** Für diesen SAP wurde **kein Datenzugriff** durchgeführt: weder
  auf die LULUCF-Zeitreihe (UBA, Thünen, klimadashboard.de), noch auf Nationale
  Inventarberichte, noch auf OWID/GCP. Kein Code geschrieben oder ausgeführt. Es wurden
  keine Analyseergebnisse und keine Grafiken mitgeliefert.
- **Offengelegtes Vorwissen (ausdrücklich, vor Einfrieren zu bewerten):**
  Aus einer Pressemitteilung (Thünen/UBA vom 14.03.2026; Fundstelle ein Suchergebnis,
  der Wortlaut wurde nicht geprüft) ist dem Auftraggeber bekannt, dass der Sektor
  Landnutzung **2025 mit rund 26,9 Mt CO2-Äquivalent eine Quelle** war. Das ist ein
  einzelner Jahreswert, nicht der gesetzliche 4-Jahres-Mittelwert und nicht die
  Zeitreihe. **Die Zeitreihe selbst wurde nicht gesichtet.** Die Festlegungen in diesem
  SAP (Fenster, Modelle, Entscheidungsregeln, Sensitivitäten) sind nicht an diesem Wert
  ausgerichtet. Es ist ungeklärt, ob der Wert ein Inventarwert oder eine
  Vorjahresschätzung ist und ob er Holzprodukte enthält (siehe Klärung K3).
  - **Hinweis zur Prä-Registrierungsregel:** Nach der strengen Regel des
    SAP-Autors („Zahlen zu Ergebnissen machen die Präregistrierung ungültig") ließe
    sich dieser Wert als mitgelieferte Zahl lesen. Der Auftraggeber hat ihn bewusst
    als Vorwissen offengelegt und den SAP als prospektiv beauftragt. Ob der Status
    dennoch auf „exploratory (retrospektiv)" zu setzen ist, entscheidet Daniel Saure
    vor dem Einfrieren (Klärung K1). Bis dahin gilt: prospektiv, mit offengelegtem
    Vorwissen.
- **Ergebnisoffenheit:** Die Analyse kann ein Verfehlen, ein Erreichen oder keine
  eindeutige Aussage zeigen. Jeder Ausgang wird veröffentlicht. Dieser SAP enthält
  keine Erwartung über Ergebnisse.
- **Inhaltsstufe:** Evidenzcheck (neue Analyse). Parallele Evidenzchecks sind seit
  23.10.2026 zulässig; Sperren aus anderen SAPs sind vor dem Start zu prüfen
  (Klärung K12).

## 1. Hintergrund / Rationale

Der Sektor LULUCF (Wald, Acker, Grünland, Feuchtgebiete, Siedlungen, Holzprodukte)
ist der einzige Sektor, der nach dem Klimaschutzgesetz (KSG) von einer Quelle zur
**Netto-Senke** werden soll. § 3a KSG legt dafür Zielwerte fest. Nach der Ablesung des
Auftraggebers vom 29.10.2026 (gesetze-im-internet.de, „nichtamtliches
Inhaltsverzeichnis", Fassungsstand nicht angegeben; **vor Einfrieren gegen die amtliche
Fassung zu prüfen, Klärung K2**) gilt:

> Der **Mittelwert der jährlichen Emissionsbilanzen aus dem Zieljahr und den drei
> vorhergehenden Kalenderjahren** soll **bis 2030 mindestens −25 Mt CO2-Äq.**, **bis
> 2040 mindestens −35 Mt** und **bis 2045 mindestens −40 Mt** betragen
> (Datengrundlage nach § 5 Abs. 2 Nr. 3 KSG).

Öffentliche Darstellungen (Dashboards, Pressemitteilungen) nennen meist den Einzeljahreswert
des letzten Inventarjahres. Der gesetzliche Maßstab ist aber ein **gleitender
4-Jahres-Mittelwert**. Für Journalismus, Politikberatung und Öffentlichkeit ist
relevant:

1. Wie weit ist der **jüngste gesetzliche Messwert** vom Ziel 2030 entfernt?
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
  Meldung); Referenz-Submission s* = Submission 2026 (Abschnitt 3.2).
- E(y) = Netto-Emissionsbilanz des Sektors LULUCF im Jahr y in Mt CO2-Äq.,
  Reihe der **Primärgröße** (Definition der Reihe, insbesondere Behandlung von
  Holzprodukten, siehe 3.1 und Klärung K4).
- Y = letztes Jahr der Reihe E in der Referenz-Submission (voraussichtlich 2024, aus
  der Datei abzulesen und im Run-Log festzuhalten).
- **M(T) = [E(T) + E(T−1) + E(T−2) + E(T−3)] / 4** = gesetzlicher Messwert
  (4-Jahres-Mittel) für das Zieljahr T. M(T) ist nur definiert, wenn alle vier
  Jahreswerte vorliegen; die erste auswertbare Stelle ist M(1993).
- Z30 = −25, Z40 = −35, Z45 = −40 (Mt CO2-Äq.), vorbehaltlich Klärung K2.
- „Zielbereich" für Zieljahr T: M(T) ≤ Z(T).
- **Abstand D(T) = M(Y) − Z(T)** (Mt). D > 0: der jüngste Messwert liegt über dem
  Zielwert (Ziel nicht erreicht); D ≤ 0: Messwert im Zielbereich.
- Fenster W(a): Beobachtungsjahre a, a+1, …, Y. n(W) = Y − a + 1.

### 2.2 Estimands

**E1 (primär) – Abstand des jüngsten Messwerts zum Ziel 2030.**
D30 = M(Y) − Z30 in Mt, zusammen mit M(Y) selbst und den vier zugrunde liegenden
Jahreswerten E(Y−3) … E(Y). Rein deskriptiv, keine Unsicherheitsangabe (Messwert der
Referenz-Submission; Revisionsspanne siehe S4).
Ergänzend (deskriptiv, gleiche Formel): D40 und D45 als Kontext (E4).

**E2 (primär) – Trendfortschreibung des 4-Jahres-Mittels 2030 mit 95-%-Prognoseintervall.**
Für jedes der drei Fenster A, B, C (Abschnitt 4.2) wird das Modell
E(y) = α + β·y + ε(y), geschätzt mit OLS über y ∈ W, angepasst. Zielgröße ist das
Mittel der vier künftigen Jahreswerte 2027, 2028, 2029, 2030:

M̂(2030) = α̂ + β̂ · 2028,5

(2028,5 ist der Mittelwert der Jahre 2027–2030; wegen der Linearität ist das
Mittel der vier Modellwerte gleich dem Modellwert bei 2028,5. Alle vier Jahre liegen
nach Y, daher werden für 2027–2030 keine Beobachtungswerte verwendet.)

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
- **Nötige Rate:** r_req = (Z30 − M(Y)) / (2030 − Y) in Mt pro Jahr (Veränderung des
  4-Jahres-Mittels pro Jahr zwischen dem letzten Messwert und dem Zieljahr).
  r_req < 0 bedeutet nötige Verbesserung. Ist M(Y) ≤ Z30 (D30 ≤ 0), ist
  r_req ≥ 0 und der Vergleich entfällt („Zielbereich bereits im jüngsten Messwert
  erreicht", ausdrücklich ohne Aussage über 2030).
- **Beobachtete Rate (drei Varianten, alle berichtet):**
  (i) r_obs(W) = OLS-Steigung β̂ der Jahreswerte E(y) in Fenster W (A, B, C); die
  Steigung eines linearen Trends der Jahreswerte ist zugleich die Veränderung des
  4-Jahres-Mittels pro Jahr; mit 95-%-Konfidenzintervall (klassisch) und
  Newey-West-Intervall (S2);
  (ii) r_obs5 = [M(Y) − M(Y−5)] / 5 (beobachtete Veränderung des 4-Jahres-Mittels in
  den letzten 5 Jahren);
  (iii) r_obs10 = [M(Y) − M(Y−10)] / 10.
- **Verhältnis Q = r_req / r_obs**, nur berechnet, wenn r_req < 0 und r_obs < 0
  (Verbesserungen in beide Richtungen). Ist r_obs ≥ 0, wird kein Quotient gebildet;
  berichtet wird: „In diesem Fenster/Zeitraum ist keine Verbesserung zu beobachten,
  die Rate ist nicht vergleichbar." Q für die Grenzen des Konfidenzintervalls von β̂
  nur, wenn das gesamte Intervall < 0 liegt.

**E4 (primär) – Einordnung Netto-Null 2045.**
D45 = M(Y) − Z45 in Mt, ergänzt um D40 = M(Y) − Z40. Rein deskriptiv, **ohne
Annahmen über CO2-Entnahme** (CDR, technische Senken). **Keine Trendfortschreibung auf
2040 oder 2045**, auch nicht als Sensitivität (Extrapolationshorizont ≥ 15 Jahre; vorab
ausgeschlossen).

**Ausdrücklich nicht Gegenstand:** Wirkungsanalyse von Maßnahmen (z. B. Wiedervernässung,
Waldumbau), Ursachenzuschreibung für Veränderungen der Senke, Prognose der
tatsächlichen Zielerreichung, Bewertung der Ziele selbst, Aussagen über Netto-Null
für die Gesamtemissionen.

### 2.3 Eindeutigkeit (Zwei-Analysten-Regel)

Aus den Angaben in 2.1–2.2 und 5.1 folgt eindeutig: gleiche Daten (Referenz-Submission,
Primärreihe nach K4), gleiche drei Fenster, OLS auf Jahreswerte, Prognoseintervall
nach der Formel in 2.2 (t-Verteilung, n−2 Freiheitsgrade, 1/4-Term), gleiche
Kategorien nach 5.6. Abweichende Rundung ändert keine Kategorie (Entscheidung auf
ungerundeten Werten).

## 3. Datenquelle

**Template-Pflichtfelder (beim Datenzugriff ausgefüllt, im `run_log.txt` gespiegelt):**
- Quelle(n): siehe 3.1–3.3
- Zugriffsdatum: [TT.MM.JJJJ – beim Datenzugriff eintragen]
- Datenstand laut Quelle: [Bezeichnung der Submission (Berichtsjahr 2026), Veröffentlichungsdatum, Dateiname – beim Datenzugriff eintragen]
- Lizenz/Nutzungsbedingungen: [je Quelle beim Datenzugriff eintragen; klimadashboard.de laut Auftrag CC BY 4.0, Thünen und UBA zu prüfen]

### 3.1 Primärquelle

**UBA – Nationale Treibhausgasinventare / Nationaler Inventarbericht (NIR):** Sektor
LULUCF, jährliche Netto-Emissionsbilanz in Mt CO2-Äq., 1990 bis letztes Berichtsjahr.
Soweit vorhanden zusätzlich nach Kategorien (Wald, Acker, Grünland, Feuchtgebiete,
Siedlungen, Holzprodukte (HWP)). Bereitstellung auch über **klimadashboard.de
(CC BY 4.0)** und das **Thünen-Institut** (Inventarersteller für LULUCF). Die
UBA-/NIR-Fassung hat Vorrang. Die Dashboard- oder Thünen-Fassung dient der
Übertragungskontrolle (3.5). Bei Abweichungen > 0,1 Mt (Rundung) wird die Abweichung
dokumentiert und die UBA-/NIR-Fassung verwendet.

**Definition der Primärreihe E(y) (OFFEN, Klärung K4 vor Einfrieren):**
Es ist **nicht festgelegt**, ob Holzprodukte (Harvested Wood Products, HWP) in der
gesetzlichen Größe enthalten sind. Das ist am Gesetz bzw. an der Verordnung/Datengrundlage
nach § 5 Abs. 2 Nr. 3 KSG zu belegen und hier einzutragen. Entscheidungsregel für den
Eintrag:
1. Ergibt sich die Abgrenzung aus Gesetz/Verordnung, gilt diese Abgrenzung als
   Primärreihe. Die jeweils andere Variante (mit/ohne HWP) ist dann Sensitivität S5,
   sofern die Daten vorliegen.
2. Ergibt sich die Abgrenzung nicht eindeutig, entscheidet Daniel Saure **vor dem
   Einfrieren** und vermerkt die Begründung hier. Es wird nicht nach Datensicht
   entschieden.
3. Der SAP wird nicht eingefroren, solange dieser Punkt offen ist.

Primärreihe (nach Klärung einzutragen): [ ] mit HWP  [ ] ohne HWP  Beleg: [Fundstelle]

### 3.2 Version der Zeitreihe und Umgang mit Revisionen

- **Referenz-Submission s\*:** Submission **2026** (Berichtsjahr 2026, Inventarjahre
  1990 bis Y, voraussichtlich Y = 2024). Falls zum Datenzugriff eine neuere vollständige
  Submission vorliegt, ist das vor dem Zugriff zu melden (Klärung K8); es wird nicht
  stillschweigend gewechselt.
- Die Version wird beim Datenzugriff mit Bezeichnung, Veröffentlichungsdatum und
  Dateiname im `run_log.txt` festgehalten und **danach nicht mehr gewechselt**, auch wenn
  während der Analyse eine neuere Fassung erscheint. Eine spätere Revision
  führt höchstens zu einem gekennzeichneten Amendment/Nachtrag, nicht zu einer Änderung
  der Primärauswertung.
- **Revisionen früherer Submissions (bekanntes Problem):** Alle Primärergebnisse stützen
  sich ausschließlich auf die Referenz-Submission, in der die **gesamte Reihe
  1990–Y mit derselben Methodik** berechnet ist (Annahme; Prüfung im NIR, Klärung K6).
  Frühere Submissions (**2025, 2024, 2023**, jeweils soweit verfügbar) werden nur in
  Sensitivität S4 und in der Revisionstabelle verwendet. Reihen verschiedener Submissions
  werden nie zu einer Reihe zusammengesetzt (kein „Splicing").

### 3.3 Sekundärquelle (nur Plausibilisierung, siehe CLAUDE.md)

**Our World in Data / Global Carbon Project (Landnutzungsänderung, CO2).** Andere
Definition (Bookkeeping-Modelle, andere Systemgrenze, nur CO2, keine
KSG-/UNFCCC-Abgrenzung). **Nicht gleichsetzen** und nicht in Kennzahlen verwenden;
Verwendung nur für einen groben Größenordnungs- und Vorzeichenvergleich (Grafik im
Anhang, ohne Schwellenwert). Bei Abweichung hat die UBA-Reihe Vorrang. Fallback auf OWID
nur bei dokumentiertem Zugriffsproblem auf die Primärquelle und nur nach Amendment.

### 3.4 Beschaffung

Voraussichtlich Download durch Daniel (eingeschränkter Netzzugang zu Behördenservern in
Cloud-Sessions, siehe frühere Checks). Ablage **unverändert** unter `rohdaten/`
im Analyseordner, Zugriffsdatum und Quelle im `run_log.txt`. Liste in Abschnitt 13.
**Für diesen SAP wurde nichts heruntergeladen.**

### 3.5 Datenqualität und Integritäts-Checks (vor jeder Auswertung)

1. **Vollständigkeit:** Jahreswerte für jedes Jahr 1990–Y ohne Lücke; fehlende Werte →
   Stopp und Rückfrage (kein Auffüllen, keine Interpolation).
2. **Vorzeichen, Einheit, Gase, GWP:** Einheit Mt CO2-Äq.; Vorzeichen Quelle positiv /
   Senke negativ (Konvention der Quelle gegen die Konvention dieses SAP abgleichen, ggf.
   Umkehr dokumentieren); verwendete Treibhauspotenziale (AR4/AR5) und enthaltene Gase
   (CO2, CH4, N2O) festhalten.
3. **Summenprüfung:** Summe der Kategorien (inkl. HWP, falls separat ausgewiesen) = Sektor-
   gesamt, absolute Toleranz 0,5 Mt (Rundung; relative Toleranz ist bei Werten nahe
   null ungeeignet). Abweichungen werden dokumentiert, nicht korrigiert.
4. **Übertragungskontrolle:** UBA-/NIR-Reihe gegen klimadashboard.de/Thünen-Reihe,
   Toleranz 0,1 Mt je Jahr; Differenzen vor Auswertung auflösen und dokumentieren.
5. **Abgrenzungs-Check:** Wird in der Quelle „LULUCF" mit und ohne HWP, mit und ohne
   Teilkategorien ausgewiesen, wird festgehalten, welche Zeile verwendet wird
   (Fundstelle: Datei, Blatt, Zeile).
6. **Konsistenz der Jahreswerte innerhalb der Referenz-Submission:** Vorjahresschätzungen
   oder gekennzeichnete vorläufige Werte (z. B. letzte Jahre) werden markiert; sie bleiben
   in der Primäranalyse enthalten und werden in S3 ausgeschlossen.
7. **Plausibilisierung gegen OWID/GCP:** nur grafisch, Vorzeichen und Größenordnung.
8. **Erhebungsbruch-Dokumentation:** Für die Referenz-Submission wird dokumentiert, ob
   und ab welchem Jahr neue Datengrundlagen (Bundeswaldinventur 2022, Methodenwechsel)
   in die Reihe eingegangen sind (Klärung K6). Dieser Check ändert die Primärauswertung
   nicht.

Bei Unstimmigkeiten, die sich nach diesen Regeln nicht auflösen lassen: Analyse
stoppen, Rückfrage an Daniel.

## 4. Analysepopulation

### 4.1 Einheit

Jahresbeobachtung E(y) der Primärreihe aus der Referenz-Submission (n = 35 für
1990–2024, falls Y = 2024). Kein Ausschluss von Jahren; kein Ausschluss von
Störungs-, Corona- oder Kalamitätsjahren. Der gesetzliche Messwert M(T) wird aus je vier
aufeinanderfolgenden Jahreswerten gebildet (Reihe M(1993) … M(Y)).

### 4.2 Fenster (alle vorab festgelegt)

| Fenster | Zeitraum | n (falls Y = 2024) | Rolle | Begründung |
|---|---|---|---|---|
| **B** | **2010 bis Y** | **15** | **PRIMÄR** | Mittellanges Fenster: genügend Freiheitsgrade (n−2 = 13) bei gleichzeitigem Bezug auf die jüngere Phase der Reihe. Rundes Startjahr, ohne Sichtung des Verlaufs gewählt. |
| A | 1990 bis Y | 35 | Sensitivität (Langfristtrend) | Gesamte verfügbare Reihe; größtmögliche Datenbasis, aber anfällig für Bruch/Strukturwandel in der Reihe. |
| C | 2018 bis Y | 7 | Sensitivität (Kurzfrist) | Nur die jüngste Phase; n−2 = 5 Freiheitsgrade, breite Intervalle, geringe Belastbarkeit (siehe Mindestzellgröße). |
| D (konditional) | B\* bis Y | n(D) | Sensitivität S6 (nur falls K6 ein Bruchjahr B\* liefert) | Fenster ab dem Strukturbruch durch Bundeswaldinventur 2022 bzw. Datenrevision. |

**Warum Fenster D nicht als viertes Standardfenster geführt wird:** Der Bruch liegt nach
Auftrag im Zusammenhang mit der Bundeswaldinventur 2022. Ein Fenster ab 2022 oder 2023
hätte höchstens 2–3 Jahre (n < 5) und erlaubt keine Regression mit sinnvollem
Prognoseintervall. Deshalb gilt für D:
- Das **Bruchjahr B\*** und die Art des Bruchs (Niveausprung in der Reihe der
  Referenz-Submission, oder Reihe rückwirkend konsistent neu gerechnet) werden **vor
  Einfrieren** aus dem NIR belegt (K6) und hier eingetragen: B\* = [____].
- Ist die Reihe der Referenz-Submission **rückwirkend konsistent** neu berechnet, gibt es
  in ihr keinen sichtbaren Bruch; dann entfällt S6 und wird als „nicht durchgeführt,
  Grund: …" berichtet.
- Ist B\* belegt, werden zwei Dinge gerechnet (S6): (a) **Niveausprung-Modell** über
  das gesamte Fenster B: E(y) = α + β·y + γ·1(y ≥ B\*) + ε, gemeinsame Steigung,
  Prognose für 2027–2030 mit γ̂ im Niveau; (b) **Fenster D** (B\* bis Y) rein
  deskriptiv (Steigung, Mittelwert), Prognoseintervall nur bei n(D) ≥ 5 (Mindestzellgröße).

**Mindestzellgröße:** Ein 95-%-Prognoseintervall wird für n ≥ 5 berechnet. Bei
n < 10 wird es als „Orientierung, geringe Belastbarkeit" gekennzeichnet. Bei n < 5 wird
nur Steigung/Mittelwert ohne Intervall berichtet.

**Primärfenster-Festlegung:** Das primär benannte Fenster B bestimmt, welche Zahl zuerst
genannt wird. Ergebnisse der Fenster A und C stehen im Bericht in derselben Tabelle und
Überschriftsebene (Abschnitt 7). Das Primärfenster darf nach Datenzugriff nicht
gewechselt werden.

## 5. Statistische Methoden

### 5.1 Primäranalyse

1. Bildung von M(T) für T = 1993 … Y (Mittelwert über vier Jahre, E1).
2. Berechnung von D30, D40, D45 (E1, E4).
3. Je Fenster A, B, C: OLS-Regression E(y) ~ Jahr (kalendarisch kodiert), mit
   Punktschätzung M̂(2030) und 95-%-Prognoseintervall nach 2.2 (E2). Es wird auf
   **Jahreswerten** geschätzt, nicht auf dem gleitenden 4-Jahres-Mittel (dessen
   überlappende Fenster würden künstliche Autokorrelation erzeugen). Die M-Reihe wird
   nur beschreibend dargestellt.
4. r_req, r_obs(W), r_obs5, r_obs10 und gegebenenfalls Q nach 2.2 (E3).
5. Zuordnung der Entscheidungskategorie nach 5.6.

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
  = floor(4 · (n/100)^(2/9)), ohne Vorfilterung (prewhitening), wie in der Standardformel
  für Newey-West-Bandbreiten. Hinweis: HAC-Standardfehler korrigieren die Steigung, nicht
  automatisch das Prognoseintervall; für das Intervall dient S1 (ARIMA).
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
- F1: „Der jüngste gesetzliche Messwert M(Y) liegt über/im Zielbereich von Z30."
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

## 6. Sensitivitätsanalysen

Primär ist ausschließlich die Spezifikation aus 2–5: **Primärreihe nach K4,
Referenz-Submission 2026, Fenster B (2010 bis Y), klassisches OLS-Prognoseintervall.** Die
Fenster A und C sind Teil der Pflichtberichterstattung (Abschnitt 7), nicht der
Primärentscheidung. Alle folgenden Varianten sind vorab festgelegt, werden
**vollständig** berichtet und ersetzen das Primärergebnis nicht. Ein nachträglicher Tausch
von Primär- und Sensitivitätsspezifikation ist ausgeschlossen. Sofern nicht anders
genannt, gelten S1–S7 für alle drei Fenster (soweit n es zulässt).

| Nr. | Variation | betrifft |
|---|---|---|
| S1 | **ARIMA-Kontrolle:** Regression mit ARIMA(p,0,q)-Fehlern (5.4), simuliertes 95-%-Intervall des 4-Jahres-Mittels 2027–2030 | E2 (Fenster A, B) |
| S2 | **Newey-West/Durbin-Watson:** HAC-Konfidenzintervall für β̂ (5.3), DW-Statistik und p-Wert je Fenster; r_obs und Q mit HAC-Intervall | E2, E3 |
| S3a | **Ohne letztes Jahr:** Fenster enden bei Y−1 (Startjahre unverändert); Prognose von M̂(2030) wie in 2.2; M(Y−1) zusätzlich als Messwert | E1, E2, E3 |
| S3b | **Ohne die letzten zwei Jahre:** Fenster enden bei Y−2; M(Y−2) zusätzlich als Messwert (Begründung: die jüngsten Werte sind vorläufig bzw. noch von Revisionen bedroht) | E1, E2, E3 |
| S4 | **Frühere Submissions (Vintage):** dieselbe Spezifikation für die Submissions 2025, 2024, 2023 (jeweils mit deren letztem Berichtsjahr als Fensterende, Startjahre gleich); Revisionstabelle: E\_s\*(y) − E\_s(y) und M\_s\*(T) − M\_s(T) für alle gemeinsamen Jahre | E1, E2 |
| S5 | **Mit/ohne Holzprodukte (HWP):** die jeweils nicht primäre Variante der Reihe, nur wenn die Kategorien-Daten vorliegen; sonst „nicht durchgeführt, Grund: …" | E1, E2, E3 |
| S6 | **Strukturbruch:** Niveausprung-Modell und Fenster D (nur wenn K6 ein Bruchjahr B\* belegt, siehe 4.2) | E2 |
| S7 | **Schätzwert für Y+1** (z. B. Vorjahresschätzung 2025 nach § 5 KSG, nur falls als dokumentierte Veröffentlichung vorliegt und die Abgrenzung der Primärreihe entspricht, K3): Reihe wird um diesen Wert verlängert (Fensterende Y+1). Der Schätzwert ist kein Inventarwert und nur Sensitivität | E1, E2, E3 |

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
   (a) D30 = M(Y) − Z30 (E1);
   (b) M̂(2030) mit 95-%-Intervall und Kategorie für **alle drei Fenster** (E2);
   (c) r_req und r_obs(A/B/C) (E3) ;
   (d) D45 (E4).
3. Sensitivitäten S1–S7 sind sekundär, werden vollständig in Tabellen berichtet und können
   die Kernzahlen nicht ersetzen.
4. Keine nachträgliche Auswahl von Fenstern, Startjahren, Submissions, Reihen (mit/ohne
   HWP), Zielwerten oder Sensitivitäten, die eine bestimmte Aussage am besten stützt.
   Fenstergrenzen werden nach Datenzugriff nicht verschoben (weder „eigentlich besser
   2012" noch „ohne Jahr x").
5. Steigungstests werden über die drei Fenster zusätzlich Holm-adjustiert berichtet (5.5).
6. Jede Abweichung vom SAP wird als „Post-hoc" gekennzeichnet (Abschnitt 16).

## 8. Interpretationsrahmen / Confounder

### 8.0 Feste Prüfpunkte des Master-Templates

- **Produktions- vs. Konsum-Perspektive:** Die LULUCF-Bilanz ist eine
  **territoriale** Inventarbilanz (UNFCCC-/KSG-Abgrenzung): sie zählt Kohlenstoffflüsse
  in deutschen Flächen (und im Holzproduktspeicher, falls HWP enthalten). Sie sagt nichts
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
- **Regression zur Mitte:** Der Sektor ist stark schwankend. Nach außergewöhnlichen
  Jahren sind Rückbewegungen zu erwarten, die ein Trend als Richtungsänderung
  missdeuten kann. OLS-Steigungen sind von Randjahren abhängig; deshalb wirken die
  Fenstergrenzen (A/B/C), das Weglassen der letzten Jahre (S3) und die Cook-Distanz als
  Gegenprüfung. Gesetzliches 4-Jahres-Mittel glättet nur teilweise. Ein Sprung in M(Y)
  gegenüber M(Y−1) wird nicht als Trendwende gedeutet, ohne die Jahreswerte zu
  betrachten.

### 8.1 Trendfortschreibung ist keine Prognose

Siehe Abschnitt 1. Bericht und Teaser formulieren im Konjunktiv: „Würde der lineare
Trend der Jahre 2010–Y unverändert weiterlaufen, läge der gesetzliche Messwert 2030
bei …" Nicht: „Deutschland wird das Ziel verfehlen/erreichen." Das Intervall umfasst nur
die Streuung im Modell, nicht künftige Maßnahmen, Störungen oder Methodenwechsel.

### 8.2 Zeitreihenbruch und Revisionen

Bundeswaldinventur 2022 und Methodenwechsel im Inventar können Niveau und Verlauf der
Reihe verändern. Ein Teil der beobachteten Veränderung kann Messmethodik sein. Bruch und
Revision werden über S4 (frühere Submissions) und S6 (Niveausprung) sichtbar gemacht, nicht
„herausgerechnet". Der Bericht erläutert, dass ein im Trend sichtbarer Verlauf teilweise
ein Methodeneffekt sein kann.

### 8.3 Sektorgrenze und Zielgröße

Die LULUCF-Bilanz ist **nicht** Teil der Gesamtemissionen ohne LULUCF (andere SAPs im
Projekt verwenden „Gesamt ohne LULUCF"). Werte werden nicht vermischt. Das Ziel ist ein
Senkenziel für den Sektor, kein Beitrag zur Reduktion der übrigen Emissionen. Aussagen zu
Netto-Null (E4) betreffen ausschließlich den Abstand der LULUCF-Bilanz zum
Zielwert Z45 und enthalten **keine Annahme über CO2-Entnahme** (technische Senken) oder
über die Anrechnung auf Gesamt-Netto-Null.

### 8.4 Neutralität und Wortwahl

Abweichungen in beide Richtungen werden mit gleichem Wortlaut beschrieben. „Senke" ist
nicht automatisch „gut" im Sinne von dauerhaft: Biologische Senken sind nicht
dauerhaft garantiert (Störungen, Umkehrbarkeit). Das wird im Bericht erwähnt, ohne
Bewertung.

## 9. Limitationen

- Lineares Trendmodell auf Jahreswerten; keine Kausal- oder Maßnahmenwirkung. Starker
  Einfluss einzelner Jahre auf Steigung und Intervall, besonders bei kurzen Fenstern.
- Extrapolation über 3–6 Jahre ab Y (2027–2030) ist unsicher; das Intervall bildet nur
  Modellstreuung ab, keine Modell- oder Strukturunsicherheit.
- Fenster C (n = 7) und S3b-Fenster (n = 5) sind sehr kurz; Intervalle sind breit und
  wenig belastbar. Die drei Fenster nutzen überlappende Daten und sind daher
  nicht unabhängig.
- Die Zeitreihe ist inventarbasiert und wird rückwirkend revidiert; das Ergebnis gilt für
  die dokumentierte Referenz-Submission. Eine spätere Revision kann Kategorie und Abstand
  verändern (S4 zeigt das nur für bereits erfolgte Revisionen).
- Zeitreihenbruch/Inventurwechsel (Bundeswaldinventur 2022, Methodenwechsel): Wirkung auf
  Trend unbekannt; S6 nur, wenn das Bruchjahr belegbar ist.
- Autokorrelation: der klassische OLS-Intervallansatz unterschätzt dann die Unsicherheit;
  ARIMA bei n ≥ 10 möglich, kleine Stichproben erlauben keine verlässliche
  Ordnungsauswahl.
- Unklarheit über die gesetzliche Abgrenzung (HWP, Datengrundlage) bis zur Klärung K2/K4.
- Die gesetzlichen Zielwerte stammen aus einer nichtamtlichen Ablesung und sind vor dem
  Einfrieren zu verifizieren (K2).
- Vorjahresschätzungen sind keine Inventarwerte (S7).
- OWID/GCP-Definition ist verschieden; kein Gleichsetzen.
- Keine Aussage über Zielerreichung 2040/2045 (keine Extrapolation).
- Vorwissen des Auftraggebers (26,9 Mt für 2025) kann unbewusst Erwartungen prägen; die
  Festlegungen wurden unabhängig davon getroffen und vor Datenzugriff dokumentiert.

## 10. Software

R (Version im Skript-Header dokumentiert). Voraussichtliche Pakete: stats (lm, Prognose),
lmtest (Durbin-Watson, Breusch-Pagan), sandwich (Newey-West), forecast (ARIMA mit
Regressor, Simulation), readxl bzw. readr, dplyr, tidyr, ggplot2. Skript
`lulucf-senke.R` im Analyseordner. Eingelesen werden ausschließlich unverändert abgelegte
Rohdateien unter `rohdaten/`; kein Netzzugriff aus dem Skript. Zufallskomponente nur in S1
(Simulation), Seed 20261029 fest. Sitzungsinformation (Paketversionen) wird in `output/`
gespeichert.

## 11. Reporting-Plan

- **Format:** Evidenzcheck („Klima Kompass · Evidenzcheck #n"). Gate:
  Validierungsbericht ohne „kritisch". Kernaussagen erst nach Validierung. Kanalfassungen
  nur über den Klima-Kompass-Ablauf (Substack, Instagram, Facebook, WhatsApp; keine
  LinkedIn-Fassung).
- **Grafik 1 (Zeitreihe mit Fenstern und Ziel):** Jahreswerte E(y) 1990–Y als
  Punkte/Linie; die drei Trendgeraden (A, B, C) jeweils über ihr Fenster und bis 2030
  verlängert (gestrichelt), Fenster B als primär gekennzeichnet; Nulllinie; Zielwerte Z30
  als Markierung mit Hinweis, dass der Zielwert für das 4-Jahres-Mittel gilt.
- **Grafik 2 (4-Jahres-Mittel mit Intervall):** M(T) 1993–Y als Linie; Z30, Z40, Z45 als
  Markierungen bei 2030, 2040, 2045; M̂(2030) mit 95-%-Prognoseintervall für alle drei
  Fenster nebeneinander (Fenster B zuerst). Keine Trendverlängerung auf 2040/2045.
- **Anhang-Grafiken:** Diagnostik (Residuen, ACF, Q-Q), Revisions-Vergleich der
  Submissions (S4), Vergleich mit OWID/GCP (nur Größenordnung), ggf. Niveausprung-Modell (S6).
- **Tabelle 1:** Datenübersicht (Submission, Y, Primärreihe, n, Abgrenzung HWP, Quelle,
  Zugriffsdatum, Kontrollen).
- **Tabelle 2:** Kernergebnisse E1/E4: E(Y−3) … E(Y), M(Y), D30, D40, D45.
- **Tabelle 3:** je Fenster A/B/C: n, β̂ (95-%-KI klassisch und HAC), M̂(2030), L, U,
  Kategorie, Abstand M̂ − Z30, DW, ARIMA-Ordnung und -Intervall (S1), Holm-adjustierte
  p-Werte.
- **Tabelle 4:** E3: r_req, r_obs(A/B/C), r_obs5, r_obs10, Q (oder „nicht definiert,
  Grund").
- **Tabelle 5:** Sensitivitäten S1–S7, vollständig, mit Kategorie je Fenster; Revisions-
  tabelle (S4).
- **Rundung:** Mt CO2-Äq. eine Nachkommastelle; Steigungen zwei Nachkommastellen (Mt pro
  Jahr); p-Werte drei Nachkommastellen; Verhältnis Q zwei Nachkommastellen.
- **Wortwahl:** „Würde der Trend der Jahre … unverändert weiterlaufen …", „der
  gesetzliche Messwert (4-Jahres-Mittel) lag zuletzt bei …", „Abstand zum Ziel". Nicht:
  „Prognose", „Deutschland verfehlt", „signifikant verfehlt". Jede Zahl mit Angabe von
  Submission und Fenster.

## 12. Klärung vor Einfrieren

Der SAP darf erst eingefroren werden, wenn die folgenden Punkte beantwortet und im
Dokument eingetragen sind. Sie sind **offen**; es wurde nichts geraten.

| Nr. | Klärung | Wer / Beleg | Wirkt auf |
|---|---|---|---|
| K1 | **Status trotz Vorwissen:** Bleibt es bei „prospektiv mit offengelegtem Vorwissen (26,9 Mt 2025, Pressemitteilung, ungeprüft)" oder wird der SAP als „exploratory (retrospektiv)" geführt? Zusätzlich: Hat der Auftraggeber weiteres Vorwissen über den Verlauf der Reihe, das die Fensterwahl (2010, 2018) beeinflusst hat? | Daniel Saure | Abschnitt 0, 4.2 |
| K2 | **Gesetzestext:** Zielwerte −25/−35/−40 Mt und Wortlaut „Mittelwert aus dem Zieljahr und den drei vorhergehenden Kalenderjahren" gegen die **amtliche Fassung** (BGBl.-Stand, Datum der Fassung) prüfen; Stand eintragen. | Daniel Saure, Beleg: amtliche Fassung | 2.1, 5.6 |
| K3 | **Was ist der „jüngste gesetzliche Messwert"?** Letztes Inventarjahr Y der Submission 2026 (voraussichtlich 2024) oder eine Vorjahresschätzung (2025)? Ist der Wert 26,9 Mt (2025) ein Inventarwert oder eine Schätzung, mit oder ohne HWP? (Nur Definition/Fußnote der Pressemitteilung lesen, nicht die Zeitreihe.) | Daniel Saure, Beleg: Primärquelle der Pressemitteilung | 2.1, S7 |
| K4 | **Abgrenzung HWP:** Sind Holzprodukte in der gesetzlichen Größe enthalten? Belegen an Gesetz bzw. Verordnung/Datengrundlage nach § 5 Abs. 2 Nr. 3 KSG; Primärreihe (mit/ohne HWP) in 3.1 eintragen. Ohne Beleg: Entscheidung durch Daniel vor Einfrieren. | Daniel Saure, Beleg: Gesetz/Verordnung | 3.1, S5 |
| K5 | **Primärfenster bestätigen:** Fenster B (2010–Y) als primär; A und C als Sensitivität, alle drei gleichberechtigt berichtet. Bestätigen oder abweichend festlegen (vor Datenzugriff). | Daniel Saure | 4.2, 7 |
| K6 | **Zeitreihenbruch:** Ab welcher Submission ist die Bundeswaldinventur 2022 eingearbeitet, und ist die Reihe der Referenz-Submission rückwirkend konsistent neu berechnet? Gibt es ein belegbares Bruchjahr B\*? Eintragen in 4.2 oder S6 streichen. (Nur NIR-Text, nicht die Zeitreihe.) | Daniel Saure, Beleg: NIR, Kapitel LULUCF/Neuberechnungen | 3.2, 4.2, S6 |
| K7 | **Datenverfügbarkeit:** Liegen in der Submission 2026 und im klimadashboard.de-/Thünen-Export Kategorien (Wald, Acker, …, HWP) als Jahreswerte vor? Granularität, Dateiformat. Danach entscheidet sich, ob S5 durchführbar ist. | Daniel Saure | S5 |
| K8 | **Verfügbarkeit und Version der Referenz-Submission 2026:** Ist sie veröffentlicht (Datum), gibt es eine neuere Fassung? Wer lädt herunter (Cloud-Sperre)? Zugriffsdatum und Dateiname im Run-Log festlegen. | Daniel Saure | 3.2, 13 |
| K9 | **Frühere Submissions für S4:** Sind 2023, 2024, 2025 beschaffbar (Format, Link)? Falls nur ein Teil: welcher? | Daniel Saure | S4 |
| K10 | **GWP-Basis und Gase:** In der Referenz-Submission eintragen; bei Abweichung zu Zielwert-Basis im Gesetz nachfragen. | beim Datenzugriff, Daniel | 3.5 |
| K11 | **Methodenparameter bestätigen:** Mindestzellgröße für Intervalle (n ≥ 5, Kennzeichnung bei n < 10), ARIMA nur bei n ≥ 10 mit p,q ≤ 2/d = 0, Newey-West-Bandbreite, Seed, Holm-Adjustierung, Rundung. | Daniel Saure | 4.2, 5.3–5.5 |
| K12 | **Parallele Analysen und Sperren:** Sind Reihenfolge-Sperren aus anderen SAPs (z. B. Prognose-Register 2027) für diesen Check relevant? | Daniel Saure | 0 |
| K13 | **Lizenzen:** klimadashboard.de (CC BY 4.0 laut Auftrag), UBA/Thünen und OWID prüfen und eintragen. | beim Datenzugriff | 3 |

Erst danach: Statuswechsel `draft` → `final`, Versionsnummer und Datum durch den Menschen
(nach vollständiger Lektüre des aktuellen Dokumenttexts).

## 13. Benötigte Rohdateien (Download durch Daniel; nichts bisher heruntergeladen)

1. UBA-Treibhausgasinventar Submission 2026: LULUCF-Zeitreihe 1990–Y (Sektorsumme und,
   falls vorhanden, Kategorien inkl. HWP), Tabellenteil/CRT und Nationaler Inventarbericht
   (Kapitel LULUCF, Neuberechnungen/Recalculations).
2. Export klimadashboard.de (LULUCF-Zeitreihe, CC BY 4.0) und/oder Thünen-Institut-Daten
   zur Übertragungskontrolle.
3. Gesetzestext: § 3a KSG (amtliche Fassung, mit Fassungsstand) und die Regelung zu
   § 5 Abs. 2 Nr. 3 KSG (Datengrundlage/Verordnung).
4. Für S4: Submissions 2025, 2024, 2023 (LULUCF-Zeitreihe).
5. Für S7 (nur falls vorhanden): dokumentierte Vorjahresschätzung 2025 (UBA/Thünen).
6. Für die Plausibilisierung: OWID-/GCP-Datensatz zu Landnutzungsänderung, Deutschland.

Alle Rohdateien unverändert unter `rohdaten/`, mit Quelle und Zugriffsdatum im
`run_log.txt`.

## 14. Validierungsbogen für den validator

Der validator prüft unabhängig; jede Zeile mit „erfüllt / nicht erfüllt / nicht prüfbar" und
Fundstelle.

| Nr. | Prüfpunkt | Ergebnis |
|---|---|---|
| V1 | SAP-Status `final`, Versionsnummer, Datum, Freigabe durch den Menschen dokumentiert; Klärung K1–K13 vollständig eingetragen | |
| V2 | Referenz-Submission, Zugriffsdatum, Dateiname im Run-Log; Version nicht gewechselt | |
| V3 | Primärreihe nach K4 verwendet; Zeile/Blatt der Quelle dokumentiert; Vorzeichen korrekt | |
| V4 | Integritätschecks 3.5 vollständig ausgeführt und dokumentiert | |
| V5 | M(T) korrekt (vier Jahre, Zieljahr und drei Vorjahre); M(Y), D30, D40, D45 nachgerechnet | |
| V6 | Drei Fenster A, B, C genau wie in 4.2; n stimmt; keine Verschiebung der Grenzen | |
| V7 | OLS auf Jahreswerten; M̂(2030) = α̂ + β̂·2028,5; Prognoseintervall nach Formel (1/4-Term, t mit n−2 Freiheitsgraden) unabhängig nachgerechnet | |
| V8 | Kategorien nach 5.6 korrekt zugeordnet; keine Auswahl eines Fensters | |
| V9 | E3: r_req, r_obs(A/B/C), r_obs5, r_obs10 und Q nach Definition; Fälle „kein Quotient" korrekt behandelt | |
| V10 | Diagnostik 5.2 vollständig (DW, ACF, Q-Q, Shapiro, Breusch-Pagan, Cook) und berichtet; kein Ausschluss von Jahren | |
| V11 | Sensitivitäten S1–S7 vollständig oder mit Grund „nicht durchgeführt"; ARIMA-Spezifikation und Seed wie 5.4 | |
| V12 | Newey-West-Bandbreite wie 5.3; Holm-adjustierte p-Werte | |
| V13 | Keine Trendfortschreibung auf 2040/2045; E4 ohne CO2-Entnahme-Annahmen | |
| V14 | Alle Kernzahlen und alle drei Fenster im Bericht gleichrangig; Wortwahl nach 11 und 8 (Trendfortschreibung, nicht Prognose; keine Ursachenzuschreibung) | |
| V15 | Abweichungsprotokoll (Abschnitt 16) geführt; Abweichungen als „Post-hoc" gekennzeichnet | |
| V16 | Sekundärquelle (OWID/GCP) nur zur Plausibilisierung, Definitionsunterschied benannt | |
| V17 | Grafiken 1–2 und Tabellen 1–5 vorhanden, Rundung wie 11 | |

## 15. Zeitplan

| Schritt | Termin |
|---|---|
| Entwurf SAP v0.1 | 29.10.2026 |
| Prüfung, Klärung K1–K13, Einfrieren durch Daniel Saure | bis 03.11.2026 |
| Datenbeschaffung (Daniel) und Analyst (R-Umsetzung, 1–2 Arbeitstage) | ab Einfrieren, voraussichtlich 04.–05.11.2026 |
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

---

## Anhang: Klärungsstand (Stand 29.10.2026, nach Version 0.1; Version bleibt 0.1, Status `draft`)

- **K1 beantwortet** (Daniel Saure, 29.10.2026, Chat: „Ja, prospektiv“): Die Analyse läuft als prospektiv mit offengelegtem Vorwissen (26,9 Mt für 2025 aus einer Pressemitteilung, ungeprüft). Das Vorwissen steht in Abschnitt 0.
- **K2 teilweise belegt:** Abruf von gesetze-im-internet.de am 29.10.2026 (per Zusammenfassungswerkzeug, nicht wörtlich geprüft): KSG, Ausfertigung 12.12.2019, zuletzt geändert durch Art. 1 G v. 15.7.2024 (BGBl. I Nr. 235). § 3a Abs. 1 bestätigt: Mittelwert aus Zieljahr und den drei vorhergehenden Kalenderjahren, mindestens minus 25 Mt (2030), minus 35 Mt (2040), minus 40 Mt (2045). Vor dem Einfrieren Volltext selbst lesen.
- **K4 Hinweis (nicht abschließend):** § 5 Abs. 2 Nr. 3 KSG erwähnt Holzprodukte nicht; Anlage 1 Nr. 7 nennt „Holzprodukte“ ausdrücklich als Teil des Sektors. Das spricht dafür, dass Holzprodukte zur gesetzlichen Größe gehören. Vor dem Einfrieren Anlage 1 im Volltext und die Verordnung nach § 3a Abs. 3 Nr. 3 prüfen.
- **K5 beantwortet** (Daniel Saure, 29.10.2026, Chat: „Ja, Fenster B“): Hauptfenster ist 2010 bis letztes Berichtsjahr; Fenster A (ab 1990) und C (ab 2018) bleiben gleichrangig berichtete Sensitivität.
- Offen: K3, K6 bis K13 (K2 und K4 nur teilweise belegt).

### Ergänzung 29.10.2026 (nach Datenquellen-Recherche; wichtig für K1, K3, K4, K7, K10)

**Offenlegung (erweitert das Vorwissen aus Abschnitt 0):** Bei der Quellenrecherche hat der Orchestrator (Claude, Top-Level-Session) die UBA-Seite „Emissionen der Landnutzung, -änderung und Forstwirtschaft“ (Stand „zuletzt aktualisiert am 02.07.2026“) per Zusammenfassungswerkzeug abgerufen und dabei **Aggregatwerte gesehen**: Gesamtsektor rund +36 Mt (1990) und +58 Mt (2024, laut Seite 59 Prozent über 1990); 2025 als „unsicher“ eingestufte Schätzung 26,9 Mt; Kategorienwerte 2024 (Wald 2,1 Mt Quelle, Ackerland 17,5, Grünland 24,2, Moore 52,2, Feuchtgebiete 9,0). Die Jahreswerte 1991 bis 2023 wurden nicht gesehen. Dieses Vorwissen erlaubt eine Erwartung (Ziel 2030 deutlich verfehlt), die Entscheidungsregeln und Fenster in diesem SAP wurden davon nicht beeinflusst, aber es ist Vorwissen über das Ergebnis. **K1 muss darauf erneut bestätigt werden** (Daniel Saure: „prospektiv mit diesem erweiterten Vorwissen“ oder „exploratorisch“).

**Belege aus dem Abruf (nicht wörtlich geprüft):**
- **K3:** Letztes Berichtsjahr mit Inventarwert ist laut UBA-Seite **2024**; 2025 ist eine unsichere Schätzung. Der jüngste gesetzliche Messwert (4-Jahres-Mittel) wäre damit 2021 bis 2024; 2022 bis 2025 nur mit Schätzwert (Sensitivität S7).
- **K4:** Die UBA-Seite führt **Holzprodukte (HWP)** unter den Kohlenstoffpools des Sektors; zusammen mit Anlage 1 Nr. 7 KSG spricht das dafür, dass die Primärreihe HWP einschließt. Vor Einfrieren Anlage 1 im Volltext prüfen.
- **K7:** Tabelle als PDF: https://www.umweltbundesamt.de/system/files/medien/384/bilder/dateien/2_Tab_Emi-Senken-LULUCF_2026-07-02.pdf ; UBA Data Cube (interaktiv): https://datacube.uba.de/vis?lc=de&df%5bid%5d=DF_CLIMATE_EMISSIONS_GHG_TRENDS_KSG . Ein CSV-Download ist auf der Seite nicht genannt. Herunterladen der PDF-Tabelle bzw. Datenentnahme aus dem Data Cube braucht die Zustimmung von Daniel Saure (Download-Regel).
- **K8:** Submission 2026 mit Stand der Seite 02.07.2026 veröffentlicht.
- **K10:** GWP-Basis (AR4/AR5) auf der Seite nicht genannt. Offen.
- Pressemitteilung Thünen (14.03.2026) ließ sich nicht abrufen (zu viele Weiterleitungen); die 26,9 Mt für 2025 bleiben deshalb nur über die UBA-Seite belegt.
