### Write a wrapper around bquote2() that does non-standard evaluation

bquote2 <- function (x, where = parent.frame()) {
  bquote_fn <- function(x, where) {
    if (is.atomic(x) || is.name(x)) { x }
    else if (is.call(x)) {
      if (identical(x[[1]], quote(.))) {
        eval(x[[2]], where)
      } else {
        as.call(lapply(x, bquote_fn, where = where))
      }
    } else if (is.pairlist(x)) {
      as.pairlist(lapply(x, bquote_fn, where = where))
    } else {
      stop("Don't know how to handle type ", typeof(x), call. = FALSE)
    }
  }
  bquote_fn(substitute(x), where)
}

bquote2(x == .(x))
# x == 2
