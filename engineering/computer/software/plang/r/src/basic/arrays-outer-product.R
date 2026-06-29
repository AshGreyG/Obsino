# Outer product of two vector
vec_a <- c(1, 2, 3)
vec_b <- c(4, 5, 6)

result_vec1 <- vec_a %o% vec_b
print(result_vec1)
#      [,1] [,2] [,3]
# [1,]    4    5    6
# [2,]    8   10   12
# [3,]   12   15   18

# Same using outer() function
result_vec2 <- outer(vec_a, vec_b, FUN = "*")
print(result_vec2)

# With different lengths
vec_x <- c(2, 4)
vec_y <- c(1, 3, 5, 7)

result_vec3 <- vec_x %o% vec_y
print(result_vec3)
#      [,1] [,2] [,3] [,4]
# [1,]    2    6   10   14
# [2,]    4   12   20   28

print(outer(
  seq(1, 3),
  seq(10, 30, by = 10),
  FUN = "+"
))
#      [,1] [,2] [,3]
# [1,]   11   21   31
# [2,]   12   22   32
# [3,]   13   23   33
print(outer(1:4, 1:4, function(x, y) x^2 + y^2))
#      [,1] [,2] [,3] [,4]
# [1,]    2    5   10   17
# [2,]    5    8   13   20
# [3,]   10   13   18   25
# [4,]   17   20   25   32