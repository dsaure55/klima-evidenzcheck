#!/usr/bin/perl
# ------------------------------------------------------------------------
# xlsx_sheet_to_csv.pl
#
# TECHNISCHER WORKAROUND (siehe Kopfkommentar in trittbrettfahrer-rechnung.R,
# Abschnitt "Technischer Hinweis zur Datenaufbereitung"): Die R-Pakete
# readxl und xml2 fuehren in der Ausfuehrungsumgebung dieses Analyselaufs
# reproduzierbar zu Segmentation Faults (verifiziert wiederholt, auch mit
# den im readxl-Paket selbst mitgelieferten Beispieldateien und mit
# trivialen In-Memory-XML-Strings, unabhaengig vom Inhalt der EDGAR/GCP-
# Dateien) - es handelt sich um einen Umgebungsdefekt dieser R-4.6.1-
# Installation, nicht um eine SAP-Abweichung oder eine Manipulation der
# Rohdaten.
#
# Dieses Skript interpretiert NICHTS an den Daten, sondern liest
# ausschliesslich die vom OOXML-Standard vorgegebene, deterministische
# Rohstruktur (sheetN.xml + sharedStrings.xml) einer unveraendert von der
# Primaerquelle heruntergeladenen .xlsx-Datei (entpackt per Standard-
# `unzip`, keine Dateninterpretation) und schreibt sie 1:1 als CSV - genau
# die Zellwerte, die auch read_excel() extrahiert haette.
#
# Aufruf:
#   perl xlsx_sheet_to_csv.pl <sheetN.xml> <sharedStrings.xml|NONE> <out.csv>
#
# Vollstaendiger Ablauf pro Quelldatei (dokumentiert in
# rohdaten/DATENAUFBEREITUNG_LOG.txt):
#   1. unzip -o -q <datei>.xlsx -d <tmp-verzeichnis>
#   2. perl xlsx_sheet_to_csv.pl <tmp>/xl/worksheets/sheetN.xml \
#        <tmp>/xl/sharedStrings.xml csv/<name>.csv
#   (Sheet-Zuordnung ueber xl/workbook.xml + xl/_rels/workbook.xml.rels)
# ------------------------------------------------------------------------
use strict;
use warnings;

my ($sheet_path, $sst_path, $out_path) = @ARGV;
die "Usage: perl xlsx_sheet_to_csv.pl <sheet.xml> <sharedStrings.xml|NONE> <out.csv>\n"
    unless defined $out_path;

# --- shared strings einlesen -------------------------------------------
my @sst;
if ($sst_path ne "NONE") {
    local $/;
    open(my $fh, "<:encoding(UTF-8)", $sst_path) or die "Kann $sst_path nicht lesen: $!";
    my $content = <$fh>;
    close $fh;
    while ($content =~ /<si>(.*?)<\/si>/gs) {
        my $si = $1;
        my $text = "";
        while ($si =~ /<t[^>]*>(.*?)<\/t>/gs) {
            $text .= $1;
        }
        $text = xml_unescape($text);
        push @sst, $text;
    }
}

sub xml_unescape {
    my ($s) = @_;
    $s =~ s/&lt;/</g;
    $s =~ s/&gt;/>/g;
    $s =~ s/&quot;/"/g;
    $s =~ s/&apos;/'/g;
    $s =~ s/&amp;/&/g;
    return $s;
}

sub col_letters_to_num {
    my ($letters) = @_;
    my $n = 0;
    for my $c (split //, $letters) {
        $n = $n * 26 + (ord($c) - ord('A') + 1);
    }
    return $n;
}

# --- Sheet-XML einlesen --------------------------------------------------
my $content;
{
    local $/;
    open(my $fh, "<:encoding(UTF-8)", $sheet_path) or die "Kann $sheet_path nicht lesen: $!";
    $content = <$fh>;
    close $fh;
}

my @rows_out;
my $max_col = 0;

