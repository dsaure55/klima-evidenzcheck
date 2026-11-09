# Differenzprüfung Stilpass, Gruppe A (Kurzfassung 00 bis 03), 09.11.2026

**Geprüft:** `kurz/00-einleitung.md`, `kurz/01-kosten.md`, `kurz/02-zu-klein.md`, `kurz/03-energie.md` (Arbeitskopie, uncommitted) gegen HEAD, nach `stilregeln.md` v0.3, Ablauf Punkt 3.
**Prüfer:** Subagent `faktenpruefer` (unabhängig, nicht Autor). Kapiteltexte nicht verändert. Dieses Dokument enthält keinen Freigabevermerk und ersetzt keine Freigabe durch Daniel Saure.

## Grundlage und Methode

Ich hatte keinen Bash-/git-Zugriff. Die Prüfung beruht auf den von der Koordination erzeugten Wort-Diffs (`git diff --word-diff=plain -U1 HEAD`, Ablage im Scratchpad unter `stildiff\00-einleitung.worddiff.txt` bis `03-energie.worddiff.txt`). **Alt = HEAD-Wortlaut** (im Diff `[-…-]`), **Neu = Arbeitskopie** (`{+…+}`). Jede einzelne Änderung der vier Diffs wurde durchgesehen. Zusätzlich habe ich die Arbeitskopien vollständig gelesen und die Zahlen gegen die Langfassungen und die Differenz-Faktenchecks (`faktencheck_kurz_kap01` bis `_kap03`) abgeglichen.

Eine frühere Fassung dieser Datei (ohne Diff) hat mehrere Befunde dem Stilpass zugeschrieben, die in Wahrheit schon in HEAD standen. Sie sind unten als **Restbefunde (nicht durch den Stilpass)** geführt und nicht mehr den Änderungen zugerechnet.

Schweregrade: kritisch = Aussage kippt oder falsche Zahl; hoch = wesentlicher Vorbehalt entfallen oder Aussage deutlich verstärkt; mittel = Reichweite oder Vorbehalt verändert; niedrig = Formulierung, Stil, Kleinigkeit.

## Ergebnis in Kürze

