### Write a function that extracts all calls to a function.

to_call <- function(expr) {
  Filter(is.call, as.list(expr))
}

library(magrittr)
get_calls <- function(expr) {
  lapply(expr, function(x) {
    if (length(to_call(x)) > 0) { get_calls(x) }
    else if (is.call(x) || is.name(x)) { x }
  }) %>% unlist %>% as.character %>% unique 
}


### Compare your function to pryr::fun_calls().

# While both `pryr::fun_calls` and `get_calls` are recursive,
# `get_calls` is loop-based.  This is potentially less efficient.
# Notably, `pryr::fun_calls` executes about 6x faster than `get_calls`.

# `get_calls` has the ability to extract calls from the formals of a function,
# whereas `pryr::fun_calls` cannot do that.

# `get_calls` can return an entire call (i.e., "get_calls(x)") whereas
# `pryr::fun_calls` can only return the call name.

# However, `get_calls` sometimes accidentally returns variable names,
# whereas `pryr::fun_calls` does not make this mistake.

# `pryr::fun_calls` is also more readable.
