package proof

proof_probability_is_continuous: {
  content: #"""
    Proof: First we prove the continuity from below of probability $P$. Assume
    ${F_n}_(n≥1)$ is the non-decreasing event sequence in $cal("F")$, that is

    $ ⋃_(i=1)^∞ F_i = lim_(n->∞) F_n $

    If we define $F_0 = ∅$, then

    $ ⋃_(i=1)^∞ F_i = ⋃_(i=1)^∞ (F_i - F_(i-1)) $

    Because $F_(i-1) ⊂ F_i$, thus all $F_i - F_(i-1)$ are mutually exclusive, and
    use the *countable additive* of probability $P$ we obtain:

    $ P(⋃_(i=1)^∞ F_i) = ∑_(i=1)^∞ P(F_i - F_(i-1))
      = lim_(n->∞) ∑_(i=1)^n P(F_i - F_(i-1)) $

    From *finite additive* (can be derived from countable additive) we know

    $ ∑_(i=1)^n P(F_i - F_(i-1)) = P(⋃_(i=1)^n (F_i - F_(i-1))) = P(F_n) $

    hence

    $ P(lim_(n->∞) F_n) = lim_(n->∞) P(F_n) $

    we prove the continuity from below of $P$.

    Then we prove the continuity from above of probability $P$. Assume ${E_n}_(n
    ≥1)$ is the non-increasing event sequence in $cal("F")$. So

    $ 1 - lim_(n->∞) P(E_n) & = lim_(n->∞)[1 - P(E_n)] \
      & = lim_(n->∞) P(overline(E_n)) = P(lim_(n->∞) overline(E_n)) \
      & = P(⋃_(n=1)^∞ overline(E_n)) = P(overline(⋂_(n=1)^∞ E_n)) \
      & = 1 - P(⋂_(n=1)^∞ E_n) $

    Thus

    $ lim_(n->∞) P(E_n) = P(⋃_(n=1)^∞ E_n) $

    we prove the continuity from above of $P$.
  """#
  related: [
    "concept/continuity",
    "concept/probability",
    "theorem/de-morgan-law"
  ]
}