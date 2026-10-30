**ENTWURF – Gliederung, nicht veröffentlicht. Abstimmung mit Daniel Saure erforderlich.**

# Gliederung: Evidenzcheck Expertenrat-Budgetabgleich 2030

Stufe: Evidenzcheck. Grundlage: `Analysen/2026-08-expertenrat-budgetabgleich/Analysebericht_expertenrat-budgetabgleich.md` (Fassung 5/5a), Validierungsbericht bis Nachtrag 4. Alle Zahlen beim Schreiben gegen `output/estimand1_tabelle.csv` und `output/estimand2_tabelle.csv` abgleichen.

**Titel (Vorschlag):** Klimabudget bis 2030: Wie groß ist die Lücke – und wie sicher kann man das sagen?

**Kernaussage:** Der Expertenrat schätzt, dass Deutschland sein Emissionsbudget für 2021 bis 2030 um etwa 60 bis 100 Millionen Tonnen überschreiten wird. Mit einfachen Trendfortschreibungen lässt sich das weder bestätigen noch widerlegen: Je nach Zeitfenster und Methode reicht unsere Spanne von +25 bis +584 Millionen Tonnen, und fast alle Unsicherheitsbereiche schließen den Korridor des Expertenrats ein.

## 1. Kurz gesagt
Drei Sätze: Budget 6199 Mt (2021–2030); Expertenrat 60–100 Mt drüber, Bundesregierung 4,5 Mt drunter; unsere Trendrechnung kann zwischen diesen Einschätzungen nicht entscheiden.

## 2. Worum es geht
- Was das Budget ist (Summe der Jahresmengen 2021–2030 nach KSG Anlage 2), warum die Summe zählt: Querverweis auf die Einordnung vom 28.10. (§ 8: Nachsteuern hängt an der Summe), ohne Wiederholung.
- Zwei offizielle Einschätzungen: Projektionsdaten 2026 (Puffer 4,5 Mt, über den Prüfbericht des Expertenrats) und Expertenrat (Mai 2026, „50/50-Pfad“ 60–100 Mt über dem Budget).
- Unsere Frage: Was sagt ein reiner Blick auf den bisherigen Trend dazu?

## 3. Was wir gemacht haben
- Analyseplan schriftlich festgelegt und am 29.08.2026 eingefroren, bevor wir die Daten zum Halbjahr 2026 und zum Expertenrat ausgewertet haben; gerechnet am 23.10.2026.
- Ehrlich dazu: Die Trendmodelle stammen aus unserer Analyse vom 27.08.; diese war explorativ (Link auf den korrigierten Artikel). Der Plan enthielt widersprüchliche Statusangaben; ein Erratum hat das vor der Auswertung geklärt.
- UBA-Emissionen 1990–2025; drei Zeitfenster (Langfrist 1990–2025, 10 Jahre 2015–2025, kurz 2020–2025 nur beschreibend); je drei Rechenwege.
- Unabhängige Prüfung durch einen zweiten Prüfschritt (validator), der einen Rechenfehler fand (ARIMA-Intervalle); behoben, alles danach erneut geprüft. Prüfbericht öffentlich im Repo.

## 4. Das Ergebnis: eine Spanne, keine Zahl
- Kleine Tabelle Fenster A/B: Punktwert Überschreitung und Bereich (aus Tabelle 2.2 des Berichts), Fenster C getrennt als beschreibend.
- Grafik `output/estimand2_overshoot.png`.
- Kernsatz: Kein Punktwert liegt im Korridor 60–100; 8 von 9 Bereichen schließen ihn ein, 4 von 6 (A/B) schließen zugleich die Null ein.

## 5. Warum die Spanne so breit ist
- Langfrist-Trend: Modell startet 2026 rund 41 Mt über dem tatsächlichen Wert 2025 → großer Teil der +584 ist ein Modellartefakt, keine Tempo-Aussage.
- Bereiche hängen an Rechenweg und Annahmen; zwei Arten von Bereichen (Unsicherheit des Trends vs. Unsicherheit der tatsächlichen Summe) – kurz erklärt, nicht vertieft.

## 6. Das erste Halbjahr 2026 als Vergleich
- −2,1 % gegenüber H1 2025 (Agora, vorläufig) liegt näher am Langfrist-Tempo (−1,5 % pro Jahr) als am 10-Jahres-Tempo (−3,6 %). Ein einzelner, vorläufiger Wert, kein Test, sagt nichts über das Budget.

## 7. Was das heißt – und was nicht
- Heißt: Wer eine einzelne Zahl für die Lücke nennt, sollte dazusagen, wie unsicher sie ist. Trendrechnungen allein können zwischen „knapp drunter“ und „deutlich drüber“ nicht entscheiden; die Einschätzungen von UBA und Expertenrat beruhen auf mehr Information (Maßnahmen, Sektoren).
- Heißt nicht: dass der Expertenrat oder die Bundesregierung falsch liegt; keine eigene Prognose; keine Ursachen.
- Für Politik/Medien (Leitlinie Nutzen): Die Lücke ist klein im Verhältnis zur Unsicherheit – das Budget ist eng, die Richtung offen.

## 8. Grenzen
Lineare Trends, Autokorrelation im Langfrist-Fenster, kurze Fenster, vorläufige Agora-Daten, Projektionsdaten nur über den Expertenrat-Bericht, FAZ-Quelle nicht abrufbar.

## 9. Quellen und Material
Expertenrat-Prüfbericht 2026, UBA/klimadashboard, KSG Anlage 2, Agora PM 28.08.2026; Links ins öffentliche Repo (Bericht, Skript, SAP, Erratum, Validierungsbericht); Schlusszeile Klima Kompass.

**Nicht in den Text:** Anhang A (Rechnung mit 625, Vermerk Daniel 23.10.); Post-hoc-Intervalle aus Abschnitt 2.4 nur, falls nötig und gekennzeichnet; die 625-Frage nur als Verweis auf die Einordnung vom 28.10.

**Achtung Zahlenabgleich mit 28.10.:** Die Einordnung vom 28.10. nennt laut UBA-Hintergrundpapier (14.03.2026) einen Puffer von 3,8 Mt; die Analyse nutzt 4,5 Mt aus dem Expertenrat-Prüfbericht (der sich auf eine UBA-Datentabelle Stand 07.05.2026 bezieht). Im Text beide Zahlen mit Quelle nennen oder erklären, warum sie sich unterscheiden – nur, was die Quellen sagen; Ursache nicht vermuten.

**Voraussetzung:** Korrekturhinweis zum Artikel vom 27.08. ist live, bevor dieser Text erscheint (er verlinkt darauf).
