variable (p q r : Prop)

example (hp : p) : p ∨ q := Or.intro_left  q hp
example (hq : q) : p ∨ q := Or.intro_right p hq
example (h : p ∨ q) : q ∨ p :=
  Or.elim h
    (fun hp : p => show q ∨ p from Or.intro_right q hp)
    (fun hq : q => show q ∨ p from Or.intro_left  p hq)
example (h : p ∨ q) : q ∨ p :=
  Or.elim h (fun hp => Or.inr hp) (fun hq => Or.inl hq)
