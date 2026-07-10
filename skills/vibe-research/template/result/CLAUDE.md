# result/ is the shared review interface for human and agent

The user's attention is spent mostly on the figures here; they are also what you use to check yourself.

- Figures are saved as **PDF**, not PNG. Express dynamics with static means (streamline plots, time-colored trajectories); GIFs and other animations are for development self-checks only and never enter the paper.
- Figures live at **fixed paths**, git-tracked, overwritten in place (history is protected by git; no fig_v2_final_new.png).
- **Keep each level small**: the user must be able to scan it at a glance. Organize by experiment topic into semantically named subfolders. The goal: the folder structure and file names alone convey the content, with no need to read code or docs.
- **Completeness of information first**: show raw data and full distributions (scatter, distribution plots), not summary statistics alone.
  Why: compression applied in advance loses what nobody yet knows matters; the value of a figure is exactly that it lets the unexpected be seen.
- **Every figure must be re-plottable directly from stored data** (git-tracked CSV/checkpoints), never forcing recomputation; each formal paper figure corresponds one-to-one with its generating script.
- **Rasterize and look at every figure yourself before delivering it**: check for excessive whitespace, stretched panels, broken font sizes. A figure you have not looked at is not deliverable.
