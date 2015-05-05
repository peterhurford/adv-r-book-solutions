### Modify where() to find all environments that contain a binding for name.

where2 <- function(name, env = globalenv()) {
  if (!is.character(name)) { name <- deparse(substitute(name)) }
  if (identical(env, emptyenv())) { return(invisible(NULL)) }
  c(
    if (exists(name, envir = env, inherits = FALSE)) {
      environmentName(env)
    },
    where2(name, env = parent.env(env))
  )
}

where2(plot)
# [1] "package:graphics"

where2(where2)
# [1] "R_GlobalEnv"

x <- 10
where2(x)
# [1] "R_GlobalEnv"

median <- "Also in the global env"
where2("median")
# [1] "R_GlobalEnv"    "package:stats"
