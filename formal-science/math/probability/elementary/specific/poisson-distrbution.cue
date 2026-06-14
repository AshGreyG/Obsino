package specific

poisson_distribution: {
  content: """
    A discrete random variable $X$ follows a *Poisson distribution* with
    parameter $λ > 0$ if its probability mass function is:

    $ P(X = k) = (λ^k)/(k!) "e"^(-λ), space.en k = 0,1,2,⋯  $

    and we write it as:

    $ X ~ "Poisson"(λ) $

    \(figure_part_poisson_distribution_pmf)

    Similarly, Poisson distribution also doesn't have closed-form CDF:

    $ F(k) = P(X ≤ k) = ∑_(i=0)^k (λ^i)/(i!) "e"^(-λ), space.en k = 0,1,2,⋯ $

    \(figure_part_poisson_distribution_cdf)

    Consider random variable $X ~ "Poisson"(λ)$, then its expectation:

    $ 𝔼[X] = ∑_(k=0)^∞ k (λ^k)/(k!) "e"^(-λ)
      = λ"e"^(-λ) ∑_(k=1) (λ^(k-1))/((k-1)!) = λ "e"^(-λ) "e"^λ = λ $

    and its variance:

    $ 𝕍"ar"[X] & = 𝔼[X^2] - 𝔼[X]^2 = ∑_(k=0)^∞ k^2 (λ^k)/(k!) "e"^(-λ) - λ^2 \\
      & = ∑_(k=1)^∞ k (λ^k)/((k-1)!) "e"^(-λ) = ∑_(k=1)^∞ [(k-1) + 1]
        (λ^k)/((k-1)!) "e"^(-λ) - λ^2 \\
      & = λ^2 "e"^(-λ) ∑_(k=2)^∞ (λ^(k-2))/((k-2)!)
        + λ "e"^(-λ) ∑_(k=1)^∞ (λ^(k-1))/((k-1)!) - λ^2 \\
      & = λ^2 + λ - λ^2 = λ $
  """
  figure_part_poisson_distribution_pmf: #"""
    #let poisson-pmf = "assets/typst/poisson-distribution-pmf.typ"
    #eval(
      str(read(poisson-pmf)),
      mode: "markup"
    )
  """#
  figure_part_poisson_distribution_cdf: #"""
    #let poisson-cdf = "assets/typst/poisson-distribution-cdf.typ"
    #eval(
      str(read(poisson-cdf)),
      mode: "markup"
    )
  """#
}