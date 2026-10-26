# Nachtrag 6 zu `faktencheck_kap01.md` (Nachprüfung der Auflagen, 26.10.2026)

**Form:** Eigene Datei, gedacht als Anhang ans Ende von `pruefung/faktencheck_kap01.md` (nach Nachtrag 5). Grund: Dem Prüfer stand nur ein vollständiges Überschreiben der Datei zur Verfügung (kein Anfüge-Werkzeug); die Prüfdatei ist rund 84.000 Token lang, ein Neuschreiben hätte das Risiko stiller Textänderungen am alten Inhalt getragen. Die Prüfdatei selbst wurde nicht angefasst. Zusammenführen z. B. mit `Get-Content faktencheck_kap01.md, faktencheck_kap01_nachtrag_2026-10-26.md | Set-Content ...` (Entscheidung Redaktion).
**Geprüft:** `Publikationen-oeffentlich/jahrbuch-2026/kapitel/01-sommer.md`, Fassung v0.8 (Kopfzeile: „FREIGEGEBEN durch Daniel Saure am 23.10.2026 für Fassung v0.8, Commit 9ad213d“). Kapitel nicht verändert. Zeilenangaben „Z.“ beziehen sich auf diese Datei.
**Prüfdatum:** 26.10.2026
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). Auftrag: Daniel Saure, 26.10.2026 (dateibasierte Nachprüfung der von der Redaktion eingearbeiteten Auflagen; CLAUDE.md, Dokumentationspflicht für Nachkontrollen). **Dieser Nachtrag enthält keinen Freigabevermerk.**
**Ampel:** GRÜN = umgesetzt wie gefordert; GELB = teilweise; ROT = nicht umgesetzt.
**Grenzen:** `git log -p` / `git diff` sind nicht verfügbar. Der Vergleich „Stilpass/Differenz seit dem Faktencheck“ beruht auf (a) den in den Nachträgen 1–5 wörtlich zitierten Textständen v0.2 bis v0.7, (b) allen Zahlen, Daten, Namen und Quellen im aktuellen Text, (c) den Bildern und dem Skript der Grafiken. Sätze, die in den Nachträgen nicht wörtlich zitiert sind, konnten nicht auf Wortlautänderungen verglichen werden. Netzquellen (DWD, RKI, WWA) wurden in diesem Lauf nicht erneut geöffnet.

## N6.1 Noch nicht nachgeprüfte Auflagen aus Nachtrag 5 (N26–N30) und Empfehlungen E17–E19

