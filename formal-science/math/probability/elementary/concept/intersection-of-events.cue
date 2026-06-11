package concept

intersection_of_events: {
  content: #"""
    The *intersection of two events* $A$ and $B$, denoted $A ∩ B$ or simply
    $A B$ is the event that *both $A$ and $B$* occur simultaneously:

    $ A ∩ B := {ω ∈ Ω: ω ∈ A "and" ω ∈ B} $

    Special cases:

    1. When $A$ is the subset of $B$, $A ⊂ B$, then $A ∩ B = A$
    2. When $A$ and $B$ have no common outcomes, then $A ∩ B = ∅$
    3. When $A = B$, then $A ∩ B = A = B$
  """#
  related: [
    "concept/inclusion",
    "concept/equality",
    "concept/disjointness"
  ]
}