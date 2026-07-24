package desire

snac_db_2026_limitation: {
  content: """
    - In practice, Ab/Nb-Ag modeling still trails general protein-protein prediction,
      which can leverage *coevolutionary signals* from *paired multiple sequence
      alignments* (MSAs) and typically involves relatively *rigid interfaces*.
      In contrast, *complementarity-determining regions* (CDR loops) are
      1. *hypervariable*
      2. *highly flexible*
      3. often undergo *conformational rearrangement* upon binding

      making accurate prediction substantially more challenging;

    - Raw PDB files remain notoriously complex:
      1. chain identifiers vary
      2. biological assemblies and asymmetric units may be mislabeled or incomplete
      3. missing residues are recorded only in headers
      4. true binding partners can be obscured by crystal-packing artifacts or
        multi-chain epitopes;

    - SAbDab applies rule-based parsing to extract complexes, such as automated
      approaches inevitably miss *edge cases* that require expert structural
      biology insight;

    - SAbDab's strict focus on Ab/Nb interactions with non-immunoglobulin targets
      excludes several classes of therapeutically relevant complexes, most notably
      Ab-Nb pairs and TCR-antigen assemblies;
  """
}