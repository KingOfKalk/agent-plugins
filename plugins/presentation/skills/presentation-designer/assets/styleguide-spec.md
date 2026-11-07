---
title: "Styleguide"
mode: read                        # the deck switches to talk with its mode button
palette: light                    # the deck switches to dark / mono with its theme button
audience: "Anyone building or reviewing slides with the presentation plugin"
goal: "See the design system before reading its rules"
winston: false
total: 16
exceptions:
  - "Every slide: theme and mode buttons top right in the top margin (data-check=\"off\", hidden in print)"
  - "Slide 2: grid overlay draws the 12 columns as surface stripes"
  - "Slides 5 and 6: hex values and contrast ratios are filled in by script from the active palette"
placeholders: []
---

Source of truth for values: `references/tokens.md` and `references/components.md`. Rebuild `styleguide.html` from this spec with `presentation-builder` whenever tokens, components or the deck template change.

## 1 | DS 2.1 TitleSlide

- headline: "Styleguide"
- subtitle: "The presentation design system: tokens and components"
- meta: "agent-plugins | presentation"
- accent: none

## 2 | DS 1.1 Grid

- headline: "Grid"
- subheadline: "Twelve columns of 104px with 48px gutters inside 72px margins."
- accent: none
- align: top
- blocks:
  - span 12: 12 surface stripes, one per column, full body height; labels "1" to "12" small muted

## 3 | Spacing scale

- headline: "Spacing"
- subheadline: "Only seven values, all multiples of 8."
- accent: none
- blocks:
  - span 12: one bar per value (8, 16, 24, 32, 48, 72, 120) in accent, label left small

## 4 | Type

- headline: "Type"
- subheadline: "Two families, three sizes per mode, weights 400 and 700."
- accent: none
- blocks:
  - span 12: "Large 96 / 104" in large bold; "Normal 32 / 48, talk 48 / 56" in normal; "Small 24 / 32, talk 32 / 40" in small; "Mono for code" in mono small

## 5 | Type styles

- headline: "Type styles"
- subheadline: "Bold marks structure; emphasis in running text is the accent."
- accent: the InlineHighlight
- blocks:
  - span 12: sentence with one InlineHighlight (DS 5.4); URL link (DS 5.5-a) and text link (DS 5.5-b); note "never italic, never strikethrough"

## 6 | Palette

- headline: "Palette"
- subheadline: "Ten roles; hex values and contrast follow the active theme."
- accent: none
- blocks:
  - span 12: 10 swatches (bg, surface, text, muted, border, separator, accent, success, warning, error) with role, hex and contrast to bg

## 7 | Status

- headline: "Status"
- subheadline: "Pass, Risk and Fail always carry the word."
- accent: the AccentBox (to compare with Fail)
- blocks:
  - span 8: DS 6.4 Status rows Pass / Risk / Fail per tokens.md (mono: hatched strip on Fail)
  - span 4: DS 6.1 AccentBox "Accent is never a status"

## 8 | DS 8.1 ChartBar

- headline: "Focus and context"
- subheadline: "One bar in accent, the rest in context gray, every bar labeled."
- accent: the last bar
- blocks:
  - span 8, data-grid off: 6 bars, values on every bar, focus bar accent
  - span 4: DS 6.2-a BigNumber "88" / "deploys in June"

## 9 | DS 8.4 ChartSeries

- headline: "Chart colors"
- subheadline: "Four series in a fixed order, never cycled."
- accent: series-1 (categorical exception)
- blocks:
  - span 12, data-grid off: 4 series x 3 groups, direct labels, legend as text

## 10 | DS 2.4 Chapter

- number: "2"
- headline: "Slide types"
- accent: the chapter number

## 11 | DS 3.5 Split

- headline: "Split"
- subheadline: "Before and after, with a divider centered in the gutter."
- accent: right side
- align: center
- blocks:
  - left, span 6: label "Before", large "12 min", text "every team its own pipeline"
  - right, span 6: label "After", large "4 min" (accent), text "one template for all"

## 12 | DS 4.1 Cards and DS 5.1 Lists

- headline: "Cards and lists"
- subheadline: "Three cards on the grid, a numbered list of at most five."
- accent: none
- blocks:
  - 3 x span 4: DS 4.1 Cards "Build" / "Scan" / "Deploy" with one line each, Phosphor icons (DS 11.4)
  - span 12: DS 5.1 numbered list, 3 items

## 13 | DS 4.3 Rows

- headline: "Rows"
- subheadline: "Up to three bands, label left and one line of text."
- accent: row 3
- blocks:
  - DS 4.3 rows-3: "Problem" | "Builds take 12 minutes"; "Fix" | "Cache dependencies"; "Result" | "Builds take 4 minutes"

## 14 | DS 7.1 Table

- headline: "Table"
- subheadline: "Text left, numbers right, units in the header."
- accent: highlighted row
- blocks:
  - span 12: 4 rows + header (Project, Builds, Duration (min)), one highlighted row
- source: "Source: example data"

## 15 | DS 10.1 CodeBox

- headline: "Code"
- subheadline: "Always framed, mono, small, comments muted."
- accent: keyword coloring (exception)
- blocks:
  - span 12: DS 10.1-a `.gitlab-ci.yml` include snippet (5 lines); DS 10.1-c command with muted "$ " and output

## 16 | DS 2.15 ClosingContributions

- headline: "Contributions"
- subheadline: "What this styleguide gives every deck."
- accent: none
- blocks:
  - numbered list: "One grid for every slide", "Three sizes per mode", "One palette per deck"
