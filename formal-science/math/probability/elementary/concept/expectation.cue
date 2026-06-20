package concept

expectation: {
  content: #"""
    If $X$ is a discrete random variable with possible values $x_1, x_2, x_3, ⋯$
    and probability mass function $p(x_i) = P(X = x_i)$ then the *expectation*
    of $X$ is:

    $ 𝔼[X] = ∑_(i=1)^∞ x_i ⋅ p(x_i) $

    if series $∑_(i=1)^∞ abs(x_i) p(x_i)$ doesn't converge, then we call that the
    expectation doesn't exist.

    For a continuous random variable, if $X$ is a continuous random variable with
    probability density function $f_X (x)$, then the *expectation* of $X$ is:

    $ 𝔼[X] = ∫_(-∞)^(+∞) x ⋅ f_X (x) "d"x $

    if interval $∫_(-∞)^(+∞) abs(x) f_X (x)$ doesn't converge, then we call that
    the expectation doesn't exist.

    Properties of expectation:

    1. *Linearity*: $𝔼[a X + b Y] = a 𝔼[X] + b 𝔼[Y]$
    2. *Constant*: $𝔼[c] = c$ for any constant $c$
    3. *Monotonicity*: if $X ≤ Y$ almost surely, then $𝔼[X] ≤ 𝔼[Y]$
    4. *Expectation of a function*:

      $ 𝔼[g(X)] = ∑_i g(x_i) p(x_i), space.en 𝔼[g(X)] = ∫ g(x) ⋅ f_X (x) "d"x $

    5. *Independent product*: if $X$ and $Y$ are independent then $𝔼[X Y] = 
      𝔼[X] · 𝔼[Y]$
  """#
  related: [
    "concept/distribution-column",
    "concept/probability-density-function"
  ]
}