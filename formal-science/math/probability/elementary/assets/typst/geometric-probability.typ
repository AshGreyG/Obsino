#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4": plot

#align(center)[
  #figure(
    cetz.canvas({
      import cetz.draw: *

      line((-1,0), (6,0), mark: (end: ">"))
      line((0,-1), (0,6), mark: (end: ">"))

      let point1 = (6, 2.4)
      let point2 = (2, -0.7)
      let theta-factor = 3
      let L = calc.sqrt(
        calc.pow(point1.at(0) - point2.at(0), 2) + 
        calc.pow(point1.at(1) - point2.at(1), 2)
      )
      let d = 8

      content((-0.3,-0.3), $cal("O")$)
      content((6.3,0), $x$)
      content((0,6.3), $y$)

      // rectangle of sample space
      line(
        (calc.pi / 2 * theta-factor, 0),
        (calc.pi / 2 * theta-factor, d / 2)
      )
      line(
        (0, d / 2),
        (calc.pi / 2 * theta-factor, d / 2)
      )
      content((0.4, d / 2 - 0.4), $Ω$)

      // sin curve of measured probability
      plot.plot(
        size: (calc.pi / 2 * theta-factor, L / 2),
        axis-style: none, {
          plot.add(
            domain: (0, calc.pi / 2),
            t => (t, L / 2 * calc.sin(t))
          )
          plot.add-fill-between(
            domain: (0, calc.pi / 2),
            t => (L / 2 * calc.sin(t)),
            t => (0),
          )
        }
      )
    }),
    caption: "Corresponding Geometric Measure of the Probability"
  )
]