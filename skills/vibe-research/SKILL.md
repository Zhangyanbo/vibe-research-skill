---
name: vibe-research
description: Set up and organize a Vibe Research project - a research workflow where the human scientist defines goals, standards and boundaries, and agents work autonomously within them. Use when starting a new research project, migrating an existing project into this structure, preparing a branch merge, or whenever the user mentions vibe research, research project setup, experiment scaffolding, or project migration.
---

# Vibe Research (core skill)

Set up and maintain Vibe Research projects: the user defines goals, standards and boundaries; the agent chooses the means within them. This skill covers project setup, migration of existing projects, deciding which skill to use when, and merge acceptance. **Only this skill references other skills; the other skills never reference each other.**

## Which skill to use when

| Situation | Default skill | Also consult |
|-----------|---------------|--------------|
| Writing code | `vibe-research-coding` | `my-scientific-taste` |
| Writing the paper | `vibe-research-paper` | `my-scientific-taste` |
| Exploring ideas, running experiments | `vibe-research-explore` | `my-scientific-taste` |
| Large-scale parameter search | `vibe-research-optimize` | `my-scientific-taste` |
| Plotting | `nature-style` | |

- Use `my-scientific-taste` together with other skills when writing paper, writing code, exploring ideas.
- Use `my-scientific-taste` when you facing situations that user did not specify. Taste is your boundary for what is acceptable and what is not. It is your default when the user did not specify.
- For plotting, use `nature-style`; if it is not installed, install it from https://github.com/Zhangyanbo/nature-style-skill.

## Project template

This skill ships with [template/](template/): the project structure and the CLAUDE.md file for each directory. Copy it directly when initializing or migrating, then instantiate it for the user's situation. The CLAUDE.md files carry the always-on rules (directory organization, decision boundaries, figure requirements) and the project's accumulated lessons; skills carry workflows. The two do not repeat each other.

## Initializing a project

1. **Ask first; never skip this**:
   - What is the research question? (a sentence or two is enough)
   - What are the hard boundaries? (compute budget, data that must never be touched, anything else off-limits)
   - Which language does the user read the paper in? (English is always the authoritative version; the user-language version serves the user's own thinking)
   - Where do existing code and data live?
2. Copy template/ to create the structure: `CLAUDE.md`, `paper/`, `src/`, `result/`, `data/`, `tmp/`, `todo.md`.
3. Instantiate the CLAUDE.md files from the user's answers (the language policy goes into the slot in `paper/CLAUDE.md`).
4. `git init`, `uv init`.

## Migrating an existing project

1. Understand the project first: the experiment flow, the goal, where results live. Ask if unclear.
2. Inventory existing files and place them by whether the user reads them: code → `src/`, figures and conclusions for humans → `result/`, large artifacts → `data/`, drafts → `tmp/`.
3. Move files with `git mv`; update path references in code; run a small smoke test (estimate the runtime first; ask before anything over 10 minutes).
4. Never overwrite a file that has content; show the user the diff when there is a conflict.

## Merge acceptance

Merging back to the main branch requires the user's confirmation: a merge is acceptance, and work is never accepted by the one who did it. The user judges mainly from the figures; every check below exists to make that judgment cheap and truthful. Before the merge, check:

- Paper and code are in sync (this is the moment to sync, not on every change)
- The paper-code-figure consistency check reports **factual mismatches only** (contradicting numbers, text contradicting figures); loose wording is not a violation
- `tmp/` is empty; sweep-style temporary outputs are cleaned up
- Every formal figure in `result/` can be re-plotted directly from git-tracked data

After the merge, clean up branches that are safe to delete.
