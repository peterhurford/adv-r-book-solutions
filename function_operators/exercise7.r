### Why does the following code, from stackoverflow, not do what you expect?

### return a linear function with slope a and intercept b.
f <- function(a, b) function(x) a * x + b

### create a list of functions with different parameters.
fs <- Map(f, a = c(0, 1), b = c(0, 1))

fs[[1]](3)
###> [1] 4
### should return 0 * 3 + 0 = 0

# The function does not return what was expected because `a` and `b` are
# lazily evaluated and thus the values for the first invocation of `f` are
# re-modified before `f` is evaluated.

### How can you modify f so that it works correctly?

# It requires a force() statement.

f <- function(a, b) { force(a); force(b); function(x) a * x + b }

fs <- Map(f, a = c(0, 1), b = c(0, 1))

fs[[1]](3)
#> [1] 0
