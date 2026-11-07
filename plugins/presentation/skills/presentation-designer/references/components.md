# Components

Reference components as `DS <group>.<n>`; variants add a letter (`DS 9.3-d`). New components get the next free number; numbers are never reused.

## Mode limits

The limits below are for `read`. In `talk` and `both` (see tokens.md, Modes) these apply on top:

| Component | `talk` / `both` |
|---|---|
| 2.13 / 2.14 OnePager | not used; one-pagers are `read` |
| 3.1-3.4 running text | max ~20 words of body per slide |
| 4.1 Cards / 4.2 Tiles | max 3, title + max ~6 words each |
| 4.3 Rows | max 3, label + max ~6 words |
| 5.1 Lists | bullets and checklists not used; numbered max 3 items |
| 7.x Tables | max 4 rows + header, max 4 columns; prefer a chart |
| 8.x Charts | fewer labels; one focus |
| 10.1 CodeBox | max 8 lines |
| 11.4 Icons | 96px standalone preferred |

## 1 Foundations

- **1.1 Grid** - see tokens.md
- **1.2 Footer** - deck title left, "n / total" right; none on the title slide; appendix "| Appendix" and A1, A2

## 2 Slide types

- **2.1 TitleSlide** - title block vertically centered, left aligned; title 1 line (2 allowed); optional subtitle; metadata as one line in the footer band (name, date, version, status as neutral tag, event, client; " | " separated); up to 3 logos top right, 64px high, up to 256px wide, 48px apart; no page number
- **2.2 Agenda** - 5 | empty | 6, no divider, each column vertically centered; left: "Agenda", subtitle, optional intro; right: numbered list "1", "2.1" (never "02"), max 2 levels, chapters bold, subchapters muted, ~12 lines max
- **2.3 AgendaProgress** - before each chapter in large decks; subtitle "Next: ..."; current chapter accent bold, finished muted with subchapters hidden, upcoming text color
- **2.4 Chapter** - number (large, accent), short divider (2 columns, 2px), title; block centered left; only with 2+ chapters
- **2.5 Subchapter** - small muted breadcrumb ("2 Pipeline"), number "2.2", divider, title, optional one-sentence subtitle
- **2.6 Closing** (default) - one takeaway, centered left; contact in the footer band
- **2.7 ClosingNextSteps** - headline, subtitle, numbered steps with owner and date, action word bold, max 5, whole block vertically centered
- **2.8 ClosingQuestions** - "Questions?" centered left
- **2.9 AppendixContents** - divider block left ("A", divider, "Appendix", subtitle), numbered list of appendix pages right; agenda layout
- **2.10 AppendixSingle** - same block left, the appendix content itself right (sources, glossary)
- **2.11 AppendixDivider** - plain "A" divider like a chapter slide
- **2.12 AppendixSlide** - any layout; pages A1, A2 ..., not counted in the main total
- **2.13 OnePagerA / 2.14 OnePagerB** - two example one-pagers: A) content 8 | key numbers 4, B) why / what / next + one table; any other one-pager has no fixed layout and is composed freely; body may use small; footer date + sources, no page number

## 3 Layouts

- **3.1 ContentSlide** - headline + subheadline + body (max 8 columns of running text)
- **3.2 TwoColumns / 3.3 ThreeColumns / 3.4 FourColumns** - running text in equal columns, no boxes, no divider; ~5 / ~4 / 2-3 lines per column; spacer column optional
- **3.5 Split** - 6 | 6 with a 2px divider centered in the gutter; for before / after, pros / cons
- **3.6 SplitUneven** - 4 | 8 or 8 | 4 with divider; big number on the narrow side

## 4 Blocks

- **4.1 Cards** - 2-4 equal cards with title (normal bold) + text (small)
- **4.2 Tiles** - 2-4 text-only blocks
- **4.3 Rows** - max 3 full-width bands (48px gaps; `read`: 312px high with 2 bands, 192px with 3; `talk`: 304px with 2, 184px with 3), label | text as 3 | 9 or 4 | 8, one line each
- **4.4 MixedA** 6 | 3 | 3 - **4.5 MixedB** 6 | two stacked 6 - **4.6 MixedC** 8 | two stacked 4 - **4.7 MixedD** 12 on top, 6 + 6 below; mirrored allowed
- Limits for blocks (4.1-4.7): max 4 blocks per row and slide; block spans 3, 4, 6, 8, 12 only (splits inside a block, like the Rows label | text, and slide layouts like the Agenda are not blocks); big block >= 2x a small one; stacked splits exactly 2 equal halves

