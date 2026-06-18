package specific

g_protein_coupled_receptors_signal_transduction: {
  content: """
    *G protein-coupled receptors* (*GPCRs*) are receptors that are closely
    associated with a member of the *guanosine nucleotide-binding protein
    (G-protein)* family. GPCR signal transduction includes three essential components:

    1. A plasma membrane receptor with seven transmembrane helical segments:

      \(figure_part_plasma_membrane_receptor)

      Three extracellular loops interacting with ligand molecules, three
      intracellular loops interacting with G proteins, an N-terminal extracellular
      region and a C-terminal intracellular region.

      Ligands can bind either to the *extracellular N-terminus* and loops or to
      the binding site within transmembrane helices. GPCR are found only in
      *eukaryotes* including yeast (酵母) and choanoflagellates (领鞭毛虫). The
      ligands that bind and activate these receptors include

      - light-sensitive compounds
      - odors
      - pheromones
      - hormones
      - neurotransmitters

      They vary in size from small molecules to peptides to large proteins.

    2. For $β$-type adrenergic (肾上腺素) receptor system
      1. the binding of epinephrine to a site on the receptor deep within the
        plasma membrane
      2. promotes a conformational change in the receptor's intracellular domain
        that affects its interaction with an associated G protein, promoting the
        dissociation of GDP (guanosine diphosphate) and the binding of GTP
        (guanosine triphosphate)

        \(figure_part_gtp_and_gdp)

    \(figure_part_beta_adrenergic_receptor_system)
  """
  figure_part_plasma_membrane_receptor: #"""
    #align(center)[
      #figure(
        image("figures://plasma-membrane-receptor", width: 50%),
        caption: "Seven Transmembrane Helical Segments of Bovine Rhodopsin"
      )
    ]
  """#
  figure_part_gtp_and_gdp: #"""
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 40%)[
          #figure(
            image("smiles://c1nc2c(n1[C@H]3[C@@H]([C@@H]([C@H](O3)CO[P@@](=O)(O)O[P@](=O)(O)OP(=O)(O)O)O)O)[nH]c(nc2=O)N"),
            caption: "Guanosine Triphosphate"
          )
        ],
        #box(width: 40%)[
          #figure(
            image("smiles://C1=NC2=C(N1C3C(C(C(O3)COP(=O)(O)OP(=O)(O)O)O)O)NC(=NC2=O)N"),
            caption: "Guanosine Diphosphate"
          )
        ]
      ]
    ]
  """#
  figure_part_beta_adrenergic_receptor_system: #"""
    #align(center)[
      #figure(
        image("figures://beta-adrenergic-membrane-receptor", width: 70%),
        caption: "Signal Transduction of " + $β$ + "-Adrenergic-Receptor-System"
      )
    ]
  """#
}