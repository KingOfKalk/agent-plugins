---
name: presentation-drafter
description: >
  Draft structured presentation outlines in Markdown using the SCR (Situation-Complication-Resolution)
  framework and Patrick Winston's "How to Speak" principles. Use this skill whenever the user wants to
  draft, outline, plan, or structure a presentation, talk, pitch, workshop, brownbag, training session,
  or any speaking engagement. Also trigger when the user mentions SCR, empowerment promise, storyline,
  slide structure, horizontal logic, Winston Star, VSN-C, or asks for help preparing a talk or deck.
  Even if the user just says "help me prepare my presentation" or "I need to draft a deck" or
  "structure my talk", use this skill. Output is always a Markdown draft (content only) — never slides,
  layout or styling; those are presentation-designer and presentation-builder.
---

# Presentation Drafter

Draft focused, structured presentation outlines in Markdown using the SCR framework and, on request, Patrick Winston's "How to Speak" principles. The drafter owns **content only**: storyline, slide messages, what each slide shows. It never decides sizes, colors or layout.

The plugin works in three steps:

1. `presentation-drafter` (this skill): content, output `draft-[topic].md`
2. `presentation-designer`: look, output `spec-[topic].md`
3. `presentation-builder`: implementation, output HTML (PDF / PPTX if tooling allows)

## Step 1: Determine the type of talk

Ask the user (if not already clear) what kind of session they are preparing:

| Type                                                                                                                               | Template to use   | Key framework                                                                     |
| ---------------------------------------------------------------------------------------------------------------------------------- | ----------------- | --------------------------------------------------------------------------------- |
| **Persuasive / Business** — board pitch, strategy deck, sales pitch, project update, executive briefing, conference talk, job talk | SCR template      | SCR storyline + Winston's VSN-C for job/conference talks                          |
| **Teaching / Training** — workshop, brownbag, lunch & learn, internal training, onboarding session                                 | Training template | Winston's engagement heuristics (cycling, fencing, verbal punctuation, questions) |

If the type is ambiguous, ask one short question to clarify. Do not over-ask — pick the closest match and proceed.

## Step 2: Gather minimum viable input

Before drafting, you need these inputs. Extract from conversation if already provided; only ask for what's missing. Ask in ONE message, not multiple rounds:

**Always needed:**

- Topic / subject
- Audience (who, what they know, what they care about)
- Presentation mode: `talk` (presented live), `read` (one-slider, handout, sent by mail) or `both` (presented, then shared)
- Desired outcome (what should the audience do/know/feel after?)
- Duration (approximate)
- Winston's story rules: apply them or not? (empowerment promise, cycling, fencing, Winston Star, Contributions ending). Ask unless the user already said; do not assume. Suggest `yes` for `talk` / `both`, but the user decides.

**For SCR talks additionally:**

- Are they skeptical or receptive? → determines SCR order variant (SCR / RSC / CSR)

**For Training sessions additionally:**

- What does the audience already know? (starting level)
- Hands-on exercises planned? (yes / no / unsure)

## Step 3: Draft the outline

Read the appropriate template from the `assets/` directory:

- SCR talks → read `assets/template-scr.md`
- Training talks → read `assets/template-training.md`

Then read the relevant reference material:

- For SCR principles → read `references/scr-cheatsheet.md`
- If `winston: true` → read `references/winston-cheatsheet.md`
- For persuasive job/conference talks using VSN-C → both references

Fill in the template with the user's content. If `winston: false`, drop the sections marked "only if `winston: true`". Follow these rules strictly:

### Drafting rules (always)

1. **Write the SCR storyline FIRST** — before any slide structure. If S→C→R doesn't flow with natural "but" and "therefore" connectors, fix it before proceeding.

2. **Action titles only** — every slide's key message is a full sentence stating a claim, not a label. "Revenue declined 12% in Q3" not "Q3 Revenue". Reading all key messages top-to-bottom = the complete story (horizontal logic). The designer uses the key message as the slide's subheadline.

3. **Resolution dominates** — in SCR talks, 60–70% of slides belong to the Resolution section. If the Situation is more than 2–3 slides, cut it.

