package concept

import "formal-science.cs.algorithm/phenomenon"

asymptotic_notation: {
  content: #"""
    The function to which we apply asymptotic notation will usually characterize
    the running times of algorithms.

    - $θ$-(Theta)-notation: 

      $ Θ(g(n)) := {f | ∃ c₁, c₂ ∈ ℝ, n₀ ∈ ℕ, ∀ n > n₀,
        0 < c₁g(n) ≤ f(n) ≤ c₂g(n)} $

    - $O$-notation:

      $ O(g(n)) := {f | ∃ c₁ ∈ ℝ, n₀ ∈ ℕ, ∀ n > n₀,
        0 < f(n) ≤ c₁g(n)} $

    - $Ω$-(Omega)-notation:

      $ Ω(g(n)) := {f | ∃ c₁ ∈ ℝ, n₀ ∈ ℕ, ∀ n > n₀,
        0 < c₁g(n) ≤ f(n)} $

    - $o$-notation:

      $ o(g(n)) := {f | lim_(n → +∞) f(n)/g(n) = 0} $

    - $ω$-notation:

      $ ω(g(n)) := {f | lim_(n → +∞) f(n)/g(n) = +∞} $
    """#
  from: [
    phenomenon.input_growth.content,
  ]
}
