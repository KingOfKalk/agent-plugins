# Examples

One good and one bad example per component, with the reason. Limits are in components.md; read only the sections you need (`grep -n -A3 '## DS 4.3' references/examples.md`).

## DS 1.1 Grid
Use the grid for every element; nothing is placed freely.
- Good: Three cards spanning 4 columns each, edges on column lines - every slide lines up with the next.
- Bad: A box nudged 10px to the right "so it looks better" - breaks alignment across slides.

## DS 1.2 Footer
Deck title left, page number right, in the footer band.
- Good: "[Deck title]" and "7 / 24" on every content slide.
- Bad: A page number on the title slide.

## DS 2.1 TitleSlide
The deck's first slide: title block centered left, metadata line in the footer band.
- Good: Title, one-line subtitle, "[Name] | 2026-11-07 | v0.3 | Draft".
- Bad: Metadata as a big block under the title - it belongs in the footer band.

## DS 2.2 Agenda
The numbered overview of chapters, 5 | empty | 6, columns centered.
- Good: 4 chapters with a few subchapters, short intro left.
- Bad: An agenda for a 6-slide deck with one chapter - not needed.

## DS 2.3 AgendaProgress
The agenda repeated before each chapter in large decks.
- Good: "Next: how releases reach the cluster." with chapter 3 in accent.
- Bad: Progress slides in a 10-slide deck - too much repetition.

## DS 2.4 Chapter
Opens a chapter: number, short divider, title.
- Good: "2" / divider / "Pipeline stages".
- Bad: Chapter slides in a one-chapter deck.

## DS 2.5 Subchapter
Opens a subchapter: breadcrumb, number, divider, title.
- Good: "2 Pipeline stages" breadcrumb, "2.2" / "Security scans".
- Bad: Subchapter slides for every 2-slide subsection - too much.

## DS 2.6 Closing
The default last slide: one takeaway, contact in the footer band.
- Good: "One template, every project" + one subtitle sentence.
- Bad: "Thank you!" as the only content - wastes the last impression.

## DS 2.7 ClosingNextSteps
Closing for decision decks: numbered next steps with owner and date.
- Good: Steps the audience can approve right away.
- Bad: Steps without owner or date - nobody acts.

## DS 2.8 ClosingQuestions
A short Q&A prompt as the last slide.
- Good: "Questions?" with contact in the footer band.
- Bad: "Questions?" as the last slide with `winston: true` - use ClosingContributions; it stays up during Q&A.

## DS 2.9 AppendixContents
Opens a longer appendix with a list of its pages.
- Good: A2-A5 listed with short titles, so people can ask for "A3".
- Bad: A contents list for 1 appendix slide - use AppendixSingle.

## DS 2.10 AppendixSingle
The whole appendix on one slide, divider block left, content right.
- Good: Sources and a short glossary.
- Bad: Content that overflows the right column - split into AppendixContents + slides.

## DS 2.11 AppendixDivider
A plain divider before the appendix.
- Good: "A" / divider / "Appendix" before 6 backup slides.
- Bad: A divider for a single appendix slide.

## DS 2.12 AppendixSlide
Any normal layout in the appendix, footer marked "| Appendix".
- Good: Detailed table behind slide 9, subtitle says so.
- Bad: Appendix slides counted in the main total ("25 / 30").

## DS 2.13 OnePagerA
Example one-pager: content 8 | key numbers 4.
- Good: A decision memo on one slide, date and sources in the footer.
- Bad: Two accent numbers - the second goes in text color.

## DS 2.14 OnePagerB
Example one-pager: why / what / next + one table.
- Good: Three short columns and a 3-row table.
- Bad: Page number in the footer - one-pagers show date and sources.

## DS 2.15 ClosingContributions
Winston's last slide: what this talk contributed, visible during the whole Q&A.
- Good: "Contributions" + subheadline, then 3 numbered lines: "Pipeline template for all projects", "Security scans before every merge", "Pilot with two teams in Q1".
- Bad: "Thank you" or "Questions?" instead - the slide that stays up longest says nothing.

## DS 3.1 ContentSlide
The default slide for one point: headline names it, subheadline states the takeaway.
- Good: "Pipeline runs 3x faster" + "Caching dependencies cut the average build from 12 to 4 minutes." - takeaway readable without the body.
- Good: "Two risks remain" + "Cache size and the missing lockfile check need owners this week." - ends with a clear ask.
- Bad: "Overview" + "In this slide we look at the pipeline." - topic instead of takeaway.
- Bad: A 2-line headline with the subheadline repeating it - too long, adds nothing.

