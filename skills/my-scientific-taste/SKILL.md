---
name: my-scientific-taste
description: The user's personal scientific taste - individual preferences in experiment design, theory exploration, and paper writing. Consult when designing experiments, evaluating research directions or results, or writing and revising papers for this user. The name is a fixed interface - replace the contents with your own taste and keep the name.
---

# My Scientific Taste

This is a personal taste document, not a best-practices manual. It records which side the user takes on questions where competent scientists genuinely disagree. Shared only as a reference: everyone should maintain their own version under this same skill name.

## What belongs here

A preference is included only if **a competent scientist could reasonably choose the opposite**.
If not (e.g., "experiments must be reproducible"), it is a best practice and belongs in the general skills and templates, not here.

Two kinds of thing live here, and it helps to know which is which:
- **Taste** is consequential: it changes what the research *is* or how good it ends up. Reasonable people disagree, and the disagreement matters.
- **Style** is surface: it changes only how the work *looks*, with no effect on the science.

Both are allowed, but taste is the load-bearing part. When in doubt, ask whether choosing the opposite would change the result or only the appearance.

Taste also has layers. The highest layer, choosing the problem, is out of scope here: by the time agents are running, the topic is already set. What this file governs is the taste exercised in the many small decisions *during* execution.

## The top layer, briefly (mostly out of scope)

The best work is won at the top layer, choosing the problem and the core idea, and that is the most visible thing in any paper worth admiring. It is also almost entirely settled by the time agents are running. For the record, the leanings there: sharp, decisive claims over fuzzy increments; ideas that project onto a field's big questions; work living in the gap between a philosophical idea and a method that actually runs. But do not spend attention here. This layer is not where the daily decisions are.

## Restraint is the scarce virtue under cheap agent labor

This is the heart of it, and it is where the daily decisions live.

Agents make every action cheap: one more experiment, one more invented component, one more figure, one more claim. Cheapness is the trap. The reflex "I can do this cheaply, so I will" is exactly backwards. Good taste here is invisible in a finished good paper, because it shows up as everything that is *not* in it; it is glaring in a bad one, where nothing was held back. For any addition, the bar is never "can I?" but **"does it earn its place?"** Everything below is one form of this.

## Every experiment earns its place by adding knowledge

- An experiment belongs only if it **changes what we know**. A run whose outcome you can already predict, that then confirms the obvious, has added nothing, however much work it was.
- Do not run experiments already expected to fail just to have tried them. Do not keep uninformative or negative results in the paper; delete them. Effort spent is not a reason to keep a result.
- The point of an experiment is the knowledge it produces, not its existence. A pile of runs is not thoroughness, and quantity is not rigor. When agents make it easy to run twenty experiments, running twenty is a warning sign, not an achievement.

## Minimize the innovation surface (Occam's razor)

Given the ability to invent, agents invent everywhere. This is backwards.

- **One or two innovations per paper. Everywhere else, actively avoid novelty.** For any component that is not the core contribution, prefer an established prior method over a home-grown one, even at a small cost in performance. Swapping a working invention of my own for a standard method that performs slightly worse is a good trade.
- Three reasons this is discipline, not timidity: it **highlights the core** (novelty everywhere hides the one place that matters); it **de-risks** (a standard method has a body of literature behind it, so a poor run is probably my setup, not the method, while a novel component that fails leaves nothing to lean on); and it **keeps the paper legible** (readers spend their attention on the real contribution).
- When building a non-core piece, the bar is "well-established and defensible", not "new". Reach for the standard tool. If tempted to invent here, flag it and ask.

## Claims never outrun the evidence

- One tight thesis beats many loosely-connected claims. Resist sprawl: a paper is not stronger for holding more.
- No framing grander than the results support. State exactly what was shown, and no more. Reaching rhetoric is the tell of work that is unsure of its own contribution.

## Taste in paper writing

- **Nothing more, nothing less**: every piece of logic (narrative or mathematical) serves the paper's core intent; trim side details; mathematical content serves only what follows and necessary rigor, without erudition for its own sake.
- **One continuous stream**: write in the logic the author finds most natural; derivations flow without detours, and the reader glides downstream.
- **Introduction and Discussion carry the most taste**: they hold the narrative and the positioning, where the author's judgment runs deepest.
- No em-dashes, in any language.
- No self-coined slogan terms.
- (To be expanded by the user.)

## Taste in code

- Configuration is module-level constants, not config dataclasses. Resist making everything a tunable argument: many things cannot be described by a parameter in advance, and how parts compose should be left to the site of use.
- (To be expanded by the user.)

## How to apply

- Taste provides default leanings; **final judgment always belongs to the user**.
- When taste conflicts with the situation at hand, raise it for discussion instead of applying it mechanically.
- When the user expresses a new preference that meets the inclusion bar, propose adding it to this document.
