#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#let l2-loss(r) = 1 / 2 * calc.pow(r, 2)
#let l2-gradient(r) = r
#let gaussian-density(r, sigma: 1.0) = {
  (
    1
      / (sigma * calc.sqrt(2 * calc.pi))
      * calc.exp(
        -calc.pow(r, 2) / (2 * calc.pow(sigma, 2)),
      )
  )
}

#let loss-panel(title, y-label, y-min, y-max, y-tick-step, body) = {
  cetz.canvas({
    import cetz.draw: *

    content((2.5, 4.2), title)

    plot.plot(
      size: (4.4, 3.7),
      x-label: [Residual $r$],
      y-label: y-label,
      x-min: -3,
      x-max: 3,
      y-min: y-min,
      y-max: y-max,
      x-tick-step: 1,
      y-tick-step: y-tick-step,
      body,
    )
  })
}

#align(center)[
  #figure(
    grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 6em,
      loss-panel(
        [Fig. 1: Loss],
        [$L_2(r)$],
        0,
        4.5,
        1,
        {
          plot.add(
            domain: (-3, 3),
            samples: 120,
            r => l2-loss(r),
            style: (
              stroke: (
                paint: red,
                thickness: 0.8pt,
              ),
            ),
          )
        },
      ),
      loss-panel(
        [Fig. 2: Distribution],
        [$p(r)$],
        0,
        0.45,
        0.15,
        {
          plot.add(
            domain: (-3, 3),
            samples: 120,
            r => gaussian-density(r),
            fill: true,
            style: (
              stroke: (
                paint: blue,
                thickness: 0.8pt,
              ),
              fill: blue.transparentize(75%),
            ),
          )
        },
      ),
      loss-panel(
        [Fig. 3: Derivative],
        [$"d"L_2\/"d"r$],
        -3,
        3,
        3,
        {
          plot.add-hline(
            0,
            style: (
              stroke: (
                paint: black.transparentize(60%),
                thickness: 0.4pt,
              ),
            ),
          )
          plot.add(
            domain: (-3, 3),
            samples: 2,
            r => l2-gradient(r),
            style: (
              stroke: (
                paint: green,
                thickness: 0.8pt,
              ),
            ),
          )
        },
      ),
    ),
    caption: [L2 loss, its residual distribution view, and its derivative.],
  )
]
