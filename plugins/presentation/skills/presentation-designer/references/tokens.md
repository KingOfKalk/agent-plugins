# Tokens

## Grid

- Canvas 1920 x 1080, fixed, scaled as a whole. Base unit u = 8px; every position, size and gap is a multiple of 8. Only exceptions: stroke widths (2, 4) and radius (4).
- Margins: top / left / right 72px (9u), bottom 120px (15u) = footer band (32 footer line, 48 to edge; the remaining 40 above the footer line is derived, not a spacing value). Content area 1776 x 888.
- 12 columns of 104px (13u), gutters 48px (6u). Splits evenly into 1, 2, 3, 4, 6.
- Header: headline 104px line, 16px gap, subheadline 48px line, 48px gap; body from y 288 to 960 (672px).
- Footer line at y 1000, small, muted: deck title left, page number "7 / 18" right.
- Spacer column allowed between columns: e.g. 5 | empty | 6.
- Keep about 10% spare width: system fonts differ per OS.

## Spacing scale

Only these values: 8, 16, 24, 32, 48, 72, 120.

| Value | Typical use |
|---|---|
| 8 | table cell padding (vertical) |
| 16 | headline to subheadline, list item gap, title to text in a box |
| 24 | padding of cards, tiles, rows, code boxes |
| 32 | paragraph gap |
| 48 | gutter, header to body, stacked blocks |
| 72 | slide margin |
| 120 | bottom margin with footer |

## Type

- Sans: `system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`
- Mono (code only): `ui-monospace, "SF Mono", Menlo, Consolas, "Liberation Mono", monospace`
- If a tool does not accept these stacks, use the generic `sans-serif` / `monospace`.

| Size | px / line height | Use |
|---|---|---|
| large | 96 / 104 | headline, big numbers, chapter numbers |
| normal | 32 / 48 | subheadline (muted), body, lists, card titles (bold) |
| small | 24 / 32 | footer, card text, table cells, captions, code |

Weights 400 and 700 only; no italic. Headline max 1 line (about 20-24 characters); title slide may use 2.

## Palettes

| Role | Light | Dark | Mono |
|---|---|---|---|
| bg | #FAFAF7 | #141414 | #FFFFFF |
| surface | #EEEEEA | #222222 | #FFFFFF |
| text | #111111 | #F2F2F2 | #000000 |
| muted | #555555 | #A3A3A3 | #4D4D4D |
| border | #B0B0A8 | #555555 | #000000 |
| separator | #E2E2DC | #2E2E2E | #BDBDBD |
| accent | #0A55B5 | #6CA8FF | #000000 (bold, 4px border) |
| success | #1E7A3A | #5CC98A | label + 2px solid |
| warning | #8A5300 | #F2B33D | label + 2px dashed |
| error | #C0262D | #FF7A7A | label + hatch fill |

- All text colors >= 4.5:1 on bg and surface.
- Surface is ~1.1:1 against bg, so boxes always carry the 2px border.
- Mono: pure white background; no fills that print as a tint.

## Accent rule

- One focus per slide. Default: exactly one accent element.
- Several accent elements only when they mark the same point (big number + its box, gauge + its "Now" label, current step + its card, screenshot callouts).
- Exceptions: syntax keyword coloring in code; categorical chart series.

## Chart colors

Fixed order, never cycled; validated for color blindness.

| Slot | Light | Dark |
|---|---|---|
| series-1 blue | #0A55B5 | #3987e5 |
| series-2 orange | #eb6834 | #d95926 |
| series-3 aqua | #1baf7a | #199e70 |
| series-4 violet | #6250d6 | #9085e9 |
| context gray | #B0B0A8 | #555555 |

Max 4 series, always direct labels (aqua is only 2.7:1 on light bg). Mono: gray steps plus line patterns. Status colors are never series colors.

## Shape

- Radius 4px on cards, tiles, rows, code boxes, tables, images, step markers; 0 in mono.
- Borders 2px in `border`; accent border 4px.
- Flat: no shadows, no gradients.
