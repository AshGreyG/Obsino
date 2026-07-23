package concept

non_parametric_model: {
  content: """
    Parametric models, such as linear regression, learn a function described
    by a parameter vector whose size if finite and fixed before any data is
    observed. *Non-parametric models* have no such limitations.

    Sometimes, non-parametric models are just theoretical abstractions, such as
    an algorithm that searches over all possible probability distributions, that
    cannot be implemented in practice. However we can also design practical
    non-parametric models by *making their complexity a function of the training
    set size*. Such as nearest neighbor regression.

    The ideal model is an oracle that simply knows the true probability distribution
    that generates the data. Even such a model will still incur some error on
    many problems, because they may still be some noise in the distribution. The
    error incurred by an oracle making predictions from the true distribution
    $p(bold(x),y)$ is called the *Bayes error*.

    Training and generalization error vary as the size of the training set varies.
    Expected generalization error can never increase as the number of training
    examples increases.
    - For non-parametric models, more data yields better generalization until the
      best possible error is achieved;
    - For any fixed parametric model with less than optimal capacity will asymptote
      to an error value that exceeds the Bayes error.

    \(figure_part_error_against_training_set_size)
  """
  figure_part_error_against_training_set_size: #"""
    #let error = "assets/typst/polynomial-generalization.typ"
    #eval(
      str(read(error)),
      mode: "markup"
    )
  """#
}