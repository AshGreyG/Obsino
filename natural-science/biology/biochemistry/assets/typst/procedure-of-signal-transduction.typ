#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw as d
      // because the draw.rect function will conflict with builtin rect function

      d.content(
        (0,0),
        rect[
          A signal interacts with a receptor
        ],
        name: "signal-receptor"
      )
      d.content(
        (0,-2),
        rect[
          The activated receptor interacts with cellular machinery, producing \
          a second signal or change in the activity of a cellular protein
        ],
        name: "receptor-second-signal"
      )
      d.content(
        (0,-4),
        rect[
          The metabolic activity of the target cell undergoes a change
        ],
        name: "target-metabolic"
      )
      d.line(
        "signal-receptor.south",
        "receptor-second-signal.north",
        mark: (end: ">")
      )
      d.line(
        "receptor-second-signal.south",
        "target-metabolic.north",
        mark: (end: ">")
      )
    }),
    caption: "Normal Procedure of All Kinds of Signal Transduction System"
  )
]