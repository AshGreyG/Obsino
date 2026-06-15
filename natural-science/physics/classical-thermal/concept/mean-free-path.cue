package concept

mean_free_path: {
  content: #"""
    *Mean free path* $λ$ is the average distance a molecule travels between two
    successive collisions. Mean free path and mean collision frequency are
    related by:

    $ λ = (⟨v⟩)/f $

    where $⟨v⟩$ is the *average speed* of the molecules.

    Think of a molecule moving through a gas with *number density* $n = N/V$
    (number of molecules per unit volume). The molecule sweeps out a *cylinder*
    of collision cross-section area $σ$ as it moves.

    In a short time $Δ t$, it travels a distance $v Δ t$ and sweeps a volume of
    $σ v Δ t$ (absolute). Any other molecules whose center lies inside this swept
    volume will be hit. In reality, the relevant quantity is the *relative velocity*
    between the two molecules.

    Consider two molecules who have velocity $ub(v)_1$ and $ub(v)_2$. So the
    relative speed is $ub(v)_"rel" = ub(v)_2 - ub(v)_1$:

    $ ⟨v_"rel"^2⟩ = ⟨(ub(v)_2 - ub(v)_1)^2⟩ = ⟨v_1^2⟩ + ⟨v_2^2⟩
      - 2 ⟨ub(v)_1 ⋅ ub(v)_2⟩ $

    Because velocities are uncorrelated and isotropic, so the distribution of
    $ub(v)_1 ⋅ ub(v)_2$ is uniform and $⟨ub(v)_1 ⋅ ub(v)_2⟩ = 0$. Also $⟨v_1^2⟩ 
    = ⟨v_2^2⟩ = ⟨v^2⟩$. Thus

    $ ⟨v_"rel"^2⟩ = 2 ⟨v^2⟩ $

    Taking square roots approximating $sqrt(⟨v_"rel"^2⟩) ≈ ⟨v_"rel"⟩$ for a
    *Maxwellian distribution*:

    $ ⟨v_"rel"⟩ = sqrt(2) ⟨v⟩ $

    Thus the expected number of collisions in $Δ t$ is:

    $ ("number of targets in swept volume") = n ⋅ σ ⟨v_"rel"⟩ Δ t $

    The mean free path is the average distance traveled per collision:

    $ λ = (v Δ t)/(n σ ⟨v_"rel"⟩ Δ t) = 1/(sqrt(2) n σ) = 1/(sqrt(2) π d^2 n) $
  """#
  related: [
    "concept/mean-collision-frequency",
    "concept/collision-cross-section"
  ]
}