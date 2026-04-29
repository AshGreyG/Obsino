package concept

first_order_elimination_rate: {
  content: #"""
    The *first-order elimination rate constant* ($k_e$) is a value that represents
    the fraction of a drug that is removed from the body per unit of time. In
    first-order kinetics which applies to most drugs at therapeutic doses, the
    rate of elimination is directly proportional to the concentration of the drug.
    However, the *fraction* removed stays constant regardless of how much drug
    is in the system.

    The decrease in drug concentration over time is expressed by the differential
    equation:

    $ (upright(d) C)/(upright(d) t) = -k_e C $

    When integrated, this gives the standard first-order decay equation used to
    plot plasma-concentration/time curve:

    $ C_t = C_0 ⋅ upright(e)^(-k_e ⋅ t) $

    Where
    / $C_t$: concentration at time $t$.
    / $C_0$: initial concentration.
    / $k_e$: first-order rate constant 
  """#
}