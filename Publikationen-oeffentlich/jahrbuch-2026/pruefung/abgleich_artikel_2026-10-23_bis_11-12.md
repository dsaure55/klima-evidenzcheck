# Abgleich veröffentlichte Substack-Beiträge gegen Entwürfe, 23.10. bis 12.11.2026

**Stand der Prüfung:** 14.11.2026. Nur lesend; keine Änderung an Artikeln, Entwürfen oder Jahrbuch-Kapiteln.
**Zweck:** Fortsetzung des Abgleichs für Kapitel 10 (Fehlerliste). Bisher abgeglichen: 16 Beiträge bis 21.10.2026. Hier: die sieben späteren.

## Methode

1. Archiv: `https://klimaevidenzcheck.substack.com/api/v1/archive?sort=new&limit=25` (JSON; `limit=50` und `offset` werden von der API abgelehnt, die Antwort enthielt 23 Einträge, also weniger als das Limit). Datum = `post_date` (UTC; kein Beitrag liegt nahe Mitternacht, das Kalenderdatum ist in MEZ gleich).
2. Veröffentlichte Fassung: je Beitrag `https://klimaevidenzcheck.substack.com/api/v1/posts/<slug>` (`body_html`, in Text umgewandelt, abgerufen 14.11.2026). Feld `updated_at` mit `post_date` verglichen, um nachträgliche Bearbeitungen zu erkennen.
3. Entwurf: `Reports/<datum>-<thema>/kanal-entwuerfe/substack.md` (Stand Arbeitsverzeichnis 14.11.2026, `git log` für lulucf und ausbau geprüft). Beide Texte auf Wortebene normalisiert (Markdown, Links, Kopfzeilen entfernt) und mit `git diff --word-diff` verglichen. Kopf-/Freigabevermerke der Entwürfe und Formatierung zählen nicht als Abweichung.
4. Faktencheck-/Validierungsdateien: Existenz und Gesamturteil in den Dateien selbst nachgesehen (nicht nur in `Redaktion/redaktion.md`).

## Ergebnis je Beitrag

