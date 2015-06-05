### Improve the base recurse_call() template to also work with lists of
### functions and expressions (e.g., as from parse(path_to_file)).

recurse_call <- function(x) {
  if (is.atomic(x)) {
    # Return a value
  } else if (is.name(x)) {
    # Return a value
  } else if (is.call(x)) {
    # Call recurse_call recursively
  } else if (is.pairlist(x)) {
    # Call recurse_call recursively
  } else if (is.list(x)) {
    # Call recurse_call recursively
  } else if (is.expression(x)) {
    # Call recurse_call recursively
  } else {
    # User supplied incorrect input
    stop("Don't know how to handle type ", typeof(x), 
      call. = FALSE)
  }
}
