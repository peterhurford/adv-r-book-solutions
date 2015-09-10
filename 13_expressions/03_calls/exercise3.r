### Concatenating a call and an expression with c() creates a list. Implement
### concat() so that the following code works to combine a call and an
### additional argument.

concat <- function(...) {
  if (is.name(..1)) {
    call(deparse(..1), unlist(list(...)[-1]))
  } else {
    do.call(c, list(...))
  }
}

concat(quote(f), a = 1, b = quote(mean(a)))
### f(a = 1, b = mean(a))
