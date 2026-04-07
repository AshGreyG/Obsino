package desire

divide_and_conquer_complexity: {
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