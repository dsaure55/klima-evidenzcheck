# Statistischer Analyseplan (SAP)

**Titel:** Liegt der Niedrigwasserabfluss des Rheins am Pegel Kaub im
Abflussjahr 2026 (gemessen als NM7Q, niedrigstes 7-Tage-Mittel des
Tagesmittelabflusses in m³/s) außerhalb der historischen Schwankungsbreite der
Messreihe, ist er der niedrigste Wert der Messreihe, und zeigen die jährlichen
NM7Q-Werte über die verfügbare Reihe einen monotonen Trend?

**Version:** 1.0
**Status:** final
**Datum:** 19.10.2026
**Autor:in:** sap-autor (Entwurf v0.1–v0.5)
**Freigabe/Einfrieren:** Freigegeben durch Daniel Saure, Datum: 19.10.2026
(im Chat, nachdem ihm der vollständige Text von v0.5 zugeschickt wurde:
„Ich habe SAP v0.5 vollständig gelesen. Einfrieren als Version 1.0, final.“
Inhaltlich identisch mit v0.5; geändert wurden nur Kopf und Versionshistorie.)

**Versionshistorie:**
- **v0.1 (19.10.2026):** Erstentwurf durch den sap-autor-Subagenten vor jedem
  Datenzugriff. Es wurden keine Abfluss- oder Wasserstandsdaten
  heruntergeladen, geöffnet oder grafisch angesehen. Offene Fragen siehe
  Abschnitt 13. Status bleibt **draft**; der SAP ist **nicht** eingefroren.
- **v0.2 (19.10.2026):** Einarbeitung der Antworten von Daniel Saure
  (19.10.2026) auf die zehn offenen Fragen aus Abschnitt 13 durch den
  sap-autor-Subagenten. Geändert: Abschnitt 0 (Status bestätigt), 2.1
  (Abflussjahr bestätigt; Rhein-km laut PEGELONLINE), 2.3 (δ = 5 % bestätigt),
  3.1 (Tabelle; neuer Unterabschnitt 3.1a zur verblindeten
  PEGELONLINE-Sicherung), 3.2 (Frist F = 6 Wochen; Plan C bestätigt), 3.3
  (S1, S5: Prüfsummenverifikation), 3.4 (Nachtrag als eigenes Update), 6 (S2a,
  S2b, S3a; keine kombinierten Sensitivitäten bestätigt), 9 (Datenlizenz), 13
  (umgewandelt in beantwortete Entscheidungen). Methodik, Estimanden und
  Primär-/Sensitivitätszuordnung sind sonst unverändert. Der sap-autor hat
  keine Daten gesichtet, auch nicht die Dateien der verblindeten Sicherung.
  Status bleibt **draft**; der SAP ist **nicht** eingefroren.
- **v0.3 (19.10.2026):** Einarbeitung der Entscheidungen von Daniel Saure
  (19.10.2026) zu den drei Rückfragen des sap-autors nach v0.2 durch den
  sap-autor-Subagenten. Geändert: 3.1 (Tabelle, Rang 3: zweiter
  PEGELONLINE-Abruf), 3.1a (Abbruch und Eskalation bei Prüfsummenfehler;
  Emmerich bleibt ungenutzt; neuer Block zum zweiten PEGELONLINE-Abruf für
  19.10.–31.10.2026 mit Überlappungsprüfung und Vorrang der ersten
  Sicherung), 3.2 (Plan A: Verweis auf beide PEGELONLINE-Abrufe), 3.3 (S1:
  Abbruchregel; S5: zweiter Abruf und Überlappungsprüfung), 13 (Verweis in
  Entscheidung 2; neuer Block „Rückfragen v0.2“). Methodik, Estimanden und
  Primär-/Sensitivitätszuordnung sind unverändert. Der sap-autor hat keine
  Daten gesichtet, auch nicht die Dateien der verblindeten Sicherung. Status
  bleibt **draft**; der SAP ist **nicht** eingefroren.
- **v0.4 (19.10.2026):** Einarbeitung der Antworten von Daniel Saure
  (19.10.2026) auf die sechs Rückfragen des sap-autors nach v0.3 („Ja, alle
  sechs Vorschläge übernehmen und den Kasusfehler korrigieren.“) durch den
  sap-autor-Subagenten. Geändert: 2.1 (Q(t): Verweis auf die Tagesmittelbildung
  aus PEGELONLINE-Rohdaten), 3.1 (Tabelle, Rang 3: Anfragezeitraum und
  spätester Abrufzeitpunkt des zweiten Abrufs, Verweis auf 3.1b), 3.1a
  (Prüfsummenkontrolle über die gesamte Dateisammlung eines Abrufs; zweiter
  Abruf: Durchführung durch die Top-Level-Session, Anfragezeitraum ab
  12.10.2026 mit etwa 7 Tagen Überlappung, spätester Abrufzeitpunkt
  14.11.2026 mit Rang 4 als Fallback, Köln: Q ausgewertet, W nur zur
  Dokumentation), neuer Unterabschnitt 3.1b (Tagesmittelbildung aus
  15-Minuten-Werten), 3.3 (S1, S2, S5), 4 (fehlende Werte), 13 (Kasusfehler in
  Rückfragen v0.2, Frage 2, korrigiert; Querverweise in Rückfragen v0.2,
  Fragen 1 und 2; neuer Block „Rückfragen v0.3“). Methodik, Estimanden und
  Primär-/Sensitivitätszuordnung sind unverändert. Der sap-autor hat keine
  Daten gesichtet, auch nicht die Dateien der verblindeten Sicherung. Status
  bleibt **draft**; der SAP ist **nicht** eingefroren.
- **v1.0 (19.10.2026):** Eingefroren (Status **final**) durch Daniel Saure nach
  vollständigem Lesen von v0.5. Text von v0.5 unverändert übernommen; nur
  Kopfzeilen (Version, Status, Freigabe) und dieser Historieneintrag
  ergänzt. Eingetragen durch die Top-Level-Session. Bis zu diesem Zeitpunkt
  wurden keine Daten gesichtet; die verblindete PEGELONLINE-Sicherung
  (3.1a) ist ungeöffnet.
- **v0.5 (19.10.2026):** Einarbeitung der Festlegung von Daniel Saure
  (19.10.2026) zur Zuordnung des Mitternachtswerts („Mitternacht: Wert 00:00
  gehört zum beginnenden Tag (00:00–23:45 MEZ).“) durch den
  sap-autor-Subagenten. Geändert: 3.1b (Tagesgrenze als halboffenes Intervall
  [00:00, 24:00) MEZ, also 00:00 bis 23:45 MEZ bei 15-Minuten-Raster mit 96
  erwarteten Werten; ein Wert mit Zeitstempel genau 00:00 MEZ gehört zum
  beginnenden Tag; Zeitstempel in anderen Zeitzonen werden vorher nach MEZ
  umgerechnet), 13 (neuer Block „Rückfrage v0.4“; Querverweis am Ende von
  „Rückfragen v0.3“, Frage 6). Methodik, Estimanden und
  Primär-/Sensitivitätszuordnung sind unverändert. Der sap-autor hat keine
  Daten gesichtet, auch nicht die Dateien der verblindeten Sicherung. Status
  bleibt **draft**; der SAP ist **nicht** eingefroren.

---

## 0. Status dieser Analyse

[x] Präregistriert: SAP vor Datenzugriff verfasst; Status bestätigt durch
    Daniel Saure am 19.10.2026 (Abschnitt 13, Entscheidung 1); Einfrieren
    steht noch aus
[ ] Exploratorisch (Daten wurden vor SAP-Erstellung bereits gesichtet – Grund: ___)

**Hinweis zur Prüfung des Auftrags:** Der Auftrag enthielt drei
Medienangaben zum Anlass, nämlich einen Wasserstand am Pegel Kaub von −6 cm am
01.10.2026 als „niedrigsten Tageswert der Messreihe“, einen genannten
Vorrekord von 24–25 cm aus dem Oktober 2018, einen Hinweis auf „Rekord-
Niedrigabflüsse“ im Copernicus-Bulletin für September 2026 sowie die Aussage
„So ein extremes Niedrigwasser hat es noch nie gegeben“ (Treibhauspost #125,
17.10.2026). Diese Angaben werden hier offengelegt, weil sie Zahlen zum
Untersuchungsgegenstand sind.

Einschätzung des sap-autors: Es handelt sich **nicht** um Ergebnisse der hier
geplanten Analyse. Die Angaben betreffen den **Wasserstand W (cm)**, nicht den
**Abfluss Q (m³/s)**, und weder ein NM7Q-Wert noch ein Vergleich mit einer
historischen Verteilung, ein Rang in der Abflussreihe oder ein Trend wurde
übermittelt oder angesehen. Sie sind die zu prüfende Behauptung und nicht ihr
Prüfergebnis. Die Präregistrierung wird dadurch nach dieser Einschätzung nicht
entwertet. Allerdings ist die Analyse **ergebnisgetrieben ausgelöst**: Sie wird
gerechnet, *weil* ein Extremereignis gemeldet wurde. Die Folgen dieser
Selektion stehen in Abschnitt 8.4 und 9.

**Bestätigt:** Daniel Saure teilt diese Einschätzung (19.10.2026, Wortlaut
„Teile die Einschätzung“, Abschnitt 13, Entscheidung 1). Der Status bleibt
„präregistriert“ und nicht „exploratory“. Die verblindete Sicherung der
PEGELONLINE-Rohdaten (Abschnitt 3.1a) ändert daran nichts, solange ihre Dateien
vor dem Einfrieren nicht geöffnet werden. Werden vor dem Einfrieren doch
Abflussdaten, Grafiken oder abgeleitete Kennwerte der Kaub-, Lobith- oder
Köln-Reihe gesichtet, ist der Status zwingend auf „Exploratorisch
(retrospektiv)“ zu setzen.

---

## 1. Hintergrund / Rationale

Ende September und Anfang Oktober 2026 berichteten Medien über ein extremes
Niedrigwasser am Rhein. Der Pegel Kaub ist der für die Schifffahrt
maßgebliche Engpasspegel am Mittelrhein. Dort soll am 01.10.2026 ein
Wasserstand von −6 cm erreicht worden sein, nach Medienangaben der niedrigste
Tageswert der Messreihe (Vorrekord Oktober 2018, in den Medien mit 24–25 cm
angegeben). Das Copernicus-Bulletin für September 2026 (veröffentlicht
12.10.2026) nennt laut Medien Rekord-Niedrigabflüsse unter anderem am Rhein.
In der Treibhauspost #125 (17.10.2026) schreibt Jürgen Döschner, ein so
extremes Niedrigwasser habe es noch nie gegeben. **Alle diese Angaben sind zum
Zeitpunkt der SAP-Erstellung ungeprüft** und werden in Abschnitt 3 (Schritt
D0) gegen Primärquellen verifiziert.

**Lücke gegenüber der öffentlichen Darstellung:**

1. **Wasserstand ist kein homogenes Maß für die Wassermenge.** Der Pegelstand
   in Kaub und erst recht an den Niederrhein-Pegeln (Köln, Lobith) ist über
   Jahrzehnte nicht vergleichbar. Gründe sind Sohlerosion, Felsbeseitigung und
   Fahrrinnenausbau, Buhnen- und Strombauwerke sowie mögliche Änderungen des
   Pegelnullpunkts oder des Pegelstandorts. Ein Rekord im Wasserstand kann
   deshalb auch ohne Rekord in der Wassermenge entstehen (oder umgekehrt). Für
   die Frage „so wenig Wasser wie nie“ ist der **Abfluss Q (m³/s)** das
   physikalisch richtige Maß. Er wird über eine zeitlich fortgeschriebene
   Abflusskurve (W-Q-Beziehung) aus dem Wasserstand abgeleitet, die
   Bettänderungen durch regelmäßige Abflussmessungen berücksichtigt. Der
   Wasserstand ist für die Schifffahrt relevant, aber nicht Gegenstand der
   Inferenz in diesem SAP (siehe Abschnitt 12).
2. **Ein einzelner Tageswert ist störanfällig.** Ein 7-Tage-Mittel (NM7Q) ist
   der in der Niedrigwasserstatistik etablierte, gegen kurzfristige
   Schwankungen robuste Kennwert. Diese Schwankungen entstehen etwa durch
   Schwall und Sunk aus Wasserkraft, durch Wehrbetrieb oder durch Messfehler
   an einzelnen Tagen.
3. **„Rekord“ und „außerhalb der Schwankungsbreite“ sind verschiedene
   Aussagen.** Ein Rekord sagt nur, dass der Wert niedriger ist als alle
   bisherigen. Ob er außerhalb der statistisch zu erwartenden
   Schwankungsbreite liegt, hängt von der Streuung der Reihe ab. Dieser SAP
   legt beide Definitionen vorab fest.
4. **Trendaussagen sind ohne Berücksichtigung von Autokorrelation,
   Bruchpunkten und Regulierung im Einzugsgebiet** leicht überinterpretiert.

## 2. Fragestellung (Estimand)

### 2.1 Begriffe und Kennwerte (verbindlich)

- **Q(t):** Tagesmittel des Abflusses in m³/s am Pegel Kaub (Rhein-km 546,23
  laut PEGELONLINE; im Entwurf v0.1 gerundet als km 546,3 angegeben;
  WSV-Pegel; Pegelnummer laut DGJ-Stammblatt 25700100), wie von der
  Primärquelle veröffentlicht. Es werden keine eigenen Umrechnungen von W in
  Q vorgenommen (Ausnahme: keine; siehe Abschnitt 3, Plan C). Liegen für 2026
  aus PEGELONLINE nur Rohwerte im 15-Minuten-Raster vor, wird das Tagesmittel
  nach der Regel in Abschnitt 3.1b aus den Q-Rohwerten gebildet. Das ist eine
  Mittelung von Q-Werten und keine Umrechnung von W in Q.
- **Abflussjahr j (primäre Jahresdefinition):** das vom Deutschen
  Gewässerkundlichen Jahrbuch (DGJ) verwendete Abflussjahr, also der Zeitraum
  01.11.(j−1) bis 31.10.(j). **Abflussjahr 2026 = 01.11.2025–31.10.2026.**
  Bestätigt durch Daniel Saure am 19.10.2026 (Abschnitt 13, Entscheidung 3);
  eine abweichende DGJ-Konvention ist nicht bekannt. Die Konvention wird
  dennoch im Struktur-Check (Abschnitt 3, Schritt S2) am Stammblatt
  verifiziert. Weicht sie ab, gilt die dort dokumentierte DGJ-Konvention
  einheitlich für die gesamte Reihe, und die Abweichung wird im
  SAP-Amendment-Log des Analyseskripts vermerkt.
  **Begründung für das Abflussjahr statt des Kalenderjahrs:**
  (a) Die amtlichen Jahres-Hauptwerte (NQ, MNQ) im DGJ beziehen sich auf das
  Abflussjahr. Primäranalyse und Fallback-Plan B (Abschnitt 3) verwenden so
  dieselbe Jahresdefinition, und ein Wechsel auf den Fallback ändert die
  Jahresabgrenzung nicht.
  (b) Das Abflussjahr 2026 ist am 31.10.2026 abgeschlossen. Ein vollständiger
  Wert für 2026 liegt damit früher vor als beim Kalenderjahr, und es muss
  nicht auf einen unvollständigen Jahreswert ausgewichen werden.
  (c) Nachteil: Ein Niedrigwasserereignis kann über die Grenze
  31.10./01.11. hinweg andauern und dann zwischen zwei Abflussjahren geteilt
  werden. Dieses Randproblem wird über die Randprüfung in 5.2 und die
  Sensitivitätsanalysen S2a/S2b (Kalenderjahr, Niedrigwasserjahr
  April–März) adressiert.
- **NM7Q(j):** das Minimum über alle gleitenden arithmetischen 7-Tage-Mittel
  von Q(t), deren **sämtliche sieben Tage** im Abflussjahr j liegen
  (Fenster überschreiten die Jahresgrenze nicht). Ein 7-Tage-Fenster wird nur
  berechnet, wenn alle sieben Tageswerte vorhanden sind (keine Imputation;
  Gültigkeitsregel für Jahre siehe Abschnitt 4).
- **NQ(j):** niedrigster Tagesmittelabfluss im Abflussjahr j (Sensitivitäts-
  kennwert und Kennwert im Fallback-Plan B).
- **NM30Q(j):** analog NM7Q mit 30-Tage-Fenster (Sensitivitätskennwert).
- **Historische Referenzreihe H:** alle gültigen Abflussjahre (Abschnitt 4)
  vom ersten vollständigen Abflussjahr der verfügbaren Q-Tagesreihe bis
  einschließlich Abflussjahr 2025. **Abflussjahr 2026 geht nicht in H ein**
  (kein zirkuläres Design). n = Anzahl der Jahre in H.

### 2.2 Primärer Estimand (E1): außerhalb der historischen Schwankungsbreite

„Liegt ln(NM7Q₂₀₂₆) am Pegel Kaub unterhalb der unteren Grenze des
zweiseitigen 95 %-Prognoseintervalls für eine neue Beobachtung, das aus den
logarithmierten NM7Q-Werten der historischen Referenzreihe H unter der Annahme
einer stationären Log-Normalverteilung berechnet wird, und wie groß ist die
prädiktive Unterschreitungswahrscheinlichkeit von NM7Q₂₀₂₆?“

Formal mit yᵢ = ln(NM7Qᵢ), i ∈ H, Mittelwert ȳ, Standardabweichung s
(Nenner n−1):

- PI₉₅ = ȳ ± t_{n−1; 0,975} · s · √(1 + 1/n), rücktransformiert mit exp()
  auf m³/s.
- **„Außerhalb der historischen Schwankungsbreite (unterhalb)“** ⇔
  NM7Q₂₀₂₆ < exp(untere Grenze PI₉₅).
- **„Außerhalb (oberhalb)“** ⇔ NM7Q₂₀₂₆ > exp(obere Grenze PI₉₅). Dieser Fall
  wird der Vollständigkeit halber definiert und ebenso berichtet.
- Sonst: **„innerhalb der historischen Schwankungsbreite“**.
- **Kontinuierliches Begleitmaß:** standardisierte Abweichung
  T₂₀₂₆ = (ln NM7Q₂₀₂₆ − ȳ) / (s · √(1 + 1/n)) und prädiktive
  Unterschreitungswahrscheinlichkeit p_pred = F_{t, n−1}(T₂₀₂₆). Dazu die daraus
  folgende „prädiktive Jährlichkeit“ 1/p_pred in Jahren, die ausdrücklich als
  modellabhängig gekennzeichnet wird.

Eine Grenzlage wird nicht binär überinterpretiert. T₂₀₂₆ und p_pred werden
immer berichtet.

### 2.3 Zentraler deskriptiver Endpunkt (D1): Rekordstatus

Dieser Endpunkt prüft direkt die mediale Behauptung „noch nie“, beschränkt auf
die Messreihe. Er ist deterministisch und kein statistischer Test.

- **Rang** von NM7Q₂₀₂₆ unter den n + 1 Werten (H ∪ {2026}); Rang 1 = niedrigster
  Wert. Ties werden bei der Berichtsgenauigkeit (ganze m³/s) als geteilter Rang
  ausgewiesen.
- **Rekord-Kategorien** mit δ = relative Messunsicherheit des Niedrigwasser-
  abflusses am Pegel Kaub laut Primärquelle (BfG/WSV). Ist sie dort nicht
  dokumentiert, gilt vorab festgelegt δ = 5 % (bestätigt durch Daniel Saure am
  19.10.2026, Abschnitt 13, Entscheidung 5).
  Q_min,H bezeichnet den niedrigsten NM7Q-Wert in H.
  - **„Rekord, eindeutig“:** NM7Q₂₀₂₆ < Q_min,H · (1 − δ)
  - **„Rekord innerhalb der Messunsicherheit“:** Q_min,H · (1 − δ) ≤
    NM7Q₂₀₂₆ < Q_min,H
  - **„kein Rekord, aber innerhalb der Messunsicherheit des bisherigen
    Rekords“:** Q_min,H ≤ NM7Q₂₀₂₆ ≤ Q_min,H · (1 + δ)
  - **„kein Rekord“:** NM7Q₂₀₂₆ > Q_min,H · (1 + δ)
- Berichtet werden außerdem das Abflussjahr des bisherigen Minimums Q_min,H,
  die Differenz in m³/s und in Prozent sowie das **erste Jahr der
  Messreihe**. „Rekord“ bedeutet immer „niedrigster Wert seit Beginn der
  verfügbaren Abfluss-Tagesreihe am Pegel Kaub“ und nie „niedrigster Wert
  aller Zeiten“.

### 2.4 Sekundärer Estimand (E2): monotoner Trend

„Weisen die jährlichen NM7Q-Werte am Pegel Kaub über alle gültigen Abflussjahre
der Referenzreihe H (erstes verfügbares Abflussjahr bis 2025) einen monotonen
Trend auf? Geprüft wird mit dem Mann-Kendall-Test mit Varianzkorrektur für
serielle Autokorrelation nach Hamed & Rao (1998), zweiseitig, α = 0,05. Wie groß
ist die Sen-Steigung (Theil-Sen-Schätzer) mit 95 %-Konfidenzintervall in m³/s
pro Dekade?“

- 2026 ist in der Primärvariante von E2 **nicht** enthalten. Gründe: Der Wert
  ist vorläufig, und die Analyse wurde durch genau dieses Extremjahr
  ausgelöst (Selektion). Die Variante mit 2026 ist Sensitivitätsanalyse S8.
- Effektgröße zusätzlich relativ: Sen-Steigung in Prozent des Medians von
  NM7Q in H pro Dekade.
- Kendalls τ wird mitberichtet.

### 2.5 Verifikation des Anlasses (D0, rein deskriptiv)

Anhand der Primärquellen wird geprüft und dokumentiert:
(a) ob am 01.10.2026 am Pegel Kaub ein Wasserstand von −6 cm (Tagesmittel oder
Einzelwert? das wird festgehalten) amtlich gemeldet wurde,
(b) welcher Wert und welches Datum laut WSV/BfG der bisherige niedrigste
Wasserstand ist,
(c) was das Copernicus-Bulletin September 2026 wörtlich zum Rhein aussagt,
einschließlich der Frage, ob es sich auf Beobachtungen oder auf modellierte
Abflüsse (z. B. EFAS/GloFAS) stützt.
D0 dient nur der Quellenverifikation der Medienangaben. Aus Wasserständen
werden keine Homogenitäts- oder Trendaussagen abgeleitet.

Diese Formulierungen sind so gewählt, dass zwei unabhängige Analyst:innen mit
diesem SAP zu identischem Kennwert, identischer Jahresdefinition, identischer
Referenzreihe, identischem Modell und identischen Klassifikationsregeln
gelangen.

## 3. Datenquelle

### 3.1 Quellenhierarchie (verbindlich)

