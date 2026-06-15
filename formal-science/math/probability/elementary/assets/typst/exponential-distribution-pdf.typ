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

      let lambdas = (1, 2)
      let colors = (blue, red)

      let exponential-distribution-pdf(t, lambda) = (
        lambda * calc.exp(-lambda * t)
      )

      plot.plot(
        size: (8, 5),
        axis-style: none,
        {
          for (idx, lambda) in lambdas.enumerate() {
            plot.add(
              domain: (0, 3),
              t => exponential-distribution-pdf(t, lambda),
              style: (
                stroke: (
                  paint: colors.at(idx)
                )
              )
            )
          }
        },
      )
    }),
    caption: "PDF of Exponential Distribution",
  )
]
