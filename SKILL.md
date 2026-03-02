---
name: vibe-research
description: Set up and maintain a Vibe Research project with bi-directional sync between experimental code, paper.md, and developer docs. Use when starting a research project, managing experimental code, maintaining research documentation, creating academic papers, writing research logs, updating project docs, migrating an existing project to Vibe Research structure, or when the user mentions vibe research, paper sync, research log, experiment tracking, project migration, partial migration, incremental migration, doc update, or bi-directional sync between code and paper.
---

# Vibe Research

Vibe Research treats the AI agent as a "talented but untrustworthy remote research team." The human researcher sets direction and reviews results through a compressed documentation interface. The soul of the system is **bi-directional sync**: code, `paper.md`, and `doc/` are always mirrors of each other.

## Project Initialization

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

See [reference/init.md](reference/init.md) for details and post-init steps.

## Migration

- **Full migration** (no VR structure) — see [reference/migrate.md](reference/migrate.md)
- **Partial migration** (some VR structure, incomplete or drifted) — see [reference/partial-migrate.md](reference/partial-migrate.md)

## Core Rule: Bi-directional Sync

**Highest-priority rule. Never skip.**

| Trigger | Required action |
|---------|-----------------|
| Code changes at methodological level | Update `paper.md` Method + Result |
| Code changes at implementation level | Update relevant files in `doc/` |
| Edit `paper.md` Method section | Sync the logic back to code |
| Edit a `doc/` design or API page | Sync the change back to code |
| Update `README.md` API/usage | Ensure code matches the documented interface |

**Methodological** = algorithm design, loss functions, model architecture, data processing. **Implementation** = public APIs, design decisions, architecture changes, new modules, non-obvious bug fixes.

## Document Maintenance

**Invoked at the end of every agent session.** `doc/` is the engineering companion to `paper.md`. Every file ≤ 120 lines; every file linked from its parent `README.md`; navigate by following links, never by scanning.

See [reference/doc-maintenance.md](reference/doc-maintenance.md) for structure, templates, sync rules, and session-end checklist.

## Principal

`principal.md` records user-stated principles. Read at session start; append when new principles emerge.

## File Formats

See [reference/formats.md](reference/formats.md). Key constraints: `paper.md` has four sections only (Abstract, Introduction, Method, Result); research log entries go in `research_log/YYYYMMDD_HH-MM.md`.

## Coding Style

- **KISS + YAGNI**: Most direct implementation; no future-proofing
- **LoB (Locality of Behavior)**: Keep related logic together over splitting across files
- **Fail-fast**: Assert dimensions, check for NaN, crash on bad data
- **All code comments in English**
