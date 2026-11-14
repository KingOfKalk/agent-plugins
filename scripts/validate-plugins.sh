#!/usr/bin/env bash
# shellcheck disable=SC2016 # jq programs and Markdown backticks stay in single quotes
# Runs `claude plugin validate` on the marketplace (repo root) and on every
# plugins/<plugin>. Errors fail the script; warnings don't. Warnings that match
# an entry in scripts/validate-allowlist.txt are accepted, all others are new;
# both are listed in the log and, on GitHub Actions, in separate sections of
# the job summary ($GITHUB_STEP_SUMMARY). New warnings also get an annotation.
# Needs jq and the Claude Code CLI (no login or API key); set CLAUDE to use a
# binary that is not on PATH, and ALLOWLIST to read another allowlist file.
# Run from anywhere: scripts/validate-plugins.sh
set -euo pipefail
cd "$(dirname "$0")/.."

CLAUDE=${CLAUDE:-claude}
ALLOWLIST=${ALLOWLIST:-scripts/validate-allowlist.txt}
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

# Allowlist entries (fixed strings), each with the comment lines above it as
# its reason. An entry without a reason fails the run.
patterns=()
reasons=()
used=()
reason=
if [ -f "$ALLOWLIST" ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    line=${line%$'\r'}
    if [ -z "${line//[[:space:]]/}" ]; then
      reason=
    elif [ "${line:0:1}" = '#' ]; then
      text=${line#'#'}
      text=${text#"${text%%[![:space:]]*}"}
      reason=${reason:+$reason }$text
    else
      line=${line%"${line##*[![:space:]]}"}
      if [ -z "$reason" ]; then
        echo "::error file=$ALLOWLIST::allowlist entry without a reason comment above it: $line"
        fail=1
      fi
      patterns+=("$line")
      reasons+=("${reason:-no reason given}")
      used+=(0)
      reason=
    fi
  done <"$ALLOWLIST"
fi

new=()
accepted=()
echo "## Plugin validation (\`claude plugin validate\`, $("$CLAUDE" --version))" >>"$SUMMARY"
echo >>"$SUMMARY"

for target in . plugins/*; do
  out=$TMP/out.json
  status=0
  "$CLAUDE" plugin validate --json "$target" >"$out" 2>"$TMP/err" || status=$?
  dir=${target#.}
  dir=${dir:+$dir/}

  if ! jq -e . "$out" >/dev/null 2>&1; then
    echo "::error::$target: claude plugin validate gave no JSON report (exit $status)"
    cat "$out" "$TMP/err"
    printf -- '- FAIL `%s`: no JSON report (exit %s), see the log\n' "$target" "$status" >>"$SUMMARY"
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

  n_new=0
  n_accepted=0
  for w in "${warnings[@]}"; do
    match=-1
    for i in "${!patterns[@]}"; do
      if [[ $w == *"${patterns[i]}"* ]]; then
        match=$i
        break
      fi
    done
    if [ "$match" -ge 0 ]; then
      used[match]=1
      accepted+=("$w"$'\t'"${reasons[match]}")
      n_accepted=$((n_accepted + 1))
    else
      new+=("$w")
      n_new=$((n_new + 1))
    fi
  done

  echo "$mark $target: ${#errors[@]} errors, $n_new new warnings, $n_accepted accepted warnings (exit $status)"
  printf -- '- %s `%s`: %s errors, %s new warnings, %s accepted warnings\n' \
    "$mark" "$target" "${#errors[@]}" "$n_new" "$n_accepted" >>"$SUMMARY"

  for e in "${errors[@]}"; do
    echo "::error::$e"
    printf -- '  - **error** %s\n' "$e" >>"$SUMMARY"
  done
  if [ "$status" -ne 0 ] && [ "${#errors[@]}" -eq 0 ]; then
    echo "::error::$target: validation failed without a listed error, report:"
    cat "$out"
  fi
done

# New warnings: not in the allowlist. Annotated, but they don't fail the run.
echo "New warnings: ${#new[@]}"
printf '\n### New warnings: %s\n\n' "${#new[@]}" >>"$SUMMARY"
if [ "${#new[@]}" -eq 0 ]; then
  echo "None." >>"$SUMMARY"
else
  printf 'Fix them, or accept them in `%s` with a reason.\n\n' "$ALLOWLIST" >>"$SUMMARY"
fi
for w in "${new[@]}"; do
  echo "::warning::$w"
  printf -- '- %s\n' "$w" >>"$SUMMARY"
done

# Accepted warnings: matched an allowlist entry; listed with its reason.
echo "Accepted warnings: ${#accepted[@]}"
printf '\n### Accepted warnings (`%s`): %s\n\n' "$ALLOWLIST" "${#accepted[@]}" >>"$SUMMARY"
if [ "${#accepted[@]}" -eq 0 ]; then
  echo "None." >>"$SUMMARY"
fi
for a in "${accepted[@]}"; do
  w=${a%%$'\t'*}
  r=${a#*$'\t'}
  echo "  accepted: $w (reason: $r)"
  printf -- '- %s  \n  Reason: %s\n' "$w" "$r" >>"$SUMMARY"
done

# Entries that matched nothing are stale: point them out so they get removed.
stale=()
for i in "${!patterns[@]}"; do
  if [ "${used[i]}" -eq 0 ]; then
    stale+=("${patterns[i]}")
  fi
done
if [ "${#stale[@]}" -gt 0 ]; then
  printf '\n### Unused allowlist entries: %s\n\nNo warning matched them; remove them from `%s`.\n\n' \
    "${#stale[@]}" "$ALLOWLIST" >>"$SUMMARY"
  for s in "${stale[@]}"; do
    echo "::notice file=$ALLOWLIST::unused allowlist entry, no warning matched it: $s"
    printf -- '- `%s`\n' "$s" >>"$SUMMARY"
  done
fi

exit "$fail"
