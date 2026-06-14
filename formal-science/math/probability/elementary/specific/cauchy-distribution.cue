package specific

cauchy_distribution: {
  content: """
    The *Cauchy distribution* (also known as the *Lorentz distribution* in physics)
    is a continuous probability distribution with heavy tails. Unlike the normal
    distribution, it has *no finite mean* and *no finite variance*, its tails
    decay so slowly that th expected value and variance do not exist. We can denote
    a random variable obeying Cauchy distribution:

    $ X ~ "Cauchy"(x_0, γ) $

    Recall the PDF of the Cauchy distribution, the standard Cauchy distribution
    has PDF:

    $ f(x) = 1/(π(1 + x^2)), space.en -∞ < x < +∞ $

    For general Cauchy distribution with location parameter $x_0$ and scale
    parameter $γ > 0$:

    $ f(x) = 1/(π γ [1 + (display((x - x_0)/γ))^2]), space.en -∞ < x < +∞ $

    \(figure_part_cauchy_distribution_pdf)

    CDF of the standard Cauchy distribution is:

    $ F(x) & = ∫_(-∞)^x 1/(π (1+t^2)) "d"t = 1/π evaluated(arctan(t))_(-∞)^x \\
      & = 1/π [arctan(x) - (- π/2)] = 1/2 + 1/π arctan(x) $

    Similarly the CDF of general Cauchy distribution is:

    $ F(x) = 1/2 + 1/π arctan((x - x_0)/γ), space.en -∞ < x < +∞ $

    \(figure_part_cauchy_distribution_cdf)

    We proof the expectation of Cauchy distribution doesn't exist:

    $ 𝔼[X] & = ∫_(-∞)^(+∞) |x| ⋅ 1/(π(1 + x^2)) "d"x
      & = 2 ∫_0^(+∞) 1/π x/(1 + x^2) "d"x \\
      & = 2 evaluated( (1/(2 π) ln(x^2 + 1)) )_0^(+∞) \\
      & = +∞ $
  """
  related: [
    "concept/probability-density-function",
    "concept/cumulative-distribution-function"
  ]
  figure_part_cauchy_distribution_pdf: #"""
    #let pdf-cauchy = "assets/typst/cauchy-distribution-pdf.typ"
    #eval(
      str(read(pdf-cauchy)),
      mode: "markup"
    )
  """#
  figure_part_cauchy_distribution_cdf: #"""
    #let cdf-cauchy = "assets/typst/cauchy-distribution-cdf.typ"
    #eval(
      str(read(cdf-cauchy)),
      mode: "markup"
    )
  """#
}