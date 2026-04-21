package concept

cation_pi_interaction: {
  content: """
    Cation-$π$ interaction is a common noncovalent interaction between a
    *positively charged cation* and the *electron-rich $π$ system of an aromatic
    ring*. It belongs to electrostatic and Van der Waals forces, and plays an
    important role in stabilizing protein conformation, ligand binding and
    molecular recognition.

    This interaction typically occurs between:

    - Positively charged amino acid side chains: Lysine (Lys, K) and Arginine
      (Arg, R);
    - Aromatic amino acid residues: Phenylalanine (Phe, F), Tyrosine (Tyr, Y)
      and Tryptophan (Trp, W).

    // Lysine         (Lys, K): C(CCN)C[C@@H](C(=O)O)N
    // Arginine       (Arg, R): C(C[C@@H](C(=O)O)N)CNC(=N)N
    // Phenylalanine  (Phe, F): c1ccc(cc1)C[C@@H](C(=O)O)N
    // Tyrosine       (Tyr, Y): N[C@@H](Cc1ccc(O)cc1)C(O)=O
    // Tryptophan     (Trp, W): c1[nH]c2ccccc2c1C[C@H](N)C(=O)O

    A classic example is the *intramolecular cation-$π$ pair* in AChE (乙酰胆碱酯酶)
    or many globular proteins. The guanidinium group of Arginine (Arg+) forms a
    strong cation-$π$ interaction with the indole ring of Tryptophan nearby,
    helping to stabilize the local tertiary structure of the protein.

    \(figure_part)
  """,
  figure_part: #"""
    #let lysine         = read("assets/lysine.svg")
    #let arginine       = read("assets/arginine.svg")
    #let phenylalanine  = read("assets/phenylalanine.svg")
    #let tyrosine       = read("assets/tyrosine.svg")
    #let tryptophan     = read("assets/tryptophan.svg")

    #align(center)[
      #stack(dir: ltr)[
        #box(width: 30%)[
          #figure(
            image(bytes(lysine)),
            caption: "Lysine"
          )
        ],
        #box(width: 30%)[
          #figure(
            image(bytes(arginine)),
            caption: "Arginine"
          )
        ],
        #box(width: 30%)[
          #figure(
            image(bytes(phenylalanine)),
            caption: "Phenylalanine"
          )
        ]
      ]
    ]

    #align(center)[
      #stack(dir: ltr)[
        #box(width: 30%)[
          #figure(
            image(bytes(tyrosine)),
            caption: "Tyrosine"
          )
        ],
        #box(width: 30%)[
          #figure(
            image(bytes(tryptophan)),
            caption: "Tryptophan"
          )
        ],
      ]
    ]
  """#
  related: [
    "concept/anion-pi-interaction",
    "concept/pi-pi-interaction"
  ]
}