open Classical

variable (p q : Prop)

#check em p -- p ∨ ¬p

theorem double_negation_elimination (h : ¬¬p) : p :=
  Or.elim (em p)
    (fun hp : p => hp)
    (fun hnp : ¬p => absurd hnp h)

#print axioms double_negation_elimination
-- 'double_negation_elimination' depends on axioms: [propext, choice, Quot.sound]

example (h : ¬¬p) : p :=
  byCases
    (fun h₁ : p => h₁)
    (fun h₂ : ¬p => absurd h₂ h)

example (h : ¬¬p) : p :=
  byContradiction
    (fun h₁ : ¬p => show False from h h₁)

example (h : ¬(p ∧ q)) : ¬p ∨ ¬q :=
  Or.elim (em p)
    (fun hp : p =>
      Or.inr
        (show ¬q from fun hq : q => h ⟨hp, hq⟩))
    (fun hnp : ¬p =>
      Or.inl hnp)