| Rang | Quelle | Verwendung | Bemerkung |
|---|---|---|---|
| 1 | **BfG / Deutsches Gewässerkundliches Jahrbuch (DGJ)**, Stammblatt Kaub: https://dgj-daten.bafg.de/Rhein/Kaub/25700100_WQ.pdf sowie die zugehörigen DGJ-Tageswerte, falls über dgj-daten.bafg.de oder auf Anfrage bei der BfG verfügbar | geprüfte historische Q-Tageswerte, Jahres-Hauptwerte (NQ, MNQ), Messunsicherheit, Pegelgeschichte | Primärquelle; amtlich geprüfte Werte |
| 2 | **GRDC** (Global Runoff Data Centre, BfG Koblenz), Tageswerte Kaub, Lobith, Köln | historische Q-Tagesreihen, falls Rang 1 keine freien Tageswerte liefert | nach Kenntnisstand Weitergabe der Rohdaten lizenzrechtlich eingeschränkt; Rohdaten nur lokal, Prüfsummen eingecheckt (Abschnitt 9; Abschnitt 13, Entscheidung 7) |
| 3 | **WSV / PEGELONLINE** (pegelonline.wsv.de) | Werte des Abflussjahres 2026 (W und, falls angeboten, Q) | **Rohdaten, ungeprüft**; die REST-Schnittstelle hält nach Kenntnisstand nur ein rollierendes Fenster von etwa 30 Tagen vor. Quelle für 2026 sind die verblindete Sicherung vom 19.10.2026 und der zweite Abruf Anfang November 2026, spätestens am 14.11.2026 (Anfragezeitraum ab 12.10.2026 zur Abdeckung von 19.10.–31.10.2026) (beide Abschnitt 3.1a). Tagesmittelbildung nach Abschnitt 3.1b |
| 4 | **WSV/BfG auf Anfrage** | vollständige Q-Tageswerte Kaub 01.11.2025–31.10.2026 (vorläufig) | falls Rang 3 das Abflussjahr 2026 nicht vollständig abdeckt |
| 5 | **Rijkswaterstaat Waterinfo** (waterinfo.rws.nl), Pegel Lobith | Q-Tageswerte Lobith historisch und 2026 | Primärquelle für Lobith |
| — | Copernicus-Bulletin, Medienberichte | nur D0 (Verifikation des Anlasses) | keine Datenquelle für E1/E2 |

**Vorrangregel:** Weichen Werte zwischen Quellen für denselben Pegel und
Zeitraum ab, hat die Quelle mit dem höheren Rang Vorrang. Abweichungen von
mehr als 1 % in einem Jahreskennwert werden tabellarisch dokumentiert.

**Our World in Data (OWID), Prüfung gemäß CLAUDE.md:** OWID wurde als
Sekundärquelle geprüft und wird **nicht verwendet**. Begründung: OWID
veröffentlicht nach Kenntnisstand keine pegelbezogenen Abfluss-Tagesreihen
(m³/s) für einzelne Flüsse oder Pegel. Die dort angebotenen klimabezogenen
Reihen (Temperatur, Niederschlag, Dürreindizes auf Länderebene) betreffen
entweder Ursachenvariablen, die hier ausdrücklich nicht untersucht werden
(Abschnitt 12), oder sind räumlich nicht auf das Rhein-Einzugsgebiet bis Kaub
abgegrenzt. Damit eignet sich OWID weder als Fallback noch zur
Plausibilisierung von E1/E2. Bietet OWID entgegen dieser Einschätzung
pegelbezogene Abflussdaten an, gilt das als dokumentierter Hinweis an Daniel
und nicht als Änderung dieses SAP.

### 3.1a Verblindete PEGELONLINE-Sicherung (2026-Quelle für Rang 3)

Diese Sicherung ist die 2026-Quelle für PEGELONLINE (Rang 3). Sie wurde vor
dem Einfrieren durchgeführt, um den Datenverlust durch das rollierende
Fenster der Schnittstelle zu vermeiden (Abschnitt 13, Entscheidung 2).

- **Abruf:** 2026-10-19, 08:16:33 UTC, durch die Top-Level-Session (nicht
  durch den analyst-Subagenten).
- **Umfang:** Stationen Kaub, Köln und Emmerich, jeweils Abfluss Q und
  Wasserstand W (Rohdaten, ungeprüft). Anfragezeitraum ab 2026-08-01. Welcher
  Zeitraum tatsächlich geliefert wurde, wird erst nach dem Einfrieren im
  Struktur-Check S5 festgestellt.
- **Ablage:** `Analysen/2026-10-rhein-niedrigwasser/rohdaten/pegelonline_blind/`
  mit `SICHERUNGSPROTOKOLL.md` und `SHA256SUMS.txt`; Commits 3590de4 und
  d4ed117.
- **Verblindung:** Die Dateien wurden laut Auftrag nicht geöffnet. Bis zum
  Einfrieren dürfen sie weder geöffnet noch geplottet noch ausgewertet werden
  (siehe Abschnitt 0).
- **Prüfsummenverifikation (verbindlich vor jeder Nutzung):** Vor jeder
  Nutzung von Dateien eines Abrufs wird die **gesamte Dateisammlung dieses
  Abrufs** gegen dessen `SHA256SUMS.txt` verifiziert, nicht nur die zu
  öffnende Datei (Abschnitt 13, Rückfragen v0.3, Frage 5). Das Ergebnis wird
  im Struktur-Check S1 dokumentiert.
  **Schlägt die Verifikation fehl** (abweichende Prüfsumme bei mindestens
  einer Datei der Sammlung, eine in `SHA256SUMS.txt` gelistete Datei fehlt,
  oder für eine zu nutzende Datei gibt es keinen Eintrag in
  `SHA256SUMS.txt`), wird die Analyse **abgebrochen und an Daniel Saure
  eskaliert**. Es gibt **keinen automatischen Ausweichpfad**: Es wird weder
  auf Rang 4, auf einen erneuten PEGELONLINE-Abruf noch auf Plan B, C oder D
  gewechselt, und die betroffene Datei wird weder geöffnet noch ersetzt. Über
  das weitere Vorgehen entscheidet Daniel Saure (Abschnitt 13, Rückfragen
  v0.2, Frage 2). Die Regel gilt für die erste Sicherung und für den zweiten
  Abruf (unten) gleichermaßen.
- **Emmerich:** Emmerich wurde zusätzlich gesichert, weil Lobith keine
  PEGELONLINE-Station ist. Die Emmerich-Sicherung **bleibt ungenutzt**. Sie
  ist **kein Ersatz für Lobith** (S1a und Plan C beziehen Lobith
  ausschließlich aus Rijkswaterstaat Waterinfo, Rang 5) und **keine
  Sensitivitätsanalyse**. Ihre Dateien werden nicht ausgewertet (Abschnitt
  13, Rückfragen v0.2, Frage 3).
- **Stationsangabe:** PEGELONLINE nennt für Kaub Rhein-km 546,23.

**Zweiter PEGELONLINE-Abruf (Abdeckung 19.10.–31.10.2026, Anfragezeitraum ab
12.10.2026)** (Abschnitt 13, Rückfragen v0.2, Frage 1, und Rückfragen v0.3,
Fragen 1 bis 4):

Die erste Sicherung endet mit ihrem Abrufzeitpunkt (19.10.2026, 08:16:33 UTC).
Die restlichen Tage des Abflussjahres 2026 werden durch einen zweiten Abruf
gesichert.

- **Durchführung:** durch die Top-Level-Session (nicht durch den
  analyst-Subagenten), wie bei der ersten Sicherung. Die durchführende Stelle
  wird im `SICHERUNGSPROTOKOLL.md` des zweiten Abrufs vermerkt (Rückfragen
  v0.3, Frage 2).
- **Zeitpunkt:** Anfang November 2026, und zwar erst **nach dem Ende des
  Abflussjahres 2026** (also nach dem 31.10.2026), damit der Zeitraum bis
  einschließlich 31.10.2026 abgedeckt werden kann. **Spätester
  Abrufzeitpunkt ist der 14.11.2026.** Das lässt Puffer zum nicht exakt
  bekannten rollierenden Fenster der Schnittstelle. Erfolgt bis zum
  14.11.2026 kein Abruf, greift **Rang 4 (WSV/BfG-Anfrage)** für die
  fehlenden Tage, nach den Regeln in 3.1 und 3.2 (Rückfragen v0.3, Frage 4).
- **Anfragezeitraum:** 12.10.2026 bis einschließlich 31.10.2026. Der
  Anfragezeitraum beginnt bewusst vor dem Ende der ersten Sicherung. Daraus
  ergibt sich eine Überlappung von etwa 7 Tagen (12.10.2026 bis zum
  Abrufzeitpunkt der ersten Sicherung) für die Überlappungsprüfung (unten;
  Rückfragen v0.3, Frage 3).
- **Umfang:** Pegel Kaub, Abfluss Q (Analysegröße) und Wasserstand W (nur zur
  Dokumentation, keine Verwendung in E1, D1 oder E2). Außerdem die im SAP
  vorgesehenen Sensitivitätspegel, soweit sie PEGELONLINE-Stationen sind; das
  ist Köln (S1b), im selben Umfang wie Kaub: Q wird ausgewertet, W nur zur
  Dokumentation (Rückfragen v0.3, Frage 1).
  Lobith (S1a) ist keine PEGELONLINE-Station und wird weiterhin aus
  Rijkswaterstaat Waterinfo (Rang 5) bezogen. Emmerich wird nicht abgerufen
  (siehe oben).
- **Dokumentation wie bei der ersten Sicherung:** Abrufzeitpunkt (UTC),
  durchführende Stelle, SHA-256-Prüfsumme jeder Datei in einer eigenen
  `SHA256SUMS.txt`, eigenes `SICHERUNGSPROTOKOLL.md`, Ablage in einem eigenen,
  von `pegelonline_blind/` getrennten Unterordner unter
  `Analysen/2026-10-rhein-niedrigwasser/rohdaten/`, Commit-Hash.
- **Verblindung:** Ist der SAP zum Abrufzeitpunkt noch nicht eingefroren,
  gelten für die Dateien des zweiten Abrufs dieselben Verblindungsregeln wie
  für die erste Sicherung.
- **Prüfsummenverifikation:** wie bei der ersten Sicherung (gesamte
  Dateisammlung des zweiten Abrufs gegen dessen eigene `SHA256SUMS.txt`, vor
  jeder Nutzung), einschließlich Abbruch und Eskalation bei Fehlschlag.
- **Überlappungsprüfung:** Zeitpunkte (Zeitstempel der Rohwerte), die in
  beiden Abrufen enthalten sind, werden je Pegel und Größe (Q, W) auf
  Übereinstimmung geprüft. Als Abweichung gilt jeder nicht identische Wert am
  selben Zeitstempel. Berichtet werden die Anzahl überlappender Zeitpunkte,
  die Anzahl abweichender Zeitpunkte und die maximale absolute und relative
  Abweichung. **Bei Abweichungen hat die erste Sicherung Vorrang** (in v0.4
  unverändert bestätigt, Rückfragen v0.3, Frage 3). Werte des
  zweiten Abrufs werden nur für Zeitpunkte verwendet, die in der ersten
  Sicherung nicht enthalten sind. Abweichungen werden im Struktur-Check S5
  und im Ergebnisbericht berichtet. Sie lösen keinen Quellen- oder
  Planwechsel aus. Diese Vorrangregel betrifft zwei Abrufe derselben Quelle
  (Rang 3) und berührt die Rangfolge-Vorrangregel in 3.1 nicht.
- **Unvollständige Abdeckung:** Deckt der zweite Abruf den Zeitraum
  19.10.–31.10.2026 nicht vollständig ab (etwa weil Werte bereits aus dem
  rollierenden Fenster gefallen sind oder der Abruf scheitert; Nachweis nach
  der Dokumentationsanforderung in 3.3), oder erfolgt bis zum 14.11.2026 kein
  Abruf, bleibt **Rang 4 (WSV/BfG-Anfrage)** der Fallback für die fehlenden
  Tage, nach den Regeln in 3.1 und 3.2.

### 3.1b Tagesmittelbildung aus PEGELONLINE-Rohdaten (15-Minuten-Werte)

