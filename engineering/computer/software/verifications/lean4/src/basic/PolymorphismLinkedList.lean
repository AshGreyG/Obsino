inductive DefinedList (α : Type) where
  | nil : DefinedList α
  | cons : α → DefinedList α → DefinedList α
--    head ^   ^^^^^^^^^^^^^ tail

def length (α : Type) (list : List α) : Nat :=
  match list with
  | List.nil => Nat.zero
  | List.cons _ rest => Nat.succ (length α rest)

#eval length String ["a", "b"]  -- 2
#eval length Nat []             -- 0

def lengthSymbol (α : Type) (list : List α) : Nat :=
  match list with
  | [] => 0
  | _ :: rest => Nat.succ (length α rest)
