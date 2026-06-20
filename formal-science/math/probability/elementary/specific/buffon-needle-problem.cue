package specific

buffon_needle_problem: {
  content: """
    Buffon's needle problem asks: if a needle of length $L$ is dropped randomly
    onto a floor made of parallel wooden strips of width $d$ (with $d ≥ L$),
    what is the probability that the needle crosses a line between two strips?

    We use $x$ to denote the distance from the center of the needle to the
    nearest line, and $θ$ to denote the angle between the needle and the direction
    perpendicular to the lines.

    Because the needle is dropped randomly, this means that
    - The distance $x$ is uniformly distributed between $0$ and $d\\/2$
    - The angle $θ$ is uniformly distributed between $0$ and $π\\/2$

    Then we consider the geometric condition for crossing a line:

    \(figure_part_geometric_condition)

    $ x ≤ L/2 sin θ $

    We know that $0 ≤ x ≤ d\\/2$ and that's the sample space $Ω$, thus the total
    measure of the sample space is:

    $ (x, θ) ∈ [0, d/2] × [0, π/2] => S_Ω = d/2 × π/2 = (π d)/4 $

    The needle crosses a line when $x ≤ L\\/2 sin θ$, so:

    $ S_"favorable" & = ∫_0^(π\\/2) L/2 sin θ "d"θ \\
      & = L/2 ∫_0^(π\\/2) sin θ "d"θ \\
      & = evaluated((- L/2 cos θ))_0^(π\\/2) \\
      & = L/2 $

    Therefore the probability is:

    $ p_"cross" = (S_"favorable")/(S_Ω) = (2 L)/(π d) $

    \(figure_part_probability)
  """
  figure_part_geometric_condition: #"""
    #let geometric-condition = "assets/typst/buffon-needle-problem.typ"
    #eval(
      str(read(geometric-condition)),
      mode: "markup"
    )
  """#
  figure_part_probability: #"""
    #let geometric-probability = "assets/typst/geometric-probability.typ"
    #eval(
      str(read(geometric-probability)),
      mode: "markup"
    )
  """#
}