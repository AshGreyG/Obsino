package desire

invariant_tensor: {
  content: #"""
    In physics, the laws of nature shouldn't change just because you decided to
    tilt your head or rotate your coordinate system. However, simple scalars
    don't carry enough information, and vectors change their components when you
    rotate your axes.

    Scientists encountered "multi-direction" phenomenon. For example, if you
    squeeze a cube of rubber, the force you apply in the $z$-direction might
    cause the rubber to bulge out in the $x$ and $y$ directions. A simple vector
    cannot describe the "input-output" relationship across multiple planes
    simultaneously.

    The tensor was motivated by the need for a *universal container*. It generalized
    scalars and vectors into a hierarchy (ranks). A rank-2 tensor, for instance,
    can be thought of as a "vector of vectors" allowing it to track how a force
    in one direction affects all other directions at once.
  """#
  related: [
    "concept/tensor"
  ]
}