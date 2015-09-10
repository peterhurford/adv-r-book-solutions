### Here are two other ways to compute the square root of a vector. Which do
### you think will be fastest? Which will be slowest? Use microbenchmarking to
### test your answers.

x ^ (1 / 2)
exp(log(x) / 2)

# I expect the second to be the fastest because `^` isn't particularly fast.

x <- seq(1e6)
microbenchmark::microbenchmark(x ^ (1 / 2), exp(log(x) / 2))
# Unit: milliseconds
# expr             min       lq     mean   median       uq      max neval
# x^(1/2)        38.97619 39.37731 41.08093 41.15464 41.30660 48.23926   100
# exp(log(x)/2)  18.46190 18.63804 20.39210 20.53856 20.59446 49.69939   100

# exp is indeed more performant.
