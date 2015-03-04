### Implement a version of lapply() that supplies FUN with both the name and the value of each component.

lapply2 <- function(X, FUN, ...) {
    out <- vector("list", length(X))
    for (i in seq_along(X)) {
      out[[i]] <- FUN(c(names(X)[[i]] = X[[i]]), ...)
    }
    out
  }
}
