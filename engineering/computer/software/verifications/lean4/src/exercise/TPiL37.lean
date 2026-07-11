open Classical

variable (p q r : Prop)

theorem and_commutativity : p ∧ q ↔ q ∧ p :=
  Iff.intro
    (fun h : p ∧ q => show q ∧ p from ⟨h.right, h.left⟩)
    (fun h : q ∧ p => show p ∧ q from ⟨h.right, h.left⟩)

theorem or_commutativity : p ∨ q ↔ q ∨ p :=
  Iff.intro
    (fun h : p ∨ q =>
      Or.elim h
        (fun hp : p => show q ∨ p from Or.inr hp)
        (fun hq : q => show q ∨ p from Or.inl hq))
    (fun h : q ∨ p =>
      Or.elim h
        (fun hq : q => show p ∨ q from Or.inr hq)
        (fun hp : p => show p ∨ q from Or.inl hp))

theorem and_associativity : (p ∧ q) ∧ r ↔ p ∧ (q ∧ r) :=
  Iff.intro
    (fun h : (p ∧ q) ∧ r =>
      show p ∧ (q ∧ r) from ⟨h.left.left, ⟨h.left.right, h.right⟩⟩)
    (fun h : p ∧ (q ∧ r) =>
      show (p ∧ q) ∧ r from ⟨⟨h.left, h.right.left⟩, h.right.right⟩)

theorem or_associativity : (p ∨ q) ∨ r ↔ p ∨ (q ∨ r) :=
  Iff.intro
    (fun h : (p ∨ q) ∨ r =>
      Or.elim h
        (fun hpq : p ∨ q =>
          Or.elim hpq
            (fun hp : p => show p ∨ (q ∨ r) from Or.inl hp)
            (fun hq : q => show p ∨ (q ∨ r) from Or.inr (Or.inl hq)))
        (fun hr : r => show p ∨ (q ∨ r) from Or.inr (Or.inr hr)))
    (fun h : p ∨ (q ∨ r) =>
      Or.elim h
        (fun hp : p => show (p ∨ q) ∨ r from Or.inl (Or.inl hp))
        (fun hqr : q ∨ r =>
          Or.elim hqr
            (fun hq : q => show (p ∨ q) ∨ r from Or.inl (Or.inr hq))
            (fun hr : r => show (p ∨ q) ∨ r from Or.inr hr)))

theorem and_distributive : p ∧ (q ∨ r) ↔ (p ∧ q) ∨ (p ∧ r) :=
  Iff.intro
    (fun h : p ∧ (q ∨ r) =>
      have hp : p := h.left
      have hqr : q ∨ r := h.right
      Or.elim hqr
        (fun hq : q => show (p ∧ q) ∨ (p ∧ r) from Or.inl (And.intro hp hq))
        (fun hr : r => show (p ∧ q) ∨ (p ∧ r) from Or.inr (And.intro hp hr)))
    (fun h : (p ∧ q) ∨ (p ∧ r) =>
      Or.elim h
      (fun hpq : p ∧ q =>
        have hp : p := hpq.left
        have hq : q := hpq.right
        show p ∧ (q ∨ r) from And.intro hp (Or.inl hq))
      (fun hpr : p ∧ r =>
        have hp : p := hpr.left
        have hr : r := hpr.right
        show p ∧ (q ∨ r) from And.intro hp (Or.inr hr)))

theorem or_distributive : p ∨ (q ∧ r) ↔ (p ∨ q) ∧ (p ∨ r) :=
  Iff.intro
    (fun h : p ∨ (q ∧ r) =>
      Or.elim h
        (fun hp : p => show (p ∨ q) ∧ (p ∨ r)
          from ⟨Or.inl hp, Or.inl hp⟩)
        (fun hqr : q ∧ r => show (p ∨ q) ∧ (p ∨ r)
          from ⟨Or.inr hqr.left, Or.inr hqr.right⟩))
    (fun h : (p ∨ q) ∧ (p ∨ r) =>
      have hpq : p ∨ q := h.left
      have hpr : p ∨ r := h.right
      Or.elim hpq
        (fun hp : p => show p ∨ (q ∧ r) from Or.inl hp)
        (fun hq : q =>
          Or.elim hpr
            (fun hp : p => show p ∨ (q ∧ r) from Or.inl hp)
            (fun hr : r => show p ∨ (q ∧ r) from Or.inr ⟨hq, hr⟩)))

example : (p → (q → r)) ↔ (p ∧ q → r) :=
  Iff.intro
    (fun h : p → (q → r) =>
      fun hpq : p ∧ q =>
        have hp : p := hpq.left
        have hq : q := hpq.right
        show r from h hp hq)
    (fun h : p ∧ q → r =>
      fun hp : p =>
        fun hq : q =>
          show r from h ⟨hp, hq⟩)

example : ((p ∨ q) → r) ↔ (p → r) ∧ (q → r) :=
  Iff.intro
    (fun h : (p ∨ q) → r =>
      And.intro
        (fun hp : p => show r from h (Or.inl hp))
        (fun hq : q => show r from h (Or.inr hq)))
    (fun h : (p → r) ∧ (q → r) =>
      have hpr : p → r := h.left
      have hqr : q → r := h.right
      fun hpq : p ∨ q =>
        Or.elim hpq
          (fun hp : p => show r from hpr hp)
          (fun hq : q => show r from hqr hq))

