package specific

binomial_distribution: {
  content: """
    Let $X$ be the number of successes in $n$ independent Bernoulli trials, each
    with success probability $p$. Then $X$ follows a *binomial distribution*
    with parameters $n$ and $p$:

    $ X ~ "Binomial"(n,p) $

    The probability mass function is:

    $ P(X = k) = binom(n, k) p^k (1 - p)^(n - k), space.en k = 0,1,2,⋯,n $

    \(figure_part_binomial_distribution_pmf)

    Its CDF has no closed form:

    $ F(k) = P(X ≤ k) = ∑_(i=0)^k binom(n, i) p^i (1 - p)^i $

    We can use Typst to draw its draft:

    \(figure_part_binomial_distribution_cdf)

    Since $X = ∑_(i=1)^n X_i$ where $X_i$ are independent Bernoulli ($p$) variables,
    so its expectation

    $ 𝔼[X] = ∑_(i=1)^n 𝔼[X_i] = ∑_(i=1)^n p = n p $

    and its variance:

    $ 𝕍"ar"[X] = ∑_(i=1)^n 𝕍"ar"[X] = ∑_(i=1)^n p(1-p) = n p (1 - p) $
  """
  figure_part_binomial_distribution_pmf: #"""
    #let binomial-pmf = "assets/typst/binomial-distribution-pmf.typ"
    #eval(
      str(read(binomial-pmf)),
      mode: "markup"
    )
  """#
  figure_part_binomial_distribution_cdf: #"""
    #let binomial-cdf = "assets/typst/binomial-distribution-cdf.typ"
    #eval(
      str(read(binomial-cdf)),
      mode: "markup"
    )
  """#
}