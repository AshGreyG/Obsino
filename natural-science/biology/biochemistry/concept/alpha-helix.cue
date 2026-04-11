package concept

alpha_helix: {
  content: """
    The backbone is more compact with the $ψ$ dihedral in the range ($-70° < ψ <
    0°$), helical backbone is held together by *hydrogen bonds* between the
    nearby backbone amides, stabilized by the hydrogen bond between the C=O and
    N-H groups of the main chain.

    Right-handed helix with 3.6 residues ($5.4 Å$) per turn (the distance of
    protein $α$ helix going up, that's the distance of pitch not the distance
    of hydrogens in backbone).

    Peptide bonds are aligned roughly parallel with the helical axis and side
    chains point out and are roughly perpendicular with the helical axis.

    - Left-handed  helix: protein goes up in *clockwise*;
    - Right-handed helix: protein goes up in *counterclockwise*.

    In the $α$-helix, the C=O group of residue $n$ forms a hydrogen bond with
    the NH group of residue $n + 4$.

    Not all polypeptide sequences adopt $α$-helical structures.
    
    - Small hydrophobic residues residues such as Alanine (Ala, A) and Leucine
      (Leu, L) are strong helix formers;
    - Proline (Pro, P) acts as a helix breaker because the rotation around the
      $"N"-"C"_α$ bond is impossible;
    - Glycine (Gly, G) acts as a helix breaker because the tiny $"R"$-group
      supports other conformations.

    // Alanine    (Ala, A)  C[C@@H](C(=O)O)N
    // Leucine    (Leu, L)  CC(C)C[C@@H](C(=O)O)N
    // Proline    (Pro, P)  C1C[C@H](NC1)C(=O)O
    // Glycine    (Gly, G)  C(C(=O)O)N

    \(figure_part)

    The peptide bond has a strong dipole moment: C=O (carbonyl) is negative and
    N-H (amide) is positive. Negatively charged residues often occur near the
    amino terminus of the helical segment to interact with the positive charge
    of the helix dipole.

    The two helices wind around one another to form a superhelix. Such structure
    are found in many proteins including *keratin* (角蛋白) in hair, quills and
    horns.
  """
  figure_part: #"""
    #let alanine = read("assets/alanine.svg")
    #let leucine = read("assets/leucine.svg")
    #let proline = read("assets/proline.svg")
    #let glycine = read("assets/glycine.svg")

    #align(center)[
      #stack(dir: ltr)[
        #box(width: 23%)[
          #figure(
            image(bytes(alanine)),
            caption: "Alanine"
          )
        ],
        #box(width: 23%)[
          #figure(
            image(bytes(leucine)),
            caption: "Leucine"
          )
        ],
        #box(width: 23%)[
          #figure(
            image(bytes(proline)),
            caption: "Proline"
          )
        ]
        #box(width: 23%)[
          #figure(
            image(bytes(glycine)),
            caption: "Glycine"
          )
        ]
      ]
    ]
  """#
}