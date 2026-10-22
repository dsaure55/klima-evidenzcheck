# Gliederung Kapitel 1–6 (zur Abstimmung, keine Volltexte)

**Version:** 0.1 · **Status: Entwurf, nicht freigegeben** · **Datum:** 22.10.2026
**Bezug:** `kapitelplan.md` v0.3 (Teil 1, Kapitelraster Abschnitt 2), `gliederung_kap07-10.md`. Grundlage sind die gesicherten Substack-Fassungen in `quellen-artikel/` (vollständig gelesen am 22.10.2026).
**Regeln:** keine neuen Zahlen, keine neuen Rechnungen; jede Zahl mit Artikelverweis; Stand der Daten mit Datum. Wo ein Punkt vor dem Schreiben noch gegen die Primärquelle geprüft werden muss, steht „prüfen“.

## Raster (je Kapitel)

| Baustein | Umfang | Regel |
|---|---|---|
| Kurz gesagt | 60–100 Wörter | Antwort auf die Leserfrage, 2–4 Sätze |
| Haupttext | 600–900 Wörter | verdichtet aus den zugeordneten Artikeln, Stufe jedes Stücks benennen |
| Was heißt das für dich? | 150–250 Wörter | beschreibend, keine Handlungsempfehlung zu Geld, Gesundheit oder Politik |
| Lagen wir richtig? | 150–250 Wörter | was wir behauptet/erwartet haben, was seither belegt ist, was offen ist; „noch offen“ ist zulässig |
| Woher wir das wissen | 100–150 Wörter + Liste | Quellen, Datenstand, Verweis auf SAP/Validierung im Repo |

## Korrekturen am Plan, die sich beim Lesen ergeben haben

1. **„65 Euro rein, 59 Euro raus“ ist kein Evidenzcheck**, sondern laut eigenem Text ein „Rechenkommentar, keine präregistrierte Analyse“ (Eingangswerte aus veröffentlichten Quellen). In `kapitelplan.md` stand es unter „Evidenzcheck“. Im Buch wird es als Rechenkommentar geführt; das gilt auch für Kapitel 7, Frage 9.
2. **COP31 endet am 20.11.2026** (9.–20.11., Antalya, laut UNFCCC-Zeitplan in den Artikeln) und damit vor dem Redaktionsschluss. In `kapitelplan.md`, Abhängigkeiten Kapitel 5, stand „liegt nach Redaktionsschluss“. Das ist falsch. Unsere Stücke machen aber keine Vorhersage zur COP31, deshalb ist das für „Lagen wir richtig?“ ohne Belang; ein Ergebnisblock wäre ein eigener, neu zu prüfender Text (siehe Kapitel 5).
3. **15.800 gegen 16.000 Hitzetote** ist im Einordnungsstück vom 17.10. schon erklärt: 15.800 war der vorläufige Wert vom 29.8., 16.000 der RKI-Wert KW 37 (Stand 24.9.). Der offene Punkt in `quellen-artikel/INDEX.md` ist damit erledigt.
4. **Batteriespeicher:** Der Artikel kündigt eine Nachlade-Simulation an („wird nachgeliefert“). Im Repo liegt kein Ergebnis dazu (`run_log.txt`: „noch ausstehend“). Das gehört in „Lagen wir richtig?“ von Kapitel 2 als offener Punkt. Außerdem trägt der Artikel eine nachträglich festgelegte Datenbereinigung (Post-hoc, Schwelle 100 MWh) und eine nicht sicher belegte Eingangszahl („2 %“, Fußnote im Artikel); beides ist im Buch ebenso offen zu nennen.

---

## Kapitel 1 – War dieser Sommer normal, und was hat er gekostet?

**Zugeordnet:** (a) „War der Sommer 2026 ‚ganz normal‘?“ (Evidenzcheck, 11.9.); (b) „Der Hitzesommer 2026: Ausreißer oder Teil der Bandbreite?“ (Evidenzcheck, 29.8.); (c) „Hitzesommer ohne Klima? Was Medien weglassen …“ (Einordnung, 17.10.).
**Umfang:** 1.200–1.600 Wörter.