PEGELONLINE liefert Rohwerte im 15-Minuten-Raster. Für die Bildung der
Tagesmittel Q(t) des Abflussjahres 2026 aus beiden PEGELONLINE-Abrufen (3.1a)
gilt verbindlich (Abschnitt 13, Rückfragen v0.3, Frage 6). Die Regel gilt für
Kaub und Köln; W wird nur dokumentiert und nicht ausgewertet.

- **Zusammenführung:** Vor der Tagesmittelbildung werden die Rohwerte beider
  Abrufe nach der Vorrangregel der Überlappungsprüfung (3.1a) zu einer
  Zeitreihe je Pegel zusammengeführt.
- **Tagesgrenze:** Ein Tag umfasst die Rohwerte mit Zeitstempel im
  halboffenen Intervall **[00:00, 24:00) MEZ** (UTC+1, ganzjährig, ohne
  Sommerzeit), angelehnt an die DGJ-Konvention. Bei 15-Minuten-Raster sind
  das die Zeitstempel 00:00 bis 23:45 MEZ mit **96 erwarteten Werten**. Ein
  Wert mit Zeitstempel genau 00:00 MEZ gehört zum **beginnenden** Tag
  (Abschnitt 13, Rückfrage v0.4). Zeitstempel in anderen Zeitzonen (z. B.
  MESZ oder UTC aus der API) werden vor der Tageszuordnung nach MEZ (UTC+1)
  umgerechnet.
- **Tagesmittel:** arithmetisches Mittel aller Werte eines Tages.
- **Gültigkeit eines Tages:** Ein Tag gilt als gültig, wenn mindestens 90 %
  der erwarteten Werte vorliegen, also mindestens 87 von 96. Sonst ist der Tag
  **fehlend**, und es gelten die Regeln für fehlende Tage (2.1: 7-Tage-Fenster
  nur bei sieben vorhandenen Tageswerten; Abschnitt 4: Gültigkeitsregel,
  Gültigkeit 2026, keine Imputation oder Interpolation).
- **Prüfung der DGJ-Konvention:** Ob das DGJ tatsächlich MEZ als Tagesgrenze
  verwendet, wird im Struktur-Check S2 geprüft. Bei Abweichung gilt die
  DGJ-Konvention, und das wird als dokumentierte Abweichung berichtet
  (SAP-Amendment-Log des Analyseskripts und Ergebnisbericht). Die
  Gültigkeitsregel (mindestens 87 von 96 Werten) bleibt davon unberührt.

### 3.2 Datenpläne und vorab festgelegte Fallback-Regeln

Die Wahl des Plans richtet sich **ausschließlich nach der Datenverfügbarkeit**,
nicht nach Werten. Sie wird vor jeder Berechnung eines Kennwerts
dokumentiert.

**Frist F = 6 Wochen ab Einfrieren** (bestätigt durch Daniel Saure am
19.10.2026, Abschnitt 13, Entscheidung 4).

- **Plan A (primär):** Q-Tagesreihe Kaub über die gesamte verfügbare Messreihe
  (Rang 1, sonst Rang 2) und vollständige Q-Tageswerte für das Abflussjahr 2026
  (Rang 3, d. h. beide PEGELONLINE-Abrufe laut 3.1a, ergänzt durch Rang 4).
  Primärkennwert: NM7Q.
- **Plan B (Fallback 1, keine freie lange Tagesreihe):** Ist für Kaub weder
  über DGJ/BfG noch über GRDC eine Q-Tagesreihe frei oder auf Anfrage
  innerhalb der Frist F (6 Wochen ab Einfrieren) verfügbar, wird die
  **jährliche NQ-Reihe**
  (niedrigster Tagesmittelabfluss je Abflussjahr) aus dem DGJ als historische
  Referenzreihe verwendet. Der Primärkennwert wechselt dann für E1, D1 und E2
  von NM7Q auf **NQ**. Alle Regeln aus Abschnitt 2 gelten mit NQ statt NM7Q.
  NQ₂₀₂₆ wird aus den Tageswerten 2026 gebildet. **MNQ** (Mittel der
  jährlichen NQ über einen Bezugszeitraum) ist kein Jahreskennwert. Es wird
  nur als Referenzwert berichtet (NQ₂₀₂₆ in Prozent von MNQ des
  DGJ-Bezugszeitraums) und nicht als Reihe analysiert. Plan B wird im
  Ergebnisbericht ausdrücklich als „Fallback: Tagesminimum statt
  7-Tage-Mittel, störanfälliger“ gekennzeichnet.
- **Plan C (Fallback 2, keine Q-Werte 2026 für Kaub):** Liegen für das
  Abflussjahr 2026 am Pegel Kaub innerhalb der Frist F keine amtlichen
  Q-Tageswerte vor (nur Wasserstände), wird **keine eigene Umrechnung W → Q**
  vorgenommen. Eine Extrapolation der Abflusskurve unterhalb bisher
  gemessener Wasserstände wäre besonders unsicher. Stattdessen wird **Lobith
  (Rijkswaterstaat Waterinfo)** zum Primärpegel für E1 und D1, mit identischen
  Regeln. E2 bleibt für Kaub auf der historischen Reihe ohne 2026 bestehen,
  weil es 2026 primär ohnehin nicht enthält. Der Pegelwechsel wird im
  Ergebnisbericht ausdrücklich benannt. Bestätigt durch Daniel Saure am
  19.10.2026 (Abschnitt 13, Entscheidung 8).
- **Plan D (keine der Varianten möglich):** Die Analyse wird nicht gerechnet.
  Es wird an Daniel eskaliert. Es gibt keinen improvisierten Ersatzkennwert.

### 3.3 Struktur-Check (erster dokumentierter Schritt vor jeder Kennwertberechnung)

- **S1:** Gewählten Datenplan (A/B/C/D) mit Begründung dokumentieren. Zu jeder
  Quelle URL, Zugriffsdatum und Uhrzeit, Datenstand bzw. Versionsangabe,
  Dateiname und SHA-256-Prüfsumme der Rohdatei festhalten. Für die
  verblindete PEGELONLINE-Sicherung und den zweiten PEGELONLINE-Abruf (3.1a):
  Ergebnis der Prüfsummenverifikation der gesamten Dateisammlung des
  jeweiligen Abrufs gegen dessen `SHA256SUMS.txt` dokumentieren, bevor eine
  Datei genutzt wird. Schlägt die Verifikation fehl, wird die Analyse
  abgebrochen und an Daniel Saure eskaliert; es gibt keinen automatischen
  Ausweichpfad (3.1a).
- **S2:** Jahresdefinition des DGJ verifizieren (Abschnitt 2.1). Außerdem
  prüfen, ob das DGJ MEZ als Tagesgrenze der Tagesmittel verwendet; bei
  Abweichung gilt die DGJ-Konvention als dokumentierte Abweichung (3.1b).
- **S3:** Beginn der Q-Tagesreihe Kaub sowie Pegelgeschichte laut Stammblatt
  dokumentieren: Pegelnullpunkt-Änderungen, Standortverlegungen, Wechsel der
  Abflussermittlung (z. B. Flügelmessung → ADCP, Einführung neuer
  Abflusskurven) und Lücken. Ergebnis ist die Grundlage für das Bruchfenster
  S3c (Abschnitt 6).
- **S4:** Vorliegende Angaben zur Messunsicherheit von Q bei Niedrigwasser
  dokumentieren (für δ in D1).
- **S5:** Für 2026 dokumentieren: Herkunft (PEGELONLINE-Sicherung vom
  19.10.2026 und zweiter PEGELONLINE-Abruf Anfang November 2026, spätestens
  14.11.2026, mit Anfragezeitraum ab 12.10.2026 laut 3.1a / Anfrage),
  durchführende Stelle beider Abrufe, Prüfstatus
  („Rohdaten, ungeprüft“ bzw. „vorläufig“), abgedeckter Zeitraum, Anzahl
  fehlender Tage (einschließlich der nach 3.1b ungültigen Tage), Zeitstempel
  beider Abrufe sowie das Ergebnis der
  Überlappungsprüfung zwischen beiden Abrufen (3.1a). Außerdem, ob die
  Primärquelle für
  2026 eine neue oder geänderte Abflusskurve verwendet und ob der Wasserstand
  2026 unterhalb des niedrigsten W liegt, für den die Abflusskurve durch
  Messungen gestützt ist. Letzteres ist eine Qualitätsangabe der Quelle und
  kein Ergebnis.
- **S6:** Abgleich überlappender Jahre zwischen Rang-1- und Rang-2-Quelle
  (Kennwerte NM7Q/NQ) und Dokumentation der Abweichungen.
- **S7:** Durchführung von D0 (Abschnitt 2.5).

**Dokumentationsanforderung bei behaupteten Zugriffsproblemen:** Ein
gescheiterter Zugriff ist nur mit nachprüfbarem Artefakt (Log, Zeitstempel,
HTTP-Status oder Fehlermeldung) zulässig. Andernfalls ist zu schreiben:
„nicht versucht“.

### 3.4 Behandlung der vorläufigen Werte 2026

- Alle Werte des Abflussjahres 2026 gelten als **„vorläufig (Rohdaten,
  ungeprüft)“**. Die historischen DGJ-Werte gelten als geprüft.
- Die Kennzeichnung erscheint in jeder Tabelle, Grafik und Textstelle, die
  einen 2026-Wert zeigt (Abschnitt 11).
- Sensitivitätsanalyse S7 (Kipppunktanalyse) quantifiziert, um wie viel Prozent
  sich NM7Q₂₀₂₆ durch die spätere Prüfung ändern müsste, damit sich die
  Klassifikation in E1 oder D1 ändert.
- **Vorab festgelegter Nachtrag:** Sobald das DGJ geprüfte Werte für das
  Abflussjahr 2026 veröffentlicht, wird die Analyse **unverändert nach diesem
  SAP** wiederholt und als Nachtrag mit Gegenüberstellung vorläufig/geprüft
  dokumentiert. Die Erstauswertung wird dabei nicht ersetzt. Der Nachtrag wird
  in der Redaktionspipeline als eigenes Update geführt (Abschnitt 13,
  Entscheidung 10).

- Zugriffsdatum: [wird vom analyst-Subagenten beim Datenzugriff eingetragen]
- Datenstand laut Quelle: [wird beim Datenzugriff dokumentiert]

## 4. Analysepopulation

- **Analyseeinheit:** Abflussjahr am Pegel Kaub (Primärpegel; bei Plan C
  Lobith).
- **Zu bewertende Beobachtung:** Abflussjahr 2026 (01.11.2025–31.10.2026).
- **Frühester Analysezeitpunkt:** nach dem 31.10.2026 und nach Vorliegen der
  vollständigen Tageswerte bis 31.10.2026. Vorher werden keine Kennwerte
  berechnet, auch keine vorläufigen oder unterjährigen.
- **Primäre historische Referenzreihe H:** alle gültigen Abflussjahre vom
  ersten vollständigen Abflussjahr der Q-Tagesreihe bis 2025.
- **Gültigkeitsregel für ein Abflussjahr (vorab, ohne Kenntnis der Werte):**
  Ein Jahr ist gültig, wenn (a) höchstens 5 % der Tage fehlen und (b) keine
  zusammenhängende Lücke länger als 7 Tage ist. Ungültige Jahre werden aus H
  ausgeschlossen. Ihre Anzahl und Jahreszahlen werden berichtet.
  Sensitivitätsanalyse S9 nimmt sie mit dem aus den vorhandenen vollständigen
  Fenstern berechneten NM7Q wieder auf.
- **Gültigkeit 2026:** Erfüllt 2026 die Gültigkeitsregel nicht, wird E1/D1
  trotzdem berechnet, aber unübersehbar als „unvollständiges Jahr; NM7Q
  möglicherweise überschätzt“ gekennzeichnet. Eine Lücke kann den wahren
  Tiefstwert verdecken.
