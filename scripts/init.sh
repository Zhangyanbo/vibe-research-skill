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
    cp "$TEMPLATES/AGENTS.md" "$TARGET/AGENTS.md"
    echo "✓ Created AGENTS.md"
else
    echo "  Skipped AGENTS.md (already exists)"
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
| `research_log/` | Per-session reports |

## Data

[Describe data location, format, and how to obtain it.]
EOF
    echo "✓ Created README.md"
else
    echo "  Skipped README.md (already exists)"
fi

# ── documents.md ──────────────────────────────────────────────────────────────
if [ ! -f "$TARGET/documents.md" ]; then
    cat > "$TARGET/documents.md" << 'EOF'
# Developer & Collaborator Reference

> One-way sync from code → this file.
> Add anything with >50% chance of future usefulness.

## Architecture

[High-level description of how the code is organized.]

## Key Design Decisions

[Decisions made and why. Alternatives considered.]

## Gotchas & Known Issues

[Non-obvious problems encountered and their solutions.]

## Environment Notes

[Python version, GPU requirements, OS-specific notes, etc.]

## Failed Approaches

[What was tried and didn't work, to avoid repeating mistakes.]
EOF
    echo "✓ Created documents.md"
else
    echo "  Skipped documents.md (already exists)"
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
echo "Next: fill in paper.md, README.md, and start coding in src/."
