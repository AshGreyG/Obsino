structure Point where
  x : Float
  y : Float

def drawbackZeroX (p : Point) : Point :=
  { x := 0, y := p.y }

def normalZeroX (p : Point) : Point :=
  { p with x := 0.0 }

#eval normalZeroX { x := 1.0, y := 3.0 : Point }
-- { x := 0.000000, y := 3.000000 }

structure Point3D where
  x : Float
  y : Float
  z : Float

def normalZeroXYOfPoint3D (p : Point3D) : Point3D :=
  { p with x := 0, y := 0 }

#eval normalZeroXYOfPoint3D {
  x := 1.0,
  y := 3.0,
  z := 4.0
}
-- { x := 0.000000, y := 0.000000, z := 4.000000 }
