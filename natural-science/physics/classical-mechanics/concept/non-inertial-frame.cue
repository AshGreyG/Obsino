package concept

non_inertial_frame: {
  content: #"""
    In Newtonian spacetime, consider a reference frame $S'$ that moves relative
    to an inertial frame $S$. If the origin $cal("O")'$ of $S'$ accelerates
    relative to $S$, or the basis vector ${ub(e)'_j}$ of $S'$ rotate relative
    to $S$, then $S'$ is called a *non-inertial frame*.

    In geometric language:

    - Position of $S'$ origin: $ub(x)_(cal("O")')(t)$ and $"d"^2ub(x)_(cal("O")')
      \/"d"t^2 ≠ ub(0)$ (translational acceleration);
    - Or the basis vectors of $S'$ rotate relative to $S$: angular velocity
      $bold(ω)(t) ≠ ub(0)$.

    In a non-inertial frame, Newton's second law $ub(F) = m ub(a)'$ does not hold
    where $ub(a)'$ is the acceleration measured in $S'$. To preserve form of
    Newton's second law, we need to introduce *inertial force* (also called
    *fictitious* or *non-inertial force*).

    Let:

    - $S$: inertial frame;
    - $S'$: non-inertial frame (translational acceleration + rotation);
    - $cal("O")$: origin of $S$;
    - $cal("O")'$: origin of $S'$;
    - ${ub(e)_1, ub(e)_2, ub(e)_3}$: basis vector fixed in $S$, time-independent;
    - ${ub(e)'_1 (t), ub(e)'_2 (t), ub(e)'_3 (t)}$: basis vector fixed in $S'$,
      rotating with time.

    Any vector $ub(A)$ can be expanded in either basis. Components measured in
    $S'$ are denoted $A'_j$. And we know position vector of the particle:

    $ ub(x)(t) = ub(x)_(cal("O")') (t) + ub(x)'(t) $

    Differentiate the position equation with respect to time. The second term
    at right side $"d"ub(x)'\/"d"t$ requires care: $ub(x)'$ is expanded in the
    $S'$ basis and these basis vectors themselves rotate in $S$.

    $ ub(x)' = x'_j (t)ub(e)'_j (t) $

    where $x'_j (t)$ are the components measured in $S'$ (scalar functions).
    So we differentiate it using the product rule:

    $ ("d"ub(x)')/("d"t) & = ("d"x'_j)/("d"t) ub(e)'_j + x'_j ("d"ub(e)'_j)/("d"t) \
      & = ub(v)' + bold(ω) × ub(x)' $

    where:

    - First term: $"d"x'_j\/"d"t ub(e)'_j$ is the relative velocity as seen in $S'$;
    - Second term $x'_j "d"ub(e)'_j\/"d"t$: since the basis vectors rotate,
      $"d"ub(e)'_j\/"d"t$ can be expressed using the angular velocity vector
      $bold(ω)$:

    $ ("d"ub(e)'_j)/("d"t) = bold(ω) × ub(e)'_j $

    Thus

    $ x'_j ("d"ub(e)'_j)/("d"t) = x'_j (bold(ω) × ub(e)'_j) = bold(ω) × (x'_j
      ub(e)'_j) = bold(ω) × ub(x)' $

    Therefore we have:

    $ ub(v) = ub(v)_(cal("O")') + ub(v)' + bold(ω) × ub(x)' $

    Differential the velocity transformation with respect to time:

    $ ("d"ub(v))/("d"t) = ("d"ub(v)_(cal(O)'))/("d"t) + ("d"ub(v)')/("d"t)
      + "d"/("d"t) (bold(ω) × ub(x)') $

    The left side is the acceleration in $S$: $ub(a)$. The first item is the
    acceleration of the origin $cal("O")'$: $ub(a)_(cal("O")')$. The second term
    $"d"ub(v)'\/"d"t$, again, $ub(v)'$ should be expanded in the rotating $S'$
    basis. Using the same method as before:

    $ ("d"ub(v)')/("d"t) = ub(a)' + bold(ω) × ub(v)' $

    where $ub(a)'$ is the relative acceleration measured in $S'$ (derivative of
    the components of $ub(v)'$). $bold(ω) × ub(v)'$ comes from the rotation of
    the basis.

    The third term should use the product rule:

    $ "d"/("d"t) (bold(ω) × ub(x)') & = ("d"bold(ω))/("d"t) × ub(x)' + bold(ω)
        × ("d"ub(x)')/("d"t) \
      & = dot(bold(ω)) × ub(x)' + bold(ω) × (ub(v)' + bold(ω) × ub(x)') \
      & = dot(bold(ω)) × ub(x)' + bold(ω) × ub(v)' + bold(ω) × (bold(ω) ×
        ub(x)') $

    Now sum all terms:

    $ ub(a) & = ub(a)_(cal("O")') + (ub(a)' + bold(ω) × ub(v)') +
        (dot(bold(ω)) × ub(x)' + bold(ω) × ub(v)' + bold(ω) × (bold(ω) × ub(x)')) \
      & = #rect[
        $
          ub(a)_(cal("O")') + ub(a)' + 2 bold(ω) × ub(v)' + dot(bold(ω)) ×
          ub(x)' + bold(ω) × (bold(ω) × ub(x)')
        $
      ] $

    This is the acceleration transformation formula.

    In the inertial frame $S$, Newton's second law holds:

    $ ub(F) = m ub(a) $

    Substitute the acceleration transformation:

    $ ub(F) & = m(ub(a)_(cal("O")') + ub(a)' + 2 bold(ω) × ub(v)' + dot(bold(ω)) ×
        ub(x)' + bold(ω) × (bold(ω) × ub(x)')) \
      ⇔ m ub(a)' & = ub(F) - m ub(a)_(cal("O")') - 2m bold(ω) × ub(v)'
      - m dot(bold(ω)) × ub(x)' - m bold(ω) × (ω × ub(x)') $

    Define the *inertial force* $ub(F)_"inertial"$ (also called fictitious force)
    as the sum of all terms on the right except $ub(F)$:

    $ ub(F)_"inertial" = - m ub(a)_(cal("O")') - 2m bold(ω) × ub(v)'
      - m dot(bold(ω)) × ub(x)' - m bold(ω) × (ω × ub(x)') $

    Then in the non-inertial frame $S'$, Newton's second law can be written in
    the formal "force = mass × acceleration" form:

    $ ub(F) + ub(F)_("inertial") = m ub(a)' $

    This is the purpose of introducing inertial forces: to preserve the form of
    Newton's second law, while absorbing the effects of the frame's non-inertial
    motion into an additional force.

    #align(center)[
      #table(
        columns: 4,
        [Term], [Name], [When to appear], [Geometrical source],

        [$-m ub(a)_(cal("O")')$],
        [translational inertial force],
        [origin of $S'$ has acceleration],
        [whole non-inertial frame has acceleration],

        [$-2m bold(ω) × ub(v)'$],
        [Coriolis force],
        [$S'$ rotates and the point has velocity],
        [$S'$ rotates + relative motion],

        [$-m dot(bold(ω)) × ub(x)'$],
        [Euler force],
        [angular velocity of $S'$ changes],
        [rotation of $S'$ accelerates or decelerates],

        [$-m bold(ω) × (bold(ω) × ub(x)')$],
        [centrifugal inertial force],
        [rotation of $S'$ (despite the point is still)],
        [rotation itself]
      )
    ]
  """#
  related: [
    "law/newton-second-law",
    "concept/angular-speed"
  ]
}
