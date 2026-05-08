package principle

exp_rna_quantification_nanophotometer: {
  content: #"""
    RNA concentration is commonly measure using a Nanophotometer (spectrophotometer)
    , which measures UV absorbance at 260 nm.

    *Measurement principle*:
    - Nucleic acids absorb UV light maximally at 260 nm
    - Absorbance is proportional to concentration
    - A260 of 1.0 corresponds to approximately 40 μg/mL RNA

    *Purity assessment*:
    - *A260/A280 ratio*: Indicates protein contamination
      - Pure RNA: 2.0-2.2
      - Lower ratio indicates protein or phenol contamination
    - *A260/A230 ratio*: Indicates contamination with chaotropic salts (e.g.
      guanidine, phenol, EDTA)
      - Pure RNA: 2.0-2.2
      - Lower ratio indicates salt or organic solvent contamination

    *Procedure*:
    1. Blank with RNase-free water
    2. Measure 2 μL of RNA sample
    3. Record concentration and purity ratios

    *Limitations*:
    - Cannot distinguish RNA from DNA
    - Cannot detect degradation
    - Contaminants that absorb at 260 nm can overestimate concentration
  """#
  related: [
    "principle/exp-total-rna-isolation-trizol"
  ]
}