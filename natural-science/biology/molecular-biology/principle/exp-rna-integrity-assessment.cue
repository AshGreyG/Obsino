package principle

exp_rna_integrity_assessment: {
  content: #"""
    RNA integrity assessment is critical for ensuring that isolated RNA is
    suitable for downstream applications. Since mRNA comprises only 1-3% of total
    RNA, its quality is typically assessed indirectly by examining rRNA bands.

    *Native (non-denaturing) agarose gel electrophoresis method*:
    - Run RNA samples on 1.2% agarose gel at 120 V for ~20 minutes
    - Use 3x loading buffer (1:2 ratio, RNA:buffer)
    - *Visualize rRNA bands*: 28S and 18S in animals; 25S and 18S in plants

    *Quality indicators*:
    - *Intact RNA*: Clear, sharp 28S and 18S bands with 28S:18S ratio
      approximately 2:1 in animals
    - *Partially degraded RNA*: Smearing between bands, decreased 28S:18S ratio
    - *Completely degraded RNA*: No distinct bands, low molecular weights smear
  """#
  related: [
    "principle/exp-total-rna-isolation-trizol"
  ]
}