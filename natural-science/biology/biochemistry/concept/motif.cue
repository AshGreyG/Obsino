package concept

motif: {
  content: #"""
    Motif (also called super-secondary structure or fold) is a recognizable
    folding pattern involving two or more elements of secondary structure and
    the connections between them. A motif may be simple or complex, and can
    represent all or just a small part of a protein.

    1. Helix super-secondary structure

      - *Helix hairpin* (also known as an alpha-alpha hairpin) is compose of two
        antiparallel alpha helices connected by a loop of two or more residues.
        It resembles a hairpin. A longer loop has a greater number of possible
        conformations. If short strands connect the helices, then the individual
        helices will pack together through their hydrophobic residues. The
        function of helix hairpin is unknown;

      - *Helix corner* (also known as an alpha-alpha corner), has two alpha helices
        almost at right angles to each other connect by a short loop. This loop is
        formed from a hydrophobic residue. The function of a helix corner is
        unknown;

      - *Basic helix-loop-helix* (bHLH) is a protein structural motif that
        characterizes one of the largest families of dimerizing transcription
        factors. Transcription factors in general contain basic amino acid residues
        in order to facilitate DNA binding;

      - *Helix-turn-helix* (HTH) is two short $α$-helices connected by a tight
        turn. It is a major structural motif in proteins that functions as a DNA-
        binding domain. The HTH motif occurs in many proteins that regulate gene
        expression.

    2. Beta sheet super-secondary structure

      - *Beta hairpin* is composed of two antiparallel beta strands connect by
        a loop. The loop between the beta strands can range anywhere from 2 to
        16 (most loops contain less than 7 residues). The function of beta
        hairpins is unknown;

      - *Beta corner* has two antiparallel $β$ strands at about a $90°$ angle to
        each other. It is formed by a beta hairpin changing direction with one
        strand having a glycine residue and the other strand having a *beta
        bulge* (can be described as a localized disruption of the regular
        hydrogen bonding of beta sheet by inserting extra residues into one or
        both hydrogen bonded $β$-strands). Beta corners have no known function.

      - *Greek key motif*:

        1. Four sequentially connected beta strands are adjacent to, but not
          necessarily geometrically aligned with, each other;

        2. The beta sheet is anti-parallel, and alternate strands run in the same
          directions;

        3. The first strand and last strand are next to each other and boned by
          hydrogen bonds;

        4. Connecting loops can be long and include other secondary structures.

        ```plaintext
        /----------<-----\  β strand 3
        |                |
        |   /------>-----/  β strand 2
        |   |
        |   \------<-----   β strand 1
        |
        \---------->------  β strand 4
        ```

        The geek key motif has no known function.

    3. Mixed super-secondary structure

      - *$β$-$α$-$β$ motifs* is composed of two $β$ strands joined by an $α$
        helix through connecting loops. The $β$ strands are parallel, and the
        helix is also almost parallel to the strands. This structure can be seen
        in almost all proteins with parallel strands. The loops connecting the
        $β$ strands and $α$ helix can vary in length and often binds ligands.

        $β$-$α$-$β$ motifs helices can be either left-handed or right-handed.
        When viewed from the N-terminal side of the data strands, so that one
        strand is on top of the other, a left-handed $β$-$α$-$β$ motif has the
        $α$ helix on the left side of the $β$ strands. The more command right-
        handed motif would have an $α$ helix on the right side of the plane
        containing the $β$ strand.

      - *Rossman fold* consists of 3 $β$ strands and $2$ helices in an alternating
        fashion: $β$ strand, helix, $β$ strand, helix, $β$ strand. This motif
        tends to reverse the direction of the chain within a protein. 
  """#
  related: [
    "concept/secondary-structure"
  ]
}