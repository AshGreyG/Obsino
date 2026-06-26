package concept

simultaneous_matching: {
  content: """
    Pattern-matching expressions just like pattern-matching definitions can match
    on multiple values at one. Both the expressions to be inspected and the
    patterns that they match against are written with commas between them,
    similarly to the syntax used for definitions.

    Is seems like simultaneous matching resembles matching on a pair, but there
    is an important difference. Lean tracks the *connection between the expression
    being matched and the patterns*, and this information is used for purposes
    that include checking for termination and propagating static type information.
    So the latter version that matches a pair is rejected by the termination
    checker.

    \(code_part_simultaneous_matching)
  """
  code_part_simultaneous_matching: #"""
    #raw-block-file(
      "src/basic/SimultaneousMatching.lean",
      "lean"
    )
  """#
  related: [
    "concept/pattern-matching"
  ]
}