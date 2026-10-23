# Faktencheck Kapitel 1 (Jahrbuch 2026): „War dieser Sommer normal, und was hat er gekostet?“

**Geprüfte Datei:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/01-sommer.md` (Entwurf v0.1, 22.10.2026). Nicht verändert.
**Prüfdatum:** 23.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor des Entwurfs)
**Dieses Dokument enthält keinen Freigabevermerk.** Gate laut `kapitelplan.md` Abschnitt 5: volle Faktencheck-Datei für „Kurz gesagt“, „Was heißt das für dich?“, „Lagen wir richtig?“; Differenzprüfung für den Haupttext.

## 1. Geprüfte Quellen und Zugriff

| Quelle | Zugriff | Ergebnis |
|---|---|---|
| [1] Evidenzcheck 11.9. („ganz normal“), Referenzfassung `quellen-artikel/2026-09-11_...html` | gelesen | Abgleich vollständig |
| [3] Evidenzcheck 29.8. („Ausreißer“), Referenzfassung `quellen-artikel/2026-08-29_...html` | gelesen | Abgleich vollständig |
| [5] Einordnung 17.10., Referenzfassung `quellen-artikel/2026-10-17_...html` | gelesen | Abgleich vollständig |
| Analysebericht und Validierungsbericht Sommer-Analyse (`Analysen/2026-09-sommer-2026-normal/`) | Analysebericht vollständig, Validierungsbericht nur Kopf (Zeilen 1–30) gelesen | Zahlen 8/55, Perzentil 0,09 K, E2a/E2b, Tabelle E1 bestätigt |
| `Analysen/2026-08-hitzesommer-2026/run_log.txt`, Validierungsbericht (Kopf, Priorität 1) | run_log vollständig, Validierungsbericht bis Zeile 40 | mu_hat 2955 (REML-Schätzer), PI-Obergrenze 8.671, z = 4,46, Sensitivitäten, 2018-Werte bestätigt |
| MedienKlimaBericht Nr. 1, lokale Textkopie | Seiten 1–16 vollständig | Tabellenwerte, Tag 7, 94 %/89 %, exemplarische Beispiele bestätigt |
| RKI-Seite „Bericht Hitzemortalität“ | WebFetch 23.10.2026 | KW 37/2026 (07.–13.09.), Stand 24.09.2026, 16.000 [14.400; 17.600] (95-%-Prädiktionsintervall), Zeitraum KW 15–37, „Mit diesem Bericht endet die wöchentliche Berichterstattung 2026.“ bestätigt |
| klimareporter°-Interview mit Tobias Fuchs | WebFetch 23.10.2026 | Interview geführt von Joachim Wille, Datum 08.09.2026; die drei Passagen („extrem ungewöhnlich“, „in 30 Jahren ... eher als normal betrachten“, „sogar als kühl gelten“) bestätigt; Fuchs = Leiter Geschäftsbereich Klima und Umwelt beim DWD |
| DWD-Datei `regional_averages_tm_summer.txt` | WebFetch 23.10.2026 | Kopf „erstellt am: 20260902“ (unverändert gegenüber Analysestand), Deutschland 2026 = 19,55, 2003 = 19,67 |
| GitHub-Repo, Ordner `Analysen/2026-09-sommer-2026-normal/` und `.../2026-08-hitzesommer-2026/` | WebFetch 23.10.2026 | öffentlich sichtbar; beide enthalten SAP, Validierungsbericht, Code; Sommer-Ordner zusätzlich Analysebericht und Abweichungsprotokoll, Hitzesommer-Ordner run_log und Rohdaten |
| Treibhauspost #125 (steady.page) | WebFetch 23.10.2026: HTTP 403 | **nicht prüfbar**; Stütze nur der frühere Faktencheck (Nachtrag 2) und die dort wiedergegebene Prüfung durch Daniel Saure am 17.10. (als Chat-Aussage, nicht als Datei) |
| Prognose-Register-SAP selbst | nicht geöffnet | Angabe nur gegen `gliederung_kap07-10.md` (Kapitel 10) abgeglichen |

## 2. Tabelle der Behauptungen

Legende: bestätigt / Abweichung / nicht prüfbar / kritisch. Im Zweifel „Abweichung“. A-Nummern verweisen auf die Auflagen in Abschnitt 3.

### 2.1 Kurz gesagt

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | „Normal“ hängt vom Vergleichsmaßstab ab | [1] | bestätigt | |
| 2 | 19,6 °C, zweitwärmster Sommer seit 1881 | [1], Analysebericht (Datei 19,55; DWD-Pressemitteilung 19,6; Rang 2) | bestätigt | Rundung 19,55 zu 19,6 wie in [1]. |
| 3 | Gemessen an 1961–1990 „extrem außergewöhnlich“, am Trend seit 1971 „ungewöhnlich warm“ | [1] | bestätigt | Konvention, im Haupttext benannt. |
| 4 | RKI: 16.000, Spanne 14.400 bis 17.600 | RKI-Seite live, [5] | bestätigt | Die Spanne ist ein 95-%-Prädiktionsintervall; zum Zeitraum siehe A8. |
| 5 | „liegen deutlich außerhalb der Bandbreite seit 1992“ | [3], [5] | bestätigt, mit Hinweis | Punktschätzer-Vergleich wie in [5] (zulässig). Die Bandbreite stammt aus der Analyse mit 15.800 (siehe A6, A7). |
| 6 | „Warum das so ist, zeigen diese Zahlen nicht“ | [3], [5] | bestätigt | Deckt sich mit „Was das nicht bedeutet“ in [3] und „Keine Ursachenaussage“ in [5]. |

### 2.2 Die Behauptung

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 7 | „Im Spätsommer 2026 hieß es in der politischen Debatte, der Sommer sei ‚ganz normal‘ gewesen, früher sei es auch schon heiß gewesen“ | [1] Einleitung | Abweichung | [1]: „in der politischen Debatte der vergangenen Wochen ... **manchmal** als ‚ganz normal‘ bezeichnet“. „manchmal“ entfällt; „Spätsommer“ ist Zusatz. [1] nennt weder Sprecher noch Beleg. A3. |
| 8 | DWD: ein solcher Sommer wäre vor 30 oder 40 Jahren „extrem ungewöhnlich“ gewesen, könne in 30 Jahren eher als normal gelten [1][2] | [1]; Interview live geprüft | bestätigt, mit Hinweis | Wortlaut im Interview bestätigt. Sprecher ist Tobias Fuchs (Leiter Geschäftsbereich), das Kapitel schreibt „der DWD“. A4. „sah es differenzierter“ ist eine Wertung; vertretbar, aber nicht in [1]. |
| 9 | „Wir haben ... vorab festgelegt, womit wir vergleichen, und nachgerechnet“ | [1] | bestätigt | |

### 2.3 Temperatur

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 10 | Sommer = Juni bis August, Reihe DWD seit 1881 | [1] | bestätigt | |
| 11 | Einstufung: bis 1 SD „im Normalbereich“, bis 2 „ungewöhnlich warm“, bis 3 „außergewöhnlich warm“, darüber „extrem außergewöhnlich“; vorab festgelegte Konvention | [1] | bestätigt | |
| 12 | Tabellenzeile 1961–1990: 16,3 °C, +3,3 Grad, 4,1 SD, extrem außergewöhnlich | [1], Analysebericht E1 | bestätigt | 19,6 minus 16,3 = 3,3 (kein Kapitel-Eigenwert). |
| 13 | Tabellenzeile 1991–2020: 17,6 °C, +2,0 (2,2), außergewöhnlich warm | [1], Analysebericht | bestätigt | |
| 14 | Tabellenzeile Trend 1971–2025: 18,5 °C, +1,1 (1,3), ungewöhnlich warm | [1], Analysebericht | bestätigt | |
| 15 | „wärmer als jeder Sommer dieser 30 Jahre“ (1961–1990) | [1], Analysebericht | bestätigt | |
| 16 | „Gemessen an 1991–2020 war nur 2003 wärmer“ | [1], Analysebericht (Rang 2 von 31; 2003 = 19,67) | bestätigt, mit Hinweis | Gemeint: innerhalb der Periode 1991–2020 (plus 2026). Kapitel sagt das nicht ausdrücklich. A9 (Empfehlung). |
| 17 | „8 der 55 Sommer ... mindestens so weit über dem Trend, 2026 war also ein warmer Sommer, wie er etwa jedes siebte Jahr vorkam“ | [1], Analysebericht (8 von 55, ≈ jeder siebte) | bestätigt, mit Hinweis | Zahlen stimmen. „also“ stellt eine Schlussfolgerung dar, die in [1] nur als Nebeneinander steht; der Analysebericht weist zudem auf Rechtsschiefe hin (Normalannahme unterschätzt Häufigkeit), das Kapitel nicht. Geringfügig. |
| 18 | Perzentil-Betrachtung: 2026 knapp noch oberer Normalbereich, 0,09 Grad unter der Grenze, Größenordnung möglicher Nachkorrekturen | [1], Analysebericht (+1,08 K vs. 90.-Perzentil +1,17 K) | bestätigt | |
| 19 | Trend „knapp 0,5 Grad pro Jahrzehnt“ | [1], Analysebericht (+0,46 K, KI 0,31–0,60) | bestätigt | |
| 20 | Typisch um 2051 (95-%-Intervall 2038 bis 2075); nicht mehr ungewöhnlich ab etwa 2033 (2023 bis 2049) | [1], Analysebericht Primärzeile | bestätigt | |
| 21 | „statistische Fortschreibung der Messwerte, keine Klimaprojektion“; Emissionsunsicherheit nicht in den Intervallen | [1] | bestätigt | |
| 22 | „Die Aussage des DWD zu ‚in 30 Jahren‘ steht damit nicht im Widerspruch zum Messtrend“ | [1], Analysebericht Abschnitt 4 | Abweichung | [1]: „liegt im Intervall für den typischen Sommer“ (2056 in 2038–2075). Der Analysebericht schränkt ein: Nur für „normal = typischer Sommer“. Gilt „normal“ als „nicht mehr ungewöhnlich“ (E2b), liegt 2056 außerhalb des Intervalls 2023–2049; nach Perzentil-Variante läge es bei 2025. Das Kapitel nennt beide Marken (2051, 2033) und schließt dann ohne diese Einschränkung. A10. |
| 23 | DWD-Aussage „sogar als kühl gelten“ bewusst nicht untersucht, weil von künftigen Emissionen abhängig | [1], Interview | bestätigt, mit Hinweis | Attribution A4. |

### 2.4 Hitzetote

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 24 | RKI schätzt hitzebedingte Sterbefälle jedes Sommers mit statistischem Modell | [5], RKI-Seite | bestätigt | Berichtszeitraum ist laut RKI KW 15 bis 37 (Sommerhalbjahr), nicht Juni–August. A8. |
| 25 | Jährliche Schätzungen seit 1992 als Metaanalyse, Referenzmodell für „normales“ Jahr [3] | [3], run_log (k = 34, REML+HKSJ) | bestätigt | |
| 26 | „Im Mittel der Jahre 1992 bis 2025 gab es rund 2.955 hitzebedingte Sterbefälle pro Jahr“ | [3] („historischer Mittelwert“), run_log (mu_hat = 2955,28) | Abweichung | 2.955 ist der gepoolte Schätzer des Random-Effects-Modells, kein einfaches Mittel der 34 Jahreswerte (das Fixed-Effect-Modell liefert z. B. 2.014). „Im Mittel der Jahre“ legt den einfachen Durchschnitt nahe. Auch [5] verwendet diese Formulierung; sie ist in [3] präziser. A6. |
| 27 | „Ein normales Jahr hätte nach dem Modell höchstens rund 8.700 erwarten lassen“ | [3] („bis maximal rund 8.700“), run_log (PI oben 8.671) | Abweichung | Obergrenze eines 95-%-Prognoseintervalls, kein Höchstwert. Das Kapitel nennt weder „95 Prozent“ noch die Pflichtkennzeichnung (SAP 5.3: Intervall wegen Nicht-Normalität möglicherweise unpräzise; [3] benennt rechtsschiefe Verteilung und negative Untergrenze). Frühere Prüfung (17.10., #11) führte dasselbe als Empfehlung. A6. |
| 28 | „Der damals vorläufige Wert für 2026 lag mit 15.800 etwa 4,5 Standardabweichungen über dem Referenzbereich“ | [3], run_log (z = 4,46) | bestätigt | |
| 29 | „..., in allen acht vorab festgelegten Sensitivitätsanalysen“ (Satzanschluss an die 4,5 SD) | [3] („robust ... über acht ... Sensitivitätsanalysen“), run_log | Abweichung | Der Satz lässt lesen, 4,5 SD gelte in allen acht. Laut run_log liegt z in den Varianten zwischen 2,39 (S3 Log-Skala) und 21,43 (S4 Fixed-Effect), S1c 11,80; 13 von 13 klassifizierbaren Varianten oberhalb des jeweiligen PI, S7 hat keine eigene Klassifikation. Gleich bleibt die Richtung, nicht die Größe. A7. |
| 30 | RKI-Wochenbericht KW 37, Stand 24.9.2026, „letzter Wochenbericht der Saison“, 16.000, 14.400 bis 17.600 [4] | RKI-Seite live | bestätigt | Seite am 23.10. geöffnet; Link führt zum Bericht. Seite zeigt den jeweils aktuellen Bericht; da die Berichterstattung 2026 endete, bleibt KW 37 maßgeblich. |
| 31 | „etwas mehr als die 15.800 ... Ein beschreibender Abgleich, keine neue Rechnung [5]“ | [5] | bestätigt | |
| 32 | „Schätzung, nicht Zählung ... nicht von Totenscheinen“ [4][5] | [5], RKI (Modelldifferenz mit/ohne Hitze, run_log Schritt 2) | bestätigt | |
| 33 | „Nicht altersbereinigt ... steigt ein Teil der Fallzahlen auch unabhängig vom Klima“ [3] | [3], [5], run_log | bestätigt | Formulierung „Fallzahlen“ korrekt. |
| 34 | „RKI modelliert die Sterblichkeit seit 2020 wegen der Corona-Pandemie mit einer flexibleren Kurve“; Teil des Abstands nicht ausschließbar [5][6] | [5], run_log Schritt 5a (Zitat EB 19/2025), SAP 8.1 | bestätigt | Hinweis: S1c (nur Jahre ab 2020) zeigt 2026 weiterhin oberhalb des PI (z = 11,8); das ändert nichts daran, dass der Einfluss nicht quantifiziert ist. |
| 35 | „Bei der Prüfung einer kursierenden Vergleichszahl für 2018 fanden wir außerdem eine Verwechslung in einer Sekundärquelle: Richtig sind rund 8.500, nicht 9.400“ [3] | [3], run_log Schritt 5c | Abweichung | 8.500 ist der Wert der aktuellen Ausgabe EB 19/2025 (frühere Ausgaben: 8.300, 8.400). Die Zahl 9.400 stand laut run_log im eigenen Analyseplan (SAP 8.1); sie war in keiner der drei RKI-Primärquellen reproduzierbar. Die Herkunft ist laut run_log „ausdrücklich unbestätigt“ (möglicherweise Verwechslung mit der oberen PI-Grenze 2019). „Verwechslung in einer Sekundärquelle“ ist also nicht belegt. Dass das Kapitel den Punkt unter „Methodik im Wandel“ führt, ist überdies sachlich schief (kein Methodikwechsel, sondern Revisionen derselben Reihe). A11. |
| 36 | „Unsere Analyse beantwortet nur, ob 2026 außerhalb der bisherigen Schwankungsbreite liegt“; Attributionsforschung, Studie nicht geprüft [3][5] | [3], [5] | bestätigt, mit Hinweis | Attributionsstudie wird nur in [5] erwähnt; [3] ist als Beleg dafür überflüssig. Geringfügig. |

### 2.5 Mediendebatte

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 37 | Treibhauspost veröffentlichte am 17.10.2026 Interview mit Jürgen Döschner, früher Energieexperte der ARD [5][7] | [5], Bericht Fn. 7 („langjähriger ARD-Journalist“) | bestätigt (indirekt) | Quelle [7] liefert 403, nicht prüfbar. Prüfung durch Daniel Saure am 17.10. laut früherem Faktencheck dokumentiert (als Chat-Aussage). |
| 38 | Seine These: Medien berichten über Hitze und Dürre, lassen den Klimazusammenhang weg; Belege u. a. 16.000 Hitzetote und der Bericht [5][7] | [5] | nicht prüfbar (Interview), bestätigt (gegen [5]) | Wiedergabe deckt sich mit [5]; Original nicht einsehbar. |
| 39 | „Das Interview ist eine Meinungsquelle, keine Primärquelle“ | [5] | bestätigt | Kennzeichnung korrekt. Nicht erwähnt: Der Bericht zitiert Döschner (Kap. 4, Fn. 7), Interview und Bericht sind nicht unabhängig voneinander (Empfehlung E2). |
| 40 | Bericht wertet Das Erste und ZDF, Januar bis Juni 2026, aus [8] | Bericht Titelseite, Anhang A | bestätigt | |
| 41 | „Klima-Minute“ = Minute mit der Zeichenfolge „Klima“, etwa „Klimakrise“ | Bericht Anhang A | bestätigt | |
| 42 | „Das Verfahren trifft nach eigenen Angaben zu 94 Prozent richtig und findet 89 Prozent aller Klima-Minuten“ | Bericht Anhang A („Genauigkeit (Precision) von 94 %“, Recall 89 %), [5] | **Abweichung (gewichtig)** | 94 % = Precision: 94 % der gezählten Minuten sind Klima-Minuten. „trifft zu 94 Prozent richtig“ liest sich als Gesamttrefferquote. Der Fehler war im früheren Faktencheck (Auflage 7) beanstandet und in [5] korrigiert („94 Prozent der gezählten Minuten sind tatsächlich Klima-Minuten“); das Kapitel fällt auf die beanstandete Fassung zurück. A1. |
| 43 | Verein setzt sich für mehr Klimaberichterstattung ein, Zahlen von einer Seite mit klarem Anliegen, Methode beschrieben [5][8] | Bericht S. 2, S. 14 | bestätigt | Eigeninteresse (Forderung nach festem Sendeplatz für eigenes Format, S. 14) bleibt ungenannt; Empfehlung E3. |
| 44 | Tabelle Das Erste/ZDF: 2023 2,2 / 1,95; 2024 1,49 / 1,43; 2025 1,29 / 1,29; 1. Halbjahr 2026 0,95 / 0,82 (alle in %) | Bericht Kap. 2.1 und 4 | bestätigt | Alle acht Werte Zeile für Zeile gegen die Textkopie geprüft. Halbjahres- gegen Jahreswerte ist in der Beschriftung kenntlich, der Bericht vergleicht selbst so. |
| 45 | „Laut dem Bericht hat Das Erste die Juni-Hitzewelle erst am siebten Tag der Warnperiode des DWD ausdrücklich als klimawandelbedingt eingeordnet“ | Bericht Überblick, Kap. 3.3, Kap. 4 | bestätigt, mit Hinweis | „erstmals explizit“, 24.06. (sechs Tage nach Beginn der Warnungen 18.06.). Das Kapitel lässt den Satz der Quelle [5] weg, dass es vorher „einzelne Randerwähnungen“ gab (Bericht: drei Randstellen). A2. |
| 46 | „In Frankreich, Großbritannien und Spanien sei der Klimabezug dagegen vom ersten Tag an üblich gewesen“ [5][8] | Bericht Überblick | bestätigt, mit Hinweis | Konjunktiv korrekt. Die Quelle stützt das mit exemplarisch ausgewählten Beispielen (Anhang A: „exemplarisch ausgewählt“); [5] sagt das ausdrücklich, das Kapitel nicht. Der Satz „Vom ersten Tag an Standard“ bezieht sich im Bericht zudem vor allem auf die Mai-Hitzewelle (Kap. 3.2). A2. |
| 47 | „Was die Zahlen nicht zeigen: eine Absicht der Redaktionen. Ein Stichwort ist kein Qualitätsmaß, und der Bericht untersucht nur zwei Sender, nicht Zeitungen, Privatsender oder Onlinemedien“ [5] | [5], Bericht Anhang A/B | bestätigt, mit Hinweis | Der Bericht erfasst für den Auslandsvergleich zusätzlich 24 Sender aus 17 Ländern (Anhang B). „nur zwei Sender“ gilt für die Klima-Minuten-Reihe. Ohne den Hinweis auf den Auslandskorpus wirkt der Satz widersprüchlich zum Vorabsatz. A2. |

### 2.6 Was heißt das für dich? (neu)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 48 | „Eine Aussage wie ‚ganz normal‘ lässt sich erst prüfen, wenn der Vergleichsmaßstab genannt ist“ | [1] | bestätigt | Wörtlich in [1] angelegt. |
| 49 | „Derselbe Sommer war je nach Maßstab ‚extrem außergewöhnlich‘ oder ‚ungewöhnlich warm‘, und beides stimmt“ | [1] | Abweichung (gering) | „und beides stimmt“ ist neu formuliert. Die Einstufungen sind Konvention; es gibt in [1] außerdem „außergewöhnlich warm“ (1991–2020) und die Perzentil-Einstufung „oberer Normalbereich“. „beides“ verkürzt auf zwei von mindestens vier Befunden. A12. |
| 50 | „Zahlen zur Hitzesterblichkeit sind Modellschätzungen mit einer Spanne und werden noch revidiert“ | [3], [5], RKI | Abweichung (gering) | Modellschätzung und Spanne bestätigt. „werden noch revidiert“ ist stärker als die Quellen („ausdrücklich vorläufig“, „noch keine endgültige Jahresschätzung“). Nach dem RKI endete die Wochenberichterstattung; eine spätere Jahresschätzung ist erwartbar, aber nicht zugesagt. A12. |
| 51 | „Die Größenordnung (mehrere Tausend über der bisherigen Bandbreite) war über alle unsere Prüfungen stabil; die einzelne Zahl ist es nicht“ | [3], run_log, [5] | **Abweichung (gewichtig), neue Inferenz** | (a) „mehrere Tausend über der Bandbreite“ kommt in keinem Artikel vor und ist eine neue Differenzbildung (16.000 gegen Obergrenze 8.700; gegen die Sensitivitäts-Obergrenzen 5.430 bis 12.028 ergäben sich je nach Variante rund 4.000 bis 10.000). Das ist keine Wiedergabe. (b) [3] belegt Robustheit der Richtung („alle robust in derselben Richtung“), nicht der Größenordnung; die z-Werte reichen von 2,39 bis 21,43. (c) „alle unsere Prüfungen“ erweckt den Eindruck, auch der Methodikeinfluss und die Vorläufigkeit seien geprüft; das Kapitel selbst sagt, der Methodikanteil sei nicht ausschließbar. (d) Der Abgleich in [5] (16.000 gegen 8.700) ist ein Punktschätzer-Vergleich, keine Prüfung. Die Herkunftstabelle nennt acht Sensitivitätsanalysen plus [5] als Stütze; das trägt „Richtung“, nicht „Größenordnung“. A7. |
| 52 | „Dass die Klimaberichterstattung im Programm von Das Erste und ZDF 2026 seltener vorkam als in den Vorjahren, ist durch die Studie eines Vereins mit klarem Anliegen belegt. Warum, zeigt sie nicht“ | [5], Bericht | Abweichung (gering) | Die Reihe stützt „seltener als 2023–2025“ (1. Halbjahr 2026 gegen Jahreswerte). „belegt“ ist stärker als [5] („laut KLIMA° vor acht“, „Stichwort ist nicht Qualität“). Der Bericht selbst nennt Ursachen (Programmentscheidungen u. a.) als Deutung; das Kapitel sagt zu Recht, die Zahlen zeigten das Warum nicht. Vorschlag: „zeigt die Studie“. A12. |

### 2.7 Lagen wir richtig? (neu)

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 53 | Am 29. August: Zahl werde sich „vermutlich eher nach oben als nach unten“ verändern [3] | [3] | bestätigt | Zitat wortgleich („wird sich noch verändern – vermutlich eher nach oben als nach unten“). |
| 54 | „Sie stieg von 15.800 auf 16.000 [4]“ | [3] / RKI-Seite; run_log (15.800 = KW 33, Bericht 27.8.) | bestätigt | Beide Werte sind kumulativ KW 15 bis KW 33 bzw. 37. |
| 55 | „Das war eine Erwartung ohne Intervall, kein registrierter Treffer.“ | [3] (keine Registrierung), Kap. 10 (Register erst ab 2027) | bestätigt | Korrekt nicht als Treffer überhöht. Weicht bewusst von der Gliederung ab („belegter Treffer“); die Kapitelfassung ist die zutreffende. Hinweis: Wertänderung 15.800 auf 16.000 liegt zudem innerhalb des damaligen Intervalls (14.500 bis 17.000); das Kapitel erwähnt das nicht (nicht nötig). |
| 56 | „Die Kernaussage (außerhalb der Bandbreite) hat sich dadurch nicht verändert“ | [5] | bestätigt, mit Hinweis | Aussage beruht auf Punktschätzer-Vergleich 16.000 > 8.700 (zulässig). Eine neue z-Berechnung für 16.000 ist nicht enthalten; das ist richtig. |
| 57 | Noch offen: endgültige RKI-Jahresschätzung; Einfluss der Methodenumstellung; Nachkorrekturen am vorläufigen DWD-Wert (Stand DWD-Daten: 2. September 2026) | [1], DWD-Datei live | bestätigt | DWD-Datei trägt am 23.10. weiter „erstellt am: 20260902“, also keine Revision des Datenstands bis heute sichtbar. Die Gliederung wollte „prüfen, ob bis Redaktionsschluss revidiert“: Stand 23.10. unverändert. Vor Druck (Stichtag 15.11.) erneut öffnen. |
| 58 | Nicht geprüft: DWD-Aussage „sogar als kühl gelten“ (zweite Jahrhunderthälfte), weil von Emissionen abhängig [1] | [1], Interview | bestätigt, mit Hinweis | Attribution A4. |
| 59 | Sommermitteltemperatur 2027 gehört zu den „vier Vorhersagen, die wir im Januar 2027 im Prognose-Register festlegen wollen (siehe Kapitel 10)“ | `gliederung_kap07-10.md` (Kapitel 10: vier Zielgrößen, Registrierung Januar 2027, SAP noch Entwurf) | Abweichung (gering) | Zielgröße und Monat stimmen mit der Gliederung überein; SAP selbst nicht geöffnet. Fehlt: Kennzeichnung „geplant, SAP noch nicht eingefroren, Termine können sich verschieben“ (Grenzen in Gliederung Kap. 10: Termine nicht verschärfen). Außerdem sind es laut Gliederung „Zielgrößen“ des Registers, nicht schon „Vorhersagen“. A13. |

### 2.8 Woher wir das wissen und Quellenliste

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 60 | Temperaturen: DWD CDC, Gebietsmittel, Sommer 1881–2026, Stand 2.9.2026; 2025 und 2026 vorläufig | [1], DWD-Datei live | bestätigt | Dateikopf „erstellt am: 20260902“. |
| 61 | Normalperioden, lineare Regression 1971–2025 mit 95-%-Prognoseintervall, Fieller, Sensitivitätsanalysen (andere Zeiträume, Bruchpunktmodell, Zeitreihenmodell, Perzentil-Definition, Bootstrap) | [1] Methodik-Box | bestätigt | „Zeitreihenmodell“ = ARIMA; Sensitivität „2026 im Modell“ fehlt in der Aufzählung (unwesentlich). |
| 62 | „Analysepläne vor Sichtung der Daten festgelegt, Abweichungen protokolliert, Kernzahlen unabhängig validiert“ [1] | [1], Validierungsberichte | bestätigt | Beide Validierungsberichte tragen „freigabefähig mit Auflagen“ bzw. „Freigabe mit Auflagen“. Das Kapitel sagt nicht, dass es Auflagen gab (siehe Empfehlung E5). |
| 63 | Sterbefälle: RKI-Wochenberichte, Jahresreihe 1992–2025; Random-Effects, 2026 ausgeschlossen; Analyseplan Version 1.1, zwei Auflagen-Runden [3] | [3], Validierungsbericht | bestätigt | |
| 64 | Medien: MedienKlimaBericht Nr. 1, Erstes Halbjahr 2026, KLIMA° vor acht e. V. [8] | Bericht | bestätigt | |
| 65 | Repo-Ordner `Analysen/2026-09-sommer-2026-normal/` und `Analysen/2026-08-hitzesommer-2026/` im Repo github.com/dsaure55/klima-evidenzcheck mit Plänen, Code, Tabellen, Validierungsberichten | GitHub live | bestätigt, mit Hinweis | Ordner öffentlich. Beide enthalten Validierungsbericht, SAP, Code. „Tabellen“ liegen in `output/` (Hitzesommer-Ordner: Unterordner `output` vorhanden; Sommer-Ordner: `output/` vorhanden). Hinweis: Dateiname im Hitzesommer-Ordner „Validierungsbericht_Hitzesommer-2026.md“ (Großbuchstabe) auf GitHub. |
| 66 | Quelle [1]: Titel, Datum 11.09.2026, URL | Referenzfassung | bestätigt | |
| 67 | Quelle [2]: klimareporter°-Interview mit Tobias Fuchs (DWD), 08.09.2026, „wie in [1] zitiert (Primärquelle für das Buch noch nicht geöffnet)“ | Interview live | Abweichung | Inhalt und Datum bestätigt (23.10.). Der interne Vermerk „noch nicht geöffnet“ gehört nicht ins Buch und ist inzwischen überholt. Titel und URL fehlen in [2] (Titel: „In 30 Jahren könnte dieser Sommer normal sein“, URL laut [1]). A5. |
| 68 | Quelle [3]: Titel (gekürzt), 29.08.2026, URL | Referenzfassung | bestätigt | Untertitel „Was die Zahlen zeigen“ fehlt; vertretbar. |
| 69 | Quelle [4]: RKI KW 37/2026 (07.–13.09.), Stand 24.09.2026, URL | RKI live | bestätigt | Link zeigt die RKI-Berichtsseite; Linkziel und Inhalt passen. |
| 70 | Quelle [5]: Titel, 17.10.2026, URL | Referenzfassung | bestätigt | |
| 71 | Quelle [6]: RKI Epid. Bull. 19/2025, 07.05.2025, ohne Link | früherer Faktencheck (Nachtrag 2) | Abweichung (gering) | Titel, Heft, Datum bestätigt (früher geprüft); öffentliche Fundstelle fehlt. Verifizierte DOI laut früherem Faktencheck: https://doi.org/10.25646/13135. A5. |
| 72 | Quelle [7]: Treibhauspost #125, Interview Döschner, 17.10.2026, URL | [5] | bestätigt (Metadaten), Link nicht prüfbar | 403. Titel („Warum ignoriert die ARD die Klimakrise?“) aus [5] fehlt. A5. |
| 73 | Quelle [8]: Titel, (Juli 2026), PDF-Link | Bericht, [5] | bestätigt | PDF-Titel auf dem Cover: „MedienKlimaBericht Nr. 1“; Dateiname „KlimaMedienBericht“ ist Teil der URL. |

## 3. Querschnittsprüfungen

| Prüfpunkt | Ergebnis | Hinweis |
|---|---|---|
| (a) Keine neue Berechnung oder Inferenz | **Abweichung** | Neue Rechnungen im Sinne eigener Zahlen: keine. Neue Inferenz/Verallgemeinerung: Nr. 51 („mehrere Tausend“, „Größenordnung ... stabil über alle Prüfungen“), Nr. 49 („beides stimmt“), Nr. 50 („werden noch revidiert“), Nr. 52 („belegt“), Nr. 22 („damit“ ohne Einschränkung auf „typisch“). „Kernaussage hat sich nicht verändert“ (Nr. 56) ist zulässig (Punktschätzer-Vergleich wie in [5]). |
| (b) Neue Bausteine durch Quellen gedeckt | teilweise | „Was heißt das“ Punkt 1 gedeckt, Punkte 2 und 3 mit Auflagen. „Lagen wir richtig“: Hitzetote-Punkt korrekt und nicht als Treffer überhöht (Nr. 53–55 bestätigt). „Größenordnung über alle Prüfungen stabil“ ist **nicht** gedeckt (Nr. 51): gedeckt wäre „Richtung (oberhalb des jeweiligen Prognoseintervalls) in allen acht Sensitivitätsanalysen“. Quelle für die Formulierung „vermutlich eher nach oben als nach unten“ korrekt zitiert; „von 15.800 auf 16.000“ korrekt, beide Werte kumulativ KW 15–33 bzw. 15–37. |
| (c) Paraphrase des DWD-Zitats, Quelle [2] | bestätigt, mit Hinweis | Interview am 23.10. direkt geöffnet; Paraphrase deckt sich mit Wortlaut („extrem ungewöhnlich“, „könnte es allerdings sein, dass wir ihn eher als normal betrachten“, „sogar als kühl gelten“). Mängel nur bei Attribution (Fuchs statt „DWD“, A4), Einschränkung auf „typisch“ (A10) und Quellenzeile (A5). |
| (d) Meinungs- vs. Primärquellen | überwiegend bestätigt | Interview als Meinungsquelle gekennzeichnet; Verein mit Anliegen gekennzeichnet. Nicht gekennzeichnet: Fuchs‘ Aussagen sind eine Einschätzung im Interview, keine DWD-Veröffentlichung; Interview und Bericht sind nicht unabhängig (E2). |
| (e) Urheberrecht | bestätigt | Wörtliche Zitate nur kurz: „ganz normal“, „extrem ungewöhnlich“, „sogar als kühl gelten“, „vermutlich eher nach oben als nach unten“ (je höchstens 8 Wörter). Tabellen enthalten Zahlenwerte, keine Textübernahme. |
| (f) Kausalität/Absicht | bestätigt, mit Hinweis | Das Kapitel trennt „dass“ und „warum“ und schließt Absicht ausdrücklich aus. Rest: „Die Mediendebatte“ stellt Todeszahlen und Klima-Minuten nebeneinander; das Kapitel erklärt den Zusammenhang nicht kausal. Der Abschnitt über Frankreich/UK/Spanien ohne Beispiel-Hinweis (Nr. 46) wirkt belastbarer als die Quelle. |
| (g) Datenstände | bestätigt | DWD Stand 2.9.2026 (Datei am 23.10. unverändert), RKI Stand 24.9.2026 (KW 37, Seite live bestätigt). Datumsangaben im Kapitel durchgehend ausgewiesen. |
| (h) Tabellenwerte Zeile für Zeile | bestätigt | Temperaturtabelle: 3 Zeilen, je Normalwert, Abstand, SD, Einstufung gegen [1] und Analysebericht. Medientabelle: 8 Werte gegen Bericht Kap. 2.1 und 4. Keine Abweichung in den Zahlen. |
| Rechnerische Konsistenz der Differenzen | bestätigt | 19,6 minus 16,3 = 3,3; minus 17,6 = 2,0; minus 18,5 = 1,1. |
| Linkziele | teilweise | [1], [3], [5] Slug und Titel stimmen mit den Referenzfassungen; [4] RKI-Seite live mit passendem Inhalt; [8] PDF laut früherem Faktencheck (Inhalt nicht per WebFetch lesbar; lokale Textkopie stimmt zu Titel/Inhalt); [7] 403. Kein Linkziel mit falschem Artikel gefunden. |

## 4. Auflagen (vor Freigabe zu erfüllen)

Reihenfolge nach Gewicht. Keine Änderung wurde in der Datei vorgenommen.

1. **A1 (gewichtig), Abschnitt „Die Mediendebatte“, Absatz 2:** „Das Verfahren trifft nach eigenen Angaben zu 94 Prozent richtig und findet 89 Prozent aller Klima-Minuten.“ Ersetzen durch die Fassung von [5]: „Nach eigenen Angaben sind 94 Prozent der gezählten Minuten tatsächlich Klima-Minuten, und das Verfahren findet 89 Prozent aller Klima-Minuten.“ Begründung: Precision/Accuracy-Verwechslung, bereits in der Vorprüfung beanstandet.
2. **A7 (gewichtig), zwei Stellen:**
   - Abschnitt „Hitzetote“, Absatz 1, letzter Satz („... etwa 4,5 Standardabweichungen über dem Referenzbereich, in allen acht vorab festgelegten Sensitivitätsanalysen“): trennen, z. B. „... lag mit 15.800 etwa 4,5 Standardabweichungen über dem Referenzbereich. Auch in allen acht vorab festgelegten Sensitivitätsanalysen lag der Wert außerhalb des jeweiligen Prognoseintervalls.“
   - „Was heißt das für dich?“, Punkt 2: „Die Größenordnung (mehrere Tausend über der bisherigen Bandbreite) war über alle unsere Prüfungen stabil; die einzelne Zahl ist es nicht.“ Ersetzen, z. B. durch „Die Richtung blieb in allen acht Sensitivitätsanalysen gleich: Der Wert lag außerhalb der jeweiligen Bandbreite. Die einzelne Zahl ist es nicht: Sie hat eine Spanne und kann sich noch ändern.“ „mehrere Tausend“ streichen (neue Differenzbildung, kein Artikelwert).
3. **A6, Abschnitt „Hitzetote“, Absatz 1:** „Im Mittel der Jahre 1992 bis 2025 gab es rund 2.955 ...“ ändern in „Das Referenzmodell ergibt für die Jahre 1992 bis 2025 einen Mittelwert von rund 2.955 hitzebedingten Sterbefällen pro Jahr“. „höchstens rund 8.700“ ändern in „bis rund 8.700 (Obergrenze des 95-Prozent-Prognoseintervalls)“. Zusätzlich ein Halbsatz zur Pflichtkennzeichnung aus [3]/SAP 5.3: Die Verteilung der Jahreswerte ist rechtsschief, das Modell passt nicht perfekt, die Untergrenze des Intervalls ist rechnerisch negativ.
4. **A11, Abschnitt „Hitzetote“, Aufzählungspunkt „Methodik im Wandel“, letzter Satz (2018):** Aussage anpassen und aus „Methodik im Wandel“ herauslösen oder neutral formulieren, z. B. „Die in unserem Analyseplan genannte Vergleichszahl 9.400 für 2018 ließ sich in keiner RKI-Veröffentlichung bestätigen; die aktuelle RKI-Ausgabe nennt rund 8.500. Woher die 9.400 stammen, ist ungeklärt.“ Begründung: run_log Schritt 5c; „Verwechslung in einer Sekundärquelle“ ist nicht belegt. Hinweis: [3] enthält dieselbe Behauptung; das Buch sollte den Befund nicht fortschreiben, sondern korrekt fassen. Der Fall kann für Kapitel 8 (Korrekturen) relevant sein; Entscheidung Daniel Saure.
5. **A10, Abschnitt „Temperatur“, Absatz 3, letzter Satz:** „Die Aussage des DWD zu ‚in 30 Jahren‘ steht damit nicht im Widerspruch zum Messtrend.“ ergänzen um die Bedingung: „... wenn ‚normal‘ als ‚typischer Sommer‘ verstanden wird (2056 liegt im Intervall 2038 bis 2075)“. Gilt ‚normal‘ als ‚nicht mehr ungewöhnlich‘, liegt der Zeitpunkt früher (um 2033). Optional: Spanne der Sensitivitätsanalysen (typischer Sommer zwischen 2045 und 2058, obere Intervallgrenze bis 2112 je nach Zeitraum) aus [1] ergänzen.
6. **A2, Abschnitt „Die Mediendebatte“, Absatz 3 (Das Erste, Juni-Hitzewelle) und Absatz 4:** (a) ergänzen: „Vorher gab es nur einzelne Randerwähnungen.“ (b) Nach dem Satz zu Frankreich/UK/Spanien ergänzen: „Der Bericht belegt das mit ausgewählten Beispielen aus dem Programm.“ (c) In Absatz 4 „der Bericht untersucht nur zwei Sender“ präzisieren: „Die Klima-Minuten-Reihe betrifft nur zwei Sender ...; der Auslandsvergleich beruht auf ausgewählten Beispielen aus Sendern weiterer Länder.“
7. **A3, Abschnitt „Die Behauptung“, erster Satz:** „Im Spätsommer 2026 hieß es in der politischen Debatte, der Sommer sei ‚ganz normal‘ gewesen“ anpassen an [1]: „In der politischen Debatte wurde der Sommer 2026 manchmal als ‚ganz normal‘ bezeichnet, auch mit dem Hinweis, früher sei es schon heiß gewesen.“ „Spätsommer“ streichen oder durch den Zeitbezug aus [1] („in den Wochen vor dem 11. September“) ersetzen.
8. **A4, Abschnitte „Die Behauptung“ und „Lagen wir richtig?“ (Punkt „Nicht geprüft“):** Aussagen dem Sprecher zuordnen: „Tobias Fuchs, Leiter des Geschäftsbereichs Klima und Umwelt beim DWD, sagte im Interview mit klimareporter° (8.9.2026) ...“ statt „der DWD sah es differenzierter“ / „die Aussage des DWD“. Das Wort „differenzierter“ streichen oder belegen (Wertung).
9. **A5, Quellenliste:** [2] vollständig angeben (Autor Joachim Wille, Titel „In 30 Jahren könnte dieser Sommer normal sein“, klimareporter°, 08.09.2026, URL https://klimareporter.de/erdsystem/in-30-jahren-koennte-dieser-sommer-normal-sein) und den internen Zusatz „Primärquelle für das Buch noch nicht geöffnet“ entfernen (am 23.10. ist das Interview geöffnet und die Zitate bestätigt). [6]: DOI https://doi.org/10.25646/13135 ergänzen. [7]: Titel „Warum ignoriert die ARD die Klimakrise?“ ergänzen.
10. **A8, Abschnitt „Hitzetote“, Absatz 2 (und ggf. „Kurz gesagt“):** Zeitraum des RKI-Werts nennen („kumuliert für KW 15 bis 37, also April bis September, nicht nur Juni bis August“). Begründung: Der Temperaturteil meint Juni–August, die RKI-Zahl das Sommerhalbjahr; ohne Hinweis werden beide Teile als derselbe „Sommer“ gelesen.
11. **A12, „Was heißt das für dich?“:** (a) Punkt 1: „und beides stimmt“ ersetzen durch „Beide Einstufungen folgen aus derselben Messung; sie unterscheiden sich im Maßstab.“ (b) Punkt 2: „werden noch revidiert“ ersetzen durch „sind vorläufig und können sich noch ändern“. (c) Punkt 3: „ist ... belegt“ ersetzen durch „zeigt die Studie eines Vereins mit klarem Anliegen für diese zwei Sender“.
12. **A13, „Lagen wir richtig?“, Punkt „Wie es weitergeht“:** kennzeichnen als geplant und noch nicht eingefroren: „... gehört zu den vier Zielgrößen, die wir für das Prognose-Register 2027 planen; der Analyseplan ist noch nicht eingefroren, Termine können sich verschieben (siehe Kapitel 10).“ Termin „Januar 2027“ vor Druck gegen den dann gültigen SAP-Stand abgleichen.
13. **A9 (Empfehlung statt Pflicht), „Temperatur“, Absatz 2:** „Gemessen an 1991–2020 war nur 2003 wärmer“ klarstellen: „... war innerhalb dieser 30 Jahre kein Sommer wärmer; über die ganze Reihe war nur 2003 wärmer.“ (Rang 2 gilt über die gesamte Reihe seit 1881.)
14. **A14, Redaktion:** Kopfzeile „ENTWURF v0.1 ... nicht geprüft, nicht freigegeben“ und die Herkunftstabelle sind vor Satz/Export zu entfernen (laut Kapitelkopf vorgesehen); Zählung der Wörter gegen Vorgabe der Gliederung (1.200–1.600) vom Redaktionsteam prüfen, vom Faktenprüfer nicht gezählt.

### Empfehlungen (nicht zwingend)

- **E1:** Absatz „Hitzetote“: zu „3 Einschränkungen“ ergänzen, dass die RKI-Schätzung KW 37 die letzte der Saison ist, aber nicht die endgültige Jahresschätzung (steht bereits in „Noch offen“; ein Querverweis genügt).
- **E2:** Hinweis, dass Interview und MedienKlimaBericht nicht unabhängig voneinander sind (der Bericht zitiert Döschner, Kap. 4 und Fn. 7; das Interview zitiert den Bericht).
- **E3:** Eigeninteresse des Vereins (Bericht S. 14: Forderung eines festen Sendeplatzes für ein Format des Vereins) benennen statt nur „klares Anliegen“.
- **E4:** „Attribution ... [3][5]“: [3] streichen (nur [5] nennt die Studie).
- **E5:** In „Woher wir das wissen“ erwähnen, dass beide Validierungsberichte Auflagen enthielten, die umgesetzt wurden (Transparenz; bisher steht nur „unabhängig validiert“).
- **E6:** Zu „8 der 55 ... jedes siebte“ den Analysebericht-Hinweis ergänzen, dass die Verteilung rechtsschief ist und eine Normalannahme die Häufigkeit unterschätzen würde; oder „also“ durch „das entspricht“ ersetzen.

## 5. Gesamturteil: **ok mit Auflagen**

Keine Zahl ist nachweislich falsch; alle Tabellenwerte (Temperatur und Medien), die RKI-Angaben (16.000, 14.400 bis 17.600, KW 37, Stand 24.9.), die DWD-Angaben (19,6 °C, Rang 2, Stand 2.9.) und die Fuchs-Zitate stimmen mit den Primärquellen. „Kritisch“ ist kein Punkt. Das Urteil lautet dennoch nicht „ok“, weil (1) die Formulierung der Precision (Nr. 42) in das Kapitel zurückgekehrt ist, (2) der Baustein „Was heißt das für dich?“ eine Größenordnungsaussage (Nr. 51) trifft, die weder in den Artikeln noch in den Sensitivitätsanalysen steht und als neue Inferenz zu werten ist, (3) mehrere Formulierungen (Mittel 2.955, „höchstens“ 8.700, 4,5 SD in allen acht Analysen, 2018-„Verwechslung in einer Sekundärquelle“, DWD-„nicht im Widerspruch“ ohne Einschränkung auf „typisch“) präziser sind als die Quellen es tragen oder weniger präzise als der Analysebericht, und (4) der Quellenvermerk [2] noch einen internen Hinweis enthält. Der Baustein „Lagen wir richtig?“ gibt die Erwartung „vermutlich eher nach oben“ und die Änderung 15.800 auf 16.000 korrekt und ohne Überhöhung als Treffer wieder.

Zahl der Auflagen: **14** (davon 2 gewichtig: A1 und A7; A9 ist als Empfehlung innerhalb der Liste geführt). Zusätzlich 6 Empfehlungen.

Eine Nachprüfung nach Einarbeitung ist als eigene Datei festzuhalten (z. B. als „Nachtrag 1“ in dieser Datei).

## 6. Was nicht geprüft werden konnte

- **Treibhauspost #125 (Döschner-Interview):** HTTP 403 am 23.10.2026. Titel, Datum, Ausgabe, Aussagen zu Hitze/Dürre/16.000/MedienKlimaBericht nur gegen [5] und den früheren Faktencheck geprüft. Die Prüfung am Originaltext durch Daniel Saure (17.10.) ist nur als Chat-Aussage in Nachtrag 2 des früheren Faktenchecks wiedergegeben; ein eigener Nachweis als Datei liegt dem Faktenprüfer nicht vor.
- **MedienKlimaBericht-PDF online:** Per WebFetch nicht lesbar (PDF); geprüft wurde die lokale Textkopie. Dass die Textkopie dem Online-PDF entspricht, wurde nicht verglichen.
- **Precision/Recall-Quelle (Media Perspektiven 2022):** nicht geöffnet; nur über Bericht Fn. 12–13 („ebd.“) belegt.
- **RKI-Epidemiologisches Bulletin 19/2025:** nur über früheren Faktencheck (Nachtrag 2) und `eb19.txt`-Verweis abgedeckt; online-PDF nicht lesbar.
- **Validierungsberichte der Sommer-Analyse und der Hitzesommer-Analyse:** nur Kopf und Priorität 1 gelesen, nicht vollständig. Die Aussage „Kernzahlen unabhängig validiert“ stützt sich auf Gesamturteile in den Kopfzeilen.
- **Analysebericht der Hitzesommer-Analyse:** nicht vorhanden/nicht gelesen; Zahlen aus run_log und SAP-Auszügen im Validierungsbericht.
- **SAP Prognose-Register 2027 (Punkt 59):** nicht geöffnet; nur gegen `gliederung_kap07-10.md` abgeglichen.
- **Originalwerte der RKI-Reihe 1992–2025:** 2.955 und 8.671 gegen run_log und Validierungsbericht geprüft, nicht neu aus Rohdaten berechnet (keine Rechnung durch den Faktenprüfer; laut Validierungsbericht unabhängig nachgerechnet).
- **DWD-Pressemitteilung** (19,6 °C, Rang 2) nicht direkt geöffnet; über Analysebericht (Integritätscheck) und Rohdatei-Abruf (19,55) abgedeckt.
- **GitHub-Ordner:** Inhaltsliste gesehen (WebFetch-Hinweis „View all files“: Liste kann unvollständig sein); Dateiinhalte nicht geöffnet.
- **Wortzahl und Umfang** des Kapitels nicht gezählt.

---

## Nachtrag 1 (Nachprüfung nach v0.2)

**Geprüft:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/01-sommer.md`, v0.2 (23.10.2026, Commit c5c9a36 laut Auftrag; Commit selbst nicht eingesehen). Datei nicht verändert. Zeilenangaben „Z.“ beziehen sich auf v0.2.
**Prüfdatum:** 23.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). **Dieser Nachtrag enthält keinen Freigabevermerk.**
**Zusätzlich herangezogen:** Analysebericht und Validierungsbericht (vollständig, Nachträge 1–3) der Sommer-Analyse; Validierungsbericht Hitzesommer (vollständig inkl. Nachtrag 29.08.); run_log Hitzesommer (aus Erstprüfung); MedienKlimaBericht-Textkopie (Zeilen 411–555); klimavoracht.de (WebFetch 23.10.2026).

