### Implement Any(), a function that takes a list and a predicate function, and returns TRUE if the predicate function returns TRUE for any of the inputs.

Any <- function(f, x) {
  any(vapply(x, f, logical(1)))
}

Any(function(x) x > 1, iris$Petal.Length)    # Note that this is equivalent to `any(iris$Petal.Length > 1)`
# [1] TRUE
Any(function(x) x > 100, iris$Petal.Length)
# [1] FALSE


### Implement All() similarly.

All <- function(f, x) {
  all(vapply(x, f, logical(1)))
}

All(function(x) x > 1, iris$Petal.Length)    # Note that this is equivalent to `all(iris$Petal.Length > 1)`
# [1] FALSE
