package concept

center_of_mass: {
  content: #"""
    For a system of $N$ particles, let the $i$-th particle have mass $m_i$ and
    position vector $ub(x)_i$ (measured from an arbitrary fixed origin $cal("O")$).
    The *center of mass* position vector $ub(x)_"center"$ is defined as the
    mass-weighted average of the positions:

    $ ub(x)_"center" := (∑_(i=1)^N m_i ub(x)_i)/(∑_(i=1)^N m_i) $

    Let the total mass be:

    $ M := ∑_(i=1)^N m_i $

    Then the center-of-mass's position vector is:

    $ ub(x)_"center" = 1/M ∑_(i=1)^N m_i ub(x)_i $

    - $ub(x)_"center"$ is a geometric vector that depends on the choice of origin;
    - The center of mass is the weighted average position of the mass distribution;
      it can be thought of as the balance point of the system.

    Differentiate the definition of $ub(x)_"center"$ with respect to time:

    $ ("d"ub(x)_"center")/("d"t) = 1/M ∑_(i=1)^N m_i ("d"ub(x)_i)/("d"t)
      = 1/M ∑_(i=1)^N m_i ub(v)_i = ub(p)/M $

    Thus

    $ ub(p) = M ub(v)_"center" $

    here $ub(v)_"center" = "d"ub(x)_"center"\/"d"t$. The total momentum of the
    system equals the momentum of a single particle of mass $M$ located at the
    center of mass. The motion of the center of mass represents the overall
    translational motion of the system.

    If we differentiate once more:

    $ ("d"ub(p))/("d"t) = M ("d"ub(v)_"center")/("d"t) = M ub(a)_"center" $

    where $ub(a)_"center" = "d"^2 ub(x)_"center"\/"d"t^2$ is the acceleration of
    the center of mass. Combined with $"d"ub(p)\/"d"t = ub(F)^(("ext"))$, we
    obtain the *center-of-mass theorem*:

    $ M ub(a)_"center" = ub(F)^(("ext")) $
  """#
  related: [
    "concept/momentum",
    "concept/center-of-mass-frame",
  ]
}