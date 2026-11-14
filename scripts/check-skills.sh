#!/usr/bin/env bash
# Checks every skill: plugins/<plugin>/skills/<skill>/SKILL.md exists, its
# front matter has `name: <skill>`, and <skill> starts with `<plugin>-`.
# Run from anywhere: scripts/check-skills.sh
set -euo pipefail
cd "$(dirname "$0")/.."

fail=0
count=0
for dir in plugins/*/skills/*/; do
  dir=${dir%/}
  skill=${dir##*/}
  plugin=${dir#plugins/}
  plugin=${plugin%%/*}
  file=$dir/SKILL.md
  count=$((count + 1))

  if [ ! -f "$file" ]; then
    echo "::error file=$dir::$dir has no SKILL.md"
    fail=1
    continue
  fi

  # `name:` from the front matter (between the first two `---` lines), quotes stripped.
  name=$(awk '
    NR == 1 && $0 != "---" { exit }
    NR > 1 && $0 == "---" { exit }
    NR > 1 && /^name:/ { sub(/^name:[ \t]*/, ""); gsub(/^["'\'']|["'\''][ \t]*$/, ""); sub(/[ \t]+$/, ""); print; exit }
  ' "$file")

  if [ "$name" != "$skill" ]; then
    echo "::error file=$file::name '${name}' does not match the folder '$skill'"
    fail=1
  fi
  case $skill in
    "$plugin"-*) ;;
    *)
      echo "::error file=$file::skill '$skill' does not start with '$plugin-'"
      fail=1
      ;;
  esac
done

if [ "$fail" -ne 0 ]; then
  exit 1
fi
echo "$count skills OK"
