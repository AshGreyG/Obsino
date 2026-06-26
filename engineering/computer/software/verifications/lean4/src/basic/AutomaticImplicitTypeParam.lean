def length (list : List α) : Nat :=
  match list with
  | [] => 0
  | _ :: rest => Nat.succ (length rest)

#eval length [1, 2]           -- 2
#eval length [] (α := Nat)    -- 0
#eval length ([] : List Nat)  -- 0
