variable (p q r : Prop)

example (hpq : p → q) (hnq : ¬q) : ¬p :=
  fun hp : p =>
  show False from hnq (hpq hp)

example (hp : p) (hnp : ¬p) : q :=
  False.elim (hnp hp)

example (hp : p) (hnp : ¬p) : q :=
  absurd hp hnp

example (hnp : ¬ p) (hq : q) (hqp : q → p) : r :=
  absurd (hqp hq) hnp
