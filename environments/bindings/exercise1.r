### What does this function do? How does it differ from <<- and why might you prefer it?

rebind <- function(name, value, env = parent.frame()) {
  if (identical(env, emptyenv())) {
    stop("Can't find ", name, call. = FALSE)
  } else if (exists(name, envir = env, inherits = FALSE)) {
    assign(name, value, envir = env)
  } else {
    rebind(name, value, parent.env(env))
  }
}
rebind("a", 10)
#> Error: Can't find a
a <- 5
rebind("a", 10)
a
#> [1] 10


## Like `<<-`, `rebind` will iteratively search up the environment tree to find the nearest variable that matches `name` and then will assign it.  However, unlike `<<-`, `rebind` will not create a new variable if one isn't found.  This is useful if you want to be sure you are redefining a variable that already exists.
