package concept

orthogonal_transformation: {
  content: #"""
    #set math.mat(delim: "[")

    Consider two different Cartesian coordinate system ${x,y,z} := {x_1,x_2,x_3}$
    and ${overline(x), overline(y), overline(z)} := {x_(overline(1)), x_(overline(2)),
    x_(overline(3))}$, Denote by ${ub(e)_i}$ and ${ub(e)_(overline(p))}$ the
    corresponding bases. It is possible to expand the basis vector in terms of
    those of the other. We denote the expansion coefficients by the letter $R$
    and write

    $ ub(e)_i = ub(e)_(overline(p)) R_(overline(p) i), space.en
      ub(e)_(overline(p)) = ub(e)_i R_(i overline(p)) $

    The quantities $R_(overline(p) i)$ and $R_(i overline(p))$ are not the
    components of a tensor; rather, they are the elements of transformation
    matrices:

    $ [R_(overline(p) i)] = mat(
      R_(overline(1) 1), R_(overline(1) 2), R_(overline(1) 3);
      R_(overline(2) 1), R_(overline(2) 2), R_(overline(2) 3);
      R_(overline(3) 1), R_(overline(3) 2), R_(overline(3) 3)
    ),
    space.en
    [R_(i overline(p))] = mat(
      R_(1 overline(1)), R_(1 overline(2)), R_(1 overline(3));
      R_(2 overline(1)), R_(2 overline(2)), R_(1 overline(3));
      R_(3 overline(1)), R_(3 overline(2)), R_(3 overline(3))
    ) $

    These two matrices must be the inverse of each other, since one takes us
    from the barred basis to the unbarred, and the other in the reverse direction:

    $ R_(overline(p) i) R_(i overline(q)) = δ_(overline(p) overline(q)),
    space.en
    R_(i overline(p)) R_(overline(p) j) = δ_(i j) $
  """#
  related: [
    "proof/proof-transformation-matrix-is-orthogonal"
  ]
}