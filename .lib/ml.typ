#import "linear-algebra.typ": clean-matrix, inverse, mat-mul, transpose

/// Fit ordinary least-squares linear regression with the normal equation.
///
/// `xs` may contain either scalar samples for simple linear regression or row
/// arrays for multiple linear regression. When `intercept` is true, a leading
/// bias column of ones is added to the design matrix.
///
/// - xs (array): Training inputs.
/// - ys (array): Training targets.
/// - intercept (bool): Whether to add a leading bias term.
/// - tol (float): Singularity tolerance passed to `inverse`.
/// - clean (bool): Whether to snap tiny floating-point artifacts in the result.
/// - digits (int): Number of decimal places retained when `clean` is true.
///
/// -> array
#let linear-regression(
  xs,
  ys,
  intercept: true,
  tol: 1e-12,
  clean: true,
  digits: 6,
) = {
  assert(
    type(xs) == array,
    message: "linear-regression() expects xs to be an array",
  )
  assert(
    type(ys) == array,
    message: "linear-regression() expects ys to be an array",
  )
  assert(xs.len() > 0, message: "linear-regression() needs at least one sample")
  assert(
    xs.len() == ys.len(),
    message: "linear-regression() expects xs and ys to have the same length",
  )

  let design = ()
  let feature-count = none

  for x in xs {
    let row = ()

    if intercept {
      row.push(1)
    }

    if type(x) == array {
      if feature-count == none {
        feature-count = x.len()
      }

      assert(
        x.len() == feature-count,
        message: "linear-regression() expects every feature row to have the same length",
      )

      for value in x {
        assert(
          type(value) in (int, float),
          message: "linear-regression() feature values must be numeric",
        )
        row.push(value)
      }
    } else {
      assert(
        type(x) in (int, float),
        message: "linear-regression() feature values must be numeric",
      )

      if feature-count == none {
        feature-count = 1
      }

      assert(
        feature-count == 1,
        message: "linear-regression() cannot mix scalar and row-array samples",
      )

      row.push(x)
    }

    design.push(row)
  }

  let targets = ()

  for y in ys {
    assert(
      type(y) in (int, float),
      message: "linear-regression() target values must be numeric",
    )
    targets.push((y,))
  }

  let design-t = transpose(design)
  let coefficients = mat-mul(
    mat-mul(
      inverse(mat-mul(design-t, design), tol: tol),
      design-t,
    ),
    targets,
  )

  if clean {
    return clean-matrix(coefficients, tol: tol, digits: digits)
  }

  coefficients
}
