package concept

countable_infinite_intersection: {
  content: #"""
    A *countable intersection* is the intersection of a *countably infinite*
    number of events $A_1, A_2, A_3, ⋯$, its notation is:

    $ ⋂_(i=1)^∞ A_i = A_1 ∩ A_2 ∩ A_3 ∩ ⋯ $

    This is the event that all $A_1, A_2, A_3, ⋯$ occur simultaneously.

    Relationship between finite and countable infinite intersections: for a
    sequence of events $A_1, A_2, A_3, ⋯$:

    $ ⋂_(i=1)^∞ A_i ⊂ ⋂_(i=1)^n A_i space.en "for every finite" n $

    As $n$ increases, finite intersections become *smaller*, the countable
    intersection is the *limit*:

    $ ⋂_(i=1)^∞ A_i = lim_(n -> ∞) ⋂_(i=1)^n A_i $

    This is a *decreasing sequence* of events:

    $ B_1 ⊇ B_2 ⊇ B_3 ⊇ ⋯ space.en "where" space.en B_n = ⋂_(i=1)^n A_i $
  """#
  related: [
    "concept/intersection-of-events",
    "concept/finite-intersection"
  ]
}