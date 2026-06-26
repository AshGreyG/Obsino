structure Point where
  x : Float
  y : Float

def point1 : Point := {
  x := 2.0,
  y := 0.0
}
#eval point1.x  -- 2.000000
#eval point1.y  -- 0.000000

def midpoint (a : Point) (b : Point) : Point :=
  { x := (a.x + b.x) / 2, y := (a.y + b.y) / 2 }

def point2 : Point := {
  x := 0.0,
  y := 2.0
}

#eval midpoint point1 point2  -- { x := 1.000000, y := 1.000000 }
