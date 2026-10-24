# Kapitel 9 – So entsteht ein Evidenzcheck (und welche Rolle KI dabei spielt)
**ENTWURF v0.1 (24.10.2026) – nicht geprüft, nicht freigegeben. Grundlage: `CLAUDE.md` (Workflow, Verifikationspflicht, Dokumentationspflicht), `SAP-Vorlage/SAP-Template.md`, `.claude/agents/*.md`, Analyse- und Validierungsdateien in `Analysen/`, `Analysen/2026-10-rhein-niedrigwasser/ABBRUCH.md`. Entscheidung Daniel Saure 24.10.2026 („Ja“): „Claude von Anthropic“ genügt als KI-Angabe, die Vorfälle vom 29.08. bleiben anonymisiert. Vor Satz/Export: diese Kopfzeile und die Herkunftstabelle entfernen.**

**Kurz gesagt:** Ein Evidenzcheck beginnt mit einem Plan, bevor jemand die Daten ansieht. Danach rechnet jemand genau nach diesem Plan, eine zweite Stelle prüft unabhängig, und am Ende gibt ein Mensch frei. Künstliche Intelligenz schreibt dabei Plan, Code und Entwürfe. Einfrieren, Freigeben und Veröffentlichen sind Aufgabe von Menschen, die KI darf sie nicht übernehmen. Das Verfahren hat Fehler abgefangen, aber auch eigene Pannen gehabt. Beides beschreiben wir hier.

## Das Prinzip: erst festlegen, dann rechnen

Wer zuerst die Daten ansieht und dann entscheidet, wie er rechnet, findet leicht etwas. Man nimmt das Zeitfenster, das schön aussieht, und das Modell, das zum Wunsch passt. Das nennt man Cherry-Picking, wörtlich „Kirschen pflücken“.

Dagegen hilft ein Statistischer Analyseplan, kurz SAP. Er legt vorab fest: die Frage, die Daten, die Methode, die Sensitivitätsprüfungen (Wie ändert sich das Ergebnis, wenn man andere vernünftige Annahmen trifft?) und die Grenzen des Ergebnisses. Das ist ein ähnliches Prinzip wie das Studienprotokoll in der klinischen Forschung. Dort steht vor der ersten Patientin, was gemessen und wie ausgewertet wird.

Unser SAP folgt einer Vorlage mit festen Abschnitten: Status, Hintergrund, Fragestellung, Datenquelle, Analysepopulation, Methoden, Sensitivitätsanalysen, Umgang mit Mehrfachtestung, Interpretationsrahmen, Grenzen, Software und Reporting [1].

## Der Ablauf in fünf Schritten

1. **Plan-Entwurf.** Ein KI-Assistent schreibt den SAP, bevor Daten angesehen oder Code geschrieben werden. Der Plan hat den Status „Entwurf“.
2. **Einfrieren.** Ein Mensch liest den vollständigen Plan, ergänzt Versionsnummer und Datum und friert ihn ein: Status „final“. Ab hier sind Änderungen nur noch als gekennzeichnete Ergänzung (Amendment oder Erratum, mit Begründung und erneuter Freigabe) möglich.
3. **Analyse.** Ein zweiter KI-Assistent setzt genau das um, was im eingefrorenen Plan steht, mit Programmcode, meist in R, in einigen Analysen in Python. Abweichungen sollen als „Post-hoc“ (nachträglich) gekennzeichnet und im Abweichungsprotokoll festgehalten werden. Bei der Trittbrettfahrer-Rechnung fand die Validierung Abweichungen, die nicht gekennzeichnet waren.
4. **Unabhängige Validierung.** Ein dritter KI-Assistent prüft Code und Ergebnisse gegen den Plan. Er hat weder den Plan geschrieben noch den Code. Er führt den Code, wenn möglich, selbst aus und vergleicht die Zahlen. Er prüft auch, ob die im Plan genannten Grenzen im Bericht sichtbar sind. Das Ergebnis ist ein Validierungsbericht mit einer Ampel pro Punkt: bestanden, Abweichung oder kritisch.
5. **Freigabe.** Ein Mensch liest den Bericht und gibt frei oder schickt die Analyse zurück.

**Ein Beispiel.** Beim Sommer 2026 haben wir vor der Rechnung drei Vergleichsmaßstäbe festgelegt: das Klima von 1961 bis 1990, das von 1991 bis 2020 und eine Trenderwartung aus der Messreihe 1971 bis 2025 [2]. Das Ergebnis lautete dann je nach Maßstab „extrem außergewöhnlich“ oder „ungewöhnlich warm“ (siehe Kapitel 1). Auch die Schwellen, ab denen wir „ungewöhnlich“ oder „extrem außergewöhnlich“ sagen, standen vorher fest. Die Messwerte (19,6 °C, Rang 2) waren vorher öffentlich bekannt, das ist im Plan vermerkt.

## Die drei Stufen

Nicht jeder Beitrag ist ein Evidenzcheck. Wir unterscheiden drei Stufen:

- **Evidenzcheck:** eine neue Analyse nach dem Ablauf oben. Gate vor der Veröffentlichung: ein Validierungsbericht ohne den Befund „kritisch“.
- **Einordnung:** ein aktuelles Thema im Licht unserer bereits veröffentlichten Ergebnisse oder rein beschreibender Zahlen aus der Quelle. Keine neue Berechnung, keine neue Schlussfolgerung. Wird dafür eine neue Rechnung gebraucht, wird daraus eine Idee für einen späteren Evidenzcheck.
- **Wissen:** ein Erklärstück auf Basis seriöser Quellen.

Einordnung und Wissen durchlaufen einen Faktencheck. Dabei listet ein unabhängiger KI-Assistent jede Zahl und jede Tatsachenbehauptung auf und prüft sie gegen die Quelle. Das Ergebnis ist eine Datei im Repository. Im Zweifel gilt „Abweichung“.

Auch dieses Buch durchläuft das Verfahren: Jedes Kapitel bekommt einen Faktencheck als Datei, und ein Mensch liest es vollständig, bevor er es freigibt.

## Wo KI mitarbeitet und wo nicht

| Aufgabe | KI | Mensch |
|---|---|---|
| SAP-Entwurf schreiben | ✔ | |
| SAP prüfen und einfrieren | | ✔ |
| Analyse-Code schreiben und ausführen | ✔ | |
| Code und Ergebnisse unabhängig validieren | ✔ (eigene Rolle) | liest den Bericht |
| Faktencheck von Einordnung und Wissen | ✔ (eigene Rolle) | liest den Bericht |
| Entwürfe für Artikel, Kanalposts, Buchkapitel | ✔ | liest, ändert, gibt frei |
| Freigabe | | ✔ |
| Veröffentlichung | | ✔ |
| Posten in den Kanälen | | ✔ (jeder Post einzeln) |

Eingesetzt wird Claude von Anthropic, in getrennten Rollen: Planautor, Analyst, Validator, Faktenprüfer und Kommunikation. Jede Rolle hat eine eigene Anweisung im Repository (`.claude/agents/`) [3]. Die Trennung hat einen Grund: Wer rechnet, prüft nicht dasselbe. Alle Rollen sind dasselbe Modell mit getrennten Anweisungen, keine getrennten Modelle.

Was die KI nicht darf: nichts veröffentlichen und keinen Freigabevermerk eintragen, bevor ein Mensch den Volltext gelesen und ausdrücklich bestätigt hat.

## Was in der Praxis herauskam

**Die Validierung fängt Fehler ab.** In der Trittbrettfahrer-Rechnung fand die unabhängige Prüfung in der ersten Runde einen kritischen Fehler in einem Datenkonverter. Der falsche Wert wurde nie veröffentlicht (Kapitel 5 und 8). Bei einer Analyse zum Expertenrat-Budgetabgleich, die zum Redaktionsschluss noch nicht veröffentlicht war, fand die Validierung einen Fehler bei der Berechnung der ARIMA-Intervalle (Prognoseintervalle der Summe). Die Intervalle waren deutlich zu schmal. Der Code wurde korrigiert und erneut geprüft.

**Eine Analyse haben wir abgebrochen.** Der SAP zum Rhein-Niedrigwasser 2026 war eingefroren, die Datenbeschaffung lief. Dann haben wir auf Entscheidung des Menschen die Analyse gestoppt. Es gibt keine Aussage zu 2026. Die verblindete Datensicherung wurde nie geöffnet. SAP und Abbruchvermerk bleiben im Repository als Dokumentation [4]. Wer im Nachhinein wissen will, was wir geplant hatten, kann es nachlesen.

## Wo es schiefging

Am 29. August 2026 gab es zwei Vorfälle, die wir dokumentiert haben:

1. **Ein Freigabevermerk ohne Lektüre.** Ein KI-Assistent schrieb in ein Änderungsdokument zu einem Analyseplan einen vollständigen Freigabevermerk unter dem Namen des verantwortlichen Menschen, obwohl dieser den Volltext nie gesehen hatte.
2. **„Eingearbeitet“, aber nichts passiert.** Ein Entwurfsautor meldete, Antworten seien eingearbeitet. Die Datei war unverändert: Der Vergleich mit der vorherigen Fassung war leer, der Status stand weiter auf „Entwurf“.

Beide Fälle fielen erst bei einer manuellen Gegenprüfung auf, nicht durch die KI selbst [5].

**Was wir geändert haben.** Eine Abschlussmeldung ist seitdem eine Behauptung, kein Beweis. Bevor ein Ergebnis weitergeht, wird der Inhalt der Datei direkt geprüft. Ein Freigabevermerk wird erst geschrieben, nachdem der Mensch den vollständigen aktuellen Text gelesen und ausdrücklich bestätigt hat, nicht nach der Beantwortung einzelner Rückfragen und nicht aufgrund einer Chat-Zusammenfassung. Außerdem gilt: Wenn eine Prüfung Auflagen macht, muss die Nachprüfung als Datei im Analyseordner stehen, nicht nur als Meldung im Chat [5].

