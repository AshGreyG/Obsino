package concept

logic_vectors: {
  content: """
    The elements of a logical vector can have the values `TRUE`, `FALSE` and `NA`
    (not available). The first two are often abbreviated as `T` and `F`. Note
    however that `T` and `F` are just variables which are set to `TRUE` and
    `FALSE` by default, but *are not reserved words and hence can be overwritten
    by the user*.

    The logical operators are `<`, `<=`, `>`, `>=`, `==` and `!=` for inequality.
    In addition if `c1` and `c2` are logical expressions, then `c1 & c2` is their
    intersection, `c1 | c2` is their union, and `!c1` is the negation of `c1`.

    \(code_part_logic_vectors)

    In some cases the components of a vector may not be completely known. When
    an element or value is not available or a missing value in the statistical
    sense. a place within a vector may be reserved for it by assigning it the
    special value `NA`. *In general any operation on an `NA` becomes an `NA`*.

    The function `is.na(x)` gives a logic vector of the same size as `x` with
    value `TRUE` if and only if the corresponding element in `x` is `NA`.

    Note that there is a second kind of missing value which are produced by
    numerical computation, the so-called *Not a Number*, `NaN` values.
  """
  code_part_logic_vectors: #"""
    #raw-block-file(
      "src/basic/logic-vectors.R",
      "r"
    )
  """#
}