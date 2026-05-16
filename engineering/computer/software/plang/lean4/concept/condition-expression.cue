package concept

condition_expression: {
  content: """
    Because Lean is an expression-oriented functional language, there are no
    condition statements but only condition expressions. They are written using
    `if`, `then` and `else`.

    \(code_part_condition)
  """
  code_part_condition: #"""
    #let code-condition-expression = "src/ConditionExpression.lean"
    #raw(
      str(read(code-condition-expression)).trim(),
      block: true,
      lang: "lean"
    )
  """#
}