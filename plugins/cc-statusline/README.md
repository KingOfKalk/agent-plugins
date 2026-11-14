# cc-statusline

![statusline preview](screenshot.png)

A colorful statusline for Claude Code that renders on a single line. It uses Claude Code's status line API, so it does not work in Codex CLI or other agents.

- **Model** — current model display name
- **Directory** — basename of the working directory
- **Git branch** — with a red `!` if the tree is dirty or has untracked files
- **Context window** — usage bar plus percentage; green above 50%, yellow above 20%, red below
- **Output style** — active Claude Code output style

## Installation

Install via the KingOfKalk marketplace in Claude Code

```
/plugin marketplace add KingOfKalk/agent-plugins
/plugin install cc-statusline@kingofkalk-plugins
```

or directly in your terminal

```bash
claude plugin marketplace add KingOfKalk/agent-plugins
claude plugin install cc-statusline@kingofkalk-plugins
```

Installing the plugin is not enough — Claude Code does not yet pick up `statusLine` from plugin manifests, so you must wire the script into your own `settings.json` to activate it.

Add the following to `~/.claude/settings.json` (or your project's `.claude/settings.json`):

```json
{
  "statusLine": {
    "type": "command",
    "command": "$HOME/.claude/plugins/marketplaces/kingofkalk-plugins/plugins/cc-statusline/statusline.sh",
    "padding": 0,
    "refreshInterval": 5
  }
}
```

Restart Claude Code after editing `settings.json` to see the statusline.

Upgrading from the old `statusline` plugin: uninstall `statusline@kingofkalk-plugins`, install `cc-statusline@kingofkalk-plugins`, and change `plugins/statusline/` to `plugins/cc-statusline/` in the `statusLine.command` path of your `settings.json`.

Upgrading from `claude-code-statusline`: uninstall `claude-code-statusline@kingofkalk-plugins`, install `cc-statusline@kingofkalk-plugins`, and change `plugins/claude-code-statusline/` to `plugins/cc-statusline/` in the `statusLine.command` path of your `settings.json`.

## Requirements

- `bash`
- `jq` on `PATH`
- `git` on `PATH` (used to read branch and dirty state)

## How it works

Claude Code invokes `statusline.sh` on every render, piping a JSON payload to stdin. The script extracts model, cwd, context-window remaining percentage, and output style, then prints a single ANSI-colored line.
