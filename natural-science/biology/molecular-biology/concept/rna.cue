package concept

rna: {
  content: """
    RNA (ribonucleic acid) is a vital molecule that serves diverse roles in the
    storage and expression of genetic information.

    *Chemical difference from DNA*:
    - The sugar is ribose instead of deoxyribose
    - Contains uracil (U) instead of thymine (T)

    DNA is the genetic material for all life, usually existing in long strands
    that are passed down from generation to generation. RNA molecules range
    widely in their lengths and are often more transient than DNA. If DNA is like
    an archive, RNA molecules are like scans or photocopies of specific documents
    from the archive.
    
    *The DNA stores all the necessary information for an organism, and the RNA
    replicates and distributes pieces of this information as needed*.

    // uracil,  U,  Ura,  O=C1C=CNC(=O)N1
    // thymine, T,  Thy,  O=C1NC(=O)NC=C1C

    \(figure_part_rna_structure)

    *Physical characteristics*:
    - RNA molecules are rarely more than a few thousand nucleotides in length
    - Mostly single-stranded, though can form secondary structures through
      intramolecular base paring

    *Major types of RNA*:
    - *mRNA (message RNA)*: Carries genetic information from DNA to ribosomes for
      protein synthesis
    - *rRNA (ribosomal RNA)*: Structural and catalytic component of ribosomes
    - *tRNA (transfer RNA)*:  Delivers amino acids to the ribosome during
      translation
    - *Non-coding RNAs (ncRNAs)*: Regulatory RNAs that are not translated into
      protein (e.g., microRNA, siRNA, lncRNA)

    *Relative abundance*:
    - In a typical cell, rRNA constitutes ~80% of total RNA, tRNA ~ 15%, and
      mRNA only 1-3%
    - Despite its low abundance, mRNA carries the coding information for all
      proteins
  """
  figure_part_rna_structure: #"""
    #let rna-structure = "assets/rna-structure.jpg"
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 100%)[
          #figure(
            image(rna-structure),
            caption: "PCR Procedure"
          )
        ]
      ]
    ]
  """#
  related: [
    "concept/rna-transcription",
    "concept/total-rna"
  ]
}