- **Fehlende Werte:** keine Imputation, keine Interpolation in der
  Primäranalyse. Ein aus PEGELONLINE-Rohdaten gebildeter Tag, der die
  Gültigkeitsregel für Tage in 3.1b (mindestens 87 von 96 Werten) nicht
  erfüllt, gilt als fehlender Tag.
- **Keine inhaltlich motivierten Jahresausschlüsse.** Bekannte Extremjahre
  bleiben in H. Ihr Einfluss wird über die Diagnostik in 5.2 sichtbar gemacht.
- **Mindestumfang:** E1 erfordert n ≥ 30 gültige Jahre in H, E2 erfordert
  n ≥ 30 für den Hamed-Rao-Test. Bei 10 ≤ n < 30 werden beide berechnet und als
  „wenig belastbar“ gekennzeichnet. Bei n < 10 entfallen PI und Trendtest,
  und es wird eskaliert.
- **Weitere Pegel (nur Sensitivität, S1):** Lobith (Rijkswaterstaat) und Köln
  (DGJ/GRDC), jeweils mit identischen Regeln und eigener, vollständig
  verfügbarer Referenzreihe bis 2025. Hydrologischer Hinweis: Kaub liegt
  oberhalb der Mündungen von Lahn und Mosel. Köln enthält zusätzlich Lahn,
  Mosel und Sieg, Lobith zusätzlich Ruhr und Lippe. Die Pegel messen also
  unterschiedliche Einzugsgebiete und sind nicht austauschbar.

## 5. Statistische Methoden

### 5.1 Primäranalyse

**E1 (primär), Pegel Kaub, Kennwert NM7Q, Abflussjahr, Referenzreihe H bis
2025:**
1. NM7Q(j) für alle j ∈ H und für 2026 nach Abschnitt 2.1 berechnen.
2. yᵢ = ln(NM7Qᵢ), ȳ und s über H berechnen.
3. PI₉₅, T₂₀₂₆, p_pred und prädiktive Jährlichkeit nach Abschnitt 2.2
   berechnen.
4. Klassifikation: innerhalb / außerhalb (unterhalb) / außerhalb (oberhalb).

**D1:** Rang und Rekord-Kategorie nach Abschnitt 2.3. Zusätzlich die
empirische Unterschreitungshäufigkeit (Weibull-Plotting-Position r/(N + 1),
N = n + 1, r = Rang).

**E2 (sekundär), Pegel Kaub, NM7Q, H bis 2025:**
1. Mann-Kendall-Test mit Hamed-Rao-Varianzkorrektur. Die Korrektur verwendet
   die Autokorrelationen der Ränge der Sen-trendbereinigten Reihe und
   berücksichtigt nur Lags, die zum Niveau 5 % signifikant sind
   (Originalverfahren Hamed & Rao 1998).
2. Sen-Steigung mit 95 %-Konfidenzintervall nach Sen (1968), in m³/s pro
   Dekade und in Prozent des Medians von H pro Dekade.
3. Entscheidung: Ein monotoner Trend gilt als statistisch nachgewiesen, wenn
   der zweiseitige p-Wert < 0,05 ist. Die Richtung ergibt sich aus dem
   Vorzeichen der Sen-Steigung.

**Primär vs. sensitivitätsanalytisch (verbindlich):**
- **Primär:** Pegel Kaub; Kennwert NM7Q; Abflussjahr laut DGJ; Referenzreihe =
  vollständige gültige Reihe bis 2025; E1 mit Log-Normal-t-Prognoseintervall
  (stationär, ohne Trendterm); E2 mit Hamed-Rao-MK und Sen-Steigung ohne 2026.
- **Alle anderen Varianten** in Abschnitt 6 sind sensitivitätsanalytisch. Sie
  ersetzen die Primäranalyse nicht, auch dann nicht, wenn sie „plausibler“
  erscheinen.

### 5.2 Modellannahmen-Prüfung (Diagnostik-Plan)

Alle Diagnostiken werden unabhängig von ihrem Ergebnis berichtet.

- **Normalität (E1):** Shapiro-Wilk-Test auf yᵢ = ln(NM7Qᵢ) in H (α = 0,05)
  sowie QQ-Plot gegen die Normalverteilung.
- **Autokorrelation (E1 und E2):** Autokorrelationsfunktion von yᵢ bis Lag 10
  mit 95 %-Bändern, Lag-1-Autokorrelation r₁ und Ljung-Box-Test bis Lag 5
  (α = 0,05). Bei E2 zusätzlich die Lag-1-Autokorrelation der
  trendbereinigten Reihe. Begründung: Speicher wie Grundwasser, Seen und
  Gletscher können mehrjährige Persistenz erzeugen.
- **Stationarität/Trend (Voraussetzung für die stationäre Verteilung in E1):**
  Das Ergebnis von E2 dient zugleich als Diagnostik für E1.
- **Bruchpunkte:** Pettitt-Test auf NM7Q in H (zweiseitig, α = 0,05) mit
  geschätztem Bruchjahr. Der Pettitt-Test unterscheidet nicht zwischen einem
  graduellen Trend und einem Sprung und wird deshalb nur zusammen mit E2 und
  der Pegelgeschichte (Struktur-Check S3) interpretiert. Ein statistisch
  gefundener Bruchpunkt **ohne** dokumentierte Ursache in der Pegel- oder
  Einzugsgebietsgeschichte wird berichtet, löst aber kein eigenes
  Analysefenster aus (Schutz vor datengetriebener Fensterwahl).
- **Randprüfung der Jahresgrenze:** Für jedes Jahr in H und für 2026 wird
  dokumentiert, ob das NM7Q-Fenster in den ersten oder letzten 7 Tagen des
  Abflussjahres liegt („Randjahr“). Die Anzahl der Randjahre wird berichtet.
  Ist 2026 ein Randjahr, wird S2a/S2b besonders hervorgehoben.
- **Einflussdiagnostik (E1):** Leave-one-out-Neuberechnung der unteren
  PI-Grenze (je ein Jahr aus H entfernt). Das Jahr mit dem größten Einfluss
  wird benannt und nicht entfernt.

### 5.3 Korrektur bei Annahmenverletzung

Die Primärvariante bleibt in jedem Fall bindend. Die Korrekturen sind
zusätzliche, **verpflichtend gleichrangig berichtete** Varianten und kein
Ersatz.

- **Shapiro-Wilk signifikant:** S4 (GEV für Minima, L-Momente) und S5
  (empirische Einordnung) werden im Bericht neben die Primärvariante gestellt.
  Die Primärvariante wird als „Verteilungsannahme verletzt, Ergebnis mit
  Vorsicht“ markiert. S4 und S5 werden ohnehin immer berechnet.
- **Signifikante Autokorrelation (Ljung-Box p < 0,05 oder |r₁| außerhalb des
  95 %-Bandes):** Für E1 wird zusätzlich ein PI mit effektivem
  Stichprobenumfang n_eff = n · (1 − r₁)/(1 + r₁) berechnet (Variante S6b). Für
  t und √(1 + 1/n) wird dann n_eff statt n verwendet, mit Untergrenze n_eff ≥ 10.
  Für E2 ist die Autokorrelationskorrektur bereits in der Primärmethode
  (Hamed-Rao) enthalten.
- **Signifikanter Trend in E2:** Das stationäre PI aus E1 gilt dann als
  potenziell verzerrt. Verpflichtend wird S6a (trendbereinigtes PI, Abschnitt
  6) gleichrangig neben der Primärvariante berichtet. Der Bericht erklärt, dass
  ein stationäres PI bei abwärts gerichtetem Trend die untere Grenze für 2026
  tendenziell zu niedrig ansetzt und bei aufwärts gerichtetem Trend zu hoch.
- **Pettitt-Bruchpunkt mit dokumentierter Ursache (S3):** Das Bruchfenster S3c
  wird aktiviert (Abschnitt 6).

### 5.4 Unsicherheitsquantifizierung

- **Primär E1:** t-basiertes 95 %-Prognoseintervall auf der Log-Skala
  (Abschnitt 2.2). Es berücksichtigt die Parameterunsicherheit von ȳ und s
  über √(1 + 1/n) und die t-Verteilung.
- **Primär E2:** 95 %-Konfidenzintervall der Sen-Steigung nach Sen (1968),
  Hamed-Rao-korrigierter p-Wert.
- **Sensitivitätsanalytisch:** parametrischer Bootstrap (B = 10 000, fester
  Seed, im Skript dokumentiert) für die untere 2,5 %-Prognosegrenze und die
  Jährlichkeit unter GEV-Minima (S4). Blockbootstrap (Blocklänge 5 Jahre,
  B = 10 000) für die Sen-Steigung (S10c).
- **Messunsicherheit 2026:** über die Kipppunktanalyse S7, nicht über eine
  angenommene Fehlerverteilung.
- **Jährlichkeiten** jenseits der Reihenlänge werden immer mit dem Hinweis
  „Extrapolation, hohe Modellabhängigkeit“ berichtet.

### 5.5 Signifikanzniveau

- **E2 (einziger konfirmatorischer Hypothesentest):** α = 0,05, zweiseitig.
- **Diagnostische Tests** (Shapiro-Wilk, Ljung-Box, Pettitt): α = 0,05,
  zweiseitig, als Annahmenprüfung und nicht als inhaltliche Befunde.
- **E1 und D1:** keine Signifikanzsprache. E1 ordnet eine einzelne, wegen
  ihrer Extremität ausgewählte Beobachtung in ein Prognoseintervall ein. Das
  ist kein Test mit kontrollierter Fehlerrate. Die Formulierung „statistisch
  signifikant außergewöhnlich“ wird nicht verwendet (konsistent mit
  `Analysen/2026-08-hitzesommer-2026/`).

## 6. Sensitivitätsanalysen

Alle folgenden Varianten werden vorab festgelegt, vollständig gerechnet und
berichtet, unabhängig davon, ob sie die Primäranalyse bestätigen. Sofern nicht
anders genannt, gelten die Regeln aus Abschnitt 2 bis 5 unverändert.

