#check Type     -- Type 1
#check Type 1   -- Type 2
#check List     -- List.{u} (α : Type u) : Type u
#check Prod     -- Prod.{u, v} (α : Type u) (β : Type v) : Type (max u v)

universe u

inductive DefinedList (α : Type u) : Type u where
  | nil  : DefinedList α
  | cons : α → DefinedList α → DefinedList α

structure DefinedProd.{v, w} (α : Type v) (β : Type w) : Type (max v w) where
  fst : α
  snd : β
