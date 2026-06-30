package concept

string_interpolation: {
  content: """
    In Lean, prefixing a string with `s!` triggers *string interpolation*,
    where expressions contained in curly braces inside the string are replaced
    with their values.

    \(code_part_string_interpolation)

    The string interpolation actually calls the `ToString` function to convert
    values to its string representation according to its type.
  """
  code_part_string_interpolation: #"""
    #raw-block-file(
      "src/basic/StringInterpolation.lean",
      "lean"
    )
  """#
}