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


# Also, if using `any` in `Any` is seen as cheating, here's a more elegant alternative
# (that I found elsewhere, not my own invention):
Any2 <- function(f, x) {
  Reduce(`||`, vapply(x, f, logical(1)))
}
testthat::test_that("Any() works", {
    testthat::expect_true(Any2(is.numeric, list(1, "a")))
    testthat::expect_false(Any2(is.numeric, list("a", "b")))
})

# and All...
All2 <- function(f, x) {
  Reduce(`&&`, vapply(x, f, logical(1)))
}
testthat::test_that("All2() works", {
    testthat::expect_true(All2(is.numeric, list(1, 2)))
    testthat::expect_false(All2(is.numeric, list(1, "a")))
})

# Another attempt:

Any3 <- function(f, x) {
  sum(vapply(x, f, logical(1)) >= 1)
}

All3 <- function(f, x) {
  sum(vapply(x, f, logical(1)) == length(x))
}
