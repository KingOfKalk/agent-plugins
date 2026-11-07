# presentation

Presentations in three steps: content, look, implementation. Each step is a skill with a file as handoff, so every step can be repeated on its own.

## Installation

```
/plugin install presentation@kingofkalk-plugins
```

## Skills

| Step | Skill | Owns | Output |
|---|---|---|---|
| 1 | [`presentation-drafter`](skills/presentation-drafter/SKILL.md) | content: storyline (SCR), slide messages, optional Winston story rules | `draft-[topic].md` |
| 2 | [`presentation-designer`](skills/presentation-designer/SKILL.md) | look: grid, modes `talk` / `read`, palettes, DS slide types and components | `spec-[topic].md` |
| 3 | [`presentation-builder`](skills/presentation-builder/SKILL.md) | implementation: rendering, layout check, export | one shareable HTML file; PDF / PPTX if tooling allows |

## Two ways to use it

- **Draft first:** drafter, then designer, then builder. The draft frontmatter (`audience`, `mode`, `goal`, `duration`, `winston`) carries over, so the designer does not ask again.
- **Quick:** start with the designer for a concrete idea (e.g. a one-slider). It asks for audience and mode, writes the spec and hands straight over to the builder.

## Styleguide

[`styleguide.html`](skills/presentation-designer/assets/styleguide.html) shows the design system as a deck: grid, spacing, type, palette with contrast ratios, status, chart colors and the main components. Open it in a browser; the buttons top right (or T / M) switch the theme (light, dark, mono) and the mode (read, talk).

A change to `tokens.md`, `components.md` or the deck template rebuilds the styleguide from [`styleguide-spec.md`](skills/presentation-designer/assets/styleguide-spec.md) in the same PR, and its layout check stays `OK` in every theme and mode (`styleguide.html?check&theme=dark&mode=talk`).

## Modes

- `talk`: presented live; Winston's slide rules (larger type, little text, no bullet lists).
- `read`: one-slider, handout, mail; slides stand alone.
- `both`: presented, then shared; built as `talk`, reading detail in notes and appendix.

## Editing

- Content changes: edit the draft, run the designer again.
- Small text or layout fixes: edit the spec, run the builder again.

## Tests

Eval scenarios for the skills live in `skills/presentation-designer/evals/` (one folder per case: `prompt.md`, `case.yaml`, `graders/`, input files in `files/`):

- `quick-one-slider`: quick path from an idea to spec and HTML.
- `deck-from-draft`: a drafter outline to a talk-mode spec.
- `review-html`: review of a deck with planted violations.

Run them from the skill directory with `claude plugin eval . --allow-tools Write,Edit,Bash --scaffold` (real, billed model runs).
