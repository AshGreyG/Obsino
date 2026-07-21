package specific

l2_loss: {
  content: """
    *L2 Loss*, or called *MSE Loss* measures the *squared difference* between
    the predicted value $hat(y)$ and the true target value $y$. Ths L2 comes from
    the L2 norm (Euclidean norm), which is the square root of the sum of squared
    differences:

    $ L_"L2 Loss" = 1/2 (y - hat(y))^2 $

    so its distribution and gradient is:

    $ p(r) = "e"^(- r^2/2), space.en ("d"L_2)/("d"r) = r $

    where $r = y - hat(y)$ is the residual.

    \(figure_part_l2_loss)
  """
  figure_part_l2_loss: #"""
    #let l2-loss = "assets/typst/l2-loss.typ"
    #eval(
      str(read(l2-loss)),
      mode: "markup"
    )
  """#
}