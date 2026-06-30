structure PPoint (α : Type) where
  x : α
  y : α

def replacePPointX {α : Type} (point : PPoint α) (new_x : α) : PPoint α :=
  { point with x := new_x }

#eval replacePPointX { x := 3, y := 1 } 2
-- It can be called without providing `Nat` explicitly

def length {α : Type} (list : List α) : Nat :=
  match list with
  | [] => 0
  | _ :: rest => Nat.succ (length rest)

#eval length [1, 2, 3]
-- It can be called without providing `Nat` explicitly
#eval length [] (α := Int)
-- When no type can be inferred, we should provide types explicitly
#eval length ([] : List Int)
