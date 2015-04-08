### Create a function that creates functions that compute the ith central moment <http://en.wikipedia.org/wiki/Central_moment> of a numeric vector. You can test it by running the following code.

moment <- function(vec, i) {
#TODO: Hadley expects too much math.
}

m1 <- moment(1)
m2 <- moment(2)

x <- runif(100)
stopifnot(all.equal(m1(x), 0))
stopifnot(all.equal(m2(x), var(x) * 99 / 100))

## Igor
# First formula -> http://mathworld.wolfram.com/SampleCentralMoment.html
moment <- function(k) {
  function(vec) {
    result_vec <- vector(length = length(vec))
    for(i in seq_along(result_vec)) {
      result_vec[i] <- (vec[i] - mean(vec, na.rm = T)) ^ k
    }
    mean(result_vec, na.rm = T)
  }
}

