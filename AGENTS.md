# AGENT.md

This file provides guidance to Claude Code (claude.ai/code) when working with code
in this repository.

## Project Overview

Obsino is a digital knowledge tree — a structured personal knowledge base organized
by academic discipline. Knowledge is authored in **CUE** files with Typst markup
and compiled into PDF handbooks.

### Top-Level Domains

- `formal-science/` — mathematics, computer science, cryptography, algorithms
- `natural-science/` — physics, biology, chemistry
- `healthcare/` — pharmacy, pharmaceutics, pharmacokinetics
- `engineering/` — computer engineering (AI, architecture, security, software
  verifications)

### CUE Modules

Each subject directory is a CUE module with a `cue.mod/module.cue` defining a
dotted module path. Active modules:

| Module path                                         | Directory                                            |
| --------------------------------------------------- | ---------------------------------------------------- |
| `natural-science.biology.biochemistry`              | `natural-science/biology/biochemistry/`              |
| `natural-science.biology.molecular-biology`         | `natural-science/biology/molecular-biology/`         |
| `natural-science.physics.classical-mechanics`       | `natural-science/physics/classical-mechanics/`       |
| `healthcare.pharmacy.pharmaceutics`                 | `healthcare/pharmacy/pharmaceutics/`                 |
| `engineering.computer.software.verifications.lean4` | `engineering/computer/software/verifications/lean4/` |
| `engineering.computer.security.web`                 | `engineering/computer/security/web/`                 |

## Build & Commands

```bash
# Enter Nix dev shell (provides cue, yq, typst, typstyle)
nix develop

# Export a single CUE file to PDF
make single-export FILE=concept/alpha-helix.cue

# Export a specific property from a CUE package to PDF
make package-export PACKAGE=natural-science.biology.biochemistry TARGET=alpha_helix

# Generate a full handbook PDF from all CUE files in the current module
make handbook

# Build all handbooks across the repo (outputs to build/)
nix run .#handbook

# Clean build artifacts
nix run .#clean

# Clean up generated PDFs in current directory
make clean
```

Most subject directories with a `Makefile` support `make handbook` to generate
a module-specific PDF (e.g., `handbook-pharmaceutics.pdf`,
`handbook-lean4.pdf`).

## Knowledge File Structure

CUE knowledge entries follow this pattern:

- **Content**: Written in Typst markup inside the `content` field
- **Figures**: Typst figure code in `figure_part` field (embedded via `#""` raw
  strings)
- **Cross-references**: Array of related concept paths in the `related` field
- **Assets**: Images (SVG/PNG/JPG), Typst figure scripts (`.typ`), or Docker /
  code samples in an `assets/` subdirectory, embedded via `read()`

### Source Code

Some modules include runnable or verifiable source code in a `src/` directory:

- `verifications/lean4/src/` — Lean 4 source files (`.lean`)
- `security/web/src/` — Security exploit / lab code (Python, Jinja2 templates)
- `pharmaceutics/concept/src/` — Python scripts with `pyproject.toml`

## Architecture

### Module Hierarchy

Each subject directory is a CUE module with a `cue.mod/module.cue` defining a
dotted module path (e.g., `natural-science.biology.biochemistry`). The module path
is critical: the `Makefile` reads it from `cue.mod/module.cue` for `package-export`
and `handbook` targets.

### Directory Categories

Within each module, knowledge is organized by category. Not all categories exist
in every module — use the ones that fit the subject:

| Category      | Purpose                            | Examples                                               |
| ------------- | ---------------------------------- | ------------------------------------------------------ |
| `concept/`    | Fundamental concepts               | alpha-helix, peptide-bond, torque                      |
| `principle/`  | Experimental principles or methods | gel-electrophoresis                                    |
| `phenomenon/` | Observed phenomena                 | protein refolding                                      |
| `specific/`   | Specific case studies              | structure-of-collagen, mass-center-of-semicircle       |
| `law/`        | Physical or mathematical laws      | conservation-of-momentum-law, impulse-momentum-theorem |
| `proof/`      | Formal proofs                      | proof-impulse-momentum-theorem                         |
| `desire/`     | Motivation or "why this matters"   | invariant-tensor                                       |

### Naming Conventions

- File names use **hyphen-case** (e.g., `alpha-helix.cue`)
- CUE property names use **underscore-case** (e.g., `alpha_helix`)
- The `Makefile` automatically converts between these via `$(subst -,_,_)`
- Content property is always accessed as `$(CLASS).content` where CLASS is the
  underscore-case filename

### Cross-References

The `related` field contains an array of paths like `"concept/secondary-structure"`.
The `handbook` target renders these as internal PDF links. When adding a new concept,
link it to related existing concepts.

### Handbooks with `make handbook`

Scans all subdirectories in the module, iterates CUE files in each, exports their
content, and assembles one comprehensive PDF. Uses `header.typ` from the repo root
for shared Typst configuration (font settings, custom functions). Some modules
also ship their own `header.typ` for subject-specific styling.

## CI

Nightly GitHub Action builds all handbooks via `nix run .#handbook` and publishes
to a `nightly` release as pre-release with `make_latest: true`. Runs on push to
`master` and on a daily schedule (midnight UTC).
