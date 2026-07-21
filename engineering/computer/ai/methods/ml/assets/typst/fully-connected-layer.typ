#import "@preview/fletcher:0.5.8": *

#align(center)[
  #figure(
    diagram(
      let b = blue.lighten(70%),
      node-fill: b,
      node-stroke: 0.8pt,
      node-shape: circle,
      edge-stroke: 0.8pt,
      let (o1, o2, o3) = ((0, 0), (1, 0), (2, 0)),
      let (x1, x2, x3, x4) = ((-0.5, 1.3), (0.5, 1.3), (1.5, 1.3), (2.5, 1.3)),
      for (idx, o) in (o1, o2, o3).enumerate() {
        node(o, $o_#(idx + 1)$)
      },
      for (idx, x) in (x1, x2, x3, x4).enumerate() {
        node(x, $x_#(idx + 1)$)
      },
      for x in (x1, x2, x3, x4) {
        for o in (o1, o2, o3) {
          edge(x, o)
        }
      }
    ),
    caption: "Softmax regression is a single fully-connected layer neural network",
  )
]
