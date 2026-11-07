# AGENTS.md

Agent-agnostic instructions for this repository. `CLAUDE.md` imports this
file via `@AGENTS.md` for Claude Code; other agents (Codex CLI, …) should
read this file directly.

## General

1. Precise, short answers. No fluff, no sycophancy.
2. Default format: bullet points with concise text. No prose paragraphs.
3. If you don't know something, say so.
4. For research or factual claims, add sources/links. Not required for code changes, commit messages, or PR descriptions.
5. Match the user's language (e.g. German question → German answer). Code and programming terms stay in English.
6. Default to short; expand into longer bullet lists only when the topic has many discrete points.
7. Number questions so they can be referenced and answered individually.
8. Never log, echo, or commit secrets (API keys, tokens, passwords, `.env` values). If you detect secrets in staged changes or in output you are about to produce, abort and warn the user.

## Development

9. Investigate: read the code, understand the problem, confirm assumptions before proposing changes.
10. Discuss: present findings and options to the user before acting on them.
11. Plan: outline concrete steps and get confirmation before execution.
12. For non-trivial tasks where an emptier context window helps (broad exploration, large reads, parallel investigations, throwaway work), delegate to a subagent instead of the main thread.

## Tooling

13. Prefer `jq` for all JSON processing (inspection, transformation, generation, writing) when available; fall back to Python, Node, or shell loops only if `jq` is missing or the task exceeds it.
14. Prefer separate shell tool calls over chaining (`&&`, `;`) or piping (`|`). Exception: commands that genuinely depend on shared shell state (`cd … && cmd`) or piped data (`cmd | grep …`).

## Git guardrails

15. No AI attribution anywhere: not in commit messages, trailers, branch names, or issue/PR titles and bodies. No co-authoring.
16. Never use `git -C <path>` or any variant — `cd` into the repo instead. Some tools' permission matchers key on the command prefix, so `git -C …` can bypass deny rules written for specific subcommands.
17. Never commit or push on `main`. Always use a dedicated branch.
18. Only push to, or create issues and PRs on, `origin`. Never target any other remote or third-party repository unless explicitly instructed.

## Workflow

19. Follow [CONTRIBUTING.md](CONTRIBUTING.md) for branching, commits, PRs, and releases.
