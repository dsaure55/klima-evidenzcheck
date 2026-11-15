# Differenzprüfung Kapitel 10 v0.6 und Kapitel 14 (Jahrbuch 2026 Klima Kompass), 15.11.2026

Gegenstand: nur die geänderten Stellen laut `pruefung/diff_kap10_v06_2026-11-15.diff.txt` (kurz/07-korrekturen.md, kurz/14-quellenverzeichnis.md).
Methode: Live-Abruf der Substack-API (`/api/v1/posts/<slug>`) am 15.11.2026; Kapiteldatei gelesen. Das Abruf-Werkzeug gibt nur Zusammenfassungen und Kurzzitate zurück, der Wortlaut der Hinweise ist daher nur sinngemäß geprüft. Kapiteldateien nicht geändert, kein Freigabevermerk.

## Urteil

ok mit Auflagen. Zähler: 0 kritisch, 0 hoch, 2 mittel, 3 gering.
Alle Aussagen zu "Hinweis seit 15.11." und zum Fall 8 sind live bestätigt. Offen sind eine Konsistenzlücke in Kapitel 14 und ein Umfangsunterschied zwischen dem Live-Hinweis vom 27.08. und der Beschreibung in Fall 6/7.

## Tabelle

| Nr. | Behauptung | Quelle | Ergebnis | Hinweis |
|---|---|---|---|---|
| 1 | Fall 5: Seit 15.11.2026 steht oben im Artikel (21.10.) ein Hinweis mit Datum und Grund | Live /api/v1/posts/zuruck-auf-15-grad-was-der-neue-un | bestätigt | Hinweis "Korrigiert am 15. November 2026"; Grund: 2,8 Grad unverändert statt schlechter, 66-Prozent-Wahrscheinlichkeit fehlte. Deckt sich mit Fall 5. updated_at 15.11.2026 07:27 UTC. |
| 2 | Fall 6: Hinweis seit 15.11. oben im Artikel (27.08.) | Live /api/v1/posts/erreicht-deutschland-sein-klimaziel | bestätigt | Hinweis "Korrigiert am 15. November 2026" ganz oben; Spannen 407–565 und 86–328, ARIMA 182–598 und 16–532, Projektionen 486/207 unverändert. Deckt sich mit Fall 6. |
| 3 | Fall 7: derselbe Hinweis wie bei Fall 6; Arbeitsweise "retrospektiv", explorativ | dito | bestätigt (Kern), Abweichung (Umfang) | Siehe Befund M2. |
| 4 | Fall 8: Im Artikel vom 28.10. ist der Korrekturblock entfernt | Live /api/v1/posts/verfehlt-deutschland-2026-erstmals | bestätigt | Kein Block, kein "Korrigiert am", kein "[Datum]"; Klammern nur Quellenverweise [1] bis [6]. updated_at 15.11.2026 07:28 UTC. Kein sichtbarer Änderungsvermerk, passt zu "nicht gesondert vermerkt". |
| 5 | Fall 8: Im Artikel vom 30.10. steht in der Quellenliste "korrigiert am 15.11.2026" | Live /api/v1/posts/klimabudget-bis-2030-wie-gro-ist | bestätigt | Quelle [5] (27.08.) trägt "corrected on 15.11.2026"; Text "Den Artikel dazu haben wir inzwischen korrigiert [5]" steht, ist jetzt wahr. Kein "[Datum]". |
| 6 | Fall 8: Artikel vom 27.08. trägt seit demselben Tag den Hinweis | siehe Zeile 2 | bestätigt | |
| 7 | Fall 8: Im Prognose-Check vom 12.11. ist der Platzhalter durch den Link ersetzt; "Der Link antwortet" | Live /api/v1/posts/wie-gut-trafen-die-projektionsberichte; GitHub-Verzeichnis | bestätigt | Quelle [3] = https://github.com/dsaure55/klima-evidenzcheck/tree/main/Analysen/2026-10-prognose-check-projektionsberichte; Zeichenfolge "[Link erst nach Push" nicht mehr vorhanden; Verzeichnis lädt (Dateiliste sichtbar). |
| 8 | Fall 8: "Die Änderungen haben wir in den Artikeln nicht noch einmal gesondert vermerkt" | Live 28.10., 30.10., 12.11. | bestätigt mit Vorbehalt | Bei 28.10. und 12.11. kein Vermerk gefunden. Bei 30.10. besteht der einzige sichtbare Vermerk im Quelleneintrag [5] (Datum der Korrektur des 27.08.-Artikels), kein Vermerk zur eigenen Änderung. Passt zur Aussage. |
| 9 | Fall 8 Vergangenheit ("stand", "nannte", "hieß", "endete") für den früheren Zustand | Artikel (aktuell) | nicht prüfbar (früherer Zustand) | Der alte Wortlaut des 28.10.-Blocks, der Quellenzeile und der Platzhalter ist live nicht mehr abrufbar. Beleg liegt nur in `pruefung/abgleich_artikel_2026-10-23_bis_11-12.md` (hier nicht geprüft, außerhalb der Diff-Stellen). |
| 10 | Kap. 10 Quellenzeilen [6], [7]: "korrigiert am 15.11.2026" | Live, siehe Zeilen 1 und 2 | bestätigt | |
| 11 | Kap. 14 [17] (Kap. 6) und Kap.-10-Liste [6], [7]: "korrigiert am 15.11.2026"; Titel und URL stimmen mit Live-Titeln überein | Live | bestätigt | 21.10.- und 27.08.-Titel exakt wie live. |
| 12 | Kein Platzhalter in eckigen Klammern außer den bewusst benannten | kurz/07-korrekturen.md (gelesen) | bestätigt | Im Fließtext nur die in Fall 8 zitierten Platzhalter „[Datum]“ und „[Link erst nach Push und Prüfung auf 200]“ sowie Quellenverweise [1] bis [11]. Der Marker „[Vor Export prüfen …]“ ist aus dem Text entfernt; er erscheint nur noch im Kopfvermerk als Beschreibung der Änderung (Kopfvermerk wird vor Satz entfernt). Kap. 14 nicht vollständig auf Platzhalter durchsucht (nur Zeilen 120 bis 226 gelesen). |
| 13 | Keine neue Berechnung/Inferenz in den geänderten Stellen | Diff | bestätigt | Geändert sind nur Tempus, Datumsangaben und Verweise. Keine neuen Zahlen. |

