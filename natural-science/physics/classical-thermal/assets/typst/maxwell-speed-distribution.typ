#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      let offsets = (
        3.476e-6,
        5.616e-6,
        9.879e-6,
      )
      let colors = (
        red,
        green,
        blue,
      )

      plot.plot(
        size: (8, 8),
        x-label: [Velocity $v$ (m/s)],
        y-label: [Density $f(v) %$],
        {
          for (i, A) in offsets.enumerate() {
            let maxwell-boltzmann(v) = {
              (
                4
                  * calc.pi
                  * calc.pow(A / calc.pi, 1.5)
                  * calc.pow(v, 2)
                  * calc.exp(-A * calc.pow(v, 2))
                  * 100
              )
            }
            let v-most-probable = calc.sqrt(1 / A)
            let v-average = calc.sqrt(4 / calc.pi * 1 / A)
            let v-root-mean-square = calc.sqrt(3 / 2 * 1 / A)

            let velocities = (
              v-most-probable,
              v-average,
              v-root-mean-square,
            )
            let stroke-style = (
              "dashed",
              "dash-dotted",
              "dotted",
            )

            plot.add(
              domain: (0, 1000),
              v => maxwell-boltzmann(v),
              style: (
                stroke: colors.at(i),
              ),
            )
            for (j, v) in velocities.enumerate() {
              plot.add-vline(
                v,
                min: 0,
                max: maxwell-boltzmann(v),
                style: (
                  stroke: (
                    paint: colors.at(i),
                    dash: stroke-style.at(j),
                    thickness: 0.6pt,
                  ),
                ),
              )
            }
          }
          plot.add-legend(
            [
              #show math.equation: set text(10pt)
              $"most probable speed" sqrt(2 k T\/m)$
            ],
            preview: () => {
              line(
                (0, 0.2),
                (1, 0.2),
                stroke: (
                  paint: blue,
                  dash: "dashed",
                ),
              )
            },
          )
          plot.add-legend(
            [
              #show math.equation: set text(10pt)
              $"average speed" sqrt(8 k T \/π m)$
            ],
            preview: () => {
              line(
                (0, 0.2),
                (1, 0.2),
                stroke: (
                  paint: blue,
                  dash: "dash-dotted",
                ),
              )
            },
          )
          plot.add-legend(
            [
              #show math.equation: set text(10pt)
              $"root-mean-square speed" sqrt(3 k T\/m)$
            ],
            preview: () => {
              line(
                (0, 0.2),
                (1, 0.2),
                stroke: (
                  paint: blue,
                  dash: "dotted",
                ),
              )
            },
          )
        },
      )
    }),
    caption: "Maxwell-Boltzmann Speed Distribution",
  )
]
