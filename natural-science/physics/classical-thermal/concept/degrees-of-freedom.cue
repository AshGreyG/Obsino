package concept

degrees_of_freedom: {
  content: #"""
    A *degree of freedom* is an independent coordinate needed to describe the
    position or motion of a molecule.

    #align(center)[
      #table(
        columns: 5,
        align: (left, ) + (center, ) * 4,

        [Type],
        [Translational],
        [Rotational],
        [Vibrational (kinetic + potential)],
        [Total],

        [Single atom], [3], [0], [0], [3],
        [Diatomic molecule (low temperature)], [3], [2], [0], [5],
        [Diatomic molecule (high temperature)], [3], [2], [2], [7],
        [Linear polyatomic molecule (low temperature)], [3], [2], [0], [5],
        [Linear polyatomic molecule (high temperature)], [3], [2], [$3 N - 5$], [$3 N$],
        [Nonlinear polyatomic molecule (low temperature)], [3], [3], [0], [6],
        [Nonlinear polyatomic molecule (high temperature)], [3], [3], [$3 N - 6$], [$3 N$]
      )
    ]

    Here $N$ represents the number of atoms in molecule. Linear polyatomic molecule
    is the molecule that cannot rotate freely because of double bond, like $"CO"_2$
    or $"N"_2"O"$.
  """#
}