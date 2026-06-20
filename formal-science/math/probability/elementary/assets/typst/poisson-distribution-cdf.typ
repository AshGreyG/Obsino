#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#align(center)[
  #figure(
    cetz.canvas(length: 20pt, {
      import cetz.draw: *

      line((-1, 0), (8, 0), mark: (end: ">"), stroke: 0.6pt)
      line((0, -1), (0, 6), mark: (end: ">"), stroke: 0.6pt)

      content((-0.3, -0.3), $cal("O")$)
      content((8.3, 0), $x$)
      content((0, 6.3), $y$)

      let n = 20
      let lambdas = (3, 0.7)
      let colors = (blue, red)

      let poisson-distribution-pmf(k, lambda) = (
        calc.pow(lambda, k) / calc.fact(k) * calc.exp(-lambda)
      )

      plot.plot(
        size: (8, 5),
        axis-style: none,
        {
          for (idx, lambda) in lambdas.enumerate() {
            let points = ()
            let sum = 0
            for k in range(0, n + 1) {
              sum += poisson-distribution-pmf(k, lambda)
              points.push((k, sum))
            }
            plot.add(points, line: (
              type: "raw",
            ))
          }
        },
      )
    }),
    caption: (
      "CDF of Poisson Distribution: "
        + text(blue)[---]
        + " is when "
        + $λ = 3$
        + " and "
        + text(red)[---]
        + " is when "
        + $λ = 0.7$
    ),
  )
]
