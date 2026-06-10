package concept

sample_space: {
  content: #"""
    The sample space of a random experiment is the set of all possible outcomes
    of the experiment. It is usually denoted by the letter $Ω$.

    1. *Exhaustive*: it includes every possible outcome
    2. *Mutually exclusive*: no two outcomes can occur at the same time/trial
    3. *At the most basic level*: outcomes are usually indivisible (atomic) for
      the given experiment

    There are different types of sample spaces:

    #align(center)[
      #table(
        columns: 3,
        align: (left, left, left),
        [Type], [Description], [Example],

        [*Finite*],
        [Limited number of outcomes],
        [🎲 6 outcomes],

        [*Countably Infinite*],
        [Infinite but can be listed],
        [Number of coin tosses until first head: ${1,2,3,⋯}$],

        [*Uncountably Infinite*],
        [Continuous range],
        [Height of a randomly chosen person (it can be any real number between
          a range)]
      )
    ]

    - *Outcome* is one single element of the sample space
    - *Event* is a subset (one or more outcomes) of the sample space
  """#
}