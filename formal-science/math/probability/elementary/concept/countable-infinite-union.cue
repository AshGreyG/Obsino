package concept

countable_infinite_union: {
  content: #"""
    A *countable union* is the union of a *countably infinite* number of events
    $A_1, A_2, A_3, ⋯$, its notation:

    $ ⋃_(i=1)^∞ A_i = A_1 ∪ A_2 ∪ A_3 ∪ ⋯ $

    This is the event that at least one of $A_1, A_2, A_3, ⋯$ occurs.

    Relationship between finite and infinite countable unions: for a sequence of
    events $A_1, A_2, A_3, ⋯$:

    $ ⋃_(i=1)^n A_i ⊂ ⋃_(i=1)^∞ A_i space.en "for every finite" n $

    As $n$ increases, finite unions become larger, the countable union is the
    *limit*:

    $ ⋃_(i=1)^∞ A_i = lim_(n -> ∞) ⋃_(i=1)^n A_i $

    This is an *increasing sequence* of events:

    $ B_1 ⊂ B_2 ⊂ B_3 ⋯ space.en "where" space.en B_n = ⋃_(i=1)^n A_i $
  """#
  related: [
    "concept/union-of-events",
    "concept/finite-union"
  ]
}