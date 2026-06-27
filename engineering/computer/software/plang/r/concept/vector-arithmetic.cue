package concept

vector_arithmetic: {
  content: """
    Vectors can be used in arithmetic expressions, *in which case the operations
    are performed element by element*. Vectors occurring in the same expression
    not all be of the same length, if they are not, *the value of the expression
    is a vector with the same length as the longest vector which occurs in the
    expression*. *Recycling* occurs in each binary operation: *the shorter
    vector is a recycled as often as need be until it matches the length of the
    longest vector*:

    \(code_part_vector_arithmetic)

    - Usual elementary arithmetic operators: `+`, `-`, `*`, `/` and `^` (power);
    - Common arithmetic functions: `log`, `exp`, `sin` and so on;
    - `min` and `max` function returns the minimum and maximum elements;
    - `sum`, `prod`, `mean`, `var`, `sort` methods etc.
  """
  code_part_vector_arithmetic: #"""
    #raw-block-file(
      "src/basic/vector-arithmetic.r",
      "r"
    )
  """#
}