package concept

angular_momentum: {
  concent: #"""
    For a particle of mass $n$, with position vector $ub(x)$ measured from a
    fixed reference point $cal("O")$ and momentum $ub(p) = m ub(v)$, the
    *angular momentum* of the particle about point $cal("O")$ is defined as

    $ ub(L) := ub(x) × ub(p) $

    - $ub(L)$ is an *axial vector* or pseudo vector;
    - The cross product $×$ is defined via the Levi-Civita tensor;
    - Magnitude of angular momentum: $L = |ub(L)| = |ub(x)||ub(p)|sin θ$, where
      $θ$ is the angle between $ub(x)$ and $ub(p)$;
    - Direction: perpendicular to the plane spanned by $ub(x)$ and $ub(p)$, given
      by the right-hand rule.

    For a system of $N$ particles, the total angular momentum is defined as the
    vector sum of the individual angular momenta:

    $ ub(L)_"total" := ∑_(i=1)^N ub(x)_i × ub(p)_i $
  """#
  related: [
    "concept/axial-vector",
    "concept/levi-civita-tensor"
  ]
}