# Kapitel 4 – Schafft Deutschland sein Klimaziel?
**ENTWURF v0.1 (24.10.2026) – nicht geprüft, nicht freigegeben. Stand der Ergebnisse: (1) THG-Trend 2040: veröffentlicht (27.08.2026); die dort genannten Bereiche „407–598“ und „16–328“ weichen von der Rechnung ab, siehe Kapitel 8, Fall 6; hier stehen die Intervalle aus der Rechnung. (2) Expertenrat-Budgetabgleich: Analysebericht Fassung 4, Validierung Nachtrag 1 und 2 vorhanden, Nachtrag 3 (Fassung 4) bei Abfassung noch offen, **Ergebnisse nicht von Daniel Saure freigegeben, nicht veröffentlicht**. Der Abschnitt darf erst bleiben, wenn Freigabe und Validierungsbericht ohne „kritisch“ vorliegen (Deadline 13.11.2026), sonst Plan B (nur ankündigen). (3) Prognose-Check: nur Stand und Methode, kein Ergebnis. Vor Satz/Export: diese Kopfzeile, die Herkunftstabelle und die Hinweise unter den Grafiken entfernen.**

**Kurz gesagt:** Deutschland hat sich gesetzlich verpflichtet, die Treibhausgasemissionen bis 2040 um 88 Prozent gegenüber 1990 zu senken, das sind 150 Millionen Tonnen CO₂-Äquivalent. Ob das Tempo dafür reicht, hängt davon ab, welche Jahre man betrachtet: Schreibt man den Trend seit 1990 fort, wird das Ziel klar verfehlt. Schreibt man nur die letzten zehn Jahre fort, liegt das Ziel noch im Unsicherheitsbereich. Beides ist keine Prognose. Ob Deutschland sein Budget bis 2030 einhält, kann unsere Rechnung nicht entscheiden.

## Wo wir stehen

Die deutschen Treibhausgasemissionen lagen 2025 laut Umweltbundesamt (UBA) bei rund 649 Millionen Tonnen CO₂-Äquivalent. Das sind rund 48 Prozent weniger als 1990 [1][2]. Klimadashboards zeigen meist zwei Zahlen nebeneinander: den bisherigen Rückgang und das Ziel. Was dazwischen fehlt, ist die Frage, ob das bisherige Tempo für das Ziel reicht.

## Zwei Zeitfenster, zwei Antworten

Das haben wir im Evidenzcheck vom 27. August nachgerechnet [1]. Wir schreiben den Trend der Emissionen linear fort, bis 2040. Dabei kommt es auf das Zeitfenster an:

- **Langfrist-Trend 1990 bis 2025:** Die Fortschreibung ergibt für 2040 etwa 486 Millionen Tonnen. Das 95-Prozent-Prognoseintervall (das ist der Bereich, in dem der Wert bei diesem Modell mit 95 Prozent Wahrscheinlichkeit läge) reicht von rund 407 bis 566 Millionen Tonnen. Das Ziel von 150 liegt weit außerhalb.
- **10-Jahres-Trend 2015 bis 2025:** Die Fortschreibung ergibt etwa 207 Millionen Tonnen, das Intervall reicht von rund 86 bis 328. Das Ziel liegt im Intervall, aber nicht in der Mitte.

Als Kontrollrechnung haben wir ein zweites Verfahren benutzt, ein ARIMA-Modell (es berücksichtigt, dass aufeinanderfolgende Jahre nicht unabhängig voneinander sind). Es kommt auf 390 Millionen Tonnen (Intervall 182 bis 598) beim Langfrist-Trend und auf 274 Millionen Tonnen (Intervall 16 bis 532) beim 10-Jahres-Trend. An der Aussage ändert das nichts: Beim Langfrist-Trend liegt das Ziel außerhalb aller Intervalle, beim 10-Jahres-Trend innerhalb.

![Fortschreibung der Emissionen bis 2040 nach Zeitfenster und Verfahren](../grafiken/kap04_grafik1_trend2040.png)

