package concept

ramachandran_plot: {
  content: """
    A *Ramachandran plot* (also known as Rama plot, a Ramachandran diagram or a
    $[ϕ,ψ]$ plot) is a way to visualize energetically allowed regions for backbone
    *dihedral angles* (also called as *torsional angles*) $ϕ$ against $ψ$ of
    amino acid residues in protein structure.

    A Ramachandran plot can be used in:

    - Show in theory which values, or conformations of the $ϕ$ and $ψ$ angles
      are possible for an amino-acid residue in a protein;
    - Show the empirical distribution of datapoints observed in a single structure
      in usage for *structure validation*.

    \(figure_part)

    #align(center)[
      #table(
        columns: (1fr, auto, auto),
        inset: 10pt,
        stroke: none,
        table.header(
          [*Aggregated Region*],
          [*Corresponding Secondary Structure*],
          [*Typical $ϕ-ψ$ Range*]
        ),
        table.hline(),
        [Upper Left],   [$β$-sheet],              [/],
        [Lower Left],   [$α$-helix],              [/],
        [Middle Right], [Left-handed $α$-helix],  [/],
        [Lower Left],   [$3_(10)$-helix],         [/]
      )
    ]
  """
  figure_part: #"""
    #align(center)[
      #figure(
        image("assets/1ca2-ramachandran.png", width: 50%),
        caption: "Ramachandran plot of 1CA2"
      )
    ]
  """#
}