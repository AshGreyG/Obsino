#check fun x => x + 1               -- Nat → Nat
#check fun (x : Int) => x + 1       -- Int → Int
#check fun {α : Type} (x : α) => x  -- {α : Type} → α → α
#check λ x => x + 1                 -- Nat → Nat
#check fun x =>
  match x with
  | 0 => none
  | Nat.succ n => some n
-- Nat → Option Nat

def double : Nat → Nat := fun
  | 0 => 0
  | k + 1 => double k + 2

#eval double 3