**Kurz gesagt (Inhalt):** „Normal“ hängt vom Vergleichsmaßstab ab. 2026 war der zweitwärmste Sommer seit 1881 (19,6 °C), gemessen am heutigen Trend nur „ungewöhnlich warm“. Die geschätzten hitzebedingten Sterbefälle (RKI: 16.000, Spanne 14.400–17.600) liegen deutlich über der bisherigen Bandbreite seit 1992.

**Haupttext – Aufbau:**
1. *Die Behauptung* (ca. 100 Wörter): „Ganz normal“ und „früher war es auch heiß“; die DWD-Aussage „in 30 Jahren könnte er normal sein“.
2. *Temperatur: drei Maßstäbe* (ca. 250 Wörter): Normalwert 1961–1990 (+3,3 Grad, extrem außergewöhnlich), 1991–2020 (+2,0, außergewöhnlich warm), Trend 1971–2025 (+1,1, ungewöhnlich warm; etwa jeder siebte Sommer seit 1971). Hinweis: Einstufung ist eine vorab festgelegte Konvention; knapper Perzentil-Befund (0,09 Grad unter der Grenze) nennen. Trendfortschreibung (typisch um 2051, Intervall 2038–2075) mit dem Vorbehalt „keine Klimaprojektion“.
3. *Sterbefälle: ausserhalb der Bandbreite* (ca. 250 Wörter): Mittel 1992–2025 rund 2.955 pro Jahr, Obergrenze eines „normalen“ Jahres rund 8.700, vorläufiger Wert damals 15.800 (4,5 Standardabweichungen darüber, robust in acht Sensitivitätsanalysen). Einschränkungen: nicht altersstandardisiert, RKI-Methodik seit 2020 flexibler, 2018-Vergleichszahl in einer Sekundärquelle verwechselt (8.500 statt 9.400).
4. *Der aktuelle Stand* (ca. 100 Wörter): KW-37-Schätzung 16.000 [14.400; 17.600], Schätzung statt Zählung.
5. *Die Mediendebatte* (ca. 200 Wörter): Anlass (Interview als Meinungsquelle), MedienKlimaBericht KLIMA° vor acht (0,95 % / 0,82 % Klima-Minuten im 1. Halbjahr 2026; Quelle mit klarem Anliegen, Methode offen), was die Zahlen nicht belegen (Absicht, Qualität, andere Medien).

**Was heißt das für dich? (Inhalt):** Aussagen wie „ganz normal“ erst prüfbar, wenn der Maßstab genannt ist. Zwei richtige Zahlen können verschiedene Geschichten erzählen. Schätzungen zur Hitzesterblichkeit sind Modellwerte mit Spanne und ändern sich noch.

**Lagen wir richtig? (Inhalt):**
- Im Evidenzcheck vom 29.8. stand, der vorläufige Wert werde sich „vermutlich eher nach oben als nach unten“ verändern: Er stieg von 15.800 auf 16.000. Das ist ein belegter Treffer, aber keine Vorhersage mit Intervall.
- Die Kernaussage (außerhalb der Bandbreite) hat sich mit dem neuen Wert nicht verändert; Methodenanteil ungeklärt.
- Offen: endgültige RKI-Jahresschätzung; DWD-Endwert des Sommers (vorläufig; prüfen, ob bis Redaktionsschluss revidiert).
- Verweis: Sommermittel 2027 gehört zu den geplanten Vorhersagen des Registers (Kapitel 10).

**Woher wir das wissen (Inhalt):** DWD CDC Gebietsmittel (Stand 2.9.2026), RKI-Wochenbericht KW 37, MedienKlimaBericht Nr. 1; SAP/Validierungsberichte der beiden Evidenzchecks im Repo.

**Prüfen vor dem Schreiben:** DWD-Interview-Zitate nur wie im Artikel, nicht neu zitieren; Zahlen der Medienstudie gegen das PDF.

---

## Kapitel 2 – Reicht die Energie: Gas im Winter, Strom bei Dunkelflaute?

