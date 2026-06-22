#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#let mass-peak(x, center: 400.0, fwhm: 2.0, height: 100.0) = {
  // Gaussian function derived from FWHM: sigma = fwhm / (2 * sqrt(2 * ln(2)))
  let sigma = fwhm / 2.35482
  let arg = (x - center) / sigma
  return height * calc.exp(-0.5 * arg * arg)
}

#let fwhm-list = (
  0.4,
  1.0,
  2.0,
  4.0,
)
#let colors = (
  red,
  green,
  blue,
  purple,
)

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *
      plot.plot(
        size: (7, 7),
        x-tick-step: 0.002,
        y-tick-step: 20,
        x-decimals: 3,
        x-label: [Mass-to-charge Ratio ($m\/z$)],
        y-label: [Relative Intensity (%)],
        x-min: 399.996,
        x-max: 400.004,
        y-min: 0,
        y-max: 110,
        {
          for (i, fwhm) in fwhm-list.enumerate() {
            plot.add(
              domain: (399.996, 400.004),
              style: (stroke: 1pt + colors.at(i)),
              samples: 200,
              x => mass-peak(
                x,
                center: 400.0,
                fwhm: fwhm * calc.pow(10, -3),
                height: 100.0,
              ),
            )
          }
        },
      )
    }),
    caption: [
      The different mass peaks of different resolution MS: #text(red)[---] has resolution \
      #text(red)[$R = 400 \/ (0.4 × 10^(-3)) = 10^6$], and so does \
      #text(green)[---] has #text(green)[$R = 4 × 10^5$],
      #text(blue)[---] has #text(blue)[$R = 2 × 10^5$],
      #text(purple)[---] has #text(purple)[$R = 10^5$]
    ]
  )
]
