### Since list()s don’t belong in expressions, we could create a more convenient
### call constructor that automatically combines lists into the arguments.
### Implement make_call() so that the following code works.

make_call <- function(...) {
  if (is.list(..2)) {
    as.call(c(..1, ..2))
  } else {
    as.call(list(...))
  }
}

make_call(quote(mean), list(quote(x), na.rm = TRUE))
### mean(x, na.rm = TRUE)
make_call(quote(mean), quote(x), na.rm = TRUE)
### mean(x, na.rm = TRUE)
