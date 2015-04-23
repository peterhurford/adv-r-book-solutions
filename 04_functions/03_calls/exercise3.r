### What does this function return? Why? Which principle does it illustrate?

f2 <- function(x = z) {
  z <- 100
  x
}
f2()

# It returns 100.  This is because x doesn't get evaluated until after z is assigned, and then x can take z as a default, due to lazy evaluation.

# Similary, the following would not work:

f3 <- function(x = z) {
  x
  z <- 100
}
f3()
# Error in f3() : object 'z' not found
