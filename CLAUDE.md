# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code
in this repository.

## Project Overview

Obsino is a digital knowledge tree — a structured personal knowledge base organized
by academic discipline. Knowledge is authored in **CUE** files with Typst markup
and compiled into PDF handbooks.

## Build & Commands

```bash
# Enter Nix dev shell (provides cue, yq, typst, typstyle)
nix develop

# Export a single CUE file to PDF
make single-export FILE=concept/alpha-helix.cue

# Export a specific property from a CUE package to PDF
make package-export PACKAGE=natural-science.biology.biochemistry TARGET=alpha_helix

# Generate a full handbook PDF from all CUE files in the current directory
make handbook

# Build all handbooks across the repo (outputs to build/)
nix run .#handbook

# Clean build artifacts
nix run .#clean

# Clean up generated PDFs in current directory
make clean
```

## Knowledge File Structure

CUE knowledge entries follow this pattern:

- **Content**: Written in Typst markup inside the `content` field
- **Figures**: Typst figure code in `figure_part` field (embedded via `#""` raw
  strings)
- **Cross-references**: Array of related concept paths in the `related` field
- **Assets**: SVG/PNG files in an `assets/` subdirectory, embedded in figures via
  `read()`

## Architecture

### Module Hierarchy

Each subject directory is a CUE module with a `cue.mod/module.cue` defining a
dotted module path (e.g., `natural-science.biology.biochemistry`). The module path
is critical: the `Makefile` reads it from `cue.mod/module.cue` for `package-export`
and `handbook` targets.

### Directory Categories

Within each module:

- `concept/` — fundamental concepts (e.g., alpha-helix, peptide-bond)
- `principle/` — experimental principles or methods (e.g., gel-electrophoresis)
- `phenomenon/` — observed phenomena (e.g., protein refolding)
- `specific/` — specific case studies (e.g., structure-of-collagen)

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
for shared Typst configuration (font settings, custom functions).

## CI

Nightly GitHub Action builds all handbooks via `nix run .#handbook` and publishes
to a `nightly` release as pre-release with `make_latest: true`. Runs on push to
`master` and on a daily schedule (midnight UTC).
