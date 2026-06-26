namespace Func

def zip : List α → List β → List (α × β)
  | x :: xs, y :: ys => (x, y) :: zip xs ys
  | _, _ => ([] : List (α × β))

end Func

#eval Func.zip [1, 2, 3] ["a", "b", "c"]

open Func in
#check zip
