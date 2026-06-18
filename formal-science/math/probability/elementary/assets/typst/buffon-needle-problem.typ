#import "@preview/cetz:0.5.2"

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *
      // parallel lines but we only draw one main line
      line((0,0), (8,0))

      // needle endpoints
      let point1 = (6, 2.4)
      let point2 = (2, -0.7)
      let midpoint = (
        (point1.at(0) + point2.at(0)) / 2,
        (point1.at(1) + point2.at(1)) / 2,
      )
      // intersection point of needle and the line
      let intersect = (
        point1.at(0) - (point1.at(1) * (point2.at(0) - point1.at(0))
          / (point2.at(1) - point1.at(1))),
        0
      )
      let tan-theta = (point2.at(1) - point1.at(1)) / (point2.at(0) - point1.at(0))

      line(point1, point2, stroke: blue)
      line(
        midpoint,
        (midpoint.at(0), 0),
        stroke: (
          paint: blue,
          dash: "dashed"
        ),
      )
      content((midpoint.at(0) + 0.3, midpoint.at(1) / 2), $x$)
      content((intersect.at(0) + 0.5, intersect.at(1) + 0.2), $θ$)
      arc(
        (intersect.at(0) + 0.3, intersect.at(1)),
        start: 0deg,
        delta: calc.atan(tan-theta),
        radius: 0.3,
        stroke: blue
      )
    }),
    caption: "Geometric Condition of Buffon's Needle Problem"
  )
]
