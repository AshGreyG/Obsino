package concept

probability: {
  content: #"""
    Kolmogorov's axiomatic definition provides a rigorous mathematical foundation
    for probability, based on set theory and measure theory. It does not depend
    on intuition or physical interpretation.

    Let $(Ω, cal("F"))$ be a measurable space. A *probability measure* is a
    real number function

    $ P: cal("F") |-> [0,1] $

    that satisfies the following three axioms:

    1. Non-negativity: for every event $A ∈ cal("F")$, $P(A) ≥ 0$
    2. Unit measure of the sample space: $P(Ω) = 1$
    3. Countable additivity: if $A_1, A_2, A_3, ⋯$ is a countable collection of
      pairwise mutually exclusive events ($A_i ∩ A_j = ∅ space.en ∀ i ≠ j$), then

      $ P(⋃_(i=1)^∞ A_i) = ∑_(i=1)^∞ P(A_i) $

    The triple $(Ω, cal("F"), P)$ is called a *probability space*. From these
    three axioms we can derive many useful properties:

    - $P(∅) = 0$. $Ω = Ω ∪ ∅ ∪ ∅ ∪ ⋯$ and then use axiom 3
    - $P(overline(A)) = 1 - P(A)$. $Ω = A ∪ overline(A)$, these two are disjoint
      so $1 = P(Ω) = P(A) + P(overline(A))$
    - If $A ⊂ B$, then $P(A) ≤ P(B)$. $B = A ∪ (B - A)$, they are disjoint
  """#
  related: [
    "concept/sample-space",
    "concept/sigma-algebra"
  ]
}