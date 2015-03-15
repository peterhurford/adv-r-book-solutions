### Implement mcsapply(), a multicore version of sapply().

# sapply is a variant of lapply (see source code for `base::sapply`), so `mcsapply` will be the same variant of `lapply`.
mcsapply <- function(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE) {
  FUN <- match.fun(FUN)
  answer <- parallel::mclapply(X = X, FUN = FUN, ...)
  if (USE.NAMES && is.character(X) && is.null(names(answer)))
      names(answer) <- X
  if (!identical(simplify, FALSE) && length(answer))
      simplify2array(answer, higher = (simplify == "array"))
  else answer
}


microbenchmark::microbenchmark(
  mcsapply(seq(10), function(x) { Sys.sleep(0.1); x + 1 }, mc.cores = 4),
  mcsapply(seq(10), function(x) { Sys.sleep(0.1); x + 1 }, mc.cores = 1)
, times = 1)
# Unit: milliseconds
#                                                                           expr       min        lq    median        uq       max neval
#  mcsapply(seq(10), function(x) {     Sys.sleep(0.1)     x + 1 }, mc.cores = 4)  312.2194  312.2194  312.2194  312.2194  312.2194     1
#  mcsapply(seq(10), function(x) {     Sys.sleep(0.1)     x + 1 }, mc.cores = 1) 1010.1219 1010.1219 1010.1219 1010.1219 1010.1219     1


### Can you implement mcvapply(), a parallel version of vapply()? Why or why not?

# `vapply` does not map to `lapply` like `sapply` does (instead, it calls `.Internal(vapply)`, so it would be more difficult, though not impossible.
