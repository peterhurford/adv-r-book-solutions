### What does this function return? Why? Which principle does it illustrate?

f1 <- function(x = {y <- 1; 2}, y = 0) {
  x + y
}
f1()

# It returns 3.  This is because the default argument x includes a block that assigns y.  This overrides the default for y.
# Therefore x is 2 and y is 1 (not 0), so x + y is 3.