## Befunde

### M1 (mittel): Kapitel 14, Abschnitt Kapitel 7, ohne den Zusatz
Kap. 14 Kapitel 7 [1] nennt den Artikel vom 27.08. ohne "korrigiert am 15.11.2026", obwohl [7] in der Kap.-10-Liste und [17] in der Kap.-6-Liste ihn jetzt tragen. Dort ist Quelle [1] derselbe Artikel (live korrigiert, das Kapitel stützt sich auf ihn). Inkonsistente Behandlung derselben Quelle. Gleiches gilt vermutlich für weitere Kapitel-Listen und Kurztexte, die den 27.08. oder 21.10. zitieren (andere Kapitel nicht geprüft). Auflage: einheitlich nachziehen oder bewusst begründen.

### M2 (mittel): Umfang des Live-Hinweises vom 27.08. größer als in Fall 6/7 beschrieben
Der Live-Hinweis nennt zusätzlich: (a) die Autokorrelationskorrektur sei immer angewendet worden, obwohl der Plan sie nur bei nachgewiesener Autokorrelation vorsah, (b) Korrekturen an der Beschreibung der Prüfung, (c) ein fehlendes Zeitfenster 2020–2025 (Projektion 287 Mt, bei sechs Werten nicht belastbar). Fall 7 beschreibt dagegen: "Newey-West betrifft im Plan nur den Test der Steigung" und die Spanne falle zu eng aus. Dass der Live-Hinweis dies anders fasst, ist nach der Kurzzusammenfassung wahrscheinlich, aber nicht wörtlich abgeglichen. Die Aussage "derselbe Hinweis wie bei Fall 6" ist damit zutreffend, aber Fall 6/7 bilden nicht den gesamten Inhalt des Hinweises ab. Auflage: Wortlaut des Hinweises manuell gegen Fall 6/7 abgleichen und entscheiden, ob (a) bis (c) im Kapitel genannt oder der Satz "derselbe Hinweis" eingeschränkt wird. Im Zweifel: Abweichung.

### G1 (gering): Titel in Quelle [9]
Kap. 10 [9] nennt "Verfehlt Deutschland 2026 erstmals sein Klimaziel?"; der Live-Titel lautet "Verfehlt Deutschland 2026 erstmals sein Klimaziel? Was die Hochrechnung sagt – und was nicht". Nicht Teil der Diff, aber bei der Prüfung aufgefallen. URL passt.

### G2 (gering): Stand der Liste
Grundsatz und Kurz gesagt führen "Stand 14. November 2026"; Fall 5 bis 8 enthalten Ereignisse vom 15.11. Als Stichtag der Liste vertretbar, ein Satz dazu würde Missverständnisse vermeiden (z. B. "Hinweise gesetzt am 15.11.").

### G3 (gering): Kopfvermerk
Der Kopfvermerk (Vor Satz zu entfernen) enthält noch die veraltete Zeile "Offen sind ... ob die Hinweise auf Substack gesetzt und die Platzhalter ersetzt sind". Intern, aber widerspricht v0.6.

## Interne Konsistenz (Tempus, Kurz gesagt, Grundsatz)
- Fall 5 bis 7: einheitlich "Seit dem 15. November 2026 steht oben im Artikel auf Substack ein Hinweis mit Datum und Grund".
- Fall 8: Vergangenheit durchgängig; "Bisher nichts" und der Marker sind entfernt. "Was stimmt" ("waren", "antwortet") stimmig.
- Kurz gesagt (neun Artikel, acht Fälle, drei weitere Artikel mit Platzhaltern) unverändert und mit der Fall-Liste vereinbar.
- Grundsatz "im Artikel selbst, mit Datum und Grund": für Fall 5 bis 7 live eingelöst; Fall 2 und 4 werden separat offengelegt.
- Fall 4 "Am Artikel nichts geändert, dabei bleibt es" nicht Teil der Diff, Konsistenz mit Grundsatz bleibt Entscheidung von Daniel Saure.

## Nicht geprüft
- Wortlaut der Live-Hinweise nur über Kurzwiedergabe des Abrufwerkzeugs.
- Früherer Zustand der Artikel (Fall 8 Fehlerbeschreibung).
- Andere Kapitel (außer Kap. 14, Zeilen 120 bis 226) auf Zitate des 21.10./27.08.-Artikels.