### N1.1 Status der Auflagen A1 bis A14

| Auflage | Status | Textstelle in v0.2 | Prüfhinweis |
|---|---|---|---|
| A1 Precision | **erfüllt** | Z. 44: „Nach eigenen Angaben sind 94 Prozent der gezählten Minuten tatsächlich Klima-Minuten, und das Verfahren findet 89 Prozent aller Klima-Minuten.“ | Entspricht Bericht Anhang A (Precision 94 %, Recall 89 %) und [5]. Quellenverweis steht erst am Folgesatz ([5][8]); vertretbar. |
| A2 Randerwähnungen, Beispiele, Sender | **erfüllt** | Z. 53: „vorher gab es nur einzelne Randerwähnungen“; „Der Bericht belegt das mit ausgewählten Beispielen aus dem Programm“. Z. 55: „Die Klima-Minuten-Reihe betrifft nur Das Erste und ZDF ..., und der Auslandsvergleich beruht auf Beispielen aus den beiden Hitzephasen [5]“ | Bericht Kap. 3.3 (drei Randstellen), Anhang A („exemplarisch ausgewählt“) bestätigt. Wortlaut folgt [5]. |
| A3 „manchmal“, Spätsommer | **erfüllt** | Z. 10: „... in den Wochen vor dem 11. September manchmal als ‚ganz normal‘ bezeichnet, auch mit dem Hinweis, früher sei es schon heiß gewesen.“ | Deckt sich mit [1] (veröffentlicht 11.9., „vergangene Wochen“). |
| A4 Fuchs statt DWD | **erfüllt** | Z. 10 (Name, Funktion, Interview, Datum 8.9.2026); Z. 24 „Die Aussage von Fuchs“; Z. 67 „Die Aussage von Fuchs ... ‚sogar als kühl gelten‘“; „differenzierter“ gestrichen | Funktion wie im Interview/Analysebericht („Leiter des Geschäftsbereichs Klima und Umwelt“). Paraphrase „in 30 Jahren könnten wir ihn eher als normal betrachten“ entspricht dem Interview-Wortlaut. |
| A5 Quellenliste [2], [6], [7] | **erfüllt** | Z. 79 ([2]: Autor Joachim Wille, Titel, Fuchs, 08.09.2026, URL; Vermerk „noch nicht geöffnet“ entfernt), Z. 83 ([6] mit DOI), Z. 84 ([7] mit Titel) | [2]: Interview, Autor, Datum am 23.10. live bestätigt; Überschrift laut Analysebericht (Ä5) vom Analysten am 11.9. wörtlich geprüft. [6]: DOI-Weiterleitung laut früherem Faktencheck (Nachtrag 2) geprüft, heute nicht erneut geöffnet. [7]: Titel stimmt mit [5]; Link weiterhin 403. |
| A6 Mittelwert, Obergrenze, Rechtsschiefe | **erfüllt** | Z. 28: „Das Modell ergibt ... einen Mittelwert von rund 2.955 ...; ein normales Jahr läge nach dem Modell bei bis zu rund 8.700 (Obergrenze des 95-Prozent-Prognoseintervalls) ... Die Jahreswerte sind rechtsschief verteilt, das Modell passt deshalb nicht perfekt; die Untergrenze des Intervalls ist rechnerisch negativ ...“ | Entspricht [3] und run_log (mu_hat 2955,28; PI [−2760; 8671]). Der Satz „Für die Kernaussage ändert das nichts, denn schon die Obergrenze liegt weit unter dem Wert von 2026 [3]“ ist in [3] wörtlich angelegt. |
| A7 acht Sensitivitätsanalysen, keine „mehrere Tausend“ | **teilweise** | Z. 28: „Auch in allen acht vorab festgelegten Sensitivitätsanalysen lag er außerhalb des jeweiligen Prognoseintervalls [3].“ Z. 60: „Die Richtung blieb in allen acht Sensitivitätsanalysen gleich: Der Wert lag außerhalb der jeweiligen Bandbreite.“ | Neue Inferenz („mehrere Tausend“, „Größenordnung“) ist entfernt; 4,5 SD ist vom Satz mit den acht Analysen getrennt. **Rest:** Laut run_log hat S7 (Leave-one-out) keine eigene Klassifikation für 2026; klassifizierbar sind 13 Varianten aus S1–S6 und S8. „Außerhalb des jeweiligen Prognoseintervalls“ gilt also nicht wörtlich für alle acht. Der Vorschlag in meiner Erstprüfung hatte diese Formulierung selbst nahegelegt; [3] sagt nur „alle robust in derselben Richtung“. Siehe N1. |
| A8 Zeitraum KW 15–37 | **erfüllt** | Z. 6 („im Sommerhalbjahr“); Z. 30: „kumuliert für die Kalenderwochen 15 bis 37, also etwa April bis Mitte September und nicht nur Juni bis August“ | RKI-Seite (23.10.): „KW 15 bis KW 37/2026“, KW 37 = 07.–13.09. KW 15 beginnt am 6.4.2026 (Kalenderumrechnung, in den Quellen nicht ausgeschrieben; „etwa April“ ist korrekt). Zulässig, keine Berechnung im Sinne neuer Zahlen. |
| A9 2003-Satz | **erfüllt (Kapitelfassung ist besser als mein Vorschlag)** | Z. 22: „Von den Sommern 1991 bis 2020 war nur 2003 wärmer, und über die ganze Reihe seit 1881 kein weiterer [1].“ | Geprüft: 2003 liegt in 1991–2020 (Datei 19,67 gegenüber 19,55; Validator Nachtrag 1: „Jahre 1991–2020 wärmer als 19,55 °C: nur 2003“). 2026 ist Rang 2 von 146 seit 1881 (Integritätscheck Analysebericht; Validator „Rang 2 von 146“), also kann kein weiterer Sommer wärmer sein. Mein Vorschlag „innerhalb dieser 30 Jahre kein Sommer wärmer“ war falsch, da 2003 selbst in der Periode liegt. Die Kapitelfassung stimmt. Minimaler Vorbehalt: „wärmer“ bezieht sich auf 2026 und ist im Satzkontext ohne Nennung lesbar. |
| A10 „in 30 Jahren“ | **erfüllt** | Z. 24: „... steht damit nicht im Widerspruch zum Messtrend, wenn ‚normal‘ als ‚typischer Sommer‘ verstanden wird: Um 2056 liegt im Intervall von 2038 bis 2075. Versteht man darunter ‚nicht mehr ungewöhnlich‘, ist es früher so weit (um 2033). Mit anderen Trendzeiträumen und Modellen liegt das Jahr des typischen Sommers zwischen 2045 und 2058, die obere Intervallgrenze reicht je nach Zeitraum bis 2112 [1].“ | Zahlen einzeln geprüft: 2056 (= 2026 + 30, in [1] genannt), 2038–2075 (Primär), 2033 (2023–2049, steht im Satz davor), 2045–2058 (Analysebericht: S3 2045 bis S4 2058, Punktschätzer), 2112 (S1 1991–2025, E2a; Validator 2111,69). Die obere Grenze 2112 gehört zu E2a („Jahr des typischen Sommers“); die Zuordnung ist korrekt (Validator H-R3). Sprachlich holprig: „Um 2056 liegt im Intervall“ (siehe E7). |
| A11 9.400-Punkt | **teilweise** | Z. 36: „Eine Vergleichszahl blieb ungeklärt. Die in unserem Analyseplan genannte Vergleichszahl 9.400 für 2018 ließ sich in keiner RKI-Veröffentlichung bestätigen; die aktuelle RKI-Ausgabe nennt rund 8.500. Woher die 9.400 stammen, ist ungeklärt (Prüfprotokoll: `Analysen/2026-08-hitzesommer-2026/run_log.txt`).“ | Inhalt gedeckt durch run_log Schritt 5c und Validierungsbericht Priorität 5 (8.500 in EB-19-2025; Herkunft „ausdrücklich unbestätigt“); Pfad existiert im öffentlichen Repo. **Reste:** „keiner RKI-Veröffentlichung“ ist weiter als der Befund („keine der drei geprüften RKI-Ausgaben“, N3); Aufzählung trägt die Überschrift „Drei Einschränkungen“, ist jetzt der vierte Punkt (N2); der Satz widerspricht der in [3] veröffentlichten Aussage („Verwechslung in einer Sekundärquelle“), ohne das zu sagen (N4). |
| A12 „Was heißt das für dich?“ | **erfüllt** | Z. 59: „Beide Einstufungen folgen aus derselben Messung; sie unterscheiden sich im Maßstab.“ Z. 60: „vorläufig; sie können sich noch ändern“. Z. 61: „zeigt die Studie eines Vereins mit klarem Anliegen für diese zwei Sender“ | „und beides stimmt“, „werden noch revidiert“, „belegt“ entfernt. Z. 61 „in weniger Sendeminuten vorkam als in den Vorjahren“ entspricht der Tabelle (Halbjahr 2026 gegen Jahre 2023–2025). |
| A13 Prognose-Register | **erfüllt** | Z. 68: „... gehört zu den vier Zielgrößen, die wir für das Prognose-Register 2027 planen. Der Analyseplan ist noch nicht eingefroren, Termine können sich verschieben (siehe Kapitel 10).“ | Entspricht `gliederung_kap07-10.md` (Zielgrößen, SAP Entwurf). SAP selbst nicht geöffnet; Stand (draft) laut Commit-Log „SAP Prognose-Register 2027 v0.3 (draft)“. Zum Stichtag 15.11. erneut abgleichen. Der Monat „Januar 2027“ ist entfallen; das ist unkritisch. |
| A14 Kopfzeile/Herkunftstabelle | **teilweise (bewusst offen bis Export)** | Z. 1–2 und Z. 89–100 | Beide Blöcke stehen in v0.2 noch mit dem Hinweis „nicht ins Buch übernehmen“; das ist als Zwischenstand nachvollziehbar. Die Herkunftstabelle ist inzwischen **veraltet**: Sie nennt „Satz ‚beides stimmt‘“ und „Aussage ‚Größenordnung über alle Prüfungen stabil‘“, die es in v0.2 nicht mehr gibt (N5). Wortzahl nicht geprüft. |

