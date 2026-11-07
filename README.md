# Agent Plugins

Plugins and skills for coding agents by KingOfKalk — Claude Code (primary target), Codex CLI compatible (both read `.claude-plugin/marketplace.json`), and skills usable by any other agent that reads `SKILL.md`.

The repository is `KingOfKalk/agent-plugins`, but the marketplace name is `kingofkalk-plugins` — the two differ on purpose.

## Installation

Claude Code:

```
/plugin marketplace add KingOfKalk/agent-plugins
```

or in your terminal:

```bash
claude plugin marketplace add KingOfKalk/agent-plugins
```

Codex CLI:

```bash
codex plugin marketplace add KingOfKalk/agent-plugins
```

To pin a specific version:

```
/plugin marketplace add KingOfKalk/agent-plugins@v1
```

## Installing a single plugin

Once the marketplace is added, install individual plugins by name. The
marketplace identifier is `kingofkalk-plugins`:

```
/plugin install git@kingofkalk-plugins
/reload-plugins
```

## Available plugins and skills

- [**git**](plugins/git/README.md) — atomic Conventional Commits (`commit`), issue-to-pull-request workflow (`ship`), and guardrail hooks blocking `git -C`, commits/pushes on `main`, pushes to non-`origin` remotes, and AI attribution.
- [**docker**](plugins/docker/README.md) — Docker CLI and Docker Compose skills with automatic devcontainer detection and safety constraints.
- [**obsidian**](plugins/obsidian/README.md) — PARA-aware Obsidian vault operations via the Obsidian CLI, plus a daily journal skill for morning planning and evening review.
- [**presentation-drafter**](plugins/presentation-drafter/skills/presentation-drafter/SKILL.md) — *skill* — draft structured presentation outlines in Markdown using SCR and Winston's "How to Speak" principles.
- [**statusline**](plugins/statusline/README.md) — *statusline* — colorful statusline showing model, cwd, git branch/dirty state, context-window usage bar, and output style.