| ID | Variation | betrifft |
|---|---|---|
| **S1a** | Pegel Lobith (Rijkswaterstaat Waterinfo) | E1, D1, E2 |
| **S1b** | Pegel Köln (DGJ/GRDC) | E1, D1, E2 |
| **S2a** | Kalenderjahr statt Abflussjahr (2026 = 01.01.–31.12.2026; Auswertung erst nach Vorliegen der Daten bis 31.12.2026, als vorab festgelegter Nachtrag; in der Redaktionspipeline als eigenes Update geführt, Abschnitt 13, Entscheidung 10) | E1, D1, E2 |
| **S2b** | Niedrigwasserjahr 01.04.–31.03. (2026 = 01.04.2026–31.03.2027; Nachtrag nach 31.03.2027; in der Redaktionspipeline als eigenes Update geführt, Abschnitt 13, Entscheidung 10) | E1, D1, E2 |
| **S3a** | Teilzeitraum ab Abflussjahr 1978 bis 2025 (erstes volles Jahr nach Inbetriebnahme der letzten Oberrhein-Staustufe Iffezheim 1977; zugleich nach Abschluss der 2. Juragewässerkorrektion; Jahreszahlen im Struktur-Check zu verifizieren, maßgeblich ist die Regel „erstes Abflussjahr nach Inbetriebnahme Iffezheim“; bestätigt durch Daniel Saure am 19.10.2026, Abschnitt 13, Entscheidung 6) | E1, D1, E2 |
| **S3b** | die letzten 30 Abflussjahre (1996–2025) | E1, D1, E2 |
| **S3c** | Bruchfenster: Jahre ab dem ersten Abflussjahr nach einem im Struktur-Check (S3) **dokumentierten** Bruch der Messung oder Abflussermittlung. Wird nur aktiviert, wenn ein solcher Bruch belegt ist. Bei mehreren Brüchen gilt der späteste, sofern danach n ≥ 30 bleibt, sonst der späteste mit n ≥ 30 | E1, D1, E2 |
| **S4** | GEV-Verteilung für Minima (angepasst an −NM7Q mit L-Momenten nach Hosking): untere 2,5 %-Prognosegrenze (parametrischer Bootstrap) und Jährlichkeit von NM7Q₂₀₂₆ | E1 |
| **S5** | empirische Einordnung: Rang und Weibull-Plotting-Position, ohne Verteilungsannahme | E1 |
| **S6a** | trendbereinigtes PI: OLS-Regression ln(NM7Q) ~ Abflussjahr über H, Prognoseintervall für 2026 | E1 |
| **S6b** | PI mit effektivem Stichprobenumfang n_eff (5.3); wird immer berechnet | E1 |
| **S7** | Kipppunktanalyse: relative Änderung von NM7Q₂₀₂₆ (in %, nach oben und unten), bei der die Klassifikation in E1 bzw. die Rekord-Kategorie in D1 wechselt. Zusätzlich illustrativ die Klassifikation bei NM7Q₂₀₂₆ ± 10 % | E1, D1 |
| **S8** | E2 einschließlich Abflussjahr 2026 (vorläufig) | E2 |
| **S9** | Aufnahme der nach Abschnitt 4 ungültigen Jahre | E1, D1, E2 |
| **S10a** | E2 mit klassischem Mann-Kendall-Test ohne Autokorrelationskorrektur | E2 |
| **S10b** | E2 mit Trend-Free-Pre-Whitening (Yue et al. 2002) | E2 |
| **S10c** | E2 mit Blockbootstrap-Mann-Kendall (Blocklänge 5 Jahre) | E2 |
| **S10d** | E2 mit Korrektur für Langzeitpersistenz (Hamed 2008) | E2 |
| **S11a** | Kennwert NQ statt NM7Q | E1, D1, E2 |
| **S11b** | Kennwert NM30Q statt NM7Q | E1, D1, E2 |
| **S12** | Halbjahre getrennt: NM7Q im Winterhalbjahr (Nov–Apr) und im Sommerhalbjahr (Mai–Okt) des Abflussjahres. Begründung: Alpine Speicherbewirtschaftung verlagert Abfluss vom Sommer in den Winter, sodass die Halbjahre unterschiedlich beeinflusst sein können | E1, D1, E2 |

Die Sensitivitätsanalysen werden **nicht kombiniert** (keine Kreuzprodukte wie
„Lobith × Kalenderjahr × NQ“). Bestätigt durch Daniel Saure am 19.10.2026
(Abschnitt 13, Entscheidung 9).

## 7. Umgang mit Mehrfachtestung / Multiplizität

- **Konfirmatorisch** ist genau ein Hypothesentest: E2 (Hamed-Rao-MK, Kaub,
  NM7Q, H bis 2025, α = 0,05). Eine Multiplizitätskorrektur ist deshalb für
  die Primäraussage nicht nötig.
- **E1 und D1** sind Einordnungen ohne Testcharakter (5.5).
- **Alle Sensitivitäts-p-Werte** (S1–S12, über 30 Einzelergebnisse) sind
  explorativ. Sie werden unkorrigiert, aber vollständig und ausdrücklich als
  explorativ berichtet. Ein einzelner signifikanter oder auffälliger Befund
  in einer Sensitivitätsvariante wird nicht als Bestätigung gewertet.
- **Kein Cherry-Picking:** Alle Varianten erscheinen in einer vollständigen
  Anhangstabelle (Abschnitt 11). Die Hauptaussage des Berichts folgt
  ausschließlich der Primärvariante (5.1). Eine nachträgliche Umdeklarierung
  einer Sensitivitätsvariante zur Hauptaussage ist ausgeschlossen. Das gilt
  auch für den Pegel: Kaub bleibt Primärpegel, außer Plan C wird nach der
  verfügbarkeitsbasierten Regel in 3.2 ausgelöst.
- **Konsistenzaussage:** Der Bericht gibt an, in wie vielen der auf E1
  anwendbaren Varianten 2026 als „außerhalb (unterhalb)“ klassifiziert wird
  und in wie vielen D1 „Rekord“ (jeweils als Anzahl von Gesamtzahl). Das ist
  eine Robustheitsbeschreibung und keine Abstimmung, die die Primärvariante
  überstimmt.

## 8. Interpretationsrahmen / Confounder

*Anwendbarkeit der Standardpunkte der Vorlage:* Diese Analyse ist ein
Zeitreihenvergleich an einem Pegel und kein Vergleich von Regionen oder
Ländern. **Produktions- vs. Konsum-Perspektive** und **Transitivität bei
Netzwerkvergleichen** sind nicht anwendbar. Die Punkte **keine implizite
Politikbewertung** (8.3) und **Regression zur Mitte** (8.4) sind anwendbar.

### 8.1 Inhomogenitäten im Einzugsgebiet und in der Messung (Confounder)

Der Abfluss bei Kaub ist kein natürliches, unbeeinflusstes Signal. Folgende
bekannte Einflüsse können die Niedrigwasserabflüsse über die Messreihe hinweg
verändert haben, unabhängig vom Klima. Die Liste ist nach Kenntnisstand
erstellt, ihre Daten und Größenordnungen werden im Struktur-Check verifiziert
und nicht hier festgestellt:

- **Alpine Speicherkraftwerke** (Schweiz, Vorarlberg; Ausbau überwiegend in der
  zweiten Hälfte des 20. Jahrhunderts) speichern Sommerabfluss und geben ihn
  im Winter ab. Das kann Winter-Niedrigwasser anheben und Sommerabflüsse
  senken (deshalb S12).
- **Seeregulierungen in der Schweiz:** Juragewässerkorrektionen (Aare,
  Bielersee, Neuenburger- und Murtensee) und regulierte Abflüsse weiterer
  Alpenrandseen (z. B. Zürichsee, Vierwaldstättersee).
- **Bodensee:** Nach aktuellem Kenntnisstand ist der Bodensee-Abfluss **nicht**
  durch ein Wehr reguliert. Das wird im Struktur-Check verifiziert. Sein
  Zufluss (Alpenrhein) ist durch Speicherbewirtschaftung beeinflusst. Der
  im Auftrag genannte Punkt „Bodensee-Regulierung“ wird daher so behandelt:
  geprüft wird, ob es eine Regulierung gibt, und beeinflusste Zuflüsse
  werden benannt.
- **Oberrhein-Ausbau:** Grand Canal d'Alsace und Staustufen bis Iffezheim
  (1977). Laufwasserkraft verändert Tagesmittel bei Niedrigwasser
  voraussichtlich wenig, kann aber kurzfristige Schwankungen erzeugen. Das
  wird abgefedert, weil der Primärkennwert NM7Q statt NQ ist (Begründung für
  S3a).
- **Talsperren und Überleitungen in Nebenflüssen:** Niedrigwasseraufhöhung
  aus Talsperren (u. a. Main-, Neckar- und Nahe-Einzugsgebiet) sowie die
  Überleitung von Altmühl- und Donauwasser in das Regnitz-/Main-System (Main-
  Donau-Kanal, Brombachsee). Der Main mündet oberhalb von Kaub, die
  Überleitung wirkt also auf Kaub.
- **Wasserentnahmen und -einleitungen** (Kühlwasser, Trinkwasser,
  Bewässerung), deren Umfang sich über die Zeit verändert hat.
- **Messmethodik:** Q wird über Abflusskurven aus W abgeleitet. Abflusskurven
  werden nach Abflussmessungen fortgeschrieben (Methodenwechsel z. B. von
  Flügel- zu ADCP-Messungen). **Sohlerosion, Felsbeseitigung und
  Fahrrinnenvertiefung** verschieben die W-Q-Beziehung. Genau deshalb ist W
  ungeeignet und Q das Primärmaß. Q ist aber nur so homogen wie die Pflege der
  Abflusskurven, und Niedrigwasserabflüsse unterhalb der niedrigsten
  Kalibriermessung beruhen auf **Extrapolation** der Kurve (Struktur-Check S5).

**Vorab festgelegter Umgang:** keine Bereinigung oder Rekonstruktion
„naturnaher“ Abflüsse (das wäre ein eigenes Modellprojekt). Stattdessen gibt es
die Teilzeiträume S3a/S3b/S3c, die Halbjahrestrennung S12 und die Benennung im
Bericht. Ein Trend in E2 kann **ganz oder teilweise** auf diese Einflüsse
zurückgehen. Das wird bei jeder Trendaussage ausdrücklich erwähnt.

### 8.2 Wasserstand versus Abfluss (Interpretationsregel)

Ein Rekord im Wasserstand (Medienangabe) und das Ergebnis in Q (D1) können
auseinanderfallen. Fallen sie auseinander, wird das als **erwartbare Folge der
Inhomogenität des Wasserstands** beschrieben und nicht als Widerlegung oder
Bestätigung der Medienangabe. Die Medienaussage „niedrigster Pegelstand“ und
die Aussage „noch nie so wenig Wasser“ werden im Bericht getrennt bewertet.

### 8.3 Keine implizite Politik- oder Ursachenbewertung

Die Analyse ist rein statistisch-deskriptiv. „Außerhalb der Schwankungsbreite“
bedeutet nur: Der Wert liegt außerhalb dessen, was die historische Reihe unter
dem Modell erwarten lässt. Es bedeutet **nicht** automatisch „Folge des
Klimawandels“, „Folge der Gletscherschmelze“ oder „Folge von Politik oder
Wasserwirtschaft“. „Innerhalb“ bedeutet **nicht** „unproblematisch“ oder
„kein Klimasignal“. Diese Klarstellung erscheint als Standardsatz in jeder
Ergebnisdarstellung.

### 8.4 Selektion und Regression zur Mitte

- **Selektion:** 2026 wird untersucht, *weil* es als Extremjahr gemeldet
  wurde. Eine Einordnung „außerhalb“ ist deshalb keine unabhängige
  Bestätigung. Würde man nach jedem gemeldeten Extrem ein PI berechnen, läge
  ein erheblicher Teil dieser Fälle ohnehin außerhalb. Der Bericht nennt das
  ausdrücklich.
- **Regression zur Mitte:** Folgen auf ein Extremjahr unauffälligere Jahre,
  ist das kein Beleg gegen einen Trend. Ein einzelnes Extremjahr ist
  umgekehrt kein Beleg für einen Trend. Trendaussagen stützen sich nur auf E2.

### 8.5 Vorläufigkeit 2026

Ein Ergebnis für 2026 beruht auf ungeprüften Rohdaten und, je nach Wasserstand,
auf einer extrapolierten Abflusskurve. Die Kipppunktanalyse S7 zeigt, wie
empfindlich die Einordnung auf Revisionen reagiert. Die Einschränkung wird
unabhängig vom Ergebnis immer genannt.

## 9. Limitationen

- **Begrenzte Messreihe:** „Rekord“ und „Schwankungsbreite“ beziehen sich nur
  auf den Zeitraum der Abfluss-Tagesreihe. Historische Niedrigwasser vor
  Messbeginn (z. B. dokumentiert durch „Hungersteine“ oder Chroniken) werden
  nicht erfasst. Die Aussage „noch nie“ ist mit diesen Daten nur für die
  Messreihe prüfbar.
- **Nichtstationarität:** Das primäre PI unterstellt eine zeitlich stabile
  Verteilung. Regulierung (8.1) und ein möglicher Klimatrend verletzen diese
  Annahme womöglich. Abgefangen wird das über die Diagnostik und S3/S6a, aber
  nicht vollständig.
- **Verteilungsannahme:** Log-Normal ist eine Vereinfachung. Werte in den
  Extremen hängen von der Verteilungswahl ab (S4/S5).
