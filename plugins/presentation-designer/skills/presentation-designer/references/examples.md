# Examples

Purpose, two good and two bad examples per component, each with the reason.

## DS 1.1 Grid

**Purpose:** Use the grid for every element; nothing is placed freely.

**Good**
- Three cards spanning 4 columns each, edges on column lines - every slide lines up with the next.
- A code box of 8 columns next to 4 columns of text - both edges sit on grid lines.

**Bad**
- A box nudged 10px to the right "so it looks better" - breaks alignment across slides.
- An image stretched to the slide edge - breaks the margins (no full-bleed).

## DS 1.2 Footer

**Purpose:** Deck title left, page number right, in the footer band.

**Good**
- "[Deck title]" and "7 / 24" on every content slide.
- Appendix pages showing "... | Appendix" and "A2".

**Bad**
- A page number on the title slide.
- Footer content moved into the body area to save space.

## DS 2.1 TitleSlide

**Purpose:** The deck's first slide: title block centered left, metadata line in the footer band.

**Good**
- Title, one-line subtitle, "[Name] | 2026-11-07 | v0.3 | Draft".
- A 2-line title when needed, block still centered.

**Bad**
- Metadata as a big block under the title - it belongs in the footer band.
- Four logos - max 3.

## DS 2.2 Agenda

**Purpose:** The numbered overview of chapters, 5 | empty | 6, columns centered.

**Good**
- 4 chapters with a few subchapters, short intro left.
- Chapters only, when subchapters would exceed ~12 lines.

**Bad**
- An agenda for a 6-slide deck with one chapter - not needed.
- "01, 02, 03" numbering - write "1, 2, 3".

## DS 2.3 AgendaProgress

**Purpose:** The agenda repeated before each chapter in large decks.

**Good**
- "Next: how releases reach the cluster." with chapter 3 in accent.
- Finished chapters muted, their subchapters hidden.

**Bad**
- Progress slides in a 10-slide deck - too much repetition.
- Several chapters in accent - only the next one.

## DS 2.4 Chapter

**Purpose:** Opens a chapter: number, short divider, title.

**Good**
- "2" / divider / "Pipeline stages".
- Same position and style for every chapter.

**Bad**
- Chapter slides in a one-chapter deck.
- A subtitle paragraph on the chapter slide - keep it a divider.

## DS 2.5 Subchapter

**Purpose:** Opens a subchapter: breadcrumb, number, divider, title.

**Good**
- "2 Pipeline stages" breadcrumb, "2.2" / "Security scans".
- Optional one-sentence subtitle that frames the section.

**Bad**
- Subchapter slides for every 2-slide subsection - too much.
- Third-level numbers like "2.2.1" - max 2 levels.

## DS 2.6 Closing

**Purpose:** The default last slide: one takeaway, contact in the footer band.

**Good**
- "One template, every project" + one subtitle sentence.
- The same takeaway as the deck's first key message - closes the loop.

**Bad**
- "Thank you!" as the only content - wastes the last impression.
- A summary of 8 bullets - one takeaway.

## DS 2.7 ClosingNextSteps

**Purpose:** Closing for decision decks: numbered next steps with owner and date.

**Good**
- 3 steps with action word bold, owner, date.
- Steps the audience can approve right away.

**Bad**
- Steps without owner or date - nobody acts.
- 7 steps - max 5; group the rest.

## DS 2.8 ClosingQuestions

**Purpose:** A short Q&A prompt as the last slide.

**Good**
- "Questions?" with contact in the footer band.
- Used after a Closing slide when Q&A follows.

**Bad**
- "Questions?" as the only closing in a decision deck - use NextSteps.
- Adding a big icon or illustration - keep it plain.

## DS 2.9 AppendixContents

**Purpose:** Opens a longer appendix with a list of its pages.

**Good**
- A2-A5 listed with short titles, so people can ask for "A3".
- Used when the appendix has 4+ slides.

