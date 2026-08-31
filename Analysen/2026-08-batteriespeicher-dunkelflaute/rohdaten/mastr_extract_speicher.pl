#!/usr/bin/perl
# SAP 3 / Struktur-Check Schritt 3: MaStR-Extraktion fuer Kapazitaetsszenario
# 3(a). Liest die (sehr grossen, UTF-16-kodierten) MaStR-Rohdatenexporte
# EinheitenStromSpeicher_*.xml (Leistung, Betriebsstatus, Inbetriebnahmedatum
# je Speichereinheit) und AnlagenStromSpeicher_*.xml (nutzbare
# Speicherkapazitaet je Speicheranlage, verknuepft mit einer Einheit) ein,
# verknuepft beide ueber die MaStR-Nummer und aggregiert zu EINER kleinen
# Summenzeile (siehe Skriptkopf batteriespeicher-dunkelflaute.R fuer die
# Begruendung, warum diese sehr grosse Rohdatenmenge NICHT in R, sondern
# hier in Perl verarbeitet wird).
#
# Statuscodes (verifiziert gegen rohdaten/mastr/extracted/Katalogwerte_utf8.xml,
# KatalogKategorieId=4 "Betriebsstatus"):
#   31 = In Planung          (SAP 4: ausgeschlossen)
#   35 = In Betrieb          (SAP 4: EINGESCHLOSSEN)
#   37 = Voruebergehend stillgelegt (SAP 4: ausgeschlossen)
#   38 = Endgueltig stillgelegt     (SAP 4: ausgeschlossen)
#
# Einheiten: Nettonennleistung in kW, NutzbareSpeicherkapazitaet in kWh
# (verifiziert durch Plausibilitaetspruefung an Einzelfaellen, siehe
# run_log.txt: z. B. Einheit SEE973635767818, Nettonennleistung "1.500"
# [=1,5 kW, typische Heimspeicher-Wechselrichterleistung], verknuepfte
# Anlage SSE951549344691, NutzbareSpeicherkapazitaet "6.500" [=6,5 kWh,
# typische Heimspeicher-Kapazitaet] -> Verhaeltnis 6,5 kWh / 1,5 kW = 4,3h
# Speicherdauer, plausibel fuer PV-Heimspeicher).
#
# Usage: perl mastr_extract_speicher.pl <extracted_dir> <output_summary_csv> <stichtag YYYY-MM-DD>

use strict;
use warnings;

my ($dir, $outfile, $stichtag) = @ARGV;
die "Usage: perl mastr_extract_speicher.pl <extracted_dir> <output_csv> <stichtag>\n"
  unless $dir && $outfile && $stichtag;

sub read_utf16_as_utf8 {
  my ($path) = @_;
  open(my $fh, "-|", "iconv", "-f", "UTF-16", "-t", "UTF-8", $path) or die "iconv failed for $path: $!";
  local $/;
  my $content = <$fh>;
  close($fh);
  return $content;
}

sub extract_tag {
  my ($record, $tag) = @_;
  if ($record =~ /<\Q$tag\E>([^<]*)<\/\Q$tag\E>/) {
    return $1;
  }
  return undef;
}

# ---- Pass 1: EinheitenStromSpeicher_*.xml -> %einheit_status, %einheit_leistung ----
my %einheit_status;    # EinheitMastrNummer -> Betriebsstatus-Code (numeric string)
my %einheit_leistung;  # EinheitMastrNummer -> Nettonennleistung (kW, numeric)
my $n_einheiten = 0;

opendir(my $dh, $dir) or die "Cannot open $dir: $!";
my @einheiten_files = sort grep { /^EinheitenStromSpeicher_\d+\.xml$/ } readdir($dh);
closedir($dh);
die "No EinheitenStromSpeicher_*.xml files found in $dir\n" unless @einheiten_files;

