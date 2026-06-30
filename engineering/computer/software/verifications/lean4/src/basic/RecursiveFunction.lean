def isNatEven (n : Nat) : Bool :=
  match n with
  | Nat.zero => true
  | Nat.succ k => Bool.not (isNatEven k)

def infiniteEven (n : Nat) : Bool :=
--  ^^^^^^^^^^^^
-- fail to show termination for
--   infiniteEven
-- with errors
-- failed to infer structural recursion:
-- Not considering parameter n of infiniteEven:
--   it is unchanged in the recursive calls
-- no parameters suitable for structural recursion
-- well-founded recursion cannot be used, `infiniteEven` does not take any
-- (non-fixed) arguments
  match n with
  | Nat.zero => true
  | Nat.succ k => Bool.not (infiniteEven n)

def pred (n : Nat) : Nat :=
  match n with
  | Nat.zero => Nat.zero
  | Nat.succ k => k

def plus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => Nat.succ (plus n k')

#eval plus 3 7  -- 10
#eval plus 3 0  -- 3

def times (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => Nat.zero
  | Nat.succ k' => plus n (times n k')

#eval times 3 7 -- 21
#eval times 0 9 -- 0

def minus (n : Nat) (k : Nat) : Nat :=
  match k with
  | Nat.zero => n
  | Nat.succ k' => pred (minus n k')

#eval minus 2 3 -- 0 and that's because pred 0 is 0
#eval minus 7 3 -- 4