**Zugeordnet:** (a) „Reichen 136 Terawattstunden?“ (Evidenzcheck, 14.9.); (b) „Gasspeicher bei 60 Prozent“ (Einordnung, 17.10.); (c) „Batteriespeicher und Dunkelflauten“ (Evidenzcheck, 31.8.).
**Umfang:** 1.300–1.700 Wörter.

**Kurz gesagt (Inhalt):** Ein Füllstand in Prozent oder ein Vergleich mit einem einzigen Winter sagt wenig über den Winter. Der Speicher enthält rund 150 TWh (16.10.), etwa so viel wie in einem durchschnittlich kalten Winter entnommen wird; Kälte und Importe entscheiden. Heutige Batteriespeicher hätten historische Dunkelflauten nur zu rund 1 % decken können.

**Haupttext – Aufbau:**
1. *Gas: Die Aussage und der Bezugsrahmen* (ca. 200 Wörter): Streit Mitte September (Bundesnetzagentur: 136 TWh ≈ letzter Winter; Speicherverband warnt). Der Vergleichswinter 2025/26 war nicht mild (4,41 °C, 53. Perzentil).
2. *Was die Winter zeigen* (ca. 250 Wörter): Entnahme 42–178 TWh, Median 122; pro Grad kälter etwa +49 TWh; für einen durchschnittlich kalten Winter rund 150 TWh, Prognoseintervall 69–230; Speicher decken im Median 19 % des Winterverbrauchs. Fazit damals: kein belastbares „reicht“ und kein belastbares „reicht nicht“.
3. *Der Stand im Oktober* (ca. 200 Wörter): 60,5 % bzw. 149,62 TWh am 16.10.; Ziele gelten je Speicher (meist 80 %, sechs Speicher 45 %), deshalb kein direkter Vergleich mit dem Gesamtstand; Bundesnetzagentur sieht kein akutes Problem. Was die Einordnung nicht zeigt (Prognose, Kältewellen, Importe, Entnahmerate).
4. *Strom: Dunkelflaute und Batterien* (ca. 250 Wörter): 50 Episoden seit 2015, Defizit im Median 4.301 GWh, bereinigte Kapazität 31,5 GWh, Deckungsgrad im Median rund 1 % (0–1 %), stabil über acht Sensitivitäten. Offen genannt: nachträgliche Datenbereinigung (Post-hoc), Importe nicht berücksichtigt, keine Aussage zu Alternativen, keine amtliche Zahl für 2030.

**Was heißt das für dich? (Inhalt):** Bei Füllstands-Schlagzeilen auf Menge, Temperatur und Zeitpunkt achten. Ein einzelner Vergleichswinter ist ein schwacher Maßstab. „Batterien lösen die Dunkelflaute“ und „Batterien sind nutzlos“ lassen sich aus der Rechnung beide nicht ableiten: Sie beschreibt nur den Deckungsgrad heutiger Kapazität.

**Lagen wir richtig? (Inhalt):**
- Gas: Keine Aussage ist bisher überprüfbar. Die Entnahme des Winters 2026/27 steht im Prognose-Register als Eintrag #1; Auswertung frühestens Mai/Juni 2027. Zum Redaktionsschluss: „noch offen“, ohne Zwischenstand zur Entnahme.
- Gas: Die Einordnung vom 17.10. nutzt Stand 16.10.; ein aktueller Füllstand wird nur eingefügt, wenn die Bundesnetzagentur-Quelle am Stichtag geprüft ist.
- Strom: Nachlade-Simulation angekündigt, im Repo kein Ergebnis → offen; nachträgliche Bereinigung bleibt ein Confirmation-Bias-Risiko (so im Artikel selbst formuliert); die „2 %“-Zahl aus der Debatte ist laut Artikel nicht zweifelsfrei belegt.

**Woher wir das wissen (Inhalt):** Eurostat nrg_cb_gasm, DWD, Bundesnetzagentur (Lagebewertung 16.10.), SMARD, Marktstammdatenregister (Stichtag 31.8.), IWR/BVES als gekennzeichnete Sekundärquellen. SAP und Validierung im Repo.

