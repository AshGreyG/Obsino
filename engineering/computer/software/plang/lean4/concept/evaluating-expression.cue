package concept

evaluating_expression: {
  content: """
    Evaluation is the process of finding the value of an expression, just as one
    does in arithmetic. Some times mathematical expressions contain variables
    like $x + 1$, the value of it cannot be computed until we know what the value
    of $x$ is.

    In Lean, however, programs work the same way as mathematical expressions.
    Once given a value, variables cannot be reassigned. Evaluating an expression
    cannot have side effects.

    To ask Lean to evaluate an expression, write `#eval` before an expression
    will report the result of this expression. Lean obeys the ordinary rules of
    precedence for arithmetic operators.

    Lean doesn't like other programming languages that use parentheses to apply
    a function to its arguments, Lean simply writes the function next to its
    arguments like `f x` but not `f(x)`. But parentheses are useful in a function
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