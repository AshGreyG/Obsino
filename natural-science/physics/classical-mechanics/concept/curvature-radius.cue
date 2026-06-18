package concept

curvature_radius: {
  content: #"""
      For motion along an arbitrary curve, at each instant the particle can be
      considered to be moving on an *osculating circle*. The radius of this circle
      is called the *radius of curvature*, denoted by $ρ$.

      Let the particle's trajectory be a curve $cal("P")(λ)$, $ub(v) = ("d"ub(x))\/
      ("d"t)$ the velocity vector, and $ub(a) = ("d"ub(v))\/("d"t)$ the acceleration
      vector. The radius of curvature $ρ$ is defined by the following geometric
      relations:

      1. Decompose the acceleration into a component parallel to the velocity (
        tangential acceleration) and a component perpendicular to the velocity
        (normal acceleration):

        $ ub(a) = ub(a)_(c) + ub(a)_t $

        where $ub(a)_t$ is the tangential acceleration vector and $ub(a)_c$ is
        the central acceleration vector;

      2. The magnitude of the normal acceleration is:

        $ abs(ub(a)_c) = v^2/ρ $

        hence

        $ ρ = v^2/(abs(ub(a)_c)) $

      For uniform circular motion: $ρ = R$ is a constant, $abs(ub(a)_t) = 0$ and
      $ub(a)_c = -v^2\/R ⋅ hat(ub(r))$. For general curved motion, the radius of
      curvature $ρ$ can vary with position, the instantaneous osculating circle
      has radius $ρ$. For straight-line motion, $ρ → ∞$ (a straight line can be
      viewed as a circle of infinite radius).
    """#
}
