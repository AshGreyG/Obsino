package specific

classical_logic: {
  content: """
    All introduction and elimination rules are all constructive, which is to say,
    they reflect a computational understanding of the logical connectives based
    on the *propositions-as-types* correspondence.

    Ordinary *classical logic* adds to this the law of the *excluded middle*,
    `p ∨ ¬p` is always true for classical logic. But in constructive logic, we
    must give both proofs of both cases to assert `p ∨ ¬p` is true.

    The excluded middle law can derive double-negation elimination, which allows
    one to prove any proposition `p` by assuming `¬p` and deriving `False`,
    but only if you then apply double-negation elimination to get from `¬¬p` to
    `p`, because that amounts to proving `¬¬p`. In other words, *double-negation
    elimination allows one to carry out a proof by contradiction* (something which
    is not generally possible in constructive logic).

    \(code_part_classical_logic)
  """
  code_part_classical_logic: #"""
    #raw-block-file(
      "src/proof/ClassicalProof.lean",
      "lean"
    )
  """#
}