system.time({
  x <- 1:1000
  y <- 1:1000
  result <- x %o% y
})
# 0.001s

system.time({
  result <- matrix(0, 1000, 1000)
  for (i in 1:1000) {
    for (j in 1:1000) {
      result[i, j] <- x[i] * y[j]
    }
  }
})
# 0.071s