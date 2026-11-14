#!/usr/bin/env bash
# Checks that every tracked *.json file is valid JSON.
# Needs git and jq. Run from anywhere: scripts/check-json.sh
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
count=0
while IFS= read -r -d '' file; do
  count=$((count + 1))
  if ! jq empty "$file"; then
    echo "::error file=$file::invalid JSON"
    fail=1
  fi
done < <(git ls-files -z '*.json')

if [ "$fail" -ne 0 ]; then
  exit 1
fi
echo "$count JSON files OK"
