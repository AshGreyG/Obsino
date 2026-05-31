package concept

galilean_transformation: {
  content: #"""
    In Newtonian spacetime, consider two reference frame $S$ and $S'$:

    - $S$ is an inertial frame, with origin $cal("O")$ and basis vector ${ub(e)_1,
      ub(e)_2,ub(e)_3}$;
    - $S'$ is in *uniform translational motion* relative $S$ with constant
      velocity $ub(v)_r$ with no rotation

    At any time $t$, the position of the origin $cal("O")'$ of $S'$ relative to
    $cal("O")$ is:

    $ ub(x)_(cal("O")')(t) = ub(x)_(cal("O")')(0) + ub(v)_r t $

    where $ub(v)$ is a constant vector (magnitude and direction do not change).

    Let a particle be at point $cal("P")$, its position vector in $S$ is
    $ub(x)(t) = arrow(cal("OP"))(t)$ and in $S'$ it is $ub(x)'(t) = arrow(cal("O")'
    cal("P"))(t)$. By vector addition we know that:
    
    $ ub(x)(t) & = ub(x)_(cal("O")')(t) + ub(x)'(t) \
      & = ub(x)_(cal("O")')(0) + ub(v)_r t + ub(x)'(t) $
    
    This is the geometric form of the *Galilean position transformation*.

    Differentiate the position transformation with respect to time:

    $ ("d"ub(x))/("d"t) & = ("d"ub(x)_(cal("O")'))/("d"t) + ("d"ub(x)')/("d"t) \
      & = "d"/("d"t)(ub(x)_(cal("O")'))(0) + ub(v)_r t) + ("d"ub(x)')/("d"t) \
      & = ub(v)_r + ("d"ub(x)')/("d"t) $

    Then:

    $ ub(v) = ub(v)_r + ub(v)' $

    This is the geometric form of the *Galilean velocity transformation*.

    Again we can differentiate the velocity transformation with respect to time:

    $ ("d"ub(v))/("d"t) = ("d"ub(v)_r)/("d"t) + ("d"ub(v)')/("d"t) $

    Since $ub(v)_r$ is a constant vector so we obtain $ub(a) = ub(a)'$
  """#
}
