### Implement a version of lapply() that supplies FUN with both the name and the value of each component.

lapply2 <- function(X, FUN, ...) {
    out <- vector("list", length(x))
    for (i in seq_along(x)) {
      out[[i]] <- f(x[[i]], ...)
    }
    out
  }
}

#TODO:
