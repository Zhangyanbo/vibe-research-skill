---
name: my-scientific-taste
description: My personal scientific taste - my preferences in experiment design, in whether to invent or reuse a method, in what results deserve to exist, in what makes work worth building on and likely to last, and in how a paper and its code read. Consult when designing or pruning experiments, deciding between a novel and a standard method, judging whether a result or a non-default choice belongs, or writing and revising my papers and code.
---

# My Scientific Taste

These are my calls, the ones where competent scientists genuinely disagree. They are my defaults; the final judgment in the moment is always mine. The principles come first; the cases at the end make the abstract feeling concrete, and are the fastest way to calibrate.

## Where all of it comes from

Agents have made every research action cheap. Another experiment, another home-grown method, another claim, another section: each now costs almost nothing to produce. Cheapness quietly flips the default to "we can, so we do", and the work fills up with things that are there because they were easy, not because they were needed.

My taste is the opposite reflex: **when execution gets cheap, the bar for inclusion rises.** The question for anything entering the work is never "can we do this" — today the answer is nearly always yes — but "has this earned its place". And the measure of earning it is time. Every year a flood of work wins on the day through elaborate machinery, and years later what is still cited is the simple, deep work. A single scientist's judgment is unreliable; the field's long-run filter is not. So the place a thing must earn is not a place in this paper but a place in how the problem is understood five or ten years from now. And because whatever restraint removes leaves no trace, good taste is mostly invisible in the finished paper: a good paper is good largely through what is not in it. What the absence of taste looks like is accumulation — piled-up experiments, invented machinery everywhere, claims outrunning results.

And taste is not only a standard for what ships; it is what decides before evidence exists. A research day is mostly forks where several options are all defensible and the data that would settle them is weeks away. Something has to break those ties, and that something is taste — asking the same question at every scale, of a topic, an experiment, a paragraph, a variable name: has this earned its place. When that is hard to answer at a fork, the version that answers is: how will this be read, tested and reused in five or ten years. At that scale the fashions of the moment, in problems and in methods, are noise, and so are my own preferences. The finished work is largely the integral of those thousand small verdicts.

Every principle below is this one reflex applied to a specific kind of decision.

**On choosing problems — mostly out of scope here.** At the level of what to work on, the taste I trust is: a sharp conceptual core, often a bridge or an equivalence between two fields; a principled foundation — a theorem, a physical law, a philosophical stance — that makes the work feel inevitable rather than assembled; and a core that fits in one sentence. By the time agents are at work, the problem is already chosen, so this layer rarely comes up; everything below governs the countless small decisions of execution, which is where taste is actually kept or lost.

## Principles

**Fewer parts that could be otherwise; simplicity follows.** I like simple work that lives in the gap between philosophy and engineering. But what I actually count is not parts; it is parts that could logically be something else. The check, for any method or theory: how much of it could be swapped out with no logical consequence, whether or not the score moves? Every such place is one I chose rather than the problem chose, and each weakens the work. Beauty in a theory is the feeling that, once the premises are fixed, nothing else could have been; the work is choosing that unfreedom on purpose. A theory with fewer formulas is not necessarily the more constrained one; the one with fewer free settings is. Simplicity is what that constraint usually looks like from outside, so given two ways to do something I want the one with fewer moving parts, even when the fancier one scores a little better.

**One or two innovations; reuse standard machinery everywhere else.** A paper carries one or two innovations, no more. For any non-core component I prefer an established method over a home-grown one, even at a small cost in performance, and I name reused parts as reused rather than dressing them up. This highlights the core, de-risks the work through the literature behind standard methods, and keeps the paper legible.

**Non-default choices are derived, not preferred.** Every departure from the default must be derivable from the problem itself: the problem has property X, so the standard approach fails at Y, hence Z. This splits all choices into three kinds. Default choices need no defense. Forced choices — where the problem's own structure closes the standard path — are the only legitimate source of novelty; good originality is not deliberate distance from prior work but a different representation the problem itself demands. Arbitrary choices, justified by neither, I keep near zero and never dress up as forced — a motivation section written after the preference is the classic disguise. And a non-default choice that works but cannot yet be derived is not a quirk to pardon: it is structure in the problem not yet extracted, the seed of the next paper rather than a component of this one. A method that stays alive only by patching is the same signal at scale: each patch marks a place where the problem's structure was missed, and the more patches, the farther from it.

**Design for the one who continues the work.** A paper is not a monument to its results; it is a part left for the field to build with. Follow-up work almost never takes a paper whole — it changes one part, or takes one part out — so how many places a work can be gripped is an objective property of the work, not of its readers: every coupled component multiplies the preconditions for changing anything, every hidden assumption is a place the method snaps when carried into someone else's context, and a claim with no one-sentence version cannot be cited at all. Standard non-core parts are what make the one novel part detachable. Complexity can be forgiven when the result is extraordinary — such work gets used as a tool rather than extended — but the effect size is unknown on the day of design and usually turns out limited, so simplicity is the hedge; besides, extraordinary effects usually survive simplification.

