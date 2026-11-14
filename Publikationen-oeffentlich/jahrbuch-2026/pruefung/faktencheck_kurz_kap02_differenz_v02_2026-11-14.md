# Differenzprüfung (Stilpass) Jahrbuch-Kurzfassung Kapitel 2 – v0.1 gegen v0.2

Datum der Prüfung: 14.11.2026
Geprüfte Datei (v0.2): `Publikationen-oeffentlich/jahrbuch-2026/kurz/01-kosten.md`
Geändert wurde nichts an der Kapitel-Datei.

## Grundlage und Einschränkung (Diff-Vollständigkeit)

- Kein Shell-Zugriff, daher `git show ffcce41~1:...` NICHT ausgeführt. Die Vollständigkeit der Diff-Datei ist **nicht gegen Git bestätigt**.
- Ersatzweise verglichen: (a) die Wortdiff-Datei `pruefung/diff_kap02_v02_2026-11-14.diff.txt`, (b) die temporäre v0.1-Kopie `C:\Users\dsaur\AppData\Local\Temp\kap2_v01.md` (Herkunft ebenfalls nicht gegen Git bestätigt) Zeile für Zeile gegen die aktuelle Datei.
- Ergebnis des Textvergleichs: Beide Quellen stimmen überein. Abweichungen zwischen v0.1-Kopie und v0.2 gibt es ausschließlich in Zeile 1 (Kopfvermerk), 22, 32 und 34 – genau den im Diff genannten Stellen. Alle übrigen Zeilen (Zahlen, Daten, Tabelle, Quellenliste [1]–[14], Platzhalter „[Stand zum Redaktionsschluss aktualisieren]“) sind wortgleich.
- Empfehlung: Git-Gegenprüfung (`git diff ffcce41~1 ffcce41 -- Publikationen-oeffentlich/jahrbuch-2026/kurz/01-kosten.md`) durch Daniel oder Hauptsession nachholen.

## Tabelle der geänderten Stellen

| Nr. | Stelle | v0.1 | v0.2 | Inhalt unverändert? | Fachlich zutreffend? | Ergebnis |
|---|---|---|---|---|---|---|
| 1 | Kopfvermerk | „v0.1 (28.10.2026)“ | „v0.2 (14.11.2026, Stilpass: Fachwörter in Halbsätzen erklärt; v0.1 vom 28.10.2026)“ | Ja, Rest des Vermerks wortgleich (Status „nicht geprüft, nicht freigegeben“, Offen-Liste, Stand 26.10., Freigabe steht aus) | n. a. | bestätigt (Hinweis H1) |
| 2 | Elastizität (Z. 22) | „Elastizität aus der Literatur“ | „eines Literaturwerts dafür, wie stark der Verbrauch auf den Preis reagiert (Elastizität)“ | Ja. Es bleibt eine Modellrechnung auf Basis eines Literaturwerts; Verweis auf Korrektur und Kapitel 10 unverändert | Ja. Elastizität = prozentuale Verbrauchsänderung je Prozent Preisänderung | bestätigt |
| 3 | Metaanalyse (Z. 32) | „Metaanalyse zur Preiselastizität der Benzinnachfrage findet nach Korrektur für Publikationsbias einen kurzfristigen Wert von −0,09“ | „Metaanalyse, also die Auswertung vieler Studien, misst, wie stark die Benzinnachfrage auf den Preis reagiert (Preiselastizität). Sie findet nach Korrektur für Publikationsbias, also dafür, dass Studien mit auffälligen Ergebnissen eher veröffentlicht werden, einen kurzfristigen Wert von −0,09.“ | Ja. −0,09 kurzfristig, −0,31 langfristig, „knapp ein Prozent“ bei zehn Prozent, Quellenverweis [1] unverändert | Im Kern ja. Metaanalyse = statistische Zusammenfassung vieler Einzelstudien; Publikationsbias = Verzerrung, weil Ergebnisse mit bestimmten Eigenschaften eher veröffentlicht werden. Siehe G2, G4 | Abweichung gering (G2, G4) |
| 4 | „der korrigierte Wert“ (Z. 32) | „wie der um Publikationsbias korrigierte [Wert]“ | „wie der korrigierte Wert“ | Zahl und Logik (Obergrenze = doppelter Wert) unverändert | Ja, sinngemäß; Bezug aber weniger eindeutig, siehe G1 | Abweichung gering (G1) |
| 5 | Emissionsfaktor (Z. 34) | „Der Emissionsfaktor ist die empfindlichste Stellschraube, der Mehrverbrauch die unsicherste Größe.“ | „Am stärksten schlägt der Emissionsfaktor (wie viel CO₂ ein Liter freisetzt) auf das Ergebnis durch, am unsichersten ist der Mehrverbrauch.“ | Ja. Beide Rangaussagen (empfindlichste Stellschraube / unsicherste Größe) erhalten, kein Vorbehalt verschoben | Ja. Emissionsfaktor = CO₂-Menge je Mengeneinheit Kraftstoff, hier je Liter (vgl. 2,28–2,37 kg je Liter in Z. 24) | bestätigt; Hinweis G3 zur Platzierung |
| 6 | Präregistrierung (Z. 34) | „Die Analyse ist nicht präregistriert.“ | „Die Analyse ist nicht vorab festgelegt (nicht präregistriert).“ | Ja. Entspricht der Formulierung in Z. 22 („ohne vorab festgelegten Analyseplan“) und Quelle [1] („keine präregistrierte Analyse“) | Ja | bestätigt |

