#import "@preview/cetz:0.5.2"

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *
      // semicircle
      arc(
        (3,0),
        start: 0deg,
        delta: 180deg,
        mode: "PIE",
        radius: (3, 3),
        stroke: blue + 1pt
      )
      // x-axis
      line(
        (-5,0), (5,0),
        mark: (end: ")>"),
        stroke: black + 1pt
      )
      // y-axis
      line(
        (0,-1), (0,5),
        mark: (end: ")>"),
        stroke: black + 1pt
      )
      content((-0.5,-0.5), $cal("O")$)
      content((5,-0.5), $x$)
      content((-0.5,5), $y$)
      // center-of-mass
      circle(
        (0, 2 / calc.pi * 3),
        radius: (0.1, 0.1),
        fill: blue,
        stroke: blue
      )
      // a line pointing to the center-of-mass
      line(
        (3,4), (0.5, 2 / calc.pi * 3 + 0.4),
        mark: (end: "straight"),
        stroke: black + 0.5pt
      )
      content((3.5, 4.5), "center-of-mass")
    }),
    caption: "Calculating the mass center of semicircle"
  )
]