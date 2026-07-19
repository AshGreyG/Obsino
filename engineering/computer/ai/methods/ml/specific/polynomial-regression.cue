package specific

polynomial_regression: {
  content: """
    Polynomial regression is not a new regression algorithm, it's still linear
    least square. The output function in degree $k$ is

    $ hat(y) = b + ∑_(i=1)^k w_i x^i $

    for the weights $θ=(b,w_1,⋯,w_k)^⊤$, it is still linear. So actually
    polynomial regression is a special case of linear regression.

    Assume we have training set with output: $bold(x)^(("train")) = (x_1,x_2,
    ⋯,x_n$ and $bold(y)^(("train")) = (y_1,y_2,⋯,y_n)$. For polynomial regression
    our design matrix should be:

    $ bold(X)^(("train"))_"poly" = mat(
      1, x_1, x_1^2, ⋯, x_1^k;
      1, x_2, x_2^2, ⋯, x_2^k;
      ⋮, ⋮,   ⋮,     ⋱, ⋮;
      1, x_n, x_n^2, ⋯, x_n^k
    ) $

    Again, we use the *normal equation* from #link(<specific-linear-regression>)[
    linear regression]:

    $ bold(w) = (bold(X)^(("train")⊤)_"poly" bold(X)^(("train"))_"poly")^(-1)
      bold(X)^(("train")⊤)_"poly" bold(y)^("train") $

    \(figure_part_polynomial_regression)
  """
  figure_part_polynomial_regression: #"""
    #let polynomial-regression = "assets/typst/polynomial-regression.typ"
    #eval(
      str(read(polynomial-regression)),
      mode: "markup"
    )
  """#
  related: [
    "specific/linear-regression"
  ]
}