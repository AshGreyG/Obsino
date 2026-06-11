package theorem

addition_rule: {
  content: #"""
    For any two events $A$ and $B$:

    $ P(A ∪ B) = P(A) + P(B) - P(A ∩ B) $

    That's because $P(A) + P(B)$ counts the overlap $A ∩ B$ twice. The general
    addition rule derived from *inclusion-exclusion principle* is that for $n$
    events $A_1, A_2, ⋯, A_n$:

    $ P(⋃_(i=1)^n A_i) & = ∑_i P(A_i) - ∑_(i < j) P(A_i ∩ A_j) \
      & + ∑_(i < j < k) P(A_i ∩ A_j ∩ A_k) - ⋯ + (-1)^(n-1) P(A_1 ∩ A_2 ∩ ⋯
      ∩ A_n) $

    The sign pattern is $+,-,+,-,⋯$, alternating, with the last sign being
    $(-1)^(n-1)$.
  """#
}