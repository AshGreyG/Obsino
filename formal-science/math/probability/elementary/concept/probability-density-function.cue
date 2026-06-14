package concept

probability_density_function: {
  content: #"""
    For a *continuous random variable*, we cannot use a probability mass function
    because the probability of any single exact value is zero. Instead, we use
    a *probability density function* (PDF), which describes how probability is
    distributed *per unit* of the variable.

    Let $X$ be a continuous random variable. A function $f_X (x)$ is called the
    *probability density function* (PDF) of $X$ if for any interval $[a,b]$:

    $ P(a ≤ X ≤ b) = ∫_a^b f_X (x) "d"x $

    More generally, for any measurable set $A ⊆ ℝ$:

    $ P(X ∈ A) = ∫_A f_X (x) "d"x $

    The total probability over the entire real line is $1$:

    $ ∫_(-∞)^(+∞) f_X (x) "d"x = 1 $

    *The PDF itself is not a probability, it can be greater than 1, only the
    integral of the PDF gives probabilities.* The cumulative distribution function
    (CDF) $F_X (x)$ and the PDF are related by:

    $ f_X (x) = "d"/("d"x) F_X (x) $

    The basic properties of probability density function:
    1. Non-negative: $f_X (x) ≥ 0$
    2. Normalization: $∫_(-∞)^(+∞) f_X (x) "d"x = 1$
  """#
  related: [
    "concept/distribution-column",
    "concept/cumulative-distribution-function"
  ]
}