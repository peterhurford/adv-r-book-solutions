### Implement a combination of Map() and vapply() to create an lapply() variant that iterates in parallel over all of its inputs and stores its outputs in a vector (or a matrix). What arguments should the function take?
# Ultimately, the point is to write a function that scrambles the order of computation.
lapply4 <- function(x, f, ...) {
  indices <- sample(seq_along(x))
  unordered <- vapply(indices, function(i) f(x[[i]], ...), numeric(1))
  out <- vector("list", length(x))
  for (j in 1:5) {
    out[indices[j]] <- unordered[j] 
  }
  out
}

all.equal(lapply(1:5, function(x) x^2), lapply4(1:5, function(x) x^2))
