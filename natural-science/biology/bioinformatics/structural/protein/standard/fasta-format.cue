package standard

fasta_format: {
  content: """
    The FASTA format is a text-based format for representing either nucleotide
    sequences or amino acids sequences, in which nucleotides or amino acids are
    represented using *single-letter codes*.

    A sequence begins with a character `>` followed by a description of the sequence
    (all in a single line). The lines immediately following the description line
    are the sequence representation, with one letter per amino acid or nucleic
    acid.

    For example:

    ```text
    >sp|O95905|ECD_HUMAN Protein ecdysoneless homolog OS=Homo sapiens OX=9606 GN=ECD PE=1 SV=1
    MEETMKLATMEDTVEYCLFLIPDESRDSDKHKEILQKYIERIITRFAPMLVPYIWQNQPF
    NLKYKPGKGGVPAHMFGVTKFGDNIEDEWFIVYVIKQITKEFPELVARIEDNDGEFLLIE...
    ```

    A multiple-sequence FASTA format, or multiple-FASTA format would be obtained
    by concatenating several single-sequence FASTA files in one file. All subsequent
    sequences to start with a `>` in order to be taken as separate sequences.

    The NCBI defined a standard for the unique identifier used for the sequence
    (SeqID) in the header line. This allows a sequence that was obtained from a
    database to be labelled with a reference to its database record. See the
    #link("\(external_link[0])")[github page] of NCBI.
  """
  external_link: [
    "https://ncbi.github.io/cxx-toolkit/pages/ch_demo#ch_demo.id1_fetch.html_ref_fasta"
  ]
}