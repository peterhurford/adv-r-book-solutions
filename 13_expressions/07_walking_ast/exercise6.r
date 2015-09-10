### Compare bquote2() to bquote(). There is a subtle bug in bquote():
### it won’t replace calls to functions with no arguments. Why?

bquote(.(x)(), list(x = quote(f)))
# .(x)()
bquote2(.(x)(), list(x = quote(f)))
# f()
bquote(.(x)(1), list(x = quote(f)))
# f(1)

# Here's the source for `bquote` (from `base`):
bquote <- function(expr, where = parent.frame()) {
  unquote <- function(e) {
    if (is.pairlist(e)) {
      as.pairlist(lapply(e, unquote))
    } else if (length(e) <= 1L) { e }
    else if (e[[1L]] == as.name(".")) {
      eval(e[[2]], where)
    } else { as.call(lapply(e, unquote)) }
  }
  unquote(substitute(expr))
}

# The subtle bug is on line 16, where it returns `e` if `length(e)` is <= 1.
# `length(substitute(.(x)()))` is 1, so it will just be returned instead of parsed.
