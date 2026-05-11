package concept

einstein_summation_convention: {
  content: #"""
    Any vector $ub(A)$ in 3-space can be expanded in terms of this basis

    $ ub(A) = A_j ub(e)_j $

    We adopt the *Einstein summation convention*: repeated indices (in this case
    $j$) are to be summed (in this 3-space case over $j=1,2,3$), unless otherwise
    instructed. By virtue of the orthonormality of the basis, the components 
    $A_j$ of $ub(A)$ can be computed as the scalar product:

    $ A_j = ub(A) ⋅ ub(e)_j $

    Any tensor, say the rank-3 tensor $sans("T")(\_,\_,\_)$, can be expanded in
    terms of tensor products of the basis vectors:

    $ sans("T") = T_(i j k) ub(e)_i ⊗ ub(e)_j ⊗ ub(e)_k $

    Similarly, the components $T_(i j k)$ of $sans("T")$ can be computed from
    $sans("T")$ and the basis vectors by the generalization of

    $ T_(i j k) = sans("T")(ub(e)_i, ub(e)_j, ub(e)_k) $

    Notice the components of the metric tensor are $sans("g")_(j k) = sans("g")(
    ub(e)_j, ub(e)_k) = ub(e)_j ⋅ ub(e)_k = δ_(j k)$
  """#
  related: [
    "concept/basis-vector",
    "proof/proof-vector-component",
    "proof/proof-tensor-component"
  ]
}