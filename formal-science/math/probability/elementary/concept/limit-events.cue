package concept

limit_events: {
  content: #"""
    For monotone sequences, the limit of set is uniquely and naturally defined.

    - *Increasing sequences (expanding events)*: a sequence ${A_n}_(n≥1)$ is
      increasing or non-decreasing if

      $ A_1 ⊂ A_2 ⊂ A_3 ⊂ ⋯ $

      That is, each event is contained in the next one. Once an outcome occurs, it
      remains in all later events. For example $A_n =$ the first head appears on
      or before toss $n$ in a sequence of coin tosses, as $n$ increases $A_n$ only
      grows. *Limit of an increasing sequence* (also called the *union limit*):

      $ lim_(n->∞) A_n = ⋃_(n=1)^∞ A_n $

      This is the event that $A_n$ occurs for some $n$.

    - *Decreasing sequences (shrinking events)*: a sequence ${B_n}_(n≥1)$ is 
      decreasing or non-increasing if

      $ B_1 ⊃ B_2 ⊃ B_3 ⊃ ⋯ $

      That is, each event is contained in the previous one. Once an outcome drops
      out, it is gone forever. For example $B_n =$ all tosses from $1$ to $n$ are
      heads, as $n$ increases, $B_n$ shrinks (the condition becomes stricter).
      *Limit of an decreasing sequence* (also called the *intersection limit*):

      $ lim_(n->∞) B_n = ⋂_(n=1)^∞ B_n $

      This is the event that $B_n$ occurs for all $n$.
  """#
  related: [
    "concept/intersection-of-events",
    "concept/union-of-events"
  ]
}