structure DefinedProd (α : Type) (β : Type) : Type where
  fst : α
  snd : β

def fifth : String × Int := { fst := "String", snd := 5 }
def first : String × Int := ("first", 1)

def sevens : String × String × Int := ("VII", "seventh", 3)
#check sevens.fst       -- String
#check sevens.snd       -- String × Int
#check sevens.snd.fst   -- String
#check sevens.snd.snd   -- Int