| Punkt | Ampel | Textstelle / Bild in v0.8 | Befund |
|---|---|---|---|
| **N26** Linie in Grafik 2 als Prognoseintervall benennen; Linie vor der Beobachtung erklären | GELB | Bild: Etikett „Obergrenze des Prognoseintervalls für ein normales Jahr: rund 8.700“. Z.44: „Die gestrichelte Linie zeigt die Obergrenze des 95-Prozent-Prognoseintervalls für ein normales Jahr, keinen Höchstwert.“ Z.46 folgt danach. Z.42 (Alt-Text): „… Obergrenze eines normalen Jahres“. | Kern erfüllt: Die Linie ist im Bild als „Prognoseintervall“ und in der Bildunterschrift als „keinen Höchstwert“ erklärt, die Erklärung steht vor der Beobachtung zu 1994/2003 (Z.46). Reste (gering): (a) Im Bild fehlt „95-%“ und „normal“ steht weiter im Etikett; (b) der Alt-Text Z.42 trägt noch die beanstandete Formulierung „Obergrenze eines normalen Jahres“ (in N26 ausdrücklich genannt); (c) das Etikett wird im Bild weiter von den Intervallstrichen 1994/2003 durchkreuzt. Siehe N31. |
| **N27** Z.46: Deutung „passt zur Rechtsschiefe“ ersetzen; „höher als diese beiden Jahre“ präzisieren | GRÜN | Z.46: „Auch 1994 und 2003 lagen mit je rund 10.200 über der Linie. Das sind zugleich die höchsten Jahreswerte der Reihe 1992–2025. 2026 liegt deutlich darüber: Schon das untere Ende der Spanne (14.400) liegt höher als die Schätzwerte dieser beiden Jahre und als deren obere Intervallgrenzen (11.400 und 11.600).“ | Gegen `rki_hitzebedingte_sterbefaelle_rohdaten.csv` geprüft: 1994 = 10.200 [8.900; 11.400], 2003 = 10.200 [8.900; 11.600]; 10.200 ist der höchste Wert 1992–2025 (nächster: 2018 = 8.500). Keine Deutung mehr, keine neue Rechnung. |
| **N28** 2026 und 2025 im Bild als vorläufig kennzeichnen; Bildunterschrift ergänzen | GELB (Text GRÜN, Bild teilweise) | Z.44: „1992 bis 2024 sind Saisonschätzungen, 2025 und 2026 sind vorläufig (unvollständige Saison).“ Bild: „2026: 16.000 (vorläufig, KW 15–37) (Spanne 14.400–17.600)“; „2025 vorläufig (KW 15–38)“. | Text und 2026-Beschriftung erfüllt. Rest (gering): Die 2025-Beschriftung steht unter der Achse, getrennt vom Punkt; der offene Kreis ist in der Legende nicht erklärt (so von N28 als Alternative verlangt). |
| **N29** Grafik 3: Titel „sinkt“ ersetzen; 2025-Punkt erklären | GRÜN | Bild: Titel „Der Klima-Anteil im Programm ist seit 2023 gesunken“; Quellenzeile: „2025 liegen beide Sender bei 1,29 %.“ | Acht Werte unverändert (2,2 / 1,95; 1,49 / 1,43; 1,29 / 1,29; 0,95 / 0,82). |
| **N30** WWA-Zeitraum und Region genauer fassen | GRÜN | Z.63: „Sie untersucht die Hitzewelle vom 18. bis 29. Juni (Seite vom 26. Juni) in Frankreich, Deutschland, Italien, Spanien und Südengland. Für Deutschland allein nennt die Seite keine eigenen Zahlen.“ | „Westeuropa“ ist entfallen; Wortlaut wie vorgeschlagen. Seite in diesem Lauf nicht erneut geöffnet. |
| **E17** Gestaltung | GELB | Bild 2: Titel jetzt „deutlich über“ (war „weit“). Bild 1: x-Achse gekürzt (Skript: `xlim = c(1880, 2062)`). | Titel erfüllt. Etikettenposition in Grafik 2 unverändert (Striche kreuzen den Text). Die Kürzung der x-Achse in Grafik 1 hat eine neue Auffälligkeit erzeugt, siehe N32. |
| **E18** Normalwerte als gerundet kennzeichnen | nicht umgesetzt (optional) | Skript: feste Werte 16,3 und 17,6 | Kein Handlungsbedarf, nur Transparenz. |
| **E19** Skript versionieren, Alt-Text/Bildunterschrift prüfen | GELB (optional) | `grafiken/kap01_grafiken.R` im Ordner vorhanden; Alt-Text Z.42 siehe N31 | Skript wurde auch dieses Mal nicht ausgeführt (R nicht verfügbar). |

## N6.2 Stichprobe: Sind die früher als erfüllt bewerteten Auflagen im aktuellen Text noch so umgesetzt?

Alle früheren Auflagen (A1–A14, N1–N25) wurden an der jeweils in den Nachträgen zitierten Textstelle im aktuellen Text wiedergefunden, **unverändert gegenüber dem dort geprüften Wortlaut**: A1/Precision (Z.73), A2 Randerwähnungen/Beispiele/Sender (Z.88, 90), A3 „manchmal“ (Z.10), A4 Fuchs statt „der DWD“ (Z.10, 30, 102), A5 Quellen [2], [6], [7] (Quellenliste), A6/N14/N15 Mittelwert, Obergrenze, Rechtsschiefe (Z.48, 50), A7/N1/N9 „Richtung gleich (oberhalb der Bandbreite)“ (Z.48, 95), A8 KW 15 bis 37 (Z.52), A9 2003-Satz (Z.24), A10/N13 „Konvention“ und „in 30 Jahren“ (Z.16, 30), A11/N2/N3/N4 9.400-Punkt (Z.59), A12/N12 (Z.12, 94–96), A13 Prognose-Register (Z.103), N11 „Hitzetote“ → „hitzebedingte Sterbefälle“ und [8]-Verweise (Z.6, 73, 75), N16 [4] (Z.52), N17 „Wir können nicht ausschließen, dass …“ (Z.58), N18 (Z.107), N19–N25 (Z.63–71). A14 (Kopfzeile, Herkunftstabelle) bleibt bewusst bis Satz/Export offen; die Kopfzeile benennt das selbst.

