package concept

automatic_implicit_type_param: {
  content: """
    When writing polymorphic functions in Lean, it is typically not necessary
    to list all the implicit parameters. Instead, they can simply be mentioned.
    If Lean can determine their type, then they are automatically inserted as
    implicit parameters:

    \(code_part_automatic_implicit_type)
  """
  code_part_automatic_implicit_type: #"""
    #raw-block-file(
      "src/basic/AutomaticImplicitTypeParam.lean",
      "lean"
    )
  """#
  related: [
    "concept/polymorphism"
  ]
}