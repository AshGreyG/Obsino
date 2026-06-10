package concept

alternative_splicing: {
  content: """
    *Alternative splicing* is a type of RNA splicing where different exons are
    included or excluded from the final RNA sequence, generating different RNA
    molecules from the same gene in the genome. When mRNAs are alternatively
    spliced, mRNAs from the same gene can create different proteins that may
    have different functions.

    About 95% of human genes are thought to be alternatively spliced, and some
    RNAs can be alternatively spliced in many ways.

    \(figure_part_alternative_splicing)
  """
  figure_part_alternative_splicing: #"""
    #let alternative-splicing = "assets/alternative-splicing.jpg"
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 100%)[
          #figure(
            image(alternative-splicing),
            caption: "Alternative Splicing"
          )
        ]
      ]
    ]
  """#
  related: [
    "concept/rna",
    "concept/rna-transcription"
  ]
}