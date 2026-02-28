# LaTeX Paper Reference

## Initialization

Run when user requests a LaTeX/arXiv paper:

```bash
bash ~/.cursor/skills/vibe-research/scripts/init_latex.sh
```

Creates `latex/`, copies `math_commands.tex` and `arxiv.sty`, stubs out section files, and patches the LaTeX sync rule into `AGENTS.md`.

## Directory Structure

```
latex/
├── main.tex
├── math_commands.tex
├── arxiv.sty
└── sections/
    ├── abstract.tex
    ├── introduction.tex
    ├── method.tex
    └── result.tex
```

After init, sync the current `paper.md` content into the corresponding `latex/sections/*.tex` files.

## math_commands.tex Shorthands

Always use these — never define equivalent macros inline.

| Category | Examples |
|----------|---------|
| Vectors | `\va`, `\vb`, ..., `\vz` |
| Matrices | `\mA`, `\mB`, ..., `\mZ` |
| Tensors | `\tA`, `\tB`, ... |
| Sets | `\sR` (reals), `\sN` (naturals), ... |
| Operators | `\E` (expectation), `\KL` (KL divergence), `\argmax`, `\argmin` |

## Sync Rule

Any time `paper.md` is updated (triggered by bi-directional sync), also update `latex/sections/*.tex` to match. Section mapping:

| paper.md section | latex file |
|-----------------|------------|
| Abstract | `sections/abstract.tex` |
| Introduction | `sections/introduction.tex` |
| Method | `sections/method.tex` |
| Result | `sections/result.tex` |
