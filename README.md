<div align="center">

# 🔮 Obsino

[![build](https://img.shields.io/github/actions/workflow/status/AshGreyG/Obsino/nightly.yml?label=nightly)](https://github.com/AshGreyG/Obsino/actions/workflows/nightly.yml)
[![status](https://img.shields.io/github/actions/workflow/status/AshGreyG/Obsino/status.yml?label=status)](https://github.com/AshGreyG/Obsino/actions/workflows/status.yml)
[![Typst](https://img.shields.io/badge/Typst-239DAD?logo=typst&logoColor=fff)](https://typst.app/)
[![Nix](https://img.shields.io/badge/Nix-5277C3?logo=nixos&logoColor=fff)](https://nixos.org/)
[![MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

**Obsino** is a digital knowledge tree — a structured personal knowledge base
organized by academic discipline. Knowledge is authored in [CUE](https://cuelang.org/)
files with [Typst](https://typst.app/) markup and compiled into PDF handbooks.

Each subject directory is a CUE module. Within each module, content is organized
into:

- **`concept/`** — fundamental concepts (e.g., alpha-helix, peptide-bond)
- **`principle/`** — experimental principles or methods (e.g., gel-electrophoresis)
- **`phenomenon/`** — observed phenomena (e.g., protein refolding)
- **`specific/`** — specific case studies (e.g., structure-of-collagen)

## 🔮 Authoring Knowledge

Knowledge entries are CUE files conforming to the schema in `schema.cue`:

```cue
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
```

- **Content**: Written in Typst markup inside the `content` field
- **Figures**: Typst figure code in `figure_part_*` fields (embedded via `#""`
  raw strings)
- **Assets**: SVG/PNG files in an `assets/` subdirectory
- **Cross-references**: Array of related concept paths in the `related` field

## ❄️ Build

### Enter the development shell

```bash
nix develop
```

Provides `cue`, `yq`, `typst`, and `typstyle`.

### Export a single concept to PDF

```bash
make single-export FILE=concept/alpha-helix.cue
```

### Export a property from a CUE package

```bash
make package-export PACKAGE=natural-science.biology.biochemistry TARGET=alpha_helix
```

### Generate a handbook

```bash
make handbook
```

Scans all subdirectories in the current module and assembles one comprehensive PDF.

### Build all handbooks

```bash
nix run .#handbook
```

Outputs to `build/`.

### Clean

```bash
nix run .#clean       # clean all build artifacts
make clean            # clean PDFs in current directory
```

### Status

```bash
nix run .#status      # check the status of project
```

## ♻️ CI

- A nightly GitHub Action builds all handbooks and publishes them as a pre-release.
- A status Github Action embeds the status to README.md.

## 🩺 Status

<!-- project-status-start -->
```text
├── Human Knowledge Tree (HKT)
│
├── healthcare
│    └── pharmacy
│        └── pharmaceutics
│         
│           [x] Typst Header
│           [x] CUE Module
│           [→] concept: 16 | 272
│           [→] desire: 1 | 11
│         
└── natural-science
    ├── biology
    │    ├── biochemistry
    │    │
    │    │  [x] Typst Header
    │    │  [x] CUE Module
    │    │  [→] concept: 16 | 609
    │    │  [→] phenomenon: 2 | 71
    │    │  [→] principle: 1 | 29
    │    │  [→] specific: 4 | 134
    │    │
    │    └── molecular-biology
    │     
    │       [x] Typst Header
    │       [x] CUE Module
    │       [→] concept: 9 | 458
    │       [→] principle: 5 | 180
    │     
    └── physics
        └── classical-mechanics
         
           [x] Typst Header
           [x] CUE Module
           [→] concept: 12 | 242
           [→] desire: 1 | 23
           [→] proof: 2 | 27
         
[→] Total Counts: 69
[→] Total Lines: 2056
```

<!-- project-status-end -->


## 📝 License

MIT — see [LICENSE](LICENSE).
