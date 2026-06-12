package law

ideal_gas_law: {
  content: #"""
    According to the Boyle's Law, we know that at the standard state:

    $ (p V)/T = (p_0 V_0)/T_0 $

    here $p_0, V_0, T_0$ are state variables under standard state. Under fixed
    temperature and pressure, the volume of gas is proportional to its mass $m$
    or its number of moles $n$. If we use $V_(m,0)$ to represent the volume of
    moles under standard state, then $n "mol"$ gas has a volume of $V_0 = n V_(m,
    0)$ under standard state, thus

    $ p V = n (p_0 V_(m,0))/T_0 T $

    The value of $(p_0 V_(m,0))\/T_0$ is a constant for every ideal gas. We call
    this constant as *universal gas constant* and denote it as $R$:

    $ R & = (p_0 V_(m,0))/T_0 = (1.013 × 10^5 × 22.4 × 10^(-3))/273.15 \
      & = 8.31 "J"\/("mol"⋅"K") $

    Thus *Ideal Gas Law* can be represented as:

    $ p V = n R T $

    This shows the relationship between macroscopic state variables under any
    equilibrium state.
  """#
  related: [
    "law/avogadro-law",
    "law/boyle-law",
    "law/charles-law",
    "law/gay-lussac-law",
    "concept/ideal-gas",
    "concept/ideal-gas-temperature-scale"
  ]
}