- **Messunsicherheit bei Niedrigwasser** ist relativ größer als bei
  Mittelwasser. Das gilt besonders bei Extrapolation der Abflusskurve.
- **Vorläufige Werte 2026** (3.4, 8.5).
- **Pegel sind nicht austauschbar** (verschiedene Einzugsgebiete, 4).
- **Datenlizenz:** GRDC-Rohdaten dürfen nach Kenntnisstand nicht frei
  weitergegeben werden. Weil das Repository öffentlich ist, liegen
  GRDC-Rohdaten (falls benötigt) nur lokal und werden per `.gitignore` vom
  Repository ausgeschlossen. Eingecheckt werden nur ihre SHA-256-Prüfsummen,
  veröffentlicht werden nur abgeleitete Jahreskennwerte (bestätigt durch
  Daniel Saure am 19.10.2026, Abschnitt 13, Entscheidung 7).
- **Ausgelöst durch ein Extremereignis** (8.4).
- **Keine Ursachenanalyse** (Abschnitt 12).

## 10. Software

- R (Version wird im Analyseskript dokumentiert, ≥ 4.x), `sessionInfo()` wird
  mitgespeichert.
- Pakete (voraussichtlich; die endgültige Liste steht im Analyseskript):
  `zoo` (gleitende Mittel), `trend` (Mann-Kendall, Sen-Steigung, Pettitt),
  `modifiedmk` (Hamed-Rao, TFPW, Hamed-2008-LTP), `lmom` (L-Momente, GEV),
  `boot` (Bootstrap), `ggplot2` (Grafiken). Kreuzprüfung der Sen-Steigung mit
  einem zweiten Paket (z. B. `trend` vs. `modifiedmk`).
- Fester Zufalls-Seed für alle Bootstrap-Verfahren, im Skript dokumentiert.
- Skript (vom analyst-Subagenten zu erstellen, nicht Teil dieses SAP):
  `Analysen/2026-10-rhein-niedrigwasser/rhein-niedrigwasser.R`; Ausgaben in
  `Analysen/2026-10-rhein-niedrigwasser/output/`.

## 11. Reporting

- **Tabelle 1 (Primärergebnis):** NM7Q₂₀₂₆ (vorläufig), Datum des
  NM7Q-Fensters, ȳ/s auf Log-Skala, PI₉₅ in m³/s, Klassifikation E1, T₂₀₂₆,
  p_pred, prädiktive Jährlichkeit (Hinweis „modellabhängig“), n, Zeitraum von
  H.
- **Tabelle 2 (D1):** Die zehn niedrigsten NM7Q-Werte der Reihe einschließlich
  2026 mit Abflussjahr und Rang, Rekord-Kategorie, verwendetes δ und dessen
  Herkunft (Quelle oder Vorgabe 5 %).
- **Tabelle 3 (E2):** Sen-Steigung (m³/s und % pro Dekade) mit 95 %-KI,
  Kendalls τ, p-Wert (Hamed-Rao), n, Zeitraum.
- **Tabelle 4 (Diagnostik):** Shapiro-Wilk, r₁, Ljung-Box, Pettitt
  (Bruchjahr, p), Randjahre, Leave-one-out-Spanne der unteren PI-Grenze.
- **Anhangstabelle (vollständig, Abschnitt 7):** alle Varianten S1–S12 mit
  Klassifikation E1, Rang/Kategorie D1 und Sen-Steigung/p E2, sofern
  anwendbar.
- **Tabelle D0:** Verifikation der Medienangaben (Behauptung, Primärquelle,
  Befund „bestätigt / nicht bestätigt / nicht prüfbar“).
- **Grafik 1:** Zeitreihe der jährlichen NM7Q-Werte (Punkte) mit
  PI₉₅-Band, 2026 farblich abgesetzt und als „vorläufig“ beschriftet, mit
  Sen-Trendlinie (E2) als gestrichelte Linie.
- **Grafik 2:** Rangdiagramm bzw. empirische Unterschreitungskurve mit 2026
  markiert.
- **Grafik 3:** Diagnostik (QQ-Plot, ACF).
- **Grafik 4 (deskriptiv):** Tagesganglinie Q im Abflussjahr 2026 vor dem Band
  der historischen Tagesquantile (10 %, 50 %, 90 %) desselben Kalendertags
  über H. Rein deskriptiv, ohne Inferenz.
- **Pflichtangaben in jeder Darstellung mit 2026-Werten:** „vorläufig
  (Rohdaten, ungeprüft)“, Datenquelle, Abrufdatum, verwendeter Datenplan
  (A/B/C), und bei Plan B/C der Hinweis auf den Kennwert- bzw. Pegelwechsel.
- **Pflichtsätze im Text:** 8.2 (W vs. Q), 8.3 (keine Ursachen- oder
  Politikaussage), 8.4 (Selektion), 8.5 (Vorläufigkeit) sowie der Verweis auf
  Abschnitt 12.
- **Sprachregelung:** kein „statistisch signifikant außergewöhnlich“ für E1
  und D1. „Rekord“ immer mit dem Zusatz „seit Beginn der Messreihe [Jahr]“.
- **Rundung:** Abflüsse in ganzen m³/s. Prozentangaben mit einer
  Nachkommastelle. Sen-Steigung in m³/s pro Dekade mit einer Nachkommastelle.
  T, τ und r₁ mit zwei Nachkommastellen. p-Werte mit zwei Nachkommastellen,
  bei p < 0,01 als „p < 0,01“. Jährlichkeiten auf ganze Jahre, über 100 Jahre
  als „> 100 Jahre (Extrapolation)“.

## 12. Was diese Analyse nicht beantwortet

- **Ursachen:** Es gibt keine Aussagen zu Gletscherrückgang, Schneedecke,
  Niederschlagsdefizit, Verdunstung, Grundwasser oder Bodenfeuchte und keine
  Attribution zum Klimawandel. Diese Variablen werden nicht erhoben.
- **Zukunft:** keine Projektionen oder Aussagen über künftige Häufigkeiten.
- **Schifffahrt und Wirtschaft:** keine Aussagen zu Abladetiefen,
  Fahrrinnentiefen, Frachtkosten oder Versorgung. Diese hängen am Wasserstand
  und an der Fahrrinne, nicht nur am Abfluss.
- **Dauer und Ausdehnung des Niedrigwassers:** Unterschreitungsdauern,
  Defizitvolumina und die räumliche Ausdehnung über das Rhein-Einzugsgebiet
  hinaus werden nicht ausgewertet (möglicher eigener Evidenzcheck).
- **Ökologie** (Wassertemperatur, Sauerstoff, Fischbestände): nicht
  Gegenstand.
- **Zeit vor Messbeginn:** nicht erfasst (Abschnitt 9).
- **Bewertung von Wasserwirtschaft oder Politik:** keine.

Wird für eine Veröffentlichung eine dieser Fragen benötigt, ist sie als neue
Evidenzcheck-Idee in den Backlog aufzunehmen und nicht nebenbei zu rechnen.

## 13. Entscheidungen vor dem Einfrieren (beantwortet 19.10.2026)

Die Antworten stammen von Daniel Saure (19.10.2026) und sind im Wortlaut aus
dem Chat übernommen. Die Beantwortung einzelner Fragen ist **keine Freigabe**
des SAP; das Einfrieren erfolgt gesondert (Kopfzeile).

1. **Präregistrierungsstatus**
   - *Frage:* Der Auftrag enthielt Medienangaben zu Wasserständen (−6 cm am
     01.10.2026; Vorrekord 24–25 cm von 2018) sowie den Hinweis auf
     „Rekord-Niedrigabflüsse“ (Copernicus). Der sap-autor wertet das als zu
     prüfende Behauptung und nicht als Analyseergebnis (Abschnitt 0). Teilst
     Du diese Einschätzung, oder soll der SAP als „exploratory
     (retrospektiv)“ geführt werden?
   - *Antwort:* „Teile die Einschätzung“
   - *Konsequenz:* Status bleibt präregistriert; Abschnitt 0 als bestätigt
     gekennzeichnet.
2. **Datensicherung 2026**
   - *Frage:* PEGELONLINE hält nach Kenntnisstand nur etwa 30 Tage Rohdaten
     vor. Soll vor dem Einfrieren eine verblindete Sicherung erlaubt sein
     (Download, nur SHA-256-Prüfsumme und Zeitstempel protokollieren, Dateien
     weder öffnen noch plotten noch auswerten), oder soll stattdessen sofort
     eine Datenanfrage an WSV/BfG gestellt werden?
   - *Antwort:* „verblindete Sicherung“
   - *Konsequenz:* Die Sicherung ist bereits durchgeführt (Abruf 2026-10-19,
     08:16:33 UTC, durch die Top-Level-Session; Kaub, Köln, Emmerich, je Q
     und W; Anfrage ab 2026-08-01; `rohdaten/pegelonline_blind/` mit
     `SICHERUNGSPROTOKOLL.md` und `SHA256SUMS.txt`; Commits 3590de4 und
     d4ed117; Dateien nicht geöffnet). Sie ist die 2026-Quelle für
     PEGELONLINE; Prüfsummen werden vor der Nutzung verifiziert (3.1, 3.1a,
     3.3 S1/S5). Emmerich ist notiert, seine Verwendung nicht festgelegt (in
     v0.3 festgelegt: bleibt ungenutzt; siehe Rückfragen v0.2, Frage 3).
     PEGELONLINE nennt für Kaub km 546,23 (2.1, 3.1a).
3. **Jahresdefinition**
   - *Frage:* Ist das Abflussjahr 01.11.–31.10. (DGJ) als primäre
     Jahresdefinition in Ordnung, mit Kalenderjahr und April–März als
     Sensitivitäten und Nachträgen? Ist Dir eine abweichende aktuelle
     DGJ-Konvention bekannt?
   - *Antwort:* „ja“
   - *Konsequenz:* Abflussjahr 01.11.–31.10. bestätigt; eine abweichende
     DGJ-Konvention ist nicht bekannt (2.1). Die Verifikation am Stammblatt
     im Struktur-Check S2 bleibt bestehen.
4. **Frist F für Plan B/C**
   - *Frage:* Wie lange soll auf Datenanfragen (BfG, WSV, GRDC) gewartet
     werden, bevor der Fallback ausgelöst wird? Vorschlag: 6 Wochen ab
     Einfrieren.
   - *Antwort:* „ok“
   - *Konsequenz:* F = 6 Wochen ab Einfrieren (3.2).
5. **Messunsicherheit δ**
   - *Frage:* Ist δ = 5 % als Vorgabe für die Rekordkategorien akzeptabel,
     falls BfG/WSV keine dokumentierte Unsicherheit für Niedrigwasser
     liefern?
   - *Antwort:* „5% ok“
   - *Konsequenz:* δ = 5 % als Vorgabe, sofern die Primärquelle keine
     Unsicherheit dokumentiert (2.3).
6. **Teilzeitraum S3a**
   - *Frage:* Ist „ab Abflussjahr 1978 (nach Iffezheim)“ als
     Homogenitäts-Teilzeitraum fachlich sinnvoll, oder gibt es eine bessere,
     vorab begründbare Grenze?
   - *Antwort:* „ok“
   - *Konsequenz:* S3a ab Abflussjahr 1978 bestätigt (6).
7. **Datenlizenz und öffentliches Repo**
   - *Frage:* Sollen GRDC-Rohdaten (falls nötig) nur lokal liegen, mit
     Eintrag in `.gitignore` und eingecheckten Prüfsummen, und nur
     abgeleitete Jahreskennwerte veröffentlicht werden?
   - *Antwort:* „ja“
   - *Konsequenz:* So festgelegt (3.1, 9).
8. **Plan C (Pegelwechsel auf Lobith)**
   - *Frage:* Bist Du einverstanden, dass ohne amtliche Q-Werte 2026 für Kaub
     auf Lobith als Primärpegel gewechselt wird, statt eine eigene
     W-Q-Umrechnung vorzunehmen?
   - *Antwort:* „ja“
   - *Konsequenz:* Plan C bestätigt (3.2).
