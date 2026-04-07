package desire

import "formal-science.cs.algorithm/concept"

divide_and_conquer_complexity: {
  from: concept.divide_and_conquer.content
  content: """
    All divide-and-conquer algorithm has a common format of recurrence relation
    for the time complexity:

    $ T(n) = cases(
      1 & "if" n = 1,
      display(a ⋅ T(n / b) + f(n)) & "if" n = b^i
    ) $

    how can we obtain the time complexity of a divide-and-conquer algorithm?
  """
}