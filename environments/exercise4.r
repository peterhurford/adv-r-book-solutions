### Write your own version of exists(inherits = FALSE) (Hint: use ls().) Write a recursive version that behaves like exists(inherits = TRUE).

myExists <- function(name, env = parent.frame(), inherits = FALSE) {
  stopifnot(is.character(name), length(name) == 1)
  if (!inherits) return(name %in% ls(env))

  if (identical(env, emptyenv())) {
    # base case
    FALSE
  } else if (name %in% ls(env)) {
    # success case
    TRUE
  } else {
    # recursive case
    myExists(name, env = parent.env(env), inherits = TRUE)
  }
}

# the function itself resides in the current environment
myExists('myExists')
# [1] TRUE

# mean is not in the current environment
myExists('mean')
# [1] FALSE

# but mean exists in the base environment
myExists('mean', env=baseenv())
# [1] TRUE
myExists('mean', inherits = TRUE)
# [1] TRUE
