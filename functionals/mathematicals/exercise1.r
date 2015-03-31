### Implement arg_max(). It should take a function and a vector of inputs, and return the elements of the input where the function returns the highest value.

library(magrittr)
arg_max <- function(x, f) {
  vapply(x, f, numeric(1)) %>% { m <- max(.); as.numeric(x[. %in% m]) }
}


### For example, arg_max(-10:5, function(x) x ^ 2) should return -10.
identical(arg_max(-10:5, function(x) x ^ 2), -10)

### arg_max(-5:5, function(x) x ^ 2) should return c(-5, 5).
identical(arg_max(-5:5, function(x) x ^ 2), c(-5, 5))


### Also implement the matching arg_min() function.
arg_max <- function(x, f) {
  vapply(x, f, numeric(1)) %>% { m <- min(.); as.numeric(x[. %in% m]) }
}

# One could also make a closure that returns either the min function or the max function.
arg_ <- function(FUN) {
  function(x, f) {
    vapply(x, f, numeric(1)) %>% { m <- FUN(.); as.numeric(x[. %in% m]) }
  }
}
arg_max <- arg_(max)
arg_min <- arg_(min)
