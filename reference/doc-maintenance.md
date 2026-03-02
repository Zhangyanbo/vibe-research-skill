# Document Maintenance Reference

The `doc/` folder is a project-specific, agent-maintained knowledge base that evolves alongside the code. It serves as the engineering companion to `paper.md` — while the paper explains the science, `doc/` explains how to develop, extend, and debug the project.

**Audience**: someone with zero prior knowledge of the project.

---

## Directory Structure

```
doc/
├── README.md          # Entry point (max 120 lines)
├── architecture.md    # System design, module map, data flow
├── api.md             # Public API reference (PyTorch-doc style)
├── decisions.md       # Key non-obvious design decisions and rationale
├── pitfalls.md        # Gotchas, common errors, debugging tips
├── snippets/          # Reusable code snippets
│   └── *.md
└── resources/         # External links, papers, datasets
    └── *.md
```

Only `doc/README.md` is mandatory. Create other files as content warrants — don't scaffold empty pages.

---

## `doc/README.md` — The Entry Point

Max **120 lines**. Acts as a table of contents with brief one-liner summaries. When content grows beyond what fits, extract into a linked sub-page.

### Template

```markdown
# Project Developer Docs

> Auto-maintained by the AI agent. Bi-directional sync with code.

## Overview

[2-3 sentence project summary from an engineering perspective.]

## Quick Links

| Topic | File | Summary |
|-------|------|---------|
| Architecture | [architecture.md](architecture.md) | Module layout and data flow |
| API Reference | [api.md](api.md) | Public functions, classes, parameters |
| Design Decisions | [decisions.md](decisions.md) | Why things are built this way |
| Pitfalls | [pitfalls.md](pitfalls.md) | Known gotchas and debugging tips |

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

### `snippets/`

Reusable code patterns, organized by topic (e.g., `snippets/data-loading.md`, `snippets/visualization.md`). Each snippet includes a title, brief context, and a code block.

### `resources/`

External references: paper links, dataset URLs, relevant blog posts, tool documentation. Organized by topic.

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
- [ ] Verify doc/README.md is under 120 lines (extract if needed)
- [ ] If new public API: update doc/api.md
- [ ] If non-obvious bug fixed: append to doc/pitfalls.md
```
