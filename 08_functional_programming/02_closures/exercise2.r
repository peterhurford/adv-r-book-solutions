### What does the following statistical function do? What would be a better name for it?
### (The existing name is a bit of a hint.)

bc <- function(lambda) {
  if (lambda == 0) {
    function(x) log(x)
  } else {
    function(x) (x ^ lambda - 1) / lambda
  }
}

# This function is a closure that returns a function.  If `lambda` is 0, the function returned will be `log`.
# Otherwise, it will be a function that calculates `(x ^ lambda - 1)/ lambda`.

# As for what the function is, that's a bit more of a trivia question unrelated to your R knowledge, but
# it's the one-parameter Box-Cox transformation
# <http://en.wikipedia.org/wiki/Power_transform#Box.E2.80.93Cox_transformation>.
# Maybe name it `box_cox`?
