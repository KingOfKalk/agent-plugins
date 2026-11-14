#!/usr/bin/env bash
# shellcheck disable=SC2016 # jq programs and Markdown backticks stay in single quotes
# Runs `claude plugin validate` on the marketplace (repo root) and on every
# plugins/<plugin>. Errors fail the script; warnings are listed in the log and,
# on GitHub Actions, in the job summary ($GITHUB_STEP_SUMMARY).
# Needs jq and the Claude Code CLI (no login or API key); set CLAUDE to use a
# binary that is not on PATH. Run from anywhere: scripts/validate-plugins.sh
set -euo pipefail
cd "$(dirname "$0")/.."

CLAUDE=${CLAUDE:-claude}
SUMMARY=${GITHUB_STEP_SUMMARY:-/dev/null}
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

# One line per finding: "<file>: <path>: <message>", file relative to the repo.
ERRORS='[(.manifest, (.contents // [])[]) | select(. != null) | .file as $f
  | (.errors // [])[] | "\($f | ltrimstr($root)): \(.path): \(.message)"] | .[]'
WARNINGS='[(.manifest, (.contents // [])[]) | select(. != null) | .file as $f
    | (.warnings // [])[] | "\($f | ltrimstr($root)): \(.path): \(.message)"]
  + [(.directory.findings // [])[]
    | "\($dir)\(.file // ""): \(.title // .code): \(.message)"] | .[]'

fail=0
echo "## Plugin validation (\`claude plugin validate\`, $("$CLAUDE" --version))" >>"$SUMMARY"

for target in . plugins/*; do
  out=$TMP/out.json
  status=0
  "$CLAUDE" plugin validate --json "$target" >"$out" 2>"$TMP/err" || status=$?
  dir=${target#.}
  dir=${dir:+$dir/}

  if ! jq -e . "$out" >/dev/null 2>&1; then
    echo "::error::$target: claude plugin validate gave no JSON report (exit $status)"
    cat "$out" "$TMP/err"
    printf '\n### FAIL `%s`\n\nNo JSON report (exit %s), see the log.\n' "$target" "$status" >>"$SUMMARY"
    fail=1
    continue
  fi

  mapfile -t errors < <(jq -r --arg root "$PWD/" "$ERRORS" "$out")
  mapfile -t warnings < <(jq -r --arg root "$PWD/" --arg dir "$dir" "$WARNINGS" "$out")

  if [ "$status" -ne 0 ] || [ "${#errors[@]}" -gt 0 ]; then
    mark=FAIL
    fail=1
  else
    mark=OK
  fi
  echo "$mark $target: ${#errors[@]} errors, ${#warnings[@]} warnings (exit $status)"
  printf '\n### %s `%s`: %s errors, %s warnings\n\n' "$mark" "$target" "${#errors[@]}" "${#warnings[@]}" >>"$SUMMARY"

  for e in "${errors[@]}"; do
    echo "::error::$e"
    printf -- '- **error** %s\n' "$e" >>"$SUMMARY"
  done
  if [ "$status" -ne 0 ] && [ "${#errors[@]}" -eq 0 ]; then
    echo "::error::$target: validation failed without a listed error, report:"
    cat "$out"
  fi
  for w in "${warnings[@]}"; do
    echo "  warning: $w"
    printf -- '- warning: %s\n' "$w" >>"$SUMMARY"
  done
done

exit "$fail"
