package law

conservation_of_angular_momentum_law: {
  content: #"""
    *Law of Conservation of Angular Momentum*: When the net external torque on
    a system is zero, the total momentum of the system remains constant. The
    geometric statement is:

    $ bold(τ) = bold(0) space.en => space.en ("d"ub(L)_"total")/("d"t) = ub(0)
      space.en => space.en ub(L)_"total"(t) = "constant vector" $

    That is:

    $ ∑_(i=1)^N ub(x)_i × (m ub(v)_i) = "constant vector" ("independent of" t) $

    - This is a *vector conservation* law: both the magnitude and direction of
      the total angular momentum are constant in time;
    - The condition for angular momentum conservation is zero net external *torque*,
      not zero net external *force*.

    1. Particle under a *central force* (force always points toward or always from
      a fixed center), toque is zero like *the system of Sun and Earth*;
    2. System with no external torque;
    3. If the external torque has zero component along some direction, the
      component of total angular momentum along that direction is conserved.
  """#
  related: [
    "concept/angular-momentum",
    "concept/torque"
  ]
}