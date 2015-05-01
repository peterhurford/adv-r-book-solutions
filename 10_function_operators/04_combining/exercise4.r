### Above, we implemented boolean algebra for functions that return a logical function.
### Implement elementary algebra (plus(), minus(), multiply(), divide(),
### exponentiate(), log()) for functions that return numeric vectors.

plus <- function(f1, f2) {
  force(f1); force(f2)
  function(...) {
    f1(...) + f2(...)
  }
}
plus(median, mean)(c(1, 2, 3)) # 4  # The sum of the median and the mean.

# The rest can be easily derived from `plus` and is busy work...
