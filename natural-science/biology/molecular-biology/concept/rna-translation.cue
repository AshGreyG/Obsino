package concept

rna_translation: {
  content: """
    mRNA is the type of RNA responsible for carrying the instructions for
    producing proteins. Mature mRNAs are transcribed from genes in the *nucleus*,
    the part of the cell that contains the genome.

    The mRNAs then travel out of the nucleus to the ribosomes, cellular machines
    made of RNA and protein. The ribosomes read the mRNA sequence three nucleotides,
    or a *codon*, at a time to build a protein. This process is known as
    *translation*.

    mRNAs has some features:
    1. A protective chemical structure on one end, known as the *five-prime cap*
    2. Long string of A nucleotides on the other end, and this is called the
      *poly-A tail*. (When scientists want to study only the mRNAs in a cell,
      they use special tools to select only the RNAs that have poly-A tails)
    3. 5'-UTR (untranslated region) and 3'-UTR

    The structure of mature mRNAs is like:

    ```plaintext
    5'-cap → 5'-UTR → Coding Area → 3'-UTR → poly-A tails
    ```

    \(figure_part_rna_translation)

    rRNAs combine with proteins to create the structure of the ribosome. As
    ribosomes read the instruction encoded in the mRNAs, the rRNAs perform the
    chemical reactions that assemble the new proteins piece-by-piece.

    tRNAs assist in translation. Each tRNA corresponds to one of the 20 possible
    amino acids building blocks in humans. As the ribosome reads each codon along
    an mRNA, the tRNA bring the correct amino acids, which is then added to the
    growing protein molecule.
  """
  figure_part_rna_translation: #"""
    #let central-dogma = "assets/central-dogma.jpg"
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 100%)[
          #figure(
            image(central-dogma),
            caption: "RNA Translation (Central Dogma)"
          )
        ]
      ]
    ]
  """#
}