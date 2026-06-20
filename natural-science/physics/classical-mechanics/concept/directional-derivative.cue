package concept

directional_derivative: {
  content: #"""
    Consider a tensor field $sans("T")(cal(P))$ in Euclidean 3-space and a vector
    $ub(A)$. We define the *directional derivative* of $sans("T")$ along $ub(A)$
    by the obvious limiting procedure:

    $ ∇_(ub(A))sans("T") := lim_(ϵ→0) 1/ϵ [sans("T")(ub(x)_cal(P) + ϵ ub(A))
      - sans("T")(ub(x)_cal(P))] $

    In this definition, the quantity in square brackets is simply the difference
    between two linear functions of vectors (two tensors), so the quantity on the
    left-hand side is also a tensor with the same rank as $sans("T")$:

    $ "rank"(∇_(ub(A))sans("T")) = "rank"(sans("T")) $
  """#
  related: [
    "concept/gradient",
    "theorem/leibniz-rule-of-directional-derivative"
  ]
}