### N1.2 Status der Empfehlungen E1 bis E6

| Empfehlung | Status | Textstelle | Verändert sie die Aussage? |
|---|---|---|---|
| E1 Verweis „letzte der Saison, nicht endgültig“ | aufgenommen | Z. 30 letzter Satz | Nein; in [5] angelegt („Auch die RKI-Schätzung zum Saisonende ist noch keine endgültige Jahresschätzung“). |
| E2 Interview und Bericht nicht unabhängig | aufgenommen | Z. 44: „Der Bericht zitiert Döschner, das Interview den Bericht [5][8].“ | Ja, ergänzt eine Wertung („nicht unabhängig voneinander“). Gedeckt: Bericht Kap. 4 zitiert Döschner mit Fn. 7 (Brandmelder-Beitrag „Stiller Tod und lautes Schweigen“, 29.06.2026, **nicht** das Treibhauspost-Interview); [5] nennt den Bericht als Beleg des Interviews. Die Kurzform „zitiert Döschner“ ist richtig, verschweigt aber, dass es ein anderer Text Döschners ist. Siehe N6. |
| E3 Eigeninteresse des Vereins | aufgenommen (formuliert abweichend von meiner Fassung) | Z. 44: „... fordert in dem Bericht einen festen Sendeplatz für ein Format, wie er es selbst produziert“ | Ja, es kommt eine Tatsachenaussage hinzu. Bericht Z. 496–499: Lehrmaterial des Experiments war „eine KLIMA° vor acht-Sendung“; „Es braucht deshalb kein neues Rezept, sondern die Entscheidung, einem solchen Format endlich einen festen Sendeplatz zu geben.“ Der Bericht fordert den Sendeplatz für „ein solches Format“ (kurze, fundierte Klimaformate), benennt als Beispiel die eigene Sendung. **Dass der Verein das Format selbst produziert**, steht im Bericht nicht ausdrücklich; es folgt aus klimavoracht.de („Der Verein KLIMA° vor acht hat drei neue Folgen produziert“, geprüft 23.10.). Gedeckt, aber nicht durch [5][8]. Siehe N7. |
| E4 [3] bei Attribution streichen | aufgenommen | Z. 38: Attributionssatz nur mit [5] | Nein. Der Satz „... eine Studie dazu, auf die der MedienKlimaBericht verweist, haben wir nicht geprüft [5]“ entspricht [5]. |
| E5 Auflagen in Validierungsberichten erwähnen | aufgenommen | Z. 72: „die Validierungsberichte beider Analysen enthielten Auflagen, die umgesetzt wurden [1][3]“ | Ja, ergänzt eine Tatsachenaussage. Hitzesommer: Auflagen 1–4 laut Nachtrag 29.08. „bestanden“, Gesamturteil „final“, [3] nennt „zwei Auflagen-Runden“: gedeckt. Sommer: AV1–AV8, AV10 und AV11 laut Validator-Nachträgen 1–3 umgesetzt; **AV9** (DWD-Originaldatei) im letzten Validator-Nachtrag (Nachtrag 3, 11.09.) weiterhin offen; der Analysebericht vermerkt AV9 als erledigt (Selbstauskunft, Prüfsummen byte-gleich), eine Bestätigung durch den Validator ist in dem von mir gelesenen Bericht nicht vorhanden. Zitierweise [1][3] trägt den Satz nicht (siehe N8). |
| E6 „also“ durch „das entspricht“ | aufgenommen | Z. 22: „das entspricht einem warmen Sommer, wie er etwa jedes siebte Jahr vorkam [1]“ | Nein; entschärft die Schlussfolgerung. Der Hinweis auf Rechtsschiefe (Alternative in E6) wurde nicht aufgenommen, ist nicht erforderlich. |

