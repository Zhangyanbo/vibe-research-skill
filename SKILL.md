---
name: vibe-research
description: Set up and maintain a Vibe Research project with bi-directional sync between experimental code, paper.md, and developer docs. Use when starting a research project, managing experimental code, maintaining research documentation, creating academic papers, writing research logs, updating project docs, migrating an existing project to Vibe Research structure, or when the user mentions vibe research, paper sync, research log, experiment tracking, project migration, partial migration, incremental migration, doc update, or bi-directional sync between code and paper.
---

# Vibe Research

Vibe Research treats the AI agent as a "talented but untrustworthy remote research team." The human researcher sets direction and reviews results through a compressed documentation interface. The soul of the system is **bi-directional sync**: code, `paper.md`, and `doc/` are always mirrors of each other.

## Migrating an Existing Project

### Full migration (no existing VR structure)

1. **Understand the project** — if the user hasn't explained the experiment flow, goal, and result locations, ask before touching any files.
2. **Run the init script** (idempotent — safe on existing directories).
3. **Move source code → `src/`**, existing results → `results/`.
4. **Update all path references** in code to match the new layout.
5. **Smoke test** — run with minimal config; no data corruption; delete temp files; estimate runtime first (max 10 min).
6. **Populate `doc/`** from code reading (see [Document Maintenance](#document-maintenance) below).
7. **Populate `paper.md` and `README.md`** based on current state.

### Partial migration (some VR structure already exists)

When a project has **some** VR structure but is incomplete or drifted out of sync:

1. **Audit every component** — classify each as conforming / stale / non-conforming / missing. Present the audit table to the user.
2. **Generate a plan grouped by risk** (safe → moderate → caution). Get user approval.
3. **Execute incrementally** — create missing structure first, then move files, then refresh stale docs, then restructure non-conforming files. Verify after each step.
4. **Verify sync state** — confirm `paper.md`, `doc/`, `README.md`, and code are all in sync.

**Key safety rules**: never overwrite meaningful content without showing a diff; use `git mv`; back up before restructuring; merge rather than replace files that have project-specific customizations.

See [reference/migrate.md](reference/migrate.md) for full migration and [reference/partial-migrate.md](reference/partial-migrate.md) for partial migration.

---

## Project Initialization

When the user says "Init folder" or asks to initialize a Vibe Research project:

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

See [reference/init.md](reference/init.md) for full details: what files get created, post-init steps if code already exists, and localized paper setup.

## Core Rule: Bi-directional Sync

**This is the highest-priority rule. Never skip it.**

| Trigger | Required action |
|---------|-----------------|
| Code changes at methodological level | Update `paper.md` Method + Result |
| Code changes at implementation level | Update relevant files in `doc/` |
| Edit `paper.md` Method section | Sync the logic back to code |
| Edit a `doc/` design or API page | Sync the change back to code |
| Update `README.md` API/usage | Ensure code matches the documented interface |

**Methodological level** = algorithm design, loss functions, model architecture choices, data processing approaches. NOT variable renaming, formatting, minor refactors.

**Implementation level** = public APIs, key design decisions, architecture changes, new modules, new dependencies, bug fixes with non-obvious root causes.

## Document Maintenance

**Invoked at the end of every agent session.** The `doc/` folder is an agent-maintained developer knowledge base that evolves with the research — the engineering companion to `paper.md`. Bi-directional sync with code; `doc/README.md` (max 120 lines) is the entry point, with sub-pages for architecture, API, decisions, pitfalls, snippets, and resources.

See [reference/doc-maintenance.md](reference/doc-maintenance.md) for the full specification: directory structure, sub-page templates, sync rules, and session-end checklist.

## Principal

`principal.md` records user-stated principles and preferences that the agent should universally follow across sessions. The agent dynamically updates this file when the user expresses a generalizable preference or working principle. Read it at the start of every session; append to it when new principles emerge.

## File Formats and Templates

See [reference/formats.md](reference/formats.md) for exact templates.

Key constraints:
- `paper.md`: four sections only — Abstract, Introduction, Method, Result. Academic style, no code references.
- Research log: `research_log/YYYYMMDD_HH-MM.md`, created after every session.
- `doc/`: bi-directional sync with code; see [Document Maintenance](#document-maintenance) above.

## Coding Style

Research code prioritizes readability over abstraction:

- **KISS + YAGNI**: Write the most direct implementation; no generic utilities or future-proofing
- **LoB (Locality of Behavior)**: Keep related logic together. A 60-line function that clearly mirrors a formula's steps is better than 10-file inheritance chains
- **Fail-fast**: Assert dimensions, check for NaN, crash immediately on bad data — crashing is useful debugging information
- **All code comments in English**
