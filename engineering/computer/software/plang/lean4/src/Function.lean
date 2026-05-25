def add1 (n : Nat) : Nat := n + 1

def maximum (n : Nat) (k : Nat) : Nat :=
  if n < k then
    k
  else n

def spaceBetween (before : String) (after : String) : String :=
  String.append before (String.append " " after)

#eval add1 3      -- 4
#check maximum 3  -- Nat → Nat
