package concept

circular_motion: {
  content: #"""
    *Circular motion* is motion where the particle's trajectory is a circle, the
    position vector $ub(x)(t)$ satisfies:

    $ abs(ub(x)(t) - ub(x)_c) = R = "constant" $

    where $ub(x)_c$ is the position vector of the circle's center and $R > 0$ is
    the radius. Usually we choose the center as the origin $ub(x)_c = 0$, we have

    $ abs(ub(x)(t)) = R $

    meaning the magnitude of the position vector is constant.

    In circular motion, we can define two mutually perpendicular unit vectors:

    - *radial unit vector* (from center to particle):

    $ hat(ub(r))(t) := (ub(x)(t))/(abs(ub(x)(t))) = (ub(x)(t))/R $

    - *tangential unit vector* (along velocity, perpendicular to $hat(ub(r))$):

      Differentiating $abs(ub(x)(t)) = R$ with respect to time gives $ub(x)(t)
      ⋅ ub(v)(t)$, so velocity is perpendicular to position. Define:

    $ hat(bold(θ))(t) := (ub(v)(t))/(abs(ub(v)(t))) space.en ("when" v ≠ 0) $

    it satisfies $hat(bold(θ)) ⟂ hat(ub(r))$.

    The acceleration $ub(a)(t) = "d"ub(v)\/"d"t$ can be decomposed into *radial*
    (*centripetal*) and *tangential* components.

    - *Centripetal acceleration* (radial, pointing toward the center):

    $ ub(a)_c (t) := -(v(t)^2)/R hat(ub(r))(t) = -ω^2(t)R hat(ub(r))(t) $

      The minus sign indicates it points toward the center (opposite to $hat(ub(r))$).

    - *Tangential acceleration* (tangential, changing the speed):

    $ ub(a)_t (t) := -("d"v(t))/("d"t) hat(bold(θ))(t) = α(t) R hat(bold(θ))(t) $

      where $α(t) := ("d"ω)\/("d"t)$ is the *angular acceleration scalar*.

    Total acceleration:

    $ ub(a)(t) = ub(a)_c (t) + ub(a)_t (t) = -(v^2)/R hat(ub(r)) + ("d"v)/("d"t)
      hat(bold(θ)) $

    For circular motion, centripetal acceleration can be seen as the rate of change
    of the velocity vector $ub(v)$ along the tangential direction:

    $ ub(a)_c = ∇_(hat(bold(θ))) ub(v) = ("d"ub(v))/("d"t) = ("d"(v hat(bold(θ))))
      /("d"t) = v ("d"hat(bold(θ)))/("d"t) $

    We know that

    $ ("d"hat(bold(θ)))/("d"t) = ("d"hat(bold(θ)))/("d"s) v = - v/R hat(ub(r)) $

    Therefore:

    $ ub(a)_c = v(- v/R hat(ub(r))) = - v^2/R hat(ub(r)) $
  """#
  related: [
    "concept/angular-speed"
  ]
}