- **Zahlen, Daten, Einheiten, Zitate, [n]-Verweise, Kapitelverweise, Quellenlisten, Platzhalter:** durch den Stilpass in keinem der vier Kapitel verändert. Die Diffs enthalten keine Änderung an einer Zahl, einem Datum, einem Zitat oder einer Quellenzeile. Die in den Kopfzeilen ergänzte Zeile „Stilpass 28.10.2026 …, Differenzprüfung steht aus" ist rein formal.
- **Vorbehalte** („etwa", „laut", „nach unserer Rechnung", „Spanne", „vorläufig", „Nach unserer Lesart", „legt nahe", „kann … höher liegen", „nach Angaben der Behörde"): alle erhalten, wo sie in HEAD standen.
- **Eine inhaltlich relevante Änderung:** Kap. 03, Befund G1 (mittel). Eine weitere Kleinigkeit im selben Satz (G2, niedrig).
- Kritisch: 0. Hoch: 0.

---

## Kapitel 00 – Einleitung

Alle Diff-Hunks geprüft.

| Nr. | Fundstelle (Z. Arbeitskopie) | Alt (HEAD) | Neu | Bewertung | Schwere |
|---|---|---|---|---|---|
| E1 | Z. 10 | „Unser Prinzip: Jede Zahl nennt ihre Quelle … Dabei hilft uns künstliche Intelligenz." | „Bei uns nennt jede Zahl ihre Quelle … Künstliche Intelligenz hilft uns dabei." | Umstellung, gleiche Aussage. | – |
| E2 | Z. 14 | „…Zahlen aus der Quelle, ohne neue Rechnung; sie geht durch einen Faktencheck." | „…aus der Quelle. Sie enthält keine neue Rechnung und geht durch einen Faktencheck." | Gleiche Aussage. | – |
| E3 | Z. 18 bis 21 | fette Köpfe „**Offene Daten und offener Code.**", „**Sichtbare Korrekturen.**", „**Quellen und Stand im Text.**" | Köpfe entfallen; „Unsere Daten und unser Code sind offen." | Rein stilistisch. „soweit möglich", „soweit geklärt", „soweit bekannt" bleiben. | – |
| E4 | Z. 21 | „**Das Prognose-Register.** Wir messen uns an unseren eigenen Vorhersagen (Kapitel 8)." | „An unseren eigenen Vorhersagen messen wir uns **im Prognose-Register** (Kapitel 8)." | Der Zusatz „im Prognose-Register" macht den Kopf-Inhalt explizit; Kapitelverweis unverändert. | niedrig |
| E5 | Z. 25 | „…zwei Teile: **Was stimmt** (Kapitel 1 bis 8) … und **Was nicht** (Kapitel 9 und 10) …" | gleiche Kapitelzuordnung, in Sätze aufgeteilt (dann → er) | Keine Änderung der Zuordnung. | – |
| E6 | Z. 29 | „**Stand der Daten:** Redaktionsschluss ist der [Datum …]" | Rubrikkopf „Stand der Daten:" entfällt | Platzhalter und Aussage unverändert. | niedrig |
| E7 | Z. 30 | „Grafiken zeigen vorhandene Zahlen … , keine neuen Analysen." | „Die Grafiken zeigen vorhandene Zahlen … Neue Analysen sind nicht darunter." | Gleiche Aussage. | – |
| E8 | Z. 31 | „**Was das Buch nicht ist:** Es ist kein Lehrbuch …" | „Das Buch ist kein Lehrbuch …" | Gleiche Aussage; Satz zu hitzebedingten Sterbefällen unverändert. | – |
| E9 | Z. 33 | „Das Buch ist für alle, die … wollen, ohne Vorkenntnisse in Statistik." | „Das Buch richtet sich an alle, die … wollen. Vorkenntnisse in Statistik braucht es dafür nicht." | Gleiche Aussage. | – |

**Restbefunde (nicht durch den Stilpass; Text in HEAD und Arbeitskopie gleich), nur zur Kenntnis:** (a) „Einen Überblick mit Kurzantworten findest du vorab" (Z. 25) steht schon in HEAD; in der Langfassung der Einleitung gibt es den Satz nicht, Existenz des Überblicks ist nicht belegt. (b) Gegenüber der Langfassung fehlen die Gate-Bedingung „ohne Befund kritisch" beim Evidenzcheck, die Prüfschritte beim Prognose-Register („Registrierung mit Zeitstempel", „Auswertung unabhängig vom Ausgang") und der Satz „Abgebrochene Analysen bleiben sichtbar (Kapitel 9)"; Vorbehalt „Wo Werte aus einem erneuten Rechenlauf stammen, steht es im Kapitel" fehlt ebenfalls. Alles aus der früheren Kürzung, nicht aus dem Stilpass. (c) Der Name „Dr. Daniel Saure" steht im Fließtext (Z. 8, auch in der Langfassung); die Projektregel erlaubt den Namen nur im Impressum sowie auf Cover/Titelseite. Bei der Freigabe bewusst entscheiden.

**Stilregeln v0.3:** Fette Schlagwort-Köpfe in Aufzählungen: beseitigt. Gedankenstriche: nur in der Überschrift. Gegensatzformeln: „Das Buch ist kein Lehrbuch … und gibt keine Empfehlung" und „Neue Analysen sind nicht darunter" – im Rahmen. Dreierreihe: Z. 4 „Zahlen, die stimmten, Zahlen, die verkürzt waren, und Zahlen, bei denen ein Vergleich fehlte" (in HEAD vorhanden, niedrig). Doppelpunkt ohne Aufzählung: Z. 14 „vorausschaut: Wir legen uns vorab fest" (in HEAD vorhanden, niedrig). Rhetorische Fragen als Übergang: keine (die vier Fragen in Z. 4 nennen die Buchthemen). Modewörter: keine.

**Gesamturteil Kapitel 00: keine Veränderung von Aussage, Zahl, Einschränkung, Quelle oder Vorbehalt durch den Stilpass (ok).**

---

## Kapitel 01 – Kosten (Titel „Kapitel 2")

Alle Diff-Hunks geprüft.

| Nr. | Fundstelle (Z.) | Alt (HEAD) | Neu | Bewertung | Schwere |
|---|---|---|---|---|---|
| K1 | Z. 9 | „(so wiedergegeben in [2]). Die Werte beziehen sich auf … , und für Benzin und Diesel sind es Bruttowerte" | „, wie es [2] wiedergibt. Die Werte gelten für … Bei Benzin und Diesel sind es Bruttowerte" | Gleiche Aussage, [2][3] erhalten. | – |
| K2 | Z. 18 | „Nettowerte: rund 13 Cent …"; „kommt … auf 17,6 bis 18,3 Cent. Das ist ein anderer Rechenweg" | „Nettowerte, und zwar rund 13 Cent …"; „ergibt … 17,6 bis 18,3 Cent. Dafür haben wir einen anderen Rechenweg genommen" | Gleiche Zahlen; der Vorbehalt „Die Werte weichen leicht von der IWH-Tabelle ab [1]" bleibt. | – |
| K3 | Z. 22 | „ist **kein Evidenzcheck**. Es ist ein Rechenkommentar ohne vorab festgelegten Analyseplan, mit Umrechnungen und einer Modellrechnung …" | „ist ein Rechenkommentar ohne vorab festgelegten Analyseplan **und damit kein Evidenzcheck**. Es enthält Umrechnungen und eine Modellrechnung …" | „damit" ergänzt die Folgerung. Entspricht der Definition in der Einleitung (Evidenzcheck = vorab festgelegter Plan). | niedrig |
| K4 | Z. 24 | „sind das 17,6 bis 18,3 Cent" | „ergibt das …" | Gleiche Zahl. | – |
| K5 | Z. 26 | „Der Tankrabatt hat damit 91 bis 95 Prozent … aufgehoben"; „Bei Diesel kam ein Teil des Rabatts gar nicht an: Das ifo-Institut fand per Preisvergleich mit Frankreich …, bei Diesel rund 12 der 16,7 Cent, etwa 72 Prozent" | „Damit hat der Tankrabatt 91 bis 95 Prozent …"; „…gar nicht an. Das ifo-Institut verglich die Preise mit Frankreich und fand …, **also** etwa 72 Prozent" | „also etwa 72 Prozent" ist die Umrechnung 12 von 16,7; „etwa" bleibt. Zahlen gleich. | niedrig |
| K6 | Z. 32 | „…Mehrverbrauch von rund 0,18 bis 0,37 Millionen Tonnen CO₂, **bei einer** Absatzbasis von rund 62 Milliarden Litern im Jahr (Benzin und Diesel zusammen; die Elastizität stammt aus einer Studie zu Benzin)." | „…CO₂. **Die** Absatzbasis **beträgt** rund 62 Milliarden Liter im Jahr (Benzin und Diesel zusammen), die Elastizität stammt **allerdings** aus einer Studie zu Benzin." | Die Basis ist nicht mehr als Bedingung des Ergebnisses formuliert, sondern als eigener Satz; die Rechengrundlage steht aber direkt dabei. „allerdings" betont den Vorbehalt. Zahlen gleich. Die restaurierten Vorbehalte („Dabei haben wir berücksichtigt …", „Ein neues Skript ist dafür nicht gelaufen") sind in HEAD und Arbeitskopie vorhanden. | niedrig |
| K7 | Z. 34 | „Wir vergleichen Kosten des Staates, keine volkswirtschaftlichen Kosten, und die Analyse ist nicht präregistriert." | „Wir vergleichen Kosten des Staates und nicht volkswirtschaftliche Kosten. Die Analyse ist nicht präregistriert." | Gleiche Aussage. | – |
| K8 | Z. 38 | „Der Grund: Der europäische Emissionshandel … startet erst 2028." | „Der Grund **liegt im Zeitplan:** Der europäische …" | Kleine Ergänzung, sachlich durch den Folgesatz gedeckt. | niedrig |
| K9 | Z. 44 | „Was diese Einordnung nicht zeigt: wie stark …" | „Diese Einordnung zeigt nicht, wie stark …" | Gleiche Aussage. | – |
| K10 | Z. 48 | „vorgelegt: Rund 6 Billionen Euro müsse Deutschland bis 2045 …" | „vorgelegt. Rund 6 Billionen Euro müsse Deutschland **demnach** bis 2045 …" | „demnach" kennzeichnet die Zuschreibung; Konjunktiv bleibt. | – |
| K11 | Z. 50 | „Zusätzlich ist nur der Aufpreis …", „Die Studie nennt das „Nettoinvestitionen“:" | „Zusätzlich fällt nur der Aufpreis … an", „…„Nettoinvestitionen“." | Gleiche Aussage; 145 Mrd., „etwa die Hälfte" gleich. | – |
| K12 | Z. 58 | „…Nutzen, den die Studie hervorhebt: weniger Abhängigkeit …, wofür Deutschland … 81 Milliarden … hat [7]"; „Unsere Lesart: Wer … vermischt …" | „…hervorhebt, nämlich weniger Abhängigkeit … Dafür hat Deutschland … ausgegeben [7]"; „Nach unserer Lesart vermischt, wer …" | Gleiche Zahlen und Quellen; der Hedge „Lesart" bleibt. | – |
| K13 | Z. 64 | „Wie sich der CO₂-Preis 2027 auf deine Rechnung auswirkt …"; „Das Gesetz, das den Korridor beibehält, ist vom Bundestag beschlossen, der Bundesrat muss sich noch damit befassen (Stand 22. Oktober 2026)" | „Was der CO₂-Preis 2027 für deine Rechnung bedeutet …"; „Der Bundestag hat das Gesetz beschlossen, das den Korridor beibehält. Der Bundesrat muss sich noch damit befassen (Stand 22. Oktober 2026)" | Stand-Angabe und [5][6] unverändert. | – |
| K14 | Z. 68 bis 72 | Bullets mit fetten Köpfen; „Daraus wurden Mehrverbrauch und Kosten je Tonne falsch angegeben"; „Ausführlich in Kapitel 10"; „Tatsache ist: Nach der ersten Entlastung kam eine zweite" | Fließtext; „**Deshalb** waren Mehrverbrauch und Kosten je Tonne falsch angegeben"; „Ausführlicher steht das in Kapitel 10"; „**Belegt ist nur, dass** nach der ersten Entlastung eine zweite kam" | Gleiche Aussagen. „Belegt ist nur" ist eher vorsichtiger als „Tatsache ist". Kapitel 10 unverändert; Platzhalter „[Stand zum Redaktionsschluss aktualisieren]" erhalten. | niedrig |
| K15 | Z. 74 | „Hier haben wir keine eigene Analyse gemacht … Wir haben die Wiedergabe gegen die Studie geprüft." | „Zur KfW-Studie haben wir … Die Wiedergabe haben wir gegen die Studie geprüft." | Gleiche Aussage. | – |

**Restbefunde (nicht durch den Stilpass; in HEAD und Arbeitskopie gleich):** (a) Z. 44 „Die Tabelle zeigt nur den Anteil des CO₂-Preises **am Spritpreis** [3]": Die IWH-Tabelle zeigt einen Aufschlag in Cent (kein Anteil) und enthält auch Heizöl und Erdgas; die Langfassung sagt nur „den Anteil des CO₂-Preises". Niedrig bis mittel, bei der nächsten Überarbeitung auf den Lang-Wortlaut zurücksetzen. (b) Z. 5 „(mit Mehrwertsteuer, gegenüber der Zeit vor dem CO₂-Preis)" weicht von der Langfassung ab, ist durch Basisjahr 2020 gedeckt. (c) Die Altbefunde aus `faktencheck_kurz_kap01.md` Nr. 6 (68-Euro-Festpreis), 7, 9, 12 gelten weiter.

**Stilregeln v0.3:** Fette Schlagwort-Bullets beseitigt. Gedankenstriche: nur in Titel und Quellentiteln. Gegensatzformeln über der Zielgröße „eine pro Kapitel": „Investitionen und keine verlorenen Kosten" (Z. 58), „Kosten des Staates und nicht volkswirtschaftliche Kosten" (Z. 34, im Stilpass neu geformt, vorher auch als Gegensatz), „damit kein Evidenzcheck" (Z. 22), „keine eigene Analyse gemacht, sondern … wiedergegeben" (Z. 74) – niedrig. Doppelpunkte vor Erklärungen statt Aufzählung: Z. 38 („liegt im Zeitplan:"), Z. 68 („gehalten:") – niedrig. Sehr lange Sätze: Absatz Z. 32 – niedrig. Dreierreihen: keine aus Reflex. Modewörter und rhetorische Fragen: keine.

**Gesamturteil Kapitel 01: keine Veränderung von Aussage, Zahl, Einschränkung, Quelle oder Vorbehalt durch den Stilpass (ok).** Nur Formulierungsnuancen (K3, K6, K8), keine Reichweitenänderung.

---

## Kapitel 02 – Zu klein, um zu zählen (Titel „Kapitel 3")

Alle Diff-Hunks geprüft.

| Nr. | Fundstelle (Z.) | Alt (HEAD) | Neu | Bewertung | Schwere |
|---|---|---|---|---|---|
| Z1 | Z. 5 | „Aber alle Länder, deren Anteil so klein oder kleiner ist, kommen zusammen auf fast ein Drittel …" | „Alle Länder, … kommen **jedoch** zusammen auf fast ein Drittel …" | Gleiche Aussage; 31,7 Prozent, Rang 12 von 208 unverändert. | – |
| Z2 | Z. 9 | zwei Fragen: „Was folgt aus dem Argument, wenn man es zu Ende denkt? Wie viel … fiele … , wenn alle … anwenden? [1][2]" | „…, und wir nennen weder Personen noch Parteien. Uns interessiert etwas anderes, nämlich was aus dem Argument folgt …. Wir fragen, wie viel … fiele, wenn alle … anwenden [1][2]." | Rhetorische Fragen in Aussagesätze. Inhalt, [1][2] gleich. | – |
| Z3 | Z. 13 bis 17 | „Beide sind gleichrangig:" + Bullets „**Heute:**", „**Historisch:**" | „…, und beide sind gleichrangig." + „Für heute gilt: …", „Historisch sieht es so aus: Zählt man … zusammen …" | Zahlen (1,3 / Rang 12 von 208 / 31,7; 5,3 / Rang 4 von 214 / 53,1), „laut der EU-Datenbank EDGAR", [1] unverändert. | – |
| Z4 | Z. 25 | „Die Hauptaussage der Analyse ist diese Kurve, nicht eine einzelne Prozentzahl … aus der Debatte, nicht aus einem statistischen Kriterium" | „… diese Kurve, keine einzelne Prozentzahl … aus der Debatte und aus keinem statistischen Kriterium" | Gleiche Aussage. | – |
| Z5 | Z. 29 | „Dazu kommen Varianten, die wir vorab festgelegt haben [1]:" | „… [1]. **Die Grafik zeigt sie nebeneinander.**" | Neuer Ankündigungssatz. Beschreibt nur die Grafik 2; inhaltlich unkritisch. | niedrig |
| Z6 | Z. 34 bis 40 | Bullets „**Nur CO₂ …**", „**Konsumbasiert …**", „**Historisch mit Landnutzung:**", „**Pro Kopf:**" | Fließtext: „Rechnet man nur mit CO₂ …", „Zählt man konsumbasiert … gelten die Emissionen dort, wo die Güter verbraucht werden, und nicht dort, wo sie entstehen", „Rechnet man **bei der historischen Zahl auch** Emissionen aus Landnutzungsänderungen dazu …", „Pro Kopf liegt Deutschland … über dem weltweiten Durchschnitt von 6,36 Tonnen" | Alle Zahlen gleich (1,5 / 30,1; 2,1 / 40,5; 3,5 / 54,0; 8,07 / 6,36; 58 Länder, Rang 8, 14,2 Prozent). Vorbehalte „nicht direkt vergleichbar mit den 31,7 Prozent, weil Gase und Jahr abweichen", „Mittel dreier Modelle", „modellunsicherer" bleiben. „bei der historischen Zahl" ersetzt den entfallenen Bullet-Kopf, Zuordnung richtig. | – |
| Z7 | Z. 49 bis 53 | Köpfe „**Keine Schuldfrage.**", „**Produktion, nicht Konsum.**", „**Nichts zur COP31.**"; „Gedankenexperiment."; „…wo sie entstehen." | „Gedankenexperiment **und stellt keine Schuldfrage**."; „…entstehen, **also nach Produktion und nicht nach Konsum**." | Der Inhalt der Köpfe wird in den Satz übernommen. Vorbehalt „kann … spürbar höher liegen, ist aber nicht direkt vergleichbar" bleibt. COP31-Zeitangabe und [6][2] unverändert. | – |
| Z8 | Z. 57 bis 59 | „Ein Anteil in Prozent lässt sich erst einordnen …"; „Wer Prozentzahlen … vergleicht, sollte prüfen, …"; „legt nahe: „Zu klein … funktioniert nur, solange es nicht alle sagen. Ob ein einzelner Anteil zählt, ist auch eine Frage danach, …" | „…kannst du erst einordnen …"; „Wenn du … vergleichst, **prüfe**, …"; „legt nahe, dass … nur funktioniert, solange … Ob … zählt, **hängt auch davon ab**, …" | Aussagen gleich. Aus der Empfehlung „sollte prüfen" wird ein Imperativ (Stilregel 10, kein Appell), Hedge „legt nahe" und „auch" bleiben. | niedrig |
| Z9 | Z. 63 bis 65 | Bullets „**Zahlen:**", „**Vor der Veröffentlichung gefunden:** Die unabhängige Validierung fand …", „Das ist keine nachträgliche Korrektur …", „**COP31:** Unsere Stücke machen keine Vorhersage zur Konferenz." | Fließtext; „Das war **also** keine nachträgliche Korrektur (mehr dazu in Kapitel 10) [1]"; „Zur COP31 machen unsere Stücke keine Vorhersage." | Alle Angaben (kritischer Fehler im Datenkonverter, nie veröffentlicht, unabhängig nachgerechnet, Kapitel 10, [1]) gleich. | – |
| Z10 | Z. 71 | „…214 Länder);" | „…214 Länder)." | Interpunktion. | – |

