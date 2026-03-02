# Document Maintenance Reference

The `doc/` folder is a project-specific, agent-maintained knowledge base that evolves alongside the code. It serves as the engineering companion to `paper.md` — while the paper explains the science, `doc/` explains how to develop, extend, and debug the project.

**Audience**: someone with zero prior knowledge of the project.

---

## File Length Limit

**Every file in `doc/` must stay under 120 lines.** When a file approaches this limit, extract a section into a new sub-page and link to it from the parent.

Exceptions are allowed only when splitting would destroy the coherence of tightly coupled content (e.g., a single API reference table that cannot be meaningfully divided). Document the reason in a comment at the top of the file if it exceeds 120 lines.

---

## Directory Structure — Link-Based Navigation

`doc/` uses a **hierarchical, link-navigated** structure. The key rule:

> **Every file and subdirectory must be linked from its parent README.** The agent finds content by following links down from `doc/README.md`, not by scanning the file tree.

```
doc/
├── README.md              # Entry point — links to all top-level pages and subdirs
├── [topic].md             # Top-level pages (architecture, api, decisions, etc.)
└── [subdir]/              # Subdirectory for a group of related pages
    ├── README.md          # Subdirectory entry point — links to all pages within
    └── [page].md
```

### Rules

1. **`doc/README.md` is the only mandatory file.** Create other files only as content warrants — never scaffold empty pages.
2. **Every level has a README.** If a subdirectory exists (e.g., `snippets/`, `resources/`), it must have its own `README.md` listing and linking all files inside.
3. **READMEs are tables of contents**, not content pages. Brief one-liner summaries per link; extract detail into sub-pages.
4. **One-level-deep linking.** Each README links to files in its own directory, not to files nested two levels down. Navigation is always: parent README → child page (or child README → grandchild page).
5. **Agent navigation rule:** To find information in `doc/`, start at `doc/README.md` and follow links. Never scan the directory tree or read files speculatively.

### Typical top-level pages

These are common pages, not a required list — create what the project needs:

- `architecture.md` — module map, data flow
- `api.md` — public API reference
- `decisions.md` — key non-obvious design decisions
- `pitfalls.md` — gotchas, debugging tips

### `doc/README.md` template

```markdown
# Project Developer Docs

> Auto-maintained by the AI agent. Bi-directional sync with code.

## Overview

[2-3 sentence project summary from an engineering perspective.]

## Pages

| Topic | File | Summary |
|-------|------|---------|
| Architecture | [architecture.md](architecture.md) | Module layout and data flow |
| API Reference | [api.md](api.md) | Public functions, classes, parameters |
| ... | ... | ... |

## Getting Started

[Minimal steps to get a new developer productive.]

## Key Concepts

[3-5 bullet points covering the most important abstractions.]
```

---

## Sub-Page Formats

### `architecture.md`

- High-level module map (which files do what)
- Data flow: input → processing → output
- Key dependencies and their roles

### `api.md` — PyTorch-Doc Style

Each public function/class gets:

```markdown
### `function_name(param1, param2, **kwargs)`

Brief description of what this function does.

**Parameters:**
- `param1` (`type`): Description. Default: `value`.
- `param2` (`type`): Description.

**Returns:** `type` — Description.

**Example:**
\`\`\`python
result = function_name("input", param2=42)
\`\`\`
```

### `decisions.md`

Each entry:

```markdown
### [Decision Title]

**Date:** YYYY-MM-DD
**Context:** Why this decision was needed.
**Decision:** What was chosen.
**Alternatives considered:** What else was evaluated and why it was rejected.
```

### `pitfalls.md`

Auto-appended whenever a non-obvious bug is encountered or fixed:

```markdown
### [Short description]

**Symptom:** What went wrong.
**Root cause:** Why it happened.
**Fix:** How it was resolved.
```

---

## Sync Rules

### Bi-directional

| Trigger | Action |
|---------|--------|
| New module or public API added in code | Create/update `doc/api.md` |
| Architecture change in code | Update `doc/architecture.md` |
| Non-obvious bug fixed | Append to `doc/pitfalls.md` |
| Key design decision made | Append to `doc/decisions.md` |
| `doc/api.md` signature edited | Update the corresponding code |
| `doc/architecture.md` design changed | Reflect in code structure |

### Session-End Checklist

Run at the end of every agent interaction:

```
- [ ] Review session changes
- [ ] Update relevant doc/ pages for any implementation-level changes
- [ ] Verify every file in doc/ is under 120 lines (extract if needed)
- [ ] Verify every file is linked from its parent README
- [ ] If new public API: update doc/api.md
- [ ] If non-obvious bug fixed: append to doc/pitfalls.md
```
