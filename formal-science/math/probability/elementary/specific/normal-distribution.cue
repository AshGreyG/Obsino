package specific

normal_distribution: {
  content: """
    A continuous random variable $X$ has a *normal distribution* with parameters
    $μ$ (mean) and $σ^2$ (variance) if its probability density function is:

    $ f(x) = 1/(σ sqrt(2 π)) exp(-((x - μ)^2)/(2 σ^2)), space.en -∞ < x < +∞ $

    where
    - $μ ∈ ℝ$ is the *mean*, location parameter, center of the distribution
    - $σ > 0$ is the standard deviation, which is scale parameter

    We write it as $X ~ N(μ, σ^2)$

    The simplest and most important special case is the standard normal distribution
    with $μ = 0$ and $σ = 1$:

    $ φ(z) = 1/(sqrt(2 π)) "e"^(-z^2 \\/ 2), space.en -∞ < z < ∞ $

    \(figure_part_normal_distribution_pdf)

    CDF of normal distribution is:

    $ F(x) & = ∫_(-∞)^x 1/(σ sqrt(2 π)) exp(-((t - μ)^2)/(2 σ^2)) "d"t
      = 1/(σ sqrt(2 π)) ∫_(∞)^x exp(-((t - μ)^2)/(2 σ^2)) "d"t \\
      & = 1/2 [1 + "erf"((x - μ) / (sqrt(2) σ))] $

    Here $"erf"$ is *error function* and its expression is:

    $ "erf"(x) = 2/(sqrt(π))∫_0^x "e"^(-t^2) "d"t $

    and $lim_(x-> +∞) "erf"(x) = 1$, $lim_(x-> -∞) "erf"(x) = -1$
    // TODO: may be introduced in special functions

    We can give the CDF of *standard normal distribution* a new notation:

    $ ϕ(x) = 1/sqrt(2 π) ∫_(-∞)^x "e"^(-t^2\\/2) "d"t = 1/2 [1 + "erf"(x / sqrt(2))] $

    \(figure_part_normal_distribution_cdf)

    If random variable follows $X ~ N(μ, σ^2)$, then $U = (X - μ)\\/σ ~ N(0, 1)$.
    Consider two CDF functions $F_X (x)$ and $F_U (u)$, thus we know

    $ F_U(u) = P(U ≤ u) = P((X - μ)/σ ≤ u) = P(X ≤ u σ + μ) = F_X (u σ + μ) $

    If we defined $p_X (x)$ and $p_U (u)$ as their PDF then

    $ p_U (u) = "d"/("d"u) F_X (u σ + μ) = p_X (u σ + μ) ⋅ σ = 1/(sqrt(2 π))
      "e"^(-u^2\\/2) $

    Assume random variable $X ~ N(μ, σ^2)$, because $U = (X - μ)\\/σ ~ N(0, 1)$,
    thus the expectation of $U$ is :

    $ 𝔼[U] = 1/(sqrt(2 π)) ∫_(-∞)^(+∞) u "e"^(-u^2\\/2) "d"u = 0 $

    and thus $𝔼[X] = μ$.

    $ 𝕍"ar"[U] & = 𝔼[U^2] = 1/(sqrt(2 π)) ∫_(-∞)^∞ u^2 "e"^(-u^2\\/2) "d"u \\
      & = (2 sqrt(2))/(sqrt(2 π)) ∫_(-∞)^(+∞) t^2 "e"^(-t^2) "d"t \\
      & = 2/(sqrt(π)) × sqrt(π)/2 = 1 $

    Thus $𝕍"ar"[X] = σ^2$.
  """
  figure_part_normal_distribution_pdf: #"""
    #let normal-pdf = "assets/typst/normal-distribution-pdf.typ"
    #eval(
      str(read(normal-pdf)),
      mode: "markup",
    )
  """#
  figure_part_normal_distribution_cdf: #"""
    #let normal-cdf = "assets/typst/normal-distribution-cdf.typ"
    #eval(
      str(read(normal-cdf)),
      mode: "markup",
      scope: (
        "erf": erf__abramowitz
      )
    )
  """#
}