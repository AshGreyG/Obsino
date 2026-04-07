package principle

import "formal-science.cs.algorithm/desire"

substitution_method: {
  content: """
    The principle of substitution method is guess. For example, we can guess
    for maximum subarray problem. From the solution we known the recurrence
    relation is:

    $ T(n) & = 2T(n / 2) + Θ(n) + Θ(1) + Θ(1) \\
      & = 2T(n / 2) + Θ(n) $

    We can guess $T(n) = O(n log n)$, that means $T(n) ≤ c n log n$ for a constant
    $c$, then

    $ T(n) & ≤ 2 (c floor(n / 2) log floor(n / 2)) + n \\
      & ≤ c n log floor(n / 2) + n \\
      & ≤ c n (log n - log 2) + n \\
      & = c n log n + (1 - c log 2) n \\
      & ≤ c n log n $

    so it holds for $c > 1$.
  """
  from: [
    desire.divide_and_conquer_complexity.content
  ]
}