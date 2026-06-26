inductive DefinedBool where
  | false : DefinedBool
  | true  : DefinedBool

#check (DefinedBool.true) -- DefinedBool

inductive DefinedNat where
  | zero : DefinedNat
  | succ (n : DefinedNat) : DefinedNat

#check (DefinedNat.zero)                  -- DefinedNat
#check (DefinedNat.succ)                  -- DefinedNat → DefinedNat
#check (DefinedNat.succ DefinedNat.zero)  -- DefinedNat
