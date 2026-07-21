package specific

l1_loss: {
  content: """
    *L1 Loss*, or called *MAE loss*, measures the *absolute difference* between
    the predicted value $hat(y)$ and the true target value $y$. The L1 comes from
    the L1 norm (Manhattan norm), which sums the absolute values of differences:

    $ L_"L1 Loss" = |y - hat(y)| $

    so its distribution and gradient is:

    $ p(r) = "e"^(-|r|), space.en ("d"L_1)/("d"r) = cases(
      1 & space.en r > 0,
      -1 & space.en r < 0,
    ) $

    where $r = y - hat(y)$ is the residual.

    \(figure_part_l1_loss)
  """
  figure_part_l1_loss: #"""
    #let l1-loss = "assets/typst/l1-loss.typ"
    #eval(
      str(read(l1-loss)),
      mode: "markup"
    )
  """#
}