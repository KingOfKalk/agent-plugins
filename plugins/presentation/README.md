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

## Modes

- `talk`: presented live; Winston's slide rules (larger type, little text, no bullet lists).
- `read`: one-slider, handout, mail; slides stand alone.
- `both`: presented, then shared; built as `talk`, reading detail in notes and appendix.

## Editing

- Content changes: edit the draft, run the designer again.
- Small text or layout fixes: edit the spec, run the builder again.
