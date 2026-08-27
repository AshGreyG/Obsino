package concept

affine_transformation: {
  content: #"""
    An *affine transformation* is a mapping that preserves points, straight
    lines, parallelism, and affine combinations. In an $n$-dimensional vector
    space it has the form:

    $ f(bold(x)) = A bold(x) + bold(t) $

    where $A$ is a linear transformation and $bold(t)$ is a translation. The
    linear part $A$ may represent rotation, scaling, reflection, or shear. An
    affine transformation does not generally preserve lengths or angles; those
    quantities are preserved only by the appropriate restricted transformations,
    such as rotations and translations.

    Affine combinations are unchanged by the mapping. For points $bold(x)_i$
    and coefficients $λ_i$ whose sum is one:

    $ f(sum_i λ_i bold(x)_i) = sum_i λ_i f(bold(x)_i), space.en
      sum_i λ_i = 1 $

    This property explains why lines and planes remain lines and planes after
    an affine transformation. If $det(A) != 0$, the transformation is
    invertible; if $det(A) = 0$, it can collapse space onto a lower-dimensional
    subset.

    With homogeneous coordinates and column vectors, the transformation is
    represented by one matrix:

    $ M = mat(
      A_11, A_12, A_13, t_x;
      A_21, A_22, A_23, t_y;
      A_31, A_32, A_33, t_z;
      0, 0, 0, 1
    ) $

    Applying $M$ to a point with final coordinate $1$ includes the translation,
    while applying it to a direction with final coordinate $0$ does not. Matrix
    multiplication therefore composes model transformations in a single
    representation. The order of multiplication matters: applying a scale
    before a translation is generally different from applying the translation
    before the scale.
  """#
  related: [
    "concept/homogeneous-coordinate"
  ]
}
