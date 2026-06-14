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

      let n = 30
      let ps = (0.3, 0.4)
      let colors = (blue, red)

      let binomial-distribution-pmf(k, n, p) = (
        calc.binom(n, k) * calc.pow(p, k) * calc.pow(1 - p, n - k)
      )

      plot.plot(
        size: (8, 5),
        axis-style: none,
        {
          for (idx, p) in ps.enumerate() {
            let points = ()
            let sum = 0
            for k in range(0, n + 1) {
              sum += binomial-distribution-pmf(k, n, p)
              points.push((k, sum))
            }
            plot.add(points, line: (
              type: "raw",
            ))
          }
        },
      )
    }),
    caption: "CDF of Binomial Distribution",
  )
]
