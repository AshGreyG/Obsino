structure Point where
  x : Float
  y : Float

#check Point.mk 1.4 2.8 -- { x := 1.4, y := 2.8 } : Point
#check (Point.mk)       -- Point.mk : Float → Float → Point

structure Point3D where
  point ::
  x : Float
  y : Float
  z : Float

#check (Point3D.point)  -- Point3D.point : Float → Float → Float → Point3D
#check (Point3D.x)      -- Point3D.x : Point3D → Float

def point_3d : Point3D := {
  x := 0.2,
  y := 2.4,
  z := 9.8
}

#eval Point3D.x point_3d  -- 0.200000
#eval Point3D.z point_3d  -- 9.800000
