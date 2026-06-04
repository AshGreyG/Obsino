package proof

proof_impulse_momentum_theorem: {
  content: #"""
    From Newton's second law $ub(F) = "d"ub(p)\/"d"t$, integrate both sides with
    respect to time:

    $ ∫_(t_1)^(t_2) ub(F)(t) "d"t = ∫_(t_1)^(t_2)
      ("d"ub(p))/("d"t) "d"t = ub(p)(t_2) - ub(p)(t_2) $
    
    This uses the fundamental theorem of calculus (vector form). The $"d"t$ is
    scalar and the integral is a vector integral.
  """#
  related: [
    "law/impulse-momentum-theorem"
  ]
}