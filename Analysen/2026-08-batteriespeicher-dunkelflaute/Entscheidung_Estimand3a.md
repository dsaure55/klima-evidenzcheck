# Entscheidung zu Estimand 3(a): Wahl der MaStR-Variante

**Datum:** 31.08.2026
**Entschieden von:** Daniel Saure
**Bezug:** SAP_batteriespeicher-dunkelflaute.md (final, v1.0), Abweichungshinweis in
`output/pflicht_disclaimer.txt` und `output/tabelle2b_deckungsgrad_verteilungsstatistik.csv`

## Ausgangslage

Der analyst-Subagent fand, dass die wörtliche SAP-Umsetzung für Estimand 3(a) (aktuell
installierte/nutzbare Batteriespeicherkapazität aus dem MaStR-Gesamtdatenexport) eine
implausible Rohsumme von **1.144,8 GWh** ergibt. Ursache: 50 von 2.724.033 Speichereinheiten
(< 0,002 %) mit offensichtlich fehlerhaften Kapazitätswerten (größter Einzelwert 157.252 MWh
– größer als der gesamte unabhängig berichtete deutsche Batteriespeicherbestand) verursachen
97,25 % dieser Summe. Der Analyst hat dies nicht eigenmächtig korrigiert, sondern drei Varianten
transparent berechnet und die Auswahl explizit dem Menschen überlassen (SAP-konform, siehe
Disclaimer).

## Entscheidung

**Für den Ergebnisbericht gilt die Variante "3a-BEREINIGT" (31,5 GWh)** – Post-hoc-Ausschluss
aller Einzelanlagen mit MaStR-Kapazitätswert > 100 MWh, Ergebnis liegt nahe an der
IWR-Sekundärschätzung (Prognose Jahresende 2026: ~35 GWh) und an der BVES-Kreuzprüfung
(24 GWh) – deutlich plausibler als die MaStR-Rohsumme.

## Zwingende Auflage: prominente Kennzeichnung überall dort, wo diese Zahl verwendet wird

Dies ist eine **Post-hoc-Abweichung vom wörtlichen SAP-Wortlaut** (der SAP spezifiziert die
MaStR-Rohsumme, nicht deren Bereinigung) und muss in jedem Kontext, in dem die 31,5-GWh-Zahl
für Estimand 3(a) verwendet wird – R-Output, Validierungsbericht, Report-Entwürfe (Substack/
LinkedIn) – **unübersehbar** wie folgt gekennzeichnet werden, nicht nur in einer Fußnote:

> **Post-hoc-Bereinigung (nicht im SAP spezifiziert):** Die MaStR-Rohdaten für die aktuelle
> Speicherkapazität enthielten ein Cluster offensichtlicher Dateneingabefehler (50 von
> 2,72 Mio. Anlagen verursachten 97,25 % einer sonst 46-fach überhöhten Summe). Der berichtete
> Wert (31,5 GWh) beruht auf einem nachträglich festgelegten Ausschlusskriterium
> (Einzelanlagen > 100 MWh), nicht auf der wörtlichen SAP-Berechnung. Rohsumme (1.144,8 GWh,
> nicht plausibel) und unabhängige Kreuzprüfung (BVES, 24 GWh) sind in
> `output/tabelle2b_deckungsgrad_verteilungsstatistik.csv` vollständig dokumentiert.

## Nächster Schritt

Diese Entscheidung wird dem validator-Subagenten zur unabhängigen Prüfung vorgelegt –
insbesondere: ist das 100-MWh-Ausschlusskriterium selbst sauber begründet/nachvollziehbar,
und wird die geforderte Kennzeichnung in den Analyse-Outputs tatsächlich konsequent
eingehalten?
