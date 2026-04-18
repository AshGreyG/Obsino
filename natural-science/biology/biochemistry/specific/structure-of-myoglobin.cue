package specific

structure_of_myoglobin: {
  content: """
    Myoglobin is the oxygen carrier in muscle. It is a single polypeptide chain,
    it has 153 amino acids, and $M_r = 16700$. The heme as a prosthetic group
    is capable to bind oxygen. Myoglobin is extremely compact, 70% main chain
    folded into eight $α$ right-handed helices.

    \(figure_part_heme)

    Tertiary structure of myoglobin:

    - Interior consists almost entirely of nonpolar residues;
    - The only polar residues inside are 2 His, which play critical roles in
      binding iron and oxygen;
    - Charged residues are on the outer surface;
    - Little empty space inside for iron and oxygen.

    \(figure_part_myoglobin_electrostatic)
  """
  figure_part_heme: #"""
    #let heme = read("assets/heme.svg")
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 40%)[
          #figure(
            image(bytes(heme)),
            caption: "Heme prosthetic group"
          )
        ]
      ]
    ]
  """#
  figure_part_myoglobin_electrostatic: #"""
    #let myoglobin-electrostatic = "assets/myoglobin-electrostatic.png"
    #align(center)[
      #stack(dir: ltr)[
        #box(width: 70%)[
          #figure(
            image(myoglobin-electrostatic),
            caption: "Electrostatic graphic of Myoglobin"
          )
        ]
      ]
    ]
  """#
}