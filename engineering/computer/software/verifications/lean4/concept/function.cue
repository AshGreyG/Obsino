package concept

function: {
  content: """
    === Functions: Definition

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

    2. Functions in Lean need not be defined at the top level. As expressions,
      functions are produced with the `fun` syntax. *Function expressions (
      anonymous functions)* begin with the keyword `fun`, followed by one or
      more parameters, which are separated from the return expression using `=>`.

      This style of anonymous function expression is often referred to as a
      *lambda expression*, because the typical notation used in mathematical
      descriptions of programming languages uses the Greek letter $λ$. Lean does
      permit `λ` to be used instead of `fun`.

      \(code_part_anonymous_function)

    === Functions: Recursive Functions

    Recursive datatype like `inductive` is nicely complemented by recursive
    functions. Lean ensures by default that every recursive function will eventually
    reach a *base case*. From a programming perspective this rules out accidental
    infinite loops.

    \(code_part_recursive_function)

    === Functions: Partial Functions

    *Partial function* calls itself recursively on input that is not immediately
    smaller than an argument. When a function is declared to be partial, Lean
    does not require a *proof that it terminates*. On the other hand, partial
    functions are also much less amenable to proofs of correctness, because
    allowing infinite loops in Lean's logic would make it unsound.

    \(code_part_partial_function)
  """
  code_part_function: #"""
    #raw-block-file(
      "src/basic/Function.lean",
      "lean"
    )
  """#
  code_part_anonymous_function: #"""
    #raw-block-file(
      "src/basic/AnonymousFunction.lean",
      "lean"
    )
  """#
  code_part_recursive_function: #"""
    #raw-block-file(
      "src/basic/RecursiveFunction.lean",
      "lean"
    )
  """#
  code_part_partial_function: #"""
    #raw-block-file(
      "src/basic/PartialFunction.lean",
      "lean"
    ) 
  """#
  related: [
    "concept/definitions",
    "concept/inductive-datatype",
    "concept/pattern-matching"
  ]
}