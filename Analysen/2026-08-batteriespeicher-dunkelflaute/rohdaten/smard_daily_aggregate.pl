#!/usr/bin/perl
# SAP 2.1 / 3 / 4 / 5.1: Aggregation of SMARD quarter-hour chart_data values
# (already converted from JSON to raw ts_ms,value CSV by smard_to_csv.pl) to
# Europe/Berlin calendar-day sums (GWh-scale kept as MWh here; conversion to
# GWh happens in R).
#
# WHY THIS RUNS IN PERL, NOT R (Post-hoc, technical necessity - NOT a SAP
# content deviation): see header comment in smard_to_csv.pl for the full
# background. In addition to jsonlite/regex crashes, this R 4.6.1
# installation was verified (see run_log.txt) to also reliably crash
# (Segmentation fault) on:
#   - readLines() of a ~410,000-line file
#   - read.csv()/scan()/readr::read_csv() of the same file
#   - as.POSIXct()/as.Date() timezone conversion of a ~410,000-element
#     numeric vector
# i.e. this is not specific to JSON/regex, but a general instability of this
# R build with large character-vector or timezone-database operations. Pure
# numeric vector arithmetic on vectors of the same size (e.g. sum(1:410000))
# was verified to work reliably. The chosen, tested-stable division of
# labour is therefore: all per-quarter-hour text/date processing happens
# here in Perl (fast, deterministic, unit-tested against known German DST
# transition dates - see run_log.txt); R receives only a small
# (~4,300-row) already daily-aggregated numeric CSV per series, which is
# well within the range verified to work reliably in R (see run_log.txt).
#
# DST handling (Europe/Berlin): EU-wide DST rule, unchanged 1996-present:
# clocks go forward 1h (CET->CEST) at 01:00 UTC on the last Sunday of March;
# clocks go back 1h (CEST->CET) at 01:00 UTC on the last Sunday of October.
# Implemented with pure epoch arithmetic (Time::Local + gmtime), NOT via the
# system TZ database, because TZ="Europe/Berlin" was verified in this
# environment to be silently ignored by Perl's localtime/tzset (see
# run_log.txt) - gmtime() itself is always UTC regardless of system TZ
# config and is therefore used as the stable primitive throughout.
#
# SAP 4 (fehlende Werte): gaps of < 4h (< 16 consecutive missing quarter-
# hour values) are linearly interpolated; gaps of >= 4h leave the
# corresponding quarter-hours as missing, and the calendar day(s) they touch
# are flagged gap_flag=1 (excluded from Dunkelflaute-Identifikation), never
# silently dropped.
#
# Usage: perl smard_daily_aggregate.pl <raw_csv> <output_daily_csv> <start_date YYYY-MM-DD> <end_date YYYY-MM-DD>

use strict;
use warnings;
use Time::Local qw(timegm);

my ($infile, $outfile, $start_date, $end_date) = @ARGV;
die "Usage: perl smard_daily_aggregate.pl <raw_csv> <output_daily_csv> <start YYYY-MM-DD> <end YYYY-MM-DD>\n"
  unless $infile && $outfile && $start_date && $end_date;

# ---- DST helper: last Sunday of given month (0-based) at 01:00:00 UTC ----
sub last_sunday_epoch {
  my ($year, $month0, $hour) = @_;
  my $epoch_lastday = timegm(0, 0, 0, 31, $month0, $year);
  my (undef, undef, undef, undef, undef, undef, $wday, undef) = gmtime($epoch_lastday);
  my $days_back = $wday; # 0 = already Sunday
  return timegm(0, 0, $hour, 31 - $days_back, $month0, $year);
}

# Returns local Berlin offset in seconds (3600 = CET, 7200 = CEST) for a UTC epoch.
my %dst_cache;
sub berlin_offset {
  my ($epoch) = @_;
  my $year = (gmtime($epoch))[5] + 1900;
  unless (exists $dst_cache{$year}) {
    $dst_cache{$year} = [ last_sunday_epoch($year, 2, 1), last_sunday_epoch($year, 9, 1) ];
  }
  my ($start, $end) = @{ $dst_cache{$year} };
  return ($epoch >= $start && $epoch < $end) ? 7200 : 3600;
}

