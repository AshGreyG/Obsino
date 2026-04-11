package concept

hlb: {
  content: #"""
    HLB is an acronym for Hydrophilic-Lipophilic Balance, a numerical scale to
    characterize surfactants by their relative affinity for water vs. oil.

    There is a experience formula to calculate the magnitude of HLB:

    $ "HLB" = (M_("hydro"))/(M_("hydro") + M_("lipo")) × 20 $

    It quantifies the balance between a surfactant's hydrophilic and lipophilic
    regions. The *higher the HLB value*, the *more hydrophilic* the surfactant;
    the *lower the value*, the *more lipophilic* it is.

    - The higher the HLB value, it's more appropriate for O/W system (oil in
      water system, 水包油);
    - The lower  the HLB value, it's more appropriate for W/O system (water in'
      oil system, 油包水).
  """#
  related: [
    "concept/optimal-hlb"
  ]
}