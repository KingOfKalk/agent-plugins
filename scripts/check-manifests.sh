#!/usr/bin/env bash
# Checks that the manifests agree:
# - every plugins/<plugin> folder is listed in .claude-plugin/marketplace.json
#   (.plugins[].source) and every listed source exists as a folder
# - every plugins/<plugin> folder is a package in .release-please-manifest.json
# - each package's plugin.json version equals its version in
#   .release-please-manifest.json ("." is .claude-plugin/plugin.json)
# Needs jq. Run from anywhere: scripts/check-manifests.sh
set -euo pipefail
export LC_ALL=C
cd "$(dirname "$0")/.."

MARKETPLACE=.claude-plugin/marketplace.json
MANIFEST=.release-please-manifest.json
fail=0

dirs=$(for d in plugins/*/; do echo "${d%/}"; done | sort)
sources=$(jq -r '.plugins[].source | strings | ltrimstr("./") | rtrimstr("/")' "$MARKETPLACE" | sort)

while read -r d; do
  echo "::error file=$MARKETPLACE::$d is not listed in $MARKETPLACE"
  fail=1
done < <(comm -23 <(echo "$dirs") <(echo "$sources") | sed '/^$/d')

while read -r s; do
  echo "::error file=$MARKETPLACE::source ./$s is listed in $MARKETPLACE but the folder does not exist"
  fail=1
done < <(comm -13 <(echo "$dirs") <(echo "$sources") | sed '/^$/d')

while read -r d; do
  echo "::error file=$MANIFEST::$d is not a package in $MANIFEST"
  fail=1
done < <(comm -23 <(echo "$dirs") <(jq -r 'keys[] | select(. != ".")' "$MANIFEST" | sort) | sed '/^$/d')

while IFS=$'\t' read -r pkg expected; do
  if [ "$pkg" = "." ]; then
    file=.claude-plugin/plugin.json
  else
    file=$pkg/.claude-plugin/plugin.json
  fi
  if [ ! -f "$file" ]; then
    echo "::error file=$MANIFEST::package $pkg has no $file"
    fail=1
    continue
  fi
  actual=$(jq -r '.version // empty' "$file")
  if [ "$actual" != "$expected" ]; then
    echo "::error file=$file::version '${actual}' differs from '$expected' in $MANIFEST"
    fail=1
  fi
done < <(jq -r 'to_entries[] | [.key, .value] | @tsv' "$MANIFEST")

if [ "$fail" -ne 0 ]; then
  exit 1
fi
echo "Manifests OK"
