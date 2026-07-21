#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot
#import "/.lib/special-function.typ" as sf

#align(center)[
  #figure(
    cetz.canvas(length: 20pt, {
      import cetz.draw: *

      line((0, 0), (10, 0), mark: (end: ">"), stroke: 0.6pt)
      line((5, -1), (5, 6), mark: (end: ">"), stroke: 0.6pt)

      content((4.7, -0.3), $cal("O")$)
      content((10.3, 0), $x$)
      content((5, 6.3), $y$)

      let deviations = (1, 1.8)
      let means = (1, 0, -1)
      let colors = (blue, red)

      let normal-distribution-cdf(t, deviation, mean) = (
        // erf is injected by header.typ with scope: ("erf": erf)
        1 / 2 * (1 + sf.erf__abramowitz((t - mean) / (calc.sqrt(2) * deviation)))
      )

      plot.plot(
        size: (10, 5),
        axis-style: none,
        {
          for (idx, i) in deviations.enumerate() {
            for j in means {
              if j != 0 {
                plot.add(
                  domain: (-5, 5),
                  t => normal-distribution-cdf(t, i, j),
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
                  t => normal-distribution-cdf(t, i, j),
                  style: (stroke: colors.at(idx)),
                )
              }
            }
          }
        },
      )
    }),
    caption: "CDF of Normal Distribution",
  )
]
