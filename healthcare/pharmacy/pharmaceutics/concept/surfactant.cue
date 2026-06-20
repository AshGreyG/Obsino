package concept

surfactant: {
  content: """
    A surfactant is a chemical compound that decreases the surface tension or
    interfacial tension between two liquids, a liquid and a gas or a liquid and
    a solid. The word "surfactant" is a blend of "surface-active agent". Its
    structure properties: *hydrophilic groups* as heads and *hydrophobic groups*
    as tails

    \(figure_part_polysorbate_80)

    Surfactants can be classified into 

    - Anionic
    - Cationic
    - Non-ionic
    - Ampholytic

    By introducing the concept #link(<concept-critical-micelle-concentration>)[
    critical micelle concentration], 
  """
  related: [
    "concept/solubilizer",
    "concept/solubilizate",
    "concept/critical-micelle-concentration"
  ]
  figure_part_polysorbate_80: #"""
    #align(center)[
      #figure(
        image("figures://polysorbate-80", width: 50%),
        caption: "Structure of Polysorbate-80 (Tween-80)"
      )
    ]
  """#
}