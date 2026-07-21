package specific

softmax_regression: {
  content: """
    In general, classification problems do not come with natural orderings among
    the classes. Statisticians long ago invented a simple way to represent
    categorical data: the *one-hot encoding*. A one-hot encoding is a vector with
    as many components as we have categories. The component corresponding to a
    particular instance's category is set to 1 and all other components are set
    to 0.

    For example, if a label $y$ would be a three-dimensional vector, with
    $(1,0,0)$ corresponding to $o_1$, $(0,1,0)$ corresponding to $o_2$ and
    $(0,0,1)$ corresponding to $o_3$.

    We need to model with multiple outputs like:

    $ o_1 = x_1 w_(11) + x_2 w_(12) + x_3 w_(13) + x_4 w_(14) + b_1 \\
      o_2 = x_1 w_(21) + x_2 w_(22) + x_3 w_(23) + x_4 w_(24) + b_2 \\
      o_3 = x_1 w_(31) + x_2 w_(32) + x_3 w_(33) + x_4 w_(34) + b_3 $

    Just as in linear regression we use a single-layer neural network. And since
    the calculation of each output $o_1, o_2$ and $o_3$, depends on every input
    $x_1,x_2,x_3$ and $x_4$, the output layer can also be described as a
    *fully connected layer*.

    \(figure_part_fully_connected_layer)

    We need the output of softmax regression model in $[0,1]$, because we need
    to output the probability distribution on possible outputs. We need a
    *mechanism to squish the outputs*. Accomplish this goal and to ensure
    non-negativity is to use an *exponential function* $P(y = i) ∝ exp o_i$.
    This does indeed satisfy the requirement that
    - the conditional class probability increases with increasing $o_i$;
    - it is monotonic;
    - all probabilities are non-negative.

    We can transform these values so that they add up to $1$ by dividing each by
    their sum. This process is called *normalization*. Putting these two pieces
    together gives us the *softmax* function:

    $ hat(ub(y)) = "softmax"(ub(o)) space.en "where" space.en
      hat(y_i) = exp(o_i)/(∑_j exp(o_j)) $

    The softmax operation preserves the ordering among its arguments, we do not
    need to compute the softmax to determine which class has been assigned the
    hightest probability:

    $ argmax(j) hat(y_j) = argmax(j) o_j $

    To improve computational efficiency, we vectorize calculations in mini-batches
    of data. Assume that we are given a mini-batch $ub(X) ∈ ℝ^(n×d)$ of $n$
    examples with dimensionality $d$. Moreover assume that we have $q$ categories
    in the output. Then the weights satisfy $ub(W) ∈ ℝ^(d×q)$ and the bias
    satisfies $ub(b) ∈ ℝ^(1×q)$:

    $ ub(O) = ub(X)ub(W) + ub(b), space.en hat(ub(Y)) = "softmax"(ub(O)) $

    The softmax function gives us a vector $hat(ub(y))$, which we can interpret
    as the estimated conditional probability of each class, given any input $ub(x)$
    such as $hat(y_1) = P(y = o_1|ub(x))$

    $ P(ub(Y)|ub(X)) = ∏_(i=1)^n P(ub(y)^((i))|ub(x)^((i))) $

    Since we assume that each label is drawn independently from its respective
    distribution $P(ub(y)^((i))|ub(x)^((i)))$. Because the real label $ub(y)^((i))$
    it is in one-hot encoding, thus

    $ P(ub(y)^((i))|ub(x)^((i))) = ∏_(j=1)^q (hat(y)_j^((i)))^(y_j^((i)))
      = hat(y)_k^((i))  $

    where $k$ is the right predicted classification so that $y_k^((i))=1$ and
    $y_j^((i)) (j ≠ k) = 0$.

    Since maximizing the product of terms is hard and awkward, we take the
    *negative logarithm* to obtain the equivalent problem of minimizing the
    negative log-likelihood:

    $ -log P(ub(Y)|ub(X)) & = -log ∏_(i=1)^n∏_(j=1)^q (hat(y)_j^((i)))^(y_j^((i))) \\
      & = ∑_(i=1)^n∑_(j=1)^q -y_j^((i)) log(hat(y)_j^((i))) \\
      & = ∑_(i=1)^n L(ub(y)^((i)),hat(ub(y))^((i))) $

    where for any pair of label $ub(y)$ and model prediction $hat(ub(y))$ over
    $q$ classes, the loss function $L$ is

    $ L(ub(y)^((i)),hat(ub(y))^((i))) = ∑_(j=1)^q -y_j^((i)) log(hat(y)_j^((i))) $

    This loss function is often called *cross-entropy loss*. Since $ub(y)$ is a
    one-hot vector of length $q$, the sum over its coordinates $j$ vanishes for
    all but one term.
  """
  figure_part_fully_connected_layer: #"""
    #let fully-connected-layer = "assets/typst/fully-connected-layer.typ"
    #eval(
      str(read(fully-connected-layer)),
      mode: "markup"
    )
  """#
}