### Why does logical_abbr() use a for loop instead of a functional like lapply()?

# Well, let's see if it works.

# Here's the original...
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
  } else {
    stop("Don't know how to handle type ", typeof(x), 
      call. = FALSE)
  }
}

# And here's a version with an lapply...
logical_abbr2 <- function(x) {
  if (is.atomic(x)) {
    FALSE
  } else if (is.name(x)) {
    identical(x, quote(T)) || identical(x, quote(F))
  } else if (is.call(x) || is.pairlist(x)) {
    any(as.logical(lapply(x, function(x) { if (isTRUE(logical_abbr(x))) TRUE else FALSE })))
  } else {
    stop("Don't know how to handle type ", typeof(x), 
      call. = FALSE)
  }
}

logical_abbr(quote(function(x, na.rm = T) FALSE))
# [1] TRUE
logical_abbr2(quote(function(x, na.rm = T) FALSE))
# [1] TRUE

# They both work.  But what about performance?

microbenchmark::microbenchmark(
  logical_abbr(quote(function(x, na.rm = T) FALSE)),
  logical_abbr2(quote(function(x, na.rm = T) FALSE))
)

# Unit: microseconds
#                                                expr    min      lq     mean  median      uq     max neval
#   logical_abbr(quote(function(x, na.rm = T) FALSE)) 12.379 13.5765 21.80903 14.2645 20.2735 138.358   100
#  logical_abbr2(quote(function(x, na.rm = T) FALSE)) 25.724 27.1075 37.23254 27.8905 38.8840 105.458   100

# The loop performs better. And we can see why? The `return(TRUE)` allows the loop to return at the first
# sign of TRUE, rather than executing the entire loop, and this saves a lot of time.

# Also, the loop seems a lot more readible.

# So yay for for loops!
