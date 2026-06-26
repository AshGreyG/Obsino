package concept

builtin_datatype: {
  content: """
    === Builtin Datatypes: Option

    Many languages have a `null` value that represents the absence of a value.
    Instead of equipping existing types with a special `null` value. Lean provides
    a datatype called `Option` that equips some other type with an indicator
    for missing values. For instance a nullable `Int` is represented `Option Int`,
    an `Option Int` can't be used in a context where an `Int` is expected.

    However, `Option` in Lean differs from nullable types in other languages,
    for example `T??` is considered as being equivalent to `T?`, but in Lean,
    `Option (Option α)` has different values from `Option α`, it contains
    `none`, `some (some 3)`, `some none` (this subtle difference is rarely relevant
    in practice, but it can matter from time to time).

    \(code_part_option)

    === Builtin Datatypes: Product

    The `Prod` structure, short for Product, is a generic way of joining two
    values together, in other words `PPoint Nat` can be replaced by `Prod Nat Nat`
    and latter is more generic. The structure `Prod` is defined with two type
    arguments. Both the product type and its constructor have special syntax,
    the type `Prod α β` is typically written `α × β`, mirroring the usual notation
    for a Cartesian product of sets. Notice both notations are *right-associative*.

    \(code_part_product)

    === Builtin Datatypes: Sum

    The `Sum` datatype is a generic way of allowing a choice between values of
    two different types. For instance, a `Sum String Int` is either a `String`
    or an `Int`. `Sum` should be used either when writing very generic code, for
    a very small section of code where there is no sensible domain-specific type.
    Values of type `Sum α β` are the constructor `inl` applied to a value of type
    `α` or the constructor `inr` applied to a value of type `β` (these names
    are short for *left injection* and *right injection*). And its syntax notation
    is `α ⊕ β`.

    \(code_part_sum)

    === Builtin Datatypes: Unit

    Unit is a type with just one argumentless constructor, called unit. In other
    words, it describes only a single value, which consists of said constructor
    applied to no arguments whatsoever. In polymorphic code, it can be used as
    a placeholder for data that is missing.

    Additionally, because all Lean functions have arguments, zero-argument functions
    in other languages can be represented as *functions that take a `Unit`
    argument*. In a return position, the `Unit` type is similar to `void` in
    languages derived from C.

    \(code_part_unit)
  """
  code_part_option: #"""
    #raw-block-file(
      "src/basic/BuiltinDatatypeOption.lean",
      "lean"
    )
  """#
  code_part_product: #"""
    #raw-block-file(
      "src/basic/BuiltinDatatypeProduct.lean",
      "lean"
    )
  """#
  code_part_sum: #"""
    #raw-block-file(
      "src/basic/BuiltinDatatypeSum.lean",
      "lean"
    )
  """#
  code_part_unit: #"""
    #raw-block-file(
      "src/basic/BuiltinDatatypeUnit.lean",
      "lean"
    )
  """#
  related: [
    "concept/structure",
    "concept/inductive-datatype"
  ]
}