package concept

bcs: {
  content: #"""
    BCS (Biopharmaceutics Classification System) is a scientific framework that
    classifies drug substances based on their aqueous solubility and intestinal
    permeability. It predicts the rate and extent of oral drug absorption from
    the gastrointestinal tract.

    It can be represented by a xy-plane whose x-axis is *Volume Required to
    Dissolve the Highest Dose (mL)* and y-axis is *Permeability ($1×10^(-6)"cm"\/
    "s"$)*

    #align(center)[
      #table(
        columns: 3,
        [solubility], [permeability], [classification],
        [high],       [high],         [I],
        [low],        [high],         [II],
        [high],       [low],          [III],
        [low],        [low],          [IV]
      )
    ]

    BCS classifies the API (active pharmaceutical ingredient).
  """#
  related: [
    "concept/solubility",
    "concept/permeability"
  ]
}