**Prüfen vor dem Schreiben:** Das Zitat des Bundesnetzagentur-Präsidenten stammt im Artikel aus Medienberichten, nicht aus einer Primärquelle; im Buch ebenso kennzeichnen. Bundesnetzagentur-Werte nicht „aktualisieren“, ohne Quelle und Datum.

---

## Kapitel 3 – Was kostet Klimapolitik, und wer zahlt?

**Zugeordnet:** (a) „65 Euro rein, 59 Euro raus“ (**Rechenkommentar**, 18.9., korrigiert 17.10.); (b) „Bundestag friert CO₂-Preis 2027 ein“ (Einordnung, 17.10., aktualisiert 22.10.); (c) „KfW-Studie: 6 Billionen Euro …“ (Wissen, 20.10.).
**Umfang:** 1.300–1.700 Wörter.

**Kurz gesagt (Inhalt):** Der Tankrabatt vom Mai/Juni hob 91–95 % des CO₂-Preises auf Benzin auf. Der CO₂-Preis-Korridor 55–65 €/t soll 2027 bleiben, in Cent etwa 16–19 ct je Liter Benzin (mit Mehrwertsteuer). Die „6 Billionen Euro“ sind Bruttoinvestitionen; zusätzlich nötig sind laut KfW rund 65 Mrd. € pro Jahr (etwa 1,5 % des BIP).

**Haupttext – Aufbau:**
1. *Von Tonne zu Cent* (ca. 200 Wörter): 55–65 €/t ergeben etwa 16–19 ct je Liter Benzin und 17–21 ct Diesel (IWH, brutto); die KfW nennt Nettowerte (rund 13 bzw. 15 ct bei 55 €/t); nicht direkt vergleichbar.
2. *Der Tankrabatt* (ca. 250 Wörter): 14,04 ct Energiesteuer, mit Mehrwertsteuer 16,7 ct; erste Auktion 1.7.: Preis sofort am Höchstwert 65 €/t; Verhältnis 91–95 % (Benzin), 82–85 % (Diesel). Mehrverbrauch laut Rechnung rund 0,18–0,37 Mt CO₂ (korrigierte Fassung), geringe Preisreaktion kurzfristig, größer langfristig; Verteilung nach Fahrleistung; Gegenrechnung Deutschlandticket (Bund und Länder zusammen vs. Bund allein).
3. *Der Gesetzgebungsstand 2027* (ca. 150 Wörter): Bundestag beschloss am 15.10. (303 Ja, 210 Nein, 52 Enthaltungen); Bundesrat muss noch abschließend befassen (erster Durchgang 25.9.); Gründe: europäischer Emissionshandel für Gebäude und Verkehr startet erst 2028; 2028 bleibt offen (KfW: 50–75 €/t realistisch, bis 120 nicht ausgeschlossen).
4. *Die Zahl 6 Billionen* (ca. 250 Wörter): 5,7–6,4 Bio. € je Szenario (2025–2045, Preise 2024), rund 290 Mrd. € pro Jahr; Nettoinvestitionen (Mehrkosten) rund 145 Mrd. €/Jahr; bisher 110 Mrd. (Mehrkosten 80); zusätzlich im Mittel etwa 65 Mrd. €/Jahr; Verteilung auf Sektoren und Träger.
5. *Warum die Zahlen leicht missverstanden werden* (ca. 100 Wörter): brutto/netto, Investition/Kosten, Fiskalkosten/volkswirtschaftliche Kosten.

**Was heißt das für dich? (Inhalt):** Cent pro Liter und Euro pro Tonne lassen sich ineinander umrechnen (mit/ohne Mehrwertsteuer beachten). Eine große Summe sagt nichts, solange unklar ist, ob Investition oder Mehrkosten gemeint sind. Keine Empfehlung zu Fahr- oder Heizentscheidungen.

