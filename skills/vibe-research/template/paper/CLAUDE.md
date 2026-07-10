# Paper

The final deliverable. The user reads it closely, repeatedly, and edits it by hand: this is the territory of the user's taste.
Writing standards and workflow follow the `vibe-research-paper` skill; style preferences follow `my-scientific-taste` (see the division-of-labor table in the root CLAUDE.md).
Technical details (how to compile, file layout) live in the [README](README.md), which may be updated dynamically.

# Changes that need confirmation first

- **Narrative-level changes require the user's confirmation before touching anything**: section structure, the logical order of the core argument, reformulating the method. **This applies doubly to the Introduction and the Discussion**, which carry the paper's narrative and positioning and are where taste weighs most.
  Why: after a major rewrite, git can roll back the files, but once the user has read and absorbed a version, they almost never actually roll back.
- Sentence- and paragraph-level local improvements can proceed autonomously.

# Language policy (instantiate from the user's answers at project init)

- The English version is always authoritative.
- A second version is maintained in the user's reading language: __________ (ask at initialization; it serves the user's own thinking).
- Edits go to English first by default, then sync to the user-language version. Wherever the user edited by hand, that edit is the ground truth: propagate it, in both directions as needed.

## Project-specific rules and lessons

(Accumulates as the project runs; add entries as "rule + reason + scope".)
