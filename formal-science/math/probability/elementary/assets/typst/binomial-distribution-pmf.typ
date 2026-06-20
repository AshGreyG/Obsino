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

      let n = 40
      let ps = (0.2, 0.6)
      let colors = (blue, red)

      let binomial-distribution-pmf(k, n, p) = (
        calc.binom(n, k) * calc.pow(p, k) * calc.pow(1 - p, n - k)
      )

      plot.plot(
        size: (8, 5),
        axis-style: none,
        {
          for (idx, p) in ps.enumerate() {
            for k in range(0, n + 1) {
              plot.add-vline(
                k,
                min: 0,
                max: binomial-distribution-pmf(k, n, p),
                style: (
                  stroke: (
                    paint: colors.at(idx),
                  ),
                ),
              )
            }
          }
        },
      )
    }),
    caption: (
      "PMF of Binomial Distribution: "
        + text(blue)[---]
        + " is when "
        + $p = 0.2$
        + " and "
        + text(red)[---]
        + " is when "
        + $p = 0.6$
    ),
  )
]
