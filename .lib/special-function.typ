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