def runNTimes (action : IO Unit) : Nat → IO Unit
  | 0 => pure ()
  | Nat.succ k => do
    action
    runNTimes action k

def countdown : Nat → List (IO Unit)
  | 0 => [IO.println "[0]."]
  | Nat.succ k => IO.println s!"[{k + 1}]" :: countdown k

def runListActions : List (IO Unit) → IO Unit
  | [] => pure ()
  | act :: actions => do
    act
    runListActions actions

def main : IO Unit := do
  runNTimes (IO.println "[repeated]") 4
  IO.println ""
  runListActions (countdown 10)
