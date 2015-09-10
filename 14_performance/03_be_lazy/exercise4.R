### Make a faster version of chisq.test() that only computes the chi-square test
### statistic when the input is two numeric vectors with no missing values. You can
### try simplifying chisq.test() or by coding from the mathematical definition.

expected <- function(colsum, rowsum, total) {
  (colsum / total) * (rowsum / total) * total
}

chi_stat <- function(observed, expected) {
  ((observed - expected) ^ 2) / expected
}

# Implements https://en.wikipedia.org/wiki/Chi-squared_test
# which is apparently different from chisq.test
chisq_test2 <- function(x, y) {
  total <- sum(x) + sum(y)
  rowsum_x <- sum(x)
  rowsum_y <- sum(y)
  chistat <- 0
  for (i in seq_along(x)) {
    colsum <- x[i] + y[i]
    expected_x <- expected(colsum, rowsum_x, total)
    expected_y <- expected(colsum, rowsum_y, total)
    chistat <- chistat + chi_stat(x[i], expected_x)
    chistat <- chistat + chi_stat(y[i], expected_y)
  }
  chistat
}

print(chisq_test2(seq(3, 8), seq(4, 9)))

print(chisq.test(seq(3, 8), seq(4, 9)))

print(microbenchmark::microbenchmark(
  chisq_test2(seq(3, 8), seq(4, 9)),
  chisq.test(seq(3, 8), seq(4, 9))
))