## DS 3.2 TwoColumns
Running text in two equal columns, no boxes or divider.
- Good: Two aspects of one decision, same length.
- Bad: One column long, one empty - use a ContentSlide.

## DS 3.3 ThreeColumns
Running text in three equal columns.
- Good: Three audiences and what changes for each.
- Bad: Columns with boxes and titles - that's Cards.

## DS 3.4 FourColumns
Very short text in four equal columns (~20 characters per line).
- Good: "Build / Test / Scan / Review" with one short line each.
- Bad: Long words in a column - they break awkwardly.

## DS 3.5 Split
Two halves under one header with a divider, for contrast.
- Good: "Before" vs "After" with matching bullet points on both sides.
- Bad: Two unrelated topics on one split - two slides instead.

## DS 3.6 SplitUneven
A narrow side (4) with a short statement or big number, a wide side (8) with context.
- Good: "-67%" left, what changed right.
- Bad: Long text in the narrow side - it wraps after ~30 characters.

## DS 4.1 Cards
2-4 distinct, equally weighted items side by side, each with a short title.
- Good: "Build / Test / Scan", one sentence each - parallel items, same length.
- Bad: 5 cards squeezed into one row - breaks the 4-per-row limit and the grid.

## DS 4.2 Tiles
2-4 short statements or facts without titles.
- Good: 4 tiles: "70% less runner time", "Cache per branch", ... - each a fact at a glance.
- Bad: Tiles with a title and a paragraph each - those are Cards.

## DS 4.3 Rows
Max 3 full-width bands for sequences or problem / fix pairs, label left, text right.
- Good: "1 Build / 2 Scan / 3 Deploy", one line each - reads top to bottom.
- Bad: 4 rows - the fourth gets cramped; split the slide or use a list.

## DS 4.4 MixedA
One main block (6 columns) with two supporting blocks (3 + 3) in one row.
- Good: Main result as the big card, cost and risk as the small ones.
- Bad: Three blocks with equal importance in 6 | 3 | 3 - use Cards instead.

## DS 4.5 MixedB
One tall block (6) with two stacked blocks (6) beside it.
- Good: Screenshot-like content left, two explanations stacked right.
- Bad: The tall block carries less than the stacked pair - looks even, use MixedC or Cards.

## DS 4.6 MixedC
One dominant block (8) with two stacked blocks (4) beside it.
- Good: A big number with context in the 8, two drivers stacked in the 4.
- Bad: Long text in the narrow stacked blocks - they are for short notes.

## DS 4.7 MixedD
A full-width block on top with two halves below.
- Good: The headline result across the top, the two consequences below.
- Bad: The top block holding only a title - that belongs in the header.

## DS 5.1 Lists
Bullets, numbered, checklist or key-value, max 5 items, 2 levels.
- Good: Numbered list of 3 deployment steps - order matters.
- Bad: Bullets for a sequence - use numbered.

## DS 5.2 Quote
A short quote with attribution.
- Good: One sentence from a team lead, role as attribution.
- Bad: A quote set in italic - quotation marks already mark it.

## DS 5.3 SourceNote
The source of data or images, small and muted above the footer.
- Good: "Source: GitLab CI analytics, August to October 2026".
- Bad: No source on a slide with numbers.

## DS 5.4 InlineHighlight
One word or number in accent bold inside running text.
- Good: "... with 76% shorter builds." with 76% highlighted.
- Bad: A plain bold phrase in running text - a second level of emphasis competing with the accent.

## DS 5.5 Link
A reference the reader can open, recognizable in print as well.
- Good: "github.com/KingOfKalk/agent-plugins" as the link text - the URL itself, no underline needed.
- Bad: "Repo on GitHub" in accent color without underline - color alone does not mark a link and uses up the accent.

## DS 6.1 AccentBox
A card with a 4px accent border for the single most important block.
- Good: The "After" card in a before / after set.
- Bad: Two accent boxes on one slide.

## DS 6.2 BigNumber
One number that carries the message, large, with a label.
- Good: "-67%" in accent, label "build time".
- Bad: Three big numbers in accent - nothing stands out.

## DS 6.3 Divider
A 2px line to separate content.
- Good: Short divider between chapter number and title.
- Bad: Dividers under every headline as decoration.

