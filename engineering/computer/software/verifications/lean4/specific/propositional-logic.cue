package specific

propositional_logic: {
  content: """
    The order of propositional constructors: unary negation `¬` binds most
    strongly, then `∧`, then `∨`, then `→` and finally `↔`.

    === Propositional Logic: Conjunction

    The expression `And.intro h₁ h₂` builds a proof of `p ∧ q` using proofs
    `h₁ : p` and `h₂ : q`. It is common to describe `And.intro` as the *and-
    introduction* rule. The `example` command states a theorem *without naming
    it or storing it in the permanent context. Essentially it just checks that
    the given term has the indicated type.*

    \(code_part_conjunction)

    The and-introduction and and-elimination are similar to the pairing and
    projection operations for the Cartesian product. `Prod` cannot be used with
    `Prop`s, and `And` cannot be used with `Type`s. *The similarity between
    `∧` and `×` is another instance of the Curry-Howard isomorphism*, but in
    contrast to implication and the function space constructor, `∧` and `×` are
    treated separately in Lean.

    The `And` type is defined with a single canonical constructor which builds
    and element of the type from a sequence of suitable arguments. Lean allows
    us to use anonymous constructor notation `⟨arg1, arg2, ⋯⟩`.

    === Propositional Logic: Disjunction

    The expression `Or.intro_left q hp` creates a proof for `p ∨ q` from a proof
    `hp : p`. Similarly, `Or.intro_right p hq` creates a proof for `p ∨ q` using
    a proof `hq : q`. These are left and right-introduction rules.

    The or-elimination is we can prove `r` from `p ∨ q` by showing that `r`
    follows from `p` and that `r` follows from `q`. In other words, it is a proof
    by cases. In the expression `Or.elim hpq hpr hqr`, its takes three arguments.

    \(code_part_disjunction)

    In most cases the first argument of `Or.intro_right` and `Or.intro_left` can
    be inferred automatically by Lean. Lean therefore provides `Or.inr` and
    `Or.inl` which can be viewed as shorthand for `Or.intro_right _` and
    `Or.intro_left _`.

    === Propositional: Negation and Falsity

    Negation, `¬p` is actually defined to be `p → False`, it's still an instance
    from Curry-Howard isomorphism.

    \(code_part_negation)

    This example produces a proof of `(p → q) → ¬q → ¬p`. The connective `False`
    has a single elimination rule, `False.elim` which expresses the fact that
    anything follows from a contradiction. The arbitrary fact `q` that follows
    from falsity is an implicit argument is `False.elim` and is *inferred
    automatically*. *This pattern deriving an arbitrary fact from contradictory
    hypotheses, is represented by `absurd`*

    Identically `True` has only an introduction rule, `True.intro` is always
    a value `True`.

    === Propositional: Logical Equivalence

    The expression `Iff.intro h₁ h₂` produces a proof of `p ↔ q` from `h₁ : p
    → q` and `h₂ : q → p`. The expression `Iff.mp h` produces a proof of
    `p → q` from `h : p ↔ q` and expression `Iff.mpr h` produces a proof of
    `q → p` from `h : p ↔ q`.

    \(code_part_equivalence)
  """
  code_part_conjunction: #"""
    #raw-block-file(
      "src/specific/PropositionalLogicConjunction.lean",
      "lean"
    )
  """#
  code_part_disjunction: #"""
    #raw-block-file(
      "src/specific/PropositionalLogicDisjunction.lean",
      "lean"
    )
  """#
  code_part_negation: #"""
    #raw-block-file(
      "src/specific/PropositionalLogicNegation.lean",
      "lean"
    )
  """#
  code_part_equivalence: #"""
    #raw-block-file(
      "src/specific/PropositionalLogicEquivalence.lean",
      "lean"
    )
  """#
}