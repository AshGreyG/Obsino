package concept

primitive_types: {
  content: """
    Types classify programs based on the values that they can compute. Types
    serve a number of roles in a program:

    1. They allow the compiler to make decisions about the in-memory representation
      of a value;
    2. They help programmers to communicate their intent to others, serving as
      a lightweight specification for the inputs and outputs of a function.
      The compiler ensures that the program adheres to this specification.
    3. They prevent various potential mistakes, such as adding a number to a
      string, and thus reduce the number of tests that are necessary for a
      program.
    4. They help the Lean compiler automate the production of auxiliary code that
      can save boilerplate.

    The type system of Lean can be used as a full-blown logic for proving
    mathematical theorems.

    Every program in Lean must have a type. In particular, every expression must
    have a type. Every expression must have a type before it can be evaluated.
    Most of time Lean has been able to discover a type on its own, but it is
    sometimes necessary to provide one.

    For example, `Nat` refers to natural numbers, and `Int` refers to `Integer`.

    \(code_part_primitive_types)
  """
  code_part_primitive_types: #"""
    #raw-block-file(
      "src/PrimitiveTypes.lean",
      "lean"
    )
  """#
}