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


### Also, if using `any` in `Any` is seen as cheating, here's a more elegant alternative (that I found elsewhere, not my own invention):
Any <- function(f, x) {
  Reduce(`&&`, x, TRUE)
}

### and All...
All <- function(f, x) {
  Reduce(`||`, x, TRUE)
}
