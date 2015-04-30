### Extend and() and or() to deal with any number of input functions.
### Can you do it with Reduce()? Can you keep them lazy (e.g., for
### and(), the function returns once it sees the first FALSE)?

and2 <- function(...) {
  fns <- lapply(list(...), force)
  function(...) {
    Reduce(
      and,
      lapply(
        fns,
        function(fn) { do.call(fn, list(...)) }
      )
    )
  }
}
#TODO: Finish
