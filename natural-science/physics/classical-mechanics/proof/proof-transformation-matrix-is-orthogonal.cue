package proof

proof_transformation_matrix_is_orthogonal: {
  content: #"""
    The orthonormality requirement for the two bases implies that $δ_(i j) =
    ub(e)_i ub(e)_j = (ub(e)_(overline(p)) R_(overline(p) i)) ⋅ (ub(e)_(
    overline(q)) R_(overline(q) j)) = R_(overline(p) i) R_(overline(q) j) (
    ub(e)_(overline(p)) ⋅ ub(e)_(overline(q)) ) = R_(overline(p) i) R_(overline(
    q) j) δ_(overline(p) overline(q)) = R_(overline(p) i) R_(overline(p) j)$.
    According to the definition of orthonormal transformation, we know
    $R_(i overline(p)) R_(overline(p) j) = δ_(i j)$, hence the transpose of
    $[R_(overline(p) i)]$ is its inverse, which we have already denoted by
    $[R_(i overline(p))]$:

    $ [R_(i overline(p))] = "inverse"([R_(overline(p) i)]) = "transpose"
      ([R_(overline(p) i)]) $

    This property implies that the transformation matrix is *orthogonal*, so the
    transformation is a reflection or a rotation. Thus the bases associated with
    any two Euclidean coordinate systems are related by a reflection or rotation,
    and the matrix $[R_(overline(p) i)]$ is *rotation matrix*.
  """#
  related: [
    "concept/basis-vector",
    "concept/orthogonal-transformation",
    "concept/kronecker-delta"
  ]
}