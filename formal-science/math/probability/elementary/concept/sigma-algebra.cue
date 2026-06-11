package concept

sigma_algebra: {
  content: #"""
    Let $Ω$ be a sample space which is a non-empty set. A *$σ$-algebra* usually
    denoted as $cal("F")$, is a non-empty collection of subsets of $Ω$ that
    satisfies three axioms:

    1. $Ω ∈ cal("F")$
    2. If $A ∈ cal("F")$, then its complementary event also in $σ$-algebra,
      $overline(A) ∈ cal("F")$
    3. If $A_1, A_2, A_3, ⋯ ∈ cal("F")$, then $⋃_(i=1)^∞ A_i ∈ cal("F")$

    So $σ$-algebra contains the sample space, and is closed under complementation,
    and is also closed under countable unions.

    The pair $(Ω, cal("F"))$ is called a *measurable space*. The $σ$-algebra
    $cal("F")$ is often called the *event field* because it is the collection of
    all subsets of $Ω$ that are considered *events*.

    Notice $σ$-algebra is not the power of sample space, it doesn't necessarily
    contain all subsets of sample space, that is:

    $ cal("F") ≠ 2^Ω $

    The minimal $σ$-algebra is ${∅, Ω}$. It is the smallest possible $σ$-algebra
    on any sample space.
  """#
  related: [
    "concept/sample-space",
    "concept/complementary-event",
    "concept/countable-infinite-union",
    "desire/assign-probability-to-uncountable"
  ]
}