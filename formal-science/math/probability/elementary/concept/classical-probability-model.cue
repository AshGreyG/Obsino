package concept

classical_probability_model: {
  content: #"""
    The *classical probability model*, also called the classical definition of
    probability applies when:

    1. The sample space $Ω$ is finite
    2. All outcomes are equally likely

    Under these assumptions, the probability of an event $A$ is:

    $ P(A) = (abs(A))/(abs(Ω)) $

    where $abs(A)$ denotes the number of elements in $A$.
  """#
  related: [
    "concept/geometric-probability-model"
  ]
}