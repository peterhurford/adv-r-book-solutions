### subset2() has a bug if you use it with a single column data frame.
### What should the following code return? 

subset2 <- function(x, condition) {
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  x[r, ]
}

sample_df2 <- data.frame(x = 1:10)
subset2(sample_df2, x > 8)
#> [1]  9 10

# Well what does `base::subset` return?
subset(sample_df2, x > 8)
#     x
#  9  9
# 10 10

# Ok, so we want the output to be a data.frame.

### How can you modify subset2() so it returns the correct type of object?

subset3 <- function(x, condition) {
  condition_call <- substitute(condition)
  r <- eval(condition_call, x)
  x[r, , drop = FALSE]  # drop = FALSE is annoying. 
}

subset3(sample_df2, x > 8)
#     x
#  9  9
# 10 10
