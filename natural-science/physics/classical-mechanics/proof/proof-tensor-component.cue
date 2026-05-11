package proof

proof_tensor_component: {
  content: #"""
    $ sans("T")(ub(e)_i, ub(e)_j, ub(e)_k)
      = T_(i j k) ub(e)_i ⊗ ub(e)_j ⊗ ub(e)_k (ub(e)_i, ub(e)_j, ub(e)_k)
      = T_(i j k) ub(e)_i (ub(e)_i) ⋅ ub(e)_j (ub(e)_j) ⋅ ub(e)_k (ub(e)_k)
      = T_(i j k) δ_(i i) δ_(j j) δ_(k k)
      = T_(i j k) $
  """#
  related: [
    "concept/tensor-product",
    "concept/kronecker-delta",
    "concept/einstein-summation-convention"
  ]
}