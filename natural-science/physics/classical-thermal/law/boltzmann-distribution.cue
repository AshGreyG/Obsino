package law

boltzmann_distribution: {
  content: #"""
    For a system at temperature $T$, the probability of finding a particle in a
    state with energy $E$ is proportional to:

    $ P prop exp(-E/(k T)) $

    The factor $exp(-E\/k T)$ is called the *Boltzmann factor*. For continuous
    energy the number of molecules with energy between $E$ and $E + "d"E$ is
    proportional to

    $ f(E)"d"E prop g(E) exp(-E/(k T)) "d"E $

    where $g(E)$ is the *density of states* (number of states per unit energy
    interval). The Maxwell speed distribution is a special case of the Boltzmann
    distribution applied to translational kinetic energy.
  """#
  related: [
    "law/maxwell-speed-distribution"
  ]
}