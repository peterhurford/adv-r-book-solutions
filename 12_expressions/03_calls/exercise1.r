### The following two calls look the same, but are actually different:

(a <- call("mean", 1:10))
#> mean(1:10)
(b <- call("mean", quote(1:10)))
#> mean(1:10)
identical(a, b)
#> [1] FALSE

### What’s the difference?

# `a` is calling function `mean` with the arg `1:10`,
# whereas `b` is calling `mean` with the arg `quote(1:10)`.
# The second is passing the second argument as an unevaluated expression rather,
# these have the same result because of lazy evaluation.


### Which one should you prefer?

# However I personally
# prefer the first methodology at is it more explicit and more robust against
# early evaluation.
# Both `a` and `b` work to get the intended result...

eval(a)
# [1] 5.5

eval(b)
# [1] 5.5

# ...but `eval(b)` is a little (not noticably) slower and is more verbose.
microbenchmark::microbenchmark(eval(a), eval(b))
# Unit: microseconds
#     expr   min     lq median     uq    max neval
#  eval(a) 4.438 4.6250 4.7950 4.9345 10.551   100
#   eval(b) 4.663 4.8265 4.9655 5.1945 37.992   100

# so `a` should be prefered.
