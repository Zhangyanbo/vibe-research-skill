---
name: paper-writing
description: Academic paper writing workflows and standards - arXiv LaTeX template, bilingual paper management, prose discipline, citations, compilation and delivery. Use when creating, writing, or revising an academic paper in a research project, setting up a paper's LaTeX structure, syncing bilingual versions, or checking paper-code consistency.
---

# Paper Writing

Writing standards and workflows for academic papers: template, bilingual sync, prose discipline, citations, compilation and delivery. Personal style preferences do not live here (that is taste, and it differs by person); final judgment on wording always belongs to the user.

## Paper template

This skill ships with [template/](template/): a bilingual arXiv-style LaTeX skeleton. Copy it when starting a paper, then fill in the title and authors.

- `main.tex` (English, pdflatex + arxiv.sty) and `main.zh.tex` (Chinese, xelatex + ctexart). The Chinese version does not load arxiv.sty, to avoid CJK conflicts; its page geometry is replicated manually, and Chinese cross-reference macros (`\eqref` → 式, `\secref` → 第 X 节) are predefined.
- Body text is split by section under `sections/` and `sections_zh/`, one-to-one.
- `Makefile`: `make en` / `make zh` / `make all` / `make clean`.
- `math_commands.tex` (math macros), `arxiv.sty`, `bibstyle.bst`, and `.gitignore` are included.
- If the user's reading language is not Chinese, replace `sections_zh/` and `main.zh.tex` with that language.

## Language policy (bilingual sync)

- The English version is always authoritative. The other version is in the user's reading language and serves the user's own thinking.
- Default workflow: locate and edit in the English version first → mirror the change into the user-language version → recompile both PDFs and verify before reporting done.
- **Exception: wherever the user has edited by hand, the user's edit is the ground truth.** Learn the conventions the user established from the diff, apply them consistently across the text, and propagate substantive differences back into English. Purely stylistic adjustments (phrasing reshaped to read naturally in the user's language) need not flow back. If a terminology choice is ambiguous, ask once, then apply globally.
- The user-language version must read as native academic prose (for Chinese: idiomatic academic Chinese). Translate concepts, not words; restructure whole sentences when needed. Do not over-literize either: no classical vocabulary, no stacked four-character idioms, no personification. This version exists so the user can judge the quality of the English through their native language.
- The two versions correspond section by section, file by file. Never add or remove a section on one side only; a factual clause present in one language and missing in the other is an error.

## Universal writing standards

- **Linear logic**: the reader must never need to flip back (discussing A at the start when A is only defined much later). But do not fix this by front-loading all definitions either.
- **Continuous prose**: the body advances in paragraphs with real logical transitions. No bullet points and no disguised lists (bold lead-in phrases carving up an argument count, `\paragraph{}` headers included); `\subsection` only for genuinely independent technical blocks. Introductions and discussions are built from full connected paragraphs.
- **Rigor is never sacrificed**; content that would confuse the reader or is too fiddly goes to the Appendix.
- **No meta-writing**: no trailers ("we will show that...", "the purpose of this section is..."), no self-appraisal ("the cleanest formulation is...", "more importantly..."), no section-tour narration as a pacing device (a minimal parenthetical cross-reference is fine).
- **Never transcribe the user's motivations into the text**: when the user explains why they want a change, that is context for you, not content for the paper. Writing requirements constrain how to write, never what the text says.
- **Do not argue with baselines that never appear in the paper**: state the method used directly, without rebutting concepts the paper never introduced.
- **No revision scars**: no paste marks, no arguing with a previous version. Every version reads as if written in one pass.
- **Claims never outrun the evidence**: state what the results support and no more; no philosophical overreach (the results may support "the appearance of X is a product of Y", not "X is Y").
- **Decouple the text from experiment rounds**: experiments keep being replaced by stronger versions, so the body never bakes in one round's specifics (blur levels, collapse behavior, ablation numbers, hardware cost). Concrete hyperparameter values go to the appendix; the body uses symbols and points there. The body keeps qualitative conclusions plus the few numbers that directly support the core claims.
- **Terminology and notation are consistent**: one concept, one term; symbols are never reused. Use the math macros defined in `math_commands.tex` throughout; render formulas in math mode when discussing them with the user, not in code blocks. The project-specific glossary lives in the project's `paper/CLAUDE.md`.

## Typography details

- In Chinese `.tex` files, use `` `` ... '' `` for double quotes; never straight quotes (`"..."`).
- En-dashes (`--`) for numeric ranges and compound names (`0.004--0.008`, `Hertzsprung--Russell`) are not em-dashes and should be kept. Empty table cells read `n/a` in English and 「不适用」 in Chinese, not `---`.
- All paper figures live together under `figures/`, and every one must be generated by git-tracked formal experiment code, never by a throwaway script.

## Citations

- Verify citations online against the original paper, its DOI record, arXiv page, or the publisher's page. **Never judge from memory** whether a reference exists or whether its title, authors, or venue are correct. If a source cannot be accessed, say so explicitly instead of guessing.

## Compilation and delivery

- After multi-part edits, clean the cache and compile multiple rounds so cross-references resolve; check that the bibliography style produces no "author undefined"-type warnings.
- When only figures changed (no `.tex` edits), `make` may see no timestamp change: run `touch main.tex main.zh.tex` first, then compile.
- Before reporting done: every PDF must compile successfully, and spot-check the rendering of figures and citations. Never report done on a failed build.
- When exporting to other formats (e.g., a .docx for reviewers), **never modify the paper's source files for the sake of the export**; fix the conversion pipeline, not `main.tex`. Known converter issues and their fixes are recorded in the project.

## Consistency-audit severity bar

When auditing the paper against code and data, report **factual mismatches**: numbers contradicting experimental results, text contradicting figures, data not supporting a claimed ranking or pipeline, wrong technical terms, a factual clause present in one language but missing in the other. Loose wording that does not contradict the facts (approximate location descriptions, unequal data granularity) is not a violation.

## Boundaries on revisions

Narrative-level changes (section structure, the logical order of the core argument, reformulating the method) need the user's confirmation first; this applies doubly to the Introduction and the Discussion. Sentence- and paragraph-level local improvements can proceed autonomously. See the project's `paper/CLAUDE.md`.

## Other workflows

Citation management, math notation, and reviewer-response tasks carry over from the existing vibe-paper-writing tasks/ (to be merged into this skill's tasks/ directory).