*Grafik 1: Fortschreibung der deutschen Treibhausgasemissionen bis 2040. Quelle: Umweltbundesamt via klimadashboard.de (CC BY 4.0), Auswertung Klima Kompass, Evidenzcheck vom 27.08.2026 [1], Zahlen aus dem Rechenlauf `Analysen/2026-08-emissionen/`. Dargestellt sind vorhandene Zahlen, keine neue Rechnung.*

Die eigentliche Erkenntnis ist methodisch: Welches Zeitfenster man wählt, entscheidet über die Schlagzeile. Wer nur den 10-Jahres-Trend zeigt, kann „Deutschland auf Kurs“ titeln. Wer nur den langen Trend zeigt, schreibt „Deutschland verfehlt sein Ziel deutlich“. Beides wäre mit denselben öffentlichen Daten technisch korrekt, und beides wäre irreführend, wenn man das jeweils andere Fenster verschweigt [1].

## Was die Rechnung nicht ist

- **Keine Prognose.** Wir sagen nicht, welchen Wert Deutschland 2040 erreichen wird. Wir zeigen, ob die bisherigen Trends, einfach fortgeschrieben, mit dem Ziel zusammenpassen.
- **Keine Annahmen über Politik.** Neue Gesetze, Konjunktur, Energiepreise und andere Brüche im Verlauf sind nicht eingerechnet. Sie können das Bild in beide Richtungen verschieben.
- **Keine Bewertung.** Die Rechnung sagt nicht, was die Politik tun sollte.

## Wie weit sind wir bis 2030? Der Expertenrat-Budgetabgleich

[VORLÄUFIG: Dieser Abschnitt beruht auf einem Analysebericht, den Daniel Saure noch nicht freigegeben hat. Er bleibt nur im Buch, wenn Freigabe und Validierung bis zum 13.11.2026 vorliegen.]

Neben dem Ziel für 2040 gibt es ein Budget für die Jahre 2021 bis 2030: Das Klimaschutzgesetz erlaubt in dieser Zeit insgesamt 6.199 Millionen Tonnen CO₂-Äquivalent (ohne Landnutzung). Der Expertenrat für Klimafragen hat im Mai 2026 die Daten der Bundesregierung geprüft. Nach den Projektionsdaten bleibt Deutschland knapp unter dem Budget, mit einem Puffer von 4,5 Millionen Tonnen (0,07 Prozent). Der Expertenrat weist aber darauf hin, dass ein „50/50-Pfad“, bei dem Überschreiten und Unterschreiten gleich wahrscheinlich sind, etwa 60 bis 100 Millionen Tonnen über dem Budget läge [3].

Wir haben gefragt: Was sagt eine eigene, einfache Trendfortschreibung dazu? Dafür haben wir vorab einen Analyseplan festgelegt und eingefroren und beide Zeitfenster von oben benutzt [4].

**Das Ergebnis in drei Sätzen:**

1. **Die Halbjahresdaten 2026 liegen näher am langen Trend.** Agora Energiewende schätzt die Emissionen im ersten Halbjahr 2026 auf 327 Millionen Tonnen, rund 2,1 Prozent weniger als im ersten Halbjahr 2025. Das ist näher an der mittleren Jahresrate des Langfrist-Trends (minus 1,5 Prozent) als an der des 10-Jahres-Trends (minus 3,6 Prozent). Das ist ein Wert aus einer vorläufigen Schätzung und eine einzelne Beobachtung, kein Test [4].
2. **Unsere Fortschreibung ergibt keine eindeutige Antwort auf die Frage des Expertenrats.** Je nach Zeitfenster und Methode liegt die geschätzte Überschreitung des Budgets zwischen plus 25 und plus 584 Millionen Tonnen. Kein Punktwert liegt im Korridor von 60 bis 100. Aber die meisten Intervalle (8 von 9 über alle Fenster) überdecken den Korridor, und vier der sechs Intervalle der beiden Hauptfenster überdecken zugleich den Korridor und die Null, also ein eingehaltenes Budget [4].
3. **Der Wert für den Langfrist-Trend ist mit Vorsicht zu lesen.** Das Modell beginnt 2026 bei rund 690 Millionen Tonnen, etwa 41 über dem tatsächlichen Wert von 2025 (648,8). Ein großer Teil der hohen Überschreitung geht auf diesen Sprung zurück und sagt wenig über das Tempo [4].

