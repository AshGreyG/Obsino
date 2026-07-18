#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "/.lib/ml.typ" as ml

#let x-train-data = (0, 1, 2, 3, 4, 5)
#let y-train-data = (0.2, 0.8, 2.1, 2.9, 4.1, 5.3)

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
        y-min: 0,
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
