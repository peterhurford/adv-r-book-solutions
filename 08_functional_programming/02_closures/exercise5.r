### Create a function that creates functions that compute the ith central moment <http://en.wikipedia.org/wiki/Central_moment> of a numeric vector. You can test it by running the following code.

moment <- function(i) {
  function(x) sum((x - mean(x)) ^ i) / length(x)
}

m1 <- moment(1)
m2 <- moment(2)

x <- runif(100)
stopifnot(all.equal(m1(x), 0))
stopifnot(all.equal(m2(x), var(x) * 99 / 100))
