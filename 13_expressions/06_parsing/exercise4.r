### Modify simple_source() so it returns the result of every expression, not just the last one.

simple_source <- function(file, envir = new.env()) {
  stopifnot(file.exists(file))
  stopifnot(is.environment(envir))

  lines <- readLines(file, warn = FALSE)
  exprs <- parse(text = lines)

  if (length(exprs) == 0L) return(invisible())

  invisible(lapply(exprs, function(expr) { eval(expr, envir) }))
}

simple_source("../05_pairlists/exercise3.r") -> o
# o contains both functions sourced from exercise3.r!  Horray!
