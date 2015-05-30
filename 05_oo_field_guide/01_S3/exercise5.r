### UseMethod() calls methods in a special way. Predict what the following code will return, then run it and read the help for UseMethod() to figure out what's going on. Write down the rules in the simplest form possible.

y <- 1
g <- function(x) {
  y <- 2
  UseMethod("g")
}
g.numeric <- function(x) y
g(10)
# This results in 2 because g(10) goes to the `g` base function, which assigns 2
# to `y`, and then goes to `g.numeric` (because 10 is numeric), which returns `y`.
#  Because of scoping, that `y` is the `y` found in `g`, not the `y` in the
# global environment.


h <- function(x) {
  x <- 10
  UseMethod("h")
}
h.character <- function(x) paste("char", x)
h.numeric <- function(x) paste("num", x)
h("a")
# This results in "char a" because, the base `h` invokes `h.character`
#  (because "a" is character) and, unlike the previous time, x is one of the
# arguments in the function call, and `UseMethod`'s black magic passes that x along.
# (In the previous problem, `y` was not in the function call.)
