n <- 10
sequence1 <- 1:n - 1
# 0 1 2 3 4 5 6 7 8 9 (first create 1:n and use arithmetic operations)
sequence2 <- 1:(n - 1)
# 1 2 3 4 5 6 7 8 9
sequence3 <- seq(
  from = 1,
  to = 5,
  by = 0.5
)
# 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0
sequence4 <- seq(
  length = 6,
  from = -5,
  by = 2
)
# -5 -3 -1 1 3 5
sequence5 <- seq(along = sequence4)
# 1 2 3 4 5 6
sequence6 <- rep(sequence5, times = 3)
# 1 2 3 4 5 6 1 2 3 4 5 6 1 2 3 4 5 6
sequence7 <- rep(sequence5, each = 3)
# 1 1 1 2 2 2 3 3 3 4 4 4 5 5 5 6 6 6