while ($content =~ /<row r="(\d+)"[^>]*>(.*?)<\/row>/gs) {
    my ($row_num, $row_body) = ($1, $2);
    my %rowdata;
    # BUGFIX (Validierungsbericht 31.08.2026, Auflage 1): Die vorherige Version
    # dieser Regex ( /<c r="([A-Z]+)(\d+)"([^>]*)>(.*?)<\/c>/gs ) erkannte NUR
    # Zellen mit explizitem Schliess-Tag <c ...>...</c>. Selbstschliessende
    # LEERE Zellen im OOXML-Format (<c r="B5" s="2"/>, ohne <v>) wurden dabei
    # NICHT als eigener (leerer) Treffer erkannt, sondern das ">" der
    # schliessenden "/>" wurde vom regulaeren ">" im Muster verschluckt und
    # der nicht-gierige Rumpf-Teil "(.*?)" lief bis zum naechsten "</c>"
    # weiter - d.h. der komplette Inhalt der NAECHSTEN Zelle wurde faelschlich
    # der LEEREN Zelle zugeordnet, waehrend die naechste Zelle selbst vom
    # Regex-Zeiger uebersprungen wurde. Ergebnis: alle Werte ab der ersten
    # leeren Zelle einer Zeile verschoben sich um eine Spaltenposition nach
    # links (systematischer Spalten-Versatz, siehe Validierungsbericht.md).
    #
    # Fix: Zwei getrennte Alternativen - (a) selbstschliessend "<c .../>" wird
    # explizit als LEERE Zelle erkannt (kein "/>"-Verschlucken mehr moeglich,
    # da die Alternative VOR dem generischen ">...</c>"-Zweig geprueft wird),
    # (b) normale Zelle mit Inhalt wie bisher.
    while ($row_body =~ /<c r="([A-Z]+)(\d+)"([^>]*?)\/>|<c r="([A-Z]+)(\d+)"([^>]*)>(.*?)<\/c>/gs) {
        my ($col_letters, $cell_row, $attrs, $cell_body);
        if (defined $1) {
            # Zweig (a): selbstschliessende, leere Zelle
            ($col_letters, $cell_row, $attrs, $cell_body) = ($1, $2, $3, "");
        } else {
            # Zweig (b): normale Zelle mit Inhalt
            ($col_letters, $cell_row, $attrs, $cell_body) = ($4, $5, $6, $7);
        }
        my $col_num = col_letters_to_num($col_letters);
        $max_col = $col_num if $col_num > $max_col;

        my $type = "";
        if ($attrs =~ /t="([^"]+)"/) { $type = $1; }

        my $value = "";
        if ($cell_body eq "") {
            # leere (selbstschliessende) Zelle -> Wert bleibt ""
        } elsif ($type eq "s") {
            if ($cell_body =~ /<v>(\d+)<\/v>/) {
                my $idx = $1;
                $value = defined($sst[$idx]) ? $sst[$idx] : "";
            }
        } elsif ($type eq "inlineStr") {
            if ($cell_body =~ /<t[^>]*>(.*?)<\/t>/s) {
                $value = xml_unescape($1);
            }
        } elsif ($type eq "str") {
            if ($cell_body =~ /<v>(.*?)<\/v>/s) {
                $value = xml_unescape($1);
            }
        } else {
            if ($cell_body =~ /<v>(.*?)<\/v>/s) {
                $value = $1;
            }
        }
        $value =~ s/"/""/g;
        if ($value =~ /[",\n]/) { $value = "\"$value\""; }
        $rowdata{$col_num} = $value;
    }
    push @rows_out, { row => $row_num, data => { %rowdata } };
}

open(my $out, ">:encoding(UTF-8)", $out_path) or die "Kann $out_path nicht schreiben: $!";
for my $r (@rows_out) {
    my @line;
    for my $c (1 .. $max_col) {
        push @line, exists($r->{data}{$c}) ? $r->{data}{$c} : "";
    }
    print $out join(",", @line), "\n";
}
close $out;

print "OK: ", scalar(@rows_out), " Zeilen, $max_col Spalten -> $out_path\n";
