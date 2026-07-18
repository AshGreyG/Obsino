package specific

linear_regression: {
  content: """
    *Linear regression* solves a regression problem. In other words, the goal
    is to build a system that can take a vector $bold(x) ∈ ℝ^n$ as input and
    predict the value of a scalar $y ∈ ℝ$ as its output. In the case of linear
    regression, the output is a linear function of the input. Let $hat(y)$ be
    the value that our model predicts $y$ should take on, we define the output
    to be

    $ hat(y) = bold(w)^⊤ bold(x) $

    where $bold(w) ∈ ℝ^n$ is a vector of *parameters*.

    Parameters are values that control the behavior of the system. In this case,
    $w_i$ is the coefficient that we multiply by feature $x_i$ before summing up
    the contributions from all the features. We can think of $bold(w)$ as a set
    of *weights* that determine how each feature affects the prediction.

    We thus have a definition of our task $T$: to predict $y$ from $bold(x)$ by
    outputting $hat(y) = bold(w)^⊤ bold(x)$.

    We can define the performance measure $P$: suppose we have a design matrix
    of $m$ example inputs that we will not use for training only for evaluating
    how well the model performs. We also have a vector of regression targets
    providing the correct value of $y$ for each of these examples. Because this
    dataset will only be used for evaluation, we call it the *test set*. We
    refer to the design matrix of inputs as $bold(X)^(("test"))$ and the vector
    of regression targets as $bold(y)^(("test"))$.

    One way of measuring the performance of the model is to compute the *mean
    squared error* of the model on the test set. If $bold(hat(y))^(("test"))$
    gives the predictions of the model on the test set, then the mean squared
    error is given by

    $ sans("MSE")_"test" = 1/m ∑_i (bold(hat(y))^(("test")) - bold(y)^(("test")))_i^2 $

    To make a machine learning algorithm, we need to design an algorithm that
    will improve the weights $bold(w)$ in a way that reduces $sans("MSE")_"test"$
    when the algorithm is allowed to gain experience by observing a training
    set $(bold(X)^(("train")), bold(y)^(("train")))$. One intuitive way of
    doing this is just to minimize the mean squared error on the training set
    $sans("MSE")_"train"$.

    To minimize $sans("MSE")_"train"$ we can simply solve for where its gradient
    is $ub(0)$:

    $ & ∇_bold(w) sans("MSE")_"train" = ub(0) \\
      & => ∇_bold(w) 1/m ‖hat(bold(y))^(("train")) - bold(y)^(("train"))‖_2^2 = ub(0) \\
      & => 1/m ∇_bold(w) ‖bold(X)^(("train")) bold(w) - bold(y)^(("train"))‖_2^2 = ub(0) \\
      & => ∇_bold(w) (bold(X)^(("train")) bold(w) - bold(y)^(("train")))^⊤
        (bold(X)^(("train")) bold(w) - bold(y)^(("train"))) = ub(0) \\
      & => ∇_bold(w) (bold(w)^⊤ bold(X)^(("train")⊤) bold(w) -
        2 bold(w)^⊤ bold(X)^(("train")⊤) bold(y)^(("train")) +
        bold(y)^(("train")⊤) bold(y)^(("train"))) = ub(0) \\
      & => 2 bold(X)^(("train")⊤) bold(X)^(("train"))bold(w) -
        2 bold(X)^(("train")⊤)bold(y)^(("train")) = ub(0) \\
      & => bold(w) = (bold(X)^(("train")⊤) bold(X)^(("train")))^(-1)
        bold(X)^(("train")⊤)bold(y)^(("train")) $

    where
    - $‖⋅‖_2$ represents the $L_2$ norm, which is Euclidean norm;
    - $bold(w)^⊤ bold(X)^(("train")⊤) bold(y)^(("train"))$ and
      $bold(y)^(("train")⊤) bold(w) bold(X)^(("train"))$ are both scalars;
    - The derivation of a *scalar $L$* with respect to a *vector $ub(w)$* is
      *itself a vector*. The $i$-th component of this resulting vector is simply
      the *partial derivation* of $L$ with respect to the $i$-th component of
      $ub(w)$, denoted at $w_i$:

      $ (∇_(ub(w)) L)_i = (∂L)/(∂w_i) $

      Therefore when we write the equation $∇_(ub(w))L = 0$, we are not making
      a single algebraic statement. Instead, we are asserting a system of
      conditions: *every single partial derivative* with respect to every $w_i$
      must equal $0$ simultaneously.

      $ ∇_(ub(w))(bold(a)^⊤ ub(w)) = ∇_(ub(w))(ub(w)^⊤ bold(a)) = bold(a) $

      $ ∇_(ub(w))(ub(w)^⊤ ub(A) ub(w)) = 2ub(A)ub(w) $

      where $ub(A)$ is a symmetric matrix.

    - Sometimes we use $ub(w)$ and $bold(w)$ together, we call $bold(w)$ a variable.

    The system of equations whose solution is given by the above formula is known
    as the *normal equations*. It is worth noting that the term *linear regression*
    if often used to refer to a slightly more sophisticated model with one
    additional parameter:

    $ hat(y) = bold(w)^⊤ bold(x) + b $

    so the mapping from parameters to predictions is still a linear function but
    the mapping from features to predictions is now an *affine function*. To
    solve this regression problem, we can use the model with only weights but
    argument $bold(x)$ with an extra entry that is always set to $1$:

    $ tilde(bold(x)) = mat(1; bold(x)) => tilde(ub(w)) = mat(b; ub(w)), space.en
      hat(y) = tilde(ub(w))^⊤ tilde(bold(x)) $

    The weight corresponding to the extra $1$ entry plays the role of the bias
    parameter. The intercept term $b$ is often called the *bias* parameter of
    the affine transformation

    \(figure_part_linear_regression)
  """
  figure_part_linear_regression: #"""
    #let linear-regression = "assets/typst/linear-regression.typ"
    #eval(
      str(read(linear-regression)),
      mode: "markup"
    )
  """#
  external_related: [
    "formal-science.math.analysis.calculus"
  ]
}