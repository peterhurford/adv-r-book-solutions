### standardise_call() doesn’t work so well for the following calls. Why?

pryr::standardise_call(quote(mean(1:10, na.rm = TRUE)))
### mean(x = 1:10, na.rm = TRUE)

pryr::standardise_call(quote(mean(n = T, 1:10)))
### mean(x = 1:10, n = T)

pryr::standardise_call(quote(mean(x = 1:10, , TRUE)))
### mean(x = 1:10, , TRUE)

# The reason these don't work is not that `mean` is a primitive (as seen in
# exercise 6) -- it's not -- but because `mean` uses S3 dispatch (i.e.,
# `UseMethod`) and therefore does not store its formals on `mean`, but rather
# `mean.default`.  For example, `pryr::standardize_call` can do much better
# when the S3 dispatch is explicit.

pryr::standardise_call(quote(mean.default(1:10, na.rm = TRUE)))
# mean.default(x = 1:10, na.rm = TRUE)

pryr::standardise_call(quote(mean.default(n = T, 1:10)))
# mean.default(x = 1:10, na.rm = T)

pryr::standardise_call(quote(mean.default(x = 1:10, , TRUE)))
# mean.default(x = 1:10, na.rm = TRUE)

# Much better! Little can be done about `T` vs. `TRUE`, since `T` is a variable
# (similar to as if we did `x <- TRUE` and passed `x`.)
