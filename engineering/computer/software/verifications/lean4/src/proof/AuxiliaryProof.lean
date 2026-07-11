variable (p q : Prop)

example (h : p ∧ q) : q ∧ p :=
  have hp : p := h.left
  have hq : q := h.right
  show q ∧ p from ⟨hq, hp⟩

example (h : p ∧ q) : q ∧ p :=
  have hp : p := h.left
  suffices hq : q from And.intro hq hp
  -- Writing `suffices hq : q` leaves us with two goals.
  -- First we have to show that it indeed suffices to show `q`, by proving the
  -- original goal of `q ∧ p` with the additional hypothesis `hq : q`
  show q from And.right h
