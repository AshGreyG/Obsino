def isZero (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ _ => false

#eval isZero 1  -- false
#eval isZero 0  -- true

def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ k => k

#eval pred 9  -- 8
#eval pred 0  -- 0
