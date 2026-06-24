package concept

structure: {
  content: """
    === Structure: Definition

    Defining a structure introduces a completely new type to Lean that can't be
    reduced to any type. For instance, a point might be represented using either
    Cartesian or polar coordinates, each being a pair of floating-point numbers.

    A Cartesian point is a structure with two `Float` fields, called `x` and `y`.
    This is declared using the `structure` keyword. And we can extract the 
    individual fields of a structure. This is done using *dot notation*.

    This can be used to define functions that take structures as arguments. To
    make the program more concise, Lean also allows the structure type annotation
    inside the curly braces.

    \(code_part_structure_definition)

    === Structure: Updating Fields

    Lean is a functional programming language, in functional programming language,
    editing the field in a structure always means *a fresh new instance is allocated
    pointing to the new value*. So a function to update a structure instance
    always returns a new instance. We can write different updating functions in
    different ways:

    \(code_part_structure_updating)

    Lean provides a convenient syntax for replacing some fields in a structure
    while leaving the others alone. This is done by using the `with` keyword in
    a structure initialization. The source of changed fields occurs before the
    `with` and the new fields occur after.

    Structure updating does not modify the original structure, all references to
    the old structure continue to refer to the same field values in all of the
    new values provided.

    === Structure: Constructors

    Every structure has a *constructor*. Unlike constructors in languages such
    as Java or Python, constructors in Lean are *not arbitrary code* to be run
    when a datatype is initialized. Instead, constructors simply *gather the
    data to be stored in the newly-allocated data structure*. *It is not possible
    to provide a custom constructor that pre-processes data or rejects invalid
    arguments*.

    By default the constructor of structure `S` is `S.mk`. Here `S` is a
    *namespace qualifier*, and `mk` is the name of the constructor itself. We
    can override a structure's constructor name, write it with *two colons `::`*
    at the beginning:

    \(code_part_structure_constructor)

    === Structure: Accessor Function

    In addition to the constructor, an *accessor function* is defined for each
    field of a structure. These have the same name as the field but in the
    structure's namespace.
  """
  code_part_structure_definition: #"""
    #raw-block-file(
      "src/basic/StructureDefinition.lean",
      "lean"
    )
  """#
  code_part_structure_updating: #"""
    #raw-block-file(
      "src/basic/StructureUpdating.lean",
      "lean"
    )
  """#
  code_part_structure_constructor: #"""
    #raw-block-file(
      "src/basic/StructureConstructor.lean",
      "lean"
    )
  """#
}