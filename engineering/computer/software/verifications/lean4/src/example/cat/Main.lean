import Cat

def main (args : List String) : IO UInt32 := do
  match args with
  | [] => process 0 ["-"]
  | _  => process 0 args
