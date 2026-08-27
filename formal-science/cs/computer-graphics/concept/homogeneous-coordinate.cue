package concept

homogeneous_coordinate: {
  content: #"""
    A *homogeneous coordinate* represents a point or vector in an $n$-dimensional
    affine space with an additional coordinate. In three-dimensional graphics,
    a Cartesian point $(x, y, z)$ is represented as $(x, y, z, 1)$, while a
    direction vector is represented as $(x, y, z, 0)$.

    The distinction between the final coordinate is essential. A point can be
    translated, but a direction must not be affected by translation. For a
    homogeneous tuple $(x, y, z, w)$ with $w != 0$, the corresponding Cartesian
    point is obtained by the perspective division:

    $ (x, y, z) = (x/w, y/w, z/w) $

    Affine transformations can then be represented by one $4 times 4$ matrix.
    A translation by $(t_x, t_y, t_z)$ is:

    $ T = mat(
      1, 0, 0, t_x;
      0, 1, 0, t_y;
      0, 0, 1, t_z;
      0, 0, 0, 1
    ) $

    If $p=(x,y,z,1)$ is a point and $v=(x,y,z,0)$ is a direction, then
    multiplying by $T$ translates $p$ but leaves $v$ unchanged. Rotation,
    scaling, and translation can therefore be composed as ordinary matrix
    products and applied uniformly in a graphics pipeline.

    Homogeneous coordinates do not change the underlying Euclidean geometry.
    They provide a representation in which affine transformations become linear
    matrix operations, which is why model, view, and projection transforms can
    be combined before a vertex is sent to the rasterizer.
  """#
}
