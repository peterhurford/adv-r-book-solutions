### Implement the xor() binary operator.
### Implement it using the existing xor() function.

bxor <- function(f1, f2) {
  force(f1); force(f2)
  function(...) {
    xor(f1(...), f2(...))
  }
}

bxor(function(x) x > 2, function(x) x < 3)(1)  # TRUE (when one is FALSE and one is TRUE)
bxor(function(x) x > 0, function(x) x < 1)(1)  # TRUE (when one is TRUE and one is FALSE)
bxor(function(x) x > 2, function(x) x < 1)(1)  # FALSE (when both FALSE)
bxor(function(x) x > 0, function(x) x < 3)(1)  # FALSE (when both TRUE)


### Implement it as a combination of and() and or().
and <- function(f1, f2) {
  force(f1); force(f2)
  function(...) {
    f1(...) && f2(...)
  }
}

or <- function(f1, f2) {
  force(f1); force(f2)
  function(...) {
    f1(...) || f2(...)
  }
}

bxor2 <- function(f1, f2) {
  force(f1); force(f2)
  function(...) {
    or(f1, f2)(...) & !and(f1, f2)(...)
  }
}

bxor2(function(x) x > 2, function(x) x < 3)(1)  # TRUE (when one is FALSE and one is TRUE)
bxor2(function(x) x > 0, function(x) x < 1)(1)  # TRUE (when one is TRUE and one is FALSE)
bxor2(function(x) x > 2, function(x) x < 1)(1)  # FALSE (when both FALSE)
bxor2(function(x) x > 0, function(x) x < 3)(1)  # FALSE (when both TRUE)

### What are the advantages and disadvantages of each approach?

microbenchmark::microbenchmark(
  bxor(function(x) x > 2, function(x) x < 3)(1),
  bxor2(function(x) x > 2, function(x) x < 3)(1)
)
# `bxor` is about twice as fast as `bxor2`...
# there's inefficiency in evaluating three binary functions instead of one.
# `bxor` also has less dependencies.
#
# `bxor2` is more readable.


### Also think about what you’ll call the resulting function to avoid a clash
### with the existing xor() function, and how you might change the names of
### and(), not(), and or() to keep them consistent.

# Used `bxor` instead of `xor`, for "binary xor".  May want to make `band` and `bor` also.
