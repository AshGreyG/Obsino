package concept

solvent_accessible_surface_area: {
  content: """
    The *Solvent-Accessible Surface Area (SASA)* of a molecule is the surface
    area defined by the *locus of the center of a spherical probe* as it rolls over
    the van der Waals surface of the molecule.

    It quantifies the *extent of molecular surface that is accessible to solvent
    molecules* (typically water), and is a fundamental geometric descriptor in
    structural biology.

    Let $cal("M")$ be a molecule represented as a collection of $N$ atoms. And
    each atom $i$ has van der Waals radius $r_i$ and center position $ub(p)_i
    ∈ ℝ^3$. Define a *probe sphere* of radius $r_"probe"$ used to approximate
    a water molecule.

    The *solvent-accessible surface* is the surface traced by the *center* of the
    probe sphere as it maintains contact with the van der Waals surface of the
    molecule without penetrating any atom. Equivalently the solvent-accessible
    surface is the *outer boundary* of the *Minkowski sum*:

    $ cal("S")_(sans("SASA")) = ∂(cal("M") ⊕ cal("B")_(r_"probe")) $

    where
    - $⊕$ denotes the Minkowski sum;
    - $cal("B")_r$ is a closed ball of radius $r$;
    - $∂$ denotes the boundary operator.

    \(figure_part_sasa)

    Then the *solvent-accessible surface area* is defined as:

    $ sans("SASA") = ∫_(∂(⋃_(i=1)^N B(ub(p), r_i + r_"probe"))) "d"A $

    where
    - $B(ub(p)_i, r_i + r_"prove")$ is a sphere centered at $ub(p)_i$ with radius
      $r_i + r_"probe"$;
    - $"d"A$ is the differential surface area element
    - The integral is taken over the *exposed* portion of the union surface

    And there is an alternative representation based on atom-level: for each atom
    $i$, let
    - $A_i =$ surface area of atom $i$'s' expanded sphere;
    - $θ_i =$ fraction of that sphere's surface that is accessible which is not
      buried by neighboring atoms;

    $ sans("SASA") = ∑_(i=1)^N A_i ⋅ θ_i = ∑_(i=1)^N 4 π (r_i + r_"probe")^2 θ_i $

    and $θ_i ∈ [0,1]$ is determined by the extent of overlap with all neighboring
    atoms $j ≠ i$.
  """
  figure_part_sasa: #"""
    #align(center)[
      #figure(
        image("figures://solvent-accessible-surface-area", width: 70%),
        caption: "Simplified model of Solvent Accessible Surface Area"
      )
    ]
  """#
  related: [
    "concept/buried-surface-area"
  ]
}