--- Exercise 1.6.5-1

def findLast? {α : Type} (list : List α) : Option α :=
  match list with
  | [] => none
  | head :: rest =>
    match rest with
    | [] => some head
    | _ :: _ => findLast? rest

#eval findLast? [1, 2]         -- some 2
#eval findLast? [0]            -- some 0
#eval findLast? [] (α := Nat)  -- none

--- Exercise 1.6.5-2

def findFirstPredicate? {α : Type}
  (list : List α)
  (predicate : α → Bool) : Option α :=
  match list with
  | [] => none
  | head :: rest =>
    match predicate head with
    | true => some head
    | false => findFirstPredicate? rest predicate

def _predicate1 (a : Nat) : Bool := a > 4
def _predicate2 (a : Nat) : Bool := Pow.pow a 2 > 10

#eval findFirstPredicate? [3, 4, 5] _predicate1 -- some 5
#eval findFirstPredicate? [1, 4, 3] _predicate2 -- some 4
#eval findFirstPredicate? [1, 2, 3] _predicate2 -- none

--- Exercise 1.6.5-3

def switchProduct {α β : Type} (pair : α × β) : β × α :=
  (pair.snd, pair.fst)

#eval switchProduct (1, "String") -- ("String", 1)

--- Exercise 1.6.5-5

def zip {α β : Type} (xs : List α) (ys : List β) : List (α × β) :=
  match xs, ys with
  | x :: xr , y :: yr => (x, y) :: zip xr yr
  | _, _ => ([] : List (α × β))

#eval zip [1, 2, 3] ["a", "b"]  -- [(1, "a"), (2, "b")]

--- Exercise 1.6.5-6

def firstN {α : Type} (n : Nat) (list : List α) : List α :=
  match n with
  | 0 => []
  | _ =>
    match list with
    | [] => []
    | head :: rest => head :: firstN (n - 1) rest

#eval firstN 3 [1, 2, 3, 4] -- [1, 2, 3]
#eval firstN 3 [1, 2]       -- [1, 2]

--- Exercise 1.6.5-7

def distribute {α β γ : Type}
  (input : α × (β ⊕ γ)) : (α × β) ⊕ (α × γ) :=
  match input.snd with
  | Sum.inl beta  => Sum.inl (input.fst, beta)
  | Sum.inr gamma => Sum.inr (input.fst, gamma)

--- Exercise 1.6.5-8

def convert {α : Type} (input : Bool × α) : α ⊕ α :=
  match input.fst with
  | true  => Sum.inl input.snd
  | false => Sum.inr input.snd
