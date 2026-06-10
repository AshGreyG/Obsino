package concept

acceleration: {
  content: #"""
    Acceleration is the time derivative of the velocity vector so the second
    derivative of the position vector:

    $ ub(a)(t) := ("d"ub(v))/("d"t) = ("d"^2ub(x))/("d"t) $

    Its components (given a basis ${ub(e)_j}$) are

    $ a_j(t) = ub(a) ⋅ ub(e)_j = ("d"v_j)/("d"t) = ("d"^2x_j)/("d"t^2) $

    Acceleration can also be seen as a special case of *directional derivative*,
    along the tangent direction $ub(v)$ of the curve:

    $ ub(a) = ∇_(ub(v))ub(v) $

    where $∇_(ub(v))ub(v)$ is the directional derivative of the velocity field
    along itself.
  """#
  related: [
    "concept/directional-derivative"
  ]
}