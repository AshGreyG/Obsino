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

/// Default constructor of a matrix.
///
/// This function constructs a matrix from various input formats. It supports:
/// - Multiple row arrays (each row as an array)
/// - Flat data with explicit `rows` and `cols` dimensions
/// - Mixed inputs (arrays and scalars) with automatic alignment and filling
///
/// = Examples:
///
/// ```typst
/// // From multiple row arrays
/// #let A = matrix((1, 2), (3, 4))
/// // -> ((1, 2), (3, 4))
///
/// // From flat data with dimensions
/// #let B = matrix(1, 2, 3, 4, cols: 2, rows: 2)
/// // -> ((1, 2), (3, 4))
///
/// // Fill missing positions with a default value
/// #let C = matrix(1, 2, 3, cols: 2, rows: 2, fill: 0)
/// // -> ((1, 2), (3, 0))
///
/// // Mixed inputs with automatic column alignment
/// #let D = matrix((1, 2), 3, (4, 5, 6), fill: 0)
/// // -> ((1, 2, 0), (3, 0, 0), (4, 5, 6))
/// ```
///
/// Panics:
/// - If `rows` and `cols` are not provided together (one is given but not the other)
/// - If data length exceeds the specified `rows * cols` dimensions
/// - If filling is needed (missing positions exist) but `fill` is `none`
/// - If `fill` is provided but is not a numeric type (`int`, `float`)
/// - If `args` is empty and no dimensions are provided
/// - If no valid input format is detected
///
/// - args (arguments): The input entries. Each argument can be:
///   - An array representing a row (e.g., `(1, 2, 3)`)
///   - A scalar (int or float) representing a single element
///   - Multiple arguments can be mixed freely
/// - rows (int): Number of rows. Must be specified together with `cols`.
///   When provided, `args` are treated as flat data.
/// - cols (int): Number of columns. Must be specified together with `rows`.
///   When provided, `args` are treated as flat data.
/// - fill (float): Value to fill missing positions. Required when:
///   - Flat data length is less than `rows * cols`
///   - Row arrays have unequal lengths
///   - Scalars are mixed with row arrays of length > 1
///
/// -> array
#let matrix(
  ..args,
  rows: none,
  cols: none,
  fill: none,
) = {
  // when rows and cols are given simultaneously
  if rows != none and cols != none {
    let data = args
    let expected = rows * cols
    assert(
      data.len() <= expected,
      message: "Data length "
        + str(data.len())
        + "with given dimension "
        + str(rows)
        + "×"
        + str(cols)
        + "is not matched and data length is greater",
    )
    let result = ()
    for i in range(1, rows + 1) {
      let temp = ()
      for j in range(1, cols + 1) {
        if (i - 1) * cols + j - 1 <= data.len() - 1 {
          // use named argument `default`
          temp.push(args.at((i - 1) * cols + j - 1, default: fill))
        } else {
          assert(
            fill != none,
            message: "You want to fill in blanks in matrix but you didn't provide any fill-in element",
          )
          assert(
            type(fill) in (int, float),
            message: "Your provided fill-in element is not a number",
          )
          temp.push(fill)
        }
      }
      result.push(temp)
    }
    return result
  }

  // when one of `rows` and `cols` is none
  if (rows != none and cols == none) or (rows == none and cols != none) {
    panic("You must provide `rows` and `cols` simultaneously")
  }

  // we can only construct from `args`
  if (rows == none and cols == none) {
    let at-least-one-array = false
    for i in range(args.len()) {
      if type(args.at(i)) == array {
        at-least-one-array = true
        break
      }
    }
    assert(
      at-least-one-array,
      message: "When `rows` and `cols` are missing and the arguments are not provided
       by multiple arrays, we can not decide how to construct the matrix",
    )
    let result = ()
    let max-column = 1
    // first we need to specify the maximum length of input rows
    for i in range(args.len()) {
      if (type(args.at(i)) == array and args.at(i).len() > max-column) {
        max-column = args.at(i).len()
      }
    }
    for i in range(args.len()) {
      let temp = ()
      let type-element = type(args.at(i))
      if (type-element == array) {
        if max-column != args.at(i).len() {
          // we also need to specify, when every row is not same length, is
          // provided `fill` parameter a number
          assert(
            fill != none,
            message: "You want to fill in blanks in matrix but you didn't provide any fill-in element",
          )
          assert(
            type(fill) in (int, float),
            message: "Your provided fill-in element is not a number",
          )
        }
        for j in range(max-column) {
          if (j <= args.at(i).len() - 1) {
            temp.push(args.at(i).at(j))
          } else {
            temp.push(fill)
          }
        }
      } else if type-element in (int, float) {
        temp.push(args.at(i))
        for j in range(max-column - 1) {
          assert(
            fill != none,
            message: "You want to fill in blanks in matrix but you didn't provide any fill-in element",
          )
          assert(
            type(fill) in (int, float),
            message: "Your provided fill-in element is not a number",
          )
          temp.push(fill)
        }
      }
      result.push(temp)
    }
    return result
  }
}