**Lagen wir richtig? (Inhalt):**
- „65 Euro rein“: Kernaussage hielt, Absatzbasis war falsch (42 statt rund 62 Mrd. Liter) und wurde am 17.10. korrigiert; die Grafiken zeigen noch den alten Stand (Hinweis im Artikel); das angekündigte Skript wurde nicht veröffentlicht. Verweis auf Kapitel 8.
- Nachtrag im Artikel: neue Senkung der Energiesteuer für Oktober–Dezember 2026 (beschlossen 25.9., rund 2,5 Mrd. €); ob sich die vermutete Serie von Entlastungen bestätigt, ist nicht belegt (der Artikel nennt es ausdrücklich Hypothese).
- CO₂-Preis 2027: Stand ist „Bundestag beschlossen, Bundesrat steht aus“ (22.10.); zum Redaktionsschluss den Bundesrats-Stand aus dem Bundesrats-Beschluss belegen oder „noch offen“ schreiben.
- KfW: Wir haben keine eigene Analyse; „Lagen wir richtig?“ entfällt inhaltlich und wird als solches gesagt (nur: Wiedergabe geprüft gegen die Studie).

**Woher wir das wissen (Inhalt):** DEHSt (Auktion), Bundestag (Beschluss, hib), Bundesrat (Drs. 462/26), IWH, KfW (Fokus Nr. 561; Beratung: Prognos), ifo-Tracker, BMV-Evaluation Deutschlandticket, Ariadne, Havránek et al. 2012, en2x/AGEB, UBA-Emissionsfaktoren; Faktenchecks im Repo.

**Prüfen vor dem Schreiben:** Satz-für-Satz-Abgleich der Änderungen vom 22.10. mit `korrektur_2026-10-22.md`. Die Formulierung „… und gegenüber 2020“ im Kurz-gesagt-Absatz des CO₂-Preis-Artikels ist im Original schwer lesbar; im Buch klarer fassen, ohne die Aussage zu ändern (mit Faktenprüfung).

---

## Kapitel 4 – Schafft Deutschland sein Klimaziel?

**Zugeordnet:** (a) „Erreicht Deutschland sein Klimaziel 2040? Die Antwort hängt vom Blickwinkel ab“ (Evidenzcheck, 27.8.). Weitere Artikel fehlen (Lücke, siehe E3 im Plan: auffüllen bis 8.11., sonst mit Kapitel 5 zusammenlegen).
**Umfang:** 900–1.300 Wörter (kürzer als die anderen, solange es nur einen Artikel gibt).

**Kurz gesagt (Inhalt):** Das gesetzliche Ziel für 2040 sind 88 % weniger Emissionen als 1990 (150 Mt CO₂-Äquivalent). Ob das Tempo reicht, hängt vom Zeitfenster ab: Der Langfrist-Trend 1990–2025 verfehlt das Ziel deutlich (Projektion 486 Mt), der 10-Jahres-Trend 2015–2025 hat das Ziel im Unsicherheitsbereich (207 Mt, Bereich 16–328). Beides ist keine Prognose.

**Haupttext – Aufbau:**
1. *Wo wir stehen* (ca. 150 Wörter): -48 % seit 1990 laut UBA/klimadashboard.de; Dashboards zeigen Rückgang und Ziel, aber nicht, ob das Tempo reicht.
2. *Zwei Fenster, zwei Antworten* (ca. 300 Wörter): beide Trendfenster mit Zahlen und Bereichen; „Welches Zeitfenster man wählt, entscheidet über die Schlagzeile.“
3. *Was die Rechnung nicht ist* (ca. 150 Wörter): lineare Fortschreibung, keine Annahmen über künftige Politik, keine Strukturbrüche; zwei Methoden (Newey-West-Trendregression, ARIMA als Sensitivität).
4. *Wie wir geprüft haben* (ca. 150 Wörter): vorab festgelegter Plan, unabhängige Prüfung fand eine Präzisierung (Standardfehler-Korrektur konservativer als geplant).

**Was heißt das für dich? (Inhalt):** Bei „auf Kurs“/„verfehlt“-Schlagzeilen nach dem Zeitfenster fragen. Beide Antworten können mit denselben Daten rechnerisch stimmen. Die Rechnung sagt nicht, was die Politik tut oder tun sollte.

