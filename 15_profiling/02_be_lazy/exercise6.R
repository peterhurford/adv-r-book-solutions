### Imagine you want to compute the bootstrap distribution of a sample correlation using cor_df() and the data in the example below. Given that you want to run this many times, how can you make this code faster? (Hint: the function has three components that you can speed up.)

n <- 1e6
df <- data.frame(a = rnorm(n), b = rnorm(n))

cor_df <- function(i) {
  i <- sample(seq(n), n * 0.01)
  cor(df[i, , drop = FALSE])[2,1]
}

microbenchmark::microbenchmark(cor_df(2), times = 4)
# Unit: milliseconds
#       expr      min       lq     mean   median       uq      max neval
#        cor_df(2) 6.075768 6.192954 7.570494 6.973946 8.948034 10.25832     4

# First optimization: only use the part of `cor` that is needed:
cor2 <- function(x) { .Call(stats:::C_cor, as.matrix(x), NULL, 4L, FALSE) }
cor_df2 <- function(i) {
  i <- sample(seq(n), n * 0.01)
  cor2(df[i, , drop = FALSE])[2,1]
}
microbenchmark::microbenchmark(cor_df2(2), times = 4)
# Unit: milliseconds
#        expr      min       lq     mean   median       uq      max neval
#         cor_df2(2) 5.950039 5.973835 6.869695 6.031044 7.765555 9.466655     4


# Second optimization: only use the part of `sample that is needed:
cor_df3 <- function(i) {
  i <- sample.int(n, n * 0.01, FALSE, NULL)
  cor2(df[i, , drop = FALSE])[2,1]
}
microbenchmark::microbenchmark(cor_df3(2), times = 4)
# Unit: milliseconds
#        expr      min       lq     mean   median       uq      max neval
#         cor_df3(2) 4.923037 5.042948 5.373254 5.169856 5.703561 6.230268     4

# Third optimization: call `cor` with two lists rather than one matrix.
cor_df4 <- function(i) {
  i <- sample.int(n, n * 0.01, FALSE, NULL)
  .Call(stats:::C_cor, df$a[i], df$b[i], 4L, FALSE)
}
microbenchmark::microbenchmark(cor_df4(2), times = 4)
# Unit: milliseconds
#        expr      min       lq     mean   median       uq      max neval
#         cor_df4(2) 1.414304 1.416196 1.423511 1.421877 1.430826 1.435986     4
