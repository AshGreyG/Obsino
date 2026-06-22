package principle

characteristics_of_esi_ms: {
  content: #"""
    === Adduct of ESI

    ESI frequently produces adduct ions instead of the bare molecular ion:
    - common positive-mode adducts:
      - $["M"+"Na"]^+$: sodium adduct from glass equipments, the most frequently
        observed adduct;
      - $["M"+"K"]^+$: potassium adduct;
      - $["M"+"H"]^+$: hydrogen adduct
    - common negative-mode adducts:
      - $["M"+"Cl"]^-$: chloride adduct;
      - $["M"+"HCOO"]^-$: formate adduct

    === Characteristics of Isotope Peak

    Many chemical elements exist in multiple stable isotopes with different mass
    numbers. In mass spectrometry, besides the main peak formed by the most
    abundant isotope, additional weaker peaks appear at higher $m\\/z$ values.
    These peaks are called *isotopic peak*. They arise from the natural abundance
    of heavier isotopes in molecules.

    #align(center)[
      #figure(
        table(
          columns: 5,
          [*Element*], [*Main Isotope*], [*Heavy Isotope*], [*Isotopic Peak*], [*Ratio*],

          [Chlorine (Cl)],
          [$space.en^(35)"Cl"$],
          [$space.en^(37)"Cl"$],
          [$"M" + 2$],
          [$"M":"M"+2 = 3:1$],

          [Bromine (Br)],
          [$space.en^(79)"Br"$],
          [$space.en^(81)"Br"$],
          [$"M" + 2$],
          [$"M":"M"+2 ≈ 1:1$],

          [Carbon (C)],
          [$space.en^(12)"C"$],
          [$space.en^(13)"C"$],
          [$"M" + 1$],
          [$"M":"M"+1 ≈ 1:n_c × 1.1%$]
        ),
        caption: "Common characteristics of isotope peaks"
      )
    ]
  """#
  related: [
    "principle/mass-spectrometry"
  ]
}