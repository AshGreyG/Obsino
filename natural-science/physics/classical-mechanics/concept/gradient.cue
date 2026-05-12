package concept

gradient: {
  content: #"""
    Correspondingly, if $sans("T")$ has rank $n$, then there is another tensor
    field denoted $∇sans("T")$ with rank $n + 1$ such that

    $ ∇_(ub(A))sans("T") = ∇sans("T")(\_,⋯,\_, ub(A)) $

    Here on the right-hand side the first $n$ slots are left empty, and $ub(A)$
    is put into the last slot (called *differentiation slot*). The quantity
    $∇sans("T")$ is called the *gradient* of $sans("T")$.

    In slot-naming index notation, it is conventional to denote this gradient
    by $T_(a b c; d)$, where in general the number of indices preceding the
    semicolon is the rank of $sans("T")$. Using this notation, the directional
    derivative of $sans("T")$ along $ub(A)$ reads $T_(a b c; j)A_j$

    Because the components $g_(a b)$ of the metric tensor are constant in any
    Cartesian coordinate system guarantees that $g_(a b ; j) = 0$, the metric
    has vanishing gradient:

    $ ∇sans("g") = 0, space.en g_(a b ; j) = 0 $
  """#
  related: [
    "concept/directional-derivative"
  ]
}