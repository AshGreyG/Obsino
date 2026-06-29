package concept

index_vectors: {
  content: """
    Subsets of the elements of a vector may be selected by appending to the name
    of the vector an *index vector* in square brackets. Such index vectors can be
    any of four distinct types:

    1. *A logical vector*. In this case the index vector is recycled to the same
      length as the vector from which elements are to be selected. Values
      corresponding to `TRUE` in the index vector are selected and those
      corresponding to `FALSE` are omitted;

    2. *A vector of positive integral quantities*. In this case the values in
      the index vector must lie in the set `1,2,⋯,length(x)`. The corresponding
      elements of the vector are selected and concatenated in that order. The
      index vector can be of any length and the result is of the same length as
      the index vector, if elements not enough, then R will append `NA` at the
      end of the result;

    3. *A vector of negative integral quantities*. Such an index vector specifies
      the values to be *excluded* rather than *included*;

    4. *A vector of character strings.* This possibility only applies where an
      object has a `names` attribute to identify its components. In this case
      a sub-vector of the names vector may be used in the same way as the positive
      integral labels in item 2 further above.

    \(code_part_index_vectors)

    An indexed expression can also appear on the receiving end of an assignment,
    in which cases the assignment operation is performed *only on those elements
    of the vector*.
  """
  code_part_index_vectors: #"""
    #raw-block-file(
      "src/basic/index-vectors.R",
      "r"
    )
  """#
}