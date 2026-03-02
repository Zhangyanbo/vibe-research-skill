#!/usr/bin/env bash
# Vibe Research project initializer.
# Run from the project root directory.
# Usage: bash ~/.cursor/skills/vibe-research/scripts/init.sh

set -e

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATES="$SKILL_DIR/resources/templates"
TARGET="$(pwd)"

echo "Initializing Vibe Research project in: $TARGET"
echo ""

# ── Directories ──────────────────────────────────────────────────────────────
mkdir -p "$TARGET/src"
mkdir -p "$TARGET/results"
mkdir -p "$TARGET/research_log/img"
echo "✓ Created directories: src/, results/, research_log/img/"

# ── AGENTS.md ─────────────────────────────────────────────────────────────────
if [ ! -f "$TARGET/AGENTS.md" ]; then
    cp "$TEMPLATES/agents-rules.md" "$TARGET/AGENTS.md"
    echo "✓ Created AGENTS.md"
else
    echo "  Skipped AGENTS.md (already exists)"
fi

# ── principal.md ──────────────────────────────────────────────────────────────
if [ ! -f "$TARGET/principal.md" ]; then
    cat > "$TARGET/principal.md" << 'EOF'
# Principal

> Agent-maintained file. Records user-stated principles and preferences
> that apply universally across sessions. Read at the start of every session.

EOF
    echo "✓ Created principal.md"
else
    echo "  Skipped principal.md (already exists)"
fi

# ── paper.md ──────────────────────────────────────────────────────────────────
if [ ! -f "$TARGET/paper.md" ]; then
    cp "$TEMPLATES/paper.md" "$TARGET/paper.md"
    echo "✓ Created paper.md"
else
    echo "  Skipped paper.md (already exists)"
fi

# ── README.md ─────────────────────────────────────────────────────────────────
if [ ! -f "$TARGET/README.md" ]; then
    cat > "$TARGET/README.md" << 'EOF'
# [Project Name]

## Overview

[One-sentence description of what this project does.]

## Setup

```bash
# Install dependencies
pip install -r requirements.txt
```

## Running Experiments

```bash
# [Describe how to run the main experiment]
python src/main.py
```

## Directory Structure

| Path | Description |
|------|-------------|
| `src/` | Core experimental code |
| `results/` | Experiment outputs |
| `doc/` | Developer docs (agent-maintained) |
| `research_log/` | Per-session reports |

## Data

[Describe data location, format, and how to obtain it.]
EOF
    echo "✓ Created README.md"
else
    echo "  Skipped README.md (already exists)"
fi

# ── doc/ folder ───────────────────────────────────────────────────────────────
mkdir -p "$TARGET/doc"
if [ ! -f "$TARGET/doc/README.md" ]; then
    cat > "$TARGET/doc/README.md" << 'EOF'
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
EOF
    echo "✓ Created doc/README.md"
else
    echo "  Skipped doc/README.md (already exists)"
fi

# ── .gitignore ────────────────────────────────────────────────────────────────
if [ ! -f "$TARGET/.gitignore" ]; then
    cat > "$TARGET/.gitignore" << 'EOF'
# Python
__pycache__/
*.py[cod]
*.pyo
*.pyd
.Python
*.egg
*.egg-info/
dist/
build/
.eggs/
.venv/
venv/
env/
.env
*.so

# Jupyter
.ipynb_checkpoints/
*.ipynb

# Data & outputs (adjust as needed)
*.csv
*.pkl
*.h5
*.pt
*.pth

# Vibe Research: localized papers only (non-English)
paper.[a-z][a-z].md

# OS
.DS_Store
Thumbs.db
EOF
    echo "✓ Created .gitignore"
else
    # Ensure vibe research entries are present
    GITIGNORE="$TARGET/.gitignore"
    for entry in "paper.[a-z][a-z].md"; do
        if ! grep -qF "$entry" "$GITIGNORE"; then
            echo "$entry" >> "$GITIGNORE"
            echo "  Added '$entry' to existing .gitignore"
        fi
    done
    echo "  Updated existing .gitignore"
fi

echo ""
echo "Done. Project is ready."
echo "Next: fill in paper.md, README.md, doc/README.md, and start coding in src/."