for my $f (@einheiten_files) {
  print "Verarbeite $f ...\n";
  my $content = read_utf16_as_utf8("$dir/$f");
  my @records = split(/<\/EinheitStromSpeicher>/, $content);
  for my $rec (@records) {
    next unless $rec =~ /<EinheitMastrNummer>/;
    my $id = extract_tag($rec, "EinheitMastrNummer");
    next unless defined $id;
    my $status = extract_tag($rec, "EinheitBetriebsstatus");
    my $leistung = extract_tag($rec, "Nettonennleistung");
    $einheit_status{$id} = $status // "";
    $einheit_leistung{$id} = defined($leistung) ? $leistung + 0 : undef;
    $n_einheiten++;
  }
}
print "Einheiten (Speicher) gelesen: $n_einheiten\n";

# ---- Pass 2: AnlagenStromSpeicher_*.xml -> aggregieren ----
opendir($dh, $dir) or die "Cannot open $dir: $!";
my @anlagen_files = sort grep { /^AnlagenStromSpeicher_\d+\.xml$/ } readdir($dh);
closedir($dh);
die "No AnlagenStromSpeicher_*.xml files found in $dir\n" unless @anlagen_files;

my $n_anlagen = 0;
my $n_anlagen_matched = 0;      # Anlage hat eine verknuepfte Einheit mit Status "In Betrieb"
my $n_mit_kapazitaet = 0;       # ... UND hat NutzbareSpeicherkapazitaet befuellt
my $sum_kapazitaet_kwh = 0;
my %einheiten_mit_anlage;       # welche Einheiten wurden ueber eine Anlage erfasst (fuer Nennleistungssumme unten)

# ---- Post-hoc Ergaenzung (Abweichung vom SAP - Ruckfrage an Mensch, siehe
# Skriptkopf batteriespeicher-dunkelflaute.R und run_log.txt fuer die volle
# Begruendung): Plausibilitaetspruefung des Feldes NutzbareSpeicherkapazitaet
# (SAP 3, Struktur-Check Schritt 3, verbindlich VOR Berechnung von 3(a)
# vorgeschrieben). Es wird zusaetzlich zur Roh-Summe eine Reihe
# schwellenwert-gekappter Summen berechnet, um sichtbar zu machen, wie stark
# einzelne extreme Ausreisserwerte die Roh-Summe dominieren. ----
my @outlier_thresholds_kwh = (100000, 200000, 300000, 500000, 1000000); # 100/200/300/500/1000 MWh
my %sum_capped = map { $_ => 0 } @outlier_thresholds_kwh;
my %n_excluded = map { $_ => 0 } @outlier_thresholds_kwh;
my @top_values; # groesste Einzelwerte (kWh) fuer Dokumentation/Transparenz

