### logical_abbr() works when given quoted objects, but doesn’t work when given 
### an existing function, as in the example below. Why not? How could you modify
### logical_abbr() to work with functions? Think about what components make up
### a function.

logical_abbr <- function(x) {
  if (is.atomic(x)) {
    FALSE
  } else if (is.name(x)) {
    identical(x, quote(T)) || identical(x, quote(F))
  } else if (is.call(x) || is.pairlist(x)) {
    for (i in seq_along(x)) {
      if (logical_abbr(x[[i]])) return(TRUE)
    }
    FALSE
  } else if (is.function(x)) {  # Add this to handle functions.
    logical_abbr(body(x)) || logical_abbr(formals(x))
  }  else {
    stop("Don't know how to handle type ", typeof(x), 
      call. = FALSE)
  }
}

f <- function(x = TRUE) {
  g(x + T)
}

logical_abbr(f)
# [1] TRUE