/// Create a matrix filled with zeros.
///
/// - rows (int): Number of rows
/// - cols (int): Number of columns
///
/// -> array
#let zeros(rows, cols) = matrix(rows: rows, cols: cols, fill: 0)

/// Create a matrix filled with ones.
///
/// - rows (int): Number of rows
/// - cols (int): Number of columns
///
/// -> array
#let ones(rows, cols) = matrix(rows: rows, cols: cols, fill: 1)

/// Create a (square) identity matrix with dimensions $"size" times "size"$
///
/// - size (int): Size of the matrix
/// -> array
#let identity(size) = {
  assert(size >= 1, message: "size must be at least 1")
  return ().at(
    size - 1,
    default: range(0, size).map(j => range(0, size).map(k => {
      if j == k { 1.0 } else { 0.0 }
    })),
  )
}

/// Get the shape (dimensions) of a matrix, return (rows, cols)
///
/// - mat (array): The input matrix
///
/// -> (int, int)
#let shape(mat) = {
  assert(
    type(mat) == array,
    message: "shape() expects an array, got:" + str(type(mat)),
  )
  if mat.len() == 0 {
    return (0, 0)
  }
  // Check if all rows are arrays
  for row in mat {
    assert(type(row) == array, message: "All rows must be arrays")
  }
  let first-len = mat.at(0).len()
  for row in mat {
    assert(
      row.len() == first-len,
      message: "Matrix rows have inconsistent lengths",
    )
  }
  return (mat.len(), first-len)
}

/// Check if a matrix is empty.
///
/// - mat (array): The input matrix
/// -> bool
#let is-empty(mat) = {
  return shape(mat) == (0, 0)
}

#let is-matrix(mat) = {
  assert(not is-empty(mat), message: "is-matrix() expects non-empty matrix")
  assert(
    type(mat) == array,
    message: "is-matrix() expects an array, got:" + str(type(mat)),
  )
  for row in mat {
    assert(type(row) == array, message: "All rows must be arrays")
  }
  let first-len = mat.at(0).len()
  for row in mat {
    if (row.len() != first-len) {
      return false
    }
  }
  return true
}

/// Check if a matrix is square.
///
/// - mat (array): The input matrix
///
/// -> bool
#let is-square(mat) = {
  let (rows, cols) = shape(mat)
  return rows == cols
}

/// Check if a matrix is symmetric.
///
/// - mat (array): The input matrix (must be square)
/// - tol (float): Tolerance for floating-point comparison (default: 1e-10)
///
/// -> bool
#let is-symmetric(mat, tol: 1e-10) = {
  if not is-square(mat) {
    return false
  }
  let n = mat.len()
  for i in range(n) {
    for j in range(i + 1, n) {
      if calc.abs(mat.at(i).at(j) - mat.at(j).at(i)) > tol {
        return false
      }
    }
  }
  return true
}

/// Multiple two matrices and return the result
///
/// - a (array): matrix dimension in p × q
/// - b (array): matrix dimension in q × r
/// -> array
#let mat-mul(a, b) = {
  assert(is-matrix(a), message: "First parameter must be matrix")
  assert(is-matrix(b), message: "Second parameter must be matrix")
  assert(not is-empty(a), message: "First matrix must not be empty")
  assert(not is-empty(b), message: "Second matrix must not be empty")
  let a_row = a.len()
  let a_col = a.at(0).len()
  let b_row = b.len()
  let b_col = b.at(0).len()
  assert(
    a_col == b_row,
    message: "Matrix dimensions are incompatible: "
      + str(a_row)
      + "×"
      + str(a_col)
      + " cannot be multiplied by "
      + str(b_row)
      + "×"
      + str(b_col),
  )
  // After those assertion we can assign the dimensions normally
  let p = a_row
  let q = a_col
  let r = b_col

  let result = zeros(p, r)
  for i in range(p) {
    for j in range(r) {
      let sum = 0
      for k in range(q) {
        sum += a.at(i).at(k) * b.at(k).at(j)
      }
      result.at(i).at(j) = sum
    }
  }
  return result
}

/// Transpose of matrix
///
/// - mat (array): input matrix in shape p × q, return its transpose whose shape
///   is q × p
/// -> array
#let transpose(mat) = {
  assert(is-matrix(mat), message: "Input must be matrix")
  assert(not is-empty(mat), message: "Input matrix must not be empty")
  let (p, q) = shape(mat)
  let result = zeros(q, p)
  for i in range(p) {
    for j in range(q) {
      result.at(j).at(i) = mat.at(i).at(j)
    }
  }
  return result
}

