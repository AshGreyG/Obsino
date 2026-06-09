package law

angular_momentum_theorem: {
  content: #"""
    For a single particle, take the time derivative of $ub(L) = ub(x) × ub(p)$:

    $ ("d"ub(L))/("d"t) & = "d"/("d"t)(ub(x) × ub(p)) = ("d"ub(x))/("d"t) ×
      ub(p) + ub(x) × ("d"ub(p))/("d"t) \
      & = ub(v) × ub(p) + ub(x) × ub(F) \
      & = ub(v) × (m ub(v)) + ub(x) × ub(F) \
      & = ub(x) × ub(F) = bold(τ) $

    And this is the *angular momentum theorem* for a single particle. Its geometric
    meaning: the rate of change of a particle's angular momentum equals the net
    torque acting on it.

    For a system of $N$ particle, the total angular momentum is:

    $ ub(L)_"total" = ∑_(i=1)^N ub(x)_i × ub(p)_i $

    Take the time derivative:

    $ ("d"ub(L)_"total")/("d"t) & = ∑_(i=1)^N (("d"ub(x)_i)/("d"t) × ub(p)_i +
      ub(x)_i × ("d"ub(p)_i)/("d"t)) \
      & = ∑_(i=1)^N (ub(v)_i × (m ub(v)_i) + ub(x)_i × (∑_(j≠i) ub(F)_(j→i) +
        ub(F)_i^(("ext")))) \
      & = ∑_(i=1)^N ub(x)_i × (∑_(j≠i) ub(F)_(j→i) + ub(F)_i^(("ext"))) \
      & = ∑_(i=1)^N (ub(x)_i × ∑_(j≠i) ub(F)_(j→i)) + (∑_(i=1)^N ub(x)_i) ×
        ub(F)_i^(("ext")) $

    Notice that for *internal torque* part: for every pair of particles $i$ and $j$,
    their contributions are $ub(x)_i × ub(F)(j→i) + ub(x)_j × ub(F)_(i→j)$.
    According to the Newton's Third Law, $ub(F)_(j→i) = -ub(F)_(i→j)$, so we know
    that:

    $ ∑_(i=1)^N ∑_(j≠i) ub(x)_i × ub(F)_(j→i) = ub(0) $

    We defined the *external torque* part as:

    $ τ^(("ext")) := ∑_(i=1)^N ub(x)_i × ub(F)^(("ext"))_i $

    So finally we know that the rate of change of the system's total angular
    momentum equals that the *net external torque* acting on the system. Internal
    torques do not contribute to the change of total angular momentum.
  """#
}