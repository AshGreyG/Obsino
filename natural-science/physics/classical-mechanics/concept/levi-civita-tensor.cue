package concept

levi_civita_tensor: {
  content: #"""
    In a Euclidean space with dimension $n$, the Levi-Civita tensor $ϵ$ is a
    completely antisymmetric tensor with rank $n$. A parallepiped whose edges
    are $n$ vectors $ub(A), ub(B), ⋯, ub(F)$ is said to have the *volume*:

    $ "volume" := ϵ(ub(A), ub(B), ⋯, ub(F)) $

    Notice that this volume can be positive or negative, and if we exchange the
    order of the parallelepiped's legs, the volume's sign changes: $ϵ(ub(B),
    ub(A), ⋯, ub(F)) = -ϵ(ub(A), ub(B), ⋯, ub(F))$ by antisymmetric of
    $ϵ$.

    In a right-handed orthonormal basis of Euclidean 3-space, the only nonzero
    components of $ϵ$ is

    $ ϵ_(a b c) = cases(
      +1 & "if" (a, b, c) "is an even permutation of" (1, 2, 3),
      -1 & "if" (a, b, c) "is an odd  permutation of" (1, 2, 3),
      0  & "if" (a, b, c) "are not all different"
    ) $

    (*Even permutation* means that the permutation $(a,b,c)$ can swap even times
    to obtain $(1,2,3)$, so does *odd permutation*) For example, $ϵ_(1 2 3) =
    ϵ_(2 3 1) = ϵ_(3 1 2) = +1$ and $ϵ_(1 3 2) = ϵ_(3 2 1) = ϵ_(2 1 3) = -1$.
    And in a left-handed orthonormal basis, the signs of these components are
    reversed.
  """#
}