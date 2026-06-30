-- `USize` is unsigned integers that are the size of a word on the platform
def bufsize : USize := 20 * 1024

/--
The main work of `cat` is done by **dump**, which reads input one block at a time
dumping the result to standard output, until the end of the input has been reached.
The end of the input is indicated by read returning an empty byte array
-/
partial def dump (stream : IO.FS.Stream) : IO Unit := do
  let buf ← stream.read bufsize
  if buf.isEmpty then
    pure ()
  else
    let stdout ← IO.getStdout
    stdout.write buf
    dump stream
