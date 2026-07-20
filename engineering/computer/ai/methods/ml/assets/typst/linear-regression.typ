#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "/.lib/ml.typ" as ml

#let true-bias = 0.35
#let true-slope = 0.95
#let sample-count = 120
#let x-min = 0
#let x-max = 5

#let noise(i) = {
  let raw = calc.sin((i + 1) * 12.9898) * 43758.5453
  let fractional = raw - calc.floor(raw)
  (fractional - 0.5) * 0.8
}

#let true-relation(x) = true-bias + true-slope * x

#let x-train-data = ()
#let y-train-data = ()
#for i in range(sample-count) {
  let x = x-min + i * (x-max - x-min) / (sample-count - 1)
  x-train-data.push(x)
  y-train-data.push(true-relation(x) + noise(i))
}

#let weights = ml.linear-regression(x-train-data, y-train-data, digits: 3)
#let bias = weights.at(0).at(0)
#let slope = weights.at(1).at(0)
#let prediction(x) = bias + slope * x

#let train-points = ()
#for i in range(x-train-data.len()) {
  train-points.push((x-train-data.at(i), y-train-data.at(i)))
}

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      plot.plot(
        size: (8, 5),
        x-label: [Input $x$],
        y-label: [Target $y$],
        x-min: -0.2,
        x-max: 5.2,
        y-min: -0.2,
        y-max: 5.8,
        x-tick-step: 1,
        y-tick-step: 1,
        {
          plot.add(
            train-points,
            mark: "o",
            mark-size: 0.12,
            style: (
              stroke: blue.transparentize(100%),
              mark: (
                stroke: blue,
                fill: blue.transparentize(35%),
              ),
            ),
          )

          plot.add(
            domain: (0, 5),
            samples: 2,
            x => prediction(x),
            style: (
              stroke: (
                paint: red,
                thickness: 1pt,
              ),
            ),
          )
        },
      )
    }),
    caption: [
      Linear regression fit: $hat(y) = #bias + #slope x$.
    ],
  )
]
