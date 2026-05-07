// Copyright 2026 AshGrey
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in the
// Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
// and to permit persons to whom the Software is furnished to do so, subject to the
// following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// This is the header of every handbook, you can add predefined functions or
// styles here.

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
