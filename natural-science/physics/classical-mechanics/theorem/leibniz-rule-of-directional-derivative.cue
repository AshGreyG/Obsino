package theorem

leibniz_rule_of_directional_derivative: {
  content: #"""
    Because the gradient and the directional derivative are defined by the same
    standard limiting process as one uses when defining elementary derivatives,
    they obey the *standard Leibniz rule* for differentiating products:

    $ ∇_(ub(A))(sans("S") ⊗ sans("T"))
      := (∇_(ub(A))sans("S")) ⊗ sans("T") + sans("S") ⊗ ∇_(ub(A))sans("T") $

    in slot-naming index notation:

    $ (S_(a b) T_(c d e))_(;j) A_j
      := (S_(a b ; j) A_j)T_(c d e) + S_(a b)(T_(c d e ; j) A_j) $
  """#
  related: [
    "concept/directional-derivative"
  ]
}