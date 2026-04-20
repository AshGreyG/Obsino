package concept

restriction_enzyme: {
  content: #"""
    A *restriction enzyme* (also known as *restriction endonuclease*, *REase*,
    *ENase* or *restrictase*) is an enzyme that cleaves DNA into fragments at or
    near specific recognition sites within molecules known as *restriction sites*.
    Restriction enzymes are commonly classified into five types, which differ in
    their structure and whether they cut their DNA substrate at their recognition
    site, or if the recognition and cleavage sites are separate from one another.
    To cut DNA, all restriction enzymes make two incisions, once through each
    sugar-phosphate backbone of the DNA double helix.

    These enzymes are found in bacteria and archaea and provide a defense
    mechanism against invading viruses. Inside a prokaryote, the restriction
    enzymes *selectively cut up foreign DNA* in a process called *restriction
    digestion*; meanwhile, host DNA is protected by a modification enzyme (
    a methyltransferase) that modifies the prokaryotic DNA and blocks cleavage.
    Together these two processes form the restriction modification system.

    Different restriction enzymes acting on different recognition sites produce
    different DNA fragments.

    Restriction enzymes recognize a specific sequence of nucleotides and produce
    a double-strand cut in the DNA. The recognition sequences can also be
    classified by the number of bases in its recognition site, usually between
    4 and 8 bases, and the number of bases in the sequence will determine how
    often the site will appear by chance in any given genome (a 4-base pair
    sequence would theoretically occur once every $4^4=256 "bp"$, here bp
    represents *base pair*). Many of the recognition sites are *palindromic*:

    1. The *mirror-like* palindrome is similar to those found in ordinary text,
      in which a sequence reads the same forward and backward *on a single strand
      of DNA*, like `GTAATG`;
    2. The *inverted repeat* palindrome is also a sequence that reads the same
      forward and backward but the forward and backward sequences are found in
      complementary DNA strands like `GTATAC` in one strand and `CATATG` in
      another.

    Inverted repeat palindromes are more common and have greater biological
    importance than mirror-like palindromes.

    Different restriction enzymes that recognize the same sequence are known
    as *isoschizomers*. Different enzymes that recognize the same location but
    cut at a different position are known as *neoschizomers*. Different restriction
    enzymes recognize slightly different sequence but generate the same sticky
    end (cohesive end) are called *isocaudomers*.

    Naturally occurring restriction endonucleases are categorized into five
    groups (Types I, II, III, IV and V) based on

    - Their composition;
    - Enzyme cofactor requirements;
    - The nature of their target sequence;
    - The position of their DNA cleavage site relative to the target sequence.

    All types of enzymes recognize specific short DNA sequences and carry out
    the endonucleolytic cleavage of DNA to give specific fragments with terminal
    5'-phosphates.

    1. Type I enzymes cleave at sites remote from a recognition site; require
      both ATP and S-adenosyl-L-methionine (SAMe) to function; multifunctional
      protein with both restriction digestion and methylase activities;

    2. Type II enzymes cleave within or at short specific distances from a
      recognition site; most require magnesium; single function restriction
      digestion enzymes independent of methylase;

    3. Type III enzymes cleave at sites a short distance from a recognition site;
      require ATP (but do not hydrolyse it); S-adenosyl-L-methionine (SAMe)
      stimulates the reaction but is not must required; exists as part of complex
      with a modification methylase;

    4. Type IV enzymes target modified DNA e.g. methylated (甲基化),
      hydroxymethylated (羟甲基化), glucosyl-hydroxymethylated (葡萄糖羟甲基化) DNA;

    5. Type V enzymes utilize guide RNAs (gRNAs).

    Some restriction endonucleases form two *blunt ends* after cleavage and some
    form *sticky ends*.

    ```plaintext
    EcoRV (blunt ends):

    5' ... G A T A T C ... 3'        5' ... G A T 3'    5' A T C ... 3'
           | | | | | |          =>          | | |          | | |
    3' ... C T A T A G ... 5'        3' ... C T A 5'    3' T A G ... 5'

    BamHI (sticky ends):

    5' ... G G A T C C ... 3'        5' ... G 3'      5' G A T C C ... 3'
           | | | | | |          =>          | + + + +    + + + + |
    3' ... C C T A G G ... 5'        3' ... C C T A G 5'      3' G ... 5'
    ```

    Enzyme nomenclature of restriction endonuclease: the first one letter
    represents the Species such as Eco represents *Escherichia coli*. One
    English letter is used to represent the strain. For example, R represents 
    Escherichia coli RY13 strain. If there are several different kinds of
    restriction enzymes from one host, roman numerals are used such as EcoRI
    and EcoRV.
  """#
}