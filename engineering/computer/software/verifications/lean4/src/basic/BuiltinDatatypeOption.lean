inductive DefinedOption (α : Type) where
  | none : DefinedOption α
  | some (val : α) : DefinedOption α

def multiple1 : DefinedOption (DefinedOption Nat) :=
  DefinedOption.some (DefinedOption.some 3)

def multiple2 : DefinedOption (DefinedOption Nat) :=
  DefinedOption.some (DefinedOption.none)

def multiple3 : DefinedOption (DefinedOption Nat) :=
  DefinedOption.none

inductive DefinedList (α : Type) where
  | nil : DefinedList α
  | cons : α → DefinedList α → DefinedList α

def DefinedList.head? {α : Type} (list : DefinedList α) : DefinedOption α :=
  match list with
  | DefinedList.nil => DefinedOption.none
  | DefinedList.cons k _ => DefinedOption.some k

#eval [].head?
--    ^^^^^^^^
-- don't know how to synthesize implicit argument `α`
--   @List.head? ?m.3 []
-- context:
-- ⊢ Type ?u.1155Lean 4
#eval [].head? (α := Int)   -- none
#eval ([] : List Int).head? -- none
