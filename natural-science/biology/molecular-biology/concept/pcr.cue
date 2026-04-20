package concept

pcr: {
  content: """
    The polymerase chain reaction (PCR) is a technique for amplifying DNA
    sequences in vitro. This method can produce numerous copies of DNAs from
    a single template DNA molecule through repeated cycles of template
    denaturation, primer annealing and DNA extension.

    The majority of PCR methods rely on *thermal cycling*. Thermal cycling
    exposes reagents to repeated cycles of heating and cooling to permit
    different temperature-dependent reactions, specifically DNA melting and
    enzyme-driven DNA replication. PCR employs two main reagents:

    - *Primers* are short single strand DNA fragments known as *oligonucleotides*
      that are a *complementary sequence* to the target DNA region;

    - *Thermostable DNA polymerase*.

    PCR procedure:

    1. The two strands of the DNA double helix are physically separated at a high
      temperature in a process called *nucleic acid denaturation*, (95-98°C);

    2. The temperature is lowered and the primers bind to the complementary
      sequences of DNA. The two DNA strands then become templates for DNA
      polymerase to enzymatically assemble a new DNA strand from free nucleotides,
      the building blocks of DNA (50-68°C);

    3. The DNA polymerase extends the primers by reading the opposing strand
      sequence and adding nucleotides. The number of target sequences is doubled
      after each cycle (70-72°C).

    \(figure_part_pcr)

    Commonly used thermostable DNA polymerase is taq DNA polymerase.

    Notice, the DNA polymerase can only starts from 3'-OH at binding primer. So
    we need a pair of primers, one to bind *sense strand* (reverse primer) and
    another to bind *antisense strand* (forward primer).

    Primer design:

    - Number of nucleotides: usually 15-30 nt;

    - GC content: 40% - 60% to avoid primers to self-anneal or anneal to each
      other at the repetitive regions, this leads to *primer-dimers* (short,
      nonspecific products). It also can cause non-specific amplification 
      because homopolymer stretches are common in many genomes;

    - Melting temperature $T_m$ should be 55-70°C, difference between the primer
      pair should be less than 5°C;

    - Not self-complementary or complementary to each other to avoid formation or
      internal secondary structures or primer-dimers;

    - Sometimes restriction sites and enhance factors, which are not complementary
      to template, can be added to primer 5' ends for the purpose of gene cloning.
      For efficient restriction enzyme digestion, additional 3-4 nucleotides as
      *flanking sequence* should be added to 5' end.

    - Primer concentration is generally 0.2 - 1 $μ$M (final concentration).
      Higher primer concentration may easily generate primer-dimer and nonspecific
      product. Lower primer concentration may result in higher specificity but
      too low concentration is not sufficient to accomplish 30 amplification
      cycles and will decrease the PCR yield;

    Melting temperature $T_m$ often refers to the temperature at which 50% of
    nucleic acid molecules (DNA or RNA) are denatured into single strand. We have
    a general calculation:

    $ T_m = 4("G" + "C") + 2 ("A" + "T") space °"C" $

    Annealing temperature is usually 5°C lower than $T_m$, optimal annealing
    temperature can be determined by running a test with temperature gradient.
  """
  figure_part_pcr: #"""
    #let pcr = "assets/polymerase-chain-reaction.png"
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 100%)[
          #figure(
            image(pcr),
            caption: "PCR Procedure"
          )
        ]
      ]
    ]
  """#
}