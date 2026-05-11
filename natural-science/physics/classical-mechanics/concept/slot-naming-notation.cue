package concept

slot_naming_notation: {
  content: #"""
    For a rank-2 tensor, we can name the first slot as `a` and the second slot
    as `b`, hence we can rewrite the tensor $sans("T")$ as $T_(a b)$.

    - Consider the rank-2 tensor $sans("F")(\_,\_)$, we define the $sans("G")(\_,\_)$
      to be same as $sans("F")(\_,\_)$, but with the slots interchanged, for any
      two vectors $ub(A)$ and $ub(B)$, it's true that $sans("G")(ub(B), ub(A))
      = sans("F")(ub(A), ub(B))$, using slot-naming notation we can rewrite it as
      $F_(a b) = G_(b a)$.

    - Another example: consider the contraction of the first and third slots of
      a third-rank tensor $sans("T")$, in any basis the components of
      $1\&3"contraction"(sans("T")) = T_(i j i)$
  """#
}