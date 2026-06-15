package specific

mass_center_of_semicircle: {
  content: """
    \(figure_part_semicircle)

    Because the semicircle is symmetric about the $y$-axis, so the center of mass
    should be at the $y$-axis. Pick any tiny circular arc at the semicircle, its
    length denoted as $"d"s$ and mass denoted as $"d"m$, use $ρ_s$ to represent
    the line mass density then

    $ "d"m = ρ_s"d"s $

    According to #link(<concept-center-of-mass>)[definition of center-of-mass],
    use components formula, we can obtain the $y$ coordinate value of
    center-of-mass:

    $ y_"center" & = ∫ y ρ_s"d"s slash.big m \\
      & = ∫_0^π R sin θ⋅ρ_s⋅R"d"θ slash.big m \\
      & = (2ρ_s R^2)/m = (2ρ_s R^2)/(π R ρ_s) \\
      & = 2/π R $

    Thus the center-of-mass of this semicircle is $ub(x) = (0,2\\/π R)$.
  """
  figure_part_semicircle: #"""
    #let semicircle = "assets/typst/mass-center-of-semicircle.typ"
    #eval(
      str(read(semicircle)),
      mode: "markup"
    )
  """#
  related: [
    "concept/center-of-mass"
  ]
}