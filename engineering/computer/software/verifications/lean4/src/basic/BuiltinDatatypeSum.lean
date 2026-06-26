inductive DefinedSum (α : Type) (β : Type) where
  | inl : α → DefinedSum α β
  | inr : β → DefinedSum α β

def PetName : Type := String ⊕ String

def animals : List PetName := [
  Sum.inl "a", Sum.inr "b", Sum.inl "c",
  Sum.inr "d", Sum.inl "e", Sum.inr "f"
]

def countDogs (pets : List PetName) : Nat :=
  match pets with
  | [] => 0
  | Sum.inl _ :: rest => Nat.succ (countDogs rest)
  | Sum.inr _ :: rest => countDogs rest

#eval countDogs animals -- 3
