package concept

polymorphism: {
  content: """
    Types in Lean can take arguments, for instance the type `List Nat` describes
    lists of natural numbers. Just as Lean uses a space to pass an argument to
    a function, it uses a space to pass an argument to a type.

    In functional programming, the term *polymorphism* typically refers to
    datatypes and definitions that take types as arguments (notice it's different
    from the object-oriented programming languages).

    A structure's type arguments are written immediately after the structure's
    name. It is customary to use *Greek letters* to name type arguments in Lean
    when no more specific name suggests itself. Definitions may also take types
    as arguments, which makes them polymorphic.

    \(code_part_polymorphism_definition)

    Because types are first class and can be computed using the ordinary rules
    of the Lean language, *types can be computed by pattern-matching against a
    datatype*. When Lean is checking this function, it uses the fact that *`match`
    expression in the function's body corresponds to the `match` expression in
    the type* to make `Nat` be the expected type for the `positive` case and to
    make `Int` be the expected type for the `negative` case.

    \(code_part_polymorphism_type)

    And to make it easier to read functions on lists, the *bracket notation `[]`*
    can be used to pattern-match against `nil` and an infix `::` can be used in
    place of cons:

    \(code_part_polymorphism_linked_list)

    The type argument should be automatically inferred in some cases. we can use
    *curly braces to instead of parentheses* when defining a function. But when
    there is no type can be inferred from the context, then we need to provide
    explicit type annotations.

    \(code_part_polymorphism_infer)
  """
  code_part_polymorphism_definition: #"""
    #raw-block-file(
      "src/basic/PolymorphismDefinition.lean",
      "lean"
    )
  """#
  code_part_polymorphism_type: #"""
    #raw-block-file(
      "src/basic/PolymorphismType.lean",
      "lean"
    )
  """#
  code_part_polymorphism_linked_list: #"""
    #raw-block-file(
      "src/basic/PolymorphismLinkedList.lean",
      "lean"
    )
  """#
  code_part_polymorphism_infer: #"""
    #raw-block-file(
      "src/basic/PolymorphismInfer.lean",
      "lean"
    )
  """#
}