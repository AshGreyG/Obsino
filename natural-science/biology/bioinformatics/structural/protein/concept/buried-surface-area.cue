package concept

buried_surface_area: {
  content: """
    The *Buried Surface Area (BSA)* of a protein-protein complex is the total
    surface area of the constituent protein subunits that becomes *inaccessible
    to solvent* upon complex formation.

    It quantifies the *interface size* between two or more associating biomolecules
    and serves as an helpful characteristic for the *thermodynamic stability*,
    *binding affinity* and *geometric complementarity* of the interaction.

    Let $sans("SASA")(X)$ denote the solvent-accessible surface area of a molecule
    or assembly $X$, which is typically computed using the *Shrake-Rupley rolling-
    ball algorithm* with a probe sphere of radius: $r_"probe" = 1.4 Å$ which
    approximates a water molecule.

    For a protein complex composed of two subunits $A$ and $B$, the *total buried
    surface area* is formally defined as:

    $ Δ sans("SASA") = sans("SASA")(A) + sans("SASA")(B) - sans("SASA")(A ∪ B) $

    and this includes both the buried surface area in subunits $A$ and subunits
    $B$. If we only count the one side buried surface area we should use

    $ sans("BSA") = (Δ sans("SASA")) /2 $
  """
  external_link: [
    "https://sbl.inria.fr/doc/Buried_surface_area-user-manual.html"
  ]
}