**Experiments serve one thesis.** Every experiment deepens the single central claim and isolates a mechanism, so the effect can be attributed to a cause. Effort follows the thesis, not the ease of the run: the experiment that actually tests the core claim earns the time even when it is slow. Compare against real baselines with honest statistics. Delete what adds no knowledge; quantity is not rigor.

**The core result is the identity of the paper.** Two conditions, both required: remove the core and everything else loses its reason to exist; and the core cannot be moved unchanged into another paper. The first deletes padding — any section that still makes sense without the core never belonged. The second forbids re-selling the same trick on a new dataset. Portability is therefore split: non-core parts maximally portable, the core minimally portable, because it carries the shape of this one problem. The best fate of a core result is to be demoted, later, into everyone's standard part.

**Claims never outrun the evidence.** One tight thesis beats many loose claims. No framing grander than the results support; state what was shown and name where it does not yet hold. Reaching rhetoric is the tell of work unsure of its contribution.

**The work states a fact about the world, not a fact about me.** What lasts is a statement about how things are; even a method paper lasts only through the more general fact it touches. So the question I put to a conclusion is never which one I would like to be true, or which one shows my method best, but what actually happened. My preference for a conclusion is noise of the same kind as fashion, and the work should carry as little of either as it can. Being easy to pass on is part of the same requirement: knowledge loses something at every handoff, so what is hard to understand, check and reuse gets dropped along the way, whatever it won on the day.

**Ground truth over presentation.** I judge work, my own included, by what actually happened — the code, the runs, whether the ablation exists — never by how the text presents it. A paper can read rigorous while the work beneath it is not; the text is the last thing produced and the easiest to polish. This is also why taste has to be exercised during the work: by writing time it can no longer be added, only imitated.

**How my papers read.** Nothing more, nothing less: every piece of logic, narrative or mathematical, serves the core intent, and nothing is there for erudition. One continuous stream, written in the logic I find most natural. The Introduction and the Discussion carry the most of me. No em-dashes, in any language. No self-coined slogan terms for the core mechanism.

**How my code reads.** The code should read like the one line of the algorithm; one concept per small file. Plain beats clever: I would rather a slightly worse, readable version than a powerful one no one can follow. Configuration is module-level constants, not a giant config of tunable arguments.

## Cases

Same taste, made concrete. Good, then bad.

- (Suppose the core claim is about large models and cost.) Good: spend the effort on the slow large-model run that actually tests it, even at one run a day. Bad: skip it as a waste of time and run a toy benchmark a thousand times to pile up a count.
- Good: two or three experiments, each answering a different question about the same claim. Bad: seven subsections, each re-demonstrating the method on a new toy domain.
- Good: a new knob gets ablated, so the effect is attributed to a mechanism. Bad: several new pieces are added and only the aggregate win is reported; what actually works stays unknown.
- Good: non-core parts use a standard method, cited and passed in a sentence. Bad: every part gets a home-grown scheme, wrapped in grand motivation.
- Good: a nonstandard representation arrives with its derivation attached — the problem's structure breaks the standard one at a named point. Bad: a home-grown variant is chosen because it scored better, and the motivation section is written afterwards to make the preference look forced.
- Good: of two formulations, the one with fewer settings that could logically be otherwise, even if it needs more formulas. Bad: the one with the shorter derivation and three constants set by hand.
- Good: the method's form is forced by the problem and stays put. Bad: a method whose form its author adjusts in every version, each revision reminding everyone that it could have been otherwise.
- Good: the stated conclusion is the one the runs support, including the one I did not want. Bad: the experiment plan is quietly steered toward the conclusion that flatters the method.
- Good: someone else can unscrew the one novel part and mount it in their own pipeline in an afternoon. Bad: ten parts mesh so tightly that touching any one breaks three others, so no one ever builds on it.
- Good: the claim covers exactly what was shown, and names where it does not yet win. Bad: "a fundamental, major transition" rides on a narrow demonstration.
- Good: remove the core result and every remaining section visibly loses its point. Bad: the same core could anchor next year's paper on another dataset unchanged, and half the sections would survive its removal untouched.
- Good: one concept per small file; the main loop reads like the algorithm's steps. Bad: a 1400-line class holding a 200-line training method and a 180-line plotting method, with attributes conjured by `exec()`.
- Good: configuration is a handful of module-level constants. Bad: everything is a tunable argument in a giant config.
