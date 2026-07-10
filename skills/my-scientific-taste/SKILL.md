---
name: my-scientific-taste
description: My personal scientific taste - my preferences in experiment design, in whether to invent or reuse a method, in what results deserve to exist, and in how a paper and its code read. Consult when designing or pruning experiments, deciding between a novel and a standard method, judging whether a result belongs, or writing and revising my papers and code.
---

# My Scientific Taste

These are my calls, the ones where competent scientists genuinely disagree. They are my defaults; the final judgment in the moment is always mine. The principles come first; the cases at the end make the abstract feeling concrete, and are the fastest way to calibrate.

## Principles

**Simplicity, and Occam's razor.** I like simple work that lives in the gap between philosophy and engineering. Given two ways to do something, I want the one with fewer moving parts, even when the fancier one scores a little better.

**One or two innovations; reuse standard machinery everywhere else.** A paper carries one or two innovations, no more. For any non-core component I prefer an established method over a home-grown one, even at a small cost in performance, and I name reused parts as reused rather than dressing them up. This highlights the core, de-risks the work through the literature behind standard methods, and keeps the paper legible.

**Experiments serve one thesis.** Every experiment deepens the single central claim and isolates a mechanism, so the effect can be attributed to a cause. Effort follows the thesis, not the ease of the run: the experiment that actually tests the core claim earns the time even when it is slow. Compare against real baselines with honest statistics. Delete what adds no knowledge; quantity is not rigor.

**Claims never outrun the evidence.** One tight thesis beats many loose claims. No framing grander than the results support; state what was shown and name where it does not yet hold. Reaching rhetoric is the tell of work unsure of its contribution.

**How my papers read.** Nothing more, nothing less: every piece of logic, narrative or mathematical, serves the core intent, and nothing is there for erudition. One continuous stream, written in the logic I find most natural. The Introduction and the Discussion carry the most of me. No em-dashes, in any language. No self-coined slogan terms for the core mechanism.

**How my code reads.** The code should read like the one line of the algorithm; one concept per small file. Plain beats clever: I would rather a slightly worse, readable version than a powerful one no one can follow. Configuration is module-level constants, not a giant config of tunable arguments.

## Cases

Same taste, made concrete. Good, then bad.

- (Suppose the core claim is about large models and cost.) Good: spend the effort on the slow large-model run that actually tests it, even at one run a day. Bad: skip it as a waste of time and run a toy benchmark a thousand times to pile up a count.
- Good: two or three experiments, each answering a different question about the same claim. Bad: seven subsections, each re-demonstrating the method on a new toy domain.
- Good: a new knob gets ablated, so the effect is attributed to a mechanism. Bad: several new pieces are added and only the aggregate win is reported; what actually works stays unknown.
- Good: non-core parts use a standard method, cited and passed in a sentence. Bad: every part gets a home-grown scheme, wrapped in grand motivation.
- Good: the claim covers exactly what was shown, and names where it does not yet win. Bad: "a fundamental, major transition" rides on a narrow demonstration.
- Good: one concept per small file; the main loop reads like the algorithm's steps. Bad: a 1400-line class holding a 200-line training method and a 180-line plotting method, with attributes conjured by `exec()`.
- Good: configuration is a handful of module-level constants. Bad: everything is a tunable argument in a giant config.
