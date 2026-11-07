# Implementation notes

Learned while building real decks with this system.

## Tables

- In slide tools whose built-in tables draw their own cell rules (they clash with the frame), build tables from rows of boxes instead.
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

- Keep indentation (non-breaking spaces where the tool collapses whitespace).
- One row per code line, no wrapping unless 10.2-a is chosen; highlighted line = separator fill across the full box width.
- Line numbers in their own 48px column, muted, right-aligned.

## Fonts

- Some slide tools accept only declared or generic font families. Use `sans-serif` and `monospace` there; they resolve to the system fonts.

## Colors

- Tools without CSS variables: write the hex values from tokens.md; keep one palette per deck.

## Page numbers

- The title slide counts as 1 but shows no number.
- When inserting or removing slides, renumber every footer.
- Appendix pages: A1, A2 ..., not counted in the main total.
