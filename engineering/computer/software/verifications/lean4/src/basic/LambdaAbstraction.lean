#check fun x : Nat =>
  fun y : Bool =>
    if not y then
      x + 1
    else
      x + 2
-- Nat → Bool → Nat
#check fun (x : Nat) (y : Bool) =>
  if not y then
    x + 1
  else
    x + 2
-- Nat → Bool → Nat
#check fun x y =>
  if not y then
    x + 1
  else
    x + 2
-- Nat → Bool → Nat (Lean infers)
#check fun (α β γ : Type) (g : β → γ) (f : α → β) (x : α) => g (f x)
-- (β → γ) → (α → β) → α → γ
