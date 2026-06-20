package proof

proof_vector_component: {
  content: #"""
    $ ub(A) ⋅ ub(e)_j = (A_k ub(e)_k) ⋅ ub(e)_j = A_k (ub(e)_k ⋅ ub(e)_j)
      = A_k δ_(k j) = A_j $
  """#
  related: [
    "concept/kronecker-delta",
    "concept/einstein-summation-convention"
  ]
}