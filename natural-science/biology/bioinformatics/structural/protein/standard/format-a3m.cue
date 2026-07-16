package standard

format_a3m: {
  content: """
    A3M Multiple Sequence Alignment Format is a compact text-based multiple sequence
    alignment that extends FASTA by using lowercase letters for insertions and
    omitting gap columns in match states, widely used by HHblits, HH-suite and
    AlphaFold for homology detection and structure prediction.

    A3M files follow FASTA syntax with `>` header lines followed by sequence lines:

    ```text
    >query
    MKFLILLFNILCLFPVLAADNHGVSMNAS
    >hit1
    MKFLILlfLFNILCL--VLAADNHGVSmnMNAS
    >hit2
    MK-LIL--LNILCL--VLAADN-GVS--MNAS
    ```

    where
    - *Uppercase letters*: match columns, aligned to the query sequence;
    - *Dashes (-)*: Deletions, gaps in match columns;
    - *Lowercase letters*: insertions relative to the query, these characters do
      not occupy match columns and are effectively squeezed out of the column
      structure.
  """
  related: [
    "standard/format-fasta"
  ]
}