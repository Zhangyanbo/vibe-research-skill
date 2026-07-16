---
name: vibe-research-explore
description: Run exploratory research loops - branch, run small fast experiments, produce figures, report findings honestly, let the user judge direction. Use when exploring a new idea or hypothesis, testing whether an approach works, running quick experiments in a research project, or whenever the user asks to "try" something experimental.
---

# Explore

The workflow for exploratory experiments: the user gives the direction and the boundaries; explore quickly within them.

## Confirm three things before starting

- **Purpose**: why explore this? Ask if unclear; do not invent a purpose.
- **What counts as a result**: what figure or evidence would answer the question.
- **Boundaries**: time and compute budget; what must not be touched.

## The exploration loop

1. **Branch first.** Exploration happens on a branch, autonomously and in small steps: run the smallest experiment first, scale up once it works. No need to ask permission at every step.
2. **Every step produces figures** into `result/`. Reporting only statistics does not count as done: plot full distributions, not just means.
3. **Look at your own figures before reporting.** Does the result make sense? Anything unexpected? Surprises are often more valuable than the expected result; point them out to the user explicitly.
4. **When the plan stops making sense, say so.** If what the figures show contradicts the agreed plan partway through, pause and propose an adjustment — do not finish the plan mechanically, and do not silently switch to a different plan either.
5. **Report**: what changed, where the outputs are, what the figures show. Describe failed attempts too; deliver bad news plainly. A clear "this approach does not work, and here is the figure that shows it" is a complete result of exploration, not a failure to produce one.
6. **Direction is the user's call.** Continue, pivot, or abandon is decided by the user, from the figures. Put everything needed for that judgment into the figures.

## After a performance push, subtract

Piling on tricks and new parts to chase performance is a legitimate exploration move. But the moment the gain lands, the next step is subtraction, not more addition:

- **Test what can be removed.** Additions accumulate, yet usually only one of them carries the effect. Strip them back one at a time and delete everything that does not, as much as will go.
- **Charge complexity as a cost.** Performance bought with complexity is not free: weigh the remaining gain against the machinery it needs, and say so in the report. A small win that requires heavy machinery is usually not worth keeping.

The version worth reporting is the stripped-down one, with the performance–complexity trade-off stated.

## Pace and runtime discipline

- **Facts that can be read directly from the code** (tensor shapes, receptive fields) are not measured by experiment. Save experiments for what cannot be known statically, such as training dynamics.
- Default rhythm: **small experiments that finish within ~10 minutes, with real thinking in between**. Full-scale, multi-seed runs come only at the end, to confirm a conclusion.
- Estimate the runtime before launching. Check on a run every ~5 minutes; **kill it if there is no result after 15 minutes** and reconsider. Underestimating step time is the norm (a single SVD once turned a "quick experiment" into 76 minutes).

## Wrapping up

- Delete abandoned exploration code and files promptly. Most attempts get discarded; that is the normal fate of exploration.
- Rejected approaches may be recorded in the project-specific section of `src/CLAUDE.md`, but record them with great care and deep humility about your own judgment: state exactly why the approach failed or was rejected, and distinguish a **fundamental reason** from **insufficient exploration so far**. Today's dead end may open up later. When unsure, write it as an observation, not a prohibition.
- Results worth keeping go through merge acceptance (see the project root CLAUDE.md for the boundary rules).
