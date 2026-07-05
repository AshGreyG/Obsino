variable (p q : Prop)

example (hp : p) (hq : q) : p ∧ q := And.intro hp hq
#check fun (hp : p) (hq : q) => And.intro hp hq
-- fun hp hq => ⟨hp, hq⟩ : p → q → p ∧ q

example (h : p ∧ q) : p := And.left h
example (h : p ∧ q) : q := And.right h

example (h : p ∧ q) : q ∧ p :=
  And.intro (And.right h) (And.left h)

example (h : p ∧ q) : q ∧ p :=
  ⟨h.right, h.left⟩

structure DefinedAnd (p : Prop) (q : Prop) : Prop where
  intro ::
  left : p
  right : q
