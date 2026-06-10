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
    - *Event* is a subset (one or more outcomes) of the sample space.
      - An *elementary event* is an event that contains *exactly one outcome*
        from the sample space. It cannot be broken down into smaller events.
      - A *certain event* is an event that always occur every time the random 
        experiment is performed. It contains *all possible outcomes* of the sample
        space. The certain event is exactly the sample space $Ω$ itself.
      - An *impossible event* is an event that *never occurs* when the random
        experiment is performed. It contains *no outcomes* from the sample space
        It's often denoted as $∅$.
  """#
}