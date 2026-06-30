x <- c(3, -3, 4, 2, -2, NA, 0, 9)
print(x[!is.na(x) & x > 0] - 1)
# 2 3 1 8
print(x[c(1, 2, 4, 3)])
# 3 -3 2 4
print(x[1:10])
# 3 -3 4 2 -2 NA 0 9 NA NA
print(x[-c(1, 2, 4, 3)])
# -2 NA 0 9

fruit <- c(5, 10, 1, 20)
names(fruit) <- c("orange", "banana", "apple", "peach")
print(fruit[c("orange", "banana")])
# orange banana
#      5     10

x[!is.na(x) & x < 0] <- -x[!is.na(x) & x < 0]
print(x)
# 3 3 4 2 2 NA 0 9
