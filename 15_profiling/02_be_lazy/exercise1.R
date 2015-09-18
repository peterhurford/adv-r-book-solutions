### How do the results change if you compare mean() and mean.default() on 10,000 observations, rather than on 100?

x <- runif(1e5)

microbenchmark::microbenchmark(
  mean(x),
  mean.default(x)
)

# Unit: microseconds
#             expr     min       lq     mean  median       uq     max neval
#          mean(x) 185.425 185.6915 188.2651 185.832 185.9865 256.085   100
#  mean.default(x) 183.409 183.5620 184.9056 183.653 183.7555 203.807   100

# The difference seems to matter much less on large quantities.  This is because the difference between `mean` and `mean.deafult`
# is a fixed-cost at the beginning of processing, and unrelated to the quantity of x. (i.e., it's O(1) not O(n).)
