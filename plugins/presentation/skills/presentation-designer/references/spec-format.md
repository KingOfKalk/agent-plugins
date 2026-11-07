# Spec format

`spec.md` is the handoff from `presentation-designer` to `presentation-builder`. It describes every slide completely: the builder makes no design decisions of its own, it only renders what the spec says.

- One file per deck, Markdown with YAML frontmatter, next to the draft (or in the working directory).
- Name: `spec-[topic].md`.
- Edit rule: content changes go into the draft and the designer runs again; small text or layout fixes may be made directly in the spec.

## Frontmatter

```yaml
---
title: "Release pipeline"        # deck title, used in the footer
mode: talk                        # talk | read | both
palette: light                    # light | dark | mono
source: draft-release-pipeline.md # optional: the draft this spec was made from
audience: "Engineering leads"     # copied from the draft or the intake
goal: "Approve the pilot"         # copied from the draft or the intake
total: 9                          # main slides, appendix excluded
exceptions:                       # rule breaks agreed during planning, empty if none
  - "Slide 6: one complex slide (architecture overview)"
placeholders:                     # every bracketed placeholder used below
  - "[owner]"
  - "[date]"
---
```

## Slides

One `##` section per slide, numbered as shown in the footer (`A1`, `A2` for appendix). The heading names the slide type or layout.

```markdown
## 3 | DS 3.6 SplitUneven (8 | 4)

- headline: Deploys take 3 days
- subheadline: Every release waits for a manual approval that nobody owns.
- accent: big number on the right
- align: center
- blocks:
  - DS 8.1 ChartBar, span 8: deploy lead time per month, Jan-Jun; focus bar Jun (accent), rest context gray; values [__]
  - DS 6.2-a BigNumber, span 4: "3 days" / label "median lead time"
- source: "Source: [team], [date]"
- notes: |
    Say: this is not a tooling problem, it is an ownership problem.
    Pause after the number.
```

## Fields

| Field | Required | Content |
|---|---|---|
| heading | yes | number, DS ID of the slide type or layout, column split if any |
| headline | content slides | 1 line, about 20-24 characters |
| subheadline | content slides | one full sentence, the takeaway (the draft's key message) |
| accent | yes | the one focus of the slide; `none` if there is none |
| align | optional | vertical alignment of the body: `top` or `center`; default `center` in `talk` / `both`, `top` in `read` |
| blocks | if body | one line per block: DS ID, span (columns), content; exact text in quotes |
| source | if numbers | SourceNote text (DS 5.3) |
| notes | optional | speaker notes; in `both`, the reading detail goes here |

Rules:

- Exact slide text goes in quotes; everything else is an instruction to the builder.
- Spans are column counts (3, 4, 6, 8, 12) and must add up to 12 per row.
- Never invent numbers, names or quotes: use `[__]`, `[date]`, `[owner]` and list them in `placeholders`.
- Title slide (DS 2.1): `headline` is the title; add `meta:` with the footer line ("[Name] | [date] | v0.1").
