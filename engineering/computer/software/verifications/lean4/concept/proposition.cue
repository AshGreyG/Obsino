package concept

proposition: {
  content: """
    Lean introduced a new type `Prop` to represent propositions, and introduce
    constructors to build new propositions from others. Whenever we have `p : Prop`
    we can interpret `p` as a type, namely, the *type of its proofs*. We can then
    read `t : p` as the assertion that *`t` is a proof of `p`*. Implication
    between propositions `p` and `q` corresponds to having a *function that takes
    any element of `p` to any element of `q`*.

    This is the approach followed in the Calculus of Construction. The fact that
    the rules for implication in a proof system for natural deduction correspond
    exactly to the rules governing abstraction and application for functions is
    an instance of the *Curry-Howard isomorphism*, sometimes known as the
    *propositions-as-types* paradigm.

    In fact the type `Prop` is syntactic sugar for `Sort 0`, the very bottom of
    the type hierarchy (moreover, `Type u` is also just syntactic sugar for
    `Sort (u+1)`). `Prop` has special features, but like other type universes,
    it is closed under the arrow constructor: if we have `p q : Prop`, then
    `p → q : Prop`.

    *A proposition `p` represents a sort of data type, namely*, a specification
    of the type of data that constitutes a proof. A proof of `p` is then simply
    an object `t : p` of the right type. This is from the constructive point of
    view, proofs are abstract mathematical objects that are denoted by suitable
    expressions in dependent type theory, the expressions themselves are the
    proofs.

    \(code_part_proposition)
  """
  code_part_proposition: #"""
    #raw-block-file(
      "src/proof/Proposition.lean",
      "lean"
    )
  """#
}