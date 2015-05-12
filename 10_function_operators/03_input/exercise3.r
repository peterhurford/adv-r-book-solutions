### Write FOs that convert a function to return a matrix instead of a data frame, or a data frame instead of a matrix. If you understand S3, call them as.data.frame.function() and as.matrix.function().

as.data.frame.function <- function(f) {
  force(f)
  function(...) {
    as.data.frame(f(...))
  }
}

as.matrix.function <- function(f) {
  force(f)
  function(...) {
    as.matrix(f(...))
  }
}

mat <- matrix(3, 3, 3)
as.data.frame(identity)(mat)

as.matrix(identity)(iris)
