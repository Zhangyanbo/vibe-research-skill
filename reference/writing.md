# LaTeX Writing Reference

## Content Filtering: What Belongs in the Paper

When the user provides external material — AI chat logs, email threads, or personal notes — not everything in that material should enter the paper. Apply the following filter before writing anything:

**Chat logs with AI**: Only include points that the *user* explicitly affirmed. If the AI proposed an idea and the user did not respond to it, dismiss it, or simply moved on, do not treat it as accepted. A point counts as accepted when the user says something like "yes, exactly", "let's add that", "that's right", or when the user's follow-up prompt clearly builds on it. AI-generated elaborations that the user never acknowledged are not canon.

**Email threads**: Only include content that represents the user's own position or conclusions. Counterarguments raised by collaborators belong in the paper only if the user explicitly asks to address them.

**Personal notes**: Treat these as a prompt to extract intent, not as draft text. Notes are often incomplete or exploratory; confirm with the user which claims are ready to be committed to in writing.

When in doubt, flag the ambiguous content and ask the user whether it should be included rather than making the call yourself.

---

## Writing Into the Paper

### Never copy-paste

All source material — regardless of origin — must be rewritten from scratch in academic prose. The paper is not a collation of inputs; it is a coherent argument. Even a sentence from the user's own notes must be reshaped to fit the surrounding text.

### Read the full paper first

Before inserting any new content, read the entire paper to understand its current structure, argument flow, and terminology. Then decide where the new content belongs. Ask:

- Does this information belong in the Introduction, Method, or Result?
- Does it complement something already written, or does it stand alone?
- Is this claim made elsewhere — and if so, should it be consolidated or echoed?

### Anticipate where content should recur

A single piece of information may need to appear in more than one place. For example:
- A key design decision introduced in the Introduction may need to be restated at the start of the Method section before elaboration.
- A numerical result mentioned in the abstract must be consistent with the full Result section.
- A limitation acknowledged in the Introduction may reappear (with more depth) in Results or a designated limitations paragraph.

Place each occurrence deliberately, and ensure consistency across all instances.

---

## Academic Style

Write in a formal, third-person academic register throughout. Sentences should be precise and complete. Avoid informal phrasing, hedging language ("maybe", "I think"), and conversational connectors.

**Bullet points**: Do not use them unless the user explicitly requests it. Academic prose conveys the same information more fluidly and with clearer logical connectives.

**Subsections**: Use sparingly. Before adding a `\subsection`, ask whether the content truly represents a distinct conceptual unit or whether it can be absorbed into the surrounding prose with a topic sentence. Excessive subsections fragment the argument and make the paper feel like a list.

**Equations and notation**: Use the shorthands defined in `math_commands.tex`. Never redefine a macro that already exists there. Introduce every symbol in prose before or immediately after it appears in an equation.

---

## Role Boundaries

**Do not express opinions on behalf of the user.** Your role is to articulate what the user has decided or observed, not to editorialize. Phrases like "This suggests that…" or "Interestingly, …" should only appear if the user has explicitly said they want to draw that inference.

**Do not write the Discussion section unsolicited.** Discussion requires the researcher's own interpretation of results and their broader significance. Only write Discussion content when the user provides specific ideas they want discussed. If the user shares a result and says nothing about how to interpret it, do not automatically draft a Discussion paragraph — ask what they want to say about it, or leave the section for later.

---

## Compilation Workflow

After every edit to any `.tex` file, compile the PDF:

```bash
cd latex && pdflatex -interaction=nonstopmode main.tex
```

Run twice if there are cross-references or a bibliography. If compilation fails:

1. Read the error output carefully — LaTeX errors usually include the line number and a description.
2. Fix the error in the source file. Common issues: undefined commands, unclosed environments, missing `\end{...}`, mismatched braces.
3. Recompile and verify the PDF is generated successfully.

Do not leave a broken compile state for the user to discover. If you cannot resolve a LaTeX error, explain what the error is and what you have tried before asking for help.
