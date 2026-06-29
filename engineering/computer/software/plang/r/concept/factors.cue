package concept

factors: {
  content: """
    A *factor* is a vector object used to specify a discrete classification (
    grouping) of the components of other vectors of the same length. A factor
    is similarly created using the `factor()` function. And to find out the
    levels of a factor we can use `levels()` function. Notice, factors have
    been sorted in alphabetical order.

    The function `tapply()` is used to apply a function, here `mean()`, to each
    group of components of the first argument, defined by the levels of the
    second component. The result is a structure of the same length as the levels
    attribute of the factor containing the results.

    \(code_part_factors)

    The combination of a vector and a labelling factor is an example of what is
    sometimes called a *ragged array* because the subclass sizes are possibly
    irregular.

    \(code_part_factors_ragged_array)
  """
  code_part_factors: #"""
    #raw-block-file(
      "src/basic/factors.R",
      "r"
    )
  """#
  code_part_factors_ragged_array: #"""
    #raw-block-file(
      "src/basic/factors-ragged-array.R",
      "r"
    )
  """#
}