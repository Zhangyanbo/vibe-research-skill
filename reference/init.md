# Project Initialization Reference

## Base Project

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

Idempotent — skips files that already exist. Creates in the current working directory:

```
project/
├── AGENTS.md              # Agent instructions (versioned)
├── principal.md           # User-stated principles (agent-maintained)
├── paper.md               # Shadow academic paper (versioned)
├── README.md              # Engineering guide (how to run experiments)
├── doc/                   # Developer knowledge base (agent-maintained)
│   └── README.md          # Entry point (max 120 lines)
├── .gitignore             # Python defaults + paper.[a-z][a-z].md
├── src/                   # Core code
├── results/               # Experiment outputs
└── research_log/
    └── img/
```

**If code already exists at init time**: read it and populate `paper.md`, `README.md`, and `doc/` from scratch based on what you find.

## Localized Papers

If the user requests a non-English paper, create `paper.{LANG}.md` (e.g. `paper.zh.md`):
- Same four-section structure as `paper.md`
- Keep in sync whenever `paper.md` is synced
- Add to `.gitignore` (the init script adds `paper.[a-z][a-z].md` by default)
