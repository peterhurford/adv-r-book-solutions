### What does the following function return? Make a prediction before running the code yourself.

  f <- function(x) {
    f <- function(x) {
      f <- function(x) {
        x ^ 2
      }
      f(x) + 1
    }
    f(x) * 2
  }
  f(10)

# [1] 202
