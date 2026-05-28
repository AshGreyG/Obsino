package concept

condition_expression: {
  content: """
    Because Lean is an expression-oriented functional language, there are no
    condition statements but only condition expressions. They are written using
    `if`, `then` and `else`.

    \(code_part_condition)
  """
  code_part_condition: #"""
    #raw-block-file(
      "src/ConditionExpression.lean",
      "lean"
    )
  """#
}