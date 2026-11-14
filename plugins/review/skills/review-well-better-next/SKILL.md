---
name: review-well-better-next
description: Read-only, evidence-based code review in 'Well, Better, Next' format (quick 3, normal 5, deep 10 per category). Use for 'review my code', 'code review', 'wbn', 'well better next'.
---

# Well, Better, Next

Read-only fact-finding review. Never modify files. Every finding needs evidence (`path:line`).

## 1. Parse the request

- Mode: `quick` (default) = max 3 per category, `normal` = 5, `deep` = 10. Limits are maximums, never pad.
- Scope, first match wins:
  1. Paths, PR or diff the user named
  2. Uncommitted changes: `git diff HEAD` plus untracked files from `git status --porcelain` (read those files in full)
  3. Branch vs default: `git diff $(git merge-base HEAD origin/HEAD 2>/dev/null || git merge-base HEAD main 2>/dev/null || git merge-base HEAD master)...HEAD`
  4. Whole repo, starting with entry points, core logic, config
- Output path: note it if the user gave one.

## 2. Run the review

If a subagent tool is available, delegate to ONE subagent:
- Model: strongest available model, else inherit.
- Agent type: one without Edit/Write tools if available.
- Prompt: the template in section 5, filled in. The subagent starts with no context, so the template must be complete.

Otherwise review inline under the same rules.

## 3. Verify

Before reporting, spot-check every Next item and any finding that looks surprising: open the cited `path:line` and confirm the evidence. Drop or mark `unverified` anything that does not hold.

## 4. Deliver

1. Show the report (section 6) in chat.
2. If no output path was given, ask whether to save it and where, suggesting `reviews/wbn-<YYYY-MM-DD>-<scope>.md`. Write nothing without confirmation.

## 5. Subagent prompt template

The subagent may not be able to read this file. Before sending, fill every placeholder and replace the report-format placeholder with the full text of the section 6 report format (the markdown block and the rules below it), so the prompt is self-contained.

```text
You are doing a READ-ONLY code review. Do not create, edit or delete files. Do not run commands with side effects (installs, writing builds, git checkout/commit/reset, network calls). Allowed: reading files, grep/glob, git log/diff/blame/show. Running tests or linters only if they write nothing outside temp dirs.

Scope: <scope>
Mode: <mode> - at most <N> findings per category. Fewer is fine. Never pad.

Categories (each finding in exactly one):
- WELL: concrete practices done right, worth keeping. Must state why it matters. No generic praise. Empty is fine.
- BETTER: works, but should be done differently (design, structure, readability, testability, maintainability). Give a concrete alternative. Priority: high | medium | low.
- NEXT: real impact now or soon (bugs, security, data loss, broken/flaky builds, missing error handling on critical paths, secrets). Severity: critical | high | medium.
Better vs Next test: "Will this hurt soon or already?" yes = NEXT.

Rules:
- Facts only. Every finding cites path:line or a range. Unconfirmed suspicion: mark unverified or omit.
- Group repeated occurrences of one pattern into one finding with all locations.
- Note anything you could not review or verify.

Return findings in exactly this format:
<PASTE THE FULL REPORT FORMAT FROM SECTION 6 HERE, VERBATIM, REPLACING THIS LINE>
```

## 6. Report format

```markdown
# Well, Better, Next - <scope>

- Mode: <mode> | Reviewed by: <model> (subagent | inline)
- Verdict: <one factual sentence>
- Counts: Well <n> / Better <n> (high <n>) / Next <n> (critical <n>, high <n>)

## Well

### W1 - <title>
- Where: `path:line`
- What: <what is done>
- Why it matters: <reason>

## Better

### B1 - <title> [high]
- Where: `path:line`
- Now: <current approach>
- Better: <concrete alternative>
- Why: <benefit>

## Next

### N1 - <title> [critical]
- Where: `path:line`
- Evidence: <what the code does>
- Impact: <what breaks, who is affected>
- Fix: <minimal concrete fix>

## Limits
- <not reviewed / not verified>
```

- Order: Well, Better, Next. Better sorted by priority, Next by severity.
- IDs are stable for follow-ups ("fix N2").
- One or two lines per field. Empty category: `- none found`.
