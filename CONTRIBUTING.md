# Contributing

Contributing to [KingOfKalk/agent-plugins](https://github.com/KingOfKalk/agent-plugins) — plugins and skills for coding agents.

Thanks for your interest. This repo follows a tight, issue-driven workflow. This doc defines the commit and issue/PR workflow.

## Before You Start

- Open an issue (or claim an existing one) describing the change.
- Small fixes (typos, clear bugs) can skip the issue, but a PR is still required.

## Agent instructions

- [AGENTS.md](AGENTS.md) holds the agent-agnostic working rules (communication, tooling, git guardrails). `CLAUDE.md` imports it via `@AGENTS.md`, so Claude Code picks it up automatically; other coding agents should read `AGENTS.md` directly.

## Skills

- Skill name: `<plugin>-<role>`, lowercase kebab-case, e.g. `git-commit`, `docker-compose`, `presentation-drafter`.
- The name must make sense without the plugin namespace: some agents and listings show only the skill name, and it must not collide with skills from other plugins.
- The skill folder is named like the skill: `plugins/<plugin>/skills/<plugin>-<role>/SKILL.md`, with the same value in `name:`.
- Renaming a skill is a breaking change (slash commands and cross-references change): mark the commit with `!`.

## Branching

- One branch per issue.
- Naming: `<type>/<issue-number>-<slug>` — e.g. `feat/12-add-x`, `fix/34-typo-in-readme`.
- Without an issue: `<type>/<slug>` — e.g. `docs/fix-readme-typo`.
- `<type>` is the dominant Conventional Commit type of the change; `<slug>` is a short kebab-case description.
- Never commit directly to `main`.

## Commits

- Follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/en/v1.0.0/).
- Format: `<type>[optional scope][!]: <description>` — e.g. `fix(git): write config to ~/.config/git/config`.
- Types:
  - `feat` — new feature
  - `fix` — bug fix
  - `docs` — documentation only
  - `style` — formatting, no code change
  - `refactor` — code change that neither fixes a bug nor adds a feature
  - `perf` — performance improvement
  - `test` — add or fix tests
  - `build` — build system or dependencies
  - `ci` — CI configuration
  - `chore` — maintenance, no production code change
  - `revert` — revert a previous commit
- Scope: optional, lowercase, hierarchical with `/` separators. It names the logical area, not a file path.
  - Be specific: use the feature name, e.g. `git`, `vim`, `oh-my-zsh`, `agent-instructions`.
  - Omit the scope for cross-cutting changes.
- Description: imperative mood, lowercase, no trailing period.
- Body: reference the issue with `Refs #<issue-number>` (if one exists).
- Breaking changes: add `!` after type/scope and a `BREAKING CHANGE: <details>` footer.
  - Write the footer on a single line. release-please reads any continuation line that starts with `<word>:` (e.g. `/git:git-commit`) as a new footer and cuts the release note off there.
  - If a truncated footer is already merged, fix the release note with a `BEGIN_COMMIT_OVERRIDE` ... `END_COMMIT_OVERRIDE` block in the body of the merged (squash) PR.
- Atomic: one logical concern per commit. Don't mix unrelated changes.
- No AI attribution or co-authoring trailers.

## Pull Requests

- Title uses Conventional Commits and mirrors the primary commit subject.
- Body follows the [PR template](.github/PULL_REQUEST_TEMPLATE.md):
  - `Closes #<issue-number>` (omit if there is no issue).
  - **Summary**: 1–3 bullets on what changed and why.
  - **Test Plan**: how the change was verified (omit for pure docs/typo changes).
