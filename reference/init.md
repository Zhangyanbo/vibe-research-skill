# Project Initialization Reference

## Base Project

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

Idempotent — skips files that already exist. Creates in the current working directory:

```
project/
├── AGENTS.md              # Agent instructions (versioned)
├── paper.md               # Shadow academic paper (versioned)
├── README.md              # Engineering guide (how to run experiments)
├── documents.md           # Developer/collaborator reference
├── .gitignore             # Python defaults + paper.[a-z][a-z].md
├── src/                   # Core code
├── results/               # Experiment outputs
└── research_log/
    └── img/
```

**If code already exists at init time**: read it and populate `paper.md`, `README.md`, and `documents.md` from scratch based on what you find.

## LaTeX Paper (on demand)

See [latex.md](latex.md) for full details.

```bash
bash ~/.cursor/skills/vibe-research/scripts/init_latex.sh
```

## Localized Papers

If the user requests a non-English paper, create `paper.{LANG}.md` (e.g. `paper.zh.md`):
- Same four-section structure as `paper.md`
- Keep in sync whenever `paper.md` is synced
- Add to `.gitignore` (the init script adds `paper.[a-z][a-z].md` by default)
