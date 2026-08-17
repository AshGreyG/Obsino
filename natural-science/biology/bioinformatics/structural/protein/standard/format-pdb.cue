package standard

format_pdb: {
  content: """
    The Protein Data Bank (PDB) format is a fixed-column text format for
    representing three-dimensional macromolecular structures. A PDB file stores
    atomic coordinates together with metadata describing the structure, its
    biological components, and the experiment used to determine it.

    A PDB entry is identified by a PDB identifier, traditionally a four-character
    code such as `1CRN`. The identifier refers to the archived structure, while a
    PDB file is one possible file representation of that structure.

    PDB files are composed of records. The first six columns of each line contain
    a record name, and the meaning and position of the remaining fields depend on
    that record. Common records include:

    - `HEADER`, `TITLE`, and `COMPND`: general information about the entry and
      the molecules it contains;
    - `ATOM`: coordinates for atoms belonging to standard polymer residues;
    - `HETATM`: coordinates for non-standard residues, ligands, ions, and water;
    - `TER`: the end of a polymer chain;
    - `MODEL` and `ENDMDL`: the boundaries of models in an entry containing
      multiple structural models, such as an NMR ensemble;
    - `CONECT`: explicit connectivity information, commonly used for ligands;
    - `END`: the end of the file.

    An `ATOM` or `HETATM` record contains fields such as the atom serial number,
    atom name, alternate location indicator, residue name, chain identifier,
    residue sequence number, Cartesian coordinates `(x, y, z)`, occupancy,
    temperature factor, element symbol, and formal charge. For example:

    ```text
    ATOM      1  N   MET A   1      20.154  38.456  12.673  1.00 21.46           N
    ATOM      2  CA  MET A   1      19.123  37.521  12.124  1.00 20.18           C
    HETATM  501  O   HOH A  42      25.840  31.102  18.672  1.00 28.77           O
    ```

    The traditional PDB format is limited by its fixed-width fields, four-character
    PDB identifiers, single-character chain identifiers, and limits on the number
    of atoms and other record values. For this reason, PDBx/mmCIF is the current
    primary archival format of the Worldwide Protein Data Bank (wwPDB). PDBx/mmCIF
    represents the same structural information with named data items and tables,
    and can describe larger structures and richer experimental metadata. The
    legacy PDB format remains widely used for compatibility with older software and
    for entries that can be represented within its limits.
  """
  external_link: [
    "https://www.wwpdb.org/documentation/file-format",
    "https://files.wwpdb.org/pub/pdb/doc/format_descriptions/Format_v33_A4.pdf",
    "https://mmcif.rcsb.org/docs/pdb_to_pdbx_correspondences.html"
  ]
}
