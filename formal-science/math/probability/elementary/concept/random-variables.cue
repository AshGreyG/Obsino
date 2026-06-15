package concept

random_variables: {
  content: #"""
    A *random variable* is a function that assigns a numerical value to each
    outcome in the sample space of a random experiment. Let $(Ω,cal("F"),P)$ be
    a probability space. A *random variable* is a function:

    $ X: Ω |-> ℝ $

    such that for every real number $x$, the set ${ω ∈ Ω: X(ω) ≤ x}$ is an event
    that belongs to $cal("F")$. This measurability ensures that we can assign
    probabilities to statements about $X$, such as $P(X ≤ x)$.

    A random variable is *continuous* if its set of possible values is an interval
    or union of intervals of real numbers
  """#
}