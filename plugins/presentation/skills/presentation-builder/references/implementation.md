# Implementation notes

Per-format rules first, then per-component details.

## HTML

- Start from `assets/deck-template.html`; it holds the canvas, scaling, navigation, notes, print CSS and the layout check.
- Fonts: the CSS stacks from tokens.md, no web fonts (the file must open offline).
- Speaker notes: `<aside class="notes">` per slide; hidden, shown with N. HTML has no native notes view.
- Icons: inline SVG, never a runtime CDN request. Copy the SVG from `@phosphor-icons/core` (pin the version, e.g. `2.1.1`): `assets/regular/<name>.svg`, `assets/fill/<name>-fill.svg`. Set `fill="currentColor"` so the icon takes the text or accent color.

## PDF

- Print the finished HTML with headless Chrome / Chromium (`--print-to-pdf --no-pdf-header-footer`); the template's `@page` gives one 1920 x 1080 page per slide.
- Check the page count against the spec total.

## PPTX

- Slide size 13.333 x 7.5 in (16:9). The 1920px canvas maps to it: 1px = 0.5pt = 6350 EMU.
- Type sizes: 96 / 48 / 32 / 24px = 48 / 24 / 16 / 12pt; line heights convert the same way (e.g. 104px = 52pt).
- Positions and sizes: px x 6350 = EMU (python-pptx `Emu()`), or px / 144 = inches (pptxgenjs).
- Fonts: PPTX needs named families. Text: Calibri; code: Consolas (both ship with Microsoft Office on Windows and macOS). Do not write the CSS generics `sans-serif` / `monospace`.
- Speaker notes: the slide's notes page (`slide.notes_slide.notes_text_frame` in python-pptx, `slide.addNotes()` in pptxgenjs).
- Icons: convert the Phosphor SVG to PNG at 2x the target size (`rsvg-convert -w <2x px> in.svg -o out.png`, recolor the SVG first); python-pptx cannot place SVG.
- Colors: hex values from tokens.md, one palette per deck.
- Tables: python-pptx and pptxgenjs tables carry a default table style with their own borders and banding; clear it (no style, no banding, per-cell borders as below) or build the table from rectangles.

## Tables

- If the target draws its own cell rules (PPTX default table styles, see above), clear them or build the table from rows of boxes; they clash with the frame.
- Frame: 2px border + 4px radius, overflow hidden.
- Header row: surface fill, bold, 2px border line below.
- Body rows: 2px separator line between rows.
- Cells: small size, padding 8px 16px, text left, numbers right, tabular figures.
- Optional column lines: 2px, header row in border color, body rows in separator color.

## Steps (DS 9.3-c)

- Square markers 48px, 4px radius: done = accent fill, current = 4px accent border, upcoming = surface + border.
- Lines connect the markers edge to edge (accent up to the current step, border color after).
- Labels below: the first step left-aligned, the last right-aligned, the others centered under their marker. Pin each label to its marker so it stays centered regardless of row spacing.

## Steps with cards (DS 9.3-d)

- 2-4 steps; one card per step on the grid (4 steps = 3 columns each, 48px gutters).
- Each marker centered above its card; line segments run through the gutters.
- Card title = step name; the current step's card gets a 4px accent border and accent title.

## Code

- Keep indentation: `white-space: pre` in HTML; in PPTX use non-breaking spaces, since text runs collapse leading spaces.
- One row per code line, no wrapping unless 10.2-a is chosen; highlighted line = 4px accent bar at the left edge of the box, spanning the line height, and its line number in accent.
- Line numbers in their own 48px column, muted, right-aligned.

## Page numbers

- The title slide counts as 1 but shows no number.
- When inserting or removing slides, renumber every footer.
- Appendix pages: A1, A2 ..., not counted in the main total.
