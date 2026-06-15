package concept

laplacian: {
  content: #"""
    By taking the double gradient and then contracting on the two gradient slots
    we obtain, from any tensor field $sans("T")$, a new tensor field with the
    the same rank:

    $ ∇^2sans("T") := (∇⋅∇)sans("T") := ∇⋅(∇sans("T")), space.en T_(a b c ; j j) $

    All indices following a semicolon represent gradients or partial derivatives:

    $ T_(a b c ; j j) := T_(a b c ; j ; j) := T_(a b c , j k)
      := (∂^2 T_(a b c)) / (∂ x_j ∂ x_k) $

    The operator $∇^2$ is called the *laplacian*.
  """#
}