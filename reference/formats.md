# Vibe Research: Format Templates

## paper.md

Exactly four sections, academic style, no implementation details:

```markdown
# [Title]

## Abstract
[One paragraph: problem, method, key results.]

## Introduction
[Background, motivation, research question. Academic tone.]

## Method
[Mathematical principles and algorithmic frameworks ONLY.
NO class names, function calls, or file paths.
Include concrete formulas. Detail level matches an academic paper.]

## Result
[Results with embedded images and tables.
Images must be embedded inline (not just linked).
Tables in standard Markdown. Include analysis.]
```

## Research Log

**Path**: `research_log/YYYYMMDD_HH-MM.md` (e.g., `research_log/20260227_14-30.md`)

```markdown
# [YYYY-MM-DD HH:MM] Session Report

## Objective
[What this session aimed to accomplish]

## Changes
[Differential: what changed vs. previous state, and why]

## Results
[Outcomes, metrics, observations. Embed images inline.]

![description](img/imagename_YYYY-MM-DD-H_M_S.ext)
```

**Images**: Before embedding, copy to `research_log/img/` and rename:
`[original_name]_[YYYY-MM-DD-H_M_S].[ext]`

## documents.md

For developers, collaborators, and future agents. Add anything with >50% chance of future usefulness:
- Architecture decisions and trade-offs
- Non-obvious data formats or structures
- Gotchas encountered during experiments
- Environment setup specifics
- What worked / what failed (to avoid repeating mistakes)

Sync direction is ONE-WAY: code drives this file. Never modify code based on `documents.md`.
