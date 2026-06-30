package concept

cumulative_distribution_function: {
  content: #"""
    The *cumulative distribution function* (CDF) of a random variable $X$ is the
    function that gives the probability that $X$ is *less than or equal to* a
    given value $x$ regardless of whether the random variable is discrete,
    continuous or mixed.

    Let $X$ be a random variable defined on a probability space $(Ω,cal("F"),P)$.
    The cumulative distribution function $F_X: ℝ |-> [0,1]$ is defined as:

    $ F_X (x) = P(X ≤ x) $

    The distribution function tells you how much probability has accumulated up
    to the point $x$. Denoted as $X ~ F(x)$.

    Every distribution function $F_X (x)$ has following three properties:
    1. *Non-decreasing*: if $a < b$ then $F_X (a) ≤ F_X (b)$
    2. *Boundedness*: 

      $ lim_(x-> -∞) F_X (x) = 0, space.en lim_(x-> +∞) F_X (x) = 1 $

    3. *Right-continuity*: for any $x_0$ we have

      $ lim_(x-> x_0^(+0)) F_X (x) = F_X (x_0) $
  """#
  related: [
    "concept/random-variable"
  ]
}