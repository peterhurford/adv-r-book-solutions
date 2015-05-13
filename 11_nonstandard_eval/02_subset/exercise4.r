### What happens if you use quote() instead of substitute() inside of subset2()?

subset4 <- function(x, condition) {
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  x[r & !is.na(r), , drop = FALSE]
}

subset5 <- function(x, condition) {
  condition_call <- quote(condition)
  r <- eval(condition_call, x)
  x[r & !is.na(r), , drop = FALSE]
}

sample_df2 <- data.frame(x = 1:10)
subset4(sample_df2, x > 8)
#     x
# 9   9
# 10 10

subset5(sample_df2, x > 8)
# Error in eval(expr, envir, enclos) : object 'x' not found

# Why is this the case?  Remember that the difference between `substitute` and `quote`
# is that `quote` just returns the expression whereas `substitute` can modify the
# expression within an environment, performing substitutions.
#
# Therefore `substitute` will contain the information about what the dataframe is, whereas
# `quote` will not.