![Budgetüberschreitung 2021 bis 2030 nach Zeitfenster und Methode](../grafiken/kap04_grafik2_budget_overshoot.png)

*Grafik 2: Geschätzte Überschreitung des Budgets 2021 bis 2030 (Punktwert und 95-Prozent-Intervall) für den Langfrist-Trend (A) und den 10-Jahres-Trend (B) mit je drei Verfahren. Blaue Intervalle beschreiben die Unsicherheit des Trends, graue (ARIMA) zusätzlich die Streuung der künftigen Jahre. Quelle: Klima Kompass, Analysebericht Fassung 4 (vorläufig); Expertenrat für Klimafragen [3]. Dargestellt sind vorhandene Zahlen, keine neue Rechnung.*

**Was das heißt.** Unsere Fortschreibung bestätigt den Expertenrat nicht und widerlegt ihn nicht. Sie sagt: Mit dem Tempo des langen Trends würde Deutschland das Budget deutlich überschreiten, mit dem Tempo der letzten zehn Jahre ungefähr einhalten. Das ist dieselbe Botschaft wie oben: Die Antwort hängt vom Blickwinkel ab. Zum Schluss ein Vorbehalt, den wir ernst nehmen: Eine einfache Gerade ist nicht die Methode des Expertenrats. Der arbeitet mit Sektorzielen, Sonderregeln und Übertragungen zwischen Jahren.

## Ein Maßstab für Prognosen: der Prognose-Check

Ob solche Fortschreibungen taugen, lässt sich am besten an der Vergangenheit prüfen. Unser Prognose-Check vergleicht deshalb die Projektionen der Bundesregierung aus früheren Jahren (Projektionsberichte 2015 bis 2023) mit den Emissionen, die später tatsächlich gemessen wurden, gesamt und je Sektor. Der Analyseplan ist seit dem 22. Oktober 2026 eingefroren [5]. Ein validiertes Ergebnis lag zum Redaktionsschluss dieses Buchs nicht vor. Deshalb steht hier keines. [Falls bis zum Satz validiert und freigegeben: Ergebnis hier ergänzen, sonst diesen Absatz so lassen.] Mehr dazu in Kapitel 10.

## Was heißt das für dich?

- Wenn jemand schreibt, Deutschland sei „auf Kurs“ oder „verfehle sein Ziel“: Frag, welche Jahre er betrachtet. Beide Antworten können mit denselben Daten rechnerisch stimmen.
- Eine Zahl für 2040 ist eine Fortschreibung, keine Vorhersage. Achte auf die Spanne dabei, nicht nur auf den Punkt.
- Ein Puffer von 4,5 Millionen Tonnen bei einem Budget von mehr als 6.000 ist winzig. Das ist keine Beruhigung und kein Alarm, es zeigt nur, wie knapp die Rechnung ist.

## Lagen wir richtig?

Wir haben keine Prognose abgegeben, ein „Treffer“ ist deshalb nicht definiert. Zwei Dinge können wir dennoch sagen:

- **Die Zahlen stimmen mit unserer Rechnung überein, bis auf die Intervalle.** Bei der Wiederholung der Rechnung für den Expertenrat-Abgleich ergaben sich dieselben 486 und 207 Millionen Tonnen für 2040. Beim Schreiben dieses Kapitels haben wir allerdings bemerkt, dass im Artikel vom 27. August zwei Bereichsangaben nicht zur Rechnung passen: Für den Langfrist-Trend stand „407–598“, aus der Rechnung folgen 407 bis 566 (die 598 ist die Obergrenze des ARIMA-Intervalls). Für den 10-Jahres-Trend stand „16–328“, aus der Rechnung folgen 86 bis 328 (die 16 ist die Untergrenze des ARIMA-Intervalls). An den Schlüssen ändert das nichts. Es steht deshalb auch in Kapitel 8.
- **Der Prüfstein kommt noch.** Der Prognose-Check und der geplante Eintrag zu den deutschen Emissionen 2027 (Kapitel 10) zeigen, wie gut solche Fortschreibungen die Wirklichkeit treffen.

