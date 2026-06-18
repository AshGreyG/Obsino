package proof

proof_chebyshev_inequality: {
  content: #"""
    Let $X$ be discrete with values $x_i$ and probabilities $p_i$, we set $μ$
    as expectation of $X$: $μ = 𝔼[X]$, thus

    $ 𝕍"ar"[X] & = σ^2 = ∑_i (x_i - μ)^2 p_i ≥ ∑_(abs(x_i - μ) ≥ ε) (x_i - μ)^2 p_i \
      & ≥ ∑_(abs(x_i - μ) ≥ ε) ε^2 p_i = ε^2 ∑_(abs(x_i - μ) ≥ ε) p_i \
      & = ε^2 P(|X - μ| ≥ ε) $

    Let $X$ be continuous random variable and its probability density function is
    $p(x)$, we set $μ$ as expectation of $X$: $μ = 𝔼[X]$, thus

    $ 𝕍"ar"[X] & = σ^2 = ∫_(-∞)^(+∞) (x - μ)^2 p(x) "d"x
      ≥ ∫_(abs(x - μ) ≥ ε) (x - μ)^2 p(x) "d"x \
      & ≥ ∫_(abs(x - μ) ≥ ε) ε^2 p(x) "d"x ≥ ε^2 ∫_(abs(x - μ) ≥ ε) p(x) "d"x \
      & = ε^2 P(|X - μ| ≥ ε) $
  """#
  related: [
    "concept/expectation",
    "concept/variance",
    "theorem/chebyshev-inequality"
  ]
}