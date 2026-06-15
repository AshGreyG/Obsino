#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#align(center)[
  #figure(
    cetz.canvas(length: 20pt, {
      import cetz.draw: *

      line((0, 0), (10, 0), mark: (end: ">"), stroke: 0.6pt)
      line((5, -1), (5, 6), mark: (end: ">"), stroke: 0.6pt)

      content((4.7, -0.3), $cal("O")$)
      content((10.3, 0), $x$)
      content((5, 6.3), $y$)

      let factors = (1, 1.8)
      let x0s = (1, 0, -1)
      let colors = (blue, red)

      let cauchy-distribution-pdf(t, gamma, x0) = (
        1 / (calc.pi * gamma * (1 + calc.pow((t - x0) / gamma, 2)))
      )

      plot.plot(
        size: (10, 5),
        axis-style: none,
        {
          for (idx, i) in factors.enumerate() {
            for j in x0s {
              if j != 0 {
                plot.add(
                  domain: (-5, 5),
                  t => cauchy-distribution-pdf(t, i, j),
                  style: (
                    stroke: (
                      paint: colors.at(idx).transparentize(40%),
                      thickness: 0.3pt,
                    ),
                  ),
                )
              } else {
                plot.add(
                  domain: (-5, 5),
                  t => cauchy-distribution-pdf(t, i, j),
                  style: (stroke: colors.at(idx)),
                )
              }
            }
          }
        },
      )
    }),
    caption: "PDF of Cauchy Distribution",
  )
]
