---
name: vibe-research
description: Set up and maintain a Vibe Research project with bi-directional sync between experimental code and paper.md. Use when starting a research project, managing experimental code, maintaining research documentation, creating academic papers, writing research logs, migrating an existing project to Vibe Research structure, or when the user mentions vibe research, paper sync, research log, experiment tracking, project migration, or bi-directional sync between code and paper.
---

# Vibe Research

Vibe Research treats the AI agent as a "talented but untrustworthy remote research team." The human researcher sets direction and reviews results through a compressed documentation interface. The soul of the system is **bi-directional sync**: code and `paper.md` are always mirrors of each other at the methodological level.

## Migrating an Existing Project

When the user asks to convert an existing project into a Vibe Research structure:

1. **Understand the project** — if the user hasn't explained the experiment flow, goal, and result locations, ask before touching any files.
2. **Run the init script** (idempotent — safe on existing directories).
3. **Move source code → `src/`**, existing results → `results/`.
4. **Update all path references** in code to match the new layout.
5. **Smoke test** — run with minimal config; no data corruption; delete temp files; estimate runtime first (max 10 min).
6. **Write `documents.md`** from code reading; one-way sync (code → docs).
7. **Populate `paper.md` and `README.md`** based on current state.

See [reference/migrate.md](reference/migrate.md) for the full checklist and detailed guidance.

---

## Project Initialization

When the user says "Init folder" or asks to initialize a Vibe Research project:

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

For LaTeX paper support (only when user requests):

```bash
bash ~/.cursor/skills/vibe-research/scripts/init_latex.sh
```

See [reference/init.md](reference/init.md) for full details: what files get created, post-init steps if code already exists, and localized paper setup.

## Core Rule: Bi-directional Sync

**This is the highest-priority rule. Never skip it.**

| Trigger | Required action |
|---------|-----------------|
| Code changes at methodological level | Update `paper.md` Method + Result |
| Edit `paper.md` Method section | Sync the logic back to code |
| Update `README.md` API/usage | Ensure code matches the documented interface |
| LaTeX paper exists: any sync event above | Also update `latex/` accordingly |

**Methodological level** = algorithm design, loss functions, model architecture choices, data processing approaches. NOT variable renaming, formatting, minor refactors.

## File Formats and Templates

See [reference/formats.md](reference/formats.md) for exact templates.

Key constraints:
- `paper.md`: four sections only — Abstract, Introduction, Method, Result. Academic style, no code references.
- Research log: `research_log/YYYYMMDD_HH-MM.md`, created after every session.
- `documents.md`: one-way sync (code → docs); never modify code based on it.

## LaTeX Paper

See [reference/latex.md](reference/latex.md) for structure, section mapping, and `math_commands.tex` shorthands.

## Coding Style

Research code prioritizes readability over abstraction:

- **KISS + YAGNI**: Write the most direct implementation; no generic utilities or future-proofing
- **LoB (Locality of Behavior)**: Keep related logic together. A 60-line function that clearly mirrors a formula's steps is better than 10-file inheritance chains
- **Fail-fast**: Assert dimensions, check for NaN, crash immediately on bad data — crashing is useful debugging information
- **All code comments in English**
