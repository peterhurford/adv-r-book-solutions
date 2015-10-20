### The implementation of as.data.frame() in the previous section has one big downside. What is it and how could you avoid it?

to_df <- function(x) {
  message(pryr::refs(x))
  class(x) <- "data.frame"
  message(pryr::refs(x))
  attr(x, "row.names") <- .set_row_names(length(x[[1]]))
  message(pryr::refs(x))
  x
}

# `to_df` makes a lot of additional references to `x`.

to_df <- function(x) {
  message(pryr::refs(x))
  class(x) <- "data.frame"
  message(pryr::refs(x))
  attr(x, "row.names") <- .set_row_names(length(x[[1]]))
  message(pryr::refs(x))
  x
}

#TODO: I don't know how to fix this???
