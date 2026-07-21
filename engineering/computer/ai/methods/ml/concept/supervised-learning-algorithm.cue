package concept

supervised_learning_algorithm: {
  content: #"""
    *Supervised learning algorithms* experience a dataset containing features,
    but each example is *also associated with a label or target*. It involves
    observing several examples of a random vector $ub(x)$ and an associated value
    or vector $ub(y)$, and learning to predict $ub(y)$ fromm $x$, usually
    estimating $p(ub(y)|ub(x))$.

    The term *supervised learning* originates from the view of the target $ub(y)$
    being provided by an instructor or teacher who shows the machine learning
    system what to do.
  """#
  related: [
    "concept/learning-algorithm"
  ]
}