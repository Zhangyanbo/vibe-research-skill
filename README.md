# Vibe Research

An Agent skill for setting up and maintaining **Vibe Research** projects with bi-directional sync between experimental code and a shadow academic paper (`paper.md`).

For the original post introducing this workflow, see [this thread](https://x.com/YanboZhang3/status/2017365847589695530).

## What It Does

Vibe Research treats the AI agent as a “talented but untrustworthy remote research team.” You set direction and review results through a compact documentation surface. The core idea is **bi-directional sync**: code and `paper.md` stay aligned at the methodological level—algorithm design, loss functions, model architecture, data processing—so the paper always reflects the code and the code reflects the paper.

This skill teaches the agent how to:

- **Initialize** a full Vibe Research project (folders, templates, `.gitignore`)
- **Keep `paper.md` and code in sync** when either side changes at the methodological level
- **Maintain** `README.md` (how to run experiments), `documents.md` (developer/collaborator notes), and optional LaTeX
- **Write research logs** after each session with objectives, changes, results, and next steps

## When to Use

Use this skill when you:

- Start a new research project and want a consistent structure
- Mention **vibe research**, **paper sync**, **research log**, or **experiment tracking**
- Need **bi-directional sync** between code and an academic-style paper
- Want to add or maintain a LaTeX/arXiv paper derived from `paper.md`

## Quick Start

From a project folder, ask the agent to initialize a Vibe Research project (e.g. “Init folder” or “Set up vibe research here”). The agent will run the init script and create:

- `paper.md` — shadow academic paper (Abstract, Introduction, Method, Result)
- `README.md` — engineering guide and how to run experiments
- `documents.md` — architecture, gotchas, environment notes
- `AGENTS.md` — agent instructions (gitignored)
- `src/`, `results/`, `research_log/` and optional `latex/`

After that, any methodological change in code should update `paper.md`, and any change in `paper.md`’s Method section should be reflected in the code.

## Project Layout

```
project/
├── AGENTS.md              # Agent instructions (gitignored)
├── paper.md               # Shadow academic paper (gitignored)
├── README.md              # How to run experiments
├── documents.md           # Developer/collaborator reference
├── .gitignore
├── src/                   # Core code
├── results/               # Experiment outputs
└── research_log/          # Per-session reports (append-only)
    └── img/               # Images for log reports
```

Optional `latex/` (main.tex, sections, math_commands.tex, arxiv.sty) is created when you ask for a LaTeX/arXiv paper.

## License

MIT License. See [LICENSE](LICENSE).
