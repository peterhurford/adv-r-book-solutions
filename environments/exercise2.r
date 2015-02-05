### Write your own version of get() using a function written in the style of where().

myGet <- function(x) {
  stopifnot(is.character(x), length(x) == 1)
  e <- globalenv()
  if (is.element(x,ls(e))) return(e[[`x`]])
  while (!identical(e,emptyenv())) {
    e <- parent.env(e)
    if (is.element(x,ls(e))) return(e[[`x`]])
  }
  warning(paste(x," not found"))
  NULL
}

recursiveGet <- function(name, env = parent.frame()) {
  stopifnot(is.character(name), length(name) == 1)
  if (identical(env, emptyenv())) {
    # base case
    warning(paste(name," not found"))
    NULL
  } else if (is.element(name,ls(env))) {
    # success case
    env[[`name`]]
  } else {
    # recursive case
    recursiveGet(name, env = parent.env(env))
  }
}

recursiveGet('mean')