for my $f (@anlagen_files) {
  print "Verarbeite $f ...\n";
  my $content = read_utf16_as_utf8("$dir/$f");
  my @records = split(/<\/AnlageStromSpeicher>/, $content);
  for my $rec (@records) {
    next unless $rec =~ /<MaStRNummer>/;
    $n_anlagen++;
    my $kap = extract_tag($rec, "NutzbareSpeicherkapazitaet");
    my $verknuepft = extract_tag($rec, "VerknuepfteEinheitenMaStRNummern");
    next unless defined $verknuepft && $verknuepft ne "";
    # Kann theoretisch mehrere, durch Leerzeichen/Komma getrennte IDs enthalten;
    # fuer Speicheranlagen praxisueblich genau eine verknuepfte Einheit.
    my ($einheit_id) = split(/[\s,]+/, $verknuepft);
    next unless defined $einheit_id && exists $einheit_status{$einheit_id};
    next unless ($einheit_status{$einheit_id} // "") eq "35"; # SAP 4: nur "In Betrieb"
    $n_anlagen_matched++;
    $einheiten_mit_anlage{$einheit_id} = 1;
    if (defined $kap && $kap ne "") {
      $n_mit_kapazitaet++;
      my $kapv = $kap + 0;
      $sum_kapazitaet_kwh += $kapv;
      for my $t (@outlier_thresholds_kwh) {
        if ($kapv > $t) { $n_excluded{$t}++; } else { $sum_capped{$t} += $kapv; }
      }
      push @top_values, $kapv if $kapv > 100000; # > 100 MWh, fuer Top-Liste
    }
  }
}
print "Anlagen (Speicher) gelesen: $n_anlagen, davon mit 'In Betrieb'-Einheit verknuepft: $n_anlagen_matched, davon mit befuellter Kapazitaet: $n_mit_kapazitaet\n";
@top_values = sort { $b <=> $a } @top_values;
print "PLAUSIBILITAETSPRUEFUNG (SAP 3, Struktur-Check Schritt 3): ", scalar(@top_values),
      " Anlagen ('In Betrieb') mit NutzbareSpeicherkapazitaet > 100 MWh je Einzelanlage.\n";
print "Top-Werte (kWh, absteigend, max. 30): ", join(",", @top_values[0..($#top_values < 29 ? $#top_values : 29)]), "\n";
for my $t (@outlier_thresholds_kwh) {
  printf "  Schwelle %d kWh (%.0f MWh): %d Anlagen ausgeschlossen, verbleibende Summe = %.3f GWh (Rohsumme = %.3f GWh)\n",
    $t, $t/1000, $n_excluded{$t}, $sum_capped{$t}/1e6, $sum_kapazitaet_kwh/1e6;
}

# ---- Nettonennleistung: Summe ueber ALLE Einheiten mit Status "In Betrieb"
#      (unabhaengig davon, ob eine Anlage/Kapazitaetsangabe existiert - SAP 3:
#      "amtliches Register aller Stromspeicheranlagen inkl. Nennleistung ...") ----
my $n_einheiten_in_betrieb = 0;
my $sum_leistung_kw = 0;
for my $id (keys %einheit_status) {
  if ($einheit_status{$id} eq "35") {
    $n_einheiten_in_betrieb++;
    $sum_leistung_kw += ($einheit_leistung{$id} // 0);
  }
}
print "Einheiten 'In Betrieb': $n_einheiten_in_betrieb, Summe Nettonennleistung: $sum_leistung_kw kW\n";

open(my $out, ">", $outfile) or die "Cannot write $outfile: $!";
print $out "stichtag,n_einheiten_in_betrieb,sum_nettonennleistung_mw,n_anlagen_gesamt,n_anlagen_in_betrieb_verknuepft,n_mit_nutzbarer_kapazitaet,sum_nutzbare_kapazitaet_mwh,";
print $out join(",", map { "sum_kapazitaet_capped_${_}kwh_mwh,n_excluded_${_}kwh" } @outlier_thresholds_kwh);
print $out "\n";
printf $out "%s,%d,%.6f,%d,%d,%d,%.6f,",
  $stichtag, $n_einheiten_in_betrieb, $sum_leistung_kw / 1000,
  $n_anlagen, $n_anlagen_matched, $n_mit_kapazitaet, $sum_kapazitaet_kwh / 1000;
print $out join(",", map { sprintf("%.6f,%d", $sum_capped{$_} / 1000, $n_excluded{$_}) } @outlier_thresholds_kwh);
print $out "\n";
close($out);
print "Zusammenfassung geschrieben nach $outfile\n";

# Separate Top-Werte-Liste fuer Dokumentation/Nachvollziehbarkeit (Beleg fuer
# die Abweichungsmeldung, nicht Teil der eigentlichen Kernanalyse).
my $topfile = $outfile;
$topfile =~ s/\.csv$/_top_ausreisser.csv/;
open(my $tout, ">", $topfile) or die "Cannot write $topfile: $!";
print $tout "rang,nutzbare_speicherkapazitaet_kwh,nutzbare_speicherkapazitaet_mwh\n";
for my $i (0..$#top_values) {
  printf $tout "%d,%.3f,%.3f\n", $i + 1, $top_values[$i], $top_values[$i] / 1000;
}
close($tout);
print "Top-Ausreisser-Liste geschrieben nach $topfile (", scalar(@top_values), " Anlagen > 100 MWh)\n";