### N1.3 Prüfung neu eingefügter oder geänderter Sätze (als neuer Entwurf)

| Nr. | Satz in v0.2 | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | Z. 6 „im Sommerhalbjahr“ | RKI (KW 15–37), run_log Schritt 2 („Sommerhalbjahr, kumulativ KW15 bis ...“) | bestätigt | |
| 2 | Z. 10 Einleitungssatz mit Fuchs | [1], Interview live | bestätigt | Paraphrase von „könnte es allerdings sein, dass wir ihn eher als normal betrachten“ als „könnten wir ihn eher als normal betrachten“ ist sinngleich; „[1][2]“ passend. |
| 3 | Z. 22 2003/Reihe seit 1881 | [1], Analysebericht, Validator | bestätigt | Siehe A9. |
| 4 | Z. 22 „8 der 55 ... das entspricht ... jedes siebte Jahr“ | [1], Analysebericht (8/55 = 14,5 %) | bestätigt | |
| 5 | Z. 24 neuer Absatzteil zu 2056 usw. | [1], Analysebericht | bestätigt | Siehe A10. Der Analysebericht (und Validator AV3) halten fest: 19,6 °C liegt 2056 auch nach E2b innerhalb Trend ± 1 SD; das Kapitel sagt nicht das Gegenteil (es sagt nur, dass „nicht mehr ungewöhnlich“ früher erreicht wird). Meine Erstprüfung (Nr. 22) war an dieser Stelle strenger, als der Validator es war; die v0.2-Fassung ist aber in jedem Fall zutreffend. |
| 6 | Z. 28 Mittelwert/Obergrenze/Schiefe | [3], run_log | bestätigt | Siehe A6. Hinweis: „Die Jahreswerte sind rechtsschief verteilt“ steht so in [3]; der Shapiro-Wilk-Test lief laut run_log auf den studentisierten Residuen. Geringfügig, durch [3] gedeckt. |
| 7 | Z. 28 „Auch in allen acht ... lag er außerhalb des jeweiligen Prognoseintervalls [3]“ | [3], run_log | Abweichung (gering) | Siehe N1. |
| 8 | Z. 30 Zeitraum, „Die Schätzung aus KW 37 ist die letzte der Saison, aber nicht die endgültige Jahresschätzung“ | RKI-Seite, [5] | bestätigt | |
| 9 | Z. 36 9.400-Punkt | run_log 5c, Validierungsbericht Prio 5 | bestätigt, mit Abweichungen | Siehe N2, N3, N4. |
| 10 | Z. 38 Attribution | [5] | bestätigt | |
| 11 | Z. 44 Verein „fordert ... Sendeplatz ... wie er es selbst produziert“ | Bericht Z. 496–499, klimavoracht.de | bestätigt, mit Hinweis | Siehe E3, N7. |
| 12 | Z. 44 „Der Bericht zitiert Döschner, das Interview den Bericht“ | Bericht Kap. 4/Fn. 7, [5] | bestätigt, mit Hinweis | Siehe E2, N6. |
| 13 | Z. 53 „vorher gab es nur einzelne Randerwähnungen“, „ausgewählten Beispielen“ | [5], Bericht Kap. 3.3, Anhang A | bestätigt | |
| 14 | Z. 55 „Klima-Minuten-Reihe betrifft nur Das Erste und ZDF“ | [5], Bericht | bestätigt | Auslandskorpus (24 Sender, 17 Länder) bleibt unerwähnt, aber der Satz „beruht auf Beispielen“ ist korrekt. |
| 15 | Z. 59–61 („Was heißt das“) | [1], [3], [5] | bestätigt | Die Richtungsaussage in Z. 60 siehe N1. „Die einzelne Zahl ist weniger sicher: Sie hat eine Spanne“ ist eine Wertung ohne Zahl, durch Spanne 14.400–17.600 gedeckt. |
| 16 | Z. 65 „Lagen wir richtig“ unverändert; Z. 66–68 | [3], RKI, [1] | bestätigt | Zitat „vermutlich eher nach oben als nach unten“ wortgleich; „kein registrierter Treffer“ korrekt. |
| 17 | Z. 72 Satz zu Auflagen der Validierungsberichte | Validierungsberichte | Abweichung (gering) | Siehe E5, N8. |
| 18 | Quellen [2], [6], [7] | siehe A5 | bestätigt | |

