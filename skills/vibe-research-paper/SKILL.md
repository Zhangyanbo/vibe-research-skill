---
name: vibe-research-paper
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
- **No meta-writing**: the text talks about its subject, never about itself. No trailers ("we will show that...", "the purpose of this section is..."), no self-appraisal ("the cleanest formulation is...", "more importantly..."), no commentary on its own wording or emphasis ("to be precise...", "it is worth stressing..."), no section-tour narration as a pacing device (a minimal parenthetical cross-reference is fine).
- **Let the writing carry the thesis, the stance, and the direction**: unless the user explicitly asks for it, never state outright what the paper's core idea is, what attitude it takes, or where the text goes next ("the central insight of this work is...", "we take the view that...", "next we turn to..."). Show them through the writing itself: what comes first, what gets developed at length, which examples are chosen, how one paragraph leads into the next. An announced thesis is a claim about the paper that the reader must take on trust; a thesis carried by the argument is one the reader sees for themselves.
- **The paper is not where you answer the user**: tell apart what the user asks of you from what the user wants the paper to say. Questions, explanations of motive, corrections, and writing instructions are addressed to you; answer them in the conversation. Writing requirements constrain how to write, never what the text says. The paper gains content only when the user asks for that content, or when a question exposes a real gap in the text; then the fix is a change to the text about the subject that makes the question never arise, not a paragraph that answers the user. If the user asks "why not method B here?", the answer goes in the conversation; the paper does not gain "one might ask why B is not used". When unsure whether something is meant for the paper, ask.
- **No shadow-boxing**: never criticize a view that nobody has put forward, and when stating A, do not bring up not-A without cause. "X is not a heuristic but a principled...", "rather than merely fitting the data, our model...", "unlike approaches that ignore Y": if no one holds the contrasted view, the sentence invents an opponent and leaves the reader wondering who said that. State A directly. A contrast earns its place only when the opposing view is real (cited, or the paper's own baseline introduced earlier) and the comparison carries information.
- **Defuse an anticipated criticism by removing its trigger, not by adding text**: readers do not process a paper with detachment — they read a fraction, judge instinctively whether it is interesting or suspect, and then attack, fairly or not. A preemptive defensive paragraph never works: the attacking reader does not read it, and it becomes a new surface to attack. Instead rewrite the claim, the framing, or the experiment so the criticism has nothing to grip. This is distinct from limitations: a real weakness is fixed in the work or stated plainly once, never argued against in advance.
- **No revision scars**: an edited passage reads as if the previous version never existed. No paste marks, no arguing with or correcting a previous version, no wording that only makes sense against what used to be there ("in fact", "more precisely", "rather than" aimed at an old claim the reader never saw). The commonest source is a user correction: told that the text wrongly implies X, rewrite it to state Y, not "not X but Y". Every version reads as if written in one pass.
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
