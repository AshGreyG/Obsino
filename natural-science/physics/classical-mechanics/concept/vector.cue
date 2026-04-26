package concept

vector: {
  content: #"""
    A *vector* in Euclidean 3-space can be thought of as a straight arrow (or
    more formally a *directed line segment*) that reaches from one point, $cal("P")$
    to another $cal("Q")$ such as $Δ ub(x)$. It can be thought of a
    direction at $cal("P")$ and a number, the vector's length. Sometimes we shall
    select one point $cal("O")$ in 3-space as an origin and identify all other
    points, say, $cal("Q")$ and $cal("P")$ by their separations $ub(x)_
    cal("Q")$ and $ub(x)_cal("P")$.

    We attach the tail of a second vector to the head of the first vector and
    then construct the sum as the vector from the tail of the first to the head
    of the second, or vice versa.

    We can also rotate vectors about their tails by pointing them along a
    different direction in space. Such a rotation can be specified by two angles.
    The space that is defined by all possible changes of length and direction
    at a point is called that point's *tangent space*.

    We can also construct a path through space by laying down a sequence of
    infinitesimal $upright(d)ub(x)$ s tail to head, one after another.
    The resulting path is a *curve* to which these $upright(d)ub(x)$ s
    are tangent. The curve can be denoted by $cal("P")(λ)$, with parameter $λ$
    along the curve and $cal("P")(λ)$ from the arbitrary origin $cal("O")$.

    For example:

    - If the curve followed is that of a particle, and the parameter $λ$ is time
      $t$, then we have defined the *velocity* $ub(v) := upright(d
      bold(x))\/upright(d)t$. In effect we are multiplying the vector $upright(d
      bold(x))$ by the scalar $1\/upright(d)t$ and taking the limit. Performing
      this operation at every point $cal("P")$ in the space occupied by a fluid
      defines the fluid's *velocity field* $ub(v)(ub(x))$;

    - Similarly the difference $upright(d) ub(v)$ of two velocity measurements
      during a time interval $upright(d)t$, multiplied by $1\/upright(d)t$,
      generates the particle's *acceleration*.
  """#
}