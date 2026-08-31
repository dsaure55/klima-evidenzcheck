#!/usr/bin/perl
# Converts SMARD chart_data JSON chunk files (one per week) into a single
# combined CSV per filter: timestamp_ms,value
#
# Reason (Post-hoc, technical workaround, NOT a SAP-content deviation):
# In this R 4.6.1 installation, jsonlite::fromJSON() as well as base R's own
# regexpr()/gregexpr()/strsplit() reproducibly and *unpredictably* (not tied
# to a fixed input size - the same code succeeds on retry) crash the R
# process (Segmentation fault) when applied to longer strings / character
# vectors with many elements. This is a defect of this R installation, not a
# SAP or data problem (analogous to the readxl/xml2/unzip/download.file
# segfaults documented in Analysen/2026-08-trittbrettfahrer-rechnung/
# rohdaten/DATENAUFBEREITUNG_LOG.txt for a prior analysis in this project).
# Workaround: JSON -> CSV conversion is done here in Perl (stable, tested),
# so that R only ever has to do numeric-only read.csv() + vectorized
# arithmetic, which was verified NOT to crash (see run_log.txt / R script
# header for the verification steps performed before adopting this
# approach).
#
# Input JSON structure (verified in this project, not assumed):
#   {"meta_data":{...},"series":[[ts_ms,val],[ts_ms,val],...,[ts_ms,null],...]}
# "null" values (SMARD's own encoding of missing quarter-hour data points)
# are written through as an empty CSV field (parsed as NA in R).
#
# Usage: perl smard_to_csv.pl <filter_dir> <output_csv>
#   <filter_dir>: directory containing the *.json chunk files for one filter
#   <output_csv>: path of the combined output CSV (overwritten)

use strict;
use warnings;

my ($indir, $outcsv) = @ARGV;
die "Usage: perl smard_to_csv.pl <filter_dir> <output_csv>\n" unless $indir && $outcsv;

opendir(my $dh, $indir) or die "Cannot open $indir: $!";
my @files = sort grep { /\.json$/ } readdir($dh);
closedir($dh);
die "No .json files found in $indir\n" unless @files;

open(my $out, ">", $outcsv) or die "Cannot write $outcsv: $!";
print $out "ts_ms,value\n";

my $total_pairs = 0;
my $total_null = 0;
for my $f (@files) {
  open(my $in, "<:raw", "$indir/$f") or die "Cannot read $indir/$f: $!";
  local $/;
  my $content = <$in>;
  close($in);

  # Locate the series array. Simple, bounded (non-catastrophic) matching:
  # find the literal marker, then scan character-by-character for pairs
  # "[<num_or_null>,<num_or_null>]" - avoids any greedy/backtracking regex
  # over the whole (long) string, which is what triggered the crashes above.
  my $marker = '"series":';
  my $pos = index($content, $marker);
  die "No 'series' key found in $f\n" if $pos < 0;
  $pos += length($marker);

  my $len = length($content);
  # Skip whitespace, then the single outer "[" that opens the series array
  # (the array is "series": [[ts,val], [ts,val], ...] - note the OUTER
  # bracket before the first pair's own "[" ). Verified against the raw
  # JSON structure of the downloaded chunk files (see run_log.txt).
  while ($pos < $len && substr($content, $pos, 1) =~ /\s/) { $pos++; }
  if (substr($content, $pos, 1) eq '[') { $pos++; }

  my $n_pairs_this_file = 0;
  while ($pos < $len) {
    my $c1 = substr($content, $pos, 1);
    last if $c1 eq ']' && substr($content, $pos, 2) eq ']]'; # end of outer array (no trailing comma case)
    if ($c1 eq '[') {
      my $close = index($content, ']', $pos);
      last if $close < 0;
      my $pair = substr($content, $pos + 1, $close - $pos - 1);
      my ($ts, $val) = split(/,/, $pair, 2);
      if (defined($val) && $val eq 'null') {
        print $out "$ts,\n";
        $total_null++;
      } elsif (defined($ts) && defined($val)) {
        print $out "$ts,$val\n";
      }
      $n_pairs_this_file++;
      $total_pairs++;
      $pos = $close + 1;
    } else {
      $pos++;
      last if $c1 eq ']'; # reached end of outer series array
    }
  }
}
close($out);

print "Files processed: ", scalar(@files), "\n";
print "Total pairs written: $total_pairs (of which null/missing: $total_null)\n";
