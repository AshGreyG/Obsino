---
name: place-concept
description: Help determine which branch of the Obsino knowledge tree a new concept from a paper or research belongs to, and scaffold the entry.
---

# Place a New Concept

Use this skill when the user has a concept from a paper, book, or research and
is unsure where it fits in the Obsino knowledge tree. This skill helps classify
the concept, determine the correct directory and module, and scaffold the CUE
entry.

## Workflow

### 1. Understand the concept

Ask the user for a brief description of the concept, or the paper/resource
they encountered it in. If they've already provided it, proceed to classify.

### 2. Determine the domain

Map the concept to one of the four top-level domains based on its core subject:

| Domain            | Covers                                                                       | Example concepts                                          |
| ----------------- | ---------------------------------------------------------------------------- | --------------------------------------------------------- |
| `formal-science`  | Mathematics, logic, CS theory, algorithms, cryptography, formal verification | Big O notation, Lean4 proofs, RSA encryption              |
| `natural-science` | Physics, biology, chemistry, biochemistry, molecular biology                 | Protein folding, enzyme kinetics, torque, electrophoresis |
| `healthcare`      | Pharmacy, pharmaceutics, pharmacokinetics, drug delivery                     | CMC, bioavailability, MRDDS, controlled release           |
| `engineering`     | Applied CS, AI/ML, computer architecture, security, software verification    | Neural networks, Spectre exploit, type systems            |

If a concept spans multiple domains (e.g., "quantum computing" touches both
physics and CS), ask the user which angle they want to focus on.

### 3. Determine the sub-module

Within the domain, check the existing module paths in
`cue.mod/module.cue` at each domain's subdirectory. For example:

- `natural-science/biology/biochemistry/cue.mod/module.cue` →
  `natural-science.biology.biochemistry`
- `healthcare/pharmacy/pharmaceutics/cue.mod/module.cue` →
  `healthcare.pharmacy.pharmaceutics`

If no existing module fits, ask the user whether to add a new module
(subject directory) or place it in an existing adjacent one.

### 4. Determine the category

Within the module, choose one of these directory categories:

| Category      | When to use                                                                |
| ------------- | -------------------------------------------------------------------------- |
| `concept/`    | A fundamental concept (e.g., "alpha-helix", "enzyme")                      |
| `principle/`  | An experimental or methodological principle (e.g., "gel-electrophoresis")  |
| `phenomenon/` | An observed phenomenon (e.g., "protein refolding")                         |
| `specific/`   | A specific case study of a broader concept (e.g., "structure-of-collagen") |
| `law/`        | A physical or mathematical law                                             |
| `proof/`      | A formal proof                                                             |
| `desire/`     | Motivation or "why this matters"                                           |

Not all categories exist in every module — use the ones that fit the subject.

### 5. Scaffold the entry

Once the location is determined, create the CUE file:

- Use **hyphen-case** for the filename (e.g., `micelle-formation.cue`)
- Use the correct `package <name>` matching the module's category directory
- The content property name should be the **underscore-case** version of the
  filename (e.g., `micelle_formation`)
- Follow the existing patterns in the same category directory for structure
- Add `related` cross-references to existing concepts if applicable
- If a `resource.yaml` has an `order` list for the category, add the new
  filename (without `.cue`) to the appropriate position

### 6. Update the handbook order

If a `resource.yaml` exists in the module root directory and has an `order`
property for the category, insert the new concept filename (without `.cue`)
into the appropriate position in the list.
