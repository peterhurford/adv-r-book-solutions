### The following function “lags” a vector, returning a version of x that is n values behind the original. Improve the function so that it (1) returns a useful error message if n is not a vector, and (2) has reasonable behaviour when n is 0 or longer than x.

lag <- function(x, n = 1L) {
  xlen <- length(x)
  c(rep(NA, n), x[seq_len(xlen - n)])
}

lag_ <- function(x, n = 1L) {
  if (!is.numeric(n) | length(n) != 1) stop('n must be a numeric length-1 vector.')
  xlen <- length(x)
  if (n > xlen) stop('n must be less than the length of x.')
  if (n == 0) warning('n is 0, so the lagged vector and the unlagged vector will be identical.')
  c(rep(NA, n), x[seq_len(xlen - n)])
}

lag(seq(4), c(1, 2))
# Error in rep(NA, n) : invalid 'times' argument
lag_(seq(4), c(1, 2))
# Error in lag_(seq(4), c(1, 2)) : n must be a numeric length-1 vector.

lag(seq(4), 0)
# [1] 1 2 3 4
lag_(seq(4), 0)
# [1] 1 2 3 4
# Warning message:
# In lag_(seq(4), 0) :
#  n is 0, so the lagged vector and the unlagged vector will be identical.

lag(seq(4), 5)
# Error in seq_len(xlen - n) :
#  argument must be coercible to non-negative integer
lag_(seq(4), 5)
# Error in lag_(seq(4), 5) : n must be less than the length of x.
