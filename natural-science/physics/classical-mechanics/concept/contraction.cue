package concept

contraction: {
  content: #"""
    From two vectors $ub(A)$ and $ub(B)$ we can construct the tensor product
    $ub(A) ⊗ ub(B)$ (a second-rank tensor), and we can also construct the
    inner product $ub(A) ⋅ ub(B)$ (a real-number, scalar, also known as rank-0
    tensor). The process of *contraction* is the construction of $ub(A) ⋅ ub(B)$
    from $ub(A) ⊗ ub(B)$:

    $ "contraction" (ub(A) ⊗ ub(B)) := ub(A) ⋅ ub(B) $
  """#
  related: [
    "concept/tensor",
    "concept/inner-product",
    "concept/tensor-product"
  ]
}