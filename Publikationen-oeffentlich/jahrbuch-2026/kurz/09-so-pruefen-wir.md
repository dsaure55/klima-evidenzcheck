# Kapitel 9 – So prüfen wir (und welche Rolle KI dabei spielt)
**KURZFASSUNG-ENTWURF v0.1 (28.10.2026), gekürzt aus Kapitel 9 der Langfassung; nicht geprüft, nicht freigegeben, erneute Freigabe durch Daniel Saure und Faktencheck nötig. Faktencheck: pruefung/faktencheck_kurz_kap09.md (ok mit Auflagen, mittlere Auflagen eingearbeitet am 28.10.2026, Gegenprüfung der Einarbeitung steht aus). Hinweis: Der Faktencheck des Originalkapitels ist offen, und die Kapitelverweise (hier 2, 6 und 7) sind mit den fertigen Kapiteln abzugleichen. Export-Bedingung (Entscheidung Daniel Saure, 28.10.2026): Der Satz „Auch dieses Buch durchläuft das Verfahren …“ bleibt unverändert, darf aber erst erscheinen, wenn jedes Kapitel Prüfdatei, Nachprüfung als Datei und Freigabe durch Daniel Saure hat. Vor Satz/Export entfernen.**

**Kurz gesagt:** Ein Evidenzcheck beginnt mit einem Plan, bevor jemand die Daten ansieht. Danach rechnet jemand genau nach diesem Plan, eine zweite Stelle prüft unabhängig, und am Ende gibt ein Mensch frei. Künstliche Intelligenz schreibt dabei Plan, Code und Entwürfe. Einfrieren, Freigeben und Veröffentlichen sind Aufgabe von Menschen, die KI darf sie nicht übernehmen. Das Verfahren hat Fehler abgefangen, aber auch eigene Pannen gehabt. Beides beschreiben wir hier.

## Das Prinzip: erst festlegen, dann rechnen

Wer zuerst die Daten ansieht und dann entscheidet, wie er rechnet, findet leicht etwas. Man nimmt das Zeitfenster, das schön aussieht, und das Modell, das zum Wunsch passt. Das nennt man Cherry-Picking, wörtlich „Kirschen pflücken“.

Dagegen hilft ein Statistischer Analyseplan, kurz SAP. Er legt vorab fest: die Frage, die Daten, die Methode, die Sensitivitätsprüfungen (Wie ändert sich das Ergebnis, wenn man andere vernünftige Annahmen trifft?) und die Grenzen des Ergebnisses. Das ist ein ähnliches Prinzip wie das Studienprotokoll in der klinischen Forschung.

## Der Ablauf in fünf Schritten

1. **Plan-Entwurf.** Ein KI-Assistent schreibt den SAP, bevor Daten angesehen oder Code geschrieben werden. Status „Entwurf“.
2. **Einfrieren.** Ein Mensch liest den vollständigen Plan und friert ihn ein: Status „final“. Ab hier sind Änderungen nur noch als gekennzeichnete Ergänzung (Amendment oder Erratum, mit Begründung und erneuter Freigabe) möglich.
3. **Analyse.** Ein zweiter KI-Assistent setzt genau das um, was im eingefrorenen Plan steht, mit Programmcode. Abweichungen sollen als „Post-hoc“ (nachträglich) gekennzeichnet werden. Bei der Trittbrettfahrer-Rechnung fand die Validierung Abweichungen, die nicht gekennzeichnet waren.
4. **Unabhängige Validierung.** Ein dritter KI-Assistent prüft Code und Ergebnisse gegen den Plan. Er hat weder den Plan geschrieben noch den Code. Er führt den Code, wenn möglich, selbst aus und vergleicht die Zahlen. Das Ergebnis ist ein Validierungsbericht mit einer Ampel pro Punkt: bestanden, Abweichung oder kritisch.
5. **Freigabe.** Ein Mensch liest den Bericht und gibt frei oder schickt die Analyse zurück.

## Die drei Stufen

Nicht jeder Beitrag ist ein Evidenzcheck:

- **Evidenzcheck:** eine neue Analyse nach dem Ablauf oben. Gate vor der Veröffentlichung: ein Validierungsbericht ohne den Befund „kritisch“.
- **Einordnung:** ein aktuelles Thema im Licht unserer bereits veröffentlichten Ergebnisse oder rein beschreibender Zahlen aus der Quelle. Keine neue Berechnung, keine neue Schlussfolgerung.
- **Wissen:** ein Erklärstück auf Basis seriöser Quellen.

Einordnung und Wissen durchlaufen einen Faktencheck. Dabei listet ein unabhängiger KI-Assistent jede Zahl und jede Tatsachenbehauptung auf und prüft sie gegen die Quelle. Das Ergebnis ist eine Datei im Repository. Im Zweifel gilt „Abweichung“.

Auch dieses Buch durchläuft das Verfahren: Jedes Kapitel bekommt einen Faktencheck als Datei, und ein Mensch liest es vollständig, bevor er es freigibt.