**Bad**
- A contents list for 1 appendix slide - use AppendixSingle.
- Page numbers that don't match the slides.

## DS 2.10 AppendixSingle

**Purpose:** The whole appendix on one slide, divider block left, content right.

**Good**
- Sources and a short glossary.
- Contact and links for follow-up.

**Bad**
- Content that overflows the right column - split into AppendixContents + slides.
- Repeating main-deck content.

## DS 2.11 AppendixDivider

**Purpose:** A plain divider before the appendix.

**Good**
- "A" / divider / "Appendix" before 6 backup slides.
- Used when no contents list is needed.

**Bad**
- A divider for a single appendix slide.
- Numbering the divider as part of the main count.

## DS 2.12 AppendixSlide

**Purpose:** Any normal layout in the appendix, footer marked "| Appendix".

**Good**
- Detailed table behind slide 9, subtitle says so.
- Glossary or sources on their own slide.

**Bad**
- Appendix slides counted in the main total ("25 / 30").
- New key messages in the appendix - they belong in the main part.

## DS 2.13 OnePagerA

**Purpose:** Example one-pager: content 8 | key numbers 4.

**Good**
- A project summary with 3 cards and 2 key numbers.
- A decision memo on one slide, date and sources in the footer.

**Bad**
- Two accent numbers - the second goes in text color.
- Font sizes below small to fit more - cut content instead.

## DS 2.14 OnePagerB

**Purpose:** Example one-pager: why / what / next + one table.

**Good**
- Three short columns and a 3-row table.
- A status one-pager for management.

**Bad**
- A full-width table with 10 rows plus columns - too dense.
- Page number in the footer - one-pagers show date and sources.

## DS 3.1 ContentSlide

**Purpose:** The default slide for one point: headline names it, subheadline states the takeaway.

**Good**
- "Pipeline runs 3x faster" + "Caching dependencies cut the average build from 12 to 4 minutes." - takeaway readable without the body.
- "Two risks remain" + "Cache size and the missing lockfile check need owners this week." - ends with a clear ask.

**Bad**
- "Overview" + "In this slide we look at the pipeline." - topic instead of takeaway.
- A 2-line headline with the subheadline repeating it - too long, adds nothing.

## DS 3.2 TwoColumns

**Purpose:** Running text in two equal columns, no boxes or divider.

**Good**
- "Speed" and "Cost" with ~3 lines each.
- Two aspects of one decision, same length.

**Bad**
- One column long, one empty - use a ContentSlide.
- Before / after in TwoColumns - use Split with divider.

## DS 3.3 ThreeColumns

**Purpose:** Running text in three equal columns.

**Good**
- "Speed / Cost / Reliability" with 2-3 lines each.
- Three audiences and what changes for each.

**Bad**
- 6 lines per column - too dense; split the slide.
- Columns with boxes and titles - that's Cards.

## DS 3.4 FourColumns

**Purpose:** Very short text in four equal columns (~20 characters per line).

**Good**
- "Build / Test / Scan / Review" with one short line each.
- Four quarters with one result each.

**Bad**
- Full sentences of 4 lines - the narrow columns become hard to read.
- Long words in a column - they break awkwardly.

## DS 3.5 Split

**Purpose:** Two halves under one header with a divider, for contrast.

**Good**
- "Before" vs "After" with matching bullet points on both sides.
- "Pros" vs "Cons" with 3 points each.

**Bad**
- Two unrelated topics on one split - two slides instead.
- Left side 6 points, right side 1 - the contrast doesn't land.

## DS 3.6 SplitUneven

**Purpose:** A narrow side (4) with a short statement or big number, a wide side (8) with context.

**Good**
- "-67%" left, what changed right.
- A short claim left, the three facts behind it right.

**Bad**
- Long text in the narrow side - it wraps after ~30 characters.
- Both sides equally full - use Split 6 | 6.

## DS 4.1 Cards

**Purpose:** 2-4 distinct, equally weighted items side by side, each with a short title.

