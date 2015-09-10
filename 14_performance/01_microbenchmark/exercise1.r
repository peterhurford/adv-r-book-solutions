### Instead of using microbenchmark(), you could use the built-in function
### system.time(). But system.time() is much less precise, so you’ll need to
### repeat each operation many times with a loop, and then divide to find the
### average time of each operation, as in the code below.

n <- 1:1e6
system.time(for (i in n) sqrt(i))
#   user  system elapsed
#  0.139   0.001   0.139
system.time(for (i in n) i ^ 0.5)
#   user  system elapsed
#  0.139   0.001   0.139

microbenchmark::microbenchmark(
  for (i in n) sqrt(i),
  for (i in n) i ^ 0.5,
  times = 1
)
# Unit: milliseconds
# expr                    min       lq     mean     median     uq      max
# for (i in n) sqrt(i)  119.0256 119.0256 119.0256 119.0256 119.0256 119.0256
# for (i in n) i^0.5    193.2938 193.2938 193.2938 193.2938 193.2938 193.2938

### How do the estimates from system.time() compare to those from microbenchmark()? Why are they different?

# system.time is measured in seconds, so the times are comparable.  But `system.time` is not very precise.