## N6.3 Verweis auf Kapitel 8, Fall 4 (Vergleichszahl 2018) gegen `08-korrekturen.md`

Z.59 (Kapitel 1): Die Zahl 9.400 stand im Analyseplan; gerechnet wurde mit rund 8.500 (EB 19/2025); in keiner der drei geprüften RKI-Ausgaben (2022, 2023, 2025) bestätigt; mögliche Herkunft: EB 42/2022, obere Grenze des Unsicherheitsintervalls 2019; nicht abschließend geklärt; „In unserem Artikel vom 29. August hatten wir die Abweichung als Verwechslung in einer Sekundärquelle beschrieben. Diese Erklärung ist nicht belegt (mehr dazu in Kapitel 8; Prüfprotokoll …)“.

`08-korrekturen.md`, Abschnitt „4. ‚Der Hitzesommer 2026‘ (Vergleichszahl für 2018)“ und Übersichtstabelle: Vergleichszahl 9.400, „Der Analyseplan nennt sie“, gerechnet mit rund 8.500 (EB 19/2025), Erklärung im Artikel vom 29. August „Verwechslung in einer Sekundärquelle“, „Diese Erklärung ist nicht belegt“, Laufprotokoll Schritt 5c, drei RKI-Ausgaben (2022, 2023, 2025), mögliche Herkunft Bulletin 42/2022 (obere Grenze 2019), „Vermutung, abschließend geklärt haben wir es nicht“, Kernaussage unberührt, Artikel auf Substack „bisher nicht geändert“, „Hier im Buch ist die Sache offengelegt, ebenso in Kapitel 1.“

**Ergebnis: GRÜN, inhaltlich deckungsgleich.** Alle Elemente stimmen wörtlich oder sinngleich überein; kein Widerspruch in Zahlen, Ausgaben, Jahren oder in der Bewertung. Der in Nachtrag 2 (N2.3/N2.7) genannte Vorbehalt „Verweis nur tragfähig, wenn der Fall im Kapitel 8 des Buchs steht“ ist damit erfüllt. Hinweise (keine Auflagen für Kapitel 1):
- Kapitel 8 trägt noch die Kopfzeile „ENTWURF v0.1 … nicht geprüft, nicht freigegeben“; der Text von Fall 4 hat noch eine offene Klammer („Reihenfolge am selben Tag vor Satz klären“) und wiederholt den Satz zu den drei RKI-Ausgaben zweimal im selben Absatz. Das ist Sache des Gates für Kapitel 8.
- Kapitel 8 sagt „kursierte … eine Vergleichszahl“, Kapitel 1 „stand im Analyseplan“; beides ist mit [3] („kursierende Vergleichszahl“) und dem Prüfprotokoll vereinbar.
- Die Aussage in Kapitel 8 „Der Artikel erschien am selben Tag und sprach trotzdem von einer aufgedeckten Verwechslung“ deckt sich mit dem Wortlaut von [3] („aufgedeckt“, siehe Nachtrag 2, N4); die Reihenfolge „am selben Tag“ ist laut Kapitel 8 selbst noch zu klären.

## N6.4 Differenz seit den früheren Prüfständen: Hat sich eine Zahl, Aussage oder Einschränkung verändert?

