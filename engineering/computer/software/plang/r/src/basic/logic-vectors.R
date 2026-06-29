true_value <- TRUE
true_value_t <- T
# linter: use TRUE instead of the symbol T
false_value <- FALSE
false_value_f <- F
# linter: use FALSE instead of the symbol F

n <- 3
true_value_expression <- n == 3
# TRUE
false_value_expression <- n > 5
# FALSE
and_value <- true_value & false_value
# FALSE
or_value <- true_value | false_value
# TRUE
not_value <- !true_value
# FALSE
z <- c(1, 2, NA)
print(is.na(z))
# FALSE FALSE TRUE
missing1 <- 0 / 0
missing2 <- Inf - Inf
print(is.na(missing1))  # TRUE
print(is.na(missing2))  # TRUE
print(is.nan(missing1)) # TRUE
print(is.nan(missing2)) # TRUE
