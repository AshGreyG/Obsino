#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "@preview/suiji:0.5.1": gen-rng-f, uniform-f
#import "/.lib/ml.typ" as ml

#let noise-std = 0.25
#let bayes-error = noise-std * noise-std / 3
#let seed = 20260723
#let train-sizes = (8, 12, 16, 24, 32, 48, 64, 96, 128, 192, 256, 384, 512)

#let target(x) = (
  0.7
    - 1.3 * x
    + 1.9 * calc.pow(x, 2)
    - 0.8 * calc.pow(x, 3)
    + 0.35 * calc.pow(x, 5)
)

#let sample-x(i, n) = -1 + 2 * i / (n - 1)

#let make-data(n, rng) = {
  let xs = ()
  let ys = ()

  for i in range(n) {
    let x = sample-x(i, n)
    let eps = 0
    (rng, eps) = uniform-f(rng, low: -noise-std, high: noise-std)
    xs.push(x)
    ys.push(target(x) + eps)
  }

  (rng, (xs: xs, ys: ys))
}

#let evaluate(weights, x) = {
  let y = 0

  for power in range(weights.len()) {
    if power == 0 {
      y += weights.at(power).at(0)
    } else {
      y += weights.at(power).at(0) * calc.pow(x, power)
    }
  }

  y
}

#let mse(xs, ys, weights) = {
  let total = 0

  for i in range(xs.len()) {
    let error = evaluate(weights, xs.at(i)) - ys.at(i)
    total += error * error
  }

  total / xs.len()
}

#let growing-degree(n) = {
  if n < 32 {
    2
  } else if n < 64 {
    3
  } else if n < 128 {
    4
  } else if n < 256 {
    5
  } else {
    6
  }
}

#let learning-curve(degree-for-size, rng, test-data) = {
  let train-points = ()
  let test-points = ()

  for n in train-sizes {
    let degree = degree-for-size(n)
    let train-data = none
    (rng, train-data) = make-data(n, rng)
    let weights = ml.polynomial-regression(
      train-data.xs,
      train-data.ys,
      degree: degree,
      clean: false,
    )

    train-points.push((n, mse(train-data.xs, train-data.ys, weights)))
    test-points.push((n, mse(test-data.xs, test-data.ys, weights)))
  }

  (rng, (train: train-points, test: test-points))
}

#let bayes-points = train-sizes.map(n => (n, bayes-error))
#let curves = {
  let rng = gen-rng-f(seed)
  let test-data = none
  let underfit = none
  let sufficient = none
  let growing = none

  (rng, test-data) = make-data(121, rng)
  (rng, underfit) = learning-curve(n => 1, rng, test-data)
  (rng, sufficient) = learning-curve(n => 5, rng, test-data)
  (rng, growing) = learning-curve(growing-degree, rng, test-data)

  (
    underfit: underfit,
    sufficient: sufficient,
    growing: growing,
  )
}

#let curve-panel(title, curve) = {
  cetz.canvas({
    import cetz.draw: *

    content((2.4, 3.85), title)

    plot.plot(
      size: (4.8, 3.6),
      x-label: [training examples],
      y-label: [mean squared error],
      x-min: 8,
      x-max: 512,
      y-min: 0,
      y-max: calc.max(..(
        calc.max(..curve.train.map(n => n.at(1))),
        calc.max(..curve.test.map(n => n.at(1))),
        bayes-error
      )),
      x-tick-step: 100,
      y-tick-step: 0.1,
      {
        plot.add(
          curve.train,
          mark: "o",
          mark-size: 0.08,
          style: (
            stroke: (
              paint: blue,
              thickness: 0.8pt,
            ),
            mark: (
              stroke: blue,
              fill: blue.transparentize(35%),
            ),
          ),
        )

        plot.add(
          curve.test,
          mark: "square",
          mark-size: 0.08,
          style: (
            stroke: (
              paint: red,
              thickness: 0.8pt,
            ),
            mark: (
              stroke: red,
              fill: red.transparentize(35%),
            ),
          ),
        )

        plot.add(
          bayes-points,
          style: (
            stroke: (
              paint: black.transparentize(45%),
              thickness: 0.6pt,
              dash: "dashed",
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
      gutter: 6.2em,
      curve-panel([Fixed degree 1], curves.underfit),
      curve-panel([Fixed degree 5], curves.sufficient),
      curve-panel([Growing degree], curves.growing),
    ),
    caption: [
      Polynomial regression learning curves computed directly in Typst. Blue is
      training error, red is generalization error, and the dashed line marks the
      irreducible noise level.
    ],
  )
]