- **Zahlen, Daten, Namen, Tabellen:** unverändert gegenüber Nachtrag 5: 19,6 °C, Rang 2, 1881; 16,3 / 17,6 / 18,5 mit +3,3 / +2,0 / +1,1 und 4,1 / 2,2 / 1,3 SD; 8 von 55; 0,09; 2051 (2038–2075), 2033 (2023–2049), 2056, 2045–2058, 2112; 2.955, 8.700, 95 %, 15.800, 4,5 SD, acht Sensitivitätsanalysen; 16.000 [14.400; 17.600], KW 15–37, Stand 24.09.2026; 9.400/8.500 mit 2022/2023/2025; 94/89 %; Medientabelle (acht Werte); 29.06.2026; 8., 11. September, 17. Oktober; 26. Juni, 18.–29. Juni. Neu im Text gegenüber v0.6/v0.7: 11.400 und 11.600 (Z.46), geprüft gegen die CSV (siehe N27).
- **Einschränkungen und Modalwörter:** „Konvention“, „vorläufig“, „kann sich noch ändern“, „nach eigenen Angaben“, „manchmal“, „teils“, „nicht belegt“, „möglicherweise“, „geplant“, „noch nicht eingefroren“ stehen unverändert.
- **Neue Berechnung oder Inferenz:** keine gefunden. Die Beschreibung „Das sind zugleich die höchsten Jahreswerte der Reihe“ und der Vergleich mit den Intervallgrenzen sind Ablesungen aus der CSV.
- **Neue unbelegte Aussage:** keine im Text. Siehe aber N31 und N32 (Grafiken).
- **Quellenliste:** unverändert, [9] wie in Nachtrag 5 (N21).

## N6.5 Neue Befunde

1. **N31 (gering), Grafik 2 und Alt-Text Z.42:** Der Alt-Text nennt weiterhin „Obergrenze eines normalen Jahres“; das Etikett im Bild nennt „Prognoseintervall“, aber weder „95-%“ noch „(Referenzmodell)“ und wird von den Intervallstrichen 1994 und 2003 durchkreuzt. Vorschlag Alt-Text: „… mit Unsicherheitsintervall und Obergrenze des 95-Prozent-Prognoseintervalls eines normalen Jahres“. Vorschlag Bild: Etikett um „95-%-“ ergänzen und so setzen, dass es nicht von den Strichen gekreuzt wird. Dazu der Rest aus N28 (2025-Beschriftung am Punkt oder offenen Kreis in der Legende erklären).
2. **N32 (gering), Grafik 1:** Die Beschriftung „Trendwert 2026 (Trend 1971–2025: / 18,5 °C (Raute)“ ist am rechten Bildrand abgeschnitten („…1971–2025“ ohne schließende Klammer und Doppelpunkt). Ursache: Die x-Achse wurde auf `xlim = c(1880, 2062)` gekürzt, der Text mit `xpd = NA` ragt aus dem Bild. Die Zahl 18,5 °C in der zweiten Zeile ist lesbar; die erste Zeile ist unvollständig. Vorschlag: Text nach links verschieben oder umbrechen, Grafik neu rendern und erneut als Bild prüfen.

## N6.6 Gesamturteil Nachtrag 6: **ok mit Auflagen (Reste gering)**

Von den fünf offenen Auflagen aus Nachtrag 5 sind N27, N29 und N30 umgesetzt, N26 und N28 teilweise (Rest: Alt-Text, Etikett, 2025-Beschriftung). Alle früheren Auflagen stehen unverändert erfüllt im Text. Der Verweis auf Kapitel 8, Fall 4, stimmt mit `08-korrekturen.md` überein. Keine Zahl hat sich verändert, keine neue Inferenz oder Berechnung. Zwei neue geringe Auflagen (N31, N32), beide an den Grafiken. Nichts ist kritisch. Diese Reste betreffen Alt-Text und Grafikgestaltung, nicht die Aussagen des Kapitels.

Offen unverändert: A14 (Kopfzeile, Herkunftstabelle, Grafikhinweise vor Satz/Export entfernen); Datenstände zum Stichtag 15.11. (DWD „erstellt am 20260902“, RKI-Seite, WWA-Seite, SAP-Stand Prognose-Register); Treibhauspost #125 als Datei dokumentieren (weiter nur über [5] belegt).

## N6.7 Was nicht geprüft werden konnte

- Git-Diff v0.7 → v0.8 (kein Git-Zugriff); Differenz nur über die zitierten Textstände.
- DWD-Datei, RKI-Seite, WWA-Seite, Treibhauspost, Online-PDF des MedienKlimaBericht in diesem Lauf nicht erneut geöffnet.
- R-Skript nicht ausgeführt; dass das Skript exakt die vorliegenden PNG-Dateien erzeugt, ist nicht nachgewiesen (Bild und Skript stimmen in Werten und Beschriftungen überein).
- Kapitel 8 nur im Abschnitt zu Fall 4 und im Abschnitt „Was wir vor der Veröffentlichung gefunden haben“ verglichen, nicht als Ganzes geprüft.
- Wortzahl nicht gezählt.
