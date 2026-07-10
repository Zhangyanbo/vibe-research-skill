---
name: my-scientific-taste
description: My personal scientific taste - my preferences in experiment design, in whether to invent or reuse a method, in what results deserve to exist, and in how a paper reads. Consult when designing or pruning experiments, deciding between a novel and a standard method, judging whether a result belongs, or writing and revising my papers.
---

# My Scientific Taste

These are my calls, the ones where competent scientists genuinely disagree. They are my defaults; the final judgment in the moment is always mine.

## Simplicity, and Occam's razor

I like work that is simple and that lives in the gap between philosophy and engineering: a conceptual idea and a method that actually runs, both kept alive at once. Occam's razor is central to how I work. Given two ways to do something, I want the one with fewer moving parts, even when the fancier one scores a little better.

## One or two innovations per paper; standard methods everywhere else

A paper should carry one or two innovations, no more. Everywhere outside the core contribution, I actively avoid novelty: for any non-core component I prefer an established prior method over a home-grown one, even at a small cost in performance. I will spend a whole day replacing a working method I invented with a standard one that performs slightly worse, and consider it time well spent.

Three reasons this is discipline, not timidity:
- It **highlights the core.** Novelty scattered everywhere hides the one place that actually matters.
- It **de-risks.** A standard method has a body of literature behind it. If my run tunes poorly, that is probably my setup, not the method; a novel component that fails leaves me nothing to lean on.
- It **keeps the paper legible.** Readers spend their attention on the real contribution.

So for a non-core piece the bar is "well-established and defensible", not "new". Reach for the standard tool. When tempted to invent here, flag it and ask me.

## An experiment earns its place only by adding knowledge

Agents make experiments nearly free, and that is a trap. I do not want a pile of runs; I want the ones that change what we know.

- If I can predict the outcome and the run just confirms the obvious, it has added nothing, however much work it was. Do not run it to have tried it.
- Do not keep uninformative or negative results in the paper. Delete them. Effort already spent is not a reason to keep a result.
- Quantity of experiments is not thoroughness, and it is not rigor. When it becomes easy to run twenty experiments, running twenty is a warning sign, not an achievement. Restraint is the thing to protect here.

## Claims never outrun the evidence

One tight thesis beats many loosely connected claims; a paper is not stronger for holding more. I do not want framing grander than the results support. State exactly what was shown and no more. Reaching rhetoric is the tell of work that is unsure of its own contribution.

## How my papers should read

- **Nothing more, nothing less.** Every piece of logic, narrative or mathematical, serves the paper's core intent. Trim the side details. Math serves what follows and the necessary rigor, never erudition for its own sake.
- **One continuous stream.** Write in the logic I find most natural; derivations flow without detours and the reader glides downstream.
- **The Introduction and the Discussion carry the most of me.** They hold the narrative and the positioning, where my judgment runs deepest.
- No em-dashes, in any language.
- No self-coined slogan terms for the core mechanism; use the standard name.

## How my code should read

- Configuration is module-level constants, not a config dataclass. I resist turning everything into a tunable argument: many things cannot be described by a parameter in advance, and how the parts compose should be decided at the site of use, not fixed ahead of time.
