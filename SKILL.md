---
name: vibe-research
description: Set up and maintain a Vibe Research project with bi-directional sync between experimental code and paper.md. Use when starting a research project, managing experimental code, maintaining research documentation, creating academic papers, writing research logs, or when the user mentions vibe research, paper sync, research log, experiment tracking, or bi-directional sync between code and paper.
---

# Vibe Research

Vibe Research treats the AI agent as a "talented but untrustworthy remote research team." The human researcher sets direction and reviews results through a compressed documentation interface. The soul of the system is **bi-directional sync**: code and `paper.md` are always mirrors of each other at the methodological level.

## Project Initialization

When the user says "Init folder" or asks to initialize a Vibe Research project, run the init script directly — no code generation needed:

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

This creates the full project structure, all template files, and `.gitignore` in the current working directory. The script is idempotent: it skips files that already exist.

If code already exists after init, read it and populate `paper.md`, `README.md`, and `documents.md` from scratch based on what you find.

To add a LaTeX paper later (only when user requests):

```bash
bash ~/.cursor/skills/vibe-research/scripts/init_latex.sh
```

This creates `latex/`, copies `math_commands.tex` and `arxiv.sty`, stubs out section files, and patches the LaTeX sync rule into `AGENTS.md` automatically.

## Project Structure

```
project/
├── AGENTS.md              # Agent instructions (gitignored)
├── paper.md               # Shadow academic paper (gitignored)
├── README.md              # Engineering guide (how to run experiments)
├── documents.md           # Developer/collaborator reference
├── .gitignore             # Python defaults + research files
├── src/                   # Core code (structure must be clear and logical)
├── results/               # Experiment outputs
└── research_log/          # Per-session reports (append-only)
    └── img/               # Images referenced in log reports
```

If the user requests a LaTeX paper, also create:
```
latex/
├── main.tex
├── math_commands.tex
├── arxiv.sty
└── sections/
```

## Core Rule: Bi-directional Sync

**This is the highest-priority rule. Never skip it.**

| Trigger | Required action |
|---------|-----------------|
| Code changes at methodological level | Update `paper.md` Method + Result |
| Edit `paper.md` Method section | Sync the logic back to code |
| Update `README.md` API/usage | Ensure code matches the documented interface |
| LaTeX paper exists: any sync event above | Also update `latex/` accordingly |

**Methodological level** = algorithm design, loss functions, model architecture choices, data processing approaches. NOT variable renaming, formatting, minor refactors.

## paper.md Format

Exactly four sections, academic style, no implementation details:

```markdown
# [Title]

## Abstract
[One paragraph: problem, method, key results.]

## Introduction
[Background, motivation, research question. Academic tone.]

## Method
[Mathematical principles and algorithmic frameworks ONLY.
NO class names, function calls, or file paths.
Include concrete formulas. Detail level matches an academic paper.]

## Result
[Results with embedded images and tables.
Images must be embedded inline (not just linked).
Tables in standard Markdown. Include analysis.]
```

## Research Log: After Every Session

After completing any changes, create a report file.

**Path**: `research_log/YYYYMMDD_HH-MM.md` (e.g., `research_log/20260227_14-30.md`)

**Format**:
```markdown
# [YYYY-MM-DD HH:MM] Session Report

## Objective
[What this session aimed to accomplish]

## Changes
[Differential: what changed vs. previous state, and why]

## Results
[Outcomes, metrics, observations. Embed images inline.]

![description](img/imagename_YYYY-MM-DD-H_M_S.ext)

## Next Steps
[Open questions, planned experiments]
```

**Images**: Before embedding, copy to `research_log/img/` and rename:
`[original_name]_[YYYY-MM-DD-H_M_S].[ext]`

## documents.md (One-way Sync: Code → docs)

For developers, collaborators, and future agents. Add anything with >50% chance of future usefulness:
- Architecture decisions and trade-offs
- Non-obvious data formats or structures
- Gotchas encountered during experiments
- Environment setup specifics
- What worked / what failed (to avoid repeating mistakes)

Sync direction is ONE-WAY: code drives this file. Never modify code based on `documents.md`.

## Coding Style

Research code prioritizes readability over abstraction:

- **KISS + YAGNI**: Write the most direct implementation; no generic utilities or future-proofing
- **LoB (Locality of Behavior)**: Keep related logic together. A 60-line function that clearly mirrors a formula's steps is better than 10-file inheritance chains
- **Fail-fast**: Assert dimensions, check for NaN, crash immediately on bad data — crashing is useful debugging information
- **All code comments in English**

## LaTeX Paper (Only When User Requests)

When the user asks for an arxiv/LaTeX paper, run `init_latex.sh` (see Initialization Commands above), then sync the current `paper.md` content into the generated `latex/sections/*.tex` files.

The `math_commands.tex` provides shorthand for vectors (`\va`, `\vb`...), matrices (`\mA`, `\mB`...), tensors (`\tA`...), sets (`\sR`, `\sN`...), and common operators (`\E`, `\KL`, `\argmax`...). Always use it.

## Language

- Code comments: always English
- `paper.md`, `README.md`, `documents.md`, research log: match the language the user uses to communicate