/// Compute the inverse of a square matrix using Gauss–Jordan elimination
/// with partial pivoting.
///
/// - mat (array): A non-empty square numeric matrix.
/// - tol (float): Values whose absolute value does not exceed this tolerance
///   are treated as zero.
///
/// -> array
#let inverse(mat, tol: 1e-12) = {
  assert(
    is-matrix(mat),
    message: "inverse() expects a valid matrix",
  )

  assert(
    not is-empty(mat),
    message: "inverse() does not accept an empty matrix",
  )

  let n = mat.len()

  assert(
    is-square(mat),
    message: "Only square matrices have an inverse",
  )

  // Construct the augmented matrix [A | I].
  //
  // Each row has length 2n:
  //
  // (a_i0, ..., a_i(n-1), e_i0, ..., e_i(n-1))
  let aug = ()

  for i in range(n) {
    let row = ()

    // Copy the original matrix into the left half.
    for j in range(n) {
      let value = mat.at(i).at(j)

      assert(
        type(value) in (int, float),
        message: "Matrix elements must be numeric",
      )

      row.push(value)
    }

    // Append the identity matrix to the right half.
    for j in range(n) {
      if i == j {
        row.push(1)
      } else {
        row.push(0)
      }
    }

    aug.push(row)
  }

  // Perform Gauss–Jordan elimination column by column.
  for pivot-col in range(n) {
    // Find the row containing the largest absolute value in the
    // current pivot column.
    let pivot-row = pivot-col
    let pivot-abs = calc.abs(
      aug.at(pivot-col).at(pivot-col),
    )

    for candidate-row in range(pivot-col + 1, n) {
      let candidate-abs = calc.abs(
        aug.at(candidate-row).at(pivot-col),
      )

      if candidate-abs > pivot-abs {
        pivot-row = candidate-row
        pivot-abs = candidate-abs
      }
    }

    // If every candidate is effectively zero, the matrix is singular.
    assert(
      pivot-abs > tol,
      message: "Matrix is singular or numerically singular",
    )

    // Move the selected pivot row into the diagonal position.
    if pivot-row != pivot-col {
      let temp = aug.at(pivot-col)
      aug.at(pivot-col) = aug.at(pivot-row)
      aug.at(pivot-row) = temp
    }

    // Normalize the pivot row so that the pivot becomes one.
    let pivot = aug.at(pivot-col).at(pivot-col)
    let normalized-row = aug.at(pivot-col)

    for j in range(2 * n) {
      normalized-row.at(j) /= pivot
    }

    aug.at(pivot-col) = normalized-row

    // Eliminate the current column from every other row.
    for i in range(n) {
      if i != pivot-col {
        let factor = aug.at(i).at(pivot-col)

        // Skipping negligible factors avoids unnecessary operations.
        if calc.abs(factor) > tol {
          let current-row = aug.at(i)
          let source-row = aug.at(pivot-col)

          for j in range(2 * n) {
            current-row.at(j) -= factor * source-row.at(j)
          }

          aug.at(i) = current-row
        }
      }
    }
  }

  // Extract the right half, which is now A^(-1).
  let result = ()

  for i in range(n) {
    let row = ()

    for j in range(n) {
      row.push(aug.at(i).at(n + j))
    }

    result.push(row)
  }

  result
}

/// Clean a floating-point value for display.
///
/// Values sufficiently close to zero or an integer are snapped to that value.
/// Other values are rounded to the specified number of decimal places.
///
/// - value: Numeric value to clean.
/// - tol: Tolerance used for snapping.
/// - digits: Number of decimal places retained.
///
/// -> int or float
#let clean-number(value, tol: 1e-10, digits: 6) = {
  assert(
    type(value) in (int, float),
    message: "clean-number() expects a numeric value",
  )

  if calc.abs(value) <= tol {
    return 0
  }

  let nearest = calc.round(value)

  if calc.abs(value - nearest) <= tol {
    return nearest
  }

  let scale = calc.pow(10, digits)
  calc.round(value * scale) / scale
}

/// Clean all values in a matrix for display.
///
/// - mat: Input numeric matrix.
/// - tol: Tolerance used for snapping.
/// - digits: Number of decimal places retained.
///
/// -> array
#let clean-matrix(mat, tol: 1e-10, digits: 6) = {
  assert(
    is-matrix(mat),
    message: "clean-matrix() expects a valid matrix",
  )

  let result = ()

  for row in mat {
    let cleaned-row = ()

    for value in row {
      cleaned-row.push(
        clean-number(
          value,
          tol: tol,
          digits: digits,
        ),
      )
    }

    result.push(cleaned-row)
  }

  result
}
