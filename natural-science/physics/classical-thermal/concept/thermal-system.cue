package concept

thermal_system: {
  content: #"""
    A *thermodynamic system* is a geometric region of space or a finite collection
    of matter that we choose to study *separately* from its *surroundings*. We
    call the combination of system and its surrounding as *universe*.

    #align(center)[
      #table(
        columns: 4,
        align: (center, center, center, left),
        [Type], [Mass exchange], [Heat exchange], [Example],

        [*Isolated system*], [❌], [❌],
        [A perfectly insulated fixed container],

        [*Closed system*], [❌], [✅],
        [A sealed piston with heat flow allowed],

        [*Open system*], [✅], [✅],
        [A flowing fluid in a pipe]
      )
    ]

    The state of a thermodynamic system is described by a set of *macroscopic
    geometric quantities* that do not depend on the system's history. Notice,
    a system is in *thermodynamic equilibrium* if all state variables are constant
    in time and uniform throughout the system with no gradients. In equilibrium:

    - No net macroscopic flow of matter
    - No net heat flow
    - No net work exchange with surroundings
  """#
}