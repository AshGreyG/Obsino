package concept

zero_order_release: {
  content: """
    In pharmacokinetics, *zero-order release* describes a drug delivery system
    where the drug is released at a *constant rate* $k_0$, regardless of the
    concentration of the drug remaining in the dosage form. This is the goal of
    many extended-release (ER) or controlled-release (CR) tablets.

    1. *The Differential Equation*

      The rate of change in the amount of drug in the delivery system is constant

      $ (upright(d) A)/(upright(d) t) = -k_0 $

      Where $k_0$ is the zero-order release rate constant (units: mass/time);

    2. *Plasma Concentration Function*

      When a drug is released at a zero-order rate (like an IV infusion or a zero
      order oral pump) and eliminated via first-order kinetics, the plasma
      concentration at time $t$ during the release phase is expressed as:

      $ C_p = (k_0)/(V_d ⋅ k_e)(1 - upright(e)^(-k_e ⋅ t)) $

      Where
      / $C_p$:  concentration in plasma at time $t$.
      / $k_0$:  zero-order release rate constant.
      / $V_d$:  apparent volume of distribution.
      / $k_e$:  first-order elimination rate constant.
      / $t$:    time elapsed since the start of release.

    Proof:

    To derive the plasma concentration function for a zero-order release system,
    we look at the balance between the *rate of input* (constant) and the *rate
    of output* (proportional to concentration):

    $ (upright(d) C_p)/(upright(d) t) = "rate"_"in" - "rate"_"out" 
      = (k_0)/(V_d) - k_e ⋅ C_p $

    We integrate this equation (assuming an initial concentration of 0 at $t=0$):

    $ & (upright(d) C_p)/(upright(d) t) = (k_0)/(V_d) - k_e ⋅ C_p \\
      ⟺ & ∫_0^(C_p) (upright(d) C_p) / (k_0\/V_d - k_e ⋅ C_p) = ∫_0^t upright(d)t \\
      ⟺ & - 1/(k_e) ln((k_0)/(V_d) - k_e C_p) - (-1/(k_e) ln k_0/V_d) = t \\
      ⟺ & k_0/V_d - k_e C_p = exp(ln k_0/V_d - k_e t) \\
      ⟺ & C_p = (k_0)/(V_d k_e)(1 - upright(e)^(-k_e t)) $

    \(figure_part)
  """
  related: [
    "concept/first-order-elimination-rate"
  ]
  figure_part: #"""
    #let z = "assets/zero-order-release.svg"
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 70%)[
          #figure(
            image(z),
            caption: "Plasma Concentration/Time Curve of Zero Order Release"
          )
        ],
      ]
    ]
  """#
}