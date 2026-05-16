package concept

definitions: {
  content: """
    In Lean, *definition* are introduced using the `def` keyword, it can be used
    to define variables. New names are defined using the colon-equal operator
    `:=` rather than `=`, this is because *`=` is used to describe equalities
    between existing expressions*. We can explicitly define the type for the
    variable (when Lean cannot refer the type properly).

    In Lean, defined names can be only used after they are defined.

    \(code_part_definitions)
  """
  code_part_definitions: #"""
    #raw-block-file(
      "src/DefinitionBasicUsage.lean",
      "lean"
    )
  """#
}