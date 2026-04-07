@extern(embed)

package principle

import "formal-science.cs.algorithm/desire"

maximum_subarray_problem_solution: {
	content: """
    - Principle: suppose we want to find a maximum subarray of the subarray
      $A["low"..."high"]$, divide-and-conquer suggests that we divide the subarray
      into two subarrays of as equal size as possible. We can find the midpoint
      $"mid"$ and consider the subarrays $A["low".."mid"]$ and $A["mid".."right"]$

    - There are three possibilities:
      1. Maximum subarray is entirely inside the $A["low".."mid"]$, with
        $"low" ≤ i ≤ j ≤ "mid"$;
      2. Maximum subarray is entirely inside the $A["mid" + 1.."high"]$, with
        $"mid" ≤ i ≤ j ≤ "high"$;
      3. Crossing the midpoint, with $"low" ≤ i ≤ "mid" < j ≤ "high"$

        ```python
  \(code_find_max_crossing_subarray)
        ```

        this method is a $Θ(n)$ procedure, here $n = "high" - "low" + 1$;
      4. Because the maximum subarray must appear at the left or at the right or
        crossing the midpoint. We can use `find_max_crossing_subarray` to find
        candidate crossing maximum subarray. The left and the right candidate
        maximum subarray can be calculated recursively.

        ```python
  \(code_find_maximum_subarray)
        ```

    - We make the simplified assumptions that the original problem size is the
      power of $2$ so that all subproblem sizes are integers. We denote $T(n)$
      the running time of `find_maximum_subarray`.

      Because we spend $T(n\/2)$ time solving the subproblem and there are two
      subproblems, so for the recursive case:

      $ T(n) & = 2T(n / 2) + Θ(n) + Θ(1) + Θ(1) \\
          & = 2T(n / 2) + Θ(n) $
  """
	code_find_max_crossing_subarray: _ @embed(file=src/find_max_crossing_subarray.py,type=text)
	code_find_maximum_subarray:      _ @embed(file=src/find_maximum_subarray.py,type=text)
	from: [
		desire.maximum_subarray_problem.content,
	]
}
