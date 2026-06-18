package concept

angular_speed: {
  content: #"""
    Angular speed $ω(t)$ is defined as the ratio of speed to radius:

    $ ω(t) := (v(t))/R, space.en "where" v(t) = abs(ub(v)(t)) $

    Angular velocity vector $bold(ω)(t)$ is defined as:

    $ bold(ω)(t) := ω(t) hat(ub(n)) $

    where $hat(ub(n))$ is the unit vector perpendicular to the plane of motion,
    with direction given by the *right-hand rule* (when the particle moves
    counterclockwise as seen from the tip of $hat(ub(n))$, $hat(ub(n))$ points
    toward the observer).

    In circular motion, the velocity and position are related by:

    $ ub(v)(t) = bold(ω)(t) × ub(x)(t) $

    This is a geometric cross-product relation, cross product defined via the
    Levi-Civita tensor.
  """#
  related: [
    "concept/cross-product",
    "concept/levi-civita-tensor"
  ]
}