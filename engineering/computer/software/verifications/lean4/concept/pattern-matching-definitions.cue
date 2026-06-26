package concept

pattern_matching_definitions: {
  content: """
    When defining functions with `def`, it's quite common to name an argument and
    them immediately use it with pattern matching. In these situations, the cases
    of the `match` expression can be written directly, without naming the argument
    at all.

    1. The first step is to *move the arguments' types to the right of the colon,
      so the return type is a function type*. Then *replace the `:=` with each
      case of the pattern match*;
    2. This syntax can also be used to define functions that take more than one
      argument. In this case, their patterns are separated by commas (*simultaneous
      matching*);
    3. Named arguments and patterns can also be mixed in the same definition.

    \(code_part_definitions)
  """
  code_part_definitions: #"""
    #raw-block-file(
      "src/basic/PatternMatchingDefinitions.lean",
      "lean"
    )
  """#
  related: [
    "concept/pattern-matching",
    "concept/definitions"
  ]
}