# Vibe Research

An Agent skill for running research projects with **bi-directional sync** between code and documentation.

For background on the Vibe Research workflow, see:
- [Original article (GitHub)](https://github.com/Zhangyanbo/vibe-research)
- [Thread on X](https://x.com/YanboZhang3/status/2017365847589695530)

## What It Does

The core mechanism is **bi-directional synchronization** between your code and two documentation surfaces: `paper.md` (a shadow academic paper) and `doc/` (a developer knowledge base). When the agent changes code, the docs update to match. When you edit the docs, the code follows.

This creates something deeper than just documentation. The docs become a **compressed, falsifiable commitment** — they capture not just what the code does, but what it *should* produce. The Method section promises an approach; the Result section promises an outcome. In the spirit of Popper's falsifiability, the paper becomes something you can *test*.

This is where reproducibility comes in. To verify a Vibe Research project, you can delete the code, the data, and the entire `doc/` folder — keeping only `paper.md`. Then hand it to a fresh agent: "Reproduce this." The agent reads the Method, writes new code from scratch, and checks whether the results match. If they do, the science holds regardless of how the original code was written.

**If** each verification is independent, AI hallucinations don't accumulate — they cancel out. In theory, with enough independent replications, confidence approaches certainty.

## Quick Start

**New project** — tell the agent to initialize a Vibe Research project:

```
"Init folder" or "Set up vibe research here"
```

This creates the standard directory structure, templates, and configuration files. From there, just start coding in `src/` — the agent handles doc sync automatically.

**Existing project** — tell the agent to migrate it:

```
"Migrate this project to vibe research"
```

The agent will assess the current state, move files into the standard layout, and populate the documentation from your existing code.

## Project Layout

A Vibe Research project separates *human-facing documentation* from *code and data*:

| Path | Purpose |
|------|---------|
| `paper.md` | Shadow academic paper — the falsifiable contract between you and the agent |
| `doc/` | Developer knowledge base — architecture, API, design decisions, pitfalls |
| `README.md` | Engineering guide — how to set up and run experiments |
| `src/` | Source code |
| `results/` | Experiment outputs |
| `research_log/` | Append-only session reports with objectives, changes, and results |
| `principal.md` | Your stated principles and preferences (agent reads this every session) |
| `AGENTS.md` | Agent instructions and rules |

## License

MIT License. See [LICENSE](LICENSE).
