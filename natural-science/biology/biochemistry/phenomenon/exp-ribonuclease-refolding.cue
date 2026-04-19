package phenomenon

// experiment is also under phenomenon package

exp_ribonuclease_refolding: {
  content: #"""
    Ribonuclease is a small protein that contains 8 cysteine (Cys, C) linked via
    four disulfide bonds.

    - $β$-mercaptoethanol ($β$-巯基乙醇, BME) cleaves the disulfide bonds reversibly.
      As the disulfides in protein are reduced, the BME is oxidized and forms
      dimers;
    - Urea or guanidinium chloride disrupts the non-covalent bonds.

    // 2 OCCS -> OCCSSCCO

    - Step2. Restore the 3D structure of ribonuclease by dialysis (a method that
      slowly removes urea and $β$-mercaptoethanol).

      The denatured ribonuclease slowly regained its enzymatic activity; measured
      physical and chemical properties of the enzyme were virtually identical with
      those of the native enzyme. The enzyme spontaneously refolded into a
      catalytically active form.

    - When reduced ribonuclease was reoxidized while it was still in 8M urea and
      the preparation was then dialyzed to remove the urea, ribonuclease had only
      1% of the enzymatic activity of the native protein.

      Reason is that wrong disulfide bonds were formed in urea. Weak bonding
      interactions (like hydrogen bonds and hydrophobic interactions) are require
      for correct positioning of disulfide bonds and restoration of the native
      conformation. Then native ribonuclease can be reformed from scrambled
      ribonuclease in the presence of a trace of $β$-mercaptoethanol.

    It is mathematically impossible for protein folding to occur by randomly
    trying every conformation until the lowest energy one is found (Levinthal's
    paradox). So search for the minimum is *not random* because the direction
    toward the native structure is thermodynamically most favorable. Partly
    correct intermediates are retained: *cumulative selection*, so protein is
    folded by progressive stabilization of intermediates rather than by random
    search.

    Protein folding and unfolding is thus largely an *all or none* process that
    results from a cooperative transition. Most proteins show a sharp transition
    from the folded to unfolded form on treatment with increasing concentrations
    of denaturants.

    Regions of secondary structure may form followed by folding into motifs and
    domains. Large ensembles of folding intermediates are rapidly brought to a
    single native conformation.
  """#
}