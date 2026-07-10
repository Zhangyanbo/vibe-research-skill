---
name: elegant-coding
description: Best practices for writing elegant, readable research code - direct implementations, locality of behavior, fail-fast, strict size limits, clean separation of experiment and plotting code. Use whenever writing or refactoring code in a research project, creating new experiment scripts, or organizing a source tree.
---

# Elegant Coding

Best practices for research code: readability over abstraction. Every constraint here shares one premise: **the user reads all of this code**. None of it applies to directories the user never reads (such as `data/` and `tmp/`).

## Base style

- **KISS + YAGNI**: write the most direct implementation; no generic utilities, no future-proofing.
- **Locality of Behavior**: keep related logic together. A 60-line function that clearly mirrors a formula's steps beats a 10-file inheritance chain.
- **Fail-fast**: assert dimensions, check for NaN, crash immediately on bad data. A crash is useful debugging information. No defensive code: no meaningless try/except or if/else fallbacks.
- All code comments in English.

## Structure

- The top level of `src/` holds experiment entry scripts only; reusable components go into semantically named packages.
- **Experiments within a project follow one uniform structure** (entry script → training/compute module → results directory → plotting module): the first experiment that takes shape is the model for all later ones. No freelancing.
- **Keep experiment code and plotting code separate**: the experiment computes and writes its data to disk; plotting is a separate script that reads that data. Changing a figure then never requires re-running the experiment, and the data behind every figure is guaranteed to exist on disk. Entry scripts carry no `--replot`-style switches. Careful: do not git-track very large output files.
- **Keep a clean boundary between evaluation code and the system it evaluates**: a scorer must never be imported by the thing it scores. When judge and judged are entangled, the evaluation cannot be trusted.

## Reproducibility pitfalls

- A fixed random seed does not mean reproducible: on CUDA, `torch.manual_seed` alone is not enough; explicit determinism settings (cudnn deterministic, etc.) are required. Measured fact: the same seed can diverge by ten orders of magnitude within a few hundred steps.

## Size limits (so the user can read a file in one sitting and scan a folder at a glance)

- Keep each file to ~200 lines or fewer; split or abstract beyond that.
  Exception: files that purely enumerate similar items (parameter tables, formula lists) have no limit.
- Keep each folder to ~7 code files or fewer; beyond that, create semantically named subfolders as a Python package.
  The intent of this rule is scannability, not the number itself. It does not apply to folders the user never reads.
