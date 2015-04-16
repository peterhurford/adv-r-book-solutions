### Implement smaller and larger functions that, given two inputs, return either the smaller or the larger value. Implement na.rm = TRUE: what should the identity be? (Hint: smaller(x, smaller(NA, NA, na.rm = TRUE), na.rm = TRUE) must be x, so smaller(NA, NA, na.rm = TRUE) must be bigger than any other value of x.) Use smaller and larger to implement equivalents of min(), max(), pmin(), pmax(), and new functions row_min() and row_max().

rm_na <- function(x, y, identity) {
  if (is.na(x) && is.na(y)) { identity }
  else if (is.na(x)) { y }
  else { x }
}

larger <- function(x, y, na.rm = TRUE) {
  if (isTRUE(na.rm) && (is.na(x) || is.na(y))) { rm_na(x, y, -Inf) }
  else {
    if (x > y) { x } else { y }
  }
}

smaller <- function(x, y, na.rm = TRUE) {
  if (isTRUE(na.rm) && (is.na(x) || is.na(y))) { rm_na(x, y, Inf) }
  else {
    if (x < y) { x } else { y }
  }
}

max_ <- function(..., na.rm = TRUE) { Reduce(function(x, y) larger(x, y, na.rm = na.rm), list(...)) }
min_ <- function(..., na.rm = TRUE) { Reduce(function(x, y) smaller(x, y, na.rm = na.rm), list(...)) }

row_min <- function(x, na.rm = TRUE) { apply(x, 1, min_, na.rm = na.rm) }
row_max <- function(x, na.rm = TRUE) { apply(x, 1, max_, na.rm = na.rm) }

larger(2, 10) == 10
smaller(2, 10) == 2
larger(2, NA) == 2
larger(NA, NA) == -Inf
max_(1, 2, 3, 2, 1) == 3
min_(1, 2, 3, 2, 1) == 1

#TODO: pmin, pmax

row_min(iris)
row_max(iris)
