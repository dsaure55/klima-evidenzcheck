#!/bin/bash
# Parallel downloader for SMARD quarterhour chart_data chunks.
# Input: download_urls.txt, lines "URL|relative_dest_path"
# Skips files that already exist and are non-empty (idempotent / resumable).
set -u
cd "$(dirname "$0")"

download_one() {
  line="$1"
  url="${line%%|*}"
  dest="${line##*|}"
  if [ -s "$dest" ]; then
    return 0
  fi
  for attempt in 1 2 3; do
    curl -s -m 25 --retry 2 "$url" -o "$dest.tmp"
    if [ -s "$dest.tmp" ] && grep -q "series" "$dest.tmp" 2>/dev/null; then
      mv "$dest.tmp" "$dest"
      return 0
    fi
    rm -f "$dest.tmp"
    sleep 1
  done
  echo "FAILED: $url" >> fetch_failures.log
}
export -f download_one

: > fetch_failures.log
cat download_urls.txt | xargs -P 10 -I{} bash -c 'download_one "$@"' _ {}

echo "DONE. Failures: $(wc -l < fetch_failures.log)"
