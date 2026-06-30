a <- c(1, "23", -0.12)
# print(a): "1" "23" "-0.12"
b <- c(TRUE, 1 + 2i, FALSE, -1.2)
# print(b): 1.0+0i 1.0+2i 0.0+0i -1.2+0i
empty_numeric <- numeric(0)
empty_character <- character(0)

print(mode(a))      # character
print(mode(b))      # complex
print(mode(print))  # function
print(mode(1:10))   # numeric

print(length(a))      # 3
print(length(print))  # 1

digits <- as.character(0:9)
# "0" ... "9"
number <- as.integer(digits)
# 0 ... 9
