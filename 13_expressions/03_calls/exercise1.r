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
# when the arg is not a constant,the result would be different
x <- seq(10)
(a <- call("mean", x))
#> mean(1:10)
(b <- call("mean", quote(x)))
#> mean(x)
x <- seq(20)
eval(a)
#> [1] 5.5
eval(b)
#> [2] 10.5

### Which one should you prefer?

# The quote version is prefered, it's better to have call args depends on the
# calling environment rather than the enclosing environment,that's more similar
# to normal function behavior.