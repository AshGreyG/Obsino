package concept

gradient_descent: {
  content: #"""
    Even in cases where we cannot solve the models analytically, we can still often
    train models effectively in practice. The key technique for optimizing nearly
    every deep learning model, consists of iteratively reducing the error by
    updating the parameters *in the direction that incrementally lowers the loss
    function*. This algorithm is called *gradient descent*.

    The most naive application of gradient descent consists of taking the derivative
    of the loss function. In practice, this can be *extremely slow*: we must pass
    over the entire dataset before making a single update.

    The other extreme is to consider only *a single example* at a time and take
    update steps based on one observation at a time. The resulting algorithm,
    *stochastic gradient descent* (SGD) can be effective but still has drawbacks.
    One problem arises from the fact that processors are a lot faster *multiplying
    and adding numbers* than they are at *moving data from main memory to processor
    cache*. And another reason is that it is *more efficient to perform a matrix
    -vector multiplication than a corresponding number of vector-vector operations*.
    This means that it can take a lot longer to process one sample at a time
    compared to a full batch.

    The solution to both problems it to pick an intermediate strategy: rather than
    taking a full batch or a only single sample at a time, we take a *mini-batch*
    of observations. A number between 32 and 256, a power of 2 is a good start of
    batch size. This algorithm is called *mini-batch stochastic gradient descent*.

    In each iteration $t$, we first randomly sample a mini-batch $cal(B)_t$
    consisting of a fixed number $|cal(B)|$ of training examples. We then
    compute the derivative / gradient of the average loss on the mini-batch with
    respect to the model parameters. Finally we multiply the gradient by a
    predetermined small positive value $η$, called the *learning rate*, and
    subtract the resulting term from the current parameter values:

    $ (ub(w),b) ← (ub(w),b) - η/(|cal(B)|) ∑_(i ∈ cal(B)_t)∂_(ub(w),b) L^((i))
      (ub(w),b) $

    where
      - $ub(w)$ is the weights and $b$ is the bias

    Frequently mini-batch size and learning rate are *user-defined*, such tunable
    parameters that are not updated in the training loop are called *hyperparameter*s.
  """#
}