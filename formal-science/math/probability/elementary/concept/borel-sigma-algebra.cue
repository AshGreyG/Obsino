package concept

borel_sigma_algebra: {
  content: #"""
    When the sample space is the entire real line $Ω = ℝ = (-∞, +∞)$, we cannot
    list all events one by one. Instead, we start from a simple collection of sets
    and repeatedly extend it using the axioms of $σ$-algebra (closure under
    complements, countable unions and countable intersections).

    The result is called the *Borel $σ$-algebra*, and its elements are called
    *Borel sets* or *measurable sets*.

    1. *Start with the collection of half-lines*:

      We begin with the *basic collection* of all left-infinite half-lines:

      $ cal("F")_0 = {(-∞, x] | -∞ < x < +∞} $

    2. *Extend to half-open intervals*:

      Using the properties of a $σ$-algebra (specially, closure under complements
      and differences), we can form *half-open intervals*:

      $ [a, b) = (-∞, b) - (-∞, a) $

      where $a$, $b$ are any real numbers. Notice $σ$-algebra is closed under
      differences because $A - B = A ∩ overline(B)$.

    3. *Extend to closed intervals, singletons, open-closed intervals and open
      intervals*:

      - Closed interval $[a, b]$:

        $ [a, b] = ⋃_(n=1)^∞ [a, b + 1/n) $

      - Singleton ${b}$:

        $ {b} = [a, b] - [a, b) $

      - Left-open, right-closed interval $(a, b]$:

        $ (a, b] = [a, b] - {a} $

      - Open interval $(a, b)$:

        $ (a, b) = [a, b) - {a} $

    4. *Extend to all finite, countable, open and closed sets*:

      Finally, using *countable unions* and *countable intersections* (which are
      allowed in a $σ$-algebra), we can include:

      - All *finite sets*
      - All *countable sets* like the rational numbers $ℚ$
      - All *open sets*, unions of open intervals
      - All *closed sets*, unions of closed intervals

    The collection obtained after this step-by-step extension is called the
    *Borel $σ$-algebra*, denoted by:

    $ cal("B")(ℝ) space.en "or" space.en cal("F")_("Borel") $

    Every element in Borel $σ$-algebra is called *Borel set* or *measurable set*.
  """#
  related: [
    "concept/sigma-algebra",
    "desire/assign-probability-to-uncountable"
  ]
}