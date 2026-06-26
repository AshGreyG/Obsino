package concept

namespace: {
  content: """
    *Each name in Lean occurs in a namespace*, which is a collection of names.
    Names are placed in namespaces using `.`. Names in different namespace do
    not conflict with each other. This means that `List.map` and `Array.map`
    are different names.

    - *Namespaces may be nested*.
    - *Namespaces may be opened prior to a command*. Namespaces may additionally
      be opened for all following commands for the rest of the file. To do this,
      simply omit the `in` from a top-level usage of `open`.
  """
  code_part_namespace: #"""
    #raw-block-file(
      "src/basic/Namespace.lean",
      "lean"
    )
  """#
}