# Returns (date_string "YYYY-MM-DD", seconds_since_local_midnight) for a UTC epoch ms timestamp.
sub local_date_of {
  my ($epoch_ms) = @_;
  my $epoch = int($epoch_ms / 1000);
  my $offset = berlin_offset($epoch);
  my $local_epoch = $epoch + $offset;
  my ($sec, $min, $hour, $mday, $mon, $year) = gmtime($local_epoch);
  return sprintf("%04d-%02d-%02d", $year + 1900, $mon + 1, $mday);
}

# ---- Read raw (ts_ms, value_or_empty) pairs, already chronologically sorted ----
open(my $in, "<", $infile) or die "Cannot read $infile: $!";
my $header = <$in>;
my (@ts, @val);
while (<$in>) {
  chomp;
  my ($t, $v) = split(/,/, $_, 2);
  push @ts, $t + 0;
  push @val, (defined($v) && $v ne "") ? $v + 0 : undef;
}
close($in);
my $n = scalar(@ts);
die "No data rows read from $infile\n" if $n == 0;

# ---- SAP 4: gap detection + linear interpolation for runs < 4h (< 16 steps) ----
my $i = 0;
my $n_interp_points = 0;
my $n_gap_runs_short = 0;
my $n_gap_runs_long = 0;
my @still_missing = (0) x $n; # 1 = still missing after interpolation attempt
while ($i < $n) {
  if (!defined $val[$i]) {
    my $gstart = $i;
    while ($i < $n && !defined $val[$i]) { $i++; }
    my $gend = $i - 1; # inclusive
    my $run_len = $gend - $gstart + 1;
    my $run_hours = $run_len * 0.25;
    if ($run_hours < 4 && $gstart > 0 && $gend < $n - 1) {
      # linear interpolation between val[$gstart-1] and val[$gend+1]
      my $v0 = $val[$gstart - 1];
      my $v1 = $val[$gend + 1];
      my $steps = $run_len + 1;
      for (my $k = 0; $k < $run_len; $k++) {
        $val[$gstart + $k] = $v0 + ($v1 - $v0) * (($k + 1) / $steps);
        $n_interp_points++;
      }
      $n_gap_runs_short++;
    } else {
      # >= 4h, or unbounded at start/end of series: leave missing
      for (my $k = $gstart; $k <= $gend; $k++) { $still_missing[$k] = 1; }
      $n_gap_runs_long++;
    }
  } else {
    $i++;
  }
}

# ---- Aggregate to Europe/Berlin calendar-day sums ----
my %day_sum;      # date -> sum of present/interpolated values
my %day_n_present; # date -> count of non-missing (post-interpolation) values
my %day_n_total;   # date -> count of raw rows seen for that date (= expected, from data itself)
my %day_gap;       # date -> 1 if any quarter-hour in this day is still missing

for (my $j = 0; $j < $n; $j++) {
  my $date = local_date_of($ts[$j]);
  $day_n_total{$date}++;
  if ($still_missing[$j]) {
    $day_gap{$date} = 1;
  } else {
    $day_sum{$date} += $val[$j];
    $day_n_present{$date}++;
  }
}

# ---- Write output, restricted to [start_date, end_date] ----
open(my $out, ">", $outfile) or die "Cannot write $outfile: $!";
print $out "date,n_total,n_present,gap_flag,sum_value\n";
for my $date (sort keys %day_n_total) {
  next if $date lt $start_date || $date gt $end_date;
  my $nt = $day_n_total{$date} // 0;
  my $np = $day_n_present{$date} // 0;
  my $gap = ($day_gap{$date} || $np < $nt) ? 1 : 0;
  my $sum = $day_sum{$date} // 0;
  print $out "$date,$nt,$np,$gap,$sum\n";
}
close($out);

print "Rows read: $n\n";
print "Short gap runs (<4h, interpolated): $n_gap_runs_short (points interpolated: $n_interp_points)\n";
print "Long gap runs (>=4h, left missing): $n_gap_runs_long\n";
print "Days written (within [$start_date,$end_date]): ", scalar(grep { $_ ge $start_date && $_ le $end_date } keys %day_n_total), "\n";