### N1.4 Neue Befunde mit Änderungsvorschlag

**Neue Auflagen (alle gering, keine kritisch):**

1. **N1, Z. 28 und Z. 60 („in allen acht ... außerhalb des jeweiligen Prognoseintervalls/der jeweiligen Bandbreite“):** Für S7 (Leave-one-out) gibt es laut run_log keine 2026-Klassifikation; klassifiziert sind 13 Varianten aus den übrigen Analysen. Vorschlag Z. 28: „Auch in den acht vorab festgelegten Sensitivitätsanalysen blieb die Richtung gleich: Der Wert lag über dem jeweiligen Referenzbereich [3].“ Vorschlag Z. 60: „Die Richtung blieb in allen acht Sensitivitätsanalysen gleich (oberhalb der Bandbreite) [3].“ Das folgt dem Wortlaut von [3] („alle robust in derselben Richtung“). Hinweis: Dieser Fehler geht auf meinen Vorschlag in der Erstprüfung zurück.
2. **N2, Z. 32–36:** Einleitungssatz „Drei Einschränkungen gehören dazu:“ passt nicht mehr, es folgen vier Punkte. Vorschlag: „Vier Punkte gehören dazu:“ oder den 9.400-Punkt aus der Einschränkungsliste lösen (er ist keine Einschränkung der Aussage, sondern eine Anmerkung zu einer Vergleichszahl).
3. **N3, Z. 36:** „ließ sich in keiner RKI-Veröffentlichung bestätigen“ ersetzen durch „ließ sich in keiner der drei geprüften RKI-Ausgaben (2022, 2023, 2025) bestätigen“. Begründung: Der Befund bezieht sich auf EB 42/2022, EB 26/2023, EB 19/2025 (run_log Schritt 5c; Validierungsbericht Prio 5); es wurden nicht alle RKI-Veröffentlichungen durchsucht. Zusätzlich Quellenverweis anfügen, z. B. „[3]“ (für den Kontext) und das Prüfprotokoll wie bisher.
4. **N4, Z. 36 gegenüber [3]:** Das Kapitel enthält jetzt eine andere Darstellung als der veröffentlichte Artikel [3] („Verwechslung in einer Sekundärquelle“). Das Kapitel sagt nicht, dass [3] diese Erklärung genannt hatte. Entscheidung für Daniel Saure: Entweder in Kapitel 8 „Korrekturen 2026“ aufnehmen (Substack-Artikel [3] enthält eine nicht belegte Erklärung) oder im Kapitel einen Satz ergänzen, z. B. „In unserem Artikel vom 29.8. hatten wir die Abweichung als Verwechslung in einer Sekundärquelle beschrieben; diese Erklärung ist nicht belegt.“ Ohne eine solche Kennzeichnung entsteht ein unmarkierter Widerspruch zu einem veröffentlichten Text.
5. **N7, Z. 44 („Format, wie er es selbst produziert“):** Die Aussage ist durch klimavoracht.de gedeckt (Verein produziert Folgen), nicht durch [5] oder den Bericht. Vorschlag: „... fordert in dem Bericht einen festen Sendeplatz für ein Format, wie es seine eigene Sendung ‚KLIMA° vor acht‘ darstellt [8]“ (Bericht nennt diese Sendung als Lehrmaterial) oder die Aussage mit einer Quelle belegen (klimavoracht.de, abgerufen 23.10.2026) in „Woher wir das wissen“.
6. **N8, Z. 72 („Validierungsberichte beider Analysen enthielten Auflagen, die umgesetzt wurden [1][3]“):** (a) Belegt sind die Auflagen nur durch die Validierungsberichte, nicht durch [1] (nennt keine Auflagen) und nur teilweise durch [3] (nennt „zwei Auflagen-Runden“). Vorschlag: „[1][3]“ durch einen Verweis auf die Validierungsberichte im Repo ersetzen. (b) Für die Sommer-Analyse ist die Umsetzung der Auflage AV9 (DWD-Originaldatei) im Validierungsbericht nicht bestätigt (nur im Analysebericht als erledigt vermerkt). Vorschlag: „... enthielten Auflagen, die bis auf eine Rohdaten-Bestätigung vom Validator als umgesetzt bestätigt sind“ oder, falls der Validator AV9 inzwischen geschlossen hat, den Beleg als Datei nennen. Alternativ neutral: „die Validierungsberichte beider Analysen nannten Auflagen; Umsetzung und Nachkontrollen sind dort dokumentiert.“