**Lagen wir richtig? (Inhalt):**
- Wir haben keine Prognose abgegeben; ein Treffer/Fehlschlag ist deshalb nicht definiert.
- Der Prüfstein für Prognosen dieser Art ist der **Prognose-Check** zu den Projektionsberichten der Bundesregierung (SAP eingefroren 22.10.2026; Ergebnis zum Redaktionsschluss voraussichtlich offen, siehe Kapitel 10) und V4 des geplanten Registers 2027 (deutsche THG-Emissionen).
- Plan B ist in `kapitelplan.md` festgehalten: Nennt der Text nur Stand und Methode, aber kein Ergebnis ohne Validierungsbericht und Freigabe.

**Woher wir das wissen (Inhalt):** UBA über klimadashboard.de (CC BY 4.0); SAP, R-Code und Validierung im Repo (`Analysen/2026-08-emissionen/`; im Ordner liegt kein Validierungsbericht als Datei, nur der Commit `ef3d8d9` „Pilot validiert: R-Ergebnisse matchen Referenzwerte, HAC-Abweichung dokumentiert“).

**Prüfen vor dem Schreiben:** Der Artikel nennt „zwei unabhängige Methoden“ und „unabhängige Prüfung“; Beleg dafür im Repo suchen (kein Validierungsbericht als Datei im Ordner, nur der genannte Commit). Ohne Beleg im Buch nur beschreiben, was im Artikel steht, und die Lücke benennen.

---

## Kapitel 5 – Ist Deutschland „zu klein, um zu zählen“?

**Zugeordnet:** (a) „Die Trittbrettfahrer-Rechnung“ (Evidenzcheck, 31.8.); (b) „COP31: Ist Deutschland ‚zu klein, um zu zählen‘?“ (Einordnung, 19.10.).
**Umfang:** 1.100–1.500 Wörter.

**Kurz gesagt (Inhalt):** Deutschland verursachte 2024 rund 1,3 % der weltweiten Treibhausgasemissionen (Rang 12 von 208). Alle Länder mit höchstens diesem Anteil kommen zusammen auf 31,7 %, historisch (seit 1850, fossiles CO₂) auf 53,1 %. Das Argument „zu klein“ gilt nur, solange es nicht alle sagen. Es ist ein Gedankenexperiment, keine Schuldfrage.

**Haupttext – Aufbau:**
1. *Das Argument* (ca. 120 Wörter): wie es in der Debatte auftaucht; wir untersuchen nicht, wer es wie oft sagt.
2. *Die Rechnung* (ca. 250 Wörter): zwei Zeithorizonte, zwei Gasbasen, nicht direkt vergleichbar; Konzentrationskurve; Pro-Kopf-Stratifizierung (8,07 t gegen 6,36 t im Weltmittel; 58 Länder, Rang 8; 14,2 % der Weltemissionen).
3. *Wie empfindlich das Ergebnis ist* (ca. 200 Wörter): Grenze ist gesetzt, nicht gefunden (Rangplatz-Sensitivität); CO₂-only: 1,5 % und 30,1 %; konsumbasiert: 2,1 % und 40,5 % (andere Gasbasis, anderes Jahr); mit Landnutzung historisch 54,0 %.
4. *Warum anderswo andere Zahlen stehen* (ca. 120 Wörter): „rund zwei Prozent“ (Daten 2017), WiWo 1,46 % (CO₂) und 1,27 % (alle Treibhausgase).
5. *Anlass COP31* (ca. 80 Wörter): Konferenz 9.–20.11. in Antalya; Bezug des Stücks.

**Was heißt das für dich? (Inhalt):** Ein Anteil ist erst mit Bezugsgröße (Jahr, Gase, territorial/konsumbasiert) einordenbar. Wer Prozentangaben vergleicht, sollte sie auf derselben Basis haben. Die Rechnung bewertet weder Verantwortung noch Fairness.

