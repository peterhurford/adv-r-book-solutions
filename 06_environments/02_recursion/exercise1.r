### Modify where() to find all environments that contain a binding for name.
where2 <- function(name, env = parent.frame()) {
  if (identical(env, emptyenv())) {
    # Base case
    return()
  } else if (exists(name, envir = env, inherits = FALSE)) {
    # Success case
    str(env)
    where2(name, parent.env(env))
  } else {
    # Recursive case
    where2(name, parent.env(env))
  }
}
