package theorem

de_morgan_law: {
  content: #"""
    *De Morgan's Laws* are two fundamental rules in set theory and probability that
    describe the relationship between unions, intersections and complements:

    For any two events $A$ and $B$ within a sample space $Ω$:

    $ overline(A ∪ B) = overline(A) ∩ overline(B), space.en
      overline(A ∩ B) = overline(A) ∪ overline(B) $

    *De Morgan's Laws* extend naturally to *any number of* events, finite or
    countably infinite:

    for $n$ events $A_1, A_2, ⋯, A_n$:

    $ overline(⋃_(i=1)^n A_i) = ⋂_(i=1)^n overline(A_i), space.en
      overline(⋂_(i=1)^n A_i) = ⋃_(i=1)^n overline(A_i) $

    for a countable collection $A_1, A_2, ⋯, A_n$:

    $ overline(⋃_(i=1)^∞ A_i) = ⋂_(i=1)^∞ overline(A_i), space.en
      overline(⋂_(i=1)^∞ A_i) = ⋃_(i=1)^∞ overline(A_i) $
  """#
}