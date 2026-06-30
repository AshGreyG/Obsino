structure PPoint (α : Type) where
  x : α
  y : α

def natOrigin : PPoint Nat :=
  { x := Nat.zero, y := Nat.zero }

def replacePPointX (α : Type) (point : PPoint α) (new_x : α) : PPoint α :=
  { point with x := new_x }

#check (replacePPointX)
-- (α : Type) → PPoint α → α → PPoint α
#check replacePPointX Nat natOrigin
-- Nat → PPoint Nat
#eval replacePPointX Nat natOrigin 5
-- { x := 5, y := 0 }
