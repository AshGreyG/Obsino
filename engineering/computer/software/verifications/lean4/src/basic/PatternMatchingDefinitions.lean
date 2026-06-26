def length : List α → Nat
  | [] => 0
  | _ :: rest => Nat.succ (length rest)

#eval length [1, 2]         -- 2
#eval length [] (α := Int)  -- 0

def drop : Nat → List α → List α
  | Nat.zero, list => list
  | _, [] => []
  | Nat.succ n, _ :: rest => drop n rest

#eval drop 0 [1, 3, 5]      -- [1, 3, 5]
#eval drop 3 [] (α := Nat)  -- []
#eval drop 1 [1, 3, 5]      -- [3, 5]

def optionGetDefault (default : α) : Option α → α
  | none => default
  | some x => x

#eval optionGetDefault "" (some "as") -- "as"
#eval optionGetDefault "" none        -- ""
