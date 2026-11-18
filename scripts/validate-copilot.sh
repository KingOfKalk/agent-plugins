#!/usr/bin/env bash
# shellcheck disable=SC2016 # jq programs and Markdown backticks stay in single quotes
# Checks that every plugin in .claude-plugin/marketplace.json installs in GitHub
# Copilot CLI: registers this checkout as a local marketplace, installs each
# plugin, and then checks per plugin
# - `copilot plugin install` exits 0,
# - `copilot plugin list` shows it as enabled with the version from its
#   plugin.json,
# - the "Installed N skills" count matches the number of
#   plugins/<plugin>/skills/*/SKILL.md (no phrase means 0).
# Any mismatch fails the script. Results go to the log and, on GitHub Actions,
# to the job summary ($GITHUB_STEP_SUMMARY) and as ::error:: annotations.
# Runs against an isolated HOME (under $RUNNER_TEMP when set), so nothing
# touches the caller's Copilot config.
# Needs jq, git and the Copilot CLI (no login); set COPILOT to use a binary that
# is not on PATH.
# Run from anywhere: scripts/validate-copilot.sh
set -euo pipefail
cd "$(dirname "$0")/.."

COPILOT=${COPILOT:-copilot}
MARKETPLACE=.claude-plugin/marketplace.json
SUMMARY=${GITHUB_STEP_SUMMARY:-/dev/null}

# Keep the CLI offline apart from what the plugin commands need: no update
# downloads, no telemetry.
export COPILOT_AUTO_UPDATE=false
export COPILOT_TELEMETRY_DISABLED=true

home=$(mktemp -d "${RUNNER_TEMP:-${TMPDIR:-/tmp}}/copilot-home.XXXXXX")
trap 'rm -rf "$home"' EXIT
export HOME=$home
export COPILOT_HOME=$home/.copilot
unset XDG_CONFIG_HOME XDG_STATE_HOME XDG_CACHE_HOME COPILOT_CACHE_HOME

# git refuses repositories owned by another user (e.g. in a container); the
# isolated HOME is the only place this is recorded.
git config --file "$HOME/.gitconfig" --add safe.directory "$PWD"

mkt=$(jq -r '.name' "$MARKETPLACE")
mapfile -t names < <(jq -r '.plugins[].name' "$MARKETPLACE")
mapfile -t sources < <(jq -r '.plugins[].source' "$MARKETPLACE")

cli_version=$("$COPILOT" --version | head -n 1)
echo "## Copilot CLI plugin install (${cli_version%.})" >>"$SUMMARY"
echo >>"$SUMMARY"

echo "Adding $PWD as marketplace $mkt"
if ! "$COPILOT" plugin marketplace add "$PWD"; then
  echo "::error::copilot plugin marketplace add failed for $PWD"
  printf -- '- FAIL: `copilot plugin marketplace add` failed, see the log\n' >>"$SUMMARY"
  exit 1
fi

fail=0
installed=()   # names whose install exited 0, in plugin order
got_skills=()  # parallel to names: skill count reported by the install
for i in "${!names[@]}"; do
  name=${names[i]}
  status=0
  out=$("$COPILOT" plugin install "$name@$mkt" 2>&1) || status=$?
  echo "$out"
  got=0
  if [[ $out =~ Installed\ ([0-9]+)\ skill ]]; then
    got=${BASH_REMATCH[1]}
  fi
  got_skills[i]=$got
  if [ "$status" -eq 0 ]; then
    installed[i]=1
  else
    installed[i]=0
    echo "::error::copilot plugin install $name@$mkt failed (exit $status)"
    fail=1
  fi
done

# Installed plugins as "name@marketplace (vX.Y.Z) (enabled|disabled)".
declare -A version state
while IFS= read -r line; do
  if [[ $line =~ ^[[:space:]]*[^[:space:]]+[[:space:]]+([^[:space:]]+@[^[:space:]]+)[[:space:]]+\(v([^\)]+)\)[[:space:]]+\((enabled|disabled)\) ]]; then
    version[${BASH_REMATCH[1]}]=${BASH_REMATCH[2]}
    state[${BASH_REMATCH[1]}]=${BASH_REMATCH[3]}
  fi
done < <("$COPILOT" plugin list)

shopt -s nullglob
printf '| Plugin | Version | Skills | Result |\n| --- | --- | --- | --- |\n' >>"$SUMMARY"
for i in "${!names[@]}"; do
  name=${names[i]}
  src=${sources[i]}
  key=$name@$mkt
  want_version=$(jq -r '.version // empty' "$src/.claude-plugin/plugin.json" 2>/dev/null || true)
  skill_files=("$src"/skills/*/SKILL.md)
  want_skills=${#skill_files[@]}
  problems=()
  if [ -z "$want_version" ]; then
    problems+=("no version in $src/.claude-plugin/plugin.json")
  fi

  if [ "${installed[i]}" -ne 1 ]; then
    problems+=("install failed")
  else
    if [ "${state[$key]:-}" != enabled ]; then
      problems+=("not enabled in copilot plugin list (${state[$key]:-missing})")
    fi
    if [ "${version[$key]:-}" != "$want_version" ]; then
      problems+=("version ${version[$key]:-missing}, plugin.json has $want_version")
    fi
    if [ "${got_skills[i]}" -ne "$want_skills" ]; then
      problems+=("${got_skills[i]} skills installed, $want_skills in $src/skills")
    fi
  fi

  if [ "${#problems[@]}" -eq 0 ]; then
    echo "OK   $name: v$want_version, $want_skills skills"
    printf '| `%s` | %s | %s | OK |\n' "$name" "$want_version" "$want_skills" >>"$SUMMARY"
  else
    joined=${problems[0]}
    for p in "${problems[@]}"; do
      echo "::error::$name: $p"
    done
    for p in "${problems[@]:1}"; do
      joined+="; $p"
    done
    echo "FAIL $name: $joined"
    printf '| `%s` | %s | %s | FAIL: %s |\n' "$name" "$want_version" "$want_skills" "$joined" >>"$SUMMARY"
  fi
done

exit "$fail"
