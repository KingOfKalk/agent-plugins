---
name: presentation-designer
description: Design slide decks, single slides and one-pagers with a grid-first visual system (8px grid, 3 type sizes, modes talk / read, 3 palettes, numbered slide types and components). Turns a presentation-drafter draft or a quick idea into spec.md, the handoff for presentation-builder. Use when the user wants slides, a one-slider or a deck designed, laid out or reviewed. For storyline use presentation-drafter; to render HTML / PDF / PPTX use presentation-builder.
---

# Presentation designer

A calm, grid-first visual system for 16:9 decks and one-pagers. The designer owns **the look**: mode, sizes, palette, slide types, layout per slide. It does not write the storyline (`presentation-drafter`) and does not render files (`presentation-builder`). Its output is always `spec-[topic].md`.

If the user provides brand tokens or a design-system file, use them; where they differ from this guide, they win.

## Reference files

Every slide type and component has a DS ID: `DS <group>.<n>`, variants add a letter (`DS 4.1`, `DS 9.3-d`), defined in `references/components.md`.

| File | Read when |
|---|---|
| `references/tokens.md` | Always: grid, spacing, type sizes per mode, modes, palettes, chart colors, shape |
| `references/components.md` | Planning slides: every slide type and component with its DS ID, limits and mode limits |
| `references/examples.md` | Writing content: one good and one bad example per component; read only the sections you need (`grep -n -A3 '## DS 4.3' references/examples.md`) |
| `references/spec-format.md` | Writing the spec: frontmatter and per-slide fields |

## Two ways in

- **From a draft** (the user drafted first with `presentation-drafter`): read the draft; its frontmatter gives `audience`, `mode`, `goal`, `duration`, `winston`. Do not ask again for what is there.
- **Quick** (a concrete idea, e.g. a one-slider, no draft): ask the intake questions below, then go straight through to the builder.

## Step 1: Intake

Only ask what is missing, in one message:

- **Audience:** who, what they already know.
- **Presentation mode:** presented live (`talk`), read on its own (`read`: one-slider, handout, mail) or both (`both`)?
- **Goal:** what should the audience do, know or feel afterwards?
- **Size:** number of slides or duration.

If the user says "make it Winston" (or similar), the mode is `talk` and `winston: true`; do not ask for either. Without a draft and without that request, `winston` is `false`. One-pagers default to `read`; say so instead of asking.

## Step 2: Plan

- Slide list: one line per slide with the DS ID and the subheadline.
- Apply the mode limits from `components.md`.
- Any rule you want to break: name it as an exception and ask before writing the spec. Exceptions are allowed, but agreed here.
- From a draft: show the plan and wait for an OK. Quick: no approval round unless there is an exception.

## Step 3: Write the spec

- Write `spec-[topic].md` following `references/spec-format.md`, next to the draft or in the working directory (Claude.ai: `/mnt/user-data/outputs/`).
- Always a file, also for a single slide: the builder renders from it, and it can be rebuilt in another format later.
- Content: never invent numbers, quotes or names. Use bracketed placeholders (`[__]`, `[date]`, `[owner]`) and list them in the frontmatter and in the reply.

## Step 4: Design check, then hand off

Run the design checklist below. Then:

- Quick: hand over to `presentation-builder` right away (default: one shareable HTML file).
- From a draft: offer the build; ask which format if the user has not said.

## Review an existing deck

When the user asks to review slides (HTML, PPTX, PDF or screenshots) instead of designing new ones:

1. Get the slides as text and images: text and positions from the file (PPTX: python-pptx; HTML: the DOM), images by rendering each slide (HTML / PDF: headless Chrome; PPTX: LibreOffice `--convert-to pdf` if installed, otherwise ask for a PDF export).
2. Map every slide to a DS ID, or `none` when no component fits.
3. Run the design checklist per slide; for HTML decks built from the template also run the builder's layout check.
4. Report one row per slide: slide, DS ID, violations, suggested fix. Lead with the slides that break the most rules.
5. Do not change the deck unless asked; offer to write a spec so `presentation-builder` can rebuild it.

## Core rules

- Canvas 1920 x 1080; base unit 8px; margins 72 (top, left, right) and 120 (bottom, footer band); 12 columns of 104px, gutters 48px.
- 2 families (sans for text, mono for code), 3 sizes per deck (`read` 24 / 32 / 96, `talk` 32 / 48 / 96), weights 400 and 700.
- Type styles (tokens.md): bold only where a component defines it or as InlineHighlight; never italic, never strikethrough; underline only for links whose text is not the URL; no ALL CAPS or letter-spacing unless agreed as an exception.
- Every content slide: headline (large, bold, 1 line) + subheadline (one full sentence with the takeaway; from a draft, the key message).
- Light palette by default; dark and mono (print) on request.
- One accent focus per slide; status colors (success, warning, error) only for status and always with a word.
- Boxes: surface fill, 2px border, 4px radius (0 in mono). Flat: no shadows, no gradients.

## Design checklist

The rendering checks (pixels, overflow, fonts, page numbers) are done by `presentation-builder`.

- [ ] Mode set; sizes and mode limits match it
- [ ] Every slide maps to a DS ID; exceptions were agreed and listed in the spec
- [ ] Spans per row add up to 12; block limits respected
- [ ] Headlines fit 1 line (about 20-24 characters); subheadline is one full takeaway sentence
- [ ] One accent focus per slide, named in `accent`; status colors only with labels
- [ ] Type styles: no italic, no strikethrough, no plain bold in running text; links follow DS 5.5; ALL CAPS / letter-spacing only as agreed exceptions
- [ ] Lists, blocks, rows, tables and code within limits for the mode
- [ ] Sources for numbers as SourceNote; placeholders bracketed and listed
- [ ] Last slide matches `winston`: 2.15 or 2.7 with `true` (never 2.8), 2.6 / 2.7 / 2.8 with `false`
- [ ] Spec complete: every field the builder needs is there, no open design decisions
