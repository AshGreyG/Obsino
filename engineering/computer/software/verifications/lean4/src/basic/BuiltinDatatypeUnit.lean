inductive DefinedUnit where
  | unit : DefinedUnit

inductive ArithmeticExpr (α : Type) where
  | int   : α → Int → ArithmeticExpr α
  | plus  : α → ArithmeticExpr α → ArithmeticExpr α → ArithmeticExpr α
  | minus : α → ArithmeticExpr α → ArithmeticExpr α → ArithmeticExpr α
  | times : α → ArithmeticExpr α → ArithmeticExpr α → ArithmeticExpr α

def return_type : Type := ArithmeticExpr Unit

def receiveNothing (_ : Unit) : Nat := 3
def returnNothing (_ : Nat) : Unit := ()

#check (receiveNothing) -- Unit → Nat
#check (returnNothing)  -- Nat → Unit
