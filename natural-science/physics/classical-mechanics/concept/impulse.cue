package concept

impulse: {
  content: #"""
    Let a force $ub(F)(t)$ act on a particle from time $t_1$ to $t_2$, the
    *impulse* is defined as the time integral of the force:

    $ ub(J) := ∫_(t_1)^(t_2) ub(F)(t) "d"t $

    - $ub(J)$ is a vector (temporal accumulation of force);
    - The integral is a vector integral: adding infinitesimal force vector at
      each instant; and impulse components are integral of force components;
    - Impulse is a *process quality* that depends on how force varies with time

    Impulse can be thought of as the accumulation of the force vector along the
    time axis; its direction is generally not the same as the direction of any
    instantaneous force.

    The *average impulse force* can be defined like this:

    $ ub(F)_"avg" := 1/(Δ t) ∫_(t_1)^(t_2) ub(F)(t) "d"t = ub(J)/(Δ t) $

    If multiple forces $ub(F)_1, ub(F)_2, ⋯$ act simultaneously, the total impulse
    is the vector sum of the individual impulses:

    $ ub(J)_"total" = ∫(ub(F)_1 + ub(F)_2 + ⋯)"d"t = ∫ ub(F)_1 "d"t +
      ∫ ub(F)_2 "d"t + ⋯ $
  """#
}