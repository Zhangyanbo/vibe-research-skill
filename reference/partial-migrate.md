# Partial Migration — Incremental Conformance

Use this workflow when a project **already has some** Vibe Research structure but is incomplete, drifted out of sync, or mixed with non-conforming parts. This is more delicate than a full migration — existing work must be preserved.

**Core principle**: Audit first, plan second, act third. Never touch a file without understanding its current state.

---

## Step 1 — Structural Audit

Assess every VR component and classify each:

| Status | Meaning | Action |
|--------|---------|--------|
| **Conforming** | Exists, correct format, in sync | Leave as-is |
| **Stale** | Correct format but out of sync with code | Refresh content |
| **Non-conforming** | Exists but wrong format or location | Restructure (needs user approval) |
| **Missing** | Doesn't exist at all | Create from template |

**Audit checklist** — evaluate each row:

| Component | What to check |
|-----------|---------------|
| `src/` | All source code inside? Scripts at root or in other dirs? |
| `results/` | All result artifacts inside? Outputs scattered elsewhere? |
| `paper.md` | Exists? Four-section format (Abstract/Intro/Method/Result)? Content matches current code? |
| `doc/` | `doc/README.md` present and under 120 lines? Sub-pages reflect current architecture/APIs? |
| `research_log/` | Exists? Entries follow `YYYYMMDD_HH-MM.md` naming? |
| `README.md` | Run commands match current `src/` layout? |
| `AGENTS.md` | Exists? Contains VR rules? |
| `principal.md` | Exists? |
| `.gitignore` | Has VR entries (`paper.[a-z][a-z].md`)? |

**Present the audit as a status table to the user before proceeding.** Example:

```
Partial Migration Audit:
  src/            Conforming — all source code present
  results/        Non-conforming — CSVs also in root and data/
  paper.md        Stale — Method section doesn't reflect refactored pipeline
  doc/            Stale — doc/api.md references deleted functions
  doc/README.md   Conforming
  research_log/   Missing
  README.md       Stale — run command references old path
  AGENTS.md       Missing
  principal.md    Conforming
  .gitignore      Non-conforming — missing VR entries
```

---

## Step 2 — Migration Plan

Generate a concrete plan grouped by risk level. **Get user approval before executing.**

**Safe (no data loss risk):**
- Creating missing directories and files from templates (init script handles this)
- Appending `.gitignore` entries
- Creating missing `doc/` sub-pages

**Moderate (content modification):**
- Refreshing stale `doc/` pages from current code
- Restructuring `paper.md` to four-section format (content preserved, structure changed)
- Updating `README.md` to reflect current layout

**Requires caution (file moves):**
- Moving source files into `src/`
- Moving result artifacts into `results/`
- Updating all path references after moves

---

## Step 3 — Execute Incrementally

Execute in order from safest to riskiest:

1. **Create missing structure** — run init script (idempotent, won't overwrite existing files)
2. **Fix `.gitignore`** — append missing entries (init script does this automatically)
3. **Move misplaced files** — one directory at a time:
   - Use `git mv` in git repos to preserve history
   - Update all path references after each move
   - Verify imports/references resolve correctly before moving the next batch
4. **Refresh stale documents** — re-read current code and update `doc/`, `paper.md`, `README.md`:
   - For `paper.md`: preserve existing prose where still accurate; update only sections that drifted
   - For `doc/`: update sub-pages that reference changed/deleted code; add new sub-pages for undocumented modules
   - For `README.md`: fix run commands and directory descriptions
5. **Restructure non-conforming files** — reformat with user approval per file:
   - If `paper.md` doesn't have four sections: restructure by mapping existing content into the four-section template, show the user a before/after diff
   - If `AGENTS.md` has project-specific rules beyond VR defaults: **merge** rather than replace
6. **Smoke test** — same rules as [full migration Step 5](migrate.md#step-5--smoke-test) (max 10 min, no data corruption, clean up temp files)

---

## Step 4 — Verify Sync State

After all changes, confirm bi-directional sync is intact:

```
- [ ] paper.md Method section matches current code logic
- [ ] doc/ sub-pages reflect current architecture and public APIs
- [ ] README.md run commands work with current file layout
- [ ] No stale path references remain in code (rg for old paths)
- [ ] research_log/ exists with img/ subdirectory
```

---

## Safety Rules

1. **Never overwrite a file with meaningful content** without showing the user what will change. For stale files, show the diff; for non-conforming files, show before/after.
2. **Back up before restructuring** — if reformatting `paper.md` or reorganizing `doc/`, copy the original to `<name>.bak` first. Delete the backup after user confirms.
3. **Use `git mv`** when moving files inside a git repo to preserve history.
4. **One component at a time** — complete and verify each component before moving to the next. Don't batch unrelated moves.
5. **Preserve user customizations** — if `AGENTS.md` or `README.md` has project-specific content, merge VR defaults into the existing file rather than replacing it.
6. **Skip conforming components** — don't touch what's already correct. Unnecessary changes waste time and risk regressions.
