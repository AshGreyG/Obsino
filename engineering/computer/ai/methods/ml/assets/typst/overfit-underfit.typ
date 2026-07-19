#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "/.lib/ml.typ" as ml

#let x-train-data = (
  -1.0,
  -0.78,
  -0.56,
  -0.33,
  -0.11,
  0.11,
  0.33,
  0.56,
  0.78,
  1.0,
)
#let y-train-data = (
  2.8,
  1.15,
  1.35,
  0.25,
  0.7,
  0.35,
  0.95,
  0.9,
  2.2,
  2.35,
)

#let train-points = ()
#for i in range(x-train-data.len()) {
  train-points.push((x-train-data.at(i), y-train-data.at(i)))
}

#let weights-for(degree) = ml.polynomial-regression(
  x-train-data,
  y-train-data,
  degree: degree,
  clean: false,
)

#let evaluate(weights, x) = {
  let y = 0
  for power in range(weights.len()) {
    y += weights.at(power).at(0) * calc.pow(x, power)
  }
  y
}

#let regression-panel(title, degree) = {
  let weights = weights-for(degree)

  cetz.canvas({
    import cetz.draw: *

    content((2.5, 4.2), title)

    plot.plot(
      size: (5, 4),
      x-label: [$x$],
      y-label: [$y$],
      x-min: -1.1,
      x-max: 1.1,
      y-min: -0.5,
      y-max: 4,
      x-tick-step: 0.5,
      y-tick-step: 1,
      {
        plot.add(
          train-points,
          mark: "o",
          mark-size: 0.1,
          style: (
            stroke: blue.transparentize(100%),
            mark: (
              stroke: blue,
              fill: blue.transparentize(35%),
            ),
          ),
        )

        plot.add(
          domain: (-1, 1),
          samples: 200,
          x => evaluate(weights, x),
          style: (
            stroke: (
              paint: red,
              thickness: 0.8pt,
            ),
          ),
        )
      },
    )
  })
}

#align(center)[
  #figure(
    grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 0.7em,
      regression-panel([Underfit], 1),
      regression-panel([Appropriate capacity], 2),
      regression-panel([Overfit], 9),
    ),
    caption: [Polynomial regression models with different capacities.],
  )
]
