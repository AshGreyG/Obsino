package specific

sequences: {
  content: """
    R can use `begin:end` to generate sequences, which is different from Python,
    it can take the `end` value. For example `1:4` represents `c(1,2,3,4)`.
    The function `seq()` is a more general facility for generating sequences.
    It has five arguments:

    1. `from`: the beginning value of sequence;
    2. `to`: the end value of sequence;
    3. `by`: the step between elements;
    4. `length`: when one of `from` or `to` not specified, this param indicates
      the length of sequence;
    5. `along`: when `along = vector`, normally used as the only argument to
      create the sequence `1, 2, ⋯, length(vector)`.

    \(code_part_sequences)

    A related function is `rep()` which can be used for replicating an object
    in various complicated ways.
  """
  code_part_sequences: #"""
    #raw-block-file(
      "src/specific/sequences.R",
      "r"
    )
  """#
}