package concept

evaluating_expression: {
  content: """
    Evaluation is the process of finding the value of an expression, just as one
    does in arithmetic. Sometimes mathematical expressions contain variables
    like $x + 1$, its value cannot be computed until we know what the value
    of $x$ is.

    In Lean, however, programs work the same way as mathematical expressions.
    Once given a value, variables cannot be reassigned. Evaluating an expression
    cannot have side effects.

    To ask Lean to evaluate an expression, write `#eval` before an expression
    will report the result of this expression. Lean obeys the ordinary rules of
    precedence for arithmetic operators.

    Unlike other programming languages, Lean does not use parentheses to apply
    a function to its arguments; instead, it simply writes the function next to its
    arguments, like `f x` rather than `f(x)`. But parentheses are useful in a function
    call in an another function call.

    \(code_part_evaluating)
  """
  code_part_evaluating: #"""
    #raw-block-file(
      "src/EvaluatingExpression.lean",
      "lean"
    )
  """#
}