**Lagen wir richtig? (Inhalt):**
- Zahlen: seit der Veröffentlichung nicht revidiert (prüfen: EDGAR-/GCP-Aktualisierungen bis Redaktionsschluss nur nennen, nicht neu rechnen).
- Im Validierungsverfahren wurde vor der Veröffentlichung ein kritischer Datenkonverter-Fehler gefunden und behoben (siehe Kapitel 8).
- Die COP31 findet vor Erscheinen des Buchs statt; unsere Stücke treffen dazu keine Vorhersage. Ein Ergebnisblock („Was beschlossen wurde“) wäre ein neuer Text mit Primärquelle (UNFCCC) und eigener Faktenprüfung; Vorschlag: nur aufnehmen, wenn bis 15.11. eine belastbare Primärquelle vorliegt, sonst bewusst weglassen.

**Woher wir das wissen (Inhalt):** EDGAR (EU JRC), Global Carbon Project, Weltbank, OWID (nur Kreuzprüfung/Sensitivität), Helmholtz-Klima-Initiative, WiWo; SAP, R-Skript, Validierungsberichte im Repo (`Analysen/2026-08-trittbrettfahrer-rechnung/`).

**Prüfen vor dem Schreiben:** Die Helmholtz-Seite nennt Daten von 2017 (Stand April 2021); im Buch so kennzeichnen.

---

## Kapitel 6 – Wo steht die Welt beim 1,5-Grad-Ziel, und kann man CO₂ einfach wieder aus der Luft holen?

**Zugeordnet:** (a) „Monate über 1,5 Grad – ist das Pariser Ziel damit schon gerissen?“ (Wissen, 16.10.); (b) „Kann man CO₂ einfach wieder aus der Luft holen?“ (Wissen, 18.10.); (c) „Zurück auf 1,5 Grad – was der neue UN-Bericht wirklich verlangt“ (Einordnung, 21.10.).
**Umfang:** 1.400–1.800 Wörter.

**Kurz gesagt (Inhalt):** Einzelne Monate über 1,5 Grad bedeuten nicht, dass das Pariser Ziel gerissen ist; maßgeblich ist die Erwärmung über Jahrzehnte (IPCC: 20-Jahres-Mittel). UNEP geht davon aus, dass die Welt 1,5 Grad überschreitet, und rechnet einen Weg zurück: bis 2030 etwa −18 % Emissionen (gegenüber 2025), die Zusagen bringen nur −5 bis −8 %. CO₂-Entnahme ist eine Ergänzung, kein Ersatz.

**Haupttext – Aufbau:**
1. *Was gemessen wurde* (ca. 200 Wörter): September 2026: 1,63 Grad über 1850–1900 (Copernicus), zweiter Monat in Folge über 1,5; Deutschland: 15,9 °C, +2,1 Grad gegenüber 1991–2020.
2. *Wie das Ziel gemessen wird* (ca. 200 Wörter): Monat/Jahr/20-Jahres-Mittel; WMO 2024 etwa 1,55 Grad (erstes Kalenderjahr über 1,5), langfristige Erwärmung 1,34–1,41 Grad; El Niño als Schwankung (NOAA: +2,1 Grad, 83 % Wahrscheinlichkeit eines historisch starken Ereignisses von Oktober bis Dezember; neuer Index seit Februar 2026).
3. *CO₂ aus der Luft* (ca. 250 Wörter): rund 2,2 Mrd. t/Jahr entnommen (≈ 5 % der Brutto-CO₂-Emissionen), 99,9 % konventionell (Wälder, Böden); neuartige Verfahren rund 2 Mio. t/Jahr, +40 % pro Jahr, aber nur etwa 20 % der geplanten Kapazität gebaut; Lücke zu Paris-Szenarien (2030: 0,3; 2035: 1,2; 2050: 5,2 Mrd. t/Jahr); Hürden: Kosten, Potenzial, Nebenwirkungen, wenige Käufer.
4. *Der Weg zurück auf 1,5 Grad* (ca. 250 Wörter): UNEP-Szenario (Spitze 1,7–1,8 Grad, 2100 wieder bei 1,5 mit etwa 50 % Wahrscheinlichkeit); nötige Minderung (−18 %/−45 %/−69 % bis 2030/2035/2040 ggü. 2025) gegen Zusagen; 5,7 % pro Jahr; Erwärmung bei aktueller Politik 2,8 Grad, mit Zusagen 2,6, optimal 2,1; rund 320 Mrd. t Entnahme nötig; Erfolge bei Erneuerbaren.
5. *Der Irrtum „später holen wir es raus“* (ca. 100 Wörter): Verzögerung erhöht Spitzentemperatur und Entnahmebedarf.

