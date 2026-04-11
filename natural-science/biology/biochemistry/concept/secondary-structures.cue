package concept

import "natural-science.biology.biochemistry/phenomenon"

secondary_structures: {
  content: #"""
    Secondary structure refers to a local spatial arrangement of the main-chain
    atoms in a selected segment of a polypeptide chain. The organization around
    the peptide bond, paired with the identity of the $"R"$ groups, determines
    the secondary structure of the protein:

    - $α$ helix: stabilized by hydrogen bonds between nearby residues;
    - $β$ sheet ($β$ conformation): stabilized by hydrogen bonds between adjacent
      segments that may not be nearby;
    - random coil: irregular arrangement of the polypeptide chain.
  """#
  from: [
    phenomenon.floppy_string_protein.content
  ]
}