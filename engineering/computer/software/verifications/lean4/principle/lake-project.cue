package principle

lake_project: {
  content: """
    To get started with a project that uses Lake (Lean Make), use the command
    `lake new <project-name>`. This creates basic directory with following files
    (git/github files not included):

    - `Main.lean` is the file in which the Lean compiler will look for the main
      action;
    - `<Project-name>.lean` (the first letter is uppercase) and `<Project-name>/
      Basic.lean` are the scaffolding of a support library for the program;
    - `lakefile.toml` contains the configuration that lake needs to build the
      application;
    - `lean-toolchain` contains an identifier for the specific version of Lean
      that is used for the project.

    By default the library file `<Project-name>/Basic.lean` contains a single
    definition, Then the library file `<Project-name>.lean` imports
    `<Project-name>/Basic.lean`. This means everything defined in
    `<Project-name>/Basic.lean` is also available to files that import
    `<Project-name>.lean`. *In `import` statements, dots are interpreted as
    directories as disk*.

    To build the package, run the command `lake build`, the resulting binary
    has been placed in `.lake/build/bin`. The command `lake exe` can be used to
    build the binary if necessary and run it.

    \(code_part_lakefile)
  """
  code_part_lakefile: #"""
    #raw-block-file(
      "src/example/cat/lakefile.toml",
      "toml"
    )
  """#
}