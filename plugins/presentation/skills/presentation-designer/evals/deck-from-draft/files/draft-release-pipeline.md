---
# Handoff to presentation-designer. Keep these fields filled.
title: "Release pipeline"
audience: "Engineering leads of five product teams; know GitLab CI, skeptical about central templates"
mode: talk          # talk | read | both
goal: "Approve a pilot of the pipeline template with two more teams in Q1"
duration: "15 min"
winston: true       # apply Winston's story rules (true | false)
---

# Release pipeline: one template for every project

## Empowerment Promise (only if `winston: true`)

> _"By the end of this session, you will know what a shared pipeline template saves your team and what it costs to adopt it."_

---

## SCR Storyline

### Situation

Every team maintains its own GitLab pipeline.

### Complication

**But:** builds take 12 minutes on average, and only two of five teams run security scans before merging.

### Resolution

**Therefore:** one pipeline template with caching and scans built in. The pilot team cut builds to 4 minutes. Two more teams adopt it in Q1.

---

## Slides

### Chapter 1: Situation

#### Slide 1 (Title)

- **Key message:** One template for every project
- **Content:** Title, subtitle
- **Slide notes:** Empowerment promise.

#### Slide 2

- **Key message:** Every team builds its own pipeline from scratch.
- **Content:** Five team names, each with its own pipeline file.
- **Slide notes:** Noncontroversial; everybody in the room maintains one.

### Chapter 2: Complication

#### Slide 3

- **Key message:** Builds take 12 minutes and most teams skip security scans.
- **Content:** One big number (12 min average build) next to "2 of 5 teams scan before merge".
- **Slide notes:** Source: GitLab CI analytics, August to October 2026.

### Chapter 3: Resolution

#### Slide 4

- **Key message:** The template caches dependencies and runs scans on every merge.
- **Content:** Three steps: build with cache, scan, deploy via Argo CD.
- **Slide notes:** Show the include line teams add to their .gitlab-ci.yml.

#### Slide 5

- **Key message:** The pilot team now builds in 4 minutes instead of 12.
- **Content:** Before / after comparison: 12 min vs 4 min.
- **Slide notes:** Pilot team: [team]; numbers from the same analytics.

### Closing Slide: Contributions (if `winston: false`: a normal summary / call to action slide)

- **Key message:** One template, scans on every merge, two more teams in Q1.
- **Content:** Three contributions: the template, security scans on every merge, the Q1 pilot with two more teams.
- **Slide notes:** Call to action: name the two pilot teams today.

---

## Winston Star Check (only if `winston: true`)

- [x] **Symbol** - One pipeline shared by five teams
- [x] **Slogan** - "One template, every project"
- [x] **Surprise** - 12 to 4 minutes
- [x] **Salient Idea** - Shared pipelines are faster and safer
- [ ] **Story** - Pilot team story still missing
