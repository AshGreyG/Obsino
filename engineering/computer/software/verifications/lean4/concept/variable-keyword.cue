package concept

variable_keyword: {
  content: """
    Lean provides the `variable` command to let declarations reuse common parts.
    The `variable` command instructs Lean to insert the declared variables as
    bound variables in definitions that refer to them by name. When declared in
    this way, a variable stays in scope until the end of the file you are working
    on.

    \(code_part_variable_keyword)
  """
  code_part_variable_keyword: #"""
    #raw-block-file(
      "src/basic/VariableKeyword.lean",
      "lean"
    )
  """#
}