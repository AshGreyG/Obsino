package concept

coordinate_system: {
  content: #"""
    In Newtonian 3-space, a coordinate system is defined by an origin $cal("O")$
    and an orthonormal basis ${ub(e)_j}$. The coordinates of a point $cal("P")$
    are $x^j = ub(x)_(cal("P")) ⋅ ub(e)_j$, where $ub(x)_(cal("P")) =
    arrow(cal("OP"))$ is the position vector. A coordinate system itself is not a
    tensor; it is a human-chosen labelling tool. Different coordinate systems
    are related by orthogonal transformation matrices $R_(overline(p)i)$
  """#
  related: [
    "concept/orthogonal-transformation"
  ]
}