set_option linter.unusedVariables false

section proof
  variable (p q r s : Prop)

  theorem t1 (hp : p) (hq : q) : p := hp

  #print t1
  #check t1 r s             -- r → s → r
  #check t1 (r ∧ s) (r ∨ s) -- r ∧ s → r ∨ s → r ∧ s

  theorem t1_printed : ∀ (p q : Prop), p → q → p :=
    fun p q (hp : p) (hq : q) => hp
    -- ∀ {p q : Prop}, p → (q → p) is a proposition, its proof is an instance

  theorem t1_simplified : p → q → p :=
    fun hp : p => fun hq : q => hp

  theorem t1_show_statement : p → q → p :=
    fun hp : p =>
    fun hq : q =>
    show p from hp
end proof

section implicit
  variable {p q r s : Prop}
  theorem t2 (hp : p) (hq : q) : p := hp
  axiom hp2 : p
  theorem t2_implicit : q → p := t2 hp2

  theorem t3 (h₁ : q → r) (h₂ : p → q) : p → r :=
    fun h₃ : p =>
    show r from h₁ (h₂ h₃)
end implicit
