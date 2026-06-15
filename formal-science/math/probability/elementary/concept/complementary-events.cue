package concept

complementary_events: {
  content: #"""
    Two events $A$ and $overline(A)$ are *complementary events* (also called
    opposite events). They are *mutually exclusive*, $A ∩ overline(A) = ∅$. Their
    union is the entire sample space: $A ∪ overline(A) = Ω$. Its definition can
    be:

    $ overline(A) := {ω ∈ Ω: ω ∉ A} = Ω - A $
  """#
  related: [
    "concept/difference-of-events"
  ]
}