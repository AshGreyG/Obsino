package concept

union_of_events: {
  content: #"""
    The *union* of two events $A$ and $B$ denoted $A ∪ B$, is the event that
    *at least one of $A$ or $B$ occurs* or both:

    $ A ∪ B := {ω ∈ Ω: ω ∈ A "or" ω ∈ B} $

    Special cases:

    1. When $A$ is the subset of $B$, $A ⊂ B$, then $A ∪ B = B$
    2. When $A = B$, then $A ∪ B = A = B$
  """#
  related: [
    "concept/inclusion",
    "concept/equality",
  ]
}