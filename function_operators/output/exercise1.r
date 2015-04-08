### Create a negative() FO that flips the sign of the output of the function to which it is applied.

negative <- function(f) {
  force(f)
  function(...) {
    -f(...)
  }
}

add <- function(a, b) a + b

add(2, 3)             # 5
negative(add)(2, 3)   # -5
