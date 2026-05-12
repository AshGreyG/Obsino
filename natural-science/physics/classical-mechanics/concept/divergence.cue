package concept

divergence: {
  content: #"""
    Since the gradient $∇ub(A)$ of a vector filed $ub(A)$ has two slots,
    $∇ub(A)(\_,\_)$, we can contract its slots on each other to obtain a scalar
    field. That scalar field is the *divergence* of $ub(A)$ and is denoted

    $ ∇⋅ub(A) := ("contraction of" ∇ub(A)) = A_(a;a) $

    Similarly, if $sans("T")$ is a tensor field of rank 3, then $T_(a b c ; c)$
    is its divergence on its third slot, and $T_(a b c ; b)$ is its divergence on
    its second slot.
  """#
  related: [
    "concept/gradient"
  ]
}