## Woher wir das wissen

Datenquelle ist das Umweltbundesamt, bereitgestellt über klimadashboard.de (CC BY 4.0). Analysepläne, R-Code und Rohdaten liegen im Repository (`Analysen/2026-08-emissionen/`, `Analysen/2026-08-expertenrat-budgetabgleich/`, `Analysen/2026-10-prognose-check-projektionsberichte/`). Zur Prüfung des 2040-Trends: Im Repository liegt kein Validierungsbericht als Datei. Dokumentiert ist die Prüfung nur in einem Commit-Vermerk vom 27. August („Pilot validiert: R-Ergebnisse matchen Referenzwerte, HAC-Abweichung dokumentiert“). Der Artikel sprach von einer unabhängigen Prüfung. Nach heutigen Maßstäben würden wir dafür einen eigenen Bericht verlangen. Für die Expertenrat-Analyse liegen Validierungsberichte als Dateien vor.

## Quellen

[1] Klima Kompass: „Erreicht Deutschland sein Klimaziel 2040? Die Antwort hängt vom Blickwinkel ab“, 27.08.2026. https://klimaevidenzcheck.substack.com/p/erreicht-deutschland-sein-klimaziel
[2] Umweltbundesamt (UBA): Emissionsdaten 2025 (Stand 14.03.2026), bereitgestellt über klimadashboard.de (CC BY 4.0). https://klimadashboard.de/emissionen
[3] Expertenrat für Klimafragen: Prüfbericht zu den Emissionsdaten 2025 und den Projektionsdaten 2026, veröffentlicht 18.05.2026 (Gesamtbudget 2021–2030: 6.199 Mt; Puffer 4,5 Mt; 50/50-Pfad 60–100 Mt über Budget). https://expertenrat-klima.de
[4] Klima Kompass: Analysebericht Expertenrat-Budgetabgleich 2021–2030, Fassung 4, 24.10.2026 (vorläufig), und SAP v1.1 (eingefroren 29.08.2026, Erratum 1 freigegeben 23.10.2026), `Analysen/2026-08-expertenrat-budgetabgleich/`. Halbjahreswert: Agora Energiewende, Halbjahresbilanz 2026 (Pressemitteilung 28.08.2026).
[5] Klima Kompass: SAP „Prognose-Check #1“, v1.1, eingefroren 22.10.2026, `Analysen/2026-10-prognose-check-projektionsberichte/`.

## Herkunftstabelle (nicht ins Buch)

| Aussage | Herkunft |
|---|---|
| −48 %, 88 %, 150 (150,4) Mt, Fenster A/B Projektion 486 / 207 | Artikel 27.8.; Rechenlauf 24.10.2026 (`DE-Emissionen-Trendprojektion-2040.R`) |
| OLS-Intervalle 406,6–565,5 und 86,3–327,8; ARIMA 389,9 [181,5; 598,3] und 274,2 [16,4; 532,1] | Konsolenausgabe des Skripts (24.10.2026); SAP 5.4 (OLS primär) |
| 648,83 Mt 2025 | Analysebericht Expertenrat (UBA); 649 gerundet |
| Budget 6.199, Puffer 4,5 (0,07 %), 60–100 | Analysebericht Expertenrat, Abschnitt 0 (nach Expertenrat-Prüfbericht) |
| H1 327 Mt, −2,1 %, CAGR −1,5 / −3,6 | Analysebericht Abschnitt 1 |
| +25 bis +584, 8 von 9, 4 von 6, Niveausprung 40,9 | Analysebericht Kernaussage, 2.2 |
| Prognose-Check | SAP-Kopf; Stand run_log |
| Commit-Vermerk 27.8. | `git show ef3d8d9` |
