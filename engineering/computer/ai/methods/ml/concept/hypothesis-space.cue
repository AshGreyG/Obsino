package concept

hypothesis_space: {
  content: """
    One way to control the capacity of a learning algorithm is by choosing its
    *hypothesis space*, the set of functions that the learning algorithm is allowed
    to select as being the solutions (for example the linear regression algorithm
    has the set of all linear functions of its input as its hypothesis space).

    Machine learning algorithms will generally perform best when their capacity
    is appropriate for the true complexity of the task they need to perform and
    the amount of training data they are provided with.

    Models with insufficient capacity are unable to solve complex tasks. Models
    with high capacity can solve complex tasks, but when their capacity is higher
    than needed to solve the present task they may overfit.

    \(figure_part_overfit_underfit)

    Capacity is not determined only by the choice of hypothesis space. The model
    or the hypothesis space specifies which family of functions the learning
    algorithm can choose from when varying the parameters in order to reduce a
    training objective. This is called the *representative capacity* of the
    model.
  """
  figure_part_overfit_underfit: #"""
    #let overfit-underfit = "assets/typst/overfit-underfit.typ"
    #eval(
      str(read(overfit-underfit)),
      mode: "markup"
    )
  """#
  related: [
    "concept/training-error",
  ]
}