**Restbefunde (nicht durch den Stilpass):** Die Altbefunde aus `faktencheck_kurz_kap02.md` (Nr. 3 „nur"/„zusätzlich", Nr. 4 „Bezugsgruppen" in der Bildunterschrift, Nr. 6 Weltbank in „Woher wir das wissen", Nr. 9 COP31-Zeitform, „Methodenanhang" ungeprüft) gelten unverändert weiter.

**Stilregeln v0.3:** Fette Schlagwort-Bullets beseitigt. Gegensatzformeln deutlich über „eine pro Kapitel": „Gedankenexperiment und keine Schuldfrage" (Z. 5), „Gedankenexperiment und stellt keine Schuldfrage" (Z. 49), „Kurve, keine einzelne Prozentzahl" und „aus keinem statistischen Kriterium" (Z. 25), „Uns interessiert etwas anderes, nämlich …" (Z. 9), „nach Produktion und nicht nach Konsum" (Z. 51), „wo die Güter verbraucht werden, und nicht dort, wo sie entstehen" (Z. 37), „kein festes Ergebnis" (Z. 29), „keine nachträgliche Korrektur" (Z. 65) – mittel (Regel 1), größtenteils bereits in HEAD in anderer Form (als Köpfe oder Nebensätze) angelegt. Doppelpunkt ohne Aufzählung: Z. 15 „Für heute gilt:", Z. 17 „Historisch sieht es so aus:" – niedrig, neu durch den Stilpass. Ankündigungssatz Z. 29 „Die Grafik zeigt sie nebeneinander." – niedrig. Dreierreihen aus Reflex, Gedankenstriche im Text, Modewörter, rhetorische Fragen: keine.

**Gesamturteil Kapitel 02: keine Veränderung von Aussage, Zahl, Einschränkung, Quelle oder Vorbehalt durch den Stilpass (ok).** Stilbefund: Gegensatzformeln bleiben zahlreich (mittel).

---

## Kapitel 03 – Energie (Titel „Kapitel 4")

Alle Diff-Hunks geprüft.

| Nr. | Fundstelle (Z.) | Alt (HEAD) | Neu | Bewertung | Schwere |
|---|---|---|---|---|---|
| G1 | Z. 51 | „Diese Schwelle war nicht im Analyseplan vorgesehen. **Sie ist technisch nicht begründet, sondern so gewählt**, dass sie nahe an zwei unabhängigen Quellen liegt (Branchenverband BVES: 24 GWh, IWR: rund 35 GWh)." | „Diese Schwelle war nicht im Analyseplan vorgesehen. **Technisch begründen lässt sie sich nicht. Wir haben sie so gewählt**, dass sie nahe an zwei unabhängigen Quellen liegt (…)." | Verschiebung von „ist nicht begründet" (Feststellung zum Stand) zu „lässt sich nicht begründen" (grundsätzliche Unmöglichkeit). Der Wortlaut war als Auflage A12 festgelegt (Prüfdatei K3-16: „unverändert (A12 erfüllt)"). Zahlen (100 MWh, 24 GWh, 35 GWh) gleich. Im Zweifel Abweichung. | **mittel** |
| G2 | Z. 51 | „Das **ist** ein Risiko für eine Verzerrung, **das wir ausdrücklich nennen** [3]." | „Das **birgt** ein Risiko für eine Verzerrung [3]." | Das Risiko bleibt genannt; der Transparenzhalbsatz „das wir ausdrücklich nennen" entfällt (auch „ist" → „birgt", eine Nuance). Lang: „das wir hier ausdrücklich nennen". | niedrig |
| G3 | Z. 7 | Überschrift „Gas: Die Aussage und ihr Bezugsrahmen" | „Gas: Was gesagt wurde" | Zwischenüberschrift, kein Raster-Kopf; Sinn gleich. | niedrig |
| G4 | Z. 9 | „hielt am 12. September dagegen: In den Speichern lägen …"; „die Aussage von Herrn Müller"; „wie in unserem Evidenzcheck [1] beschrieben" | „…dagegen. In den Speichern lägen …"; „Müllers Aussage"; „wie wir sie in unserem Evidenzcheck [1] beschrieben haben" | Konjunktiv („lägen", „worden sei") bleibt; Primärquellen-Vorbehalt und Datum gleich. | – |
| G5 | Z. 11 | „Wie steht dieser Winter im Vergleich zu allen anderen da?" | „Wir haben nachgesehen, wie dieser Winter im Vergleich zu allen anderen dasteht." | Rhetorische Frage durch Aussage ersetzt (Ankündigungssatz). | niedrig |
| G6 | Z. 17 | „Der Einwand liegt woanders, nämlich in der Streuung." | „Der Einwand liegt in der Streuung." | Gleiche Aussage; Zahlen und „Größenordnung, nicht … Prognose [1]" gleich. | – |
| G7 | Z. 27 | „Das Prognoseintervall reicht aber von 69 bis 230 … Ein belastbares „reicht nicht“ ist das nicht. Ein belastbares „reicht“ allerdings auch nicht [1]." | „…reicht von 69 bis 230 … Daraus lässt sich weder ein belastbares „reicht nicht“ noch ein belastbares „reicht“ ableiten [1]." | Gleiche Aussage. | – |
| G8 | Z. 29 | „Die Speicher sind außerdem nur ein Teil der Versorgung. … deckten sie im Median nur 19 Prozent …" | „Die Speicher decken ohnehin nur einen Teil der Versorgung. … waren es im Median 19 Prozent …" | Zahl 19 Prozent, „im Median", [1] gleich. „ohnehin" ist neues Füllwort (Stilregel 5), niedrig. | niedrig |
| G9 | Z. 31 bis 33 | Ein Absatz: „Die Füllstandsziele … gelten je Speicher (meist 80 Prozent, bei sechs Speichern 45 Prozent). … kein akutes Problem: Das Erreichen der Füllstandsziele sei „nicht zwingend“, …" | Neuer Absatz; „…je Speicher, meist 80 Prozent, bei sechs Speichern 45 Prozent. … kein akutes Problem. Das Erreichen … sei „nicht zwingend“ …" | Zahlen, Zitat, [2][5], [2][4] unverändert. | – |
| G10 | Z. 35 | „Das ist ein Vergleich mit schon veröffentlichten Werten, keine neue Rechnung und keine Prognose." | „Dieser Vergleich nutzt schon veröffentlichte Werte und ist keine neue Rechnung und keine Prognose." | Gleiche Aussage; die Grenzen („Bestand an einem Stichtag … steckt in diesem Vergleich nicht drin [2]") bleiben. | – |
| G11 | Z. 43 | „Als Dunkelflaute gilt: mindestens drei Tage in Folge …"; „Ihm haben wir …"; „Wo die Schwelle … liegt, ist eine Entscheidung mit Ermessensspielraum und keine objektive Wahrheit." | „…gilt eine Phase von mindestens drei Tagen in Folge …"; „Dem haben wir …"; „…liegt, haben wir mit Ermessensspielraum festgelegt, eine objektive Wahrheit gibt es dafür nicht." | Gleiche Aussagen. | – |
| G12 | Z. 51 bis 53 | „Zwei Dinge müssen wir offen sagen. Erstens war die Kapazitätszahl nicht aus dem Rohdatensatz direkt zu übernehmen."; „Zweitens liegt das Ergebnis …, die Größenordnung ist also stabil" | „Zur Rechnung gibt es zwei Anmerkungen. Die Kapazitätszahl konnten wir nicht direkt … übernehmen."; „Außerdem liegt das Ergebnis …. Die Größenordnung ist also stabil" | Zahlen (50 von 2,72 Mio., 97,25 Prozent, 46-fach, 100 MWh, acht Sensitivitätsanalysen, 0 bis 1 Prozent) gleich. Ankündigungssatz („zwei Anmerkungen") ersetzt „Zwei Dinge müssen wir offen sagen". | niedrig |
| G13 | Z. 55 | Absatzanfang „Was die Rechnung nicht zeigt: Importe sind …" | „Importe sind im Energiedefizit nicht berücksichtigt …" | Der einleitende Rubrikkopf entfällt; die Einschränkungen (Importe, Nachlade-Simulation, „eher eine zu niedrige Näherung", keine Bewertung von Batterien als Antwort) sind vollständig erhalten. | niedrig |
| G14 | Z. 61 | „… „Batterien sind nutzlos“. Sie zeigt nur: Die heutige bereinigte Kapazität hätte …" | „… „Batterien sind nutzlos“. Die heutige bereinigte Kapazität hätte …" | „rund einem Prozent" und „in unserer Rechnung" erhalten. | – |
| G15 | Z. 65 bis 67 | Bullets mit fetten Köpfen; „Maßgeblich ist, ob …"; „Das ist keine Rückschau, sondern ein Hinweis zum Stand."; „**Strom, offen:** Die Nachlade-Simulation fehlt noch, und die Datenbereinigung bleibt ein Risiko für eine Verzerrung." | Bullets ohne Köpfe; „Es zählt, ob …"; „Der Gasstand vom Oktober ist ein Hinweis zum Stand, keine Rückschau."; „Beim Strom ist noch offen, dass die Nachlade-Simulation fehlt und die Datenbereinigung ein Risiko für eine Verzerrung bleibt." | Kriterium (tatsächliche Entnahme bei tatsächlicher Wintertemperatur im 95-Prozent-Prognoseintervall), 3,75 bis 6,18 °C, Mai oder Juni 2027, „drei Wochen", 60,5 Prozent, „siehe Kapitel 8" gleich. | – |
| G16 | Z. 71 | „**Gas:** Eurostat … und Deutscher Wetterdienst …, dazu die Lagebewertung …; **Strom:** SMARD … Marktstammdatenregister …" | „Beim Gas stammen die Daten von Eurostat … und vom Deutschen Wetterdienst …, dazu kommt die Lagebewertung …. Beim Strom nutzen wir SMARD … und das Marktstammdatenregister …" | Gleiche Angaben, Datumsstände (16.10.2026, 31.08.2026), Sekundärquellen-Kennzeichnung und dokumentierte Abweichungen unverändert. | – |

**Restbefunde (nicht durch den Stilpass; in HEAD und Arbeitskopie gleich):** Die Altbefunde K3-3 bis K3-16 aus `faktencheck_kurz_kap03.md` gelten, soweit nicht in HEAD behoben, weiter, insbesondere: Zitat „nicht zwingend" ohne „für die sichere Versorgung" (K3-10), Definition Energiedefizit ohne „und anderweitig gedeckt werden musste" (K3-5), „Studie mit 300 GWh" ohne Vorlauf (K3-4), „eingefroren" im „Woher wir das wissen" entfallen (K3-15), „siehe Kapitel 8" statt Kapitel 10 (nach der Neunummerierung plausibel, Kapitel 8 nicht geöffnet).

**Stilregeln v0.3:** Fette Schlagwort-Bullets beseitigt. Gedankenstriche: nur Titel/Quellen. Gegensatzformeln deutlich über „eine pro Kapitel": „nicht als Prognose" (Z. 17), „weder … noch" (Z. 27, Z. 61; Z. 27 im Stilpass neu geformt), „keine neue Rechnung und keine Prognose" (Z. 35), „keine Rückschau" (Z. 66), „eine objektive Wahrheit gibt es dafür nicht" (Z. 43), „Technisch begründen lässt sie sich nicht" (Z. 51) – mittel (Regel 1). Ankündigungssätze: Z. 11, Z. 51 – niedrig. Füllwort „ohnehin" (Z. 29) – niedrig. Dreierreihen aus Reflex, Modewörter, rhetorische Fragen im Text: keine. Lange Sätze: Z. 31, Z. 35, Z. 45 – niedrig.

**Gesamturteil Kapitel 03: Abweichung (mittel), wegen G1.** Alle Zahlen, Quellen, Fristen und die übrigen Vorbehalte unverändert. Zu korrigieren wäre nur der Satz zur 100-MWh-Schwelle (Rückkehr zu „Sie ist technisch nicht begründet, sondern so gewählt …" und, wenn gewünscht, „das wir ausdrücklich nennen").

---

## Gesamtübersicht Gruppe A

| Kapitel | Zahlen/Quellen/Zitate verändert? | Aussage/Vorbehalt verändert? | kritisch | hoch | mittel | niedrig (Stilpass) | Gesamturteil |
|---|---|---|---|---|---|---|---|
| 00 Einleitung | nein | nein | 0 | 0 | 0 | 2 | ok |
| 01 Kosten | nein | nein | 0 | 0 | 0 | 5 | ok |
| 02 Zu klein | nein | nein | 0 | 0 | 0 (Stil: mittel) | 2 | ok (Stilbefund Gegensatzformeln) |
| 03 Energie | nein | ja, G1 | 0 | 0 | 1 (G1) | 6 | Abweichung (mittel) |

**Empfehlung vor der Freigabe:**

1. Kap. 03 Z. 51 (G1, G2): Wortlaut der Vor-Stilpass-Fassung („Sie ist technisch nicht begründet, sondern so gewählt …", „… Verzerrung, das wir ausdrücklich nennen") wiederherstellen, dann ist die Differenzprüfung für Kap. 03 ohne Befund.
2. Restbefunde aus den Differenz-Faktenchecks (siehe je Kapitel) unabhängig vom Stilpass abarbeiten, darunter Kap. 01 Z. 44 „am Spritpreis" und die Einleitungs-Kürzungen gegenüber der Langfassung (Gate-Bedingung, Prognose-Register-Prüfschritte, „Überblick mit Kurzantworten", Vorbehalt zu erneuten Rechenläufen bei Grafiken).
3. Stil: Gegensatzformeln in Kap. 02 und 03 weiter reduzieren (Regel 1: eine pro Kapitel).
4. Nach den Korrekturen das Ergebnis als Nachtrag in der Prüfdatei je Kapitel festhalten (Stilregeln, Ablauf Punkt 3).

*Dieses Dokument enthält keinen Freigabevermerk.*
