### Extend and() and or() to deal with any number of input functions.
### Can you do it with Reduce()? Can you keep them lazy (e.g., for
### and(), the function returns once it sees the first FALSE)?

and2 <- function(...) {
  fns <- list(...)
  function(...) {
    Reduce(
      `&&`,
      lapply(
        fns,
        function(fn) { do.call(fn, list(...)) }
      )
    )
  }
}

lazy_and2 <- function(...) {
  fns <- lapply(list(...), force)
  function(...) {
    for (fn in fns) {
      if (!isTRUE(do.call(fn, list(...)))) { return(FALSE) }
    }
    TRUE
  }
}

and2(is.numeric, function(x) x > 4.0)(10)   # TRUE
and2(is.numeric, function(x) x > 4.0)(3)    # FALSE
and2(is.numeric, function(x) x > 4.0)("10") # FALSE
and2(is.numeric, function(x) { Sys.sleep(2); x > 4.0 })("10") # FALSE (but executes the sleep because it isn't lazy)

lazy_and2(is.numeric, function(x) x > 4.0)(10)   # TRUE
lazy_and2(is.numeric, function(x) x > 4.0)(3)    # FALSE
lazy_and2(is.numeric, function(x) x > 4.0)("10") # FALSE
lazy_and2(is.numeric, function(x) { Sys.sleep(2); x > 4.0 })("10") # FALSE (and doesn't evaluate the sleep)

#TODO: Can you get both the Reduce AND the laziness?
