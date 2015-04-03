### What does the following function do? What would be a good name for it?

f <- function(g) {
  force(g)
  result <- NULL
  function(...) {
    if (is.null(result)) {
      result <<- g(...)
    }
    result
  }
}
runif2 <- f(runif)
runif2(5)
#> [1] 0.1041348 0.9207286 0.2615495 0.2421928 0.6690957
runif2(10)
#> [1] 0.1041348 0.9207286 0.2615495 0.2421928 0.6690957

## This function is `memoise`.
