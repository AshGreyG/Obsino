package concept

// although it's called xx-theorem, it isn't like the theorem in mathematics actually
no_free_lunch_theorem: {
  content: #"""
    In part, machine learning avoids this problem by offering only probabilistic
    rules, rather than the entirely certain rules used in purely logical reasoning.
    Machine learning promises to find rules that are *probably* correct about
    *most* members of the set they concern.

    The *no free lunch theorem* for machine learning states that, averaged over
    all possible data generating distributions, *every classification algorithm
    has the same error rate when classifying previously unobserved points*.

    Fortunately, these results hold only when we average over *all possible* data
    generating distributions, if we make assumptions about the kinds of probability
    distributions we encounter in real-world applications, then we can design
    learning algorithms that perform well on these distributions.
  """#
}