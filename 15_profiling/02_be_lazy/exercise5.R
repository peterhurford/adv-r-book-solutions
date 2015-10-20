### Can you make a faster version of table() for the case of an input of two
### integer vectors with no missing values?

table2 <- function(x, y) {
  x_val <- unique(x)
  y_val <- unique(y)
  mat <- matrix(0L, length(x_val), length(y_val))
  for (i in seq_along(x)) {
    mat[which(x_val == x[[i]]), which(y_val == y[[i]])] <-
      mat[which(x_val == x[[i]]),  which(y_val == y[[i]])] + 1L
  }
  dimnames <- list(x_val, y_val)
  names(dimnames) <- as.character(as.list(match.call())[-1])  # R has names for dimnames... :/
  tab <- array(mat, dim = dim(mat), dimnames = dimnames)
  class(tab) <- "table"
  tab
}

a <- c(1, 2, 3)
identical(table(a, a), table2(a, a))
# [1] TRUE
microbenchmark::microbenchmark(table(a, a), table2(a, a))
# Unit: microseconds
#          expr     min       lq      mean   median      uq     max neval
#   table(a, a) 173.151 184.6695 198.84790 192.1165 204.413 388.205   100
#  table2(a, a)  52.009  58.6020  64.56662  64.0260  69.896  88.747   100

b <- c(2, 3, 4)
identical(table(a, b), table2(a, b))
# [1] TRUE

c <- c(1, 2, 3, 1, 2, 3)
d <- c(2, 3, 4, 2, 3, 4)
identical(table(c, d), table2(c, d))
# [1] TRUE

e <- c(1, 2, 2)
identical(table(a, e), table2(a, e))
# [1] TRUE
identical(table(b, e), table2(b, e))
# [1] TRUE
identical(table(e, e), table2(e, e))
# [1] TRUE

f <- c(1, 1, 1)
identical(table(f, f), table2(f, f))
# [1] TRUE
identical(table(e, f), table2(e, f))
# [1] TRUE

g <- c(1, 4, 9)
identical(table(g, g), table2(g, g))
# [1] TRUE
identical(table(g, f), table2(g, f))
# [1] TRUE

h <- c(10, 20, 30)
identical(table(h, h), table2(h, h))
# [1] TRUE
identical(table(h, f), table2(h, f))
# [1] TRUE
identical(table(h, g), table2(h, g))
# [1] TRUE

i <- c(0, 0, 0)
identical(table(i, i), table2(i, i))
# [1] TRUE
identical(table(h, i), table2(h, i))
# [1] TRUE

j <- c(0, 10, 100, 1000, 10000)
# [1] TRUE
identical(table(j, j), table2(j, j))
microbenchmark::microbenchmark(table(j, j), table2(j, j))
# Unit: microseconds
#          expr     min       lq      mean   median      uq     max neval
#   table(j, j) 177.245 185.2855 197.95406 190.7250 198.919 399.686   100
#  table2(j, j)  64.118  69.5535  73.56628  73.0615  76.823 101.268   100