- Label issues and PRs with existing labels only; don't create new ones.
- After opening, watch the [checks](#checks) and review feedback (`gh pr view --comments`). Resolve conflicts by rebasing onto `main`.
  - CI runs: `gh run list --branch <branch>`, then `gh run watch <run-id> --exit-status`; failed logs: `gh run view <run-id> --log-failed`.
  - `gh pr checks` fails with fine-grained personal access tokens (the Checks API isn't open to them).
- Keep scope tight — open a separate PR for unrelated work.
- Maintainer merges; do not self-merge.

## Checks

[CI](.github/workflows/ci.yml) runs three chained jobs on every pull request and push to `main` (`Lint`, then `Test`, then `Build`; a failed job skips the later ones). All three are required to merge:

- `Lint`: [shellcheck](https://github.com/koalaman/shellcheck) on all `*.sh`, [actionlint](https://github.com/rhysd/actionlint) on the workflows ([config](.github/actionlint.yaml)), valid JSON, skill names (`name:` equals the folder and starts with `<plugin>-`).
- `Test`: the git-guard hook tests.
- `Build`: `claude plugin validate` on the marketplace and every plugin (errors fail, warnings go to the job summary); every `plugins/*` folder is in `marketplace.json` and `.release-please-manifest.json`, and each `plugin.json` version matches the manifest.

Run them locally from the repo root (needs `bash`, `git`, `jq`, Docker for the linters, and the Claude Code CLI for `validate-plugins.sh`; no login or API key):

```sh
# Lint
git ls-files -z '*.sh' | xargs -0 docker run --rm -v "$PWD":"$PWD" -w "$PWD" koalaman/shellcheck:v0.11.0 --format=gcc
docker run --rm -v "$PWD":"$PWD" -w "$PWD" rhysd/actionlint:1.7.12
scripts/check-json.sh
scripts/check-skills.sh
# Test
plugins/git/hooks/tests/run.sh
# Build
scripts/check-manifests.sh
scripts/validate-plugins.sh
```

Skill evals (`plugins/*/skills/*/evals/`) are not part of CI: they need a model and an API key.

## Releases

- Fully automated via [release-please](https://github.com/googleapis/release-please), configured in [release-please-config.json](release-please-config.json).
- Each plugin is versioned independently:
  - Version lives in `plugins/<plugin>/.claude-plugin/plugin.json`.
  - Changelog lives in `plugins/<plugin>/CHANGELOG.md`.
  - Tags: `<plugin>--v<version>`, e.g. `git--v1.2.0` — the [Claude Code convention](https://code.claude.com/docs/en/plugins/dependencies.md) that plugin dependency version ranges resolve against.
  - Commits are assigned by changed file paths, not by scope — a commit touching only `plugins/git/**` releases only `git`.
- The repo root (`.claude-plugin/plugin.json`, root `CHANGELOG.md`, tags `v<version>`) is versioned separately and only bumps for changes outside `plugins/`.
- The `latest` branch is fast-forwarded to the release commit after every release (root or any plugin) by [release.yml](.github/workflows/release.yml). Users pin `#latest` to get released code only. Never commit to `latest` directly.
- New plugin: release-please treats the manifest version as already released, so without a pin the first release would be 1.1.0 (`feat`) or 2.0.0 (breaking). Pin it to 1.0.0:
  - `plugin.json`: `"version": "0.0.0"`; `.release-please-manifest.json`: `"plugins/<plugin>": "0.0.0"`.
  - `release-please-config.json`: add the package entry with `"release-as": "1.0.0"`.
  - After the release PR that publishes 1.0.0 is merged, remove `"release-as"` in a follow-up PR; otherwise every later release stays at 1.0.0.
- Renamed plugin: keep its version in `plugin.json` and the manifest (new package path and component, no `release-as`). The breaking rename commit bumps the major version, and the moved `CHANGELOG.md` keeps its history.
- Version bumps:
  - Major: breaking change (`!` or `BREAKING CHANGE:` footer).
  - Minor: `feat`.
  - Patch: `fix`, `perf`, `revert`, `docs`, `refactor`.
- `style`, `test`, `build`, `ci`, and `chore` are hidden from the changelog and don't trigger a release on their own.
- Don't edit `CHANGELOG.md`, `version.txt`, or `.release-please-manifest.json` by hand — release-please owns them.
