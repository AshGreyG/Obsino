package concept

polar_vector: {
  content: #"""
    *Polar vectors* are the most common type of vector. They correspond to directed
    line segments in space. Under space inversion, they reverse direction.

    Geometric examples: position vector $ub(x)$, displacement $Δ ub(x)$, velocity
    $ub(v)$, acceleration $ub(a)$, force $ub(F)$, momentum $ub(p)$. For example,
    under parity transformation, their behaviors are like:

    $ cal("P"): ub(v) |-> -ub(v) $
  """#
  related: [
    "concept/vector",
    "concept/axial-vector",
    "concept/parity-transformation"
  ]
}