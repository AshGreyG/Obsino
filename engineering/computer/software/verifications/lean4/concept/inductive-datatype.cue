package concept

inductive_datatype: {
  content: """
    Structures do not provide an easy way to encode *multiple choices*. Most
    classic data structures such as trees and lists, have a *recursive* structure,
    where the tail of a list is itself a list, or where the left and right
    branches of a binary tree are themselves binary trees. Datatype that allows
    choices are called *sum types* and datatype that can include instances of
    themselves are called *recursive datatype*. Recursive sum types are called
    *inductive datatype* because mathematical induction may be used to prove
    statements about them. When programming, inductive datatype is consumed
    through *pattern matching* and *recursive functions*.

    Inductive datatype may have multiple constructors. Just a a structure
    declaration places its names in a namespace named after the declared type,
    an inductive datatype places the names of its constructors in a namespace.
    In the Lean standard library, `true` and `false` are *re-exported* from this
    namespace so that they can be written alone, rather than `Bool.true` and
    `Bool.false` respectively.

    \(code_part_inductive_datatype)
  """
  code_part_inductive_datatype: #"""
    #raw-block-file(
      "src/basic/InductiveDatatype.lean",
      "lean"
    )
  """#
  related: [
    "concept/structure"
  ]
}