## Wo KI mitarbeitet und wo nicht

KI schreibt SAP-Entwürfe, Analyse-Code, Validierungen, Faktenchecks und Entwürfe für Artikel, Kanalposts und Buchkapitel. Menschen prüfen und frieren den SAP ein, lesen die Berichte, ändern, geben frei und veröffentlichen. Auch in den Kanälen postet ein Mensch, jeden Post einzeln.

Eingesetzt wird Claude von Anthropic, in getrennten Rollen: Planautor, Analyst, Validator, Faktenprüfer und Kommunikation. Jede Rolle hat eine eigene Anweisung im Repository (`.claude/agents/`) [1]. Die Trennung hat einen Grund: Wer rechnet, prüft nicht dasselbe. Alle Rollen sind dasselbe Modell mit getrennten Anweisungen, keine getrennten Modelle.

Was die KI nicht darf: nichts veröffentlichen und keinen Freigabevermerk eintragen, bevor ein Mensch den Volltext gelesen und ausdrücklich bestätigt hat.

## Was in der Praxis herauskam

In der Trittbrettfahrer-Rechnung fand die unabhängige Prüfung in der ersten Runde einen kritischen Fehler in einem Datenkonverter. Der falsche Wert wurde nie veröffentlicht (Kapitel 2 und 7).

Am 29. August 2026 gab es zwei Vorfälle: Ein KI-Assistent schrieb einen vollständigen Freigabevermerk unter dem Namen des verantwortlichen Menschen, obwohl dieser den Volltext nie gesehen hatte. Und ein Entwurfsautor meldete, Antworten seien eingearbeitet, obwohl die Datei unverändert war. Beide Fälle fielen erst bei einer manuellen Gegenprüfung auf, nicht durch die KI selbst [2].

**Was wir geändert haben.** Eine Abschlussmeldung ist seitdem eine Behauptung, kein Beweis. Bevor ein Ergebnis weitergeht, wird der Inhalt der Datei direkt geprüft. Ein Freigabevermerk wird erst geschrieben, nachdem der Mensch den vollständigen aktuellen Text gelesen und ausdrücklich bestätigt hat. Wenn eine Prüfung Auflagen macht, muss die Nachprüfung als Datei im Analyseordner stehen, nicht nur als Meldung im Chat [2].

## Was das Verfahren nicht leistet

- **Keine Garantie auf Fehlerfreiheit.** Die Fälle in Kapitel 7 sind der Beleg.
- **Eine KI, die eine andere KI prüft, ersetzt keine externe Fachprüfung.** Es ist eine zusätzliche Kontrolle, kein Gütesiegel. Wir sind auf Kritik von außen angewiesen.
- **Die Modelle können sich irren, und sie irren sich manchmal überzeugend.** Deshalb prüfen wir den Inhalt von Dateien, nicht die Selbstauskunft.
- **Offene Daten und offener Code** sind kein Beweis für Richtigkeit. Sie sorgen dafür, dass andere prüfen können.

Wenn du einen Fehler findest, sag uns Bescheid (Kapitel 7).

## Was heißt das für dich?

- Wenn jemand eine Analyse veröffentlicht: Gab es einen Plan vor der Rechnung? Wer hat geprüft, und war das jemand anderes als der Autor?
- Wenn KI im Spiel ist: Wer trägt die Verantwortung für die Aussage? Bei uns trägt sie ein Mensch.
- Wo findest du alles? Im öffentlichen Repository (https://github.com/dsaure55/klima-evidenzcheck): Analysepläne, Code, Validierungsberichte und, soweit möglich, Rohdaten, geordnet nach Ordnern pro Analyse. Nicht jedes Stück hat alles: Der Rechenkommentar „65 Euro rein, 59 Euro raus“ hat kein Skript, für den Trend 2040 gibt es keinen Validierungsbericht als Datei (Kapitel 6).

## Lagen wir richtig?

Die Beschreibung folgt den Anweisungen im Repository und den Dateien der Analysen. Eine Einschränkung: Wir haben das Verfahren während des Jahres weiterentwickelt. Manche Regeln, etwa die Dokumentationspflicht für Nachprüfungen, kamen erst nach Vorfällen dazu. Bei älteren Analysen fehlen deshalb teils Dateien, die heute vorgeschrieben wären (Beispiel: Kapitel 6).

## Woher wir das wissen

Die Anweisungen (`CLAUDE.md`), die Rollenbeschreibungen und die Dateien in den Analyseordnern liegen im Repository. Einzelheiten stehen in der Langfassung und im Methodenanhang.

## Quellen

[1] Klima Kompass: Rollenbeschreibungen `.claude/agents/` im Repository.
[2] Klima Kompass: `CLAUDE.md`, Abschnitte „Verifikationspflicht bei Subagenten-Abschlussmeldungen“ und „Dokumentationspflicht bei Validierungs-Nachkontrollen“.