**Empfehlungen (nicht zwingend):**

- **E7 (Z. 24):** „Um 2056 liegt im Intervall von 2038 bis 2075.“ sprachlich glätten: „Das Jahr 2056 liegt im Intervall von 2038 bis 2075.“
- **N5 (Herkunftstabelle):** Zeilen „Temperatur“ („Satz ‚beides stimmt‘“) und „Was heißt das für dich?“ („Größenordnung über alle Prüfungen stabil“) an v0.2 anpassen oder die Tabelle ganz entfernen, damit sie beim Gegenlesen nicht auf Sätze verweist, die es nicht mehr gibt.
- **N6 (Z. 44):** „Der Bericht zitiert Döschner“ präzisieren: „Der Bericht zitiert einen früheren Beitrag Döschners im ‚Brandmelder‘ (29.06.2026), das Interview nennt den Bericht als Beleg [5][8].“

### N1.5 Prüfung auf neue Inferenz, Überhöhung und neue Fehler

- **Neue Berechnung:** keine. Die Kalenderumrechnung KW 15–37 in „etwa April bis Mitte September“ (A8) ist eine Datumsübersetzung der RKI-Angabe, keine neue Auswertung.
- **Neue Inferenz/Überhöhung:** „mehrere Tausend“, „Größenordnung ... stabil“, „beides stimmt“, „werden noch revidiert“, „belegt“ sind entfernt. Neu hinzugekommen sind zwei Wertungen: „Interview und Bericht sind nicht unabhängig voneinander“ (E2, gedeckt, siehe N6) und „Format, wie er es selbst produziert“ (E3, durch externe Seite gedeckt, siehe N7). Beide sind als Transparenzhinweise vertretbar, aber über die Kernquellen [5][8] hinaus.
- **Neue Fehler:** keine falschen Zahlen. Formulierungsfehler: S7-Verallgemeinerung (N1, geerbt aus meinem Vorschlag), Zählung „Drei“ (N2), Reichweite „keiner RKI-Veröffentlichung“ (N3), unmarkierter Widerspruch zu [3] (N4).
- **Kernaussagen:** unverändert gedeckt (16.000 mit Intervall, außerhalb der Bandbreite, nicht „warum“). Zitate kurz (Urheberrecht unkritisch).
- **Datenstände:** DWD 2.9.2026 und RKI 24.9.2026 unverändert korrekt; DWD-Datei am 23.10.2026 weiter „erstellt am: 20260902“.

