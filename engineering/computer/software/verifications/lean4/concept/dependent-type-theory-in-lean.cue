package concept

dependent_type_theory_in_lean: {
  content: """
    === Dependent Type Theory: Type Universe

    We know the result of `#check Nat` is `Type`. If we check the `Type` itself
    it will return `Type 1`, check the `Type 1` itself will return `Type 2`.
    We can think of `Type 0` as a *universe* of small or ordinary types. `Type 1`
    is then a larger universe of types which contains `Type 0` as an element, and
    `Type 2` is an even larger universe of types, which contains `Type 1` as an
    element. *This list is infinite: there is a `Type n` for every natural number
    `n`*.

    Some operations, however, need to be *polymorphic* over type universes.
    For example `List α` should make sense for any type `α`, no matter which
    type universe `α` lives in. So the type signature of `List` is
    `List.{u} (α : Type u) : Type u`. Here `u` is a variable ranging over type
    levels. To define polymorphic constants, Lean allows you to declare universe
    variables explicitly using the `universe` command. We can also avoid the
    `universe` command by providing the *universe parameters* when defining.

    \(code_part_type_universe)

    === Dependent Type Theory: Lambda Abstraction

    Creating a function from another expression is a process known as *lambda
    abstraction*. Suppose you have the variable `x : α` and you can construct
    an expression `t : β`, then the expression `fun (x : α) => t` is an object
    of type `α → β`.

    \(code_part_lambda_abstraction)

    The general form of a lambda expression is `fun (x : α) => t` where the
    variable `x` is a *bound variable*, and it is really a placeholder whose
    scope does not extend beyond the expression `t`. Formally, expression that
    are the same up to a renaming of bound variables are called *alpha equivalent*.

    An important feature of dependent theory: *every term has a computational
    behavior, and supports a notion of normalization*.

    === Dependent Type Theory: What Is "Dependent"

    \(code_part_dependent_type_theory)

    This is an instance of a *dependent function type* or *dependent arrow type*.
    Given `α : Type` and `β : α → Type`, we can think of `β` as a family of types
    over `α`, that is a type `β a` for each `a : α`. In that case the type
    `(a : α) → β a` denotes the type of functions `f` with the property that,
    for each `a : α`, `f a` is an element of `β a`. *In other words, the type of
    the value returned by `f` depends on its input*.
  """
  code_part_type_universe: #"""
    #raw-block-file(
      "src/basic/TypeUniverse.lean",
      "lean"
    )
  """#
  code_part_lambda_abstraction: #"""
    #raw-block-file(
      "src/basic/LambdaAbstraction.lean",
      "lean"
    )
  """#
  code_part_dependent_type_theory: #"""
    #raw-block-file(
      "src/basic/DependentTypeTheory.lean",
      "lean"
    )
  """#
}