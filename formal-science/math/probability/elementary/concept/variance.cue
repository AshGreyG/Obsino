package concept

variance: {
  content: #"""
    The *variance* of a random variable $X$ is the expected value of the squared
    deviation of $X$ from its mean $𝔼[X]$:

    $ 𝕍"ar"[X] = 𝔼[(X - 𝔼[X])^2] $

    it is often denoted by $σ^2$ sigma squared.

    A computationally simpler formula (especially for discrete cases) is:

    $ 𝕍"ar"[X] & = 𝔼[X^2 - 2 𝔼[X] ⋅ X + 𝔼[X]^2] \
      & = 𝔼[X^2] - 2𝔼[X] ⋅ 𝔼[X] + 𝔼[X]^2 \
      & = 𝔼[X^2] - 𝔼[X]^2 $

    The variance of constant $c$ is $0$ because $𝕍"ar"[c] = 𝔼[c - c] = 0$. Variance
    has this property:

    $ 𝕍"ar"[a X + b] & = 𝔼[(a X + b)^2] - 𝔼[a X + b]^2 \
      & = 𝔼[a^2 X^2 + 2 a b X + b^2] - a^2 𝔼[X]^2 - 2 a b 𝔼[X] - b^2 \
      & = a^2 (𝔼[X^2] - 𝔼[X]^2) \
      & = a^2 𝕍"ar"[X] $
  """#
  related: [
    "concept/expectation"
  ]
}