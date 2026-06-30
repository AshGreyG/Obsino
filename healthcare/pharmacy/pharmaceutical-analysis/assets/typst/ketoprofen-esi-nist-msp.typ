#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

// source: https://massbank.eu/MassBank/RecordDisplay?id=MSBNK-ACES_SU-AS000410
#let ketoprofen-ms-data = (
  (209.093, 474),
  (210.0917, 101),
  (255.0978, 999),
  (256.1003, 164)
)

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      plot.plot(
        size: (7, 7),
        x-label: [$m \/ z$],
        y-label: [Relative abundance],
        x-min: 200,
        x-max: 270,
        y-min: 0,
        y-max: 1100,
        {
          for (mz, abundance) in ketoprofen-ms-data {
            plot.add-vline(
              mz,
              min: 0,
              max: abundance,
              style: (
                stroke: (
                  paint: blue,
                ),
              ),
            )
          }
        },
      )
    }),
    caption: "The LC-ESI-MS Graph of Ketoprofen (NIST MSP)",
  )
]
