inductive MarkdownInline : Type where
  | linebreak
  | string : String → MarkdownInline
  | emphasize : MarkdownInline → MarkdownInline
  | strong : MarkdownInline → MarkdownInline

def MarkdownInline.string?__without_if_let
  (inline : MarkdownInline) : Option String :=
  match inline with
  | MarkdownInline.string s => some s
  | _ => none

def MarkdownInline.string? (inline : MarkdownInline) : Option String :=
  if let MarkdownInline.string s := inline then
    some s
  else
    none
