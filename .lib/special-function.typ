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

/// Custom error function, use Abramowitz & Stegun formula, its used for drawing
/// pictures
///
/// - x (int | float):
/// -> float
#let erf__abramowitz(x) = {
  if x == 0 { return 0 }
  let sign = if x < 0 { -1 } else { 1 }
  let t-val = calc.abs(x)

  let p = 0.47047
  let a1 = 0.3480242
  let a2 = -0.0958798
  let a3 = 0.7478556

  let m = 1 / (1 + p * t-val)
  let poly = a1 * m + a2 * calc.pow(m, 2) + a3 * calc.pow(m, 3)
  let res = 1 - poly * calc.exp(-calc.pow(t-val, 2))

  return sign * res
}