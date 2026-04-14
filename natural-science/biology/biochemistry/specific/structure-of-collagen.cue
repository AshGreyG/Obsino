package specific

structure_of_collagen: {
  content: """
    Collagen is an important constituent of connective tissue: tendons, cartilage,
    bones, cornea of the eye. Each collagen chain is a long Gly- and Pro-rich
    *left handed helix with Gly-Pro-(4-Hyp) repeats*.

    Three collagen chains intertwine into a *right-handed super-helical triple
    helix*. The triple helix has higher tensile strength than a steel wire of
    equal cross section!

    Many triple-helices assemble into a collagen fibril. The 4-Hydroxyproline (
    proline has an OH group) forces the proline ring into a favorable pucker and
    offer more hydrogen bonds *between the three strands of collagen*.

    // 4-Hydroxyproline,   Hyp, O,  C1[C@H](CN[C@@H]1C(=O)O)O

    \(figure_part)
  """
  figure_part: #"""
    #let hydroxyproline = read("assets/4-hydroxyproline.svg")
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 30%)[
          #figure(
            image(bytes(hydroxyproline)),
            caption: "4-Hydroxyproline"
          )
        ]
      ]
    ]
  """#
  related: [
    "concept/tertiary-structure"
  ]
}