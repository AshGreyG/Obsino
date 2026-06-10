package concept

anion_pi_interaction: {
  content: """
    Anion-$π$ interaction is a noncovalent attractive force between a *negative
    charged ion or group* and an *electron-deficient aromatic group* (often
    called a $π$-acidic aromatic system). Unlike cation-$π$ interactions that
    involve electron-rich aromatic rings, this interaction relies on the positive
    electrostatic potential ($π$-hole) above the plane of an electron-poor
    aromatic ring, which can favorably coordinate negatively charged species.

    Biologically relevant example exists in *protein-ligand binding and enzyme
    active sites*. A well-documented example is between *nitrate-binding proteins*
    and *certain flavoenzymes* (黄素酶).

    A negatively charged side chain of Glutamate (Glu, E) or Aspartate (Asp, D)
    can form an anion-$π$ interaction with the *electron-deficient isoalloxazine
    ring of FAD (flavin adenine dinucleotide, 黄素腺嘌呤二核苷酸)*. This interaction
    helps anchor the cofactor in its binding pocket, stabilizes the protein's
    functional conformation, and modulates electron transfer during catalysis.

    // Glutamate  (Glu, E)    C(CC(=O)O)[C@@H](C(=O)O)N
    // Aspartate  (Asp, D)    C([C@@H](C(=O)O)N)C(=O)O

    \(figure_part)
  """
  figure_part: #"""
    #let glutamate  = read("assets/glutamate.svg")
    #let aspartate  = read("assets/aspartate.svg")

    #align(center)[
      #stack(dir: ltr)[
        #box(width: 30%)[
          #figure(
            image(bytes(glutamate)),
            caption: "Glutamate"
          )
        ],
        #box(width: 30%)[
          #figure(
            image(bytes(aspartate)),
            caption: "Aspartate"
          )
        ]
      ]
    ]
  """#
}