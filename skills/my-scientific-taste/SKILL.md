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

## Taste in exploration and experiment design

- **Pursue sharp theory**: prefer theories and experiments that yield crisp, decisive claims over fuzzy incremental improvements.
- **Pursue impact and projection onto big questions**: judge a direction or result by the shadow it casts on the field's big problems; the value of a local result is what it says about the larger picture.
- **Roam between philosophy and engineering**: the work I like sits in the gap between a conceptual idea and a concrete method that runs. Favor the version that keeps both alive at once.
- **Prefer a one-sentence, principled core**: when there is a choice, favor the method whose essence states in one clean sentence and rests on something principled (a theorem, a physical law, a clear conceptual claim), over one that merely works. Elegance is a design criterion, not decoration. Touchstones: intelligence as one thermodynamic drive (Causal Entropic Forces), generation as electrostatics (Poisson Flow), a network's weights as learnable functions grounded in a representation theorem (KAN).

## Minimize the innovation surface (Occam's razor)

This is one of the most important calls, and agents get it backwards by default: given the ability to invent, they invent everywhere.

- **One or two innovations per paper. Everywhere else, actively avoid novelty.** For any component that is not the core contribution, prefer an established prior method over a home-grown one, even at a small cost in performance. It is worth swapping out a working invention of my own for a standard method that performs slightly worse.
- Three reasons this is right, not timid: it **highlights the core** (novelty everywhere hides the one place that matters); it **de-risks** (a standard method comes with a body of literature behind it, so if a run tunes poorly that is likely my setup, not the method, whereas a novel component that fails poorly leaves nothing to lean on); and it **keeps the paper legible** (readers spend their attention on the real contribution).
- So when building a non-core piece, the bar is "well-established and defensible", not "new". Reach for the standard tool. If tempted to invent here, flag it and ask.

## Experiments earn their place by adding knowledge

Agents make experiments nearly free, which is a trap: cheap experiments invite a pile of results that teach nothing.

- An experiment belongs in the work only if it **changes what we know**. A run whose outcome you can already predict, that then confirms the obvious, has added nothing, no matter that it "was work".
- Do not run experiments already expected to fail just to have tried them; do not keep uninformative results in the paper. Delete them. Effort spent is not a reason to keep a result.
- The point of an experiment is the knowledge it produces, not its existence. Quantity of experiments is not evidence of thoroughness.

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
