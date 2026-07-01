def cons (α : Type) (a : α) (rest : List α) : List α :=
  List.cons a rest

#check cons Nat     -- Nat → List Nat → List Nat
#check cons String  -- String → List String → List String

section sigma
  universe u v
  def f (α : Type u) (β : α → Type v) (a : α) (b : β a) : (a : α) × β a :=
    ⟨a, b⟩
  def g (α : Type u) (β : α → Type v) (a : α) (b : β a) : Σ a : α, β a :=
    Sigma.mk a b

  def h1 (x : Nat) : Nat :=
    (f Type (fun α => α) Nat x).2

  def h2 (x : Nat) : Array Nat :=
    (g Type (fun α => Array α) Nat #[x]).2

  #eval h1 3  -- 3
  #eval h2 3  -- #[3]
end sigma