4. **Content, not layout** — per slide, describe *what* to show (a chart of X, one big number, a before / after comparison, a short list, a screenshot). Never specify font sizes, colors, positions or slide types; `presentation-designer` decides those based on `mode`. Speaker notes may use bullets.

5. **Keep the user focused** — if the user rambles or provides too much content for the Situation, push back. Say: "This belongs in Resolution, not Situation" or "Cut this — your audience already knows it."

### Winston story rules (only if `winston: true`)

6. **Empowerment promise** — the draft starts with one. One sentence. What the audience gains.

7. **Cycling plan for teaching** — every key concept in a training draft shows how it will be covered 3× from different angles.

8. **Fence every key concept** — state what it IS and what it IS NOT to prevent audience confusion.

9. **End with Contributions, not "Thank you"** — the final slide lists what was accomplished/recommended. Closing words: joke, call to action, or salute.

10. **Winston Star check** — run the 5-S check (Symbol, Slogan, Surprise, Salient Idea, Story) and note gaps.

### SCR order selection

| Variant                | Order     | Use when                                        |
| ---------------------- | --------- | ----------------------------------------------- |
| **SCR** (standard)     | S → C → R | Audience is skeptical; build the case first     |
| **RSC** (answer-first) | R → S → C | Audience is receptive; lead with recommendation |
| **CSR** (concerned)    | C → S → R | Audience already feels the pain; validate first |

### Output format

Always output a complete Markdown file following the template structure. Use a descriptive filename like `draft-[topic].md`.

The frontmatter (`title`, `audience`, `mode`, `goal`, `duration`, `winston`) is the handoff to `presentation-designer`. Fill every field; the designer will not ask again for what is there.

**Saving the file — detect your environment and act accordingly:**

| Environment     | How to detect                                   | Where to save                                                                              | How to deliver                                                                 |
| --------------- | ----------------------------------------------- | ------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| **Claude.ai**   | `/mnt/user-data/outputs/` exists                | `/mnt/user-data/outputs/draft-[topic].md`                                                  | Call `present_files` after saving — without it the user cannot access the file |
| **Claude Code** | Running in a terminal / local project directory | Save to the **current working directory** (project root), e.g. `./drafts/draft-[topic].md` | The file is in the user's repo — just confirm the path                         |

Detection logic: check if `/mnt/user-data/outputs/` exists. If yes → Claude.ai. Otherwise → Claude Code (save to project root).

## Step 4: Review and iterate

After the first draft, prompt the user with the quality checklist relevant to their talk type. Present it as a quick interactive review, not a wall of text.

**For SCR talks:**

- Does S→but→C→therefore→R flow naturally?
- Is the Situation ≤3 slides of noncontroversial facts?
- Does the Complication create clear "why now?" urgency?
- Is the Resolution specific (what, how, who, when)?
- Do key messages alone tell the full story (horizontal logic)?

**For Training sessions:**

- Are interaction points spaced ≤15 min apart?
- Are questions calibrated (not too easy, not too hard)?

**If `winston: true`:**

- Empowerment promise in the first 2 minutes?
- Each key concept cycles 3× (training)?
- Every concept fenced (IS / IS NOT)?
- Final slide = Contributions?
- Winston Star check passed?

**For all talks:**

- Frontmatter complete (`audience`, `mode`, `goal`, `duration`, `winston`)?
- Practiced with someone unfamiliar?

## Step 5: Hand off

When the user is happy with the draft, offer the next step: `presentation-designer` turns `draft-[topic].md` into `spec-[topic].md`.

## Tone and interaction style

- Be direct. The user is a busy consultant — no fluff, no sycophancy.
- Push back when structure is weak. "Your Complication has no urgency" is helpful; "looks great!" is not.
- If the user provides a vague topic, ask one focused clarifying question, then draft. Don't interview them for 5 rounds.
- If the user asks you to add something that violates the frameworks (e.g., a long Situation, or a "Thank you" ending when `winston: true`), flag it and explain why — but ultimately respect their decision.
