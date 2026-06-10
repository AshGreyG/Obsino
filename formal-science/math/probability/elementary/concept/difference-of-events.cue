package concept

difference_of_events: {
  content: #"""
    The *difference* of event $A$ and event $B$, denoted $A - B$, is the event
    that $A$ occurs but $B$ does not occur:

    $ A - B = {ω ∈ Ω: ω ∈ A "and" ω ∉ B} $

    Special cases:

    1. When $A$ is the subset of $B$, $A ⊂ B$, then $A - B = ∅$
    2. When $A$ and $B$ are mutually exclusive (disjoint)

    Unlike union and intersection, difference is not *commutative*. When $A ≠ B$,
    $A - B ≠ B - A$. And these two are disjoint:

    $ (A - B) ∩ (B - A) = ∅ $
  """#
}