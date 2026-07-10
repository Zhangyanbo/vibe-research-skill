# Vibe Research

**Version 2.0.5 beta** · [中文版](README.zh.md)

A set of [Claude Code](https://claude.com/claude-code) skills for doing scientific research with AI agents.

It is built on one premise: **working with capable AI agents is a management problem, not a tooling problem.** Once agents can run experiments, write code, and draft papers, the bottleneck moves to the human side: how do you direct, review, and correct a talented team whose goals are not exactly yours and who knows more about what it just did than you do? Management science has thought about that problem for a century. This framework applies its answers to the one-person AI lab.

## The philosophy

**State intent, not instructions.** Delegate the way good commanders do: say *why*, what *done* looks like, and what must *not* be sacrificed, then let the agent choose the means. Every rule in this framework ships with its reason, and agents are told: when the letter of a rule conflicts with its reason, challenge the rule instead of obeying it blindly. A rule followed without its reason produces absurd results, like perfectly restructuring a checkpoint folder nobody will ever read.

**Figures are the interface.** Statistics are compression applied *before* you know what matters, so they silently discard the surprises. Every experiment must end in figures: full distributions, not summary numbers. Figures are also the one information channel that is not filtered through the agent's own report of its work: they separate *how it went* from *how the agent says it went*. The human judges by looking; that judgment is deliberately never automated, because any fixed metric handed to an optimizer stops measuring what you meant (Goodhart's law).

**Decide by recovery cost, not by git.** Agents get full autonomy where mistakes are cheap to undo: scratch space, small experiments, exploration branches. They must ask first where recovery is expensive, and *expensive* is measured in human terms, not repository terms. Rewriting a paper's narrative is irreversible even though git can revert it, because once the author has read and absorbed a version, their mind does not roll back.

**Organize by what the human reads.** Directories the human reads are kept small and scannable; directories they never read (checkpoints, caches) have no tidiness rules at all. Every simplicity constraint in this framework is conditioned on a reader actually existing.

**Constraints are discovered, not designed.** You do not know what you don't want the agent to do until you watch it do it. So the framework does not pretend to a complete rulebook; instead it makes capture cheap: every correction becomes a rule (rule + reason + scope) in the project's own CLAUDE.md files, which grow like scar tissue. Skills hold what generalizes across projects; CLAUDE.md holds what this project learned the hard way. And recorded dead ends demand humility: distinguish *fundamentally wrong* from *not explored enough*, because today's dead end sometimes opens later.

**Artifacts are not dialogue.** The paper, the code, and the figures address readers who never saw your conversation with the agent. So the agent must never answer the user inside the artifact ("we did B but not A"), and never argue with deleted versions. Explanations belong in the conversation, at any length; the artifact reads as if written in one pass.

**Judgment stays human.** What never gets delegated: defining the research question, judging quality by eye, choosing when to pivot or abandon, and taste. Everything that can be proceduralized, verified cheaply, and recovered cheaply gets delegated. What remains is the researcher's job, and it does not shrink to zero.

## The skills

| Skill | What it does |
|-------|--------------|
| [`vibe-research`](skills/vibe-research/) | The core: project setup and migration, which skill to use when, merge acceptance. Ships the project template (a CLAUDE.md per directory). |
| [`explore`](skills/explore/) | The exploration loop: branch, small fast experiments, figures at every step, honest reporting, direction decided by the human. |
| [`vibe-optimize`](skills/vibe-optimize/) | Large-scale parameter search (Bayesian / evolutionary), with anti-metric-gaming safeguards: human-scored figures, mechanism-not-just-score reporting, strict isolation of sweeps from formal results. |
| [`elegant-coding`](skills/elegant-coding/) | Research-code best practices: direct implementations, fail-fast, strict size limits, experiment/plotting separation. |
| [`paper-writing`](skills/paper-writing/) | Paper standards and workflows: a bilingual arXiv LaTeX template, prose discipline, no meta-writing, verified citations, compile-before-report. |
| [`my-scientific-taste`](skills/my-scientific-taste/) | A placeholder with a fixed name. Personal taste — the calls on which competent scientists disagree — lives here. Replace the contents with your own; the other skills consult it by name. |

Plotting style lives in a separate skill, [nature-style](https://github.com/Zhangyanbo/nature-style-skill).

The three layers, in one line: **what is true for everyone goes in skills; what is true for you goes in `my-scientific-taste`; what is true for this project goes in the project's CLAUDE.md.**

## Install

Paste this to your agent (Claude Code or any coding agent):

> Install the Vibe Research skills: clone https://github.com/Zhangyanbo/vibe-research-skill and copy every folder under `skills/` into my skills directory (for Claude Code, `~/.claude/skills/`). If older versions of these skills are already installed, replace them — but if I already have my own `my-scientific-taste`, keep mine. Tell me what you installed.

Then say something like *"init a vibe research project about ..."*. The agent will ask for your research question, your reading language for the paper, and where your existing code lives, then scaffold the project.

Before using it for real, open `skills/my-scientific-taste/SKILL.md` and replace its contents with your own taste. That file is meant to be yours.

## License

MIT