## Gegenprobe: nichts verschoben

| Prüfpunkt | Ergebnis |
|---|---|
| Zahlen (91–95 %, 82–85 %, 0,18–0,37 Mio. t, 62 und 42 Mrd. Liter, 4.300–8.700 €, 1,6 Mrd. €, −0,09, −0,31, 16,7 Cent, 14,04 Cent, 12 von 16,7 Cent, 72 %, IWH-Tabelle, KfW-Werte) | bestätigt, wortgleich |
| Daten (18.09., 17.10., 22.10., 25.09., 15.10., 12.10., 01.07.) | bestätigt, wortgleich |
| Vorbehalte (Elastizität aus Benzin-Studie, nicht präregistriert, Skript nicht veröffentlicht, Kosten des Staates statt volkswirtschaftliche Kosten, „Ein neues Skript ist dafür nicht gelaufen“) | bestätigt, vorhanden und unverändert |
| Neue Berechnung oder Inferenz in den Ergänzungen | Keine. Die Einschübe sind reine Begriffserklärungen |
| Quellenverweise [1]–[14] und Platzhalter in eckigen Klammern | unverändert; Platzhalter bleibt bewusst offen |

## Befunde

| ID | Schweregrad | Befund | Empfehlung |
|---|---|---|---|
| G1 | gering | „korrigierte Wert“ (Z. 32) ist jetzt zweideutig. Der Kontext nennt „Korrektur für Publikationsbias“ zwei Sätze früher, zwei Sätze später aber „Die korrigierten Werte entstanden, indem wir die Absatzbasis … umgestellt haben“ (andere Korrektur, die vom 17.10.). Leser können beides verwechseln. Der Zusatz „um Publikationsbias“ fiel im Stilpass weg. | „um Publikationsbias korrigierte Wert“ wiederherstellen oder „bereinigter Wert“ verwenden |
| G2 | gering | „Metaanalyse … misst, wie stark die Benzinnachfrage … reagiert“: Eine Metaanalyse misst nicht selbst, sondern wertet Studien aus und fasst Schätzwerte zusammen. Dies widerspricht der eingefügten Definition („Auswertung vieler Studien“) leicht. | z. B. „zeigt, wie stark …“ oder „fasst zusammen, wie stark …“ |
| G3 | gering | „Emissionsfaktor“ wird erstmals in Z. 18 verwendet („Emissionsfaktor mal Preis mal Mehrwertsteuer“), die Erklärung steht erst in Z. 34. | Erklärung bei Erstnennung (Z. 18) oder Hinweis auf Z. 24 prüfen; reine Verständlichkeitsfrage |
| G4 | gering | „Studien mit auffälligen Ergebnissen“ ist als Erklärung von Publikationsbias etwas vage (üblich: statistisch signifikante oder erwartungskonforme Ergebnisse; in diesem Fall: zu hohe Elastizitätsschätzungen, daher „doppelt so groß“). Nicht falsch, aber unscharf. Zudem holpriger Satzbau („Korrektur für Publikationsbias, also dafür, dass …“). | optional: „Studien mit erwartbaren oder deutlichen Ergebnissen“ |

## Hinweise (nicht gezählt, nicht Teil der Änderung)

- H1: Der Kopfvermerk nennt nur die Differenzprüfung vom 09.11.2026. Diese Prüfung (v0.2, 14.11.2026) ist dort noch nicht vermerkt. Das ist Sache der Hauptsession; ich habe nichts geschrieben.
- H2: Vorbestehend und nicht durch v0.2 verursacht: Der Vermerk spricht von „Kapitel 3 der Langfassung“ und verweist auf `faktencheck_kurz_kap01.md`, die Datei heißt `01-kosten.md` / Kapitel 2. Bitte bei Gelegenheit klären.
- H3: Die inhaltliche Prüfung der Zahlen gegen Originalquellen war nicht Auftrag dieser Differenzprüfung. Offene Punkte aus dem Kopfvermerk (IWH-Tabelle, KfW-Papier 2025, Bundesrats-Beschluss, Bundesrats-Stand) bleiben unberührt. Die Definitionen sind Allgemeinwissen der Statistik/Ökonomie; die Zuordnung −0,09/−0,31 und „etwa doppelt so groß“ zu Havránek et al. (2012) wurde hier nicht erneut am Original geprüft (unverändert gegenüber v0.1).
- Es wurde kein Freigabevermerk geschrieben.

## Zählung

| Schweregrad | Anzahl |
|---|---|
| kritisch | 0 |
| hoch | 0 |
| mittel | 0 |
| gering | 4 (G1–G4) |

## Gesamturteil

**ok mit geringen Hinweisen** (0 kritisch, 0 hoch, 0 mittel, 4 gering). Der Stilpass hat keine Aussage, Zahl, kein Datum und keinen Vorbehalt verschoben; die neuen Erklärungen sind im Kern fachlich zutreffend und enthalten keine neue Berechnung oder Inferenz. Einschränkung: Die Diff-Vollständigkeit ist nicht gegen Git bestätigt (siehe oben); sie wurde nur über den Zeilenvergleich mit der temporären v0.1-Kopie gestützt.
