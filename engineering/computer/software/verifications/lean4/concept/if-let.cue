package concept

if_let: {
  content: """
    When consuming values that have a sum type, it is often the case that only
    a single constructor is of interest. We can use `if` together with `let`
    to simulate pattern match and assign value simultaneously. So in some contexts
    using `if let` instead of `match` can make code easier to read.

    \(code_part_if_let)
  """
  code_part_if_let: #"""
    #raw-block-file(
      "src/basic/IfLet.lean",
      "lean"
    )
  """#
}