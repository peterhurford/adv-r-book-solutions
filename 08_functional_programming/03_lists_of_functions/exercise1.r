### Implement a summary function that works like base::summary(), but uses a list of functions.
### Modify the function so it returns a closure, making it possible to use it as a function factory.

make_summary <- function(summary_funs) {
  function(x) {
    lapply(summary_funs, function(sf) sf(x, na.rm = TRUE))
  }
}
summary2 <- make_summary(list('min' = min, 'median' = median, 'mean' = mean, 'max' = max))
summary2(runif(10))
