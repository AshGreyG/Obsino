package concept

uniformly_accelerated_motion: {
  content: #"""
    Uniformly accelerated motion means the particle's acceleration vector $ub(a)$
    is *a constant vector* (its magnitude and direction do not change with time):

    $ ub(a)(t) = ("d"ub(v))/("d"t) = "constant vector" $

    Since $ub(a)$ is constant, integrate once with respect to time to obtain
    velocity vector:

    $ ub(v)(t) = ub(v)_0 + ub(a)t $

    where $ub(v)_0 = ub(v)(0)$ is the initial velocity vector. We can integrate
    again to obtain the position vector:

    $ ub(x)(t) = ub(x)_0 + ub(v)_0t + 1/2 ub(a)t^2 $

    where $ub(x)_0 = ub(x)(0)$ is the initial position vector.

    *Speed* is the magnitude of the velocity vector:

    $ v(t) := abs(ub(v)(t)) = sqrt(ub(v)(t)⋅ub(v)(t)) $

    *Path length* (distance traveled) from $t=0$ to $t=T$ is:

    $ s(T) := ∫_0^T v(t)"d"t = ∫_0^T sqrt(ub(v)(t) ⋅ ub(v)(t)) "d"t $

    If $ub(a)$ is parallel to $ub(v)_0$, acceleration and initial velocity are in
    the same or opposite direction, the motion is along a straight line. In this
    case, we can choose a basis vector $ub(e)_1$ along the direction of motion,
    giving:

    $ ub(v)(t) = (v_0 + a t)ub(e)_1, space.en
      ub(x)(t) = ub(x)_0 + (v_0t + 1/2 a t^2)ub(e)_1 $

    where $v_0 = ±abs(ub(v)_0)$ and $a = ±abs(ub(a))$.

    The definition $ub(a) = "constant vector"$ is a *geometric statement*
    (independent of coordinates). When transforming from one inertial frame to
    another uniformly moving reference frame, acceleration remains unchanged
    (*Galilean invariance*). When transforming to a non-inertial frame (e.g.
    an accelerating reference frame), the apparent acceleration is no longer
    constant.
  """#
}