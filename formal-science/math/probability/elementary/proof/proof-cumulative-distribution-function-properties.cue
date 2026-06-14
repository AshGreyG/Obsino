package proof

proof_cumulative_distribution_function_properties: {
  content: #"""
    Proof:

    1. *Non-decreasing* is easy to prove;
    2. Because $F_X (x)$ is the probability of event ${X ≤ x}$, so $0 ≤ F_X (x)
      ≤ 1$. According to the non-decreasing property of $F_X (x)$, for any
      integer $m$ and $n$, both

      $ lim_(x-> -∞) F_X (x) = lim_(m-> -∞) F_X (m), space.en "and" space.en
        lim_(x-> +∞) F_X (n) = lim_(n-> +∞) F_X (n) $

      exist. According to the countable additivity of probability we have

      $ 1 & = P(-∞ < X < +∞) = P(⋃_(i=-∞)^(+∞) {i - 1 < X ≤ i}) \
        & = ∑_(i=-∞)^(+∞) P(i - 1 < X ≤ i) = lim_(n-> +∞ \ m-> -∞)
          ∑_(i=m)^n P(i - 1 < X ≤ i) \
        & = lim_(n-> +∞) F_X (n) - lim_(m-> -∞) F_X (m) $

      thus

      $ lim_(x-> -∞) F_X (x) = 0, space.en lim_(x-> +∞) F_X (x) = 1 $

    3. Because $F_X (x)$ is non-decreasing function, right limit of point $x_0$
      must exist. To prove the right continuity, consider any decreasing sequence
      $x_1 > x_2 > ⋯ > x_n > ⋯ > x_0$, when $x_n -> x_0 (n -> ∞)$, prove
      $lim_(n->∞) F_X (x_n) = F_X (x_0)$:

      $ F_X (x_1) - F_X (x_0) & = P(x_0 < X ≤ x_1) = P(⋃_(i=-∞)^∞ {x_(i+1) < 
        X ≤ x_i}) \
        & = ∑_(i=1)^∞ P(x_(i+1) < X ≤ x_i) = ∑_(i=1)^∞[F_X (x_i) - F_X (x_(i+1))] \
        & = lim_(n-> ∞)[F_X (x_1) - F_X (x_n)] = F_X (x_1) - lim_(n-> ∞) F_X (x_n) \
        $

      Thus

      $ F_X (x_0) = lim_(n-> ∞) F_X (x_n) = F_X (x_0 + 0) $
  """#
}