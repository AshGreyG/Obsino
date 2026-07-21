package concept

learning_algorithm: {
  content: """
    A computer program is said to learn from experience $E$ with respect to some
    class of tasks $T$ and performance measure $P$, if its performance at tasks
    in $T$, as measured by $P$, improves with experience $E$.

    === Learning Algorithm: Task $T$

    Machine learning tasks are usually described in terms of how the machine
    learning system should process an *example*. An example is a collection of
    *features* that have been quantitatively measured from some object or event
    that we want the machine learning system to process. *We typically represent
    an example as a vector $bold(x) ∈ ℝ^n$* where each entry $x_i$ of the vector
    is another feature.

    For example, the features of an image are usually the values of the pixels
    in the image.

    - *Classification*: computer program is asked to specify which of $k$
      categories some input belongs to. The learning algorithm is usually asked
      to produce a function: $f : ℝ^n → {1,⋯,k}$. When $y = f(bold(x))$, the
      model assigns an input described by vector $bold(x)$ to a category identified
      by numeric code $y$.

      The other variants of the classification task, $f$ is designed to output
      a *probability distribution* over classes;

    - *Classification with missing inputs*: When some of the inputs may be missing,
      rather than providing a single classification function, the learning
      algorithm must learn *a set of functions*. *Each function corresponds to
      classifying $bold(x)$* with a different subset of its inputs missing;

    - *Regression*: computer program is asked to predict a numerical data value
      given some input. The learning algorithm is asked to output a function
      $f : ℝ^n → ℝ$. The format output is not discrete but continuous ...

    === Learning Algorithm: The Performance Measure $P$

    For tasks such as classification, we often measure the *accuracy* of the model.
    Accuracy is just the proportion of examples for which the model produces the
    correct output. We can also obtain equivalent information by measuring the
    *error rate* or expected *0-1 loss*.

    Usually we are interested in how well the machine learning algorithm performs
    on data that it has not seen before. We therefore evaluate these performance
    measures using a *test set* of data that is separate from the data used for
    training the machine learning system.

    === Learning Algorithm: The Experience $E$

    Most of the learning algorithm is allowed to experience an entire *dataset*.
    And there are two kinds of learning algorithm:
    #link(<concept-unsupervised-learning-algorithm>)[*unsupervised*] and
    #link(<concept-supervised-learning-algorithm>)[*supervised*].

    Unsupervised and supervised learning are not formally defined terms and lines
    between them are often blurred. The chain rule of probability states that for
    a vector $ub(x) ∈ ℝ^n$, the joint distribution can be decomposed as:

    $ p(ub(x)) = ∏_(i=1)^n p(upright(x)_i|upright(x)_1,⋯,upright(x)_(i-1)) $

    This decomposition means that we can solve the ostensibly unsupervised problem
    of modeling $p(ub(x)$ by splitting it into $n$ supervised learning problems.
    Alternatively we can solve the supervised learning problem of learning
    $p(y|ub(x))$ by using traditional unsupervised learning technologies to learn
    the disjoint distribution $p(ub(x),y)$ and inferring

    $ p(y|ub(x)) = p(ub(x),y)/(∑_(y')p(ub(x),y')) $

    Traditionally, people refer to regression, classification and structured
    output problems as supervised learning. Density estimation in support of
    other tasks is usually considered unsupervised learning.

    One command way of describing a dataset is with a *design matrix*. A design
    matrix is a matrix containing a different example in each row. Each column
    of the matrix corresponds to a different feature.
  """
  related: [
    "concept/unsupervised-learning-algorithm",
    "concept/supervised-learning-algorithm"
  ]
}