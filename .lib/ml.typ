// Copyright 2026 AshGrey
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in the
// Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
// and to permit persons to whom the Software is furnished to do so, subject to the
// following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// This is the header of every handbook, you can add predefined functions or
// styles here.

#import "linear-algebra.typ": clean-matrix, inverse, mat-mul, transpose

#let _fit-normal-equation(
  design,
  ys,
  tol: 1e-12,
  clean: true,
  digits: 6,
) = {
  let targets = ()

  for y in ys {
    assert(
      type(y) in (int, float),
      message: "regression target values must be numeric",
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

/// Fit ordinary least-squares polynomial regression with the normal equation.
///
/// For scalar samples, the design row is `(1, x, x^2, ..., x^degree)` when
/// `intercept` is true. For row-array samples, each feature is expanded by
/// powers independently, without cross-feature interaction terms.
///
/// - xs (array): Training inputs.
/// - ys (array): Training targets.
/// - degree (int): Highest polynomial degree to include.
/// - intercept (bool): Whether to add a leading bias term.
/// - tol (float): Singularity tolerance passed to `inverse`.
/// - clean (bool): Whether to snap tiny floating-point artifacts in the result.
/// - digits (int): Number of decimal places retained when `clean` is true.
///
/// -> array
#let polynomial-regression(
  xs,
  ys,
  degree: 1,
  intercept: true,
  tol: 1e-12,
  clean: true,
  digits: 6,
) = {
  assert(
    type(degree) == int,
    message: "polynomial-regression() expects degree to be an integer",
  )
  assert(
    degree >= 1,
    message: "polynomial-regression() expects degree to be at least 1",
  )
  assert(
    type(xs) == array,
    message: "polynomial-regression() expects xs to be an array",
  )
  assert(
    type(ys) == array,
    message: "polynomial-regression() expects ys to be an array",
  )
  assert(
    xs.len() > 0,
    message: "polynomial-regression() needs at least one sample",
  )
  assert(
    xs.len() == ys.len(),
    message: "polynomial-regression() expects xs and ys to have the same length",
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
        message: "polynomial-regression() expects every feature row to have the same length",
      )

      for power in range(1, degree + 1) {
        for value in x {
          assert(
            type(value) in (int, float),
            message: "polynomial-regression() feature values must be numeric",
          )
          row.push(calc.pow(value, power))
        }
      }
    } else {
      assert(
        type(x) in (int, float),
        message: "polynomial-regression() feature values must be numeric",
      )

      if feature-count == none {
        feature-count = 1
      }

      assert(
        feature-count == 1,
        message: "polynomial-regression() cannot mix scalar and row-array samples",
      )

      for power in range(1, degree + 1) {
        row.push(calc.pow(x, power))
      }
    }

    design.push(row)
  }

  _fit-normal-equation(design, ys, tol: tol, clean: clean, digits: digits)
}

/// Fit ordinary least-squares linear regression with the normal equation.
///
/// This is polynomial regression with `degree: 1`.
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
  polynomial-regression(
    xs,
    ys,
    degree: 1,
    intercept: intercept,
    tol: tol,
    clean: clean,
    digits: digits,
  )
}
