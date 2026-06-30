package concept

definitions: {
  content: """
    In Lean, *definitions* are introduced using the `def` keyword. It can be used
    to define variables. New names are defined using the colon-equal operator
    `:=` rather than `=`, this is because *`=` is used to describe equalities
    between existing expressions*. We can explicitly define the type for the
    variable (when Lean cannot infer the type properly).

    In Lean, defined names can only be used after they are defined.

    \(code_part_definitions)

    In Lean, types are first-class part of the language, they are expressions
    like other. This means that definitions can refer to types just as well as
    they can refer to types just as well as they can refer to other values.
    Types are expressions and in an expression, a defined name can be replaced
    with its definition.

    \(code_part_overloaded_number)

    This error occurs because Lean allows number literals to be *overloaded*.
    When it makes sense to do so, natural numbers (or integer numbers) can be used
    for new types, just as if those types were built in to the system.

    One way to work around this limitation is by providing the type `Nat` on the
    right-hand side of the definition, causing `Nat`'s overloading rules to be
    used for value.

    Another way is to use `abbrev` instead of `def` to define the new derived
    number type.
  """
  code_part_definitions: #"""
    #raw-block-file(
      "src/basic/DefinitionBasicUsage.lean",
      "lean"
    )
  """#
  code_part_overloaded_number: #"""
    #raw-block-file(
      "src/basic/OverloadedNumber.lean",
      "lean"
    )
  """#
}