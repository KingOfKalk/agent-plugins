---
name: presentation-builder
description: Build presentation files from a presentation-designer spec (spec-[topic].md) - by default one self-contained, shareable 16:9 HTML file with embedded CSS and JS; PDF or PPTX when the tooling is available. Use when the user wants a deck, slide or one-slider rendered, exported or rebuilt in another format, or right after presentation-designer has written a spec. Not for storyline (presentation-drafter) or design decisions (presentation-designer).
---

# Presentation builder

The builder owns **the implementation**: it renders exactly what the spec says, in the requested format, and checks the result. It makes no design decisions. If the spec leaves one open, ask or send it back to `presentation-designer`.

## Input

- `spec-[topic].md` written by `presentation-designer` (format: `../presentation-designer/references/spec-format.md`).
- No spec yet: run `presentation-designer` first; do not build from a loose idea.
- Tokens and components: read `../presentation-designer/references/tokens.md` and `components.md` (sibling skill in this plugin). If those paths are not reachable, use the values from the designer run in this conversation; if neither is available, stop and say so.

## Reference files

| File | Read when |
|---|---|
| `assets/deck-template.html` | Always for HTML and PDF: the starting point for every deck |
| `references/implementation.md` | Per format (HTML, PDF, PPTX: units, fonts, notes, icons) and per component (tables, steps, code, page numbers) |

## Formats

| Format | Default | How |
|---|---|---|
| HTML | yes | one file from `assets/deck-template.html`: all CSS and JS embedded, no external requests, icons as inline SVG |
| PDF | on request | print the HTML with headless Chrome / Chromium (see below); the template's print CSS gives one 1920 x 1080 page per slide |
| PPTX | on request | python-pptx or pptxgenjs, 13.333 x 7.5 in; units, fonts, notes and icons in `references/implementation.md` |

Check what is installed before promising a format (`which google-chrome chromium chromium-browser`, `python3 -c "import pptx"`, `npm ls -g pptxgenjs`). If a format cannot be built here, say so and deliver the HTML.

## Workflow

1. **Read the spec** and the tokens. Note `mode`, `palette`, `total`, `exceptions`, `placeholders`.
2. **Build.**
   - HTML: copy `assets/deck-template.html`, set `<title>` to the deck title, `data-mode` and `data-palette` on `<body>`, replace the example slides with one `<section class="slide">` per spec slide. Title slide gets `data-title-slide`, appendix slides `data-appendix`; the script fills footer titles and page numbers.
   - Use only the template's classes and the token variables. No new font sizes, colors, shadows or gradients.
   - Template classes: `.grid` + `.span-N`, `.card` / `.accent-box`, `.rows.rows-2|3` + `.row` (`.focus`), `.split` (`.split-4-8`, `.split-8-4`), `.closing`, `.hatch`, `pre.code`, `.list`, `.label`, `.source`, links via `<a>` (`.url` when the text is the URL). A component without a class: add CSS from tokens only and report it as a template gap.
   - Slides with a SourceNote get `.has-source` on the section; the body then ends 16px above the note.
   - Body alignment from the spec field `align`: add `.center` to `.body` for `center` (default in `talk` / `both`), nothing for `top`. The script centers it on the 8px grid; after changing content or mode at runtime call `window.layoutDeck()`.
   - Speaker notes from `notes` go into `<aside class="notes">` (press N in the deck to show them).
3. **Check the layout** (HTML and PDF):

   ```bash
   google-chrome --headless=new --no-sandbox --disable-gpu --window-size=1920,1080 \
     --dump-dom "file://$PWD/deck.html?check" | grep -A20 'id="layout-check"'
   ```

   `data-problems="0"` and `OK` means the deck passes. Each line names the slide and a category:

   - `outside safe area` / `overflows its box`: content past the margins or text that does not fit.
   - `grid:` a layout box (body child, grid item, card, row, code box, header, footer, source) off the 8px grid. Data-sized content (chart bars, images) gets `data-grid="off"`.
   - `type:` a font size outside the mode's three sizes, a weight other than 400 / 700, italic, or a font outside the two stacks.
   - `color:` a text, fill or stroke color outside the active palette and chart colors (`--series-1` to `--series-4`, `--context`).

   Fix every reported problem in the HTML; if the content does not fit, go back to the designer instead of shrinking text. `data-check="off"` is only for on-screen controls that are not part of a slide's content.
4. **Look at it.** Screenshot every slide and view the images:

   ```bash
   google-chrome --headless=new --no-sandbox --disable-gpu --hide-scrollbars --window-size=1920,1080 \
     --screenshot=slide-3.png "file://$PWD/deck.html#3"
   ```

5. **Export** if requested:

   ```bash
   google-chrome --headless=new --no-sandbox --disable-gpu --no-pdf-header-footer \
     --print-to-pdf=deck.pdf "file://$PWD/deck.html"
   ```

6. **Run the render checklist**, then deliver: save next to the spec (Claude.ai: `/mnt/user-data/outputs/`, then present the file). List open placeholders in the reply.

## Render checklist

- [ ] Every spec slide rendered, in order; total matches the spec
- [ ] Layout check `OK` (safe area, overflow, grid, type, color); screenshots looked at, nothing clipped or overlapping
- [ ] Positions, sizes and gaps on the 8px grid; margins 72 / 120; spans as in the spec
- [ ] Only the two font stacks and the three sizes of the mode; weights 400 / 700
- [ ] No italic (also not from browser defaults like `<em>`, `<i>`, `<cite>`, `<address>`), no strikethrough; links per DS 5.5 (URL text plain, other text underlined)
- [ ] Footer: deck title + "n / total"; none on the title slide; appendix "A1"; numbers right after inserts or removals
- [ ] Code framed, mono, indentation kept, within the line limit of the mode
- [ ] HTML: one file, opens offline, arrow keys / click navigate, N shows notes, print gives one slide per page
- [ ] PDF / PPTX (if built): 16:9, one slide per page, notes in PPTX notes
- [ ] Placeholders still bracketed and listed in the reply
