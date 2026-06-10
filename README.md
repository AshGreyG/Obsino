<div align="center" name="markdown">

![Obsino](https://socialify.git.ci/AshGreyG/Obsino/image?custom_language=Typst&description=1&font=Source+Code+Pro&language=1&logo=https%3A%2F%2Fraw.githubusercontent.com%2FNixOS%2Fnixos-artwork%2F9d2cdedd73d64a068214482902adea3d02783ba8%2Flogo%2Fnix-snowflake-colours.svg&name=1&owner=1&pattern=Transparent&theme=Dark)

[![build](https://img.shields.io/github/actions/workflow/status/AshGreyG/Obsino/nightly.yml?label=nightly)](https://github.com/AshGreyG/Obsino/actions/workflows/nightly.yml)
[![status](https://img.shields.io/github/actions/workflow/status/AshGreyG/Obsino/status.yml?label=status)](https://github.com/AshGreyG/Obsino/actions/workflows/status.yml)
[![Typst](https://img.shields.io/badge/Typst-239DAD?logo=typst&logoColor=fff)](https://typst.app/)
[![Nix](https://img.shields.io/badge/Nix-5277C3?logo=nixos&logoColor=fff)](https://nixos.org/)
[![MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

![Rule](https://cdn.jsdelivr.net/gh/andreasbm/readme/assets/lines/rainbow.png)

## ✨ Features

**Obsino** is a digital knowledge tree — a structured personal knowledge base
organized by academic discipline. Knowledge is authored in [CUE](https://cuelang.org/)
files with [Typst](https://typst.app/) markup and compiled into PDF handbooks.

Each subject directory is a CUE module. Within each module, content is organized
into:

- **`concept/`** : fundamental concepts
- **`law/`** : basic law of nature
- **`phenomenon/`** : observed phenomena
- **`principle/`** : experimental principles or methods
- **`specific/`** : specific case studies
- **`proof/`** : proof of mathematical theorems
- **`theorem/`** : theorem of mathematics

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
  [=~"^code_part"]: string
  // Embed code blocks (e.g., `code_part_evaluating_expression`) from the src
  // directory into content
}
```

- **Content**: Written in Typst markup inside the `content` field
- **Figures**: Typst figure code in `figure_part_*` fields (embedded via `#""`
  raw strings)
- **Code Blocks**: Typst code blocks in `code_part_*` fields
- **Assets**: SVG/PNG files in an `assets/` subdirectory
- **Cross-references**: Array of related concept paths in the `related` field

## ❄️ Build

Enter the development shell

```bash
nix develop
```

Provides `cue`, `yq`, `typst`, and `typstyle`.

Export a single concept to PDF

```bash
make single-export FILE=concept/alpha-helix.cue
```

Export a property from a CUE package

```bash
make package-export PACKAGE=natural-science.biology.biochemistry TARGET=alpha_helix
```

Generate a handbook

```bash
make handbook
```

Scans all subdirectories in the current module and assembles one comprehensive PDF.

Build all handbooks

```bash
nix run .#handbook
```

Outputs to `build/`.

Clean

```bash
nix run .#clean       # clean all build artifacts
make clean            # clean PDFs in current directory
```

Status

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
├── engineering
│    └── computer
│        ├── security
│        │    └── web
│        │     
│        │       [x] Typst Header
│        │       [x] CUE Module
│        │       [→] concept: 1 | 19
│        │       [→] specific: 1 | 111
│        │     
│        └── software
│            └── verifications
│                └── lean4
│                 
│                   [x] Typst Header
│                   [x] CUE Module
│                   [→] concept: 5 | 135
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
           [→] concept: 42 | 1202
           [→] desire: 3 | 59
           [→] law: 7 | 225
           [→] proof: 4 | 71
           [→] specific: 1 | 34
           [→] theorem: 1 | 19
         
[→] Total Counts: 119
[→] Total Lines: 3639
```

<!-- project-status-end -->


#### 📝 License

Copyright © 2026 [AshGrey](https://github.com/AshGreyG). <br />
This project is [MIT](https://github.com/liblaf/melon/blob/main/LICENSE) licensed.