package principle

chimerax_report_secondary_structure: {
  content: #"""
    In ChimeraX 1.11.1, we can use command `dssp <atom-spec> report true` to
    report the secondary structure of a protein.

    ```plaintext
    LYS /A:154   > >
    PRO /A:155 G > 4
    GLY /A:156 G 3 4
    LEU /A:157 G X >
    GLN /A:158 H < X
    LYS /A:159 H 3 >
    VAL /A:160 H X >
    VAL /A:161 G > <
    ASP /A:162 G 3 <
    VAL /A:163 G X <
    LEU /A:164 G X <
    ASP /A:165 G >
    SER /A:166 G <
    ILE /A:167 G <
    ```

    here `H` stands for $α$-helix and `G` stands for $3_(10)$-helix.
  """#
  related: [
    "concept/secondary-structure"
  ]
}