**Was heißt das für dich? (Inhalt):** Ein warmer Monat und ein verfehltes Ziel sind zwei verschiedene Aussagen. CO₂-Entnahme heute ist fast ausschließlich Wald und Boden. Szenarien (UNEP) sind keine Vorhersagen. Der Bericht übersetzt die Prozentwerte nicht auf einzelne Länder.

**Lagen wir richtig? (Inhalt):**
- Am 16.10. stand: El Niño dürfte einer der stärksten seit Aufzeichnung werden; NOAA 83 % für Oktober–Dezember. Der Stand zum Redaktionsschluss wird nur mit Primärquelle (NOAA-Diskussion, Copernicus-Monatsbericht Oktober) und Datum nachgetragen oder als „noch offen“ geführt.
- Die Entwicklung „Monate über 1,5 Grad“: Copernicus-Wert für Oktober 2026 (Bericht Anfang November) kann ergänzt werden, rein beschreibend.
- Die Einordnung des UNEP-Berichts stützt sich auf die Pressemitteilung, nicht auf den vollständigen Bericht (im Artikel so gesagt). **Vor Aufnahme ins Buch ist der Abgleich mit Exec Summary/Vollbericht Pflicht**, sonst bleibt der Hinweis im Buch stehen.
- Ob der Weg zurück auf 1,5 Grad gelingt, ist offen (UNEP: etwa 50 %).

**Woher wir das wissen (Inhalt):** Copernicus (12.10.), DWD (29.9.), WMO, IPCC AR6 (SPM B.1.4, TS.1), NOAA CPC (8.10.), State of CDR 3rd Edition (Juni 2026, DOI 10.17605/OSF.IO/ZRD65), UNEP-Pressemitteilung und Bericht (21.10.2026).

**Prüfen vor dem Schreiben:** Der Artikel zum Pariser Ziel nennt „August und September“ als Monate über 1,5 Grad; Quelle Copernicus. Nach der Korrektur vom 16.10. (Link auf Sommer-Evidenzcheck) ist die Verweisfassung zu verwenden.

---

## Querschnitt: Reihenfolge der Arbeit (Vorschlag)

1. Kapitel 1–3 zuerst (alle Primärquellen im Haus, nur Verdichtung); Kapitel 4 nach Entscheidung E3; Kapitel 5–6 danach.
2. Pro Kapitel: Verdichtung → Differenzprüfung durch `faktenpruefer` (Haupttext) → neue Bausteine (Kurz gesagt, Was heißt das …, Lagen wir richtig?) → volle Faktenprüfung → Nachprüfung als Datei.
3. „Lagen wir richtig?“-Bausteine erst am Ende schreiben (Stichtag 15.11.), damit Stände nicht doppelt aktualisiert werden.

## Offene Punkte für die Abstimmung

1. **Kapitel 4:** Wie in E3 vorgesehen: bis 8.11. auffüllen oder mit Kapitel 5 zusammenlegen. Für den THG-Trend 2040 liegt im Repo kein Validierungsbericht als Datei vor (nur der Commit „Pilot validiert“) — gibt es einen an anderer Stelle? Ohne ihn darf das Buch nur wiedergeben, was der Artikel selbst sagt.
2. **Kapitel 5:** Ergebnisblock zur COP31 (neuer Text, mit Primärquelle und Faktenprüfung) aufnehmen oder bewusst weglassen?
3. **Kapitel 6:** Soll der Abgleich des UNEP-Berichts mit dem Volltext vor dem Schreiben erfolgen (Aufwand: Exec Summary lesen), oder bleibt der Hinweis „stützt sich auf die Pressemitteilung“ im Buch?
4. **Kapitel 3:** Soll „65 Euro rein“ im Buch ausdrücklich als Rechenkommentar gekennzeichnet werden (empfohlen)?
