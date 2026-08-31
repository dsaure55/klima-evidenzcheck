#!/bin/bash
# Ausfuehrungs-Wrapper fuer batteriespeicher-dunkelflaute.R.
#
# Grund (siehe Skriptkopf von batteriespeicher-dunkelflaute.R fuer die volle
# Begruendung): Diese R-4.6.1-Installation stuerzt bei bestimmten Operationen
# nicht-deterministisch ab (Segmentation Fault). Das R-Skript selbst ist
# deshalb in checkpointierte Abschnitte gegliedert (siehe checkpoints/*.rds).
# Dieser Wrapper fuehrt das Skript wiederholt aus, bis es entweder
# vollstaendig erfolgreich durchlaeuft (exit code 0) oder eine maximale
# Anzahl Versuche erreicht ist. Wegen der Checkpoints wird bei jedem
# erneuten Versuch nur der seit dem letzten erfolgreichen Checkpoint fehlende
# Teil neu berechnet - dies ist eine reine Ausfuehrungs-/
# Robustheitsmassnahme, KEINE inhaltliche Aenderung an Methode oder Ergebnis.
#
# Usage: bash run_with_retries.sh

set -u
cd "$(dirname "$0")"
export PATH="/c/Program Files/R/R-4.6.1/bin:$PATH"

MAX_ATTEMPTS=40
LOGFILE="run_log.txt"
: > "$LOGFILE"

echo "Ausfuehrung gestartet: $(date)" | tee -a "$LOGFILE"

attempt=1
success=0
while [ $attempt -le $MAX_ATTEMPTS ]; do
  echo "" | tee -a "$LOGFILE"
  echo "===== Versuch $attempt von $MAX_ATTEMPTS =====" | tee -a "$LOGFILE"
  Rscript batteriespeicher-dunkelflaute.R 2>&1 | tee -a "$LOGFILE"
  ec=${PIPESTATUS[0]}
  echo "Exit-Code: $ec" | tee -a "$LOGFILE"
  if [ "$ec" -eq 0 ]; then
    success=1
    break
  fi
  attempt=$((attempt + 1))
done

echo "" | tee -a "$LOGFILE"
if [ $success -eq 1 ]; then
  echo "ERFOLGREICH nach $attempt Versuch(en) abgeschlossen: $(date)" | tee -a "$LOGFILE"
  exit 0
else
  echo "FEHLGESCHLAGEN nach $MAX_ATTEMPTS Versuchen: $(date)" | tee -a "$LOGFILE"
  exit 1
fi
