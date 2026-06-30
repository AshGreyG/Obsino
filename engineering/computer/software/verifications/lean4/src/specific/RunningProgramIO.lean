def main : IO Unit := do
  let stdin  ← IO.getStdin    -- type: IO.FS.Stream
  let stdout ← IO.getStdout   -- type: IO.FS.Stream

  stdout.putStrLn "[Program executed]: How would you like to be addressed?"
  let input ← stdin.getLine   -- type: String
  let name := input.dropEndWhile Char.isWhitespace

  stdout.putStrLn s!"Hello, {name}"
  -- type of this function: IO.FS.Stream → String → IO Unit
