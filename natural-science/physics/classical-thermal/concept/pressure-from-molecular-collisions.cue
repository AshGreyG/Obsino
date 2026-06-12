package concept

pressure_from_molecular_collisions: {
  content: #"""
    Gas pressure is caused by molecules colliding with the walls of the container.
    Each collision transfers a small amount of *momentum* to the wall. The
    average force per unit area is the pressure:

    1. Consider a cubic container of side length $L$. A single molecule of mass
      $m$ moves with velocity component $v_x$ toward the right wall. Before
      collision the momentum is $+m v_x$ and after *elastic collision* momentum
      is $-m v_x$, thus change in momentum of the molecule:

      $ Δ p_"molecule" = -2 m v_x $

      According to Newton's Third Law, the wall gains momentum $+2 m v_x$ per
      collision.

      Time between the one molecule travels to the opposite wall and back:

      $ Δ t = (2 L)/(v_x) $

      Force from this one molecule on the wall:

      $ F_"one" = (2 m v_x)/(2 L \/ v_x) = (m v_x^2)/L $

    2. For $n$ molecules the total force on the wall is the sum over all molecules:

      $ F = ∑_(i=1)^n (m v_(x,i)^2)/L = m/L ∑_(i=1)^n v_(x,i)^2 $

      and pressure $p = F\/A$ where $A = L^2$ is the wall area and volume $V=L^3$:

      $ p = F/A = m/L^3 ∑_(i=1)^n v_(x,i)^2 = m/V ∑_(i=1)^n v_(x,i)^2 $

    3. Define the *average* of $v_x^2$:

      $ ⟨v_x^2⟩ = 1/n ∑_(i=1)^n v_(x,i)^2 $

      thus

      $ p V = n m ⟨v_x^2⟩ $

    4. Because molecular motion is *random* and *isotropic*:

      $ ⟨v_x^2⟩ = ⟨v_y^2⟩ = ⟨v_z^2⟩ $

      and

      $ ⟨v^2⟩ = ⟨v_x^2⟩ + ⟨v_y^2⟩ + ⟨v_z^2⟩ = 3 ⟨v_x^2⟩ $

      Substitute into the expression of pressure we obtain

      $ p V = 1/3 n m ⟨v^2⟩ $

      From the definition of average translational kinetic energy.

      $ p V = 1/3 n m ⟨v^2⟩ = 2/3 n (1/2 m ⟨v^2⟩) = 2/3 n ⟨E_k⟩ $

    This is the fundamental equation of the kinetic theory of gases.
  """#
  external_related: [
    "natural-science.physics.classical-mechanics/concept/momentum",
    "natural-science.physics.classical-mechanics/law/newton-third-law",
  ]
  related: [
    "concept/average-translational-kinetic-energy"
  ]
}