### N1.6 Gesamturteil Nachtrag 1: **ok mit Auflagen**

Von den 14 Auflagen sind 11 erfüllt (A1–A6, A8–A10, A12, A13), 3 teilweise (A7, A11, A14, davon A14 bewusst bis zum Export offen; A11 und A7 mit den Restpunkten N1 bis N4). Die beiden gewichtigen Mängel der Erstfassung (Precision-Formulierung, Größenordnungs-Inferenz) sind behoben. Kein Befund ist kritisch, keine Zahl ist falsch. Es bleiben **6 neue Auflagen geringer Schwere (N1, N2, N3, N4, N7, N8)** und 3 Empfehlungen (E7, N5, N6). N4 braucht eine Entscheidung von Daniel Saure (Umgang mit der in [3] veröffentlichten Erklärung).

Eine weitere fokussierte Nachprüfung der Auflagen N1–N8 ist als eigene Datei oder als „Nachtrag 2“ in dieser Datei festzuhalten (Dokumentationspflicht CLAUDE.md).

### N1.7 Was nicht geprüft werden konnte

- **Commit c5c9a36:** Diff nicht eingesehen (kein Git-Zugriff in dieser Session); geprüft wurde der Dateitext v0.2. Ob es außerhalb der Kapiteldatei Änderungen gab, ist unbekannt.
- **Treibhauspost #125:** weiter nicht prüfbar (403), daher auch nicht, ob das Interview selbst den Bericht nennt (Z. 44 stützt sich auf [5]).
- **Online-PDF des MedienKlimaBericht:** weiter nur die lokale Textkopie geprüft.
- **DOI [6]:** am 23.10. nicht erneut aufgerufen (laut früherem Faktencheck am 17.10. geprüft).
- **Klimareporter-Überschrift:** Wortlaut der Überschrift nur über [1] und den Analysebericht (Prüfung durch den Analysten am 11.9.) belegt; der WebFetch-Auszug bestätigte Interview, Autor, Datum und Zitate, nicht die Überschrift ausdrücklich.
- **Validierungsbericht Hitzesommer / Sommer:** nun vollständig gelesen, aber ob nach dem 11.9. (Sommer) weitere Nachträge zu AV9 existieren, ist mir nicht bekannt.
- **SAP Prognose-Register 2027:** nicht geöffnet.
- **Wortzahl und Umfang** nicht gezählt.
