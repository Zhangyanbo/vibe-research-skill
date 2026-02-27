#!/usr/bin/env bash
# Adds a LaTeX paper structure to an existing Vibe Research project.
# Run from the project root directory (must already be initialized with init.sh).
# Usage: bash ~/.cursor/skills/vibe-research/scripts/init_latex.sh

set -e

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATES="$SKILL_DIR/templates"
TARGET="$(pwd)"
LATEX_DIR="$TARGET/latex"

echo "Adding LaTeX paper structure to: $TARGET"
echo ""

# ── latex/ directory ──────────────────────────────────────────────────────────
mkdir -p "$LATEX_DIR/sections/appendix"
echo "✓ Created latex/sections/appendix/"

# ── main.tex ──────────────────────────────────────────────────────────────────
if [ ! -f "$LATEX_DIR/main.tex" ]; then
    cp "$TEMPLATES/main.tex" "$LATEX_DIR/main.tex"
    echo "✓ Created latex/main.tex"
else
    echo "  Skipped latex/main.tex (already exists)"
fi

# ── math_commands.tex ─────────────────────────────────────────────────────────
if [ ! -f "$LATEX_DIR/math_commands.tex" ]; then
    cp "$TEMPLATES/math_commands.tex" "$LATEX_DIR/math_commands.tex"
    echo "✓ Created latex/math_commands.tex"
else
    echo "  Skipped latex/math_commands.tex (already exists)"
fi

# ── arxiv.sty ─────────────────────────────────────────────────────────────────
if [ ! -f "$LATEX_DIR/arxiv.sty" ]; then
    cp "$TEMPLATES/arxiv.sty" "$LATEX_DIR/arxiv.sty"
    echo "✓ Created latex/arxiv.sty"
else
    echo "  Skipped latex/arxiv.sty (already exists)"
fi

# ── Section files ─────────────────────────────────────────────────────────────
for src in "$TEMPLATES/sections/"*.tex; do
    filename="$(basename "$src")"
    dest="$LATEX_DIR/sections/$filename"
    if [ ! -f "$dest" ]; then
        cp "$src" "$dest"
        echo "✓ Created latex/sections/$filename"
    else
        echo "  Skipped latex/sections/$filename (already exists)"
    fi
done

# ── ref.bib ───────────────────────────────────────────────────────────────────
if [ ! -f "$LATEX_DIR/ref.bib" ]; then
    cat > "$LATEX_DIR/ref.bib" << 'EOF'
% Bibliography file
% Add references here in BibTeX format
EOF
    echo "✓ Created latex/ref.bib"
else
    echo "  Skipped latex/ref.bib (already exists)"
fi

# ── Patch AGENTS.md with LaTeX sync rule ─────────────────────────────────────
AGENTS_FILE="$TARGET/AGENTS.md"
LATEX_RULE="## LaTeX Paper Sync

A LaTeX paper exists at \`latex/\`. All bi-directional sync rules also apply to the LaTeX paper:

- Any methodological change in code → update \`paper.md\` AND sync to \`latex/sections/\`
- Any edit to \`paper.md\` Method/Result → sync to code AND update \`latex/sections/\`
- Keep \`latex/main.tex\` structure intact; content lives in \`latex/sections/*.tex\`
- Use \`math_commands.tex\` notation for all math (vectors: \`\\va\`, matrices: \`\\mA\`, sets: \`\\sR\`, etc.)"

if [ -f "$AGENTS_FILE" ]; then
    if ! grep -q "LaTeX Paper Sync" "$AGENTS_FILE"; then
        echo "" >> "$AGENTS_FILE"
        echo "$LATEX_RULE" >> "$AGENTS_FILE"
        echo "✓ Added LaTeX sync rule to AGENTS.md"
    else
        echo "  AGENTS.md already contains LaTeX sync rule"
    fi
else
    echo "  Warning: AGENTS.md not found — run init.sh first, or add the LaTeX sync rule manually"
fi

echo ""
echo "Done. LaTeX paper structure is ready at latex/."
echo "Next: fill in latex/main.tex title/author, then sync paper.md content into latex/sections/."
