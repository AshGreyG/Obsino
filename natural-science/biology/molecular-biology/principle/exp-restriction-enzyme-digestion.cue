package principle

exp_restriction_enzyme_digestion: {
  content: #"""
    1. Materials

      - *plasmid pCMV-Myc-SIPAR* (prefix `p` stands for plasmid, used as a vector to
        carry and express foreign genes, it is a mammalian expression vector based
        on the pCMV-Myc backbone, this vector uses the strong *CMV promoter* to
        drive high-level expression of the inserted gene in mammalian cells. The
        insert contains the cDNA encoding the SIPAR protein);

      - *NEB 1kb DNA Ladder* (produced by New England Biolabs, is a mixture of
        purified DNA fragments used during gel electrophoresis to determine the
        size of double-stranded DNA. We can think of it as a molecular ruler that
        we run in the first or last lane of our agarose gel to compare against
        our experimental samples);

      - *ExoRI* (restriction enzyme cutting site is `G'AATTC`);

      - *XhoI* (restriction enzyme cutting site is `C'TCGAG`);

      - 10 × H buffer (consisting of 500 mM Tris-HCl, 三羟甲基氨基甲烷盐酸盐 + 100 mM
        $"MgCl"_2$, 10 mM dithiothreitol, 二硫苏糖醇, 1000 mM NaCl);

        *Buffer is determined by the restriction enzyme*.

    2. Steps:

      1. Add plasmid $600 "ng"$, 10 × H buffer $6 μ"L"$ and $"H"_2"O"$ up to
        $57 μ"L"$ and aliquot $19 μ"L"$ into one 1.5 mL tube; group I adds nothing,
        group II adds EcoRI $0.5 μ"L"$, group III adds both EcoRI and XhoI
        $0.5 μ"L"$;

      2. Digestion at 37°C water bath for 0.5 - 1 hours;

      3. After enzyme digestion, add $10 μ"L"$ 3× loading buffer to each tube and
        mix and load $15 μ"L"$ sample to the gel. Load an extra lane of $4 μ"L"$
        DNA marker (1kb DNA ladder) as comparison. Start electrophoresis at 180V
        immediately after sample loading.
  """#
  related: [
    "concept/restriction-enzyme",
    "concept/plasmid"
  ]
}