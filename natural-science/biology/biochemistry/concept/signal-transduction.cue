package concept

signal_transduction: {
  content: """
    The process that a signal which represents information is detected by
    specific receptors and converted to a *cellular response* is called *signal
    transduction*. Even though the number of different biological signalling is
    large, organisms use just a few evolutionary conserved mechanisms to detect
    *extracellular* signals and transduce them into *intracellular* changes.

    Five features of signal-transducing systems:

    1. *Specificity*: Signal molecule fits binding site on its complementary
      receptor; other signals do not fit;

    2. *Amplification*: When enzymes activate enzymes, the number of affected
      molecules increases geometrically in an enzyme cascade;

    3. *Modularity*: Proteins with multivalent affinities from diverse signaling
      complexes from interchangeable parts. Phosphorylation provides reversible
      points of interaction;

    4. *Desensitization/Adaption*: Receptor activation triggers a feedback loop
      that *shuts off* the receptor or removes it from the cell surface;

    5. *Integration*: Organisms are able to receive multiple signals and produce
      a unified response appropriate to their needs. When two signals have
      opposite effects on same metabolic characteristics, the regulatory outcome
      results from the integrated input from both receptors.

    Signal transduction can be classified according to *the type of receptor*.
    All of different signal transductions are similar on the whole procedure:

    \(figure_part_procedure)
  """
  figure_part_procedure: #"""
    #let procedure = "assets/typst/procedure-of-signal-transduction.typ"
    #eval(
      str(read(procedure)),
      mode: "markup"
    )
  """#
}