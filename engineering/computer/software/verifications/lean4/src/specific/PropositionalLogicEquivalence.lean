variable (p q : Prop)

theorem and_swap : p ∧ q ↔ q ∧ p :=
  Iff.intro
    (fun h : p ∧ q =>
      show q ∧ p from ⟨h.right, h.left⟩)
    (fun h : q ∧ p =>
      show p ∧ q from ⟨h.right, h.left⟩)

variable (h : p ∧ q ↔ q ∧ p)

#check Iff.mp h   -- p ∧ q → q ∧ p
#check Iff.mpr h  -- q ∧ p → p ∧ q

theorem and_swap_constructor : p ∧ q ↔ q ∧ p :=
  ⟨ fun h => ⟨h.right, h.left⟩, fun h => ⟨h.right, h.left⟩ ⟩
-- The first  `h` is inferred as `p ∧ q`
-- The second `h` is inferred as `q ∧ p`
