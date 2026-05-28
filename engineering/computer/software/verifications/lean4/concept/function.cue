package concept

function: {
  content: """
    There are variety ways to define functions in Lean:

    1. The simplest is to place the function's arguments before the definition's
      type, separated by spaces. Functions that accept multiple arguments are
      defined with spaces between the arguments' names and types.

      A function that accepts a `Nat` and returns a `Bool` has type `Nat → Bool`,
      and a function that accepts two `Nat`s and returns a `Nat` type has type
      `Nat → Nat → Nat`. This arrow can also be written with an ASCII alternative
      arrow `->`.

      All functions actually expect precisely one argument. Functions like
      `maximum` that seem to take more than one argument are in fact functions
      that *take one argument and return a new function*. Using a function that
      returns a function to implement multiple-argument function is called
      *currying*. Function arrows associative to the right, which means that
      `Nat → Nat` should be parenthesized `Nat → (Nat → Nat)`.

    \(code_part_function)
  """
  code_part_function: #"""
    #raw-block-file(
      "src/Function.lean",
      "lean"
    )
  """#
  related: [
    "concept/definitions"
  ]
}