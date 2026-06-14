package theorem

chebyshev_inequality: {
  content: #"""
    Let $X$ be a random variable with finite mean $𝔼[X]$ and finite variance
    $𝕍"ar"[X]$. Then for any real number $ϵ > 0$:

    $ P(|X - 𝔼[x] ≥ ε) ≤ (𝕍"ar"[X])/(ε^2) $
  """#
  related: [
    "proof/proof-chebyshev-inequality"
  ]
}