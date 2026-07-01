package concept

section_keyword: {
  content: """
    Sometimes if we want to limit the scope of a variable, Lean provides the
    notion of a `section`:

    \(code_part_section_keyword)

    When the section is closed, the variables go out of scope, and cannot be
    referenced any more. We don't need to indent the lines within a section and
    we also don't have to name a section, which is to say, we can use an anonymous
    `section/end` pair. But if we do name a section, however we have to close it
    using the same name. *Sections can also be nested*.
  """
  code_part_section_keyword: #"""
    #raw-block-file(
      "src/basic/SectionKeyword.lean",
      "lean"
    )
  """#
}