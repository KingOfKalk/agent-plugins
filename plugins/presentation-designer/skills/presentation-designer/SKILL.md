---
name: presentation-designer
description: Design and build slide decks, single slides and one-pagers with a grid-first visual system (8px grid, 3 type sizes, 3 palettes, numbered slide types and components) and a pre-flight checklist. Use when creating, building or reviewing the visual layout of slides, PPTX or HTML decks. For outlines or storyline, use presentation-drafter instead.
---

# Presentation designer

A calm, grid-first visual system for 16:9 decks and one-pagers. This file holds the workflow and the core rules; the details live in `references/`. If the user provides brand tokens or a design-system file, use them; where they differ from this guide, they win.

## Reference files

Every slide type and component has a DS ID: `DS <group>.<n>`, variants add a letter (`DS 4.1`, `DS 9.3-d`), defined in `references/components.md`.

Read the ones the task needs before building:

| File | Read when |
|---|---|
| `references/tokens.md` | Always: grid values, spacing, type, the three palettes, chart colors, shape |
| `references/components.md` | Planning slides: every slide type and component with its DS ID and limits |
| `references/examples.md` | Writing content: purpose plus good and bad examples per component |
| `references/implementation.md` | Building: tables, steps, code lines, page numbers, tool quirks |
| `references/sources.md` | Using icons or checking contrast rules: licenses and standards |

## Workflow

1. **Plan first.** Outline (one sentence per section), slide list with the DS ID per slide, length, audience. Any rule you want to break: name it as an exception and ask before building. Exceptions are allowed, but discussed during planning.
2. **Build** in the requested format (slide artifact, PPTX, HTML), applying `references/tokens.md` directly.
3. **Content:** never invent numbers, quotes or names. Use bracketed placeholders (`[__]`, `[date]`, `[owner]`) and list them in the reply.
4. **Speaker notes:** name the DS ID of the layout used.
5. Run the pre-flight checklist before delivering.

## Core rules

- Canvas 1920 x 1080; base unit 8px; margins 72 (top, left, right) and 120 (bottom, footer band); 12 columns of 104px, gutters 48px. Nothing off the grid, nothing past the margins.
- 2 families (sans for text, mono for code), 3 sizes (24 / 32 / 96), weights 400 and 700, no italic.
- Every content slide: headline (large, bold, 1 line) + subheadline (one full sentence with the takeaway).
- Light palette by default; dark and mono (print) on request.
- One accent focus per slide; status colors (success, warning, error) only for status and always with a word.
- Boxes: surface fill, 2px border, 4px radius (0 in mono). Flat: no shadows, no gradients.

## Pre-flight checklist

- [ ] Every slide maps to a DS ID; exceptions were agreed in planning
- [ ] Grid: margins 72 / 120, 12 columns, positions, sizes and gaps multiples of 8 (strokes 2 / 4 and radius 4 excepted), nothing past the margins
- [ ] Only 2 families and the 3 sizes (24 / 32 / 96), weights 400 / 700, no italic
- [ ] Headlines 1 line; subheadline is one full takeaway sentence
- [ ] One accent focus per slide; status colors only with labels
- [ ] Boxes: surface + 2px border + 4px radius; no shadows, no gradients
- [ ] Lists max 5 items, max 4 blocks, max 3 rows, tables within limits
- [ ] Footer: deck title + "n / total" (none on title slide; A1 in appendix)
- [ ] Sources for numbers as SourceNote; placeholders bracketed and listed
- [ ] Code framed, mono, max 15 lines
