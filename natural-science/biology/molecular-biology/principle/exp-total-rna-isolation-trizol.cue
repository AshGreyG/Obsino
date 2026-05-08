package principle

exp_total_rna_isolation_trizol: {
  content: """
    Total RNA isolation is one of the fundamental techniques in studying gene
    function. The TRIzol-based method is a common approach that uses phenol-
    chloroform extraction.

    Materials required:
    - Fresh tissue (animal or plant)
    - Liquid nitrogen (-196°C) for snap-freezing and grinding
    - TRIzol Reagent (contains phenol and guanidine isothiocyanate)
    - Chloroform (for phase separation)
    - Isopropanol (for RNA precipitation)
    - 75% Ethanol (for washing)
    - RNase-free water (DEPC-treated)

    *General procedure*:
    1. *Sample preparation*: Snap-freeze 100 mg of fresh tissue in liquid nitrogen
    2. *Grinding*: Grind tissue to fine powder in liquid nitrogen using mortar
      and pestle
    3. *Lysis*: Add TRIZol Reagent, incubate at room temperature for 5 minutes
    4. *Phase separation*: Add chloroform, centrifuge to separate into three
      layers:

      - Upper aqueous phase (contains RNA)
      - Interphase (contains DNA)
      - Lower organic phase (contains protein)

    5. *RNA precipitation*: Transfer aqueous phase, add isopropanol (1x volume),
      incubate 10 minutes at room temperature
    6. *Centrifugation*: 12,000 × g for 10 minutes at 4 °C to pellet RNA
    7. *Wash*: Wash pellet with 75% ethanol, centrifuge at 7,500 × g for 5 minutes
      at 4 °C, carefully remove supernatant with a pipette
    8. *Air dry*: Dry pellet for about 2 minutes
    9. *Dissolution*: Dissolve RNA in 40 μL RNase-free water
  """
  related: [
    "concept/rna",
    "concept/total-rna"
  ]
}