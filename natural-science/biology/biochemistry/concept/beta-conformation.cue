package concept

beta_conformation: {
  content: #"""
    In $β$-conformation, the backbone is more extended with the $ψ$ dihedral in
    the range ($+90° < ψ < +180°$). The planarity of the peptide and tetrahedral
    geometry of the $α$-carbon create a *pleated sheet-like* structure. This
    sheet-like arrangement of backbone is held together by hydrogen bonds
    between the *more distal* backbone amides. Side chains protrude from the
    sheet alternating in up and down direction.

    Parallel or antiparallel orientations of two chains within a sheet are
    both possible. But the antiparallel orientation is significantly more
    stable than the parallel orientation.

    - Antiparallel $β$-sheets: The strands run in opposite directions (H-N-C=O
      next to O=C-N-H), this allows the hydrogen bonds to be *linear* and
      *straight*. In structural chemistry, linear hydrogen bonds are shorter and
      stronger because the orbital overlap is optimal;

    - Parallel $β$-sheets: The strands run in the same direction. To accommodate
      the spacing of the atoms, the hydrogen bonds must be *skewed* and *bent*.
      These non-linear bonds are longer and inherently weaker.

    $β$-turns occur frequently whenever strands in $β$-sheets change the
    direction. The $180°$ turn is accomplished over four amino acids. *The turn
    is stabilized by a hydrogen bond from a carbonyl oxygen to amide proton $3$
    residues down the sequence*.

    Proline in position $2$ (Type I) or Glycine in position $3$ (Type II) are
    common in $β$-turns.

    ```plaintext
    ------β strand 1---->--\
                           | β turn
    --<---β strand 2-------/
    ```
  """#
  related: [
    "concept/secondary-structure",
    "concept/alpha-helix"
  ]
}