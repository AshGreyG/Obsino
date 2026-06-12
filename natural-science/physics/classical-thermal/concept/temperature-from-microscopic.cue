package concept

temperature_from_microscopic: {
  content: #"""
    Compare the equation from molecular pressure and ideal gas law:

    $ p V = n R T $

    where $n = N\/N_A$ is the number of moles, $R = N_A k$ and $k$ is Boltzmann
    constant. We substitute into $p V = 2\/3 N ⟨E_k⟩$:

    $ 2/3 N ⟨E_k⟩ = n R T = N/N_A (N_A k) T = N k T $

    thus we obtain the relation between average translational kinetic energy and
    the microscopic meaning temperature:

    $ ⟨E_k⟩ = 3/2 k T $

    So *temperature is a measure of the average translational kinetic energy of
    the molecules*. At absolute zero, $T = 0$, so $⟨E_k⟩ = 0$ all molecular motion
    stops. Temperature is not a property of a single molecule, it is a *statistical
    average over a huge number of molecules*.
  """#
  related: [
    "concept/boltzmann-constant",
    "concept/average-translational-kinetic-energy",
    "law/ideal-gas-law"
  ]
}