### f(), defined above, just calls substitute(). Why can’t we use it to define g()?
### In other words, what will the following code return? First make a prediction.
### Then run the code and think about the results.

# Recall that `substitute` is literal, so `substitute(x)` is always "x".
# Therefore you cannot pass x from the function into `substitute`,
# since the output will always be "x".

f <- function(x) substitute(x)
g <- function(x) deparse(f(x))
g(1:10)
# [1] "x"
g(x)
# [1] "x"
g(x + y ^ 2 / z + exp(a * sin(b)))
# [1] "x"
