package concept

axial_vector: {
  content: #"""
    Axial vectors do not directly correspond to directed line segments. Instead,
    they correspond to *oriented rotations* or *oriented areas*. They arise from
    the cross product of two polar vectors.

    Geometric examples: angular velocity $bold(ω)$, angular momentum $ub(L)$,
    torque $bold(τ)$, magnetic field $ub(B)$, vorticity $∇ × ub(v)$. For example,
    under parity transformation, their behaviors are like:

    $ cal("P"): bold(ω) |-> bold(ω) $

    Let $ub(A)$ and $ub(B)$ be two polar vectors, under parity transformation:

    $ cal("P"): ub(A) |-> -ub(A), space.en ub(B) |-> -ub(B) $

    Their cross product $ub(C) = ub(A) × ub(B)$ transforms as:

    $ cal("P"): ub(C) |-> (-ub(A)) × (-ub(B)) = (+1)(ub(A) × ub(B)) = ub(C) $

    Because the two minus signs multiply to a plus sign. $ub(C)$ does not change
    sign. Thus, the cross product maps two polar vectors and another into an
    *axial vector*.

    For mirror, the resolution is that *the right-hand rule becomes a left-hand
    rule in the mirror*. If we insist on using the right-hand rule to define
    $bold(ω)$, then indeed the $bold(ω)$ vector points the same way, but the
    perceived "rotation direction" appears opposite. This is because the rule
    we use to define direction is itself not parity-invariant.
  """#
  related: [
    "concept/angular-speed",
    "concept/angular-momentum",
    "concept/parity-transformation",
    "concept/axial-vector",
    "concept/vector"
  ]
}