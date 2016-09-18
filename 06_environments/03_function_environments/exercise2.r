### Draw a diagram that shows the enclosing environments of this function:

f1 <- function(x1) {
  f2 <- function(x2) {
    f3 <- function(x3) {
      x1 + x2 + x3
    }
    f3(3)
  }
  f2(2)
}
f1(1)

# TODO: Pretty picture

# Provisional explanation:

# The enclosing environment of f1 is the global environment. The enclosing environment of f2 is f1.
# The enclosing environment of f3 is f2. When f3 is called, it will look for x1 and x2 in f2, it will find
# x2, and then it will continue searching for x1 in f1.
