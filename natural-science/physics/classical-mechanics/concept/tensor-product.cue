package concept

tensor_product: {
  content: #"""
    From three vectors $ub(A),ub(B),ub(C)$ we can construct a tensor, their
    *tensor product* (also called *outer product* contradistinction to the
    inner product), defined as follows:

    $ ub(A) ⊗ ub(B) ⊗ ub(C) (ub(E), ub(F), ub(G)) 
      = ub(A)(ub(E)) ub(B)(ub(F)) ub(C)(ub(G))
      = (ub(A) ⋅ ub(E)) (ub(B) ⋅ ub(F)) (ub(C) ⋅ ub(G)) $

    (we use $ub(A)$ to denote a vector, but we use $sans("A")$ to denote non-vector
    tensor whose rank is not 1)

    So the tensor product of three vectors create a new rank-3 tensor. Similar
    definitions can be given for the tensor product of any number of vectors,
    and of any two or more tensors of any rank, for example, if $sans("T")$ has
    rank 2 and $sans("S")$ has rank 3, then

    $ sans("T") ⊗ sans("S") (ub(E)_1, ⋯, ub(E)_5) = 
      sans("T")(ub(E)_1, ub(E)_2) sans("S")(ub(E)_3, ub(E)_4, ub(E)_5) $
  """#
  related: [
    "concept/tensor",
    "concept/inner-product",
    "desire/composite-systems"
  ]
}