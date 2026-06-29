values <- seq(10, 90, by = 10)
groups <- factor(c("A", "A", "A", "A", "B", "B", "B", "C", "C"))

# split them into a "ragged array"
ragged <- split(values, groups)
print(ragged)
# $A
# [1] 10 20 30 40

# $B
# [1] 50 60 70

# $C
# [1] 80 90