## 5 Text

- **5.1 Lists** - bullets, numbered, checklist, key-value; max 5 items, 2 levels
- **5.2 Quote** - normal size, regular (not italic), quotation marks, small muted attribution, max 2 lines
- **5.3 SourceNote** - "Source: <who>, <when>", small, muted, above the footer band
- **5.4 InlineHighlight** - one word or number in accent bold inside running text; the only emphasis in running text, counts as the slide's accent focus
- **5.5 Link** - text color, regular weight; a) the URL itself as text (`github.com/KingOfKalk/agent-plugins`): no underline; b) other link text ("Repo on GitHub"): underline (2px, 4px offset); `talk`: no links in the body, one short URL (a) on the closing slide at most

## 6 Emphasis and status

- **6.1 AccentBox** - card with 4px accent border, max one per slide
- **6.2 BigNumber** - large; a) + label, b) + comparison, c) further numbers in text color
- **6.3 Divider** - 2px border color; a) full width, b) short, c) vertical in the gutter
- **6.4 Status** - rows with Pass (2px solid), Risk (2px dashed), Fail (4px; mono: hatch), always with the word
- **6.5 StatusTag** - inline status label
- **6.6 NeutralTag** - Draft, New, Beta, Optional; border color, never a status color

## 7 Tables

- **7.1 Table** - full width, max 10 rows + header, max 6 columns; header bold on surface with 2px border below; 2px separator lines between rows; text left, numbers right, tabular figures; units in the header; max one highlighted row (accent bold); total row bold with 2px border above; frame 2px + 4px radius
- Options: **7.2 TableZebra** (number-heavy; mono falls back to lines), **7.3 TableGroups** (2px border-color dividers between logical column groups only), plain column lines between all columns (2px; header in border, body in separator color - lighter than group dividers)
- **7.4 TablesTwo** 6 | 6, max 8 rows - **7.5 TablesFour** 3 | 3 | 3 | 3, max 4 rows - **7.6 TablesFourGrid** 2 x 2, max 3 rows; small bold caption above each

## 8 Charts

- **8.1 ChartBar**, **8.2 ChartLine**, **8.3 ChartRanking** (sorted horizontal bars) - focus + context: one accent, rest context gray
- **8.4 ChartSeries** - up to 4 equal series in the chart palette, direct labels
- **8.5 ChartDonut** - max 3 slices, focus slice accent, value large in the middle
- Grid lines separator, baseline border, chart text small; bars 4px radius on the data end only; lines 4px focus, 2px context; never two y-axes, 3D or rainbow; static, no hover

## 9 Gauges and progress

- **9.1 Gauge** - a) half, b) ring, c) half with target marker; track separator, value accent
- **9.2 GaugeTrend** - before, now, projection: a) layered gauge, b) three rings, c) bar with markers; projection outlined or hatched, never dashed (dashed means Risk); states labeled
- **9.3 Progress** - a) bar, b) segmented, c) steps (square markers, max ~6), d) steps with cards (2-4 steps, card per step)

## 10 Code

- **10.1 CodeBox** - surface fill, 2px border, 4px radius, 24px padding, mono small, max 15 lines, file caption above (small bold); a) plain, b) line numbers + highlighted line (4px accent bar at the left edge of the box, line number in accent), c) commands with muted "$ " + muted output, d) diff (+ success, - error, unchanged muted, sign always shown), e) inline code (mono, surface fill, same size as text); keywords accent, comments muted (never italic)
- **10.2 CodeLongLines** - a) soft wrap, b) truncate with muted "...", c) manual breaks, d) wider box (12 columns ~115 chars, 8 ~70, 6 ~55, 4 ~33); prefer c, d, b, a; never a smaller font

## 11 Media

- **11.1 ImageText** - image cropped to 4, 6 or 8 columns next to text, caption below
- **11.2 Screenshot** - white, 2px border, numbered 48px accent callouts explained beside it, max ~4
- **11.3 ImageLarge** - 12 columns, caption below; never full-bleed
- **11.4 Icons** - Phosphor Icons, Regular and Fill only; 48px next to text, 96px standalone; text color, accent only as focus; always with a text label
