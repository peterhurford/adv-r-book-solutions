
# instead of using microbenchmark(), you could use the built-in function system.time().
# But system.time() is much less precise, so you’ll need to repeat each operation
# many times with a loop, and then divide to find the average time of each operation,
# as in the code below.

x <- runif(100)
n <- 1:1e6
system.time(for (i in n) sqrt(x)) / length(n)
#      user    system   elapsed
#  9.390e-07 1.680e-07 1.108e-06
system.time(for (i in n) x ^ 0.5) / length(n)
# user        system   elapsed
# 3.418e-06 1.510e-07 3.573e-06

# How do the estimates from system.time() compare to those from microbenchmark()?
# Why are they different?

#‘microbenchmark’ serves as a more accurate replacement of the
#     often seen ‘system.time(replicate(1000, expr))’ expression. It
#     tries hard to accurately measure only the time it takes to
#     evaluate ‘expr’. To achieved this, the sub-millisecond (supposedly
#     nanosecond) accurate timing functions most modern operating
#     systems provide are used.  Additionally all evaluations of the
#     expressions are done in C code to minimze any overhead.
