-- `USize` is unsigned integers that are the size of a word on the platform
def bufsize : USize := 20 * 1024

def help_information : String :=
  "cat utils written in Lean4, available commands: \n" ++
  "  [-] Nothing specified : same with \"-\" \n" ++
  "  [-] - : The standard input, example usage: echo \"test\" | lake exe cat - \n" ++
  "  [-] --help : This help information \n" ++
  "  [-] <filename> : Shows the content of this file"

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

-- ANCHOR: Builtin Stream definition
structure DefinedStream where
  flush   : IO Unit
  read    : USize → IO ByteArray
  write   : ByteArray → IO Unit
  getLine : IO String
  putStr  : String → IO Unit
  isTty   : BaseIO Bool
  -- The type `BaseIO` is a variant of `IO` that rules out runtime errors. The
  -- Lean compiler contains `IO` actions to get streams that represent standard
  -- input, standard output and standard error

def fileStream (filename : System.FilePath) : IO (Option IO.FS.Stream) := do
  let isFileExists ← filename.pathExists
  if not isFileExists then
    let stderr ← IO.getStderr
    stderr.putStrLn s!"File not found: {filename}"
    pure none
  else
    -- First a file handle is created by opening the file in read mode. A Lean
    -- file handle tracks an underlying file descriptors. When there are no
    -- references to the file handle value, a finalizer closes the file
    -- descriptors.
    let handle ← IO.FS.Handle.mk filename IO.FS.Mode.read
    -- Second, the file handle is given the same interface as a POSIX system
    -- using `IO.FS.Stream.ofHandle`, which fills each field of the `Stream`
    -- structure with the corresponding `IO` action that works on file handles.
    pure (some (IO.FS.Stream.ofHandle handle))

def process (exit_code : UInt32) (args : List String) : IO UInt32 := do
  match args with
  | [] => pure exit_code
    -- No more files remain to be processed, in which case `process` returns
    -- the error code unchanged
  | "-" :: args =>
    -- Another is that the specified filename is `"-"`, in which case `process` dumps
    -- the contents of the standard input and then processes the remaining filenames.
    let stdin ← IO.getStdin
    dump stdin
    process exit_code args
  | "--help" :: args | "-h" :: args =>
    -- --help arguments will return the help information
    let stdout ← IO.getStdout
    stdout.putStr help_information
    process exit_code args
  | filename :: args =>
    -- The final possibility is that an actual filename was specified. In this
    -- case, `fileStream` is used to attempt to open the file as a POSIX stream.
    -- Its argument is enclosed in `⟨...⟩` because a `FilePath` is a single-field
    -- structure that contains a string.
    let stream ← fileStream (⟨filename⟩ : System.FilePath)
    match stream with
    | none => process 1 args
    | some s =>
      dump s
      process exit_code args
