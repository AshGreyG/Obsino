package proof

proof_tensor_component: {
  content: #"""
    $ sans("T")(ub(e)_i, ub(e)_j, ub(e)_k)
      & = T_(a b c) ub(e)_a ⊗ ub(e)_b ⊗ ub(e)_c (ub(e)_i, ub(e)_j, ub(e)_k) \
      & = T_(a b c) ub(e)_a (ub(e)_i) ⋅ ub(e)_b (ub(e)_j) ⋅ ub(e)_c (ub(e)_k) \
      & = T_(a b c) δ_(a i) δ_(b j) δ_(c k) \
      & = T_(a b c) \
      & = T_(i j k) $
  """#
  related: [
    "concept/tensor-product",
    "concept/kronecker-delta",
    "concept/einstein-summation-convention"
  ]
}