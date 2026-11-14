# review

Read-only code review skills for Claude Code and other agents that read `SKILL.md`. Reviews never modify files, and every finding cites evidence (`path:line`).

## Installation

```
/plugin install review@kingofkalk-plugins
```

## Skills

- [`review-well-better-next`](skills/review-well-better-next/SKILL.md) - review code in the Well, Better, Next format. Triggers on "review my code", "code review", "wbn" or "well better next".
  - **Well**: practices done right that are worth keeping.
  - **Better**: works, but should be done differently. Each finding has a priority and a concrete alternative.
  - **Next**: real impact now or soon (bugs, security, data loss, broken builds). Each finding has a severity and a minimal fix.

### Usage

Ask in plain language, or name the mode and scope:

- `review my code` - quick mode on the default scope.
- `wbn deep` - deep mode.
- `code review normal plugins/git` - normal mode on a path.

Modes set the maximum number of findings per category. Limits are maximums, the review never pads.

| Mode | Findings per category |
|---|---|
| `quick` (default) | 3 |
| `normal` | 5 |
| `deep` | 10 |

Scope, first match wins:

1. Paths, pull request or diff you name.
2. Uncommitted changes: `git diff HEAD` plus untracked files.
3. Current branch against the default branch.
4. The whole repository, starting with entry points, core logic and config.

### Behavior

- Read-only: the review never creates, edits or deletes files. It saves the report only after you confirm a path.
- Runs in one subagent on the strongest available model when subagents are available, otherwise inline.
- Spot-checks every Next finding against the cited `path:line` before reporting.
- Finding IDs (`W1`, `B2`, `N3`) are stable, so you can follow up with "fix N2".
