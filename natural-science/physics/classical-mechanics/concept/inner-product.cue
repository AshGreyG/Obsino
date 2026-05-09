package concept

inner_product: {
  content: #"""
    The *inner product* (also called the dot product) $ub(A) ⋅ ub(B)$ of two
    vectors is defined in terms of this squared length by:

    $ ub(A) ⋅ ub(B) = 1/4 [(ub(A) + ub(B))^2 - (ub(A) - ub(B))^2] $

    One can show that the inner product is a real-valued linear function of
    each of its vectors. Therefore we can regard it as a tensor of rank 2. When
    so regarded, the inner product is defined $sans("g")(\_,\_)$ and is called the
    *metric tensor*. In other words, the metric tensor $sans("g")$ is that linear
    function of two vectors whose value is given by:

    $ sans("g")(ub(A), ub(B)) := ub(A) ⋅ ub(B) $

    Notice that, because $ub(A) ⋅ ub(B) = ub(B) ⋅ ub(A)$, the metric tensor is
    *symmetric* in its two slots, one gets the same real number independently of
    the order in which one inserts the two vectors into the slots:

    $ sans("g")(ub(A), ub(B)) = sans("g")(ub(B), ub(A)) $

    With the aid of inner product, we can regard any vector $ub(A)$ as a tensor
    of rank one: the real number that is produced when an arbitrary vector $ub(C)$
    is inserted into $ub(A)$'s single slot is:

    $ ub(A)(ub(C)) := ub(A) ⋅ ub(C) $
  """#
  related: [
    "concept/tensor",
    "concept/squared-length"
  ]
}