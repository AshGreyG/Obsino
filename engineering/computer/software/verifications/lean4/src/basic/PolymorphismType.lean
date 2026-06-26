inductive Sign where
  | positive
  | negative

def posOrNegReturn (s : Sign) :
  match s with
  | Sign.positive => Nat
  | Sign.negative => Int :=
  match s with
  | Sign.positive => (3 : Nat)
  | Sign.negative => (-3 : Int)