**Good**
- "Build / Test / Scan", one sentence each - parallel items, same length.
- 4 cards for 4 options in a decision, same structure in each.

**Bad**
- 5 cards squeezed into one row - breaks the 4-per-row limit and the grid.
- One card with 6 lines, the others with 1 - unequal weight; use MixedA instead.

## DS 4.2 Tiles

**Purpose:** 2-4 short statements or facts without titles.

**Good**
- 4 tiles: "70% less runner time", "Cache per branch", ... - each a fact at a glance.
- 3 tiles with the three principles of a team.

**Bad**
- Tiles with a title and a paragraph each - those are Cards.
- A tile with a full sentence of 3 lines - too long; use a list or TwoColumns.

## DS 4.3 Rows

**Purpose:** Max 3 full-width bands for sequences or problem / fix pairs, label left, text right.

**Good**
- "1 Build / 2 Scan / 3 Deploy", one line each - reads top to bottom.
- "Problem" / "Fix" as two rows - a short story.

**Bad**
- 4 rows - the fourth gets cramped; split the slide or use a list.
- Rows with 3 lines of text each - use Cards or TwoColumns.

## DS 4.4 MixedA

**Purpose:** One main block (6 columns) with two supporting blocks (3 + 3) in one row.

**Good**
- Main result as the big card, cost and risk as the small ones.
- A chart in the big block, two key facts beside it.

**Bad**
- Three blocks with equal importance in 6 | 3 | 3 - use Cards instead.
- Big block nearly empty, small blocks overflowing - weight is reversed.

## DS 4.5 MixedB

**Purpose:** One tall block (6) with two stacked blocks (6) beside it.

**Good**
- Screenshot-like content left, two explanations stacked right.
- A main argument left, pro and contra stacked right.

**Bad**
- The tall block carries less than the stacked pair - looks even, use MixedC or Cards.
- Three stacked blocks on the right - stacked splits are exactly 2.

## DS 4.6 MixedC

**Purpose:** One dominant block (8) with two stacked blocks (4) beside it.

**Good**
- A big number with context in the 8, two drivers stacked in the 4.
- A diagram-like card left, two short notes right.

**Bad**
- Long text in the narrow stacked blocks - they are for short notes.
- Mirroring on every other slide without reason - keep one direction per section.

## DS 4.7 MixedD

**Purpose:** A full-width block on top with two halves below.

**Good**
- The headline result across the top, the two consequences below.
- A timeline row on top, two detail cards below.

**Bad**
- The top block holding only a title - that belongs in the header.
- Three blocks below - the bottom row splits into exactly 2.

## DS 5.1 Lists

**Purpose:** Bullets, numbered, checklist or key-value, max 5 items, 2 levels.

**Good**
- Numbered list of 3 deployment steps - order matters.
- Key-value "Expected: 4 min" / "Actual: 5 min" on separate lines.

**Bad**
- 8 bullets in 3 levels - a document, not a slide.
- Bullets for a sequence - use numbered.

## DS 5.2 Quote

**Purpose:** A short quote with attribution.

**Good**
- One sentence from a team lead, role as attribution.
- A customer quote that supports the slide's takeaway.

**Bad**
- A 5-line quote - shorten or paraphrase.
- A quote without attribution.

## DS 5.3 SourceNote

**Purpose:** The source of data or images, small and muted above the footer.

**Good**
- "Source: GitLab CI analytics, August to October 2026".
- "Photo: platform team, 2026-11-14".

**Bad**
- No source on a slide with numbers.
- A long URL as the source - name the source, put the link in the appendix.

## DS 5.4 InlineHighlight

**Purpose:** One word or number in accent bold inside running text.

**Good**
- "... with 76% shorter builds." with 76% highlighted.
- One key term in a definition sentence.

**Bad**
- Three highlighted words in one paragraph.
- A highlighted word plus an accent box elsewhere.

## DS 6.1 AccentBox

