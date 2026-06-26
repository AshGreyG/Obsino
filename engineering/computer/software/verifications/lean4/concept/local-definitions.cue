package concept

local_definitions: {
  content: """
    In many cases, intermediate values represent useful concepts all on their own,
    and naming them explicitly can make the program easier to read. In other cases,
    the intermediate value is used more than once. Writing down the same code
    twice in Lean causes it to be computed twice, while saving the result in a
    variable leads to the result of the computation being saved and reused.

    In Lean, the result of the recursive call can be named and thus saved, using
    `let`. Local definitions with `let` resemble top-level definitions with `def`:
    *it takes a name to be locally defined, arguments if desired, a type signature
    and then a body following `:=`*. After the local definition, the expression
    in which the local definition is available must be on a *new line*.

    Pairs have only a single constructor, so we can use `(_, _)` to pattern
    match the result of a function returning product type.

    \(code_part_local_definitions)

    `let` can also be used to defined functions. The biggest difference with
    `let` and `def` is that recursive `let` definitions *must be explicitly
    indicated by writing `let rec`*.
  """
  code_part_local_definitions: #"""
    #raw-block-file(
      "src/basic/LocalDefinitions.lean",
      "lean"
    )
  """#
}