# Vibe Research

An Agent skill for setting up and maintaining **Vibe Research** projects with bi-directional sync between experimental code, a shadow academic paper (`paper.md`), and developer docs (`doc/`).

For the original post introducing this workflow, see [this thread](https://x.com/YanboZhang3/status/2017365847589695530).

## What It Does

Vibe Research treats the AI agent as a “talented but untrustworthy remote research team.” You set direction and review results through a compact documentation surface. The core idea is **bi-directional sync**: code and `paper.md` stay aligned at the methodological level—algorithm design, loss functions, model architecture, data processing—so the paper always reflects the code and the code reflects the paper.

This skill teaches the agent how to:

- **Initialize** a full Vibe Research project (folders, templates, `.gitignore`)
- **Keep `paper.md` and code in sync** when either side changes at the methodological level
- **Maintain `doc/`** — an agent-maintained developer knowledge base with architecture, API reference, design decisions, pitfalls, and code snippets
- **Write research logs** after each session with objectives, changes, results, and next steps

## When to Use

Use this skill when you:

- Start a new research project and want a consistent structure
- Mention **vibe research**, **paper sync**, **research log**, or **experiment tracking**
- Need **bi-directional sync** between code and an academic-style paper
## Quick Start

From a project folder, ask the agent to initialize a Vibe Research project (e.g. “Init folder” or “Set up vibe research here”). The agent will run the init script and create:

- `paper.md` — shadow academic paper (Abstract, Introduction, Method, Result)
- `README.md` — engineering guide and how to run experiments
- `doc/` — developer knowledge base (architecture, API docs, pitfalls, snippets)
- `principal.md` — user-stated principles (agent-maintained)
- `AGENTS.md` — agent instructions
- `src/`, `results/`, `research_log/`

After that, any methodological change in code should update `paper.md`, and any change in `paper.md`’s Method section should be reflected in the code.

## Project Layout

```
project/
├── AGENTS.md              # Agent instructions
├── principal.md           # User-stated principles (agent-maintained)
├── paper.md               # Shadow academic paper
├── README.md              # How to run experiments
├── doc/                   # Developer knowledge base (agent-maintained)
│   └── README.md          # Entry point (max 120 lines)
├── .gitignore
├── src/                   # Core code
├── results/               # Experiment outputs
└── research_log/          # Per-session reports (append-only)
    └── img/               # Images for log reports
```

## License

MIT License. See [LICENSE](LICENSE).
