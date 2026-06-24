package concept

pattern_matching: {
  content: """
    In many languages, inductive types are consumes by first using an `instanceof`
    operator to check which subclass has been received and then reading the values
    of the fields that are available in the given subclass. The `instanceof` check
    determines which code to run, ensuring that the data needed by this code
    is available, while the fields themselves provide the data. *In Lean, both
    of these purposes are simultaneously served by pattern matching*:

    \(code_part_pattern_matching)

    The `match` expression is provided the function's argument `n` for destructuring,
    if `n` was constructed by `Nat.zero`, then the first branch of the pattern
    match is taken and the result is `true`. If `n` was constructed by `Nat.succ`
    then the second branch is taken and the result is `false`.
  """
  code_part_pattern_matching: #"""
    #raw-block-file(
      "src/basic/PatternMatching.lean",
      "lean"
    )
  """#
  related: [
    "concept/inductive-datatype"
  ]
}