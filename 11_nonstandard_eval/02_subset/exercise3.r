### The real subset function (subset.data.frame()) removes missing values
### in the condition. Modify subset2() to do the same: drop the offending rows.

subset4 <- function(x, condition) {
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  x[r & !is.na(r), , drop = FALSE]
}
## Alternative
subset4 <- function(x, condition) {
    condition_call <- substitute(condition)
      r <- eval(condition_call, x)
      ## NAs will be removed
      r[is.na(r)] <- FALSE
      x[r, , drop = FALSE]
}