example : ¬(p ∨ q) ↔ ¬p ∧ ¬q :=
  Iff.intro
    (fun h : ¬(p ∨ q) =>
      And.intro
        (fun hp : p => show False from h (Or.inl hp))
        (fun hq : q => show False from h (Or.inr hq)))
    (fun h : ¬p ∧ ¬q =>
      have hnp : ¬p := h.left
      have hnq : ¬q := h.right
      fun hpq : p ∨ q =>
        Or.elim hpq
          (fun hp : p => show False from hnp hp)
          (fun hq : q => show False from hnq hq))

example : ¬p ∨ ¬q → ¬(p ∧ q) :=
  fun h : ¬p ∨ ¬q =>
    Or.elim h
      (fun hnp : ¬p =>
        fun hpq : p ∧ q => show False from hnp hpq.left)
      (fun hnq : ¬q =>
        fun hpq : p ∧ q => show False from hnq hpq.right)

example : ¬(p ∧ ¬p) :=
  fun h : p ∧ ¬p =>
    have hp : p := h.left
    have hnp : ¬p := h.right
    show False from hnp hp

example : p ∧ ¬q → ¬(p → q) :=
  fun h : p ∧ ¬q =>
    have hp : p := h.left
    have hnq : ¬q := h.right
    fun hpq : p → q =>
      show False from hnq (hpq hp)

example : ¬p → (p → q) :=
  fun hnp : ¬p =>
    fun hp : p =>
      show q from False.elim (hnp hp)

example : (¬p ∨ q) → (p → q) :=
  fun h : ¬p ∨ q =>
    fun hp : p =>
      Or.elim h
        (fun hnp : ¬p => False.elim (hnp hp))
        (fun hq : q => hq)

example : p ∨ False ↔ p :=
  Iff.intro
    (fun orf : p ∨ False =>
      Or.elim orf
        (fun hp : p => show p from hp)
        (fun f : False => show p from False.elim f))
    (fun hp : p => show p ∨ False from Or.inl hp)

example : p ∧ False ↔ False :=
  Iff.intro
    (fun andf : p ∧ False => andf.right)
    (fun f : False => False.elim f)

example : (p → q) → (¬q → ¬p) :=
  fun h : p → q =>
    fun hnq : ¬q =>
      fun hp : p => show False from hnq (h hp)

-- Under examples are all need to proved by classical logic, in constructive logic
-- we need choose which branch is true and give the constructive proof, but in
-- classical logic it's not needed.

example : (p → q ∨ r) → ((p → q) ∨ (p → r)) :=
  fun h : p → q ∨ r =>
    Or.elim (em p)  -- em p is excluded middle
      (fun hp : p =>
        Or.elim (h hp)
          (fun hq : q => show (p → q) ∨ (p → r) from Or.inl (fun _ => hq))
          (fun hr : r => show (p → q) ∨ (p → r) from Or.inr (fun _ => hr)))
      (fun hnp : ¬p =>
        show (p → q) ∨ (p → r) from Or.inl (fun hp : p => False.elim (hnp hp)))

example : ¬(p ∧ q) → ¬p ∨ ¬q :=
  fun h : ¬(p ∧ q) =>
    Or.elim (em p)
      (fun hp : p =>
        Or.elim (em q)
          (fun hq : q =>
            have hpq : p ∧ q := ⟨hp, hq⟩
            show ¬p ∨ ¬q from False.elim (h hpq))
          (fun hnq : ¬q => show ¬p ∨ ¬q from Or.inr hnq))
      (fun hnp : ¬p => show ¬p ∨ ¬q from Or.inl hnp)

example : ¬(p → q) → p ∧ ¬q :=
  fun h : ¬(p → q) =>
    Or.elim (em p)
      (fun hp : p =>
        Or.elim (em q)
          (fun hq : q => show p ∧ ¬q from False.elim (h fun _ => hq))
          (fun hnq : ¬q => show p ∧ ¬q from ⟨hp, hnq⟩))
      (fun hnp : ¬p =>
        Or.elim (em q)
          (fun hq : q => show p ∧ ¬q from False.elim (h fun _ => hq))
          (fun _ : ¬q =>
            show p ∧ ¬q from False.elim (h fun hp => False.elim (hnp hp))))

example : (p → q) → (¬p ∨ q) :=
  fun h : p → q =>
    Or.elim (em p)
      (fun hp : p =>
        have hq : q := h hp
        show ¬p ∨ q from Or.inr hq)
      (fun hnp : ¬p =>
        show ¬p ∨ q from Or.inl hnp)

example : (¬q → ¬p) → (p → q) :=
  fun h : ¬q → ¬p =>
    Or.elim (em q)
      (fun hq : q => fun _ => hq)
      (fun hnq : ¬q =>
        have hnp : ¬p := h hnq
        show p → q from fun hp : p => False.elim (hnp hp))

example : p ∨ ¬p :=
  Or.elim (em p)
    (fun hp : p => Or.inl hp)
    (fun hnp : ¬p => Or.inr hnp)

example : (((p → q) → p) → p) :=
  fun h : ((p → q) → p) =>
    Or.elim (em p)
      (fun hp : p => hp)
      (fun hnp : ¬p =>
        have hpq : p → q := fun hp : p => False.elim (hnp hp)
        have hp : p := h hpq
        show p from hp)
