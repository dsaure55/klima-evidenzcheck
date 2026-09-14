# Validierungsbericht – Schnellcheck Gasspeicher Winter 2026/27

**Datum:** 14.09.2026 · Zwei unabhängige Prüfrunden durch separate Agenten, die die
Kernzahlen mit eigenem Code neu gerechnet haben. Beide Runden endeten zunächst mit
„nicht veröffentlichungsreif".

## Runde 1 – Zahlen und Plan-Treue

**Bestätigt:** Einheitenumrechnung TJ(GCV)→TWh, Vorzeichenkonvention der
Bestandsveränderungen, Winterfenster ohne Doppelzählung, Schaltjahresgewichtung,
Entnahme 2025/26 = 133,654 TWh, 4/10 über 136 TWh, Clopper-Pearson 12,2–73,8 %,
Steigung −49,0953 (SE 13,837), R² 0,6114, Prognoseintervall inklusive +s²-Term korrekt
(Konfidenzintervall wäre 117,8–181,8 gewesen), Wintermittel 2025/26 = 4,4064 °C,
Referenzverteilung Mittel 4,2054 °C / 10. Perzentil 2,6864 °C, Extrapolation bestätigt.

**Beanstandet und korrigiert:**

| Nr. | Befund | Korrektur |
|---|---|---|
| V1 | 43 Nullwerte in `TI_EHG_MAP` sind Meldelücken, keine Nullen. Der Winter 2016/17 enthielt nur drei gemeldete Monate; die Aussage „Anstieg von 50 auf 113 TWh" war ein Artefakt | Nullwerte werden als fehlend behandelt; Vergleich erst ab dem ersten vollständig gemeldeten Winter 2017/18 (90 → 113 TWh, +25 %) |
| V2 | S2 lief ab 2008/09 (n = 18) statt wie im SAP ab 2014/15 (n = 12). Die dort flache Steigung (−12,8, R² 0,11) ist ein Artefakt des geringeren Meldeumfangs vor 2015 | S2 SAP-konform ab 2014/15: 5/12, Steigung −50,1, R² 0,57 – stabil. Das längere Fenster nur nachrichtlich mit Warnhinweis |
| V3 | S3 für E1, S4 vollständig sowie S1/S6 für E2 fehlten; S5 nicht als „nicht durchgeführt" gekennzeichnet | alle nachgerechnet und im Output ausgewiesen |
| V4 | Prognose bei 2,69 °C ist Extrapolation, über dem Maximum aller Beobachtungen, entspräche 37 % des Winterverbrauchs | im Output als Extrapolation markiert, in den Veröffentlichungstexten nicht verwendet |

## Runde 2 – Korrigierte Fassung, Grafik und Texte

**Bestätigt:** alle Zahlen der korrigierten Analyse, Deckung der Textzahlen mit dem
Output, Behebung von V1–V4, Übereinstimmung der Grafikpunkte mit den Daten.

**Beanstandet und korrigiert:**

| Nr. | Befund | Korrektur |
|---|---|---|
| V5 | Zahlendreher im Text: „14 statt 18 Prozent" – Richtung vertauscht | auf „18 statt 14 Prozent" korrigiert |
| V6 | Das im SAP präregistrierte Element „Anteil der Temperaturverteilung, bei dem die erwartete Entnahme 136 TWh übersteigt" fehlte | ergänzt: Schwelle 4,49 °C, 60 % der 30 Referenzwinter waren kälter |
| V7 | Kausalsatz „Der Ausbau von Wind und Sonne hat den Gasbedarf nicht entlastet" – nach SAP 2/E4 ausgeschlossen | ersetzt durch „Ein Rückgang ist in diesen Daten nicht erkennbar; über Ursachen sagen sie nichts" |
| V8 | Interessenlage beider Seiten und die konkrete INES-Aussage fehlten (SAP 8.6); ebenso das Argument, das für Müller spricht (SAP 8.3) | beides ergänzt |
| V9 | „136 TWh" ist ein Mitte-September-Stand; die Einspeicherung läuft bis November weiter | im Text als zweite Einschränkung ergänzt |
| V10 | Prognoseband in der Grafik durch `ylim` beschnitten – Unsicherheit optisch verkleinert; Titel enthielt eine Versorgungsaussage | Achsenbereich auf das volle Band erweitert; Titel auf die reine Datenaussage geändert |
| V11 | „Müllers Zahl ist bestätigt" war unpräzise – bestätigt ist die Entnahme, nicht der Speicherstand von 136 TWh | im Text klargestellt |
| V12 | Formulierungen „verschweigt", „erklärt 61 Prozent", „bewusst nicht berechnet" | entschärft auf „nicht zeigt", „gehen mit der Temperatur einher", „berichten wir nicht" |

## Offene Auflage vor Veröffentlichung

Die DWD-Werte wurden aus in den Chat eingefügtem Dateitext übernommen. Die sechs
Originaldateien sind nachzureichen und die übernommenen Werte gegen sie abzugleichen;
bis dahin bleibt ein Übertragungsfehler möglich. Innere Plausibilität (Monatsmuster,
Größenordnung, keine Ausreißer) wurde geprüft.
