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

