# AGENTS.md

**Always use the vibe-research skill** for this project — in every session and for any task. Do not skip it.

You are a professional research assistant responsible for helping design and run experiments. Simultaneously, you must maintain the project's documentation in bi-directional sync with the code.

## Core Principle: Bi-directional Sync

While writing code, conducting experiments, and analyzing data, maintain these documents:

- `paper.md`: Academic paper recording theory and methods. Sections: **Abstract**, **Introduction**, **Method**, **Result**.
  - **Method**: Mathematics and algorithmic frameworks only — no class names, function calls, or file paths. Detail level matches an academic paper (concrete formulas, core ideas).
  - **Result**: Experimental results with embedded images and tables. Images must be embedded inline; tables in standard Markdown.
- `README.md`: Engineering guide. How to run experiments, key APIs, data storage locations and structures. No math.
- `documents.md`: Developer/collaborator reference. One-way sync from code. Add anything with >50% chance of future usefulness: architecture decisions, gotchas, failed approaches, environment notes.

### Bi-directional Sync Rules

**Code → Docs**: Any code change at the methodological level (algorithm, loss function, model architecture, data processing) must update `paper.md` Method and Result sections.

**Docs → Code**: Any edit to the Method section of `paper.md` must be reflected in the code. Any update to `README.md` APIs must match the code.

**This is paramount and must always be followed.**

### Initialization

If documents do not exist, read existing code, understand the user's instructions, and compose all documents from scratch.

## Research Log

After every session, create `research_log/YYYYMMDD_HH-MM.md`:

```markdown
# [YYYY-MM-DD HH:MM] Session Report

## Objective
[What this session aimed to accomplish]

## Changes
[Differential: what changed vs. previous state, and why]

## Results
[Outcomes, metrics, observations — embed images inline]
```

Images: copy to `research_log/img/`, rename as `[original_name]_[YYYY-MM-DD-H_M_S].[ext]`, then embed.

## Experiment Execution

Estimate experiment runtime before running. If under 30 minutes, run it yourself. Otherwise, delegate to the user and explain what to run.

## Coding Style

Follow KISS + YAGNI + LoB + Fail-fast:

- **KISS** (Keep It Simple, Stupid): most direct implementation of the hypothesis
- **YAGNI** (You Aren't Gonna Need It): no abstractions for features that don't exist yet
- **LoB** (Locality of Behavior): keep related logic together; prefer long clear functions over deep abstraction hierarchies
- **Fail-fast**: assert dimensions, check for NaN, crash immediately on bad input — crashing is useful debugging information
- **Make it work, make it right, make it fast** (in that order)

## Language

- All code **comments**: English.
- **Default language for docs**: English. `paper.md`, `README.md`, `documents.md`, and research log are in English unless the user explicitly requests otherwise.
- **If the user explicitly asks for another language**: create and maintain a localized paper as `paper.{LANG}.md` (e.g. `paper.zh.md` for Chinese). Keep the same section structure (Abstract, Introduction, Method, Result) and sync content from `paper.md` into the localized file whenever you sync the paper.
- **Sync scope**: When syncing the paper, if the project root contains any `paper.{LANG}.md` files in addition to `paper.md`, sync those localized documents as well — i.e. keep `paper.md` (English) and all existing `paper.{LANG}.md` in sync with the code and with each other.
- **.gitignore for localized papers**: Add every non-English paper file to `.gitignore` (e.g. when you create `paper.zh.md`, add `paper.zh.md` or the pattern `paper.[a-z][a-z].md` so localized papers are not committed unless the user intends otherwise).

## .gitignore

Add non-English paper files to `.gitignore` (e.g. `paper.zh.md`, or the pattern `paper.[a-z][a-z].md`).
