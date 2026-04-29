#KnowledgeStructure: {
  content: string
  // Main body text for a concept or principle. Usually a raw string; may include
  // other properties.
  related?: [...string]
  // Related concepts/principles within the same handbook. Rendered as #link in
  // Typst.
  external_related?: [...string]
  // Related concepts/principles in external handbooks. Cannot use #link since
  // it targets a PDF page.
  external_link?: [...string]
  // External resources such as papers or websites.
  [=~"^figure_part"]: string
  // Embed figures (e.g., `figure_part_test`) from the assets directory into
  // content.
}