## DS 6.4 Status
Status rows for success, warning and error with a word label.
- Good: "Pass / Risk / Fail" with one sentence each in a project review.
- Bad: Green and red rows without a label - color alone, unreadable in mono.

## DS 6.5 StatusTag
An inline status label: Pass, Risk, Fail.
- Good: "Cache rollout" + Pass.
- Bad: A green tag reading "Done" for decoration.

## DS 6.6 NeutralTag
A neutral state label: Draft, New, Beta, Optional.
- Good: "Draft" on the title slide metadata.
- Bad: A neutral tag in status color.

## DS 7.1 Table
Data in rows and columns, full width, row lines, numbers right aligned.
- Good: Build time per project with one highlighted row and a total.
- Bad: Units in every cell ("14.2 min") - put the unit in the header.

## DS 7.2 TableZebra
Zebra stripes for number-heavy tables where rows are hard to follow.
- Good: A 6-column table of numbers across the full width.
- Bad: Zebra on a 3-row table - adds noise.

## DS 7.3 TableGroups
Group dividers between logical column groups.
- Good: "Project | Before, After | Saved" - three readable groups.
- Bad: Group dividers between every column - no groups left; use plain column lines (DS 7.1 options) instead.

## DS 7.4 TablesTwo
Two tables side by side for comparison.
- Good: "Before" and "After" with the same rows and columns.
- Bad: Two tables with different columns - nothing to compare.

## DS 7.5 TablesFour
Four narrow tables in a row.
- Good: Q1-Q4 with the same 4 projects and one value each.
- Bad: Different structures in each table - hard to scan.

## DS 7.6 TablesFourGrid
Four tables as 2 x 2 for slightly wider tables.
- Good: Four regions with the same short table.
- Bad: Mixing 2 x 2 and 4-in-a-row in one deck for the same data.

## DS 8.1 ChartBar
Vertical bars with one bar in accent.
- Good: Monthly build time with November in accent.
- Bad: Every bar in a different color.

## DS 8.2 ChartLine
Lines with one focus line in accent, the rest gray.
- Good: Data pipeline in accent among 4 projects.
- Bad: Six colored lines without focus - use small multiples.

## DS 8.3 ChartRanking
Sorted horizontal bars for rankings.
- Good: Savings per project, top one in accent.
- Bad: Unsorted bars - ranking is lost.

## DS 8.4 ChartSeries
Up to 4 equal series in the categorical palette.
- Good: 4 projects in blue, orange, aqua, violet, labeled directly.
- Bad: 5+ series - use "Other" or small multiples.

## DS 8.5 ChartDonut
Parts of a whole, max 3 slices.
- Good: Cache hits 62% in accent, misses and bypassed gray.
- Bad: Slices without labels or values.

## DS 9.1 Gauge
One value against its range as an arc.
- Good: Test coverage 72% as half gauge with target marker at 80%.
- Bad: Four gauges in accent on one slide - use rings in text color, one in accent.

## DS 9.2 GaugeTrend
Before, now and projection of one value.
- Good: Coverage 31% before, 58% now, 85% projected - three labeled states.
- Bad: Projection drawn dashed - dashed means Risk.

## DS 9.3 Progress
Progress as bar, segmented bar or steps.
- Good: "3 of 5 teams onboarded" as segmented bar.
- Bad: A progress bar without a value label.

## DS 10.1 CodeBox
Framed code or commands, mono, small size, max 15 lines.
- Good: DS 10.1-b with line 3 highlighted - the audience sees the one line that matters.
- Bad: Code as an unframed screenshot in a different font - breaks the system.

## DS 10.2 CodeLongLines
Handling code lines too long for the box.
- Good: A docker command broken with \ (DS 10.2-c).
- Bad: Shrinking the font to fit - never.

## DS 11.1 ImageText
An image cropped to grid columns next to text.
- Good: A dashboard screenshot-like photo in 6 columns, explanation right.
- Bad: An image overlapping the margin.

## DS 11.2 Screenshot
A framed UI screenshot with numbered callouts.
- Good: Two callouts on the relevant fields, explained right.
- Bad: A full-screen screenshot with tiny text.

## DS 11.3 ImageLarge
One large image across the content width.
- Good: A photo from rollout day with caption.
- Bad: Full-bleed image to the slide edge.

## DS 11.4 Icons
Phosphor icons, Regular or Fill, always with a text label.
- Good: A lock icon next to "Secrets never leave the vault".
- Bad: Icons without labels as the only information.
