#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

// source: https://massbank.eu/MassBank/RecordDisplay?id=MSBNK-JEOL_Ltd-JEL00010
// thanks to vscode extension: vscodevim.vim, using registry to complete boring
// pasting task is awesome.
#let angiotensin-ms-data = (
  (43.22945, 150),
  (44.25864, 118),
  (59.15115, 215),
  (60.15572, 61),
  (70.14161, 999),
  (72.16383, 467),
  (73.13987, 105),
  (82.08136, 52),
  (86.13142, 399),
  (87.12418, 689),
  (88.0981, 208),
  (95.07837, 73),
  (100.09235, 183),
  (110.06598, 864),
  (112.08438, 265),
  (115.07283, 160),
  (136.05984, 337),
  (185.08254, 105),
  (213.17227, 73),
  (244.18694, 179),
  (245.16758, 53),
  (255.12801, 565),
  (263.17515, 123),
  (272.17881, 67),
  (329.22225, 309),
  (343.23644, 610),
  (354.2298, 79),
  (414.23855, 56),
  (464.26121, 92),
  (506.31934, 800),
  (591.35238, 237),
  (605.34072, 65),
  (619.36964, 591),
  (700.38324, 131),
  (728.40319, 88),
  (756.40812, 672),
  (784.33871, 115),
  (829.49311, 65),
  (853.36289, 90),
  (931.50119, 107),
)

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      plot.plot(
        size: (7, 7),
        x-label: [$m \/ z$],
        y-label: [Relative abundance],
        x-min: 30,
        x-max: 1000,
        y-min: 0,
        y-max: 1100,
        {
          for (mz, abundance) in angiotensin-ms-data {
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
    caption: "The MALDI-MS Graph of angiotensin II (NIST MSP)",
  )
]