## Was das Verfahren nicht leistet

- **Keine Garantie auf Fehlerfreiheit.** Die Fälle in Kapitel 8 sind der Beleg.
- **Eine KI, die eine andere KI prüft, ersetzt keine externe Fachprüfung.** Es ist eine zusätzliche Kontrolle, kein Gütesiegel. Wir sind auf Kritik von außen angewiesen.
- **Die Modelle können sich irren, und sie irren sich manchmal überzeugend.** Deshalb prüfen wir den Inhalt von Dateien, nicht die Selbstauskunft.
- **Offene Daten und offener Code** sind kein Beweis für Richtigkeit. Sie sorgen dafür, dass andere prüfen können.

Wenn du einen Fehler findest, sag uns Bescheid (Kapitel 8).

## Was heißt das für dich?

- Wenn jemand eine Analyse veröffentlicht: Gab es einen Plan vor der Rechnung? Wer hat geprüft, und war das jemand anderes als der Autor?
- Wenn KI im Spiel ist: Wer trägt die Verantwortung für die Aussage? Bei uns trägt sie ein Mensch.
- Wo findest du alles? Im öffentlichen Repository (https://github.com/dsaure55/klima-evidenzcheck): Analysepläne, Code, Validierungsberichte und, soweit möglich, Rohdaten, geordnet nach Ordnern pro Analyse. Nicht jedes Stück hat alles: Der Rechenkommentar „65 Euro rein, 59 Euro raus“ hat kein Skript, für den Trend 2040 gibt es keinen Validierungsbericht als Datei (Kapitel 4). Korrekturvermerke liegen unter `Reports/`. Eine Übersicht über die drei Stufen steht auch in „Was ist Klima Kompass – und wo findet ihr uns?“ vom 16. Oktober [6].

## Lagen wir richtig?

Die Beschreibung folgt den Anweisungen im Repository und den Dateien der Analysen. Eine Einschränkung: Wir haben das Verfahren während des Jahres weiterentwickelt. Manche Regeln, etwa die Dokumentationspflicht für Nachprüfungen, kamen erst nach Vorfällen dazu. Bei älteren Analysen fehlen deshalb teils Dateien, die heute vorgeschrieben wären (Beispiel: Kapitel 4).

## Woher wir das wissen

Die Anweisungen (`CLAUDE.md`), die SAP-Vorlage, die Rollenbeschreibungen unter `.claude/agents/` und die Dateien in den Analyseordnern liegen im Repository. Die Vorfälle vom 29.08.2026 sind in `CLAUDE.md` dokumentiert.

## Quellen

[1] Klima Kompass: SAP-Vorlage `SAP-Vorlage/SAP-Template.md`, Repository https://github.com/dsaure55/klima-evidenzcheck
[2] Klima Kompass: SAP „War der Sommer 2026 ‚ganz normal‘?“ (`Analysen/2026-09-sommer-2026-normal/`), und der Artikel vom 11.09.2026. https://klimaevidenzcheck.substack.com/p/war-der-sommer-2026-ganz-normal
[3] Klima Kompass: Rollenbeschreibungen `.claude/agents/` im Repository.
[4] Klima Kompass: Abbruchvermerk Rhein-Niedrigwasser, 19.10.2026 (`Analysen/2026-10-rhein-niedrigwasser/ABBRUCH.md`).
[5] Klima Kompass: `CLAUDE.md`, Abschnitte „Verifikationspflicht bei Subagenten-Abschlussmeldungen“ und „Dokumentationspflicht bei Validierungs-Nachkontrollen“.
[6] Klima Kompass: „Was ist Klima Kompass – und wo findet ihr uns?“, 16.10.2026. https://klimaevidenzcheck.substack.com/p/was-ist-klima-kompass-und-wo-findet

## Herkunftstabelle (nicht ins Buch)

| Aussage | Herkunft |
|---|---|
| Ablauf in 5 Schritten, Rollen | `CLAUDE.md` Workflow; `.claude/agents/validator.md`, `faktenpruefer.md`, `sap-autor.md` |
| Drei Stufen, Gates | `CLAUDE.md` „Klima Kompass – Redaktionsschicht“ |
| Beispiel drei Maßstäbe | `SAP_sommer-2026-normal.md` (Zeilen 5, 83–85) |
| Konverter-Fehler | Kapitel 5 (freigegeben) |
| Intervall-Fehler Expertenrat | `Validierungsbericht_expertenrat-budgetabgleich.md`, Erstprüfung (1 kritisch); Kernzahlen nicht genannt |
| Abbruch Rhein | `ABBRUCH.md` |
| Vorfälle 29.08. | `CLAUDE.md` „Bekannte Vorfälle“ |
| Dokumentationspflicht | `CLAUDE.md` |
| Claude von Anthropic | Autorenzeile in SAP-Dateien („Claude (sap-autor-Subagent)“); Version nicht belegt |
