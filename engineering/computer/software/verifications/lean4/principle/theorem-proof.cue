package principle

theorem_proof: {
  content: """
    In the propositions-as-types paradigm, theorems involving only `→` can be
    proved using lambda abstraction. In Lean, `theorem` command introduces a
    new theorem.

    \(code_part_theorem_proof)

    Note that the `theorem` command is really a version of the `def` command: under
    the propositions and types correspondence, proving the theorem `p → q → p` is
    really the same as defining an element of the associated type. To the kernel
    type checker, there is no difference between the two. Notice that the lambda
    abstraction `hp : p` and `hq : q` can be viewed as temporary assumptions in
    the proof of `t1`.

    Lean also allows us to specify the type of the final term `hp` explicitly
    with a `show` statement. Adding such extra information can improve the
    clarity of a proof and help detect errors when writing a proof. The `show`
    command does nothing more than annotate the type.
  """
  code_part_theorem_proof: #"""
    #raw-block-file(
      "src/proof/TheoremProof.lean",
      "lean"
    )
  """#
}