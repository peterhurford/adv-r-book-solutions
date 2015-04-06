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

# Will be evaluated from the inside out, so ((x ^ 2) + 1) * 2
# ((10 ^ 2) + 1) * 2 = ((100) + 1) * 2 = (101) * 2 = 202

# Confirmed by running:
f(10)
# [1] 202
