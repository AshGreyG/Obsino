package law

newton_first_law: {
  content: #"""
    Newton's First Law (Law of Inertia): In an inertial frame, if no net external
    force acts on a particle, it remains at rest or moves with constant velocity.
    In geometric language:

    $ ub(F) = 0 space.en ⇒ space.en ub(v)(t) = "constant vector" $

    That is

    $ ub(a) = ("d"ub(v))/("d"t) = ub(0) $

    Constant velocity means both the magnitude and direction of $ub(v)$ do not
    change with time. At rest is the special case $ub(v) = ub(0)$.

    This law also defines a special class of reference frames: *inertial frames*
    in which Newton's first law holds.
  """#
  related: [
    "concept/acceleration",
    "concept/velocity"
  ]
}