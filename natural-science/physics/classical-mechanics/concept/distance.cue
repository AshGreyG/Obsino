package concept

distance: {
  content: #"""
    *Distance* (path length) is a *scalar* (a real number) representing the total
    length of the actual trajectory traced by the particle. Let the trajectory
    be a curve $cal("P")(λ)$ with parameter $λ$ from $λ_1$ to $λ_2$. At each point
    the tangent vector is $"d"ub(x)\/"d"λ$. The distance is defined as:

    $ s := ∫_(λ_1)^(λ_2) abs(("d"ub(x))/("d"λ)) "d"λ $

    Where $|⋅|$ is the length introduced by the inner product $sans("g")(⋅,⋅)$:
    $|ub(A)| = sqrt(ub(A) ⋅ ub(A))$. Distance is not a vector, it is a scalar
    field, it is always non-negative and path-dependent, unlike displacement.
  """#
  related: [
    "concept/inner-product"
  ]
}