package specific

exponential_distribution: {
  content: """
    If the PDF of random variable $X$ is:

    $ p(x) = cases(
      λ"e"^(-λ x) space.en & x ≥ 0,
      0 & x < 0
    ) $

    then we call random variable $X$ obeys *exponential distribution*, denoted
    as $X ~ "Exp"(λ)$, parameter $λ > 0$:

    \(figure_part_exponential_distribution_pdf)

    Its CDF can be obtained quickly:

    $ F(x) = cases(
      1 - "e"^(-λ x) space.en & x ≥ 0,
      0 & x < 0
    ) $

    \(figure_part_exponential_distribution_cdf)

    For random variables obeying exponential distribution, its expectation:

    $ 𝔼[X] & = ∫_0^∞ x λ "e"^(-λ x) = 1/λ ∫_0^∞ t "e"^(-t) "d"t \\
      & = 1/λ ⋅ evaluated((-(t+1)"e"^(-t)))_0^∞ \\
      & = 1/λ $

    and its variance:

    $ 𝕍"ar"[X] & = 𝔼[X^2] - 𝔼[X]^2 = ∫_0^∞ λ x^2 "e"^(-λ x) "d"x \\
      & = evaluated((-x^2 - 2/λ x - 2/λ^2)"e"^(-λ x))_0^∞ - 1/(λ^2) \\
      & = 2/(λ^2) - 1/(λ^2) = 1/(λ^2) $
  """
  figure_part_exponential_distribution_pdf: #"""
    #let exp-pdf = "assets/typst/exponential-distribution-pdf.typ"
    #eval(
      str(read(exp-pdf)),
      mode: "markup"
    )
  """#
  figure_part_exponential_distribution_cdf: #"""
    #let exp-cdf = "assets/typst/exponential-distribution-cdf.typ"
    #eval(
      str(read(exp-cdf)),
      mode: "markup"
    )
  """#
}