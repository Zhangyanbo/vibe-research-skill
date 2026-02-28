# Migrating an Existing Project to Vibe Research

Use this workflow when the user asks to convert an existing project into a Vibe Research-compatible structure.

---

## Step 1 – Understand the Project

Before touching any files, ensure you understand:

- **Experiment flow**: how experiments are triggered and what they produce
- **Experiment goal**: the research question or objective
- **Result locations**: where outputs (metrics, plots, model checkpoints, CSVs, etc.) currently live

If the user has not explained these clearly, **ask first**. Do not guess. Typical questions:

- "How do you run an experiment? (e.g., which script, which command?)"
- "What does the experiment output and where does it go?"
- "Is there a main result you're trying to track across runs?"

---

## Step 2 – Run the Init Script

Run the standard init script in the project root (idempotent — safe to run on existing directories):

```bash
bash ~/.cursor/skills/vibe-research/scripts/init.sh
```

This creates any missing folders and files (`src/`, `results/`, `paper.md`, `README.md`, `documents.md`, etc.) without overwriting existing ones.

See [init.md](init.md) for what gets created.

---

## Step 3 – Migrate Code and Results

### 3a. Move source code → `src/`

Move existing source files into `src/`. Use judgment:

- Scripts that define models, algorithms, or data pipelines → `src/`
- Top-level runner / entry-point scripts → keep at root OR move to `src/` and note in `README.md`
- Config files, notebooks — ask the user if you're unsure

### 3b. Move existing results → `results/`

Move existing result artifacts (plots, CSVs, metric files, model checkpoints) into `results/`. Preserve subdirectory structure if present.

---

## Step 4 – Update Code Paths

After moving files, audit every path reference in the codebase and update accordingly:

- Hardcoded paths to old result locations → `results/...`
- Relative imports or file reads that assumed the old layout → fix to match new layout
- Any CI scripts, Makefiles, or shell scripts that reference moved files → update those too

Do a quick search for stale paths before declaring done:

```bash
# example — adapt the old path to what you actually moved
rg "old_result_dir" --type py
```

---

## Step 5 – Smoke Test

**Goal**: verify the code runs without errors and does not corrupt existing data.

### Rules

- Estimate runtime before running. **Do not run anything expected to take > 10 minutes.**
- **Never modify or overwrite existing result files or datasets.**
- Temporary output files are allowed — delete them after the test passes.
- If there is any risk of overwriting data, back up the relevant files first; restore and delete the backup once the test passes.

### Suggested approach

1. Read the entry-point script and trace the execution path.
2. Run with a minimal/dry-run configuration if one exists (e.g., `--dry-run`, `--debug`, a tiny synthetic dataset, or a single iteration).
3. Confirm the script exits cleanly.
4. Delete any temporary files created during the test.

---

## Step 6 – Write `documents.md`

`documents.md` is for developers and collaborators (including future agents). Populate it based on what you learned while reading and migrating the code.

Include (anything with >50% chance of future usefulness):

- How to run experiments (commands, flags)
- What each result artifact means
- Non-obvious data formats or preprocessing steps
- Environment requirements or gotchas
- Decisions made during migration (e.g., why a file stayed at root)

See [formats.md](formats.md) for the full `documents.md` policy.

Sync is one-way: **code → `documents.md`**. Never change code based on this file.

---

## Step 7 – Populate `paper.md` and `README.md`

Based on your understanding from Step 1 and your code reading:

- Fill in `paper.md` (Abstract, Introduction, Method, Result) at the level of detail currently available. Leave sections as stubs if there are no results yet.
- Fill in `README.md` with the correct commands to reproduce experiments, reflecting the new `src/` layout.

---

## Post-Migration Checklist

```
- [ ] Init script run; standard folders present
- [ ] Source code in src/
- [ ] Existing results in results/
- [ ] All path references in code updated
- [ ] Smoke test passed (no errors, no data modified, temp files deleted)
- [ ] documents.md populated
- [ ] paper.md and README.md reflect current state
```
