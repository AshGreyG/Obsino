package concept

arrays: {
  content: """
    === Arrays: Assign Vector's `dim` Attribute

    A vector can be used by R as an array only if it has a dimension vector as
    its `dim` attributes. For example `z` is a vector of 24 elements, then we
    can assign its dimension as vector `c(3, 4, 2)` that allows it to be treated
    as a 3 by 4 by 2 array.

    The values in the data vector give the values in the array in the same order
    as they would occur in Fortran, that is *column major order*, with the first
    subscript moving fastest and the subscript slowest (in most modern programming
    language we use *row major order*).

    \(code_part_arrays_assign_dimension)

    === Arrays: Constructor Function

    As well as giving a vector structure a `dim` attribute, arrays can be
    constructed from vectors by the `array` function. However if the first
    argument `data` is shorter than the multiplications of `dim`'s components,
    its values *are recycled from the beginning again to make it up to size of
    multiplications of `dim`'s components*.

    \(code_part_arrays_constructor_function)

    === Arrays: Arrays Indexing

    Individual elements of an array may be referenced by giving the name of the
    array followed by the subscripts in square brackets, separated by commas.
    More generally, subsections of an array may be specified by *giving a sequence
    of index vectors in place of subscripts; however if any index position is
    given an empty index vector, then the full range of that subscript is taken.*

    \(code_part_arrays_indexing)

    In that order, `a[,,]` stands for the entire array, which is the same as
    omitting the subscripts entirely and using `a` alone. Also, if an array
    name is given with *just one subscript or index vector*, in this case the
    *dimension vector is ignored*.

    === Arrays: Out Product

    The *outer product* (also called the *tensor product*) is an operation that
    takes two vectors and produces a matrix. Outer product can use `%o%` operator
    or function `outer(a,b,FUN="*")`. Notice `outer()` function is flexible.
    For example it can use `"+"`, `"^"` and custom function as third parameter:

    \(code_part_arrays_outer_product)

    === Arrays: Transpose

    The function `aperm(a, perm)` may be used to permute an array. The argument
    `perm` must be a permutation of the integers `{1,⋯,k}`, where `k` is the number
    of subscripts in `a`. The result of the function is an array of the same size
    as a but with dimension given by `perm[j]` becoming the new j-th dimension.

    For transposition we can use a simpler function `t()`.

    \(code_part_arrays_transposition)
  """
  code_part_arrays_assign_dimension: #"""
    #raw-block-file(
      "src/basic/arrays-assign-dimension.R",
      "r"
    )
  """#
  code_part_arrays_constructor_function: #"""
    #raw-block-file(
      "src/basic/arrays-constructor-function.R",
      "r"
    )
  """#
  code_part_arrays_indexing: #"""
    #raw-block-file(
      "src/basic/arrays-indexing.R",
      "r"
    )
  """#
  code_part_arrays_outer_product: #"""
    #raw-block-file(
      "src/basic/arrays-outer-product.R",
      "r"
    )
  """#
  code_part_arrays_transposition: #"""
    #raw-block-file(
      "src/basic/arrays-transpose.R",
      "r"
    )
  """#
}