**Purpose:** A card with a 4px accent border for the single most important block.

**Good**
- The "After" card in a before / after set.
- The recommended option among 3 cards.

**Bad**
- Two accent boxes on one slide.
- An accent box plus an unrelated accent number - two focus points.

## DS 6.2 BigNumber

**Purpose:** One number that carries the message, large, with a label.

**Good**
- "-67%" in accent, label "build time".
- "4 min" with "was 12 min in August".

**Bad**
- Three big numbers in accent - nothing stands out.
- "1,234" without label or unit.

## DS 6.3 Divider

**Purpose:** A 2px line to separate content.

**Good**
- Short divider between chapter number and title.
- Vertical divider in a Split.

**Bad**
- Dividers under every headline as decoration.
- A divider not centered in the gutter.

## DS 6.4 Status

**Purpose:** Status rows for success, warning and error with a word label.

**Good**
- "Pass / Risk / Fail" with one sentence each in a project review.
- Three checks of a release gate, each with its status.

**Bad**
- Green and red rows without a label - color alone, unreadable in mono.
- Status colors used to make a list "more colorful" - status only for status.

## DS 6.5 StatusTag

**Purpose:** An inline status label: Pass, Risk, Fail.

**Good**
- "Cache rollout" + Pass.
- A table cell with Risk for one open item.

**Bad**
- A green tag reading "Done" for decoration.
- Fail without a word, just a red box.

## DS 6.6 NeutralTag

**Purpose:** A neutral state label: Draft, New, Beta, Optional.

**Good**
- "Draft" on the title slide metadata.
- "New" next to a card that was added since the last review.

**Bad**
- A neutral tag in status color.
- Tags on every card - loses meaning.

## DS 7.1 Table

**Purpose:** Data in rows and columns, full width, row lines, numbers right aligned.

**Good**
- Build time per project with one highlighted row and a total.
- A comparison of 5 options across 4 criteria.

**Bad**
- 15 rows in small text - move to the appendix.
- Units in every cell ("14.2 min") - put the unit in the header.

## DS 7.2 TableZebra

**Purpose:** Zebra stripes for number-heavy tables where rows are hard to follow.

**Good**
- A 6-column table of numbers across the full width.
- A cost table where each row is read across.

**Bad**
- Zebra on a 3-row table - adds noise.
- Zebra plus group dividers plus highlight - too heavy.

## DS 7.3 TableGroups

**Purpose:** Group dividers between logical column groups.

**Good**
- "Project | Before, After | Saved" - three readable groups.
- Inputs vs outputs in a test result table.

**Bad**
- A divider between every column - spreadsheet look.
- Dividers that don't match any logical group.

## DS 7.4 TablesTwo

**Purpose:** Two tables side by side for comparison.

**Good**
- "Before" and "After" with the same rows and columns.
- Two teams with the same metrics.

**Bad**
- Two tables with different columns - nothing to compare.
- 9+ rows each - over the limit.

## DS 7.5 TablesFour

**Purpose:** Four narrow tables in a row.

**Good**
- Q1-Q4 with the same 4 projects and one value each.
- Four environments with 3 metrics each.

**Bad**
- 4 columns per narrow table - cramped; use TablesFourGrid.
- Different structures in each table - hard to scan.

## DS 7.6 TablesFourGrid

**Purpose:** Four tables as 2 x 2 for slightly wider tables.

**Good**
- Q1-Q4 with 3 rows and up to 4 columns each.
- Four regions with the same short table.

**Bad**
- 5 rows per table - overflows the half height.
- Mixing 2 x 2 and 4-in-a-row in one deck for the same data.

## DS 8.1 ChartBar

**Purpose:** Vertical bars with one bar in accent.

**Good**
- Monthly build time with November in accent.
- Values on top of the bars, no y-axis needed.

**Bad**
- Every bar in a different color.
- A truncated y-axis that exaggerates the drop.

## DS 8.2 ChartLine