9. **Kombinierte Sensitivitäten**
   - *Frage:* Bestätigst Du, dass keine Kreuzprodukte der
     Sensitivitätsanalysen gerechnet werden (Abschnitt 6)?
   - *Antwort:* „ja“
   - *Konsequenz:* Keine kombinierten Sensitivitäten; Vorbehaltsklausel in
     Abschnitt 6 entfernt.
10. **Nachträge S2a/S2b und geprüfte DGJ-Werte**
    - *Frage:* Sollen diese Nachträge in der Redaktionspipeline als eigene
      Updates geführt werden, oder nur im Analyseordner dokumentiert?
    - *Antwort:* „ersteres“
    - *Konsequenz:* Die Nachträge werden in der Redaktionspipeline als eigene
      Updates geführt (3.4, 6).

### Rückfragen v0.2 (beantwortet 19.10.2026)

Diese drei Rückfragen stellte der sap-autor nach Abschluss von v0.2 im Chat.
Sie standen nicht im Dokumenttext von v0.2 und sind hier **sinngemäß**
wiedergegeben. Daniel Saure hat sie am 19.10.2026 gemeinsam beantwortet. Seine
Antwort lautet im Wortlaut:

> „Ja: 1. zweiter PEGELONLINE-Abruf Anfang November für 19.–31.10.; 2. bei
> Prüfsummenfehler abbrechen und an mich eskalieren; 3. Emmerich bleibt
> ungenutzt.“

Die Beantwortung dieser Rückfragen ist **keine Freigabe** des SAP; das
Einfrieren erfolgt gesondert (Kopfzeile).

1. **Abdeckung 19.10.–31.10.2026**
   - *Frage (sinngemäß):* Die verblindete Sicherung endet am 19.10.2026, das
     Abflussjahr 2026 erst am 31.10.2026, und PEGELONLINE hält nur etwa 30
     Tage vor. Wie sollen die restlichen Tage gesichert werden: durch einen
     zweiten PEGELONLINE-Abruf nach Ende des Abflussjahres oder über eine
     Anfrage bei WSV/BfG (Rang 4)?
   - *Antwort (Wortlaut, Teil 1):* „zweiter PEGELONLINE-Abruf Anfang November
     für 19.–31.10.“
   - *Konsequenz:* Zweiter Abruf Anfang November 2026, erst nach dem Ende des
     Abflussjahres, für Kaub (Q; W nur zur Dokumentation) und Köln (S1b),
     dokumentiert wie die erste Sicherung. Überlappende Zeitpunkte werden
     auf Übereinstimmung geprüft; Abweichungen werden berichtet, die erste
     Sicherung hat Vorrang. Rang 4 bleibt Fallback bei unvollständiger
     Abdeckung (3.1, 3.1a, 3.2 Plan A, 3.3 S1/S5). (In v0.4 präzisiert:
     Anfragezeitraum ab 12.10.2026, spätester Abrufzeitpunkt 14.11.2026,
     Durchführung durch die Top-Level-Session; siehe Rückfragen v0.3,
     Fragen 1 bis 4.)
2. **Fehlschlag der Prüfsummenkontrolle**
   - *Frage (sinngemäß):* Was geschieht, wenn die Prüfsummenkontrolle gegen
     `SHA256SUMS.txt` vor dem Öffnen einer Datei fehlschlägt?
   - *Antwort (Wortlaut, Teil 2):* „bei Prüfsummenfehler abbrechen und an
     mich eskalieren“
   - *Konsequenz:* Abbruch der Analyse und Eskalation an Daniel Saure; kein
     automatischer Ausweichpfad (kein Wechsel auf Rang 4, kein erneuter
     Abruf, kein Wechsel auf Plan B/C/D). Gilt für beide
     PEGELONLINE-Abrufe (3.1a, 3.3 S1). (In v0.4 präzisiert: Geprüft wird
     vor jeder Nutzung die gesamte Dateisammlung des jeweiligen Abrufs;
     siehe Rückfragen v0.3, Frage 5.)
3. **Verwendung der Emmerich-Sicherung**
   - *Frage (sinngemäß):* Die Emmerich-Daten sind gesichert, ihre Verwendung
     ist im SAP aber nicht festgelegt. Sollen sie genutzt werden (etwa als
     Ersatz für Lobith oder als zusätzliche Sensitivität), oder bleiben sie
     ungenutzt?
   - *Antwort (Wortlaut, Teil 3):* „Emmerich bleibt ungenutzt“
   - *Konsequenz:* Die Emmerich-Sicherung bleibt ungenutzt; sie ist weder
     Ersatz für Lobith noch Sensitivitätsanalyse. Emmerich wird beim zweiten
     Abruf nicht abgerufen (3.1a).

### Rückfragen v0.3 (beantwortet 19.10.2026)

Diese sechs Rückfragen stellte der sap-autor nach Abschluss von v0.3 im Chat,
jeweils mit einem Vorschlag. Sie standen nicht im Dokumenttext von v0.3 und
sind hier **sinngemäß** wiedergegeben. Daniel Saure hat sie am 19.10.2026
gemeinsam beantwortet. Seine Antwort lautet im Wortlaut:

> „Ja, alle sechs Vorschläge übernehmen und den Kasusfehler korrigieren.“

Der Kasusfehler betraf die Konsequenz zu Rückfragen v0.2, Frage 2 („keinen
erneuten Abruf, keinen Wechsel …“); er ist in v0.4 zu „kein erneuter Abruf,
kein Wechsel …“ korrigiert. Die Beantwortung dieser Rückfragen ist **keine
Freigabe** des SAP; das Einfrieren erfolgt gesondert (Kopfzeile).

1. **Köln beim zweiten Abruf**
   - *Frage (sinngemäß):* Wird Köln beim zweiten Abruf wie Kaub behandelt?
     Vorschlag: Q wird ausgewertet, W nur zur Dokumentation.
   - *Antwort:* Vorschlag übernommen (Wortlaut oben).
   - *Konsequenz:* Köln: Q wird ausgewertet, W nur zur Dokumentation, wie bei
     Kaub (3.1a).
2. **Durchführung des zweiten Abrufs**
   - *Frage (sinngemäß):* Wer führt den zweiten Abruf durch? Vorschlag: die
     Top-Level-Session, wie beim ersten Abruf, mit Vermerk im Protokoll.
   - *Antwort:* Vorschlag übernommen (Wortlaut oben).
   - *Konsequenz:* Durchführung durch die Top-Level-Session; die
     durchführende Stelle wird im `SICHERUNGSPROTOKOLL.md` des zweiten Abrufs
     vermerkt (3.1a, 3.3 S5).
3. **Überlappung der beiden Abrufe**
   - *Frage (sinngemäß):* Ab welchem Datum fragt der zweite Abruf ab, damit
     die Überlappungsprüfung tatsächlich Daten hat? Vorschlag: ab 12.10.2026
     statt ab 19.10.2026, also etwa 7 Tage Überlappung; Vorrangregel (erste
     Sicherung hat Vorrang) bleibt.
   - *Antwort:* Vorschlag übernommen (Wortlaut oben).
   - *Konsequenz:* Anfragezeitraum 12.10.2026 bis einschließlich 31.10.2026;
     Überlappung von etwa 7 Tagen; Vorrangregel unverändert (3.1, 3.1a, 3.3
     S5).
4. **Spätester Abrufzeitpunkt**
   - *Frage (sinngemäß):* Bis wann muss der zweite Abruf spätestens erfolgen?
     Vorschlag: 14.11.2026, als Puffer zum nicht exakt bekannten
     PEGELONLINE-Fenster; ohne Abruf bis dahin greift Rang 4 für die
     fehlenden Tage.
   - *Antwort:* Vorschlag übernommen (Wortlaut oben).
   - *Konsequenz:* Spätester Abrufzeitpunkt 14.11.2026; erfolgt bis dahin
     kein Abruf, greift Rang 4 (WSV/BfG-Anfrage) für die fehlenden Tage (3.1,
     3.1a, 3.3 S5).
5. **Umfang der Prüfsummenkontrolle**
   - *Frage (sinngemäß):* Wird nur die jeweils zu öffnende Datei geprüft oder
     die gesamte Dateisammlung eines Abrufs? Vorschlag: vor jeder Nutzung die
     gesamte Dateisammlung des jeweiligen Abrufs gegen dessen
     `SHA256SUMS.txt`; Fehlschlag führt wie bisher zu Abbruch und Eskalation
     an Daniel Saure.
   - *Antwort:* Vorschlag übernommen (Wortlaut oben).
   - *Konsequenz:* Prüfung der gesamten Dateisammlung je Abruf vor jeder
     Nutzung; Abbruch und Eskalation bei Fehlschlag unverändert (3.1a, 3.3
     S1).
6. **Tagesmittel aus PEGELONLINE-Rohdaten**
   - *Frage (sinngemäß):* Wie werden aus den 15-Minuten-Rohwerten von
     PEGELONLINE Tagesmittel gebildet? Vorschlag: arithmetisches Mittel aller
     Werte von 00:00 bis 24:00 MEZ (UTC+1, ganzjährig ohne Sommerzeit),
     angelehnt an die DGJ-Konvention; Tag gültig bei mindestens 90 % der
     erwarteten Werte (mindestens 87 von 96), sonst fehlend; Prüfung der
     DGJ-Tagesgrenze im Struktur-Check, bei Abweichung gilt die
     DGJ-Konvention als dokumentierte Abweichung.
   - *Antwort:* Vorschlag übernommen (Wortlaut oben).
   - *Konsequenz:* Neuer Unterabschnitt 3.1b; Verweise in 2.1 (Q(t)), 3.3
     (S2, S5) und 4 (fehlende Werte). (In v0.5 präzisiert: Tagesgrenze als
     halboffenes Intervall [00:00, 24:00) MEZ; siehe Rückfrage v0.4.)

### Rückfrage v0.4 (beantwortet 19.10.2026)

Diese Rückfrage wurde nach Abschluss von v0.4 vom sap-autor-Subagenten in
seinem Abschlussbericht gestellt und von der Top-Level-Session an Daniel
Saure weitergegeben. Sie stand nicht im
Dokumenttext von v0.4 und ist hier **sinngemäß** wiedergegeben. Die
Beantwortung ist **keine Freigabe** des SAP; das Einfrieren erfolgt gesondert
(Kopfzeile).

1. **Zuordnung des Mitternachtswerts**
   - *Frage (sinngemäß):* Die Tagesgrenze „00:00 bis 24:00 MEZ“ in 3.1b lässt
     offen, zu welchem Tag ein Rohwert mit Zeitstempel genau 00:00 MEZ
     gehört: zum beginnenden oder zum endenden Tag. Welche Zuordnung gilt?
   - *Antwort (Daniel Saure, 19.10.2026, Wortlaut):* „Mitternacht: Wert 00:00
     gehört zum beginnenden Tag (00:00–23:45 MEZ).“
   - *Konsequenz:* Ein Tag umfasst die Rohwerte mit Zeitstempel im
     halboffenen Intervall [00:00, 24:00) MEZ, also 00:00 bis 23:45 MEZ bei
     15-Minuten-Raster mit 96 erwarteten Werten; der Wert mit Zeitstempel
     00:00 MEZ gehört zum beginnenden Tag. Zeitstempel in anderen Zeitzonen
     (z. B. MESZ oder UTC aus der API) werden vor der Tageszuordnung nach MEZ
     (UTC+1) umgerechnet (3.1b). Gültigkeitsregel (mindestens 87 von 96
     Werten) und Vorrang der DGJ-Konvention bei Abweichung (Struktur-Check
     S2) bleiben unverändert.
