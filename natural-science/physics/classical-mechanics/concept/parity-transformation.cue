package concept

parity_transformation: {
  content: #"""
    Consider the *parity transformation* (space inversion):

    $ cal("P"): ub(x) |-> -ub(x) $

    i.e. reflect every point through the origin.

    Under this transformation two kinds of vectors can be classified:

    - *Polar vector* (true vector) changes sign;
    - *Axial vector* (pseudo vector) does not change sign.

    This distinct behavior arises because an axial vector is fundamentally
    constructed from the cross product of two polar vectors.
  """#
  related: [
    "concept/vector",
    "concept/polar-vector",
    "concept/axial-vector",
    "concept/cross-product"
  ]
}