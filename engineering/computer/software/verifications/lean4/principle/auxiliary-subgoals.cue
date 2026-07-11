package principle

auxiliary_subgoals: {
  content: """
    The `have` construct, which introduces an auxiliary subgoal in a proof.
    The expression `have h : p := s; t` (here `t` is the remaining proof) produces
    the term `(fun (h : p) => t s)` (here is a anonymous function taking `s`
    as a parameter). In other words, `s` is a proof of `p`, `t` is a proof of
    the desired conclusion assuming `h : p`, and the two are combined by a
    lambda abstraction and application.

    Lean also supports a structured way of reasoning backwards from a goal,
    which models "suffices to show" construction in ordinary mathematics.

    \(code_part_auxiliary_subgoals)
  """
  code_part_auxiliary_subgoals: #"""
    #raw-block-file(
      "src/proof/AuxiliaryProof.lean",
      "lean"
    )
  """#
}