package concept

assignment: {
  content: """
    R operates on named *data structures*. The simplest such structure is the
    *numeric vector*, which is *a single entity consisting of an ordered collection
    of numbers*.

    \(code_part_assignment)

    This is an *assignment statement* using the function `c()` which in this
    context can *take an arbitrary number of vector arguments and whose value
    is a vector got by concatenating its arguments end to end*.

    1. The assignment operator `<-` occurs strictly side-by-side and it points to
      the object receiving the value of the expression, most frequently used;
    2. Use `assign()` function to create variable names dynamically;
    3. Global assignment operator `<<-` overwrites the global variables;
    4. Use equal symbol `=` for assignment, not recommended;
    5. Change the direction of `<-` and `<<-` to `->` and `->>`, not recommended.
  """
  code_part_assignment: #"""
    #raw-block-file(
      "src/basic/assignment.r",
      "r"
    )
  """#
}