| # | Beitrag (Stufe) | Datum (`post_date`) | URL (Slug) | Text = Entwurf? | Korrektur-/Aktualisierungshinweis im Artikel | Faktencheck-/Validierungsdatei |
|---|---|---|---|---|---|---|
| 1 | Ökostrom: die einfachste Klimaschutzmaßnahme? (Wissen) | 23.10.2026 12:20 UTC | /p/okostrom-die-einfachste-klimaschutzmanahme | Ja, Textkern wortgleich | Nein. `updated_at` = `post_date` | Ja: `Reports/2026-10-23-oekostrom/faktencheck.md` (Gesamturteil, Nachtrag 1, Nachtrag 2) |
| 2 | 58 oder 61,8 Prozent? Warum es so viele Zahlen zum Ökostrom-Anteil gibt (Wissen) | 28.10.2026 12:40 UTC | /p/58-oder-618-prozent-warum-es-so-viele | Ja, Textkern wortgleich | Nein. `updated_at` = `post_date` | Ja: `Reports/2026-10-28-ee-anteil/faktencheck.md` (Gesamturteil, Nachtrag 1, Nachtrag 2) |
| 3 | Verfehlt Deutschland 2026 erstmals sein Klimaziel? (Einordnung) | 28.10.2026 18:04 UTC; nachträglich bearbeitet 30.10.2026 12:58 UTC | /p/verfehlt-deutschland-2026-erstmals | Artikeltext wortgleich zum Entwurf; **zusätzlich ein Korrekturblock am Anfang, der nicht im Entwurf steht** (siehe Befund A) | Ja, aber an falscher Stelle und mit Platzhalter (Befund A) | Ja: `Reports/2026-10-28-klimaziel-2026/faktencheck.md` (Gesamturteil, Nachtrag 1 „Abweichung, nicht mehr kritisch“, Nachtrag 2) |
| 4 | Wie weit ist Deutschlands Landnutzung von der gesetzlichen Senke entfernt? (Evidenzcheck) | 29.10.2026 10:35 UTC | /p/wie-weit-ist-deutschlands-landnutzung | Ja, Textkern wortgleich (Grafiken als Bild, Tabelle siehe Prüfgrenzen) | Nein. `updated_at` = `post_date` | Faktencheck ja: `Reports/2026-10-29-lulucf-senke/faktencheck.md`, Urteil „OK mit Auflagen“, 0 kritisch, 4 mittel. Validierungsbericht der Analyse liegt unter `Analysen/` (laut redaktion.md „gering, 0 kritisch“; hier nicht geöffnet). Keine Nachprüfungsdatei zum Faktencheck (Befund D) |
| 5 | Klimabudget bis 2030: Wie groß ist die Lücke – und wie sicher kann man das sagen? (Evidenzcheck, Expertenrat-Budget) | 30.10.2026 13:07 UTC | /p/klimabudget-bis-2030-wie-gro-ist | Textkern gleich bis auf eine Stelle: Veröffentlicht „haben wir **inzwischen korrigiert**“ und Quelle [5] „**korrigiert am [Datum]**“; der Entwurf im Repo hat die Übergangsfassung „korrigieren wir gerade“ ohne Datum (Befund B). Sonst nur Zitierformat „[1, 2]“ statt „[1][2]“ | Nein, kein Hinweis im Artikel selbst; die Aussage „inzwischen korrigiert“ verweist auf einen nicht korrigierten Artikel (Befund B) | Validierung ja: `Reports/2026-10-30-expertenrat-budget/validierung_blogtext.md` (Urteil „mit Auflagen“, Nachprüfung bestanden, 0 kritisch; A1 und A2 als blockierend). Dazu `aenderungen_nach_veroeffentlichung.md` |
| 6 | Wann erreichen Wind an Land und Solar die Ausbauziele für 2030, wenn der Zubau der letzten Monate anhält? (Evidenzcheck) | **30.10.2026 13:59 UTC** (Datum war offen; jetzt belegt) | /p/wann-erreichen-wind-an-land-und-solar | Ja, Textkern wortgleich zu v3.1 (Tabellen siehe Prüfgrenzen) | Nein. `updated_at` = `post_date` | Ja: `faktencheck.md` (Abweichungen, 0 kritisch, 1 hoch, 8 mittel) und `faktencheck_nachpruefung2.md` (0 kritisch, 1 hoch, 3 mittel, 15 niedrig); keine Nachprüfung 3 zu v3.1 als Datei (Befund E) |
| 7 | Wie gut trafen die Projektionsberichte der Bundesregierung die Emissionen von 2020? (Prognose-Check #1) | 12.11.2026 18:59 UTC | /p/wie-gut-trafen-die-projektionsberichte | Ja, Textkern wortgleich zu v0.3 (Grafiken und Tabellen siehe Prüfgrenzen). Ein Platzhalter bleibt (Befund C) | Nein. `updated_at` = `post_date` | Ja: `Reports/2026-11-12-prognose-check/faktencheck.md` (bedingt, 0 kritisch, 4 hoch, 8 mittel, 6 gering), `faktencheck_nachpruefung1.md`, `faktencheck_nachpruefung2.md` |

Bei Beitrag 1 bis 7: im veröffentlichten Textkörper fehlt die Kopfzeile „Klima Kompass · <Stufe>“ bzw. „Prognose-Check #1“ (Reihenzeile); sie steht nur im Entwurf. Ob Substack sie anders darstellt (z. B. als Tag), konnte ich über die API nicht erkennen.

## Befunde (belegt)

**A. Korrekturblock zum Artikel vom 27.08. steht im Artikel vom 28.10. (Klimaziel 2026), mit Platzhalter „[Datum]“.**
Beleg: Der veröffentlichte Beitrag `verfehlt-deutschland-2026-erstmals` beginnt mit „Korrigiert am [Datum]: Bei einer erneuten Prüfung haben wir Fehler in diesem Artikel gefunden.“ Der Block nennt „407–598 Mt“, „16–328 Mt“, Newey-West, ARIMA und das fehlende Zeitfenster 2020–2025. Diese Zahlen und Begriffe kommen im übrigen Text des 28.10.-Artikels nicht vor (Suche nach „407“: nur im Block). Sie stammen aus dem Artikel vom 27.08. (`erreicht-deutschland-sein-klimaziel`). Dessen `updated_at` ist weiter der 27.08.2026 16:53 UTC; im Text steht weiterhin „407–598 Mt“, „16–328 Mt“ und „Der Analyseplan … wurde vor der Modellierung festgelegt“ ohne jeden Korrekturhinweis. Der Block ging am 30.10.2026 12:58 UTC an den falschen Beitrag; der Originalartikel ist unkorrigiert. Im Entwurf `Reports/2026-10-28-klimaziel-2026/kanal-entwuerfe/substack.md` steht der Block nicht.
Folge für das Jahrbuch: Die Korrekturen zu den beiden bekannten Fehlern (Kap. 8 Fälle 6/7) sind nicht dort online, wo Leser sie erwarten. Der 28.10.-Artikel behauptet zudem „in diesem Artikel“ Fehler, die er nicht enthält.

**B. Beitrag 5 (Expertenrat-Budget) verweist auf eine Korrektur, die es nicht gibt.**
Beleg: Veröffentlichter Text: „Den Artikel dazu haben wir inzwischen korrigiert [5].“ und Quelle [5] „…, 27.08.2026, korrigiert am [Datum].“ Platzhalter „[Datum]“ im Quellenverzeichnis sichtbar. Das Original vom 27.08. trägt keinen Korrekturhinweis (siehe A). Die Datei `aenderungen_nach_veroeffentlichung.md` beschreibt eine freigegebene Übergangsänderung („korrigieren wir gerade“, „korrigiert am [Datum]“ gestrichen) mit „Live-Abgleich ausstehend“. Auf Substack ist sie am 14.11.2026 nicht umgesetzt (`updated_at` = `post_date` = 30.10.2026 13:07 UTC). Der Validierungsbericht hatte genau diese Aussage als blockierend (A1) bezeichnet.

**C. Platzhalter im veröffentlichten Prognose-Check #1.**
Beleg: Quelle [3] endet im veröffentlichten Text mit „[Link erst nach Push und Prüfung auf 200]“. Die in `redaktion.md` als offen geführte Streichung ist nicht erfolgt. Der GitHub-Link selbst antwortet am 14.11.2026 mit HTTP 200.

**D. Evidenzcheck Landnutzung: Faktencheck-Auflagen nicht dokumentiert erledigt.**
Beleg: `faktencheck.md` nennt 4 mittlere Befunde (u. a. Repo-Link 404, verkürzte Offenlegung, fehlende Aussagegrenzen wie Durbin-Watson p = 0,002 für 1990–2024) und „sollten vor Veröffentlichung behoben werden; Textänderungen nach der Freigabe brauchen erneute Bestätigung“. Der Entwurf ist seit der Freigabe (Commit e0f6320, 29.10.) unverändert und gleich der veröffentlichten Fassung; also wurden die Befunde nicht eingearbeitet. Eine Nachprüfungsdatei liegt nicht vor. Der Repo-Link (Befund 1) antwortet inzwischen mit HTTP 200 (14.11.2026). Hinweis: Die Freigabe erfolgte nach `redaktion.md` vor Abschluss des Faktenchecks.

**E. Ausbaupfad: Restbefunde aus Nachprüfung 2.**
Beleg: `faktencheck_nachpruefung2.md`: offen u. a. R-10 bis R-16, R-22, R-23; neue Hinweise N2-1 (Rundung „64 %“ statt 65), N2-5, N2-6; Reihenzeile ohne „#n“. Danach entstand v3.1 (Commit 791a316, „Reste aus Nachprüfung 2“) und wurde freigegeben; eine Nachprüfung 3 zu v3.1 als Datei fand ich nicht. Ob die Restbefunde in v3.1 behoben sind, habe ich nicht Punkt für Punkt geprüft. In der Freigabe steht laut Entwurfskopf: „eine ausdrückliche Lesebestätigung mit dem Wort ‚gelesen‘ liegt nicht vor“.

**F. Kanalzeile (Querverweis) fehlt im Ökostrom-Beitrag.**
Beleg: Der Entwurf endet mit „Klima Kompass auch auf Instagram · Facebook · WhatsApp-Kanal · Über / Impressum“. Im veröffentlichten Beitrag 1 steht diese Zeile nicht (die anderen sechs haben sie). Betrifft die Querverweisregel in CLAUDE.md, nicht den Textkern.

## Gesamtzahl der Beiträge laut Archiv (14.11.2026)

**23 Beiträge** im öffentlichen Archiv (alle `audience: everyone`, `type: newsletter`), einschließlich des Vorstellungsposts „Was ist Klima Kompass – und wo findet ihr uns?“ (16.10.2026). Die Zählung 23 stimmt.
Nachrechnung: 16 Beiträge bis 21.10. (27.08., 29.08., 31.08. x2, 11.09., 14.09., 18.09., 16.10. x2, 17.10. x3, 18.10., 19.10., 20.10., 21.10.) plus 7 danach (23.10., 28.10. x2, 29.10., 30.10. x2, 12.11.) = 23. Seit dem 12.11. ist kein weiterer Beitrag erschienen.

## Prüfgrenzen

- Tabellen und Grafiken sind auf Substack Bilder (oder in der API-HTML-Fassung nicht als Text enthalten). Ich habe sie nicht per Bildvergleich mit den Entwürfen verglichen; Zahlen in Tabellen von Beitrag 4, 5, 6, 7 sind daher **nicht** belegt gleich. `redaktion.md` vermerkt für Beitrag 5 „Tabelle als Bild korrekt, Grafik bytegleich“ (Eintrag nicht von mir geprüft).
- Verglichen wurde mit dem Entwurf im Arbeitsverzeichnis. Für Beitrag 5 weicht der Entwurf bewusst vom Veröffentlichten ab (Übergangsänderung, Befund B); für die übrigen ist die Datei gleich der veröffentlichten Fassung, ob sie zwischenzeitlich verändert und zurückgesetzt wurde, habe ich nicht über die Git-Historie jeder Datei verfolgt (nur lulucf und ausbau).
- `updated_at` zeigt nur, ob Substack eine Bearbeitung registriert hat; Änderungen, die dieses Feld nicht setzen, würde ich daran nicht erkennen. Meinen Vergleich stützt der abgerufene Text selbst.
- Die API liefert nur veröffentlichte, öffentlich gelistete Beiträge. Entwürfe, ausgeblendete oder gelöschte Beiträge, Notes und Kommentare sind nicht erfasst. Die Zählung 23 gilt für das öffentliche Archiv.
- Inhaltliche Richtigkeit der Zahlen (Quellenabgleich) wurde nicht neu geprüft; dazu gelten die Faktencheck- und Validierungsdateien. Von mir nicht geöffnet: Validierungsberichte unter `Analysen/`, Kanalposts (Facebook, Instagram, WhatsApp; im Arbeitsverzeichnis haben drei LULUCF-Kanalentwürfe uncommittete Änderungen).
- Linkprüfung: nur die vier GitHub-Ordnerlinks (lulucf, prognose-check, ausbaupfad, expertenrat-budgetabgleich) per HTTP-Status geprüft (alle 200), keine weiteren Links.
