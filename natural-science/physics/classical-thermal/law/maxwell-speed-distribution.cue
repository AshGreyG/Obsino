package law

maxwell_speed_distribution: {
  content: """
    The *Maxwell speed distribution* (also called *Maxwell-Boltzmann speed
    distribution*) describes how molecular speeds are distributed in an ideal
    gas at thermal equilibrium. Not all molecules move at the same speed, most
    have speeds around a certain most probable value.

    For a gas of molecules of mass $m$ at temperature $T$, the distribution is:

    $ f(v) = 4 π (m / (2 π k T))^(3\\/2) v^2 exp((-m v^2)/(2 k T)) $

    where:
    - $f(v) "d"v$ is the fraction of molecules with speed between $v$ and $v + "d"v$
    - $m$ is mass of one molecule
    - $k$ is Boltzmann constant
    - $T$ is absolute temperature

    This distribution is *normalized*:

    $ & ∫_0^(+∞) 4 π (m / (2 π k T))^(3\\/2) v^2 exp((-m v^2)/(2 k T)) "d"v \\
      = & ∫_0^(+∞) 4 π (m / (2 π k T))^(3\\/2) (2 k T)/m (sqrt(m/(2 k T))v)^2 
        exp[- (sqrt(m/(2 k T))v)^2] "d"v \\
      = & 4 π (m / (2 π k T))^(3\\/2) (2 k T)/m ∫_0^(+∞) u^2 exp(-u^2)
        "d" (sqrt((2 k T)/m)u) \\
      = & 4 π (m / (2 π k T))^(3\\/2) ((2 k T)/m)^(3\\/2) ∫_0^(+∞) u^2 exp(-u^2)
        "d"u \\
      = & 4 π (1/π)^(3\\/2) ⋅ 1/2 ⋅ sqrt(π)/2 \\
      = & 1 $

    Differentiate the speed distribution function:

    $ & evaluated("d"/("d"v)[4 π (m / (2 π k T))^(3\\/2)
        v^2 exp((-m v^2)/(2 k T))])_v \\
      = & 4 π (m/(2 k T))^(3\\/2) exp(- m/(2 k T)v^2) (m/(k T)v^3 - 2v) $

    Thus the *most probable speed* is:

    $ v_p = sqrt((2 k T)/m) $

    When speed distribution function is known, we can find the average speed of
    molecules motion by:

    $ ⟨v⟩ & = (∑_(i=1)^N v_i)\\/N = ∫ v "d"N_A\\/N = ∫_0^(+∞) v f(v) "d"v \\
      & = ∫_0^(+∞) v ⋅ 4 π (m / (2 π k T))^(3\\/2) v^2 exp((-m v^2)/(2 k T)) "d"v \\
      & = 4 π (m / (2 π k T))^(3\\/2) ((2 k T)/m)^(3\\/2) ∫_0^(+∞)
        (sqrt(m / (2 k T))v)^3 exp[- (sqrt(m / (2 k T))v)^2] "d"v \\
      & = 4 π (m / (2 π k T))^(3\\/2) ((2 k T)/m)^(3\\/2) ∫_0^(+∞) u^3 exp(-u^2)
        "d" (sqrt((2 k T)/m)u) \\
      & = 4 π (1/π)^(3\\/2) sqrt((2 k T)/m) ∫_0^(+∞) t "e"^(-t) (1/2 "d"t) \\
      & = 4 π (1/π)^(3\\/2) sqrt((2 k T)/m) ⋅ 1/2 ⋅ Γ(2) \\
      & = sqrt((8 k T)/(π m)) $

    And we can also calculate the root-mean-square speed:

    $ ⟨v^2⟩ & = (∑_(i=1)^N v_i^2)\\/N = ∫ v^2 "d"N_A\\/N = ∫_0^(+∞) v^2 f(v)"d"v \\
      & = ∫_0^(+∞) v^2 ⋅ 4 π (m / (2 π k T))^(3\\/2) v^2 exp((-m v^2)/(2 k T)) "d"v \\
      & = 4 π (m / (2 π k T))^(3\\/2) ((2 k T)/m)^2 ∫_0^(+∞)
        (sqrt(m / (2 k T))v)^4 exp[- (sqrt(m / (2 k T))v)^2] "d"v \\
      & = 4 π (m / (2 π k T))^(3\\/2) ((2 k T)/m)^4 ∫_0^(+∞) u^4 exp(-u^2)
        "d" (sqrt((2 k T)/m)u) \\
      & = 4 π (m / (2 π k T))^(3\\/2) ((2 k T)/m)^(5\\/2) ∫_0^(+∞) t^2 "e"^(-t)
        ("d"t)/(2 sqrt(t)) \\
      & = ⋯ 1/2 ∫ t^(3\\/2) "e"^(-t) "d"t \\
      & = ⋯ 1/2 Γ(5/2) = ⋯ 1/2 ⋅ 3/4 Γ(1/2) \\
      & = (3 k T)/m $

    Thus the root-mean-square speed is:

    $ v_"rms" = sqrt((3 k T)/m) $

    \(figure_part_maxwell_speed_distribution)
  """
  figure_part_maxwell_speed_distribution: #"""
    #let maxwell-speed-distribution = "assets/typst/maxwell-speed-distribution.typ"
    #eval(
      str(read(maxwell-speed-distribution)),
      mode: "markup"
    )
  """#
  related: [
    "concept/root-mean-square-speed"
  ]
}