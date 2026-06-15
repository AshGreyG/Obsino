package concept

continuity: {
  content: #"""
    For probability $P$ in $σ$-algebra $cal("F")$ if $A_1 ⊂ A_2 ⊂ A_3 ⊂ ⋯$, then:

    $ P(lim_(n->∞) A_n) = P(⋃_(n=1)^∞ A_n) = lim_(n->∞) P(A_n) $

    We call $P$ is *continuous from below*.

    For probability $P$ in $σ$-algebra $cal("F")$ if $B_1 ⊃ B_2 ⊃ B_3 ⊃ ⋯$, then:

    $ P(lim_(n->∞) B_n) = P(⋂_(n=1)^∞ B_n) = lim_(n->∞) P(B_n) $

    We call $P$ is *continuous from above*.

    *If $P$ is a probability in $σ$-algebra $cal("F")$, then $P$ is continuous
    from below and also continuous from above.*
  """#
  related: [
    "concept/limit-events"
  ]
}