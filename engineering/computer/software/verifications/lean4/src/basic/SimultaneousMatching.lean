def drop (n : Nat) (list : List α) : List α :=
  match n, list with
  | 0, whole => whole
  | _, [] => []
  | Nat.succ k, _ :: rest => drop k rest

def isSameLength {α β : Type} (xs : List α) (ys : List β) : Bool :=
  match xs, ys with
  | [], [] => true
  | _ :: xs', _ :: ys' => isSameLength xs' ys'
  | _, _ => false

#eval isSameLength [] [] (α := Nat) (β := Int)  -- true
#eval isSameLength [1, 2] ["a", "b", "c"]       -- false

def isSameLength__pair (xs : List α) (ys : List β) : Bool :=
--  ^^^^^^^^^^^^^^^^^^
-- fail to show termination for
--   isSameLength__pair
-- with errors
-- failed to infer structural recursion:
-- Not considering parameter α of isSameLength__pair:
--   it is unchanged in the recursive calls
-- Not considering parameter β of isSameLength__pair:
--   it is unchanged in the recursive calls
-- Cannot use parameter xs:
--   failed to eliminate recursive application
--     isSameLength__pair xs' ys'
-- Cannot use parameter ys:
--   failed to eliminate recursive application
--     isSameLength__pair xs' ys'
-- Could not find a decreasing measure.
-- The basic measures relate at each recursive call as follows:
-- (<, ≤, =: relation proved, ? all proofs failed, _: no proof attempted)
--             xs ys
-- 1) 20:28-54  ?  ?
-- Please use `termination_by` to specify a decreasing measure.
  match (xs, ys) with
  | ([], []) => true
  | (_ :: xs', _ :: ys') => isSameLength__pair xs' ys'
  | (_, _) => false