**Purpose:** Lines with one focus line in accent, the rest gray.

**Good**
- Data pipeline in accent among 4 projects.
- Direct labels at the line ends, no legend.

**Bad**
- Six colored lines without focus - use small multiples.
- A second y-axis on the right.

## DS 8.3 ChartRanking

**Purpose:** Sorted horizontal bars for rankings.

**Good**
- Savings per project, top one in accent.
- Long category names readable on the left.

**Bad**
- Unsorted bars - ranking is lost.
- Bars without value labels.

## DS 8.4 ChartSeries

**Purpose:** Up to 4 equal series in the categorical palette.

**Good**
- 4 projects in blue, orange, aqua, violet, labeled directly.
- Two series compared with equal weight.

**Bad**
- 5+ series - use "Other" or small multiples.
- Status green and red as series colors.

## DS 8.5 ChartDonut

**Purpose:** Parts of a whole, max 3 slices.

**Good**
- Cache hits 62% in accent, misses and bypassed gray.
- A big percentage in the middle.

**Bad**
- 7 slices - use ChartRanking.
- Slices without labels or values.

## DS 9.1 Gauge

**Purpose:** One value against its range as an arc.

**Good**
- Test coverage 72% as half gauge with target marker at 80%.
- Security score as a ring among a few key numbers.

**Bad**
- A gauge for a value without a natural maximum (e.g. build count).
- Four gauges in accent on one slide - use rings in text color, one in accent.

## DS 9.2 GaugeTrend

**Purpose:** Before, now and projection of one value.

**Good**
- Coverage 31% before, 58% now, 85% projected - three labeled states.
- A bar with before marker for a migration.

**Bad**
- Projection drawn dashed - dashed means Risk.
- Missing labels for the three states.

## DS 9.3 Progress

**Purpose:** Progress as bar, segmented bar or steps.

**Good**
- "3 of 5 teams onboarded" as segmented bar.
- A rollout in 5 steps with step 3 current.

**Bad**
- A progress bar without a value label.
- 10 steps in a step indicator - max ~6.

## DS 10.1 CodeBox

**Purpose:** Framed code or commands, mono, small size, max 15 lines.

**Good**
- CB-B with line 3 highlighted - the audience sees the one line that matters.
- CB-C with one command and its output - shows what really happens.

**Bad**
- A 40-line file pasted in full - shorten to the relevant part.
- Code as an unframed screenshot in a different font - breaks the system.

## DS 10.2 CodeLongLines

**Purpose:** Handling code lines too long for the box.

**Good**
- A docker command broken with \ (LL-C).
- A wider 12-column box for one long command (LL-D).

**Bad**
- Shrinking the font to fit - never.
- Soft-wrapping YAML so indentation becomes unclear - use manual breaks.

## DS 11.1 ImageText

**Purpose:** An image cropped to grid columns next to text.

**Good**
- A dashboard screenshot-like photo in 6 columns, explanation right.
- A team photo in 4 columns with 8 columns of text.

**Bad**
- An image overlapping the margin.
- Text placed on top of the image.

## DS 11.2 Screenshot

**Purpose:** A framed UI screenshot with numbered callouts.

**Good**
- Two callouts on the relevant fields, explained right.
- Screenshot cropped to the part that matters.

**Bad**
- A full-screen screenshot with tiny text.
- Callouts covering the thing they point at.

## DS 11.3 ImageLarge

**Purpose:** One large image across the content width.

**Good**
- A photo from rollout day with caption.
- An architecture photo of a whiteboard, cropped.

**Bad**
- Full-bleed image to the slide edge.
- A stock photo without information value.

## DS 11.4 Icons

**Purpose:** Phosphor icons, Regular or Fill, always with a text label.

**Good**
- A lock icon next to "Secrets never leave the vault".
- One filled check in accent next to "All checks passed".

**Bad**
- Icons without labels as the only information.
- Mixing Phosphor with another icon set.
