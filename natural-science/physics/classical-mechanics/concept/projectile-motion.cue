package concept

projectile_motion: {
  content: #"""
    *Projectile motion* is the motion of a particle in a uniform gravitational
    field, where the *acceleration vector $ub(a)$ is a constant vector*, directed
    vertically downward with magnitude $g$:

    $ ub(a) = -g hat(ub(z)) $

    where the $hat(ub(z))$ is the upward unit vertical basis vector, and the minus
    sign indicated downward acceleration.

    Since $ub(a)$ is constant, integrate once with respect to time to obtain
    velocity:

    $ ub(v)(t) = ub(v)_0 + ub(a)t = ub(v)_0 - g hat(ub(z)) t $

    where $ub(v)_0 = ub(v)(0)$ is the initial velocity vector. Integrate again to
    obtain the position vector:

    $ ub(x)(t) = ub(x)_0 + ub(v)_0 t + 1/2 ub(a)t^2
      = ub(x)_0 + ub(v)_0 t - 1/2 g hat(ub(z)) t^2 $

    where $ub(x)_0 = ub(x)(0)$ is the initial position vector.

    The initial velocity $ub(v)_0$ can be decomposed into horizontal and vertical
    components, choose an orthonormal basis:

    - $hat(ub(x))$: horizontal direction (e.g. the direction of projection);
    - $hat(ub(y))$: another horizontal direction (perpendicular to $hat(ub(x))$);
    - $hat(ub(z))$: vertically upward.

    Then

    $ ub(v)_0 = v_(0 x)hat(ub(x)) + v_(0 y)hat(ub(y)) + v_(0 z)hat(ub(z)) $

    where $v_(0 x),v_(0 y),v_(0 z)$ are scalar components (according to $A_j =
    ub(A) ⋅ ub(e)_j$). In projectile motion, we usually choose $hat(ub(x))$ along
    the horizontal direction of projection, $hat(ub(z))$ vertically upward, and
    set $v_(0 y) = 0$, then:

    $ ub(v)_0 = v_0 cos θ hat(ub(x)) + v_0 sin θ hat(ub(z)) $

    where $v_0 = abs(ub(v)_0)$ is the initial speed and $θ$ is the launch angle
    (the angle between $hat(ub(x))$ and $ub(v)_0$).

    Substitute the decomposed initial velocity into the velocity and position
    formulas:

    - Velocity:

    $ ub(v)(t) = (v_0 cos θ)hat(ub(x)) + (v_0 sin θ - g t)hat(ub(z)) $

    - Position:

    $ ub(x)(t) = ub(x)_0 + (v_0 cos θ t)hat(ub(x)) + (v_0 sin θ t - 1/2 g t^2)
      hat(ub(z)) $

    This is a vector equation that describes the full geometric trajectory of
    the projectile motion.
  """#
}