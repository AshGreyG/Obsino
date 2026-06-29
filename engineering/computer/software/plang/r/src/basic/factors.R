language_list <- c(
  "ada", "rust", "haskell", "haskell", "python", "ruby",
  "r", "python", "python", "typescript", "typescript", "ruby",
  "python", "rust", "python", "haskell"
)

language_votes <- c(
  10, 23, 15, 28, 19, 29, 61, 17,
  80, 25, 27, 83, 10, 18, 90, 20
)

language_factor <- factor(language_list)
print(language_factor)
#  [1] ada        rust       haskell    haskell    python     ruby
#  [7] r          python     python     typescript typescript ruby
# [13] python     rust       python     haskell
# Levels: ada haskell python r ruby rust typescript
print(class(language_factor))   # "factor"
print(levels(language_factor))
# [1] "ada"        "haskell"    "python"     "r"          "ruby"
# [6] "rust"       "typescript"
print(length(language_factor))  # 16

means <- tapply(
  language_votes,
  language_factor,
  FUN = mean
)
print(means)
#  ada    haskell     python          r       ruby       rust typescript
# 10.0       21.0       43.2       61.0       56.0       20.5       26.0
print(class(means))   # "array"
print(length(means))  # 7

standard_errors <- function(x) sqrt(var(x) / length(x))
stderror <- tapply(
  language_votes,
  language_factor,
  FUN = standard_errors
)
print(stderror)
#  ada    haskell     python          r       ruby       rust typescript
#   NA   3.785939  17.202907         NA  27.000000   2.500000   1.000000