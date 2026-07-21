#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "/.lib/ml.typ" as ml

#let x-train-data = (-3, -2, -1, 0, 1, 2, 3)
#let y-train-data = (-4.7, 0.1, 2.4, 1.2, -0.1, 1.3, 6.6)

#let weights = ml.polynomial-regression(
  x-train-data,
  y-train-data,
  degree: 3,
  digits: 3,
)
#let bias = weights.at(0).at(0)
#let linear = weights.at(1).at(0)
#let quadratic = weights.at(2).at(0)
#let cubic = weights.at(3).at(0)
#let prediction(x) = (
  bias + linear * x + quadratic * calc.pow(x, 2) + cubic * calc.pow(x, 3)
)

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
        x-min: -3.2,
        x-max: 3.2,
        y-min: -6,
        y-max: 8,
        x-tick-step: 1,
        y-tick-step: 2,
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
            domain: (-3, 3),
            samples: 100,
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
      Degree-3 polynomial regression fit:
      $hat(y) = #bias #linear x #quadratic x^2 + #cubic x^3$.
      // #linear and #quadratic are negative in this situation
    ],
  )
]
