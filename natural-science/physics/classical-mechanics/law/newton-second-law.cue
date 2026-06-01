package law

newton_second_law: {
  content: #"""
    Newton's Second Law: The rate of change of a particle's momentum equals the
    next external force acting on it. In classical mechanics, the mass $m$ is
    constant (does not depend on motion), so:

    $ ub(F) = ("d"ub(p))/("d"t) = ("d"(m ub(v)))/("d"t)
      = m ("d"ub(v))/("d"t) = m ub(a) $

    Where $ub(F)$ is the net force vector, $m$ is a inertial mass which is a
    scalar, $ub(a)$ is the acceleration vector. $ub(F)$ and $a$ are vectors
    pointing in the same direction.
  """#
  related: [
    "concept/acceleration",
    "law/newton-first-law"
  ]
}