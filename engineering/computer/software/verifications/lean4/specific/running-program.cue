package specific

running_program: {
  content: """
    === Running Program: `IO Unit`

    The simplest way to run a Lean program is to use the `--run` option passed
    to the Lean executable. With `--run` option, Lean invokes the program's
    `main` definition. In programs that do not take command-line arguments, `main`
    should have type `IO Unit`. This *means that `main` is not a function*,
    because there are no arrows in its type. Instead of being a function that
    has side effects, `main` consists of a description of effects to be carried
    out.

    \(code_part_running_program_hello)

    `IO α` is the type of a program that, when executed, will either throw an
    exception or return a value of `α`. During execution, this program may
    have side effects. These programs are referred to as IO actions. Lean
    distinguishes between *evaluation of expressions* and *execution of IO
    actions* (which rely on an external system to interact with the world).

    === Running Program: `do` Block

    \(code_part_running_program_io)

    In this program, the `main` action consists of `do` block. This block contains
    a sequence of statements. The `do` syntax can be thought of as a special-
    purpose sub-language within Lean that is dedicated to modeling imperative
    programs. IO actions that are built with a `do` block are executed by
    executing the statements in order.

    In ordinary statements, `let` is used in #link(<concept-local-definitions>)[
    local definitions], while some `let` bindings in `do` use a left arrow
    (`←` or `<-`) instead. Using an arrow means that the value of the expression
    is an IO action that should be executed, with the result of the action saved
    in the local variable.

    === Running Program: `pure`

    \(code_part_running_program_pure)

    Function `pure` creates an IO action that has no side effects, but returns
    `pure`'s argument.
  """
  code_part_running_program_hello: #"""
    #raw-block-file(
      "src/specific/RunningProgramHello.lean",
      "lean"
    )
  """#
  code_part_running_program_io: #"""
    #raw-block-file(
      "src/specific/RunningProgramIO.lean",
      "lean"
    )
  """#
  code_part_running_program_pure: #"""
    #raw-block-file(
      "src/specific/RunningProgramPure.lean",
      "lean"
    )
  """#
}